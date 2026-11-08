Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794162499;
	b=zOpqgN3ak116YIqiHVIJOhNu3Y69glgnS8wlR2KOswhROIKCMPRU7+ZPHUkE12JiBCjX
	 X65NwyD5PbRcMNpX0h+c991EiGsBgaLsWVuUha1NoNdnV2IfSTWJFeraWwKz7e725iHgp
	 pVPtcqngY0M7SLSsNWRt84gBx10Ok/B2zqUc9s8yjJjOhskRQO7OGp8LlMp/ajq9fYEBz
	 yLfRjvxZZWZ9oGCYhIin9+mNBChNGAokNaCOs6oAWUPzn2k0oECcKkz6O7MtM6DtzTIaU
	 2Cxx81xueNYs2tgrol2Nn9nNHheHiSlrhmIq0OnKhrTvDdKbPWnv0d0mhrjd3lpvyeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794162499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=7LOc5o/iR4ccdtew0ZugkEGQ7ajVcmy8+3GKA8lPx8c=;
	b=xs54wKNgyuSRwgOCPbu9MB3EY2fW11tBn36hPHtuSy50yTfUwHY5BioQ/x3yf9qiCABi
	 aoc1j5UNEyJDWEmM+DaHvHTGYRZ0EtyCm3PCqIX95ZmQodjCTGUSmCO0kzKC7mSbn6qvZ
	 D53CDu7fujqtQ5GCDk8cQoYkJe0Ejn8D6PF53klY35vwMp4vmXvHrIMo5q9nB84v77nQP
	 Ef8KEembNkj+kPsHxFLlwZgi+/FKehS8nu+fSoqTyw0KYWG0kkxgXJhOLeWhUcB6TDe0/
	 LHy6ga2VZ4nU5J+8OyFu4LG0z1VFYd3LLjN8VoMCTS+KzmZWJNcBnYLagoWRg8O2RwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ggr9Rhlc;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CD1606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 18:28:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51CD1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ggr9Rhlc
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso28618666b.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 10:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794162497; x=1794767297; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7LOc5o/iR4ccdtew0ZugkEGQ7ajVcmy8+3GKA8lPx8c=;
        b=ggr9RhlcaiP+4+478edoxac3okADJCWVpY1iF+8Xi5P9iILzqZDSOzhI4/j1dUXf7A
         Jctj2AVSxth9HClE/DggW0jSecx7Yz8ZmTM7KUpMMUDDpmC0275rfQIaLJ5lRuofLCLF
         H4UhKM4GoX5hCSpZCF6jUg4XEgOaVUC3y5Psfxhq2WC7RYcqp/Q5kNi0JjfJOGxKxdjC
         MtGrkJexY+vEo91JqlQFNy2gr2eaUSS0c8dBb6rCSPXlvSXzMyH2Zk3+Ww5oZQaocrok
         zRSGfzgSJr0F4bHYIf+leTAumLKRgGr9JkI7dRARp3w5ATvZKwSx179h+Mtn8q7+d07K
         seyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794162497; x=1794767297;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7LOc5o/iR4ccdtew0ZugkEGQ7ajVcmy8+3GKA8lPx8c=;
        b=w1/M1HmY9EAZbFoZHHJ0gWmazsrhfua00/fF49Lfds2oRtU6gjwP+LwhoFqbkK4vIO
         7zrUV4jhkCb+WYyn1gu9NdlpdzG1Inta0v2wZpGYpdh/KAqePJkNvAAtXLvAUNBn46kT
         gnWUlpsIXBSlm4ngBeH/JRZAM0z4N6Vj78RxhDaX4NtzL0yzdBcUc4w8yHp3krDYdGir
         JffcK16pjCD29xlbnfOJdGzVihOjxEm11QW9y280F+LlDjohfrMJuoFQA4v2KG3x4o99
         SSF/XwcELqTr7HVquNjh1iCG/HB+8z3C8WXmDrQRGi8V+iUy2Ofmh9i1iOPjOTrxSX8j
         K36A==
X-Forwarded-Encrypted: i=1; AL+hErHl5sPtV4zEkrxQ1kdiY07MOBJhac+1ou2E/1SyuBxAuB+DCVCkA8y31XTuIcDdVj9b2QiNXDPMI6rlU2s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GBri6ctNqEJUy9nc604IK0OMN5ThBvebh/VEItvUFem97vQj1
	i6TVgd5ny/MLbu4kcP8gTXiy++/PG0tAeaMaRWH9sOhyZiz8NeAgudBV
X-Gm-Gg: AYBFou08weKiPUrpLDA3E8Tfow2VBDbqoxb3RNjink764r7as6ye99KtypnPAexycKN
	Yj5vzMiTFQ1RH634WIU/UJIqVgW56ejYir8/iV0JboWEVNblVnSn5+c2OM3wEUgtGdhV/jsh9tK
	DQHdlddbOZPZRNcIMuxXf4lE+7XjSs46JpwwogWfjXhdy6o/vWP+eXb3Rw323Q5k0V4UhzfKgDx
	OTX4C9fB2OUnXcy3kGQ+9eM0vrRr2ekVANziJuaYJfY2USt+ix0Qt31Kf6J0MTxOuE3HiGjfH89
	T/cEgbuTIaDIakquQfRvxp+kzKMKOibVNHj4XfwpTatNLqVo2/7uw1SQ031zBBT2SptotFNzX8L
	lvNqz0slkfTaLLlDVSXL690Jpi4NWMkWBfGi/E4TPYkLOxfMivPPSLcEzPjmzxFDIYJpoVxO8Gk
	L4+q0wA/T4hZVov9rf1eDiXY+bByN6HSVHGUxTYRcv2UYaR85rix2a1neJ0q53nmt98RZSIckQz
	nzYf2d2w1wWcIS3kDIrKp5CTNAuledDSwFfLG3H/q3nchWvzQ/Gkcgcor1RNvtbeUq6UsIQcKrX
	CEALpPyrr4UfhPD8oahvjuFLhYy/2beNCe9kzyHbZjNFebqkNX8q9iw4kvHF1qA6
X-Received: by 2002:a17:906:9f90:b0:c3e:e726:9548 with SMTP id a640c23a62f3a-c4d6d35bdb4mr141902266b.14.1794162496378;
        Sun, 08 Nov 2026 10:28:16 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a47515dsm75254366b.44.2026.11.08.10.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:28:15 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Subject: [PATCH 0/2] pinctrl: mediatek: Add MT6895 support
Date: Sun, 08 Nov 2026 21:27:09 +0300
Message-Id: <20261108-pinctrl-mt6895-v1-0-f704c443b31a@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6DIBBA0auYWUsCE6XoVYwLpUM7RtEANk2Md
 y/V5Vv8f0CkwBShLQ4I9OHIq89QZQH2PfgXCX5mA0rUSkkjNvY2hVksSZumFqYyiCgfrhos5Gg
 L5Ph7Dbv+dtzHiWz6X+A8fw6MQLJyAAAA
X-Change-ID: 20261108-pinctrl-mt6895-84822207f4ac
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexander Letuchiy <asalde.le1@gmail.com>, Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2

This series adds the pin controller of the MediaTek Dimensity 8000/8100
(MT6895) SoC: the binding and a driver on top of the common Paris code.

The pinmux macro header and the pio node will be sent with the next
version of the MT6895 / Xiaomi Poco X4 GT initial support series.

The tables come from the MediaTek driver in the Xiaomi kernel source
release [1]. They were checked field by field against that driver and
against register dumps from the device running the vendor kernel.

Tested on a Xiaomi Poco X4 GT (xaga) on top of next-20261102: pinmux,
pin configuration, GPIO and EINT.

[1] https://github.com/MiCode/Xiaomi_Kernel_OpenSource/tree/56ec519f6
    (branch xaga-s-oss)

Assisted-by: Claude:claude-opus-5-5
---
Alexander Letuchiy (2):
      dt-bindings: pinctrl: mediatek: Document MT6895 pin controller
      pinctrl: mediatek: Add support for MT6895 pinctrl

 .../bindings/pinctrl/mediatek,mt6895-pinctrl.yaml  |  228 ++
 drivers/pinctrl/mediatek/Kconfig                   |   10 +
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6895.c          | 1617 ++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6895.h      | 2717 ++++++++++++++++++++
 5 files changed, 4573 insertions(+)
---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20261108-pinctrl-mt6895-84822207f4ac

Best regards,
--  
Alexander Letuchiy <asalde.le1@gmail.com>

