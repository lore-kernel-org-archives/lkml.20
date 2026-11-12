Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480697;
	b=R0VOVX5bgXp8XcCb/6UfIpKftbWEv7616qC/PxegdzEJ6PXcloem84gVDNvVPc2vSkQ0
	 eBGsaYSbJCeylris93Ef7baoz0aBUIcIChzGO+9F3t2Y+mD+2CNsfzzTI6vAF3DMeNgJd
	 YsZMaPSq42sdbWegddYiGR24FjOG/qOSvMue7CjIuTdvODFcQRJvhZFOoL3UGNlA6YH0C
	 bjAiunpCto5+RGFuyjs+57kCPz3+WfNZzwHfSdm1PKrciylZ9hzZJPxHpGUf4Ase4oP2X
	 gKqFdO1wICqWYyKKMLH68vPQI9Nq279+fR241BYk2rrh4r8UYa63H5mPFJwzwaYBI3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h+bOEewGQp4neyd9SSV/bwg/g3p32KtwElAVtEDUsaQ=;
	b=KUfkcYyunaDokeJd55yL1Jtih7xzIL+jYlTdjC8MYfzKX9BXTGKbtB/2ab4lnnnIYWq7
	 GMzFXlwofs3N0t0dDD9JzXfIoSTiXmeqs6+OylgXPqx1GG6virp688hpDH20I9cAloyQI
	 73KuUR/0A9SuCH6/7SXEhRSsDEvMUweQIk5Fz+L+iIDin6ROdEP7uHvwglMIqGTC9fV5b
	 XUeE9cKOVRQKBNXymz7cdLH3miuMRiRNMgYdQC/3KV74eoBPG2UC32EsxLvZlct3ePQB9
	 6WiSu34fl+Bl2jQEfx23uDCVUug8yp4z3+nMYl/mq8M2e2gDb+Jy8SU3Z7YDlrHQEWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fg59wiqe;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDE9606A898
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CDE9606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fg59wiqe
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so8142223eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794480695; x=1795085495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h+bOEewGQp4neyd9SSV/bwg/g3p32KtwElAVtEDUsaQ=;
        b=fg59wiqeg7Q0aIzVHhz4wCBDfvnFspDptttCoVNGA/TSWuXB0mOS8hPUZcT7WTbs/s
         L+X0REVw933oVMDB2gQqa36DvamtkbGjJQpE3CxVAuFjCaqX9kEfUaYXm0/0gCHOc+5Z
         eveZm3WO715MR0py8L/DfrzdUC48QMfwm9uCAXb2wc/6nI4YpvZF47t5k6T6aFVg42xo
         wgRc5E9RGZUI6CMLh+PLZELK619qB2ToDBakkheT7AcUzZYCpYzi3fVnjiXuq0jsfIgk
         blN43kKIxuD7alqaAgG8VS0Si27o5jvR0oF2ISkTbBVD96lNOgH8FpftEmYTl1OavmY+
         q8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480695; x=1795085495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h+bOEewGQp4neyd9SSV/bwg/g3p32KtwElAVtEDUsaQ=;
        b=iUpqmSt4pkYTv2+tghs5q0uiyJlMbOgitJinb6/rvGOCNFUMjTlaGjmrv534e68Xdp
         Mw29StCHJEbNvbkM/kut0qArwjn28UHr7OnWf+98bhX2bYZUPpG3aJR3bq7CB1F5RZsV
         xzv2XRmujT9erx8mMwlW8db7Wx+5tv332wp7p0riDVwPv9fUyiUW316V82u2mkDZIiBr
         I93LyYNM2FHQH9RhDZdRwvMyazT6ZyE4I1Y778Bk/Q9OujabaVoHhJ9laPX5CbICPgs6
         w8+G0jVkBpzTObjEyL+PvkrwcFeTqrXf+d2p+6xaHBEx2XwRJSE7CT/LmmS8OrYlesQ0
         sU7A==
X-Forwarded-Encrypted: i=1; AL+hErHcPOCGCXhVl98xcoc1x28BZJSO9gxbBKixVc5BIgi8UCGmkF1uqcaSbB/92ZKfCsSI+6czDIKL4ICmkXA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ec2SFSFmkB5bOvLNL+JJzDU6fQ5LvMO++a2x+FJQ2TjcLitEc
	r5+3j1DcJ5kFlK0sMVflO4Zw078I+WjcafMsDyvKzEcdHM8BM0hxjO/O
X-Gm-Gg: AYBFou3XYqAjwXVqoxTjMbM9bbQ6oONwWlCY4rnA+Y5H5AWmsp4qBnFWEOQKz4bnuwa
	yi8qk8OzrxjX25b+j2/WmTDnzKOoKUoE+jwwi8lPSr+jZNL682UEjAnNmMfxGmB/vtiPwGqd08x
	6PrYCFgvlWv0cSoafhZ3TOJTJNM2Y2AIVVdxPk1Q8Q1UGJwMA78mQnYcBrC/Mn9uHYF+73eDlkC
	tY7LlS6Ecn5LrvN8A9orFfBEhBD7DlxOES9ZjHhSqvQATHPW9rCCOgv3VfBVbHsCyXLIp9aQ5qN
	9K/e1LHA3IWR53UFWasPVkwpJOu2h0QtHeKPwVZJpYEF+KFSPEUuyXMYwcxh/uZyTHcuG9lZnXL
	myU7MZADV4aROgWPi/EcLHO530dtwGi+Lpf8QaQ4V9FFhcLlqwQ+HSd0idsWz7569VfgKN1OfvA
	FUYHYGzBhrG9hX4DTvNe1A8Yp8eDyVl13TLEmk4yQSu6f1BVjE6+gpv6KI6rmrxqmE8ihcXoxKN
	ABEPhMjj/3N5yIGWMwVRM2YBu3dWRgauMx01yTMHTAK/DhxP/67a+808ar1Nnp3iJq0huuW4zCr
	9ZWnZFV/HQOWFgre/trnffgfICPGwsp9qrbasovzAk0bTo6+RDkVVmyXwH44CKgU048f6iWO3CN
	Jsc+nO61/ygBpio9CNXLRNA7ZF5+meGnWTCDNOZvmMk4k
X-Received: by 2002:a05:693c:41d0:10b0:36e:ff7e:e57f with SMTP id 5a478bee46e88-3768617d395mr5904378eec.19.1794480695079;
        Thu, 12 Nov 2026 02:51:35 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306casm23047232eec.9.2026.11.12.02.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:51:34 -0800 (PST)
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
Subject: [PATCH 1/5] ASoC: fsl_asrc: Improve probe error handling
Date: Thu, 12 Nov 2026 17:51:12 +0700
Message-ID: <20261112105116.32274-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112105116.32274-1-phucduc.bui@gmail.com>
References: <20261112105116.32274-1-phucduc.bui@gmail.com>
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

Use dev_err_probe() when retrieving clocks to avoid logging errors
for deferred probes. Also remove redundant error messages from
the probe function when failures are already reported deeper in
the call chain.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_asrc.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index faf348dd582d..055593d5d37b 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1301,22 +1301,18 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(&pdev->dev, irq, fsl_asrc_isr, 0,
 			       dev_name(&pdev->dev), asrc);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to claim irq %u: %d\n", irq, ret);
+	if (ret)
 		return ret;
-	}
 
 	asrc->mem_clk = devm_clk_get(&pdev->dev, "mem");
-	if (IS_ERR(asrc->mem_clk)) {
-		dev_err(&pdev->dev, "failed to get mem clock\n");
-		return PTR_ERR(asrc->mem_clk);
-	}
+	if (IS_ERR(asrc->mem_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(asrc->mem_clk),
+				     "failed to get mem clock\n");
 
 	asrc->ipg_clk = devm_clk_get(&pdev->dev, "ipg");
-	if (IS_ERR(asrc->ipg_clk)) {
-		dev_err(&pdev->dev, "failed to get ipg clock\n");
-		return PTR_ERR(asrc->ipg_clk);
-	}
+	if (IS_ERR(asrc->ipg_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(asrc->ipg_clk),
+				     "failed to get ipg clock\n");
 
 	asrc->spba_clk = devm_clk_get(&pdev->dev, "spba");
 	if (IS_ERR(asrc->spba_clk))
@@ -1325,10 +1321,9 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	for (i = 0; i < ASRC_CLK_MAX_NUM; i++) {
 		sprintf(tmp, "asrck_%x", i);
 		asrc_priv->asrck_clk[i] = devm_clk_get(&pdev->dev, tmp);
-		if (IS_ERR(asrc_priv->asrck_clk[i])) {
-			dev_err(&pdev->dev, "failed to get %s clock\n", tmp);
-			return PTR_ERR(asrc_priv->asrck_clk[i]);
-		}
+		if (IS_ERR(asrc_priv->asrck_clk[i]))
+			return dev_err_probe(&pdev->dev, PTR_ERR(asrc_priv->asrck_clk[i]),
+					     "failed to get %s clock\n", tmp);
 	}
 
 	asrc_priv->soc = of_device_get_match_data(&pdev->dev);
@@ -1443,10 +1438,8 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_asrc_component,
 					      fsl_asrc_dai, ARRAY_SIZE(fsl_asrc_dai));
-	if (ret) {
-		dev_err(&pdev->dev, "failed to register ASoC DAI\n");
+	if (ret)
 		goto err_pm_get_sync;
-	}
 
 	ret = fsl_asrc_m2m_init(asrc);
 	if (ret) {
-- 
2.43.0

