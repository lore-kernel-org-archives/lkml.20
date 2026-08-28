Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8782C11C4
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787893565; cv=none; b=dq8Xv5aGUgZipDMkWgDA9zFu3B6RaXJNGNqmIQEARkVWOT7KrXEvDKL9KETELWO5/eVP9SS31q4+11uwL8vGZXnuzoLy8jjNNS+SrsraP6LGxXsJxc2621Z5J+nCXCSgJ384sYVvu3vk3/9d5sAC16SMYx7gDAAbN+PxPgFptfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787893565; c=relaxed/simple;
	bh=Y/jz3BDQzxg+BSmZzlkipWm7+jQ4A9dc01+HMYYhNmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GunzxfJ2s7zDgu//BZ0uCih5RiABwYPNDV1FkUlqdC4Qn9gqLgj1eXTggK6umu+SV1iKN7e09RuIFKvjWrOoypaXYWPBTtGdG5IbbbDN6eNVJRhCKtHVWf0xAZauQr9kUxDt4SrqcqeT61OAgsYCXdFERdBRokV/8j0ursnrKKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hsT1gK9E; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hsT1gK9E"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e58034d05so685156a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787893563; x=1788498363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2ayKEtWylWEqAbqXks4/0qXdOEmw8tXU6KwY1JgJjU=;
        b=hsT1gK9EbQiaIMzCi5+SgtROr1ZgQB9uuh9sEggK+9hAlbpPyk2U5Cs6znvnQM6FDC
         L4GIqznaEWVNSR1mk5+htvdR12ehJhivD2GEOaV4R4IqxLiQMI8oKSp7hZt1ERDzMAao
         uOiVwG2fO2YiJX82gze8PEXLgduSI/a1lbU8sffoTIn9SN+obdtp7f0MHDFbdExXaBSp
         LQ/MiuTDru1Z+21d0KQcI5LR9ViKGRLHIffN6j4byk8kxknEF8jKnlN0FM3ofjbILH2H
         jYamozF2SuFgw1fAh2Ek3AyUhcMk5cSS+rj3qhbLrAlDigqRM0sZkWYgHt/3QKHqZeBy
         fwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787893563; x=1788498363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K2ayKEtWylWEqAbqXks4/0qXdOEmw8tXU6KwY1JgJjU=;
        b=ZLbkyQYFjWS2HIT5Q/RkXXksXiJEYmeV6En3Nxfd3UqMW5yM7ddOClWuV4RJ5HpVp3
         KaQ1++kaJZnRBbSDfCHJUB7VWtSBSiiNL34kUiUm+MEQYs2mkNzmg6b1YpCCLBVx9yjo
         Y6oFvuXalRjjltJrZ6tGAUIRiHt9W+OMv6SqRnNxElKfGgcGrlzoscJDaj5P9Dgu1cII
         cxFJS3AmfINPUZZf9hTXDZwczu4fwIe8B3E6A98L3fOW9YeaH5UPPH/11lI70XHLX9r+
         TJejeSzgEtEjk0wNo8REsGYf5R2amELcxIupmCl40HZGXTSeZj4M3qDMRO2yNpTfox1R
         XNjw==
X-Forwarded-Encrypted: i=1; AHgh+Rr4mgsHgwNBc7UXq4VpkdEStbcmImuhBn5afZmI3MnyBdhgJ80w+cSJrSFG6Y+ITX/fRXO7ndhTR28kpjE=@vger.kernel.org
X-Gm-Message-State: AFuF++kyZh9w7q8MNF5ANn2XPsPSVp5vcowm6w8d/8GM8f1Bd8cxO2Qd
	U2PBzyKSkKG6B4UQGYY0jRieqQiFXHJWuhVDK0jT5DXl47PZzJT+CSvm
X-Gm-Gg: AR+sD10kQoYVu3PU3XLRsvqvSahn31iFGdrfGK4IAM2ZkSiM1RcwnS8cOBvrfdQGKBq
	AJq/Sk/Whn5Y/3DBwiH5K1AfiQBI8yHI7mQAkdEVCS0kDntCVS2VXB7P/Se0THj3zoQSXPu5G7U
	PBAGkPyxFeIv0mIDH3DlkVk4+Pq4v+bMK7qCIBhbEBvoVJZZhYqOnQMyxQ+7lPPKxBbgEEP00up
	8EXs3OzH0j3sH3qNYU9M7f2G19N0izowwM9Qoqs14UNaVTgfJE4QeRBc5IGKWLjMYrYf6mTpF1V
	QKaG4QBR+ySdt9BYTuTWTf3oE1g2H6pruM0W3JB9ZHWHrwanDaN4yqiIqMAQEZOkUu0Vpmgaj3b
	61HMjMBpj55o0yBD7vODFccDZJuhPZWP03qGgts/9Vmxis93mMYCRn8CBs9bpA/ZtHJqvJE875g
	VCMugbxYk5wBMsdvc2pR4EfVe9VkplQiE/ZduMnLDdw4LcKPCxfr9YqTAC/yRIVnxKj4j51qblw
	x/URf3udLo9h3eF9dqadBQndBTA2COegWkfGDkmLh6D7/b5f5UBs0GWaCJWJVVPUslv+MWT6q4v
	2DnensRmE9rIktY=
X-Received: by 2002:a17:90a:d2c6:b0:392:c80b:8eff with SMTP id 98e67ed59e1d1-396d0f6cb36mr8700122a91.11.1787893563290;
        Thu, 27 Aug 2026 22:06:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda7c922sm986549a91.7.2026.08.27.22.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:06:03 -0700 (PDT)
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
Subject: [PATCH v3 3/5] ASoC: mediatek: mt8183: Fix APLL enable error handling
Date: Fri, 28 Aug 2026 12:05:24 +0700
Message-ID: <20260828050526.590761-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828050526.590761-1-phucduc.bui@gmail.com>
References: <20260828050526.590761-1-phucduc.bui@gmail.com>
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
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Return directly from apllx_mux_setting() instead of using a goto label, 
   as suggested by Cezary.

 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index 2dbe0b7f8bad..43d5898357dd 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -384,7 +384,9 @@ int mt8183_apll1_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll1_mux_setting(afe, true);
+	ret = apll1_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL22M]);
 	if (ret) {
@@ -413,6 +415,8 @@ int mt8183_apll1_enable(struct mtk_base_afe *afe)
 ERR_CLK_APLL1_TUNER:
 	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
 ERR_CLK_APLL22M:
+	apll1_mux_setting(afe, false);
+
 	return ret;
 }
 
@@ -438,7 +442,9 @@ int mt8183_apll2_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll2_mux_setting(afe, true);
+	ret = apll2_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL24M]);
 	if (ret) {
@@ -467,6 +473,8 @@ int mt8183_apll2_enable(struct mtk_base_afe *afe)
 ERR_CLK_APLL2_TUNER:
 	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
 ERR_CLK_APLL24M:
+	apll2_mux_setting(afe, false);
+
 	return ret;
 }
 
-- 
2.43.0

