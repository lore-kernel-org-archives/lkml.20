Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D1D489FCB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 22:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788991696; cv=none; b=OPmrAK0uvSYzCDJ18GaMRAvxy1T4BRrp+AJSUx5YVGRfFDAi9M+GdutRBX8fkrjbzSrdnO4JLXt8DlWR76cj5NWUgTKxf69VUVEn5hh8xkIX/eX1PwQSZQolGtTjiceZCVw6D2rhXbOjLGbMMoJYyYw9XfzEphlbHpzkhqlIhCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788991696; c=relaxed/simple;
	bh=oX1NfBQzeNTxwy+1fSOgKyKEYwKoCAwxIi6O628mhnE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GopIfk/LOiTNrOmUX30nIQ4lGe/ilTxDdc8XGE7SsiDyZwYnQ11ZthB8Mb8syhR5/SSVJCU2Ja0ksqP9I3XbkZPcht5YeKE2rq+iC3CEaOsorfhRZU3a6y3dUIeavQ8uVY5OFfgj1yCTsbmjb3UDKOrtJtNJosPzoqhazrX309A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pqjSYjVH; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pqjSYjVH"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cace91f112so55495495ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 15:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788991695; x=1789596495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C7UZ+CZSXqHjsWNSA8dThjGs+0DrX3xzvJgXi6EfD+U=;
        b=pqjSYjVH0sTrb4HvNb/roRSvxFt/e18xDiqAaQ6oPmmweGvLbCaJ+Tk/kZZjo6NvBx
         Yod8HKWd3cku/P7GjA8pylHmgDf68Dp5hc72FEvI40DoJfXUmBNWpijJqjSkleUK9V+N
         TPr9yue7dsyZ/ATW4vj6DUN90Aiic4MWj4jOtWwrYm8foQGv1q+tehNThgOm4XwWIX8B
         WGKeqPNIpJf07cymAlA0yQzPkSGnTbdtdSvaUZnNVvAb39v3fyy7cmrO/3HX13OxA/jz
         04EtO1R/Wvjmn4T4XaTF6MTA6vuRNOb/drY+nWipsBiGo9Pb7ID7hqbqZnK7qVwSzyUL
         RFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788991695; x=1789596495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C7UZ+CZSXqHjsWNSA8dThjGs+0DrX3xzvJgXi6EfD+U=;
        b=ENxeNN9/Fa9088aRFXvYGSqE+MZAGHmXV56NyZYfgRYwMDX1B+wqKRxQQ+GCmZhBYq
         PrH8DaIBO2tWYPnH47QHNOX6zgxziAS3PT0uenVOtUqT/K0yMeFu+8qsGAX7/qoy+FDY
         0EkttQXSOFmLIhNZNdw2+6RzQZK5F/8JjfSqKA5B7EHTm/sz9XUmPZScsv057V7qPQGa
         7PxfCP8z85IGNndUHW5d1t1i/AMOs2mN3FyjTUnygQ9zfp+j3m9cvRZXcMZ/uS3q7wPt
         whypd0GRFiQnemoPlt6dIQFi4jhA8sXyhXjbwS0ukT5CTRfCXsy4PKL0sszYePoBfPbg
         rhXg==
X-Forwarded-Encrypted: i=1; AKwUvByeJyMShViLAqU9sO7qzFBdnGlKZeeU66k8/LKHRWcopAMxuwpld6otQsoRc0VKEu5MHpl3npe+fAuzjqM=@vger.kernel.org
X-Gm-Message-State: AFuF++m5wScaz3TvcYBtx1njoo5jLMXDh1DzgmPsaJ+JCZxILovn2IZ+
	95+LbTdYxd8dBaW9v7dLqcYW17+702N5XFvM6CdFcpLXVD8MbAW5mejwnRxE9Q==
X-Gm-Gg: AYBFou3XX4Mrn7KunYJOJdU07/RlXzaFSxfnCscxZ1pYRiSb22ecHOQtxV+Bz/QG/Tn
	WKNPMQdLNuGyJNHN8tmSLBr5hdYzmb4SoW2OvS0qNtfAbX3ptx48OrhB68Juhcn2PVhzbQytc9l
	JvLwty6NVDv4ieQblozzHr8oe1V7RisRci2jid7ofnz+cDLGsAMCdhm2PrwWMW1DiNnSLjkIs4L
	rcIVWZE4g0U7rczjnusjPgKN7SyhT4ws9U8nfC2GWJUVUoZMUiFq8vFFsAeAM9VpX0YRso7EoSR
	70HCVh3jj226985K7Mogplm4Tez6+mzJxiQT3sQ8U+zcLmWB4mpKaag1Os1ax9hjaWcf1Ow9tJ5
	XM9tKH7zlk91Mpj+jbKGuZYaDWPeyGlBpPNitFb0ne9bKxPVqVV0Mur5KnEf6sPXMI5HQcMiKf7
	btIfSLK4AzvqF5udVKbY0zBdvqU4OUHRwMb4+XwidIKLr3kmgenoHKlDNGU5IBe3lVgokiD6q+G
	hw/pQoMdtg0F77+72FJvg4aoWQgTf/RQm7F1F9yUaBYlrOdGTmJ+7tEbHN4C7LsvLVnuxQj3HCT
	5CkJGGVr+aG95ZDHlmbc3JeGw4eigrLYB2dJK16nEsF3qbUW
X-Received: by 2002:a17:902:da8d:b0:2d5:3f5f:e645 with SMTP id d9443c01a7336-2db125ca419mr522760655ad.12.1788991694359;
        Wed, 09 Sep 2026 15:08:14 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db2c60f687sm65423565ad.58.2026.09.09.15.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 15:08:13 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-phy@lists.infradead.org
Cc: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	asahi@lists.linux.dev (open list:ARM/APPLE MACHINE SUPPORT),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/APPLE MACHINE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] phy: apple: atc: remove stale kernel-doc for removed struct members
Date: Wed,  9 Sep 2026 15:08:10 -0700
Message-ID: <20260909220810.52310-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The @sw and @mux members were never present in struct apple_atcphy,
causing kernel-doc warnings.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 v2: remove removed in description
 drivers/phy/apple/atc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
index 4156fabad742..f09305dd76d1 100644
--- a/drivers/phy/apple/atc.c
+++ b/drivers/phy/apple/atc.c
@@ -585,8 +585,6 @@ struct atcphy_mode_configuration {
  * @phys.dp: DisplayPort PHY instance
  * @phy_provider: PHY provider instance
  * @rcdev: Reset controller device
- * @sw: Type-C switch instance
- * @mux: Type-C mux instance
  * @lock: Mutex for synchronizing register access across PHY, Type-C switch/mux and reset controller
  */
 struct apple_atcphy {
-- 
2.55.0

