Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266084;
	b=uCiWs2tPNWrE3K3G45bDVVz0V/AKfZzYGuOpeUIFM2scpyLhe32JecrGvrkxO89rJriQ
	 0qy2cdqyJiImD2XXBKSXz7VHEg+vHgnX908h9EHFT5dCPpi8oTo3P9swcrHGynHJxUvqN
	 HJorMzTww16OIOr4eXnH06HvVQ8odYxanUjVJJ/zHbMNlIPM8s485Ik6QPQkjHlvhPr4D
	 3XLZ8wevxFI+Iko+H8Sn7NPWmpT18Udvp1eIZlwYe3CVFTgzmhn/u456KiKE5CYXqPwaJ
	 MSIVNy64irhS11UjmLZQn2OCnnBmZMughNlH1N1E+sqIx0gA/nrIgNua8ihnO4xmI+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=9/jxKfPImA2lBxKNaUdoM0QYCxHpfos6259KgT8iOj4=;
	b=EmpF4RD/pm3ybqD171/XNGlYCPxZg/ISJ4nWQQrv21c6WEnyIE6fIwjUhHJi1oi7+FGL
	 TXwwZRxJ7GggvxaZZn3Wf/bVJWOdtF81WzIbYMX6vZq3l8cu4gtsx1jy85UahF28xibpo
	 7QCHXH68gNtfjDFfMh9VksQpW7yktHHVJ+sFl+JC3/x8OjOzNRO0SuJQ+vv0yfEv2nzPy
	 GSkNj8Jp80PkPGp96iVuL2CZWLubCqZk9+Bz5sy7vHs25r2urMh2jV4RUCFCN1m4fCGR7
	 BA92tX6xGrnFMgINc6/gDfEChIIRpo+8mqqzp/3cxmQcRF2tZXszzVg6/lWyOQOC2NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KeePWcm+;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0032C606A324
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0032C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KeePWcm+
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso12981925e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793266082; x=1793870882; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9/jxKfPImA2lBxKNaUdoM0QYCxHpfos6259KgT8iOj4=;
        b=KeePWcm+Wc9Cr2dsdQ+BuaOUTZiIN78ho+d101xqGdl8e0TbAVujoEUnb1W58Bz24T
         nH+yJxJa1wFD2C1Kftt/0jM9FxMHe+jSsqqOuISSwZbMpqzxq1er9qeXhLOYQ+74xz37
         mgom2jjfsZOOMvU8xkKmHbi9guvOkzoFkU9bpecyUJ9fRPlBGCkuOErVuEOCAYVp3pbj
         9mzjTOsHNgk1ZqrFbVlSsZdufFLeZDGUiZfd8SStCb9aI4QEZSP3quglDJnEfot0W+zv
         jmC67M2cZNzC9p6mrcHDlDblyGTMrj80wqPstKxYiyxtRddEgd0HI/ZZw/7Ide5N+JLd
         G3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266082; x=1793870882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9/jxKfPImA2lBxKNaUdoM0QYCxHpfos6259KgT8iOj4=;
        b=mXeiiIajd1ip2ufAB20t0yZsl7v4mNOFeO0fwJ54L3vVXceZVRFdEKR7nsmA/VU4Bk
         /GGEL8aOlRQVXwX0HNdg1YsEO3mFYjwu0+VMzN0t4Gtwq211ge5ZtqMA1M8wjWEnJykn
         5fbruHI7OC+9MjUnKrIRf8XwSjZxqBvwKBn2dd9ZnjLyAv08gSqzngiHlW2u3Wi+GP3b
         Gd7K8U2PyY6kJWJja/06bU1BGNECyjDcoD97/JhN6BECHWGfFzbWWdfUYj52krYzwcl0
         Kh/F8P91YoPA9O+FhwwSwLWOEqZefGLjbdqP/USB/IGKbCeZSr55n68xDG+Mz/4KnbYx
         H1eg==
X-Forwarded-Encrypted: i=1; AKwUvBwiBaN5J8yujvtqAccFfrMoDNfIZ9R7gxlTS7wfAsRSeLUlVZpZkmYRMlCH0cI9ehFOSdq96sT1cdk0Y30=@vger.kernel.org
X-Gm-Message-State: AFq9FYKf8WVlgoD8brh4TQJbWh3iHeVXNR7lT6p6ESHvY6sz9tyAlGr9
	sTXO8hvbRwKFks9YI9w7ggghrbz3iiHCOAr/8oyyu3e6DkycacC7RL2H
X-Gm-Gg: AYBFou190Db0H63a99f1z1lj933repf6hbBWGOp/0xYdzLB6dE8inM+R8m+y/INKTDR
	TwrCgwdiNHOQdfI61aufS5Uw0ALnBnD0oimndR+AOl8FK8dxXGWxUdklPgkdl0vTpmyayBBfTQ/
	xj6q3ed3yKoqqITEGWf11uKQSiM2wHccjCxsDajk1H26NHReC8gtquNpn5lyIrISZZxSpG9FoSX
	7+xAXOlNtmVgHrEEOc+cpfzbRwr6noPXWANxVHKHlvZeeUFV/RYs2AvKlBO5yV9fudaw3XuLVDc
	0fQ895fAgGbTIhnzXJ6Jqj/Y2yE+BCSi/A/yHjXND91V4sIr0+HWTfTDMPuB9sfZXmd6CtCmbw1
	qbd/ZXuioO1XLZixchn3iX05jDe+QsINzEKvijdJjv7l+l+hdwkGRZ+aIDJGFKzqUVbwIvlg5rT
	/IbkGUJOzLk0naikxsZo2KcHpOphawS3rS4XcAPMFLGucBN6cn2jXo9gXpqwVQuwvTD5WUpU4J8
	aLlREWEaO3WfW6vJxhpRF9iyZV7kMR7WSg7BgbePeatu/sTnAvavlHuAoleKgJbYt79NJCqqn3t
	SHk0l+ID5nUUic38TotUayFiDPV5ngK8Ic5vTQyOR/9b07lfrY/ddk5cEB1JjaADbYvvaH4A6/r
	6pT1JHpfzW+dN37ihEiliHR0AGlcXQCdzLWzrSGaUKMMViIEYA8InztoUWVw6CWHaa5Hk
X-Received: by 2002:a05:600c:1909:b0:4a2:1e1:d55 with SMTP id 5b1f17b1804b1-4a9675dc5cfmr104513485e9.28.1793266082206;
        Thu, 29 Oct 2026 02:28:02 -0700 (PDT)
Received: from PC-Marco.local ([151.59.117.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm50821065e9.11.2026.10.29.02.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:28:01 -0700 (PDT)
From: Marco Ziliani <rylos78@gmail.com>
Date: Thu, 29 Oct 2026 10:27:52 +0100
Subject: [PATCH v2 1/3] media: i2c: ov5693: Program the mode registers on
 stream start
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-ov5693-fixes-v2-1-2526d7b13030@gmail.com>
References: <20261029-ov5693-fixes-v2-0-2526d7b13030@gmail.com>
In-Reply-To: <20261029-ov5693-fixes-v2-0-2526d7b13030@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Chris Simpson <chris@nilk.net>, 
 Tony Garcia <tony@loafecho.com>, Simon Kruse <simon0x+git@proton.me>, 
 "D. Manresa" <dmanresa@gmail.com>, linux-kernel@vger.kernel.org, 
 Marco Ziliani <rylos78@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793266079; l=1906;
 i=rylos78@gmail.com; s=20261027; h=from:subject:message-id;
 bh=wDDDCzJbYkoM/2Di8Lb+8DgpOV7JdtQpC+jcKZxFM+s=;
 b=+d0eC5QC3OMVEwSidcggY3ddHIqTWFxa//aGW862oYz9O5WY7787bbb6G+O8C3w1oc66AqzCl
 /Ovn/eHZyQOD/k273XdjUIJas2/IZXDVyVzOFdL2xkshj88I4rOJcKT
X-Developer-Key: i=rylos78@gmail.com; a=ed25519;
 pk=nXCfiK5yExPZCMp+lfKif3gdXkfjkUK2qk7bDW+ixMo=

ov5693_mode_configure() is only called from the runtime PM resume path,
through ov5693_sensor_init(). If the sensor stays powered between two
streams with different modes, the settings for the second mode are never
written to the hardware.

Move the call from ov5693_sensor_init() to ov5693_s_stream(), before the
controls are applied, so that the mode is written on every stream start.

Fixes: 89aef879cb53 ("media: i2c: Add support for ov5693 sensor")
Link: https://github.com/linux-surface/kernel/pull/181
Signed-off-by: Marco Ziliani <rylos78@gmail.com>
---
 drivers/media/i2c/ov5693.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 56599f9ca..d09095c3e 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -663,11 +663,6 @@ static int ov5693_sensor_init(struct ov5693_device *ov5693)
 		return dev_err_probe(ov5693->dev, ret,
 				     "global settings error\n");
 
-	ret = ov5693_mode_configure(ov5693);
-	if (ret)
-		return dev_err_probe(ov5693->dev, ret,
-				     "mode configure error\n");
-
 	ret = ov5693_enable_streaming(ov5693, false);
 	if (ret)
 		dev_err(ov5693->dev, "stop streaming error\n");
@@ -1000,6 +995,19 @@ static int ov5693_s_stream(struct v4l2_subdev *sd, int enable)
 			return ret;
 
 		mutex_lock(&ov5693->lock);
+
+		/*
+		 * Program the mode on every stream start, so that a format
+		 * change also reaches a sensor that stayed powered since the
+		 * previous stream, and before the controls so that the mode
+		 * registers don't clobber them.
+		 */
+		ret = ov5693_mode_configure(ov5693);
+		if (ret) {
+			mutex_unlock(&ov5693->lock);
+			goto err_power_down;
+		}
+
 		ret = __v4l2_ctrl_handler_setup(&ov5693->ctrls.handler);
 		if (ret) {
 			mutex_unlock(&ov5693->lock);

-- 
2.56.0

