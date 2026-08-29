Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E38438024
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 22:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788040816; cv=none; b=NJEEzbhVInI4nTVMRsozn92mPP34y7LmtiKxRz5kfKFOOi5mw7jfKlL38DrbEL3Q8fImxJ2V16Xh1fOLqRw4Dy5Xjn0ANI+Da/ch2xnBjvLIR++FMrMx0jAu1oXUByaQ3tEQnkKhWeECHwWq6jNGeMhXV6Do48sV1lp8BEWITLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788040816; c=relaxed/simple;
	bh=fnFdv9YwAuH58/ud73aUJMavhqBVuqJiQATlVXDGPn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XL8lLk2Oe0aYVU0CZtYyHVJK7RYtlut3CcBIuQny978GhkrJ7V2XS77otPDPmEq41k31JLbMqpanLdTEV7Cgx+WHrJehN5tdHqDbgIprQmVbP4jFy10hMWxxmBckTGvlUCgiSMa6TH9Ej1gO1Sq92QL55b8AwYR7gmeAa9JwHFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Js1UJoPK; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Js1UJoPK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=wQnJuD+BPGQBF7rfni0A/KmSwUG6YkQKLCt4vUrM/bo=; b=Js1UJoPKOfEHMGQOg87SKX9bxK
	/2s7G1BJ9LV47M6RpZFAM3rTqVJ4mwXemCDYBbXyIrxyC/Yun7FhMWvNLh1ECwlV259ZLY1vShQtT
	quCFoTrYfMIgZ4TIH4rMVAbmAkaxvXeQRDSNYMIPxvwUXVS/5m1oETvlQS4CdSMsbDRkPWBDejDvf
	TBpCUOehdumIJNr3Jfhbu79KryMwhMDWvSOHn5KwEKPyZk9QyHfgRBVPMyvfVY8ifk4kIzhANyW2D
	sg41H4OANc6ZRdWnPHqXzyhHsR5Xye88MmchNkuhapMzr30VXlL3++SqagTH8w/Nnebz1rXeF1JDP
	+HSJqqCg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Russell King <linux@armlinux.org.uk>, jbx6244@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?B?SMO8c2V5aW4=?= BIYIK <boogiepop@gmx.com>,
 Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH] ARM: rockchip: smp: enable CPU1 for rk3066a
Date: Sat, 29 Aug 2026 23:59:55 +0200
Message-ID: <2667576.VLH7GnMWUR@diego>
In-Reply-To: <20260829-cpu-v1-1-33dca576db92@gmail.com>
References: <20260829-cpu-v1-1-33dca576db92@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Samstag, 29. August 2026, 01:40:57 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Johan Jonker via B4 Relay:
> From: H=C3=BCseyin BIYIK <boogiepop@gmx.com>
>=20
> RK3066a CPU1 fails to come online. Fix by using
> a similar mailbox construction as in use with
> other Rockchip SoCs.

"RK3066 CPU1 fails to come online with recent kernels....[rest]" or so
and also please use the line length up a resonable length like around 70
to 75 characters.

Also, is it known, why that happens - i.e. what changed?

> Signed-off-by: H=C3=BCseyin BIYIK <boogiepop@gmx.com>
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  arch/arm/mach-rockchip/platsmp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/mach-rockchip/platsmp.c b/arch/arm/mach-rockchip/pl=
atsmp.c
> index f659d894bfae..d7d080c29f3c 100644
> --- a/arch/arm/mach-rockchip/platsmp.c
> +++ b/arch/arm/mach-rockchip/platsmp.c
> @@ -133,7 +133,8 @@ static int rockchip_boot_secondary(unsigned int cpu, =
struct task_struct *idle)
>  	if (ret < 0)
>  		return ret;
> =20
> -	if (read_cpuid_part() !=3D ARM_CPU_PART_CORTEX_A9) {
> +	if (read_cpuid_part() !=3D ARM_CPU_PART_CORTEX_A9 ||
> +	    of_machine_is_compatible("rockchip,rk3066a")) {
>  		/*
>  		 * We communicate with the bootrom to active the cpus other
>  		 * than cpu0, after a blob of initialize code, they will

isn't now the only user of the old system the RK3188?

With both rk3066 and rk3188 from a similar time, I'd assume both could
be switch and thus the the now unused code removed?

I've never thought to look into that ... need to find my RK3188 board :-)


Heiko


