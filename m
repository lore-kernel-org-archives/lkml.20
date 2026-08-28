Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB5B36B903
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908577; cv=none; b=XkYEZoWEgI7wCO7K/VNx5s92eegx6pXDikZw305iDm3o4QMJekE1dhNFSArxjIJFUHrliqwxN/JnkktahbMeucAchULaxsmpJ7PRTymVSI1C0c5lveBoY6Koc03rYkjhJFNAtw2sBJK7IXaY5fV144Tc7EFFfwsGs8HcJTzCIr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908577; c=relaxed/simple;
	bh=uWaIJLrp3bYszczP+rUWUCw6rT/vSZX1BUIy643qHEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sZ4NmnBpa7xf1XYKEhkp24qjtShq0fcmNruMUrik051p7z9m7vSh+62+egzov/yml6cdE4ErxWMsKMfXSOMFs0kFbcAbejaLejBWTmv1Rt3LHOCpk1snOyb1gyx3ybT2JTJEZhlcp6anotmh7sjQxS2t92EPJFRb4WwedrlEl/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M3v6gn11; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M3v6gn11"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8534d507f59so743740b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787908576; x=1788513376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IlDfgda0dYFq9rxw3JdEQPpWay5cHlVA/Z3MyCDCs5g=;
        b=M3v6gn11d2HXWX6OpHTG4QOUVmO8mGG8GC5hjFHF+AT9/VMvYHHv8C5HvJx+8qARL6
         0E3L+FvFCOvvIRzlO2DwZjk/bwxCBRwF81jQ/GK3ltEML/gY47dBRw7XIMthAIBvA5Fq
         Q20fgwOlYlnuxIoA6UBVRkzf5azSQayT4t4N7tVVerxJz+qCk7wJSNiMj7Ky/9YbaP3i
         JkCIeFzEzjVYAN9hiZpPq5MI71AU2BSbYmgMngD+wBo3jZmy6+/VB+RxxPD5EjXxlqNI
         1DUY1AHjpMucomItBcBvXlWasNypqQ9YaxraqD/58o0muqLyhEbrq260t28UDCwWUyVk
         EiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908576; x=1788513376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IlDfgda0dYFq9rxw3JdEQPpWay5cHlVA/Z3MyCDCs5g=;
        b=QSJrzvDnTUVMo3F5gt9JkpJBunU3bqRT2JtKr31rjvYPBNF0RFrvhKDndVEGHElHRT
         JDTKkCbxRP29n2NcxNDv1G5fjSFfDJe5pn0ootzZ3oHdqTpJ5TPGIjWPdZ6+RLzgifH3
         iJVj6bFwM0z+k+8jbP1II7rGhd+/VxqJQW2guJkXOXBN07TePvmSz6q4qaNj4fpAKs8Z
         oz8QwM2BVKeSoxgq8tYrr2Y5ZasFu9sUlxJc+A96ql11AjtLv/2Y0V6f56p245YV/9zt
         BSpulB9kstI8uPcnWKhi4Rqiha2ZUcILrYcIQMhkZ5zFxplEXEyH0qJ+7++C9iPSlVp1
         eIyQ==
X-Forwarded-Encrypted: i=1; AHgh+RpMLqwrLVBmW25w2S7HlY2silR1POMnoEYQwUICcQllXQ2aSCLPHGwtbnA0aPWTo2/n6KBOGX8VFtyWV0Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mGYFL6nUplGwtavBvStp9gEqoe56hz82lztmL0wJFdxD1cnO7t
	cGHKoghzqK6JlSAXATXHM3vyVKzBpGo42VcRfbP4iM1iZYeOhea8oC+1
X-Gm-Gg: AR+sD13PTMwh/mhe1L4F/78QCVUecZSLZDdQZVVUHLHG7QERfeGi7qWM3rDNq9nq/ty
	Hb7ORvEfQrPkquFVVst/SIEV3DmwxhrZKPrXoqK5zOzP8o5hUdUKf/GVoP3QygaDca+KIJqia5s
	aYPp2GPrDQXmv+tRM1CNWNTVFdLg3lpRwICJLPEkV2bPl3JnkF9LlYmSzkdg2LAiaDX2wj5doAk
	mJQzITwxcwwNakgbT0bNrQBVsGa7TkclFdoAK5LI4hOuXBCM22aK5bJ9urKhIJ8b8N0/mmnaPu8
	jj/Fl9ciwLSlEC3mQLVaSBrL5/3pjDtc3cXYp847zBe9ZrnmIlGqcBbl6Z3VBmeFM6juGG+wJ9r
	Uy6cL2hrnynbqxYEkg5LmmnU57j+SG4PwTyN/hOWYn9Xl+H/bup11eeIzgznXm0bm94Cn007Ngk
	G6CheZBcpqED/4+sV36eMR39mhDTIHA8zkQ37XlD2nnDOfiQ+ASdART4zrmAhmF7TFkAlyECjXh
	KXzfPOU241jTlHenS91EQwE7dwDk3NFoTwA59Opwo0j+ZPaaRhJ+7z9C0UzU1pGR3ck/oTA6ggc
	ipWn
X-Received: by 2002:a05:6a00:c83:b0:853:6571:9567 with SMTP id d2e1a72fcca58-85626f06dcbmr11500046b3a.4.1787908575762;
        Fri, 28 Aug 2026 02:16:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fe78fc3sm381248b3a.24.2026.08.28.02.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:16:15 -0700 (PDT)
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
Subject: [PATCH v3 4/8] ASoC: mediatek: mt8186: Fix APLL enable error handling
Date: Fri, 28 Aug 2026 16:15:28 +0700
Message-ID: <20260828091532.600047-5-phucduc.bui@gmail.com>
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

Currently, the mt8186_apll*_enable() functions call mux_setting(afe, true)
but do not check its return value to handle failures.

In addition, the cleanup paths of mt8186_apll*_enable() do not call
mux_setting(afe, false) when the enable operation fails, while the
mt8186_apll*_disable() functions do.

Add error handling for apll*_mux_setting() and call mux_setting(afe, false)
in the cleanup paths when mt8186_apll*_enable() fails.

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Return directly from apllx_mux_setting() instead of using a goto label

 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index b3e938088a7b..85fe828ca5ae 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -361,7 +361,9 @@ int mt8186_apll1_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll1_mux_setting(afe, true);
+	ret = apll1_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL22M]);
 	if (ret) {
@@ -386,9 +388,9 @@ int mt8186_apll1_enable(struct mtk_base_afe *afe)
 	return 0;
 
 err_clk_apll1_tuner:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL1_TUNER]);
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
 err_clk_apll22m:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
+	apll1_mux_setting(afe, false);
 
 	return ret;
 }
@@ -414,7 +416,9 @@ int mt8186_apll2_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll2_mux_setting(afe, true);
+	ret = apll2_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL24M]);
 	if (ret) {
@@ -439,9 +443,9 @@ int mt8186_apll2_enable(struct mtk_base_afe *afe)
 	return 0;
 
 err_clk_apll2_tuner:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL2_TUNER]);
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
 err_clk_apll24m:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
+	apll2_mux_setting(afe, false);
 
 	return ret;
 }
-- 
2.43.0

