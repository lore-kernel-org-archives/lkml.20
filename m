Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875446;
	b=RByx8q4e5xT7XqUO+kpL4LSpgfpENLD9WODAiTg+pGMvdGmjSu3HpP9/HgTSBHifhGxN
	 u470tYc0MUjEoXWzaWXgDPqTOoh2hstX9fzaYd/8/N/7gxfYz++GyyJciUgkCLPlQQYDD
	 lTIUDo2g2tCwX/ryDOoLxCzjlqPjeLw5HdySgUPZF5+RHbDgmpDMzLPYnNrmIrzjZ4Z1O
	 1GyPlfIXT5Nkwn9l1/2lTEu4jab8hal0jukmHqfYHzTsXOVf32JR1d1Ylb44Bh+D/6qeH
	 ozxbSuMKaeTlpbESd5GOzM2+gQuf6hws84FJiMDHwBMRAiIoZ7YzCZLE+CwONJ0PXRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=plnEW8+Hp4dXa8Lp3EAtMLPmG1hUTIPGT+05VPB/oMQ=;
	b=BhtL99ItfQe6zI/oot811Hfb4Htv4ZYGMXcKqhdX3HWwfIbHiiU+ugOwMZ72QbIqMYKx
	 ooDYzYGZLJd1p8RYVyLGKAvBD5tetHQOpiioD0cvOHj/d26RyMwGVvuXJzBARsajhrcEt
	 NB1CSiiXmRfx976knKrD3uXhvMApuO5epx6nad9dLT/A04BMga96E7lvu3gaeaCE/6AwA
	 LYz8N6CDDx5W2qvtfVsTa1Uwe/+hsAXrki/ftoJEaOrbJyRQEzyso78snF3d/sS6K51To
	 3K03P2/QaIeAt5eedlVAwVp4vXb0ryE7dYyzXkRKTSFJAxE1ogYgXkA4OEwvrT6Xm7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JC5CDN9D;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B036606EE9D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:44:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B036606EE9D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JC5CDN9D
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36a1947498bso4824991eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793875445; x=1794480245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=plnEW8+Hp4dXa8Lp3EAtMLPmG1hUTIPGT+05VPB/oMQ=;
        b=JC5CDN9DXHiCMeoR6FtKIZGtf4E+dJKETsas03Cr8U4qVAMjzRKZfQv3Q3Cfjbfwno
         bDwNGLNODFJb4vXa3NXdm45qm2D+W9L1CTN4m4f0jLZhL0Q3CvcCqPjTPbTs+k6ZM9o0
         EBndUPFMB+3kZZQJiG7nT1fjWAJVSbNTID45A47FPNQg2JkeLM2tOzzomrJa/ec89VO3
         uspmNrHZrdQaOGUD+y3ziCG+Mi0zX48D6kT7pJWPMGksEXzM0s9NdQ1OAyFFrgTmeSIV
         7pPbaDpXGPbVvM7TtE87/2nlSgJPXkc4YUo6alzZ+iNi8ZbNNma8YmOgwYCQj729RSXU
         llbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875445; x=1794480245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=plnEW8+Hp4dXa8Lp3EAtMLPmG1hUTIPGT+05VPB/oMQ=;
        b=dFSIrJlz0Do3FJuc97HiyyWtvF9fgram30Makkt0I9MzVH0K4QtBaD/N3zgHoss96h
         tp/QZ8n+AAKQuRofY+77fxhifCOHWDD/Bpp8exVP9WDvUZtCHCEqHj6c4VD6iyyIQcUq
         dQtLEtXG6EBnmfqkmqT3OIETWVoch5AaO5v4BP4hxTSYGaWrpEEkXYBHHP8jQuPWf15U
         m1XyizKgjnyLXHgYiksvK84/hFaV4mqX6hERrfMiz206D+aBQgg0XsIT6ZvMD1Sql34c
         4842DdE/AJuVuOp2e4GvT0VxyW1y9euARX4+7d7rqOPLqcycCCD6g0eyaT+o4f4fNaLq
         8URw==
X-Forwarded-Encrypted: i=1; AKwUvByI20SL17Z9FGJbWmMLREfXA4YFXsu08sVy3go9DpgY5uVfj1ue3a6od0tCQjrv1PY4cRL+wUoIj1bSVVw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Okyh92kAdUqffugfZK1h2wqGQKJKvXKX8/8iH6RN1nheGzXnK
	WuIm9AwopcDv0hlni4DrFdcKCk31PKJa/wFctwLlzGfBllonNDper6ls
X-Gm-Gg: AYBFou3RsOul7lmM5w6bmMkKj8FjKKOuE89EKTRC4J5JJYuNsbJz2whw1bZQpFZyV2N
	VGDisRbm/ZQ1iC/uvbqpzHZVRFmJ8MODh2yae17cSnIstTxEN8mD67iz9uioNVzfV7wLXoMFp9Y
	mLQRY+GEG6w6VsLbiwx9Qkp31JhBS0/6KVe7Fi+uJ6ecr5lP+eInzcAEUuVZLDLYVyJzsW8XceQ
	hylYFrkjEA+vj5/LgN/3SLEugRm3OnN7a5yNLWjC2mHkou+NcPa+WUa0d7GzDu4mvKBPu9wtAcH
	sUyCrfEtc/MnjwFlZJ7IIxrubOeRrRKthGW8/rc+TXjqiJiwDu3d/dOp1cAe0W1q6mhxCxe3KxQ
	F2vbGMRDtTKKrLSuoxqypETr4W7UizivGQyevTbgfQfv796jItBliX2GGvusZmwP5ev+/CZ8xyb
	ytzG0HZV3pg+VAWkbFvc0PMTw3MeaCANpYjK8ms7xyhVIih3QaaNxzB4LRDqLctvj29+8uAGSpd
	WwTUmlTe7w4fzMmsNo29CS2GRrzQO6xdxVe6xbrskrhYjmHjvuQ+q2jNkZH5/cZL7ugErBqTlKJ
	s+fWRyLuIfOGfky6CkMayrcyM4YEDLjIfxov0SGP2ijVNsvC9+szXr4Y0wXU91LjkYpcREFXgPq
	3YPqffKLsL3bpX4ZGenhVTBzhTNa/bdSuAJ0S5fpLx6SX
X-Received: by 2002:a05:7022:3a05:b0:1b2:4da6:bccf with SMTP id a92af1059eb24-1b24da6bf79mr4455241c88.31.1793875444532;
        Thu, 05 Nov 2026 02:44:04 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm15595215c88.8.2026.11.05.02.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:44:04 -0800 (PST)
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
Subject: [PATCH v2 10/10] ASoC: fsl_sai: Don't write CHMOD to the other direction's xCR4
Date: Thu,  5 Nov 2026 17:42:37 +0700
Message-ID: <20261105104237.38542-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105104237.38542-1-phucduc.bui@gmail.com>
References: <20261105104237.38542-1-phucduc.bui@gmail.com>
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

When the current direction is synced to the other one, hw_params()
also writes the frame configuration to the other direction's xCR4.
The mask includes CHMOD, whose value is set by the current direction
(Tx only) but written to the other one, so it is wrong:
- TCR4[CHMOD] is cleared, while Tx needs it set (output mode).
- RCR4 bit 5 is set, while it is reserved and must be written as 0.

CHMOD is not part of the frame configuration, so drop it from the mask.

Fixes: f4c4b1bb2f5a ("ASoC: fsl_sai: Set SAI Channel Mode to Output Mode")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index c61703ddb6f8..430e896d064e 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -720,8 +720,7 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 
 	if (fsl_sai_dir_is_synced(sai, adir)) {
 		regmap_update_bits(sai->regmap, FSL_SAI_xCR4(!tx, ofs),
-				   FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK |
-				   FSL_SAI_CR4_CHMOD_MASK,
+				   FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK,
 				   val_cr4);
 		regmap_update_bits(sai->regmap, FSL_SAI_xCR5(!tx, ofs),
 				   FSL_SAI_CR5_WNW_MASK | FSL_SAI_CR5_W0W_MASK |
-- 
2.43.0

