Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208A82C11C4
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787893551; cv=none; b=JfKWvX0Zr6aJvWMran9BvtpvqWuM66YWVzDhpiHEdHABFqrO2W4lcZC43REIUsRj7iqFyOzewoZZolBSZk9diW4md0a/hfmY2iCxmc8w2B+9kRr9El7UDWFTdpngbbf1tC+gIEM4llrUH4a5qWYGbcsxmGplerAHpv/u+5N1w6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787893551; c=relaxed/simple;
	bh=oEtJKC8SyDm55iWf8RA1iIPrs9K15z8AmrquAT9oxNI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pTqgYAVCgPDNxR/snX/3B1viQCxz9yzOjo/8PANaiXHxsFS3Nw3blmV3Q8A1TgomkT7qq1gbQv5WX9fZwzjhq+JhcBVsRXtaRBz6myfkwqayaA3+pkQb6IGoSx+BpjUm1ieRHdG5xaBrUA1avy8BTWub/n8ahiiq+S+34gLSSJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qxrz6QIb; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qxrz6QIb"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38759bcd877so561246a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787893549; x=1788498349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TT97ogqZ21rhXkfi4nqd7h5J+vquPZUcIcmWTDNLD5w=;
        b=qxrz6QIbpLJlm3eKSmFCoSgfyAdzgYNJp1HXxJl+ALam1bQjtSwVNs0zkgK1CIa/Di
         pSKuYvgAOtzFSgp19AdRMpZxPjDntGyl9ruv16+8jivcuu61ieIL525hg3tZVzUn5HU/
         cQU2RSBLdeV0a5JCwjX8L6sv4Ff3meebfJRHt0EvpcSLzann4MmiLgDTD2LrwjuUpxx8
         PpJsXDnTf588yqKx861iOd/k8hMIes2epJD7REihkj8Ze7yoZL7zmq5ag0s+K5BbUild
         x0TRll/YIwB2ViTiJcH4za7XnoloZbE+LfzYxV5g/T1Xnt5xxbC8bwh663zrRUTC0rta
         tLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787893549; x=1788498349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TT97ogqZ21rhXkfi4nqd7h5J+vquPZUcIcmWTDNLD5w=;
        b=OR0Y9pdm3qzlw3qZrl70HmE8R8LYjsuNuSmlsKnyFpsXXirr9xqe17JzQJTLkKbfaX
         4T80ElR7HCnvM3tOE3682GAxR7kJXVZhIiH+c9WQSkPqj6UkpXJDU40B3sWm5JcyAIDZ
         HeI5+nHNA6U6Pw6t6XZ2xFXbOx5RbGgMg7o3c6CHUAyaQ6StmSJzaRUzOdxi1TwuTzmF
         ubeGzUmeWS60+gYn+9pm37v4ur40HQb+a4H4K6xrc7HdDBbmBFhdhzlSG/ouX0fZrK+z
         Mac2KVI6VSNbHCNsrtxDzQg/LJ1DcomNwvZ4LuxY214MHTXQ3dwZvTE/ilXGDI5SmFBF
         EDuw==
X-Forwarded-Encrypted: i=1; AHgh+RqQukKif4EnyPB/1ISvF2VE+QtzUc3dAjv6aQJqGDCmE3eGHmMqf1qvC4ftqYG7969YBc61PiNcM/hmSVY=@vger.kernel.org
X-Gm-Message-State: AFuF++nyW/sx0bba4Qr9czmCAdUSnZ0I0INSJ4VcV6eA6ormmuYCWUFo
	23TnheIgsX6bqG3y6Q0E61aNo4XCNmiZm8FlodDy8m4ByRH6LYn/R3rG
X-Gm-Gg: AR+sD10bsyUbcUpjVb8R4Q5Eq33V4bxGqnAm/T/OOEPkMVAlZt08JO6xLWUVTbkUKyU
	N7BluXSZuOci3N1Po9kbiC+QzfhdJCVxz89la8UP08Ntakn7VjHv5sKF3CNXmc9BSVnaKHfEgJ/
	eEw4mCDQ6iVnK0GsVPvGTXG8rlykmYFmCtCRAsTp8HbLRQxqaoeukeJCnRUkwK1zXv1mfbXBNW7
	sqBRgC1QrP8foemERb9RjXxpdoRtt12G0NFq/ZLEnX/db0LKgrrV5/9vWqvMYpLzMl5pgJEnR8H
	wjLwXAJFSwzcC2Ix8yF9pb6imS67iyIjAI3lo5UZPvsKXluvqHaKnpyWRvmWtmyWCvjuZSx3aH6
	jEeTVaMGtUWwODCl+Vp4fvMpFRQAN2e9P+z59yut/dj8xMyUOCb47YljITyVMLUd+5ugH3ALxdU
	4Ns7uXwRRRrXyLzcTCBL7HHLSp1T71fJoEDj+7L+FLM7DnVssz5NlUh/7UAX7oWDUdg/7ICpUEB
	ufcVF3iVrHRka1P2cqbaIfbtGOyj8Omndf90YqcWcIPSQnF4249T54UYl9XPOldgDP32VEgRLbl
	MwZRGlCEtgb62Uc=
X-Received: by 2002:a17:90b:5284:b0:396:4dfb:5890 with SMTP id 98e67ed59e1d1-396d0e5bbc0mr9291203a91.2.1787893549522;
        Thu, 27 Aug 2026 22:05:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda7c922sm986549a91.7.2026.08.27.22.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:05:49 -0700 (PDT)
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
Subject: [PATCH v3 0/5] ASoC: mediatek: mt8183: Fix clock error handling
Date: Fri, 28 Aug 2026 12:05:21 +0700
Message-ID: <20260828050526.590761-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series fixes and cleans up clock error handling in the MT8183 ASoC 
driver.

Compile tested only.

Link v2:
https://lore.kernel.org/all/20260821122928.41343-1-phucduc.bui@gmail.com/

Changes in v2:
 - Remove the redundant error log for apll1_mux_setting error handling.
 - Add Fixes tags.
 - Add a cover letter.

Changes in v3:
 - Add a patch to fix clock handling in the mux disable path, 
   as suggested by Cezary. 
 - Return directly from apllx_mux_setting() instead of using a goto label, 
   as suggested by Cezary.
 - Add a Reviewed-by tag.

Best regards,
Phuc

bui duc phuc (5):
  ASoC: mediatek: mt8183: Fix wrong clock cleanup on clk_set_parent()
    failure
  ASoC: mediatek: mt8183: Fix clock handling in mux disable path
  ASoC: mediatek: mt8183: Fix APLL enable error handling
  ASoC: mediatek: mt8183: Use dev_err_probe() for error handling
  ASoC: mediatek: mt8183: Drop redundant probe error messages

 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 95 ++++++++++++----------
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c |  8 +-
 2 files changed, 53 insertions(+), 50 deletions(-)

-- 
2.43.0

