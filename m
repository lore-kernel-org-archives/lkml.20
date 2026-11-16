Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826563;
	b=DO+V/eG6L7rUrS74RuLX8PLhV2hAmkpSnPu23X70jf6MpGtPzJkW+HAIMn44lnFrd36q
	 iUux4uLkTz97P3AVl4t0LNX/uvzrfbKm+3yhT8HDVDcXpQMri7zlLw5ZzxwuVLrrkZuEx
	 OJRUROLCfATa/u6k2GfeeYKtvRhlSfe0NKvZVPjl5Bp/eZ1Aw1zTTUtqefcAaSzQo+2LJ
	 tgtvQfISySroeWb31xPaHZ9xdRKDzSSvKC6iHrFvxFfXoZwvL2Wz6whzeCwTp8znk2OcS
	 HpzF8iG0+xYKyc5/R2/cJjqHPa2/zhR3zKMwtVLr471IsnUdU/naeDGQ/vubuR6RltQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EJkLT5+FbYsBkV6aiXjOdMACJbaO9v6pAiv+btB2ar8=;
	b=g25WzP+LWlsIrPnUZcwW01Wijcr97OOVczeu193oH9YRDGXATaMHXpJ4vNDys6Y7KqsP
	 75Ok8gVyfUnfSAeZbI7uLTCnW5ahUQkhl6CUWzkzZ7EBeKQzWARPIrisnW4ILCvYBf4xz
	 6G33527KBPaxqIblgozD965Y1Etw4pLTFiqvDfPdwgdOBirMNyXT2+7G+2HChNF4+oaOk
	 ssjxvZfSvjtdWfUhNBhL1sRJHW6pUy0JWuyFJCfOJQ+liTHB8wbj3BsuH6KGWBBrXVq+j
	 4U3J9cccgNOJ+ap1cK5N68gHcT+AdQfm8lS/+6Wb8S+Yfg6euCzXTJEoKFVVsKk6Apw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uOrwRPEd;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40D8606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D40D8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uOrwRPEd
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b4e04eda5aso3937517b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794826562; x=1795431362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EJkLT5+FbYsBkV6aiXjOdMACJbaO9v6pAiv+btB2ar8=;
        b=uOrwRPEdZxwb751ktNgOXxghBLBpPgaLQHcaFaWrPZ9mYh+pJvYGFRSmBcQjXlNGUu
         f8sf9QV0oC/OyjPxc6MyhCG9MtP/nOKCLHziSXOy9zantRD21yBHE77MW2QrB3iVWuL4
         C1N3vLsRi+Emnf+aQrr85rlNlRbXD7I86JgrRIPPecbV4Ns/CDPrcgT3hCNKqzq29kcO
         5zkokpzQ7xXbjktdnEJ2iQthbiO9qkYK0g5Wni6g5DuKx1RRyhKaQPBcbZ8sCxLr/Vc7
         Folo/BNh8KRGnbanBK/Ch5dQsaFe+qEz3vvlzZGrSF/hHNzV76yJlo7y6C2SvwQppMCd
         XmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826562; x=1795431362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EJkLT5+FbYsBkV6aiXjOdMACJbaO9v6pAiv+btB2ar8=;
        b=mja00S+YaDq+8j92ZvxePtgPDUUm3WyL5pvF3Aaq3O1VUhRbIOfBOp6F2E7ZzupHbm
         M9po/zU4UW7ZDEUK6+qeUhSvW2fVl+JlONCzlAqYaFrH+cHbQXvj7PM/93xyVHPQ4WRJ
         9cFAD2Mxu2l8EK0j3GKil8pacfmhEQeYSFmt0nZ+ZNfNausjX7a4SF+hSLqewfQvz21Y
         aQdOuvBMMIOjQcW+145UtNDdPa5csTYl2fIVHizGo7ZesyCjJeHQU19EV0BP4iRcor1Y
         BbdCkgzLM+SQKOc8ZShAAx7dInh+qBIDHRffJQ0boz/epkhBUmnRSY/met/tTW5gST+u
         5SZA==
X-Forwarded-Encrypted: i=1; AL+hErFZMphobVS7mgU/X7It6eNlum6faPJMfCYk+xC8LDUF1dG+hlHmvhtcNHUWKbbT68W6sGuMIohQbyP52QI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+knDb0nuQ3ZQDFZxegi3OR+Yjd/ed/i0qDFB7gjWAHw3/7UaQD
	xgqp8OdyHZITzWCDgE/CK0nWjDYfG/0Hy7WqJncI7952C2wIbP8a+iOW
X-Gm-Gg: AZFdTZd862vR+hrfl2R0liDYm2ERs37j+fsXlq5nbf6Ykt2sCFSYH2OJJDg3MkGrfMG
	PCLeOQfdFrydO+C+IxAtghhfrnymS+tMfvKnnN/RvcxxdYDmu2sQJcVD+RQ7jbmfIoflNpyl1Lw
	t6h/nBS0695VhYFAVUvMkGw7vvQTN5LnwAqhsz5tRk+4MCg2UlAYqezqzSk2x6gBNsa53KUqN+P
	1xf44EqqIKw0UzXck7s7gfqH5qxxIa4tc1tBaNb/kLH0MQgh2d72D8Yw4+Zhsbzxx3BA+T/OoO1
	vd1oiAjWc2IpEAI8hjN8H6Xk928SweUKR7y6LOu+M5mi176g0Q+26r3OGi/CYeO/yCjMWTah5FU
	q1qUAywAgimEboJVS4XxNt89rY7HmhzGRcSBd9OkRWoil+JkFI3M2zrNSboefXK0RArMVAzFDsF
	cGGFSfilVAx50PYEwRufrzbd/6rbAMYX1Ai0XNALX+xNmU6fCJk0MqQcZQjVF4WuRs3PDJO4Aw8
	hqNr547eRFwv0e4hZfjXE6Zp6lEEgW49a+MtCKGMUnDv00OPMTYAkeV9vPP0FDVkSQ0OBsF1ARz
	QQOHoJVdUvOz8UkLg5BGuct83vydRX0vGG7QvBg9xGt3UrQCi63VG3KNrxgxvrM1l7j3dTZ3N2e
	LmQPGmRIBS8QVkYJ/PzhpySvNn5uFexE+rw150e05P6L9fcb+7UGWOooGtg==
X-Received: by 2002:a05:690c:34c9:b0:8b4:c9b1:ba6b with SMTP id 00721157ae682-8b4c9b1c520mr26140997b3.23.1794826561834;
        Mon, 16 Nov 2026 02:56:01 -0800 (PST)
Received: from MaquinaLab.. ([2804:1b2:aa41:8a69:2b8b:32cb:351d:f30d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa7f1a0dsm82274987b3.1.2026.11.16.02.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:56:01 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Xu Rao <raoxu@uniontech.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] phy: sun4i-usb: add the Allwinner A733 USB PHY
Date: Mon, 16 Nov 2026 07:55:42 -0300
Message-ID: <20261116105544.669029-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This adds the A733 to the sun4i-usb PHY driver. It works with the D1
settings, except that the A733 gets SIDDQ cleared before the PHY reset
is released (patch 2). That made an intermittent USB1 enumeration
failure go away on my board.

I only have one Cubie A7Z, running a local DT, since there's no A733
dtsi upstream yet. Only USB1 is enabled in it, so PHY0 (the OTG port)
never went through the new order. The boots ran the same reorder on
top of 7.3-rc6, before I turned it into a per-SoC flag.

The numbers are in patch 2. The comparison inside the last run alone
(1/31 vs 0/60) isn't statistically significant, so it leans on the
earlier 3/40 too.

One question. The vendor BSP uses this order in common code, for every
SoC. I kept it per SoC because I can't test the others and the manual
says nothing about the order. Would you prefer it for all the SoCs that
clear PHY_CTL_SIDDQ (D1, H616, and A100/A523 through the D1 fallback),
or is a per-SoC flag fine?

Changes in v2:
- Reword the binding commit message into a single paragraph (Krzysztof)
- Rebase on phy/next and drop the dependency on Xu Rao's "phy:
  allwinner: sun4i-usb: disable the PHY2 PMU clock after SIDDQ setup".
  Patch 2 only overlaps with it in context.

v1: https://lore.kernel.org/all/20261029172325.3425046-1-vinicius.eduardo.pedrosa@gmail.com/

Vinicius

Vinicius Pedrosa (2):
  dt-bindings: phy: document Allwinner A733 USB-2.0 PHY
  phy: sun4i-usb: clear SIDDQ before the PHY reset on A733

 .../phy/allwinner,sun50i-a64-usb-phy.yaml     |  1 +
 drivers/phy/allwinner/phy-sun4i-usb.c         | 35 ++++++++++++++++---
 2 files changed, 31 insertions(+), 5 deletions(-)


base-commit: 6bdfbe223ed4735073c299a6645ebd3faac3f51f
-- 
2.43.0

