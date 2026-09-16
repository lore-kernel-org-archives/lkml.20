Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC85F3B8124
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789534903; cv=none; b=SfBvMS0HiH/SgLlGEbWTzwSNeOtinEpGnhDKR8mdbGAQ5pQ708amlv+bRIQOdITFzjxAX122qOH3kqzqCWPAxFnSpHBbw5+NyeoekwCYAQeRu/+9oUPd6J1BuAMy+IqmdAIaRXfd0GYWGCxN3xvnUAkPGT9aW/t7lxQjZZ+UEOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789534903; c=relaxed/simple;
	bh=IsAFDMAvv2PPza76qRYZGtakVEj0dj2ce+A6qA3jXuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eaABAWN2A5g6BXC0FNLxFtmL11w8xHKitW2rPk8XcF9P9CXUWDND57HaWAlvmIo2BimQfVF+XTyEYfoyUKJVkyRvsVtPlJd9RKnXrDxelmeWSa6tbY6kqOpVnXvyt0+WCMc8fYlsQEs+F/gKWNDUolxhscSVHbYIIYAbh8wVtWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WITcWrT8; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WITcWrT8"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8674704dab1so645512b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534901; x=1790139701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9y50VuB/l2kLa1542VqPbt/G57KIRr9fbdB6tbrEkBk=;
        b=WITcWrT8GNIxsSx4IDqcvl+ToelDc9QjLr/ONjAKVBPkzvrsiKTWWM11v6zXPVx6cX
         2E7zvRXl6OAttcMA6ABD5qDPofNoDHhYnPdA3c9K2CuNayLVd/RCHzKfmRJ6jY2nwQwf
         lNRyLxNjD1BmVL3tyK2AcRVFX2x+7B3XNabffue9spcylKlb2ClMcGXvSvilqCFHvOA3
         GcYToDgrNIXWC2OrGLjBDBbSRNOjTXvi+/owpeF+h/XS5JHNrKgw5HujcfJ9Adubm/B2
         KWnQQOdGcHTgMaN34z48Sw5gXer7lfxEZEps4/I7s0ZNniESaDdLzOLlBcud26+2usmr
         Z93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534901; x=1790139701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9y50VuB/l2kLa1542VqPbt/G57KIRr9fbdB6tbrEkBk=;
        b=cvhh9foqFeOQ5lbvvgF747hBPjo+cxaNPdYgXflawa7/jUdcW2VYqsBVDS4TXsvV9o
         LUiSefl07WDJ3MneHd8nJOjRakSm4dZ1ngMg7XFDCP8vC04S6KR5FiwT65i4DnH5oqdB
         Cff17hwykqvL06x386tKH/rcWo3h6RcRRAdze8XvkeBWA3AlI9InXDVvdrIDNTgB5ELK
         Bzf/1OIBTo9ba53hNiXUzSlO35d8BPQvgFzm6C+dKjzqAz1Xnoi0WhV00jKMarfl3xaU
         2NK9qoGS/tm3DUX75/gh+bk1KsXykI0CEp6ttHQilcwqUtq2fCSm6CvuF19/U9DlgN2d
         iukw==
X-Forwarded-Encrypted: i=1; AKwUvByAOYU0kn1WPaV32A2ebYQlk5uiTDBDZqEltYLRc9LFKeUE7io5ptlkVX9QRgbivpQM9V7T1C6qTsugOEM=@vger.kernel.org
X-Gm-Message-State: AFuF++kWjpQlQkVx77huKQ+JEnhSHD89UWQ5vPhKfCAR9W4W+jy0PBJn
	M1biGSl1cmO3a6nSqOqUzW3t47CsJVlquRvlVKYx/eo8JBr9FTLWpD24
X-Gm-Gg: AYBFou1yhrVR81/YtwutguvrpFQaIyNnfnmUebYRdIp0FJCZ44DNqepfB5qq3wGlGzN
	6wsNIQDuFixv58yiId1iA6A6oJAlt8ykLDq2rB88ppFNTNLdS+RWSOIKWjiJnzP0yaL6i3r6Qrk
	rxMAQiYg/oaybuyYmM8q51y2badBaU7LfuhsDJ4XNRnRwdcemFpmxLBrdcle/+SNJRZDs0gJSas
	66Wg4UEa5hBl5XKDpoL8nxZ1tuoU9UAlytCEfA05Ter7f2O+A5fJNcbmnCxSVGCkkYtcUvIrNJD
	RXDnUtkbgab36OKCA7EYV4c0vaRYFelg0oGKHOBW8OWyve1+Hs+j2if2WT/FMbvDwgsKtQjoC9z
	8srtzZ0UFHCnrqVKp52xZvC7woLpctcCBaVuyFtyQjMolCjIunHUwAb+HdLFdxeJ0URzdaGfc2l
	/ZZ8rwNmS1FWw6Xycskgks/7oquFoFHy958UJLtbuIMwYvZNEJoDNad9ETRA3xl7UpA6B27qSJl
	8V4SbecFxiCxUsO5kjL8peSpAs/7S6S/+z1BFTJT+AaVtTEh60I//v86gfGkVqS773twij1hMN2
	wNzUNNhjCpP2qOg=
X-Received: by 2002:a05:6a21:6803:b0:3da:e1b5:2baa with SMTP id adf61e73a8af0-3dd5f4041a7mr2929083637.2.1789534900789;
        Tue, 15 Sep 2026 22:01:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:01:39 -0700 (PDT)
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
Subject: [PATCH v3 12/12] ASoC: mediatek: mt8189: Validate TDM MCLK frequency
Date: Wed, 16 Sep 2026 12:00:19 +0700
Message-ID: <20260916050020.14575-13-phucduc.bui@gmail.com>
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

mtk_dai_tdm_cal_mclk() accepts zero or negative frequencies.
Reject invalid frequencies before configuring the TDM clock.

Fixes: 9f202872ba04 ("ASoC: mediatek: mt8189: support TDM in platform driver")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add Angelo's Reviewed-by tag.

 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
index 9aebd0320614..e113c52fe06a 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
@@ -383,6 +383,9 @@ static int mtk_dai_tdm_cal_mclk(struct mtk_base_afe *afe,
 	int apll;
 	int apll_rate;
 
+	if (freq <= 0)
+		return -EINVAL;
+
 	apll = mt8189_get_apll_by_rate(afe, freq);
 	apll_rate = mt8189_get_apll_rate(afe, apll);
 
-- 
2.43.0

