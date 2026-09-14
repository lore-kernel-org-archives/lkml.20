Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFCF48EC71
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789408962; cv=none; b=uDcUM1MpKE//Gwn/vbRfaBTRzjBgguFpLY5bj8sDl1+ze4ycZPxTT9hyMdlwNALWbRn0Gx3RsBiLX+K53HekZ3d/RQDSF55eFHltkB2ON43Am3DgsLNzD1KSH1lv+pkVKqBzjIaTpBfg/Bm0vHoRO6Srh9kOvzoaNGT2A+GcXpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789408962; c=relaxed/simple;
	bh=CbmML/vKsaN+MWUnpte02DsCF76GYqE2t1EdZsqtJkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X45mcx66m4Y4YI7m0M0+gThDtdeoqTbpIBnPxCy4w+tH9g0DZ+KB5twA/GpDYhV2TMOUscunb14cqHMuCP7o9nY8Rb1vlbTbLATaUO1GSky2T7W1lEKt/NfhSFGdBvU6UsdGA+8XALk9jW2cuOk1i5xg+4QVz6nnPBwG6rtyZSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gy6Pfmot; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gy6Pfmot"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 732DE1F00893
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789408960;
	bh=EI/hgccyqJYl8Wn5rmh2eoCrWHAuMVpeg97UYtuVp8s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Gy6PfmottFl42tiZ7YbkvVhRDqEtYHl/TVF3IxBkreKeuFF3Tss2NvcaldAhfiM6m
	 bg4TQc8QtyNuZQdw31hGfYZdrdlrOh0Z8cDdcfXskv2kQDZkY56FOCnTy778h7nbzu
	 0dyQIyUMfTNbNAk/H3zELMcSDODn+bmgVD/Tj0G1Hvfskdja8fHSn8ENOcT4Z5quy6
	 5sfR+mZFpQN1WDnmXPwU0NbqQuJ+dQ71t5TlBkHV5ALC29A5zxa+xeBefwxl/zvMfv
	 8aTuMx3gdAItquJf2kVPWPMYT4txxnVpVrT9Dz/5yE9k+7rUDdQfInoe7tK19mHubB
	 7ytmTWV3nb0Bg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a33307ecd9so39324391fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:02:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByvBUtSLR71oDDX0FRu/dsrB16iz1iklpBBs77bBuG9+wEeJPX7LC142XpNy/9EYlIhhxZSPMYl58Cit/s=@vger.kernel.org
X-Gm-Message-State: AFuF++m62TOhcotcklgpnb4onHVJpg8iCD5GMqrKM6kFfKoqyy8dMhUS
	/RBm2/3zOisfNv61seoJbzj02ida4Dfq7Ixdp6kwmRSvY6rzaAfgFx2IcyVwW7v4FfxlG6HoHfl
	u2ue4/YSggWKyljfbZw/enle+949/YfY=
X-Received: by 2002:a05:651c:a0b:b0:3a3:4c63:771c with SMTP id
 38308e7fff4ca-3a5c88ab524mr5666321fa.12.1789408958806; Mon, 14 Sep 2026
 11:02:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910203727.63489-1-mhun512@gmail.com>
In-Reply-To: <20260910203727.63489-1-mhun512@gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 14 Sep 2026 20:01:21 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gsa3ybAQvusfO0WZX+ZjK9LGOD3HUWHiO+5HVC8WUXgg@mail.gmail.com>
X-Gm-Features: AcwNN1WMOG02-FJ8ACeaT2XmVVKlrZsyVcaRXPpQgqr4pw2nAOcMbMNWji4E4Jw
Message-ID: <CAJZ5v0gsa3ybAQvusfO0WZX+ZjK9LGOD3HUWHiO+5HVC8WUXgg@mail.gmail.com>
Subject: Re: [PATCH] PNP: Detach device after resource transition failure
To: Myeonghun Pak <mhun512@gmail.com>
Cc: rafael@kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 10:37=E2=80=AFPM Myeonghun Pak <mhun512@gmail.com> =
wrote:
>
> pnp_device_probe() attaches the PNP device before it activates or
> disables its resources.  The attach changes the status from PNP_READY
> to PNP_ATTACHED, but errors from either resource transition return
> directly and leave that status behind.  A later bind or manual PNP
> configuration attempt then sees a device that is still marked in use.
>
> Route both errors through the existing failure path so it restores the
> status to PNP_READY.  Do not disable the device or clean its resources:
> pnp_activate_dev() only marks it active after a successful start, while
> pnp_disable_dev() preserves the active state and resource table when
> stopping fails.
>
> This issue was identified during our ongoing static-analysis research whi=
le
> reviewing kernel code.
>
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
>  drivers/pnp/driver.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pnp/driver.c b/drivers/pnp/driver.c
> index 6d58b1465081..80c2a0f15b80 100644
> --- a/drivers/pnp/driver.c
> +++ b/drivers/pnp/driver.c
> @@ -96,13 +96,13 @@ static int pnp_device_probe(struct device *dev)
>                 if (!(pnp_drv->flags & PNP_DRIVER_RES_DO_NOT_CHANGE)) {
>                         error =3D pnp_activate_dev(pnp_dev);
>                         if (error < 0)
> -                               return error;
> +                               goto fail;
>                 }
>         } else if ((pnp_drv->flags & PNP_DRIVER_RES_DISABLE)
>                    =3D=3D PNP_DRIVER_RES_DISABLE) {
>                 error =3D pnp_disable_dev(pnp_dev);
>                 if (error < 0)
> -                       return error;
> +                       goto fail;
>         }
>         error =3D 0;
>         if (pnp_drv->probe) {
> --

Applied as 7.4 material, thanks!
