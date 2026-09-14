Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1068378813
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789368743; cv=none; b=LZY3nzpDEYuBdUHmmCc8oR9i7ODOJWwXAbtIS+m6VEEj01rBnCG8HWyb56cGlJb2Y/7/YPJzdoDHw/JdVd2mgevlpoIWCaObVoNUzJSnFixG2oVg+bAMu1mwZoHaiVt+DitPhaxWaT4dhWSKGzB9RTu2eaxC/LLrdnlF/PpQfJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789368743; c=relaxed/simple;
	bh=dj2TrtKYIfQdFFEdcFsbCNdBGKU0hjwrKyunOwWHsP0=;
	h=Message-ID:Date:Mime-Version:From:To:Cc:Subject:Content-Type; b=rLHksE4/3s/DWPQ/6m8SqJhM4+RJkAUmdpy0A5W0YECtwqibEhIQMelBf7lvMnZ3FIGpjqROi3z8IvwiviNm4MXVLrpuqHNsPFNl0Og/0upx5yEyoSBm+9qFMeC4Cp3+VbUIMO1lAvxY4ujYd+1LHoZX+uynHDwDMYgJtylAD0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hjwnH25FZz8XrrJ;
	Mon, 14 Sep 2026 14:52:19 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl2.zte.com.cn with SMTP id 68E6q3d9005879;
	Mon, 14 Sep 2026 14:52:04 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 14 Sep 2026 14:52:05 +0800 (CST)
X-Zmail-TransId: 2afa6aa7999509f-2d027
X-Mailer: Zmail v1.0
Message-ID: <20260914145205778-sZJbZc1D-XBfWRXO2f-o@zte.com.cn>
Date: Mon, 14 Sep 2026 14:52:05 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <pjw@kernel.org>, <mikey@neuling.org>
Cc: <jiangfeng@kylinos.cn>, <pjw@kernel.org>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <mikey@neuling.org>, <zhang.yue5@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIHYyXSByaXNjdjogbGliOiBGaXggWkJCIHN0cm5sZW4gd3JhcC1hcm91bmQgcmVncmVzc2lvbiBvbsKgaHVnZSBjb3VudHM=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 68E6q3d9005879
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Mon, 14 Sep 2026 14:52:19 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AA799A3.001/4hjwnH25FZz8XrrJ

From: Shao Mingyin <shao.mingyin@zte.com.cn>

The aligned scan boundary is derived from the last valid byte,
(s + count - 1).  When count is huge (e.g. SIZE_MAX, which FORTIFY
strcat/strlcat pass when the destination size is not known at compile
time), s + count wraps around and the boundary lands before s, so the
ZBB path returns a bogus length.  The original implementation
(5ba15d419fab) had the same wrap-around in its (s + count) & ~7
boundary computation; after 5d588c684833 the wrapped boundary is caught
by the pre-loop guard "bgeu t0, t4, 2f", which then always exits for
aligned strings of 8 or more characters and strnlen() returns 8
instead of the real length.

This silently truncates strings built by fortified strcat: the dm
sysfs name attribute shows "live-bas" instead of "live-base", the
truncated name pollutes the udev database, and blivet/anaconda (as
well as LVM/dm-crypt/multipath userspace) break on RISC-V systems.

Detect the wrap-around and saturate the boundary to the top of the
address space, making the scan equivalent to strlen().  Normal counts
are unaffected.

Fixes: 5ba15d419fab ("riscv: lib: add strnlen() implementation")
Cc: stable@vger.kernel.org
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
Acked-by: Michael Neuling <mikey@neuling.org>
---
Changes in v2:
- Point Fixes: at the original implementation (5ba15d419fab) and reword
  the commit message accordingly: the wrap-around exists since the
  original implementation, 5d588c684833 only changed how it surfaces
  (Michael Neuling).
- Add Acked-by from Michael Neuling.

v1: https://lore.kernel.org/all/20260828145152578tXQPUG9lxxgbJjmfpuaQz@zte.com.cn/

 arch/riscv/lib/strnlen.S | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/lib/strnlen.S b/arch/riscv/lib/strnlen.S
index a8911605c248..2451289ed0f9 100644
--- a/arch/riscv/lib/strnlen.S
+++ b/arch/riscv/lib/strnlen.S
@@ -87,9 +87,19 @@ strnlen_zbb:
 	 * Aligned boundary.  Use the address of the last valid byte
 	 * (s + count - 1) to avoid loading a word past the count
 	 * boundary in the loop below.  count == 0 is handled above.
+	 *
+	 * Saturate the boundary when s + count wraps around (very large
+	 * counts, e.g. SIZE_MAX passed by FORTIFY strcat/strlcat with a
+	 * destination whose size is unknown at compile time).  Without
+	 * this, the wrapped boundary lands before s and the pre-loop
+	 * guard below always exits, returning a truncated length.
+	 * Saturating makes the scan equivalent to strlen().
 	 */
 	add	t4, a0, a1
 	addi	t4, t4, -1
+	bgeu	t4, a0, 1f
+	li	t4, -1
+1:
 	andi	t4, t4, -SZREG

 	/* Get the first word.  */
-- 
2.27.0
