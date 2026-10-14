Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C744F7CBB
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977318; cv=none; b=NxOvKQ/njz0q/7apWmc2wUJIjRKOfXHI3VefQBR/5O1g3XryAX58CtrAxyr77+v5YBXEJM3W3t4WA+kHY5tDjmx9zgV1/j9y5E7IMTrab7JXog3rm2XMXXJId56Az0NdMTh23iRigmZBbw8eVXgMbO9ZgvGUdoNtYaHy8KhhDfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977318; c=relaxed/simple;
	bh=CBFoQ/JED49aNVpvQnDRN1AI4eEnOAL7do8R8i0kTe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZXPL3+ZO/F6BZWdqegp3i1SlxGXWWFQxAlNtsHM7micDQfBeXW4YQpGB9//kopC5YvGgNj5JS6mfZkDgU02gyrT7yd1ZU6LwD/9ZmC+lSy2UHnXK5Uhp7Ur4b8Wv6iw1TRrWuZaesmQlE62P0NbDw76PHMvQDLm3C7J+D5fF8GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NvvgCycO; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NvvgCycO"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ab4178ee33so2193216a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977316; x=1792582116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9H3uMbxcj8IZv2bcwWfPBQqx6AQdPe8IXejTikxyd5Y=;
        b=NvvgCycOKTyxVw9ZnZyshjo5VxYtTDq7VV8VwuHiMuK61ZSu440Zm3LapNhzi5di5e
         g6vgsBNLzdjIEYSRIuygKTPe1qkih9D2+yETDZ8s+IOywjCJ12XK6c7+cv101hS5UaJl
         qR3j7n2P3ycnqwyh/OBAsE2+vD34RMEFKhwqAz4b6xvJIKwK4I0px7ueUBvfaKFFxMeA
         ny6u5EytbUCFyK9oTeiZ1p9czcyB/sKFD6tHcGrV0KG7EPYKnBqAkKoqtdn2i9Ukjqlo
         U99Skg7PC+HqDqLqtP/U2ZQ6IhFxLbJ3gK2DmUW6ZJX9bQNJAfxx+CXkMJbjRo1CvqEz
         jgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977316; x=1792582116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9H3uMbxcj8IZv2bcwWfPBQqx6AQdPe8IXejTikxyd5Y=;
        b=x8gDaIdxkyjdT225kW3p5MlNIqRZuqYo6+b5OfyAVwq7Q01HM41uB+Rn3dZdYhta1t
         xMKRu2HfZySbUXh5C04z7e5rwN8qLpw1/3mIcm/g3SvO6zblrp/MBPmktlWMqcbxoKvV
         3ZukGi2JJIbWfvBETO+redILdY3sn33TsEvlvqRdvYWYLU3QD/XD2OnPzhuxtUT0X/Ca
         PrH/cMkYnuDdT9V4mW2l3y5Swt9U1p2hEsgouuyFi49PKEtFw4ax5q3JMzZhGn9KGiaw
         o2H31j6bhLUiVgwFsdlEXK4vWzuNfpmrpPtsLXfzNbmytaLZxfkYrYR5EwjCs27I5PEs
         dB9w==
X-Forwarded-Encrypted: i=1; AKwUvByHCjlHYZvtrKYAxO1RAOe4F9Ygm0vggRzipfXThdLyaF9eRkLaBThKCMFOfEHFRTrdYrosK+tyoZxAymQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIo75HeMvUEaeWDzO/hFxQ7/7em4dyWZPpGiVStQHK/mazhIwoM
	ymQwNVOwhFIU5yGfrmXvi3/PVo4m2QVsZwxWU+MnfIhSNuFXsL3VrKxS
X-Gm-Gg: AYBFou17dLAUVZt0EGvwoEkrpHCj1dgTtOXf7mDL4VbWhOU+ZOBwqZapOygnqRGdkw1
	ntKYtch4spPdLt202ZJdEPFSlxP9/vAeTfHA11OGT5E6j3uhCC9q3Q/VhDNbkuSS+sWqeKJbzgK
	8chrrM4j7nW2wVQ6ER/7hZlt7UcQCfwQhWdLNLQyJl1tGFASSuWDsxzwo+wGWpuuvnaNmbgSOOx
	ZtwV0f/aWjp9F5M/D+R9uNmmi7KIamkc8cmSb3iTXvx/ei/XIfhxcda0Gqe27kC+i4XiCUD6vpH
	ffD/fdfhIXlvAxiirJFFMYuMsMxeIzXtvgE5JCGAIL5jQjd6MhzIqnv9QCrNw85fOT+gn2auTs5
	BDBKNEaVbXsu7ZE/RyELgkfvzgYB6yVP5m/wtQsRO+UK9SwrvqGSXQT3qVsrZ/QXt+n+Sto/rHM
	tlRHGd6KP4//Uv2HB1U5vNIpmTs9HjSW8ECNFgYrtoDGbnYpqT1t43rMZqedUIh8GAZmu57ZnFQ
	PtCGWNgjk0Dg9PmBkX+s61yNa2Z2UjAYewoKuPEoN3t8Sc5ppKMHL1U/5RTCW+Xf4gW2EXLjLTS
	5Uff9JTtC5VzAA==
X-Received: by 2002:a17:90b:510a:b0:3a8:e2c:af52 with SMTP id 98e67ed59e1d1-3ab3a93eae8mr12248948a91.24.1791977316276;
        Wed, 14 Oct 2026 04:28:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:28:36 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
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
Subject: [PATCH v3 04/16] ASoC: mediatek: mt8195: Fix timing system clock error handling
Date: Wed, 14 Oct 2026 18:27:39 +0700
Message-ID: <20261014112752.683032-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Check the return value of mt8195_afe_enable_clk() when enabling the
timing system clocks.

If enabling a clock fails, disable the clocks that were already
enabled and propagate the error to the caller. In
mt8195_afe_enable_main_clock(), return the error instead of continuing
with AFE clock enable.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 34c828fdea29..03d2c4fd1f85 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -662,7 +662,7 @@ static int mt8195_afe_disable_afe_on(struct mtk_base_afe *afe)
 static int mt8195_afe_enable_timing_sys(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-	int i;
+	int i, ret;
 	static const unsigned int clk_array[] = {
 		MT8195_CLK_AUD_A1SYS,
 		MT8195_CLK_AUD_A2SYS,
@@ -673,13 +673,22 @@ static int mt8195_afe_enable_timing_sys(struct mtk_base_afe *afe)
 		MT8195_TOP_CG_26M_TIMING,
 	};
 
-	for (i = 0; i < ARRAY_SIZE(clk_array); i++)
-		mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+	for (i = 0; i < ARRAY_SIZE(clk_array); i++) {
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+		if (ret)
+			goto err_disable_clk;
+	}
 
 	for (i = 0; i < ARRAY_SIZE(cg_array); i++)
 		mt8195_afe_enable_top_cg(afe, cg_array[i]);
 
 	return 0;
+
+err_disable_clk:
+	while (--i >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[clk_array[i]]);
+
+	return ret;
 }
 
 static int mt8195_afe_disable_timing_sys(struct mtk_base_afe *afe)
-- 
2.43.0

