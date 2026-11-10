Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297558;
	b=gT/1o7oBQm+uTMgrqrEEHQCb/u8vtP2tXDbG8qYOEWCqwhJb+qZdJ8JINKGDxzorGd3R
	 Pz6GwdCNS5UvH9DYhzhOXosoLUNkdz8z5xltUWR/NTx37vtlizGqfkV7+WQePjIFFlwhN
	 amzuMKwMMQUgXUXrBwzylHRMHZnMK2b2NYERFCbwY4WLjuunaimJwr/F0zNNGxQr86H9D
	 k1JUH4EC/Gt2dHPci3Igre6goGvCk+orbV2X/rx8Zvy3qkaYzc6Xg7NtQtexjyDpwiuV1
	 k/f7YWLCgpkDSn4kWBelgRlDcQScaD6mdthMp+Zg5d7bNbbHAvYdqk1xkvU2qYWzwXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y6PKiZVhgPoQCx9LcIllCoQr4zQzHDju681FGCOxyQE=;
	b=x7Wm7lL9fRxX7q9UhgczVvP7JBRwjSZceospNm0XJkgLFu2tuG5lqBImVRlS/riSAPEJ
	 BBgh/Q2keNQ5XJzzDs5YejwUWFOP/KpTiWV/vBIzVVDl61aMXOwLcxuKdqPepfSCwX7FG
	 qYsvygkSVtAoWJc3K7ygUvM+9d3c4spgjW8uSm5rb+sJEwdl9M1hMpUv95wr//C/Bi6lg
	 eL6Jdk5wJ4uDtEVr2oLd7evsz7PGJPASRKIBwqruy2PrdTr/RAQRBZix6pWpC+LyDZQ8I
	 VaOjKwbTOdXTcovwY+AQAIt7dvvlaze2hmN81cbpkoDlsfp7J/d5VaZamYHvBen4FdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gOGLjoi2;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15651606A339
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15651606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gOGLjoi2
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so2486834eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794297557; x=1794902357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y6PKiZVhgPoQCx9LcIllCoQr4zQzHDju681FGCOxyQE=;
        b=gOGLjoi264Qwt/Fd1OOS4F7omoeqGzN5a8utT68YdUrK+b3Mj31b1nGnXmLgF4h1Kh
         LSuZ4mbvQNssPs9S+FJQcvMnCMZUhFrcmqP23rJ55hwtDxcJ/NEnaJhLhmLFoq8boNnD
         sZjiTfRjzoZhfhd5/Ln7hnkGn84Vsy/E4YnG8j7m0OL8oI8m2IN0uMaR+ZTf7f9IF7AR
         KyI4cqtfVPG0uRKuPRG3lTxR81RZy/mNH8LzOefJFm+IQ8CfSeRj5IDrrDT9dlMT3XRL
         HiNSgEN2zv5tQ+vYG5+hSrowe5IcZw50KHmlPlVFsiCOk7NLwV5IQdZ+Htnbcul1D2qq
         fPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297557; x=1794902357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y6PKiZVhgPoQCx9LcIllCoQr4zQzHDju681FGCOxyQE=;
        b=hlm3x9PXFrHz3FKISzaFl7Tg8IT9FFEee3MqOHnZBGpd20w2gDqUaKyLu06PwRSHlb
         ZWbxz0LzseWy6X/Mo84VROrYQ1D4sL3tdUQycOoqsN6baxXhJbx1pRPlaX0Ml8gGKSew
         YDeyCCON1rXCszNKZwjJs96UZ7sHCPsSFsdNm+xQht9pS4yKoSPVmKNAe7TpwVg7sMpB
         w5vDsidrtl/fQJbXyh7Bb4cqNzOGU2jLbuQEybheLh+K8AMw8sf5iYQRpSylcJWvBmEO
         xhWDnx6oDMoc51N+6zwKypi2jCmr5v4A6Vt4erUGvXZWjsyFuR7xOnPEk2G9fRmLNlMK
         ZF6Q==
X-Forwarded-Encrypted: i=1; AL+hErEXofJanfh1nmtAgscO3I8lTjbQoflb2piNLlhAq5HZntD3Vi1+9kGmWrEpVuNkdw9faialEhghgdnxWt8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gGnVAVbPCcI9p9KCfXDhhiQm8C6PihSFUwhQIBJtaO5AJUz+D
	YGS/FFcMIImtetkfObvrorWQPRcDb0/4w0gkVRLymJu7KhQl3qhH6yPu
X-Gm-Gg: AYBFou0iBv4/DevQLJvO4IiZLNW1QhpdIyBOj1xr1evsPxGwgwluJ5lZEGeTZcYUhcB
	DGsg6l+UPbFp2vAONFHLlaERF5WtRbFte8bDguMloxmfvj+TzqLrtf+FHlykA/0HdfavwhuFlal
	wM/6Uimjl6CQ3sBR/lQk1GNdPylfMZisJ7i1tQiP3z4vJhBzBqmjIxNP84n2OpBwQTsW73/+UP+
	UimJa8wVkYnb5lVzJ9bxwUWD9rXI7yn2qcXJQgIUpeQYtBlJYCpKQVN4xOcLDZ+uCuAr3ampPdo
	pcM+A4wjWkKAHfajeEIAnp3PnHyEGwAnGUTZGrgeTmoSfJ4xE7JQG2jHgYb4xcDf+UBPMj7fZHG
	0jLUTSoglheHCu0sTi+EOu4u97R1wH/+nkqn1UA5BIBMPI4mY+Mq1rXn9z8gYJp490TZXXJmSBv
	rShkQl/MyO1t3oSSfLfIvt4uqW/josFgcNnA4dmhmRjxVgzp36D25RTwrMkHzpq1g70RNXO49yX
	GErDrSjQ25HscRh++lIacj8uTsqrJb0z6T7KAWgiVy+WipH1ncT3VIgNxEAj+WFw2GEckhmmcaf
	P1d7UsGCkiAIGW5bPGklVJ5A+Wkd1plf1bDd3SC2mhxOBml7KgKqs4c69dPlxD6WDSVHoQp/u1j
	VkBWU+Kkf1/422KJKZtA2ly7HIdiEfzvKFL6aPurZ/xIl
X-Received: by 2002:a05:7300:80cb:b0:36a:1d6a:596b with SMTP id 5a478bee46e88-3751f56137emr3803806eec.29.1794297556929;
        Mon, 09 Nov 2026 23:59:16 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751dae6377sm4498321eec.3.2026.11.09.23.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:59:16 -0800 (PST)
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
Subject: [PATCH 1/2] ASoC: fsl_sai: Make fsl_sai_reset_hw() return void
Date: Tue, 10 Nov 2026 14:58:40 +0700
Message-ID: <20261110075841.12104-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110075841.12104-1-phucduc.bui@gmail.com>
References: <20261110075841.12104-1-phucduc.bui@gmail.com>
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

fsl_sai_reset_hw() has a single caller, which does not need to
handle its return value. The function already reports register
write failures through dev_err().

Change the return type to void and continue clearing RCSR even
if clearing TCSR fails.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 430e896d064e..59c9b8c28133 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1410,7 +1410,7 @@ static int fsl_sai_check_version(struct device *dev)
 	return 0;
 }
 
-static int fsl_sai_reset_hw(struct device *dev)
+static void fsl_sai_reset_hw(struct device *dev)
 {
 	struct fsl_sai *sai = dev_get_drvdata(dev);
 	unsigned char ofs = sai->soc_data->reg_offset;
@@ -1421,18 +1421,12 @@ static int fsl_sai_reset_hw(struct device *dev)
 	 * Bootloader may leave SAI running causing interrupt storm.
 	 */
 	ret = regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), 0);
-	if (ret) {
+	if (ret)
 		dev_err(dev, "Failed to clear TCSR: %d\n", ret);
-		return ret;
-	}
 
 	ret = regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), 0);
-	if (ret) {
+	if (ret)
 		dev_err(dev, "Failed to clear RCSR: %d\n", ret);
-		return ret;
-	}
-
-	return 0;
 }
 
 /*
-- 
2.43.0

