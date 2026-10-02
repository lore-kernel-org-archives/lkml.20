Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6FF4AA414
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961757; cv=none; b=K8Yfel2VXg4W3afXuDg1bjJawEEczusGC8gfsTiM/QBPaNxgKUX5naFj2Bar4FtncJuML2vNmNaZnFNyrMmQhws2eiKLHzoyTnsaK54vkdukINAlLLw28jzVLWkP5LOkWf/9k0LB91nQbBKQQVze4/Gaoddf+oxzLNYBxQ5E8hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961757; c=relaxed/simple;
	bh=3hC4ZG/Muv7E3rSs55EszcoCbB9WgbEU+0lDJRoQr+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TSiAkwAtBDfx+n0ZuXoTk75suwZ7Q/4Bq7oIttvIPZU5OP77FplkEbiiX1ntxchbuX1dJxPOi/qquwkQo88ZG1NOwUsJKoK3tyXeOx78KfDxRyL9KfbrV4dtjiFFTHRKKMJNASspxrdS2mUQqy4smMOXYsTvpOju+y+/k2I0IR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yl9+SmW7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yl9+SmW7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 233A61F000FF;
	Fri,  2 Oct 2026 17:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790961749;
	bh=5lsjsTCc8qCQhiVuFfa42WrZNK8Mcw0OaXI8JZ8FGXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yl9+SmW7uiPIKufU9PyJ3SGWFauI5TSTTT0hqCX26igAsxWwP4C0wdRJlusL0XT6e
	 6qUVcal33Wgq5hV8kMhH6SlNsbX7Gic7xRiIBj+1zRmEuJe9d2V0ek0TW3I3XJ8qhb
	 w8dU3ppjs4DI5xzt9Nmf+yU0UP7oGO3DmKnq0Q57T6KihY3UODADh6IheHupoTccdK
	 Rp/R23GYDV247Vso7MaOdwy6lNKIGfJiz9vw5SpT34wcOCUW+hOrvcoClO62x69x1k
	 +q2TGgu/KLBDVJMeg7evnyhjKJC+XpbnUfjeqCze1u0gx3+ymRPGrGRgx+NtBl0r0q
	 BJNbkFvaFuv8Q==
Date: Fri, 2 Oct 2026 18:22:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Guangshuo Li <lgs201920130244@gmail.com>, conor.dooley@microchip.com,
	daire.mcnamara@microchip.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: mpfs: use kref cleanup on probe failure
Message-ID: <20261002-useable-progeny-f984e157d19f@spud>
References: <20260924110054.1553880-1-lgs201920130244@gmail.com>
 <CAN4SLj2Rf2jT3tkQNexBueqLy4DMEppqj0V+BPTw02D6vzeyKg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sVkLHppJgi9/7moi"
Content-Disposition: inline
In-Reply-To: <CAN4SLj2Rf2jT3tkQNexBueqLy4DMEppqj0V+BPTw02D6vzeyKg@mail.gmail.com>

--sVkLHppJgi9/7moi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 12:04:16AM +0800, Felix Gu wrote:
> Hi Guangshuo,
>=20
> On Thu, Sep 24, 2026 at 7:01=E2=80=AFPM Guangshuo Li <lgs201920130244@gma=
il.com> wrote:
> >
> > After kref_init(), the device_get_match_data() failure path jumps to
> > out_free_channel. That path frees the mailbox channel and then falls
> > through to kfree(), bypassing mpfs_sys_controller_put() for the initial
> > reference.
> >
> > Call mpfs_sys_controller_put() on that path and return immediately. The
> > existing kref release callback then performs the matching cleanup, and
> > the return prevents a second free through out_free. This is the minimal
> > change needed to keep the initialized lifetime balanced.
> >
>=20
> I don't think this is a fix.  mpfs_sys_controller_put() does the same
> mbox_free_channel() + kfree() the current path already does.

Why would it not be a fix? Maybe you mixed up the delete and put?

static void mpfs_sys_controller_delete(struct kref *kref)
{
	struct mpfs_sys_controller *sys_controller =3D
		container_of(kref, struct mpfs_sys_controller, consumers);

	mbox_free_channel(sys_controller->chan);
	kfree(sys_controller);
}

static void mpfs_sys_controller_put(void *data)
{
	struct mpfs_sys_controller *sys_controller =3D data;

	kref_put(&sys_controller->consumers, mpfs_sys_controller_delete);
}

the kref_put() that wraps mpfs_sys_controller_delete() decreases the
refcount and is the matching action for the kref_init() during probe.


> > Fixes: 75ef23397558 ("soc: microchip: mpfs-sys-controller: fix resource=
 leak on probe error")

Unfortunately, without a signoff, I cannot apply this.

> > ---
> >  drivers/soc/microchip/mpfs-sys-controller.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/=
microchip/mpfs-sys-controller.c
> > index 0400a01b2338..379e4f649faa 100644
> > --- a/drivers/soc/microchip/mpfs-sys-controller.c
> > +++ b/drivers/soc/microchip/mpfs-sys-controller.c
> > @@ -174,7 +174,8 @@ static int mpfs_sys_controller_probe(struct platfor=
m_device *pdev)
> >         return 0;
> >
> >  out_free_channel:
> > -       mbox_free_channel(sys_controller->chan);
> > +       mpfs_sys_controller_put(sys_controller);
> > +       return ret;
>=20
> If you do keep this, the out_free_channel label no longer fits.

True.


--sVkLHppJgi9/7moi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar/oUQAKCRB4tDGHoIJi
0imKAQDBUedm8kAA2bcq5e6HZ4PkcCF0/UMnApZud9og9CGxDAEA/xqEI1UbmZxj
WrPLoPUTBoFfjjX1LbqVRxnzOz2bMQc=
=JjLu
-----END PGP SIGNATURE-----

--sVkLHppJgi9/7moi--
