Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283533;
	b=We4N96//lSW2cVPMRZ6hQjd5NBjGqy+RHhNB3wkHQwgx8wkPPNE81YfmQESNPVbhZvUP
	 5tekTThhrCnDrgGtyRD+63ApygeNsJ9HoyobZj+glwhc0wPkFdQYgZYqWQC6XpuNMVm+p
	 HLMTO+B2MIALjE9aWoaO+39Jfml99Wn9Wap1abfPaotdFexPr/drQZzmCB18zkmkjMbGB
	 jangU8dj3rcaaFmxMDd5zubop7zljRShv9dg6QcKypJe/qsWCFpraWnzUbJYSaSy4vBLg
	 9WBPfTyUFUPRrl4J9LLDfSOw9xfHcbR533mxTRpoXwRk6SwF0ubz+asznW//71iYyCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=djTWxpT1ovKkbA0vbSvCTa6GvH4LLAvCDTO8fermq8s=;
	b=XaK3Ev4nrbjfkn35FmOykfbxyUwvfTp6X3apfjxVK6mNShgmOqZHVlbNTiRaTeVd4hkQ
	 PxdE68urQZbPhHnWjjBzPyuyMTHoNsLaOhfmWK2KaCV4wBW5N5VpvEOZXmFzWj103OwTJ
	 ej8KF7fwnUa541dE4ICP86glPzBNXUWNVVtyETErmERDaiGVyCegkZFJ+p9+fLIAKnC9o
	 FAoxt81pKoczqTgIOA9aNVrvMPUSPqNVnDAH5yiVlT8QhG8yb7Nw5nw2c2Gh5ZBN30r8+
	 ZH9GDY1zGMXJ4cNeTI5NI8U8noYGcJQFBDzrhIIbogupU9gyTXWnnH36F6f4GqFPyzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=QhnmnWsU;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B29606B6FF
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55B29606B6FF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=QhnmnWsU
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so4099725e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283532; x=1793888332; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=djTWxpT1ovKkbA0vbSvCTa6GvH4LLAvCDTO8fermq8s=;
        b=QhnmnWsUnRd5bHwtpI5KZOuYEAr3vXbrhyKeTMDPR0RR2Bb/SXnIyYtlgk3WZqHwFz
         brsf+OiECI4jf1kP3Lwmuy0QHAyQ6ityEuPefx/O7cx2C+sZh5CXhRYHDV1ZuCciE2Jl
         yObJ/XsNaFN4rPUDOP/Ft5HXC0jL92cfkWctTm/pnX6Z07FN4777+PCTpm2rh2VGqiV7
         KfEVlcHcoAjBoWrFfU9OsFkTScGslUgkBpRCn5gj2gr0gD34atCUcL1SyM1zncqgjNvS
         uX3N0w5FVggMYTU4xf24bSvkP9KLwlAvAtpPVRucZmzZmmVvT+5t7zAdpJYLMXEH0qOl
         ut8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283532; x=1793888332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=djTWxpT1ovKkbA0vbSvCTa6GvH4LLAvCDTO8fermq8s=;
        b=CiZvaot2x0ylYDoJFH3CahyvoHLrzr711Xw+ZV0UWB3qL52LX0/EL4nRCPvyP3B6Gw
         5j5t2CV5GP+9577DTuRIi6mBO+OdEcH0TKkBwtnwrHU00dGZTyft7W77J4DA+CNiIBwn
         L40PhmcmhJB6PkSh7C9D+hBLZ9IHNECivvBp9vzIDrZbVj8qh+V675G3S7y+j0xzqpct
         N8xY3H3EIDFdprpCjB+iGJcGhgwYigE5hDGwj+i+F5FkfP6Ve77No4CeRtsUKf6y8yqn
         46ATfz5U6iZAWjzNWxcyN7rWcDOPh/0jkOKjUkJFv9m0T4lWy1Xw5gMAZEiZRGu3GQhl
         H6Kg==
X-Forwarded-Encrypted: i=1; AKwUvBxVWrUqsicPqAEYQ9n62D6Vyl9wNF1dDR7ymZcgF/jxdezH/vVLi6h8pTfk35CwFAksgZTCoV+EIe6Llqw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQVJX27ApLE77MKD5xS8nacHjXaUKVfXJajXi3ghIwXOGtRcir
	4G0XYq4G7bewzKnLV7dDwQB25fOJ6dLXZpBOQIdor+e+MajCD1zo1WTJn+gnJ9UMR3Y=
X-Gm-Gg: AYBFou0RajZaZNnQ4V0WrVfti3xXW/fYHrfgGjE0okt3rxasKdw1OSEAJO445aGaZsQ
	E0a0D+0+24PaRPR2cf8SiY559hmSZW2HA0YR6zqR5WO4FeSD/hCwVKBdxcVaoarppvnGymzS7sY
	r4n3DOETFMcb83LHuwFAXpsIg21dGOfpY6Nct45Yolpm2rzlS52SeE27V60Rz6qBtIF4mIk413A
	cKr+pXWg3ELcAmVwugJLmvtm/X80llbfFfdqdJcGn/nuIGPVuQDFGVfL1btPDAqk9Ry+BG9uA6c
	7cs2ulR3GZpb4zLb/E1Evb1Q9RUrNjgx4ZWkeqj5Ysk3EBEoab7+Xfk636x0rRpuTjkRsqwmxdv
	KD4V+bEuiFRQ3qNmI9zIEMX6Ug4I9KPjw0m/jHwacg0TvkJhY/Ku63qyyGbrk9p4HmFVVgWSfr4
	WS9D0+vtV46pMmAYMFGE4GmriuGapj0eDmX02U7sYKoIWFs2J9W9ZBc0/+PQALnVmX5sngU12DV
	jgY7iiqc8ItIYS08txDkMLkGFJEcUUhlRUj3CLBIiAcHRprLHjfFDEZNIuRRY8wPWipkvtJrUTv
	vEyd3KJOKL3n9hHh6l27tvwZyfVxWCc7FRL2rexVL4BC/8WDbvrhZhhDLSZgJK9LsfaN4Yf2H38
	Dt/9QBJ+/S6hREdEgwabdvKFBjg==
X-Received: by 2002:a05:600c:8b08:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4aa86a42502mr68687295e9.4.1793283531711;
        Thu, 29 Oct 2026 07:18:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:51 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:35 +0000
Subject: [PATCH v7 14/18] media: sony-starvis2: Only update bits for window
 mode
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
Message-Id: <20261029-media-starvis2-v7-14-b33a1332fdfc@raspberrypi.com>
References: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
In-Reply-To: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
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

IMX585 requires bit 4 of the WINMODE register (0x3018) to be
set, whilst the bottom nibble selects between all-pixel and
window mode.

Switch to using cci_update_bits so that only the bottom nibble
is updated, thereby working on all supported Starvis2 sensors.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 645417cc08fb..e64d943369b1 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -89,6 +89,7 @@
 
 /* Crop */
 #define STARVIS2_REG_WINMODE		CCI_REG8(0x3018)
+#define STARVIS2_REG_WINMODE_MASK	0x0f
 #define STARVIS2_REG_PIX_HST		CCI_REG16_LE(0x303c)
 #define STARVIS2_REG_PIX_HWIDTH		CCI_REG16_LE(0x303e)
 #define STARVIS2_REG_PIX_VST		CCI_REG16_LE(0x3044)
@@ -1460,7 +1461,8 @@ static int starvis2_program_window(struct starvis2 *starvis2,
 	int ret = 0;
 
 	cci_write(starvis2->cci, STARVIS2_REG_ADDMODE, 0x00, &ret);
-	cci_write(starvis2->cci, STARVIS2_REG_WINMODE, 0x04, &ret);
+	cci_update_bits(starvis2->cci, STARVIS2_REG_WINMODE,
+			STARVIS2_REG_WINMODE_MASK, 0x04, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HST,
 		  crop->left - starvis2->variant->active_area.left, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HWIDTH, crop->width, &ret);

-- 
2.34.1

