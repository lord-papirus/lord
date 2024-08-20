---@class Entity: ObjectRef
Entity = {}

--TODO:
--* `remove()`: remove object
--* The object is removed after returning from Lua. However the `ObjectRef`
--itself instantly becomes unusable with all further method calls having
--no effect and returning `nil`.
function Entity:set_velocity(vel) end
--* `vel` is a vector, e.g. `{x=0.0, y=2.3, z=1.0}`
--* `set_acceleration(acc)`
--* `acc` is a vector
--* `get_acceleration()`: returns the acceleration, a vector
--* `set_rotation(rot)`
--* `rot` is a vector (radians). X is pitch (elevation), Y is yaw (heading)
--and Z is roll (bank).
--* Does not reset rotation incurred through `automatic_rotate`.
--Remove & readd your objects to force a certain rotation.
--* `get_rotation()`: returns the rotation, a vector (radians)
--* `set_yaw(yaw)`: sets the yaw in radians (heading).
--* `get_yaw()`: returns number in radians
--* `set_texture_mod(mod)`
--* Set a texture modifier to the base texture, for sprites and meshes.
--* When calling `set_texture_mod` again, the previous one is discarded.
--* `mod` the texture modifier. See [Texture modifiers].
--* `get_texture_mod()` returns current texture modifier
--* `set_sprite(start_frame, num_frames, framelength, select_x_by_camera)`
--* Specifies and starts a sprite animation
--* Animations iterate along the frame `y` position.
--* `start_frame`: {x=column number, y=row number}, the coordinate of the
--first frame, default: `{x=0, y=0}`
--* `num_frames`: Total frames in the texture, default: `1`
--* `framelength`: Time per animated frame in seconds, default: `0.2`
--* `select_x_by_camera`: Only for visual = `sprite`. Changes the frame `x`
--position according to the view direction. default: `false`.
--* First column:  subject facing the camera
--* Second column: subject looking to the left
--* Third column:  subject backing the camera
--* Fourth column: subject looking to the right
--* Fifth column:  subject viewed from above
--* Sixth column:  subject viewed from below
--* `get_entity_name()` (**Deprecated**: Will be removed in a future version, use the field `self.name` instead)


--- Returns the object's associated luaentity table, if there is one
--- Otherwise returns nil (e.g. for players)
--- @return LuaEntity|nil
function Entity:get_luaentity() end
