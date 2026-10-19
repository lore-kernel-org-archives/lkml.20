Received: from ocn-dfr-mts-121c2.ocn.ad.jp (ocn-dfr-mts-121c2.ocn.ad.jp [153.128.190.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D31A4B7A50
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=153.128.190.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415188; cv=none; b=eCHBAB3yLYmh22AxI+kE8aV2WttUFevVc1CsBmf8MCj0B/NcJQ3XFRIFRroM2Upd2XG6wzdjw6r0rak0J/FwnPwHv5Vm4zz/yjRCqiNViF3TPWvC/WmEMnj9XYEXh7vjt5j6pz6dsxvts/wb4skB5y7bSBer6ZDSTearWAXW6PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415188; c=relaxed/simple;
	bh=yTJK65vtCWoQGAdDX9KjcA0ppmoYfDkoKSIPicrNvA4=;
	h=From:To:Cc:Subject:Date:MIME-Version:Content-Type:In-Reply-To:
	 References:Message-Id; b=R9oFfAWuc8C1f2Wb8y6YON/a8TskBbIS6crD8fObZ0tFN/GYWGe51DjiY3yflDCqVVKyRZZ9Q5oh4SBmtrP5X2Lkx6k+vCUej/an36shsRPoZQbWcxRhts++pifS0xdP8bzHtfLA6WePQmeNzHy+k48HSghbjC4wUwPcPxlohUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=docomonet.jp; spf=pass smtp.mailfrom=docomonet.jp; dkim=pass (1024-bit key) header.d=docomonet.jp header.i=@docomonet.jp header.b=EEu0Ruv2; arc=none smtp.client-ip=153.128.190.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=docomonet.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=docomonet.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=docomonet.jp header.i=@docomonet.jp header.b="EEu0Ruv2"
Received: from ocn-ckd-mts-119c39.ocn.ad.jp (ocn-ckd-mts-119c39.ocn.ad.jp [122.28.130.104])
	by ocn-dfr-mts-121c2.ocn.ad.jp (Postfix) with ESMTP id 440D91C000206
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:59:08 +0900 (JST)
Received: from ocn-spm-mts-104c1.ocn.ad.jp (ocn-spm-mts-104c1.ocn.ad.jp [153.128.190.232])
	by ocn-ckd-mts-119c39.ocn.ad.jp (Postfix) with ESMTP id 42FCF340032D3;
	Mon, 19 Oct 2026 21:59:00 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=docomonet.jp;
	s=20240125; t=1792414740;
	bh=yTJK65vtCWoQGAdDX9KjcA0ppmoYfDkoKSIPicrNvA4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EEu0Ruv2yoOrQu9N3zcQHbQaBcjmQgV6wRhead7Mde7vWztBjumtNi063EO95Yfoq
	 YlgSwrDCAf1zp2dQPZonG1C6joXrrLrn4J5FC+byIg+0C37gkRG9Km72XISExQlfkb
	 58WD0a8EP9qw16xQAxiIspVer1ndV1xQGKN0E9H4=
Received: from ocn-vc-mts-109c1.ocn.ad.jp ([153.149.236.232])
 by ocn-spm-mts-104c1 with ngmta
 id bfbdb06f-18dfefb5a722c3ca; Mon, 19 Oct 2026 21:59:00 +0900
Received: from ocn-sdpx-mts-113c1.ocn.ad.jp ([153.128.117.211])
 by ocn-vc-mts-109c1 with ngmta
 id 283b07fa-18dfefb56136f94d; Mon, 19 Oct 2026 21:58:59 +0900
Received: from docomonet.jp (p3688129-ipoe.ipoe.ocn.ne.jp [153.238.101.128])
	by ocn-sdpx-mts-113c1.ocn.ad.jp (Postfix) with ESMTPA;
	Mon, 19 Oct 2026 21:58:58 +0900 (JST)
From: "Asai, Shigeaki" <y-asai.0816@docomonet.jp>
To: iav@iav.lv,
 Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] irqchip/meson-gpio: Allow the GPIO interrupts to wake the system
Date: Mon, 19 Oct 2026 21:58:58 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Mailer: HidemaruMail 7.42 (WinNT,A00)
In-Reply-To: <20261010-meson-gpio-wake-v2-1-790ecc6df792@iav.lv>
References: <20261010-meson-gpio-wake-v2-1-790ecc6df792@iav.lv>
Message-Id: <FDD5FC99B1D1792F3006A@docomonet.jp>


On 10/10/26 20:20, Igor Velkov via B4 Relay wrote:
> Set IRQCHIP_SKIP_SET_WAKE, like the other hierarchical irqchips with a
> GIC parent.

Tested on an ODROID-GO Ultra (S922X), where the RK818 and RK817 PMIC
interrupts come through this controller (GPIOAO_7 and GPIOAO_5).

With this patch, an alarm on the RK818 RTC woke the board from s2idle
4/4, and the power key (rk805-pwrkey on the RK817) 3/3. /proc/interrupts
counted each wakeup on the right interrupt. Without the patch, neither
of them woke the board from s2idle in my earlier tries.

Tested-by: Shigeaki Asai <y-asai.0816@docomonet.jp>

(This reply was written with the help of Claude.)
