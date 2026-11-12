Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480706;
	b=5t1kstaAq35IixFi/cKR/uz7PbQpIynieCPsQI0vVM2ZU4n5w+7TDHP+OvHxcopAJsG4
	 E7oiY79zjCb6Wke434iZ2XtXA0Z3UOeVn/VEXuu+42QBRWTc/2HMf4WgwmaXqtHm7RZgP
	 I28V5XtLeG+gnJT989DPGEsCWHrS6NisgAPxvnwdy/ZGReKW5JAgP10CMRB33AHXH//Ce
	 fgUfT1n9/lim30nOmiQtW/Nev4fopFKUNc1Tfqg8gilgollVcMfyFrfZ3ihDkg9cFnq4+
	 dcYE1Jwc4zsHUpulUvYpCmYUdEpW5P2rYqa/Qwmei15aFAeEZ8JFR+zOH3bB3c8PMcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IFm8ieWHHt9ZUMBFOECdKzOj7Y+GHKcLVGVXGiF6fko=;
	b=NgHPd/4lGtuGMkV2SR7a277S4RdVCRRWRYTPQWFCzRMsuIAICb51hNn9DiJUxgRIugo0
	 f3U9Xm4DsnyTzdsYlw5FvV2LhOnxRoOYkJNgnWov9DnlIPF2B9DAnHTWkjTEHpK3b/xgZ
	 bk5UPrdFBWiKfCFhYjmh/y7UVHptB+8ys2/dvoIIZWA7HMLWQMFaSh4MtuuzFBUn5cBAD
	 zfF5nlqrcQJGUpEfDkKn+qJNKqKbFY83YNZw1SlKrew9fiTnrCJ9jZbCVs5XBSb6ziVKd
	 Kg4aLAy3cl5zEE/PJ+oERCtWtINvHMQS3kqomMR3TunnU9xIhx7kgjPTMAsT39xLnRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jYQ+h8Jc;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3A9606A88C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF3A9606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jYQ+h8Jc
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3720addb068so7345675eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794480705; x=1795085505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IFm8ieWHHt9ZUMBFOECdKzOj7Y+GHKcLVGVXGiF6fko=;
        b=jYQ+h8JcSC1XAyPM/EBf5XfH/84/nqCXJwZfgTvHLR4jKvi7+NlTCAbw0BBW6FCgCr
         Idsg9Ww/J9t7yWvr+L+bua7vQ7FkG5GnkwVGTqDmV9MlPDnyK4VMnDReZr4J/pdZW/M4
         tcjR2GTaHRMLWsvOwHhYR7/plyd3udggvJZ7GT/WYu8gDraayQiZKTsnhU/FCwxLOnGb
         FXKJdzMovoDNqaDyrTLPtDligf5mVl5E1iphxx4EXzkSo3bQV/6t6ziWeZ0H2jtut8FE
         n4i5jPA9YYMzkMfmh8vneU1cxu5KN+nG9G7cyhRXNj6H4zSGrwiXoOj2p4w/WdYk/OSj
         W9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480705; x=1795085505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IFm8ieWHHt9ZUMBFOECdKzOj7Y+GHKcLVGVXGiF6fko=;
        b=qlfeb+vZTFI7ngFkNT0scM/TCpyeTioPieRmWJYkHFPl+9kAr7V3icwyg4MYCN5t83
         QJpnvoDxHKeZRL4wGii7lqt3VDnyO2GP0MXEfxk8997a2Zoa5Abr0wZvhYyunYEOcbb2
         q49e4/UUOREvychrLFWEUi0LpA8njISeNY2IRPCMoNV3y0jUXVZowkqToLemadwRnta+
         I5ZCg5MxTLZIQRg4+Pcjr1/hbbjN2Duw6/9J7MiYmq+KSHfj87mbgMbbjf017bM49jOa
         1B2x6x0KLSL4QK5rrwSpKZaT6ANv/kbg6hL+nkeoxL7dhdD0pN9sF6ICYtEWM/AabV8W
         VEMA==
X-Forwarded-Encrypted: i=1; AL+hErHtP/zZdD/OiPcYwQexCyrMg/clKnIy/oTL204BbbPGTydBATeoiEyREQRSVGzLvUVwxGDUfSEsZZ/b4fI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FJRWv+v/HpL9dA1OnTSKCd6XtCOQkEuCXSXzllUHLT7f1OC6v
	rcEboOG3MW2DIGqTWFiIMrFSrEns/rQdRskLW6V+VurxEMGoqb3vhU2v
X-Gm-Gg: AYBFou0W2uKpxqGNZsW5KWiYLJnMiQAb9poq/HNLlL8zVzBOzHaxLJIHOxjk1/E300J
	RT7M62vj6ZMDUySc30+U2i5cSZInGU+EvuJBjr0uSN38QDyBF1mCCUUULRhvdeSxQE/II1Q89ru
	ha/w1MilucyRVhrcidvIbJEecNke77U3XPSqaT5Pq9ls+rTSQICdJE/F4pgrILw3UUSfn7bYcMA
	Km2/RAaIq5ee4WNYX+a1+awX1lOWbjcqJY9lchlT+hi8d5d+DqR0Kk/yRCs+hBrmw8maAHwYExK
	YM9h60Y83NuvLQi3Qe5rTNJztre8v/rRoBOr7kQC6sDDUM6gaiXpBjlU+8Nj9MbSjrWWWMLe0LN
	hbgCD6Qz2U8l4JCozpnIFXG0t0P9XjTZqiTAXp86l+VLKKuxqw3hiPmsnaRUVLbgzRR1oZDvBXm
	bj+5E6uSqvX+Ja2kvZja5JIVBOHcg8+KsBmAIQw/+yoDoRSvVS2Da9wc1r2V1bLLGG92+mH4Dru
	eoHR36lwINR0feTTnh6e9X5OFIYrISHAuS+5NTSP1Wd2SURvLzpf0Jb/xdlRbrqOEY88J1iO6Jq
	dJQUFWVCR8CO+yG8yOw39sVfm4cNKVrq/k+v2ijabCHwHd3JKaa063tejXgSInjgUyILXDAx3+K
	REbs4vM6H5jKolLe1fw8X8kIfcRV2XqrKMeBDsMYtTg5I
X-Received: by 2002:a05:693c:65c4:b0:36a:31b2:8643 with SMTP id 5a478bee46e88-37686c3b663mr5085905eec.38.1794480704809;
        Thu, 12 Nov 2026 02:51:44 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306casm23047232eec.9.2026.11.12.02.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:51:44 -0800 (PST)
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
Subject: [PATCH 3/5] ASoC: fsl_asrc: Fix runtime PM usage count on init failure
Date: Thu, 12 Nov 2026 17:51:14 +0700
Message-ID: <20261112105116.32274-4-phucduc.bui@gmail.com>
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

Balance the runtime PM usage count when fsl_asrc_init() fails
after pm_runtime_get_sync() succeeds.

Fixes: 286d658477a4 ("ASoC: fsl_asrc: register m2m platform device")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_asrc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index c91ffb5e0c5e..f7ac60724c6c 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1432,6 +1432,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	ret = fsl_asrc_init(asrc);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to init asrc %d\n", ret);
+		pm_runtime_put_noidle(&pdev->dev);
 		goto err_pm_get_sync;
 	}
 
-- 
2.43.0

