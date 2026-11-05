Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875413;
	b=S8uxEMXTxU+cPpIkjcXi5RU97D58sXLDqGhX+Sw3e5PurkpmAy5yXLML15RiHFdPusP5
	 Fo7bd1Eoqg29Kc8g7fWy5/SaHtEV3V1bsbRJgmEvCtH/U4VrATglzItBfnTn7SleTsIoH
	 zHGvjuU4BBmEIKdX0TKePcvDFc4/p6ROyUhOVU30f1OKFm8nfOAo6AiH0n8sENz17b+U4
	 0eP4wKola+g/4uDXurAuW7ZB4TCs9IFifVwmwD3QaVTfktZvlrcEL5z45fMaWmRvu/x3b
	 VWhvCYAoIZgjip8ftzGVdPaKNYHm4Q+vxYV56Llzt9weXxKPB9BH44N+jisJPHPouWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zEuTfCcCze6o8lz+tPI92UoFysg4iqRaW2ZEcUe6QAU=;
	b=HZwwK4RAjEw8e8dxQxxm5/wBGFDim5zpCuuGwRGPiLVPBm+aIag+9qKCBcGEcqFdKdUH
	 BnGVc+WF97U3rYWnReXP0dN3XvDNxxKqxlxWj9Pv3jpgAMn7ApzgXcjegxVb+UqfgK8bN
	 ZQ1EahJumFVkzEpyEY8L6Am91VqUYQDX33DosBwgSjlasbqE64+VlAKmPPkWvxW0FZBwz
	 zYk8oSjLX5WHZYcMuszTlqHS3FHN9h0TUpf6u2ky0hrIpl4xBtW0fKei00M3fEjRGIWn8
	 z/RohFlijTyemn8uG5p/iAVbd6Yvcsehw7fasXU/MO7UAWeOojKLv4RfVkZWTDlOl2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FBZNublp;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B6B606D82D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4B6B606D82D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FBZNublp
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b244fb7fffso2315753c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793875412; x=1794480212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zEuTfCcCze6o8lz+tPI92UoFysg4iqRaW2ZEcUe6QAU=;
        b=FBZNublpQhOFNRZreAGAfy1sHkxBwdm8FB1Aggl9tmdRO/B+FvbU3aUEcWl0SJD6nn
         +KgBCvhvKVEws2SC0QGaVN5Hualf3RMaxCGu4I3aGZIOjiNwxwCOJa+ioSIH1uIhBZe1
         edhhcVfartiunN86N7+WFH1HQxk5Khkv09lypQXaYYd5oyB0pr7jUUC8rjjZAROz9nHz
         4ZIcXrCmehhg049C7ANF5aLRY0zM7fvJ1EF8xWoa0kQxln6SpjRP4ib7E2S1XgXd8wWx
         wnOXhTZETTITYd8VRHDFF48IorpluFm4ZgJDCesCyCPYeIECQvXLMzRHdrNzrwyIm32y
         a4cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875412; x=1794480212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zEuTfCcCze6o8lz+tPI92UoFysg4iqRaW2ZEcUe6QAU=;
        b=Nou1FK9Qo6StvijidNZZmj3pOdzy9HtecayE6W2Z2VXNa8xEjd6afQMsJqCTeR9rAk
         RdPYXYBx60Yk0w96sXO8SW9iR4M4ejh1isPnwM70g5rKbxXJl0/1PmmESNQiRyl6bCZ0
         lEbEjettmV9zvQ4QOsAzYH48yoeoEI660IDWGFBZ593XTqAQE3Tg1b24hb2Sn8nyQ3z+
         TB/cGfxP/FqJ4bin2i86wAXxBhDx4kuW19rp8Z92Xv7VowlOfIIA/SkAq3+ZXI++ze/Q
         HqsQ5OBf7ZNUj866RVuTctVsM7DUmoCl/3piaJJQXxi95TtqK7OJ7lld0Vg1cJzmNL5Y
         huSw==
X-Forwarded-Encrypted: i=1; AKwUvBxDfCJPgrpxhiOGqwleOsFuA+RUObkqPW9INLl6UZSbh21NNuNG9MQDrfDu7vebNSES/CKvEq3V76rqEgw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gJJ1T4v73tIz9Tl2AViTCPe6zuItuIdDAH3Fxw9Jh+bD7UuQC
	JvlWck+VTXNGvyuWZsD1o/xiVeM/a2z7c9dy4+D16NjtEVp19h4rgCSb
X-Gm-Gg: AYBFou2lWSVSmnP3YzUamdLfwWtb/ZkIsHNcfWYB5F/DzA3Bt6HlJoVTOUxaxADBKFi
	KifE7fq/JvZD5cxV6C23//W+Kkw4ZvbU5lm7K23tpCVjmFyGMQsqJWXV+7H5BJ1jWhOS3x6pdJy
	+YF4/FcImVdJtGXZWXt1MJFWn/f4CiLYQW9KE4tDxXjU8tnyTeIa3W9aSLDydvqdG7SQFBBwiLj
	Bb+3Ft48BUjDGLMYuKik+mC9NqHiO9vZk+L0OXWZ4HuPeMLh5KBxc8KmQuomK+oNFlXaMXZ1bO2
	2fS1eBp1nmiZXjK7hYdg+IBzmQgdLWDioQH6U20e7dPIQmcN/vDNzvPQ3VFQx6jucV/v4eZS4j3
	sUZnemFmVWAmHPSPyi9qCoKPX2mzVfcSKfZEPd90IJNuUQfvDelkDu2f+2HAzdEASQ/yYhfURRt
	HXMSo8TLR5DXn9cFbrz7ZyBMO4Xc9ngSv8mNp8aYUyW6RBdVgdpeYicoowNnD4KKXBLcfBXQEmJ
	IuVWoQ6r5/FyUyNlxOUAsN58wo60HJq355Nq5t24FN4vmGyX5/HTIwl8jvsz/dFIZ/LBTit8Jso
	8hKv6me1MawOhfHkAfdtQOqGCXk73OlVyRes8Wn4I6WV79NKYR9XAZtoEcAqhpPYQeZpsrPGkzj
	fABkzM82F1FoDUQYJ9rNDcIGpkMjmc1xaPmwhpkkKiPlj
X-Received: by 2002:a05:7022:ea56:10b0:176:a225:e364 with SMTP id a92af1059eb24-1ac5de547afmr27758584c88.35.1793875411693;
        Thu, 05 Nov 2026 02:43:31 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm15595215c88.8.2026.11.05.02.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:43:30 -0800 (PST)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 04/10] ASoC: fsl_sai: Propagate device tree property read errors
Date: Thu,  5 Nov 2026 17:42:31 +0700
Message-ID: <20261105104237.38542-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105104237.38542-1-phucduc.bui@gmail.com>
References: <20261105104237.38542-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

Return the original error codes from of_property_read_u32_index()
instead of replacing them with -EINVAL.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 5532fab80be0..cb07e7d13132 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1495,15 +1495,15 @@ static int fsl_sai_read_dlcfg(struct fsl_sai *sai)
 		 */
 		ret = of_property_read_u32_index(np, propname, index++, &type);
 		if (ret)
-			return -EINVAL;
+			return ret;
 
 		ret = of_property_read_u32_index(np, propname, index++, &rx);
 		if (ret)
-			return -EINVAL;
+			return ret;
 
 		ret = of_property_read_u32_index(np, propname, index++, &tx);
 		if (ret)
-			return -EINVAL;
+			return ret;
 
 		if ((rx & ~soc_dl) || (tx & ~soc_dl)) {
 			dev_err(dev, "dataline cfg[%d] setting error, mask is 0x%x\n", i, soc_dl);
-- 
2.43.0

