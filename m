Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3FA371D1D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374103; cv=none; b=W+SbKlp9DVJ0KB9DHdwI5EMZ3OxSTNb4tV0tmawmbi/trBoqZhYsAbCtEk6TXSMe4fHtmPloFLUcxtpNohB1RGuVHowBnoGANCMX3tnkPAUh1MdlLWDdl+BUcnRQmWWqXv/dHnx9qb84oLsl3Do/oUi8s5cSTQc/umsi2UW8Pk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374103; c=relaxed/simple;
	bh=4FpH8k3grOvU88n2kU6neA3o39/hf/xYJXr/8JrAAoY=;
	h=Message-ID:Date:Mime-Version:From:To:Cc:Subject:Content-Type; b=ZdVWA0xybY6Rkz9pHqwDqKwUezxYVBa1N4AWHhvkQ97yPBeM0cQhYrE8VuVIGPbWIfaudS50TJ7ZP3K4OHt0gfzep8jlGqMQcVK9WE0CoMMdt9iLvX3ibIR7eJLY4QWYRPL3jtrpOnX/gFySZBaKj7f8Rh6vuYeTrNlGDalrxXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hjymD2zYyz4yjjJ;
	Mon, 14 Sep 2026 16:21:32 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl1.zte.com.cn with SMTP id 68E8LKW7034385;
	Mon, 14 Sep 2026 16:21:21 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 14 Sep 2026 16:21:23 +0800 (CST)
X-Zmail-TransId: 2afa6aa7ae83156-d7034
X-Mailer: Zmail v1.0
Message-ID: <20260914162123230u1y1M4UHrO8E-cU-opJ_7@zte.com.cn>
Date: Mon, 14 Sep 2026 16:21:23 +0800 (CST)
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
        <mikey@neuling.org>, <zhang.yue5@zte.com.cn>,
        <david.laight.linux@gmail.com>
Subject: =?UTF-8?B?W1BBVENIIHYzXSByaXNjdjogbGliOiBGaXggWkJCIHN0cm5sZW4gd3JhcC1hcm91bmQgcmVncmVzc2lvbiBvbsKgaHVnZSBjb3VudHM=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 68E8LKW7034385
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Mon, 14 Sep 2026 16:21:32 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AA7AE8C.000/4hjymD2zYyz4yjjJ

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
address space, making the scan equivalent to strlen().  The saturation
is branchless (sltu/mask/or), so the normal path does not carry a taken
branch.  Normal counts are unaffected.

Fixes: 5ba15d419fab ("riscv: lib: add strnlen() implementation")
Cc: stable@vger.kernel.org
Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
Acked-by: Michael Neuling <mikey@neuling.org>
---
Changes in v3:
- Replace the taken branch in the saturation with a branchless
  sltu/mask/or sequence (David Laight).
- Update the Clobbers list for the additional t5 register.
- Michael's Acked-by is kept: the patch semantics are unchanged, only
  the saturation sequence is branchless now.

Changes in v2:
- Point Fixes: at the original implementation (5ba15d419fab) and reword
  the commit message accordingly: the wrap-around exists since the
  original implementation, 5d588c684833 only changed how it surfaces
  (Michael Neuling).
- Add Acked-by from Michael Neuling.

v2: https://lore.kernel.org/all/20260914145205778-sZJbZc1D-XBfWRXO2f-o@zte.com.cn/
v1: https://lore.kernel.org/all/20260828145152578tXQPUG9lxxgbJjmfpuaQz@zte.com.cn/

 arch/riscv/lib/strnlen.S | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/lib/strnlen.S b/arch/riscv/lib/strnlen.S
index a8911605c248..528ee7995969 100644
--- a/arch/riscv/lib/strnlen.S
+++ b/arch/riscv/lib/strnlen.S
@@ -67,7 +67,7 @@ strnlen_zbb:
 	 *   a1 - Max length of string
 	 *
 	 * Clobbers
-	 *   t0, t1, t2, t3, t4
+	 *   t0, t1, t2, t3, t4, t5
 	 */

 	/* If maxlen is 0, return 0. */
@@ -87,9 +87,22 @@ strnlen_zbb:
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
+	 *
+	 * Keep the saturation branchless so that the normal path does
+	 * not carry a taken branch that could be mispredicted.
 	 */
 	add	t4, a0, a1
 	addi	t4, t4, -1
+	sltu	t5, t4, a0	/* Did s + count wrap around? */
+	sub	t5, zero, t5	/* -1 if wrapped, 0 otherwise */
+	or	t4, t4, t5	/* Saturate to the top of the address space */
 	andi	t4, t4, -SZREG

 	/* Get the first word.  */
-- 
2.27.0
