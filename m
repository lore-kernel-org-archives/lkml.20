Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF3A4446E1
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789457238; cv=none; b=Xc7KIK4Z5jYSpzkCckQ7IfVFbDy5cCh+347PrqoPLuIvTgtjGxWrCP5in8D36wnUgj5jBt+q6i+gQgvpU5DPNg7qY5kAZH/NvGbHOKACPdZYHGQYLFZTNp006e4FPAYF6bvaUSvnMusxK+BaBUlfZ0yBG8OAmQf+tCJmm3sVXrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789457238; c=relaxed/simple;
	bh=ahrYY11mJTkQU0QzOygWS5gatI38eVNrce34N4PSn5E=;
	h=Message-ID:Date:Mime-Version:From:To:Cc:Subject:Content-Type; b=ZhNwoKolbzw2PWzi9HHVJG/+JvpggBx03L7nfdOmcYfaFTKvJGaHaKMR3GepYMTxMAXupscR4BJFfWbMtAKpFi7ov77hpfgZs7OW7HRmP0uhwr+/S7F09GfIYdqqX5ha7/O96n3F1feKPAvUK9cZdA4ORWU9qUUw7ReLxXhdgKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4hkYVw5BXdz4x69s;
	Tue, 15 Sep 2026 15:27:04 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl2.zte.com.cn with SMTP id 68F7Qsdi053927;
	Tue, 15 Sep 2026 15:26:54 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 15 Sep 2026 15:26:56 +0800 (CST)
X-Zmail-TransId: 2afb6aa8f34035a-cfb46
X-Mailer: Zmail v1.0
Message-ID: <20260915152656708z04s4oSYY2BGj34F36RZa@zte.com.cn>
Date: Tue, 15 Sep 2026 15:26:56 +0800 (CST)
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
        <david.laight.linux@gmail.com>, <qingfang.deng@linux.dev>
Subject: =?UTF-8?B?W1BBVENIIHY0XSByaXNjdjogbGliOiBGaXggWkJCIHN0cm5sZW4gd3JhcC1hcm91bmQgcmVncmVzc2lvbiBvbsKgaHVnZSBjb3VudHM=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 68F7Qsdi053927
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Tue, 15 Sep 2026 15:27:04 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AA8F348.000/4hkYVw5BXdz4x69s

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
clamps the increment to ~s, so it stays branchless and wrap-free:

	s + min(count - 1, ~s) == saturating_add(s, count - 1)

Normal counts are unaffected.

Fixes: 5ba15d419fab ("riscv: lib: add strnlen() implementation")
Cc: stable@vger.kernel.org
Suggested-by: David Laight <david.laight.linux@gmail.com>
Suggested-by: Qingfang Deng <qingfang.deng@linux.dev>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
Acked-by: Michael Neuling <mikey@neuling.org>
---
Changes in v4:
- Use Zbb minu to clamp the increment (addi/not/minu/add): one
  instruction less than the sltu/mask/or sequence and no extra
  register (Qingfang Deng).  Clobbers stays t0-t4.

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

v3: https://lore.kernel.org/all/20260914162123230u1y1M4UHrO8E-cU-opJ_7@zte.com.cn/
v2: https://lore.kernel.org/all/20260914145205778-sZJbZc1D-XBfWRXO2f-o@zte.com.cn/
v1: https://lore.kernel.org/all/20260828145152578tXQPUG9lxxgbJjmfpuaQz@zte.com.cn/

 arch/riscv/lib/strnlen.S | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/lib/strnlen.S b/arch/riscv/lib/strnlen.S
index a8911605c248..5b3bbf0a3098 100644
--- a/arch/riscv/lib/strnlen.S
+++ b/arch/riscv/lib/strnlen.S
@@ -87,9 +87,25 @@ strnlen_zbb:
 	 * Aligned boundary.  Use the address of the last valid byte
 	 * (s + count - 1) to avoid loading a word past the count
 	 * boundary in the loop below.  count == 0 is handled above.
+	 *
+	 * Saturate the boundary when s + count would wrap around (very
+	 * large counts, e.g. SIZE_MAX passed by FORTIFY strcat/strlcat
+	 * with a destination whose size is unknown at compile time).
+	 * Without this, the wrapped boundary lands before s and the
+	 * pre-loop guard below always exits, returning a truncated
+	 * length.
+	 *
+	 * Clamping the increment to ~s (== SIZE_MAX - s) keeps the
+	 * computation branchless and wrap-free:
+	 *
+	 *     s + min(count - 1, ~s) == saturating_add(s, count - 1)
+	 *
+	 * Saturating makes the scan equivalent to strlen().
 	 */
-	add	t4, a0, a1
-	addi	t4, t4, -1
+	addi	t4, a1, -1	/* count - 1 */
+	not	t1, a0		/* SIZE_MAX - s */
+	minu	t4, t4, t1	/* clamp, so s + t4 can never wrap */
+	add	t4, a0, t4	/* saturated s + count - 1 */
 	andi	t4, t4, -SZREG

 	/* Get the first word.  */
-- 
2.27.0
