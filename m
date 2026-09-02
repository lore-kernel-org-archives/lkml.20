Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4520B4AA3E7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366835; cv=none; b=tcUppvYolgp44c/JftoaIs3Mo5yi9iQG/xmgKHc+2POL75zOQblMB1kP+hYIyV3mjh5QYaiON3FKOoX27up+JcKZ6RK7hkhfTspK3uUS7/1UpD2HtQDLrLx5WIIHr8L8xL6A6TdK5W56Bxf0/S5BrCK20H+H158tMeGn/gH8h0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366835; c=relaxed/simple;
	bh=n7WO5euM0MHGsYjXwZLuKg1Z/x+R6tW7YWBJLiYCRZU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sgEFF+50MYguXslDE9ukibs7pEMl/lNDNbmEHX/VNJ74bCjsSfntya/oa36occj2tXmt00KjKxeiLCHkdeHfjYBayHWn+kuV/hzhaTHJgS+46xaaLs/89gdfht/ADc7TXnVzZWhEmd4Mpjgpt6q0TTN/Xb1DWfdU+23JbDAL+wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pXt20nI0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pXt20nI0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788366832;
	bh=n7WO5euM0MHGsYjXwZLuKg1Z/x+R6tW7YWBJLiYCRZU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pXt20nI0+057QVJuBKAP2I7WvsX1vADcch3E6/oUOPuO0gBvFKZKbfOeqQYA7rl5c
	 wJgouLiwBf6++lA+6mnBl3oVbNW5yh1Na1dx7SZ2Pdrn95zATKkLxAv5Guv79aK2XB
	 GytFq8vjnfrnphnCda1+Lh+HrlIM+AAvS7+VMctGgAmlbw0qULPQ+xxtFoA9yAQ4Xd
	 2QCnQ+0h7Bh9q9Cv7qH7NbpFoJJWLfnRj5mregIwkEl+Kh84HiixQoYBx6oQeNykYn
	 naB3uzEfPyfcWaBUBBOVLgXirDfH56r/t/Ir38nUOaX1TARScp1jxAErqk25FakGHL
	 VBTEegqSWtarw==
Received: from fedora-21.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BA1B817E0DD8;
	Wed, 02 Sep 2026 18:33:51 +0200 (CEST)
Date: Wed, 2 Sep 2026 18:33:46 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Faith Ekstrand
 <faith.ekstrand@collabora.com>, "Marty E. Plummer"
 <hanetzer@startmail.com>, Tomeu Vizoso <tomeu@tomeuvizoso.net>, Eric Anholt
 <eric@anholt.net>, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Collabora Kernel Team <kernel@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 14/17] drm/panfrost: Avoid cache flush after perfcnt
 sample in fully coherent systems
Message-ID: <20260902183346.208eb43d@fedora-21.home>
In-Reply-To: <aphEMSV5NGlldxBQ@sobremesa>
References: <20260828-claude-fixes-v7-0-72a13b2c125d@collabora.com>
	<20260828-claude-fixes-v7-14-72a13b2c125d@collabora.com>
	<20260901153732.7c4def61@fedora-21.home>
	<aphEMSV5NGlldxBQ@sobremesa>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 2 Sep 2026 16:44:24 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> On 01.09.2026 15:37, Boris Brezillon wrote:
> > On Fri, 28 Aug 2026 21:56:54 +0100
> > Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:
> >  =20
> > > If the GPU and CPU are fully coherent, then there's no need to flush =
the
> > > GPU caches after a perfcnt sample is made available.
> > >=20
> > > Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> > > ---
> > >  drivers/gpu/drm/panfrost/panfrost_perfcnt.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gp=
u/drm/panfrost/panfrost_perfcnt.c
> > > index ffc77121070e..b3f71d7fd82a 100644
> > > --- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> > > +++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> > > @@ -52,7 +52,10 @@ void panfrost_perfcnt_clean_cache_done(struct panf=
rost_device *pfdev)
> > > =20
> > >  void panfrost_perfcnt_sample_done(struct panfrost_device *pfdev)
> > >  {
> > > -	gpu_write(pfdev, GPU_CMD, GPU_CMD_CLEAN_CACHES);
> > > +	if (pfdev->features.selected_coherency !=3D COHERENCY_ACE) =20
> >=20
> > I think ACE_LITE would allow us to skip the flush to, so =20
>=20
> I thought ACE_LITE means the GPU can snoop CPU caches but not the other w=
ay round, so at the end of a
> sample, we still have to flush GPU caches for the CPU to see counter data.

You're absolutely right, sorry for the brainfart.
