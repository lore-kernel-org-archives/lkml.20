Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794443248;
	b=5g8UakZSoYDtdvU+ZFL3zLjZPIQuuA1vZFYuJNs5XgTNQWrdInTAwPpfU55qRBPHC3VZ
	 MAJVX/iIOirBmcfonaR0vecoFrwelfl7grdcgYRaLDev+hE0CIiLKnqvHa+wrOAbdqAtK
	 ertk7XbVxQuBbhSYAdKGgrh4Z5snGHo5AQ+cTpfE+oGThJ6yfbeEWyvRkSXZp7hYnbC2D
	 BfFb4XGmw3fXqS9lGODORlIBEZ5AsGuHvpbZO7OrjorHCeEYtOosgJ1woiHMO4mlN60qM
	 klqAr0NMm1y66DqNBrWpLgt9OCaQ/ThoFVtMP8s6t2Ifw/tJImUsnmF4Kxf7+NdRceA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443248;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp:
	 X-ZohoMailClient;
	bh=GNf62tlfKk2RqLqLMlYG6wDc1/oZ2jd//U0ZTkJvYmQ=;
	b=jO5bwRoYAj0BGLIopIJ3y0/i/2ZFDyR/C497ZxhL8/UbLKK46cGg88oiTqgnoLbDmaoM
	 mthvhGfzLw1BMU73/3R06W1UqXPAcGDDstT8OR3SU3bonZOARV1YT/gXKcFYpuPeYVfBN
	 8PhoVBQA4Zs0b1EC01vnNLZuuFzXhJFoEQGvKKS9NZzXKAuqWeZRgE4WuDjv1Noc2l7SD
	 0O/xlz2hMtVKM8aQMcbm26mYfkTzxtzqiRvYynNW0MS6Ut1/069tLXrovtP7FVOtnGNoE
	 VtrECvKMZOKhQTtqiUcqyohljuNP3Yvr1ZXh/mL9SkZp0UGPaYRlkrz9r+Mo79lRX8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=a7cCPrDn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DA3606A31C;
	Thu, 12 Nov 2026 00:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67DA3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=a7cCPrDn
ARC-Seal: i=1; a=rsa-sha256; t=1794443241; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QQiIZ4wkcrUZ8Q31LHrYUyKETf383N6C8kbwlGYimCrDDNYcPKkRRiOyKgKqTIS6UlW+hTCIaFz55vqG3NHzkK+iD6cRtqiWSeAjSQfZWzByph8yuFMKn4CBdF5ji6+Groo5asNYMU3FWPeV3lN95lMyHEF9lvSgDtzHuEtr1vM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794443241; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GNf62tlfKk2RqLqLMlYG6wDc1/oZ2jd//U0ZTkJvYmQ=; 
	b=eLyrMXRlgKCxJsw4CgE7hy1cX05BgCDGUHoitWOBizxbyK5s0wsOZ6/Aps2BoXu2mkaVBtajHnzOeYU8J5RTtI0QI3pW1WTBcgZZxCeT0YBMzH63YrX+sKGlpZJMXCMpRbZw8hQZiJ9g071fL/Y6b++JqJeUtjmPdkfOGQKhZ8g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=a7cCPrDnUSMSlfqG7ad0k2vtyMv3nY2I4+WI3JQ442/O6mZvzXJLWAe3l9xQjae2liprG6+n+EfreJeGxrg6VCSaeoRw72fXLG/cD2Iz3bK0e7h7a/OG5yim6ddXO6/ERsqGOOb6oJCl1X3ugRboIbUQ7ultM9Mhqq8uwSSZuO0=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=GNf62tlfKk2RqLqLMlYG6wDc1/oZ2jd//U0ZTkJvYmQ=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794443240705650.4648776249144;
	Wed, 11 Nov 2026 16:27:20 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 76628180BC0; Thu, 12 Nov 2026 01:27:17 +0100 (CET)
Date: Thu, 12 Nov 2026 01:27:17 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Alexey Charkov <alchark@flipper.net>
Cc: Badhri Jagan Sridharan <badhri@google.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	RD Babiera <rdbabiera@google.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] usb: typec: tcpci_rt1711h: Enable SOP' communication
Message-ID: <avUHy1y8ik_qmzHM@venus>
References: <20261103-husb311-cable-comm-v1-0-6217dabc1a85@flipper.net>
 <20261103-husb311-cable-comm-v1-3-6217dabc1a85@flipper.net>
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
	protocol="application/pgp-signature"; boundary="ibp6kjttaa5v7lwv"
Content-Disposition: inline
In-Reply-To: <20261103-husb311-cable-comm-v1-3-6217dabc1a85@flipper.net>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.427.16
X-ZohoMailClient: External


--ibp6kjttaa5v7lwv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/5] usb: typec: tcpci_rt1711h: Enable SOP' communication
MIME-Version: 1.0

Hi,

On Tue, Nov 03, 2026 at 03:21:24PM +0400, Alexey Charkov wrote:
> These TCPCs transmit and receive SOP' as the TCPCI specification
> defines, so let TCPM discover e-marked cables through them and learn
> their current and speed ratings.
>=20
> Tested on a HUSB311 with an e-marked 5A EPR cable.
>=20
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

>  drivers/usb/typec/tcpm/tcpci_rt1711h.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/t=
cpm/tcpci_rt1711h.c
> index af8356df6b98..232eb721fb3d 100644
> --- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> +++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> @@ -337,6 +337,7 @@ static int rt1711h_probe(struct i2c_client *client)
>  	chip->data.set_vbus =3D rt1711h_set_vbus;
>  	chip->data.set_vconn =3D rt1711h_set_vconn;
>  	chip->data.start_drp_toggling =3D rt1711h_start_drp_toggling;
> +	chip->data.cable_comm_capable =3D true;
>  	chip->tcpci =3D tcpci_register_port(chip->dev, &chip->data);
>  	if (IS_ERR_OR_NULL(chip->tcpci))
>  		return PTR_ERR(chip->tcpci);
>=20
> --=20
> 2.56.0
>=20

--ibp6kjttaa5v7lwv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmr1B+UACgkQ2O7X88g7
+ppRhw//XrjHVBFnOoOQqJq55OAGjwuREYjNOyPCt0LUoXAdtSbpckkzOcYA5Jg2
TjJi/sEH+GTJ4vtJ8xFRPfSv63YF8uSNCGphCAyDvGyAjbBpqzdAU4YMjOFuhGHK
LVpRqYeKk5qmbd8xPF2H3B84ohj3WFhIr+zlZTkDoIAciQSN597A5jMhvFHgPS8U
PH3zvkq1SHJr5IT09pBDQPeWVNYK+zKemWINFDZ3bR669gdgx+bfsDce9HI54DgV
gfyRddsp8jMZPx0XDlo7Q61jmfoRfP5HhonCivA9UUCXzaosX4VvECMcc2WwnOHj
8vlQTrYYxiy5UqwthfsAhzxC4NqQQRlg7NbG1Cgro+fq2a7cJ6N2Y35+BC8kKu24
OP5Gim+Da8EFO59BIwP6IlCy7qsGuGTXHiP8Y0ceYBZ8mZZkli7QdgSNC1C8ZaCL
Blo/02K4zHBY9aCSTCEaxTR7qW7tPEufTpQ1mkkH6hmBIZri/cfiYNnMt4F/aLwy
1TG1JAyw1bVXvet4VEyNyJNYdCC88DrSbRv0Q7jhLYE2v3ztJGH1Nu2H/L1c0ZdV
PmEHh2aJ73KsJQPaeHhKDKEfDxiiIhuqXd9s8iWsV7wXiSaoWOGiaW2QOjBHc8vi
oIAcmrrhGAX2mg4VwEiY8q8G6gn2LbdVvIgjFfI/xLxA89Et/Hc=
=Euuy
-----END PGP SIGNATURE-----

--ibp6kjttaa5v7lwv--
