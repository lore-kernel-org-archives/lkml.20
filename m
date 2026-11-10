Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284606;
	b=NvXBgKEIEhgG7W1Hbaz1QUOO0Aaqz9C6u0HPif0KMsYW6OpTAa78+XkddzXRO77pjJ1S
	 aPV3zzWpbELaWnaYiN9TRwKUlJ48G0Px0QNeD2Vt0+q80aVrfOQcg+gqXK5E94e1Bvooa
	 EF0CIwA9C+Cv43UEqveyI3URgVClrnRA8FhSFL1Ys4bow3cRAlZ8A2/JPp0gpFioEsVgD
	 4PH+iwtpjc52HV8aY5W+j32XvJPgwL16QDVpssD12w9/eb0JVyA0ZiEW4OPssc9JCMIq1
	 NhAggEIlevU27N0F+iVbIw/mG4Fp9HAgzkFBstV2tiYA6bOfZryuy0Bim6w6JssGXCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=3KmBFIU1iR/HTXXXArEC7zokn13fH3rMiHXgEuMLclw=;
	b=a9qmb5ZsOonk6ar8pJPhBavrXbwaP1Ry16FC0VoWz4gLzRpUHEhASv18gno7Ri7Zkf6V
	 F/68gLbTaVqqtMO93Wc4tC+lhn662MlNJfQ8C2M7N7uGviYgA2WmAisxg5L+eEhPUfpPX
	 A33ujhuH1o30yho/Cckl08v2Eq4Od+/wCHQWq3+4U39pWT/WzJtkS5qr1yKq2PQvWFAav
	 L8UXD4DjWutiuc9/Im0AH7KwAkVhj7FxrbAFWIhXSWTZNPWdSOsS/eF8cN3MZH5nFt366
	 5P5SLPrqOqpqAOViA69XS7C8CcjyM3D2/wujbTGslx5OTRzez242u58zq734hKSEhmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=amxcvFZ+;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E68606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4E68606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=amxcvFZ+
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93f20c3aaa5so144649685a.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284605; x=1794889405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3KmBFIU1iR/HTXXXArEC7zokn13fH3rMiHXgEuMLclw=;
        b=amxcvFZ+yYIuOdKwkN2xnglpeYEzUceWfDk0sXsZWfi4Tgk7U4Y94J3BirlGkoodk3
         OtCVY1xD8ZejCQa6T+WtTSvOumR0yx4AAtVRwQavvTt9lPcJZFd626jGe9T9K3jDIO6X
         nFYv7dEA/yLCQ1KmdI/l/LAiriaD1Lu32bzp6okQ04iviXkMxdD8T5MNhThcf/l8Fg1s
         RjTYJWw5RItGLOXnfHwgS10cpdTUMMHWL5i4YLb2dpZqfuxehsMhb7AAYfekCrl/tFT0
         GpzD8rTfE48nQr6X5i2whvkK52jnEHJH/rsJErtDeMAeIJ/S/aRYLL4UPG919liPLVw5
         b/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284605; x=1794889405;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3KmBFIU1iR/HTXXXArEC7zokn13fH3rMiHXgEuMLclw=;
        b=UE0++mPU7K50HksheTQ3tnnoCZ1LDphhyQPXSjGV0RjDV0FeUYXYwoLDZe7ERHO0pj
         yUPDD1Tq2JekeJnSXcxLz+n6HBacbUnL3rhhoBYr5ZJhUA2krJ4eO/IENVdldAWn0vJ2
         +lH32bWiuETUnYHFavR6Gc8vC1u5Rws2RBpxpTpXVucOWYRf415SfNJ4fchY/m1GBn+a
         92BzC/ka1QdAztaA7niRfi7sP72z3OCPjdS0VozQ2/8niQHmKKoFX+iv5931pWA0qFDx
         EO+ATlRR3umBSHjQN0hTJ77F+8IXVx8mLKD7NWoP4B9rYDldIm8SPn6rH5uIn8d64BFL
         ZfxA==
X-Forwarded-Encrypted: i=1; AL+hErG5e3LiPUSiKRFkQqavZ1DtpBQhxWe9Sd3FEHwikqNHutoZrkoeGfIOaCH/tzg2PXOTR2XC+zHiOQbjYZc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9y50hmsDTb+KR1vGHb2NAsosUybIPBYLt2llWR/Gp7mtCCH51+
	TWKA3W8wk73Mo2B22OY323ovPevsad29hUBJVjW8Oqthr9Jdhy+FL2M=
X-Gm-Gg: AYBFou349PH4KQRifpeu3sxazBtQxqETdJRelagTDPipyILishD+ur4j73mNPJwQShb
	d6mf1mOsY0YsQKU8m2SaZZFxu5jM+3xFXr8Wrnb9a8te9QOmuqpyiXt/dmYJaTDzD+r+760YxLh
	JfgegWjNiBOeqBVHh576XzoAEEBkyHCDpfN5bsD9tHA/K2/OVbjFZ4da/D8Pu3tKqLPovdMJ5E3
	3FCaef4lfUGFu5RteAmYH17M2Ob/l3xc+5rBsJBQVlcipli+42jf6OA1yr8TlMqNOJUbgpGE5WF
	x3fkynCgJZRosEEZRVEsYBYQ1CFlZ8AP8oc83qaC4qPWso3cVNVNhB72sde+3QopZhhhyBsBjWb
	UluCpcBYwZo/9QVP7AHB2w6geuN9vWXXoSt6TWKVgExyKPaGM421PZcZhCWBWbuSuMhrhuxmVuv
	4+EHQoY0KX86ythwX3eN6WiNrJ9hCe46bnwTYkuHL3vLk03RHAWQWwkhJO1jBmk44nnm5DuSYPa
	eC6v+AfllOm1iPgK46M/ewUegVz4mr72wYD5X8/nw5upt2rAqfwS1uJUZnOxmGIlcunlJPGO0ns
	Aok9yan0WSH577lYarrCzotvaHBNqkSDCZcAMA+ywRqYlLfbm95k8KaaZJYKzGzMtDlBrRiANAh
	iMovd1o8sphx67dDGIoPJVXqR69nE04Wp0M2WK2win2N+p0qjhvPomgfAUZ7YXec6
X-Received: by 2002:a05:620a:28d6:b0:93f:35fc:5253 with SMTP id af79cd13be357-9479f34274fmr240626485a.31.1794284604776;
        Mon, 09 Nov 2026 20:23:24 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e61b8f8sm136682085a.1.2026.11.09.20.23.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 20:23:24 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2] ASoC: mediatek: mt2701: initialize IRQ dependencies before requesting it
Date: Mon,  9 Nov 2026 23:23:21 -0500
Message-ID: <179428456134.51374.1588994696516825613.mt2701-v2@gmail.com>
X-Mailer: git-send-email 2.47.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ASYS IRQ is registered before the regmap, memif arrays and clocks
are initialized. It also remains registered while remove and probe
unwind disable those clocks, allowing the handler to run without its
dependencies.

Request the IRQ after initializing handler state and successfully
resuming the device. Release it before PM and clock teardown on component
registration failure and remove. Check runtime resume errors and avoid
running clock cleanup twice if the manual resume path has already
unwound a failed clock enable.

This issue was found by our static analysis tool under development.

Fixes: 43a6a7e71063 ("ASoC: mediatek: add mt2701 platform driver implementation.")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
No hardware testing.

Changes in v2:
- Rebase onto current code.
- Replace devres actions with explicit IRQ release.
- Check resume errors and preserve CONFIG_PM-disabled unwind.

 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c |   27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
index 3c5a76591..4054083e3 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
@@ -1620,11 +1620,6 @@ static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (irq_id < 0)
 		return irq_id;
 
-	ret = devm_request_irq(dev, irq_id, mt2701_asys_isr,
-			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret)
-		return ret;
-
 	afe->regmap = syscon_node_to_regmap(dev->parent->of_node);
 	if (IS_ERR(afe->regmap)) {
 		dev_err(dev, "could not get regmap from parent\n");
@@ -1684,15 +1679,22 @@ static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (!pm_runtime_enabled(dev)) {
 		ret = mt2701_afe_runtime_resume(dev);
 		if (ret)
-			goto err_pm_disable;
+			return ret;
 	}
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		goto err_pm_disable;
+
+	ret = devm_request_irq(dev, irq_id, mt2701_asys_isr,
+			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
+	if (ret)
+		goto err_platform;
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &mtk_afe_pcm_platform,
 					      NULL, 0);
 	if (ret) {
 		dev_warn(dev, "err_platform\n");
-		goto err_platform;
+		goto err_free_irq;
 	}
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
@@ -1701,21 +1703,28 @@ static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
 					 ARRAY_SIZE(mt2701_afe_pcm_dais));
 	if (ret) {
 		dev_warn(dev, "err_dai_component\n");
-		goto err_platform;
+		goto err_free_irq;
 	}
 
 	return 0;
 
+err_free_irq:
+	devm_free_irq(dev, irq_id, afe);
 err_platform:
 	pm_runtime_put_sync(dev);
 err_pm_disable:
 	pm_runtime_disable(dev);
+	if (!pm_runtime_status_suspended(dev))
+		mt2701_afe_runtime_suspend(dev);
 
 	return ret;
 }
 
 static void mt2701_afe_pcm_dev_remove(struct platform_device *pdev)
 {
+	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
+
+	devm_free_irq(&pdev->dev, platform_get_irq_byname(pdev, "asys"), afe);
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
