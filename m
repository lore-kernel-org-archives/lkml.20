Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B86A5221FE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859752; cv=none; b=B2TTpDYEAjJ5Uti89wor8fYPS2kpFSlP0jBo4gpa3JR/Qy+DALIyPEdBsl4lfKwyeQliVLtnFlF4y7K9SsXg/89QpgxZO9xZbgicMHBFTkmc+/LDHhWJQR0UK69QUm1Sbo+x0tne1fQehfRct5FA4zkITA7OFpVKiDeVP6Qlyt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859752; c=relaxed/simple;
	bh=ozasnFIBA+8rSKDPSKbh/3Fbquovn2x4fV8LNqAL7Kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ESWmkR7WsRjG5Qtu3KwmpAUOLfq5rEd/Qyd4BBpPJRX8n3IuXuJ0LH24dNsD134WAFulRBoL5q31pzfl2+3XbYsMat9WP+cbuazxRK3PkynM2nS5cnP9zhIrmQsjfdSzNAb+yxpRccZs28Dgg62hoIO4pYHk7HSLzbPoE6Ze5rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ETHw8fHW; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ETHw8fHW"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso5393316a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788859750; x=1789464550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0r+H74wyT2+5oikV/msCZxyt9ampGlRBgpuDqDj2ToI=;
        b=ETHw8fHWgAjjvCO8jook7piCgyHCDX3x5uvbucHtE2q7QUKxmSyqoXp04hlCPBcIpi
         ruLuBvkEUx6JOdKGxsq5ZFJweC3Lh7ZPPCuVbJ5BnCxsE6UIbS4t77U3G3Znx74LcdyX
         UAX+VkagQ/Zw4Scnb3Td+0jGp99M0MM7eNNgizZSd+1s1c+1lYDYahAtra9LC8bkCiL+
         lhS0R/oftrF0tL7IinZ0u7+mo27UmfGkoCk0kCrZk9/L2q4PGETcO/qRJCVYesjmpKQp
         9ikJO28ushdKF66PC4vb3D/Cdtn9HdXvZoLrFG672Zkt6+TUtcOU5x21If5YE2S9m4/R
         OeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859750; x=1789464550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0r+H74wyT2+5oikV/msCZxyt9ampGlRBgpuDqDj2ToI=;
        b=QrGdyMc/QRZQYPAyhso8GZEaa2tO9bxTSroEpyYO2tp5mCtx40udHL34S7T8+O9W8E
         ZZ0wuj05OamE9UUrelZVZEeh/lKAfDHEJiP0D5EdCz6b5RARWUOyjEzZtEYkMAvkVYvH
         lddKY/nNSyzD8ar9YbtstfiXBGiuFDEEddfi5JS+hW2fnQV5hezKtgCIi36okjV7JaGK
         ZoUGwsLJVgqnlpOv3MRt0lFsVZIxPCFh/OXhdTEtlm5NB8gB9G+FCCeCn/ZYjpW1cwvh
         P4jM+/L5kaK0YpjoFEVXFXlm/kzJpfa3nwfTBfwtxCvHgNj2uQHln9jgfTFIleUPVHZD
         yJZw==
X-Forwarded-Encrypted: i=1; AKwUvBwHamlwqnbFO+87qxRqb5XTmrL11vEawQfLQtTJ87DIJc5leB0322Wi9JeSZ0B7UuC7oPuDasuLWwbo5d8=@vger.kernel.org
X-Gm-Message-State: AFuF++mpI5rKUE6S62f8qX05d8M1D/rjSDX0cNTWBPmXAgWl4Srhjz4P
	NI4s8JDGjYs0N337jDkgamrDvYgAf4faTuYqZI6trE4p0RXxLSdomK3i
X-Gm-Gg: AYBFou3q9LlluK/OnaPJEfl/+sCiNs4r6eMDj8HKRzjMQn/21P8bOaxaz4mxdHqLd2S
	FljQz4tvnSQywu5z2wassb50gysozQJgBc1b0ogGLm2dDmbtgvJ4VA8ZG353CaG7rZovsHEXU4O
	GLDRVdUZY860lgMFdX+3lPV0av6dJ8HVAkbCY3AC0PZH2Hcz2IdRV/OWEIM3/VOj3AKUidabCGy
	wcjKmahC+/uA7HOBgOYwSNpsNjK2+sx8OHUl/1HVAeC8I80v8vrUi1ycBYO/xuHDGge030/9/Oo
	+A8sxZc0526/WCYugInyv3B3GmcALug5EyYmFEPMJfwGffT3EzB4KVKaSBmy3I4GqSnbsoSW82u
	qoN0YP0y79zGDKYKn4tkO5UFeUIS2woW78rCP0B2cZakURIbQmqqKA9zWJ6iOnzJLf3y2EAP2DL
	oyCDh8U1n20Lo163oRmwZe3CIsqVQEbNz2B2E+H9yfIVOCqpWeRHOEAzjEmvCqoYEZLDqCIN/eB
	NMqkqDWeRFMVPBuX/ApGD2sWDvskHC+Jj8GYAkXCOsCnUPm7kMa
X-Received: by 2002:a17:90a:d644:b0:398:9c00:29ec with SMTP id 98e67ed59e1d1-39b26245cfcmr43975973a91.20.1788859750448;
        Tue, 08 Sep 2026 02:29:10 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c39227sm32109846a91.9.2026.09.08.02.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:29:09 -0700 (PDT)
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
Subject: [PATCH v6 6/6] drm/verisilicon: extend Kconfig to support ARCH_MA35 platforms
Date: Tue,  8 Sep 2026 17:28:40 +0800
Message-ID: <20260908092840.225220-7-a0987203069@gmail.com>
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

Add ARCH_MA35 to the platform dependencies to allow the driver to be
built for Nuvoton MA35D1.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
Reviewed-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/gpu/drm/verisilicon/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/verisilicon/Kconfig b/drivers/gpu/drm/verisilicon/Kconfig
index 7cce86ec8603c..295d246eb4b40 100644
--- a/drivers/gpu/drm/verisilicon/Kconfig
+++ b/drivers/gpu/drm/verisilicon/Kconfig
@@ -2,7 +2,7 @@
 config DRM_VERISILICON_DC
 	tristate "DRM Support for Verisilicon DC-series display controllers"
 	depends on DRM && COMMON_CLK
-	depends on RISCV || COMPILE_TEST
+	depends on RISCV || ARCH_MA35 || COMPILE_TEST
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_CLIENT_SELECTION
 	select DRM_DISPLAY_HELPER
-- 
2.43.0

