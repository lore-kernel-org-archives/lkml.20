Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB2123ED6A
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 15:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791733502; cv=pass; b=GApf0Dgha0BqAHrwUHg7b0HgcXzF+cXyAD8DvgmmLSda6wIM5KGi7hHhk48uT18VXsDWXwiOsvEyO7mDwN5v+ufYTOUdZNeeYNYAts8uDFY2QxTaAbX4zrSaAg+XE4K3A6KwY1I/WovINNeyyAFWOIlKy2NHBqTvHyQYpV8yTts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791733502; c=relaxed/simple;
	bh=6PTL+Y5xBP60WaVey/AEHQGQD9gpt6fmHlYPvz+QoNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JG9BPsGoRoV+SjvM2xERTCfPbrkmYqmQ68a8oDSiqctAbLLkr3OPaqn0VZD6wIoOPTBfypT0jACt5B8o8zvwpGoYEYzjrOF4zD98UWouSHpgfnlXKuwKfMCkW+dvwR0m3SWBS25Ka9OI5Vp2weI/ed+5qov9ECUq16g5AkYT/cM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EUo9nJoz; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EUo9nJoz"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5337fb43c16so13853261cf.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 08:45:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791733500; cv=none;
        d=google.com; s=arc-20260327;
        b=IOxxJh97ogKggroWehfJVQWoQ7hustwUenHadzU7rGAVP4Xh+SyWERiHiSsDbH0vzh
         f7aJkJ6Y+rVZ3mXz9xCKoRuM+YNcx3mdvGYQAoe1pDhRp0lN5HXdCZLHjiyg+i5JSAEE
         zWc2re7iICNeiTfe+wSoHeH26BZUN+4kJvmuu+uqZQIPrUbTVWSN0uoT78wBUsx0c9ef
         UK7z/yORE5Zl8FPKxYOwfrgDg5di6/b/PojRcplhXQVNeHySyeN+fo+CdUojAX57lpyO
         HpOQwMrDzOUkxdwgclI2Saruvb6KQVez40zuPSURIeU+8/dn3f3IULJQGZb9B7u6ndNF
         qCFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mdktJhqdYq3GRvhawHItOJ6wrK1i5Q8hbqyZyvmCYls=;
        fh=7YnyVtA9yeoEKGpclnd7PCRFqAAoUEd9XIJo0JNEJq0=;
        b=lscgBDt+/5fxLKgTy2bBMZnWyxrO+Mbl93hA20efjRV2WSbDvMRBpiNMQ38Z0pR917
         CgfMIt0DfeJqadT4rcID8J8xn+mI9nJw7CpVzfVMoGV8mCaO2oujod8AmMEKXpSQYoEb
         IsAnSeHoeWsdGbMZ5PjtV8l//CO1aXWNZx39SUrEgS1RyiLcX5Lo8fem/7jnUJWO34cg
         aM2Ds779nvuhk+wXqNGzwj6j3ThJj84jbmGAWJTgkZ4nyC/E/eiFRUMMLVySkFufOpo5
         2qJ0EP0HRUuSwQJr/5FRrvi48TFJ2JB1JBBngOIP1dvkb5ifx7mrncwwdqKEJz07G4Bi
         1YkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791733500; x=1792338300; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mdktJhqdYq3GRvhawHItOJ6wrK1i5Q8hbqyZyvmCYls=;
        b=EUo9nJozQw02X98Ct3tEXk6wn3nrwYUr/1FT1sD376jSnLUi1hVRWJsc4S4gIABlMg
         frEw/BS+FW7mfB0JMj+Kb4BKiAhLaqovn3JoeJoww/A4lzCH5U52TwZo+wDVNpwrLUkQ
         d+c8xzfLdRBgfpgr2XRkS3NyBeFZTSHDkRJ+vebzRJ0PMubxUFsRtsKikmEIU2ESh2L3
         GvPVeJLnbM9lrkavHfmaU9RV0lBWG/cSAre63xsivWjih6JAdQA1KmmDH/dX0y5c7uNV
         C2NHKZVwifJzcJQdriPMM9HCS3r0FTGi+VK0hr9B9fKdKZACqSsCQNsJ/xs9jMb1M79R
         R61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791733500; x=1792338300;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mdktJhqdYq3GRvhawHItOJ6wrK1i5Q8hbqyZyvmCYls=;
        b=0kx5B3sUKExXgHNraW9AL7KVdLl5ttG+I7EpCpg5Aw2FElEvppJy/UOUXjytFPAkJ/
         06dNGy9Dx3iJBrCeFm4k0dLB0ynSfTUJ+via42Vi4RGxmLiuxJmDJfDeaT1+rAaLJ3PX
         LaaKqwy1/HSaHo4Toh0VXA+oF1HlMzwXfIjldfN6KAzSi41fO4/Vl3fojcrdMke6T6P7
         E3ku6R1MblsfFizemwvr9i5X8hNolp0/xVGP2rLqyNJWA114Wg0M/enCa6WBWVJO9au9
         34/W51gQa3MBRXnuHtaxwGsCFZhSOBr3qboa0OBVNFqMjKOYM15WJsqLYI75xQXScuHF
         U7kw==
X-Forwarded-Encrypted: i=1; AKwUvBx7dIGZP31LGzNyhx2qkE05m530535NwZsbdk8EQPeOnnbBmYZ1vqeCWo7eyqu6YRwHKYi/SI/u1e2XHGc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLz+pnoiALro8mDGY1MbdVai/mqxXZQ2n3dl3E4Cl5FW1S6Ez8y
	R4Ft6t+XI02FwK3HKPKmDLepvPFHAj1tUAePe+VJhIZibOJGA/DYgia37rTrvKAYQTbVTBS0Yw+
	aDG/4/Gtdg3xID5B6D3PjcmVCG3MDhLCUdSnDXRsK7A==
X-Gm-Gg: AYBFou1fEos6qL2FGPxT7eyX28cqKBnKShjogHn2OkKNoB7mLERpQpGm6OY32+/R0tg
	8JLr2fzHza25KGj8gUv8sCqR1hWnuniBVN3C172tHs2qDT+cGPnyABMfWTWFK+a5vER3Wrt5kik
	HYFxP+r80wQKKUoQF4XNY3aW23GbJGmc7v3/sZqqMF6F2bs9ZZA/A1nseoGJNK7X66jp33QkkOc
	zpWX5LMA9cVe2OkFHGyz4CCEyC3TN67DC6rhw/+ZB5X87fQMWPwvZxd310+5pqRRdIBggzDxGYh
	f2DyK7g9ulN4GYT7PHLT6lGyWJ8PfMDmrpXTlVleH9G9KOKbGvcyJLR1SVPFy/vY2P1L8YDObCn
	IAplUtk2KawTyMGvZxBsqFSzSqyeI5d+eLICG22RPCtg8BgzC1v1b8ubjmkl3nJLWqWqF4v6jVH
	tAbqfBzEXGwEptX43FRj9xcUFO+5ASQP0aEU9yCK+qP5cLPzn0WcmjVUua+BA/0iI0XsLlOvXt4
	4pDjA1u58NmoJ468vcW1jP+709n3uc=
X-Received: by 2002:a05:622b:98:20b0:535:a5fb:6461 with SMTP id
 d75a77b69052e-535a5fb6a85mr80969221cf.76.1791733500202; Sun, 11 Oct 2026
 08:45:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011051906.60397-1-jain.sm@gmail.com> <20261011051906.60397-2-jain.sm@gmail.com>
 <e146448b-5210-4215-821f-181c91625141@kernel.org>
In-Reply-To: <e146448b-5210-4215-821f-181c91625141@kernel.org>
From: shashank Jain <jain.sm@gmail.com>
Date: Sun, 11 Oct 2026 21:14:49 +0530
X-Gm-Features: AclHuK_vW5uLKdbCkt3Wwb_YBZ5joWn4Fojb_E9Aoddw1Wc_Ifd1J7tCy2EN_g8
Message-ID: <CA+FWx=n7E+z_LE-jRchZQzBBK8O3vbaq554GA7-D_1e_AS+V-w@mail.gmail.com>
Subject: Re: [PATCH 1/2] block: only use the cached zone report if
 BLK_ZONE_REP_CACHED is set
To: Damien Le Moal <dlemoal@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	Johannes Thumshirn <johannes.thumshirn@wdc.com>, Hannes Reinecke <hare@suse.de>, 
	Chaitanya Kulkarni <kch@nvidia.com>, "Martin K. Petersen" <mkp@kernel.org>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026, Damien Le Moal wrote:
> Can you reverse this if to be "if (rep.flags & BLK_ZONE_REP_CACHED) {" ..=
.
> Also, the condition should probably be:
>         if ((rep.flags & BLK_ZONE_REP_CACHED) &&
>             blkdev_has_cached_report_zones(bdev))

Reworked exactly as suggested and reposted as v2:
  https://lore.kernel.org/all/20261011154018.48913-1-jain.sm@gmail.com/

blkdev_has_cached_report_zones() is now used from the ioctl, so I moved
it (with its comment) above blkdev_report_zones_ioctl(). Patch 2 is
unchanged and carries your Reviewed-by. Retested on zoned null_blk.

Thanks,
Shashank

On Sun, Oct 11, 2026 at 8:16=E2=80=AFPM Damien Le Moal <dlemoal@kernel.org>=
 wrote:
>
> On 2026/10/11 7:19, Shashank Mohan Jain wrote:
> > BLKREPORTZONEV2 takes the flags field of struct blk_zone_report as an
> > input. With BLK_ZONE_REP_CACHED the report is built from the zone
> > information cached by the block layer. Without it, BLKREPORTZONEV2 is
> > documented to behave like BLKREPORTZONE and to get the report from the
> > device: this is what the changelog of the commit that added the ioctl
> > and the comments in include/uapi/linux/blkzoned.h say.
> >
> > blkdev_report_zones_ioctl() only uses the flag to validate the input
> > and calls blkdev_report_zones_cached() for every BLKREPORTZONEV2
> > request. A caller that passes flags =3D=3D 0 gets the cached report, in
> > which implicitly open, explicitly open and closed zones all have the
> > condition BLK_ZONE_COND_ACTIVE, and an explicitly opened empty zone is
> > reported as empty.
> >
> > Example with a zoned null_blk device (10 MiB, 4 MiB zones) after
> > BLKOPENZONE on zone 0, and a write of 8 sectors to zone 1 followed by
> > BLKCLOSEZONE:
> >
> >   BLKREPORTZONE:             zone 0 cond 0x3 (EXP_OPEN)
> >                              zone 1 cond 0x4 (CLOSED)
> >   BLKREPORTZONEV2, flags 0:  zone 0 cond 0x1 (EMPTY)
> >                              zone 1 cond 0xff (ACTIVE)
> >
> > The uapi header marks BLKREPORTZONE as deprecated in favour of
> > BLKREPORTZONEV2. A program that follows this and does not ask for
> > cached information can no longer tell open zones from closed ones, and
> > is handed BLK_ZONE_COND_ACTIVE, which is only defined for the cached
> > report.
> >
> > Call blkdev_report_zones_cached() only if BLK_ZONE_REP_CACHED is set,
> > and blkdev_report_zones() otherwise.
> >
> > Tested with zoned null_blk devices in qemu: a program that compares
> > the reports of BLKREPORTZONE and BLKREPORTZONEV2 with flags 0 after
> > the sequence above finds the differences before this change and none
> > with it. The report with BLK_ZONE_REP_CACHED is unchanged.
> >
> > Fixes: b30ffcdc0c15 ("block: introduce BLKREPORTZONESV2 ioctl")
> > Cc: stable@vger.kernel.org
> > Assisted-by: LLM
> > Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
> > ---
> > Prepared with Claude Code (Anthropic), model Claude Opus 5.5
> > (claude-opus-5-5).
> >
> >  block/blk-zoned.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/block/blk-zoned.c b/block/blk-zoned.c
> > index 475aa16bc4..9555eae91a 100644
> > --- a/block/blk-zoned.c
> > +++ b/block/blk-zoned.c
> > @@ -400,6 +400,13 @@ int blkdev_report_zones_ioctl(struct block_device =
*bdev, unsigned int cmd,
> >       case BLKREPORTZONEV2:
> >               if (rep.flags & ~BLK_ZONE_REPV2_INPUT_FLAGS)
> >                       return -EINVAL;
> > +             if (!(rep.flags & BLK_ZONE_REP_CACHED)) {
> > +                     ret =3D blkdev_report_zones(bdev, rep.sector,
> > +                                               rep.nr_zones,
> > +                                               blkdev_copy_zone_to_use=
r,
> > +                                               &args);
> > +                     break;
> > +             }
> >               ret =3D blkdev_report_zones_cached(bdev, rep.sector, rep.=
nr_zones,
> >                                        blkdev_copy_zone_to_user, &args)=
;
>
> Can you reverse this if to be "if (rep.flags & BLK_ZONE_REP_CACHED) {" an=
d to
> call blkdev_report_zones_cached if the condition is true? That would be a=
 lot
> more logical.
>
> Also, the condition should probably be:
>
>         if ((rep.flags & BLK_ZONE_REP_CACHED) &&
>             blkdev_has_cached_report_zones(bdev))
>
> to be more efficient and avoid a call to blkdev_report_zones_cached() whi=
ch will
> turn into a regular device report zones.
>
>
> --
> Damien Le Moal
> Western Digital Research
