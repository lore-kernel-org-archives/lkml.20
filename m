Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876110;
	b=FVJmSxZN9p23U+Zf0zPB8HMvQJfgsS4U17oaJgcY/oMgbhKnHzXdHJdnSnGnf4YACMP/
	 ToKHvWknBQxLMtOE46qt1cmOsElC0W4q0iYZyx+eIB7SuQxmu3VyA0HxAaL8fSNS8Pkqk
	 XqlpCf8NMj+kcYfU1aVOtqJrf4x5T3Q5KWQDSqzoLjLSnIGUfaFygRBVySkQmDBy5nC+D
	 B8g3MMW4v2BT9RrvNJT+ra03SUyZF2Ko4QJLXE+IYxN9FDzdfzYA6XjnpQZ7jSGMAhKPB
	 cfLHTZwV8vWZca7j8slg8Fw6OgFqlaP4SUgq5cTR684RC51yAA/KPzUjhZB3hBWOGlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=S3kBGMpJUDqyGZZ/3EY9QtmjH3XQ/06sMAWybkANdok=;
	b=jx016X2SFVtAZp48kC8ur5ckCQ3U20h2iiXmuapAeyZvM/Yc26jkQS/OsuMh0FzFY3lV
	 J9ekJ/0ai5xu8b1OVkH6MZNCZZejvsz2TeyzYb1tOVONl2cbWsziH+SJivv68Xt76glSp
	 OPcPz6AJlAXwYfyQrMaqrzqzPpG20dcW3pj7s6dc4uHhhRjWK3o/YJxJrpAFdQsBLoqrb
	 Y9FygdtvFpsNSNBQJyJBOMTleDnqxDxh6IMQ1+CxMOfcMzvfWSUJWgJebOCdr7GK/ufVt
	 1Hqc67XD16JVqx4qgR6PlH1VDVO0O+nqDt4zc+mvaxejj/PEUCaC6l7cjXqdD+ja1fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u2Mckaf7;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88717606EE9B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88717606EE9B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u2Mckaf7
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso11514125e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793876109; x=1794480909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S3kBGMpJUDqyGZZ/3EY9QtmjH3XQ/06sMAWybkANdok=;
        b=u2Mckaf72MIFO28Q8RwfK/lbM5uktuJE64/vY3ti6Vu2yRYVEk3NoKZqDkWoJ982A/
         XJRnrA2u7LoZ/G7Y21kthouyeGcNCUv9NtRa5kdATIQj662s4BW49MNSqu0IrDgQ45X8
         iCBHrHr9b4+cC/w28QMebSAET2czFcRanHMQX86qtIXWI4uh+3otxo1J8Q35iqXL+eXj
         6wYZIDDPzNOc/2rCS87HRpYjja+srroLYbmp7Q91pvHKNrkqZBXjuKGLoZ99QtncLYZ/
         L9RsOXu9+W98X31RMtoTuJz59NE7I0os5Z+iPTwYyLB8YnEiLu/hO6wGDP6Fmdvvn43a
         MmhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876109; x=1794480909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S3kBGMpJUDqyGZZ/3EY9QtmjH3XQ/06sMAWybkANdok=;
        b=zuNBdUPV7Hz0hDUPwtGrZuPXjE0YXki6Ie7norn7Es3T0QqJa6pMqW8CJiAhiTPw7I
         6a3pgLaZurUEGLGKtRWUaifcAuRXVOXAVwZR1Kf+Zy3g4DSSQ62oq0ZnjFdI3dZq7/2D
         C6wd4uft3lAqhMSYSCrPqh2Iz5JoYklBJNyY7zHlKc1+JWhMSTTcwzwnf5OnMgndGaoo
         Xr1QJwrJMNdSM90ej1fN1aehQ+1fomjsD9OwZAGWqRYt+psgQfK9S+VlD8LXPlknK0jf
         fJXkYEpXWUcxDChlEqrKrzSzrZQONujNQ+zCV+aE3deZTSgZS0VLAGu8d2C7lj3vNyiL
         n9fg==
X-Forwarded-Encrypted: i=1; AKwUvBw77Jk8QOg1JhhTSncvNRsqUlCPrR/VBiWvwkgly13egbpM1UB0RDqlKSM4S6z0LWR/PMOCxlpCf8rbsr4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UOJW6jsxcGBzZuojTMtJe/dmtMHYiZoeygs+bjlxofQxywTVl
	1hzAyrhSavEyBPYeIPVEkzxwykew6W6hZ4GGDESgvaOcQrArdRx6rxK3
X-Gm-Gg: AYBFou1VRUBs4tv1ubV01qNDrci/bRjYF9yy70ZYscIYkUxlCDgr95FF2tBVXDoigHU
	6H9nxqlDED14PMkjkR5MCDPu0Ij8MUULWT1mluoi4ksiuVWgXxh6ttJGUiC66IWU5wYBeXA9kEr
	d0LTfVVqq05ulf15WeqGssnKnFK03myZMIG6NdxQd7z3NoyZdEuPAKqmgWup2koB65q1M2gHQR+
	MQINeSDnA0+mj2sHjlpbNW9oJnn8amcpvU3rOURsmnVMzSFtxuc4UUWN2WZ89A0JR3SERJtzOsp
	5aw1wv7AS3Ryy70bcgIG3CQGvkn42GjZilck5LF1XZgHZEoQiUUwCaLBTzkYBbPA6F0LbZJ9+GG
	aAlRLfTEMMQlnvvrFz1BaAYKhdqAcss5LHokfs9gsV0gItnE/MSIGic/AVd4tGzko6FvkXysEyo
	PE8UUveYDc4K3fITcw/bZdCd8gsFuxbVT3oZw1cy7ApcNMigQEqICeCrmP+hkM5leeI3IPfQeRd
	6rGBM6g7CMjny7xf9w3jnXQw/lkGepENl5aMEIusbk8Zicr+6Bmnmk7EHbVr6xYXNh3yc6v0ENN
	k7YtAs0M09n21LiKcLYcUcYtmLVRT4ueSZuS6xm/JesHaSftiksMq7+cvDBg/oO5adg0iyZwyPT
	d+aS5evWTtzDGKRhJa5zSvZ/+
X-Received: by 2002:a05:600c:5397:b0:4a4:7a8d:c736 with SMTP id 5b1f17b1804b1-4ac16acfceamr398713475e9.9.1793876108729;
        Thu, 05 Nov 2026 02:55:08 -0800 (PST)
Received: from Ansuel-XPS24.lan (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b57317cb8esm59576355e9.13.2026.11.05.02.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:55:08 -0800 (PST)
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
Subject: [PATCH net-next v5 0/6] net: phy: mediatek: calibration for AN7581/3
Date: Thu,  5 Nov 2026 11:54:56 +0100
Message-ID: <20261105105504.1024-1-ansuelsmth@gmail.com>
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

Changes v5:
- Add review tag
- Add additional helper for phy package
- Use __phy_package helper instead of phydev_p0
- Better use lock and unlock for phy package
- Configure base address for the phy package

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
  net: phy: add additional helper for PHY package
  net: phy: mediatek: split Airoha code to dedicated source
  net: phy: mediatek: add calibration logic for AN7581
  net: phy: mediatek: add calibration logic for AN7583

 MAINTAINERS                              |    9 +
 drivers/net/phy/mediatek/Kconfig         |   18 +-
 drivers/net/phy/mediatek/Makefile        |    1 +
 drivers/net/phy/mediatek/airoha-ge-soc.c | 1917 ++++++++++++++++++++++
 drivers/net/phy/mediatek/mtk-ge-soc.c    |  521 +-----
 drivers/net/phy/mediatek/mtk-ge-soc.h    |  374 +++++
 drivers/net/phy/mediatek/mtk-phy-lib.c   |   77 +-
 drivers/net/phy/mediatek/mtk.h           |   15 +
 drivers/net/phy/phy_package.c            |   57 +
 drivers/net/phy/phylib.h                 |   73 +
 10 files changed, 2537 insertions(+), 525 deletions(-)
 create mode 100644 drivers/net/phy/mediatek/airoha-ge-soc.c
 create mode 100644 drivers/net/phy/mediatek/mtk-ge-soc.h

-- 
2.55.0

