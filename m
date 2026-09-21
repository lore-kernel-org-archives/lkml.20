Received: from mail-ej2-f23.google.com (mail-ej2-f23.google.com [74.125.228.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADD82D8378
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.151
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789953569; cv=pass; b=GnIyjMyWWZXItwtF+z2XM1tMIzOQEiju1CuF7WeSEweqPc526kiyOtPc68cKco2t1mJsN5CzUMWJRvGl51TSCd/RgJ7EctGCe5F/e8obHXttBM0nFDeZgE6j7NsMShK7ysRDg4pmIcjaUvBCITwpFi4j34RWJhuXryDjPAT4lt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789953569; c=relaxed/simple;
	bh=524Exas1fPv38RjrxCqkSKJKlK7ycvZRRydZy2op5Qo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NEGYRM6HTHUciEZLC9zaVBHgKJK70A3UgXeMKGZvLH6NMEeQ7E25XpTQwHtcRVuK3c9joBBp67888bSpwRswLC5q6JSAvpvoRTwLpnKa4FBN23P3rxmasiBmeI7dQ+iZ3r1Heg+xMZp29kKXfHzwgj7x6eN5LIalQ4yrowtjmaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QIvRRLK+; arc=pass smtp.client-ip=74.125.228.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QIvRRLK+"
Received: by mail-ej2-f23.google.com with SMTP id a640c23a62f3a-c25ef7a3ce9so287441166b.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:19:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789953565; cv=none;
        d=google.com; s=arc-20260327;
        b=eyr3tjwSWoDQyB6KOY7p4SyKLkz7Mj1sz+nhEgMhopskeqQOBpO5Y6c3G+wYk0P7em
         yp+26qxofXVV+IyRr1Lg1N5UTJvAi2r9UOdgF5c1+XFZy9bzghfNimnTphgYf5a71jbc
         xb8HmtXg/BP/uAWc3dxgWPjiuPLeSIlxcj0wvTW2VcRx1yRytLnU1xCHwPThIFgRsrmF
         bxvRT+w7TkOphjXCq5EkQDrL78+08pd+gt9jm9Zift4YnViMjWZB5qu6NPKONoXKc3Ef
         /8R/+NO3SgT0JmvfEWJld8RtYkuuaSIQai7143FeW7a6CpxY3LnVXqCSgHnJ0z1U4Zpt
         S8AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hfhh+c5YY12EVXNVBu8sm0eRIhxIeh4aWLnX4aXKNYo=;
        fh=wv8ygJjy6ZMHbSjN5cDRtrjmHBkXoIkAFAY8gwxeq3o=;
        b=e9NtTkkNx+yQat8XDpVjeCJXgjqlGqkQh3UvxFOW5C7gr+PPt5T6yN30a612VVR9+u
         r3Ty93ErN7B0TMChYz7Njfus/10cRwiYrk3qhDZ/StW/5CYCCCRo66BphIQj+rpkZlmH
         x9ysW242QdE5oysUHwPjuM7ntvZmbLC+yeKErVWkCGon4O6pHoa8YbpXmPQYBKZcs/9o
         eQcaJzboFv3eSxkVCkbNe+IOF/ecVz+/UOpB/udWzvvsrOMd4I1Wt16mresy8Ix934Sc
         1blCO168IFX2fvgoLHsdzDXdFLIHUZL6aTAUFLBG+soMmT2vCCMzTpxwLrcagIksZi9I
         VQow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789953565; x=1790558365; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hfhh+c5YY12EVXNVBu8sm0eRIhxIeh4aWLnX4aXKNYo=;
        b=QIvRRLK+krY8dmixuKYy9NGi7X84FB9k0JcS8q64IUdvdMpDGXPnOh961kiG9EGpdl
         WEiTMgPtC+osI/S7LOe8GrrCHMbZWNRyuoHAKCVIoLKWmrl+BugTcqiT7ry769oKYf/r
         Xvsc2J1KVkjrsUprJAk0esKLyZkM3BmeM9uTUV2p3mRGPiSfNoUOt9ZZJyQeLlR3kNTv
         3cQDIdYa0oEAeiTQl10yBQC37x/uiDSAA/vlRO32Hw0hMyHxYQ0R2ED3dMPC3TP+2raL
         9k1oOvKSKlTg/frOK5HqK/mhwGk8OxQU2g+OoYrV4g5LSOIJaebj93PhjUjzKShwHRId
         PXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789953565; x=1790558365;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hfhh+c5YY12EVXNVBu8sm0eRIhxIeh4aWLnX4aXKNYo=;
        b=scNX2tcPNCOvlv1+5C2T6m9CvbtaTj00c1PAnvTheBk0kXRB0iE6yfp6wcl35ihGzu
         vVKsppOZp63WAeFtvoPQWDUll0QlwqrbBqTQiYK+QeRu6hCRJKklfRFLbdqF9kA4NcgH
         /52smxsnwUFohk2wF2rkMoDZvUshdWHr88qvI8LoUyDA58XryJi7gWj3qAEcPGHc7NO2
         lnkiQ5eP56/j85Rzt/18uE0jK4Qqj2/sGAplXOUG5B5QrznlNaJqPis0XDlsm4PiMOem
         1kyXDNZjwp9m8cL2O+buQaojzSprW8C3BO0rjGMkpG8sBXoJd9p/jNI7lfzjB3IPgeLC
         4LiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNZDLtnl0Ksb56ux2jR9KUon0q3to4l7B6g0JiKEZ6VMakAEOhFhs2aXor9ddwrYd2pbyARNRYuPQSM8o=@vger.kernel.org
X-Gm-Message-State: AFuF++lNpDKVZM8/VJpdLjCTHN9y/aZ1jFKlhymtQhVIjisPX4/Ckuar
	nVy7TCOgie5Ycx6r0vWqKET8iFV+hLWbun3BUFmKCZ/lKwAVrzzUjbBofWn8rNKk8h6+kWtFqf3
	J9N+iK8fLYR7hSs7ukMk+iPnR0t7ll0M=
X-Gm-Gg: AYBFou1uh9LKHvpf77K6RgEZWWQknbCANVRlfqNpvCH7nH7JjPe8MPMi8wZd3WKdp2M
	J0LvRb/EU794t1fX/t+KINvT3Ygzx+aEzskChVJP1huyS5QGALX/vmYyfOmX5s8LXGxrqZO06CU
	JNivM57GLue2QGsMlEHNAoTw8KmUrHVd27LZJdJn5JDssH5i5iRYMFokeIz0yUPbiGdMm/gTQNP
	lfxHTT3Nrfwqw/pK11SxBGnbMt1f/YCRgmutLOPFtLB9p8NELApH3Nqs1ZTVfeheDZeBYSwPkwT
	djfKM1xY6MW4iw/0BBhhU4A/N9mHBD7dfLkfuEJzcd2pwHaVnJ7qq7NAXWi+Y8l8DJ2rbf9GqJ0
	GfIQNXMiX5OZR73vq/AcggIoES3qNi67B6jzfC0APK72dUJh7nhuF7WNguWG+CAWb+feTd/Xs/T
	I/fiHAeZ26YpPhTBZ70xSU+/gT8bhmcfiZX5hj2umvaSO7Gu7G4ye1uaJ7mm3JL1ZNcQ==
X-Received: by 2002:a17:907:d0a:b0:c28:ec7c:27ae with SMTP id
 a640c23a62f3a-c2a15aecddfmr767261666b.25.1789953564969; Sun, 20 Sep 2026
 18:19:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916223228.271815-1-rosenp@gmail.com> <178994444750.2160803.15737331291670911275@kernel.org>
In-Reply-To: <178994444750.2160803.15737331291670911275@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 20 Sep 2026 18:19:13 -0700
X-Gm-Features: AcwNN1V5USA9DUgZKgQR3NMPwqVnFQM1hGdEh4oEzz3Sj6DomwRh8WV62bkhbYI
Message-ID: <CAKxU2N-1Xm5oHSriNWnmaYW9XM8nNV==6dq=kwSja=x1v6Zu2Q@mail.gmail.com>
Subject: Re: [PATCHv2 net-next] net: fec_mpc52xx: remove dead resource size check
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 3:47=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] drivers/net/ethernet/freescale/fec_mpc52xx.c: the patch
>   deletes the only runtime validation of the firmware-supplied register=
=E2=80=A6
>
> --
>
> net: fec_mpc52xx: remove dead resource size check
>
> This removes the minimum size test on the FEC register resource in
> mpc52xx_fec_probe(), on the grounds that every in-tree device tree
> describes the FEC node as a 0x400 byte region and the stale error message
> referenced a file deleted in 2008.
>
> > diff --git a/drivers/net/ethernet/freescale/fec_mpc52xx.c b/drivers/net=
/ethernet/freescale/fec_mpc52xx.c
> > index 5188551add0b7..14ad03d75598c 100644
> > --- a/drivers/net/ethernet/freescale/fec_mpc52xx.c
> > +++ b/drivers/net/ethernet/freescale/fec_mpc52xx.c
> > @@ -834,13 +834,6 @@ static int mpc52xx_fec_probe(struct platform_devic=
e *op)
> >               pr_err("Error while parsing device node resource\n");
> >               goto err_netdev;
> >       }
> > -     if (resource_size(&mem) < sizeof(struct mpc52xx_fec)) {
> > -             pr_err("invalid resource size (%lx < %x), check mpc52xx_d=
evices.c\n",
> > -                    (unsigned long)resource_size(&mem),
> > -                    sizeof(struct mpc52xx_fec));
> > -             rv =3D -EINVAL;
> > -             goto err_netdev;
> > -     }
> >
> >       if (!request_mem_region(mem.start, sizeof(struct mpc52xx_fec),
> >                               DRIVER_NAME)) {
>
> [Severity: Medium]
> Is the "can never be true" reasoning in the changelog accurate?
>
> The changelog says:
>
>   "but every in-tree device tree describes the FEC node as a 0x400 byte
>    region, which is exactly the size of the struct, so the condition can
>    never be true."
>
> The in-tree DTs (charon.dts, lite5200.dts, mpc5200b.dtsi, tqm5200.dts) do
> all use reg =3D <0x3000 0x400>, but the device tree is firmware-supplied,=
 so
> the blob is not restricted to the in-tree copies. Bootloader-generated DT=
Bs,
> out-of-tree board files and overlays can supply a shorter reg.
>
> Does anything else reject a short reg? of_address_to_resource() only chec=
ks
> representability and add-overflow:
>
> drivers/of/address.c:__of_address_resource_bounds() {
>         if (overflows_type(start, r->start))
>                 return -EOVERFLOW;
>
>         r->start =3D start;
>
>         if (!size)
>                 r->end =3D wrapping_sub(typeof(r->end), r->start, 1);
>         else if (size && check_add_overflow(r->start, size - 1, &r->end))
>                 return -EOVERFLOW;
> }
>
> So reg =3D <0x3000 0x100> translates fine and reaches the code below.
>
> Also, Documentation/devicetree/bindings/powerpc/fsl/mpc5200.txt does not
> state a length requirement for the fec node's reg, so with the check gone
> the 0x400 assumption is neither validated in code nor documented in the
> binding.
>
> [Severity: Medium]
> After this hunk, does mpc52xx_fec_probe() consult resource_size(&mem) at
> all? Both the reservation and the mapping use the hard-coded struct size:
>
>         if (!request_mem_region(mem.start, sizeof(struct mpc52xx_fec),
>                                 DRIVER_NAME)) {
>         ...
>         priv->fec =3D ioremap(mem.start, sizeof(struct mpc52xx_fec));
>
> __request_region() validates against the global resource tree, not agains=
t
> mem.end, so a short reg is silently over-claimed rather than rejected. Th=
e
> declared length then has no effect on the driver at all.
>
> For a truncated reg, probe now proceeds and touches registers past the
> described window during hardware setup:
>
> drivers/net/ethernet/freescale/fec_mpc52xx.c:mpc52xx_fec_hw_init() {
>         ...
>         out_be32(&fec->rfifo_alarm, 0x0000030c);
>         out_be32(&fec->tfifo_alarm, 0x00000100);
>         ...
> }
>
> drivers/net/ethernet/freescale/fec_mpc52xx.c:mpc52xx_fec_reset_stats() {
>         ...
>         memset_io(&fec->rmon_t_drop, 0,
>                    offsetof(struct mpc52xx_fec, reserved10) -
>                    offsetof(struct mpc52xx_fec, rmon_t_drop));
>         ...
> }
>
> Previously the same input returned -EINVAL with a diagnostic. If the
> over-claimed range overlaps a neighbouring reservation, the failure now
> surfaces as -EBUSY from request_mem_region() instead.
>
> Would it make sense to either honour resource_size(&mem) here (for exampl=
e
> via devm_platform_ioremap_resource() or of_iomap()), or keep the minimum
> size check and just fix the message? The stale mpc52xx_devices.c referenc=
e
> and the %x versus size_t format mismatch look like the only genuinely dea=
d
> parts of the removed block.
It is close to impossible to get anything similar to this merged.
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20260916223228.271815-1-rosenp%40gmail.com
