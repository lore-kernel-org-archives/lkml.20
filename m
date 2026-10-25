Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.233.101.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792924336;
	b=MXEqmFZJ+/t3LgIJRzZmM8meeLh1/rmndxB74ACjekXW8gUCQ3ulr97lHxCRTlBaP34e
	 4DBqPORPO68F28qi7QnLiE2uvSUKTx5cmAaPhicxdDG5KAKbs3LAOWlLRutC3XeZjDnl4
	 V8Yzp4QDqMWpGDFdMbraQz8wOl/tymyuXAsycTcDrcfUQaOKfeAWmrxCn6Ch4FYqKuisN
	 lKwipignDK9cMNgGf0rqeJsidch2imjJjDmYeutaK9I+kRQlpdq3raACaJ762KVcav3TX
	 OEpm8xfentkCUBumeye8imrQv6QlNEUKott/HErZWkSJ07VlQqGfG+QqeZxhXJwg/cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792924336;
	h=DMARC-Filter:Received:Received:X-Spam-Checker-Version:X-Spam-Level:
	 X-Spam-Status:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=W8I6eZPNeQyfIA2MHqpnCAXBcywuCKbuTriES8lpKTM=;
	b=dxkd5/tnTsFK9YfLjtHM02/GSdPldRLIVRjEAJm4dpc5VbwrwMwSp+jpkHMIXyXY6WZ3
	 3n+4McJaf97GNtFPHgCvUUIO4sbm8kW6Ln/hBxG4yJq7ZedKN72IeY/FwRKV6hPwZ+N9O
	 cT8kU/pwULNR1y6drRFhF+IeOqk9RHmJ8iJ6zMbFJrxDR6M26CFViX4nLw23i5QM6bSJt
	 dLhXyJbWIQacLPcF2Fpw2sT4E9TxkQ4cVIZQMkIePGUdkMhZb6FZqeY0XEgKcLInsMt8h
	 LrPbGkuUIVEVwYmwB4ZbLxbVshnFBXk/hrNUnz9e9op9OhqFwc3q9MG33mj9KWEBjqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sys-base.io;
	spf=pass smtp.mailfrom=sys-base.io;
	arc=none smtp.remote-ip=185.233.101.22
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB367606A31A;
	Sun, 25 Oct 2026 10:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB367606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 2E8183700F64;
	Sun, 25 Oct 2026 10:32:02 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 2FD3EB6CD17; Sun, 25 Oct 2026 10:32:00 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 752CAB6CD17;
	Sun, 25 Oct 2026 10:31:58 +0000 (UTC)
Date: Sun, 25 Oct 2026 11:31:56 +0100
From: Paul Kocialkowski <paulk@sys-base.io>
To: Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
Cc: mripard@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: cedrus: fix typo in comment
Message-ID: <at3anD2TX8iQZ6Ws@collins>
References: <20261007140056.7447-1-contatocaio.ferreira7@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="odmBEKKySAXLue9n"
Content-Disposition: inline
In-Reply-To: <20261007140056.7447-1-contatocaio.ferreira7@gmail.com>

--odmBEKKySAXLue9n
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Le Wed 07 Oct 26, 11:00, Caio Vinicius Ferreira a =C3=A9crit :
> Fix a spelling mistake in a comment: Neightbor -> Neighbor.
>=20
> Signed-off-by: Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>

Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
Acked-by: Paul Kocialkowski <paulk@sys-base.io>

Thanks,

Paul

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h265.c
> index 780da4a8b5af..f57642c0d8fa 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> @@ -755,7 +755,7 @@ static int cedrus_h265_setup(struct cedrus_ctx *ctx, =
struct cedrus_run *run)
>  	}
>  	cedrus_write(dev, VE_DEC_H265_SCALING_LIST_CTRL0, reg);
> =20
> -	/* Neightbor information address. */
> +	/* Neighbor information address. */
>  	reg =3D VE_DEC_H265_NEIGHBOR_INFO_ADDR_BASE(ctx->codec.h265.neighbor_in=
fo_buf_addr);
>  	cedrus_write(dev, VE_DEC_H265_NEIGHBOR_INFO_ADDR, reg);
> =20
> --=20
> 2.56.0
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--odmBEKKySAXLue9n
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmrd2pwACgkQhP3B6o/u
lQyZzhAAjpLJ/LCS9ud2LmKBfIDoSIa36gfGD9iUB8J1/bgqENht/+QvFN/62jVi
gAf0nT1W0HrQ2TIiFwdhhNnphU6VJUfI0C9Z+SpqAoKXf3j+qj34ZPpsSd+thEUB
4HObZyKK5px6YWkHL1XekYjdbCjh2T6HZ6UTt8rZxR7V5RIFq4QKNZHN/myhUk5X
X4IqbHpjD9zeD+9TH26kRbc4xlfMXiyfM88YkEWks8dMchnL+h69TOdk91I49y/H
0wYthqG/WZsqNptz+z0ra6o8esqzgewhCTzNaFcb9GlIBG9gxhWAXi5w8HltGvmr
DvfdXEj1ENFsiAy94HUstuTjG/76BOFiLHHrGle8u/Yi4iNu3rKVngmrcfltTqhP
LVB2sqaiHYUH2tpNTv4UXmHbyhMTIA0jF/QW+I/p/2+Uv5dxIgLkwWMGfXZMojfm
jAaaaA9h1GIkgPN6Sg4O2wn+g3YVTK3GVSBhwtE0D/KQMjsHv3HCZFSMQm6oYibv
ZSS65D9RiGtg98h7zaFz7+bX01ZlAw5NRc4bbTPpweGFFX+0cidtdhMx9z5gw4wP
fWbMP4DDoiCNPsjiW4CFNow0elBgsdn/WaW8lFtQ/WoGitoGArpT6iOlLLDRKOsN
oSBIGryhLuvhFKe+8WNjHfWppj8Q/RVYN/vkE65Y0C8QEeDmsf8=
=b2qN
-----END PGP SIGNATURE-----

--odmBEKKySAXLue9n--
