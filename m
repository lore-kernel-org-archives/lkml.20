Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09E72192FA
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 03:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791343834; cv=pass; b=UkXTt7Gm0h2chUIznD40bLtLhZVWZ8FLXqFXpsDHjozbPwBX0kAFughJeczbS1Dd3OHCnybtujfjj6/PHcPh15fiqfaTV8vukOSkCrrxSBurwSFKk2sLw1lvwOPdeFP3UR6UELPKHJ7AWoXGU7svKs4DdDMbVtL2nqhiy3/fpYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791343834; c=relaxed/simple;
	bh=UJjG7YQB/XZoKvnWM5FDfqOIQ0JIYp5rinf2O9Fj9J8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KutKWQwToT3EvzfzcgPwF0Z8ZAWGTX9D/T1pEiMlSorZ6x/gvnHuovHRJXCtNH3m5hR0iENhTM+Ti3As23h4CT/oJHi26TBQ2DNQ75r+Rfij44PUxTVFNE1XsL6mC4Mt+8a1pGq6oXH4ozjnODFP9iLDYBs/0nzJPM2Ti0DhQDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SMXNPD0g; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SMXNPD0g"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-677d35fd168so1434139d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 20:30:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791343831; cv=none;
        d=google.com; s=arc-20260327;
        b=owEhvhmu8ny4NjADKAmkn9KgAp2OHphPYuz+dZlOTH/MgV+WmwkckIsYS/Y2JZikZp
         YzDgozkkv7wgwEL5gfEaqYDmNGUH+l6nUwTO35MvFuomB1YD45rEsZ5FKRBPMO57nJeT
         pwi5oeoAAnfiT2h15+J3HdDLQaj7164fT9P35lR6kLdLLh1u1D3NEovLdKi//5B+y+Fx
         wyhnzj5NXnS2WGm9ue+XW6IfCbvV8WHCAFYUW5FNfiEMZFWpGzEVphry+eQOkeF1Ahz6
         0MoTJcM6qrXf7xwvfqVuueZDnY888ZsBDLwpzmBYAu5cm+yQ9AWA5OQ/FZtmJb778NxS
         QKaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bj7qdb9JKHM+aQdEnEvqhywIWqaQWXOgPRxHvLl5wx0=;
        fh=v7Xx8dklrHIEWGg6L4Jn5EkvhWrauINL16sl97mWHWY=;
        b=hcadm6ceIgLCbcylzFZUET49nHpkiA2ZnjbSidvS72IPx9uDNK0P4dtOCpyhsC7K7F
         vZuZhHJuReaKRSc2FbStn7G2HC6/VlKWqJyUZhG3yxmvPBcqS0O2LPMvOS2woyfzEOVO
         Wl39STK0iHRfzWqf38/NVB8ErVNj5270lptCoNfBI2Ic2Y3xUxc8/EoygPJLtOhE2eNx
         Od4xErb7TDK0FcTesBhlZKXGbqWG9FPZEg+ppOGu+58YgeUKClq2yK8dzleUT4QHn+m2
         RfkmDd11pAkB+BCgkqrBe9LTkfFSqBZdzyLNmnj50mVumWloSpmbrGr6GyUxoVHsfmGo
         hSKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791343831; x=1791948631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bj7qdb9JKHM+aQdEnEvqhywIWqaQWXOgPRxHvLl5wx0=;
        b=SMXNPD0gFhuA4J/xULHLAr2v38jGdJ0BvV+NdQ0d7ttBKyACqGioEUnpNxJvPm5hAM
         lGTJHUEmZL2L4QLuYIqEyJa1JscX6lrMJ/oTm5gus45JiZF1Uk/ueCHCQDtquj8RVu+C
         sICxGoe7/J3iDpnL4PfKbYlH54j1uAeAaPSEtA1JqLksx84eskOuE1/3S0c8Q6zjoIYm
         wKVBRVuv5BKmHAxZzGhksZSJGw6NTXCZZbsYG0bsAnzEHwQIui3ZjdGFq7Jgu6mjfm7S
         f9hLhkj820zC+ISCtoL1SWSY+nt5Eb+/JyEAfLF+io2w7U5ukkLHH8xCY0dne3g6Vpod
         zZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791343831; x=1791948631;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bj7qdb9JKHM+aQdEnEvqhywIWqaQWXOgPRxHvLl5wx0=;
        b=hqpJVm+KLZJb8I6SlQIVUhxBGT94fzI/L3r6Vy7uinUF/QwSRdXcDuECMlWviASGqy
         v5lnX9PFKosbZfg9VZhsOPBO1dpB4U4y7Uz6zKg08O9y9OvF0eaOtCH+Ve+Vtxc4X/Sd
         xr/5xrFIUlLZmY5N81bAS5zLo04vR2lz0RPS5qqvYMsg9BLyYOUfei3uBi64y2gT/XC3
         rcioBhbqs9EsVUhyJAaSx6QVv1NQHgxwnjjjARKSR1yse6FSVnOWwIqLAerzYR5sZQEV
         NNuUEYMZ96+LstjXpr5b8qr9CToRYyqu/oqUT44NMs23W6wpFVjhxSM+ySumzwR1ZMF8
         8Fzg==
X-Forwarded-Encrypted: i=1; AKwUvBzNv14xE7qoW3o0KyC5dUkWQ2UnAf9c0YHF+Zfgi7oXYKE51p3tkhacCeYi3clwY0BuZEIXQ8Up62zbKOo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAp96WJ0uVIdoPvlknGGnW5KrobXedh99uABdsfZ2QnewSgtUY
	l79nrQuVCCqRy3OzGr+NhWFjq8KuD6Vd/pqK0TEL2LM5D4ocl7S+Wf1oTzPLUs5yYe0dNiV3q41
	gHJBxqykyspdM2zaH0UClkiO4FLGoF9w=
X-Gm-Gg: AYBFou1HCtkzlbu9QZa7yytznvl3gQ+RRhzr5fN0cZC7mS1G3jSl77Ey1t+OL7jat1q
	HvAWN6lUdhiP9Oi8jeblqJoAfUdFKAoINPatDFRWOzVixyxe0E6pMTq2VAEO4Jio94nrzxuNHfC
	HMDeIg32ltOm0Klt2pYfuJYVQ7oI4gcJh1CURXxc+VyQt+frKyRoT16sXxJTXXGyNUIefH4IBPL
	owbSBSyv2hCV8eIrTsjwX63Nkc+83WyTK3YM2Da7BaSN/SKChfMmT+C8SIroZBKrZnzrtpbNwDv
	9Q5gb9YtraQtOpPy8CmOUngBgzZRblqbEYAsPRgwUcj8006FeTCHf2IW
X-Received: by 2002:a05:690e:b82:b0:677:d251:ccd9 with SMTP id
 956f58d0204a3-6790a2e4aaemr706401d50.48.1791343830632; Tue, 06 Oct 2026
 20:30:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006070005.1209234-1-swinds24@gmail.com> <s3rlm3edtb4hfcggiqkqotywfhobjnwmc2v373nwvkwihitstg@66kypvunlqqm>
In-Reply-To: <s3rlm3edtb4hfcggiqkqotywfhobjnwmc2v373nwvkwihitstg@66kypvunlqqm>
From: Hsiu-Hsien Lee <swinds24@gmail.com>
Date: Wed, 7 Oct 2026 11:30:18 +0800
X-Gm-Features: AclHuK_ceOw_gBw80HWG9dguUdx4fCwV1VJRW3JaZysAs4dIBQAAHlWXB_Up5xk
Message-ID: <CACi0_7afNW5KNZVNL40GUrCL9+Ly6oDrKPA-hNu2RQ_u51UZ+w@mail.gmail.com>
Subject: Re: [PATCH] ext4: don't fail journal recovery on an incomplete fast commit
To: Jan Kara <jack@suse.cz>
Cc: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
	Andreas Dilger <adilger.kernel@dilger.ca>, Harshad Shirwadkar <harshadshirwadkar@gmail.com>, 
	Baokun Li <libaokun@linux.alibaba.com>, Ojaswin Mujoo <ojaswin@linux.ibm.com>, 
	Ritesh Harjani <ritesh.list@gmail.com>, Zhang Yi <yi.zhang@huawei.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review. It makes sense, and I'll drop the warning and the
helper and use ext4_debug() in v2.

- Jerry


Jan Kara <jack@suse.cz> =E6=96=BC 2026=E5=B9=B410=E6=9C=887=E6=97=A5=E9=80=
=B1=E4=B8=89 =E4=B8=8A=E5=8D=8812:08=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue 06-10-26 15:00:05, Hsiu-Hsien Lee wrote:
> > If the system crashes while the first fast commit after a full commit i=
s
> > being written, the fast commit area can hold the head of that fast
> > commit without a valid tail.  ext4_fc_replay_scan() treats this as an
> > error as long as no valid tail has been seen: an invalid tag length or
> > an unknown tag returns -ECANCELED, a tail with a wrong tid or checksum
> > returns -EFSBADCRC.  jbd2_journal_recover() then fails, the file system
> > can be mounted neither read-write nor read-only, and the regular journa=
l
> > transactions committed before the fast commit are not replayed either:
> >
> >   JBD2: journal recovery failed
> >   EXT4-fs (sdb): error loading journal
> >
> > The tail is written last and fsync() does not return before it has
> > completed, so an incomplete fast commit was never reported as durable.
> > Handle it like jbd2 handles a transaction without a valid commit block:
> > stop the scan and replay what is valid.  This is already what happens
> > when an earlier fast commit in the area has a valid tail.  Log a
> > warning so that the dropped fast commit is visible.
> >
> > Reproducer, with the power cut emulated by copying the device while it
> > is mounted:
> >
> >   mkfs.ext4 -O fast_commit /dev/sdb
> >   mount /dev/sdb /mnt; mkdir /mnt/d
> >   create 20 files in /mnt/d; sync
> >   write a fragmented file and modify the 20 files, fsync one file
> >       (one fast commit spanning several blocks)
> >   copy /dev/sdb while still mounted, then zero the block holding the
> >   fast commit tail in the copy
> >   mount the copy
> >
> > Without this patch the mount fails as above.  With it, the mount
> > succeeds, the state after sync is recovered and e2fsck finds no errors.
> > The same holds when a full commit precedes the torn fast commit, in
> > which case the full commit is now replayed as well.
> >
> > Fixes: 8016e29f4362 ("ext4: fast commit recovery path")
> > Assisted-by: Claude Opus 5.5
> > Signed-off-by: Hsiu-Hsien Lee <swinds24@gmail.com>
> > ---
> >  fs/ext4/fast_commit.c | 36 +++++++++++++++++++++++++++++-------
> >  1 file changed, 29 insertions(+), 7 deletions(-)
> >
> > diff --git a/fs/ext4/fast_commit.c b/fs/ext4/fast_commit.c
> > index 0cac890cf370..5649447b9524 100644
> > --- a/fs/ext4/fast_commit.c
> > +++ b/fs/ext4/fast_commit.c
> > @@ -2427,6 +2427,26 @@ static bool ext4_fc_value_len_isvalid(struct ext=
4_sb_info *sbi,
> >       return false;
> >  }
> >
> > +/*
> > + * The fast commit area ends with an invalid tag or a tail that does n=
ot
> > + * match.  This is how a fast commit that was only partially written b=
efore
> > + * a crash looks like: its tail is written last and fsync() only retur=
ns
> > + * after the tail write has completed, so nobody was told that this fa=
st
> > + * commit is durable and it can simply be dropped, the same way jbd2 d=
rops
> > + * a transaction without a valid commit block.  Everything up to the l=
ast
> > + * valid tail is still replayed.
> > + */
> > +static int ext4_fc_replay_scan_end(struct super_block *sb,
> > +                                struct ext4_fc_replay_state *state,
> > +                                int off, const char *reason)
> > +{
> > +     if (!state->fc_replay_num_tags)
> > +             ext4_msg(sb, KERN_WARNING,
> > +                      "ignoring incomplete fast commit at block %d: %s=
",
> > +                      off, reason);
>
> I don't think there's need to print any message when discovering incomple=
te
> fast commit. As you mention, it is a perfectly normal situation (similarl=
y
> as incomplete normal transaction we spot in a journal). I'd perhaps just
> print ext4_debug() message (and I don't think conditioning on
> fc_replay_num_tags makes sense in that case. So probably just drop the
> helper function and print the debug message and set the return value
> inline...
>
>                                                                 Honza
>
> > +     return JBD2_FC_REPLAY_STOP;
> > +}
> > +
> >  /*
> >   * Recovery Scan phase handler
> >   *
> > @@ -2440,7 +2460,9 @@ static bool ext4_fc_value_len_isvalid(struct ext4=
_sb_info *sbi,
> >   * This function returns JBD2_FC_REPLAY_CONTINUE to indicate that SCAN=
 is
> >   * incomplete and JBD2 should send more blocks. It returns JBD2_FC_REP=
LAY_STOP
> >   * to indicate that scan has finished and JBD2 can now start replay ph=
ase.
> > - * It returns a negative error to indicate that there was an error. At=
 the end
> > + * It returns a negative error to indicate that there was an error. An=
 invalid
> > + * or incomplete fast commit at the end of the area is not an error, s=
ee
> > + * ext4_fc_replay_scan_end(). At the end
> >   * of a successful scan phase, sbi->s_fc_replay_state.fc_replay_num_ta=
gs is set
> >   * to indicate the number of tags that need to replayed during the rep=
lay phase.
> >   */
> > @@ -2489,8 +2511,8 @@ static int ext4_fc_replay_scan(journal_t *journal=
,
> >               val =3D cur + EXT4_FC_TAG_BASE_LEN;
> >               if (tl.fc_len > end - val ||
> >                   !ext4_fc_value_len_isvalid(sbi, tl.fc_tag, tl.fc_len)=
) {
> > -                     ret =3D state->fc_replay_num_tags ?
> > -                             JBD2_FC_REPLAY_STOP : -ECANCELED;
> > +                     ret =3D ext4_fc_replay_scan_end(sb, state, off,
> > +                                                   "invalid tag length=
");
> >                       goto out_err;
> >               }
> >               ext4_debug("Scan phase, tag:%s, blk %lld\n",
> > @@ -2530,8 +2552,8 @@ static int ext4_fc_replay_scan(journal_t *journal=
,
> >                               state->fc_regions_valid =3D
> >                                       state->fc_regions_used;
> >                       } else {
> > -                             ret =3D state->fc_replay_num_tags ?
> > -                                     JBD2_FC_REPLAY_STOP : -EFSBADCRC;
> > +                             ret =3D ext4_fc_replay_scan_end(sb, state=
, off,
> > +                                                           "invalid ta=
il");
> >                       }
> >                       state->fc_crc =3D 0;
> >                       break;
> > @@ -2551,8 +2573,8 @@ static int ext4_fc_replay_scan(journal_t *journal=
,
> >                               EXT4_FC_TAG_BASE_LEN + tl.fc_len);
> >                       break;
> >               default:
> > -                     ret =3D state->fc_replay_num_tags ?
> > -                             JBD2_FC_REPLAY_STOP : -ECANCELED;
> > +                     ret =3D ext4_fc_replay_scan_end(sb, state, off,
> > +                                                   "unknown tag");
> >               }
> >               if (ret < 0 || ret =3D=3D JBD2_FC_REPLAY_STOP)
> >                       break;
> > --
> > 2.43.0
> >
> --
> Jan Kara <jack@suse.com>
> SUSE Labs, CR
