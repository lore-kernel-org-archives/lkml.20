Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778368;
	b=rwimspXF+7cdEKxcz0cdYhs0me9KujT/MTtx/A2PcmTWpOneXQF4SXBV1db6oweQA5Lg
	 oge5vnVVfyz5guRN83Es2/ge6LLkaTnxfgTgGMV7Iyz9xuAb8teutTUoZudYzHun27S8X
	 rEGWjn2JuVJtTv8EUnv5uv/ZtpsvgD/7kS9JUhFb8taHxe29bG+mkh6k246o/NyKqcQag
	 M90hBrpf5/JF9WxXuD3Sr6eEYyHfQWsP9jzjtCaIxOotMAUWPTvLZDgFyuTWa4pfggMgu
	 cmNaJqyPLBrhK0uz4p/d0xbq0+JwS0H1V3cljA6YhPqd/daQq57Pazi2iNdjegfoNlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qpKChd7cX2IKr3NLYeu19b4piYqsJmCK1pOKyiliy74=;
	b=T3gtFjeq/bdLLhsIJU70px9V0O6eNE3YfhDCz4C2K2TcXT2/8ZOqwG309SfFULatqeLD
	 aLhhKTXRqQFu0NGLC+dByrvaTDsvSnxgZfFdU0H537FK4EWc0933uB+My0g8r6z/GVWSa
	 CeEI7iKuVuzZlM9mrzDW0pw3F0JPhjH+DvLB/E9OqDK9VlO+5B1F3apZt2voYQaPK1SNw
	 4kRLbroc54SsTab/QMzHQl2RSwSYfl2YqBZt7e0QpPEh159Jpj4dGEXdsjIjp0RuPQbRU
	 Y1SKogV3NcLvkQpfvNqtfVkykNPho71NX1WBaYu8zg8DEisSqTbYIB66igzrcfq10Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FMPVSIPU;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE12606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:59:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CE12606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FMPVSIPU
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c5358fc28so973057f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792778366; x=1793383166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qpKChd7cX2IKr3NLYeu19b4piYqsJmCK1pOKyiliy74=;
        b=FMPVSIPUP4r2nJIpBzw+AnOH4syghw9n89Z8Gr3tcHyhYZgMPSW2wo/l9P2KmSJ6xE
         JWW0NRo8Cd/tIuttGp9/u6xE7Eg5agM3nbdUJg9/0sJnaA0r6MYoWRVrBBYtC4EG3Bny
         nhMSK4DUyGvJkJPZWKU+rkgxoGy5Wkh3FW1All8qDORLYNHrFMq+ixmvOR0XjB3fuzWg
         UGvy3wPcZdItGmCc9upmVxpWcNNdbPdThBM/QOQUbsq8JhbkUQhKlyqxhh0DbCL5IFu8
         OK3QcDAmweCwbP5xQOoi2yZwNAnRClPpbrAXkmHWqPOGmvQJVb/J9RVmF4KhqIqrCP/j
         meEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792778366; x=1793383166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpKChd7cX2IKr3NLYeu19b4piYqsJmCK1pOKyiliy74=;
        b=hUA30d5AT3+IOnjEnfLrSC0WC9vzWBgHoGla4xHO37bZbh+Gd59FDyewgL2Mql5ybi
         yWhw9/Wms2cmCcajUQ4+ODi/HvW1yiUbf8sdxMhqeAUxBIBoscClaBW7F8dUObGOemUr
         7N4w8F5j47x2Gr3PhFWHl24WcEwqxYw161wt1WLzqH8ZkPoeGEmWNGFuGmMfbjcIr3m7
         mVKpYiskUrHYjk7FuAi6A1kCpP/RfGVPuID/uZzsE0SOT5k1Tb9G7dj7kIKy75XnfUcw
         aoyTfN7+1TopoJzARCFiOo8ey6jbQzA0nlR8i5GyasxUrSvU1ZzxBA0LcrJpgd054J/j
         XHPg==
X-Forwarded-Encrypted: i=1; AKwUvBxmC2DPE1mTK+Y4E1QDg5jZU35wGDOIB3g5DAwR3YN9yPLipm6Wkf8WdnjPJ1U8cYtBLy9lxVL5Xk0wgGk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFWITkGL46sjGP7S+h1FdN5DEyTm1RSWNL+jMWgEm4YJe2Meze
	dlmvg5x1m+Rfu7tpUxdE7l2ob2mc/unvendZSAQ58P6rGHwkWPzhb3bb
X-Gm-Gg: AYBFou2jiorKrJc2NCL5ufB2lqjUqXHbejGBUhEI9TVK47C4ptYL0OF26h9pZxlahKs
	tj/MiI+QVIHx8HHiEew0+Hvhruo+NZu5ab5wmATA/A0EBJku9eoPMmdDV2mYWo2QKfi3KRfhUaV
	ZtDaX5ghff3WEbiAb7x6Koau0PXaObMD31d6hyL+/T4O17EkmR9CBNodd6sIHo03UqZ9TyWDmul
	opgGLlR47OH6yK5K9iMQrdG3rc8DmwoHrU/0E2R2tjO0DFjhKacoz66oYUJfiBrXXhxrr7DontU
	vuIuWZ1HqviX29lJPa+G1drEQ87pRKTfzHjPX+rknm1SJig73at675kSnrwbz9QGaEb6GPuOGOo
	byAIN1AAXfiEXv312dMzLd21RBwXevkghLdUbVEiHHiNbpWf5fdMa9ZqZ73TEPH51DEXgM9sHUf
	9eXWi0jyzFLGANiSKysxQv2rQUB87t9IBG1Z9zh7QawSb7LfheYXb4yl+oQzF8o23UpZWFS9euK
	6fRRjZ8oorImCGb3Hx01ekUQY6Rg9wSaIcj2dsxqO0P6JxzWCWoQUANxJzJAKtIjf/68jdVkYUL
	zOBXN0bYlue2xamgOXe0G1JjiR0F97oPeS0TYTZx2WnZDMPJuOl4w9xZRh2cyLhOrJy124SCd5a
	NhF0g07hCMvBQ8yVYYhcxedSN9ra5Gmxb3d/ibd6O+FUK
X-Received: by 2002:a05:6000:46c8:b0:488:8384:c382 with SMTP id ffacd0b85a97d-48e385a2ca8mr3518753f8f.49.1792778365736;
        Fri, 23 Oct 2026 10:59:25 -0700 (PDT)
Received: from iku.example.org (host86-133-9-17.range86-133.btcentralplus.com. [86.133.9.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d37ca2asm1342800f8f.8.2026.10.23.10.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:59:25 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/8] Add ADC driver support for RZ/V2H(P) and RZ/V2N SoCs
Date: Fri, 23 Oct 2026 18:59:11 +0100
Message-ID: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series aims to add ADC support for the RZ/V2H(P) and RZ/V2N
SoCs. The ADC IP on these SoCs is similar to the one found on the RZ/T2H
SoC but varies slightly in terms of available channels and configuration
options.

v2->v3:
- Added Ack from Conor for the DT binding patch
- Avoided splitting up the ndelay calculation into multiple lines
  in patch#2
- rzt2h_adc_pm_runtime_suspend() now checks the return value of
  reset_control_assert() and returns if non-zero. This is to
  avoid churn in future patch.
- In rzt2h_adc_write_scale() used multiplication() operation
  for comparison by dropping the div_u64_rem in patch #8

v1->v2:
- Dropped using DIV_ROUND_UP_ULL to DIV_ROUND_UP
- Included time64.h
- Returned -ENODATA in case device_get_match_data() returns NULL
- Renamed RZT2H_ADC_VREF_MV to RZT2H_ADC_VREF_mV
- Updated Kconfig description
- Included array_size.h
- Dropped unnecessary extra line in rzt2h_adc_write_scale

v2: https://lore.kernel.org/all/20261009184122.1378797-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
v1: https://lore.kernel.org/all/20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (8):
  dt-bindings: iio: adc: renesas,r9a09g077-adc: Add RZ/V2H(P) and RZ/V2N
    support
  iio: adc: rzt2h: Wait for the analog part to stop after a forced stop
  iio: adc: rzt2h: Add chip-specific configuration
  iio: adc: rzt2h: Add optional reset support
  iio: adc: rzt2h: Prepare for SoCs without sample state registers
  iio: adc: rzt2h: Prepare for SoCs with different ADC info
  iio: adc: rzt2h: Use scan type for ADC scale
  iio: adc: rzt2h: Add support for RZ/V2H(P) SoC

 .../iio/adc/renesas,r9a09g077-adc.yaml        |  38 +-
 drivers/iio/adc/Kconfig                       |  10 +-
 drivers/iio/adc/rzt2h_adc.c                   | 327 ++++++++++++++++--
 3 files changed, 346 insertions(+), 29 deletions(-)

-- 
2.55.0

