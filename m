Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793351689;
	b=BDtp9kXrTrSvgD4TQ1WiOkIYJvcsRJV8+ReRCQ6Y8hpB/4mDFX4HU1m+yQVuNvpxaA+9
	 YItMAiZxfow1Uqn7MOy3kRquwvsvwA9n3lfChenrCVnAKmyfQZvN8XXP95Vq3rx1KIMyo
	 BSD2Ch/91jyd12qVRgAQPWSPYLX0pEjDbl+xrJVNi5+z8y8Tgu9Gv060WmbqG+cuxOonv
	 GEG3Kn8sMAIlLFK7VIRvLxi4A3Nm9c1g7WjIQBRcm7hVgRTmihHPTHKpbCl+sYXpAWGJo
	 HVempqEtYxKpeKAcNNv6oJ8qakysfRd7npVH34kXPAK2DKLT45gjRrSR/2Z5Zm0g6Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793351689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wf7nEs/6d3ZIbLvKZhlKXZqIu3RM64be+7ASwgNMPP8=;
	b=mSkAvUZrqANwhRR7wIkxE7M6XYGdKR7b/pXxV5/EOK4/UGHfCOoIdw5tmYJZn5jvtpTX
	 ZFWEB1i/fMehHCNmV7ixJkGzDC1vGjTo9jTEfDuHBUzeSbH5ita9mHM+Gr1ezvIkrCxJo
	 QMejRtN6X3x1z2JklP4UybXkqUBgiroc1iHL2ahOT1mKMo0slziClPsnWqGUlxhhybOU2
	 1vWanhb5RQIw4Os52rP4TIEGyccBxVZI9u911PDOXOpDGPCMQ6bad6s88FVGvz9v7c+Zr
	 JYZjn8wsG77yC9Cjh8MevoEL7z2Pjhw0JvT9f8/7UfGV+7VMHSjQDkJET21U1gVj9RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wkiJSYOo;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C33606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3C33606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wkiJSYOo
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e8b20a899fso3493635ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793351688; x=1793956488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wf7nEs/6d3ZIbLvKZhlKXZqIu3RM64be+7ASwgNMPP8=;
        b=wkiJSYOoYdPq26IjNGL2Ui7PYoDpx3KL8pglt9u/ZfsdS+2+XbFoga2ydGEDKIc7h+
         SWpbxTpefPfxQXniR7eeHtxvvB7v1E/PQTTS1eGRXZ9jtFH6iUCUL1i4pA5gywuxGsk4
         SEVgM98lbwIFEMjmat/w9lt7it8WqiWA4W767+ctsUSm8DL58lEURyaNCY2//KPWQQ0i
         DSg4qxFwtMUJRPl8X8KgyfZ5NTKTXkGcFllJChi5rO8oFw3TsX5jfze/jLwX+Yaxxfem
         7oPRlHCRNUhWWbhfFy7dDTZeVYASDKUy8xwgTiZOcd55W12xwq2Mbxc4PyLYfCGFB+HV
         Nauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793351688; x=1793956488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wf7nEs/6d3ZIbLvKZhlKXZqIu3RM64be+7ASwgNMPP8=;
        b=lNw1geoWEZDzUeW8HX1Pny31CFPHYUnCopLFjdwofPghCYZKoHPufJUKWdbu4JJb4S
         r8Nie1QXCARL2X+ISod/2MDfqFBAsMxevpthjYk6ks6PM1xLssbGq5F7qKWGrxF5y+uQ
         i3vuZVg8ivr0zW4vvAtxW2Qxy5fBMgm+GCGfGPhY2fRUVzY37Pf0vFkA0TyE34bvp5sd
         FW48CnLCeW9L9F5uKiG1KqZR6+mIjoSm9IGwmqHrZd+oUd3BqR/bZ1DS2F2sl4rsHiLd
         8dFKDovVIogh90IyVVye515BUbChwKv0ViU0W50rILAhqFfjJF8xeTnt1mCyAMu6U8J8
         MvEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwRxTiyr3gzsZIWQFqo6JMN1b54PFjjrwljZVhSf92ge4gQua1chDj9v3YwaCp/jvOvScxypLxyIV4h+es=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9kBtmFWOkWGui/Hx8bKgW2rzU5ChkhJIuFeOvMmZQ+YFZdNtm
	X5e7YUclnvklNjoU870Ahj4hmeFJrKAfFRbNbbs/uakTM7HtPomLl5JF
X-Gm-Gg: AYBFou3JEbdMiZV+dy1rcr5gzrf3tplmkBxM3t4wg+E41o+HqnleFEtBWciWfmXE3W9
	LcLnnyFHbVAjTWBe53RYXHLRO7dUGshzZzGjJU8F9Vp35wQoMwBdf5qFnolaCNsrKzQBwVZRR6f
	9yRsETMpceEztDtyBmr1Hps0s8jSHeedckKw0bTJxrh4cTvoLm5Y+W5k9q++KkXzDZijD6jvn6D
	fuKERAbaOwuqgjUR9I9lHt4AwIY6u8UZW2tYnw6U8Ly73+9vMA0OduULuMQ2yf+3uwoAfrfgq4y
	HjaRH4h2/Iy0twQ/vL6k7Z99fn76zp7uWD2c0988P76NO0iwKJuRzi65Nx0ryDOOzHWCd9nuqOv
	pkNsuBgMxkCs1PmcO7wHDyn3jwACu97cmScRBBQBZ4c0fzYeyAEi/sqa7idQbJhdNYJ1/X5BcpG
	0rPtkhIAnm8ls5D4sjs/Rfc8H/xC9Tr43HV33xlI83ST8Sf1ojayRsRo63sNd+jxjC8H8/3AbQC
	bvgxbv3NS0xktccbcxt6oUBe1619aQPeUgAaSlXwnRrjhwx8bNbDSG1MpljP4mGX7uplDgkmq8K
	qETn83x8JwoSrWUxyEOP6bDMavMtZw4MKloUVqWSY9eCuZUL0Cta6PZRsV9OqY+GYooe4GuyoQk
	6p5u61f5QBzZtio1sLyc8iTu2gMmYxLga7MHfmjo3O+ty
X-Received: by 2002:a17:903:32d0:b0:2ea:778e:8647 with SMTP id d9443c01a7336-2eb364f8e54mr17088025ad.59.1793351688153;
        Fri, 30 Oct 2026 02:14:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052ec9sm4734685ad.6.2026.10.30.02.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:14:47 -0700 (PDT)
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
Subject: [PATCH 1/5] ASoC: fsl_sai: Fix PM QoS cleanup on resume failure
Date: Fri, 30 Oct 2026 16:14:00 +0700
Message-ID: <20261030091404.18757-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030091404.18757-1-phucduc.bui@gmail.com>
References: <20261030091404.18757-1-phucduc.bui@gmail.com>
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

If regcache_sync() fails during runtime resume, the CPU latency
QoS request remains active even though the resume operation
failed.

Switch the regmap back to cache-only mode and remove the PM QoS
request before disabling the clocks, ensuring that the resources
enabled earlier in the resume path are properly cleaned up.

Fixes: 907e0cdebc1f ("ASoC: fsl_sai: Add pm qos cpu latency support")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index d232c8f53061..042885ba415e 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1981,7 +1981,7 @@ static int fsl_sai_runtime_resume(struct device *dev)
 
 	ret = regcache_sync(sai->regmap);
 	if (ret)
-		goto disable_rx_clk;
+		goto remove_qos;
 
 	if (sai->soc_data->mclk_with_tere && sai->mclk_direction_output)
 		regmap_update_bits(sai->regmap, FSL_SAI_TCSR(ofs),
@@ -1989,7 +1989,12 @@ static int fsl_sai_runtime_resume(struct device *dev)
 
 	return 0;
 
-disable_rx_clk:
+remove_qos:
+	regcache_cache_only(sai->regmap, true);
+
+	if (sai->soc_data->flags & PMQOS_CPU_LATENCY)
+		cpu_latency_qos_remove_request(&sai->pm_qos_req);
+
 	if (sai->mclk_streams & BIT(SNDRV_PCM_STREAM_CAPTURE))
 		clk_disable_unprepare(sai->mclk_clk[sai->mclk_id[0]]);
 disable_tx_clk:
-- 
2.43.0

