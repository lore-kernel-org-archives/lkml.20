Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875402;
	b=4PhswYW9maJgdCCkRU7oAv57W60EXO1LVxIApEh7cmT8SiF7Lx3VfJhNpOMhCH0p1E3n
	 xxRZm1oYD/DDFfnH1PRwm+z5f+c2uvy2kZSQ49PN/Y91U82sOqVEILJdJDokYeCzBxA0H
	 FnQqmalGM9ls9O0dr5XXlG00wyAYdLyE2RwRjYYEz2X4vdUNnfuCnsNhz3O2PkOhuhTAv
	 EUupXLzErHxUZinnDW2vXuap0QpU+YAAVsCevZ1D12Tqc9LIyHOzc2m61RtrpVlgCoenY
	 WtS1gSQplMShBxuicgac2AIkXwN0X8kIBqxMEqFASXAwEsPvtwUnq+OfWsoFGnJ8ORA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aTbOMPeQQR/WAw575MjV+whoOIimG2HfOgrdg3UiGjw=;
	b=ArgAqPRZdY51VzuVDMihNUlmjYYmqM0/iN6JA2WEK3UWMclmw32PAFRMj7G8xTbsErB2
	 buvd923bYSBPgGO1UVXmidBwPxFR+iSqKBUgtVbrPJzbr+fxHNnAT5gTU8qwo60u7e3wG
	 Mo2PzrKO4sxO+8MFQd0VJTkb0zcCuGjfA/zV1r1WWHmgsKgo6OR69wawtNLaCU08PEn4L
	 QCkIzBrP/xMczni9OACLRx5Rw8pqrIeOi5ymw/xFFMDJd7rWCR6A1v/XI5yXv235PsZBZ
	 W2WGIoYq/juK5qfnjoS6NWQIM+EmH4V2hUNC/5+gM506c5cc7UNQWlMRH9hmBWfCpAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TLIeblBE;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B60606D832
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9B60606D832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TLIeblBE
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b244fb7fffso2315559c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793875401; x=1794480201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aTbOMPeQQR/WAw575MjV+whoOIimG2HfOgrdg3UiGjw=;
        b=TLIeblBEEIGVxHHVL2cF4zb8CnljWHioAn/7QCc6FRrwapk6if3yXcqSENHLjOItoj
         GV/YLKxHgC5cCNbtAx9Q6mSZ7mtoHHIy5I5aMrBToEc8nt5fsqfRMEt4X/x9cGwEi1dk
         H64gEhPTZlU8q1vVfIc8cVCpRi3kv77lozmf9C1M/jSVvf7p53flna1B4M+8xZNTDirC
         faMWVgxvPN7ZhB8GRiGsUj8zlbloGKhqvTFQ01bEyIrYJuQkM07jpKeiRkAbOIq/UlxX
         qtjoDk5q6gx9jE/Po60aypFGMLaNundaWCOkBz5pNhRDFbLt8MYgj2TwRTcdPFdHxBr1
         ZkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875401; x=1794480201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aTbOMPeQQR/WAw575MjV+whoOIimG2HfOgrdg3UiGjw=;
        b=stTVWVQjE/60TrFh32wGEBfmbpAaImi7+vWnjuTtbux1rVE1hOkI0Udz26DEvodWwe
         J+dm7jJILNItLfc7WLWXs/WOeNkPvDOBBf5Bk2lj6igkFLQZItUcf+e2CHdXQ6WsSl/r
         JWeCdWD0wXYvhIb2l/vdI4MDX5VYGrVFers5Tm+sk08TFsgMHw68OA13cuqhayMHMbdT
         ofgVlbh++Ob09HqwJ8sKMQdFiMDJSBQQbzD6Eig+vwZz7FbIAwVXa4kzpKlc9mOxQGtC
         97VaX4fxVm8jjgOLjZMIIR7/AniSkqlFZg2uAcDhLQHVXqC7+3uatN8KsuHLdl23AxLS
         Tldg==
X-Forwarded-Encrypted: i=1; AKwUvBwy/22S0Mdw39z+Rllwj7Qk6TQQ1NlsGtC3uV/xLaNuG+xpBTEqXVAu+VDHn+WtHotUsVelOVVt9dv2+EY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Qb7XfxShN278vNyS4veTikbkiy6NbVEI5dmzkcfBzSp5TudY7
	IStUzYxim9WuXkZQQGb3JO3qqVPdQJgjGWfHs0oZwe2HFnYWBunwjHU2BmDaYg==
X-Gm-Gg: AYBFou0Bq7u9NRKqyHhlk7/3o5I7j8TvNMNVADRByRD7J+HdHdIl8JX2P/FPfc5A8T7
	X9LaKH1BsheIqYJ5qnyRzFSQJJWW3UzmzsL7PHaRL6hQWMikZnTkC0pBovZFihz4qbu3mYRYHwj
	M6o1Q6B2qEqbjUQaZxPtE5MNj/KVBk2tqwNBABGxoCkO7thNWq12mPg5YfiQHcIMP/XJKEFVdDO
	7EWSNzjSM22F3/6cjr/1+MJIlaKfM/SDyAKTgVPGPxw8/t5cpFWvUBRbdHYgxsigBP7iAEyhkWQ
	cRohrZXT3tUzA39hJ7xUWDdcOeS++Ibd5OT7r63XX0X4dTfLN36R+lY9vzTDkLvHxHjA87hbi1d
	G4nqxmHfoxqo7nHWgA4j7dOWW0xcbTVrRn3T5862aOWn0+bquKYZhGMboldaUEN33CObBYd6ls4
	ubYZxyYCbLqfvmh6OLh44YOYqiUAAxpSogztraX7rhzCn85YULiAe/9wJ2dmiYpHcx1brNmcEbN
	Wx/hFw2EZt+hJZHtiXryOi1CXnYq9Wo4IVdBYlg00a5XQSnv7FFlgSdNQkhAJDOezXKUBH/A6Ie
	60kQGiMtYdolp0Bye+nmZKkQfpOuy+xHWkc5T0AsEetX403sIyD9d8hf03psFU5yYUcyX1JxZ0Z
	UTqv2nCezvkPCf/9C7ezqYfhAH8+pPABRurkz/Epaoh1j
X-Received: by 2002:a05:7023:d04:b0:14f:4b01:40a1 with SMTP id a92af1059eb24-1ac4fc00dffmr29448840c88.0.1793875400690;
        Thu, 05 Nov 2026 02:43:20 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm15595215c88.8.2026.11.05.02.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:43:20 -0800 (PST)
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
Subject: [PATCH v2 02/10] ASoC: fsl_sai: Use optional clock getter for MCLKs
Date: Thu,  5 Nov 2026 17:42:29 +0700
Message-ID: <20261105104237.38542-3-phucduc.bui@gmail.com>
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

