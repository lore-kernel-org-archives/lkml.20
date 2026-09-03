Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6463833939D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 04:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788411180; cv=none; b=HikvEemSrBFr1L5t6kr0qep0oCXC8oA7rJyJKx3kOkS9HdeixvQnUHCXpEDSxUZaU5dohi3eMmMC80SSw7gbDWi04h6nzXoowCsZZ0N3fXlbWycTFQvw5lkI3BDgDNGx24NwVg7gzTM515197zPZHRWYxg3925EgA9mjT8EM8KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788411180; c=relaxed/simple;
	bh=YO0IOWBf+lVgCQX7sWvBD+Ngwz+1wef3xZYXUiMvXPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P8BmXFuVg4he8BIndvSzPpdVmrUpzi2mS6mTWld9nemQacX+3tph0XjrrqSqR6UHCS+dq83xMTVdNol4WBuTM0/65BCYD7yjQyExiwBP1JMueTp3D18Tbd24mRwubaxA65kAJ9gYebeqdD5uKjUyacKGx8cWHDhpbkDtFNqFMYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/9v5E5T; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/9v5E5T"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-398b1e63c49so583223a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 21:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788411179; x=1789015979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FrPM2Xk8RwUrDDJTGII+4iO1GsIG/syrGzbLRZRG6MA=;
        b=h/9v5E5T+BrQVw8sP3ewZoQhCLCM7f9OIBttmrAPRIg0VWW2kKOOmvdfeq4/1kcnAX
         f2aqPlHTvEZunlRi4JMCx2IdvEDeBoYuBt9k49nfiSX2FCt0KSpGu5je5LQu9idq8vr1
         EhIJNCGJEFzL+KCD5lUN+tEr2N41EDCOBuN4lPhyys/Qbw3RI8XOhQ+SDgH9x17adkUi
         mbOMR8H+Cy4gT6DCgFG8ppYaJVkGnz/05wnzqswY9tHbovOS1dYPfd0MWSgYroiYOvqp
         MgNNFvyrd3Hf3riRso54HaOrwXZkjj0c4Pgx8U7SLpQCYUjuzAVC8Z0OE33QAcGY79cL
         5dig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788411179; x=1789015979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FrPM2Xk8RwUrDDJTGII+4iO1GsIG/syrGzbLRZRG6MA=;
        b=iyEIu2wWgH/Z8al+5emtxEBmuR1PJxt+gRGElZ+YA5EwshmSG1Vtw8uG8rASCy4RkN
         rB1x0YzSG97WNROHiq1CR1/F78ObIL46SFIujhPet971kWFXu0F3JbvDvbnj22uel6gP
         tWAZs3/lq9lDZZkP/V8mjghF6uK5QZUIFNBBor0SH/Wy4ql+xiAXv+ND0rfhn730kXXv
         R1rDg2gFWm6ROZ0L3NAe2983FCN6OwzpJtf4GF2l+by303YygbaWq2BnIWuWKMJTA64V
         CMfn4lZujZwSm0tUXuWpZ1GS8PIIlo4Xblqa9tj3otvNPbRtiud6umvmKkh6hhv86ESs
         qk9w==
X-Forwarded-Encrypted: i=1; AKwUvBy9qA3GjreqphExeQOVbULgEA5nDD5NSEFdo/PPQaV2BAsVQ+OGWCRb9CyRaOkxWSO6Sw2C+VqBkH9APSg=@vger.kernel.org
X-Gm-Message-State: AFuF++mSDfVbol7wUzsCdmtcx8fqBxEs4B5+E77X5jRh0WSAsfEhokj/
	x6Mag5xESadGvvLErdHy+8pc+qR7KC1+Pf2ZHsKlwE63wOsnxgpdEvpf
X-Gm-Gg: AYBFou0LoJb86tR8Ed2bwPhLL++Sandr0joAHoqrON25WFWKMOp9TgJ0OZMDVIOjhRC
	ftS3H7D5bUOHbiw4G8quyTPCKKU2y43G6bpSYMfH0PUJ2iIRRdLSnISJy5gjpdoVmR6QF2NuGCm
	ZSPHTcmMOkpzbZeKKDiGUACMLDhScoeMTx26oGgfAYaoqFFN6xsi3CLrZ2cyz1pNoW2djHIwEDH
	4GuJLot13rs7eRHtoa2HlN6F1xBUKPaRU3HBe5DSmyPCiKTNmTiWI+YjuSG8KFrvoLFvo8rOfnB
	3mzooo+65jhDIMCIXDY+i3jYaMqEB1OZrvsen58Oms+NpvFY1RVV68448kWACzLHLqLX4Nwu20r
	xBVl1w5d7x/RaTyCRVG/eoPRYuAIdD+UZwQnI1EV91cxDNRm4rglI4UU674Yq9JhRbSCeKaZyeQ
	4yXmTN/nxOool6oVlpdA9ec+08wn7ndQdalEOIE7J0v0jNPwf7nQBl2z02huasahz/0qKOIGJ8j
	7s0kNj5SGSdk5zJwPkzlDzEGpFjSVMK2pOrMgLLQ7Rg1LBXMHdlc25EgJ6z/JqACRhqwV8J3dez
	qpJh
X-Received: by 2002:a17:90b:2d84:b0:398:9bd3:d6d1 with SMTP id 98e67ed59e1d1-39b132964ddmr1173209a91.11.1788411178721;
        Wed, 02 Sep 2026 21:52:58 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d7e8sm2747538a91.16.2026.09.02.21.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 21:52:58 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Shunli Wang <shunli.wang@mediatek.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 3/5] ASoC: mediatek: mt8183: Fix APLL enable error handling
Date: Thu,  3 Sep 2026 11:52:01 +0700
Message-ID: <20260903045203.175337-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903045203.175337-1-phucduc.bui@gmail.com>
References: <20260903045203.175337-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Currently, the mt8183_apll*_enable() functions call mux_setting(afe, true)
but do not check its return value to handle failures.

In addition, the cleanup paths of mt8183_apll*_enable() do not call
mux_setting(afe, false) when the enable operation fails, while the
mt8183_apll*_disable() functions do.

Add error handling for apll*_mux_setting() and call mux_setting(afe, false)
in the cleanup paths when mt8183_apll*_enable() fails.

Fixes: a94aec035a12 ("ASoC: mediatek: mt8183: add platform driver")
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Return directly from apllx_mux_setting() instead of using a goto label, 
   as suggested by Cezary.
Changes in v4:
 - Add a Reviewed-by tag from Cezary.

 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index dd1a5925af96..06556689976d 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -376,7 +376,9 @@ int mt8183_apll1_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll1_mux_setting(afe, true);
+	ret = apll1_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL22M]);
 	if (ret) {
@@ -405,6 +407,8 @@ int mt8183_apll1_enable(struct mtk_base_afe *afe)
 ERR_CLK_APLL1_TUNER:
 	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
 ERR_CLK_APLL22M:
+	apll1_mux_setting(afe, false);
+
 	return ret;
 }
 
@@ -430,7 +434,9 @@ int mt8183_apll2_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll2_mux_setting(afe, true);
+	ret = apll2_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL24M]);
 	if (ret) {
@@ -459,6 +465,8 @@ int mt8183_apll2_enable(struct mtk_base_afe *afe)
 ERR_CLK_APLL2_TUNER:
 	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
 ERR_CLK_APLL24M:
+	apll2_mux_setting(afe, false);
+
 	return ret;
 }
 
-- 
2.43.0

