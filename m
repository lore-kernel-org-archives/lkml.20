Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CE14D17A0
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789730983; cv=none; b=fCBIR+9QASTVcwxAcMRGSfw8nwskdzCmGdPHPUEQXd1hV3hqPFZSzryNxsbD/WwChIvm0I7aP0oTwFbhgRhZl3NVXyhP+PnnfrOGCxQCJPvfb+NHiWBO1pGp56LW/HhXNRAT3dVw7EhkNrDaYPE5EgkTaL/7cMjGjjrvvtfR5R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789730983; c=relaxed/simple;
	bh=lT1oHhg7W9EDrR7St2fJN1eSDvOKtBjijOvny49n+nk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=f05zlais0FVOY9f3FJjxLD2BVxZ0jMJk18auz60wbiRG5RxNmGnhCoyL+uwS5lA9sSIIfvZeO7wyvq6Mh683xG5yn9OleFGzmB/PQBeTAUoC1ExG/y5qJKgF5lRx6sitTTUBQ0Fl33FR4MJqjvIPYitYKFnxfOwQah+2c+aT55Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kFbN1KIQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kFbN1KIQ"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 482DD1F000FF;
	Fri, 18 Sep 2026 11:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789730981;
	bh=Va5Amt0hl9nFtXROENx/Xu/NwtB1ulS7dWCgJ5WWNBg=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=kFbN1KIQHlA6GA2EPXzYOdvBRhf5uaQ0xFdBCdTmsmw6T0MjXO/pro1zVj4eNWH5g
	 A2reavg37V00/Tk7LemTAAr4etANyxcpkx8Cc7o9XN/GoS8YeBvAus9ZRNqF439kbr
	 JUhkGQ8p4Z9JaiMh6K/DtowFC3wYqqJ25TX++VGcSW3LUK3fNg7vdDpKjg8geVzmah
	 uY797LkDRNEQOaNphpuF89e45Ra4VGZnx8qNrnt8LCCSfb3Ro7R+SBdLloMGwWuAQR
	 RWdSXh5XDPRZmNFra0YEAysa86d8e7oHEm41yq1KNEeCdZXxAXiSKIVH1HgjRPLl6Y
	 VnsqLttVMBgHw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=0726a63f4f0dd6365877f391c5c8b973f3469d7b127998ee89f778e734c5;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 18 Sep 2026 13:29:24 +0200
Message-Id: <DLIEOELQERRM.21J9WHMJHGYEB@kernel.org>
Subject: Re: [PATCH 00/25] mtd: spi-nor: winbond: Cleanup JW family, add
 support for PW chips
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Steam Lin"
 <STLin2@winbond.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>
X-Mailer: aerc 0.20.0
References: <20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-0-c1b20c39dd1f@bootlin.com>
In-Reply-To: <20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-0-c1b20c39dd1f@bootlin.com>

--0726a63f4f0dd6365877f391c5c8b973f3469d7b127998ee89f778e734c5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Sep 9, 2026 at 5:25 PM CEST, Miquel Raynal wrote:
> Compared to the previous ones, this series is super straightforward
> since it leverages all the core changes that have already been done for
> the JV/RV families. Like the former JV/RV series, it first cleans up the
> table for JW chips. As I have access to a lot of devices, I made test
> runs with almost all of them. This way I could extract the SFDP data,
> the capabilities of the chips, proof that they passed all the tests,
> etc. I then add support for the PW parts, also showing a full test run
> in each case.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> Miquel Raynal (25):
>       mtd: spi-nor: winbond: W25Q32xW-Q/N: Enhance identification of the =
chips
>       mtd: spi-nor: winbond: W25Q64xW-Q/N: Enhance identification of the =
chips
>       mtd: spi-nor: winbond: W25Q32xW-Q/N: Fill locking information
>       mtd: spi-nor: winbond: W25Q64xW-Q/N: Fill locking information
>       mtd: spi-nor: winbond: W25Q128JW-Q/N: Fill locking information
>       mtd: spi-nor: winbond: W25Q32JW-M: Fill locking information
>       mtd: spi-nor: winbond: W25Q64JW-M: Fill locking information
>       mtd: spi-nor: winbond: W25Q128JW-M: Fill locking information
>       mtd: spi-nor: winbond: W25Q256JW-Q/N/M: Fill locking information
>       mtd: spi-nor: winbond: W25Q32JW-Q/N: Add quad page program capabili=
ty
>       mtd: spi-nor: winbond: W25Q64JW-Q/N: Add quad page program capabili=
ty
>       mtd: spi-nor: winbond: W25Q128JW-Q/N: Add quad page program capabil=
ity
>       mtd: spi-nor: winbond: W25Q32JW-M: Add quad page program capability
>       mtd: spi-nor: winbond: W25Q64JW-M: Add quad page program capability
>       mtd: spi-nor: winbond: W25Q128JW-M: Add quad page program capabilit=
y
>       mtd: spi-nor: winbond: Prepare introduction of W25QxxPW-Q/N parts
>       mtd: spi-nor: winbond: Add support for W25Q33PW-Q/N
>       mtd: spi-nor: winbond: Add support for W25Q64PW-Q/N
>       mtd: spi-nor: winbond: Add support for W25Q12PW-Q/N
>       mtd: spi-nor: winbond: Add support for W25Q25PW-Q/N
>       mtd: spi-nor: winbond: Prepare introduction of W25QxxPW-M parts
>       mtd: spi-nor: winbond: Add support for W25Q33PW-M
>       mtd: spi-nor: winbond: Add support for W25Q64PW-M
>       mtd: spi-nor: winbond: Add support for W25Q12PW-M
>       mtd: spi-nor: winbond: Add support for W25Q25PW-M

I've just noticed, that neither lore nor my mail server received all
your mails and there are missing patches.

Could you please send a new v2?

That also means, I've haven't been able to review patches 2, 5, 14,
15, 17, 22, 23.

-michael

--0726a63f4f0dd6365877f391c5c8b973f3469d7b127998ee89f778e734c5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaq0glBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iX5AF+PS85p3AOUowIAsYbLtfG5h9Q94/qnStJ
mvTpabepC1yB9CmG/9V2VWRJhsWtvT0rAYCufaMN5ahbBpNdo2sziRLXt4Y8wZ+f
X6857+M8ikMb9WT4zj7k91L3gU6RnfbTPOY=
=16m/
-----END PGP SIGNATURE-----

--0726a63f4f0dd6365877f391c5c8b973f3469d7b127998ee89f778e734c5--
