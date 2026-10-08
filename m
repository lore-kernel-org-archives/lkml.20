Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A468D3BBA09
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 05:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791437899; cv=none; b=gX5xLf54QLY5qf+f143OUfvAFu/Rs914Tn8kCFn1gH8TugwQWUvqaKvdz69Bew51vWBiKZXFVnLxAvLpnZEeI+uSXL9wLaLbTaOgwdEcMx9LFtwyFB+mEUa4Mz1a39sN6wbC3dioJ0nf6JqnQxFTKUywhgrywgIR5UxtQGmVk78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791437899; c=relaxed/simple;
	bh=kSOdu2D/uPkkscs5ntFbdrqzzlXt7Gw83S0FPlHcMNY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o8cAxaSqlZdnNs8Owh4Qt5qCg2aBCw3BvhQn+arYhJiF9e3AGvYC7WieoWMUVsQarth8v1gFWj/tJUjOz4zCTbkLVd+mlJ2tJONtuVqutgqoVqLeITpxK7neVsCFfRKyqQYf5w2RKyXDsgLbn5ci5lYh1SCHU14Filr1d0y2I0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/3lQRkg; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/3lQRkg"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso24535375e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 22:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791437887; x=1792042687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MtBoeOQA/ziEGpOBjK5f/vKkxIKhAQnTnwERrUlvuXc=;
        b=N/3lQRkgJlVGqQsrJNFpPj0dIZDnfqdtkgboXg3z0nfPvDxcFgqZ3r0x+/+8JH6Ymf
         I4pcOHr8AbLRI2Y4yXhTmR7QMXg3biaRd+kqupSlQul+KBtS+Tn988KyUnVm3EFMV5qD
         ohWs1n+rCXBMSYvXWaRzm/H+6lRngk3lW//2qh8Aq20Uviq9pHwm5iZE7wmk9Rtuog/T
         atOy7ePUOo30gGJql4U23v7B3BAJtzww00K3RXbm+nflbSbY95Ruf7RhtrV45nR5lXBB
         VdQB/yN4hvAoRWVg7ttRxEsa7Fj+F0HNOMboXs6FcUjmrogAd8SknKYK6QBRug60Q0eF
         uHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791437887; x=1792042687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MtBoeOQA/ziEGpOBjK5f/vKkxIKhAQnTnwERrUlvuXc=;
        b=TRFMMfvcybAN2VQa1H6HalZeySIOLUwHsZVhuPCV9NLPHwinDJxx/+bf+DxM4XEYVE
         zQih1WXBhJY9tR0MBpKPVYjlWtEe3Unjz/GSNgWrdkAUWadnMVVwTaSF/apSi8048kOo
         q4VX3kjObkC7xRBfOgC8NaMIIl0TlWL9cv/WFV5wmaCUnilvlQRjVf4c2I/L4ubHUoVJ
         +S+w41AVLqIKE/lXUzTIg/AyPF1fwfeEQLmE5Q+way9psU0p7CJRycHpki234Bsw7lr0
         +fmk1FG0ASvwBJgovkWhXtxnsWQFsTvr7AlBscA33mUNgVm730sBaKK1FIFF+mz57rjx
         NBYA==
X-Forwarded-Encrypted: i=1; AKwUvBye5/ritYBfIh92D0j01h97cXUJYH8kmMxc4zqxbgdZEcDcjxGowqx2unATmOcJs0eIbPtuCB81MyMGwtU=@vger.kernel.org
X-Gm-Message-State: AFuF++kDdvviE6vrbB3fci6pLvsKKh3+tykvaBMXDy1ncIh2VId7NCxv
	86ilqIr4TWbhQhv4sY14CE9SVQZOuQcVrRe/jze4JKu6MjtoMVIAI3TT
X-Gm-Gg: AYBFou1KZnG6Ljdv9bepNiFT6WxqwnEG0bqUEGdHfM/zaLXh/AQjifwFQRBSQet387v
	0WDlEowBnD3kg7bqKgFGHAxCe3u6QqHi6IO4oVpmrpdlGW2Ynb2ubrPUbNyFrPpPu/pXzL6Uhau
	hoqxihtWwOqnT4Kl6JG7DFxK2pMxOkz0fqhNuQlPIPtDx543MkaLA0F6lSjiBrU3Gqok+66O3ND
	0QgRPBQqCqxRZtJCDp+R7Mh+YO+w3O/TDSV6ic2/VaJG/qK+RICRmqmTGYXD1LdltpYTJCC8cFq
	h2/TtaqtYNeTVYfszYX3Q0i6WYr2NaPqeAFVumWv6ofCnOcRBTWnXvD1ecPv4aILURRqm+NF+Bu
	dr6ukf62VK8LIn3IPNXvMNUu6L10eUzOL9aoLdS+FVmXKKkOhVy1fI0ioeOEzeu9tsxIbQBoEZe
	T+ta/3Fg+lW5WaoCBfmgl+O/OkoWoHtbiEP5BX4yALhCM0u5FK5UHfFqPHWmaFjYEofUpJqTG6g
	FcKxDnGJcWrbUthdQRmBBUOw0xer4XvQ+d0JD5+3U/lTD/Bv7FLAiYUr8j9DrQrhjtvkA3Q/RnM
	PCHbsBr+cMg/lkH8qV1HjOB28l0iD5b9bBfoFgqmTm+DhLY9ha+qvvxQsbNsEcP2eomNF0L45Wm
	z9/ZcdPM=
X-Received: by 2002:a05:600c:8b6e:b0:4a1:714d:eed with SMTP id 5b1f17b1804b1-4a180649453mr74925515e9.14.1791437886819;
        Wed, 07 Oct 2026 22:38:06 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad61-5a01-743c-891f-b33c-cae7.310.pool.telefonica.de. [2a02:3100:ad61:5a01:743c:891f:b33c:cae7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1f8fbsm8458219f8f.33.2026.10.07.22.38.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Oct 2026 22:38:06 -0700 (PDT)
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
Subject: [PATCH v2 6/6] ARM: rust: Build Rust code for ARMv7 on ARMv7 kernels
Date: Thu,  8 Oct 2026 07:37:46 +0200
Message-Id: <20261008053746.49631-7-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261008053746.49631-1-kmehltretter@gmail.com>
References: <20261008053746.49631-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The arm-unknown-linux-gnueabi target builds ARMv6 code. An ARMv7 kernel
gets that as well, because no CPU flags are passed to rustc. Its Rust
code cannot use movw/movt or any other ARMv7 instruction.

Use rustc's armv7-unknown-linux-gnueabi target when the kernel is built
with -march=armv7-a. It is ARMv7-A with the soft-float EABI and NEON
disabled. Unlike the generic target, it does not set +strict-align.
This allows unaligned word and halfword accesses, matching C code on
MMU-enabled ARMv7 kernels. A kernel that also contains an ARMv6K CPU
is built with -march=armv6k and keeps the generic target.

This builds the Rust code for the same architecture level as the C
code. In the tested Raspberry Pi 400 configuration, Rust text grows
by 1.9 %. Six small benchmarks range from 10 % shorter to 5 % longer
runtimes.

The generic target would turn a full memory barrier from
core::sync::atomic into the deprecated CP15 operation. The armv7 target
emits dmb. No kernel Rust code uses these atomics today, so this is not
a fix.

Tested on a Raspberry Pi 400 (Cortex-A72, LPAE) with clang 22.1.8 and
in QEMU virt (Cortex-A15) with the minimum tool versions. Rust modules
load with the movw/movt relocations.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index a72843890241..28eb8484ff82 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -73,9 +73,11 @@ arch-$(CONFIG_CPU_32v4T)	:=-march=armv4t
 arch-$(CONFIG_CPU_32v4)		:=-march=armv4
 arch-$(CONFIG_CPU_32v3)		:=-march=armv3m
 
-# The rustc target fixes the instruction set. -Ctarget-cpu cannot remove
-# the +v6 of the generic target, so older CPUs need their own target.
+# The rustc target fixes the instruction set, so pick it like -march above.
+# The generic target builds ARMv6 code. -Ctarget-cpu cannot remove its +v6.
 rust-target-y				:=arm-unknown-linux-gnueabi
+rust-target-$(CONFIG_CPU_32v7)		:=armv7-unknown-linux-gnueabi
+rust-target-$(CONFIG_CPU_32v6)		:=arm-unknown-linux-gnueabi
 rust-target-$(CONFIG_CPU_32v5)		:=armv5te-unknown-linux-gnueabi
 rust-target-$(CONFIG_CPU_32v4T)	:=armv4t-unknown-linux-gnueabi
 
-- 
2.39.5 (Apple Git-154)

