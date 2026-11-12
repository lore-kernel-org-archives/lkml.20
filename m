Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480714;
	b=OqdxsLPo5YZp/CrzQLfV3qYYVBPbbKywKJbi8iBXEWhn6gtnhSImAxihl/fVfPQs4OVa
	 oZa1BRQWwR0H7KfbikVlJu1y8QnVsgwUvDYw21JMdzd7zx75eqtXavL93V1IPU4XrAyb/
	 /FoeTVvhjDczWqtTqf8jLQ1aNZmn9JzaZKn/70BnbKqVfeG2gFm1eEnrzZejfKflc8GdZ
	 2eefG6gbMT/0y2316X/ZOG3NfG+hkyNiGvgeTjWePkLlbXIwVo66ZmVurYgEQJn7cyFJX
	 Sv67bQVRlsDq3oH0AIzNB39mMqNODlYgSXBfbPgesCxbVCpVpl154tXUQStww6tLBkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A0pfUkfSu9+4b7u0lMR40b3rWHEvr3iCbrzCpdtLRdw=;
	b=Jr9LSqAvR53cfiIZjeewhbA/pn8e5vkYyzvaz+8xcqQFdt2XeHL7DuFGhcoMPYFI/TE0
	 csO5NuDVNGCO0wDXSJ5LsdURLmBIhIBPsau6/uJziG0Z8/4D8qurD5Em997WoFW5bOG+l
	 mQih6N4JttWfn8KgD4ln3gon9LdKErLxF4FVoYWRpypmf5/rDzI9UQPWuxOpuBCaUAR+H
	 7lGuh8Pk47wXqDw0oXHU/+3E4ra9o5CnXWKw2Pb2zfAnivh5FagpHW7yupZiRmT5mv/Uu
	 9DIUbKzymnl2GbBDSrv5eUPAp0uulIQwLqhUUwyICGzMTzbcQdq6xESfd3ycDX67dhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AUKvQnDF;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58890606A89F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58890606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AUKvQnDF
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3712b6d9843so4006073eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794480713; x=1795085513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A0pfUkfSu9+4b7u0lMR40b3rWHEvr3iCbrzCpdtLRdw=;
        b=AUKvQnDFpFo7qSL0nyxBNCRwtKVVPcdB98BfAreJmJ+WreD+VXcSORdynoJ0mGJyvK
         SBIwNTnKJqoxvtp/OrRmCsKEVTTmwaaGw/02Z4NGAMzIjAATeglbx2wbXR6DNBeh6sTZ
         QpmvIZQfCkbdh0Mw5ptHrhl3mYpakak6jk+FQVh3daMP/mcOZaA/Eoo4NCHkw0fUtcmn
         oFalHoO5JRoOZ4Y25jXOIB3ZN/PAgsrxzGidFt4hLWXrg8s5VIwmYVoyzjwZGhOnvO0Y
         Nw/xmq9wGf+UUl9vrqaVoJeteRP3BaukyzzH5qUsizc42ExKIYd5YvMTwpeMyihe+xXq
         TF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480713; x=1795085513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A0pfUkfSu9+4b7u0lMR40b3rWHEvr3iCbrzCpdtLRdw=;
        b=Pd8ut77sjqoAhXFToX2yawpJhSIngoODzAU8GOGfV5Tma78QI4sfgOQ9lkub4mzIV3
         cpGCPntKxGxpUh7FScoAUOk5K5uYMPsYnRh9uA9ERVMM6dHhlFLhSmwJ3JH5pe0cTBL8
         STnGGLc78KMtUCCEPU4QLLRV7rtBX+SA1GX2LhbXBw2+mmzFl+bcUa3zRck5vVqScbz3
         XhU1vKDkdfJonETcj5iXuiTFn62Prf4AnKDI5mqJzUH+Aps+Fwx7EL+SsEkGXdp+9tLb
         A8wNVAROUsajfYnnS06YSq0g3s8cla3CzCppyzDvWHxzAeBYmNPWwY7LTWryBDqCrVe4
         sN8w==
X-Forwarded-Encrypted: i=1; AL+hErFcb6aTJO9XSNHXYUzy5MLcqkBSaDV/Ley9ow0dU4OvwsiB9iyXlPt4H2n9rum3lZ6ROz1zg0H4Z87hHfs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/nGDj6rxdhj4BVW6nUnLkJcINcldSH9e1sZ+cRs3pZmBsJ0WJ
	8GLdpM1SQHIjnyOtQbh9br51WIe5b5PJP0YuI7ZVXRdrxP4DsnYajDtA
X-Gm-Gg: AYBFou2OEIOoCxYdysetAZePYBDk/JEyqPLL1zkcfZCh97doKmfldDlt58eqPZRDagQ
	/ZpT9wZqFYr1Twnrb+jfI8xxQH3B2/Q4oewI1gsjidm8nBRH6YFpuC6DtJ5nv7i2ReCYaXqCb63
	yl50YfZtJfZeCixyt20spK5RofYSvKJSnKk8vslv0dZcna3cIR/32i3RtWXnlSYPVPaLT8j5ap0
	+m3b12Eh0nJnyWTRfYxnZ3QzWqf31jBWoIGrSJVjHQ7NRnEUZd3mWUEBB0OoziRvW/LthzGkaNC
	SxUXh2qGdD6NTG8dombBFu7PQ5w4UamO0WGfxvt86o5gdUIsSu0zZ0PvyWfLpHQzgq7XPkT9dIA
	FlVhv6i01OBdYU0/UT33+YIegH0G+MgVoWPA7icUN2t+0X57iTbhXQsrOfVAt5XEIkvOix3sNMo
	/tYEnGEkdElCQEbMioMg3R8+JJ1yXfRD2ceh/kOYEGqgAfM3ckOyuVMkgldnIFSEfvQlpmq9otw
	edq2MdpI+OaxRi5AGSRpYM8HnJseVMCs+/xUJ5jdPj/IATJSsek6qvgLU4qM7b6z5qexQhN3uz1
	DQzkEzv9jyMjc7W6GHc7+eb9go6KA22nF9OIxbxyBggaR5X18BzuqmNHaE9py5kDceRHjAao6FD
	DKKW4dOg28O1T9DJYdZiIw4aCxEVVvJ5uKm2Ze9CuotMZ
X-Received: by 2002:a05:7300:d709:b0:376:37a2:87f3 with SMTP id 5a478bee46e88-37686b43109mr6989721eec.31.1794480713499;
        Thu, 12 Nov 2026 02:51:53 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306casm23047232eec.9.2026.11.12.02.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:51:53 -0800 (PST)
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
Subject: [PATCH 5/5] ASoC: fsl_asrc: Use devm for runtime PM cleanup
Date: Thu, 12 Nov 2026 17:51:16 +0700
Message-ID: <20261112105116.32274-6-phucduc.bui@gmail.com>
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

On unbind, fsl_asrc_remove() gates the clocks before devres
unregisters the component and frees the IRQ, while the component
may still be in use.

Move the cleanup to devm. The action that disables the clocks is
registered before devm_pm_runtime_enable(), so it runs last, after
runtime PM is disabled, as in fsl_asrc_remove().

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_asrc.c | 48 ++++++++++++++++++++++++----------------
 1 file changed, 29 insertions(+), 19 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index c97f814d7358..09e09164a106 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1258,6 +1258,15 @@ static int fsl_asrc_m2m_pair_resume(struct fsl_asrc_pair *pair)
 static int fsl_asrc_runtime_resume(struct device *dev);
 static int fsl_asrc_runtime_suspend(struct device *dev);
 
+/* devm action: runtime suspend the device if it is not runtime suspended yet */
+static void fsl_asrc_runtime_suspend_action(void *data)
+{
+	struct device *dev = data;
+
+	if (!pm_runtime_status_suspended(dev))
+		fsl_asrc_runtime_suspend(dev);
+}
+
 static int fsl_asrc_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -1413,22 +1422,34 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, asrc);
 	spin_lock_init(&asrc->lock);
-	pm_runtime_enable(&pdev->dev);
+
+	/*
+	 * Ensure the device is suspended after the IRQ and component
+	 * have been released.
+	 */
+	ret = devm_add_action(&pdev->dev, fsl_asrc_runtime_suspend_action,
+			      &pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
 	if (!pm_runtime_enabled(&pdev->dev)) {
 		ret = fsl_asrc_runtime_resume(&pdev->dev);
 		if (ret)
-			goto err_pm_disable;
+			return ret;
 	}
 
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret < 0)
-		goto err_pm_get_sync;
+		return ret;
 
 	ret = fsl_asrc_init(asrc);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to init asrc %d\n", ret);
 		pm_runtime_put_noidle(&pdev->dev);
-		goto err_pm_get_sync;
+		return ret;
 	}
 
 	/* Request the IRQ only once the device is initialized */
@@ -1436,32 +1457,25 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 			       dev_name(&pdev->dev), asrc);
 	if (ret) {
 		pm_runtime_put_noidle(&pdev->dev);
-		goto err_pm_get_sync;
+		return ret;
 	}
 
 	ret = pm_runtime_put_sync(&pdev->dev);
 	if (ret < 0 && ret != -ENOSYS)
-		goto err_pm_get_sync;
+		return ret;
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_asrc_component,
 					      fsl_asrc_dai, ARRAY_SIZE(fsl_asrc_dai));
 	if (ret)
-		goto err_pm_get_sync;
+		return ret;
 
 	ret = fsl_asrc_m2m_init(asrc);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to init m2m device %d\n", ret);
-		goto err_pm_get_sync;
+		return ret;
 	}
 
 	return 0;
-
-err_pm_get_sync:
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		fsl_asrc_runtime_suspend(&pdev->dev);
-err_pm_disable:
-	pm_runtime_disable(&pdev->dev);
-	return ret;
 }
 
 static void fsl_asrc_remove(struct platform_device *pdev)
@@ -1469,10 +1483,6 @@ static void fsl_asrc_remove(struct platform_device *pdev)
 	struct fsl_asrc *asrc = dev_get_drvdata(&pdev->dev);
 
 	fsl_asrc_m2m_exit(asrc);
-
-	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		fsl_asrc_runtime_suspend(&pdev->dev);
 }
 
 static int fsl_asrc_runtime_resume(struct device *dev)
-- 
2.43.0

