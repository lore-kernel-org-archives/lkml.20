Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571394;
	b=pAMhfXDuUMDs6jrf6U5J40iMMhl3jxYgxXjxMKW3wNd/LWCPmXpmjmsVdPTAqT0BTO7Y
	 sh1EkSMoJqd+x3Ym9d0riZeO2Y4CTgwQpjlEbHdxrwOUmrLN0UlDrsiewbbF2Z+vIuNb/
	 HjJvqfAKQYDJ3h85hpfhScH3waPGgqxvXuLTK+dTMhDub2wduLhqLvfsG8cpmzz7ngZPd
	 wIApwWiEeeFZEXoyJAWD3z8t30kZje3OPhhrHsqPdKe9oFJkWGF6FZQ79ScxHCFDi315m
	 28AbA2xtJkg0d1c1UvnAtpIbeSq1c0sq9iOkZaMWN4tmrd6RZER80altHUZTHGlJ6FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571394;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Qn7fQ/WuImtrNrwAytucTquNZwzb54Hg+kTqL7gmoxA=;
	b=2d2zIOMwiPM50Igi98P1nclxoffbJS7Zb2hGy/4LxXJWBdURVZ4LelIZycnKoYtzDvTC
	 r77WhL10rWZf/zpjPBClytqO0UvZ995XpPLdFioIDzvJYR9VfmewnTtaIGVm4gyDnL7/G
	 fsj5cUIIKLovLWzAtjbwPZER5MChT0ZnflDsf1yqqZYXu3/VltLWTjoYqhhgO4RU/Vz5u
	 jjebjCk+jT4+b0pVxlsCHeDr6EpsyLsHIkIeV1ZJ9UmhhjjEtEidR+LZGKa/8GTYEtB4i
	 0QTTjexaJaz1m/VArM/A73We9pGhFPUJaSqvms3YImIGDma3bn8oM1MC/RQGbILu7/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=CzSGUltm;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E46606E52D;
	Sun,  1 Nov 2026 22:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12E46606E52D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=CzSGUltm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Qn7fQ/WuImtrNrwAytucTquNZwzb54Hg+kTqL7gmoxA=; b=CzSGUltm5eVCpsFPFpmu2teIl3
	pCCMuFhCNrt+jIs3tl/m6p6bsKexs5jU+KZXxFoHk+VMixs2F7PSs7ERSo0OdxI6mmcBihNNpszOA
	eEnDAr+4TQQq6moGFkH+fiowTYy9fClKD5apbLYn1gAqKSei+2Nl4wXJn85Fsfeq8fJ34XQX//4L+
	78dfJKDe9z03KVOuvYbaiolk9YeRGKInlvAjzyxnRPrk3LwYZoV00c8kzdXRg9GjohkCpUOea+OVu
	gYAkoGEh9HzwVemNyAhhLVDq5U7WbD5onv1uAWhqz/l7t+AQaZwVnC4gad6Ctg/KGvU6vAVl3qxJY
	HfyBLkHA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	Leonard Lausen <leonard@lausen.nl>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: Enable Wi-Fi on the NanoPi M5
Date: Sun,  1 Nov 2026 23:16:11 +0100
Message-ID: <179357136492.4108155.17814114343295841881.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026070821.324094-1-leonard@lausen.nl>
References: <20261026070821.324094-1-leonard@lausen.nl>
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
Content-Transfer-Encoding: 8bit


On Mon, 26 Oct 2026 07:06:50 +0000, Leonard Lausen wrote:
> The NanoPi M5 has an M.2 E-key slot for SDIO Wi-Fi modules such as the
> RTL8822CS-based AC200. The SDIO controller is disabled and the module's
> power sequence is not described, preventing the card from enumerating.
> 
> Enable the controller in four-bit SDR104 mode and connect its 3.3 V card
> and 1.8 V I/O supplies. Describe the active-low reset on GPIO1_C2, the
> 200 ms power-on delay used by the vendor device tree, and the external
> 32.768 kHz clock from the HYM8563 RTC. Keep the card powered during
> suspend as required by the rtw88 SDIO driver.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable Wi-Fi on the NanoPi M5
      commit: 2712e8fa4d1108b33ce3a49c9459d9b88489f639

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
