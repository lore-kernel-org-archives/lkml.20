Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0269D3D4114
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787899933; cv=none; b=cG9negfbcEI3J5qDqWoT2WeeKkgGC5ZpNLJfenTLWwh1JHjRxEEWw7HZ/IZZxpv6M+5Qh5DxWPLsJpM++4gh0qPE0q1TPrV7UUgiNS1F7Pu/N2LRtZXeY1HcGntfg/l6YEMGM810Z1KWEME3GOz+2GADXUrJmjivH7R90G9afFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787899933; c=relaxed/simple;
	bh=a48GFc8mNVcYZjOG84v2quWJJxmYtDC7MLBfyjNXi3w=;
	h=Message-ID:Date:Mime-Version:From:To:Cc:Subject:Content-Type; b=p1zB7QonN6KYiDO8geCK20X0G3sI+qNLrlPOv5QjsJtVwpBNZDiFdI+x2DBl1zeXHETBOBSy9AHNy230TN8wa8ZPhpNnuypa/N0gWvMTRlQksbUudsvXly55fVgTl1SPj3iPAMYe2EopJEKAiaWpyD5Z027dj0GaGK+ov0XEg8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hWTZn5LvVz8Xrrl;
	Fri, 28 Aug 2026 14:52:01 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl2.zte.com.cn with SMTP id 67S6poI5046492;
	Fri, 28 Aug 2026 14:51:50 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 28 Aug 2026 14:51:52 +0800 (CST)
X-Zmail-TransId: 2af96a91300891e-d259a
X-Mailer: Zmail v1.0
Message-ID: <20260828145152578tXQPUG9lxxgbJjmfpuaQz@zte.com.cn>
Date: Fri, 28 Aug 2026 14:51:52 +0800 (CST)
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
Subject: =?UTF-8?B?W1BBVENIXSByaXNjdjogbGliOiBGaXggWkJCIHN0cm5sZW4gd3JhcC1hcm91bmQgcmVncmVzc2lvbiBvbiBodWdlIGNvdW50cw==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 67S6poI5046492
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Fri, 28 Aug 2026 14:52:01 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A913011.002/4hWTZn5LvVz8Xrrl

From: Shao Mingyin <shao.mingyin@zte.com.cn>

commit 5d588c684833 ("riscv: lib: Fix ZBB strnlen reading past count
boundary") computes the aligned scan boundary from the last valid byte
(s + count - 1).  When count is huge (e.g. SIZE_MAX, which FORTIFY
strcat/strlcat pass when the destination size is not known at compile
time), s + count wraps around and the aligned boundary lands before s.
The pre-loop guard "bgeu t0, t4, 2f" then always exits for aligned
strings of 8 or more characters, and strnlen() returns 8 instead of
the real length.

This silently truncates strings built by fortified strcat: the dm
sysfs name attribute shows "live-bas" instead of "live-base", the
truncated name pollutes the udev database, and blivet/anaconda (as
well as LVM/dm-crypt/multipath userspace) break on RISC-V systems.

Detect the wrap-around and saturate the boundary to the top of the
address space, making the scan equivalent to strlen().  Normal counts
are unaffected.

Fixes: 5d588c684833 ("riscv: lib: Fix ZBB strnlen reading past count boundary")
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
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
