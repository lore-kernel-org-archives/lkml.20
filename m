Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEEA3358B0
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662333; cv=none; b=hpet0WP55urjrNVRA0SVOUMLwBBwxhpNpdORPkNH089h81s59yzEacFwQYzyyJFPNpd1sIv3EdWN5ckWLqzNXFLQvKNlwuZEYvtT4AeBGXf/KoCEpTy4StreKO9c2LPdAVASnY+stRa4TAGP6IL0dwtbnvSuSJx4bwscu7ML2co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662333; c=relaxed/simple;
	bh=wQeyLinuu+WOuieHCEmL9Z9wKarJd6MhscY8RHxTvis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LjwmwRboNGMuEts6VbcIrfZscDzXy6cRkgmEc36LCqEghG0mdduYp9scAevwTYqG/Gb4Us9v2BpxbMavbt0PFjikbvWcv109OsWNr9CPFYY4yq3wm+clQMHoLfszIjFF0IjWnmtzKDuD9ZaRWk9SIhqlCkdFMJcdp3YTvRQjloE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Em0OS/zl; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Em0OS/zl"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccdaea75so1410156a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662331; x=1791267131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PkrZSWPLPilS0VQS6JpOnVfLzUocbaP/bkS/pwSTo4o=;
        b=Em0OS/zlP25dNaivw70foLvDhseYa+cAGnZEVOy6RtWdztmhW2HtWlLpdi3TXwum5w
         CAqo5jlSpDPA8Alx+EEl8Z837BFPIZzfDHaWkTlS+XgoxmuweitM4b97QKHNnbsQ7KtL
         pgQsFySVte456r6I0f13Ja1CePQDE/Duu6Tp/LQTMxsPU1grmtzNi+UF/MSh9QIk3DPM
         UQcSgGXhjwhpUeqsBqPwuwvtNwl4QnWvRSHP4z0ZcHIgt3UX+YR/R51uMdJj3IwRetD3
         incTm7kUHqzs8wBOxMx5qafWgua6+qCzeHvLVTH6vEZrlvhIU0Rl7m4107oCLM5f5yII
         gV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662331; x=1791267131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PkrZSWPLPilS0VQS6JpOnVfLzUocbaP/bkS/pwSTo4o=;
        b=MN4nqAztwv2D9YD6HneKo67WbEnlWNxP1v2r1S5/BQXdcN6cVggxNyG/QT9VzCmscy
         2a+BhFgEU+RhSX6athbadwqbAeY0niW8UaE13zD/h+mQFNz2P4auEOF+kuL0Kv3OYpaI
         bNjkJwXyWA6pYpCN/HYcwgVhcK2bZonpDNXZfr984JpCYK9mWyDUGbwTgQobKhm0oPUF
         Yeut6FWBF+xzWGXAGjIH+wlWcPnHl71QVt+hVPMEb6D7UYwH1vM1QRyyhLQul+0p5Uk9
         LAu8sWVeFp2ajt0u6Lw/3pgLVY5nNccmaowTUejPnHRug83LmdgdE9UVPra62wRFrKMv
         4k5g==
X-Forwarded-Encrypted: i=1; AKwUvBzEn9L7xwvwj/aM4vxM98wcrGHpognDiF2JRJE3hQRjqOKuq644zHT+IHYrxn83DskiNAEjUCfggRgHrqg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0VXkTGlS4VuJsjWj6Dzo5x+ROSwB8G0PWeQ7PPUFc3h7kXHGI
	JF4LSjv8uWMpgTV+4ojw8Ui54BdAHGh6wAaP82ivw8wQnfi6J3tN6ocs
X-Gm-Gg: AYBFou1QVWpfybsnnDGQoWsaGLeNmCamfpyK8fKwltlv5tTRMu5F5zMqzqA5c4D0oUH
	P5pOVltHtiTEk3ynsQvtpmtpzEjeW1m/C3jXvYOMes1zlL25v4kMRZRnSBe4WGz64VAjXarODzW
	zEOcYGxuCIphwXau97xmud6X7mixz37lThD0thgeQ9NYQGIcUo1GDvj4C8t9voI2/eH5wWFgJWI
	PVddxMMzejlvhAK4AZ4nza69As1OKVpgtyC2/xHtJn4SyAjP6VgGX6NVjch2h8uPWx6vrsdD1I9
	uIEpRrkhGh/RJjD0A2NImbPDfKpAV8wm6OAPl3q+WRrYDB4d0FK+yboHSuerY4LzXjlRLK8mILs
	zbhzGmvJStcc2Xu2PaGa51FA/mrvjAx+oF+E6UeLemoREwTYJ5jBJyM++MgUR3KuOaUZ2zgv80P
	8/NsQ6wTh0E44jtGDDst5sbp5XtLd0PPaTGkUT/QJs8B+u2DHjT1In0nxhZTgxKwIJiwm8fOn7Q
	wO736AA4sQAvHOv5bySsXJw3szZANlh3NRn3qJC0bhOkd4i0KAfateGD/Cp67lSKfKK0+lbK53f
	LxwYfevooXpm7w==
X-Received: by 2002:a17:90a:e7cb:b0:3a0:f4ee:d2b2 with SMTP id 98e67ed59e1d1-3a49c1a1183mr871310a91.32.1790662330868;
        Mon, 28 Sep 2026 23:12:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:12:10 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 03/10] ASoC: mediatek: mt8196: fix MCK error handling
Date: Tue, 29 Sep 2026 13:11:14 +0700
Message-ID: <20260929061121.124001-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929061121.124001-1-phucduc.bui@gmail.com>
References: <20260929061121.124001-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Disable the clock if setting its rate fails after the clock has been
enabled, preventing it from being left enabled on the error path.

Fixes: 7384ecab34eb ("ASoC: mediatek: mt8196: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
index 1dc4210e58c7..1d107b85d03c 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
@@ -502,8 +502,10 @@ int mt8196_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 		return ret;
 
 	ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[div_clk_id], rate);
-	if (ret)
+	if (ret) {
+		mt8196_afe_disable_clk(afe, afe_priv->clk[div_clk_id]);
 		return ret;
+	}
 
 	return 0;
 }
-- 
2.43.0

