Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A82D255F2D;
	Tue,  6 Oct 2026 01:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791249109; cv=pass; b=YPGO4g8BqfloCbfeq2JOV+7DzPARzTIoQBTMBua/Th/spncX31Gm/dhTWEtc2m6NJdASb17hkDUy759sAwByKSIPJWlG4bHlh2vzeBz5ie7eZlezgkPMAXnY6nndLaAMLGwCLuLEIaeoOhp4o5iUhMymX1U+TUkTRt8ZBRX28gs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791249109; c=relaxed/simple;
	bh=1i9Sj/nWO4xlFRkHxGJEXJ/4H9UqyGtBZzsfafJ93nU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nEpKZ6Wl4E75HTm6hbgmp7H7X0EEfrm7kFr9zVN+myOCI5O72By2zrMW00JzhtrnGhS+DCYRcSr1hE2OS4NOyYKTlc5PXM3Swt7tLZUzv8vEAyJUu3O1cSm9nrBFRG//YYHTLY0+o1BTGwZWYp7BcwK45ZXpLRAZcQZ1Vnl0/LA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=BWMC7Fgp; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="BWMC7Fgp"
ARC-Seal: i=1; a=rsa-sha256; t=1791249086; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UphQXAU/8dtSAC9wsyqP35Qa3f1HNvW4msk27OanqQD3AKV5hyCYsGe90TiCtJmGJOklkkoPANnt8hKRIl813PvFK1fz2AmUriV3aUuFaIag96tzcbdKdXh4q5Xq36uBQKXDoVCOif5UAQm6PNmoP5GZpzbRmgR/ReLokZjU+zY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791249086; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4g+yzmxwnHRAzQmnEJ5mwE4FFc81WOxCdDpsE9tbhVc=; 
	b=jsShWKSMqI1fU95cbydp7+OmBIkgJHmiuaE5mNCU6lZjDnnRQqcNzT/G5V0TtLXyACBa+l0yhbSvWDnlXV/mhxkMxX8zOTkQ4THerhqaTOltf/nBCUSk6yY2G0hTynaFDxLg1FnniOjfYoxZXuMr/oqcvPdgzm2WFsPMmkJ2DbE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791249086;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=4g+yzmxwnHRAzQmnEJ5mwE4FFc81WOxCdDpsE9tbhVc=;
	b=BWMC7Fgpu4vfzSx2dRxmcm8X0xbNsrl+3pMPPdfYAR+gwcHqKmU5y3UiY4IlLZD5
	uZ2VIPl3C+NGGNwiDORh8V5NMniZq3rcf3MjKrNmkJdOU1IXwJ4mXEjAONTRqfptlsB
	/hT2rYapOvn0nmA0a2/EAMtkxmekiDhwud586w+U=
Received: by smtp.zohomail.com with SMTPS id 1791249086400943.0393043827197;
	Mon, 5 Oct 2026 18:11:26 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 6D128180A89; Tue, 06 Oct 2026 03:11:20 +0200 (CEST)
Date: Tue, 6 Oct 2026 03:11:20 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heiko Stuebner <heiko@sntech.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Igor Paunovic <royalnet026@gmail.com>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-phy@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v16 1/6] phy: core: add notifier infrastructure
Message-ID: <asRID3dSdb-ZI5KH@venus>
References: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-0-126a2e9133c3@collabora.com>
 <20260924-b4-rockchip-dwc3-rockchip-glue-v16-1-126a2e9133c3@collabora.com>
 <asDFBIVf06-VaWdx@parshuram>
 <asJGziv0N3qtXo6_@venus>
 <asNgINDic6A3Gvtq@parshuram>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mo6nligphgtrk3kj"
Content-Disposition: inline
In-Reply-To: <asNgINDic6A3Gvtq@parshuram>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/291.247.40
X-ZohoMailClient: External


--mo6nligphgtrk3kj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v16 1/6] phy: core: add notifier infrastructure
MIME-Version: 1.0

Hello Vinod,

On Mon, Oct 05, 2026 at 10:30:24AM +0200, Vinod Koul wrote:
> On 04-10-26, 14:44, Sebastian Reichel wrote:
> > On Sat, Oct 03, 2026 at 11:04:13AM +0200, Vinod Koul wrote:
> > > On 24-09-26, 19:25, Sebastian Reichel wrote:
> > > > Some PHY devices with multiple ports (e.g. USB3 and DP) require a r=
eset
> > > > if the configuration changes or cable orientation changes. This is a
> > > > problem, as the consumer device will run into undefined behavior.
> > > >=20
> > > > With the new PHY notifier API introduced in this patch, the consumer
> > > > driver can hook into reset events coming from a PHY device to handl=
e the
> > > > PHY going down gracefully.
> > > >=20
> > > > Note that this uses -ENOSYS instead of the more sensible -ENOTSUP f=
or
> > > > the stub functions when GENERIC_PHY is disabled to stay consistent =
with
> > > > the existing ones.
> > >=20
> > > I dont think this series has the usage of this.
> > >=20
> > > I think I am still not convinced why a phy should notify as I dont fe=
el
> > > we have any mechanism to notifying. Checking status and letting people
> > > know if not really a notification mechanism... Maybe add a status call
> > > instead?
> >=20
> > This series contains the infrastructure and the consumer of the PHY
> > reset notification (dwc3 rockchip glue driver). The producer/sender
> > of the PHY reset notification is the first patch in the USBDP part 3
> > series. I grouped the patches like this, so that this series has PHY
> > patches followed by USB patches instead of PHY - USB - PHY. Patches
> > must be applied in the exact order (i.e. first the patches added the
> > PHY reset notifier infrastructure, then the DWC3 notification
> > consumer and then the USBDP notification producer).
> >=20
> > The broader picture solved by this is (pre-existing race condition
> > issue in USBDP):
>=20
> Thanks, this is helpful to understand the context. Few questions on
> below to help me understand more...
>=20
> >=20
> > 1. USBDP PHY provides critical resources to DWC3 USB controller
>=20
> what resources are these?

The documentation I have is not perfect, but my understanding is,
that it is effectively a clock.

> > 2. USBDP PHY needs to reset to reconfigure (e.g. enable/disable DP side=
),
> >    which means the resource is temporarily not available
>=20
> Who invokes reset, I guess the controller (dwc3), so it ought to be
> aware of the reset condition.

No, it's not dwc3. It's TCPM. The USBDP PHY is a combo PHY with USB3
and Displayport. It supports muxing the USB and DP functionality
more or less arbitrary to 4 differential lanes, so it's registered
as a USB-C orientation-switch and mode-switch.

Thus the TCPM (Type-C Port Manager) will start to send mux requests
to the USBDP PHY. Going from USB3 only to USB+DP or vice versa
requires a reset affecting the USB3 controller.

> > 3. DWC3 accesses its registers during the reset -> SError, because PHY =
is off
>=20
> I would assume that dwc3 should know about it as invoking entity..

It does not invoke it.

> >=20
> > This series combined with the first patch of USBDP part 3 changes
> > things, so that it works like this:
> >=20
> > 1. USBDP PHY provides critical resources to DWC3 USB controller
> > 2. USBDP PHY needs to reset to reconfigure (e.g. enable/disable DP side=
),
> >    which means the resource is temporarily not available
> > 3. USBDP PHY driver sends pre-reset notification
> > 4. DWC3 goes into a safe mode after receiving the pre-reset notifiaction
> > 5. USBDP PHY does the reset
> > 6. USBDP PHY reset finishes, USBDP PHY driver sends post-reset noficati=
on
> > 7. DWC3 returns to normal mode after receiving the post-reset notificat=
ion
>=20
> > This avoids running into the SError.
> >=20
> > Greetings,
> >=20
> > -- Sebastian

Greetings from Prague,

-- Sebastian

--mo6nligphgtrk3kj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmrESrMACgkQ2O7X88g7
+pplyxAAjGAIjxL79MBKiqFsaSMx80W9QsWL89MsmCOq+Y+mlMa2QoBfGcd07ENk
W4b/fszSIuWqG1/lg3khOBGKcpgENkCFyd/i1mfL4KdUzoKY6L/xzEcTWLZZ2qts
oTCCgbM+LRPLAwZ5K4vwqQSvSPClqhteJRqQMyTWoouyTu2sEMX9SsBLhdNhVHmJ
eO6keDzqGXGSyWA43NpOp8lU0OkBhu/hvmFzKgYsa3zU1dB2tRToae4iBUJsb8/F
zmqOF5WduxNL9iXF3ZLRrM3R/P78VVsNX5nr3japeOSOYeroGwUShDxT9prlPIWz
aqHgHC9Iu5cCd1oL0Anv1fb/GCU+3VRkkx9aAKpO32WYM9r1TWvqul+rIH3VEOWS
/+fFKX0w5eVNOwdok8l3SXn7MttaRVyG+dpVWEuHbLixRFVs5CIfWK9prYMbLp3O
+/jFN/zkv2iN5fSU0B7qA++CEPuzjxfrKfN23m0WOdUZnJxpQpOmrinmYKF386ZK
4R+VkOYNG2IlQb3/fkyPNcvB8T6Vzx4DeitrDDI0SKMbxYrCZI3SleqBvrN3laog
da49e51yqOrOA1HG1N7O2gzrNiEB4lQ8J3keD/5oR+q9SzhBpmIcG+q7Lm/EIQi/
buF5mAMGWX1XJlg8gdxU9Qc7VGGCuhfz7PV8xqyZXLjzTy5QOsM=
=VAAL
-----END PGP SIGNATURE-----

--mo6nligphgtrk3kj--
