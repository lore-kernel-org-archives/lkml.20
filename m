Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440733C7E0E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311823; cv=none; b=Ynt2lCKgd0cGPZUd+sKjSGe+XKgnzQw55Iq6ZpFzCnfV9A6kIKW7d0U5dLM7HQ0mgXjf9yuQ4EZ1YE5y08CsAY+uZfM79OPtHIksBj7sx8stKawn8n6ERwrDrPODg9urCNaAfexhUDv+yTHa02hBI9qEVJmh4WtvMKuGWHnMDXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311823; c=relaxed/simple;
	bh=VY6f9l6xjiZWDVL8eVXr2ycejVLxeVsy5j8oDBYt7EE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NzSywGq38WWlpmFH2c1bLqJkjlLlLpW7OAuKkHGRtObRB4x6otzbKSKEh3zjcmuctP2i2LFrUFNcpkpJLSw1SLY0dQDv2Yq4Gwz484oMhEE2gPbTCVWOYLT0foVPLrcmvd+s4Jhlbs/JRyiwGujeVY8ttFyAtICLR/AWtEkUfAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IeXvqNHp; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IeXvqNHp"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd53691be5so2953795ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311820; x=1790916620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/rr9O3pSXlopPJwpXTp6LzZ1GSJi+3cpwZPBmE56Frg=;
        b=IeXvqNHp+y8x4/I+EgurKQ6JeAeAw4/xIVqsQTNsH8cfZgx3lj+n5UWxmxmQHG2fg2
         CdaDX3Fc4W6NLmxZf+3xF3cTH+n1lATfyOdHQ9ff3gDFzTQPQnnfuAx8g5AKi8o9ENg5
         HWBTz3j1k7SOJTbWnqzKIkO7JxayqCX1CBhEk5gH/pX2aTv82d9OETRzwZfd1+bqsbjb
         /CB8UCSvll0MXDZWtXezd4wtu01csupMaudaZShXJcTqWqQOWfJMQnpD5G+JIXOtNi8p
         CqFgubp5DmOPKPq0HS4XW2Azf8aDK5nq/OmNxFvrJTJTJN2bhTxK5tDGfFkJ/pw1QzW5
         /dgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311820; x=1790916620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/rr9O3pSXlopPJwpXTp6LzZ1GSJi+3cpwZPBmE56Frg=;
        b=jFbgdPbVxVQ18hoks+Qekl5eaDFjDz97SGFtVWSr77d5AcuVI/NcLzZW6ws5NBmI8W
         ZOfR+VL8dNEcrhUHCnCUwR1fXkAhFd/eKAig9MqZnleB7NrJiZY/i/G5k13YSpYMhqYp
         pN7AgC+p65jmghgL1bfMTDeQuPS/3bGbL6bP+SXl3j47g3qxjoqHMgL+AN0S+5y8XVhO
         r64anBhfV0S2FekixVn2rqym84Ec37v6AcMjejj9jEdX0krmdZnv2qj7sVhWuSAzUCl3
         B+SyEvPgNZXYo3bjxQfMCS93v3fCKCA76e9WIGbT5Z7QD7L+o3L5B7/0JIcmVEVMrn6F
         kYGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzo76RlXkCuulQWi6/TDn45DOFQyBbsuYFzoL1fpmBKLjZjhm2F8cRmOz4NPNv0TBmCBQSugUnjCppQY48=@vger.kernel.org
X-Gm-Message-State: AFuF++lM0eTP/64V2+GiQSDkye16xAuF9gFILZDci1KDMAYbLupwakjM
	3AO/x3GUdXNign9j2rExy8DH+dzsERaHmtu7n0kXGJdqpEeMKPvFGTDv
X-Gm-Gg: AYBFou0SXQHzQPzM15w8ftKpvKi8D2S7aOKiEQYCyl3QjCUNM54MjP8Zpqb2G0wdc2q
	wjXmlDFVMwmnCx+O16Vx11FH1f/f3TgHwzBbcFPhxgGwJKrHfl3e6NQbtia2U9aOS9ocSVtvU6z
	C/L1QvtKHl3+lMK5ZrbEPLwzXX1njqSvJT/LnXEzkGD88YQPsj0zhJbcNp/36pOWdGMjkchV2lQ
	xRrLsVTGSrxDPe26h0lbgvjrtJoT1wJY4dT91DuJ75j41Nd/ZwvyvrXKB2BhhItzmvzEFzVG/g8
	4BqTgWlrWDUQlmzDeYBk2ckZ4pjMYAi5JM+tuWpFEJTxlYmCICggYpluboS7UtsOHp6uVdIrQFQ
	YKI4v0sqbUuekXRnCcbkP03eXy9iWySV+0YyRCBgTSfYT1qEQ2cuZRhNPAhe2Q7Ka5+b9dG3fPO
	SAuwXlmWIWO1TOJD2Ewo8vdy+vY/fzufl+VQnG/fXlX0P+9rjC/1PMSz9qOzF3P4kPodu3Pes+Y
	pjQZP6WEgHnu9xyA2mja+yNwSnuWTsYBQGhwLqYmmUcROe9u5Zs1BQrFaxmD9IhPGWS3C+ghGvM
	avkS/B4C32KoNQ==
X-Received: by 2002:a17:90b:2d46:b0:39e:6c6a:657f with SMTP id 98e67ed59e1d1-3a0bb6606eemr886083a91.66.1790311820391;
        Thu, 24 Sep 2026 21:50:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:20 -0700 (PDT)
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
Subject: [PATCH 06/14] ASoC: mediatek: mt8195: Fix FE startup error handling
Date: Fri, 25 Sep 2026 11:49:00 +0700
Message-ID: <20260925044908.450775-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Check and propagate errors from paired memif clock preparation and
PCM hardware constraints during FE startup.

Unprepare the paired memif clocks and shut down the FE when a later
startup step fails to avoid leaving resources enabled on error.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 40 +++++++++++++++-------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 1d3e01e2c3e7..5e76625915a5 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -364,24 +364,38 @@ static int mt8195_afe_fe_startup(struct snd_pcm_substream *substream,
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int ret = 0;
 
-	mt8195_afe_paired_memif_clk_prepare(substream, dai, 1);
+	ret = mt8195_afe_paired_memif_clk_prepare(substream, dai, 1);
+	if (ret)
+		return ret;
 
 	ret = mtk_afe_fe_startup(substream, dai);
+	if (ret)
+		goto err_clk_unprepare;
 
-	snd_pcm_hw_constraint_step(runtime, 0,
-				   SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
-				   MT8195_MEMIF_BUFFER_BYTES_ALIGN);
+	ret = snd_pcm_hw_constraint_step(runtime, 0,
+					 SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
+					 MT8195_MEMIF_BUFFER_BYTES_ALIGN);
+	if (ret)
+		goto err_fe_shutdow;
 
-	if (id != MT8195_AFE_MEMIF_DL7)
-		goto out;
+	if (id == MT8195_AFE_MEMIF_DL7) {
+		ret = snd_pcm_hw_constraint_minmax(runtime,
+						   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+						   1,
+						   MT8195_MEMIF_DL7_MAX_PERIOD_SIZE);
+		if (ret < 0) {
+			dev_dbg(afe->dev, "hw_constraint_minmax failed\n");
+			goto err_fe_shutdow;
+		}
+	}
+
+	return 0;
+
+err_fe_shutdow:
+	mtk_afe_fe_shutdown(substream, dai);
+err_clk_unprepare:
+	mt8195_afe_paired_memif_clk_prepare(substream, dai, 0);
 
-	ret = snd_pcm_hw_constraint_minmax(runtime,
-					   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
-					   1,
-					   MT8195_MEMIF_DL7_MAX_PERIOD_SIZE);
-	if (ret < 0)
-		dev_dbg(afe->dev, "hw_constraint_minmax failed\n");
-out:
 	return ret;
 }
 
-- 
2.43.0

