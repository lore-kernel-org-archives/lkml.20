Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793351694;
	b=ulVeuGZ/G2YKznoWuO0a/WrLoQivqaueGNU1Cv03KMrCpwSZHkHiS0HlAv5aYrb2w/4J
	 T9QZhWKp4PBhucBMVW4isxIU1jrNl+u1nb4NVqBITMt97d98BrC5zeN+3TWg8PSxvqfbn
	 QWCKs4b1K+D1q7c+fTpgGypSQAHoDb85Rc0QK3DD+GPUuIKoIRh2UL38Nlx9HL1A45SKu
	 nGhxT3iF2bZ3lBsLagzWcnBcyxA7qsZTV+xPHi9AbhktZmK0Vk+ZqGPx4mPlgj/xKURs/
	 1UFxBqA3rAgZxstTuKJicy2z2hVnekr3QRcZMxPRv6NREEgxzmo3WE97u8RnxAMBdcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793351694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aTbOMPeQQR/WAw575MjV+whoOIimG2HfOgrdg3UiGjw=;
	b=UfnXeuHrHQr/T1JLByuL/feTK3b9q9FoC3y3BeI0gfTon+JrBoUM0fwISr5b0tqxmf1e
	 9Hkwddi71DWobPr+W1v+PZ2bBypsUAP0bXbPgLu3v5DDZB1i/Y5ESS0pquEVKzEf1qqzw
	 zeXnc32KeW36we6PLwj2S0KYnsUSrZy3RZ4Hg5k+zVmh3fqGokaeKkY5F9YfclwkBWtTA
	 ZBVWOvDab9Fc6DR9U1Ir7T9VxWEdCvZFQjvNcmjI35d4M3JJJ53ZPcxmvHje+Gtt6QzPY
	 SXcJzzCyPErtlUOd70RP+glde0ZJoR+0A19PQC4hv/mHUc5+Vhd4oqSmzWXP0WV/f3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gZ3JMIwS;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E879606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:14:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E879606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gZ3JMIwS
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ea759cc9b6so2234185ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793351693; x=1793956493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aTbOMPeQQR/WAw575MjV+whoOIimG2HfOgrdg3UiGjw=;
        b=gZ3JMIwStBM0KMwHxGH/IriLhO6//9sJiOxUaVBB2dHP73oy7rda/qMMrUfoqGYb4C
         f0rS73uIYXk59te7wIvSfCjqFlTAsYI432IYQZkRC/3tPpB3HXkRAOU4SpBzWNBEpsI3
         KY7gQnJSFwmPew+Cs/cDIMMaYwhGvJ33gIHYx9Gwk5PEnYQdS+oiE2AeNfrpu+htrQcF
         Mna6tDX/H/1mNu8hfAbnDIQCMUKfNYxZnA2pJ7G6c9hDc+Yxa66eEBYyHC7AD6u7+iS0
         A/Rap1usdLB598S0LRqKhjO0GkUCmVxCM1MvR8NMrvbOjW98489dxxIf/AOVLQgsAJoW
         MVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793351693; x=1793956493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aTbOMPeQQR/WAw575MjV+whoOIimG2HfOgrdg3UiGjw=;
        b=kTSMOL3LftG9nPAbwilsUrkgVK3Ya5k535gA5HCs31eSoTGc/NzBlizMgKGSG+tdCc
         Wo9++PuIRsJ3uVUne5Yjpg6cp+wE2ozR/e9b2fWsRL4H0/e6HJ6b2elcQ98+WluRxGqZ
         AmniPTkjJ5a6A1ELp8nOLrdX7sZpotcaRaR29A210sw8wBVXHUny2JOCZ0nzUFQ789E2
         YsER/jOZFWkQgYP4ttDcNcIdTpoQcpFgzvdjCPufVmRJl7jNxi0O/T/GNTUDbygLl3rr
         sVv35mWBHsbmOnNzqbkW3K5HVJvcbFcXWqoj/ISSBk/mmf20DKt0GFqN+1hSViDaL4px
         n4lQ==
X-Forwarded-Encrypted: i=1; AKwUvBwS8iO6QVC7q+49YD2hKrfR/6dyJqkLXC4dSh8ku6wZLqW3q7S93RmNgysmNeTkJnkDPNQp2SVB0924yhk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdR3XNbfT9r2i0DKWCqcHSB6DOMS3InPV2IdTnbuIz2gQP/ROV
	0anulhckHjtsmBuRbX75F3KTCr0HMGm2N/NAN+yAFZH2U4Mipqc9kqI3
X-Gm-Gg: AYBFou2euMi57cUQLso4je9iAoSmiA42ZbaYt6BSuiSZXUc9e+28a8pEVzdOscpkffT
	z8xk+iWu+Ivw38++35XWvI1QYDKN4FOOmfJ6nHWLix8XZAFh3srovTtDxzGJ+4KRF5h7oDvZ0Ac
	/7bodnW/znTwSnn/6qfbJoToGSttlFAYpzq6J9Rc0lfYQT59ZKJMrx4v80OkATgGSE0qZrQonty
	SljcHnLtQxEuuCXPXGdsRxztsbgv8fS7y3L+8p3indQZVBp3h+O1lbh6ZJ5hVIEos2/SYxuDzOD
	TJkWGfPSMV6FGd5LvpJ1CRgUq7p3u07ys9Gc9N0bUifvAm/YyUo+QuIXs8VL4XFK91mXH6NPftM
	P7AThAepa+Sat1aa4NZU+fZL2TjywmrCJMsjAzg32nFkfS2mWA4onhmc8V+oWofGYluZ+xDIXD+
	v1CT7GB6tcyJuICoAoRlXRE04Ud9tjbF4OX3A97sqESzDweFfyfAqdn33+5Hlav8/qerY0Av2lu
	MJULXDMc6xlW8mJIaTbTAhgCSZCG8k+2xcpbqacSfMnYIC9GjDYBBiJMtv89V1oHDz9SkDKXrKF
	AWMop99DBHcoBeulAiQn0vtB7CPVjhfbPGoBV5xUMfcx6InBmEAH+lmXK9cKlsDm+ti83OnyoM1
	XLnANVpVXG0rvtqQRwq/XZ011/FEEZrXnndi10j4GLvRmzQ==
X-Received: by 2002:a17:903:1ace:b0:2dd:b6e7:ac1b with SMTP id d9443c01a7336-2eb364005fcmr20273635ad.2.1793351692941;
        Fri, 30 Oct 2026 02:14:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052ec9sm4734685ad.6.2026.10.30.02.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:14:52 -0700 (PDT)
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
Subject: [PATCH 2/5] ASoC: fsl_sai: Use optional clock getter for MCLKs
Date: Fri, 30 Oct 2026 16:14:01 +0700
Message-ID: <20261030091404.18757-3-phucduc.bui@gmail.com>
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

The current code uses devm_clk_get() and sets the clock pointer
to NULL when it returns an error. However, this silently ignores
errors such as -EPROBE_DEFER, allowing the driver to continue
probing without the requested clock.

Use devm_clk_get_optional() to handle missing optional clocks
automatically, and dev_err_probe() to properly propagate other
errors, including -EPROBE_DEFER.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 042885ba415e..44a34f48a0cf 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1589,12 +1589,10 @@ static int fsl_sai_probe(struct platform_device *pdev)
 
 	for (i = 1; i < FSL_SAI_MCLK_MAX; i++) {
 		sprintf(tmp, "mclk%d", i);
-		sai->mclk_clk[i] = devm_clk_get(dev, tmp);
-		if (IS_ERR(sai->mclk_clk[i])) {
-			dev_err(dev, "failed to get mclk%d clock: %ld\n",
-					i, PTR_ERR(sai->mclk_clk[i]));
-			sai->mclk_clk[i] = NULL;
-		}
+		sai->mclk_clk[i] = devm_clk_get_optional(dev, tmp);
+		if (IS_ERR(sai->mclk_clk[i]))
+			return dev_err_probe(dev, PTR_ERR(sai->mclk_clk[i]),
+					     "failed to get mclk%d clock\n", i);
 	}
 
 	if (sai->soc_data->mclk0_is_mclk1)
-- 
2.43.0

