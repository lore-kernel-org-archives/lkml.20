Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BFF3E6DF5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370966; cv=none; b=lisddAdLlh0DB/SEL+qsbJY3vpIrLVydMmTnSEuIcIXZzD3L7CFOi+3cBq4zTfIf20o6bQ5bOg/pWJwfyzmLn/Y8kexENXIpn/mr9bT4/ff6276tO8+RcLFoEkPXjWQ7Yrd30ohqguaI8YZrS+ZCnRGoYhqLJtRCDeY/A/ubdNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370966; c=relaxed/simple;
	bh=9pAmcknMocG7ZfJT4xEzcIhxbh9fPeGRfGyQnurOpFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HpNJThCdI8lRkTA3x3yudTxDVsaE+EPMIWJLwkhG6WrJzQDMJIv46Gvf6+kDaNNrRiwcGNXp0scXyhPWjgN9tEeiT/i9UanGbA/qh54Nfs3NeT8s4ijgpw2JX0yg2GPwXJmeeMSLrLr2EVK6zwpyhaOxqEw1Q3WeThs/wA/qH3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XVGVuakI; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XVGVuakI"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccda24afso1220339a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370964; x=1789975764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uwh/9qTX2B9aSYEX0nJr57XNF2YmYT2AWRYwuXSA6iw=;
        b=XVGVuakIWIqbnkZ9zw4nZolswlM6LLELQIAVeBajv5o/PvN9kDQ2m61or3MtFDfsw/
         n1KEVzwdD56ouX1Sc/j+91kJqoybAqeksMFddrNO8r/E67XmPnHMShNyNl1CxccLqWsl
         jdWHSnClbJ/qDEIs6ljAHUyi7HcvMJjv5k2tHkbXesgBGPQoTgVT9l98wlJHEwQXzx+t
         hv74u5VBM39DWXSOhDTWibPppjhYtwnvni3C/fOwk95GOL690kRCOQIDY+rGp+L/3623
         C2qq79A1xFaxXMXPFqG6h6v8g23ztyScP0fBLHh337zqYx8TkJFDnbElG2Wak5dmIOod
         XV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370964; x=1789975764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uwh/9qTX2B9aSYEX0nJr57XNF2YmYT2AWRYwuXSA6iw=;
        b=jvQh7EkQ6zgECbxpi470CvcRA3rr4rWniZlCQZwj3UAn3gIj2BFVfJVDgRzjok+x+J
         pobkJ7w1sSAghr2EeN+py9VynyUs9RYuoEBeZbkfpfsyjEZWsbmJRr0TFJD9ulpy62j8
         vv4n4EPlwFmk6vbfl4G/3+l3CHqSyPK43vOgjQz2f1C7IfwVZeUBtPG8wtb9+TkuybCD
         1kuAglfIqzjiStmUr2xIBGxI4NvqLYKHc1Ie7XCFTv++XOWB3BfpSCVshPOy4HnxPxKo
         x9R2HvJki/PYET4mx/zANeck5ZsS1XBynu4rFnmuxhZDSBrN2qk4+npPq3kI7QVs9OIp
         GEKg==
X-Forwarded-Encrypted: i=1; AKwUvBw8PcYQl6slrfxBp/d1iOVSBrRyrWrkV4Lpdj8Pe9fR8VLXGlZ/Lbm2smHGm8nGAO8CmPwPtgxXgp4nxw4=@vger.kernel.org
X-Gm-Message-State: AFuF++lTVnfET3Z3B8/QhgrVAcxCojrQQEQk747ixKLb2LbMeHV2BJml
	UVIgTn6ZV7tBm7qlqocFJCmt+HdFyjOYGbqJ7VlQ3OiJ8HpvSrMom7yW
X-Gm-Gg: AYBFou3ONP1PmOHr5R2LdYN7VxsmVoRpNpb0DSHpx/KmP5DYAiSCckivKjmJrZ5ot40
	EjQBvj5+bufkLNGeo3mc0JziyXRdvMIi+OMwFfjBStUUrSPZnaRl/0NwRrahVg3CpYRhqCdz8di
	iM/NOsn4MdOgo5+H5EP7kzjfcbIoWY+omU3LYdOTjXS0XoQO/FkfUjA7kY/fOHDRqjkzEQ+iFSM
	Bz+I2d0IkUyILrYAR6VrwxRsWMXJ0BfK+IISi97auPyAD+DOurdMy8771/XzCuRMD+YokMD72d1
	vHOnn5WfVFblc63jHAApmc0PZyYfvIWLdiecIkOlB2/uCPhCO5nAch+qhu98Lp3CwNei0LoQkqh
	yQtDlvEEI/mElWcsqa10eHaGxGIBEFkjNOejX7amAJFehEjerBiNXGwW1vA/87TE0D0OubQ3ywO
	IrkHf1+K3uRacahRGTUE7Wo7yWbkq8yVRRrjV0T8SPR7vtFOlcoDFu1l5RC9RMSiVO+PwXxtk1N
	04zrp/IPrfXMZB1r3EgRe28n4mBdX/rcwq3YqFP5jlJFiaF5n4yI4SlTp6lIPPc4iqjuKEMqleu
	cv0bEpgPCxmWaM0=
X-Received: by 2002:a17:90b:2789:b0:39d:f2a1:2a with SMTP id 98e67ed59e1d1-39df2a103d6mr728290a91.19.1789370963956;
        Mon, 14 Sep 2026 00:29:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:23 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 06/13] ASoC: mediatek: mt8189: Use dev_err_probe() for clock errors
Date: Mon, 14 Sep 2026 14:28:35 +0700
Message-ID: <20260914072842.24420-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() when obtaining clocks to avoid redundant error
messages, particularly for probe deferral.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 173ee0709b16..3e7465c5b277 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -793,10 +793,9 @@ int mt8189_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < MT8189_CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "devm_clk_get %s fail\n", aud_clks[i]);
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	ret = mt8189_afe_disable_apll(afe);
-- 
2.43.0

