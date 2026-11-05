Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875434;
	b=ABTmOC5Gb5Re5r/Z3nhC+03lWlIGNOrfineHQacbuzKdualOOTGbozqx1GCCYsP1yBgT
	 oOJ5m/sP8R1CMlogaBY8g54p83MrJJGw8By/kyyRM0k/SFONoX/tU1Iz2/VmuoUsP84C8
	 Y8puRWd2joST036gi+I3HO+ZcrQuziBrBxcWN5zUYl+7vWP+Lou4G0RuBBu7O4sKDxwwy
	 kkn431LoF7zm3PtlBSuzNPsdp++KE9AHWmY/BOveWx3q+VIQvjPLeasB1c6aptd3RtU13
	 74nHUhCrk0rdb9TJKqE4T4ubjDauEZ2HhZDPf5xeHr3cbt5CVDdKVB1NzOjwmadw47A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875434;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vKAKMQ4BVho2fFcjnz3XT6CSg1r7fe1rHI3g3JTlXJ4=;
	b=vc1jSvfOVhHBOrS6n38zM9c0/e3fmL46j3ZQjsB7ZNVGsqorzUf4F/WvEHoCRNTWWVgr
	 /WK+sLdRJS7/0gS+F9FZdKJ9lBgnmfNyayvrpq3L6UOeejjslIyWMRe7FlPwPEBpwSgBb
	 5OYaWXstlaLGNAa+d0uD/mfXbEQldRqD8NgWCpKtTwziITt9iKOalWBJLIll/slTAMSmB
	 ckC8+qWKGty2H5En4ksNd8RdEoxhp5D0PV8Z54GEAlPNep0W9JgsN/MXs+CMn5WemyWyj
	 zz2ILIPo+B+QXvTRtTteIwWmZL0p3/rNq9j4n2Q5rTYFGqbq2VnioP2aREUy00xZFQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AJf1DmpG;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BDD606A333
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90BDD606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AJf1DmpG
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a3c08d6928so2497817c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793875434; x=1794480234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vKAKMQ4BVho2fFcjnz3XT6CSg1r7fe1rHI3g3JTlXJ4=;
        b=AJf1DmpGYIlbnB8CmMI1UCKzRgnBQ/OJgKhmCn/AnmpuUR9ce8AFeLheZjQaqkeFXP
         Eknu+XDUEDJhaHEnl9mKuHA4PXmR6ftkTbJT4v40kqOZfAFQ82LQZ69pvd9kdIJUjtWN
         9OAwFMZa73jBi6AzHpFo+MaJJaEkdfs4JGvRmAlPvFYLOoIlo9Yk6sWooZHAnL/48FRj
         ORcK13xXSFLhWYkOFz5r/KpxfPtnfsk/0A7SsnLXw1enfvfYomk6rD/dNtZzmHE/kYGt
         twqhOYf1tVAM5ChRSGSUzziij6ggLfl9JOA19Sy5RHL2nIoVMr0niDWZK4zoGPqVxIS+
         D+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875434; x=1794480234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vKAKMQ4BVho2fFcjnz3XT6CSg1r7fe1rHI3g3JTlXJ4=;
        b=Xq8PVCt3uXoupemaTlpFJXtO45sfoevGFtGUzFfYyAM/ZFGJtWqBDWueMUKX46havA
         oOBBxeuAy8iS9+AEKZVY82m3FlDw00trt40wl7jE05C4NTNepJDzPaMYwKU1quT7JVgB
         8D3hPZNU+agrTUa4eOTZd49ZwjK0MEt/YQ0cpD6sRhFUz0nD/sLMoYXFR3hRFM+5ftHV
         bnqdnTUGHlWl8+/WzPAo2xX6AFCwjZ+fgyAMPseXUCoGO9EWRgErODv4hy4lpqrhbzH1
         q7KhBBzfCmEVWVe4HswZyVfSeci3pFS4RGeSc8QF/JKT7Q7T/gp+Yw5SazET/mqLefG9
         RW1g==
X-Forwarded-Encrypted: i=1; AKwUvByrqzc7EPAx8b414AdYyqELTptEUApHdADg3zC09uCuUrHhImvPqgKZqUvDOghEJIlOnWqljWu5lnhYyFE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9y7BIZWIVeqGiVYuvT+CmWWqayiRRDtvNpMDpEbkZ1SGFMsB7A
	/wDgg561UF80F1vuYQuueTzpNB9IJBAt8sOjbVR4CKdW60hIDkPwMm6p
X-Gm-Gg: AYBFou3aa1DQqXeTrqKOLuyRSFG+cxJD+UJgmCVv6y/ZLoR8Sr9inY6LEUPFSpkWNwc
	S+rseGbt4hZswCLW+iXk1wAjRC9B9uxFCwyjP64m43HTQeVXoqCCSDoPNhKQrRhQIQCp9EykUak
	VLgCGdcgV8O6BfjfWtiKLqKDM5czNY8FgYSjN105zzjzXfaiPtRSrS+RXE/HUe0YZ6sRxp6RCCb
	+ScqeWxL6FP5GXHW0HBJnDZXL/WPDu9Nj31pA9zgszil99bWRNcjXBjpKqDeZoufHz88fZXzR4+
	at3XGrKtlclhRbTh9q3xh0i1T3CKZ9drOlHFCt1OrUO2X2Emu6YN9/YcfSI4UR7vQJfcYHvhj+y
	2Yi+5jo+Tw6k7H0qeKWjuUjPDceZzlt7DnJEliVlGQANtWH/XSY96lbOddGf39zNDQVWUWPp9ut
	MfWTsOQpTHH4q/NorTChfpO2vpU20r8QwdGWPXRPNegakouIPAwDYWL7X9o00JOZFuhOp+Khu/Y
	ule2fnnxC77YqPnjG7+mjFB3P2YrbGvFHB8oxObfeP5jJ4EIMP/gpX4TyoZH+zCE/0MF0CbYbpn
	yLZTGQcZ7XKoAb5XGAw/OHCOu8A9VDl5KFKiaFWxcRxpmmgjeaRYEc9HsVWe+GTBc5JyMLRVd8E
	21EaV6ru39AK9SdcoVr2DgvSEmlrNbr70eVIiU3UpPoVMXFiNoqwxU3WK9cBGGtUEMg==
X-Received: by 2002:a05:7022:b0c4:b0:144:fb87:5b91 with SMTP id a92af1059eb24-1ac5e32099dmr27470535c88.44.1793875433623;
        Thu, 05 Nov 2026 02:43:53 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm15595215c88.8.2026.11.05.02.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:43:53 -0800 (PST)
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
Subject: [PATCH v2 08/10] ASoC: fsl_sai: Check regmap_read() return value in ISR
Date: Thu,  5 Nov 2026 17:42:35 +0700
Message-ID: <20261105104237.38542-9-phucduc.bui@gmail.com>
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

The IRQ is shared, so fsl_sai_isr() may run while the SAI is runtime
suspended. The regmap is then in cache-only mode, so regmap_read()
fails and xcsr is used uninitialized.

Check the return value of regmap_read() for both TCSR and RCSR, and
skip the handling of the corresponding direction on failure.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 25243b6859d6..5c50ed7c2258 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -148,7 +148,8 @@ static irqreturn_t fsl_sai_isr(int irq, void *devid)
 	mask = (FSL_SAI_FLAGS >> FSL_SAI_CSR_xIE_SHIFT) << FSL_SAI_CSR_xF_SHIFT;
 
 	/* Tx IRQ */
-	regmap_read(sai->regmap, FSL_SAI_TCSR(ofs), &xcsr);
+	if (regmap_read(sai->regmap, FSL_SAI_TCSR(ofs), &xcsr))
+		return IRQ_NONE;
 	flags = xcsr & mask;
 
 	if (flags)
@@ -179,7 +180,8 @@ static irqreturn_t fsl_sai_isr(int irq, void *devid)
 
 irq_rx:
 	/* Rx IRQ */
-	regmap_read(sai->regmap, FSL_SAI_RCSR(ofs), &xcsr);
+	if (regmap_read(sai->regmap, FSL_SAI_RCSR(ofs), &xcsr))
+		goto out;
 	flags = xcsr & mask;
 
 	if (flags)
-- 
2.43.0

