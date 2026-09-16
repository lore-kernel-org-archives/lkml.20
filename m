Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874533B841F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789534858; cv=none; b=QAK0wrdiWGz+jVb7kR9ai7OdCl/koF/n9rMVsuA65+o+8h/zo3tuP6HpMTZvjP+3Og7CmFq46TV5/OV7vB7mJhElNGz+qucGojt/9lfltUThFreSv2PPWYKJkmz00rOvGsfa0Oav2XWaYhxZ5yCO+1VlF51sxM/YB/sn9EsKLuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789534858; c=relaxed/simple;
	bh=86gBoh26nC94bjujUtZG3l5WFFuaeyV07o+eqxx+8JE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t3P6huCZIYLYD7zn8f6eMQg9HfWsGmC8lckPMWPLBesZGtsesofAieZKTGya8UOvq+eMRr0JpSFLsbPjJFCRAup50o13CSjcPjO67YmSXpwPWfgHZlrl3ma8qXM0kPVLMSU/90n8vrcmFAPaMfx8SfgCENk3MvpTA3gpD+yyfrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDYSLVww; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDYSLVww"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8633a38df87so271936b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534857; x=1790139657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O5PNRO0CdJEhOq1jWeluVyLPq+PGbJMv3Lvj1R4ejMk=;
        b=SDYSLVwwiMTyOO/pi336uFr2ceS6OvQggpmrOtjRplvsNJnLhH9CleeOekRXIsTmL5
         INyLEuvmlGOaOOxkT6itlIVD0zBBLM0IoahojcpkUN0SYzIC41jKZKqdK+cairhzuljN
         DVJPkr1pl2qeSzj34RRCYcC+o2BPjAkKe8jarMCnllWNY7jRE3Ljlv9moQv3Xyz8Z1Th
         OSyoCAogohrn82Z4m1orVEdnTrtA8VEDL4JMOY7REOOPKgVP2tfTDzvYmEA78qJZvRRD
         /fswG6FMlbKdIqmLXoXxrx8kxJ3SdPC/qpfFSAGJ4PrB9mlxV3Cwki3Km1GrFW+7WyPZ
         fRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534857; x=1790139657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O5PNRO0CdJEhOq1jWeluVyLPq+PGbJMv3Lvj1R4ejMk=;
        b=WsAseHgoNd0mJBttOsyQC+mxIkW9axsQGS4P8WGQp8OZKnVCGDDlKy5whlTRX9B2VF
         v2xKkbWYlV1TJkN8Ppjn3VI/40ncItTv/OLmgwqNLxs2R7wHjebIFCMPblQlOfz2FXMx
         AG3fpYZ5f9UJDWR60KuEXZsoOMG++kJGLF4WTpK31lNKt/iZLFCWlsZN2lL/OVith+bC
         zrNE7g4SzQlm6BMWhBgCb4bSKuVXy9FrRPeJV1P0QV/sjV4vWEKKHWIWExm7kJ0kRzUE
         u9UhQlYDN4Mqpynr8kN+myL2cK1mGa+Mr82rKKlAeqGTS1iUrgeEk+lm3pgRH13OIKC4
         R03A==
X-Forwarded-Encrypted: i=1; AKwUvBxRIikGkDvIFcdKyLVD/fhMARhFjJvNXqfKbeqjBpLkI82raQXJoHHysKvdNEIQK0yubWZUc4a0XHvTeLU=@vger.kernel.org
X-Gm-Message-State: AFuF++lu9KHI/iAUKBeRZ3zyPIkTFYHwVDTb+pJkorxeYA/9iXwQKUmO
	tWjuZKDhpZ9JxD/seVnjDKkrU3BXbWLgERs6O2N+5cSwdXzpq/ls7Dvf
X-Gm-Gg: AYBFou2VZ7uqjT/U2BdJhiMG6IV/Tzm9f/8jMkamYEL3OAcUSuppa+EEenmHeWJ6+tQ
	4OPTM6uesMx4mVAvUpQAo73eZz8Ge5tqvNKjJUbV6mK2/5BPFRYxZmScFX8PiJzrCnRlquUntdz
	M2VjtxbLIo+qzpeBO45GWX34iKBw7Isp6lwDWcc49FT8Ne8oeWZedNuJ4HM63HJpSx/i6BO7+e8
	tVbDvmp6J/2YGBXjpSM9k37vYK+LqhkTr82/JNCkLFlkvuizSJp0ce+N376TEl4TQjBtT7FxNRE
	RMK3aXXgVOnQvFjFbFGpY1ds4PMRRhIkyf1lS/SD3WyPv6k4VGaKf1hXmz55yVVXXLzIdt+3VtL
	bEICG0kNvSyO6tOtv4/JdaQHia4U/Y5zXTgz2+sESGACuiBmS5ITffPFHanItQ69BWnewOQJgpF
	hNtkwcR86hoGkakxfexZ+K4KAmSEtWaB/Wqgn4XMFYSByKGebuwabbkAz3VZov+934e3MF8sd/0
	7OyVgk138NbHgQbN66nrRFu/ljyP+flUT9BqHCV0talHmMW+qqhkw8iKOTkPttB/lZ5Ijuen7tb
	s4hFsU+wbFml8WA=
X-Received: by 2002:a05:6a00:908f:b0:864:cbc5:b8dc with SMTP id d2e1a72fcca58-872378bbb6bmr2333682b3a.10.1789534853419;
        Tue, 15 Sep 2026 22:00:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:00:53 -0700 (PDT)
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
Subject: [PATCH v3 03/12] ASoC: mediatek: mt8189: Validate MCK ID
Date: Wed, 16 Sep 2026 12:00:10 +0700
Message-ID: <20260916050020.14575-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

mt8189_mck_disable() only checks for negative MCK IDs.
Reject IDs outside the valid MCK range as well.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add Angelo's Reviewed-by tag.

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 56362c4756c9..7fe9d01006d5 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -675,8 +675,8 @@ int mt8189_mck_disable(struct mtk_base_afe *afe, int mck_id)
 
 	dev_dbg(afe->dev, "mck_id: %d.\n", mck_id);
 
-	if (mck_id < 0) {
-		dev_err(afe->dev, "mck_id = %d < 0\n", mck_id);
+	if (mck_id >= MT8189_MCK_NUM || mck_id < 0) {
+		dev_err(afe->dev, "mck_id = %d\n", mck_id);
 		return -EINVAL;
 	}
 
-- 
2.43.0

