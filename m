Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1F01EB1AA
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792190226; cv=none; b=F9FR2xaD12zAUpfWxN6+odkqfel8m7mvdp2rxI0BslBXjGLNU9pOm6iLer6iPlmE/8PIYIJSu65ZZc6n/gq5NlqOTXnRgSUjkeBwSK8JrgjlBenfpB5rTn2rglZtrVpj7k9XqX1mrLToK49Y3DPiNhhHnfFRQ7oQT2OyRlTqdQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792190226; c=relaxed/simple;
	bh=R7/zn7fN44IUWO675SjpHw2RrgKyI2nxbNvMNz0UdZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kdfyKb36ibvnvRp4llZLM9juCOr+ws0v+oZlGxkZ81dVNxY/ZsItCzpDx27GGa0mQRwir93KOOCmNJLgS1QKQHfEmNo9HVsM4ECUwXd2F81CPaURKZRQHpnoIk4BS87ClPb6X4wAxn7u65svPH10og1sXH+pxLzkWFHPScUrx2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=ckLBauBy; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="ckLBauBy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=1OIdajx1AC8ugqYiL+Ehn0uiLIubAtd5Cp9SN33d2y8=; b=ckLBauByU8LiGS+iOGmWnvoPCs
	qtYSD2lPhfiqIO2+yDB7SYsjufItglhuWkLay6X2/EmI0R8w6DcjD28qZplPlwa6IDmG8JJYF4jck
	IbK46fQkvXsvNKgeh18s0WK9GFv5g4uy6doHl228Rkq0ZZln9ds+1732G4AHoG75pDmWNEZZWmo54
	skKD49uYCWSLCeUauzPyJ3nfLkrRfIZ9bPbGC7f7KPFwZkYQlGoUF8xeqPcFuqV2Fj1XhHkH2B+At
	ZnKjqBgNX4EbKQj+61fCaV0Bvxi5ln0H2oxwBIPLQX+0eEsgohu509hfL+m4f/FxX1uzPEUwtGXeM
	cZi3+7tA==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Russell King <linux@armlinux.org.uk>, jbx6244@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Johan Jonker <jbx6244@gmail.com>
Subject:
 Re: [PATCH v2] ARM: rockchip: smp: enable secondary rk3066a/rk3188 CPUs
Date: Sat, 17 Oct 2026 00:36:55 +0200
Message-ID: <1979829.CQOukoFCf9@diego>
In-Reply-To: <20261013-cpu-v2-v2-1-fe3bbc9edd33@gmail.com>
References: <20261013-cpu-v2-v2-1-fe3bbc9edd33@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Johan,

Am Dienstag, 13. Oktober 2026, 18:20:49 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Johan Jonker via B4 Relay:
> From: Johan Jonker <jbx6244@gmail.com>
>=20
> Early Rockchip SoCs like rk3066a and rk3188 had boot loaders
> that remapped the boot ROM and the internal memory. Currently
> U-boot makes use of a common board file without remapping
> resulting in the secondary CPUs power up hanging in a wait loop.
>=20
> Make the various boot loader methods work by:
>=20
> * add code that disables remapping on both rk3066 and rk3188
> * change to use the same boot ROM path for all socs in rockchip_boot_seco=
ndary()
> * drop the rockchip_smp_prepare_sram() part
>=20
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

in general this seems to work on both my rk3188-rock and rk3066-marsboard,
after I did some changes:

> --- a/arch/arm/mach-rockchip/core.h
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-or-later */
> -/*
> - * Copyright (c) 2013 MundoReader S.L.
> - * Author: Heiko Stuebner <heiko@sntech.de>
> - */
> -
> -extern char rockchip_secondary_trampoline;
> -extern char rockchip_secondary_trampoline_end;
> -
> -extern unsigned long rockchip_boot_fn;

that file is included rockchip.c as well, not sure why that is in there,
but this include needs to be removed too.

[...]

> diff --git a/arch/arm/mach-rockchip/platsmp.c b/arch/arm/mach-rockchip/pl=
atsmp.c
> index f659d894bfae..ece17e9cbaca 100644
> --- a/arch/arm/mach-rockchip/platsmp.c
> +++ b/arch/arm/mach-rockchip/platsmp.c

[...]

> @@ -320,9 +279,27 @@ static void __init rockchip_smp_prepare_cpus(unsigne=
d int max_cpus)
>  	for (i =3D 1; i < ncores; i++)
>  		pmu_set_power_domain(0 + i, false);
> =20
> +	/* Make sure that the remap function is disabled */
>  	if (read_cpuid_part() =3D=3D ARM_CPU_PART_CORTEX_A9) {
> -		if (rockchip_smp_prepare_sram(node)) {
> -			of_node_put(node);
> +		unsigned int reg;
> +		int ret;
> +
> +		if (of_machine_is_compatible("rockchip,rk3066a")) {
> +			reg =3D RK3066_GRF_SOC_CON0;
> +			grf =3D syscon_regmap_lookup_by_compatible("rockchip,rk3066-grf");
> +		} else {
> +			reg =3D RK3188_GRF_SOC_CON0;
> +			grf =3D syscon_regmap_lookup_by_compatible("rockchip,rk3188-grf");
> +		}
> +
> +		if (IS_ERR(grf)) {
> +			pr_err("%s: could not find grf dt node\n", __func__);
> +			return;
> +		}
> +
> +		ret =3D regmap_update_bits(grf, reg, NOC_REMAP, 0);

the GRF registers use highword-masks, so this should probably be like
	ret =3D regmap_write(grf, reg, NOC_REMAP << 16);
enabling the NOC_REMAP bit for writing and thus having "0" written
to that bit.


Heiko



