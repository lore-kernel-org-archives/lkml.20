Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8AB56852A
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000475; cv=none; b=I7l7sMImqHN3vT77jEit4ICi4RORHk9dwFNRq4uAv25zPSa2PRhhx1+9lnfLhZ5tID2bapl8ysKaQksHXnnFMHoPPRShzS3VK1CNi2b8llseU8JJGGJq6oYUt4mZf5DK3gkI0CR/nZkUY03BfnjflaBUrN1IFfi8rnqrbzifs8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000475; c=relaxed/simple;
	bh=AbDp74FboY/m54pfNSPGHJTdkLesKVKCn+j165dfG4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=plSZ7mP4YKttXQwCy0UOgUqkAswagv67qtP5+c9UJrvZTeZazR5Vs0BWa7MqAS7N1wK3QaY/ABZDXTJlUumqnYz72yXVOMSlkAStsKnxw0TKE5kf0jLB91k2VsP0zgKn0PCTqDSSsjlPzC3ux3l5cSje7EylTeIo3hGmWmhDBOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=X9yccBPK; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="X9yccBPK"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso2520888f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792000471; x=1792605271; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qFRbQJjUmlnKmha/sV3VtEHUk/rjFLEESBDTOweph9M=;
        b=X9yccBPK4Hx/qSdHwKnbDwE4FkNjyrO6MK1PGgaGdGIRtqteftLkVz359TKOMb7Zzx
         0mMhnm4r4sED+LTRyj/j5oBNY41LErXnTqxzMAsoCcn7CccI8MoSFcQf8pKo4eLyy/N7
         7myCCN4GzfdXIZt7wY2kY8WKVo0X9pedeCLaVdcJkg2I2qxRhJ3zKJlGHWjRBKqj8BLC
         YlsnfC4+NqXb1JFpPytdo+tRR8CqIxlFMevrmzCuVGwXvtOTVYLAxJ+WpWzKo93gQzFF
         n/Ot4zQpcT8/KMfa7sLLKj+trW43SDKJ+OiHXEa/oASIWKXJA+34ywLMJnHgbnQQij6e
         Z38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000471; x=1792605271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qFRbQJjUmlnKmha/sV3VtEHUk/rjFLEESBDTOweph9M=;
        b=fjovrvC2a7faNGGxVktaOFabDMQgqfDQuhrav69CGIyIv0PIZrEl8G25pe3O57GQtq
         e83pwj5DG4lJ8vgrSCYAkj7jopbjuXBuYpjtdcSTTD7COkAPdOScc6lefetRAjnTwJYU
         FrFWpOjyoKVLP6ECKsaF0wyqGIZHcfgk9IKT6sa866O+9C1/LLjCWOZ9E/1ElpN+k9QN
         rIcp0z/rKxQHuCu2HI282MS+JlW7C8DggAoSS2bFzy9ifos9i4bkjrvSm+7TDIx/gb+j
         4GNJIsFksyJd54KsLsjtn4weHFlEUg9YSvXGAYQhDlVHpHfrD14+GBlCUCnYSmy0EAgg
         bmEw==
X-Forwarded-Encrypted: i=1; AKwUvBxJv+70FN6Fjw/XwoR1Un/9+VpychlQ7puEZv6vnVhCBly6a4TDdRN0SfueipJAlHajA3uip4bkDmg7Vv8=@vger.kernel.org
X-Gm-Message-State: AFq9FYISSM78VrD3g14Bt5xhv7/XRti6GhlbY05pIAFlXQDCvoumiY7X
	UdPKvntqIFG7LsNk8BmqSWPDIMcMMwp7jGOOGlDU9QgfoK9ouVFdgjK2EC3t49FLQOo=
X-Gm-Gg: AYBFou3OP6Wk3SntBORDER0yh+iOT8NIkgbO2UzarAw+TKwiiwa5K3GJd/fA4DHtrry
	qQVXVkVYwGbmlPKqudjcdykFnz8xyk/XR+RVmVLifgnSdBUAWRXyPSWzwX2d/ZzzBbbOX5qhGZc
	cndN/cSD2n7Zi+xH+WWUIV0bLpOrPYlbVQW0TlcoQ7cv+Mv4074MU2e7hG9uV09v7lpjdlze6xx
	M5okNFidZvCu+CEnHIe6n7IiqONK7/bvfOhZNNp5QpxGXMnK8Z6V0IjklGhewFC3x6BAvwFtf35
	rmzZSLWSnidSO4VGan83w2ZO0RqFfCVjmLU4KpqRq+aJyzqMFQ3aUJmKxgYnu1k1Cp3agNfTQMA
	SkOWyxWew604FbWoKslnSLyixXV2xaGPZ3WSrw2i2zqlwf8IDygZqakPEb8ekV7N52ZlPZ+Xoua
	ICDqqFJNMu+aQ8w85IOSXYNMoXsMDvU0wJ77DoVlo42JpFas19CSKaWXc+V/mwqtU4DNjuT4o/B
	6DflBYd2vjV99sBXsNVm6Z3exNDAVDTgM9le6DFbbReE6iZUw==
X-Received: by 2002:a05:600c:83c9:b0:4a1:70f0:ac2 with SMTP id 5b1f17b1804b1-4a18e4ce9cfmr334100795e9.24.1792000470895;
        Wed, 14 Oct 2026 10:54:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1bd986095sm8188395e9.7.2026.10.14.10.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:54:30 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 14 Oct 2026 18:54:24 +0100
Subject: [PATCH v3 03/14] media: sony-starvis2: Always program the sensor
 in window mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-media-starvis2-v3-3-c958362b5d06@raspberrypi.com>
References: <20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com>
In-Reply-To: <20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

If the requested region matched the defined active area then
the driver switched to all-pixel mode. This left the possibility
that the active area was incorrect and not reading out the area
expected.

Switch to always requesting window mode to avoid this potential
mismatch.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 3656658e18a4..c4f590c489d9 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -921,9 +921,7 @@ static int starvis2_program_window(struct starvis2 *starvis2,
 	int ret = 0;
 
 	cci_write(starvis2->cci, STARVIS2_REG_ADDMODE, 0x00, &ret);
-	cci_write(starvis2->cci, STARVIS2_REG_WINMODE,
-		  v4l2_rect_equal(crop, &imx678_active_area) ? 0x00 : 0x04,
-		  &ret);
+	cci_write(starvis2->cci, STARVIS2_REG_WINMODE, 0x04, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HST,
 		  crop->left - imx678_active_area.left, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HWIDTH, crop->width, &ret);

-- 
2.34.1

