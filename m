Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4083483BEA
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787843309; cv=none; b=TiB2oX9mCIcFD6qcr0rVLp7SiFPs8ZmkQVolsNzW4VJRQOZakh0Zdt+yp0WXFGv+Dcuue8L71bZIp+tSr0dZ5P5xl3wTLwwA8PIrKRYv+Pfsc6sS07Z/5KauQT/WQsSxGd5bqvhnK9gt1BbtcOpIcQ4TkqQXAzXcBbhHMMVZghI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787843309; c=relaxed/simple;
	bh=gAKJTXCOZU+YKYQWwwMx7YWAfaH/SysH0hVcYfn9dVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ucQbxzogC+SzrRLlMHdRBCHOz6d0tiL1ZWABQWzaZsAv6zE7TgSA6GFDDJL96DtQphax311WI89/bE1cBYs4wZHTS4kYTcs6gkjFesh/ZHZXuyZ/fsgipCeZbZ+hfeccLT+BgtFHHT5b2hTjUG556AfjivFDYMUbT4QOKYzokuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/V//6gY; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/V//6gY"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so1390483f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787843306; x=1788448106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fag10csC5nrC5HLW7gpXLgEuW1jB3xGm4i/F+3ymn7w=;
        b=m/V//6gYlcZsMYqjbfxYsCYZPIOy0vkltouZ0pbQu+jtRgCTOKCC2W4imslZ47gqq+
         fuVusIi85099F3yV6rJ6BDO9OPy3t+8l4tDsCA4TzNV0Y+qM8LMxTepaETK30g+U4Hy+
         hOEUB7shenQ10cD1OQBgzXPyiS4K1hZKMqyjbLtoU9wSnOznp4/QA3H8kL5d5Wt8ZNZK
         v1QxXVvz3i1us6+0DT8IVjjUEp5IlHhjim5tVM+zQttouR3GtT+jWPfAx3G/KaykS+LQ
         R6eZxJi122RymgAASd7z2RjM2QRA1x8spzJkI2b6I8J2F0gFXZFmVFoBsU4m5PlW1RSD
         0cRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787843306; x=1788448106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fag10csC5nrC5HLW7gpXLgEuW1jB3xGm4i/F+3ymn7w=;
        b=hinmhA6PK3sqL/1FimyptlxylBu+jkYetW1zH/I+D5KIrF0m+jC+CnlCJVbz8zuQ88
         WAHoayrQP0TtWtn6LNxhw0ke67CUyK62t/8Rw8JUDzak3uBwOqc/vywhjkoVKUILFcdA
         qiTD3ue41w0oOgA7jDB5hsh2jGIFLUKLtGcwuAlPyNoX9t7xkBLCnsmbj1J377lYSqPI
         GlWtAamPjrlQ5qDFnOgxajUPYqrFksUBylhTeGm1eR9QqBdpA1MJPfmgwZquKpfwvM8p
         aSKC5IVmVodwhte3WJiRngdOAzxsmT1INHNayy4m5thcuQzUeWrEF8y8tOBFnwOupWW4
         bcnQ==
X-Forwarded-Encrypted: i=1; AHgh+RobCzUSlCGgOKdONtOne5SoM5TLuJfd3WLH4WFGupzMXN1YuJW+FDWaQ4cwG0i+L5utNxgGZWGfgo6W4+M=@vger.kernel.org
X-Gm-Message-State: AFuF++nGdOZOoG3iA2Sxo1jle1iB3emiB31WuXm72UVkc93zhLMnWmID
	t6vbVQ88dxVo5LMprbKwWZ7Hxk74Gz5i3kUirb1mzw7l5wVIlzOK3aZG
X-Gm-Gg: AR+sD12Qp3GC6Gl+gUduwTgPdE1w69PWaUZR758JJEnPytw6UKkNs4RzL5Dh4rDBpPh
	qX4UPwclIbtYAVDCSB2qRuU9Y5ywl97QW5B1s3vLe6CAkgC+vt9/9BOchSuNYXUhAJjL97fXQbv
	COQFOxBhJb9ZpCc1jdqkqfz1EoYo0Nu4qek8lBthTLmu6Hwdgbqu9zDDmbDaSjFonxoEdT7ZuC1
	b6szBGqL6ArOtICL0P9IklbJ3vwciyz4IgLArCl0KTXW40klhbxg3rL7P01EwjEAnQPRkEShIUf
	NQm0uB5IS7gbwkoIxrECQx65QpbBDJSt9sSQu28YZQuKX52P7JNr2UEEpD04sIJnXbsWgBhKAcA
	8cjlroNbHDJ02v1opb+o1+624i7u2RvqoFuZqMMBHOrWI8X4K8Mly8l2RQYO2Obiu4g4ryMEbL7
	iKW3cwBwLLjJjDyMKmDGNo20QHWrAIUr9n5aNwgBAY3nqEJZLjsaMCe+poJqylSGNq0b64h1FZY
	wU0yQStT60uNdM=
X-Received: by 2002:a05:6000:26c4:b0:47f:7759:89df with SMTP id ffacd0b85a97d-482e26bf25amr18874741f8f.3.1787843306015;
        Thu, 27 Aug 2026 08:08:26 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([165.85.187.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e279eb11sm10247151f8f.8.2026.08.27.08.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 08:08:25 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/2] Introduce basic support for MR-NAVQ95
Date: Thu, 27 Aug 2026 08:06:55 -0700
Message-ID: <20260827150657.1657-1-laurentiumihalcea111@gmail.com>
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
 arch/arm64/boot/dts/freescale/imx95-navq.dts  | 237 ++++++++++++++++++
 3 files changed, 239 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-navq.dts

-- 
2.53.0

