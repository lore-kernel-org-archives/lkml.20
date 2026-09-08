Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D314A64C7
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858299; cv=none; b=MEBH037rYPZzmmqM4pHQjLRsqOzpFXUyafE6fL5BWAVDJ0jH+RbtlSBYeJ7ZrD7efmtIOCd1R7YgOxx8PJ678KtEc6EOigmg7W7iGjeb71XXN855x93oNDu/dnZ2E6kzjHdpXn27JEGC8MuecOg9lsv7Oauvab5ywYmeEsEMGHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858299; c=relaxed/simple;
	bh=YhduCODJr21RV/qnoWSb4NuDoadYla4kv0KPFaGd77U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=kANrgQPclNSjiCa81XzNGD9SideHqkvyPKM/too8xJ1WAo+TlTNIUFqUYAPGxjVPXUKA1s+v76kjcoS1xO5Xq4uVSEOaRxQ+tR+kZtkO82mxs3f9W0fT430iEMIL4LQ5h99lLFkGmPT3La2XquaJf3LHJdu1Wg80f4hLsmgTMk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mBIp8wXl; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mBIp8wXl"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4858be8b509so1926970f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788858296; x=1789463096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eIZ+kUaFwJKaLRLpyngmxMQG27w+758uZsHUvhX4A7o=;
        b=mBIp8wXl563j46M+dFAPSnYa+XJA0zpsHpagMwwGsOLN3+2kXcZfVSaKyp4/KldzUT
         aoe/abkDH51pIsoFMGR1hKSzoKNtyCalx7WUqusOzmMv6A86APuLKbxXJh91gxy7iCdY
         v5VqG98HEUd5bKGQrPoTNfxTAPI+vvXLt9+3YDONpL1u8zft7/IFiEQfZYPZZlzWfE2a
         JxRk39mVNsd+Rul5AUby6n5/LYyAiVxjPesWNKUEXt+qiSU3JQWf2MwJpHrQcR2FPtus
         qTTgSwtAkJUOJDHZUkOvUe+XoxHjEUyBirx84eRFBwVAm+Sj5gGLQbt7kKCFvuKsBGtR
         F+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858296; x=1789463096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eIZ+kUaFwJKaLRLpyngmxMQG27w+758uZsHUvhX4A7o=;
        b=GVIjsPxEPRcePNbl+O0nhNucF9GVRZgSc2heJsUE2eQunWp0QW6RsVbTQZ215MAoXv
         vDVIkVgmnn8hHZ2gqNa71hayioOAi54Z/KSwu06PBXGcejgyuf6xnjQlvJ2H0eciKYHD
         s4r/Qw+qHseXODID7CDCbM6YNTOq5fZI7dY73FXaZTKVFid+YanxhBVt6JTPAq8Q6ERB
         bC5i2xVspUb6LfOFokjCo2edqXOD+XjZW/SGtkAMaKlpCsmbJaQhGjdBKScrfsPdGmlq
         I6fn4/bg5rTXao8omVsiy2X50iyIXe8UqrRSTUYUBxfUh6NwUAoKeI0lHD3TS8/DS1LT
         AzVg==
X-Forwarded-Encrypted: i=1; AKwUvByjielrh0eT/1lqF03hlZwZrugJf+mHiMzynSs51jTJASmYJ4cFo6sA42mbObs/EWeINJeGRzK5G5i2I5w=@vger.kernel.org
X-Gm-Message-State: AFuF++lxDHaYxqlJSq5JUo6rQpySNxhuGU1A9Px235fJJZmAnJPTHJ0Q
	+y+tMGZvZCQwcapeYKclaxMk1RLYAs/sY59dmlgoOfWkbOSmJaiWZQ0x
X-Gm-Gg: AYBFou10PLzKGPKmPHggfzBfzjE6sVPBrn+/Sv8Qjo9wFAxVO/kaw0LMTE8Yc5BqGwq
	4XsfDfPb2FPXw/MpysVfdT9p1FCuyOU0XYO7gNRaNSXCtNkfjRnsJ+9Sc4Ei8RjBbBIXQLiRcXQ
	Vsr+CqXmeSuPq0kBm82+c4s4ZSTtVw9/8biktTJ5PbKhcu7YEYfYsCjcB86es8+Tx+kBdswW5MW
	cBnolFQhTVaisZ1UjHaDTDMJg2YL7j2PF/z2lDG+G+HmVcx1HeJg8Z0p7MYoDd9Nm6/ILoFnr9H
	AXMq3ibm8xZqmZ0ELT7vdyhOU/a+5Z04ORqctXCo/xC/bGFKVBQRZG5wsdumunU61uahqFmo4wF
	WKNlDncU14EDAe+SPkGDyyu3KqguCE64LRW1N0DQF99tuKGkkQzecHodX7tMArTHLgVo27y5GbA
	bCKxtJHwLwgtdlDqihTuNtX050EPC58HHrn9ZSN6WykQpsNMRsvtZrokQpI3DWQGfxPTshheyOo
	sV1KTognm3YDa4cevC3+93IgFXYEmuH+/Cm6W0yQjKR/DLpHzup
X-Received: by 2002:a05:6000:2602:b0:485:8c16:a33b with SMTP id ffacd0b85a97d-4858c16a5b3mr26273747f8f.48.1788858295822;
        Tue, 08 Sep 2026 02:04:55 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485881353e8sm34767945f8f.1.2026.09.08.02.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:04:55 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Rosen Penev <rosenp@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v6 0/5] ASoC: Add support for Airoha AN7581
Date: Tue,  8 Sep 2026 11:04:42 +0200
Message-ID: <20260908090448.3332-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add all the patch and documentation to support Airoha AN7581
sound driver.

The card follows similar implementation with Mediatek with
the codec present on i2c but with a simplified implementation
register wise and additional frequency supported.

Changes v6:
- Fix PCM probe allocation logic
- Split driver patch to dedicated PCM/ETDM patch and machine driver
Changes v5:
- Address comments from bot
- Better handle concurrent irq status bit
- Protect enable etdm
- Add Review tag for documentation patch
- Address formal comments from Cezary
Changes v4:
- Improve Documentation YAML
- Move IRQ regmap to mtk_base_afe_irq
- Use mutex for user tracking in ETDM
- Register IRQ after memif allocation
- Address suggestion from bot
Changes v3:
- Major fix to the ETDM code
- Add duplex support
- Improve Kconfig setup
- Rework and improve YAML schema
Changes v2:
- Fix wrong edit in MAINTAINERS file

Christian Marangi (5):
  ASoC: dt-bindings: Add Airoha AN7581 AFE Sound card
  ASoC: dt-bindings: Add Airoha AN7581 AFE with WM8960 Codec schema
  ASoC: mediatek: common: permit to provide dedicated regmap for irq
  ASoC: airoha: Add AFE driver for Airoha AN7581
  ASoC: airoha: Add machine driver for Airoha AN7581

 .../bindings/sound/airoha,an7581-afe.yaml     |  41 ++
 .../bindings/sound/airoha,an7581-wm8960.yaml  |  71 +++
 MAINTAINERS                                   |   8 +
 sound/soc/mediatek/Kconfig                    |  27 +-
 sound/soc/mediatek/Makefile                   |   1 +
 sound/soc/mediatek/an7581/Makefile            |   9 +
 sound/soc/mediatek/an7581/an7581-afe-common.h |  49 ++
 sound/soc/mediatek/an7581/an7581-afe-pcm.c    | 515 ++++++++++++++++++
 sound/soc/mediatek/an7581/an7581-dai-etdm.c   | 433 +++++++++++++++
 sound/soc/mediatek/an7581/an7581-reg.h        | 114 ++++
 sound/soc/mediatek/an7581/an7581-wm8960.c     | 161 ++++++
 sound/soc/mediatek/common/mtk-afe-fe-dai.c    |  14 +-
 sound/soc/mediatek/common/mtk-base-afe.h      |   2 +
 13 files changed, 1439 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
 create mode 100644 sound/soc/mediatek/an7581/Makefile
 create mode 100644 sound/soc/mediatek/an7581/an7581-afe-common.h
 create mode 100644 sound/soc/mediatek/an7581/an7581-afe-pcm.c
 create mode 100644 sound/soc/mediatek/an7581/an7581-dai-etdm.c
 create mode 100644 sound/soc/mediatek/an7581/an7581-reg.h
 create mode 100644 sound/soc/mediatek/an7581/an7581-wm8960.c

-- 
2.53.0

