Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875424;
	b=1QYsCyiBdWUxAOujyxFEvopRD3z5zoN+CCjm1yg45edrqb/2qvbbdguvOfhUaV144KiK
	 FJTeG5H2zSCBgOGbZSlsSM9HjTjtB8Ar0sPpE69QPpEvIpwGWtphbKIRXv/M9BSJO5bBr
	 dbAzPUWxMsgdpkSXI/i9LI6d0zDHRwZBZEUtoPamKQA9dHCvUVZ1CHuCMB4NLN1qF2XtX
	 DGkRWzvWZ7LElSksIa8yJiSl4j2ZRyk5hO16pZsCT+vrkJS0J8UWcAvVmfb4QOFalBwj2
	 Mq0/uhICcqYdQ67kdP6AEQR9lDG+8VSiw6CaKpFKcbc85X8LVzEdrrtTKmffbInV+rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uXICPYwChrk17gf+gSy2co454kHftdzrJdqzDelhNpI=;
	b=gSvCrbb4w5n548ucVumhZum4OAEBiHUd2FX5QKGPDs4QFeMi8b6+4OQu0PIaWnnrVTKD
	 TrTg5WFVJKJN66ESoygC4bP87gTpppL4p0YfooUs1MQ0JckOOADRLiifW/zF0DsckhkAe
	 p4bv85M0E51QRahBwUxmHC1wr7OS2nYbcEFvXBVIa+nHIWErCD2D8yYmgRgH5GaxRG8IB
	 h5WrZtikvxtLH+QWchIXWGBCUignJz2lU5ohdCXY0S2elvK+UHOwhEn7h7ebs9BEpVOhK
	 77vhVPTWs0BAdlmSy2OCUOZPDPapDkkqiU+ZuqZleUpVk8fBQ6MpgeTJ/Gqgq8tmimQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZdrL6Nc7;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107F9606A333
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 107F9606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZdrL6Nc7
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a8cc11ac42so1735021c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793875423; x=1794480223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uXICPYwChrk17gf+gSy2co454kHftdzrJdqzDelhNpI=;
        b=ZdrL6Nc7UuMPZ8WbsJf8eI1EYtxNQn8a0B9DBM1fmnXDl2neue25X14OdQYqZGqMs4
         3mMOy9SedUY0oHqTuE6vEhDiSjsk1vZStte+4IsjbVNkAGMthfckeTjoL8AlTy+YFk7w
         uh4rXnPZ3F+kUPs4JnoO2FkMbMCxKm6dEkGOiyAWJt00N6D5acu9giGBiI4t4GmPdZfJ
         9+hWs05EjWEN9e/75mesjqSMtxE2CYUJ1eVAd/Dj1F+heg1G7d1bNQIaoV6nkoJC/5/1
         PuuUA9YCJ2MTfdnP8NTxQ+nsOOHNUzJ2vw7UqB6fvWmt7XO61E6+mmVYfUCpEkOwvT9o
         YqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875423; x=1794480223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uXICPYwChrk17gf+gSy2co454kHftdzrJdqzDelhNpI=;
        b=O3vL2mZbD2yVO3uKfMU1k0DkPYLROOX3ILfH1zkONG1OG8+geCbBHBr1cjjpMpc5Tw
         pkG6/78NgfUhZpSl3G5D5bZK6FytHDOpdNByInZYX1aQ9Q0zjvmgdZp49JaWTawPTIrW
         xHp5X9WT22Al/xqVJg4T5A7xyNCdMAYVN2JcU+BP/nU+fPJwWdt/6YSi+FD8hGJcYG6a
         1h4G/QmgM/sqDDX9p0PxNQUTPYng90JjUv8ZSnHQIlXJXiZDwcsYX8lEAiRHsAncRsN7
         hNFE33Exhn7MjL/dx7zRkMTi4FArpwcWBdIkpsJF3Ti7nj2KEq3xNBwcXAvNeWXH30zd
         mfUw==
X-Forwarded-Encrypted: i=1; AKwUvBxb7wW653TucRIP0djHTqn2a67qGrO0nMHNhuNI9yN0tlrT4NYKNsNYvCba9NIZjZPa0p575PRKVks9Qhs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6jrPGMl3Pokk679z+uWjuPYxwjJxkuYTWSUo4w760JMhKt6OS
	EsFz1mOjqkDchNDkHvjYwe4uOc9X0Htdc6sJpY3n1O17U4zvbrxoExyl
X-Gm-Gg: AYBFou1AzM8148+02zqCwmyi/xw0jlwkCkWnqc1NAc5Fqm9Y1bJVMQ9oR7Wku61Dwd8
	r89+78XFV6RgCIVHhgFisl73NQBYkYn1TG0mt6dimxS3Ti+YlB4juGg14yxgDU9VrWIkPjKmcrE
	yHVcdKW6j/2l6mOdT95pvVFT6NH2iA4W3CmPrlsxfXZ1AhQkcxFCFycUG5VfSW8wzn9FHs69bhT
	nvvzu3o5qCABrMPNrKqHwtGG+JIgmZKclAuo8dl6IF1L748U1zyuZKo3qq6yQvtmnvlUjWMK5ox
	tuvLfwAP2rW4FIu7ZXPp0nV1GNbyJeT3cDhqkDY3uNuHFhD/nm88x4NBD4jQLNG2kC+OQLbRjit
	lYpraB19zIM5YghIxEVQ1SzffgN/6lRBy9IfLb2etxEfvZ/qxcPrcYIBmm6PwtYYH6mvjZjZa2U
	CrDQTnSZRBYuEWKR/PIhUvhX0nBklryXqjJY4qtqZuEZNm7ZR+RLJqRgjONZL7YIS8V1epRGB3W
	stHsQpl3Az5mozkBfSMVU538oTl+V5OuyrAPwszi/lsSmo38NhJlxJni7W8J/7SGGq9YMugQLqY
	BSjdyt4qIjEBkK5eiAjKszCBFGrWEpzKefCDUlY+0jAvm0KFGPtzaiEy1Du0th4sOZJwl5HvtyS
	fHo9vDFkyTpSKgQripfK0wVAB4jUFMLTXqnpOG8irS7Eh
X-Received: by 2002:a05:7022:f507:b0:190:d9bb:281f with SMTP id a92af1059eb24-1ac5e3225aamr26533948c88.18.1793875422948;
        Thu, 05 Nov 2026 02:43:42 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm15595215c88.8.2026.11.05.02.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:43:42 -0800 (PST)
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
Subject: [PATCH v2 06/10] ASoC: fsl_sai: Warn if TE/RE does not clear on disable
Date: Thu,  5 Nov 2026 17:42:33 +0700
Message-ID: <20261105104237.38542-7-phucduc.bui@gmail.com>
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

fsl_sai_config_disable() polls TE/RE with an open-coded loop and
continues silently if the bit does not clear within 1ms. Also, if
regmap_read() fails, the loop condition evaluates xcsr uninitialized.

Use regmap_read_poll_timeout_atomic() and warn on timeout.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 8315a0d8893b..f75a1d61d7b7 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -849,7 +849,8 @@ static void fsl_sai_config_disable(struct fsl_sai *sai, int dir)
 {
 	unsigned int ofs = sai->soc_data->reg_offset;
 	bool tx = dir == TX;
-	u32 xcsr, count = 100, mask;
+	u32 xcsr, mask;
+	int ret;
 
 	if (sai->soc_data->mclk_with_tere && sai->mclk_direction_output)
 		mask = FSL_SAI_CSR_TERE;
@@ -860,10 +861,15 @@ static void fsl_sai_config_disable(struct fsl_sai *sai, int dir)
 			   mask, 0);
 
 	/* TERE will remain set till the end of current frame */
-	do {
-		udelay(10);
-		regmap_read(sai->regmap, FSL_SAI_xCSR(tx, ofs), &xcsr);
-	} while (--count && xcsr & FSL_SAI_CSR_TERE);
+	ret = regmap_read_poll_timeout_atomic(sai->regmap, FSL_SAI_xCSR(tx, ofs),
+					      xcsr, !(xcsr & FSL_SAI_CSR_TERE),
+					      10, 1000);
+	if (ret == -ETIMEDOUT)
+		dev_warn(&sai->pdev->dev, "%cx not disabled at frame end\n",
+			 tx ? 'T' : 'R');
+	else if (ret)
+		dev_err(&sai->pdev->dev, "failed to read %cSCR : %d\n",
+			tx ? 'T' : 'R', ret);
 
 	regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
 			   FSL_SAI_CSR_FR, FSL_SAI_CSR_FR);
-- 
2.43.0

