Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C883A9DB2
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 09:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791020317; cv=none; b=f17U0MdRy9fX7O5NK3O+GDEXGOt2ZQxpOAvwOgRUYVaibadoU+LM7AwrUt9o/4dKTVafjFb6Lbhy/nv+0lqDGBCNJQ7GaSUWi1kQHAilo705DRin+CSIulH1/V5Vap33oQU2/M30XLXIXefqeUJahLh6WzHx+Eo2Kalk1MBnPTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791020317; c=relaxed/simple;
	bh=HgwWgfAn32S0WUYg+phTBo9McyRRLx+6LXyBgReCFog=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HDiNlvSbEXaUkFRNq7+GZtUGmYnNt4n2UJ/ByxNllNK/10eCLMvCOzpHYsKa88Dzvd4VHbTehFC7vYAt3nmnFitIm4jk1lsC1r8gdf8s7b7EUO7QBNtISHLkOx7fmu2V4PYYu/c00y8TZ6WsvAs7pxT3ku8ySzuEMsVHkz9wCcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBHwIdN/; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBHwIdN/"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a09e2d0f7dso3239345e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 02:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791020314; x=1791625114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KvxVLxua6Tw50aLhIwUcC7cdFZF352a+MrKefzPbwHs=;
        b=jBHwIdN//G847k8hhe+xrGNCXG/8G1wpxmr3PSZDkmWIdBvGmRo9RzrXW+Q02nX5e0
         RNm4vx5ab57SxHCbrWdOz0GVD38ZYiCliHovOFa2aAi0zp63ex9dzCnJYKVtTMc4a7CV
         XExwoZRSgujmMhXGHK6FlMlX+IRHAZMOLAb0EFIqFURd5LHzFHU3yEiqpTnxvJ7l4SvO
         oHLsx1K+3aqH6Ub3aPidndbtXJLBN967v2IAvRzOj9dn5AioSyNztkCki+xSdXgmRItc
         iSObjqYQsJKVUsPoAkecGZJFFeQdjn/PSr/PfHj7GZoZ3TKujILEy6WYYLWe7KfqN0sg
         lmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791020314; x=1791625114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KvxVLxua6Tw50aLhIwUcC7cdFZF352a+MrKefzPbwHs=;
        b=uIGxpUdw9t2nPerpxrNPGnMuxrwJBZRl9IKyKKS4jW16hAaMRmy+gN2x7lv/d1db8V
         1+JQtNJDpzpRxlciFStiGA96+s2dUKBmimk0ATvlR1KKP5MEeuikAKtSIalzmQzmQmh/
         MNGpojYiotcCK+PxGQV6MQJtJpUvnrWwqOYc8AHruPlU6qsbJpI4Uzplsggyjb7FAZNF
         DoY0jVPo96Vl8i3+gaw2Z/o9WmFntRCF8SxuGnn/7dZUI7Q9jszi4DklhVWS+kgBrPpE
         7u+8ZPLsk0cRIDWoE9igRcgBfuh9F5CFwHSdYI2Kb1BSVhd7WBwmo5Z2QN3Ze27s4I/w
         gDDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxk9UI8tCTOxNPYty51Ds+4ms0qsfec96BhumtDLsXODxbu46mFbff9cJB11hRTAUGoUhy+gsaHvLuQGjg=@vger.kernel.org
X-Gm-Message-State: AFuF++m1LHFxyc5n2ssiBvcxT/FrRKTTduOp/YOwzu1EC5a4swubGDmk
	CKXma/XA24DdM8HKw3LmzDL60lJI8pMHm9GMyzLbzl6G0Bo6sUxc+Qk4
X-Gm-Gg: AYBFou11A01UCBhfQXXY9V+7kh8NyCcQEgUKph2uFsluR4TNgJ9k3K5Nkj11QDGChYd
	qLsAloe1hYLGYTNXbrijcgh69Gi5QYW3RpNLAjJDOemdNPXCpowkqaewegt+90Uvm90D2LG8AA+
	f947DY9ZQzWPak96WCnNM7xfoDr8SJtLta8jD6BNBUNw4Azzz1S+C/buudqBKhLy6rWVV0XzZRJ
	BswLVqg6gHkys/GB2kl5CNKUCFgwFvtczSD4kTs+TqmHn6F1Mh8MeiXleZbGqZYdmejTXl9286J
	dgXDZmTMPNQ4iIk4KUlPxFbSZq9yFKk1Lh+jvgDBjMxO99OqbE9warEXacoT6YyJZPWmmZb2oCe
	RdW41zBPa+bqqz1GnSzV7rj0QWgYFYkjyYUKb4WixHu3DuYxFZym+0cRunH+xDbXG9wavcqBvDj
	5pO94lLQsQoYJoVnLbkcMKOYVY3NMdcaY/Ddhfy5/jhXyhyXkzaKlfcA/mQmlCd6Jl7qP0UVq21
	B4GdkmWEUTnDfZc7wWv5mYbtPtKMcBFPhblo8+ScKdb3jy6dEgxc4E+EGc44ogqL458a04dw+5P
	9cvvflX5wQLZ2a1jTk5wJG/lxFBLSJtiC7/mmO4u0sw1QXTYgsuTJsOT+SNq5qr3eZhWag9QEeO
	Qm0/rMYY=
X-Received: by 2002:a05:600c:4505:b0:4a1:62b8:9e8c with SMTP id 5b1f17b1804b1-4a162b8ae34mr55253055e9.33.1791020313486;
        Sat, 03 Oct 2026 02:38:33 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2e2-2001-c47f-5a89-3d9a-cd2d.310.pool.telefonica.de. [2a02:3100:b2e2:2001:c47f:5a89:3d9a:cd2d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02770e8f2sm136528375e9.6.2026.10.03.02.38.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 03 Oct 2026 02:38:33 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linusw@kernel.org>,
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	Bradley Morgan <brads@mainlining.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ARM: rust: Enable Rust support for ARMv5TE
Date: Sat,  3 Oct 2026 11:38:25 +0200
Message-Id: <20261003093827.77857-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rust is currently limited to ARMv7 on 32-bit ARM. This series extends
it to ARMv5TE.

Linus Walleij asked for older ARM cores during review of the ARMv7
support [1]. Christian Schrefl tried ARMv5 with the armv5te-none-eabi
target at the time [2]. He hit missing core atomics, missing
__aeabi_mem* symbols and a floating-point helper reached from
pr_info!() formatting. None of these show up anymore. The kernel crate
now implements atomics through the C helpers, and the
armv5te-unknown-linux-gnueabi target used here keeps the Linux EABI.

The only remaining problem was a link error. Pre-ARMv6 __arch_xchg()
has no 2-byte case, which the Rust Atomic<i16> helpers need. Patch 1
adds it the way the other pre-ARMv6 atomics work, with interrupts
disabled. Patch 2 enables Rust for ARMv5TE.

Bradley Morgan's two-byte cmpxchg() emulation series [3] does not
overlap with this. Its ARMv6 part was dropped in v2 and it never
covered xchg() or pre-ARMv6.

Tested on v7.3-rc1 with clang 22.1.8, rustc 1.99.0 and bindgen 0.73.2.

- QEMU versatilepb (ARM926EJ-S). The Rust samples, all Rust KUnit
  suites and 355 doctests pass.
- Microchip SAM9X75 Curiosity board (ARM926EJ-S), at91_dt_defconfig
  without the ARMv4T AT91RM9200. The samples, all Rust KUnit suites and
  356 doctests pass. The Rust sample modules (rust_minimal, rust_print,
  rust_misc_device, rust_driver_faux) load and unload cleanly.
- Build test with every Rust driver, abstraction and sample that can be
  selected on ARMv5TE (rnull, binder, the two PHY drivers, cpufreq-dt,
  the DRM panic QR code). PWM_TH1520 is the exception. It uses a native
  u64 division, which does not link on 32-bit ARM.

As a further test I ported the Atmel PWM driver to Rust and ran it next
to the C driver on the SAM9X75 board. The port is not part of this
series. The comparison found a prescaler bug in the C driver for
periods of 2^32 clock cycles or more [4].

I plan to get a Raspberry Pi 1 Model B+ and then add ARMv6K support as
a separate patch.

The ARMv7 enablement went in through Russell's patch system as
"ARM: 9441/1". Unless someone prefers another route I would submit
this series there after review.

[1] https://lore.kernel.org/rust-for-linux/CACRpkdYF0sVB2-qgy=GzETSR3+2sagVQPGdunDQDJrn8KqJorA@mail.gmail.com/
[2] https://lore.kernel.org/rust-for-linux/b13d37bd-ec68-4713-94e5-e9ed4d6a6354@gmail.com/
[3] https://lore.kernel.org/lkml/20260922173354.14404-1-brads@mainlining.org/
[4] https://lore.kernel.org/linux-pwm/20261003083036.21584-1-kmehltretter@gmail.com/

Karl Mehltretter (2):
  ARM: cmpxchg: support 2-byte xchg() on pre-ARMv6 CPUs
  ARM: rust: Enable Rust support for ARMv5TE

 Documentation/rust/arch-support.rst |  2 +-
 arch/arm/Kconfig                    |  2 +-
 arch/arm/Makefile                   |  4 ++++
 arch/arm/include/asm/cmpxchg.h      | 14 +++++++++++---
 4 files changed, 17 insertions(+), 5 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.39.5 (Apple Git-154)

