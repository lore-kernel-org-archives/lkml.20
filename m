Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571395;
	b=bHR+e27z50ZmkKxmOG1NERUmYkSsENx6+CPLrIuY6ZPw/40JYHdqFQN9kGyUlnCGnPKp
	 uayP19Qz/UnmewtvJT6UqoWp0bcCmivN/tmHpGuYQzkU4n5ftq0C4KT2Qg+E6o42PNG9s
	 aB/zezGlAxGtKaeF49/YSsCxKXkdFzlBwbaxdVgoIJc3GiT/e6nrV/BFg+J/fgv685NEA
	 Va8Q2N4eGD/aQ+2tYfxho/sErHumoUMgZvkt842FA4ApLVCDsKfEYo+A11TnLWKCjmFZt
	 zUk0ncX/zgrOhGdqdXKM+wcEhvRCsmsbviKH52aIqsDdmU/O/9D1Vxm0DDEb2+DhVcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571395;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=jNvebCA3UqtmaXBwksfo8idH4tYB1vvNqeOjeRCYRLI=;
	b=JC8CtMOGvePwVFbQEY59FKq66NsaKZsG+NCigtQWPJvoco37+/xdC/RU5hdcNEhzAxkH
	 Y2GFddNHbhqKHbOZlwr+WN8WykQh0hHKwECgXwA6PB0pg7TGtgTyTwtHXgaMXboQVhAKp
	 ZVf69C/hqPvfas0Db0RhbrSh0paS5xPyZTUfT6UI3kOxIpw1WLIpcUYBxk9JauR3ka4hF
	 lS8ulgcc0iDohohWh3h+lwWtNBJPPzspmYlVg1Y8pnPOEPNb1WLD48t8oP6FSw+5eiDK8
	 HZ3S80CZJfTMKxuo0RWBm5jXsZH9QVKe4phgLH36E7yrDlLJ4UGlr2UYzHSFbCtig1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=uEV+UsRF;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3C5606E530;
	Sun,  1 Nov 2026 22:16:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A3C5606E530
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=uEV+UsRF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=jNvebCA3UqtmaXBwksfo8idH4tYB1vvNqeOjeRCYRLI=; b=uEV+UsRFNWzPJQZRmavo5i76In
	igSrs0bex1SvT62OPJ1IMUCWBWhTpjvsA5S7TQT88E6RhmTnAS0uY/x/8/j5wUDeZZqEUChNaPuCs
	P0CyF4WStwddXCr2k56WyZqINmDrJnzdekvMMJAFAVWwhH06V1gYy2ppolsZ80LA+RdjfVsZw5KWh
	BW3WtwCM2JcxdYqTC4TJp6KWyz8TUDLWtKpNOV14EqNglguptmAzvb50mFjlKZn41siQwx9DtqZj5
	ogF650wsbfNJR+A9GfCCY34iQXdU5Xli7M6Y0UeS26B3eIo9ycbb+ypfrCBnCMd6uNMWW85PXMWsi
	yCW3HNpg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Miguel Jesus Seron Gonzalez <info@gluon.es>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dongjin Kim <tobetter@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: odroid-m1: keep vcc3v3_pcie enabled from boot
Date: Sun,  1 Nov 2026 23:16:09 +0100
Message-ID: <179357136501.4108155.9270952989405440142.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019132458.855-1-info@gluon.es>
References: <20261019132458.855-1-info@gluon.es>
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


On Mon, 19 Oct 2026 15:24:58 +0200, Miguel Jesus Seron Gonzalez wrote:
> The 3.3V supply of the M.2 slot is a GPIO-controlled fixed regulator
> without regulator-boot-on. When the regulator driver probes, it
> requests the enable GPIO as low, cutting power to an NVMe drive that
> the bootloader has already powered up and used. When the PCIe
> controller is built in, it probes a few milliseconds later and
> re-enables the supply. The drive therefore sees a brief power glitch
> without enough time to fully discharge.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: odroid-m1: keep vcc3v3_pcie enabled from boot
      commit: ff9ff0e5e40dde8e7d769c86d8314b37b323cac7

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
