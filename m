Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFE8481241
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 18:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789237058; cv=none; b=XaMMuiYWmcv3ZUM0ISL4UsrlMh5YQmzRdLQ2Tab4AfoSiSyiXsP69x1yMabrz81EUlFTrpaes4kXlrh+Ckoatam0V7lYldF1kUCZn+eWFgmQWDjExypXZxwVDLdbSsQublzDr3MGvZCu+7ZrSgWEDvdgExPOw4js7or0lUfX7qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789237058; c=relaxed/simple;
	bh=gB3IJPb41ILYd1ANxuKa+w2aDpu+3BOtrBUYsA0T0dY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=W+j9v1rI0HtxEBo4LChks6wm9K+2MixRW19SWcGcvXC/ZYaOSABwG0pyHpBJl1vbIlrBfOrD5/G9wB0/nd94f9t/TjNsttpVJubhqbx5WeJ0EfRBCsK31ssLv2AyKSBH8VOnE2EC05CI7XtHP0irF3tWrzHei9fzDmTusMKGG2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O7ChxN+A; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O7ChxN+A"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67116faea3aso2107574d50.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 11:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789237056; x=1789841856; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gMFdBSy0/cG28Pemkxb5ONj7tl7XaonyzdcIq1lfkGw=;
        b=O7ChxN+Aqn+oKbHRMPhM0TC+LvgLuu3osBPiiU0ymblWtsmlDFl+uof2pcMj6rn7QE
         dH2swrbfIzoKFjIGyXbXSOtYG+5UAsLM5ntX2GVA9EQDiUEyMwlUjQBn0D2ZM64X+7WO
         WtkrWgvCALr8l1fzwMhaDVChFRpg32fKOvPHb6YdOvSVe7TWcSmetan8kbHX0Fr0fHNR
         cT/oG/SUUNJU1aiTauc/s5KajI93YymqcZiUzSx7pr5xzmL7nw3SXSzdsu4NpYLfeMwW
         QRDyrkx4yBisGJplaxibBQoEI1exge04YSpBHOUlWPMQkE2fKCifOmW7lE4giXWqgBKJ
         O/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789237056; x=1789841856;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gMFdBSy0/cG28Pemkxb5ONj7tl7XaonyzdcIq1lfkGw=;
        b=TznkOfpJ/Y6pThCo6g57PniPilCHd4GhgKwMkVpIzD4lT5cFndo2O78+ObCgGOyvMR
         ej3WVd8wp9fXrZM8imLbJE7ALuBXERBz8ZdS5R20wLn5BegcAgg9VJ8kRsEsy3H16UKs
         2PAK59nBXiByE4mLnxY+PNjwNhpNFknQ5PqszzF8AJmp2kQ3j1+/J8jo1xaQe7yU5FoS
         L7UJ31GF/aqne1+OZATbDCzM1Qe5vjiep6hzSdQ4iIMeaDt4OWfRJQroajYfL1KyMwbI
         upJTUnvnKtlCe48HTXXAnkjU+I4/utySDxer3l0JMIhMg/7f5wFK9UXheBFGuqy2uWLP
         QCJA==
X-Gm-Message-State: AFuF++mNqa8UYCWLzScVI/dfYFHreSWnCsfoTBtbC1JjA++5rxea7ILr
	Z/mUC3LbAWV8hJnJBRJ+ogGCp+vDyjtRj8YWCcOf6cF3PGfB3KbNfsRA
X-Gm-Gg: AYBFou29k6O7jMwx6LxEConKXFqa73lyOaFYG5hfpNF03yVMEaZC5+Y8blnDp5MeDcC
	Ma0oGia0qLvCZkomj01fUJQh6uQWoqkigETiFZ53gJRRUw8SmtRDQx4hpY2t+Np/4+MPmoni4Gw
	RkXoquH69GH2ylBsQl+M7WUcwRumsqjR3hwS+N1RhSJUG1UgFjXBJn5FBkCM8jD3NI7PaLAtC/h
	9pPvwZb2XBudm369fTuyzHNzKvYRPdlsvDURglpcIdUfiW3gi4fUxrgbGXIeijTpWTWhs7CRNgH
	UpzGp4X9EFjQ7Sv+54DNmMnybfQwFV3aRBwNb/6tKrVHOfZQPcW59i2cM0ldb6YGS5Gc+9bO1JD
	+TNo34N1C6rxthOibMgYemHGVHyUsDyZWaw6xQC15/UGP5O34v9SHEscdSlBb1sjB4rq/gTpo4W
	KIpJLOv2BXWVquXtClbInEXKBzdpE7gD1VyHkPyKPki6SolXEgieimFLCulfU9CxuzsSAC/Ic=
X-Received: by 2002:a05:690c:60c7:b0:877:6e47:19ab with SMTP id 00721157ae682-884b08b7101mr33301167b3.30.1789237056468;
        Sat, 12 Sep 2026 11:17:36 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-88487ea993asm22097277b3.33.2026.09.12.11.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 11:17:35 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 12 Sep 2026 14:17:35 -0400
Subject: [PATCH] lib/decompress_bunzip2: fix off-by-one in run-length
 bounds check
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-b4-bunzip2-blocksize-fix-v1-1-c7384bbfc954@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAMAwEvyI5G6i1KPoV8dDaqEGp0qKI4t8N7
 mlnYPeBRJEpQZs9EOnkxFsQKPIMhtmGiZC9MGilK9UUGp1Bd4Sbd6nrNiyJb8KRL6xLSV1Z540
 Cme+RRP/XXf++H2DreYJqAAAA
X-Change-ID: 20260912-b4-bunzip2-blocksize-fix-7333376abd40
To: Andrew Morton <akpm@linux-foundation.org>, 
 "H. Peter Anvin" <hpa@zytor.com>, Alain Knaff <alain@knaff.lu>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1718; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=gB3IJPb41ILYd1ANxuKa+w2aDpu+3BOtrBUYsA0T0dY=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKWTrcTNypftINnzhSV+elxt37cYfXP39McvpKR4+aaD
 Qc+KL2L7/jIwiDGxTBTTJElbr0iy6y2HUt9Tkv/gpnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DIEMHaN4iJweg0ZmcXFpapFuWkGRQ15+SWJJZn5esV5+QWpeQXqBXlpmWklGRn5RcSrQCL281BJ
 TV0c3I0MDE0tHCzMnC0dTE2dnJ0MnN0dHZ1cnI0tzEwNnS0cTV0tzBi5OAZhrYooYGS6f7rTInm
 zMdtVG70fLHZ7VnSdLq6daKq8XlHd75Xv6zAeG/+4f/Xn/5AmUXpvXn2UQwLylV3XvAcsC/3NTw
 6d2Hk5ZwwUA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The run-length path rejects a block when dbufCount+t equals dbufSize,
but the loop that follows writes exactly t bytes starting at dbufCount,
so a block that fills the buffer exactly is legal. bzip2 allows it too:
its decompressor bounds a block at 100000 * blockSize100k and checks
that limit per byte appended. Use > instead of >=.

bzip2's encoder stops filling a block 19 bytes early, so nothing it
produces ever reaches the limit and the bug stays hidden. Compressors
that use the full block size do reach it: an lbzip2 -9 image whose block
ends on a run fails to decode, and a self-extracting kernel built that
way does not boot.

This code came from busybox, which fixed the same line in 2013 in commit
932e233a491b ("bunzip2: fix off-by-one check").

Fixes: bc22c17e12c1 ("bzip2/lzma: library support for gzip, bzip2 and lzma decompression")
Cc: stable@vger.kernel.org
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
lib/decompress_bunzip2: fix off-by-one in run-length bounds check
---
 lib/decompress_bunzip2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/decompress_bunzip2.c b/lib/decompress_bunzip2.c
index 1288f146661f..aaa75404250e 100644
--- a/lib/decompress_bunzip2.c
+++ b/lib/decompress_bunzip2.c
@@ -439,7 +439,7 @@ static int INIT get_next_block(struct bunzip_data *bd)
 		   array.) */
 		if (runPos) {
 			runPos = 0;
-			if (dbufCount+t >= dbufSize)
+			if (dbufCount+t > dbufSize)
 				return RETVAL_DATA_ERROR;
 
 			uc = symToByte[mtfSymbol[0]];

---
base-commit: 893e11787f78e43b534e252249ac3fff4d1333f8
change-id: 20260912-b4-bunzip2-blocksize-fix-7333376abd40

Best regards,
-- 
Matt Turner <mattst88@gmail.com>

