Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC5C318B9B
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 23:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791588240; cv=none; b=cmq6380I75RQyAT4qV2aixot6T1hd07ZfGDUohVBsdtxTtFSaAx7dvMTwvDYDUu2XTaW9YUHwWTji+bz0c30sJ+GcOTGxR5trDkJAhYLhTT7NH4lab/IglCiOS3hsRGk5JvPYVhizqBfqDLar7kq95BnAg7/ebsP8tTzuT9KtcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791588240; c=relaxed/simple;
	bh=sfOZXNVw/q9uYORsZL0FlPc4JiF7q/+Bna+hgg5zIok=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=INWzH32WQHV/+krYbJru6EEZNMXFSjZ01OlC1Hq/6W6jCKMYNes6tRxIrMuxPWMtIu079b49hJrk7gazqLd4cHnNZcsTGyBGKrOnsz8ygZj2I5lChQ3HxBmULcaKSxzgMtbGcSdgHHbK2oVn5WeMbyMecA3xMsKn8wmx2NFJb4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y4cgRaaP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RZtw4Wun; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y4cgRaaP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RZtw4Wun"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791588237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=itTUK0qBJAobOiyoWxRrJ2RE7+6HMxd85fVudqmm2Kg=;
	b=Y4cgRaaPHaZER1Nf5b/u/xwM5iC49tRyy0tOL4I7UzlreRPprBj26cBYKMbOGQukFu9zTZ
	R9vsfAjuchmF529SubHe7+TC3it+2JEFWnmfPZI3qKeUdZQvGKmY8azaM7/eJfbNq++brI
	nyHIMR3c5G2Q95S/Za5agRNeIBb8FYU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-OQLq1q4HO_iz7iTE6nnWzg-1; Fri, 9 Oct 2026 23:23:56 +0000
X-MC-Unique: OQLq1q4HO_iz7iTE6nnWzg-1
X-Mimecast-MFC-AGG-ID: OQLq1q4HO_iz7iTE6nnWzg_1791588236
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-535851217d9so5002781cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 16:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791588236; x=1792193036; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=itTUK0qBJAobOiyoWxRrJ2RE7+6HMxd85fVudqmm2Kg=;
        b=RZtw4Wunr7AhakbrT1kXs8S7VlsAJOMXttLDYFYHMlmS7VDQXvlfRz/KTBG0e8AcaL
         Erg/jdr6H9I6VzkcCmblHc39D/HiH4FD6+QPiCv5Pj/c8RqBagQNnu2/2CFwiIQiawba
         cdRK9AxIeDisFnnvWtj7dSYeJjdjXMeeiIudFwo+G3SanZ/0X3WNIdlYwVvArtg6jc7I
         BT5oYmzGdvIBArVnhYV+qYrOvH2WAG2Rw7cJB5CBw5XZ5U+kzO0WY5in4RuJs+0xL8dm
         3KY/VFCPlLWkcu17n0HCHy9CnbjOgtQtNdXlybXVo9UR5Vb0sFueLyylf7s4lQ4mkhVO
         7xhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791588236; x=1792193036;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=itTUK0qBJAobOiyoWxRrJ2RE7+6HMxd85fVudqmm2Kg=;
        b=mSXW7WYkX0PW4SIhgbmigs1KjHgbrfaWKfvQBq0bMj98MykalecikKiN7dGMYF4nw3
         3gJGNdWP2rIFRfJwONilZ4rk9xUtdxI4L87Xhjzt3nRFKRDR6ga0ndbR7rdwHCiML+az
         ZkyDlqtqDwdUoUwled4vdwyS0+uq1XzaGcRXxHPO2IW6q8yOMhF1nE6m+bOXj6/PtTbv
         76WRiGWt1OACVjjGcm9Hr9Hm/I1HaGeX9XHlBTG9Cp2B5xrB1MwTJlvEuZVo2USGI2C0
         ZFeh4niSJa8knnve0x3mDCViKCKyOLYWsqh4RJWifaq21CRu0/YEtTB+kIKAK81Y521A
         62Yw==
X-Forwarded-Encrypted: i=1; AKwUvBzlGdgYVwZlwY/cnhxRfZxpeWqxx9ln/5oyzsOtPUa4905lkdydCYSwse6fgL9gocPKcl8BQ3inD+k2cUg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvjVTBmqA1zq06UebuyCx1R91yKdEDFrq/UEZfe2VIyr2hKqre
	ZgAswoyJWkWJpxj83irWJJu/H7wjEQ5GePowFNS69wgTMuQRPfGFJnFWN84EWBUXYTu9iWQDbLj
	cSsSv9xcHcd7OuCqZXuWDEufJuz2wUjY8kCxng3n//aoRPnpaVEUvX1grTdlpDoBGAg==
X-Gm-Gg: AYBFou3iMMfzGXqbQZ/09eZlMhpYuUlvcj9IIJNucF0kNHnzGVB85Zula3+WbjtZDSe
	HVGLCEXNFOFU6vROuITk7lVOUCDGN7ekPeUK2hhvsd5DEwXHlqbQGyFNSlnPFbfj1VrTuAfiQs2
	eP+H2NKavSnlUHLa7lYtvnwWboX5NiXBRJaM4UhQsOmp33hwkiBY6TmXBYD9yprUDAb6u6rl1eV
	vLLgKIx9cFpDjXaiHUN2VuzGfgOWgXkdco6EEphCBLTw8XWPViG5itfE2m1ntzqrmrI3N/onlEQ
	8Yo1v/8KY67k3fEIJFhKFZquFL85EFdI5MiNTuUQ5MiMjRRN10uK5uJzjiw7ZCVRfkbId2g=
X-Received: by 2002:a05:622a:4c0f:b0:535:384d:68ac with SMTP id d75a77b69052e-5359facfcbamr53929111cf.13.1791588235691;
        Fri, 09 Oct 2026 16:23:55 -0700 (PDT)
X-Received: by 2002:a05:622a:4c0f:b0:535:384d:68ac with SMTP id d75a77b69052e-5359facfcbamr53928871cf.13.1791588235223;
        Fri, 09 Oct 2026 16:23:55 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b277938sm29237071cf.0.2026.10.09.16.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 16:23:53 -0700 (PDT)
Message-ID: <4200b4cefe4868fc3ca085d01957446ebfdc53e9.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm/nouveau/sw: prevent NULL deref of disp in
 vblank methods
From: lyude@redhat.com
To: Zhenhao Wan <whi4ed0g@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Yuhao Jiang <danisjiang@gmail.com>, 
	stable@vger.kernel.org
Date: Fri, 09 Oct 2026 19:23:52 -0400
In-Reply-To: <929077046827f363bc32f6f59e760de27a48b5ff.camel@redhat.com>
References: 
	<20260812-nouveau-nvkm-absent-subdev-null-deref-v1-0-7e057f6aeba0@gmail.com>
		 <20260812-nouveau-nvkm-absent-subdev-null-deref-v1-1-7e057f6aeba0@gmail.com>
	 <929077046827f363bc32f6f59e760de27a48b5ff.camel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Bah - sorry I keep doing this :), could you add a fixes tag for this
and respin it before I push it?

On Fri, 2026-10-09 at 19:22 -0400, lyude@redhat.com wrote:
> Reviewed-by: Lyude Paul <lyude@redhat.com>
>=20
> Will push to drm-misc-next in a moment
>=20
> On Wed, 2026-08-12 at 23:00 +0800, Zhenhao Wan wrote:
> > The NV50 and GF100 software-class vblank methods
> > nv50_sw_chan_mthd()
> > and gf100_sw_chan_mthd() evaluate "data < device->disp-
> > > vblank.index_nr"
> > to validate the requested vblank head before allowing its notifier.
> >=20
> > On a headless card the display subdevice is absent:
> > nvkm_subdev_disable()
> > (strap-driven from devinit) and the -ENODEV path of the
> > NVKM_LAYOUT_ONCE
> > device constructor both leave device->disp =3D=3D NULL while the device
> > continues to probe and still registers a render node
> > (DRIVER_RENDER).
> > An
> > unprivileged client holding a /dev/dri/renderD* fd can then create
> > a
> > software channel and push method 0x0408 (NV50) / 0x040c (GF100),
> > which
> > dereferences the NULL device->disp and oopses the kernel.
> >=20
> > The channel constructors nv50_sw_chan_new() and gf100_sw_chan_new()
> > already tolerate an absent display ("for (i =3D 0; disp && ...)"), so
> > no
> > vblank notifier is ever registered on such a card and the method
> > handlers
> > are the only path that assumes disp is present. Guard the
> > dereference
> > with the same disp NULL test the constructors already use.
> >=20
> > Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> > Assisted-by: Claude:claude-opus-5
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Zhenhao Wan <whi4ed0g@gmail.com>
> > ---
> > =C2=A0drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c | 2 +-
> > =C2=A0drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c=C2=A0 | 2 +-
> > =C2=A02 files changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c
> > b/drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c
> > index 0171cdf6f639..4cf8cd120c76 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c
> > @@ -72,7 +72,7 @@ gf100_sw_chan_mthd(struct nvkm_sw_chan *base, int
> > subc, u32 mthd, u32 data)
> > =C2=A0		chan->vblank.value =3D data;
> > =C2=A0		return true;
> > =C2=A0	case 0x040c:
> > -		if (data < device->disp->vblank.index_nr) {
> > +		if (device->disp && data < device->disp-
> > > vblank.index_nr) {
> > =C2=A0			nvkm_event_ntfy_allow(&chan-
> > > vblank.notify[data]);
> > =C2=A0			return true;
> > =C2=A0		}
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c
> > b/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c
> > index 0cfb1eaae6de..b202e11238a5 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c
> > @@ -69,7 +69,7 @@ nv50_sw_chan_mthd(struct nvkm_sw_chan *base, int
> > subc, u32 mthd, u32 data)
> > =C2=A0	case 0x0400: chan->vblank.offset =3D data; return true;
> > =C2=A0	case 0x0404: chan->vblank.value=C2=A0 =3D data; return true;
> > =C2=A0	case 0x0408:
> > -		if (data < device->disp->vblank.index_nr) {
> > +		if (device->disp && data < device->disp-
> > > vblank.index_nr) {
> > =C2=A0			nvkm_event_ntfy_allow(&chan-
> > > vblank.notify[data]);
> > =C2=A0			return true;
> > =C2=A0		}

