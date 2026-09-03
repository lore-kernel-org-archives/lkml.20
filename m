Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1582C35C6A9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788412546; cv=none; b=trONalbYS3NTJj9Z/zOC2/YSIHsr9Ls6yEM6uuTA+S6y5zRTO1q/zFoH/eDb64YTtZ1QamLFRWVuVqpkAOk2cTsKGQcqXIHwgzzSGXuKYAvKEGoysgxI9KdyutRcvzEWWCknQn9xc+28NjjXS4uWHSSiYREnHCxmodsOWhKhG4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788412546; c=relaxed/simple;
	bh=nKO31I1s0TJLtIWgXUa4rTrWm+mWmIEQXRMtGFJj+cA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gds35omphTW0NaXP1bm71QGV/XImowITkPzUzCmM5cFNpVyHngT08y+YT1gotIhSHJ/vO8BrtOeHzeJJ12OO1K6pQ1JIOvxIzyNXCfKdchzEUK0euig8Iag0fo4vAeGUufU2gi71aDirA667KafpbzQnimIV0/GQTUPMjKsNg4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=BwCz7QeN; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="BwCz7QeN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1788412532;
	bh=wf5TaaIMIB/SwKLvnwIV8e9BVISGMUEUbFOLVnqu/o4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=BwCz7QeNFMfDSVrmr7OxrkLN6vWxx6tIw5FoCzqXhEegEVToKpd0r4xGNjzdJw3Ti
	 uk29EQql/HtfWb9hWlCg8vp+fCtc/ZZPBAxDljsLyvyLXHybdLnXUbEoNqixUjdPRp
	 NSV+Q6PH+2/u7ocDaTTp+lRp16/hN3ZpGmjQ3NCw=
X-QQ-mid: zesmtpsz8t1788412518tbc6776ef
X-QQ-Originating-IP: yzwzyqHGzHCBpwN0oFnS0x12g1ZiDr5NbtENwvO4FBk=
Received: from uniontech.com ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 03 Sep 2026 13:15:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 8573619831851565764
EX-QQ-RecipientCnt: 4
From: Yichong Chen <chenyichong@uniontech.com>
To: nico@fluxnic.net
Cc: viro@zeniv.linux.org.uk,
	linux-kernel@vger.kernel.org,
	Yichong Chen <chenyichong@uniontech.com>
Subject: [PATCH] cramfs: fix direct uncompressed full-page reads
Date: Thu,  3 Sep 2026 13:15:14 +0800
Message-Id: <20260903051514.2689191-1-chenyichong@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N2dBx7sFmBYA6OPyCXm+v/xJftoJMJY4wFfO8g0SnU7aV8rUMOB04hxW
	A6q9cdNx0FABxRvG6p0aWK18/ojtgglBzVvcUIw380TXFyQ4QRgbipKy2IV5bCGeAleEyiE
	O9ncJo9dAsh1culW5EeY+EZpPipmxXYCytHc5WpPVtX5KrwW5r4E5gQLH+MNtdhkddUyXjD
	qWBzmdYALpZKMauKQP5UGTg1gM8zQIbwJsfAkmkOVEEWTS5xmlLSWpRaFir03jaN2zFYZbK
	ENiR9eGf/CcZuxEFsfcu3beu47D85FNPiXp3XYLGKDp3a0j5tt/PuMfXZ7ovuufJXuk9/Py
	nw7k1TmtNLunKSLHobv/my9kYuVfBE9iIy4CsEHeb1/jH8EYUxPtdPdulihKtdAY8NlH4od
	QkuCEUMHpnVNZx066CmoXFygheDOoE5Dg8L9XB6TdWaZu0xJs1yq40CCAUUN1KX/vP+Qu1O
	ZHTqJfp/ktHBf24ACsiAvHQl5i7cUDkjaicEW+IXxKKqcQ7nrqeNU0ro7ArVWFmTEDKMV25
	gexd/aDG25VdGkzA7vLcsSjtt38ecJ5YDzQZxb2dhW8b3/2e4B7lhI8qOu4mDCZ2TgzcRq2
	/M1wH5vL1C4ZK+FNZTd81uyymM/2CDMdrrWw3ORVU39w+fLDIq4Vv+8pKQFwgoaV/BhgYeR
	yJsSHn0NKQy8hJni95K2MazNwZoYTHJYBV7AOOoJyf6cw856EGYXW8IAr4JVsvc/isit//D
	uT9NzScSq0JzlTQ84gOxEbvdWD8zHXu+5zIwecMVZ4RbW8/0AeXbA+VeVnAsOKSyidOwtfv
	lHXCqf6UIS3qwPUIfm3D/7yBRZySvMwOEy+q5SLIEPw3L9TO0/U2Bm8X6E9LRr3kD0ZoBn5
	QSYKr3IbUSwBf862S5eeIs0e5bW6dDCoz2Z9FHczq2rVWzPuHMcxliuov5w0FpQQdFwov6r
	Lr3tnMOOFC2uG9VZG/AG64We4pFESsa6mepNifp1ffD0fj95jWXFEqCMPAsil81LIEayQbL
	00OXXhjiodTK5gZkjI
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

For direct uncompressed cramfs blocks, the block size is PAGE_SIZE except
for the last block, where it is capped by the file size.

When the file size is exactly page-aligned, offset_in_page(i_size)
returns 0. The current last-block handling then turns the final full page
into a zero-length block, so cramfs_read_folio() treats it as a hole and
returns zero-filled data instead of the stored page.

Keep PAGE_SIZE for a page-aligned final block, and only shorten the block
when the last page is partial.

Fixes: fd4f6f2a78ae ("cramfs: implement uncompressed and arbitrary data block positioning")
Signed-off-by: Yichong Chen <chenyichong@uniontech.com>
---
 fs/cramfs/inode.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
index d4cd03f4f60d..371b4c421d86 100644
--- a/fs/cramfs/inode.c
+++ b/fs/cramfs/inode.c
@@ -853,9 +853,9 @@ static int cramfs_read_folio(struct file *file, struct folio *folio)
 			if (uncompressed) {
 				block_len = PAGE_SIZE;
 				/* if last block: cap to file length */
-				if (folio->index == maxblock - 1)
-					block_len =
-						offset_in_page(inode->i_size);
+				if (folio->index == maxblock - 1 &&
+				    offset_in_page(inode->i_size))
+					block_len = offset_in_page(inode->i_size);
 			} else {
 				block_len = *(u16 *)
 					cramfs_read(sb, block_start, 2);
-- 
2.51.0
