Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239872;
	b=gxOlgNAGVe2tLzVoTYtG1/6LIXNoyH533m2jD1TpBXA3V6xWRMw7xv4AkyilA9b8VCAP
	 B2JZtRH3+fzRwQho3TJ6r6AFiaGFZlgs1sZpEp4rsI6ey38CxUnhFHQhIl7Vj0rSjgp6M
	 ByBP5Dg4JCVmwP2Kdv1WW4BzeFg+RfB8VfYkdXHElOGt25VALUoh0HfB7Z+oHIoYE12bK
	 3iRLPNbsQwers16xHkSK2Eqqs9Ns4RnNWuFoWOwF2E29Q+qXq4aqm3FrYZfcdZRba0QQD
	 wRGCnZx7Ow8Ob6qf/fEGwJMiAOhWmuVXTJbTfqBoLdS77luZeiTDivfunQ0Ab5/vA0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KQFKpRV7NATJKFVseA51zGW96GPsJPPL3A6Ir3znGCk=;
	b=41934xH/YFdecf1LuMjWPJCL+x25sYZXcq4WwpnVSPfKbOUKvYzjEZ8KRZqOJQZdThFI
	 l8gW0Mi0PtqTwbC8/5dWluq2jbNGzYoZ9tfNyYtGbUvNSUnysmD2e6aBFUmEA+22P6lTM
	 DyCeqhJDwgRenf2502wKC4vbwHuGtavmLoELEJSgg/XyYPU9TO2idNKpFDc10os4KM6PH
	 e3pD1CMmXX2omVtKiZzZ2V+PgxJl3IoA4Q1kxe7maDCD9Vk+LiimtUhM27SFnwfXU9q6S
	 fK+yJ8ow0gKbaiK+en7Q0rGe4v/0I8Ae9yAAYIZQanliVgeGCEsmdDCMudk+kVJSNUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hLXCDde0;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589F9606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:57:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 589F9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hLXCDde0
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a2761c69fbso872589c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794239870; x=1794844670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KQFKpRV7NATJKFVseA51zGW96GPsJPPL3A6Ir3znGCk=;
        b=hLXCDde04W5diwbe0GkjBt0uSOoYyhvOqcmGMnNaj7NHl8xd8mikVinjwWXV5VGYDf
         AwY5T+giJ6h0sL3kz0BJcUmrPNgAGEvBEEK9+1Asx13b+O2UEonf7hU/l5SAciNMQT3N
         NYhX6qkHr4zLhUfZy1I19FS+NoRlCkIfkPG3FEgEZx3Wp81xyYYYBuMolTUW+4dhZYbR
         c2/CcY3Pcnx2vJ0tC4uYkDCdmXLy3CxFD/H+7BdHUxwvBmUwihpCZmvYgCKNAm5Lb2tz
         T5GXBDlDSqPkTtPMHZT3ivSrS2qVs3W4VXdaihX5uvLvXeK5o4N/UA8lCEMozXWIaVfq
         nXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239870; x=1794844670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KQFKpRV7NATJKFVseA51zGW96GPsJPPL3A6Ir3znGCk=;
        b=at56Z5rEuA0WLKtyhy8S3khi9Vj4xCDYBIDrg76U9+QbKc4VA5l1WoCrp6FfQxeiEP
         jrmA/ZR8SAgod/AfhfjfiuXyifHKdJ8bRxOkcBhCbhEGj3w6L8mfbRZW6wARSTmyYqlS
         8jwcMrggsK/0sGYQehhX7Y9falqUORmB0uer5arTkTFjJXyg0C/83rwIElm566VtS87O
         NyrZ74GoPM0npxWzaBdiUzs8CgUqHr4dsX8zCxmuSe+rxSR9Qcv/ldxjV+2mKX7xM6Lk
         6SJOK211hu8DDFcGtHmDTWrGKvGVTa3kvw+a5lsgg+eyAe/YZcI1zNxcKsm9cKOzf4vX
         EyFg==
X-Forwarded-Encrypted: i=1; AL+hErHltSxApOFD7UjxvFtCCmVbpgHAGu2F/d8ZsYm2A3fJH5FaOIWhmIEi+Rrr7MnP9LFFae3zbnbRighBuyA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dzzAdE9PfV67De7ZqJA4X74xTKi+BiAxlD9/NIaiSjgPC7r88
	D7cVHaF1wlujGorS7mwJ1y6C0ZNS1OGLxhI5bwLDWP3o2/NcqHYiBfEw
X-Gm-Gg: AYBFou35LiJPYS58LFs31DXqX5B5UNK8g/Of3xsizetixR9jm2Cq8+RBjE/ha9f5C00
	CkFOlGCBXqzuR1dLcohwa/9DVR4qcuqz1Vry7OAqVfRCV3T3Extw6Bt6dzjwLL49AcZiM+JqPco
	7leaEDwEWa5rGfhOSYnZsiVwHYr6TLHfrR5zMOFP8Y8xZNxDRyQY0pzxUV6NDMjedIJK7/jxMBk
	QVbvXLHdD5zrwdytiP9XkEZd3MWxUTepnSChGm5iOVVCRO46vyWbZNqG9W6R9L2nt0/eFSC+0U7
	0dHBgq67Web3lS8qvtcjzE2ywMdPI03DfCEb6SBtDKcxEDcSam+78lrLRNuIq92Fa/l8HbFVG2Z
	GBHXNr0FjWefUw72/+ypnA5Dq7jbXqYIy+sGL+3E3+sBltw28Uf8LpPmx4/v14oeW+hXRN7mIr6
	NcpQ4fl4mAJNXip1E773ACe4CtTEuekKmgIuSq9l+kD92xeYi9KwBNmdKKzoZ2p7chgqSc+wk1Q
	zdMlCIZI2Xybiwxr6jn1S9cO+3i927OUrUqpvmACOjf2QEAPM9cO4WBPYfhWCFgEWMDEFLQYwJD
	JQajbwQwVh6I8bQByuxmlD0vsq2q7zhEnM+7bWTUat8MwmSHQAtx3QUyOpjtoUjnAmdfv1g=
X-Received: by 2002:a05:701a:c919:b0:166:af48:a2ba with SMTP id a92af1059eb24-1b39fdaf74fmr6537059c88.0.1794239870114;
        Mon, 09 Nov 2026 07:57:50 -0800 (PST)
Received: from localhost.localdomain ([125.166.179.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm13020828c88.13.2026.11.09.07.57.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 07:57:49 -0800 (PST)
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Igor Korotin <igor.korotin@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Mark Brown <broonie@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Shuai Liu <847807867@qq.com>,
	linux-iio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v7 0/4] iio: position: add Rust driver for ams AS5600
Date: Mon,  9 Nov 2026 22:57:39 +0700
Message-ID: <20261109155743.83740-1-muchamadcoirulanwar@gmail.com>
X-Mailer: git-send-email 2.50.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a Rust driver for the ams AS5600 12-bit magnetic rotary
position sensor. It also adds fallible I/O, SMBus access, and the IIO
abstractions needed by the driver. The driver exposes raw angle and scale
through IIO sysfs.

Feedback on the I2C and IIO lifetimes, locking, and device teardown would
be appreciated.

The Region-based view models byte-addressed registers and is not a
general model for command-indexed 16-bit registers. The standalone
word-read helpers accept any SMBus command byte.

The current interface is intentionally limited while a Rust regmap
abstraction is unavailable. Feedback on whether this is an appropriate
interim approach, or whether the work should wait for regmap, would be
appreciated.

Based on Linux v7.3.

Thanks to Igor Korotin for the device ownership and bound-client lifetime
rework used in patches 3 and 4:
https://lore.kernel.org/all/179286358623.55649.5397316745104390556@linux.dev/

Thanks to Shuai Liu for reviewing v6. This version addresses the Clippy
warnings, replaces the ignored SMBus doctest, and moves repeated unsafe
SMBus calls into safe helpers:
https://lore.kernel.org/all/tencent_173B7731E90B9624F9F82613DC3031B70907@qq.com/

---

Previous versions:

  v6: https://lore.kernel.org/linux-iio/20261004130303.65432-1-muchamadcoirulanwar@gmail.com/

Changes since RFC v6:

- Rebase on top of Linux 7.3.0.
- Make register() return Device<T, Registered>, stored in the driver
  data, so the IIO device is unregistered before its private data is freed.
- Remove the bound parent parameter from IioDriver::read_raw(); the driver
  now stores its bound I2C client reference directly.
- Drop the parent lifetime parameter from UnregisteredDevice.
- Use pin_init::raw_try_init() in Device::build_device().
- Document sign conventions for IioVal::IntPlusMicro and
  IioVal::IntPlusNano.
- Add IIO=y and I2C=y dependencies to CONFIG_AS5600.
- Use typed pointer casts and lossless integer conversion to fix Clippy
  diagnostics reported by Shuai Liu.
- Replace the ignored AS5600 doctest with a generic no_run example.
- Move raw SMBus FFI calls and errno conversion into safe bound-client
  methods, as suggested by Shuai Liu.

Testing:

Clippy and debug builds completed for ARM with Rust enabled, I2C built
in, and AS5600 built as a module.

Runtime testing was performed on a BeagleBone Black with an AS5600 on
i2c-2 at 0x36. Raw angle and scale reads worked with the magnet detected,
and reads returned ENODATA when the magnet-detected bit was clear.

I2C errors were propagated when the bus was disconnected, and reads
recovered after reconnection. Concurrent reads were tested with 10
readers, including during 20 unbind/rebind cycles.

Lifecycle testing covered 50 unbind/rebind cycles, 50 module load/unload
cycles, module removal during active reads, module removal with an open
sysfs file descriptor, and module removal while the I2C bus was in an
error state.

KFENCE, UBSAN, lockdep, and kmemleak reported no issues. KASAN was not
enabled because 32-bit ARM selects HAVE_RUST only when KASAN is disabled.

Muchamad Coirul Anwar (4):
  rust: io: add FallibleIoCapable
  i2c: rust: implement SMBus access via IoBackend
  rust: add minimal IIO subsystem abstractions
  iio: position: add Rust driver for ams AS5600

 drivers/iio/position/Kconfig    |  11 +
 drivers/iio/position/Makefile   |   1 +
 drivers/iio/position/as5600.rs  | 186 +++++++++++++
 include/linux/iio/iio.h         |   6 +-
 rust/bindings/bindings_helper.h |   2 +
 rust/kernel/bits.rs             |  29 ++
 rust/kernel/i2c.rs              | 235 ++++++++++++++++
 rust/kernel/iio.rs              | 463 ++++++++++++++++++++++++++++++++
 rust/kernel/io.rs               |  62 +++--
 rust/kernel/lib.rs              |   2 +
 10 files changed, 978 insertions(+), 19 deletions(-)
 create mode 100644 drivers/iio/position/as5600.rs
 create mode 100644 rust/kernel/iio.rs

