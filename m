Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073952EEE63
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790800114; cv=none; b=j7pbSmTDkinyJ4HAA7577l83qQdWpirjb56+xZQ5tAN2gCq93RdPhUfFRqEVnOe4hdhVEBUgIJVmOp6sGjOI/jf1fWMH/EWyo5N5lgaW0GMkvZJq91baVohzyvnQX1aMuLZUTGKftphoewaquNsk2aYdsqThxz3H5ke1DXZV4cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790800114; c=relaxed/simple;
	bh=3g7n6yv3jRRL7FVQFuxFWtp4ZLsZMbQKAEuq+6xRbpI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iuFSvJpjzfnL4RMjm0UwnP+1hu5NuVBSbXmm4as5fo9INzv1rMUK+G7A4JipSSoaE3Nfvk1yYcUHJgQ4qkuQ7POQwbC/MR7ix/AwCY6fO6t+Pz+w2QFHh92DctbeqMx41R2xTRThFUoE5uzsAd8VknYENs+Ly+hWT8LirTrxkgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1JO7n1Jj; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1JO7n1Jj"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 518F51A1071;
	Wed, 30 Sep 2026 20:28:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 06B0260749;
	Wed, 30 Sep 2026 20:28:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4906C103284B8;
	Wed, 30 Sep 2026 22:28:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790800108; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=w8f1tLJiBq9vDN/PBOT5hp9SmKuGgL9XgSOhE6RPUfA=;
	b=1JO7n1Jjj6ESOL5u54mDWgDWIgm/CnxkBizLLLxDfmEjp1lGa/kxtXnH1LNfK+jjgb+ypI
	68A8rDUnMhndSXZ3LrEi3MgLBCn6rjVs64wnTGIYo4Bsqef8g+dFwuGUiNQz+sLuoZ1Xm+
	mNRDbXOYYsFnw95j5SgCYnNtW/ZCNfcSnd7AqbvuLlNZZ2qOa50y5TeVtosEuZ2duLmb9n
	VrEDWVM7ZnUSG57Hh8skU6KYxin1/4YnDlipFIa7WmoJqv8ypS568xHlEXIGqWW8Q4dfsU
	OvnSUf2MTx6CmpVmivbttI7cUyM1M5rIiXIIGk2ib2EliiXyKqigiY/QlBe8cw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Qingfang Deng <qingfang.deng@linux.dev>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Thomas
 Petazzoni <thomas.petazzoni@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Gabriel Rodriguez <lifehacksback@gmail.com>, Qingfang Deng
 <qingfang.deng@linux.dev>
Subject: Re: [PATCH] ARM: mvebu: fix Cortex-A9 errata selection for Armada 38x
In-Reply-To: <20260920040738.466563-1-qingfang.deng@linux.dev>
References: <20260920040738.466563-1-qingfang.deng@linux.dev>
Date: Wed, 30 Sep 2026 22:28:24 +0200
Message-ID: <87y0ci7ac7.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Qingfang Deng,

> Armada 38x uses Cortex-A9 r4p1, but MACH_ARMADA_38X selects the
> workaround for erratum 720789, which was fixed in r2p0, and omits
> workarounds for errata that still affect r4p1.
>

I think that the very early version used r2p0.

The logs that I have from various Armada 38x show the CPU: ARMv7
Processor [414fc091] revision 1 (ARMv7). The value 414fc091 is the
MIDR. The MIDR indicates that the CPU is a CortexA9 at revision 4p1.=20

The logs that I checked are more than 10 years old. We can now safely
apply this change.

> Drop ARM_ERRATA_720789 and select ARM_ERRATA_754322 for faulty MMU
> translations following an ASID switch and ARM_ERRATA_764319 for
> unexpected undefined instruction exceptions when reading debug
> registers. Also select ARM_ERRATA_764369 when SMP is enabled to work
> around cache maintenance by MVA failing to reach other agents.
>
> The Cortex-A9 r4 Software Developers Errata Notice (ARM UAN 0009D)
> lists these errata in sections 2.3.3, 2.5.10 and 2.3.4, respectively.
>
> Link: https://documentation-service.arm.com/static/608118675e70d934bc69f1=
43
> Fixes: 9aa30f1c13d1 ("ARM: mvebu: add initial support for the Armada 380/=
385 SOCs")
> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>

Applied on mvebu/arm

Thanks,

Gregory


> ---
>  arch/arm/mach-mvebu/Kconfig | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-mvebu/Kconfig b/arch/arm/mach-mvebu/Kconfig
> index 9f60a6fe0eaf..5203b5cfa457 100644
> --- a/arch/arm/mach-mvebu/Kconfig
> +++ b/arch/arm/mach-mvebu/Kconfig
> @@ -55,7 +55,9 @@ config MACH_ARMADA_375
>  config MACH_ARMADA_38X
>  	bool "Marvell Armada 380/385 boards"
>  	depends on ARCH_MULTI_V7
> -	select ARM_ERRATA_720789
> +	select ARM_ERRATA_754322
> +	select ARM_ERRATA_764319
> +	select ARM_ERRATA_764369 if SMP
>  	select PL310_ERRATA_753970
>  	select ARM_GIC
>  	select ARM_GLOBAL_TIMER
> --=20
> 2.43.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
