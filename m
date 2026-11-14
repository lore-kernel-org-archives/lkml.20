Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794673264;
	b=vB5Tyux1oQniWabLS7syowEX+yUOVGRsR7bOSJh7Hm0h8Nm+Qu6Wkop7I5h999sp1D+a
	 hnIWA0UivDpq+Ok3tycCltHu8M9nkOUUeDxEdzfpu/TfeXkGVyMtSD8418IXNTwLZqG67
	 8haaScJemZll5HfOdp254FJBVm/HNLuOAiG7/fdQ6yiPLuhr9MNji5+4f+dH4NG0YJjtC
	 mZas3jgNwMLLZWRIy0rLtTi+A4M09jrKx4QXyfuqFoU/lr1d0C5RpgYmAilh3RNGGwnzY
	 3H+xG6y4F2oIhV4ipWvJjpMYFc/d27w0nG2BVayEmIQSqx/v5h1szUpYHwTyIcFhSrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673264;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=vc8EBtQgu2BWn5PQ5GP1/SsZSGSHdYgDv62oR4Cy3is=;
	b=gMx4NIDOSKm0kgbb2blh/6qoxfu2n0A4cK6HJjqiR0Me57DLHx37bsAearGfKSlX2BeD
	 FeoYR/iQGRx8zvh2I7U2G1NgXbEJDQLbPA/WQBnp6FHjXUxTD/MhEsfCK95GbbRXNg3LV
	 uQ7CjfI5e1NCNknNTCNeDjqKCaHKyYjgbe3wH1Y/USoDFpuEBex9JlUsZafEvtjfcWgwI
	 HDzJ59Hk2Zv/XCoMtX+DjLk5515jGAjfbHNbcwxGH0eGGg88dbKLVBjOtctpoaC6XwugT
	 7d8Lj6rG+Iu4PgvtdpRRGDh51RfEUVHSjMRjttfHnsqM75z9XIN12CUDaV1GxEAIuTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=none smtp.mailfrom=master.debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.master header.b=DuReHRmQ;
	arc=none smtp.remote-ip=82.195.75.110
Received: from master.debian.org (master.debian.org [82.195.75.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E047D606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E047D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=master.debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.master header.b=DuReHRmQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.master; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description;
	bh=vc8EBtQgu2BWn5PQ5GP1/SsZSGSHdYgDv62oR4Cy3is=; b=DuReHRmQgNiGPm9txLeEMmXY/E
	CrBN08i9wK+Tt45LdgZIqk0wvsyVY4g5XENtccYhHUVFHFwMVgi8Eie53TL9GU2MA+zHAB6p1xQmm
	SMXO4AW4aDJbxEVuS2pCdK9+Dmou3arUW3kqWIgbYQFqZCCNp8ecN5N+Zd4sUrrVtQA8cZ0GjXZys
	DSqOQNPIjwJELfYC+ar1CP0wElJIfvUx77pWODzt2LAHvkaIo0A59zkG+K+nefu0tmGc+aPx4F71+
	rjYT/8l8yEyAe2D9d89qRsqymHaVghV5XamBl/rBlbpzydnla0+OBqoRUyyJKxuwGrd5lcO8q67jK
	R28gw+xA==;
Received: from ukleinek by master.debian.org with local (Exim 4.96)
	(envelope-from <ukleinek@master.debian.org>)
	id 1xSGUR-009uyU-1y;
	Sat, 14 Nov 2026 16:20:31 +0000
Date: Sat, 14 Nov 2026 17:20:30 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@debian.org>
To: Marek Vasut <marex@nabladev.com>, dri-devel@lists.freedesktop.org
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
	Li Chen <me@linux.beauty>, Lyude Paul <lyude@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Ole Carlsen <ole.carlsen@tutamail.com>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "nouveau: pci: quiesce GPU on shutdown"
Message-ID: <aviIPk4xbKhgqcTy@monoceros>
References: <20261025213027.842978-1-marex@nabladev.com>
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
	protocol="application/pgp-signature"; boundary="xowislqauromtdk7"
Content-Disposition: inline
In-Reply-To: <20261025213027.842978-1-marex@nabladev.com>


--xowislqauromtdk7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Revert "nouveau: pci: quiesce GPU on shutdown"
MIME-Version: 1.0

Control: forwarded -1 https://lore.kernel.org/nouveau/aviIPk4xbKhgqcTy@mono=
ceros

Hello,

On Sun, Oct 25, 2026 at 10:30:06PM +0100, Marek Vasut wrote:
> This reverts commit 310326bb7df4bba094a3fc60364c641c547fd923.
>=20
> This breaks shutdown on ThinkPad W510, without the offending commit
> the system normally powers off, with the offending commit the system
> ends up spinning indefinitely and the CPU fan goes full throttle on
> shutdown.
>=20
> The behavior was already reported in debian bugtracker multiple times
> for various other computers too, and git bisect lands as this commit.
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1141969

I think the original bug #1141969 is a different issue.

> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1146033

Here it affects a Lenovo ThinkPad T510 and I think that's the same issue
that Marek has.


> I tested the revert with Linux 7.2.12 from debian unstable, not next
> or drm trees, mainly because it was easier with debian test-patches
> script on that machine.
>=20
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Li Chen <me@linux.beauty>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Ole Carlsen <ole.carlsen@tutamail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Uwe Kleine-K=C3=B6nig <ukleinek@debian.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: nouveau@lists.freedesktop.org
> ---
> NOTE: Maybe the revert is not the ideal solution, but it does fix my
>       problem, and I think being able to shut computer down is a good
>       functionality to have.
> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 32 ---------------------------
>  1 file changed, 32 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouv=
eau/nouveau_drm.c
> index 5e1336615cf6d..36c74f9edaa83 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -1090,37 +1090,6 @@ nouveau_pmops_resume(struct device *dev)
>  	return ret;
>  }
> =20
> -static void
> -nouveau_drm_shutdown(struct pci_dev *pdev)
> -{
> -	struct nouveau_drm *drm =3D pci_get_drvdata(pdev);
> -	int ret;
> -
> -	if (!drm)
> -		return;
> -
> -	if (drm->dev->switch_power_state =3D=3D DRM_SWITCH_POWER_OFF ||
> -	    drm->dev->switch_power_state =3D=3D DRM_SWITCH_POWER_DYNAMIC_OFF)
> -		return;
> -
> -	ret =3D nouveau_do_suspend(drm, false);
> -	if (ret)
> -		NV_ERROR(drm, "shutdown suspend failed with: %d\n", ret);
> -
> -	pci_save_state(pdev);
> -	pci_disable_device(pdev);
> -	pci_set_power_state(pdev, PCI_D3hot);
> -	/*
> -	 *  This is just to give the pci power transition time to settle
> -	 *  before an immediate kexec jump. it=E2=80=99s mirroring the existing
> -	 *  nouveau_pmops_suspend() behavior, which already does
> -	 *  udelay(200) right after pci_set_power_state(..., pci_d3hot). In
> -	 *  ->shutdown() we=E2=80=99re allowed to sleep, so I used usleep_range=
()
> -	 *  instead of a busy-wait udelay().
> -	 */
> -	usleep_range(200, 400);
> -}
> -

I cannot reproduce it, but maybe it's helpful to find out where/how the
driver hangs. Adding printks might be enough, and if not, remove stuff
=66rom nouveau_drm_shutdown() until it works. I'd guess this gives the
needed insights to determine a fix without reverting the identified
commit.

Best regards
Uwe

--xowislqauromtdk7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr4iksACgkQj4D7WH0S
/k5Ddwf/ZQhRWfT25ajkrlMZB7Yy22dbIY9AYVPqks3pLi+iRApmlVlicq/ISs9P
FZ9vhyC03ZBC36UV0syL4ayAAHBgWL4c7TM1pgLEUlIkVGgCp79svNqrlCXS1FqA
SVIGEptvevPbe9FfsGoyXhfGPPyxdZ8hEUrijzGJ5GA2MwUfQsYO9+gQP7sw8wOq
mNvf/HaxcQtH6LZ5i59I1f9ttRmD66s2jCIclrabbn1jiHFjhut/VCwHGvTvsjZf
wLS5IIxlKJldiaXOLWiFNjS5kpw2vHbNcFsVU+CAk5vJkMdD1r5EZIyIH/jK5RuK
6RDKqiy/Lgs1+cUfnTFxjKuZwBTHDA==
=97RD
-----END PGP SIGNATURE-----

--xowislqauromtdk7--
