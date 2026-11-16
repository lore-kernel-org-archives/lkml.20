Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857142;
	b=aD8KWm3XBNQNSEMzZMcXs+1QEj2oXqtf/UuEnk5MM49AdXMkulzHhwXMWHRRxNp19vJQ
	 JG96A5vdCXoTHh9E1TdOrRnXcjXHsgub9PZN5UP4/hGPE7+oRwNOCYfM2i8H4AWOBE/st
	 7xzM1iF/ExN/Z4BjSYOImxTv96XPASkLBPlTLGDR62+8ZqTHZrzerpT6VA0yHtI4MBd9q
	 Gx1gw1zt/G/GW5IiwOyDMmIDM4Q5bUndAfmtyS6/9uxEjzJmAjGdda2LrHHN2coJFbRcQ
	 s9GmPYEm0Rgb3cZE03NTEt5VBGNzLYeggYvCH1Sb1ZuZH0qD8YduAs+lNXcKfE30QLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857142;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=1ei/zUjIiSihYeUbM2tG9EohDlmrGsNNCEHd77ldnRM=;
	b=r6PBiNHOgCgOR8mcgJsuUptA+A9c3T35IMfTiHEh2tzSrKzs+hs24hG10OZeMVYR68dj
	 P+e7iSCDclKsxZ8PhhGWaKNXKPOG6/OburfVGY7CeUr8Gc7o3azSZnDkv/BTa7wQmZvZr
	 grYnRLRZwNMSN9cCOWwyGQdKKfoFGDac9hhwyFiX++w3eH+EwWYV9+UzO8w5kgmMTVmtf
	 LTHfaEyUcgPX7pMgKFQrKDzT+0Je+xI5b8liJ7VxdKLXMBAd7lTt7yQFbGyVkKsnphGT/
	 Q0FuRTcmDfJSg29P6OtB7ObEgCmVjnkgDJHtChzDxD/POAVm6Ob42xB87ieY7QYF6FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jsbchTOn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41463606A31C;
	Mon, 16 Nov 2026 19:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jsbchTOn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B97671F000C4;
	Mon, 16 Nov 2026 19:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794857141;
	bh=1ei/zUjIiSihYeUbM2tG9EohDlmrGsNNCEHd77ldnRM=;
	h=Date:From:To:Cc:Subject;
	b=jsbchTOntUut11iw7kR3bjbmMszP/QR3bpJeICd+CV8RvhUinhiRNf67C94nePLIn
	 RiKeKnXRuG0oHmCTm4jw9XdgfOkLY8e393/gtlSatV1NiJyg92TaTzXKGxk8qYQjDf
	 5XsfF53OmR0IYTRapgL69e4UaNjn5Fe4Nsu7gw1fPiakVPCezaautV0A1Pex9MWFQ7
	 yi0Qbiu2VSmq1NyeCpUTOE72IwUuQiBtcEb14Iw9M/zhLS4QqNgXbT/2qlTTkFYONq
	 hdN72buojwxKEnUl/DTitHNmGjf+Gx3pQTWynhFHIj298Riy2QaIxFVo3eVcfAXvXG
	 zbdAlq1WAYj6A==
Date: Mon, 16 Nov 2026 19:25:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the mfd tree with the origin tree
Message-ID: <avtYstt11GO7g85R@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="AGVfL63isF+37Wxe"
Content-Disposition: inline


--AGVfL63isF+37Wxe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mfd tree got a conflict in:

  drivers/mfd/nct6694.c

between commit:

  4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmall=
oc_obj() family")

=66rom the origin tree and commit:

  962b44ae8126d ("mfd: nct6694: Allocate USB DMA buffers with kzalloc_obj()=
")

=66rom the mfd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/mfd/nct6694.c
index dabd83b9d455c,40a29f8e0ff61..0000000000000
--- a/drivers/mfd/nct6694.c
+++ b/drivers/mfd/nct6694.c
@@@ -201,6 -201,7 +201,7 @@@ static void usb_int_callback(struct ur
  		break;
  	case -ECONNRESET:
  	case -ENOENT:
+ 	case -EPIPE:
  	case -ESHUTDOWN:
  		return;
  	default:
@@@ -280,21 -281,25 +281,25 @@@ static int nct6694_usb_probe(struct usb
  	struct nct6694 *nct6694;
  	int ret;
 =20
 -	nct6694 =3D devm_kzalloc(dev, sizeof(*nct6694), GFP_KERNEL);
 +	nct6694 =3D devm_kzalloc_obj(dev, *nct6694);
  	if (!nct6694)
  		return -ENOMEM;
 =20
- 	nct6694->usb_msg =3D devm_kzalloc_obj(dev, union nct6694_usb_msg);
+ 	nct6694->usb_msg =3D kzalloc_obj(*nct6694->usb_msg);
  	if (!nct6694->usb_msg)
  		return -ENOMEM;
 =20
- 	nct6694->int_buffer =3D devm_kzalloc_obj(dev, *nct6694->int_buffer);
- 	if (!nct6694->int_buffer)
- 		return -ENOMEM;
+ 	nct6694->int_buffer =3D kzalloc_obj(*nct6694->int_buffer);
+ 	if (!nct6694->int_buffer) {
+ 		ret =3D -ENOMEM;
+ 		goto err_usb_msg;
+ 	}
 =20
  	nct6694->int_in_urb =3D usb_alloc_urb(0, GFP_KERNEL);
- 	if (!nct6694->int_in_urb)
- 		return -ENOMEM;
+ 	if (!nct6694->int_in_urb) {
+ 		ret =3D -ENOMEM;
+ 		goto err_int_buffer;
+ 	}
 =20
  	nct6694->domain =3D irq_domain_create_simple(NULL, NCT6694_NR_IRQS, 0,
  						   &nct6694_irq_domain_ops,
@@@ -352,6 -357,10 +357,10 @@@ err_ida
  	irq_domain_remove(nct6694->domain);
  err_urb:
  	usb_free_urb(nct6694->int_in_urb);
+ err_int_buffer:
+ 	kfree(nct6694->int_buffer);
+ err_usb_msg:
+ 	kfree(nct6694->usb_msg);
  	return ret;
  }
 =20
@@@ -367,6 -376,8 +376,8 @@@ static void nct6694_usb_disconnect(stru
  	ida_destroy(&nct6694->gpio_ida);
  	irq_domain_remove(nct6694->domain);
  	usb_free_urb(nct6694->int_in_urb);
+ 	kfree(nct6694->int_buffer);
+ 	kfree(nct6694->usb_msg);
  }
 =20
  static const struct usb_device_id nct6694_ids[] =3D {

--AGVfL63isF+37Wxe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr7WLEACgkQJNaLcl1U
h9DO2wf+NZ3S269YSVC5adQh2vWczvDzW40gDm9rS7fJMqrz6995G0iQFW4i709I
yw8a+U2plRaytMP5BtdCAzTd9yOn1FahrzDBJGwsGIlBwnAZqfkwG/78zUA0nU78
18pzB5wJL8ZoiMq9Ha3VF8NyKTCWNE+CJh0kYPy9BJQQgdPqRhkQ4ZtoWSLDx/Pp
OKVNGJhxcLTHocYdjLtrgcn/YtaRp+UnQtvnzVCBapY/cAVXBRYTmcnqUNghxRcI
zhtuBzFYmrJfM+BcDjUFPOjSEIPlaGTN37HeMlIEc8n6KjsjjXIqVweae6nsmQ03
8iiMmy68aPLe/BNloG5blZ18WZOmsw==
=fav+
-----END PGP SIGNATURE-----

--AGVfL63isF+37Wxe--
