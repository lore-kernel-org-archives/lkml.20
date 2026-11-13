Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794546500;
	b=U/KK5PlFH4Zk4JOThyCzM4ZUL2uAp8GUAxPqnbtP+VbcAm9H6ImiH9OQM4rvjXHcoWO6
	 OxK/OPnMrehQliIDhUpwRtjF+s6wZd8fhs05H4iU9gRYDuG2BmYbF9VgVV+vdRk7AlZ5q
	 TnfGmWQa7ZvOVv+UK4NWVsweZ/n2nsOop3VQ/k5tSb5k+30y/Z/oz6rvReT6KPdzlmp3u
	 3ssfwD3fOeGl6ZYL0hRwY0ViK68crgdduUM4GQFTbipMsArPWvpkpNMlBrvU5cfQ6n+eA
	 bvFVcMNA9NNnlNYfNffA6EYjjPpQ7YmQRiUcvk83rjL+Q2wvfaR26YKDRIB3V6TchSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794546500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pldrHiOuWtpoIUL/Y3y4Fat0jR15gtvqdpka0KGtHh8=;
	b=ajqY4vg46R5Faejmoi0Ube6Zjvf9IeadljmwG/dAFRx8xOk7dCsGkBKCmhTDIkyG1z5C
	 bdnJHAHwS5NvuTGBpM2fv/XopjaX7nf2Ura2bKTDbk4R4wNPnQ1KhO3Te/Rlung2Jtjsw
	 4G4TrzA0hQ9zMJa+2+LsuNGYSsHxuxWud+69LSMKKJENWuFSgzjV4T3xGetNTowkoe61U
	 EdL0EeSVveWLnRjpTZtJtJXyhHGszN4Oep+Stec1GESJ9iWY5MVATQeNKIa+42whOxDnh
	 03WXUz8BpNPEnp5iPJN6JuDIMZ61Hb+u9+kpLIX0c3iWzqlsVqXzx/4XSQdHnIFqMeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qtJfJiAC;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E7F606A334
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07E7F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qtJfJiAC
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so907303a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794546499; x=1795151299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pldrHiOuWtpoIUL/Y3y4Fat0jR15gtvqdpka0KGtHh8=;
        b=qtJfJiACMXwqAVQXGD0f+UK/ed4OR0W99aeaxv4fnHieGIk/W7ylNtJHKzPgZPe9iM
         yK0DDUt9hxrYQXBovQZ0V+A+Y7DHGp5uW+nqEZD46ykMbRZm8ExEsose4fk3y/aF6UaK
         lkPfTykT/uMTm2HKQEyMjtx7lGCH2CI8clglUgS+9v4x8KaDw+pwOTpGI8AT39GXAjFr
         lYMXWYP/rJHc+yNmiUaa6uTJGycLzByXU2cQfKkLIb8PkAvhr0QoNKay4egoiNMr+yDw
         FPyodo4dERjylCUTf+QBgzp5DBjVZX4KAzygszsIGgW17OpTGLt61Ox9rKB0aNRwplcE
         gjeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794546499; x=1795151299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pldrHiOuWtpoIUL/Y3y4Fat0jR15gtvqdpka0KGtHh8=;
        b=VPWPFMMJPVXn1ctAeRQO3sdav/XrlGTEgFxsWhFYYyIVCo4cgiHpDp8vegYUgtUlLv
         KlP2XZ8BQjA/wcJqLb47qB6Uur1XCCfXEA+tJS+YcUs0IJV71gJFzRjatIarjjJBzIVd
         UyV8olCiSHXQFBHAM+sFL5mv18yUodbwYngbnWdx47tB8F681GB+JxF6zefm80+KR03S
         ic5aIWBC1dlzenbMCW7bfeda4goTyhr8CLpm88SGXQrM7NyajKLx9HwLgLxEmbahl1ur
         wzPLEK3Gj7ECXeTr76geZY8E5Yq9NtPbjqo2e5Ar4ELlGfo2KnqR7mpurBF2avMw9uyP
         OLdA==
X-Forwarded-Encrypted: i=1; AL+hErGK9wn4I8BlN6r1GyfUG59YvV/+Rf3jUO/UsFyFRg6nHzOn8x7d4Ddmw52258ZY84cdboXeNi6aytGfbnE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JYESEQhOKLcVblS1XCaaT2dHj6Uveunt8vm5+v7D8BMLUcquL
	2Gy7TghNRd7dd0DrQMQpjARucttNXta1w7+qQ47of3EAAH8pSxTNvE7n
X-Gm-Gg: AYBFou1YbC/NJklSP2XufAQYMZLq/2hk7XkqITPJ1QZM2PTZUcDYv0fy+TKLvbUvbLB
	m50OyMd2ToMfycmUyhnr9ECvLFrAttDZ3IEy/KP8SwfUECghwseVrDC8B0REXg+i0UjGwroo+mb
	1QGiFWJc7K+3beMsv/X70gTZrjDAB2c2DoPWz6/DeuidED6kssPDHYXCehLch1+/5wwLCLx7ojT
	mqX7gTmnVNtTOMZJGGbHKFxexujg98vdFB6UVCZyBP199ounbP0CmTEk8Q4Ytg0ke9PAqWoYdQ4
	NpOQkR+e9eG6IPlccuf6kDM9i5ANNLn3JwlwXcOOmYwqhcA1r2R2PX0s1HZYYdGQPFQy/diKEHv
	K/kdMJzSGawhJ5F1i3qDMRc9tZQ7u2ku16S2449bTJP1vgwqKtgBpR/n/xpuFNLibIoMoFyUZs7
	o9yCiwVUzfDz9ST/gcCS4u64lwbC46S6LRk+xZpcQhlaByfCqrXYfOB2VU6Htv9yjUHUC+jBDqw
	uc+abKheBqHdnvm3H1mbqR+eGAGra/ozPWw2Smy3Tb6+5bpJ36nTFRrpEGHXcvCI4hgGGj3Hey0
	ZmSrQlc7kkHgXpdZfrGcXxQ4a/S2zrZnsZKwlzI0x62lH1hgVyTEN69GCZMJBkiLI0L6KCncTjQ
	eeJywBi5qPQgWXZHHPLb/VfqPKkoYTQdk8KEUJZYfgNX3
X-Received: by 2002:a17:90b:54cb:b0:3ac:a139:1b14 with SMTP id 98e67ed59e1d1-3b1b0d39a69mr1118659a91.57.1794546499300;
        Thu, 12 Nov 2026 21:08:19 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d35525sm7643420a91.16.2026.11.12.21.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:08:18 -0800 (PST)
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
Subject: [PATCH v2 5/6] ASoC: fsl_asrc: Use devm for runtime PM cleanup
Date: Fri, 13 Nov 2026 12:07:26 +0700
Message-ID: <20261113050727.14053-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113050727.14053-1-phucduc.bui@gmail.com>
References: <20261113050727.14053-1-phucduc.bui@gmail.com>
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

Change in v2:
 - Remove fsl_asrc_runtime_suspend_action when CONFIG_PM is disabled.

 sound/soc/fsl/fsl_asrc.c | 54 +++++++++++++++++++++++++---------------
 1 file changed, 34 insertions(+), 20 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index c97f814d7358..317ce0a5c765 100644
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
@@ -1413,22 +1422,38 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 
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
-		if (ret)
-			goto err_pm_disable;
+		if (ret) {
+			devm_remove_action(&pdev->dev,
+					   fsl_asrc_runtime_suspend_action,
+					   &pdev->dev);
+			return ret;
+		}
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
@@ -1436,32 +1461,25 @@ static int fsl_asrc_probe(struct platform_device *pdev)
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
@@ -1469,10 +1487,6 @@ static void fsl_asrc_remove(struct platform_device *pdev)
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

