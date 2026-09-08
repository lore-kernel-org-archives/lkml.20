Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48866521239
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859748; cv=none; b=lQ7swWMmmQ8Z4pTTKILspC1nQ12vjLdjiTTnSXT31JlNFhnD4c/yp1x+AiGM0nocWdogsZPOqB+G2Z2ex3lN8JtF9euvU2UV1SjG8b5BGKKx4/lAU7kvVfEb40EAsO9s0i9zTy+4k3dTJj3vJgPxXuESZw71sMjoWEHljYe9StQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859748; c=relaxed/simple;
	bh=HlGrFMsRs0IybKeXdKiG9q5NJ5arwAx2J4jsvINPDaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XydhGrKZf7xUNTwpoEtJSkaeOWhQS47zS2NRL5h6z4mmIf8s4vt5FhzHs6fMs+5/wdzjL8xwMfgkgamaYBaByhNP90YP+SyCZ4c05IR/iXhJAevcHEgWbQ0C6+s28S1BRkJX9oZp7yTFXRGAgheFR8RFTjJcGKoJWdDl9QuZxxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jOAffkoh; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jOAffkoh"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so4140257a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788859746; x=1789464546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QPg1uLKI5p/H7J2E4b3w0DPqeVInWxkk5y+GYwVR13I=;
        b=jOAffkoh1fH/84lQajs+py7zI6k4AxG2y/Z//VrT48J4H0NW6FN+3MCbucJCSjRRxe
         jj1cqvYwWLBMtEaVQHqN5ksRSsZ79ANyjRNL4f8hWH/LmcJEyF8boCHIFK479dWwRIi1
         E4sQ4zjiA9+GDBiDc8CMSxZtgff9/TmUl3Bvg3hV/GbrluEO/OaOJgWVa+igvb/hzZ/1
         e54YJFhz+HD53AU4scq79Nop3tXggZydP4u3andGBg1w3Q2qlwruj2G94vuu6vllV4GK
         IzVzpzNsJmX7uK+Sty5syiCgMAbBjPvvRvNfk9ljwsprIpqtsCtIMn9NnoARl6GrLdUj
         kcxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859746; x=1789464546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QPg1uLKI5p/H7J2E4b3w0DPqeVInWxkk5y+GYwVR13I=;
        b=T1NuoGoS5w+KuYaCB1aqdzW5m7C/4KDy4UFst67VqYMWfK3zvj0G3DH6jnOrQzP7gy
         RbyumfoI5JpDFTLtMSl6jWDyH9vURT9zDdoOQXXTAU/qf7UzoggbXbtEEbXC4fsM0ogo
         SFaWUO3nM8aitOgcR3ho3i88HRYQlZeAf9L73QPCuB3nuOTDU+ys30Evhjcwm0ldi3hT
         VSzArhgFCaNiPIgFG9C2KBoH+5ZRedNs+49GrEmqaMCDLqiGvyojDRJ2vyYh0E2XXYWp
         W3bpWC1K4acw66ibmNQ24KISjQzSDkIHiLOCQW33SUH0xAxtKJQDix6+iwJAxxzKfjoR
         i5FQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCYlM2JJkn9Wot/8JN+5GNW9cjcrt0jSlYCWA1mMZ/MtJcfR+SoqRfRqQdxJmMfI+90mqL6lOEOux6koA=@vger.kernel.org
X-Gm-Message-State: AFuF++nFfAbfirnIa+uU6X+j8DYNO6aS+xWjmf57v8h/xnFEuZ7sanSZ
	0sPJcVL2NAKzuvj0IY0ZOLVpCfqMzfU/Lr1W+wWdm8ogcv2ckKGzx7fL
X-Gm-Gg: AYBFou2rDk1Wu07T+KDQf8uMzvgQc0UmN1XlUFG/SIRiY++9BrtYhm6S8H4dz9fUV03
	bNqAt0iRo/VNdDWTbGQmhgjXyLoz0H4iVwT1bAcQjtwX2tqQqANmfNZtLtCGm7V1KHH3ybz4O6e
	AwKco+JBTQX5cmVP9SrjYHO82/kzkphBs5ZenTs9s6OW5v3TIDEuNt1UbyOWt9trc4BkEBDcf7D
	an/wSLY4jtRJFy4+NCkuuhLuAkn1OhgKip6BLvDNJZz8JjUDXltzKgyc/isBubGVQlszo2ytUvC
	aOtWy4P0yVe20nJ20dvPUg8L58JMVdZOUskvYOYKO9Ir5DuS6ur19Xqtmvk1W+r8fN7kWKWEbX7
	0uJbb0RJ8bztxvSayUDO5RLpIozf4UN6tZr7v+AAGH/d1XzjdA6BXsxjyN8eAW2Gx2fIo+P71ZP
	aPTTJjqVf2SwjaUXm/fSp0MKiY1MqofDdVQTlgxjjCHeMnuz2bqOJhz1hrHOw+5LgjKXmV85Ccj
	po0lbjK712ruNeqR9Dqja75lcL03Idv3RlyjOi1qF7Zp33IBijly3qiP3Gk7WU=
X-Received: by 2002:a17:90b:1641:b0:399:1f8b:d255 with SMTP id 98e67ed59e1d1-39b260dd3fdmr40172772a91.5.1788859746500;
        Tue, 08 Sep 2026 02:29:06 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c39227sm32109846a91.9.2026.09.08.02.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:29:06 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v6 5/6] drm/verisilicon: add DCUltraLite chip identity to HWDB
Date: Tue,  8 Sep 2026 17:28:39 +0800
Message-ID: <20260908092840.225220-6-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908092840.225220-1-a0987203069@gmail.com>
References: <20260908092840.225220-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Nuvoton MA35D1 chip contains a DCUltraLite display controller with
model number 0x0 (sic, the model name contains no number either),
revision 0x5560 and customer ID 0x305.  It has a similar register map
with DC8000, only one display output and only 32x32 cursor supported.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
Reviewed-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/gpu/drm/verisilicon/vs_hwdb.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.c b/drivers/gpu/drm/verisilicon/vs_hwdb.c
index 91524d16f7785..7d630a667a3f0 100644
--- a/drivers/gpu/drm/verisilicon/vs_hwdb.c
+++ b/drivers/gpu/drm/verisilicon/vs_hwdb.c
@@ -129,6 +129,16 @@ static struct vs_chip_identity vs_chip_identities[] = {
 		.max_cursor_size = 64,
 		.formats = &vs_formats_no_yuv444,
 	},
+	{
+		.model = 0x0,		/* DCUltraLite */
+		.revision = 0x5560,
+		.customer_id = 0x305,
+
+		.generation = VSDC_GEN_DC8000,
+		.display_count = 1,
+		.max_cursor_size = 32,
+		.formats = &vs_formats_no_yuv444,
+	},
 };
 
 int vs_fill_chip_identity(struct regmap *regs,
-- 
2.43.0

