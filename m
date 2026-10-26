Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793012348;
	b=gCElLzJKrCRBhQgheE5d67eLlS2HNPamAmd7XZ3VsetrDMxR4N4Q9DqzR3JwnuFOQO4u
	 +rQu69nhyUkdzq0aleoD/+eBXI3D5c9JWR8Q/XPVW62oFSZdH+aeygC2exi1jEPxYTsHL
	 iNYgTluqGhgUHGJSXI/PExPP/k4wbfNMoz3w0X51DjQeA1c28kzVtzYTfQi47/p4JBpp2
	 QIXURs41s41NaLRWKxxsOw+pk2G3OGW/oNEAOG7V5W9K8OJqLsD6QbWc9y+MVHbF4t9/z
	 Fc5r0ORdJd/7SppfjOTMnnR5OTbgSiOQvCB1hR1t65HW6kC5tjWSY3sUtsENwI6bR5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793012348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HUmBumVayD42JJx8Pn2z4JOh+RWoCbU1b4kR9Va06PU=;
	b=No1zLDGiRMhEHW7B0hqC0jB1IIERJptpGUCY7gbS0HI5pJu+ml0LUIyjemg5M+DeUMSS
	 cNooSSbDvycVirZ+hUo1J+NKIqdIM8ZbdwSUAs3n7HlLGDboNzDa5BdAI8GYcy8G/Yw6b
	 OeReU7UOHZLE+uFz8nsXfvaQ7XyoQWNGRsys4AV3JIB3dVmrZmIi6O1HMLVGF/yrM/Oua
	 bOANc9MdnlGM5d9rodBXOj/kUEd3Ixi/toPXQ39Elu+nlExXn7rXjA6TMQdO/ljRjAjsl
	 wNWpwjcDsGLbTMIjYQymE6ZkzB6vf2fM5nbs7oaOX0Qc2Ur690CUuUcoK7luTJN1qrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y38zimN9;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A68606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32A68606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y38zimN9
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ad787e0593so1196669a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793012347; x=1793617147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HUmBumVayD42JJx8Pn2z4JOh+RWoCbU1b4kR9Va06PU=;
        b=Y38zimN9UflXNqYOwyPcd7bnennWRg93b7BIrzVxUn4RdJsv9nqMJAvt60047Pz7Xb
         FEvkWtOWmKOR7jUkxCxOkC8Fqg3YxsK8LVP1ghFosAIDgWsL5Db9FjBfAV7mgklRyGrE
         R7inyL5Rz5YeNwCJpCvDmLgxBYTRcRry9nQrQOeyu62xeipMhLDW0hKmPTxuQSSziKC3
         CQEQ1Swc5FggzATN+o5o0pLPolPMj8SowxxNsqMdjHIxpV6pSibMXSaPm2xdb4hSV6A/
         bvQy8pjqylj5b+9wZBpu9V9N8PqoMroolq7cOKxgWGBw38vLSucEPeQ7xuxvT3tFIKTY
         6rEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793012347; x=1793617147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HUmBumVayD42JJx8Pn2z4JOh+RWoCbU1b4kR9Va06PU=;
        b=HP/f1kZdHjMZN+xrwxsJcFTazowpmPKjoIETchiaQakd4rn5VpOR2ViD12q/0t8LMv
         HCGCwU377FX7znHhfwlCaN71jFYQVVxWG4NdmjOhm07J4Ov+cksMVVPWmnNulkqqyO9e
         hgvfwa/xUnCQ2bPw9Kt0HPG3Nhi/ymejD8f1ib9rgQA7wT5fhoeenTqGXj/2RRV/XI84
         PJ6S9HzgKPeqvslLoFc6St/kNE2xWEjeH6EVzgQH6eTtwWA//1aG47utuHRkNTQe2L7Y
         K4F6/bgF2H7hHr37HAbvcll/xqwNAIuROUOYSFFK95h1FmuBdfrM/w8MIIGR4G2rkBpv
         igiQ==
X-Forwarded-Encrypted: i=1; AKwUvByYM572DZwDktPvEqNWoww+6Wvl0kqnJkzPmprAE4wEQY2+rpk35niS8XnaOvDXLJr7Bs7q//ZjvhODFSo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+Ub6Pc/ibYH3NiOAH+RcbjvZDa2c5sSUUPq5MAx+c4i1xqy5v
	j1Ver03j588s2AjA/ayY7cG8AzS3b2l/tA0jqjV9faRBDtnCoTyTaoe/
X-Gm-Gg: AYBFou1LLuTzpzuNetuY7GS+MbLRk40yNAWwHdjnf9FtA1DzhVD32bS71VNQQKrqaXv
	qoNwM4Y1YkWitabRjHO671G3Bhwk3CT6VmAioHkCVSe6Wet31NXYR5zrHMBRutGlAySjGNOBcPp
	ZDj3P+PXMLKhRD5NRcHzR1RUS4re1Vvv31HkkRU1TgppVs5WYeze1yRRmilKAp9e9OarXDbR5AD
	xXhx2rRM/3kmzXRAkCn4wojaua2M/2i8s2tEMb1gje9FJtpLF9luI0g7xMQ3JG4OR8S4tH9Voef
	yAJgmEzK9IozQ7bb6mFyed1bfISnct2l4hcS6dAkhuehXUCJe6vpbzghi29G9UTuIgwi2HkgSw2
	I3OQHC7WBWWeBs9Z9szevmzS5Xx/YQxKF6P/4uhNBazSXhQINzm8y2PV0bfuKPQnUwp8geG9N5K
	z0Eb6IUW+8ypliXx5Q+UdYKSkDGYkWOPkXoggrCGwWGydCqer7JcmwrQ0695ZJrVqWfJRhdNz1n
	jCN62ASbx+UuhC23Iel0QKNKn/0r1Vq2QG9VI4lOuJ75BHWV3kxdoT80+/dtWmFRA19dYcUMRvM
	B78YpGOnuayiZ0/8Zy7t0L4vGyt1L8Sz4h12a/DnLGpgE+AMQC1DVX2mhrauRbbTwnP1hu8=
X-Received: by 2002:a17:90b:17c1:b0:3ac:4e18:238c with SMTP id 98e67ed59e1d1-3adeb130496mr5026383a91.49.1793012347522;
        Mon, 26 Oct 2026 03:59:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfa82sm7980768a91.8.2026.10.26.03.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:59:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	Russell King <rmk+kernel@armlinux.org.uk>,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 4/5] ASoC: kirkwood: kirkwood-i2s: Disable extclk on internal clk error
Date: Mon, 26 Oct 2026 17:58:34 +0700
Message-ID: <20261026105835.19052-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026105835.19052-1-phucduc.bui@gmail.com>
References: <20261026105835.19052-1-phucduc.bui@gmail.com>
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

kirkwood_i2s_dev_probe() enables the external clock before the
internal clock. If enabling the internal clock fails, the probe
returns directly, leaving the external clock enabled.

Jump to err_clk to disable the external clock on failure. Also reorder
the error path to disable the clocks in reverse order of enabling,
allowing the error labels to fall through.

Fixes: 4523817d51bc ("ASoC: kirkwood: fix external clock probe defer")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/kirkwood/kirkwood-i2s.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/kirkwood/kirkwood-i2s.c b/sound/soc/kirkwood/kirkwood-i2s.c
index 395790682355..cf6b96054b82 100644
--- a/sound/soc/kirkwood/kirkwood-i2s.c
+++ b/sound/soc/kirkwood/kirkwood-i2s.c
@@ -710,7 +710,7 @@ static int kirkwood_i2s_dev_probe(struct platform_device *pdev)
 
 	err = clk_prepare_enable(priv->clk);
 	if (err < 0)
-		return err;
+		goto err_clk;
 
 	/* Some sensible defaults - this reflects the powerup values */
 	priv->ctl_play = KIRKWOOD_PLAYCTL_SIZE_24;
@@ -734,10 +734,11 @@ static int kirkwood_i2s_dev_probe(struct platform_device *pdev)
 
 	return 0;
 
- err_component:
+err_component:
+	clk_disable_unprepare(priv->clk);
+err_clk:
 	if (!IS_ERR(priv->extclk))
 		clk_disable_unprepare(priv->extclk);
-	clk_disable_unprepare(priv->clk);
 
 	return err;
 }
-- 
2.43.0

