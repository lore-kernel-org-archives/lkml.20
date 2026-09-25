Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C9F3BE162
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790355593; cv=none; b=F0Hp942bZfMwr/Isa3fAxlDvOzNSlAJqfmitMVnDuHtqyFmng3LQj/hclVsJnL1lIvr/FTIQHYDBs5pXisCFbsHNkeFd8cOOhAjzsAZWNzaRLNmL9+fjzdwx54nBJU+Z3OGJKYK5uXGfnp16ZCtVeqkMsDYnbhbKG1soVhJAus8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790355593; c=relaxed/simple;
	bh=JKIIgqWX5qxVPEB4mEVEZFgtVqMQiJqYfzepK6S4EQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pxOyP+SuoG1KohgYofAqnXgRvsgNq/6BGWPgIxaXG+c0EeIYq5e7aY07bzBkgcdMdEtLxyyRm2wLlwJFu7X+4gTpYts2O0pG+UT+tOKtK5dNBKLY7YkVTidJpWGnsOjh4CmQ2Itq88JehIv+LkaMr3BvNkVMVKy7v1RA1riVskQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DAxk+aq9; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DAxk+aq9"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6aae37d33cbso1364851a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790355583; x=1790960383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P2oQDwCwCo1gfWj8hUM2bE3rJ8xWs7DjrsEeE/nug/Y=;
        b=DAxk+aq9gNh+zgdqvHMHQK97bBvWGt3VW49kSKKlx6tgLsYY9jx3Rgj5wDkUaebdN2
         fL32I+X4TiZupDVB1MQS6GZntx+AXzJ5enVU4O7Ub6/0OtUktCQf8Acajs4qxq39tEOY
         joWmL54sLd1GqvwNcIlx8m5CWWZCyoac6pmSLTluWIXggINPOoO6xJK6GmEAe+guQ5Wm
         4Kxj8nLzsRpw+nPfm7+ovF6b+F7K9B7R0Urj1HtvwFLFSgnbwtpOEbAdNNHw9ez83xGi
         ftcK2i6Bw0REnibEGKmGAfGYdX2PVDis1CfwMzlSZ/f0uTLDpoVBhHN8xZlD/nLqDr6h
         71gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790355583; x=1790960383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P2oQDwCwCo1gfWj8hUM2bE3rJ8xWs7DjrsEeE/nug/Y=;
        b=fwn4lOsi2ciJ6X3Yvg5WVkfNoDyBhczA8l6fhyZEzMwQIw95mb3kixF9PfAadzP36b
         guCZXwRWkGZQbneP+bzS6+7aaNb0EZGBN8rwCJXowkqXXhQGli/dibtsMxT1OE6ZxOrb
         Z893Z3gQEqgwfa08x2BJ8DOA62TJbBZZf6FIOdc6IxLRQgTR7hu1c4aDppjV+TerE67X
         QMsDVY2eDOHdOovGQ7sn5rwck53Ivs/xje+O9zVC8+80xpjSdGJUtVHTodybn5PvvBTS
         6m32T1pDGr2GnBBbTtCKWYxeLmNvarpWpGu36O6p3l8eHwEwDJjUUJbWFXvBR3GzAnD9
         Y7mA==
X-Forwarded-Encrypted: i=1; AKwUvBw1IgJ36lkkvyjeb+Tf9oce36Ab1iQEIU0WbJAXTUe6RHPqR47LdYMCTExYd2JYMzTOtCIQpX4de2IXK+4=@vger.kernel.org
X-Gm-Message-State: AFuF++kpcyJsCZqZjDNM9Db2PCsQl3GXOptWrns3MxMT5jFU5GKop74Y
	Ci0j+cZPx5/bH55ozSVG/pw6QGLcp2CsdNr0ce/F/OfUGhyM6/kAXlL2
X-Gm-Gg: AYBFou2b2sbxNMc2Dx75eUPHkT0UERRzq7I5PXOex9ejOVMWZLsHOmDZNUXzjWk4tkx
	ZiAJpqT/PK3xmXr43l5W+WXSVxtL3KAt6i7RqBgw1fluSxq40rQ9tV4I7ZFXwKlh10KQQYO4moG
	pOznLGxXfdffnhF2AROBSm8a3EbHKoaefK305NqBgo83hFbX8FAOHhi5xBGsW6kuLsMz+QROKlf
	YdbNdi6OpRKYKbpr43oWQK/R4rZBVE9YBU+061ylU4AfmCBKjMR7G/r87d4ldVbS8Ea6bfNPLXC
	zxuYO/l1BS2NrCF5C9jbUhiGYWmbbXDdTQGGxXKjWVi4wtULh/A1vlsE+Tv23hagsnys6lNSdKa
	nPvzSZ7JGLcA0GQf2hrD4NqbFDSAVq7jXkzwDBS/sCWZdYAsKF8XTAVph5kTLZKSjskElRUEohn
	ODAjwvhANq+qEJztnLHSG8ewS41PORGjCwgP17IRf5DsQFIgWlkDIRAL066Ugjek+LDzm9ic23z
	ltbJXRdEii0gN910L1RzYsYcmz5yrsnzprwQ94HHZ4W0FyIJF7BwOdn/EfgQUw7
X-Received: by 2002:a05:6402:12d0:b0:6aa:ab94:4a36 with SMTP id 4fb4d7f45d1cf-6aac8f1b94fmr4157302a12.8.1790355582773;
        Fri, 25 Sep 2026 09:59:42 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-29-83-136.business.telecomitalia.it. [79.29.83.136])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5cb9b0asm1321152a12.9.2026.09.25.09.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:59:37 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: kernel test robot <lkp@intel.com>
Subject: [PATCH] ASoC: airoha: Fix sparse warning for AN7581 AFE PCM
Date: Fri, 25 Sep 2026 18:59:17 +0200
Message-ID: <20260925165919.5407-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix sparse warning reported by kernel bot:

sparse warnings: (new ones prefixed by >>)
>> sound/soc/mediatek/an7581/an7581-afe-pcm.c:144:30: sparse: sparse: symbol 'an7581_afe_fe_ops' was not declared. Should it be static?
>> sound/soc/mediatek/an7581/an7581-afe-pcm.c:419:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *base @@     got void [noderef] __iomem * @@
   sound/soc/mediatek/an7581/an7581-afe-pcm.c:419:14: sparse:     expected void *base
   sound/soc/mediatek/an7581/an7581-afe-pcm.c:419:14: sparse:     got void [noderef] __iomem *
>> sound/soc/mediatek/an7581/an7581-afe-pcm.c:439:42: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void [noderef] __iomem *regs @@     got void *base @@
   sound/soc/mediatek/an7581/an7581-afe-pcm.c:439:42: sparse:     expected void [noderef] __iomem *regs

Make an7581_afe_fe_ops static and add __iomem for the base from
devm_platform_ioremap_resource.

Fixes: 4974ffa0d6c2 ("ASoC: airoha: Add AFE driver for Airoha AN7581")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609242059.t4FlJzOz-lkp@intel.com/
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 sound/soc/mediatek/an7581/an7581-afe-pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/an7581/an7581-afe-pcm.c b/sound/soc/mediatek/an7581/an7581-afe-pcm.c
index a1d742362538..d47edb630452 100644
--- a/sound/soc/mediatek/an7581/an7581-afe-pcm.c
+++ b/sound/soc/mediatek/an7581/an7581-afe-pcm.c
@@ -141,7 +141,7 @@ static int an7581_afe_fe_startup(struct snd_pcm_substream *substream, struct snd
 	return ret;
 }
 
-const struct snd_soc_dai_ops an7581_afe_fe_ops = {
+static const struct snd_soc_dai_ops an7581_afe_fe_ops = {
 	.startup	= an7581_afe_fe_startup,
 	.shutdown	= mtk_afe_fe_shutdown,
 	.hw_params	= mtk_afe_fe_hw_params,
@@ -375,7 +375,7 @@ static int an7581_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct reset_control *reset;
 	struct mtk_base_afe *afe;
 	int i, irq_id, ret;
-	void *base;
+	void __iomem *base;
 
 	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
 	if (!afe)
-- 
2.55.0

