Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA9F51A15F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789752055; cv=none; b=OfJBw9062qX7lMxbQGTEYU5K5qWAZIS6jD6DmYW2Y3I5+u7ueUt+YBSZyzT8cmrL6LHDKu8z1a8pQwxd2qO3SMeUb5jtDkEhiWjTF4cdbZgGcstESqIkPIPmDoTMAnNKZBpSuq8csx0nVCO5aRVyPMkax0zlsXBTwhsMTVY0kDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789752055; c=relaxed/simple;
	bh=ycTNuNghg1L9HOhDg4vLC91GWhxqeUus56xpeIdOnok=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U69rKHqMt84PK+dzZB95Amfs6aYQg9tb8/ogP4XkSo+5QlgJwijGRRB7w/9AX/LxgTVgEUuX+6FGZ+bjmL0TRgHz69dGbng8uwChSZbgJWJFi6aTDgmQtXeYt6UP83VVlMd8KkvMuPsz62o132pYLgdRgLgXX7946lwRW/YB1nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=in8+y42w; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="in8+y42w"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d93ff61046so9910195ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789752050; x=1790356850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LGeB3qqSMA8aQqCowwE6YHw3Cnq2V7NyQcOr+BMSCUA=;
        b=in8+y42wn7r01a2hjC2vylH+FqkMzv1fhdNaTj7Y/GZGeKJ4aLa8+BkvBqopazpBP1
         uMhLAdMAwuBkKqTHXTWqcSkP3ueT/8z23RSoFO/o6PvDbFJwpEm9LAh1cXcbJpVc3hfR
         U1zQRuZ0dpjWW3swvO+q46XDPLvq5r8i5uLs5EqQJi3ei7dxVpQHe0N5k0hv27qr3yRM
         Jq2uxIBp/zNvzhI9icRXjpdzfQnQ09iMKMB3tgIyrMA5GQAPqJuNa8IGySxx7qfgeg0K
         tHQWe/OA7Xbo6EkKHD4v6uWNA97uyj4vChps1qKMms109yZSOc5uhWDN21/Y10Y04qVR
         bJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789752050; x=1790356850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LGeB3qqSMA8aQqCowwE6YHw3Cnq2V7NyQcOr+BMSCUA=;
        b=Uh4uVe7IcVmK4bUnlFRgS6ewQv4rB1pUt0ucpUFFQt3e4kDpjSf43fXpbNcK4m2zcw
         VBy8RHxVqBZWDtdgxpsiRpDn9H70NWMTErfv03KUbMkKjaUYrRMbq+/CUBLls9AdMHeq
         tjS7rRI2vnL2J9lYmSAboyXGgTjwWz+0otbT9M9+j8niWDn8C6J+rq/m1XFQAvEVIPt8
         eTbVJFVxGH6Wmc3VZaOUVUZ4WqFRUzzLHYOfraGs7vDDe5cd13J1IW6OP/kcC8oZAcoE
         3zVOtciPjRn4a4a7qogr6hSHb0Y9JkwTZ1iH8Nh9hTBgkPIsixTTQ6jOGT2USo/3WX8f
         3O1Q==
X-Forwarded-Encrypted: i=1; AKwUvBy3JRGQWfvfYGgzW2CbMhgaTQVm8BROKsFWQiQPWigp/ln5UaTFnGFfc2UzLOxoEjyJOsWpYjWkrVBiUKg=@vger.kernel.org
X-Gm-Message-State: AFuF++n9L99C7Qx21ZWnesgQwJ1532CwHa7VgSXIwqWVPTACdoQSmMmj
	T9F4QLxaAsbEZ48FO+D8uuWz9XK5B35D1Dra4njyEP0VU+/YDf6S1vrZ
X-Gm-Gg: AYBFou13Ph5P5SkUaP9g0coxhUSF4DE4o25dSsyZJ1nSE9yt0Z7VTp1ysGGESQj6r3l
	MHdoqcG9BiZbEBsjb8dyGL6tPEtNHE96+NXH6O2hn24baG6eFIpFafu35u4mtduS9na4LOrDRse
	NoQrp23j/4jRZNAkuMPiBc99nERf7ctldxz+XDKuXbVjRwmQrlXLhcm9hv4wKYkEYR7Bsz0mj7c
	TDAltcKA6VVy95+f2iloXFtLVq7zd9Fdz5nZXIGK48URdBKdZjTP1w90e0AQAXLoaaqgMH/5Jrx
	H743M97MKwVU871R169y4qqZFoq47SsBjMZpVxZQyc4n7cDDr75xqn++C8a9K3xWBmvmBlGDJdL
	jYXXDqBssjvPzuMMRZ98UOZ24widYJyj2JBToSJ5vfcsa8bBIcY0GyuXU7fne5S0Ya6d2EXlnig
	ZoMgp8H6+GK+kP+lPXen2B2JwxZCPhPGvqisPXBKAXJ5oUWumOvcCVww==
X-Received: by 2002:a17:902:f78d:b0:2dd:c054:1980 with SMTP id d9443c01a7336-2ddc0541d21mr9604945ad.37.1789752049765;
        Fri, 18 Sep 2026 10:20:49 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc18031c5sm26255ad.77.2026.09.18.10.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:20:49 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	James Bottomley <James.Bottomley@SteelEye.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] scsi: mvme16x: put SCSI host on remove
Date: Sat, 19 Sep 2026 01:20:38 +0800
Message-ID: <20260918172038.3594309-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mvme16x_probe() obtains a SCSI host through NCR_700_detect(). The
probe failure path drops the host reference with scsi_host_put(), but
the normal remove path does not perform the corresponding cleanup.

As a result, the SCSI host reference remains allocated after the
driver is removed.

Call scsi_host_put() after all users of the SCSI host have been torn
down to release the reference acquired during probe.

This issue was found by manual code inspection.

Fixes: 506c7bbcd9bc ("[SCSI] 53c700: m68k MVME16x NCR53C710 SCSI")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/scsi/mvme16x_scsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/scsi/mvme16x_scsi.c b/drivers/scsi/mvme16x_scsi.c
index f4db93c13986..8191b1e273eb 100644
--- a/drivers/scsi/mvme16x_scsi.c
+++ b/drivers/scsi/mvme16x_scsi.c
@@ -120,6 +120,7 @@ static void mvme16x_device_remove(struct platform_device *dev)
 	NCR_700_release(host);
 	kfree(hostdata);
 	free_irq(host->irq, host);
+	scsi_host_put(host);
 }
 
 static struct platform_driver mvme16x_scsi_driver = {
-- 
2.43.0

