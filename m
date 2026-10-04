Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA002FC00D;
	Sun,  4 Oct 2026 12:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791118429; cv=pass; b=tN8HNm7ZOM5n5L5AsZAzghXiRkZKDRl9GMhAcXG+GD+GnjTksep8xWZyJS9rF68nSF3GsLM8mN0yo/UF3JqG1PWwGvy6VnShpAlhnYXvyHL5I6Ad8sAjB6+gpZwK8MpyQSY4coGGCgY3P9OcITe7/1M4tzg4enuK0669sWWHLEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791118429; c=relaxed/simple;
	bh=AD4c5oq4C24bBa6YGd2lDMYrxjTCbQDGGDzJLs+YSIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TDA+gdO43RKIjnPHiB3vUj6iZYpowmYHqUZFT3gLCzOSfhC7aFWLWGIUWiwSbB84stOQ27mCmXIQVRLataHy/IgDC0AzCTo8RWP0dUbfZ0E2JcM+rl/FxYz52JBjiZZR8pr2ADRHxELO4N6Nbxzuo7jnUDZQ0g4rAPpsL7L5YL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=LhlWsWuN; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="LhlWsWuN"
ARC-Seal: i=1; a=rsa-sha256; t=1791118408; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ERdHo3cHKccOXgbrq8b29QDOmGsQZIGiBis4jkL77Qx8UdRQMBfHlcNfSBS3cvCxoEduYJzELzh/dsQjxEVkdf7tuOJlAikSIqen9Uc6TTfDpfY6KL/EUCO7kV5TOGmmWsfS+OYG239Kb161mPp0JhFlDFXaNkHPQIRueXCeD2g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791118408; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bgDESfLrXKLmUyRoB+jOHoxIwRj5hwAQyXCFLNMDOaw=; 
	b=BXb+XQbo8mfOEN2KNkURN75mCY7JDE2I8ckalYq3up5otZwNMvysJ3h9ZJtQ5daH3U+OHzk2S+VYXW8ok6VNcvjjiJ+YN748u4H91mAEPPwjxZOgpObKX8lhKYOX33BNdDcZEYLzcNC8okGJBr3vZQda9S6/rIxsy7gvFjLwMwc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791118408;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=bgDESfLrXKLmUyRoB+jOHoxIwRj5hwAQyXCFLNMDOaw=;
	b=LhlWsWuNz8iImIBP5PZJ7pN2Sjr03aA/vSWjOVJW+ydfVhsJshIfdrJL+P4aIEsX
	qg6O2BDs8Qb4TRGiykr3anHHOL6KSAhgXJ8521bM+bO4UA2IeMurmPbb7h2pMaL0FrI
	mHKpUMRMDWq2Eoc44L0JuKe0cM9JzpzmYmbBFTYs=
Received: by smtp.zohomail.com with SMTPS id 1791118407425681.0566603227451;
	Sun, 4 Oct 2026 05:53:27 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id AA4F4180950; Sun, 04 Oct 2026 14:44:11 +0200 (CEST)
Date: Sun, 4 Oct 2026 14:44:11 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heiko Stuebner <heiko@sntech.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Igor Paunovic <royalnet026@gmail.com>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-phy@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v16 1/6] phy: core: add notifier infrastructure
Message-ID: <asJGziv0N3qtXo6_@venus>
References: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-0-126a2e9133c3@collabora.com>
 <20260924-b4-rockchip-dwc3-rockchip-glue-v16-1-126a2e9133c3@collabora.com>
 <asDFBIVf06-VaWdx@parshuram>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tscrktrwpqpmy56x"
Content-Disposition: inline
In-Reply-To: <asDFBIVf06-VaWdx@parshuram>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/291.108.66
X-ZohoMailClient: External


--tscrktrwpqpmy56x
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v16 1/6] phy: core: add notifier infrastructure
MIME-Version: 1.0

Hello Vinod,

On Sat, Oct 03, 2026 at 11:04:13AM +0200, Vinod Koul wrote:
> On 24-09-26, 19:25, Sebastian Reichel wrote:
> > Some PHY devices with multiple ports (e.g. USB3 and DP) require a reset
> > if the configuration changes or cable orientation changes. This is a
> > problem, as the consumer device will run into undefined behavior.
> >=20
> > With the new PHY notifier API introduced in this patch, the consumer
> > driver can hook into reset events coming from a PHY device to handle the
> > PHY going down gracefully.
> >=20
> > Note that this uses -ENOSYS instead of the more sensible -ENOTSUP for
> > the stub functions when GENERIC_PHY is disabled to stay consistent with
> > the existing ones.
>=20
> I dont think this series has the usage of this.
>=20
> I think I am still not convinced why a phy should notify as I dont feel
> we have any mechanism to notifying. Checking status and letting people
> know if not really a notification mechanism... Maybe add a status call
> instead?

This series contains the infrastructure and the consumer of the PHY
reset notification (dwc3 rockchip glue driver). The producer/sender
of the PHY reset notification is the first patch in the USBDP part 3
series. I grouped the patches like this, so that this series has PHY
patches followed by USB patches instead of PHY - USB - PHY. Patches
must be applied in the exact order (i.e. first the patches added the
PHY reset notifier infrastructure, then the DWC3 notification
consumer and then the USBDP notification producer).

The broader picture solved by this is (pre-existing race condition
issue in USBDP):

1. USBDP PHY provides critical resources to DWC3 USB controller
2. USBDP PHY needs to reset to reconfigure (e.g. enable/disable DP side),
   which means the resource is temporarily not available
3. DWC3 accesses its registers during the reset -> SError, because PHY is o=
ff

This series combined with the first patch of USBDP part 3 changes
things, so that it works like this:

1. USBDP PHY provides critical resources to DWC3 USB controller
2. USBDP PHY needs to reset to reconfigure (e.g. enable/disable DP side),
   which means the resource is temporarily not available
3. USBDP PHY driver sends pre-reset notification
4. DWC3 goes into a safe mode after receiving the pre-reset notifiaction
5. USBDP PHY does the reset
6. USBDP PHY reset finishes, USBDP PHY driver sends post-reset nofication
7. DWC3 returns to normal mode after receiving the post-reset notification

This avoids running into the SError.

Greetings,

-- Sebastian

--tscrktrwpqpmy56x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmrCShcACgkQ2O7X88g7
+pqKZQ/5AZjgJZAP0K7j3fjtoZWVfKvHdK5zDgEney3DOH3py7hJca0N2aruS7Ei
b798piV1K9OKQHjBrBXdIRq9PbLP+iRfwiYmrNEaWbfPa+Gt8jUd0plVPFKZsb2e
SIFgHA+ghthCj7o6RnwkkjB776aE1g+iAfqcJ74FJ023E2V6iFUasqkfukGiSeK9
2QmzIwlJw6P+BIQw9YTAaEhbmzqHkWsO3gL7ACpNtd6fCigECCx1Brl2im0O53v/
17gjBhQIQ4/wosGxPndKsqQaDhK92y4ZSNPf/rMfvR4UWt4Q0W0g2VT+blOXQ5Iu
eppv8irdrM9VEhHr9LK/ZjkZaSqwJNe9w29lsfmSV3gFKnW4kiBhDF66ii3RvWfl
lBPvlJvdZSB8+vpf/0Bjv3hedBnqlf4Wuhhv+j+PDqJUv54cWJN9c6scMvNezOT2
H08JLoO48Ou6mrazNWQQISDlH/7hTWQ9F8+AhNXqrCnbxtxmiVJvgxDPYpe2kiTo
aTDiIhg2z94VD2h/CmgiN5lwrKynXDzCC+eiDWZzHDUx13IabkIqgJeiLUMBkG3S
RBwjLIm+MjmFCV2lQIyCIUJ70iCiue04CSR+h1HrloFZmXMEpmXkvUdWPLP4PiVC
MaJaHzBopWFhSxD3c3yuweo4ywxFe9jp3Y4iK4Jmn9cVC+0OwHI=
=lRt1
-----END PGP SIGNATURE-----

--tscrktrwpqpmy56x--
