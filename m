Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793386478;
	b=0pPCoPXnJG56FSe3VqMkWmhTJPJs10Y9axiFDLeu19D783fW9TjgQAgwa1Q73uv0Dc1B
	 TRg8qw9l6v2v2AiRAQcT/qBGoM+mJK4AmxOs4dRb/p5xK3631leRH0WGBwD8jDnK4IrQG
	 4vMKJuwjQbhkNbjfCdyw1E0hwBQP0cgEVvPWis4k5rm02jRXow0qnhg56+Sx1fjxLIKSS
	 kVOb6N+L3sgeAhvDT1HFIF8mwCAMXXxrLjGmee+RDQrOnph2M44Q3yxOV6xjkSitVuejW
	 lNjJ9G1MJ0SIKn4zg8xGOAGiSVGnNEQuADTRdblOZ5nqVkaAABsK5My7Vuj2/X7tmhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793386478;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=Brr2h/G8F5sm++eAkQE0x5CfsLRj1KRFkWsNsX6gqL4=;
	b=JlSNIG1evO4dqjDMzptwpjrIgBq+TJirc610nF/b0JK4+ohZMsqBU+swBjeu8mTRDfLC
	 v5PUj8mNfSkiKF0v7kt+hI4vt2ZS/5Wl5Q8ezJoi6vWHkeHWa2J+CKVo1jPQYHjCYNvRT
	 4D26gqB+0jZIF2yGfsp0joazY5UCI/mzW64yetFCfXaeTR4E4gXfJ5mMVOnnAvX7CicFL
	 QoQ9Yvx8GK2oRJXNdzl2M5F+vHX78fb/PVdunIgENszm0WkvhGG5B+UaTUtQiGeLQ1ITc
	 n1JwhMsf2/N3S0NJrzW1A2ldI8hgRCHjpOVEkf/DbQqtbDGg57UGPI4W2LdeAH9nDuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=DbuIQ72q;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD95606A31A;
	Fri, 30 Oct 2026 18:54:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAD95606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=DbuIQ72q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Brr2h/G8F5sm++eAkQE0x5CfsLRj1KRFkWsNsX6gqL4=; b=DbuIQ72qIeNFwJ6zGY+YCqzgId
	pZr+fUdvq2MaFQHXsS6SbE8eaXlbw89CsEJz7eAkGcWLBLmIfNWfuDNLXRGWhTlRL5MVZAKl3qmYn
	lmwsfKMx5iT0xcc3KpFtWOyUoCQKsgmaSRh/sXRXkTBwrJMUrxAn1oD3aUfGXX4dO0QhyDBNcsFEW
	ahtxF9PiZxVxEMh9/G/X56ywg1tzpvBekjhYbM2uoF2kk85ZmBvkQGEsjhednGw+j1q9zfb2/4IEE
	vqVoZvr8/1bElk7XzW1n6pT1mJrArgI3Ss3kQekCxYygL02olfBH5fd6rJCtNeMDROmX2DtYYaZLc
	h+hqFRyA==;
From: Heiko Stuebner <heiko@sntech.de>
To: devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
Cc: linux-amarula@amarulasolutions.com, michael@amarulasolutions.com,
 dario.binacchi@amarulasolutions.com,
 Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: Add Axelera Embedded 111c
Date: Fri, 30 Oct 2026 19:54:32 +0100
Message-ID: <10806856.0AQdONaE2F@phil>
In-Reply-To: <20261020113717.189082-4-patrick.barsanti@amarulasolutions.com>
References:
 <20261020113717.189082-1-patrick.barsanti@amarulasolutions.com>
 <20261020113717.189082-4-patrick.barsanti@amarulasolutions.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 20. Oktober 2026, 13:37:17 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Patrick Barsanti:
> Add minimal device tree for the Axelera Embedded 111c
> (rk3588-embedded-111c).
>=20
> It offers efficient AI compute for multi-stream computer vision and
> GenAI applications in a compact design. It features a quad-core
> Axelera AI Metis AIPU and an RK3588 SoC processor.
>=20
> This basic version of the dts supports:
> - Console
> - eMMC
> - HDMI
> - 4x USB-A
> - 2x Gigabit Ethernet
> - RTC
> - Enumeration of on-board Axelera Metis AIPU
>=20
> Link: https://axelera.ai/axelera-products/embedded/111c
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Signed-off-by: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>

that Signed-off chain is not correct.

As it stands, the first signed-off would indicate Michael as the author.

If all 3 of you worked on this, this needs Co-developed-by tags, though
3 people for one devicetree?



> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-embedded-111c.dts b/arch=
/arm64/boot/dts/rockchip/rk3588-embedded-111c.dts
> new file mode 100644
> index 000000000000..a964b46e5c12
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-embedded-111c.dts

please name this rk3588-axelera-embedded-111c.dts

The name is otherwise way too generic.


> +			vdd_log_s0: dcdc-reg3 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <675000>;
> +				regulator-max-microvolt =3D <800000>;
> +				regulator-name =3D "vdd_log_s0";
> +				regulator-ramp-delay =3D <12500>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +					regulator-suspend-microvolt =3D <750000>;

regulator-suspend-microvolt is deprecated, so should not be used in
new devicetrees. Same for all other occurences.


rest looks ok :-)


Thanks
Heiko


