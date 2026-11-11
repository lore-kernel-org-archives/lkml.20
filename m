Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794440608;
	b=wWYGXRNt9WpVk/2HNXG11XvwgcN+YbUiBCUbpZl0ozVaMbofMx6Vs2+Muyf4WjEu9S0t
	 cSDKmE4O0rm6PsVMJddn7FqWFlf7p6aitdslxRy/4l+e8UL5aq8C/+jiTmNa9E/RlgM3o
	 oWPm42W7Suqbf2zlrJN/AN7CJzWj5HK0LLFsJINRWNphjL+zCqxNYiuxGU1nUxBK2FEaH
	 +sKHUfNmseVY4QBYG7FJjyfR6O0ZXTMgY+B7yYsR6rhLQRKU0l9Zt8nRlPh5gVRzqZog3
	 db1/O00ar0hPJcfniVDMH40juzONVZGyEv+qGUOZ3We9LYYYdMZjXoqro80PaFG3yAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794440608;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp:
	 X-ZohoMailClient;
	bh=Y0DPhWDGCAl8AXWho1ttYK+VaSR0hirYI/i/ympk22U=;
	b=vmaaXqX+w05fI7JSq9cUKVYqbEQgKEQba6NaKTMnV6rtv2b3xsejlZBjw5n0g7+1APK+
	 IQeaX+p4WvpOueDek+gSNVKrLWir27RDib55BXSins5gSooZOENGjTYAHOxtc/8NZk9Sb
	 wNQGTltkk+4yeS6hym7SjQeJ3S3l3Cgefbq/Yb3ycK14ZJShjSI7MtKFrxi6XMWvmwcjl
	 u9LvAfvYWZsEwgpOoFSLoxmbZeu7qNEVS2ABTb8XfqmtN41FpU5FkXpe0ZK2m//p+1ay7
	 W95ln07/8scHfPDCMH5bJaE3oDCJF0FRJ/6kaNgiNhGZjU7zdv8sRuDJEmvi/NbpxSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=jtlAh+Va;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01675606A326;
	Wed, 11 Nov 2026 23:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01675606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=jtlAh+Va
ARC-Seal: i=1; a=rsa-sha256; t=1794440566; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FHwE49+0n9QYPLepTlh99nmt2+owAv5olRorS8PSn86GXGe04Lw/1bxgw/O3fBE63/4tUylxpQzFBZEC7D3nu1AGynQelZszZ19XdHtjqecNiyoWnwUjZmmmhpaHQkxhC4trC+2+iNM9Q0t749cAWe19Ik9fSFwzcvVvJsRynKI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794440566; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Y0DPhWDGCAl8AXWho1ttYK+VaSR0hirYI/i/ympk22U=; 
	b=FKoUtux3CSTJcCHigGoMB6JMvqYfZSes7IPtJj7eM2E9p5u45OYAmCYlTH/sElDt5yPt7ChIBE8U8aSCVCLY2adpBEu3MHYK0skzAzr4IFoWPE1j9MhuasBJLKIfUU5usc/vnfq22HajEjSOu9/k8TyfzZbtRr0ua6WOKwN71fg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=jtlAh+Va4DX3ctCXwghLOqJRssCbOuJOJWzQExa+sB1tIEEutcCTKwNsL+arsFNVQ6BbfkCOSR/kPFiaGlPcLBO0Zcsf7mGgVm4N5kwkhu2y1xR52CQHBlPywAggY2ouQ7wVK2iHmWVrAYoll9SM+yxM2jDrsI0utr0FX4NV7WI=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=Y0DPhWDGCAl8AXWho1ttYK+VaSR0hirYI/i/ympk22U=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794440564379638.9691780582154;
	Wed, 11 Nov 2026 15:42:44 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 4F506180BC0; Thu, 12 Nov 2026 00:42:41 +0100 (CET)
Date: Thu, 12 Nov 2026 00:42:41 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Alexey Charkov <alchark@flipper.net>
Cc: Badhri Jagan Sridharan <badhri@google.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tcpm: Record the partner's Product Type VDOs
Message-ID: <avT9WdUgL02MXMpn@venus>
References: <20261102-tcpm-product-type-vdo-v1-1-02e90dadbc2d@flipper.net>
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
	protocol="application/pgp-signature"; boundary="v3h6xjzlfvroq4wu"
Content-Disposition: inline
In-Reply-To: <20261102-tcpm-product-type-vdo-v1-1-02e90dadbc2d@flipper.net>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.427.16
X-ZohoMailClient: External


--v3h6xjzlfvroq4wu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] usb: typec: tcpm: Record the partner's Product Type VDOs
MIME-Version: 1.0

Hi,

On Mon, Nov 02, 2026 at 06:21:24PM +0400, Alexey Charkov wrote:
> A Discover Identity response can carry up to three Product Type VDOs
> after the Product VDO, describing what the partner is as a UFP, DFP or
> alternate mode adapter. The Type-C class keeps them in the identity and
> shows them as product_type_vdo1-3, but TCPM stores only the ID header,
> Cert Stat and Product VDOs of a partner, so those always read 0. Cable
> identities already get their VDOs.
>=20
> Store the Product Type VDOs as received and zero the ones the partner
> does not send, leaving their PD revision specific layout to the reader.
>=20
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

>  drivers/usb/typec/tcpm/tcpm.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index d721baef5210..8fd6b1f842b3 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -2064,6 +2064,7 @@ static void svdm_consume_identity(struct tcpm_port =
*port, const u32 *p, int cnt)
>  {
>  	u32 vdo =3D p[VDO_INDEX_IDH];
>  	u32 product =3D p[VDO_INDEX_PRODUCT];
> +	int i;
> =20
>  	if (cnt <=3D VDO_INDEX_PRODUCT)
>  		return;
> @@ -2073,6 +2074,10 @@ static void svdm_consume_identity(struct tcpm_port=
 *port, const u32 *p, int cnt)
>  	port->partner_ident.id_header =3D vdo;
>  	port->partner_ident.cert_stat =3D p[VDO_INDEX_CSTAT];
>  	port->partner_ident.product =3D product;
> +	/* Product Type VDOs, if any, follow the Product VDO */
> +	for (i =3D 0; i < ARRAY_SIZE(port->partner_ident.vdo); i++)
> +		port->partner_ident.vdo[i] =3D VDO_INDEX_PRODUCT + 1 + i < cnt ?
> +					     p[VDO_INDEX_PRODUCT + 1 + i] : 0;
> =20
>  	if (port->partner)
>  		typec_partner_set_identity(port->partner);
>=20
> ---
> base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
> change-id: 20261102-tcpm-product-type-vdo-af873ef1fdf4
>=20
> Best regards,
> -- =20
> Alexey Charkov <alchark@flipper.net>
>=20

--v3h6xjzlfvroq4wu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmr0/XAACgkQ2O7X88g7
+poxuQ//Z6pr81dPA9c2GQT/w+mm2cVFbGVgCXMw23o/NYRD9kraTBU9hZA3Lkra
tCrglt7pj2yvIk1ocjQx1x3F3BkMpEx3qFAKkbdFp6ZYseaF94WAWoVBeV7dtDXb
PdcCICI93qja77tvChk6GCQfcU+ynAkbWHR+bA4FMRY3+m1Ty20agprkLXw9uHTX
u6DJTWvBq9vvUpnBgwdkIiWGr7xULbjK90IzqwUR8jeaWX0FlQBE1JXW8xRB13k5
a4PcPHnI47HunyciJFa9yfweln7qKc92Ldv/U/zhPmY9RXVS/Nc48S2caQ6Ya5+r
V0aff0Q5deQINAqcRJtmEEhfvXG7dcZJ5HFF2wTZjI5roCboFkjF4MdqiFJCh6Fb
KsFKDpRrcy27hSYATbrnUkExnVGL+6Lws4CdZUho12f/HDuwfDi9ZCbJcbGKVNn4
rhrwNdTC8zQTqHUZdXhigBcLjEJyfWHB2vc5xTk2o+/whQxF5jqHHjx2BVL+EoqP
f9+/NiBwgu3ylF+S8yEBK2uMsWIAqZge5JQiAUaExWTxryeTo/J9uGDIv9kmGEtd
YWo3NFl/TZVmm6Ufrtjp7ToPFHemFB/M5b/gQkJLvxyNOS8apeVykGEOARj+k6BV
KA3fqa1Z55CtC58HQwtuXye84ufaMRhKI7nI87zkeaoMf7n5G4c=
=g58g
-----END PGP SIGNATURE-----

--v3h6xjzlfvroq4wu--
