Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230832;
	b=ESBY9nxnT2gTADL1j6hudGcwt7HaugFHdi6MyAnssg0SCA2PtzDweBj6/rupoob2bOvG
	 cdY33Y731KEdOpa8hqXw7c+VhpCvBtUHLcUXveg9eQYpkGq6VXt3JJjGPOo/ZbJh4Te52
	 C/W55lF+sDloT/6HJodB8ltpjDoeZCBedW88bICIkPLe6Ok5UoNdJS2RhM/gt1XKSFCKO
	 pDV77qojIfIbHXCzU5slv1uCWMMGmVPnGeFzRRABSNvVWsdqAyhFx9WpfyzH3KYRH7lJq
	 eH9h7KCzoliywbLMaJ9OAyfXXDva/pBg2TJumsv/YEaxx7hB9kDN8SZr9IWYzNGAIcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230832;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=//2W4dF8dRqMAfkwRAhImATI6D+c4FVFBxbhqBn9xzk=;
	b=oQlrS9pauF6KI5QT7feVFgJ8VnmFIDCCA/zV8fSaAWa1nIE27REqWOsxlT2yId0O6Xs6
	 tLpUxUstkE6yEWg7FbgvHssi/EPuGXAP9MEXx3c9UFf547UuzOQos1F8SHKXTl8c+AZyA
	 +349PeFcbvIwEuG1LRuc7iKFVDQJ51BWCjmczcr/b3uloYbpZOeNV9k9N4LH1rnPiQxu0
	 l7vdYoliVlBT1ubtkS3TLT8DJWxP2jmRHtp3zLM9xniayx/EGZmCtICReZ9YQIJGs3zgb
	 Kfu57JHURvN6bE2lB0cwUcZgloU8vhP1Hg6gSEfMHpwdZveVBYPx+aTqjbwrN2+VAMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=vW+rWMbC;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEAF606D827;
	Mon,  9 Nov 2026 13:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CEAF606D827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=vW+rWMbC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=//2W4dF8dRqMAfkwRAhImATI6D+c4FVFBxbhqBn9xzk=; b=vW+rWMbC+7d9RHvWCrWsBbFsUk
	5idnG3Sd13NpxvsuTmz0VMYqvaK+w9Jjq3+bj8U2rNF+hdX5K9P1M7WmFg5SvIMIRaMxtc2ZFhr9w
	ytwlggqCzUCrzwzrHd87GqnRYc0aE9k6zGwt7pjlOw44xerDF61PYznkQ5P6Z0HJlM54CB8yQ9lKR
	zyzcQ2JdveVONjsLdyQ5toBWNi0wI4+SQ8sUKexxsMl9XN97ubqW1RZj83jTsAahKc1cl2yD/h3Qj
	cFgsJWGF63ZWqoFHc5JZka+d4erYO0TJ+tOnU62kwgDdkG2h4/Qiuzie5IHW4EPRIOY3hCwkBKTVm
	l08L/sdA==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH 4/5] arm64: dts: rockchip: Add DSI panel to RK3588 EVB1
Date: Mon, 09 Nov 2026 14:26:44 +0100
Message-ID: <5573124.44csPzL39Z@diego>
In-Reply-To: <b60b7079-b7b6-4d83-8167-2e4fc6021aae@rock-chips.com>
References:
 <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
 <avDN3pPY5Qwt9B1p@venus>
 <b60b7079-b7b6-4d83-8167-2e4fc6021aae@rock-chips.com>
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

Am Montag, 9. November 2026, 02:31:35 Mitteleurop=C3=A4ische Normalzeit sch=
rieb Chaoyi Chen:
> Hi Sebastian,
> On 11/9/2026 3:42 AM, Sebastian Reichel wrote:
> > Hello Chaoyi,
> >=20
> > On Sun, Nov 08, 2026 at 11:15:09AM +0800, Chaoyi Chen wrote:
> >> Hi Sebastian,
> >>
> >> On 11/7/2026 5:57 AM, Sebastian Reichel wrote:
> >>> The RK3588 EVB1 comes with a W552793DBA-V10 Touchscreen/Display
> >>> combination. It contains a Wanchanglong W552793BAA panel and a
> >>> Goodix GT1158 touchscreen. This adds the DT description of it.
> >>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> >>> ---
> >>>  arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts | 90 ++++++++++++++=
++++++++++
> >>>  1 file changed, 90 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/=
arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> >>> index 6a95a8bb6fb8..327ca13b60f0 100644
> >>> --- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> >>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> >>> @@ -204,6 +204,15 @@ vcc12v_dcin: regulator-vcc12v-dcin {
> >>>  		regulator-max-microvolt =3D <12000000>;
> >>>  	};
> >>> =20
> >>
> >> I seem unable to apply the patch to the latest linux-next tree.
> >>
> >> So I tried to resolve the conflict manually, but the actual
> >> test screen did not display. I will look into this further.
> >=20
> > Strange. The base of this series was Heiko's for-next tree from
> > Friday. No RK3588 EVB1 patches landed since then:
> >=20
> > https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.gi=
t/commit/?h=3Dfor-next&id=3Dcabb6811c38a46337d5f4252b4dc390f9296856c
> >=20
> > If your board uses the original Rockchip bootloader, which shows a
> > Rockchip logo on the panel, you also need Cristian's latest YUV420
> > patches that reset VOP2 at probe time avoiding some issues with the
> > pre-initialized panel as a side effect. Those were recently applied
> > by Heiko to the DRM tree, so testing on linux-next is indeed
> > sensible.
> >=20
>=20
> Hmm, the newest linux-next tag which I used is next-20261105, and Heiko's=
=20
> tree last updated date is1106. I'll give it a try on Heiko's tree.
>=20
> And I'm using mainline U-Boot, which obtained from the latest nightly bui=
ld:
> https://gitlab.collabora.com/hardware-enablement/rockchip-3588/debian-ima=
ge-recipes.
>=20
> The backlight working correctly, and the DCS command has been sent, but n=
othing display.
> Perhaps I should look elsewhere.

I would assume it could be the SPLL (again).

I.e. a recent u-boot change broke the SPL-based forced clock init and Jonas
fixed that in [0]. Had the black display again recently too.

And it seems it hasn't been merged yet.


Heiko


[0] https://lore.kernel.org/u-boot/20260804002643.2308515-3-jonas@kwiboo.se=
/


