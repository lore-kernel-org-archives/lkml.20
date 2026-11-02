Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793579733;
	b=vI+AuxkodaLMG+M5aQGf36Sltm5An6eIrJ1Y9gXW3o7ZwzwyScRFuKTmcJVz/0nIIL4K
	 GnJX2aRkUwqd+Yevi+byrnJ4jOMouHG6YqwYqQgKIWXSJ5DZTLhC3gjgkF+umbLuk7tHo
	 /wnDU3jrMVtv/S01uDsbJNkP3FAqupv+4H9YuwwSMG2Lh03jyUONbLvgId2uv7iwkVLyX
	 Thcm2mwFUj+rhFvT0WsV3biXNk8Qe1/bhlEc4K0nI3MLmSdF2za8RiPG9IXmKqfuG2tHK
	 y9Tg2/cH0/LsBCbdsT/cyruGKpPNqfybbg9O+fUfhOo9luav910Qgjp9XXv758nKKEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793579733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xBBiHeCR7jKFbqPuSWsbgd3Hit459uvXqE4qXlk5ksw=;
	b=moYMvufQrfap6nF8HNAMBJFwp4qS6Q354ol2yP5Z2Rgq/cjGJcv/y8O+DMXB1/7zmzF0
	 5HlodQbYbIPQUrix9gStZzA3BzXtUkGtRDm5v31P9xZ4j83ghJgGKY4ZpkSmJzVgd3PKq
	 BoqyeEC9gKUpCQKiR4lbc/8kwROvbPIJHlVye3Mole7xD75Kw/6bhd1eYHJ8j8SQ2B/2S
	 1gjjxVBIl0M7KZwx2PJnAKDK94APndjH0jHWvPWXdP3wl0rtpvziNAg8hVczuhpqPB9Rs
	 phNFONskFyG9VyQq01KT/+XPVvU1XoUGKNRhycagTILYEsph8tH5nnZJJh3XHopxmTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tztyUsvQ;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB70F606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 00:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB70F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tztyUsvQ
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so25366805e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 16:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793579731; x=1794184531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xBBiHeCR7jKFbqPuSWsbgd3Hit459uvXqE4qXlk5ksw=;
        b=tztyUsvQqzw91ufCZy/XX9YBS7YHGm3vlKyqWf9JLOvw7LUzkq37qxlRKlt+kmnt8o
         7g88Ylxuj242OtdWw61WHoAu4IdvP953K8x8IeGvj0KU4lKDvqODWRc2vu2mXhrNNI5j
         V+drM2Kji1mZ6dakw+Go0QeNNLkzifHDfjUn2zQn2iWVr+qeiETnBpoBtgUw7yJRstVn
         6I/8WyrUQLbBomgSREb04EfZrHMFKMOW6GFEcnP9FpgNfvmcAe7b+V5K/mZaFJyd6F4e
         NBg/g1op75hgaD5ReGlqXgmLnrEumhi1EFGLAoLE5Ew5qxievXTOuHWXDgM98OcQL4T7
         VFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793579731; x=1794184531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xBBiHeCR7jKFbqPuSWsbgd3Hit459uvXqE4qXlk5ksw=;
        b=FIILddzNxmMv4Xl0ETn7HoEWPy1gRgg33pk9vZOyQlegSiWi/xGYHweFRf6u4H1j26
         dNnY7mI8Jw1lZ9H8neAlCPvymCQ8EKXdVWYF/EYw2dH81mkjoFTjldYiAeuZmio/09P/
         SU7qyRt5NBHv8BjgX5WBcesUVvtMjdgIBHJjmMWdd4RN6jT7whX5ULuBskzAMzzDvO9n
         Rzpde8Tt/WEkTTJkgJQwWaR4aASrd/SqhHyPwyaqcqHlNeh+3r91R+7iLvn6rc28KhJ0
         J2w4gYfbceOu851AI2nConl0HwGkQ6jXKzvaAueHtv2jTpPwXUxt0w8QXgG6bTJ+KRdQ
         D1Bw==
X-Forwarded-Encrypted: i=1; AKwUvBzaY+LmNkAKRDSubXcY1vqNm2fNxGFXXplpxqfxp5uKDS8TGZkM9m4q9Uvfr9ZjtGozRKl7vgaLYLbnmaI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8l31IfHlXbcFmnoyQc4M+afPg8S6Ha3xrYBumi/8X6aiIh2kY7
	ZMvptjTphXW/1wOhHLGdYUj6Oc/5oLnSzZ0+4sy47Sw17qAooOZKSrVlN92AhOM=
X-Gm-Gg: AYBFou1UrnMIvGv6Y4gZLWmxLWto98Ub48Mz7crXWFLb97RGJpvsNGcY6xSI18Yhs0O
	zpVQAtmsF9tmyoJqxXfnaNO1LlGVZ/p9oOHquxHAuUa0hktnNUid+ODXbbP95k3tL71qrcn5X2/
	Nx/Bmiiq8xM2ZoF7VUTOS8qlmdFEE7x09ffNo43LDrP93la+HCIKEvtqvKThEo5El9ZGj6+fulu
	svNiKJaseWIso9PlsPx6YBFspZgF6xt2fev6FZNdDXW2zh65uEhluYxC+fpTMuykmmeLeR+sdKK
	bywt0b91eiKmZFnAoDl71w9SakgnmnkP2xAwvSlufsJSnUUwqqjJibTlJFLOoz1QXnlCohus4EU
	eNMQdsfHh2iy01KfgHdspYtVXn4kNu2GzZ5ApdnHfppFNXNn5ztAZ3gMA2OP9to0CmdqdKk1ktS
	hesWDi/mrKgORkFvD0AwOs3hBlxAiVRVNwOomYH6UgkhPH2NS6k0z3v2pm1RgjFp0jPL+2Pw5Qe
	b8qhCcxfW9Z2U8bGpUJcdQlQbH4ZicHd5/FfB6s5sae+NxULxg1wFheSjHcObDo02il1nwr9cGK
	IycUTmc9iBRYz5LH2Zl/Lebke7faYTD7govx4p2mYiWx/QKiKYLyk15z4oQ=
X-Received: by 2002:a05:6000:2311:b0:48a:f320:dba0 with SMTP id ffacd0b85a97d-48e6e4ffa7bmr19379378f8f.45.1793579731393;
        Sun, 01 Nov 2026 16:35:31 -0800 (PST)
Received: from sasha-User.lan ([185.159.163.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm16571688f8f.23.2026.11.01.16.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 16:35:29 -0800 (PST)
From: Asdlerto Korry <korryasdlerto@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Asdlerto Korry <korryasdlerto@gmail.com>
Subject: [PATCH] usb: typec: ucsi: Fix printing of a fwnode with %pOFn
Date: Mon,  2 Nov 2026 02:35:08 +0200
Message-Id: <20261102003508.341309-1-korryasdlerto@gmail.com>
X-Mailer: git-send-email 2.25.1
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

ucsi_glink and ucsi_huawei_gaokun walk the connector nodes with
device_for_each_child_node(), which yields a struct fwnode_handle, but
print it with %pOFn, which expects a struct device_node. vsprintf then
treats the fwnode_handle as a device_node and calls fwnode_get_name()
on a pointer into the middle of it, so the "missing reg property" error
path oopses instead of printing the message (seen with the same code in
pmic_glink_altmode on a Samsung Galaxy M52 5G).

Use %pfwP, the specifier for the name of a fwnode.

Fixes: c6165ed2f425 ("usb: ucsi: glink: use the connector orientation GPIO to provide switch events")
Fixes: 00327d7f2c8c ("usb: typec: ucsi: add Huawei Matebook E Go ucsi driver")
Signed-off-by: Asdlerto Korry <korryasdlerto@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi_glink.c         | 2 +-
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 1db0c88d817e..4b4905624d61 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -433,7 +433,7 @@ static int pmic_glink_ucsi_probe(struct auxiliary_device *adev,
 
 		ret = fwnode_property_read_u32(fwnode, "reg", &port);
 		if (ret < 0) {
-			dev_err(dev, "missing reg property of %pOFn\n", fwnode);
+			dev_err(dev, "missing reg property of %pfwP\n", fwnode);
 			return ret;
 		}
 
diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index 57b37fca150c..fc74c205181e 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -430,7 +430,7 @@ static int gaokun_ucsi_ports_init(struct gaokun_ucsi *uec)
 	device_for_each_child_node(dev, fwnode) {
 		ret = fwnode_property_read_u32(fwnode, "reg", &port);
 		if (ret < 0) {
-			dev_err(dev, "missing reg property of %pOFn\n", fwnode);
+			dev_err(dev, "missing reg property of %pfwP\n", fwnode);
 			fwnode_handle_put(fwnode);
 			return ret;
 		}
-- 
2.25.1

