Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FD0511E64
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788543221; cv=pass; b=UwkJ+guata+SzLVZ3DR4Wq7h87QLugk6f6VKUYjatb9TavlqlRWKxuobDbYyl3mcnBiffltfzw/x11wMzC5K9+T2fIWbGYruro6mYPYvqT575D/LGJ8CsAob6i5w4DZQzMNipHvjlfFmmnZSbt5nbKn4wu3ujQ7JzPC5EW9mCy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788543221; c=relaxed/simple;
	bh=+dxsPdcG+42yJ1jF2czoqDuFc+SMLBZvLdpM9geZ/gM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GapJnSYZmSVrBZcpb4tir9K27jm7n19UTkjQNhsi6PsYdCvzUhZWBylSR8d/xHFZ2J6S+7QGpUmzNfTyEl8C2wSBfogEwK9LQzOHL4TU0snZiFzmwAMRhXL3ZhgdojOZTc4OSdnmC7h6od1N15nZAlXtZaXcL/Ksth/7k/Vbxew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SrfKcEPY; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SrfKcEPY"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48584dc164fso1225450f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 10:33:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788543214; cv=none;
        d=google.com; s=arc-20260327;
        b=U0TphQPZw8bq9lt+CwS5LxNWvbFmtJtnVD7Xwt3ZVlC2IQdWf8nJuab4PxJC5K4d8o
         5X2JYH1z2nNQF7mp6Ye98bVAaFeKDFEUo1fdZlOT4i9ZvnVbJLyztOTwWOJgQ1Dz/IG3
         OAYA8Om6tMvmaWRgwQxzyNiimFUY39BsGqbMnvD0GDOB6Aat0FKnwDKHkNZVAvj864xw
         00Lyh0FalHGsNAWwquAone18H5twaxwJ9/uWsvSQxT1nOwA0awZpfmO6woZUpstamRhc
         Fbgd51dpqHOY8iBUwmUg8djccsjcVf28dwsqNaKl0j0ZZD1BmyYI0LPtsrGtCwIuGtfw
         QWeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=soTQky9Z3nYNLqFSceLyBlbSmjBlYyMm4HBR+pwE4Gg=;
        fh=i+qPxQLB3yt6ForQIEHDzjC3A+ybL0DFd7suIgF1NW0=;
        b=R2KMWael+9hTtdBl4mshvu18RIbYkElL4DwSxp2eAiOGWvJZ+y1GBNauoJ3JJwZBI8
         BsJFob08tgqscAC/oZOMwYs3jsJF3gkDXraZ94bzQy6hR3DncULh+9aS1HfvlRRGefQ1
         kZQFd8p7OU9caOHlxQms/jTjvH6cyqf6gesr1/tSk7iFpDZFkarsnJHkm8T/lmQ9T5Fi
         UkaJK8cPTsBk+jWoSkKR1Ogw5JB+IoQZBWfJtHmq1QXbWZNDGNXE3cwtY6Mhi4dtZ+rm
         TWy7VyqV8940t6TfORKsniUOQ8/5MOFcEc3MsWzEfwMrbC58ws1jPMpCTF7Jn5yWLz4Q
         KDxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788543214; x=1789148014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=soTQky9Z3nYNLqFSceLyBlbSmjBlYyMm4HBR+pwE4Gg=;
        b=SrfKcEPYEZ66jVyN7RYZa0gsikH15ECqcg7g9v0Cllrb3/RZvJ0FlBWcm7vqAgMxn5
         BLCXhkbNtGyWk3udifVhjHzW9IHthVaca8mtm63Ievpd4B7/TI0Z6m451NwEOtrbLNiz
         FuLvUxMO1G7h0smQalOS08Lm8r3BSmDxn+bcazZQEfiCZtINSvO8ECgRkqIZfJZWM1XA
         q31Hkv0gkfVmnpG2rqDRoTPB09qHeHPeqI/cdnMgSrmLxhK94ugxhyarNuSo4zDz0CrU
         pDlt8LabAuNEgqkcu/8/OHjC/nlENPYIM4HwKKeG31oCYVQ1weAdhYDnNKzlYiPYkAZX
         +kjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788543214; x=1789148014;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=soTQky9Z3nYNLqFSceLyBlbSmjBlYyMm4HBR+pwE4Gg=;
        b=hWKvzGrDr2j1CM5F2bsbMyICZuCnWGSZLpH01mD7ZBBDHZC6OMreT7wk1t5T4HrM/x
         EXgzbhqDsusDPvQIHlqY4W5DRqDhcoIymSO1gSAiA4S9AwERWrPkrQJV2iTCFANxrMnp
         seso5ufomJydJmUYgPp021oJQv5RaFLKnRWXvilRHgQ4MSGzwtmbsxZAKzSIxfCHWB+8
         U2P/JriVwZnFgjRBD9J9b5DcslQYtJjKc8FgK7FTTXyXgCS40HUO0w0/SXWN1t6Kio1b
         YgBFNpe83kxtHIgnbcVnIsXwPFDIK12z6kzTGW2IOoWYlZ08RlyYJTdQNlblMIsUJp/h
         yy3g==
X-Forwarded-Encrypted: i=1; AKwUvBz8BWzXoD/sbEiuL2fWTJA6WpAQr5So7cxmKH/N4mcLLRd2Da7PgkIyJXlCenQ6EMD7T56YlPoqEHMB7ng=@vger.kernel.org
X-Gm-Message-State: AFuF++kjGC2+3TvwUhsTMT8hgIv88qtx1zCY1DkAYADIIVdzyMZ4mDL+
	BDW6QWEONYuL2KB6r8kq72NqzNQkKTuC+/HlEr0C6uiiABsZr/Ul9GyCpa/zfX4S8dEjBEIUntU
	nbubAWzQSK2tK3nfIr1Bk5XCHDH1DVlU=
X-Gm-Gg: AYBFou3oyz5bdQJzJkQpyCHf/XjBKAaRmNJNqyrYZ65EH+1qouDn2+yIfCdUcHEvrUD
	FmpINwCsPw8FsiquPQC6dxqfMAQ6CqBX7ecKyDGNlh1yU4QduAVxbCShQFekjV888XS5kjQHbCN
	Df/SAEvcTWX8jj9gGfjfQS0M9Rip2lV+LInlwQvMe2uGGe12vvr5iZmcaMCwDCa0gHMFJ3gBw9K
	84wRvyYJ5zNo1X7gy9cUfOcK8+BxQwwSGHcc+5d4RVfC1bPHQ2qKwhOlTpdlXYQ5V+Kf8gtWcgI
	qLLiREpqQuB6ubm7y/0iQWOyYBuCE6X/yrJn0pZGdJ+tm20NT3fu2hVrTE8yfxdq88PMJzDnPs5
	oYxJeMfwZIO5v6cFmcAeHVZZTFPA=
X-Received: by 2002:a05:6000:228a:b0:485:8fe2:ed81 with SMTP id
 ffacd0b85a97d-4858fe2ee3amr163801f8f.26.1788543213669; Fri, 04 Sep 2026
 10:33:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903115018.2034541-1-yi.zhang@huaweicloud.com>
 <CAJnrk1ZLzNQxrSLQx7TsLK89QC_=9cDfoDcyKNBNde0CiDGoNg@mail.gmail.com> <4e498938-f21b-4d75-b789-8a615aba877a@huaweicloud.com>
In-Reply-To: <4e498938-f21b-4d75-b789-8a615aba877a@huaweicloud.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 4 Sep 2026 10:33:21 -0700
X-Gm-Features: AcwNN1WC5_C19pRuHFRSSvaEOgUDXw8Fkj4YdviBWSd6-uI0JItHi4sYChYNXkU
Message-ID: <CAJnrk1bQYUe6+1ryyJur5EEnZYrC+_5AYsy=OWzVRgD4202y1g@mail.gmail.com>
Subject: Re: [RFC PATCH] mm/truncate: fix data loss when splitting fails in truncate_inode_partial_folio()
To: Zhang Yi <yi.zhang@huaweicloud.com>
Cc: linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-ext4@vger.kernel.org, 
	akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, hughd@google.com, baolin.wang@linux.alibaba.com, 
	willy@infradead.org, jack@suse.cz, ziy@nvidia.com, bfoster@redhat.com, 
	djwong@kernel.org, yi.zhang@huawei.com, yizhang089@gmail.com, 
	yangerkun@huawei.com, chengzhihao1@huawei.com, wangkefeng.wang@huawei.com, 
	yukuai@fnnas.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 11:27=E2=80=AFPM Zhang Yi <yi.zhang@huaweicloud.com>=
 wrote:
>
> On 9/4/2026 3:01 AM, Joanne Koong wrote:
> >>         /*
> >> @@ -259,6 +265,10 @@ bool truncate_inode_partial_folio(struct folio *f=
olio, loff_t start, loff_t end)
> >>                  * for shmem truncate
> >>                  */
> >>                 struct folio *folio2;
> >> +               bool tail_isolated =3D true;
> >> +
> >> +               if (end)
> >> +                       *end =3D (pos + offset + length) >> PAGE_SHIFT=
;
> >
> > If I'm understanding it correctly, based on how
> > truncate_inode_pages_range() uses the end value (eg the "while (index
> > < end)" loop condition and the find_get_entries(..., end - 1, ...)),
> > end needs to point to the start of the folio if the tail folio from
> > the split is a large folio, in order to exclude that folio from then
> > being truncated. But with the (pos + offset + length) >> PAGE_SHIFT
> > calculation here, does that result in some cases in it pointing to the
> > middle of a large folio? Maybe some logic is needed to make sure that
> > it points to the start?
> >
>
> Hi Joanne,
>
> Thanks for your careful review! I don't think that case can actually
> occur. Let me walk through the scenarios where the
> (pos + offset + length) >> PAGE_SHIFT calculation is kept as the final
> end value:

Hi Yi,

Thanks for your reply and for walking through the logic and explaining it.

>
> 1) offset + length =3D=3D size:
>    The truncate range aligns exactly with the folio boundary, so
>    (pos + offset + length) >> PAGE_SHIFT points to the start of the next
>    folio, not the middle of one.
>
> 2) !folio_try_get(folio2):
>    The folio at that position has already been freed or is being freed,
>    so there is no folio in the page cache at that location. The
>    subsequent find_get_entries() won't find anything there.
>
> 3) !folio_test_large(folio2):
>    folio2 is no longer large, likely split to order-0 by a concurrent
>    operation. For an order-0 folio, the page index and folio index are
>    the same, so the calculation is correct.
>
> 4) folio2 becomes stale:
>    The same to case 2), folio2 is removed from the address space, so
>    there is no large folio straddling the boundary that needs
>    protection. The caller won't get folio from here through
>    find_get_entries(). Using the page index is safe here.
>
> If a large folio straddles the boundary at (offset + length), we will
> successfully get a reference via folio_try_get(folio2) and
> folio_test_large(folio2) will be true. In that case, if the split fails
> (cannot lock or split operation fails), we set tail_isolated to false
> and set *end =3D folio2->index to point to the start of that large folio
> since tail_isolated.

The case I have in mind is the case where the 2nd split succeeds
(returns 0) and tail_isolated will not be set to false, and *end still
gets returned back to the caller as the original "(pos + offset +
length) >> PAGE_SHIFT" calculation. I don't think it's guaranteed that
the split will create a folio that starts at that page.

The example I'm thinking about is a 64k folio being truncated at
offset 0 to 36k on a 16k blocksize filesystem with 4k pages:
*end =3D (pos + offset + length) >> PAGE_SHIFT =3D 36k >> PAGE_SHIFT =3D pa=
ge index 9
start: [0 - 15]
after 1st split: [0 - 3] [4 - 7] [8 - 15]
split_at2 =3D 36k / PAGE_SIZE =3D 9
2nd split will try splitting [8 - 15] at split_at2
after 2nd split: [8 - 11] [12 - 15]

in the truncate_inode_pages_range() logic, start =3D 0, end =3D 9, so
find_get_entries(..., end - 1 (=3D 8) ...) returns the [8 - 11] folio
and truncate_inode_folio() will drop all 4 of those pages (including
36k to 48k which might have dirty data).

Do you think this makes sense or am I missing something?

>
> The page index from this setting is only kept when no large folio exists
> at the boundary, which makes it safe to use. What is particularly
> noteworthy is that for cases 2 and 4 above, aside from setting it to
> (pos + offset + length) >> PAGE_SHIFT, there does not seem to be any
> better alternative.

I think if we just rounded down *end by the min order (eg *end =3D
round_down((pos + offset + length) >> PAGE_SHIFT, 1UL << min_order);),
that would ensure end is always on a folio boundary and can't be
inside a folio.

Thanks,
Joanne
