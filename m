Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792637935;
	b=SEczFwqtR1YHPoSU4lrnETfqSBHR2NQmE0qOaCz3txBlYqxO+ougwKXYKwnLBDGuhMWm
	 A+BmbCtKo9laujHmDfayNTRfH5xQKR/s3xADPj71bxkADAw+KZ4zuXYoMCfYZPofXCZs3
	 2i5WdpZTpLCaMZJDThY/UebCOCvgffxcuoWN1EG0xztWurwO8a+96gdilaUAaZ1lUqVlt
	 WRfd4b8/iVnnGOaA79ad+hMei/2ntDLKIBtIa5hUcB0iJ6WuZ0fJcRQwGsyY8yzRbxdNE
	 9DQ6mr1guuzPDgcBK7Zs15T9iU3TlR45tDXAjfUyi6xWEM1vVlzxYPWkfNgwm+G3qVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792637935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Jzi3iIHS+OZtD6vkcJ1pUU6mViKNGOUw7LaZHSgnXgo=;
	b=gdyw5Hwe9ygsN24D+I0KXEz3qFL8uaes7aZO+anscUkgSfo8M7d8r0yabm6aDBzR2hvb
	 /Rjhm+9fLT06uufcjgpdDAc1uSeQh4sHSKbRA5PVuVFakKdmHFiYvoZYrEy3ENSgIVgUo
	 i1VA9Q2G2i1XelDPWj3VunasQdqSdczUuGhGZDh3g/CUJjAa2GHgIABtodmWhjuUWqH3h
	 dGxqVcABYdc+IUiJ0HPFi1cCn91s699YUoLQnkCT8zIg4Xykgo3ePWEt4nLPtd7W2cbDn
	 QH+PeFeXW+0P6ZFO/CrXYBAADWUmzCLBER6yPznqU4pWUr15U+gOkfsHBOXTJ9Fy8fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NzXo8t5i;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F90606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1F90606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NzXo8t5i
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-368c26de2e0so74854eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792637934; x=1793242734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jzi3iIHS+OZtD6vkcJ1pUU6mViKNGOUw7LaZHSgnXgo=;
        b=NzXo8t5ifh/oZ0ZB0teQvxguRb3keDNkTtp6XqT98DcO6AtQbgbTBgpQ1+ErNm7+SZ
         I7AUT7AQ1QFQ3VAFPTJ6lgFcM4zeX5hQNyj31GW15Qfzt3haZpHZTu9PGdhhMN7wXv9K
         7sK0og42EyQhg9Cgi0bn+2KMXpdk0mu3LTTm4NzEdYl+Hc7Eanw3VUGGFh6ff6b+2xiV
         bWA2F47VUVecdJYAY5hn5F8u5Y8Dkbn484JHRHowCRa6CyEEICXt6QKf0KVS632XLmeR
         vR6Ka7cm3IFxLwP67Q/Bilu3VvG+FJ3au1XSrteJ5GTapwNzXJX6nJaxtvmorxNQJqxB
         YV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792637934; x=1793242734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jzi3iIHS+OZtD6vkcJ1pUU6mViKNGOUw7LaZHSgnXgo=;
        b=EvBwAYSbXoJJOdXEYpO8abWk5PbOWBOm4Y704b7mmJuJamGxpyLWGqlAF6q83VBVAt
         6TW/hYtdOAlbQQiHpign8rVsvqjSObwWxR40JTrjAUAPmmSmCK7BGs9ho2TNw73qVVvt
         w2Iur5r/9SJ3LjeAqkh3MltWeYUaDzcWjor8WdYdbunqXuyG1r9frMJKuYYehJPN8Ka0
         D3p0IQbwnlcudXFGnAn2JHgeC70iGkj7FuqUKMbgCH7Gec/w2uemfiAitWf93dC+zTBk
         IJEgqUzIOZ7+9U7i9U2CdqGEK8mN4vhSVh2KXWM6ALMtlEaf/BSfLj2IulmHN0a3rO+C
         4xlg==
X-Forwarded-Encrypted: i=1; AKwUvBxhI4nkr47uyVvDK56lSjEf2IGBA4ioStnw8opwV+GF4Gk/f/rKCgYPJGaHwfCXMy/zhcJ+DszKiruwep8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7KiaOl9HP99fIYs3DMt42FWDlO7SS+3bF4EiLF5mAQI4rHp5q
	iL9JUBUiUuhYL7mzBIXpo+jtojIDy+WLruNkcPC4BZrpYvbFyYMtV15l
X-Gm-Gg: AYBFou3vBReR2UPtnI1PvCooiSrldOQDEDTaPwSw/eSi5+biJBirptlvm+ZmtNRWTyG
	IsyUeVe2n5Hel6+mKEq5xQLk7GVMlDyZT/n1Vu/wiCp3B9aFjeI53yvLR++TFoosqG8Dx3n/xxp
	Yhf432i+FrC3jopqmfdYGDAjlTPgWt1GLpPjSL4zzrWixq9mSD2dGIO1atnEqCfGkzTKixIXfwe
	8R6qETJatVY+LNwRV3NwMTrxwG5jMZQ03PTXDaf+qIXlZKldO2ptF0siPpjrNE1U0slmhBqJ5cp
	x2BOUYOd2x3yrVwK7ASe3HJwLoST4Li7+tHYeBwOBN3pGzkxsVE2uwW/BsDRA4MIqdEeUaqvXBW
	knsmzZk5f7XiGB4Xm8zp1IAIBEYavO1GaGmCIzh5ANIezsW/a2AUC6LLyID2yc2qtZnigpbDIBp
	ICOuD/mpfZ0aCRgrie8+8m4NpxcKDN/QstYEuQy5NVrazza2CCyKdhFCs9QRTWwwlm/hHHqOcrx
	oeEdEsdhwRtLIvCfEzg5WdReiu5Gqh1EUpxrjQyNOSWlc83HixAKA==
X-Received: by 2002:a05:7022:ea59:b0:182:94d7:f76a with SMTP id a92af1059eb24-190a728a66dmr4591460c88.43.1792637933923;
        Wed, 21 Oct 2026 19:58:53 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm13029572eec.12.2026.10.21.19.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:58:53 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v11 0/3] arm64: dts: rockchip: add RK3568 XPCS nodes and enable SGMII on Photonicat
Date: Thu, 22 Oct 2026 10:58:41 +0800
Message-ID: <20261022025844.150320-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
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

This series adds the RK3568 XPCS and fixed-clock nodes, describes the
RGMII PHY LEDs on the Ariaboard Photonicat, and enables the SGMII LAN
port on the same board.

Changes since v10:

- The rockchip,sgmii-mac-sel property on combphy2 is no longer set in
  the Photonicat DTS. The property is tri-state: when absent, the
  driver leaves the routing unchanged. If the bootloader has already
  routed combphy2 SGMII to GMAC0, the link works without the explicit
  property. A follow-up will add it once the PHY binding lands in
  linux-next.

- The RGMII PHY LED configuration is now a separate patch (patch 2).

- The SGMII PHY LED configuration on mdio0 stays in the Photonicat
  patch (patch 3), since it belongs to the port being enabled.

Dependencies:
- XPCS binding and driver (rockchip,rk3568-xpcs, XPCS glue, dwmac-rk
  SGMII, pcs-handle binding): merged in net-next and present in
  linux-next.
  https://git.kernel.org/netdev/net-next/c/5e91edfb0e45

- PHY binding+driver (rockchip,sgmii-mac-sel): still in review on
  linux-phy. Not required for this version to compile or pass
  dtbs_check; only needed for the follow-up that sets the property
  explicitly.

- Generic PM domain (genpd) changes: runtime-only, not a DTS
  dependency.

The XPCS node is disabled by default and only enabled on boards that
use SGMII. The fixed-clock nodes are always present, as they are
static clock sources.

dtbs_check passes with the current linux-next, since the XPCS binding
is already merged.
---
Coia Prant (3):
  arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
  arm64: dts: rockchip: rk3568-photonicat: add RGMII PHY LEDs
  arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port

 .../boot/dts/rockchip/rk3568-photonicat.dts   | 68 ++++++++++++++++++-
 arch/arm64/boot/dts/rockchip/rk3568.dtsi      | 23 +++++++
 2 files changed, 89 insertions(+), 2 deletions(-)

-- 
2.47.3

