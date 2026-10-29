Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283527;
	b=OrOYVEhOIVO2kFcl0LW+pqlY7QKreq8e6OuXnW/cA6VhtViMfMZIBDL0jXIme12pCMm3
	 BZT7Bts3gO6BzvCPE9ikCGUkiSXwHraBZsxQ//h6f9t6guMV3b0OJYPqgBLXfLHbTU+QB
	 gzcUEX+IuFGCxAugR6tcv5lcFwODJzAp7ZBwF8BhAGVjCXQ1f3IVVawnbUIgK9DOTDZuG
	 Q6xS3c0GWCW0GbTygkmznDoyVL2Y/N7LY4YyCSHZkcT3savPUFqM2fHeVgEch1WY9B1a2
	 /dRYsLV80dNYBjYAmEESvMv+yzXjfrqlwPRncmIGI2FdXMFr0GGyxRB0txTn2yjunAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=tHlWMfT2Vn1jhxwuk47U/QSe3Sx/Rh/6scTTXAvnAJ4=;
	b=hHJSBOcsbnSsnATWdO4U5MD0aOrh/jbkHK41SHHpNA9P+eT4u0IqAhiuFXhqz2Ersxx6
	 uAjt8q9CuCkk2kDbDIF8AOqaszQDQGxnQKMn8Z7Ze8FlKoLex0TfW0Z+5F8PW09a+ztGn
	 rq2JAT0Cz/eRaH/d/kUAfco3F+hJls9cCqt8Z1ifIrrZR7HYFh9XlFneVwStHEK0anyo8
	 7rJyRwEIf1AsuMj4ZBWfCHKdrrQMZ+iNcgSbGFq7TDtcf8kq7+FNxrSWaPsLpKyzA45pE
	 KIYDSse7pPNYew4y0tqfRMloTGUoznN7MYIVVHWwayG1w0hBU/1I1oVrRXI6ap6OxXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=bWm0dQkz;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEDD60A380C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:18:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AEDD60A380C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=bWm0dQkz
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so21246195e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283525; x=1793888325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tHlWMfT2Vn1jhxwuk47U/QSe3Sx/Rh/6scTTXAvnAJ4=;
        b=bWm0dQkztkYizwWCP34VIfP1DON5PvhHEyCQatuotCAcG+azmFpZdBMZTGIYQ5fc7P
         0iEx18wENBbiDwBfY/zYvdy8/Wa4Tvkkse0kL71/K4HC1cmUysHdMIXtczIh/pmaLub2
         nWIVHUwMKFVmEV0+NClbfKESCXh/4kFQOOtU7gj3gs6xUK+GL/Mc8WfOq9Ness1cWRIH
         jVPGpGEuCAY/7gc5hTvZq/2YwccMq+noBCbfmtWmavp/hmZYyrv0Lc23mmIIeEWAeYHY
         ELNX5An6absThM2aEiXDXCzCqmDqtaHlzeprqmqHTyeywocs76/WICTqCyPTk60rxI3w
         8xow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283525; x=1793888325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHlWMfT2Vn1jhxwuk47U/QSe3Sx/Rh/6scTTXAvnAJ4=;
        b=uuVd5JNTxbUULrGFop/mSjq2NzrH7KHiLSH6ix98j91ylzaCxOwSA3zX348gqDGpwi
         yPOHeX63JrGHLJgCOQle8wlt2cK7txCqdLZIjHV+m7o9UQZTgNz2noM3PJBFeE2b0Mbg
         V03rm7zbCw42m7vBK9/h6X8IHVjaTTyYmfuY48JzO2ZN+UYg1+4At4w02effL19w36eg
         8YHFG0A02U3tAWEUJm2e36LiGqWL0pwL4S7i6cm9c84zQSSazX9IthJLohTCg91eadiY
         Ea9YkA9B1A2rgK6FMLtkw7GsM+XwuT0/tzSfJOzufk/pciMgeY3YP7IpJGyhkWaWb+8W
         eClQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2D4rJLgDiMtUnYG7l4W+ejJDlpggSVtfMs9Hx+/7onUov8xvko8JGQTsrSmu2z0YqyWy7C487iPGvDOw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSMucQyZ4wBjAw77qEJ2ZQCieBJmxA4vcjHCaFODxutIWQb2YW
	WjEvRqRA89DmoVMNyjUJNFvmxkGK+LQ3bvo2CRYFZkVS9ycHLfvo7cbF86duvZC/1k0=
X-Gm-Gg: AYBFou3o6ErJAlgH7InoKzs6ilUnbDSeMBWt8ytB/uXIdDDzc1wP03eSVV/dIhvNXP+
	fR8meM7y5vxdGuSLx6zZMAIV4tA3PqNxiIjr4o48QwcUYiT6VvaOjL7eEBvrHJneaFdnGb9oomA
	lnMfrtFvfiXo6bP/u7F/5ZH68CIsTvvAksCelPRTj92BgkB3b/zwGVTQcHREi/bu8gCv0HpkAF4
	Yiab7mtDavaYcHwPHL4CGWk8/KNbG64/jyqF85I5y/WbkeURJWhN9NFvR/4/K1Sg6OtXcxJFxB1
	lxp+RXbNnb/5fCWu9NKM3tmxLywCq6DNzcHa2eoBEUZ9ikDk42D6+bDX72It1IZhIc9WbjqvysK
	6lWN8COUo6mK9Sm2obz/Uwus6T2xy5TnV/gtAFTqZLfVkT0MNVq2mvJ7AX3d3YiE3qi3I2Nxagt
	w95BFA9lkEs4mx76mqEW/HlMa3Hn6LOqGXorkwOsDDlxqaC+hseXuQJcl56oTKSx6Sr4I4aOpc8
	bJ6wa+EJsKWAZVleSm2clxuHwl+BiaohK1aa0mqI7t458VSth+RFQ2jvDaxuDfV/QM+fYsrsvUH
	CArTa7ZTQEPO3XjVfDKgSIfBCSPx/6bkwjiAN/4Nxxcglazp3JGKrBruWnfKTM+Z1O53hHrWSpe
	jSAMx
X-Received: by 2002:a05:600c:810c:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4a967e8d6e2mr126926415e9.28.1793283525362;
        Thu, 29 Oct 2026 07:18:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:44 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:28 +0000
Subject: [PATCH v7 07/18] media: sony-starvis2: Correct the exposure range
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
Message-Id: <20261029-media-starvis2-v7-7-b33a1332fdfc@raspberrypi.com>
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
index 340f2ff0ef87..84f3978e1eda 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -62,10 +62,10 @@
 
 /* SHR internal */
 #define STARVIS2_REG_SHR		CCI_REG24_LE(0x3050)
-#define STARVIS2_SHR_MIN		8
+#define STARVIS2_SHR_MIN		4
 
 /* Exposure control */
-#define STARVIS2_EXPOSURE_MIN		2
+#define STARVIS2_EXPOSURE_MIN		1
 #define STARVIS2_EXPOSURE_STEP		1
 #define STARVIS2_EXPOSURE_DEFAULT	1000
 

-- 
2.34.1

