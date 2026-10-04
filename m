Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C4A47F78E;
	Sun,  4 Oct 2026 20:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791147125; cv=none; b=GGLqjT9gzSSuA/0hVgivLsvVLcFxbfAljrzdVVTOAZ55ODBC5pTtiPU641+QX5SmNM1B9/GDKe9q0ZBmTwC/l/5oQ0GC/f3qQFKEfzFRpi1E+HSZefOvYeJHpb0YtjX7nSxWqGCIkke6wxqcd0NHbnX55R1BYnVozf+0S1enKVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791147125; c=relaxed/simple;
	bh=lnrF64LhTotX4oB3FNyQc1r3TNmN3g8NL1+ZMXYK4Nk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A7nmvzPADo6zGTGGLyWmua4m3K2Maudh/bzaut+8tKawAj7w01gqasTuUQFZpTFSfbvLquW6IItx3lvS07VHWydyxyq0lcB+anSg8kUJum+pTLSZzYI0RI3QYHlgxlfOnd7Jx6BZFowyJsSLX2jF1oWRpgIFKvlBe6NgnzNL8N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=TEdwpFsV; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="TEdwpFsV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ELsLdn+4Qh6lp87H1c3X8IMTeSqRAZu1aVbHKFxqmEo=; b=TEdwpFsVofoNdgj2nTC5BT3t6t
	jGiu2l1l5uwUbftHZV6UPFekbeT6lbRy2hBiW4tlZCpQgEAe59VN3UmVacUl61uQZ8qxvwUwzTXnd
	97sHgIf9mrzWbygPYNfNnQIrvWac2Vs3Qv5Z2OENNv+y91gugNyKhKCqB0qm0At0ZMrLL+6J2bHkH
	3iuEG06pmd6oPcW4/lyCqG8uubKiRSiTsIm97lidPpXrOGzwsPki5Qudlbcof8uvbxxRVyygwwIG/
	JYYwNcgmr7toSsi9kaxVaPjQgVL9+OA51HLiO7DObKKFg3OGEu8N6Hjnmf+2PpB7ANcQa8SLYtipM
	maFWfOmw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Alex Bee <knaerzche@gmail.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	David Summers <beagleboard@davidjohnsummers.uk>,
	Detlev Casanova <detlev.casanova@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] arm(64): dts: rockchip: give HDMI sound cards SoC-specific names
Date: Sun,  4 Oct 2026 22:51:45 +0200
Message-ID: <179114705961.3265768.12585686056328294949.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260910-fix-rockchip-hdmi-audio-names-v2-0-1396a6168e20@collabora.com>
References: <20260910-fix-rockchip-hdmi-audio-names-v2-0-1396a6168e20@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 10 Sep 2026 09:34:42 -0400, Detlev Casanova wrote:
> Some Rockchip SoC that exposes HDMI audio through simple-audio-card
> currently expose a generic and inconsistent 'simple-audio-card,name':
> - HDMI on rk3066a, rk3288, rk3328, rk356x and rk3576
> - hdmi-sound on rk3399
> - hdmi[01] on rk3588
> 
> There is also rockchip,tinker-codec on rk3288.
> 
> [...]

Applied, thanks!

[1/8] ARM: dts: rockchip: Rename rk3066a HDMI audio card
      commit: 92e0587100ef8b2d103c7932750ad4237ef90e97
[2/8] ARM: dts: rockchip: Rename rk3288-miqi HDMI audio card
      commit: fbd2ec5bdb267034516f16d392cd52098ab5b7c1
[3/8] ARM: dts: rockchip: Rename rk3288-tinker HDMI audio card
      commit: e048e4da69a8362a7eaff26a10052f7d0020974f
[4/8] arm64: dts: rockchip: Rename rk3328 HDMI audio card
      commit: daa0db717771d43c25d98c2798fa6a7b0252deb7
[5/8] arm64: dts: rockchip: Rename rk3399 HDMI audio card
      commit: 946482033221ce5055721997888739cd57e3e5b2
[6/8] arm64: dts: rockchip: Rename rk3566 and rk3568 HDMI audio cards
      commit: 8043ed0f40fe2b49df1c2c25409ab6bd3f88e806
[7/8] arm64: dts: rockchip: Rename rk3576 HDMI audio card
      commit: d3d3b67505fa5f10af587a6fc8e6d4640010d52e
[8/8] arm64: dts: rockchip: Rename rk3588 HDMI audio cards
      commit: d1b7c3228041f4b3ad888abe6a31f6494279e979

I felt generous and donated the two ";" that the rk3566/rk3568 patch
was missing ;-)


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
