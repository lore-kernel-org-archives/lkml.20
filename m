Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CBB509EFB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789059256; cv=none; b=Ob8dXsbSdj9oWi3Ggh+vgM4sHVSIZRn4vGVOBPAdCWR8Kf+njklmZO7oB/UNzjwNhWact3NCpKgfcoJK7r/urp3f9K1YYi453O8xfOOL5pFgEepVtdVauYNdOKAFARu5Ww9ZUxYPJui58RxRivZcUt1Yt7W1U8rNQISmuWUVXEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789059256; c=relaxed/simple;
	bh=SeXtJOhk48uAkoLzjL1gUFuRX4LPonktItnBO0lVlGY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=APebfoOjBr4AoG9fWhUZY+/QnmXGCm2SiiKubd61kZ09w9PX6txm/6sj9KfTb5YIpFxFKs2v1Cmx7adq6uBOQ0gN2NWE9Y59HW3qcXoCrSafjO225d02fyNlpytwyv57ZO7POis0UXNiNzvdh93FGWV7BhrTqooGZvlr9ddgBbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OpzUPq5x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OpzUPq5x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7BCD1F000FF;
	Thu, 10 Sep 2026 16:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789059255;
	bh=5GI8suLmLX0X8AuwQVVSjbap4BDzNlVQVLu6TfgyQVI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OpzUPq5xMQ37fahQOcL/f/B0zfr9B+XXAJhvNTALr0u71KgQU8d5eDeJ2dD8B622Q
	 i0KSk8B3kRDugxaIreFbdwK8yEOVfEoxgb1sWeH1QE5iWfc85xSbvQh95GIwOJmW84
	 UZMxlerPD0V6d9cJA1to0uJkZm1Mtmv1yII1Vk+0CHX4F6eWTbqKADE53iNEitGij8
	 WzkkCdpTDGf2UtT5Pi1ymHOmwlnjJfL+yZdkyTz5JQBGOiyxazgwK5zAiFOTkiNU5g
	 j88U7KDwJ36na7qR3Af7ttRsEDe8lmp29Fuvn9uWPUineuzL/IbqMtjQRVYlBAvjZ8
	 nJOkwc38qJ3vA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mtd: spinand: Do not update the QE bit on devices
 without one
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sagnik Sasmal" <sagnik@sagnik.me>, miquel.raynal@bootlin.com
Cc: vigneshr@ti.com, richard@nod.at, linux-mtd@lists.infradead.org, mikhail.kshevetskiy@iopsys.eu, linux-kernel@vger.kernel.org, tudor.ambarus@linaro.org
In-Reply-To: <010701a08c36e962-eb595dbe-b80b-44eb-858d-c1033f8a86a1-000000@eu-central-1.amazonses.com>
References: <878q59s2iv.fsf@bootlin.com>
 <010701a08c36e962-eb595dbe-b80b-44eb-858d-c1033f8a86a1-000000@eu-central-1.amazonses.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 16:54:14 +0000
Message-Id: <20260910165414.A7BCD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Uninitialized return value in `spinand_configure_chip()` can cause=
 device probe failure.
--

commit 25afeaf20864d4f79fe9a314c125190119930965
Author: Sagnik Sasmal <sagnik@sagnik.me>

mtd: spinand: Do not update the QE bit on devices without one

This patch moves the call to spinand_init_quad_enable() inside the
SPINAND_HAS_QE_BIT condition to avoid clearing configuration register bit 0
on devices without a QE bit.

> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index 43bbe2629b85b..e59581d3596b7 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -1813,11 +1813,11 @@ static int spinand_configure_chip(struct spinand_=
device *spinand)
>  		    spinand->ssdr_op_templates.write_cache->data.buswidth =3D=3D 4 ||
>  		    spinand->ssdr_op_templates.update_cache->data.buswidth =3D=3D 4)
>  			quad_enable =3D true;
> -	}
> =20
> -	ret =3D spinand_init_quad_enable(spinand, quad_enable);
> -	if (ret)
> -		return ret;
> +		ret =3D spinand_init_quad_enable(spinand, quad_enable);
> +		if (ret)
> +			return ret;
> +	}
> =20
>  	if (spinand->configure_chip) {
>  		ret =3D spinand->configure_chip(spinand, SSDR);

[Severity: High]
Does this code leave 'ret' uninitialized if the device lacks both the
SPINAND_HAS_QE_BIT flag and a configure_chip callback?

Looking at the rest of spinand_configure_chip() in drivers/mtd/nand/spi/cor=
e.c:

static int spinand_configure_chip(struct spinand_device *spinand)
{
	bool odtr =3D false, quad_enable =3D false;
	int ret;

	...

try_ssdr:
	if (spinand->flags & SPINAND_HAS_QE_BIT) {
		...
		ret =3D spinand_init_quad_enable(spinand, quad_enable);
		if (ret)
			return ret;
	}

	if (spinand->configure_chip) {
		ret =3D spinand->configure_chip(spinand, SSDR);
		if (ret)
			return ret;
	}

	return ret;
}

If neither condition is met, it appears the function will return an
uninitialized stack variable. If this stack memory holds a non-zero value,
the caller spinand_init_flash() may treat it as a failure and abort device
initialization.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/010701a08c36e962-eb=
595dbe-b80b-44eb-858d-c1033f8a86a1-000000@eu-central-1.amazonses.com?part=
=3D1
