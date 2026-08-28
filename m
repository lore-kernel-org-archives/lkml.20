Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E743876CD
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908575; cv=none; b=RcT8U1JFJSgRD8P4x0LJKjTsm9dV45gMLfyiNgvTiuUV3g9m2xtvQ2gcBBEdE4hDFazS0+nAxiitb1GRoBmFl07u2LDT3+sOKSdgIhLzmAx6Di9e/1hGPAsfUkiZ/vB3CNeSp/4zBYs1j2kDqG4U+jo6mKKMhSB0sqZb+3nmU7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908575; c=relaxed/simple;
	bh=LgWe9C3Q+Q2sxxa3s225OxRX5s799/v0ot6Hkn693Po=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZfH3cEEGgGnlOVw7PN97t9sJC7gaxFpS4K/1DauV4lJ9gkHLMIhBfdfzMinWzKNO5XU3ZViwqsviLEuOonS/Lee0Tt3M5303JWJt7eDi0AzzZM2tGeCkvHLfA8DbBSXXhqJbi8+tiCMTLfNbJ9S59pPyRgWXZpPYr6irBPO0Bzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQrhMRVL; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQrhMRVL"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84faf0fa17eso692071b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787908572; x=1788513372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1BDXxXSUCLeZPbuvphrpbuZ7FoRllZXIG8FCJIUlfc=;
        b=jQrhMRVLXhAzqMVN6rtHI7KEeYWfGsrmaZNoUWWLhmoPRq5pDv65H+avfqdZjWjJjJ
         cHVJh17UpgZvS0pv7cOn+jj3ovORVv7Mg9o4xPBWrSPe5J8KVmxVYuchxlPA/fcA5cMz
         oahICgdwaM2k5/7iSvSKNxwOVqbSfoTPtxt/xB51kggqyObikLQmZ1KvMa8Y9IXExPoy
         UKs3YpQoyzOliweykE302adfxlKEhTAMC/F5aJs0a4WhN3shUOvORDk55b4qO7/1yoDp
         gx1AepnIcziOHEtlZV6x0r7mWCPonzP5mTvhGCggbvEgu00kbm9EYgphsz2VpGMDiB24
         GBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908572; x=1788513372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U1BDXxXSUCLeZPbuvphrpbuZ7FoRllZXIG8FCJIUlfc=;
        b=YYzucjyKJtQKHpBE0agoFdBMqh4JuygPaUH05fQWn4LPuayZEAngBZBM1i0Ce4SKAz
         dv2beWHexNd4mxz4JnoLuk5LZydGzXM4xUmh/9IEHIIupsaqNH3Fia3uGFl2d8AOOLmO
         NrB1Il1X68+JQ2W5KCyyiRIOYk4Wry0fra3Iz8fcWpZsQ9++ChDVEqV5eAkbdHZ/n3Vx
         PGrcFAPY7fbIaMteiYk4SzwIC1AmHArqORLqoh2lFXb4mb8AAwjkItCkbw449MoegVnB
         X3cDOBkaP3+B2hCiuRxiMSwrOf6l5tnPcpAkV/rsXzotFxjwsMxn60+AmYEQEBDl/2jo
         as7A==
X-Forwarded-Encrypted: i=1; AHgh+Rokd1ROF4FKYM5u9QC9PA2pvt7DVCDFiZp993RcuXx4KE1wPjNErKX1/JkhTmQiPTev9sNV4s+NW8e872k=@vger.kernel.org
X-Gm-Message-State: AFuF++kXSH6kgZV4jA2ky18Uf+9z8RiL3gLB4f2iTyNFA6B8BSvb9pPr
	gRZu2I8ICJPAo/OKCo+v0h8roi7jDRKVHdzYORnUDtQJBXFVvqafG/7l
X-Gm-Gg: AR+sD12LGvK9g/cxZgGlzrS1YVi1d420xOrVwz3oEw1YOkiTS12mg/5ihNLonmcEpUf
	RgGwbjhNm82gLAkfFuKRmoBlAE7Byhz9U+FkA8yJdDC/+7G/Yi3TWS7lSZKB9GqPsIGNEZAqxDB
	se+zxHJx2BcvC+rjIpZTwDKTwvNUnztrgssbRalpZ+qdglerKYuwIHF5V8cvjw/rOPCPYb40hD+
	OIWDFS5usVpN0htDCYmXlKDQSxMPwgIcGCzWlj51lz71JiofpcVVdA51wS30/l0XK+A5rbT48AN
	VjrZhROGVkYqIy72gteAmAsYU8vPzfuRNPe2seQxg5Enyyqc+pK3b74gXp6tLLPXxg0O1aqcBzF
	U8LjS6DKjhvyCxkNly+eCUGjGUc/fgOM5U6BLW85uSjDCQB6SH2kf0FsOMsc4W9AUKY4yYCkqfR
	62WCtX625i4TXzxfG9Mazo1XceDUIL95ty21JPAsJQGy10ywTuWkHEed4vhpp996IwbL9O9svVT
	/0KV7MZDcqKQTH9Tdmvn5z8y/K8eUUJp3FjolkfepiljwlcA+eqn6hPlDolu3VHE1v7Xr8qO1T8
	0u4o
X-Received: by 2002:a05:6a00:1143:b0:852:131f:b9d2 with SMTP id d2e1a72fcca58-85626f06db3mr10697213b3a.2.1787908572039;
        Fri, 28 Aug 2026 02:16:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fe78fc3sm381248b3a.24.2026.08.28.02.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:16:11 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 3/8] ASoC: mediatek: mt8186: Fix AFE clock error handling
Date: Fri, 28 Aug 2026 16:15:27 +0700
Message-ID: <20260828091532.600047-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828091532.600047-1-phucduc.bui@gmail.com>
References: <20260828091532.600047-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The error paths in mt8186_afe_enable_clock() do not consistently
undo the clock operations performed before an error.

Fix the goto targets and cleanup order so that the audio internal
bus parent is restored to CLK26M and all previously enabled clocks
are disabled before returning the error.

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index a517aa67abf6..b3e938088a7b 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -296,7 +296,7 @@ int mt8186_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIO],
 			aud_clks[CLK_CLK26M], ret);
-		goto clk_mux_audio_err;
+		goto clk_mux_audio_intbus_err;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
@@ -323,24 +323,22 @@ int mt8186_afe_enable_clock(struct mtk_base_afe *afe)
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_AFE], ret);
-		goto clk_afe_err;
+		goto clk_mux_audio_h_parent_err;
 	}
 
 	return 0;
 
-clk_afe_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_AFE]);
 clk_mux_audio_h_parent_err:
+	mt8186_set_audio_int_bus_parent(afe, CLK_CLK26M);
 clk_mux_audio_intbus_parent_err:
-	mt8186_set_audio_int_bus_parent(afe, CLK_CLK26M);
+	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
 clk_mux_audio_intbus_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
+	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIO]);
 clk_mux_audio_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIO]);
-clk_infra_sys_audio_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_SYS_AUDIO]);
+	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_AUDIO_26M]);
 clk_infra_audio_26m_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_AUDIO_26M]);
+	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_SYS_AUDIO]);
+clk_infra_sys_audio_err:
 
 	return ret;
 }
-- 
2.43.0

