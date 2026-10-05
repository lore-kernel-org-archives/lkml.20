Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D103F47D452
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198211; cv=none; b=iUwJm5WexqURPqtByPoBcU6zNYMz/mHLPNlrdgx/f6YO5vvdAKFPvEQSLW5JPWfviLWprHHWUFPCKkT08SqYKc7GzI6lPiaXh/DLZaJfBgD1RqN8ip73yfSbiDEw7O1v9HPbiWHFf6EYynlyHxdgg+Zl8y8wd1zvMGCKfSidO4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198211; c=relaxed/simple;
	bh=XqsJ/oamIOk0pZvu8Ad2mVMfwzmQXZjUOK1YVDL68Sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QxFkbrO2NfGHNl93+MruiXKsUwQigLkeFS9la4cUr56jBCnlMapIqNvkN7QKZJydWx1UprRN2q0JUmHIz/seVhIj1XLnTWiH1gUX76UHqX6gex3vKoh+W60z5PrTa33vjTxEJ7VJWOdFWumQ14J/1lPkekEyeqg7/KRUKqi06gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=duTO0t1R; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="duTO0t1R"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-86b90133ae8so419578b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 04:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198209; x=1791803009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EuT5sR3QJJEpUFIiZqumIPgjPq3lYxiQww7DYh2KWes=;
        b=duTO0t1RjE1t7PYmKqpS+mK06SOIl/saq3cVk1YtPoPE9qLEDxo5RI6qWNSvcXxO8C
         PwMGKF3IVj/m2qbxiH6JIoMwrECBMIQNYkYnp30usf8+Q09ASyJ7MSc5QmKrAzJ3lGaV
         BumUZCDKgSDY1Sa+A6mBVX/vHslIpYzjeWbXSFfkO2h13o5yZVx+Zc1rQuXDJtBTJGBn
         AwX5Hfn6ijOIDurqZIRmrzvpKHxowQTWLbsidqwGRJAmSxOR4oLPtkHBgYfPNT6VI26A
         awcO2/dOpwAnyKTBmzeXbGRzYvdfyyzbjYdGTw5g3ojXxRc4C5unKKX42r5LqjdF0QsL
         FbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198209; x=1791803009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EuT5sR3QJJEpUFIiZqumIPgjPq3lYxiQww7DYh2KWes=;
        b=qI27uR8vZ06cWBthAMuJ6SoJzjDIpOKuEWGEsgOgKK41iFaDhECi+LtFvehQvxE4qI
         xKAW5TwtOLt8/blSa8hgCpxcBlN6OdgmB6yFF6KzDtb89YBNm0zO/l0nuA36nMw4zaH3
         K8AWkr6Nruiz1kLmVRYwqRB4tMR10OyKQeB/NjcvqUE3rnTqRTRUTmBTqO9eul1uz3hg
         G7EXvt0KWmTmcoTfCNWWOIQThfADYv6DrJqrorACrk7g9n6z4lbzDBKr2rdhDX5kcPmZ
         vEMs7tafATEVL8s+qoK0gpyXzeCbw99mWFbmSASAGxg9UcO2e59MvXKaYk/eTxLpajqw
         cMNA==
X-Forwarded-Encrypted: i=1; AKwUvBxE+PhZarjWs6H+YOTSRZk7O7tBQeh1ix5KAaNOc4tWhvkfjoQELqrtJ7O2ICPcR/MysnHd9uK68nd5Xqs=@vger.kernel.org
X-Gm-Message-State: AFuF++n+zzvbDEPmOrLYOEoGVfcoOFGoALVVdHeigVJJFl4hGJaf9Tk1
	bHs/7lQKSRkd/EFNTH75+1bHSHE+wO6OBx70C2ngnHyfe2bMsZcm2u8iIeZBwA==
X-Gm-Gg: AYBFou2+ks44RQPzee2F2aCQxIAt1MHayztT4bnqIN90oVUJhGycUcNYlalsgdXot+8
	B2tGm1LxFT0EePxQO513w7yhDT7wMzXYAoJoUK0Wu9J7G+VF4J1340oMUnthH0i5yPw/UVuj/jv
	i1NtDs0e3CXKoOurNUvExgpG+nJSCZNAT/UhxHXHZSeycCKr5wYRpFVHSNDfA8RvdKXbQG88Yry
	+stQjuth93h2fW0qCtSmvivvQJuEw9KoRoedFez0dpAkCuvwxHjZtJaf+TJnFcWlMqwMR89P1SX
	Hzkfv+NKFReNPMLoDeTmMTtkqksZtXCKxjwmXDDQHAV6jclpY3TNkNDX3oASgr/1Hf8REMIR/MQ
	KUm9hXytL2YmIW0DA/zmITH6tEHTm8FhOV8oBUPmPSHG2PPQP8XHqypzN2zZUZNpyvY4bGL9aTq
	MsHZT182vNikYFWbp4iSgRz+jZQe7wFHqf5ESzSeCFaw27WY/u3+o4Ie6vX/Ic10Ju6nJ9GNdOw
	AEnuTYF+PsNH7v6SHZcIB39UPwvi228SiviuD72W7ayRxWyCkjbGbPB/oCKDvTE0HZ9KXvxzso8
	sdgm/Ajwhr/9od+VQ7ZKv6tS
X-Received: by 2002:a05:6a21:ed0e:b0:3dd:a196:3091 with SMTP id adf61e73a8af0-3e0bd42d56amr9814841637.65.1791198209069;
        Mon, 05 Oct 2026 04:03:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:03:28 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 03/14] ASoC: mediatek: mt8195: Fix register access clock error handling
Date: Mon,  5 Oct 2026 18:02:46 +0700
Message-ID: <20261005110257.50145-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Check the return value of mt8195_afe_enable_clk() when enabling the
register access clocks.

If enabling a clock fails, disable the clocks that were already
enabled and propagate the error to the caller

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 12d8159338be..34c828fdea29 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -599,7 +599,7 @@ static int mt8195_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_t
 int mt8195_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-	int i;
+	int i, ret;
 	static const unsigned int clk_array[] = {
 		MT8195_CLK_SCP_ADSP_AUDIODSP, /* bus clock for infra */
 		MT8195_CLK_TOP_AUDIO_H_SEL, /* clock for ADSP bus */
@@ -611,10 +611,19 @@ int mt8195_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 		MT8195_CLK_AUD_A1SYS, /* AFE HW clock */
 	};
 
-	for (i = 0; i < ARRAY_SIZE(clk_array); i++)
-		mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+	for (i = 0; i < ARRAY_SIZE(clk_array); i++) {
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+		if (ret)
+			goto err_disable_clk;
+	}
 
 	return 0;
+
+err_disable_clk:
+	while (--i >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[clk_array[i]]);
+
+	return ret;
 }
 
 int mt8195_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
-- 
2.43.0

