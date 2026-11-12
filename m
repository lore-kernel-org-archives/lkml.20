Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794477413;
	b=wHdhk7InxKYwPW6I4YoxveHEA5EPdzaJZYzrFA+PZIFDPub89lXU3FAphLTgxsuFX2ot
	 vqAuRuxh9uBL7zmfJ0WP01I4vWqwyc0sw/IPtaPE8uSFupk7Pbfedp0DANV2ko+i8lt/T
	 fzeOrEkXijxrPUfjLizLhnPlD9yjwuNddjHrsG6jBYJ49jQBd6/BTIr5EopBbXP7aY5uC
	 LwPAlbWHqrti3O9DHn6mKDn4NmDRvoQ24gQBMtQkN/+l8+X8oL7KnSsDqcMOQCKQ984nr
	 6ncEbid13JEufIgz5BYjtR1Ao8NnImQoSajTIIylFzQEZgXUt41NH3aqIpdFVEPdtzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794477413;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=z6JTZh8vNDGRD9x0jZi5MafAeLnjKMbQyD95TlqG/OM=;
	b=XNGDiF1BgAinmNTO8yec0OwL6jBBGvD7lMqrFvcYL78ptXQLBPI/1aAfZZ2wEWE957LI
	 V+GMErVWKc+wwuc3keoleWvPCCGh3tEc3rqk5EBd6tPA4+jpbBg426jcWYuDuEW2Z6l9H
	 1WlgK372HbuE2pUJ1AZBejVoWSOw2MtokRLKNg8MtzNL9nqNsY15rER3Uv8YVBiUoDkZ+
	 Qyq25RzPdxw2SWZM3m0JO53RTVdp9B/8pkhK8tAwYCIgW6Lif/vdvV7I+dceJeuJE7cin
	 ZzFMkZwFEoYa7JnmwCotOMze9JDUQbHyRKOugWoZceHaQvVpAM0FznsjVTpmYoWgp+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=Xic6RRQk;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEB9606A89B;
	Thu, 12 Nov 2026 09:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAEB9606A89B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=Xic6RRQk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=z6JTZh8vNDGRD9x0jZi5MafAeLnjKMbQyD95TlqG/OM=; b=Xic6RRQkqxB4/7hx0qfNs4vPAH
	6jnUKY/DtcS/rcmP+Jzd58MEZw/xE2ekU9owR/e2/PLQxcceHWCLf+UGK5uA0mtExyxxy3DIPjSOw
	YPrePb+ZSdV2E8o+LGOnvRB/DTJU7cT2q58WZeKj4bTgDkCxS4d+1UVLGKKwGeeE7sE5Hg1Tm1J/7
	uxKwRBcuovEWZK5ny7FaX1SqEeLFaMVk3O4ADPVh8Lwt/TiOMwnLiB+X8VB1hqFiZ+I13/Ahz5iGv
	uTgJONfjj/MeC49xcJWWa6B83ezlAW5JgiA0I8htiX85JVt4TeNVfl5pUsQtE2wO7gyzTaoo+gjsP
	C/EoR3Cw==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, aiyengar1990@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Arun Iyengar <aiyengar1990@gmail.com>
Subject:
 Re: [PATCH v2] arm64: dts: rockchip: Mark the Orange Pi 5/5B Type-C port
 self-powered
Date: Thu, 12 Nov 2026 10:56:32 +0100
Message-ID: <lAAxUnzGTXWSlQTm8PmFcg@sntech.de>
In-Reply-To: <20261112-opi5-typec-self-powered-v2-1-751906d65b70@gmail.com>
References: <20261112-opi5-typec-self-powered-v2-1-751906d65b70@gmail.com>
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

Am Donnerstag, 12. November 2026, 09:25:10 Mitteleurop=C3=A4ische Normalzei=
t schrieb Arun Iyengar via B4 Relay:
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> The board is powered from its separate power-only USB-C input. The
> FUSB302 port's VBUS comes from vcc5v0_sys through a load switch, so the
> board never runs from this port's VBUS.
>=20
> Without self-powered, tcpm keeps Rp on CC during PORT_RESET (error
> recovery), because opening CC on a port-powered device would remove its
> own supply. With self-powered, the port opens CC for tErrorRecovery
> whenever it resets, including at boot. A partner left in a stale state
> by a warm reboot then sees a real detach.
>=20
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
> This was patch 3 of the series "usb: typec: Find a Type-C partner
> after a warm reboot on the Orange Pi 5"; it is split out of v2 of that
> series so that it goes through the Rockchip tree. It does not depend on
> that series to build, but without its tcpm patch ("usb: typec: tcpm:
> Don't cut a pending state delay short on a re-queue" [1]) the open-CC
> period at boot is cut short.

As you describe this as fixing a stale state accross reboots, does
applying this before the tcpm patch degrade current functionality of
the device?


Thanks
Heiko



