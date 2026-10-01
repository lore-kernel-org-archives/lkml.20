Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC2A2165EA
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859638; cv=none; b=hj66R2Un/d0ISS+ofq8MCchm1vLKM1/PGgMiADsAGcsYo3dyiUrTJRXna2dwV+TktfrNPf0PlmSnOc+UeoJ+rEiUzUqfz9ds66eo4o8tLv9p1ikY1i/grPMJ3MjZR4mozwEiLfrC7TxFQiD78SI811UuQfRCcDN50DZxwjJHDl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859638; c=relaxed/simple;
	bh=OsBioESreutEkenU5Rj3Rpf0LWL3uWrOxa5Yy8wFa5E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i1roZUIW23Qq6f84ayiloy0DEwQRoVMb9jA2nW3B9w99H5x+Zapqgzp6LK7A7ZVRhzNvFPNerqeIVQSMN7gKleugFLHvuFD/5X2xr/DEr+C3Ox8eqVjZHs/VyVbWJBx7YcUhFrPeWLRJG5mMWQVzIv05dnm5laiphGj7rLh8fw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZbauWf7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZbauWf7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E271F000FF;
	Thu,  1 Oct 2026 13:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790859636;
	bh=LGaKmgoYbC9tX3H+VvmhJMVa26GkXwY064QKAVbiwy8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JZbauWf76eclXen/YfQBxGU4aSrjavEChW5j1BmgqDhsd5ph2PHVldSd766rvu6U5
	 j+5ybxTDF82FW2yiyf/t8uPwpbBGnkYxwTWXSlb+w72w1D6JMbYP2iDVgsYymwKjUn
	 WIoNiCIb4+IUyJ6ru7EahQhEftE0nMzh1PMoJ1M7zDsm+ZbEQmPwiid4KaarvpWBfu
	 q70EKqcNrWfh6XdB9OBt7d/ljA4T4yMjQZPorzGubJAjDGr3lVjPBVaNxwyDgXgcBK
	 lbx4RBhk2r2Pn4e9QxlNoPB7iFwS80vnyCBJpMtPW0PoP+x6gt2m5P6XSXEvxJoXCd
	 7MCSJN4IFzppA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2] drivers/mtd: rawnand: nandsim: Fix stale
 NAND_ROW_ADDR_3 with overridesize
Reply-To: sashiko-reviews@lists.linux.dev
To: miquel.raynal@bootlin.com, yamada.masahiro@socionext.com, vigneshr@ti.com, wenyou.yang@microchip.com, bbrezillon@kernel.org, "wang
 wei" <a929244872@163.com>, richard@nod.at
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261001124733.43559-1-a929244872@163.com>
References: <20261001124733.43559-1-a929244872@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 13:00:35 +0000
Message-Id: <20261001130036.44E271F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] mtd: nandsim: address cycle mismatch for 256 MiB / 4096-byte pag=
e devices
--

commit d11867536ecbb0d0243c052069d60f5f1a2c4afe
Author: wang wei <a929244872@163.com>

drivers/mtd: rawnand: nandsim: Fix stale NAND_ROW_ADDR_3 with overridesize

The commit fixes a stale NAND_ROW_ADDR_3 flag by re-evaluating it after
changing the size of the simulated device when using the overridesize
parameter. It updates the flag based on the core logic: chip_shift -
page_shift > 16.

> diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsi=
m.c
> index fe968037f75a2..ac82dd7e18a93 100644
> --- a/drivers/mtd/nand/raw/nandsim.c
> +++ b/drivers/mtd/nand/raw/nandsim.c
> @@ -2359,6 +2359,11 @@ static int __init ns_init_module(void)
>  		targetsize =3D nanddev_target_size(&chip->base);
>  		chip->chip_shift =3D ffs(nsmtd->erasesize) + overridesize - 1;
>  		chip->pagemask =3D (targetsize >> chip->page_shift) - 1;
> +
> +		if (chip->chip_shift - chip->page_shift > 16)
> +			chip->options |=3D NAND_ROW_ADDR_3;
> +		else
> +			chip->options &=3D ~NAND_ROW_ADDR_3;

[Severity: Medium]
Does this logic conflict with the address byte expectation in ns_init()?

For a 256 MiB device with 4096-byte pages, chip_shift - page_shift evaluates
to 28 - 12 =3D 16. This causes the code here to clear NAND_ROW_ADDR_3, so t=
he
core emits 4 address bytes.

However, ns_init() has hardcoded logic expecting 5 address bytes for devices
larger than 128 MiB:

drivers/mtd/nand/raw/nandsim.c:ns_init() {
    ...
		if (ns->geom.totsz <=3D (128 << 20)) {
			ns->geom.pgaddrbytes  =3D 4;
			ns->geom.secaddrbytes =3D 2;
		} else {
			ns->geom.pgaddrbytes  =3D 5;
			ns->geom.secaddrbytes =3D 3;
		}
    ...
}

Will this mismatch stall the nandsim state machine and fail operations due =
to
an address cycle mismatch?

Prior to this change, shrinking a 512 MiB device to 256 MiB left the stale
flag set, which serendipitously matched nandsim's expectation of 5 bytes.

>  	}
> =20
>  	ret =3D ns_setup_wear_reporting(nsmtd);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001124733.4355=
9-1-a929244872@163.com?part=3D1
