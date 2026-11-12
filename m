Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794505899;
	b=jC6kONnMOhjeKvhbrehq7rX82pn5sBM0xDJZi4gb8gQc1nzwR1HsTPYUjkvHcM0cvUGr
	 gEYDZkWRKgD+GSclJZPh7iU5LmydNvjfCbOReVAHZSjWN1o28Fig/7GdEIGYEGDLVE2dF
	 ffIhr/HYUhlkFVgZGKDryWuTrCn0vW9CW+noPBt9rh9tYn+scLzb2v7ZiunkUHftAtbx5
	 RKIQai7q66eLqTOnfUhQ9Mij1sQjNfKSN2AdqVd395roHmcgSdh561bPRehSVDRh/QBr9
	 pPClLWU3DNUVTVYHJbxiIZ0ljaNHXf7HzGh16pa0EX+O1lBicIJFgX82KFEMXj9XRoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794505899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=xTM3U6ionLwQwBCZKrKDTUJU3GHvWNey1cmCtm96z1Q=;
	b=wbuSwmXrYadJZ+eZS7jpYwxXog+r/sBxvlqA5yrnJRvlfjLg5+bcm9Shh0QqManzK011
	 jbpHK6HDD0FGcjT2ulK/xT40j6VQ7xO52t3uwKY3KgfWiWxcZtskiUaYuOOhmoNfQh6Hn
	 /YN2/pIRFcwEIHK41igZ6wg/yWOx7TVJ4LTAK1OmWru4NyjonPtabIpHNEEdkSfLhi2uN
	 EuhkNx0wZKeLWxajEOMrhCaBX+u+uBmGqXui3xXEPUj2e5iPcLsZKlalw0FVVGcPtWdco
	 hwbmpM+OiRJrVZNtvfuW+/tQVHCtZiKnr5csF2pMsAkzms6DP+4CLvhVqFHtEDPXm3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYGQnnHL;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715AD606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:51:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 715AD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYGQnnHL
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36d1b3b9974so11454eec.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794505898; x=1795110698; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xTM3U6ionLwQwBCZKrKDTUJU3GHvWNey1cmCtm96z1Q=;
        b=yYGQnnHLNjRjFwShlE2IOVRkXRmHyVnARUO+zC0acUnBWnv3O4iH2uz3OaXdDxBMxx
         Vfu3DADmmwaG0+a2PYRTZiA0cb6Hya5GgZ7PVno5tcog8X5KH8BZypFtYZGQUl0hMmsS
         L/MbTg5TgzSVEoj2S4hRL5SrGjcpiaBCPOP/G3w5P8ivQw7Dn896G0MSUEa8g8BXsqim
         kA5sCS7E0CixFpkXsIhQXmI8meqn6CCeMWD6QDVoZOsOqZuvlqkx6MWf+1NxWQw9Zs8T
         N/4CwmxiPvVIl5uDs7GHz1qZRlAxUq87ua0jOl7bHEmrg3EEwLiW610R5Rtqic17oR74
         YKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794505898; x=1795110698;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xTM3U6ionLwQwBCZKrKDTUJU3GHvWNey1cmCtm96z1Q=;
        b=mHwS4VC5z6W96gfCBzs8zlX/ptJp3zDWYmOQn3Hc9SCfmxwfFk68v2A4LFM5G84Lx7
         Q35qy5ahUuMWn5zx6E011Nkbqp/xpK7dhkeppMK9NbVzK6zRWUEsRH3y1bkaVScIOcBg
         di72ILwi+s7oN8p//zppyjPHjNJDw3a/iIP1LQ0C500Fok6Sldk20Bsos4xl1OUYBUhe
         YosInx1OjXis48m3htI0yWw+61kWUhfBpSl3conx9/EV7QR2ns+ONvqJLo6cZdVet/1U
         lU6MzmlW1aPoTQ/m62dc38zwRMLw1sbaXWBPGhYt8TGaJJoXD/uWnT5300s8gBFno9Qm
         4wmQ==
X-Forwarded-Encrypted: i=1; AL+hErFs8vxix3Ok5UbCeU0lF1cbTIWoByqLr+gjsR0mRrgaPCA/xt4ruvAAs0qic22BT0sga/3dj56KofraKpc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GAN8GkNhus+OCFtfbtWYx14/IyRG1FVj7RfkhoWlVD7tOxyMS
	ZM5WVQzNqoLgVKqdbKzoZc49oVx1i9xjfuUWBV0x1p9p4Z7TbyCSpbw0
X-Gm-Gg: AYBFou0YifmFMnjC83ZTGOYibmUa6zdXWPzZ2LaVykaar4Ucwybobs6zIhsipPzU+Bn
	2wrFVh5oEIyiYaaFo/z+j6EOulvkeaGAMQOFRI4G0fuJFk/BMcLmfjexYf9dzzHumFyCmk7DSup
	vXIRLrtc/TGu19NQGZ9zWQbwhmQFEKj/VNmkvFmLGfvyHV4FfkjcHCJXZB86yjR7/xU1fYtIYYX
	qrG1RSGkYzQ71SC/ig/aCmpD3Os1eo2Qy1RXU+1IH7Y9/e13PJ/TatFfMSye8dohD9Za2xgSYPP
	hvYOI+plBWzW7CJx/yctwkS6GHbmLojOBaGpCZMzWD0gD5GK4o+RN5eLX08UrgCcu7+K0Sv8isu
	/02YkOPPFmWuhlYnY7emwpAUrQgl/MAntDSjPWLY+Uipyh8FVWF/Cn27z3gml1+gF8L4zBi/Bd/
	cxLo0MnKab4iFSlr4PGndtZtroYokAmVcRJV5Zb/Oh6rirElvnHUs7MvSRS3mArybxRrSeeYt3E
	JFnL5r+HCSLMJSCPkPv/OtBt0/+jq1HH9CJiV8ZIjG8U1/oRga6h37wnpVgR+BDg+iaDfCZ6bQc
	678t1RUmIrWQ/m+VA89qOu+StVmVmtRu1y4TqA==
X-Received: by 2002:a05:693c:20cd:20b0:375:f846:5b3f with SMTP id 5a478bee46e88-3767fe8f34bmr9670635eec.0.1794505890231;
        Thu, 12 Nov 2026 09:51:30 -0800 (PST)
Received: from [192.168.1.4] ([2401:4900:881d:321d:eb39:71d3:15f6:5fe0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm237865eec.21.2026.11.12.09.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:51:29 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v3 0/3] dt-bindings: bus: omap-l3: Convert to DT schema
Date: Thu, 12 Nov 2026 23:21:20 +0530
Message-Id: <20261112-ti-l3-noc-v3-0-7281b1af8030@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02Nyw7CIBQFf6Vh7TU8rAFX/odxQS/QYmoxUImm6
 b9baoxdTnJmzkSSjd4mcqomEm32yYdhAbGrCHZ6aC14szDhlB8ZpRxGD72AISBwaRxqyZzBmiz
 7R7TOv9bW5frl9GxuFscSKIvOpzHE93qWWdn9umLTzQwYqMYwiRqFsOrc3rXv9xjupHQz/5uMq
 q3JgUJNlZUHWWvmxNac5/kDnnpZFe4AAAA=
X-Change-ID: 20261002-ti-l3-noc-28dfca81fdc5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Santosh Shilimkar <santosh.shilimkar@ti.com>, 
 Sricharan R <r.sricharan@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, linux-omap@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794505884; l=1687;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=TVUUWGiB0r3bg0BiSKSrtHKyzz1fTiSm8J5D5VjMdbM=;
 b=j4ViMz3Xe/DKIXBX0OiFHV3H4AaAeqciPcJf7/6rwiei4dIrMfFiPBGN9AWPQmSXK8+LRpZIJ
 JQUDgNALrsPAVoJ5IGNxcNGCp8KvA/0aNky4nELThs4Ck3/4Za96Jun
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

This series converts the TI OMAP L3 binding from text to DT schema.

The text binding grouped OMAP3 (SMX IP) and OMAP4+ (Arteris NoC IP)
together. split into two schemas because OMAP3 (SMX) and OMAP4+ (Arteris
NoC) are different hardware IPs.

- patch 1 adds a missing unit address to the ABB regulator node in the
  OMAP36xx devicetree to fix a validation warning. 
- patch 2 converts OMAP3 L3 SMX interconnect.
- patch 3 converts the OMAP4+ L3 NoC interconnect.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v3:
- Split bidning into two SMX and NOC variants.
- Fix reg maxItems to 2 for ti,dra7-l3-noc L3_MAIN_2 is a submodule of
  L3_MAIN_1.
- Link to v2: https://lore.kernel.org/r/20261109-ti-l3-noc-v2-0-509e8485a1f3@gmail.com

Changes in v2:
- Move binding to bindings/bus/
- Rebase to latest mainline rc
- Add unit address to regulator-abb-mpu node
- Link to v1: https://lore.kernel.org/r/20261003-ti-l3-noc-v1-1-9bd18cac33e9@gmail.com

---
Bhargav Joshi (3):
      ARM: dts: omap36xx: Add unit address to ABB regulator node
      dt-bindings: bus: ti,omap3-l3-smx: Convert to DT schema
      dt-bindings: bus: ti,omap-l3-noc: Convert to DT schema

 .../devicetree/bindings/arm/omap/l3-noc.txt        | 23 -------
 .../devicetree/bindings/bus/ti,omap-l3-noc.yaml    | 71 ++++++++++++++++++++++
 .../devicetree/bindings/bus/ti,omap3-l3-smx.yaml   | 68 +++++++++++++++++++++
 arch/arm/boot/dts/ti/omap/omap36xx.dtsi            |  2 +-
 4 files changed, 140 insertions(+), 24 deletions(-)
---
base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
change-id: 20261002-ti-l3-noc-28dfca81fdc5

Best regards,
-- 
Bhargav

