Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367625540A7
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968453; cv=none; b=Bjos/vKzXD4SWQRMy1iYAmgrz9YJWAlnLNUCk2pH5dE5XMPxtJEWqPCdmDn79G2wZxmlX3zgvIcRG9FAdKXi9JqsDEh2neH6Vw6P3C0W3+I8ZG1PSLAGzmKG6f0SgqUDfsbph4DTauSjdHGuKQ1xvFS6tAh4EQaB5v27aDVHMEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968453; c=relaxed/simple;
	bh=3GY6XOvXPbUEDiiCOkrH5UVYFspQUAgBaWkiq8xenTw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CXktWMYT5MqjjGE6l57HLM2eooqcRtWAk3VE4aeVW0zrcdNiJw7xa+lOhMylS7BangOzWSHkZexWBCzEoH7hma93htzEwB/4zxy3LxWJKM1/KCkqK2i0Qto0fgqcP3FS01BYK7ZtEmXVuDVOk3DVPcwbt5zY5oT+FIAWpJ4YnHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LPa9kVI0; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LPa9kVI0"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4869b6f8629so98207f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788968450; x=1789573250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8S9AI7MuVos4oGOaFeo64Xw5+h+A/2gGgWVTyAi5z6M=;
        b=LPa9kVI0GaR1hZP89/qsJwppad5ZC9ikRj3+HrI4jlVOWJ3GtYs10gCPhxL+pKYrYO
         1hFY0wWoH+EGD000IEU2reBYDlPC/n5xJlEm6j08cKI+xJF+X+o8ESnXLainmQg3T/rb
         q/eCDHquAXyCOTRD6yNFa46Y9x1ybSARMGxRi6nJVwtmy0i0CIZHg7bc5YkLp9Ev9Nzu
         ARE2crb45g9vsFgnB1uk8t/TDSZrgqWx7RoOZXz4T73qCDFYSZc1QN32uedHbyCIWyvy
         imZG5CR6f3xW0Kgh9BH2dxspIvAFaYht/JPEMe11YNKAMMShEUkxO8Jk9RhST+6q4b9Y
         VCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968450; x=1789573250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8S9AI7MuVos4oGOaFeo64Xw5+h+A/2gGgWVTyAi5z6M=;
        b=ct/Ca1u5/5bqz+cXtD9sRmEf99WK9EkIDK7tzjVzDlksqPYUHy3obpiyJZOyn2iM+1
         rNeVaTO+k9JSZL1QKuSJaGN6m5zW04LObA4/rgG19KzTL8DcLrK5nTF1U84yBvdlmc7D
         6fPQsqD6pWV49f1oebPn/7AW3MLuRKuWmv/prA2s1hdo2Ikt9ckLMK7sFx4YQJDmE3fy
         BYzXcTMpz4XgdqcdbJagTZlFE9gek8OM5T60kKUTtWwTFD/vkMw89k0bfihQKWiTp2QO
         WTdqeevB5be5sHQPHx8pei7ZhwKfEVdu6PiNY2RgQUmpUMb6fyUPOPw582xJEGuuczNl
         BxSA==
X-Forwarded-Encrypted: i=1; AKwUvBzqgVu9csiT36PCKvcwyaOll2DB64P1gUoAdRxrCiKFDmH9mDgHsI6ptME4ivz3DvT0C7GYUjh7LUb11YA=@vger.kernel.org
X-Gm-Message-State: AFuF++mrSfyc3DsqEoQKU4pw+0JO/00Ld+azjIRuzYVpqaldpgHHUb5K
	C6POyZdOgJ6sFwDrPJ7acCBa+rffURwpesc2QXUKqAnXIgLfaD4/5Ta3
X-Gm-Gg: AYBFou1d+T36AhzNGm3ZG2DvK3pMR9sh2E54UbYfXj+vXGVlGBO3KLPlQM90AF14Eei
	d6ByVNNGcw19YOxE3Y5JLNu3KWvZ9lOO03Mew1IB8ufxhJAyXJoZW8U/LWwr9FA98IUI3TOFCf2
	aiGfSDGSCRhn6V/vZlac1Dad+ZiGZXBVd8N9dFKcnEIVnXjN1vBuKrz3qomFmRElscnSbzFSeRx
	vOiomdMgy+7fsNvWY3okzzkTVK+/5GUOJAtrXXuMEOamB0BZaxvc9yrj7lQJHBMETTOoheArPhF
	T56W81O4Br4URa3xdyckgVleIaKX8bc0z9S8rkIfXLL3g6614bd86PMKXL52ZOrI8y1ojkJvedZ
	K+ia/Y+RzjVK+iQ6zLS3wrtnJ3JyH0cQx9VOKCN4RuQYSgO3l68YNn+vJLvXmVmdRZBf80VQIJH
	SuiI1e2bh9wJb+0/IPCeZfdlza/RoBb4ox1xl8MeTkWYj2IqQDYLZf3SzQ+o0qgVOYsVUJXI5JT
	vlpJ7jkRqqEGycm1PiFC1tgZg==
X-Received: by 2002:a05:6000:2602:b0:485:8c16:a34a with SMTP id ffacd0b85a97d-4858c16a7ffmr34924854f8f.34.1788968449996;
        Wed, 09 Sep 2026 08:40:49 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885be1c1sm43810943f8f.32.2026.09.09.08.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:40:49 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	consmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/2] Introduce basic support for MR-NAVQ95
Date: Wed,  9 Sep 2026 08:39:41 -0700
Message-ID: <20260909153943.1048-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Hi folks,

So, as the title says, this series attempts to introduce basic support for
NXP's MR-NAVQ95 board. The "basic support" refers to introducing a new DTS
and enabling a couple of peripherals so that the board'll be able to boot
from eMMC/SD/NFS.

So, compared to MX95-19x19-EVK, this board has a smaller form factor
(comparable to the MX95-based FRDM boards) and is designed for
robotics-related applications (e.g. drones, rovers, humanoids, etc...).
The board is currently at revision B and is only available internally.
The board should be officially announced around October/November 2026.

Given that the board and its support are fairly new and still under
development, I would expect some (hopefully) small changes to the DTS.
Hopefully, this'll be acceptable.

The schematics, a brief overview and some pictures of the board are
publicly available at [1].

[1]: https://github.com/NXP-Robotics/MR-NAVQ95

---

Changes in v4:

* added missing "memory" node.

* link to v3: https://lore.kernel.org/imx/20260901131918.1189-1-laurentiumihalcea111@gmail.com

Changes in v3:

* use "gpios" instead of the deprecated "gpio" for the "regulator-usdhc2"
node.

* fix issues raised by running "dt-check-style --mode strict". Note that
"dt-check-style" still reports the following issues:

[property-order] property 'compatible' out of canonical order [...]
[line-length] line exceeds 80 columns [...]

these'll be fixed by Krzysztof Kozlowski's on-going patches: [3]. Manually
applied his patches and dt-check-style seems happy with the DTS.

* link to v2: https://lore.kernel.org/imx/20260827150657.1657-1-laurentiumihalcea111@gmail.com/

[3]: https://lore.kernel.org/lkml/20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com/

Changes in v2:

* remove the "pinctrl_usdhc2_100mhz", "pinctrl_usdhc2_200mhz", and
"pinctrl_usdhc1_100mhz" DT nodes as they have the same configuration
as "pinctrl_usdhc2" and "pinctrl_usdhc1", respectively.

* add "bootph-pre-ram" property to all nodes that were included in Elena's
u-boot patches. See [2]. Note that "imx95-u-boot.dtsi" is still required
for the binman node and for the rest of the nodes tagged with
"bootph-pre-ram".

* link to v1: https://lore.kernel.org/imx/20260825120812.2152-1-laurentiumihalcea111@gmail.com/

[2]: https://lists.u-boot-project.org/pipermail/u-boot/2026-August/629002.html

---

Laurentiu Mihalcea (2):
  dt-bindings: arm: fsl: add MR-NAVQ95 board
  arm64: dts: freescale: add MR-NAVQ95 basic board support

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 arch/arm64/boot/dts/freescale/imx95-navq.dts  | 228 ++++++++++++++++++
 3 files changed, 230 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-navq.dts

-- 
2.53.0

