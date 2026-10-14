Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5939C5616A9
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791992905; cv=none; b=BGeQVQVkGPrGWcmSVXBL6U0V35vIAKgrmF566PwJUSUcSucrROROpv9hCvf3CHAH9B7NMd7YwGXTOBhzWDtgqXT83h8AApTAp++Pu9F+vljAHwZG2XEEOeauJZ3MepR3vMot1IiZ/uQvF4lR4JaPUtVZ0eMoXsOcmpLGesz3WL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791992905; c=relaxed/simple;
	bh=CXn14ADe/mur29hJ4L3g9vNBUBaa5yuI90ex0XzVUMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y2OEIN7sIiHhiEsPEg0vTCV/enZQVzw8LUT1I/bwWHjpXI3uWd3OC9em8CsbD7wvYyoOZMgBmVjxvW22v4fzdktK5EwZGmOokYYRrcANyrLGI4ePam9jlrEt4Alk4ExO8PJxvq6JWNALCNxk40QcQdRcAfbDYclASLC02hoayDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=YUeVeDYA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XJu+9bMp; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="YUeVeDYA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XJu+9bMp"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id A45D81D00074
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:48:16 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 14 Oct 2026 11:48:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1791992896; x=1792079296; bh=n0fMzN/YX2
	P+RrUPlAc4epjyDvgkNWm3kwptx5HO8FA=; b=YUeVeDYANqFB+ees6yKaPf22pM
	2Caj2lYE+bPMGYdLXthwD5RbDWUrnOr70jWDGr+tCOGwfY1mH8+6irr1LY3+1ive
	0Y1n6adn2RXbahNdGROgZVC7dNdjCwM/dSM+UlDVqIxDuL/lqG7FXwH1CfxhCJZy
	WVAcpCcNEH6c2bVOlcBGmKn85Dscj1XAC9PI0/cB58Q597QfMIY5i65QRGBMpyar
	AF0R4APIco7CMGaS1bz0CLyKoW8qOHHvL3o4OpMSdR9DGOdH8G4P9uAolTfFjROl
	47UPDvxWyTc16d1YSMn+U+6BXAXP8AfDHPdSefIvYQ6sFwSlPkcAhBnT86iw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791992896; x=1792079296; bh=n0fMzN/YX2P+RrUPlAc4epjyDvgkNWm3kwp
	tx5HO8FA=; b=XJu+9bMpT7ywb90L/8e0KqA9a14jiyjk2mlVlI+WSZtaeqXUxI9
	g7HyWqleAjORH/aN2DKjr9tqsUrXd5nn1dROqXqqixPouN+HrrKFVWONQTYEGNLa
	vni/+ig9unU26T5EeQdrlI72J23YKIFXIuojAuD+jl6ytOFaocEWEt8jAyixb1lI
	eprvIJ4ngDJaP5dCGFYGELFeUHEE6S5n8khsK0cEMkxr8Z5p5GMythjrEI9sFTGN
	63qDGaXbwFR/Uzu1+Tkh2oRd9DnAs6Hhiu0Oo4jwdOvRLJGEyVu43n4uG1L1rB1I
	PscXVok+qfEsk1v2hs+XS2ghNQgQBSp+/1Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=kroah.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791992896; d=kroah.com;
	mf=PGdyZWdAa3JvYWguY29tPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:WY8AM7yFoKxlWAMl3Z6tEw+XwUlYPoenU1yOUOQF1KMMjTK
	cEg7TjTWPg4woIAoYHUXbK9MmIuZ2LP9OyfX3z8xfNcJ/eDbU4MO3DER6bTfco57
	GO1Bz8j8GntzS71Db4vgHGrGGPP079hzkDk7ZMFfa69KYF32hwBDjnxlEEbAFYHR
	l7mbDfmS1Fr0JlI49ZmSlkHY4euYRi/0gcuYSqrntH9GEzsRNu4WTgcn2TpjOzJ5
	+8eCHTIcMvR3hYPZPkT/FfK8nsjLOUcNViK23YaRL7Hv70GwHUQkDjakIYplgd0N
	konHUBh2YJLiaIv4Q1erFcdGCgIYxteLC7hBX3A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:u5Aj9ir90r9u2x3obpNgJw80Fv6TcH3NV3KMn6VSGZ8=:CXn14ADe/mur29hJ4L3g9vNBUBaa5yuI90ex0XzVUMM=;
X-ME-Sender: <xms:P6TParuUi3WO-mW013OgTqC1AjntdrDuVyi35GFEBQ6y2nuxvoS1-w>
    <xme:P6TPakYMab7nNHk2s4DyGOFDf2nRombXpfOcsyqYmvuXpSIr1R_Eb6ch-uunQHPLW
    MzbSI-0YJWLTeVbvDZLzrlPsCJrdAF7ftHU2Dpg_ILNHHMXFSA>
X-ME-Received: <xmr:P6TPal8n743QBupiNsRSDZkRBw_MfKWQKUDF1bNzQuzzdbCJzFe0Um19JvZmS23HFWOsnHZQqejk7e4PrHY8omKSxHod20Sy7X-o9ITK3Dc>
X-ME-Proxy-Cause: dmFkZTGpVDHhh9n3k6hrmoFvEmOrgF74qh2eYfPabJhXhsSJIk6fFEkFA7qAu7rshplNgY
    AXXkS5AIUDNhW1GyO5P2HTSPtPShxsm+TBt/DAGBxWQk4Dit750OA1pvXM4dYtfAOIzpLF
    9+iwzKWxa2ToFCIs+HmZeMtKXgpXg1Qxc5Jl0wx7vnhmP+KV4sinBqGJFF1rytS7ynZy7Q
    gM93QcCGMF/5bacITyhadM+mh+5/xsJRluygcMyU7dM2fC9hlusmU8wwUd5k6I25FRgmSk
    UHnspMAVjmQE37mEIcnk00YfTfTlP9ZaU5bYUdd6qRWV2d941agSke2aYfZvakuRBO4jEI
    eKJNelqxKUhf/lsItnvCymgnr3BPqxogUrZxXwe8eFtGK1yK7WU6g/BRluiFa/mgavhRsf
    byhuionRGK8qafapLGBELjnL6iR81ezbJkezGunFhmseSwtDgkc2+lnBqjSEAer0Oo3UoN
    eVK86G82pRA3IWxwsW2WwU9T14oZtr3cY5tRbwLHw5mA7gWhxaEEXyLGtq0/OSWW2Iu1y6
    mhIkJQkAKhww0g0mIH2YFjqA8JmN9UrOd79FBuMPM8BcpyAMUrFCeVUqIHLaAu2lhBCWBW
    oGNuhnwQWPj7r/GS5CpH1TMR6c+uv2ULfdOr9/U8Sk5JWPWe81UVAIzjsTRg
X-ME-Proxy: <xmx:P6TPagp7qg62F5V6_DYnvGZbRthjKd7nTmo6R2Zpt5gbID5qJd6c1w>
    <xmx:P6TPaoGxSDSyirFPwCYMKbHIWNEIWJMJ7T2og3LIx06gN0Im0aiAbQ>
    <xmx:P6TPagmyDzhHXuMjoAIDyaRKm3xiB-rvTHwhG6Zc7VbyNl6wCQqlZg>
    <xmx:P6TPak_YTQEgV72DmAY-egJ3HNWYq9KUUXTzNpuD--6An9T_6iwXMA>
    <xmx:QKTPanEJ48PWVvVDltIwqHB2dmjXTIrulMGm6Ox7obv91RX3jqln_HGl>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Oct 2026 11:48:15 -0400 (EDT)
Date: Wed, 14 Oct 2026 17:48:20 +0200
From: Greg KH <greg@kroah.com>
To: Mark Brown <broonie@kernel.org>
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>
Subject: Re: linux-next: manual merge of the usb tree with the modules tree
Message-ID: <2026101414-remodeler-hypnosis-0620@gregkh>
References: <as-ZUTCmpY2iZf_T@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as-ZUTCmpY2iZf_T@sirena.org.uk>

On Wed, Oct 14, 2026 at 04:01:37PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the usb tree got a conflict in:
> 
>   drivers/thunderbolt/tb.c
> 
> between commit:
> 
>   08abfa5a161e1 ("drivers: Replace __MODULE_STRING() with __stringify()")
> 
> from the modules tree and commit:
> 
>   41d5a1fc28100 ("thunderbolt: Move tb_apple_add_links() to pci.c")
> 
> from the usb tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc drivers/thunderbolt/tb.c
> index 9537110a5aa8b,4da608ccbccbf..0000000000000
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@@ -10,8 -10,6 +10,7 @@@
>   #include <linux/errno.h>
>   #include <linux/delay.h>
>   #include <linux/pm_runtime.h>
> - #include <linux/platform_data/x86/apple.h>
>  +#include <linux/stringify.h>
>   
>   #include "tb.h"
>   #include "tb_regs.h"

Looks good to me, thanks!

greg k-h
