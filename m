Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793047318;
	b=MIByVrywLjSwnqbACyP4dtZ5gXgtWZXAvOQ3y90aiYtORyhtqEOx02YHD49pG8s3BYM4
	 UuctJgUka9OHOTBusFupDEXCx1cGTPj5MLVDT2+QTStmoyCRuCs+5xv33jqLoSCREBnxJ
	 cHpgM82NvuVEG1BjETQYpSepzDQgG3tJNwTp8x8TP7CT/1Vy5ZKEonrMbfKKFSMF6VXW5
	 6/gwEh5C18vgoWkXEcdaZ9dE5/YY9WbQ+rrB9c1lbO/AtZ8x8iW6wLLJCY5KeTD/CrJj6
	 wTlYvA1PI41wnzb0cRIdIE9MD1EUbdtm/KVL29qLjgjKLkK0/gVAYmsSQO9M7rYrnVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793047318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ymrp+zu7NjxynEK1uU5h0LLjRFSPZ9qIz8OvSiooZcs=;
	b=q/2u8TV6saAmcaNVZK0XHp+XpjrQLDvlPrYQUn2Cnr/JxHa9ULdwmlzX4Wj2Gevc60As
	 e2AyK5xD21HOThtia5DXSTxAjy+tBc2KWlgNceqjamh0rSIKFj+4dhDyZH+XhnpdcuQWa
	 u4CQ9EiH01kl3lDlY81XfrW+8K6PK2POdafwjhNK+WMySdDOUbTwdbdo4ik73kxglm1V9
	 g8sGGs9skbKendyXVEwEGFmZMtOmKD789WHtluJVLVD1TmUb8kanruxBaDe+YxzbMmOA4
	 Y3s212bb9rncVK3Zfo1Xo5NCzHlULapwtSVEWR6XDG0xem62E3L3Vos07n/maqgiLig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="rEy7fXB/";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09390606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09390606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rEy7fXB/
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so16457945e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793047316; x=1793652116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ymrp+zu7NjxynEK1uU5h0LLjRFSPZ9qIz8OvSiooZcs=;
        b=rEy7fXB/Pt7EJazrVPKkjLwXrOu/w1nFxNHnJ2U7Js3gQz1L/ffv/VwagHdsoDu2nz
         RU0Zse0ypyI/6Lw0SSIDlDnC1QLx+DvpNAF+TN787T21BaHEiADAps2ytXz+7Twssvwp
         QzogKxAGxbURrUgk3EovGOhc6iWMjg9J84XrH1IG1hrMXDl3JuoThhYcdmLRCpHc4lGg
         GCL0/V7XT6phqtiDn6NOrOjeOIb3ClQAzYvCVIEoRdJnudekpnI5KFjS+FwHk7Mc5h4s
         sdVptOwAzqdq4RixHaD5DPRi+ML/lyl8gVyrWmmD/wDh4yKLLzMAYjsBImuQYpwMBDvE
         WoBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793047316; x=1793652116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ymrp+zu7NjxynEK1uU5h0LLjRFSPZ9qIz8OvSiooZcs=;
        b=pwVdCSqfGpnoSrGzAOPy/LbmpA+tfKYZD6YpnXa1GVdo7IEVDlPj85wgKm+kNGsQiE
         x1yR9GOQiTKQKjTnPfV/NNQiPG0fKaqLiuD9LERziZAALHz4I7Xy03wV49VenCEitEnr
         ppRsNwWRW/A7kFFckSn5xLTbhLwCTD0hldN/bGbQIjT0llF2+bNUBsivmk9dTV7tERb/
         S6ATvZ8OuKBZ+8a4rFYQ64X3WWn5+vNVgR81F/+r8ulrwyMZzgnVai3UwAIWbU5PiTEm
         3ZJ5mrFG79LAGprT4LTm3xwG6OTB7+diOtkCEA2ceupmAHHdJTpZY3RqDB0E72kMHxsv
         YPvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPkorYeJ7uIlgyKt0znoTZ3ImC+2bXPJ2V2q2/aTSbppZ8GTB8UDWMY4ITBqErgqzq55RkeQKP1ua8IOU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6DE8JRllVpUAClk3ONPAR0FmF6YycCqvR+SJjiDdI4HxjORl9
	2QI11XS+Q2/3S+87dKDMn9l8IdP1wzsp/QAthXU8stGlwtB0PzsMLmEa
X-Gm-Gg: AYBFou1m2PuQDLLdLBAqm6Pr9SAn91KcpnDLXwiVG6n+vW0bW78T/uMalc+wtqC/SQM
	RWC/HICClYavSEF4KAEybU4WPVmjfhDTxYPkSQZevlFEpbC2h/u+gOBdItSHjyzqG3HvPhSR7kS
	qTOAQwfEZJiDgFCglDc+MsZyqLB5akJ8CTtBmLhpie/7HUImjxor8gs9WZSUU4wHA4qTWIF6aw0
	i8/B0wkVWKPlPTa3rDq8xWWpDIrCsz1WK96oxHLzFXKuJedbq7pH064xHnBwzpk9pboMDXcgHz+
	9pDfOfkcG6IWE/CA+xi6p3ymY8OKdoAFxjM+AY5rNlUfdPwpukE0hRRrOERsYt34KxcW6OYE8KW
	1u/TJZZUxPbj0QUjg18/SKCmSYxcFbWimkdYjKnSLZq2Wlz5sora0ApPa19PMscQOcwaMsrFduZ
	tseNuhVmI6lRnbsTuJOuaRg3J2gi/V3ZFWl8KQk6HnDkE2BFdDLFAZg/IGi/1Yz0P1x3sLbC6+w
	BghLzSqrvqzyTkqSbwujZ2AsTIcDZuoMPDHMM0rpMC448X9d/Pi6RLPhjia5lr4I6NsqJVFeNHo
	i8szkRMesOY6WJZXYPSrPLxn+QzNO0R+GtQg4AhnOU6Jympkna+d2+0iww/DdPKTrWB8Bnjw3P+
	HuDwxI5bb+PRhYItbOQ0mX4g/ZbicXt28fFmGj63iQOqIihEh2wVnQu8g/IY5kJ3UZG4I+iq3dy
	B9NiB/
X-Received: by 2002:a05:600c:3b02:b0:4a2:180b:3153 with SMTP id 5b1f17b1804b1-4a35ac8e71emr150264255e9.14.1793047316294;
        Mon, 26 Oct 2026 13:41:56 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-8ce1-bbf6-5949-b0f3.ipv6.o2.cz. [2a00:1028:8388:a84e:8ce1:bbf6:5949:b0f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm19053152f8f.10.2026.10.26.13.41.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 13:41:55 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Henrik Grimler <henrik@grimler.se>
Subject: [PATCH v3 0/2] ARM: dts: samsung: Add support for Hardkernel ODROID-U2
Date: Mon, 26 Oct 2026 21:41:52 +0100
Message-ID: <20261026204154.26378-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
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

This series adds the Hardkernel ODROID-U2, the predecessor of the
ODROID-U3, based on the Samsung Exynos4412 Prime SoC.

As with other closely related boards, such as the ODROID-X2 and the
ODROID-X, the ODROID-U2 device tree includes the ODROID-U3 one and
describes only the differences: the micro-USB port is peripheral only,
as there is no VBUS supply switch, there is no expansion header with
SPI, and the 3.5 mm jack is headphone only, with an on-board digital
microphone instead.

Ethernet, microSD, USB peripheral mode, the LED, the fan cooling
device, headphone playback and recording from the digital microphone
were tested on an ODROID-U2 with v1 on Linux 6.12. With v2, everything
except audio was checked again on Linux 6.18; the DTB is the same as in
v1, except for the cs-gpios property of the disabled spi_1 node. The
eMMC was not tested, as no eMMC module was available. The DTB of v3 is
identical to v2.

Changes in v3:
- Fix the line wrapping of samsung,audio-widgets (Henrik)
- Add Reviewed-by from Henrik to the dts patch
- Link to v2: https://lore.kernel.org/all/20261022055208.17746-1-pepe.schlehofer@gmail.com/

Changes in v2:
- Include the ODROID-U3 device tree instead of duplicating it, which
  also resolves the style issues reported by Henrik
- Add Reviewed-by from Henrik to the dt-bindings patch
- Link to v1: https://lore.kernel.org/all/20261018124459.3026-1-pepe.schlehofer@gmail.com/

Josef Schlehofer (2):
  dt-bindings: arm: samsung: Add Hardkernel ODROID-U2
  ARM: dts: samsung: Add Hardkernel ODROID-U2

 .../bindings/arm/samsung/samsung-boards.yaml  |  1 +
 arch/arm/boot/dts/samsung/Makefile            |  1 +
 .../dts/samsung/exynos4412-odroid-common.dtsi |  6 +--
 .../boot/dts/samsung/exynos4412-odroidu2.dts  | 41 +++++++++++++++++++
 4 files changed, 46 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts


base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.54.0 (Apple Git-157)

