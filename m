Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794546487;
	b=plzRzOesIMorHJW8BGpDUrp/SBxjgZtmeewaFvKzV/rHZRVxsT56EPk0KqnbgHohm9LM
	 c0bBXDWEOd5uAfM3qSyHb/tuXk8klHZxU8i1oLp7Ob7oOEsecB2z8gUyZAOqqudWIpYUg
	 cVJj7glrL3J8+TFX+eyHVkGRFcXOMxs8PzsUbHJSz81go+yZJ99g1HOS4bFklt/jAEZml
	 c3/NcpHxR9pa9WkMm6/KpvhzWbw04C9xJB3uKQMzARIUlozCM5tN31Bkd+aYN6lcUKWh0
	 +2D3U5PwE3K4/xsfW5qumRa5KcwJ1a/5qccErKxaKNy9soxoiLPcPnT0aZfw/Ig6LTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794546487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mLcphuAq8INaoOM32yO8l0pyjtB9IUjLkKU7NMxP4hU=;
	b=lSRXmqi+QEYh5r6QBSaUkxP8V1Ps99sDvVJHusz/FKr2sF1vb5vEtJWdISxrV7+EfCCl
	 RzjoJMvWULo9U21a7iSXwwCuvhdJvbipVhXjpAf/P48YI1nqK+LiNmcDoiELuXkVNmc10
	 z9F2IMSVZuhL3pblfxr/VCKWtREn5+mo+poOjrbdFaNcefMq+BL8jilOWVKax1mddfovR
	 nJMvo6435bxdV1FclaU1rasub3LOhNuqSTFcZmJ63fCcSDrOk+BmNnsX4q2BxTEwFkz0p
	 y/ehX5CgPX97SW+Ls23dES440zuzJGWO5JOuykt3JaV+ZRaoUKJ6AYbsAp+OB9SCxag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TYZQnVgG;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380AA606A336
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 380AA606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TYZQnVgG
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so240551a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794546486; x=1795151286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mLcphuAq8INaoOM32yO8l0pyjtB9IUjLkKU7NMxP4hU=;
        b=TYZQnVgGFdUGE/rEwphKnUZ1sBmxrbV9gvDMkPOyqq/iSsKuT1Gf8nH8qyScl5hXHQ
         M2oMx3lR8VPEPMXpOCeLOc0T3r0nsRWPJeyCTKdWMtV8WOMJIIrAI9H6h8Hnome6DPh5
         idNBFmj9tJCwDwlWQ3lOTDNsawtuY0Vl6UvXnTHY889ucUhtge59pfB4BJolwkH02zvM
         qqTnE2i1KR1mEqJckJCNLOJUkOMjGPAU72m0QSiwIoWZ+VtZS2Rnucz/I0fcDkYtnnJT
         mF4Ikr4yASc80/xEqhmwDcBuEVDWycFL5Nw6aJzmFpAD3/I8+DiP/qXEBSokZ5kjGHeq
         VcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794546486; x=1795151286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mLcphuAq8INaoOM32yO8l0pyjtB9IUjLkKU7NMxP4hU=;
        b=EY24JKytsUM5Gw+3EJtux6UncT6aAqrN+iD3l/QWD5lMTX2Ih43fsqPx5QEJb1Ocd/
         NebGsZ3Q29zOf8EbAUXj39XLrTJSguwnY/CtCWbXVFfZ5p2MDivQUOY7wnRz+drpFLlR
         kK15pCygR8Tmb3LTEBwNi6sUXz5AEBHIVp+zr85WUg7FQcynt9wGGpUioOwLTnjsPuNr
         XRJpzFLj+v1MI57Lf4CmlG1hpdOy2S/9+X+eT9BCT0m/3Q6O8MwE3N1Yrr2yDeM7uQxh
         nC0Aj6MtWfCMdVBwyZHj8OIOda70zyKAWSGL1GFGeEc5oPEgtH+wRqRafNoBrV2s/uFd
         HfOQ==
X-Forwarded-Encrypted: i=1; AL+hErF1eWDQJuBuPUxY9LHo7kYDRcB4ZgCpZZEOLFCE0itibJ3sVcwoMlecPboRk/FEQP97dYmTB/ydvFAwebU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fpQFN2qCt6JHcTEHaR6MRHenHe6WoUoHiDOVp6YZ2EcXfLcj4
	JmY07upItAq7+SOCLWS3Q2sAei3NTnicIq2ZDgN+OdVRuJZAMi2FilIu
X-Gm-Gg: AYBFou2ihQFjtbKVg1SK4ksKN0Ex7l1h1/gsLfXzOAdCQh5xeEKvDhy8kOV864nlPiu
	eRrhH5a+sSBU0T0jMnwDWtYGHgB87E+QKPpgXFw3UYrr00UDzwqhVGub5dR/GhNKYVcQlDqG3RH
	RusvhaIgdF9RlQC4OHBA5GmeZ7CT4lXUSKBYx169BysITmym32PulF3eU87kUTMmOjog5ApC8wU
	dLZbxGXk3r4BipJsk8mHZsC8BcNrGlF1rX15g/O1RjZDAWGHYAm59nCNH/s88q/2vqGdB+eBAGT
	F8/gdp4dgK7fDRYiiTjwpVGFptMxIn3yo1L0Ft/w4EWA3bQvVC5NRAHiVvoMnlfW42gDmSnWvLI
	EuEzdnsxsTDeEKHwcDMOFfJzjgJ+4CsBhGywrmuSTBqaOBz23UrzbcxAtylHEnAChZGl0Cc+FEG
	/Rk04+4mexA403w1oaGlFcpsDNemIPQsGxdSkh5eNs/eJBmoYvEBKqbWsUUtMCtzrinMi8Osib5
	2zPDi7MVG/MCY7KdCH2n/AiYq+nBciTV+MPpQ8exn74/NrY3p+DLN4hVYCuDvwobGZu12ghi5Ma
	mh/xPGadAxuFYbr8rOKqbRyew5xNAXQqdnsH9XXDjKMcP9t4aA6EAPXmn3qLZjYJOTzUkRbWUrd
	+s9+6ZDhC9cMEsYmjdvZ1VASIMofY1iFjZ5XL6brlN15lyQ==
X-Received: by 2002:a17:90b:498f:b0:3b1:4018:bfdd with SMTP id 98e67ed59e1d1-3b1b07e8596mr968719a91.7.1794546486377;
        Thu, 12 Nov 2026 21:08:06 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d35525sm7643420a91.16.2026.11.12.21.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:08:05 -0800 (PST)
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
Subject: [PATCH v2 2/6] ASoC: fsl_asrc: Fix handling of deferred spba clock
Date: Fri, 13 Nov 2026 12:07:23 +0700
Message-ID: <20261113050727.14053-3-phucduc.bui@gmail.com>
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

The current device tree binding does not describe the spba clock
as optional. However, the driver currently continues probing when
devm_clk_get() returns an error.

Return -EPROBE_DEFER when the clock provider is not ready, allowing
the driver to retry probing later. Preserve the existing behavior
for other errors.

Fixes: 13b8a97a760e ("ASoC: fsl_asrc: spba clock is needed by asrc device")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_asrc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 055593d5d37b..c91ffb5e0c5e 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1315,8 +1315,11 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 				     "failed to get ipg clock\n");
 
 	asrc->spba_clk = devm_clk_get(&pdev->dev, "spba");
-	if (IS_ERR(asrc->spba_clk))
+	if (IS_ERR(asrc->spba_clk)) {
+		if (PTR_ERR(asrc->spba_clk) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
 		dev_warn(&pdev->dev, "failed to get spba clock\n");
+	}
 
 	for (i = 0; i < ASRC_CLK_MAX_NUM; i++) {
 		sprintf(tmp, "asrck_%x", i);
-- 
2.43.0

