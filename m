Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793597634;
	b=1l3nCu8M/wlh/Bt54EQLcvRNVoDnJVjVS9npc22uEokwd2jFQnptTtPOjByL46ctpxyO
	 pfkkQWyh348QILYcWSlbd5G2hXshbRkU0p0gW4CbnHPQz+poefvFg0yXz5xUD0083Uk6n
	 hvnttcGtg9fZV5EnOWx+mAw7+mn12ccbgYtjKXL9JuQy3bDV3YZKW3PX9/T6cinpz8w1H
	 aSxMMDFDMQbqZ4s64PUrte7XwxcTPpyPLwES5nhElX8FILB8078i9f9w/Smuvm9Lp9j7u
	 hk85Bv1ZaKKwZleQe6CfAYyOzllQ3Pkfz/+JwiNnyGBr1bBg4R1B88k45DnwqTWWhmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793597634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=I5XmwGd7P9E6+oiwB7TsngJgYsa5mbeAvM601lSlbzM=;
	b=sHb4XxQjdpnnR6HcHdGBttwv3SeYBtuALMBcTNvXoaZwiFYr3QYuPo80OvXhGuQT0r6t
	 1kkXpeZwxnrvuh9tFKbgLe/OrHly/rl+4u0GUM2sbA9/j9YIQyi5m4b1bw3zWPn7vE7WQ
	 fAZcs2c8vmU3spYTvMC6ZQ4nvNFNr3+Lcdt/3NSXyeH09UnqIng0WhKo2wooFKnTSrA/H
	 qtOV6zGtFG/znsfVznCXBE+RTruW4SCIFf4x8PtmdLrJSG72bSQsan2i3DMU3pfp3ToIx
	 aC4kZCi8LAo+XY5oTvlmTPV+zmkXnSFaJvBf/LYxYzpYYAQ8TQMjOiE8igfH9xKjqKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gC5JrwAB;
	arc=none smtp.remote-ip=74.125.231.132
Received: from mail-oo2-f4.google.com (mail-oo2-f4.google.com [74.125.231.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0D4606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 05:33:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE0D4606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gC5JrwAB
Received: by mail-oo2-f4.google.com with SMTP id 006d021491bc7-70073621339so1569635eaf.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 21:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793597633; x=1794202433; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=I5XmwGd7P9E6+oiwB7TsngJgYsa5mbeAvM601lSlbzM=;
        b=gC5JrwABTEgrHUcKQSph9CPY+fkkrfymHcqg5dnBovsdySJf8Wf+t6gXIID7ZwVMab
         213xfh/PT/H66fsEzJs1qZz8BO28sPN9i/7dzLrNaDasGb73Pfe9sY4mCLcBE2Q5/xY2
         +3huQcp9h6O+kpGD1diro5UffKGnF66W4HpE/HnNyn8RpYD2lrVpnBgx/x/jxNoVdt9/
         GUbbYI5aNRvraCEAk1+3vNDT4SxB0cswUwX21ylxdL5Ib6q1ghVrbXVR88QJL3G7Ynpf
         Zk5FahiBxEfSPNRKuleq/wSdzTZdxxHloyAYrm9uOCMA3qtfdx4SxgYk7NzrunyCe6bv
         5t2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793597633; x=1794202433;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I5XmwGd7P9E6+oiwB7TsngJgYsa5mbeAvM601lSlbzM=;
        b=qb0gaS8Vfc6zPcnecKPMdi+M39iu6AzaECBl6l6PO6he0fBPHBEQu93F7Y7J273Ttp
         C0V6zzORRT8j/EHDMknIg1RgB6O5ESyuUn9Ecot8qeoTK4Jpb5pS8Q73UB3L/EPpLQhm
         2BFTDgr7CsfmZgzFUgIR+Fd6swvIeIihtCeQAHcWaswNGRcBHOPqLWB83ovwYuQ2e/5L
         vWdb5Kir+3OqZoFWNKf94rrP3i0FbNKAGp3+Y/98t8+8ee+ANxsJWWF+Y70W9qfyZCx1
         PWXGJkfoo8vbX52fzhAt/J/ttzjEvOXFUDydElM2kNEbPzM0fsBRJj9869kd11ZjCGim
         4xOA==
X-Forwarded-Encrypted: i=1; AKwUvBzEQ+MSb8DG7KdM7hnfA5ZyicKticaQVazA/hBixOnN23W26E0wZBqxZEtEMzXn1qybqpWFyUWI6z7CRPQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2V2kZoHzAbX1Zz7iDFWSROzPCqotibJQMx/Sqgwltg7ts9oYD
	K8bwsBMWqYHHTNBS+ahBsJw5xYwKJga8f9+23CUfw0uT6SWyU+1upEW4
X-Gm-Gg: AYBFou15qhbcECgl8OswrGOzFaRZFYKtfmrJwdOg1B77s9FfGAAcbsQpnOHQL0oDtZ4
	PzW6OQu2LparRQLgX2j7lqLXnQ5+MAk4guKbpjN0HUwEnhyQQwz6j3BqKaMdQ0/EAKBzly4N0e+
	KU48ifXq54cJFrhIDcnImmcv18mZzn5NGhv0HIcXcETcEqWJsOCiiRLiwor1nT+VQ62qJV+AbKd
	CNr09shyrWfwYh9NNu2CiAbe0PZH3R7bGOeJCvXW41NNrlmzEgqEtqXIcSUUKn2xf6LmDR5oUg5
	gBNIXkdye8njMxQv6+OwiAn3MZbYR1S8mABmc9YyHPHEa3IUpcMGbMaiErP4e38nl2N0s9OL+Tc
	pV2jNUiNYTj6T5SBmOKB4y3oONh7BhTyyYfD/tv6KSKy88lo2olBBCxZLlndd9beldiWD1UZiAB
	rbeaVCiVSCq+ah2nrdtEl5crLqzh5Zd7jv7s0MIO3Vhz51mbSmCKxGbwuQYI4iPS2VFJunzSP0X
	Qm5Q39X0vjjf+N3yygGJti3hqKHIVpatov07bu1r/AQM/E4hx3AwOs9r6/RC+vZSgP+phYpRwZC
	jfIMUyWU3VmX/8PNeVLXxQXQ
X-Received: by 2002:a05:6820:208c:b0:6f8:2346:cd78 with SMTP id 006d021491bc7-714f24fb531mr4934585eaf.5.1793597632682;
        Sun, 01 Nov 2026 21:33:52 -0800 (PST)
Received: from [192.168.18.164] ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2a818b9sm8321164eaf.1.2026.11.01.21.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 21:33:51 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH 0/2] rtc: mt6397: provide the RTC's 32 kHz output as a
 clock
Date: Sun, 01 Nov 2026 23:33:45 -0600
Message-Id: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-0-9758f38d7053@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3NUQrCMAwA0KuUfC/QNqNqryJ+dDWbQVZH2oo4d
 nfBd4G3Q2UVrhDNDspvqfIqEI0bDORHKguj3CEa8NYHZ/2IOmlnrJ2/2LfalNMqZcG1BbqcUFt
 G8k+0yWUX5kB0JhgMbMqzfP7P9XYcPwxqctd3AAAA
X-Change-ID: 20261024-rbrue-suez-upstreaming-mt6397-rtc-32k-0a1c16f63383
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793597629; l=2043;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=+AH9smEBqnGEd7Be3eQjkLdg1eIcwhdAuP4jWupgQ64=;
 b=eov85h6Nzm1K0qbn0yx99tHtOauCX37OjFlOU3aSi5SRuzvUuLcnssjUB6YtD+fdgUHfOIXME
 oIzVcU1KxpLA/SNkK/Wou5Q7v2zxcnGEVyrhCx3FDnngfTHaWMF3e7u
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The MT6397 RTC drives a 32 kHz clock out of the PMIC, which boards use as
the sleep clock of a Wi-Fi/Bluetooth combo chip. RTC_CON.F32KOB gates it,
and mainline never touches that bit, so the chip only works if the
bootloader happened to turn the output on.

On the Amazon Fire HD 10 (2017), which can boot through U-Boot instead of
the vendor's LK, nothing sets it in the former - the bit is set at every
boot, and the MT6630 combo chip's Wi-Fi and Bluetooth never come up.
Letting the RTC provide the output as a clock lets the chip's
mmc-pwrseq-simple enable it. With the clock wired up both came up on that
board in two boots out of two, and in none of three without it.

The driver registers the clock only when the RTC node has #clock-cells,
so no existing board changes. The MT6323 shares the MT6397's driver data
and gets it too; every MediaTek PMIC RTC whose registers I could read has
F32KOB at bit 5 of RTC_CON, but for the MT6323 that is inferred from the
shared driver data rather than read from a datasheet.

Both patches apply on top of the RTC nvmem layout pair, new in
v7.4-rc1. That pair went through both rtc and mfd, so I'd suggest these
two go through rtc only, with Lee's ack on patch 1, if that works for
everyone.

The board's devicetree that uses the clock is not upstream yet and follows
separately.

This series was developed with the help of an LLM.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Ryan Brue (2):
      dt-bindings: mfd: mediatek: mt6397: describe the RTC's 32 kHz output
      rtc: mt6397: provide the 32 kHz output as a clock

 .../devicetree/bindings/mfd/mediatek,mt6397.yaml   |  6 ++
 drivers/rtc/rtc-mt6397.c                           | 85 ++++++++++++++++++++++
 include/linux/mfd/mt6397/rtc.h                     |  6 ++
 3 files changed, 97 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261024-rbrue-suez-upstreaming-mt6397-rtc-32k-0a1c16f63383

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>

