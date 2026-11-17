Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794886130;
	b=cUUMpRqICYSmhnv/2gS+m1O2NGIuse4b9FbsRlwqyNiMtk6RQrSnCkYy7mR31gTTJek2
	 nhelDpjgIGqWMVypk2mt5PIpS+EiEgzuYLyVNegBxNdAhCYjtc2KdTXw+WrNtY6ijymeX
	 llSREdmIcJp+wNhokbPg9emIY9g3ViQhz9gs1JrgKKvVrg2e23ke+UQ3H1wC2MXadZ34m
	 Edm5ga0SIpUdEt/nFiftJ0cVkyINKCsO6E3Vb2FUiCFkhAsgKLPA+tFkMmiODiX3jegGp
	 WUJHycJguGItgOjKkQIHoy6YVrKfPrFnFxfvnCTin5D+C0MIN79RQfkBzbB7HGTvGJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794886130;
	h=DMARC-Filter:Received:Received:Received:Date:From:To:CC:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:User-Agent:X-Originating-IP:X-ClientProxiedBy:
	 X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=X3ka1UWCQgHr7wAYA9U0lvn/SMltga41VCk5FtudeCg=;
	b=tmZeaREbm0v9WpXn06/BRf68DPlTmzS6UCau1eMLh2peoZwpQUNcsjGLgADuzPwZ3+CW
	 WXmR3GUJdiwDH26t6e1gpmSagPZLT4rWIfK2unDDnh9TE19X9QOekXMJfu1BXcARbou87
	 lt4Kjd2e78SiGmnXX0u9xQ6drPi3/l7j0H1DFSLtegbhR0LI6bwzk7tsZXazJPQoK9DYa
	 449E3vUgvSbYSRhuEGix/VMoWrFSoP2GDP1ai+eHmH2Mdtqtic7aXhOXWbxZTVCSefJ6w
	 ykb4I1zWv7neCPFUHNaRiY020aAyo3IsUFzu4UUE7U9o0x3jWcflZWJFFAtpxw8cJyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB01D606A31C;
	Tue, 17 Nov 2026 03:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB01D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs53.andestech.com [10.0.1.153])
	by Atcsqr.andestech.com with ESMTPS id 6AH3SFac027414
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 11:28:15 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs53.andestech.com
 (10.0.1.153) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Tue, 17 Nov
 2026 11:28:15 +0800
Received: from atcsi01.andestech.com (10.0.15.32) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Nov
 2026 11:28:15 +0800
Date: Tue, 17 Nov 2026 11:28:15 +0800
From: Mina Chou <minachou@andestech.com>
To: Conor Dooley <conor@kernel.org>
CC: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <jic23@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <geert+renesas@glider.be>,
        <magnus.damm@gmail.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <randolph@andestech.com>, <cyyang772@andestech.com>,
        <tim609@andestech.com>, <az70021@gmail.com>
Subject: Re: [PATCH v2 16/19] riscv: errata: andes: allow ERRATA_ANDES_CMO on
 all Andes SoCs
Message-ID: <avvJz262LYxrlaXU@atcsi01.andestech.com>
References: <20261113071143.1446167-1-minachou@andestech.com>
 <20261113071143.1446167-17-minachou@andestech.com>
 <20261113-upon-unmarked-8f4a186bb656@spud>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261113-upon-unmarked-8f4a186bb656@spud>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs53.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 6AH3SFac027414

On Fri, Nov 13, 2026 at 02:00:46PM +0000, Conor Dooley wrote:
> [EXTERNAL MAIL]

> Date: Fri, 13 Nov 2026 14:00:46 +0000
> From: Conor Dooley <conor@kernel.org>
> To: Mina Hui-Min Chou <minachou@andestech.com>
> Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
>  alex@ghiti.fr, jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
>  conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
>  prabhakar.mahadev-lad.rj@bp.renesas.com, linux-riscv@lists.infradead.org,
>  devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
>  linux-kernel@vger.kernel.org, randolph@andestech.com,
>  cyyang772@andestech.com, tim609@andestech.com, az70021@gmail.com
> Subject: Re: [PATCH v2 16/19] riscv: errata: andes: allow ERRATA_ANDES_CMO
>  on all Andes SoCs
> 
> On Fri, Nov 13, 2026 at 03:11:40PM +0800, Mina Hui-Min Chou wrote:
> > ERRATA_ANDES_CMO depends on ARCH_R9A07G043, so it can only be enabled
> > for the Renesas RZ/Five, although other Andes SoCs such as those built
> > on the A27L2 need it too. Drop the dependency, and select
> > ANDES_LLCACHE and CACHEMAINT_FOR_DMA so that the errata always comes
> > with its cache driver, which ARCH_R9A07G043 used to guarantee.
> > 
> > As ERRATA_ANDES_CMO is default y, it is now also enabled in the generic
> > riscv defconfig. The errata only acts on Andes cores at boot, so other
> > platforms are not affected.
> > 
> > RZ/Five still gets uncached memory for coherent DMA allocations from the
> > DMA_GLOBAL_POOL that ARCH_R9A07G043 selects. This patch only covers
> > cache maintenance for streaming DMA; how other platforms provide uncached
> > memory stays platform specific.
> > 
> > Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
> > ---
> >  arch/riscv/Kconfig.errata | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> > index 4f77b3c6d7fd..3c43e065aa01 100644
> > --- a/arch/riscv/Kconfig.errata
> > +++ b/arch/riscv/Kconfig.errata
> > @@ -12,7 +12,9 @@ config ERRATA_ANDES
> >  
> >  config ERRATA_ANDES_CMO
> >  	bool "Apply Andes cache management errata"
> > -	depends on ERRATA_ANDES && ARCH_R9A07G043
> > +	depends on ERRATA_ANDES
> > +	select ANDES_LLCACHE
> > +	select CACHEMAINT_FOR_DMA
> 
> If you're selecting it here, can you not drop it from the renesas soc
> Kconfig file?
> 

Thanks for catching that! ARCH_R9A07G043 selects ERRATA_ANDES_CMO,
so the selects there are redundant now. I will drop them in v3, something like:

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
@@ -465,8 +465,6 @@ config ARCH_R9A07G043
...
        select ARCH_RZG2L
-       select ANDES_LLCACHE
-       select CACHEMAINT_FOR_DMA

Thanks,
Mina
