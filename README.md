# Bevy Starter

This skeleton template is a pre-configured environment for developing games using [Bevy](https://bevyengine.org/), a data-driven game engine built in Rust. This project includes all the recommended optimizations shown in the [Official Bevy Docs](https://bevyengine.org/learn/book/introduction/) and [Bevy Cheatbook](https://bevy-cheatbook.github.io/setup.html).


# Building for release

When you finally release your game, you'll want to:

 - remove the `dynamic_linking` feature from bevy.
 - update your ``./.cargo/config.toml`` and uncomment the `lto = "thin"` line. This will enable Link Time Optimization. This will allow optimizations across crates, which can result in a smaller binary size and faster runtime. However, it will significantly increase your compile times.
