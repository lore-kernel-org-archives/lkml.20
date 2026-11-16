Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843189;
	b=Zmaf/pGXok721/Lw0iSSoEWOXybmDFdEnxO4gb0SWs02XlguEQmJ9REIn/O83saDkecg
	 tlDZEUZhSLP7/eouupxdbl97ACD6u/cpniU8NypycWFq8GH8kYWCOiMmBvROevaRNDNOB
	 IJUaSP5GixQ4npFc6dbf0Pb3jhViTQ01IePLWrIhNOadYUHe8XhzEKBw8qdsGyiacjNWf
	 wPF/lAzKj51axi2R+IunQHSrRbMbjzhrW86SV5wsUuRwxA6WSjUCksBmwI0FadJyn0rOF
	 vwWKmre8E9ovqB76fmYKaNdS0tt2Qr316Bh7Ltle+kun5IfU10Of0SpzM3FIcYJHdPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=StVqFurT/wQrRDKjt1hr+U29vy1fhAKDYGXtf7ZTQNQ=;
	b=B10Xjj8Bl+JhhsNyihOpb3siwPg0Gvn10Uf3P9rnyUQj36i0YlBtP9jgpG+LyoKVlnjm
	 k9aEPVa6iAl1rYgsVtvC07dMAFbKW/cr3/k14memjl0DLDGan5q7Lfemz/R/VxYWckLS9
	 IUeZtJ/qwNAbGMFk9TlNkD/8tQC0CZbLVVnXpLLNShz0F56QO50nRaF/DJiGmMeFEUu9w
	 7cBJpq34VxeckM2GdYT5XZ4nGGk8ZJ9X1aMzdK8huvkxFKaqoTZ2ZOj7iAwQzJ0nD9jF8
	 siTWVJQhL6M5POBoJveuPdrwIh3mSKO+By6PywXRlTO74mCUenWyvD0fbd9hH826noA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=joM6uKyo;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35F5606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E35F5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=joM6uKyo
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-49d64a88222so1528885f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794843187; x=1795447987; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=StVqFurT/wQrRDKjt1hr+U29vy1fhAKDYGXtf7ZTQNQ=;
        b=joM6uKyouT8sPrX51vhCW9/0H0T//6PvlGhtPq11U+ncfMyXfcPZRyS9D842iZpDqu
         puYYGhCu+LjC1pJxdlYrnh5hD6JMJanBaL+ErfSsnqbUktBgNlmDokWPw9KR0bu4w4sY
         Wd28TjVzQeF+QM37PPAkiSE0NdfV9A0V92eIxhEPJ0MehBei/UCQXVgfT1GmTaD6cAVr
         Gt5fEEmOsVNVG9k/osNDJjKh2k1M8WmF559w1YA/OeJpcf6IDv03uA+SxPoE7zTdC/ed
         bFAG4x0LaK0KkJ6be7x710jwrzNJLoVCzdjIuSCmWdxweFfxmS6Z0JcOAsSlf1E1U4Hs
         kWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794843187; x=1795447987;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=StVqFurT/wQrRDKjt1hr+U29vy1fhAKDYGXtf7ZTQNQ=;
        b=khifvoctIFcaiBP0LBWotP3r+q7k/jwwKPF5PKDZkRrHxJGZwVpNVhFx7bMtwaSYre
         QIMmUe2MH2Vz3g7SY1D2g7JsIQB5GPBakla2RbLQhRbATmeSb9phlUMEGE4sd8SU518h
         hxzB7i4qrrqBwkXh1GhujOFYwLvEleOl+NE2lH3OE6kviFMLW+PprZsMKfGzBE0UO0Hz
         yw288XaU2n27Tcc4w8CczTA7bIK6VShdrHw7WpqiYi4X7Wa87C+rKWgr3vQuZv8u5LFU
         eZbB1GjB31YxmG+9W0rkbvHKazOeXcRcPylhQb1e/TMiOTAmfzrYymNALHn0H4ici4gR
         Eb6w==
X-Forwarded-Encrypted: i=1; AL+hErGVfB95B8BkZU33ooniiX7F7RaoI8bQ2OoHI4wzGuor3z6b6R51oB+hmtEvQMJN3X5egGhSqTrKq3nVLgo=@vger.kernel.org
X-Gm-Message-State: APuU4Z95aG5AFW70FY9e1jIvu3z8BLnLlSfMf1HaRoWH4oiHPofyf17S
	dKxyM2N+ss9Kb9QYgWJZX5U5pKbOUnN9QKY7epBQP6HcM+qgGhb73ZK4
X-Gm-Gg: AYBFou0qfavaREuZn8vIELROZ6kFzR4VYG8RgqQXbbDyzciQk/FZeJupwfN2YSbqPvS
	/W3ewZkPrIaQ8KjAHs4T8j0L4oqOLgwdkgyROyiM/QG0fWnjB8Fd82Z3opwpjN0e3Tt1lxz63Yn
	DjmxiDNUT3cPjojDAaDXcYH2+ZHsMqogNu1u8bKr3T6JcuGFoqVLs/jToRxwSuMSPlTNwCzEh91
	0IlNeIzSPhNb9cbVKOKK5gCul31OSjZB9cUvl0xJqo71anGL+xoqkRkYzPrtfdQRgDE7ep7bj4x
	KvAOWGccJXzPYt1WFPMV6gRGgklM2HeYH+3jiY4SlgdiRK+6XyT98Nm3SKrwRlnjZzSX4Z/YuVH
	gF8DEJVhs0Tht1973CxmsyyMds1gMKwbazKr/W0Skh26LLMUxBHqhmda3gdUduIT2c1hABCamRD
	Nmqn3PIUZ8l/naqSZ0quvfAu+I2fiwhsjO8A2tcD6veqFSTMm63tqURRYrcEB2jAQdUg6K6CW8P
	4ZRVbVBb451YH5zssKeUpKTw78Ci++/Hkn3KjnCYo7EC0ZfseK3VeAQdMl5qk1mPQoHhhmuycsx
	Lmu+ZdLL9NbkGbkcV52H+Dv8ifGh1RR9hxafrgUGVOQecEe3nC+NyHgojFlp/VaoOA==
X-Received: by 2002:a05:600c:4691:b0:4bb:5e8c:13bc with SMTP id 5b1f17b1804b1-4bb5e8c13e4mr203665575e9.7.1794843187061;
        Mon, 16 Nov 2026 07:33:07 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6889:eb24:5e57:83b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae5299sm315407665e9.11.2026.11.16.07.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:33:06 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/2] Enable Renesas RZ/G3L CANFD
Date: Mon, 16 Nov 2026 15:33:04 +0000
Message-Id: <20261116-canfd_rzg3l-v2-0-89e06c46f40b@bp.renesas.com>
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
X-B4-Tracking: v=1; b=H4sIADAi+2oC/23MSwrCMBSF4a2UOzYliZqiI/chRfK4aQOalFwJa
 snejR07/A+cbwXCHJDg3K2QsQQKKbaQuw7srOOELLjWILlUQgjFrI7e3fJn2t+Z515ZrQ5aOw/
 tsWT04bVp17H1HOiZ8nvDi/yt/50iGWd8MEc04sQH7y5m6TNGJE29TQ8Ya61f0ETkUqsAAAA=
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794843186; l=1116;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=1E9jtcPKoXKYQWT8BUmqPghEaqnxjRl4UbnqpWuP5OQ=;
 b=rCN7b4yqOJoXWhXuPRSc93S6eqjMojRN6j1QL7sMvLhQtRLpIOzJGCU9jJnyzGmS2UMqPTJV0
 sK1sIeFfukYAI6m0hjVG6qMxoxNfdWeFi8wuaVhjmvWsAPBCOKCmiaB
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

This patch series enables CANFD channels{0,1} on RZ/G3L SMARC EVK.

This patch series depend upon [1]
[1] https://lore.kernel.org/all/20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com/

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Dropped fallback compatible based on bindings.
 * Retained the tag as the change is trivial.
 * Reverted the order of the SW_DPI_EN and SW_SD2_EN, to match the
   signal flow order.
 * Added missing check for !SW_DPI_EN in standby-gpios.
- Link v1: https://lore.kernel.org/all/20260921131951.187981-1-biju.das.jz@bp.renesas.com

---
Biju Das (2):
      arm64: dts: renesas: r9a08g046: Add CANFD node
      arm64: dts: renesas: r9a08g046l48-smarc: Enable CANFD

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         | 43 +++++++++++++++++++-
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 46 ++++++++++++++++++++++
 2 files changed, 88 insertions(+), 1 deletion(-)
---
base-commit: 52f785639824bf2386d20ad8735f9792b81d818f
change-id: 20261116-canfd_rzg3l-f0f6ca64aadf

Best regards,
-- 
Biju Das <biju.das.jz@bp.renesas.com>

