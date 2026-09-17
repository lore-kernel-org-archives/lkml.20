Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8364149EC6E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789679762; cv=none; b=mt38jmzTrQqrZFkmflk0FJA46iybzu2pB1Q0uZItICWrQuLTfaYZgBh18teMpoXKym6nrZjd/msBLab4Hvp7ACcXJ6hb3g3Csc+Xeoz9sP32+fLeMzJ0JARmA4hl3J2noRsRHE/smQa4tGLybhcQdl1n9bLVqXLzLxV6GDBacAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789679762; c=relaxed/simple;
	bh=nh4EhKrrSVpPtwPul8dWU2NkdUdnzshHUPf+kt9rAv8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V3YmAyIh4aE6r1UrJdSog17g1HHrBD8UubjoquykUEUslyS30WL3cBVDYTYULDtwnR2/uWEgHieARlUUbvTKO4o1HiHi5CS0IqU2+gVarSIeanjSQetJPBPqcPXHdZ5b8+i9B8BYYX0Sit0sj8tZ6SgGnv1kKqFqGch2LZ4P7Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zt5yz3p0; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=g82WwE2Y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zt5yz3p0";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="g82WwE2Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789679759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OtRNevT1H99BcwMOJOoJJC1/helgpSitXQyz+o5WM/M=;
	b=Zt5yz3p0a0KbNSQheJgUPhPjIv8WqqE2UqPA3rm3K6gmogluXKa3tcK7IjRTGLl97lQGYU
	mSiZyp5yZWap7Kwp3wvJwyb2jqweHrwXV2Vhh6fzXinWnpka3vf8fSbQIrLDYEYvaeXwTm
	wEVzHH+V6euFSBKpTLRpRrXbym2kNik=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17-aEvAQxJ7MT2aV2NQbFSRXw-1; Thu, 17 Sep 2026 17:15:58 -0400
X-MC-Unique: aEvAQxJ7MT2aV2NQbFSRXw-1
X-Mimecast-MFC-AGG-ID: aEvAQxJ7MT2aV2NQbFSRXw_1789679758
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bf321d786so306361cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789679758; x=1790284558; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OtRNevT1H99BcwMOJOoJJC1/helgpSitXQyz+o5WM/M=;
        b=g82WwE2YuIBYxYx4qobbempdu4rNnRReg3ctBEZxcgGf7PiYoTMp+G3axF1AGzpRJq
         9HvDAKokIytJd0cDS42vIY/VI7q10en9PEAqtyrWk5NBRPhH//6/uVjJdsYl+Qu8osN3
         OCUM+QOrCC90RoNTJv8qy6bIw2UxrLnqPk80gwi/S9+43q+4Z3YOLi8b9dbdEJlULtqX
         Peee8sW75GVThirI8e8MeYdT8dTJezQVbHZ6NYcfSKH7uT4nU7n8ZHKRDRoV0HeTlrql
         zrsBNqLGU+zfjDRVajLJ+154JFc4k7+5Lty6/34WBXfnXsJ7q8K0HUKizeCvP9Fcxzib
         uyqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789679758; x=1790284558;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OtRNevT1H99BcwMOJOoJJC1/helgpSitXQyz+o5WM/M=;
        b=hR0+fiVNfA0dWLEhdflWv02m5rstMq3z2xJxjKrTBh4etvy1FWX8XfLcfRxopkveWj
         wwG3riO8BMCYwk31CqVEP9Yp3yrfCdGCmEL+Or4d+HIWlYk3wIHNeU/z4l/jSv00C9PI
         lEvL3mjs2DSiUPtc03MLh98LXAaC3+IU4goMc/60fdIl5KDrigrqFkJGIsCTnuzg7zFK
         NviJT36MSXkdmwEuAAlbR2YF5Va0j3sznsy33Yt2PPZWpi9XcIonBbFlGsyibsQ4MOJa
         /S9DjbOoVBzSrzPKgaRGgDdJS+I/dPQ8iGy9jnlb5zqK4LJKg/rIdQ9jvziMdH4llfaJ
         9tfA==
X-Forwarded-Encrypted: i=1; AKwUvBx0jCQ74SgvsFrKsw2Z+PREFkkORvKVrb7UkPqXyCcqxuSDtGpsxKL1FmzPhz5x1m4V2s9WcaUqBTUBw/U=@vger.kernel.org
X-Gm-Message-State: AFuF++nXovRZAJcvfmRBuyb2LiMtcON+60QAqkekiiagYXF0FXQejCBC
	iBOrybxUD3F8L3WrLP7Sbt/Wo+GYkKMG1NthdovalyckHLZ+iFWtst79W4bwrijLHUFb+1CsKzk
	eTLhL4xP+3oAlr4ubAh3KC65bA3TiKIYb4IvgKeVxz99KJlnuQj1478+Rw6HeQhzAdA==
X-Gm-Gg: AYBFou1OeuFsAz+hJ1oxC11mORvQDc7tDwvX+dZ1FDyCgjofHSCUFTYBg3CnqirOXeW
	ut2tmR6d5g3EBWfJBdNuoC3mgwas8bM/y8S8zEWRI3f+BXNkGj/FFW/gC8AxDb/FIS+lsd82VaV
	VkJGmGOYHEn4WdR7HcxI5RaRjyalcxwZFtXeOMsB9oCnp3vwbDoUfnr5Af0m//OymvXb/UC1z+q
	kLXqleq9RfAnQNKfwGtn/LqJXaweo+8GNuxiC+BB65qEmoAcjBPtiNMtL9xZMS7Yo9iFB5BmL1J
	/Ijm/VUAQ4zlht4bHPmgaPTykArAJu1bPYJUEyMrpZExqmFqtkINi4l+dCicQt+cYknd8uJ6
X-Received: by 2002:a05:622a:448:b0:532:8827:a9bd with SMTP id d75a77b69052e-5329e49522fmr8782481cf.39.1789679757472;
        Thu, 17 Sep 2026 14:15:57 -0700 (PDT)
X-Received: by 2002:a05:622a:448:b0:532:8827:a9bd with SMTP id d75a77b69052e-5329e49522fmr8781941cf.39.1789679756871;
        Thu, 17 Sep 2026 14:15:56 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532620b0c44sm59939841cf.26.2026.09.17.14.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:15:56 -0700 (PDT)
Message-ID: <9442921931d5c4b78d4345ff87b51b8e6e668d2c.camel@redhat.com>
Subject: Re: [PATCH v2 2/4] drm/nouveau/clk: don't use the pstate cursor
 after the loop
From: lyude@redhat.com
To: Francesco Magazzu <postadelmaga@gmail.com>, Danilo Krummrich
	 <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>,
 Karol Herbst <kherbst@redhat.com>
Date: Thu, 17 Sep 2026 17:15:55 -0400
In-Reply-To: <20260712123616.1180830-3-postadelmaga@gmail.com>
References: <20260712123616.1180830-1-postadelmaga@gmail.com>
	 <20260712123616.1180830-3-postadelmaga@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Sun, 2026-07-12 at 14:36 +0200, Francesco Magazzu wrote:
> nvkm_pstate_prog() walks clk->states looking for the entry at index
> 'pstatei' and then keeps using the list_for_each_entry cursor after
> the
> loop.=C2=A0 This is not triggerable today: every caller clamps the index
> against clk->state_nr before calling, so the loop always breaks on a
> real
> entry.=C2=A0 It is safe by virtue of what the callers happen to do, not b=
y
> anything the function itself checks.
>=20
> Should a caller ever pass an index that is not on the list, the
> cursor
> would point at the list head rather than at a pstate, and the
> pstate->base.domain[] and pstate->fanspeed accesses that follow would
> read
> past it.=C2=A0 Rather than leave that trap in place for the next caller,
> track
> whether the entry was found and return -EINVAL if it was not.
>=20
> No functional change.
>=20
> Signed-off-by: Francesco Magazzu <postadelmaga@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c | 8 +++++++-
> =C2=A01 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> index 42f3709e0..4d546b07f 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> @@ -270,13 +270,19 @@ nvkm_pstate_prog(struct nvkm_clk *clk, int
> pstatei)
> =C2=A0	struct nvkm_fb *fb =3D subdev->device->fb;
> =C2=A0	struct nvkm_pci *pci =3D subdev->device->pci;
> =C2=A0	struct nvkm_pstate *pstate;
> +	bool found =3D false;
> =C2=A0	int ret, idx =3D 0;
> =C2=A0
> =C2=A0	list_for_each_entry(pstate, &clk->states, head) {
> -		if (idx++ =3D=3D pstatei)
> +		if (idx++ =3D=3D pstatei) {
> +			found =3D true;
> =C2=A0			break;
> +		}
> =C2=A0	}
> =C2=A0
> +	if (!found)
> +		return -EINVAL;
> +
> =C2=A0	nvkm_debug(subdev, "setting performance state %d\n",
> pstatei);
> =C2=A0	clk->pstate =3D pstatei;
> =C2=A0

