Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793727823;
	b=wHvU1qHzrrSj2uXPECSH0tl0n5gRbzGhBlPNA6dS3IZuG5MvMuNN20jnfrA4shrGrSrj
	 +QEl+W35lbVJZq2vH33CLixLxX7g2dxOVoq+RhL/Ibd2kizIwqmGkk6BgKpOIvBFL5agH
	 vP7uDvOXtzFdGPOxrMFi8lFusAa+K0Vc2fBzzq8V39FkibF9XOK6WC5gV38g1gdVpgvrD
	 70P19epFSJ/MPYnAoedfMUwu52n3dntjhFYxWehkY3ONNaoVHEvpQ3GYEVDwDaVhu59wu
	 uXjVnJOUiTvL81H3B+CHzdVyDOEZLzGkgDajay/PWs+6uu8qkHYVnWQy86qnue3nilA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793727823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uJ2wtG0TbwKE5OUp6DvJO2lAnPSHDHBXyR6Yjzaf8Mo=;
	b=1jeW1kWEIJUbtzDIyK8jPkA6n83W9oYCOCbknxylixxdbUmWOnRY8zR4cJp/j5dIvoIk
	 B69AMjJdh2K7tVDd8tfdX7Kg7jLbH5fnyw4YNN7zXRgP892yx/jnYeIYme/8dekRHYlGn
	 UXRcNGVZK74tZlYyII5tdqIv1jdXSiGKJlWeg4YdWq5mOkm53vZ3lNFbRu057lYALL3UK
	 qFsgufdCMqUJdFZ7cM2rANgmxc3vQylb3x0aXzE0cDBFgXIX8F5SQyT/jyJjWFIiDO409
	 T65wksc6snkt1KMWXGW/JIu0R4AJkP56vmIC12pzkSh5Z3CKp6TItX/dhnDs0Np/yrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fCKohBbd;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6BD606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D6BD606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fCKohBbd
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1438d9363fbso931334c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793727822; x=1794332622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uJ2wtG0TbwKE5OUp6DvJO2lAnPSHDHBXyR6Yjzaf8Mo=;
        b=fCKohBbdPAeqP6lLoXy6Pxi78e9W3W/LvK/V52Be04/jq9cSW+qYWS96LmnyXIn6gC
         8yx0KBKM33E5p4YT6rhKG7dQItCfABz8bud3SUfktDKRHsYNjCcusaNfBAFF7uToIj0u
         F/WCTqzRvW2GJ7AY7Bqqd1LxO2478diRGy9pBy7WqcbfOxXJ9snTjZSXqweSQMAq0slM
         P9H87Woc7+JDTT48LVnSKWCFNbX36l0u3IqSM8/25Y/P4oCIn4rLZAFVTO3Eb95y6nXk
         YNTUiM9y6XUd4EmdFzDZZ59uBkdFlV0nB1XDlvWEDSkV7+6p6Azu0pEOlPCnPIO3x4dL
         X6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793727822; x=1794332622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uJ2wtG0TbwKE5OUp6DvJO2lAnPSHDHBXyR6Yjzaf8Mo=;
        b=fJD5oxqvvok60yat/QOSZ94uOspkGpALO8XSOfPDWeir6ihc8B3PukmqT6YsCeQ3O+
         GaGu4Qrj7v7O/bWceeOSP6tM0j7vMAjZnNKboRa1lEfNTppKU1AiicaSH1pzUscLFbf2
         mj1UN9afsZ5XNVxoyIuIHiIdldXvAqvnLgWfW52uMHSXfFI03uA3ng1eloods7qvjrxA
         G+kqGRw0STOeeMpJcobnhI73Vp7CKdquD16ZgVP8EF0r4qGxRbxGCSz+66OgH4xlTtIv
         TFfndru9KxPrTddFUCDHZIPQkFcGVGIRSqCNvrK0Mcxhqcbt9uy3hgMY/Q5iUr3E09c2
         LnbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxX1t5fGRLNTpjilwsGiWPoRozrEBWD8OVTOicpBTjHqU6iI6rxdbMpwywCCbHNrNgrlAFB/GWpav7UQk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0tNeUsvYlNHO9KHZ+jYmyOxQJpuLVfloq8JOvr33Wug1TyNjt
	IBhKHaaS6F5dXFS8Qr2qoTNpzma2h2GZXugb77mjDlADAxygPEqc5mXQBTSBI56Pgg==
X-Gm-Gg: AYBFou1L9BUkOhuSWLHeBPgddiBXpnFqDNxIL2Rv6P/PQs4Cm3MGoRuJIh/p5WHIx0i
	d0LfPth7KEa+fRv3tdzFniDQ6wyep+o+y+rC8G7Zh8F6GTXNcXWO3og49aHS+48d7ufSAS/A8Z9
	pSYj8I3smJvcVcyONOdHGaZec1NaV5CcbuJP9VOfCJctPyByOSZiJqhCgWmoIMcMoSXbuhViGB2
	fjmar1bVQ/qb04cgCu/9VOrmFqPbLZs1dZZsJFUrnQJ6K97I9N0SxzF0PaBZTDiZUqosRMzj4Dn
	kRI4snOzaWNMitvzu1aCBoL+rMriUuv4PxiMM0Pv0bF98ilFmxJ1pDJGE4L2C1/UIH+QfqrwdUH
	GPf5JFY9VfiYWhrrIAIorv9lBy5QkhqEoCPC5IBkDLB6kqk+kciRW0KRACgmKmIrU8vrM7JZWLA
	uXYwuB/QM0TFl1zDqvxwgoJBRUy4tU/HyzRa6fxBxHEazOiZz7vcYh4wb0VvCaRufiU/tRaXLrn
	0joRqBAYwH9aHenNu0uNAp37JhyVmjyAvD8SWReNkHYPD6zfeJZ6cLzWqjF+4aXEClUuy7K5cLY
	v1WlH+kfLZcs1MRV9HMWCzlymVINA1agrrxjhH51LaWN5dj2WG5LBFz1dj04GbOjK4t/
X-Received: by 2002:a05:701b:230f:b0:1ab:9742:e860 with SMTP id a92af1059eb24-1ab9742e8e8mr19731281c88.20.1793727821880;
        Tue, 03 Nov 2026 09:43:41 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a995:4c32:db66:d000])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1bcedsm420380c88.7.2026.11.03.09.43.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 09:43:40 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] ASoC: fsl: pcm030: release the platform node reference
Date: Wed,  4 Nov 2026 01:43:33 +0800
Message-ID: <rc-review-20261103-07-1337c123a4ea@gmail.com>
X-Mailer: git-send-email 2.50.1
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

pcm030_fabric_probe() gets a platform node reference and shares it
between two DAI links. Neither probe failures nor card removal
release this reference. The links borrow the node; assigning the
pointer twice does not acquire another reference.

Register a managed put action after acquiring the node. This covers
later probe failures and releases the reference after the card and
codec are unregistered on unbind. If registering the action fails,
the reset variant releases the reference immediately.

Fixes: 084011615c1c ("ASoC: fsl: pcm030-audio-fabric use snd_soc_register_card")
Assisted-by: LLM
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261102 (2637bdec0535).
Compile-tested: powerpc, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
CONFIG_SND_MPC52xx_SOC_PCM030=m.
Baseline and patched target objects built from this exact base.
No full kernel/module-link, hardware or runtime test was performed.
AI assistance: Codex (LLM) for ownership analysis, code and changelog.

 sound/soc/fsl/pcm030-audio-fabric.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/fsl/pcm030-audio-fabric.c b/sound/soc/fsl/pcm030-audio-fabric.c
index a7a5dba83a2f..64d9f7e34611 100644
--- a/sound/soc/fsl/pcm030-audio-fabric.c
+++ b/sound/soc/fsl/pcm030-audio-fabric.c
@@ -50,6 +50,11 @@ static struct snd_soc_card pcm030_card = {
 	.num_links = ARRAY_SIZE(pcm030_fabric_dai),
 };
 
+static void pcm030_put_platform_node(void *data)
+{
+	of_node_put(data);
+}
+
 static int pcm030_fabric_probe(struct platform_device *op)
 {
 	struct device_node *np = op->dev.of_node;
@@ -78,6 +83,11 @@ static int pcm030_fabric_probe(struct platform_device *op)
 		return -ENODEV;
 	}
 
+	ret = devm_add_action_or_reset(&op->dev, pcm030_put_platform_node,
+				       platform_np);
+	if (ret)
+		return ret;
+
 	for_each_card_prelinks(card, i, dai_link)
 		dai_link->platforms->of_node = platform_np;
 

base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
