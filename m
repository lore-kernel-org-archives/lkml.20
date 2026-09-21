Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B17846AF10;
	Mon, 21 Sep 2026 10:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789986152; cv=none; b=tLUYkBioMNW1HaDHIqMYNNeQ4aFX+sF+yR7t1h0VX+Wd10yeE1eKHXBSabsuh/GUkegoXYlpnlXD/69OIGSUyY1CTgNGHK03U0aQNesVAgowAA2i+sWmmgxw9UNgp+cT6DgzkKRupWBABpnvDyakh8Q3rPqgrEBW5TFSEs/upY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789986152; c=relaxed/simple;
	bh=2zzAiPlCMlsKvglShMlQV7ph8zJ/L+voqaBQavdm2YA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HmchZPzAbWg0wpeK0dxJcrbDXXLf03nSr8ksnQCDn+0MSzA4y1i3ls/+C4PME4ttxsYC3eCHDOdFO3sJJN7Z+2goNIVrLIvzh4loZ/8Vrcb9PXSE9WDjCsBk/qLCrlUpQkBDY5SI54VGnu5so7QwcAMHOe9o/CAU5P6ta5Q28FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=N5UOaGRE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="N5UOaGRE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789986149;
	bh=2zzAiPlCMlsKvglShMlQV7ph8zJ/L+voqaBQavdm2YA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=N5UOaGREaW4M8VNJGJXTyB1093FUv/1VEXDlrgZLzoEyAGVWo24TyGZHS/XZtFQFU
	 gRk1eE9RNUUdRFYN5J4SA73arYUfTZzBToEMEfxo1VaGDxp/ZDovL0vGgxQtvPu9Gg
	 pKTO402q5C+vEarlWIj6hCArDorCe70Fw+/Bky+Wqwcac9V3hfGIB7bzPcLCj35nGH
	 erlWHSpco2lVv37v817Ls+imGrHt4Q8Hm8fQKH2yLsSolDp3a/cerTROPerTFfIiVG
	 LfvF9QbDz34U7glJP3cdRIJHD49adFlg1AJDRQHohtvagHuts/R4eJTB69vnYyE03Z
	 Sww6ZQvMmjEHQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2120817E03B6;
	Mon, 21 Sep 2026 12:22:29 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Frank Wunderlich <linux@fw-web.de>
Cc: Frank Wunderlich <frank-w@public-files.de>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260918143846.30458-1-linux@fw-web.de>
References: <20260918143846.30458-1-linux@fw-web.de>
Subject: Re: [PATCH 0/2] Add gpio labels for R4Pro
Message-Id: <178998614908.21581.16111635463377491991.b4-ty@b4>
Date: Mon, 21 Sep 2026 12:22:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

On Fri, 18 Sep 2026 16:38:41 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This Series adds line-names for i2c-gpio adapter and pcie hogs
> for easier debugging via /sys/kernel/debug/gpio.
> 
> Frank Wunderlich (2):
>   arm64: dts: mediatek: mt7988a-bpi-r4pro: add names for i2c-to-gpio
>     chip
>   arm64: dts: mediatek: mt7988a-bpi-r4pro: label gpio-hogs
> 
> [...]

Applied to v7.3-next/dts64, thanks!

[1/2] arm64: dts: mediatek: mt7988a-bpi-r4pro: add names for i2c-to-gpio chip
      commit: ee3f4a1785bd73a865a4aa5e1974c6079f96b2bc
[2/2] arm64: dts: mediatek: mt7988a-bpi-r4pro: label gpio-hogs
      commit: bf89276b2db391cbb25d1a0e898280fe85b16fb5

Cheers,
Angelo


