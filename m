Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744092;
	b=F3KBe4hZ42VuWE4r2GPQKMuGsaEErHpWs8z39K8rf74X7h5ry9lQEkNTu/Zd9V1RefLC
	 mNIzrnxGTjq/zcrnS9Yi/dTXsyTg32XqszUN0PT/PBoaGUeO8Hp8sowx8lnSVvHW+F6SQ
	 IMkaZoEuyd2dE8OGitLXlJBmtwMQEGWKv5EdsGaEqV+yrjsaz41tNYIE0feea/NvrB12a
	 IPHz9RJpYLXIJcl3PJI0LPqDhDBd3eigapxBtdTaFE3CH+YBI+aTan0ZwbrxDP4P03EoD
	 kd4+RPQsXqdA6Ve4svc8smdm835RXnah8yGFeuL27lkoyBrw5WiwcFc+3nwykndQf6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YkikqgGDTTpfPmNY7tvfFChQYii8/CyTohIduvPVkhY=;
	b=XhekSwadmTuHHSK9NgAMmW/5dz2ZqhDsjESOKVBb0JAftqqRh2jY1qMsWvF6aH3YUo4Y
	 40Mq4Rs80rp3/UsnxCxl6j7QO0yYxA68xyJOZZz9P4XuzOuSpqGvGXpsviQHWP3LlFSCR
	 0UqWnmPkgIPlYbMukdtQi0zLZUi/CjHv6a7GwPmokkTJmDSMzuissO/mqzKldDOvCN4CZ
	 Ao93eupE0D61shnfmReXo2IHY7RjJyyzS7aOKuj7y6N+CghYRU6YgBkb5zGZLJiOZlk/6
	 3om5Qu3ZxnOaWBt4hjJcUV8Uhvzgl6rcM1YyQ2tv6vYcDm6XuqBsA583JGkXLijdSFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bSgd2Xvo;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD16E606A339
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD16E606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bSgd2Xvo
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so40684f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793744090; x=1794348890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YkikqgGDTTpfPmNY7tvfFChQYii8/CyTohIduvPVkhY=;
        b=bSgd2XvooCZoj1WBBnU2JPzZzdGUCVkXD3CGWAFATK00BqiwAcJ2jKJSxcBlLxZnFF
         MAWpFCoUMbyKYWbzoL30cgmvnAx6Q7Kv42efz7tOQ0ORww8IHp1emlAQsq1UJN4FHaFn
         RxigVvNpPcBAQGImEvqdx2SJdTjPADH/4W0pOPQDIKG77NW3/oe3zQ5F/8c+6o/4eivG
         9G0mWq/9ELGSFsWpgQyMkA2ABh6nlbvVSAurZUiVgWkS+eJNHELB/loEtw1oPdwHINdH
         rRpo0yLEFXU4EW5eJSVdtypWY3j25L6UrqKQMcfCcYiAXgKJfkCOtgUTjk5c5/zaATcm
         Q9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744090; x=1794348890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YkikqgGDTTpfPmNY7tvfFChQYii8/CyTohIduvPVkhY=;
        b=bPe8lskW0DxDO7cWyt4+WgYfSC/m0KcZGzkKQZAuLPSRJ+0AVwABdC1eTMItz+LHZ2
         S+iyhk3/b/8zouzYAnXwPaQCrKsZq3NYu0Fpd1McvWXgiq09r5bReta7dST/YxYJO3vU
         O05EKz3/S08mjyfdVANsNAg9CIznf51rr2jKunWRWwJE/eU8nb0pHQrx282oqAp7+Z07
         8o1WO7w7OfS20UmNo9MAeajvTzR85i9d226GNaTbpm7IxX1zvfkEbQCsXjuaeaigHuK/
         bufns0aRPETLpbcvK6oy+4tSGket6tHR5cceOJfNgAO9R22URvVj60Baylsbv4QjUluA
         RuXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDvFqL0CHyj4d/mAgCYI5MfC+Y3vNro+EHPC+/QgE4T782sl89vFVXdV4E/FRh4tHyO2OrIuTvJypzEXU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UP6YNLMa3RFsvF6LGrGhRkquvPNYf04oIAoerK9hMFWl70lJz
	1SzmajmcTx2EWrrHYFvr2SJHUnbfEvpJK/KUZD1IClACPJJGSPk4+MqA
X-Gm-Gg: AYBFou1YpAOYntMTONx5fXYT8UnYyJ0n5VrbucYJ0IO/zaWBIYYEi4r1RMnpvSi/iH/
	329rMQS4pFM8EZ07CJux0B+HFhMdxxEU7AAhnHUzkoLFHtaZMJgBttd19tNqnCD29axen4tjZmq
	E6IDWb+nB2GRL+50Q5TyijvWkefzV3MqdzhyULsMXajUa8j8ZtEpDxGltrISNOHSJmzAYE4gkHX
	ke6sQm2tDqgBTO4GYXF4GJjhWR8ztdd0hwoXwAwnaedeT0iGL2NwnfIEWFoze3GxESDpT6KueEs
	UOuboy3muw6Jf/dBt4dse1a2JV4v8MMEcRaWJ6Yg93IrCMKTapJDO5vRn4Gjo9bJoOad4SOyzMI
	xSeXvScRJ0FacTAjcOya525aehrMm0AIuWn772TNW4Jo9anH7xVyTpQC/qfz7kDTXVyWulBKxm9
	ZDMn8elKdJnaa6lfkFLjA3fbQAVLQJSU5rJm6luyN8KY1biXuSKgdZFidgrws7vdfxMlNQOjabJ
	+5N4CtRBXqWKRN9T+jurawn6rCURrBlU/FhHycyP5t5N7WfoIXVtWYCQ7WfyGra/2HK0Lk4SWkQ
	MmXvglVtsPvGrSwXEcd5a0fZZ1XHvBL4NeiMrrTbDjZnXQh4M+eaG6XHEc1NosaOfrZ4rMx3A2K
	UjSyeuzidffkteazrJMUtTIG+gTX8WudsVQ==
X-Received: by 2002:a5d:64e3:0:b0:48d:f876:f370 with SMTP id ffacd0b85a97d-48e6e309763mr30399015f8f.48.1793744090007;
        Tue, 03 Nov 2026 14:14:50 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48fec9cd43bsm328556f8f.14.2026.11.03.14.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:14:49 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Joris Vaisvila <joey@tinyisr.com>,
	Ahmed Naseef <naseefkm@gmail.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v4 0/6] net: phy: mediatek: calibration for AN7581/3
Date: Tue,  3 Nov 2026 23:14:31 +0100
Message-ID: <20261103221439.30502-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series adds calibration support for Airoha AN7581 and
AN7583 integrated PHYs.

The calibration logic is quite big so I decided to split
the driver from the mediatek one to keep things organized.

Minor change were needed and just additional symbol to use what
is common between mediatek and airoha PHYs.

I followed the naming pattern of mtk by calling the new source
airoha-ge-soc and related config.

The calibration use lots of static table and software calibration
at runtime instead of using efuse to calibrate.

There is one pecularity where some register and calibration needs
to be done on port0 first and then with the related port.

This is O.K. as port0 presence is mandatory for the functionality
of the integrated switch and it's assumed to be always present
on the MDIO bus.

MAINTAINERS is updated to reflect the changed code.

(this was tested from a long time and also verified by Airoha for
correct order of calibration)

Changes v4:
- Fix typo in Kconfig
- Prevent out-of-bounds for zcal_ctrl
- Protect concurrent rext_sw_calib_done
- Validate port 0 presence for calibration
- Correctly set shared local variable
- Use phy_package_init_once for shared tables
- Better handle early exit restore
- Better handle phy_select_page

Changes v3:
- Address comments from sashiko bot
- Apply review and suggested changes from Airoha
- Rebase on top of net-next

Changes v2:
- Split header register patch from cal_cycle part
- Fix missing EXPORT_SYMBOL_GPL

Christian Marangi (6):
  net: phy: mediatek: export __mtk_tr_write
  net: phy: mediatek: move MTK GE SoC registers define to dedicated
    header
  net: phy: mediatek: generalize cal_cycle function for GE SoC
  net: phy: mediatek: split Airoha code to dedicated source
  net: phy: mediatek: add calibration logic for AN7581
  net: phy: mediatek: add calibration logic for AN7583

 MAINTAINERS                              |    9 +
 drivers/net/phy/mediatek/Kconfig         |   18 +-
 drivers/net/phy/mediatek/Makefile        |    1 +
 drivers/net/phy/mediatek/airoha-ge-soc.c | 1882 ++++++++++++++++++++++
 drivers/net/phy/mediatek/mtk-ge-soc.c    |  553 +------
 drivers/net/phy/mediatek/mtk-ge-soc.h    |  377 +++++
 drivers/net/phy/mediatek/mtk-phy-lib.c   |   77 +-
 drivers/net/phy/mediatek/mtk.h           |   15 +
 8 files changed, 2396 insertions(+), 536 deletions(-)
 create mode 100644 drivers/net/phy/mediatek/airoha-ge-soc.c
 create mode 100644 drivers/net/phy/mediatek/mtk-ge-soc.h

-- 
2.55.0

