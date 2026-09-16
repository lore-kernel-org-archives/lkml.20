Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2AC233945
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789534743; cv=pass; b=RoKfxZlUbwVho+kddj7l2T+0GB8Y78r0ZvzkHaxPgz9Bcm8HUXffIaUiguNAH+1Xe/xgXnTIHZrBQ1tXkYx5WSjk3+nCwwuuPn2F2M81/mX1gz1bG3a0825H2INAAB75L5ReJ/5u4IqbRZyMTv9Z2NudvEnskKihzUnimKJBewo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789534743; c=relaxed/simple;
	bh=dp6n/uACwesOIsl60OkMBUsm7Ls461X2eOET2t9FbmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r+27/FyUmAsH2GubGyPWmY2KPJAXgd5IyQHjp1nAWrS/K5QH2hhbbcbdCgyHg4Mmma/44K9sru9HAX8Y8nE3ZoRdxNSHWxvuNWyGNta6POA6flZQPo5fPXgEHDwuHxw/P4c5GVmYHRMh3ij6wMWSFClRMObfGWqU3uq63AeYEkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ps5hCgSp; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ps5hCgSp"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2953a01240so97404466b.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:59:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789534740; cv=none;
        d=google.com; s=arc-20260327;
        b=eARqsr8QBQqmmNerKQmb+e0FScg4LDca20hPsyGUTFp1x3E5KbAWfibacEICDwzxqZ
         CzFsGBkRtagjl4Sv+SQ7ba5h8mcNpF8lavrN8bt6N1ISxd2JKiuBz4ZhjpMzOVeSbC0s
         hQ9jsb4U1hs92D4jar0iOwME9sd/6L8QA5411fPTFQpksX62eg2PXbt2kHw9nsSZRDp/
         LAcAafD/QRjBbIvJeH7MhhRbTR5s39LS3vH9arpS/wv2VhMXqCD7ebPhQMlim695TyW/
         mBrkvZoclfcr+J1Xe2pxtJNFLjJOAUFq7l/vlB/frOdvcEjAwUvHG8zfWgNN6QovBzFM
         oeLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=07gw2O5Xp6RugqG2tTqxFnRpDG3MmGDKXARV+mqZHyw=;
        fh=rtFbuqk/WRtFe1ZDe3iE5CjSnV5d2/NSeFYooBxyREs=;
        b=NkAPRseEULUJ85A3HvFtZ7D+d/UbQN0MXZz4ljZcXpjnuYS28WZRa66UtkRk4hErMC
         BLxdkivZbJU5ihjye2p9Tacbl/zfaa6rXDxx7RgXPm5CdlADBlMwht0daVvb+ceMLccr
         oqBJBucksAb5VE2GwvP9Xh9rKCN8UxN5TJM0q7xVKpUL9bbv4oypv5Ixqqzr32L+4y7r
         Ha4SFdLDk3+taYSXmWwRfn0LtCjsFL/EcTdF4f+JPGItH8MTBJPgg9eMBb9XZHXGOzwF
         /J4FX6oo2qtw+27vr/hQz7dYnHTYP8pQLT6vC1Ybwt6tUN5z+JFQoz3N7ewB6foMSCFC
         +S/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534740; x=1790139540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=07gw2O5Xp6RugqG2tTqxFnRpDG3MmGDKXARV+mqZHyw=;
        b=ps5hCgSpDuCq9rqbbPplRUiD+I74mE4LY9m2vc7uCbyXstcuYyj0tQ84voQfSLn9yg
         nzPK56PsMdVx6Wei16lyqOAxKzRRePjVlwUpmZxjjOPoJthabA0nvp9K7H2lvjdZ9haa
         LSOft6t3goxXb2noheUoYS4piobr3rU+cYDg515o8uVXa6zXTjBPbzPFQgUyj/TXmd0Q
         7TaQMss9mXr2xAsWQZGVr+rGtmDUHz5Ya0QG3y8IBuUg2VP8QhN7aa3vr0n2kqc0lJBF
         kUcx1e6EYK43nCuHHtBqIfa/48GrvFYCqYlaDSnwvDqHCXQOyrkXWfxSHyaU7pn9njF9
         Jq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534740; x=1790139540;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=07gw2O5Xp6RugqG2tTqxFnRpDG3MmGDKXARV+mqZHyw=;
        b=fUrmLXdm4aVg1HYatU5kXebl7oufL+2UW/QG41wYt89znGQPfLsSSa7RvJD8jVfH7R
         HOzkxdkaL89xgdLsFfCMH8iVeX2JUgXRIdBzOZgYuK749HPz7VH8RMU/0I/wuFXoIbG0
         fj3taREcrZr2eB0oPQfDajOxaIvzkSq6KoTXlXp/RlJcHBEDzxSAoOlY+148kxmE+hHa
         8Zejqi2gRuLhigTNQ4s8abuYFheH5KXmUorP4MlImu6P87X0NhxxF6tnkIUGZzndwEZA
         bMre+MfDqw2Mn2T/Ne6Yk0KjuP0CjBJqGNXibVYU6FlgixdTB3kZUBssIswlBhZoNDTB
         UyBg==
X-Forwarded-Encrypted: i=1; AKwUvBzXjcXN7UQztT0e12scy3Hfj6WELxBBkS2kMXI0UyO2Et60tMrRTZmmsaElPUIebbpa6bdCJ6ncH6s8Zp8=@vger.kernel.org
X-Gm-Message-State: AFuF++no9JdWh+xjE47xtBQdD3PhNrWsk7V1ksaQG9G3GaizURKh4KPK
	xH5oZkGo4DKORpgt4eGljCMy+DZmdVZWFMcNL6ItmT88oX0q37bG/QBWamEpnJuB/lD8BB0nc0g
	MscjLNUyVyRfAMKh5AJjyUqjaJ8vMIiY=
X-Gm-Gg: AYBFou2WY4UgG0VX3DMctAWz2PoysOOVoaHkSO+zEcyJPv3u18a5qndf1JLajqWtsKr
	Y2WDlF5epTjp0lp1u4P+XZ/wj46pmSVx/IYV2OSrrbxFVImTzUqtCjxrf1UF5Wj0bzDzy0b7hfm
	m6SLyPp8quBsYRybinCKGGyF8L9O7gX7ZOglIQRiR+GOKIzMrQ8sZxKmZNENbD7vIoIfHBV04Hw
	82/01IyDihsSRLcxLqhOTQstSFGXc0yc+fRGFPaM4TvuW7VB0qYkEXoRHOJ4DJZ/jDct50BitZS
	ou5GNLL3MZvsiFoW3WvaPVtPb8qDgs95NehCJ071liIW7tGT7wPtXMzgZdGZHR6fh7GSRDN8rQm
	5ykUbqBeVj5oYAosNtPwQu/Un
X-Received: by 2002:a17:907:1c93:b0:c26:2751:3da4 with SMTP id
 a640c23a62f3a-c29e520779cmr62267866b.13.1789534739880; Tue, 15 Sep 2026
 21:58:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANypQFZ05tpth0Xc33gmP6jgPnkY4VuezyHcsajV-SqCsmN_gg@mail.gmail.com>
 <20260914034940.4070970-1-r772577952@gmail.com> <20260915180721.1914e74dc8da69e58399d7a6@linux-foundation.org>
In-Reply-To: <20260915180721.1914e74dc8da69e58399d7a6@linux-foundation.org>
From: Jiaming Zhang <r772577952@gmail.com>
Date: Wed, 16 Sep 2026 12:58:22 +0800
X-Gm-Features: AcwNN1XWNjEvri-VMKCiL8OQIH4zlV-VX9cG-PRAMHrS1MSoqZDebFVeXaI0vHs
Message-ID: <CANypQFZMpExoykmy8kM=G5yYN0hJvuHmw0hVMKDvzZ7-qX6ang@mail.gmail.com>
Subject: Re: [PATCH] ocfs2: fix chunk number of the first chunk in a local
 quota file
To: Andrew Morton <akpm@linux-foundation.org>
Cc: jlbec@evilplan.org, joseph.qi@linux.alibaba.com, mark@fasheh.com, 
	ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzkaller@googlegroups.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Andrew Morton <akpm@linux-foundation.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=881=
6=E6=97=A5=E5=91=A8=E4=B8=89 09:07=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, 14 Sep 2026 11:49:40 +0800 Jiaming Zhang <r772577952@gmail.com> w=
rote:
>
> > The local quota file in OCFS2 is divided into chunks, and each chunk
> > begins with a header block holding a bitmap of the quota entries that
> > chunk has handed out.  Chunks are numbered from zero, and that number i=
s
> > used to convert the file offset of an entry back into a bit position in
> > the bitmap. ocfs2_local_quota_add_chunk() appends a new chunk to the
> > in-memory list and numbers it one past the chunk that was last:
> >
> >       list_add_tail(&chunk->qc_chunk, &oinfo->dqi_chunk);
> >       chunk->qc_num =3D list_entry(chunk->qc_chunk.prev,
> >                                  struct ocfs2_quota_chunk,
> >                                  qc_chunk)->qc_num + 1;
> >
> > The predecessor is looked up after the new chunk is added to the list,
> > so if the list was empty, the prev pointer is the list head itself.  Th=
e
> > head is the dqi_chunk member of struct ocfs2_mem_dqinfo and is not a
> > chunk, so reading qc_num through it lands 16 bytes past the start of th=
e
> > head, on the dqi_gqinode pointer that follows it.  The first chunk of
> > the file is then numbered with the lower half of a kernel pointer
> > instead of 0.
> >
> > The list is empty when the local quota file header claims the file has
> > no chunks.  ocfs2_local_read_info() takes dqi_chunks from that header
> > without validating it, so an image with dqi_chunks =3D=3D 0 takes this =
path
> > when the first quota entry is allocated.
> >
> > ocfs2_create_local_dquot() turns the bad number into a file offset with
> > ol_dqblk_off(), which shifts a 32-bit block number left by the block
> > size bits, so the top bits of such a large block number are lost.
> > ocfs2_local_release_dquot() turns the offset back into a bit index with
> > ol_dqblk_chunk_off(), using the full chunk number, so the lost bits pus=
h
> > that index far outside the bitmap, and clearing it corrupts unrelated
> > memory.
> >
> > Compute the chunk number before putting the chunk on the list, and use =
0
> > when the list is empty.
>
> Thanks.
>
> What's missing here is any description of how the fix affects our
> users.  And that's really really important.

Sorry for the missing information.  I have added it below, and I hope
it is useful.

>
> > Fixes: 9e33d69f553a ("ocfs2: Implementation of local and global quota f=
ile handling")
> > Closes: https://lore.kernel.org/lkml/CANypQFZ05tpth0Xc33gmP6jgPnkY4Vuez=
yHcsajV-SqCsmN_gg@mail.gmail.com/
> > Cc: stable@vger.kernel.org
>
> Especially when proposing a -stable backport.
>
> I see from your KASAN report
> (https://lore.kernel.org/CANypQFZ05tpth0Xc33gmP6jgPnkY4VuezyHcsajV-SqCsmN=
_gg@mail.gmail.com)
> that there's a use-after-free.  But even that wasn't revealed in your
> proposed changelog!
>
> So.
>
> When fixing a bug please always describe the userspace-visible effects
> of that bug.

Mounting a crafted OCFS2 image can corrupt kernel memory.  When the
local quota file header of such an image claims zero chunks, the first
quota entry allocated during the mount gets a chunk number taken from
a kernel pointer, and releasing that entry clears a bit far outside
the chunk bitmap.

The write will corrupt the data stored at that address, and the
corruption may lead to a system crash or damage unrelated data.
Mounting requires CAP_SYS_ADMIN, so it takes an untrusted image, such
as removable media or a loop mount of a file from elsewhere.

Since the chunk number comes from a kernel pointer, the address of the
bit that gets cleared differs from boot to boot, and the issue has
been reported under several titles:

- BUG: unable to handle kernel paging request in ocfs2_local_release_dquot
- KASAN: use-after-free Write in ocfs2_local_release_dquot
- KASAN: slab-out-of-bounds Write in ocfs2_local_release_dquot
- KASAN: slab-use-after-free Write in ocfs2_local_release_dquot
- KFENCE: use-after-free write in ocfs2_local_release_dquot

Note that none of these is a use-after-free in the quota code: the
chunk and its buffer head are alive.  The bit that gets cleared lies
far outside the bitmap.  KASAN and KFENCE name each report based on
the object occupying that address, which explains why the same issue
is reported under so many different titles.  In the report I sent, the
address fell in a free page, which KASAN labels use-after-free.

>
> Describe whether there's a know reproducer.  Tell us whether it's some
> LLM-found-this theoretical thing or whether it's affecting you in the
> real world.

Yes, there are known reproducers.  Both a syzkaller and a C reproducer
are available from the Google Drive link [1] in my report thread.  The
issue was found by our modified syzkaller, not a theoretical thing
found by an LLM.  I have not seen it outside fuzzing, so it is not
affecting me in the real world.

>
> I and all the people downstream from me (Linus, -stable, LTS, distros,
> android, hyperscalars, everyone else) all will want to know these
> things and I'd like you to provide them.
>
> > Assisted-by: Claude Code:claude-opus-5
>
> Great.  Please add prompts to Claude to ensure that all the info I'm
> asking for is included in your changelogs going forward.  Then share
> these prompts across your organization.

Understood.  Thank you for the suggestion. :)

>
> > --- a/fs/ocfs2/quota_local.c
> > +++ b/fs/ocfs2/quota_local.c
> > @@ -1071,10 +1071,13 @@ static struct ocfs2_quota_chunk *ocfs2_local_qu=
ota_add_chunk(
> >               goto out;
> >       }
> >
> > +     if (list_empty(&oinfo->dqi_chunk))
> > +             chunk->qc_num =3D 0;
> > +     else
> > +             chunk->qc_num =3D list_entry(oinfo->dqi_chunk.prev,
> > +                                        struct ocfs2_quota_chunk,
> > +                                        qc_chunk)->qc_num + 1;
> >       list_add_tail(&chunk->qc_chunk, &oinfo->dqi_chunk);
> > -     chunk->qc_num =3D list_entry(chunk->qc_chunk.prev,
> > -                                struct ocfs2_quota_chunk,
> > -                                qc_chunk)->qc_num + 1;
> >       chunk->qc_headerbh =3D bh;
> >       *offset =3D 0;
> >       return chunk;
>
> whew.  Applied.
>
> I'll retain the cc:stable for now, but I don't know why.
>

My reasoning was that this issue has been there since 2008, so every
stable tree has it, and the fix is small and changes nothing for a
healthy filesystem.  However, it has only ever been hit by a fuzzer.
You can drop the Cc: stable if you do not think it meets the relevant
criteria.

Please feel free to tell me if any further information is needed.

[1] https://drive.google.com/drive/folders/1-LzPTgOALEc3eOjmgM6oOfRKkYXJ-bn=
O?usp=3Ddrive_link

Best Regards,
Jiaming Zhang
