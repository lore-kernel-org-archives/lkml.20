Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117817;
	b=EdQUF0092Nh4JCXUL7zdQScb/OGeptGrRlB4bOU1sY+iPuM/lu31wFM3nJCn5TBh1uYS
	 +Q2JkBt2XmYMM2EXQCJr64JwIgLOOP1EqTWj6nuIXybmBw824JpnjTYi5Qjc/9qIWuubM
	 ErRbWK52rWH9LxiYU6aEy3KW8K8uCKbdVFPF49Lfxiah/IR0Wdmcj4+RJHmjaIYpKw1hr
	 EOUoSs/AAp1toAdOdsMvfMLilFj/NuCSNGOFo1/8tQJJVukI0Y+Mt/MM6040OGN7y6OdT
	 KpTkMyWWJ73//pXyqisq0WDQCs+DaCn8z1ZBGscIz5u+VgIC5ekiW19jFM5pyHrFfZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cPCyqMaKTCMcPIZaD/DpSt+b55Xb3f31eMSeD9/YiJM=;
	b=N46n0hZyToBe0T53+f33BsVrOAEq0bobMPZDBlHarT+rtPl7RBbVRAzSHgDTkmCLZAKv
	 tH2iXrwp1vHd6l4RbTatsjyMHZxTnVspcRdsLc3E98eb5sq0/T/LiV04xGqJ2UAHVNMk7
	 YzWN8IVDY2gdf7s6egqg+4JYkDtMGUSWcBEkoduzSXkyCa0YSkMuOqsrQebTJa9IRDImQ
	 Pl9uOdJkLliD9YMnOnLwVlkI2+F+UPWO3fzPLQbsQjx71Wo3TD5bOha6rN4im8QQ8L4cS
	 s0/x1BtQTN7GK1yi8l+3iV0GjgsEtlh1qOMJXE1p03S8VNzdj41w9PgG6S4xQQWKVNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qZUTYq4j;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37520606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37520606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qZUTYq4j
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso133775e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793117816; x=1793722616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cPCyqMaKTCMcPIZaD/DpSt+b55Xb3f31eMSeD9/YiJM=;
        b=qZUTYq4jWuhlp5D7gKVp1d8huuo/rVtE5YFvyEvvMtnZMFOAAU5lSpyqhfb1kNkXZQ
         lrixdFFqke4HgiNc3dGkWfXMJxDtDnbqFd3xh3UdSQAToTTethCybrMJKZBj88M+uJ5H
         OwoKT/felqMYVOaJQ+7/ql74bUD8rAWmlU3NPvygMdNk9xbv7MHF0ycmz0oovQ2BbkBj
         j7T4sGUvYJziH3uqZF/b5pgTS8/Q2pvh7YeqX/XxekKs2PhVD7S//EKKjxZBcZRPb6AN
         KO0yRxMV/PSm3GorLG4hL9GcHu65evuRNWUdRY7FhyD5LBO1Az9Fui7W8ntX+9z/cF2n
         BxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793117816; x=1793722616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cPCyqMaKTCMcPIZaD/DpSt+b55Xb3f31eMSeD9/YiJM=;
        b=BYatG9FG/TTmsPhIskiO84CSy79nDOv0Jec7EEALFgjODBy49rifN+mlHtxcu58kbG
         zhaRqh6Bq4wDI2HLhD7ARZ8ZSG4pbJwqH5xpc4GNoqelMmS7r078WfD3/2A4WCgldXZo
         sicfXtLctbyrqDyqVvPavWXZm6kDJLPmmFEa38ymld6ZHnF4Dj7dR0+Krx73vsz8PcKC
         RGGwREL48yqqQMGf1FOegqCv03uV8eGiAKs214i7MrtAp/99++8FYR+LPZuiyNAj6wLR
         bcXH4l3rTuUppb7c0pQD0eWZ+lpwvqlwwl+fASry1MPQC3B0oChZNc5QvRho8+XB/oRy
         SSeA==
X-Forwarded-Encrypted: i=1; AKwUvBwW/kN+3GlABcrm0DU7bEFdXtNxHkGlirgAJ1YUtQqqoJZD9RjINvgnKBZQ9J3cfng9F8DcgJrqH2+jWM0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTjllrsV7zMw0gUAjIc9XTowFbJqf4W2txRAVLyrrMP4F97+Kg
	KDSshFfFMN0+a9rZMDPR6dlieUYChCyMkNWnDtrKjLV14cuUpzVzbNZA
X-Gm-Gg: AYBFou0vwvlfNreBnIUv0R5Q8jyGOTqb6r5EaWcduIvrUTecfRPJeYEMH3vlDWWfJpV
	PpqVXrIGqHLiqCuua0FqF2GH19Ps1oVLqwvgoxAqP0sOUf43GW6Dosco16+JdH4Jo+alTmR4jLp
	6bTWTbNPM88+ybmLnwZHxd8qREHXk5D7AQ75i4JAhsMtZch7vKyX6OHOG+6dSrHeNzcRCHwZJiz
	NbVTh84ijNcL1/E2vyFKSaTswMaDzC0sHFH/r7yEKM/2hN3z1w0TnSCiQ3isV6sV1wF61OhxjUs
	Eb7sYrDdt9RyWJxcKJ8oSICLRr36A/5p14XW6jhsac4ymgRftqltoG4y1GQUuhB4pZowuqsf2Es
	aL41eOnb9hgs0+M9Wjl325ovPksU3RuOKFIYEk1fZ0khrVqytoGP3iXkk8JbVdmgwj0FjCzC6P5
	HHwSoJB5DF63n9QnMvBhfDUN5IRRMeTHRQFA/rlr8F45Nv0KPLbjuYC1jHX8hiCcxHhXZnTwDjt
	aEO4xmGGLdwXfPCv6tOU6kaxypTqnQZaYc3JLHkAvwcTQ==
X-Received: by 2002:a05:600c:4e0e:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4a35ac9d227mr200480015e9.8.1793117814801;
        Tue, 27 Oct 2026 09:16:54 -0700 (PDT)
Received: from fedora ([2a02:587:85d1:a500:5135:1deb:a9ab:fb3f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a928c50222sm1765075e9.1.2026.10.27.09.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:16:54 -0700 (PDT)
From: George Karagounis <taterraster@gmail.com>
X-Google-Original-From: George Karagounis <mail@taterr.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mail@taterr.org
Subject: [PATCH] ACPI: fan: add missing MODULE_DESCRIPTION()
Date: Tue, 27 Oct 2026 18:16:50 +0200
Message-ID: <20261027161650.59170-1-mail@taterr.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

modpost now warns about modules without a MODULE_DESCRIPTION macro.

Add one for the ACPI fan driver to silence the warning and provide

proper module metadata.

Signed-off-by: George Karagounis <mail@taterr.org>
---
 drivers/acpi/fan_attr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/acpi/fan_attr.c b/drivers/acpi/fan_attr.c
index 9b7fa52f3c2a..6b3d91c14f5c 100644
--- a/drivers/acpi/fan_attr.c
+++ b/drivers/acpi/fan_attr.c
@@ -15,6 +15,7 @@
 #include "fan.h"
 
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Extra sysfs attributes for the ACPI fan driver");
 
 static ssize_t show_state(struct device *dev, struct device_attribute *attr, char *buf)
 {
-- 
2.56.0

