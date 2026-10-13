Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE9C5275A8
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904671; cv=none; b=ImGi9UWYUCcmSSikDrLbaYO4zM+s7TpPI3UBXQ0Xe5cCZiK2c3GkuUdnMP9Jttu/ZG27G86LeHaeX9ABI6hYU/mriG/3NG1E2NqKtuuyHXetqrxfvlWFBY9WaMHv7Duu0ubAbhZJNUxqXbhYzSEFnCnkXH4zgg77pvAubE95xuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904671; c=relaxed/simple;
	bh=im1qLCkd9e7t8MOPNta52dhL+90UuYT1AR1Q+xU89mM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xm1pXVj9/hmllUfWpVMiSrert2wQMudRVLJvcmwANk5Za9UTt4SDPMQ2SUCt4RyCvKCmx6X677idqo2FQwp1AVQqoywDBGvPAAoCWZljowYC3bpv4CtTV4ZPH3VHVzdAYdFBK6qunzRq5P5WmYkyEg46KF5W5dYc2vg/Cl7XA/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=hGe+olgM; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="hGe+olgM"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b0584ad71so1785434f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1791904667; x=1792509467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VUW4c+hNVLn5OgyTOrb0q0npP0zNlA2mWHqWkmCbh/M=;
        b=hGe+olgMNqnFG95zTf1jsNnTT7XwCV1tx8OjW1q8kY4v5iyfLLO/tTRfxGqLTbMxKY
         Q64piO9PQeg79BmvNAxPVfRWhrS4O6vSl8hGUtkTlJ5zjy380SjL3VrBsca679ZcRR8C
         mPrQKp9x7n5Ymxh3KRJG+0k0B9w8lEo3vxgHpriXVmLkhmhFf7q3Z2v2gekZSBAm1fbT
         L/sTEmack/QM5ITNIcNLm8pyMPrPxvrcwgWcKhflo16kvGl2X05B3V9p/IF0pHn2MoXG
         dtY+j5uuvlgR4Maw7g2eVgercw1YBQDinqudSwcjZCszYq5YStA6lL+soDUVXjA5Oli8
         qGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904667; x=1792509467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VUW4c+hNVLn5OgyTOrb0q0npP0zNlA2mWHqWkmCbh/M=;
        b=zR+O4SbsoVQ0vk5UAsvXTBb5qdpEwBNS6piYzVawsk546wFkKMzC14r4gNRt57YK7P
         nNiqirlG7LB9YN3KoYEog8LlYjwXMn6r7BGYuh0uY3rijxXF8Jp4xp5vhg0Oo4MY9/nd
         681jGiR6X0vt6FFlASpDX5NNBzVF0N3enYGNIIDq+Ku47lOSWawRhn2EdUUV622kMt8k
         7FMwZJDvRinTznAQbI65rB+PVU/MZRIEkdYzlIGtt46OL+XTNoXBNtOZ/4FSqC5P55zp
         FSSJBUZLsgHrSkSe7lBmroMKMSg5As8qa5uebPzmVA3b7KaIzg39Yk9tJFClF3eGm/pY
         laQQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+ripPbome5E3ken4TGxY8mrfJdPnjzZAmw6o8uT7b+rfbkbg++cgjUabGnptvYL2jMzoSuDO8GtU5+1E=@vger.kernel.org
X-Gm-Message-State: AFq9FYL205rAYX6hbSpt+e1gv2volydxd1LznIDNauX0HzQE+I6b2ft3
	MSOk5r5yD4YNRXvIB3kgohBaSWi5CIWzZCNwauQrRwAx20PQW766QbK3/M8kDsBLfpQ=
X-Gm-Gg: AYBFou2TTaUpPhnFiheWAGjiB7AFwcNpP+5KDAQQa19tcpvnQet4ugEHo3LdltnrtyS
	AWAiEFkL25nwf+dQCc2bz2lL5CUNgMuUNoVsF0YqarP6axkXfLt2TEJxDK5tAtrYMWowSKZ6H5x
	Lne885NjboShSOTnJbtKaW4v+u2v49lcglm6FZy5dN///1ywawCI3Nf4QRDyIVs0rQDmCzgAlXX
	MLq9X0NUyBn4fIbMCbhbEM9uv9IjSXPiuRjHmCvdKDdvLvV+x7n29m+7DoLa0TC5mqSqJwBQITw
	rYcuNdznSAIsg+4HT+TJobtMBw8NvlHePeNJ1XXxBXQX+yGvcNhcQHFB+irj6vzP51wCU6XcMxH
	4XqT35Wvfsmio2JEBAPbrQlXh+KRTUH8xWVun+551340q+J5WMMPr73T9+RvZ72uK+WhTO45dlw
	Iokq2glvhrCn1xDNXAOuOWHvUpJHjGDNXNKgaN2dioKpD7p0Tjdm8gGV8Wriw/D49GOB6Clfyx0
	Fx8sRRx36ItqitXzFJCufugUNPZlBY5dHbmdfYze0mARRRKkA==
X-Received: by 2002:a05:600c:1e24:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4a18e49310amr250328565e9.5.1791904667251;
        Tue, 13 Oct 2026 08:17:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaabb8sm6529743f8f.15.2026.10.13.08.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:17:46 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 13 Oct 2026 16:17:06 +0100
Subject: [PATCH v2 07/13] media: sony-starvis2: Correct the minimum
 exposure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-media-starvis2-v2-7-3670722d250a@raspberrypi.com>
References: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
In-Reply-To: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
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

Correct STARVIS2_EXPOSURE_MIN.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 2bb438d22ada..27287924915c 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -64,7 +64,7 @@
 #define STARVIS2_SHR_MIN                  8
 
 /* Exposure control */
-#define STARVIS2_EXPOSURE_MIN             2
+#define STARVIS2_EXPOSURE_MIN             1
 #define STARVIS2_EXPOSURE_STEP            1
 #define STARVIS2_EXPOSURE_DEFAULT         1000
 

-- 
2.34.1

