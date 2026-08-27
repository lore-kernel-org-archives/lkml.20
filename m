Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5734562BC;
	Thu, 27 Aug 2026 13:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787836717; cv=none; b=AdAugyODRXZEKg4DU7lA58B7c6+7VD72lt0W13y+fqopnj73huxs2vrsd2Aoz+KH5fsfXc32Yo2y//fQewKmXt8Jk1+8VhvFLN32Ae3eYOgZGLOhkJiP/jFdccNSz6vCo74L+5H9bqStLWP3Kd0CpOvKENjVdq607xxh8g3fmio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787836717; c=relaxed/simple;
	bh=B66mz+YFJrAe/yeE4I2n7SIpyvkUG/BmfyEb57FexH8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rrNlSOlQ8wMQuZzzcU5y/Teg/5+OYDI2brSNXPHP1uynCXBTI8XieWm2czRII3v4IcmBtx1FjiRr2LElB/2E4upTu58UxPXn9ECiskWhqbFwxQweXUEOF2ak/jhK3LONLvERf1u471Ta1bIB6wb7J3lsZqq6yz6Wobf3ms7GfkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=agEWkwM+; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="agEWkwM+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=CzaEaww3RehmTxZoTFC0+nmKVn2a5jG0MJBF8jSy9E8=; b=agEWkwM+QabT/9AAY9/u8DTOi/
	Q6bkFcme660Fid9hG/hflDOPqSksKYMgmA+mj9zY7Lzyn2MN7bbsf/QF8gGzNCiovwqtE5C+PT3DP
	liPPghPC8DgNQNpY+JQIMv/IyaQJez2XAVDT2VwPMgpsUibLemZAufRoGZPcZkoNeRMsaqtBPMjzv
	1/nc3uX+lNIriOAWkRM/6cennlMzOUUDvXBob473Fjl2KAKwbK57QcmSJZW316y+AGX+J2a6ECVoq
	hycitnTJFFloj932b4/3a3shegCHcdFaMvNemgfO2WISwXjLjOm6zbPNjDuZG1RGlqoIj1iJsz1Zb
	EFzTtsgg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rudi Heitbaum <rudi@heitbaum.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 rudi@heitbaum.com
Subject:
 Re: [PATCH] arm64: dts: rockchip: rk3399pro-vmarc-som: add i2c2 scl timing
Date: Thu, 27 Aug 2026 15:18:01 +0200
Message-ID: <6298523.lOV4Wx5bFT@phil>
In-Reply-To: <aou1Q5-hdF7kRVpe@0d3a7a881997>
References: <aou1Q5-hdF7kRVpe@0d3a7a881997>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Rudi,

Am Montag, 24. August 2026, 05:06:43 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Rudi Heitbaum:
> The hym8563 on i2c2 does not ack:
>=20
>   rtc-hym8563 2-0051: could not init device, -6
>=20
> It is also the ext_clock for sdio-pwrseq, so wifi does not come up
> either.
>=20
> i2c2 runs at 400 kHz with no scl edge times. The core defaults both to
> 300 ns and rk3x-i2c calculates a 900 ns high period, which is short for
> this bus - it acks at 100 kHz. Set the edges to the values i2c3 already
> uses, giving 1050 ns at 400 kHz.
>=20
> Tested on a Radxa ROCK Pi N10: rtc0 registers and keeps time across a
> reboot, and wifi activates.

You tested on a Radxa Rock PI N10, but are changing the vmarc-som?
I'm not really understanding this.


Heiko

>=20
> Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi b/arch=
/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
> index 64e6ba345739..074f09c6d11c 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
> @@ -296,6 +296,8 @@ &i2c1 {
> =20
>  &i2c2 {
>  	clock-frequency =3D <400000>;
> +	i2c-scl-falling-time-ns =3D <15>;
> +	i2c-scl-rising-time-ns =3D <450>;
>  	status =3D "okay";
> =20
>  	hym8563: rtc@51 {
>=20




