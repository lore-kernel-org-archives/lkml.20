Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182AC48A2A9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789391052; cv=pass; b=VUpcV7llk51NeMyy8xvSDf6i0/ui8AF1vwOzPNE9rNKDLWVWHPcFqKDK9MEE46hd/aPp0IC5vh1v6JFlJlZKhVfcXoj12V54RWzRb0nE17BV7lznmWz30ItKhfc01qZWTnNrDnlO9ROyIMGdrnY3FR+0ztZOyKdM0eKwdVRt+do=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789391052; c=relaxed/simple;
	bh=ybb9QeOsqfZN3IEmsd/nesigDpigySXViDpUH0wC3nI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E0kPPwLglTU2iU4SUvkswVhCBxIX47V3qaC66eaNdQ4k4sgdaEf94FnD/s8HO3IIK+jauudxeCO7D4mzapjNRBoA1xPXSIougHYxJA31GXmNtvD2+Cmj5uKgeKwUymMMhK2TbwUYWKl6JBnaHU/60NsVppVXNB/+/9xfgriieuc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rn0IZ8VL; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rn0IZ8VL"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-87ffa98d4a9so28001567b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:04:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789391050; cv=none;
        d=google.com; s=arc-20260327;
        b=dUQbcaTtLu31laZxX446NgHKhHDW1DJ3heg09LFD5zzX+T1wiIjBQjbj1lIiO/XJQT
         OlxyIlQolNBnGyZ8mYB3N0mJmgzxGOWKu+GmlCdNBKwIvsyaq+xZZ+3Ij8ZpS7VmVG41
         yVsM6cF6i5inH4wpiostgpqH6kw4Gyo1gFD4xJ/jaB2KDrl+4Gwm2/9YZgl1fDjt6F2T
         TN3vSwkJAWCOphQMLVNWPj2cdahC1TihgduyFdL7gISUKs3Ops7GscF7jGuizmRbC2+d
         BqaU56JSirnU5NggvQi2JiT4Wm64OuF/jPJDEGir7hAs56yHaL4qnzGzdPDlBtP/Pmdo
         22fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=opyQzysdmm2CzDSQThdzdAuoqcZ3TYYFu94kwvLe8Lc=;
        fh=XUEBsFDObaAHbfPzb36IF1KMWgXaKdPmAgrv+mSJsvI=;
        b=UHgHP8sAf6RVoRDZq3SuEYZJ8fXjchbn1bvzSlduXw69O1tBuaAzar1+2dEF5maibH
         O8+cXnrdpjP0Ct0RnFWh/f0UMA7ihRfWpmghTSbjzQGu31YY1FvTM3F+052kfKaJGEE6
         ExzeMIAKsBGGp1klnntFUA6lhJQDHJPe8hwzujoPGsbf1yFL3PuKdFIE49UXPTFuyhME
         2qF62bldYRsUZlVgAqh0fLjWbLMMYxGR4jYgzuf6vfahzqtBI/pa1Hd/lf20WEauUla3
         xd+Bvdm+e4NgfnPOLZgD2MR9Gv6lRiKSH7tzGcBFQ46HrCMAxx79ZUFkVyMEXOTKHP7p
         vVRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789391050; x=1789995850; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=opyQzysdmm2CzDSQThdzdAuoqcZ3TYYFu94kwvLe8Lc=;
        b=Rn0IZ8VLM7m+5y4lt9TzjoBk99xNtpXKRh+LZ2Sd3KdCBnJXp6dtlfpFvrH1L3rPv5
         /ijBNa76MX7Auzfq3hpVh+ySleme5WofITnLpv/ga2G5WseF2DtqoKRhxn9bQdwh0I5m
         ttfXCjzUGwWOPqNFgCPTqjUGJZ5OVwU2NWPv1ZFvqQvcAtWU8PDCWVX36RoKJ0YNPrkz
         L6BRTmfQuLs8nRZu1ylj6sdvohNUHjentaT85Lf2YI4Et2lQSKNa5cWSOIa8UD0Fviya
         fNNm1r7rvi4tmBmjJfBewgvsUrOaNsMSIHcODsbr2DDsfIddcxhxhVAqh+Ry13UE+wt5
         H+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789391050; x=1789995850;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=opyQzysdmm2CzDSQThdzdAuoqcZ3TYYFu94kwvLe8Lc=;
        b=koP2qbFjSZk6VXV5RFoscWZ/sbslll+R2oim1OXsvlvPmWiypBGctS0gq4HK0VPtz2
         YMOxfaYz7/gZTLGuh6zDniUJXqvallbCBjAmKQ+CnBpeiMzROMJXhKf9dnCycNASxrc7
         q2CxbBYq2xy0HVfI3z21b16IAa4SE6Y5bDB0MxNVSfGzy4dF9+4f0OqXXTsZfG2vDczN
         cvmO8IxbCzTBN/MN7GNc7ou60twEXIPpZBNJT8fGeJV+KfTiVYA3ORHTe6T1CtaIRjdp
         HckcG7Q26cvtU2BE29R2evxrdBzpd2q5UCL1biGz1vRU8wIxhLbL38TknhGG+5qCStzs
         f7mg==
X-Forwarded-Encrypted: i=1; AKwUvBwojgXYfT/lUvwSCqfWDDi3grJXLLYZKy9c2mUS0uAeAlxmkD8YwuYxVcMSYKHWm89O9xw0PiOl4ReOd3I=@vger.kernel.org
X-Gm-Message-State: AFuF++kVioQdXP22FcLXf+s6sFEHVsPlya5hsCBUW1vpsMT7I3VPplza
	e1kfO1EU43vy3OnDfbr1+t3Mj6VhagSfwXdh2228ifF63TvCV5Y0rP4gtTdf6JK0R2Qk9HIMNkz
	x64WqXJuttvPwlekcdwqUmEieELWF540=
X-Gm-Gg: AYBFou2Rr1h8ykIcTECyYWXHxWj9lUTEi9mvOkDCOnGC3FTuimTzdQc486xPVa9/3U4
	vb/bhvAAPxNYgCg0nh/gpyVPBLMmrGhqy+w+C8VLzWpeQWjbgUGAaBVOkVM4X/uZg304a3TuEkC
	C6dUCcFNyAVtNDtPkNHgOn6stzqKJC7gWdfYprpHnftKRrwCObZNf24dYV282qBa20dg34wqd05
	vGnj2Emf6jOHnxMc8zWavhZmNsAfvM4MomkrY4yQEmL21UunD6tmWzywpXBlIZWh202DZkPHifT
	kR+D3Zr/HkC/lQD2Vgq1X8q+0Vxl3o+pvlEomoYPwwHA8qch0F3MHQRjRQ1p4z1b2BVK
X-Received: by 2002:a05:690c:83:b0:873:5bb2:6c1a with SMTP id
 00721157ae682-88d2389df38mr5815567b3.68.1789391049683; Mon, 14 Sep 2026
 06:04:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910131103.988-1-yogeshgaur.83@gmail.com> <15056940-2572-4395-a72b-8cba7d8d11b7@fygo.io>
In-Reply-To: <15056940-2572-4395-a72b-8cba7d8d11b7@fygo.io>
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
Date: Mon, 14 Sep 2026 18:33:56 +0530
X-Gm-Features: AcwNN1WM7MPwMDCdIU3gN0obgQhJP0QA1G58-SaaBx-D5_6qkKONYxKbBE_NY0w
Message-ID: <CAG6enPyLT=e_O=nyji6JawnCbvfM6tFPxc2-vsGB886R7O1b6Q@mail.gmail.com>
Subject: Re: [PATCH] md/raid5: don't BUG() on an inconsistent reshape state
 from the superblock
To: yukuai@fygo.io
Cc: Song Liu <song@kernel.org>, Li Nan <magiclinan@didiglobal.com>, 
	Xiao Ni <xiao@kernel.org>, linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+1f5a7de91d547763f4c8@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 1:18=E2=80=AFPM yu kuai <yukuai@fygo.io> wrote:
>
> =E5=9C=A8 2026/9/10 21:11, Yogesh Gaur =E5=86=99=E9=81=93:
>
> > raid5_run() branches on mddev->reshape_position. When it is MaxSector -=
-
> >
> > no reshape in progress -- the else branch asserts that nothing else
> >
> > describes one:
> >
> >
> >
> >       BUG_ON(mddev->level !=3D mddev->new_level);
> >
> >       BUG_ON(mddev->layout !=3D mddev->new_layout);
> >
> >       BUG_ON(mddev->chunk_sectors !=3D mddev->new_chunk_sectors);
> >
> >       BUG_ON(mddev->delta_disks !=3D 0);
> >
> >
> >
> > Nothing enforces that invariant. Both superblock validators copy the
> >
> > reshape fields straight off disk without cross-checking them against
> >
> > each other: super_1_validate() takes reshape_position, delta_disks,
> >
> > new_level, new_layout and new_chunk from the superblock whenever
> >
> > MD_FEATURE_RESHAPE_ACTIVE is set, and super_90_validate() does the same
> >
> > for minor version 91. A superblock that sets the reshape feature while
> >
> > leaving reshape_position at the MaxSector sentinel therefore reaches th=
e
> >
> > else branch with a non-zero delta_disks, and assembling the array takes
> >
> > the machine down:
> >
> >
> >
> >    kernel BUG at drivers/md/raid5.c:8117!
> >
> >    Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
> >
> >    RIP: 0010:raid5_run+0x11a7/0x1670 drivers/md/raid5.c:8117
> >
> >    Call Trace:
> >
> >     md_run+0xc2f/0x2510 drivers/md/md.c:6779
> >
> >     do_md_run+0x36/0x660 drivers/md/md.c:6880
> >
> >     array_state_store+0x9c5/0xcf0 drivers/md/md.c:4765
> >
> >     md_attr_store+0x1c5/0x330 drivers/md/md.c:6158
> >
> >     sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
> >
> >     kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
> >
> >
> >
> > This is reachable by anyone who can present an md superblock, so BUG()
> >
> > is the wrong response. Refuse to start the array instead, the way the
> >
> > reshape_position !=3D MaxSector branch a few lines above already refuse=
s a
> >
> > reshape it cannot resume. Nothing has been allocated at this point --
> >
> > the journal-and-bitmap check just above returns -EINVAL the same way --
> >
> > so there is nothing to unwind.
> >
> >
> >
> > Reported-by:syzbot+1f5a7de91d547763f4c8@syzkaller.appspotmail.com
> >
> > Closes:https://syzkaller.appspot.com/bug?extid=3D1f5a7de91d547763f4c8
> >
> > Fixes: 91adb56473fe ("md/raid5: refactor raid5 "run"")
> >
> > Assisted-by: LLM
> >
> > Signed-off-by: Yogesh Gaur<yogeshgaur.83@gmail.com>
> >
> > ---
> >
> >   drivers/md/raid5.c | 16 +++++++++++-----
> >
> >   1 file changed, 11 insertions(+), 5 deletions(-)
> Applied to md-7.3
>
Thanks.

> --
> Thanks,
> Kuai
