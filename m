Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E312D57DF5B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420123; cv=none; b=Ov0I8cDykiU355GfYC8aj/UlGoXGUB5gmUhuFpoWKJXBojzyRJSZnBQPAyz6JiR3DMszCf8Ea6ew5yEopSwqABxRsH6ObH8cNN1MPzuTzKin9ixOxoJ9ZMKAVqHSdBq/F1HgwY2wxcabPKfzw/JJdt/knR0yMdFalhG2fma+bco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420123; c=relaxed/simple;
	bh=RCqsNs2e+8AYGmYT5e19T+rWb69koyuXZVUX8H80sJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W9biCUTIcRwshEy22HkyBhUxE6iTlv+RuiT1KOXl7DdkyZD+iG18aWLHxfOEEKxdlsUXNJTe7jALmbmKaHeIoL/eemlLg4P948bxFAMHIupU/7mq/z4hJZAlSR3nJ58g6u+lYO5hKA+eghAfyksQYJRdwu726N25mpfAPAG1HmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=YK7rYfR2; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="YK7rYfR2"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c4d870d54so1388678f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792420119; x=1793024919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fh7YJniuWoE8NvvJSoW+9wn4Ws53XUac6SFJACRn/S8=;
        b=YK7rYfR2Fco/oZ+GAc86i9gSvgqamzywzm98OjKDhzwHEYvx7tW58+tbR8HrnTEpQu
         5X8UR9bol43AKLJutCfUIpHe+t89rsy6r6Dl0rDjMoLN9LCtGLNAKiXF4we5lnAj1x8z
         L9zwV+UBoXLEwh53H9iMMn+cAMIxqKW/ldCeviHvRzvU0esScIq3cORPmRWEry7avj70
         oRDT9C5CJsPvDsqo8SyY1Rpxwg+aGzjdZ9yeTtOG2TU6kxOiIioypmwsZ/As3NAqfUSv
         WFP2hf0NcypZLds2dgsXMAb7SUEoGKSpIkdfM6Tv0R43oat/KN8uWGT89tA4kqxeP1HZ
         PxiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420119; x=1793024919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fh7YJniuWoE8NvvJSoW+9wn4Ws53XUac6SFJACRn/S8=;
        b=WMVn6vAZEcssEoREpLwrp5mvk6VrnprZtFNJsaVCRi7TdxUhos+UY70+aEGzBkHlqN
         2ao6vS8KBGpVT5rkIbpJL+iQ+lbOd8ozyRNPTO5Kg0wXhf9jIe0LzhfEEWFp5herjb90
         IEBxIXhnLR6ujM1NosVLTeRmE7pNO8Lmvus7W11eTFxipfSirSC0+c37izp7iE7AU1Ze
         8/Ql75pm8YBjdiQRXf3IM8RFxL56rOPo5PDxEZENJcb/ffdzTMzf+n1Np/0l2TwkOCvU
         7PeLL46BlQda8DtdfiBvRrsTkOLObw2mxVGXvJQ8rFAjhGE5ish0KOWpxmiIjHZhv3ED
         p2zQ==
X-Forwarded-Encrypted: i=1; AKwUvBzymilQFJ+lVld1Mi4IHMDOe0eKJU/iaDdwAB8Ve4hoty2gQSeNGeusoiAoL9GbNH4JgZanB4n6iZVDUyI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKo7tyo6sgsMXNd5N5ykNJcHyQnmOWLB7VBXzOm/mubnjutTn9S
	yKWEelCVGqxKJc1Dkw36Loyz7KZGje8dPLHgVLKRtYIPYZ2TYTLEvq/stD8b0STtWvw=
X-Gm-Gg: AYBFou1UO/9eTQN2xmR101Wzsxj+qkBsWtuv2VnipFqieJ0RBrDf4SmE1Qo1zAb1E3H
	oW+vNzyZsg6ZJE8S0B4EV7/nAMrDbgfJvlk4qhjSCVtli2+sKBtvtJN6L0Rp2XKSg8w7tddoY7A
	435KLIHZ2jKzbNBP8sGLy5r+iNBqfdty5SQPS58delbtN81Hzd9xKS42SABD04B04ilfGog9/lM
	yff0AU0dT3EzM9CJly0xHSiiMH2WcGK0Pm35SDH2xMkfVqFVTGruofrVxGGn/7Yf4zd5qIqL9Fi
	FROefbt0qGl9FajHVC1jF30hkltHiaudDpTlOeKBPSBbIa+T8LMQSJdhUWvADd4zzWd1oAZwYqv
	4lxfw0MEGX0ermeBpuCAKewWOyHIW7liRaPW0b+Du5YnbnC9UOCpAo1yCJRDG5JMGWwg9dw1NdY
	xDEYMxO2dNWtcP1VVGqsgVor+BxdF3hTaG2cbZ2vZp/gO9pC/XCgb59leda6185LaqG1KEZw6m6
	ybib1F7XgKorazAH6y/NJPXLiexRwO0WGoK3RyzSUJPnPbXOCY=
X-Received: by 2002:a05:6000:1b8f:b0:487:72f:fb41 with SMTP id ffacd0b85a97d-48e07fa0e82mr11497337f8f.39.1792420118965;
        Mon, 19 Oct 2026 07:28:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm23854576f8f.2.2026.10.19.07.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:28:38 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 19 Oct 2026 15:28:21 +0100
Subject: [PATCH v5 14/16] media: sony-starvis2: Only update bits for window
 mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-media-starvis2-v5-14-eef935347ce9@raspberrypi.com>
References: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
In-Reply-To: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
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
index 8c21109b33c1..e2b161656a5c 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -88,6 +88,7 @@
 
 /* Crop */
 #define STARVIS2_REG_WINMODE		CCI_REG8(0x3018)
+#define STARVIS2_REG_WINMODE_MASK	0x0f
 #define STARVIS2_REG_PIX_HST		CCI_REG16_LE(0x303c)
 #define STARVIS2_REG_PIX_HWIDTH		CCI_REG16_LE(0x303e)
 #define STARVIS2_REG_PIX_VST		CCI_REG16_LE(0x3044)
@@ -1459,7 +1460,8 @@ static int starvis2_program_window(struct starvis2 *starvis2,
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

