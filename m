Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6FE4E323C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792165712; cv=none; b=EvoDuNJldcFRMqvth1nVkuiJWLfCC6ufeBqwKdCm9u/A3SLy1jvz59SD9uDcbNLk1meXdBhLdAUYI2fqrY1QGdKgUbkr7FxLcY+Tx/KMcfhLHsBjBKpa3tDlwS0l1yHp/3VQobXBqZirstzSuA7UUARV9fjPuKi49aHEKYNBHiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792165712; c=relaxed/simple;
	bh=V1jRKmCQFL7EqhgtKwrUFCiu8eMFT9qwVk/G17OwXZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fv/Rg3GeWid38T/Tz/A++EHBKbiHGivIbnL6Sex/kWw3WYF5V7Zec4J8PCu/bdI0sVSa+wt/IzuUQ5/iWqWrRftpIOcGl6DtaGF/f4cG+pU0BmJ49X4NSpULfKI5aKiIDlstHyUNHmEmWtkxiWYy9BxJFNEg4HZ/34fmiXtbjbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FTAQnOHg; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FTAQnOHg"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b0d63f60bcso442417b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792165708; x=1792770508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Ear117DJjn2hMVG10i+yEJqY+WZsqWtPeHsEomSMN0=;
        b=FTAQnOHg8eLnJByhEyrjDiEcwDlm6nNvNCL8gdewgO9cIiTOEYRb8us2E28u1EiDWm
         tKBXafitMx/dHnXFPB262I+sZZo+YaxkwUaaHCDlUYjALYrujT5QDdqLMXsbcvxNzGMp
         5Tp4VbZGrhAv6DS7PlCMCEKobopHQvpJnAFB1+yNt19KNGWdeWhJlHGDIdzr44rI6f5U
         Xi02du8UQDyh/sAy3x6b9xgX+ucwJRyz4bphcdkc+pBkFD6or7uB++IYhn/s1ez8YXxd
         ahfABQsFv4ZrhsauGzvCynP8KfrGKkRxJS+JivmlDevSDfN8rIRSJqhWKFCl/fR6ctFb
         /PBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792165708; x=1792770508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Ear117DJjn2hMVG10i+yEJqY+WZsqWtPeHsEomSMN0=;
        b=oR3Rn/RYCNNKNAxNk9dICTKGrgSDIPP3bfsTYKtKd0RuXWWOJvtiGljo7YSnptl/WM
         F6QmPV54wVq4pW3TGGhrzs9f2yuXy/jk1FCJns8AoWrVOVeKqXBoKNo0lJmalulpUiUS
         7nKbijjF3ueXifR+nmITwuaa++od3/4M235tFoc/UjbU1z82lCzwHlGDzod9BAZD6y+V
         /pSfDbv9N9p7o6IyclWFwNl7z2svkG1cMGpYBAlPXps8/DdtriTCniR9iJOnBkfrP+Ir
         etcC0UEEnoJvAR1YywSZoIuGuPF57i+ETmPcbhy4bf9cYH6BucS1Y1QlHWaq5Xdu7eWC
         c62A==
X-Forwarded-Encrypted: i=1; AKwUvBzhjemnQRYE9k+eZARDPqBrCXQ0n/E8Ol2SrXW5bI7iXCFVUTRI/ckYpdObBKLB71RB9xOZdel/mzARsS8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsI3nYbxYhJ8Gq0hPzNuOh9b01VBWh/p6bP7XZ4eZKUz/cSNV2
	hx4ZsyUqTzAS07IBUoXU+TmHOxJd8PSjpUxiiMbWY9J4wRKMDx+GiU/V
X-Gm-Gg: AYBFou1jmKtRJZfAT46A4RRGF+fjafpyeHENmR+8e3cZS9d18h0ZbKTo5mGuL4hkbLZ
	szFmFgEBWrcBzJt+mSPPDBh6Ar1UoN8nMUAnBkwPFAnALfCmbpZT6KrmS0+89qxWVFzjnaFJJBr
	7VLIg2e5IGt5O46IPPV9XBQcQmryh85a79LZ2AXPirAprXO1+g3WmWMRB0TDv+/KJhUIzpY4t1i
	b1oxuKihTmSwVhjVQ2mlw9oaDYBTEIrtAYgwW1KzZIfXhy+dueZCeyX9czdd8q5AP8B8EB9kcv5
	K+vSHY2miprTL4Bxheo+CLrcaqvB9rA4CXeYDCvCq8lzNTpscbbqukWcs5x+BlKgrOMzRQUkiDF
	JTd4ENKne0bdZ5V+qwaKgdN5cU1nIDLVMhF0tkwfyq5hzBl1swI9or/H4WGTh1OVQinBbIEITdm
	M4dhdw43Eku5hmImtzSqrKpUPsl/OUih829Z+xsGrahIsyoJ07BuduaFZ6a7Buq8zu16euySjrK
	GB8TOrT+EY6u7JztpIFMxog2QDlOnW625e9UQ4=
X-Received: by 2002:a05:690c:581:b0:8b0:ab62:c636 with SMTP id 00721157ae682-8b0f21e9dc9mr1812167b3.45.1792165708302;
        Fri, 16 Oct 2026 08:48:28 -0700 (PDT)
Received: from localhost.localdomain ([180.243.241.21])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e593c65bsm10882167b3.38.2026.10.16.08.48.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Oct 2026 08:48:27 -0700 (PDT)
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Igor Korotin <igor.korotin@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Mark Brown <broonie@kernel.org>,
	Brandon StJohn <branstj@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v6 0/4] iio: position: add Rust driver for ams AS5600
Date: Fri, 16 Oct 2026 22:48:15 +0700
Message-ID: <20261016154819.17936-1-muchamadcoirulanwar@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a Rust driver for the ams AS5600 12-bit magnetic rotary position
sensor.

The series adds generic fallible I/O support, SMBus access, a minimal
read-only Rust IIO abstraction, and the AS5600 driver. The driver exposes
raw angle and scale through IIO sysfs.

Reviews of the lifetime, concurrency, and teardown contracts in the Rust
I2C and IIO abstractions would be especially helpful. Danilo and Igor, if
you have time, I would appreciate your help reviewing those parts.

The Region-based view models byte-addressed registers and is not a
general model for command-indexed 16-bit registers. The standalone
word-read helpers accept any SMBus command byte.

The current interface is intentionally limited while a Rust regmap
abstraction is unavailable. Feedback on whether this is an appropriate
interim approach, or whether the work should wait for regmap, would be
appreciated.

This series is based on commit 3fadfb9362cf
("rust: firmware: avoid UB in example by passing parameter"), which
contains Gary Guo's io_projection-v6 infrastructure. It also depends on
rust-next commit b93fb6e76ec1
("rust: error: add remaining error codes") for ENODATA; that commit is
not included in this series.

Previous version:

  https://lore.kernel.org/linux-iio/20260822062725.60519-1-muchamadcoirulanwar@gmail.com/

Changes since RFC v5:

- Split FallibleIoCapable and the generic fallible try_* routing into a
  prerequisite patch.
- Require CONFIG_I2C=y because kernel::i2c is currently exported only
  when I2C is built in.
- Keep a bound parent borrow in the unregistered IIO builder and transfer
  registration ownership to parent devres.
- Derive the bound I2C client from the parent during read_raw instead of
  storing an ARef<I2cClient<Bound>> in the driver.
- Make IioDriver unsafe and document the validity requirements for raw
  channel specifications and the unsupported channel features.
- Reject operating modes other than INDIO_DIRECT_MODE.
- Use the external error-code dependency for ENODATA instead of adding
  the error code in this series.
- Clarify the writable-storage contract for read_raw output pointers.
- Replace the stale datasheet URL with the stable document identifier.

---

Testing:

Built for ARM with Rust enabled, I2C built in, and AS5600 built as a
module. Tested on a BeagleBone Black with an AS5600 on i2c-2 at 0x36,
running kernel 7.2.0-rc1-as5600-debug+.

Raw angle and scale reads passed with the magnet detected. With the
magnet-detected bit clear, 10 consecutive reads returned ENODATA. I2C
transport errors were propagated during a physical bus disconnect, and
reads recovered after reconnection.

Concurrency testing used 10 parallel readers and repeated reads during
20 bind/unbind cycles. Lifecycle testing covered 50 bind/unbind cycles,
50 module load/unload cycles, module removal during active reads, module
removal with an open sysfs file descriptor, and module removal while the
I2C bus was in an error state.

KFENCE, UBSAN, lockdep, and kmemleak reported no issues. KASAN was not
enabled because 32-bit ARM currently selects HAVE_RUST only when KASAN
is disabled.

Muchamad Coirul Anwar (4):
  rust: io: add FallibleIoCapable
  i2c: rust: implement SMBus access via IoBackend
  rust: add minimal IIO subsystem abstractions
  iio: position: add Rust driver for ams AS5600

 drivers/iio/position/Kconfig    |  11 +
 drivers/iio/position/Makefile   |   1 +
 drivers/iio/position/as5600.rs  | 177 ++++++++++++
 include/linux/iio/iio.h         |   6 +-
 rust/bindings/bindings_helper.h |   2 +
 rust/kernel/bits.rs             |  29 ++
 rust/kernel/i2c.rs              | 248 +++++++++++++++++
 rust/kernel/iio.rs              | 480 ++++++++++++++++++++++++++++++++
 rust/kernel/io.rs               |  66 +++--
 rust/kernel/lib.rs              |   2 +
 10 files changed, 1000 insertions(+), 22 deletions(-)
 create mode 100644 drivers/iio/position/as5600.rs
 create mode 100644 rust/kernel/iio.rs

-- 
2.50.0
