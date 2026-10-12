Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C08D3DA7D0
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791809601; cv=pass; b=JAN31eHlexuGZeg4KAHwOSxY/LhiJGkA2gPzyAi0h17Dz1POf1EdBnw0K9iA1gKptGUMJw9WZP5Dr9CdnkOo5dMbEUJVP++/E7zbv73Q1c5cpio3zH7OVIu6XcsgM/VKoZp//Dd6zVnlsvy1fMXkiGzvn/UEw0CnfM89SRlT8YY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791809601; c=relaxed/simple;
	bh=wKnvnUg5jeqtUViASSyTcDwggGYu/7K8r7VVVI2zi7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i4hx5Oy7jrUdC4HaFx7Nwy845rY/G33/sLaqSojhf3r8cpbXiRrahLrglWg6e8WitPUPeju9YqMXSSRP/tzxrdeX74l3qX5/IRhISYqAREMjJv1/1nhQN+Wuq4H2nmon8BnxyW830asZx/knoP7BL9BzXUE8pIxPlqmiywt1lIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZb8Yd1b; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZb8Yd1b"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-530e75d1ba1so19613001cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:53:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791809599; cv=none;
        d=google.com; s=arc-20260327;
        b=eeeOvN4GaIlkf0SQxd6jEWHYeQ/DoNCFP3YcT4El0IIZEy5GC4MgE0V+jlVIuwg78L
         f1pSiXA824BxfNUw4b8Zs2w+psGmLfBlnbGTbvJiJuicwptO/dCRAsMA8Yig7f/x+HFx
         GYrlixNQ3NobGzLpcsfvu8Y8BpJ+laXZHo4IQSQ43eNxfFzBgLWqxjlO4nzsOI2Z7PUK
         3rBVwvwXinXiFuwVcWjsw4JLDCVbdOkglfC1YBt+qI2PfyC8qB+0u+datxfIhZvebAYr
         +M8PjeTDf/0c7ir2aak1ifP6n0awulk0MjpYdpaBGcD//HWFMHlkudxZNYbYilRXjShv
         CePQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=84e/fUzVu16zYMHxqQTBH3g/SK35jLe3Za6UZxvtqCI=;
        fh=olk5M9WZ1dW6OwZxHIuCc7q2r3mwefEaIgPU3JOYLRE=;
        b=odX0rkXDRXX0yIUWkvYq58IHE0OyuDcZzxAeGt4aenMMgGu/VOU6MqYM33UQPxBLLs
         UkRXgwKS1T3gFs+S9SrLhn5mefsNbVnpO1tw4UnOn7P9mydzNN09L/8kaBS2WdqscqBk
         j4wBp8io2QGGsj417tqKdwKnf/gF740Dg31W7Jn1SGOInvgStKGQ4S1M/m7Z6DnITZRJ
         yxWngx9Zw9v42WW0X08sOlG98fmBSFXYEk8glQrhHIadCrA6TJ3t1dqIEQmFihOEX1PT
         PHVwAGAY3cM9DwRewOpgz+rJ/mYrGiWO5MDNEZkyZOkdaKUfhnVExsUSAYnTnhV0NOwL
         oVlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791809599; x=1792414399; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=84e/fUzVu16zYMHxqQTBH3g/SK35jLe3Za6UZxvtqCI=;
        b=YZb8Yd1byhNKyu0thPddzeY00NBeh1bChnBaReDa1KdorbkpaJuIygi3YrjD1GnXqp
         ihyAgFtawaOSj3riBSCwu89vScAsiMzQKYtO6OAtgZr5x+Po27Oujye6UE7fqCyr/CYx
         6Xf9pLqKLG3cB1b/x10A3JxScOI2OSp6zksMG7iBhY335Xn524Zf4l9myG5dqG7beeG2
         ABRAZQwYzfJDrKPW60DK9YdzV5HMfmleMNrJCTgQoGsHLzno03TUCLaoKMcWkrwyzrJd
         V9BCN811PQzIxh0fRrTmtTzHCX2ZQSrsdmqvLQimUFT6Dw0tlrsamr/3/i6fk7WVsQHx
         sWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791809599; x=1792414399;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=84e/fUzVu16zYMHxqQTBH3g/SK35jLe3Za6UZxvtqCI=;
        b=TjbKeq2cL9PJ0GAorc8h3IM5WgvAt8NoG5z006NYylqWcHi3eLMtVSNMENNYWwewNx
         6Ee5VFL37miNhiMLujSgB3AGsdFfebU8hF6aTQtKauVXPv/j7Ndy2zSxhUfi67HNienJ
         OHwyy1M/Xj28JiIAO85T7U9M97vPkj0NVtZ5VrODiZhtYH7eR8Bcwsr7N14rSNRkF0aK
         x0AiN+t/atQMrTaVlZ0wgzUjfF7uZpiq8cMedg7lqTjM560F2MDhrNB0M5FOLdZEcf8z
         k/6OhgJdNnNbM2+bioKDlp0p4GH/E9x3NtKKmO8As7SDH9v5se8P3IAnWoVvqosDXhQB
         XOdA==
X-Forwarded-Encrypted: i=1; AKwUvBzzAOF3vkeYxTfAYq2WJa8kpEmHYvjXsU6Nf1CiWQnj7rKrntamajL8GdJVdrN2f0LYDfq+yWV+CdmzfdQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK59lH5bHmlawQ7FJ4HD8Di45WY1zG9V0qsZlpg8513it3/rrq2
	1JcKTEFeSffgkzf6mt69xHs2YtaJTvjHCjpo2SZXA6VzrErYldYC6lhORYpd62MLthdtDs+LMmA
	pruu2MBvhMifPSD8v3i5Mm8iKwome1RyY53drwGwINQ==
X-Gm-Gg: AYBFou2D+iiuf5vTqUINyNGDt9eISSzqS8biImgvawoAs0PInq5KzQRC70pV+QDVEjq
	mT0qFEI9PfInEWMS//baw/tVIhOvzILh+J82JIuxq4dthKa8VGV07RYMftiLGy7ByfZ5qCwNALU
	VY4ucUcvcGwOwbgVYLcxZIEyQ/0dLUz0ijUxFkzdquaHMOZL2EXnny9QVDLkVGanruJccq8rq4P
	rb3Ktr86TNAVk8S4w8raF02d97+fFKWR73Kq+sNoPdG/yElAoXbiS8a+Xbsln0iiH0vGFsVp0kj
	Fx2BVMKsne4RFSORJK0Rfz0ysN0dLU82nXKQudHsudGWFuAptZlrAIIFibdbTfeqk8ioEr4IKYv
	Fjh+Y8MIeNdSB5nw5IHlt1O3b0jYfjSo/9UxC9HQvhiqLu1hcOwgtASrv9pLQmVQDnst/a7gxGM
	L+1PbsE/1nPmoSzWYv7wk1+gY8HgsKsjervog7KiTrEDgSjNiYPf8rWS2ZP9SOQv60UN3uso1YS
	8WjyYWOEX0nF6PwEg4hKLXt1WSMtQ==
X-Received: by 2002:ac8:7f4a:0:b0:535:162c:2e83 with SMTP id
 d75a77b69052e-5359fa6e9c1mr159066511cf.16.1791809599240; Mon, 12 Oct 2026
 05:53:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011051906.60397-1-jain.sm@gmail.com> <20261011051906.60397-3-jain.sm@gmail.com>
 <20261012122112.GA31242@lst.de> <CA+FWx=n=66eHOgMFb=unfgqFrhw3prW0EOf1bYHfLATV2-o1_A@mail.gmail.com>
 <09399f27-11eb-431b-914d-397f42de9dc3@kernel.org> <CA+FWx=kgeR8tz46tijYE-s=v+PTJjGfM+3ucQOo0ZuDyqFdYQw@mail.gmail.com>
 <0da1bc26-b3ed-4bfa-b75d-2d1696cc0cfb@kernel.org>
In-Reply-To: <0da1bc26-b3ed-4bfa-b75d-2d1696cc0cfb@kernel.org>
From: shashank Jain <jain.sm@gmail.com>
Date: Mon, 12 Oct 2026 18:23:07 +0530
X-Gm-Features: AclHuK-hgOEROBeWXuLQCKsHn1ZXmfjcLp_D23POYYJAVJN5_TClkWxDbLCW3KI
Message-ID: <CA+FWx=ko-dj3SORcHcvDpP7abWAmD1JH0o4COPsZc2U7kimTvw@mail.gmail.com>
Subject: Re: [PATCH 2/2] block: fix the length of a smaller last zone in blkdev_get_zone_info()
To: Damien Le Moal <dlemoal@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, 
	Johannes Thumshirn <johannes.thumshirn@wdc.com>, Hannes Reinecke <hare@suse.de>, 
	Chaitanya Kulkarni <kch@nvidia.com>, "Martin K. Petersen" <mkp@kernel.org>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026, Damien Le Moal wrote:
> I was thinking on adding a "--cached" option to control the use of
> BLK_ZONE_REP_CACHED.
> If you want to take on such patch, go ahead. CC me on it and I will revie=
w.

Thanks - yes, I will take it: a "--cached" option to "blkzone report"
that selects BLKREPORTZONEV2 with BLK_ZONE_REP_CACHED, leaving the
default report via the device (BLKREPORTZONE) unchanged. I will post it
to util-linux and CC you. The blktests reproducer will then use
"blkzone report --cached" rather than a bundled helper.

Thanks,
Shashank

On Mon, Oct 12, 2026 at 6:15=E2=80=AFPM Damien Le Moal <dlemoal@kernel.org>=
 wrote:
>
> On 2026/10/12 14:41, shashank Jain wrote:
> > On Mon, Oct 12, 2026, Damien Le Moal wrote:
> >> How do you plan to issue a BLK_ZONE_REP_CACHED report? "blkzone report=
"
> >> does not have that yet. I am planning to send a patch for it.
> >
> > Good point. Two options, and I am happy to follow your preference:
> >
> > - Use "blkzone report" with the cached flag once your util-linux patch
> >   lands - that matches the existing zbd tests and avoids a bundled tool=
.
> >   I would hold the blktests submission until it is available.
>
> We should leave "blkzone report" to get the device report as before, to a=
void
> breaking anything for user with the "active" condition being returned.
> I was thinking on adding a "--cached" option to control the use of
> BLK_ZONE_REP_CACHED.
>
> If you want to take on such patch, go ahead. CC me on it and I will revie=
w. The
> patches I need to send to add depop support will take some more time.
>
> > - Or carry a small C helper in the blktests src/ directory that issues
> >   BLKREPORTZONEV2 with BLK_ZONE_REP_CACHED directly, so the test is
> >   self-contained and does not depend on the util-linux version.
> >
> > I lean towards the first, to match the zbd conventions and your blkzone
> > work; tell me which you prefer and I will align the test with it.
> >
> > Thanks,
> > Shashank
> >
> > On Mon, Oct 12, 2026 at 6:07=E2=80=AFPM Damien Le Moal <dlemoal@kernel.=
org> wrote:
> >>
> >> On 2026/10/12 14:29, shashank Jain wrote:
> >>> On Mon, Oct 12, 2026, Christoph Hellwig wrote:
> >>>> Can you add this to blktests as a reproducer?
> >>>
> >>> Will do. I'll send a blktests test under tests/zbd/ that sets up a zo=
ned
> >>> null_blk device with a smaller last zone and checks that BLKREPORTZON=
EV2
> >>> without BLK_ZONE_REP_CACHED matches BLKREPORTZONE, and that the cache=
d
> >>> report's last-zone length does not extend past the device. I'll post =
it
> >>> to the blktests project separately and reference this series.
> >>
> >> How do you plan to issue a BLK_ZONE_REP_CACHED report? "blkzone report=
" does not
> >> have that yet. I am planning to send a patch for it.
> >>
> >>>
> >>> Thanks,
> >>> Shashank
> >>>
> >>> On Mon, Oct 12, 2026 at 5:51=E2=80=AFPM Christoph Hellwig <hch@lst.de=
> wrote:
> >>>>
> >>>> On Sun, Oct 11, 2026 at 10:49:06AM +0530, Shashank Mohan Jain wrote:
> >>>>> blkdev_get_zone_info() sets the length of every zone to the zone si=
ze
> >>>>> of the device. The last zone of a zoned block device may be smaller
> >>>>> than the others: blk_revalidate_zone_cb() accepts that and remember=
s
> >>>>> the capacity of that zone in disk->last_zone_capacity. For such a z=
one
> >>>>> the length reported from the cached information is too large, and
> >>>>> start + len is beyond the end of the device. A conventional last zo=
ne
> >>>>> is also given the capacity of a full zone.
> >>>>>
> >>>>> Example with a zoned null_blk device of 10 MiB (20480 sectors) with
> >>>>> 4 MiB zones, last zone:
> >>>>>
> >>>>>   BLKREPORTZONE:       start 16384 len 4096 capacity 4096
> >>>>>   BLKREPORTZONEV2 with
> >>>>>   BLK_ZONE_REP_CACHED: start 16384 len 8192 capacity 4096
> >>>>
> >>>> Can you add this to blktests as a reproducer?
> >>>>
> >>>> The patch looks good:
> >>>>
> >>>>
> >>>> Reviewed-by: Christoph Hellwig <hch@lst.de>
> >>
> >>
> >> --
> >> Damien Le Moal
> >> Western Digital Research
>
>
> --
> Damien Le Moal
> Western Digital Research
