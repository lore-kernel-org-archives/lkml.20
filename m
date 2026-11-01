Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793576788;
	b=UtX1xPonlHGyxafUy9x7/pb1qunkq6YIosrmSRn0iCeLfbfgnpOmMyxtOwjJ2OHx/5IS
	 jqmyonQqRs8Cq7cUwVnpfIoBwozlIentfPi5T4Mcljc6ZSIagutyc9/ScWPdvODS1fFug
	 EvIGLQkPAwmPFO1VHQtt0qQtiibT3mixySKcCT8dH1IluxvgbXAmyEChd4FkULdtQH3rt
	 OCTgJM+uDUxWrua1WieuTziaWIoapILgg4axYVWdrRwvuf0TfU7czDIWPOt6vKbvuKekp
	 ajbR2VKu/7US9+IyT4nebpn3kfIL7gda6lbdLq+CQzbJtc+KrcQwWRsORJ/qloZ5ZyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793576788;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp:
	 X-ZohoMailClient;
	bh=Dr7HLHhmpNPRnakRx/XUhqvaTum3bMcddo5f/qe4qo8=;
	b=yQ0BjwZgSjwcOHFEM0enf+pFTISz0FugEJl6wn0C8PeYb2yRhnZ6UBPCPIFQ6T15hgKU
	 jRZWSzJRv4fVx2nolmfLmx+jBqDdoX1s1kLxhidM/FvBSt9MTxHREws+vYfocgl68l8vE
	 zTN7+cq9Oo9U3jRM6lDxBeTIQ8w6TbHyjS2ivCjZQCKjyGGZuqp/RhfHILf4wwPpzIsZk
	 y0WHGD2N/Ndyg+1y8m1518DwEDM+K1w7f2od2gw1a0UbY8QGduliJDn7Is6fCRThaWiKa
	 QnDs7piECFMmPwyzFc7zsAeYCfDaZER+DTFVadouc78wOOiQ6/BI7GNzq+LzamX6SWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=OF35KZXi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BB3606A324;
	Sun,  1 Nov 2026 23:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13BB3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=OF35KZXi
ARC-Seal: i=1; a=rsa-sha256; t=1793576767; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nFF1HpSoEVKhGCa2OjQyYkqXJZOKSIszAnZw1s8222Xrd2kMjrb/JcjP3+xgAd+EF7NfYB4nI2t+0PS1ovEAqX4peypVDFBqTzX/0AWf47TWUVceAD+RGpLxXtlY9xOlLrkcoFg6rr9+F5deTI01HGYkyA3aAge++eGOasLzxdE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793576767; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Dr7HLHhmpNPRnakRx/XUhqvaTum3bMcddo5f/qe4qo8=; 
	b=fDZ8nHTaKuu9Udy2AaJvmQ8QdcNnymHS9p3SPvy7VJHRGxuwc3tLHvh9xsL4zQ3lbHV+R/D79My3/rJtwro5JPPqGjldw0Z8l31fEk6rRBq1qtMaUAdBA7hxFD94jVJjm5yrfwjBgNI+d8fz6vTxJ8KxXjbSac9lI3XvD6Qz2T4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=OF35KZXix3qxySfPAxVSiT1w0GHR1ywyUWFKqT6KVakay3bNiAr3UYgre4i65utKFaTYjgZN7BbziQ2+msK0hMPQoM354DuzAXpPzGiYkYW3t0iUN+xy1BJA/KoQ4yBEq01U8ZqH3K2H4bPQfO8HcTIibsUmZqCQq1YkbVTYEM0=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=Dr7HLHhmpNPRnakRx/XUhqvaTum3bMcddo5f/qe4qo8=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793576765533498.29275941676076;
	Sun, 1 Nov 2026 15:46:05 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 53936180371; Mon, 02 Nov 2026 00:46:01 +0100 (CET)
Date: Mon, 2 Nov 2026 00:46:01 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Igor Paunovic <royalnet026@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, kernel@collabora.com, 
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH v18 0/7] usb: dwc3: introduce Rockchip glue driver
Message-ID: <aufM3PCuU9CM8zFo@venus>
References: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
 <179353091270.2955.16595397888583885694.b4-reply@b4>
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
	protocol="application/pgp-signature"; boundary="z4xoeqz7d7xqkqyp"
Content-Disposition: inline
In-Reply-To: <179353091270.2955.16595397888583885694.b4-reply@b4>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/293.557.36
X-ZohoMailClient: External


--z4xoeqz7d7xqkqyp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v18 0/7] usb: dwc3: introduce Rockchip glue driver
MIME-Version: 1.0

Hi,

On Sun, Nov 01, 2026 at 04:31:52PM +0530, Manivannan Sadhasivam wrote:
> On 2026-10-21 20:05 +0200, Sebastian Reichel wrote:
> > The recent Rockchip platform have a combined PHY, which does USB3 and
> > DisplayPort as well as muxing the lines in arbitrary order. Changing its
> > enabled functionality requires a PHY reset and as the PHY provides a
> > clock to the DWC3 controller, this can result in an SError. Apart from
> > that the PHY might not start up correctly when the DWC3 PIPE interface
> > is running. This series prepares a Rockchip specific DWC3 glue driver to
> > help out with these problems. To become useful more patches are needed
> > on the Rockchip USBDP PHY side, which are send separately.
> >=20
> > This was split from the USBDP cleanup series. v17 has a dependency on
> > the patches that have been merged to phy's for-next branch. There are
> > some additional Rockchip USBDP phy fixes, which depend on this series
> > (which is effectively also a fix).
>=20
> What is the merge strategy for this series?

I see these options (ordered by my preference):

1: Vinod merges everything; the USB side is mostly a new driver
   and thus there is not much conflict potential

2: Vinod provides an immutable branch with the first two patches,
   USB tree merges the immutable branch and the remaining series.

3: Everything is merged through USB; this would block the final
   cleanup for USBDP from being applied for yet another cycle.

4: Vinod merges patches 1+2, USB patches are merged one cycle
   later and final USBDP patches are merged two cycles later.

P.S.: I will have to send another version for the correct Sashiko
feedback on the DWC3 side.

Greetings,

-- Sebastian

--z4xoeqz7d7xqkqyp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmrnzy4ACgkQ2O7X88g7
+ppUMw/+IZmalDNrDC3LSfbW/ZyIIGDr+YwPL3ZA9dTFpWBwbX77QSqT3hBTXKiO
Co5D4QcxugfNSIeeoPFM45BpoZ0sNpLWwxiz9d3UdxHXwNMQBLusq0tsDJ8QzCkV
TlrI7ej1U2bZcAq4DyXyqyRpWO/cWjf/JBAucghQFCWzqSW5YsAljsbYQnF/QLHI
y49jW6ltllGr/yC9/+wNba6lZc39SkSgq5lC3mctoUXQGZ2e6zUQbTWKAYr+TLC+
cvFWUQlmymyhELsdGPjhgpPjQndKetVvQVNuZsJ60hqHSNU0ZTSRxaYgl6IM5UPY
dTXsOEQENYlYwetq0ZcOfwHVzM+kybIKqyS5Nm2OKUU0588croKVWhtlq/RHKUlq
72jLZIao0J9KBl8NcAlyehL+taFTmFv3X73W3i5VRaU/A8joulsx0q7Vs8d0qzKa
yizsxRS1gmVCNjR4dSGMmsSy1B+ZReFnZdc6XHLWeNvoWqX+nxeKD6J6frLrfmlq
RoCIH72XqYaxT6jTBMek6Sv/FVlmfJvPGhj66ijzMQbYFrI2ABPdV2ZMtb5KdRdB
/2JFhTzgIUXCP3rcKu9DdUzlmgo2zKEJ4FsZXZnuxp3wjWIcLVSmCcsx7+07uW46
wDT6LWqChtRB8D54e52esmJc/OPnPa28m8RQqUHJFHE2IZ0iMn0=
=Kcbn
-----END PGP SIGNATURE-----

--z4xoeqz7d7xqkqyp--
