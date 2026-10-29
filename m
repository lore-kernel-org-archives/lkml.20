Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793264229;
	b=tYiQ8WKhFGMosuNE72fvzdm/oSxvIerRAbw7vXAe5QE6VvZirpsCTKi2xQYFojfar1PE
	 68Jvu1quJmFjQv5dSproopbi08rrA3Y7LCtZvQkgnma2EeO+UZMuhtpfc9d2E5YHiaR+s
	 M5Wt4HpulzYk6u3h0LA7RJXXQEjOIZ5be//lC9X2TLFq+5Dmd9p4tN+HC+z5dlhOePWuD
	 +6KRJdkpmoA8WBX3e/Q4JJ2psDqX2YhmyJtYumfha2MjZVjnwfk16FefsPxbM+1J0X3pk
	 MpWIKaN5QBz7C4JasLVm7zHFUekYvBsdziS2LVnfDRvPP63eZsauSP67Rbt/v8eULng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YEYkGOiLXKcBsMHHVyvIodqXJbKVYymQHbB/udibFPE=;
	b=tW/cWnHuBKnsPUbS3AEc0fn4Y0L560FG577dkXJbvIHAdqD5vjvKB7nn+Fg0+Hi94IQf
	 tMPl+xxEKe21gi5N/4tX/xllAQ5mdVJwvlbXTr/52Pk7+2kmChVJSnOgP7xqu/w3McHLJ
	 rJX5fqSWQ5fXssB5swm5nNGfij/bmXVM7AZitmTkXEUEOGDPj9zYqmqCyxgUjbvvYdpzK
	 rayfHKtXSWXJxczRtqkwqXPuYfZbjOw3lQsLcaUmplN5KT3AHb/aRx8q88a0RHRALBSXs
	 nHVuCehqpvaRHUECxFP0/wOn/vhaDahYsOESmd2S8zAI6qiL0KED2Jt58w98xnNJqsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zxeEC98O;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AB7606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:57:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5AB7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zxeEC98O
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-679a2297c55so2140459d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:57:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793264228; cv=none;
        d=google.com; s=arc-20260327;
        b=KWHBpdeYyrNLjiOq2ZbyE8JKvRpfCCX+SwCkCiKTm3CTyaPItHys11Vu84UBlcJ2eZ
         QzM6HbzS69BMmQ+fqn/8kD8NEKSUOb3ECaRqT/cDGHZwPu74YF0SLftLHpHBfqzA0/UM
         yzF5uJaggQleezrDoDwu6xcldVUakbVFrmr3qautR8XafcnJJsgyIFCi4n0GIRECj4UC
         mZ5vO8L4j9LJnZVarbTBhMxN2QXiWNbfK8g9Pk5gbgCOL8nqUcqkbbR4upa9zuoDAmQI
         Jw59wQ+RoVY7e17GdUgpQg57u9dmld6Ak9as3Q6mbDHVrist1Govl5jE23mvlImOWakY
         5Yew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YEYkGOiLXKcBsMHHVyvIodqXJbKVYymQHbB/udibFPE=;
        fh=dv7UMMwJcy+seMe59mnsiB65j4lIx+skonZW43GV5KI=;
        b=d89Jk2R1oKcoFZFPMf2shNQatKzXPPchU2Mcd0yoPFAHYg85mDPcPIMR713IEL41wz
         iNv+ybDCoPaIWVpB97cu6qp7n6Yb84aGI3bsz7k+m/0BnxjUT2nPMIeXh9D+fI1LJiH4
         a4C2D54akyqBVsnQRxq9mlDl6jin6kPGPIjR5LHqCDnJEjzpkuCj3t6DqbPMT2CIQw7o
         u0UBd0qNq6EANwnHGQ0r/vuxbCxWQpv7qu1KSUUPmrMkQ0E7ClhnIGirRxXvjvz+sAVY
         jgai5LL2qbl8e8/yVW1cOXRkpIe+qAVb/21rOBHI71taAMkB9Or7xEzJS+4TE7G/UfAc
         6yMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793264228; x=1793869028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YEYkGOiLXKcBsMHHVyvIodqXJbKVYymQHbB/udibFPE=;
        b=zxeEC98Oj4WpoX7QGt/z5YsgJg6CbDNf4qMkQ9/rF0REgVGR53j2mhJHHM97pKWpAB
         AaaK6XcbbkFMAQc6XYT0Kt4wH8R5DY1npn2aceWlpQsraeczif1nCT3RPKgxdvprcwHe
         Cyo6mMzXxO+9Y5cDKy2e66+cfYqXUlW+F7vFUY6WAduaoXwWurO1BTc2kBUU4Bv1j62W
         WzahFWBT7JRIUIoCs+VZO5HIJeznNKqkQigdHtaxGpvTCy8UcjhNUMoA3g8bJPs+l2JY
         iMGsBETftAKuShuwSnJSDAtRk/7ynrcHMb4VHwGjTSNL8iJHkvRHTsNygOMISZNMz+pr
         7XMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264228; x=1793869028;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YEYkGOiLXKcBsMHHVyvIodqXJbKVYymQHbB/udibFPE=;
        b=mWMDv9jBqOWq5mCBUO0FIO/645jPVOd7OIvXZM7AYLJ1/c/A9z0rTTG3xM1A+u60RV
         yMaaDa2RP4Ad6kF1WTskkXyU8ohkq2e0QboZo87VJhxQGf0U0AqP+grjoP16tGuzGZqn
         WqY3XbZzt+4D+GMdyCH1YPllkzAmSg82om8KCP6kGsDHQYdkMb6C5LO6JvsHdVcRcxvK
         W/JL2LQPDhobsQiZ72uZgyrbRcKqCx+I2yCcMuGYTnYMb9pUE9OPnLFAOt2YcAk/l7A9
         +36Ql72J3C9JhmNI1r1FNhRdeviU9k77bmH3Q9kUDkAZh3R3n5kYdF2gxf1R1CFp7F1v
         nF5A==
X-Forwarded-Encrypted: i=1; AKwUvByXFwdVIA4diTtca1i/rTGqpTC+pVeCupQn3px6VZEXzcEocFGJdQ/zpF09Hh5px3fBNPl69YZ7FMI/Dxc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqhnCaOje7RXHG4RQFW0jzC0zoQmoIplykFz0V+7M69VZ14EN9
	BlcDIRniCcsHkz+K0JxCOnrSOQEhvlv1u+/MUjTrVzhXJgPytuV2DqwkHU1tHa7QOUWTlemg5vk
	wrbXQWUgsIXkP1DJqgeB1C7pbfvL4tiQ=
X-Gm-Gg: AYBFou02apP5FNJOmYk7b7W0hG+qUuakcQHS3+GR11Z1d2hgXSdEj2Hx9BO2ZbPFo7u
	fpAveC3jLa1C2U6u4sYTsAIa29YXKsN08gOBe91FInd9rjclZkrly8lwxgcgjzRXpDY26cW3/vH
	Ep7PE2swa5nxY5e5ZTi9kKCmSjM8JLKHSLcs7CWgMrwbh/l0WqNXdFUEsjGKw6AOHUu7rVEupZl
	n+dEcwTfei8PmA3D+1ZAgHgw8+iconjtkJ+r+15xbq125hfTzvsepuyDoZufj+CYi8vO9+uhqZY
	X6V2NqmASY9ngA8GL+uE6PEfwUkj2SBB+yH1w5v+VWKMHexMF1oNEB8x+dsE+1e2JCxwCVKiKF2
	cpRMERsDrBhs2oP2ExIAzHxQbYRE9yue9AMMA
X-Received: by 2002:a05:690e:1a66:b0:679:a79c:95a4 with SMTP id
 956f58d0204a3-67a7bd15ffamr3128571d50.103.1793264227822; Thu, 29 Oct 2026
 01:57:07 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028-b4-btrfs-fitrim-interruption-v1-0-bf5c53738b3a@gmail.com>
 <20261028-b4-btrfs-fitrim-interruption-v1-2-bf5c53738b3a@gmail.com> <b00f8fc5-89f1-4483-8986-947392837a6b@gmx.com>
In-Reply-To: <b00f8fc5-89f1-4483-8986-947392837a6b@gmx.com>
From: Luca Stefani <luca.stefani.ge1@gmail.com>
Date: Thu, 29 Oct 2026 09:56:55 +0100
X-Gm-Features: AclHuK-Johsu-yxO4ADp4C3k1kpagtbBq9W5ex9Eh00g4fIknrHdSnalBZsHWbc
Message-ID: <CAO0HQ0VfHczGkTb0OOxXf38Cnu3sOufi24652UR0AJ5a7wzoSw@mail.gmail.com>
Subject: Re: [PATCH 2/2] btrfs: don't report failure when trim is interrupted
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, 
	Robbie Ko <robbieko@synology.com>, Filipe Manana <fdmanana@suse.com>, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Zhiwei Liang <zhiwei.liang@zliang.me>, 
	Qu Wenruo <wqu@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 28 Oct 2026 at 22:07, Qu Wenruo <quwenruo.btrfs@gmx.com> wrote:
>
>
>
> =E5=9C=A8 2026/10/29 04:25, Luca Stefani via B4 Relay =E5=86=99=E9=81=93:
> > From: Luca Stefani <luca.stefani.ge1@gmail.com>
> >
> > Treat cancellation as a successful partial trim as ext4 and XFS do.
> >
> > Reported-by: Zhiwei Liang <zhiwei.liang@zliang.me>
> > Closes: https://lore.kernel.org/20261028-btrfs-fitrim-freezer-v1-1-0ad1=
d58aa94d@zliang.me/
>
> In fact you should use Link tag here, for the original patch as a
> report. Not Closes tag.
I think that was my original intention, but I mixed up the patches.
>
> Otherwise looks good to me.
>
> I can change the tags at merge time, so you don't need to resend the
> series, unless there are other reviews that requires code changes.
Thanks! Will fix them up in case.
>
> Thanks,
> Qu
>
> > Suggested-by: Qu Wenruo <wqu@suse.com>
> > Signed-off-by: Luca Stefani <luca.stefani.ge1@gmail.com>
> > ---
> >   fs/btrfs/extent-tree.c | 5 ++---
> >   1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/fs/btrfs/extent-tree.c b/fs/btrfs/extent-tree.c
> > index 242db255cf1c..90e581c29609 100644
> > --- a/fs/btrfs/extent-tree.c
> > +++ b/fs/btrfs/extent-tree.c
> > @@ -6926,7 +6926,7 @@ int btrfs_trim_fs(struct btrfs_fs_info *fs_info, =
struct fstrim_range *range)
> >                       bg_failed, ERR_PTR(bg_ret));
> >
> >       if (ret =3D=3D -ERESTARTSYS || ret =3D=3D -EINTR)
> > -             return ret;
> > +             goto out;
> >
> >       ret =3D btrfs_trim_free_extents(fs_info, &group_trimmed, &dev_fai=
led, &dev_ret);
> >       trimmed +=3D group_trimmed;
> > @@ -6935,9 +6935,8 @@ int btrfs_trim_fs(struct btrfs_fs_info *fs_info, =
struct fstrim_range *range)
> >               btrfs_warn(fs_info,
> >                       "failed to trim %llu device(s), first error %pe",
> >                       dev_failed, ERR_PTR(dev_ret));
> > +out:
> >       range->len =3D trimmed;
> > -     if (ret =3D=3D -ERESTARTSYS || ret =3D=3D -EINTR)
> > -             return ret;
> >       if (bg_ret)
> >               return bg_ret;
> >       return dev_ret;
> >
>
