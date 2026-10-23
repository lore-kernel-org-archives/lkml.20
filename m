Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792747856;
	b=KbiHuZ1AgWvE0MIZnd9I72US/0X754eMYnL2o/t9TMTQHi+bRqgnO8R4md1RY5gz0WFe
	 g847PcytVmO5pQsgHdFek3WddFYq4Sh1qlIMkAMraDmQaKxojie5MkaD5r1Q7dJ8wjJsX
	 TDl2HxLVjCeX7yJMws9kE/WBaAJTXRXt7oE3oJ8YnCxOFBt5CaXdtq9lYgg2Jkd+vDBYf
	 i+f3vtPD0QAAu/BvUovV0EHtyhrz88d0pAb/Z4GlP2mmaJssOxN3eYXTrO2+rB8hLFCbV
	 WmCLFWYrRyk2xcT8J+fInrUvbLL+SWxEuJi57paygvsThD21qyODphO8ibboGp+RQPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747856;
	h=Received:DKIM-Signature:Mime-Version:Content-Type:Date:Message-Id:
	 Subject:Cc:From:To:X-Mailer:References:In-Reply-To;
	bh=tCYx7L2FNRpKZU6qBFW+ZmUHPGXqSze/QEf3XRwSkfs=;
	b=BAvkDNd38hTq55XqVdwVl42Vvz10gkR1QPEe0CAU0VhHq1UPVhzmXrtbaKuUxXjn5MEq
	 MohCASxh2+nwyxWqB0tLyzIWzvFLGMzUsCU8h5+uwmV3T3/GS72YjfA+4fWo2oZ47/9kA
	 LkO9i/Cpe9Gt8T4+yr6MZpgohKYTqHVkXxqMSI1gPHEcbjNzm/WMhu1tZVr2iYlfsaY8a
	 Pww5MqgiHFh92KglIUvQSxTb1YhUVEgpeqCQtkC7SY+LvJH130VDXLv4d/BtRdpT5QgMZ
	 tUKW+a3VwNKTGP6hJdOCIPOtwujsD2r1TNLmzx2CO5QHAmHk+crIK6+F0aYIav8LwgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eIPlh+81;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id A00DC606AD2D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eIPlh+81
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id F346E1F01201;
	Fri, 23 Oct 2026 09:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792747856;
	bh=tCYx7L2FNRpKZU6qBFW+ZmUHPGXqSze/QEf3XRwSkfs=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=eIPlh+81Vo0shpmUy36iplQPH7JbhU3dQhpgZsXogTA1MbB8IsyVrcGAWLwJmjryi
	 uEtRBEVZRLP2HT+Q5xgEjpMhkeKBiVkH8nKxaU29o/ztHqNA3Pkl+wQpaXUs5YDQKS
	 ncnp6BMm+lDeiuIJBle54xbxSBEx3nOov/HTnV5QsWOLIyq6eIhr4eUaf3z/Z5bGRW
	 BrhuVzUPVWUZCPQCQxVWpiEr8So+h2FOYWzEFsnhxzE2YQw5SCS4/nf7Dc+j+t58ko
	 0x2FpmryQlKHa3m4bTFZTpFcHg8hZHNlZc1cMRulkN9NepWqhpXZVBxuocMh5C8Gao
	 YIakbUbvSmn9A==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=9be7ba2c64a95e1a6709d5c62a9d871f17cb2ae09dd7b470022be5930c1f;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 23 Oct 2026 11:30:52 +0200
Message-Id: <DMC42PZGE0L9.25VCSYHXHMN9L@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: fix missing space after comma in legacy
 flash names
Cc: <pratyush@kernel.org>, <takahiro.kuwano@infineon.com>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Shuai Liu" <847807867@qq.com>, <linux-mtd@lists.infradead.org>
X-Mailer: aerc 0.20.0
References: <tencent_760494FBADB4184B967C5A93312EB198F506@qq.com>
In-Reply-To: <tencent_760494FBADB4184B967C5A93312EB198F506@qq.com>

--9be7ba2c64a95e1a6709d5c62a9d871f17cb2ae09dd7b470022be5930c1f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Oct 23, 2026 at 11:24 AM CEST, Shuai Liu wrote:
> Add the missing space between string literals in the legacy
> flash_info entries. Cosmetic only, no functional change; silences
> checkpatch ERRORs on these lines.
>
> Signed-off-by: Shuai Liu <847807867@qq.com>
> ---
>  drivers/mtd/spi-nor/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 8bc117b46..31cba60bd 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3898,11 +3898,11 @@ static const struct spi_device_id spi_nor_dev_ids=
[] =3D {
>  	 */
>  	{"at25df321a"},	{"at25df641"},	{"at26df081a"},
>  	{"mx25l4005a"},	{"mx25l1606e"},	{"mx25l6405d"},	{"mx25l12805d"},
> -	{"mx25l25635e"},{"mx66l51235l"},
> +	{"mx25l25635e"}, {"mx66l51235l"},
>  	{"n25q064"},	{"n25q128a11"},	{"n25q128a13"},	{"n25q512a"},
>  	{"s25fl256s1"},	{"s25fl512s"},	{"s25sl12801"},	{"s25fl008k"},
>  	{"s25fl064k"},
> -	{"sst25vf040b"},{"sst25vf016b"},{"sst25vf032b"},{"sst25wf040"},
> +	{"sst25vf040b"}, {"sst25vf016b"}, {"sst25vf032b"}, {"sst25wf040"},
>  	{"m25p40"},	{"m25p80"},	{"m25p16"},	{"m25p32"},
>  	{"m25p64"},	{"m25p128"},
>  	{"w25x80"},	{"w25x32"},	{"w25q32"},	{"w25q32dw"},

Well, that is because they are aligned with all the other entries.
IMHO this is just unneeded code churn.

-michael

--9be7ba2c64a95e1a6709d5c62a9d871f17cb2ae09dd7b470022be5930c1f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCatspTRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jxuQF+MPmLCsn/qD564wFCQ3yZO71xLqbE2u5n
kAu9LlAOmbkkKL+klaIOxRQbzKDPOUkCAYCmijTAryi287lsr1FFvdc9T8Pdbywq
Weh6udZPUd2TK24yTspztZ00E4JDeCiNW3A=
=rj7B
-----END PGP SIGNATURE-----

--9be7ba2c64a95e1a6709d5c62a9d871f17cb2ae09dd7b470022be5930c1f--
