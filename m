Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F48B37FF76
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 23:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791588138; cv=none; b=KkHcongo6/2mPilblYFLixV8xXrxCTbiWkyYrWFLm1bKJzkx28GpjW8yT+NKmi6IrvZf4s/xSOxhy+gVFhGl0gbP7sCUa8LPoWC22Egamz4Qaw5vacGHBBrohB9biUpzrbgQzrEjak6FlALyp8DfWq5NjQvUXZBgAMOk5VVGbhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791588138; c=relaxed/simple;
	bh=Mk6ry6v2KD/wkuaGvrTV43kFARxZWmChZfj474Sudrc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dz+KU4kL0yvRMnsSd+x/gSH10FjmqbXdGJWBKUftoAA9+4ZtnOz71svH4tHLEEXpWcKS2T0g0YfCiM8nW9M1pLjk1dqZlISezSFP0OsVjdHPKkTTXgEqcXUeC0loKzYsYiSh3O354vLE6GNSMGpj6VGxXRk6I2v3ciuADyFag0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fxkYxhZB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=grF+81wC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fxkYxhZB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="grF+81wC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791588135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MOkSafKPWfgergQn1PH0zCTo27W7O5llrWCsPU5yGRE=;
	b=fxkYxhZBken87NPdZo97Tc+MAtTtrSBFNONJmr/J28BTyJiI5saibAGtsztu+F2REoG3Gn
	dQ/dNRNU1Qta+b/jorQDOhaCqJ8TVe9Bca2XTsk3Z6slVFx8S9f2j83OFi1Gfy72rZ5sw/
	zxc0BbsYdxaMKwxLTGE3ndxgb4htFow=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-wV6R30ghM9WYkw6vrCq27w-1; Fri, 9 Oct 2026 23:22:14 +0000
X-MC-Unique: wV6R30ghM9WYkw6vrCq27w-1
X-Mimecast-MFC-AGG-ID: wV6R30ghM9WYkw6vrCq27w_1791588134
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea8067974so41551985a.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 16:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791588134; x=1792192934; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MOkSafKPWfgergQn1PH0zCTo27W7O5llrWCsPU5yGRE=;
        b=grF+81wCH6TEk/iyeLIu69JfmsQbVQlObP1aGPp5iUehgaDPnIPdfz8tblvzFi4Zrd
         Oyj1ZDtw45ck0kHPd0K/V8UMXqulfiB6OUJRY9aE2ZJq/TKSZdjnfnVkS+xCtGPsfdcK
         5xxa4RPnmwtjxc7bRYbgz4+xN9xC/AHUFAoMc3N8gPcX8/Sh/gwzJeP/c0urduwfnAJ/
         9mQl65mJ1a8C4hwl6kQhbvlg5D6IEdOkBcpfy2T+EuaB4qRW/TlQCNEdCeD122t/kTxN
         Virot0+HrwR2QGOhn4PrVfqdtf3mQTtyvXyfhijiBjO4rkdSyWqs/8ajmaVIoo7mFear
         oBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791588134; x=1792192934;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MOkSafKPWfgergQn1PH0zCTo27W7O5llrWCsPU5yGRE=;
        b=J0k1PtfG2ox/qdLgxePjcwl5PVlw0Onh9QEjnIQrPex9QgeN8sgeyohgBULSD0sZo6
         hn0CewFL+LPeBZ8W+O6EqZqpKfwk+wl+kb9GpuHEQHbR8j9rt/CEy2pcszu1S/KVIPLc
         UMqyxJzCgRKMU3Lmcxv3jKyyqmMqoRWWf/X2dqIZ7KhCvOa8J25oMuEM3l/SqowzKQf3
         F35NpKIVLDtzzTmdbIpUmV6GPSyC8wVyW7rSafN5jOfTo3YW+ZXn4idZN5EbIDTPvRZu
         CgcIptR39P+WKNgB1n8esjwPoMQCYROveajZeTenfYhJA7tdh6dYblzf0LTGfUgu4rOi
         VpBA==
X-Forwarded-Encrypted: i=1; AKwUvBy7K2n4zdwWyCy2eXuSQLcaBEFzrurtNPrZGNy81DaYRtLeImn/OBKaX8D+f3Y02n4DYzr+HqbjOdbD0Pg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLx4mT5V/k37ja2H+V9KBiDf3EgUs9oj5iioza8hTdyEU9KZoyz
	Ew5NB2lCArUwwkShqRll3B2hMJEXo+caX3N7/j/oOt4eFfXtbQRfPIS/XshAxxW+jze4BTsiNzV
	dWHmQKHYTBQKwzRsZvVlBm/gawlxrUoQQkZpKNJFySKkqrxN5A+t0hykwaON3ALn4QQ==
X-Gm-Gg: AYBFou2Y/EyGzYPG5OWYIxXY1ehx45w/xNBxiy4K4FvSzRXniboQYZEahWkinIgeC4i
	SZkwFNFeyZ+vQ0SMnb4G4lbJzRy0GMg5ptpoJWa2RQVumbxFAluXS/Dbl0S2t4bp5pJLQtWKwKD
	x0HdMcD2fWhsj4DFCdFzqANBrLJtezJApLlXYFPZENJoOthQqMciNMJBiA7OgzrskMv+YObM/96
	xijKj+Mmrlu+6Ag/qvNBNTw5v6Z2MOiIF98ruPxKWYcjx3QFGGrqpXeAE/7l78irYOHUEDw10AY
	5k1ZCSDq0xoa99bPvWZHIXzPMRQ8kJ1UGon2jNvG5TccaXbu5M8d8oll1Vq1lO8fJdGzKXM=
X-Received: by 2002:a05:620a:178e:b0:93c:57da:4ef0 with SMTP id af79cd13be357-93ebd2916eamr545877185a.56.1791588133658;
        Fri, 09 Oct 2026 16:22:13 -0700 (PDT)
X-Received: by 2002:a05:620a:178e:b0:93c:57da:4ef0 with SMTP id af79cd13be357-93ebd2916eamr545873585a.56.1791588133188;
        Fri, 09 Oct 2026 16:22:13 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb984889fsm300130785a.13.2026.10.09.16.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 16:22:12 -0700 (PDT)
Message-ID: <929077046827f363bc32f6f59e760de27a48b5ff.camel@redhat.com>
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
Date: Fri, 09 Oct 2026 19:22:11 -0400
In-Reply-To: <20260812-nouveau-nvkm-absent-subdev-null-deref-v1-1-7e057f6aeba0@gmail.com>
References: 
	<20260812-nouveau-nvkm-absent-subdev-null-deref-v1-0-7e057f6aeba0@gmail.com>
	 <20260812-nouveau-nvkm-absent-subdev-null-deref-v1-1-7e057f6aeba0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-next in a moment

On Wed, 2026-08-12 at 23:00 +0800, Zhenhao Wan wrote:
> The NV50 and GF100 software-class vblank methods nv50_sw_chan_mthd()
> and gf100_sw_chan_mthd() evaluate "data < device->disp-
> >vblank.index_nr"
> to validate the requested vblank head before allowing its notifier.
>=20
> On a headless card the display subdevice is absent:
> nvkm_subdev_disable()
> (strap-driven from devinit) and the -ENODEV path of the
> NVKM_LAYOUT_ONCE
> device constructor both leave device->disp =3D=3D NULL while the device
> continues to probe and still registers a render node (DRIVER_RENDER).
> An
> unprivileged client holding a /dev/dri/renderD* fd can then create a
> software channel and push method 0x0408 (NV50) / 0x040c (GF100),
> which
> dereferences the NULL device->disp and oopses the kernel.
>=20
> The channel constructors nv50_sw_chan_new() and gf100_sw_chan_new()
> already tolerate an absent display ("for (i =3D 0; disp && ...)"), so
> no
> vblank notifier is ever registered on such a card and the method
> handlers
> are the only path that assumes disp is present. Guard the dereference
> with the same disp NULL test the constructors already use.
>=20
> Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> Assisted-by: Claude:claude-opus-5
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhenhao Wan <whi4ed0g@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c | 2 +-
> =C2=A0drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c=C2=A0 | 2 +-
> =C2=A02 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c
> index 0171cdf6f639..4cf8cd120c76 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c
> @@ -72,7 +72,7 @@ gf100_sw_chan_mthd(struct nvkm_sw_chan *base, int
> subc, u32 mthd, u32 data)
> =C2=A0		chan->vblank.value =3D data;
> =C2=A0		return true;
> =C2=A0	case 0x040c:
> -		if (data < device->disp->vblank.index_nr) {
> +		if (device->disp && data < device->disp-
> >vblank.index_nr) {
> =C2=A0			nvkm_event_ntfy_allow(&chan-
> >vblank.notify[data]);
> =C2=A0			return true;
> =C2=A0		}
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c
> index 0cfb1eaae6de..b202e11238a5 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c
> @@ -69,7 +69,7 @@ nv50_sw_chan_mthd(struct nvkm_sw_chan *base, int
> subc, u32 mthd, u32 data)
> =C2=A0	case 0x0400: chan->vblank.offset =3D data; return true;
> =C2=A0	case 0x0404: chan->vblank.value=C2=A0 =3D data; return true;
> =C2=A0	case 0x0408:
> -		if (data < device->disp->vblank.index_nr) {
> +		if (device->disp && data < device->disp-
> >vblank.index_nr) {
> =C2=A0			nvkm_event_ntfy_allow(&chan-
> >vblank.notify[data]);
> =C2=A0			return true;
> =C2=A0		}

