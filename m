Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD224E73A9
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079884; cv=none; b=sztaOv6xQ5t00/4lbTHYEHz35Ic0iouqOOGjdxoGvKEp9WJywma+OA6MBfYx+D8P39B+py+4rdqPp3/1uWgMULRHVwYyQypjBuwVtRkTmrsoV/eWWepY6nj7oUdcFDZFvdSYRny66gXa+qTQDOer3gUWxqaGPAXS5+1RMJozzdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079884; c=relaxed/simple;
	bh=UIX4CHT9uj1+8MpaUJcFHq6eB5vI9kn09zdV0fSjOOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XbR2OXYY982XM1tDpZo7PC75db+ch8iEIQ502d6nSsASgCtCFYd1Fz4JW/e9wWGFwvOARQu1DpI1Y8ViAixqq10kIcxe22IhaSeYLpenEpG/yskp5Pv6qagIy080qpSvggUPu4vn3awqU/aT/8EYo/OBb10l+fLWQwjOHKTrkGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=bLJkTPFG; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="bLJkTPFG"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48afe75f055so602057f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792079864; x=1792684664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XiaI7PJTLTIOMlYMByTXCawN4zOurtnfoVaJirCKA9Y=;
        b=bLJkTPFGtfiQizfbch0yB6R7ewB+Q0g4p/JgI5YCH+In5TQhCgUzCn45Rn7UHz8qmi
         osr/DBbI8S0uKnh996fijfBodcUsoavZLAxxMrlfEAdw/JdOf2r2m5zAVfC4PPF5QVi+
         V2DaUzCKys9YtrFYXbGKLCdYF8a1toVQgaTRN+i9TSX5ijob2pA+q88ADRHuC7e87Ub8
         Dfj2RYKt7kDLHzjiH3G8XkQa2NwM0405AgPylgV63xBzgxFjWcJ9r4zSlRfOtLDpBKYB
         g//uoUxsxzYOHAGVMHvRbkB0y63GYigMoxgsDczVG83SDttEl2JPe3YyMV29xM7Za7dF
         1u4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792079864; x=1792684664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XiaI7PJTLTIOMlYMByTXCawN4zOurtnfoVaJirCKA9Y=;
        b=qceJ7ffkesIyaRYbUgjfYtZw05vdPGrYLZcQ2LypxI1HTuAPVQMt5cc9GP2Mf0kxYS
         Xu5Mlj6bkzFJ5ABgGwHsjOXmVLw6Nj+LAkElrohWWLRAdZhyJek3dN4u9zT9+Ajo3f3N
         SBaAYTlXWcUDhT4x0Q3769rESDGN7NmN4hpjEGZ/j/qa21cyyzPSR0GRKZ4gd+p+9lR5
         7k6y+w6+0aOYijPWZRImvmu3zPcYj20/VI3unSgePua0GvnPCimMBnqrO39agTVKAiXA
         730pkUT7FPuTOkTYTBqgw4+uzlWyuYBbbW3sG4wJaxh4T+NO9JmIKR+9UaS0MHb2yhXM
         /TcQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3pCzLk36t16OhhzlAkwER8qM4tfnoGndpHeKrDtzVHHSSMxtTebf9T+VsQjnPCrJUfewoaD5Bs52YvBI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsckBnDTExveLMr9vGpeWZFxsb2e0jOSxbVRXMWDMMLdyR421x
	gWF8Yxf8E7Jzuu2kg08s5rxRyHZq7yRJYKYNDcZU7MnE55V6C8hP1x0JT06MnNFCek4=
X-Gm-Gg: AYBFou1SSYtjf8ZFe3YFc5SNLJaMyl7SMvdv4tIO6c6iq2LZZ8eDWm63y9Tu+TawAR7
	1jdYKT/M3Mx5eT6cVOUvhwYj4E78a9SOYYEisWxj5/s2NSbYsvO2KjS5EJgV46VZoELad4yqqzS
	+wjalh47oV86jLvqCBafnTzRJ5JAncUq1x0EXRqr60/cgC8Fn1ZRtShzHxU7NyVoxJ5JThn7Lbo
	vfmLB0lwfvD8knOD4PLvLjTF+f8aHgNQpXuT8RzaO0y6ogKCq5gbLA1xcpe+0LWUySbEhVV8psA
	kfxR9UctpmqYsjUWMS4p2c55WXUuAgZIlbCrTJsp9Lhu8PW1THI153nhguWsqR7rxsTnB6mNsI/
	95t229vKGY/utzORN+Kk4ktFGe1lEl9KyOxGXTNlfqpWy5lBGC0wbNDkDZXSA01eXi2z9tfhHUn
	y5ssgz9HtsirhLZWwi70zHFc48zlvKqGxPyIY4nJ/+Ey1UDRueOtoWZVS0+pB99uyWvGr/bvyoD
	kcOaTz+Wdbtd9vZOBIyh7u9oC02eLnKUxzbZ480O4dNkdMu0g==
X-Received: by 2002:a05:6000:248a:b0:48a:f354:aefe with SMTP id ffacd0b85a97d-48dbacdef01mr41734606f8f.39.1792079864318;
        Thu, 15 Oct 2026 08:57:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm19877251f8f.14.2026.10.15.08.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:57:42 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 15 Oct 2026 16:57:33 +0100
Subject: [PATCH v4 07/16] media: sony-starvis2: Correct the exposure range
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-media-starvis2-v4-7-75fcdb4163f3@raspberrypi.com>
References: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
In-Reply-To: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
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

The software reference for imx678 lists register SHR0 setting
the shutter sweep time with a valid range of 4 to (Number of
lines per frame - 1), and then gives the example of all-pixel
scan mode with VMAX=2250 and SHR0=2249 giving an integration
time of "1H + Toffset" (further defining Toffset as 0).

The driver defining STARVIS2_EXPOSURE_MIN as 2 would therefore
be contradictory, and doubles the minimum exposure achievable.
The maximum exposure is derived from STARVIS2_SHR_MIN which
is defined as 8, when the actual minimum for that register is
4.

Correct STARVIS2_EXPOSURE_MIN and STARVIS2_SHR_MIN.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 02199336010e..10f91c4b6db3 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -61,10 +61,10 @@
 
 /* SHR internal */
 #define STARVIS2_REG_SHR                  CCI_REG24_LE(0x3050)
-#define STARVIS2_SHR_MIN                  8
+#define STARVIS2_SHR_MIN                  4
 
 /* Exposure control */
-#define STARVIS2_EXPOSURE_MIN             2
+#define STARVIS2_EXPOSURE_MIN             1
 #define STARVIS2_EXPOSURE_STEP            1
 #define STARVIS2_EXPOSURE_DEFAULT         1000
 

-- 
2.34.1

