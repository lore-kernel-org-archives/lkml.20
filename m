Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3094647ACDF
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789754535; cv=none; b=VvFHMcr3wBY6xpFxc0HzVme96bEMuClV+5qasOLxTy5/nwYSe2wVGtCeYm5BcF8AdAGITSJumyQOTWIEouKq6FHwPhPLyxqLgrXSB6rcYGRMq5m2VqnmN3QdIWKjCF//DMDjhv6WdkxFpT7GO5p3PeJRzTKPZczWo/dqRGSXeTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789754535; c=relaxed/simple;
	bh=2ywI+x99AL1vVsJgsYse4XwvQoMzKOlrEMnWJuVwfm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nP3sCQcXeIHs+s8eOgZiee5m6vsDU9jwLZGHZOxQ03DvtnCzX02y8YLZT5pxqT6QXFC7exm2dvuwIFe2PGfPfFr1O8oRY5hLIo82xPfmTS8XGf/9G26rBw6m/nZwxf12I50weQw7IyJGhdbrO7+ec8+BFWyt05ECXvBrw8oOP9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUKg6Iwt; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUKg6Iwt"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cebad4adso819927a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789754532; x=1790359332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p0aRkG/STOJZPyiXgGevwP+glg/s3VjB+O2AFDUKik0=;
        b=HUKg6Iwt7Fmv7nhI+bv25a+k4qi85ouKgXDnISeXtE+6Og4GAP2AXh8eHA2Ic60ZGt
         QtJy4qOFWLGidVISaIxKO1eaMYAwKsXnzaYnHLeAvGfgzyvcJv98kYlFbwC9Y80U5Jen
         oMNJutI/qa7D5Lzvcb98Q2kc4cM0ZFsXdqv7apuu/uGXb++gWI4VWOIzQhOxU29/q2Vl
         qLKraGVGEgCHGKBCG2PFe8kjq2L+Lm8fZmUOsmsvkTZdiym0H0YnLNvresFiDv8znbMg
         okEUWyor52lduVfzpd+01c1BHDVY7xgcm+zkFuUiIgB7mD6I7G6W8oGLjWNy6boyhjfe
         f7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789754532; x=1790359332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p0aRkG/STOJZPyiXgGevwP+glg/s3VjB+O2AFDUKik0=;
        b=BSJRHYHbYaXU2In4r/zdUCYhovzIVP2zJHuArGqJNqV+Wkwcx8bu/Je/Viy83KGl0t
         /2BoaZVsuYCg4Ttqd0PSXsjmQpHv0TeVbbjCHjDbs0GypgMGtN918q6agvW+6M9MwpZF
         pXHMMJAYKNG+bFUT5o6UXwXw4cmh8ERFPeSHWY4pRndPbGnVQBvLP3ctIAjmAKz3MZoB
         FMjngZKmle2zjQoL11MsgBDTAGpncJbxtJj7zgjknoAQAM2iBmchsD6olHB4a6yo4gPh
         YDifJIpdASf+J7eW0GtZoYGIZehd5V1OmaOLM+8QE6D809gDN7bkinfzJykP4rNyBmxW
         RMuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMzE382YEj0pl0c3dioNsnHrfp/Ckd4gz1WA4uxo6RZZPCbdZagDcz49p1FtJfRPuN/PH3QCMRLOC5h4k=@vger.kernel.org
X-Gm-Message-State: AFuF++kGrxH/oorhF8sxTqvFBbm2GhwATYt9+h5fqcV4Dswi3HBJt+jf
	9OxyWx1maG+dopWlwlnm9MuQ8Jb1aRKo90dyoPbWtGMcAVRwqRdBhZR8
X-Gm-Gg: AYBFou0Vw3SFSc5GeeKCH8hc6/u2SbDJG2C9Wv4yg0+eymoPdYn/yK8jJFgouUcSgms
	OQevEd2xoA2CswsV9qkuOW0a9IKYCMR9v1Q3LixnUv4ujk09tPc3i+w6IhLsjvE2j9hQZ/9Vg5y
	mVUlutaj2ckPeB4CMaZ/uHoA5NfXQjZhbejJn4ol8zlqUJmo4pJ2KhxHwtMh7drY6Ho8TiVeV3d
	+UatvKTulVCSfOmYyHAji1aOsaGcCz/cYsjP8LcxvZluySuDZlHnGbQJpo3AAfev7fXmOb7Vr+o
	nxA3dDpfaPu/WBOsBP+xfHxF2b1UTnC/tFVprK2wlya0aZp4nX476mMi/CJOP4WTbB9WD7Zdz72
	3HWmXFzC0dDeVxSfGEAuu8aBCDOdz6Im0rQJYYOPJ+8IPSqvlCTBYgRz1FQ+QdAZgApTskNQUSA
	hCjajgcsuDl4Gf34J9VzbTNw96Gw2zfaTIQXRDvkM5iNKPbook/DC6MQ==
X-Received: by 2002:a17:90b:280a:b0:39e:2530:2102 with SMTP id 98e67ed59e1d1-39e54f4221amr13366348a91.11.1789754532323;
        Fri, 18 Sep 2026 11:02:12 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e554e5529sm2016932a91.4.2026.09.18.11.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:02:10 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	James Bottomley <James.Bottomley@SteelEye.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] scsi: zorro7xx: put SCSI host on remove
Date: Sat, 19 Sep 2026 02:02:01 +0800
Message-ID: <20260918180201.3624568-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

zorro7xx_init_one() obtains a SCSI host through NCR_700_detect(). The
probe failure path drops the host reference with scsi_host_put(), but
the normal remove path does not perform the corresponding cleanup.

As a result, the SCSI host reference remains allocated after the
device is removed.

Call scsi_host_put() after all users of the SCSI host have been torn
down to release the reference acquired during probe.

This issue was found by manual code inspection.

Fixes: 45804fbb00ee ("[SCSI] 53c700: Amiga Zorro NCR53c710 SCSI")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/scsi/zorro7xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/scsi/zorro7xx.c b/drivers/scsi/zorro7xx.c
index 21c769dc1ecb..a8b0c2d4a9cb 100644
--- a/drivers/scsi/zorro7xx.c
+++ b/drivers/scsi/zorro7xx.c
@@ -164,6 +164,7 @@ static void zorro7xx_remove_one(struct zorro_dev *z)
 	kfree(hostdata);
 	free_irq(host->irq, host);
 	zorro_release_device(z);
+	scsi_host_put(host);
 }
 
 static struct zorro_driver zorro7xx_driver = {
-- 
2.43.0

