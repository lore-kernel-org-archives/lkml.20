Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2CE51CF74
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790778032; cv=none; b=WAGbLVoee52ePZMiRKScRUKSP/kpz5ztOqz7F77aY/IbzjBMAXt1a9xam/FJZi5ss1uxBcymKUouBjxwqxrALOh2Hossd1Cv5/vNTJ4naAGB7MnUjA8wyXCpgexc5At32xipX0MYj0uy3M6QJsIqvwl7IaGjLlSz42E1KoFqkVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790778032; c=relaxed/simple;
	bh=kCB4rMy72t6lstrsvtZpL3+kGrYokSHmdSQFAird/Fc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PILpt7hf/j70WHYXscnQJjLpHnX6UYWRkKgcnr0PKjfrwLcX27BhW4E5RA0W57l8+YRvZhCfrz2Sgs6H2yR7OP9MaxYTkUrhSxJ5YG/HKLEyNKu+1LzmMx4mxfxuMcf8zxi4jUbYBTNuqu0mYlVGfghjCKBcLGzqOzItx9gnmks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=yV5lBOXD; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="yV5lBOXD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1790778019; x=1822314019;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kCB4rMy72t6lstrsvtZpL3+kGrYokSHmdSQFAird/Fc=;
  b=yV5lBOXD91o/Foun4o6BSA2+guC63cyrCE6HmNtBxax8KL3sZsoJr+92
   SqXsiqaUY6NjFW8lun3wXCv6rQFfaVuFOjpF2GzQYYIh7/xrC7SOZbH9t
   nGM0WZ96FwP02H9dpN2cnDKWUKdvwbsgZc/LK2RyBgYuT83nl7k2PLAGq
   11AEU/e6KFpXjHmYw1i4XaHJsuPfqrgqsBWfCSGRE5tExDcuLkCZ5E6VE
   aDJTkxQ8XeFb7Uj8getRW4PNrVQzwAVglmOWOueKaDBOznA2+T4q3KRQ3
   zsfVPUBE81Dv9msp8WOpJ/zk/UkpNwikEdI9QQWygbmz8LcWbjhN8raac
   A==;
X-CSE-ConnectionGUID: 5UlyJrXIRiKfRQ7wTS9rwg==
X-CSE-MsgGUID: 9gbWqOU1Ts6BYkfY4HLAGQ==
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="asc'?scan'208";a="295783353"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 07:20:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Wed, 30 Sep 2026 07:20:13 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Wed, 30 Sep 2026 07:20:11 -0700
Date: Wed, 30 Sep 2026 15:18:52 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Paul Walmsley
	<pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Dominique
 Belhachemi <domibel@debian.org>, Michal Wilczynski
	<m.wilczynski@samsung.com>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Icenowy
 Zheng <uwu@icenowy.me>
Subject: Re: [RFC PATCH 0/2] drm: add a noncoherent mapping checking helper
Message-ID: <20260930-zippy-container-d48f72432c1f@wendy>
References: <20260930073528.3369325-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OqEFKY6wsUz/m5my"
Content-Disposition: inline
In-Reply-To: <20260930073528.3369325-1-zhengxingda@iscas.ac.cn>

--OqEFKY6wsUz/m5my
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 03:35:26PM +0800, Icenowy Zheng wrote:
> This patchset tries to address the lack of uncached mapping support on
> several SiFive-core-based SoCs, currently targeting JH7110 but EIC7700
> would have the same problem (although it uses DC8000 display controller
> instead of DC8200 and real display support is pending).
>=20
> Because other users (either SoCs with Xuantie cores, which have
> Xtheadmae extensions or non-RISC-V SoCs) of the driver have proper
> writecombine support, a helper is added to check whether coherent
> (cache-bypassing) mapping is available. This helper currently returns
> true for all architectures except RISC-V, and checks whether
> pgprot_writecombine() is a no-op on RISC-V.
>=20
> The patch really enabling manual cache maintenance for the verisilicon
> driver is picked from Dominique, and reworked to check both
> dma-noncoherent property and the platform's mapping capaibility.
>=20
> Tested on VisionFive 2 with the display enablement patchset at [1] (and
> its dependency).
>=20
> Also tested on Lichee Pi 4A (TH1520, which has Xtheadmae), operation is
> not affected, map_noncoherent isn't set and Xorg says kernel dirty
> updates aren't required.
>=20
> [1] https://patch.msgid.link/20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7=
@samsung.com

Out of curiosity, have you seen Bo Gan's series from a few months ago
that creates an extension/erratum to get these devices working?
https://lore.kernel.org/linux-riscv/20260316060328.1173634-1-ganboing@gmail=
=2Ecom/

I've been meaning to reply to it over and over again for the last number
of months, but I just haven't had the time to actually understand the
detail of the EIC7700 solution or check whether it works yet. I know
this is just one driver because the JH7110 only has this problem for the=20
display pipeline, but according to Bo Gan this applies to all
peripherals on the EIC7700.=20

>=20
> Dominique Belhachemi (1):
>   drm: verisilicon: support non-coherent DMA framebuffers
>=20
> Icenowy Zheng (1):
>   drm: add a helper function to check availbility of coherent mapping
>=20
>  drivers/gpu/drm/verisilicon/vs_cursor_plane.c |  9 ++++++
>  drivers/gpu/drm/verisilicon/vs_drm.c          | 32 ++++++++++++++++++-
>  drivers/gpu/drm/verisilicon/vs_drm.h          |  7 ++++
>  .../gpu/drm/verisilicon/vs_primary_plane.c    |  9 ++++++
>  include/drm/drm_cache.h                       | 21 ++++++++++++
>  5 files changed, 77 insertions(+), 1 deletion(-)
>=20
> --=20
> 2.55.0
>=20

--OqEFKY6wsUz/m5my
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar0aTAAKCRB4tDGHoIJi
0gIjAQCmqfpa8F+zRS9qou6Cpt/edun4UcrGLDrhAT9zS7xYcAEAxJhi1xxX/pOq
tlDO5YLG1EFJ07bqeI4vPVUnFSYXcgU=
=z16F
-----END PGP SIGNATURE-----

--OqEFKY6wsUz/m5my--
