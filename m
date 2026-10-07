Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B763B4A4400
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 12:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791376853; cv=none; b=HNqDryHObIFFQxGY8b0G/yci+zg6GRhByDuRPpX43myuVIzb5mnVKIT6S9dNJy34IpAjhloTUP6V5FXJbz0nHYIpFpD1zWas3yuQ5EOBjLJz7mWViBRSAwscew6EYZdUMn+SvTMhkVYj69Fz6e3iiweX5+UugWpK2FRVbJH15ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791376853; c=relaxed/simple;
	bh=uLLQRGjumK1nE2etE0m7cylAvrqADO8urW20Vn9QFxA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=VlOe+insuX/ytIiUnDxcD0np5Dhfq87MOlBi3bvPvRdjEhuXONa48BEqhr8pIkI/OaMrWcFy3x71JZzSMt2OkNb98gVM/WAU322qsWFF1mNoh3KcZkLbKTtqsenc7Oj3zwOIs0dw0CvHBXSvnRU4kNvCsZ2Y9A0J31O1zHFNOUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HurpNYvg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HurpNYvg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C4071F0089B;
	Wed,  7 Oct 2026 12:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791376844;
	bh=jIkFVhyv0seV4VIwfW6XrxasNT2GVBoZd5clQcXfs6I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HurpNYvgBSIdeJ79pQlAFmrohbaU43qkDbo6oIb5lOThAWqf3Sv7uoNKhKZu4XTfA
	 Xq/4XPhYS7nQzJtva2KutdBWTKpZInXCx4mDu2ueEOcWkPs2Lu5Q/A3OmtjHACWzjL
	 XhAEK6K/SUjkO1x5X8e+ZmW10D/WPvK13SukSMyKFwAN5yNdixctWOmhljBZbzi7zT
	 RXAuHRAjaBt0iojLCE6Pyy159Sg/N3UrDWKeFGyS8farWBKNuoD/MY2z7uhZSs2h59
	 uY5RdTQPL+BAujiByvwbetyrw5hiIknwPbywm2MtPAKI8EKSHVNbFEqwOn4Id5wqGB
	 8DLXB2lDqir0g==
Message-ID: <sashiko-outbox-163006@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mtd: spinand: Do not re-enable continuous reads vetoed
 during variant selection
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Weinberger" <richard@nod.at>, "Frieder Schrempf" <frieder@fris.de>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: "Frieder Schrempf" <frieder.schrempf@kontron.de>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
In-Reply-To: <20261007-spinand-cont-read-supported-v1-1-411facc04d99@kontron.de>
References: <20261007-spinand-cont-read-supported-v1-1-411facc04d99@kontron.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 12:40:43 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] mtd: spinand: cont_read_unsupported flag cross-contaminates SSDR=
 and ODTR states
--

commit b383d1cfd2600477f020bc396d311d923c48ff86
Author: Frieder Schrempf <frieder.schrempf@kontron.de>

mtd: spinand: Do not re-enable continuous reads vetoed during variant selec=
tion

spinand_match_and_init() clears cont_read_possible when the fastest
continuous read variant is slower than the fastest read from cache
variant, or when no SSDR/ODTR continuous read variant is supported by
the controller. However, at that point cont_read_possible has not been
set yet, and spinand_cont_read_init(), which runs later during
spinand_init(), unconditionally sets it to true for any chip
implementing ->set_cont_read().

> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index 95353777d7f74..e83341290ec32 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -995,7 +995,8 @@ static void spinand_cont_read_init(struct spinand_dev=
ice *spinand)
> =20
>  		if ((engine_type =3D=3D NAND_ECC_ENGINE_TYPE_ON_DIE ||
>  		     engine_type =3D=3D NAND_ECC_ENGINE_TYPE_NONE) &&
> -		    !spi_mem_controller_is_capable(ctlr, no_cs_assertion))
> +		    !spi_mem_controller_is_capable(ctlr, no_cs_assertion) &&
> +		    !spinand->cont_read_unsupported)

[Severity: Medium]
Will this erroneously disable continuous reads for valid bus interface
configurations?

Prior to this patch, spinand_cont_read_init() unconditionally set
cont_read_possible to true, masking the fact that the old flag was being
shared across SSDR and ODTR evaluations. By checking the shared flag here,
it appears continuous read is disabled if either interface failed the check,
even if the driver successfully configures and uses an interface that
supports it.

>  			spinand->cont_read_possible =3D true;
>  	}
>  }

[ ... ]

> @@ -1700,11 +1701,11 @@ int spinand_match_and_init(struct spinand_device =
*spinand,
>  				    (read_op->addr.dtr && !op->addr.dtr) ||
>  				    read_op->data.buswidth > op->data.buswidth ||
>  				    (read_op->data.dtr && !op->data.dtr))
> -					spinand->cont_read_possible =3D false;
> +					spinand->cont_read_unsupported =3D true;

[Severity: Medium]
If the SSDR continuous read is unsupported or slower, this sets the global
spinand->cont_read_unsupported to true.

Later, if ODTR supports continuous read, it populates the ODTR template but
does not clear this flag. Could this incorrectly prevent ODTR from using
continuous read?

>  				else
>  					spinand->ssdr_op_templates.cont_read_cache =3D op;
>  			} else {
> -				spinand->cont_read_possible =3D false;
> +				spinand->cont_read_unsupported =3D true;
>  			}
>  		}
> =20
> @@ -1736,7 +1737,7 @@ int spinand_match_and_init(struct spinand_device *s=
pinand,
>  			if (op)
>  				spinand->odtr_op_templates.cont_read_cache =3D op;
>  			else
> -				spinand->cont_read_possible =3D false;
> +				spinand->cont_read_unsupported =3D true;

[Severity: Medium]
If SSDR supports continuous read but ODTR does not, this unconditionally se=
ts
the global flag to true, overwriting any successful SSDR state.

Does this cross-contaminate the state and incorrectly disable continuous re=
ads
for a flash chip that supports continuous reads on SSDR?

>  		}
> =20
>  		return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007-spinand-co=
nt-read-supported-v1-1-411facc04d99@kontron.de?part=3D1
