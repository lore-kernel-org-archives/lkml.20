Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792975341;
	b=GpO3adQLJ3PFV442mL3y96FLDQBjH6aB7sBYejoGmOf1rFnj0re8LkhC7YlVf6+7miYJ
	 ytz3NE65PHtVLnX9DIbDfz3gSOdCtau9urRHYNIMPOk9zBHMM5lbAVgrzkvsJ+Sqf21Rr
	 Ixl3oUP/H/JLG2rB/TxXXCqQQDPpifuGR6X4ofrzeQ8dHRbD1VqHXvq8EaPf/pjblR4A+
	 hB/j1ft8yk/JNFfD/WlFmeMfheChIlJt/3ldgWWDHXc0dkL074b+qAoCcb+edXtJNd7VT
	 E6NVRyohNWM9Kje5qsA1zJT3MD7PRebmVNoQRsPy09fTLMNie2T4LxR9deMtXqgoN0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792975341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YbyueV4Gi45oNKFaNAyASogMfbac1Hh9wVb8Q4edKLc=;
	b=qu/0CQvRLQ/UnksAdAJU8hT1d5aCv35yK0WrQ3IDvk1oJ+kqOWfOfa7snY4SJPhHmh6d
	 bpd1ZMvvm1V0P5MDrL8uC6UzlRPhaG5PFd5V2QQM7WGSfxnOIHa8aKYOekLqycVZJtfwh
	 ZSnTI3Af64LpqHRgZf+4akB6n0KC+SsE9IiT32/8ZJde+vAtWl2SpUKwSXGFQMSCfmmtO
	 k3UDFXqtBIcRVfWdr1hH8Gs4lBt8zOHRRqWOnCv8WN/oL45m/pKrGex2Lu+4w0xRAsdHy
	 /R694QVk+OWoZAwftWLpUh1kCEMHkDUEaTrRMxuxsv61IpG4Vyv10BFpDzPJXa5Cn+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ifhh0v4+;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191F9606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:42:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 191F9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ifhh0v4+
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so8804165e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792975339; x=1793580139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YbyueV4Gi45oNKFaNAyASogMfbac1Hh9wVb8Q4edKLc=;
        b=Ifhh0v4+VAE5vWHWkkm81arNYqQITxsPYYD70KVJZCOBbgofUKM2kaolyhsyUz+j1M
         kLMPniFhi5ba9rONhPSdarPhE8jpkfhaLPnZMUvHBTnKlGe3qWW+v8x+c5PWhv7CvRWN
         GJoSm95FBZ2Tssh2QF512elsiZFAWvAD7la1kD1mT9ANshQma7JzZmR9F++fPqs+gI3M
         DOf5v3K6OPgMOYmt/0S/+DFSSxVuowlFwLY6cwxcECPee/fyiDOCefsTrwAlzX8XrzYc
         2I5FdiaQ3G9/wwP3krbcODWumx3nNdaPG5rAgljj8J2e/WqgjKoxsEyMQBGgTLvnOkvS
         DGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792975339; x=1793580139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YbyueV4Gi45oNKFaNAyASogMfbac1Hh9wVb8Q4edKLc=;
        b=mmkaK8rExpn4RPdj4g67+/vL8/ThNnhW1X8eyJi5BfrXHvt2bJ3vaoeKaZvm224cUw
         W1SfAvYTdTdauM3bWgsOm/O/VRKIFZAEiilTm41lAmWeJSOz0L20LE3QZe0XTS5d/BP1
         n0WjvVG3BQ/FgjQGC3JVqtEdGB/soi/pSlcx/LNMU+bR55rsM8us0UYmU05kEhUVOqV7
         MTnWvrykS194GBSnK9+LE3URlBLfqxm0xZFJqO6/HXdgbXbcXdrD9U5tVFgZ0ZHkZS93
         5bQC7KN4hTeXQcZ9SfBIaXlT8QQ0vxBlDI+f0K2XxFCJCto+npMTyBzJLhxUh88SN0xA
         8UOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPsnmHRoqUB7J1ocuYRilQhrmzHLJoj/x7UUsBBmE1socoN3Ujec2N3W9z5+/sf9olwAVUF9lRIbZbOF4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcMoEnpx4zObKK5g7sU7p+YEkc5y0zAXavMyLjgqDDNFo5Paej
	Qo8drYcW+v9nTm8bjsxKVCfaXGtf/RWA1tsw9NLfiBuOrd5U2uo4qvoZ
X-Gm-Gg: AYBFou30o3TSY/Emh/Ph6JpExqm9DLv+X8tEIr2DFodYt9npuaBNuDRJsu3cDHuuFaM
	IKtGFicNDrPPBOYMUxsvneR92ATofZjwlIBkIVHeTypJSn+jkoC8AY895dQgBtAnxncmhlz++Ol
	ALjHAlalG3Xm2NsXbE8E0gAyMGcvQDjesNqgyEITvVgqu6OBjfDqcXKX+eXzz0FYliZxkQnTmaB
	pN+wEmVO7h57nXV+p21EFGbGHTsOQjALsG8OO/JlZOSfzg5hf09B7M/TbxkfhKMJPxf5rbwZY4V
	zdCubICX7ZWHwvYmeElaBqBXAmiP4BH4yOfJyi2uPPTq/E2Y3beMnXTWGTsriTbr23IIsf5QLX5
	zE7mebh3R1R/1DoX08OgqqjXFYsVc7T6lFKYQtZ/qlOgtfzFLnpCOlQ8dhMrewJltfoYVc+jKGV
	ZReQEejgDo4dl8IaJprOJXQF4VRYbBp5cxlNSw6HEhNuMby5d04BBpMQiPfEYL8y8mFf4q786g4
	PlqpdqJ+KH9YzTMINe+GZ9jF7AavCKRUkvVHdUwqpHW6Fn+TZ/oHwzRIFJhg2wab0h/eTba60Vt
	xFwN/X922hVx6w==
X-Received: by 2002:a05:600c:4e12:b0:4a1:702f:c736 with SMTP id 5b1f17b1804b1-4a35ac3f7bdmr99498405e9.3.1792975339481;
        Sun, 25 Oct 2026 17:42:19 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a07ebc0sm74574555e9.3.2026.10.25.17.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:42:17 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] regulator: sy7636a: fix the chip name
Date: Mon, 26 Oct 2026 00:39:13 +0000
Message-ID: <20261026003918.155321-3-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026003918.155321-1-pmazzini@gmail.com>
References: <20261026003918.155321-1-pmazzini@gmail.com>
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

The driver header and the Kconfig help call the chip SY3686A.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/regulator/Kconfig             | 2 +-
 drivers/regulator/sy7636a-regulator.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index be6b72daa76f..88ba2770e378 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1623,7 +1623,7 @@ config REGULATOR_SY7636A
 	tristate "Silergy SY7636A voltage regulator"
 	depends on MFD_SY7636A
 	help
-	  This driver supports Silergy SY3686A voltage regulator.
+	  This driver supports Silergy SY7636A voltage regulator.
 
 config REGULATOR_SY8106A
 	tristate "Silergy SY8106A regulator"
diff --git a/drivers/regulator/sy7636a-regulator.c b/drivers/regulator/sy7636a-regulator.c
index c44c445ea139..015227cb113e 100644
--- a/drivers/regulator/sy7636a-regulator.c
+++ b/drivers/regulator/sy7636a-regulator.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 //
-// Functions to access SY3686A power management chip voltages
+// Functions to access SY7636A power management chip voltages
 //
 // Copyright (C) 2019 reMarkable AS - http://www.remarkable.com/
 //
-- 
2.52.0

