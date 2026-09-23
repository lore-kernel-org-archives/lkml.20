Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FBA44C4E2
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168198; cv=fail; b=VEZ0Vqflj8ZQcPln/q+WyCiqv778ccybeRF3ralnY31+yT9Yl9nJLcyzPSJ5hIl2aWEvyIiZOTDo9LPik/1f+IvwytoKuXBx1zMIfI+Nt4vgyZNaeVMWvbjrKapJz6E32xeHi7XtDFmkTmZEHCHbeqmYgIuvi3WziSWrZZ4iQas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168198; c=relaxed/simple;
	bh=1SRCHPmkk/MqpwfxYpDG6WpvHJw5t+UA+z5YMTQWaVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=StoM7a/eI6VsNNxPZnvT5rROz1qh2SG7h1DFw01r0RcapQBEWkBH3PS/BcbrEALzwV8X20xwLYAoEUyHj2Fr/68flw/AWn+bmLSNkcMXCrjI8WX6jFChrfBSPs17JvDAql5QQGTy/xE9CePWYSt31VGZYDrIlxZYWi0adSoneMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=QM48kRVX; arc=fail smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="QM48kRVX"
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8J77X1427679
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:56:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=w6aYP/WGma+CZxHbYVrCOq+IGJ59B5MNaNiRl
	taBsIY=; b=QM48kRVXKpecMA2HKZlUHYTYeblPj2PwDiXNYgaELcY+4blPJCHkl
	WnOq74Qma6mHBWyL7kNLfzD5f724Bn70LINbKvPtz+tosR5For+dsSEdeWOJQz/o
	GxeMcb1gbqjFQ8PoMzoLAteVIo0MU0JUHXxO8NIyAoIsB7jnm45Bl0vXFhMjbV+S
	ptHDR2P3ppPkou99iHDsL/oxrV/hb0QuDiRdlSoPg3G4FYmrDfjzH0NbgHcNon4V
	ShyLuLOEmp7pXksscyUIIMLPnAw0Fz2SUIBxqb+Uj7wzFzCrw1Q1addlXugfLhDY
	OJFT5eTBaWiV1CbYkqR0lWIJzVvI7tmog==
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4guud9s7ua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:56:35 -0700 (PDT)
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6aa1c4f3001so1161773a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:56:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790168194; cv=none;
        d=google.com; s=arc-20260327;
        b=A3xK2YjK77y7Fsg/CKiq60vBe3jajU6V2BpQPzTwUoVpfC1VVqXXivV/oXy3a7et3a
         fpnzbewq8oeyuFs4RTnnYeXnekQby0dxCG9eoaMwm4edV0Ab7+mRi52/mTxMqgjAy+6m
         cg0Ca/zVe/b33gpLGg7M9nallGdO0XxMTMR5LAHcVXoVw7INI8FJ9oSuKf7JK7i72KLs
         eWe2q9aK+v9PVJnQdq+sLe2knaA6xgobgFqb25Km9O+qmR6W8QMOdCFmyGyYTyeT8Ckc
         dPZPazt2i8MIDPY1hennBjsA3m/MvoVtNrayx3CDzK9qqUzxAEIN13/jgBj3L8iAV6l1
         EEZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=bqEiNZo3w6DxJ+jQKjV3KdDyTNPbxkoMRHGCPwXcb/s=;
        fh=Y1bf2pSGwqzM/0AK4xoxn0jQBAcUaZYtYRiP059+rYM=;
        b=jm9E16V8kMfIPSRT/pSHUIa53QSRmJVNHoUoe7M6UoIShZge2OEa2NZc1me3SrY3hl
         hVAynyJEjXWeLgTGR/FBmMZbBfRn3TuOxvBo8kGmvQ/gD8bg0sE0e9H+ZYkS64NSzbdx
         1g7v90w4gOh6ORmlAqluilI9+8M6dAdz2ZsphKArNKOGbMbWzVekgHNwtZiLlETrIc2o
         SX3dHVavRhN7Lp+SXg78yp1Ar3wX2Ckv0+4F3eNVc07bLjw4tT/f5RtZjgY6OSxdmckT
         z0/+MEX6EBHVyg7rnnhqAxLgqbdsxn7jJvwyrJOZpnURIfNGhkqRRSvzOLKCvuC44Wpc
         yjJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168194; x=1790772994;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bqEiNZo3w6DxJ+jQKjV3KdDyTNPbxkoMRHGCPwXcb/s=;
        b=nQ3y+DmVa0zO9XMYb6gh4lkHOBbJv52aLbDb+htmhgNWgYp10jM6uTl1gqL3uw4Lkn
         h+2jxIfxOlXfB6TppOVUUfT8eaLadKDgO5iYB8r6oWD2uHgSPi/vcFBmnQilO9p1E2Kx
         hAN5xlPln0xY1dErdsm0RAgiZ4549YSGzsaNOaH5U8phybFtCc4WYfczko7W1O48jy/a
         nF0nkM4aef0HBZBMDU/E4pSXIencQK21yBJPX5zwXhhIS8hp/4+wHUWea+QhSt5Njs3q
         GTyvmMkA2NbziqManb3sVyB0o/XBBMYhhcKevlib2Sy758b5K0oIVbelcQnQlVdyKTl2
         I7Bw==
X-Forwarded-Encrypted: i=1; AKwUvBxhGcuaddnJa4nzUJH3ZtLbfmxpYJuTORnXPcRu/cjQNYs61+HFsWmGE9DYbYd4MQdgM6zl4StRyYRwHPk=@vger.kernel.org
X-Gm-Message-State: AFuF++k/eEtevYKI/hKLZGRUDrpzLWhd6fY42nI1rIEwrJNOttMR50DD
	FB124/vz5+1s9mgpNR2qKZYSaK4PUx2ljmRkY1Bc6A7HaPG7ictiN9mE8G7BbNabjqEmYPnPUgG
	q5R090L8feaBa+BRosj22mLzeX2UMEovid73R0QqMaYPq/W9Xb/9T3lnPQakHrLoccI1oMFvRbB
	hiZGfDujon4ur3j7BAH7S9FopEoF2wswwTb33E7tM=
X-Gm-Gg: AYBFou0MaTb9bHhpWwVhnNGY9ia0BjUny6YVW7wE3izxJCJpE7H06U+9wR/qSsR6Wtc
	5BUY2pKJYLlnlebJo3bc8uQWfAU8gpOK4aBHGkqWJKFN+AwqfFfr3r6JJk4vFWAyZOE1mDFKHp0
	2MROX0pBTQmLh9RD/o+CZJ5FI/XS+Y3uc97UkhAGGIpeoUxwmXWu4qHkfNPzZRVIO1x1/d9xOsj
	zc4nox/hSSkNLY9/A==
X-Received: by 2002:a05:6402:3549:b0:6a9:93cf:2367 with SMTP id 4fb4d7f45d1cf-6aab3b82acfmr2389943a12.41.1790168194094;
        Wed, 23 Sep 2026 05:56:34 -0700 (PDT)
X-Received: by 2002:a05:6402:3549:b0:6a9:93cf:2367 with SMTP id
 4fb4d7f45d1cf-6aab3b82acfmr2389903a12.41.1790168193603; Wed, 23 Sep 2026
 05:56:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722163536.773166-1-alex@ghiti.fr> <20260722165907.784020-1-alex@ghiti.fr>
 <CAKEwX=NJH2nM=vMPk_=ugJ26uNjH4AMdHXeaasuPrbSEGxpJOQ@mail.gmail.com>
In-Reply-To: <CAKEwX=NJH2nM=vMPk_=ugJ26uNjH4AMdHXeaasuPrbSEGxpJOQ@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@meta.com>
Date: Wed, 23 Sep 2026 14:56:22 +0200
X-Gm-Features: AclHuK9iADqo6BDBUkusfSuGCdLOo-LJcD0oUEhsZ8PqoiomeOSbz6M_fQmGJPk
Message-ID: <CAEmasaX8apLztgcRCpGxyDWAs9Vc6hU815o9AG5DZUU_5RpQbA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] mm: swap: overlap synchronous readahead
 decompression with disk I/O
To: Nhat Pham <nphamcs@gmail.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, akpm@linux-foundation.org,
        hannes@cmpxchg.org, yosry@kernel.org, chengming.zhou@linux.dev,
        david@kernel.org, ljs@kernel.org, liam@infradead.org,
        vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
        kasong@tencent.com, ryncsn@gmail.com, chrisl@kernel.org,
        baohua@kernel.org, usama.arif@linux.dev, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX8U9QeHsiv5r+
 pQYZ7RNuJuHF0O/ovDDyiWDXdTZDh0sHLecGUrhKOSFVu2m3pbnY8VHoqZ9Vm2mBc3WBJi50BbG
 nhjB3aXYx2xmba9vxwVQAd9AXiJ4UpU=
X-Authority-Analysis: v=2.4 cv=VdBir1p9 c=1 sm=1 tr=0 ts=6ab3cc83 cx=c_pps
 a=DTy5UCxgudPLKrSn28m7Kw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=wpfVPzegXHpEFt3DAXn9:22
 a=pGLkceISAAAA:8 a=6U9HwWF0I8vdP4q4yZsA:9 a=QEXdDO2ut3YA:10
 a=VzYV69SsQLkmnS9OQLw-:22
X-Proofpoint-ORIG-GUID: aAlKySmLkYTJmPcawxQ8KKVBOYHHPhHv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX6QcWCFbrukQt
 +ZHZapsonlCe4V4FCkIMF0cgAsQ/q+CoOrrHZX1RvT6BLd9fdczo+7fvCHdx51fEelbpBWlwRh/
 vV0eIV06ruw1f00aqKh0I+7963wsVwvJRupP5xpJ1f0bIw18LtNOeapj7HmQYAmUgY/BIV5+8ap
 OF2Cs9kNd3qScYOxCYREAqO6tE9ToNs321um/PmEC35vXGXhZp5ZrGgjFf2QQa/pwomCh6F+TNs
 SwCb2rGRAsX/jIUjM1/mmBngMz/FgDileHgKKqJ41GDShL+kWbCRY83mw/doULewu5+3pc0Hf7t
 q7VmJjxXqw9iCp4JpZkaLy9mVfmLWDbYdF6QANh6ITjXN+q4IEgKFBKQJm/g4gSy1hzxWEOv/8S
 dzFoY8RCbCb6wVGx7DLEWc9JzZJeHxwDKN7mNn+OhPh5pYyL1EJI/QfMTo+8ESLxlPvdEex5vr9
 CCrAtvn6cDRfzmC98gQ==
X-Proofpoint-GUID: aAlKySmLkYTJmPcawxQ8KKVBOYHHPhHv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01

Hi Nhat,

On Tue, Sep 22, 2026 at 7:07=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote:
>
> >
> On Wed, Jul 22, 2026 at 9:59=E2=80=AFAM Alexandre Ghiti <alex@ghiti.fr> w=
rote:
> >
> > Swap readahead reads the whole window sequentially: the device I/Os are
> > accumulated along the way while the synchronous, zswap-resident entries
> > are decompressed inline. The I/O is only triggered afterwards, at
> > blk_finish_plug(), so the synchronous zswap decompression is pure added
> > latency in front of the read the fault is about to wait on.
> >
> > Trigger the I/O before decompressing the synchronous entries: split the
> > window walk into two passes. Pass 1 issues the async device reads and
> > defers the synchronous neighbours; pass 2 reads the deferred entries
> > while pass 1's I/O is in flight, overlapping the CPU work with the disk
> > reads instead of serialising it in front of them.
> >
> > swap_cluster_readahead() walks a contiguous offset range, which is chea=
p.
> > swap_vma_readahead() instead walks the page tables so we cache the
> > entries we encounter in the first pass to reuse directly in the second
> > pass.
>
> Hmmm does not seem like you're taking advantage of the device-level
> contiguity of swap_cluster_readahead() either way? You're calling
> swap_entry_synchronous() (i.e zswap_is_present(entry, 1)) one entry
> (i.e one tree walk) at a time.
>
> If you're not taking advantage of contiguity, just share the logic haha.

I cannot stash the zswap entries in an array for the cluster readahead
path since the window is not capped like it is for the vma readahead.

So I'll use the contiguity to avoid the zswap tree lookup on each entry, th=
anks.

>
> >
> > Results [vm-scalability mixed zswap+disk swap-in, 256M zswap cap (~73%
> > disk), Sapphire Rapids, zswap=3Dzstd, shrinker off, n=3D3]:
>
> Hmm how do you have disk swapin with shrinker off?

The test workload I used filled the zswap pool so new folios were
written to disk.

>
> >
> >   metric                  mm-new    +patch    delta
> >   swap-in tput (KB/s)    119247    131261    +10.1%
> >   swap-in wall (s)          106       100     -5.7%
> >   swap readahead (pages)   1.56M      1.55M    ~same
> >   zswap-in (MB)            1895       1872     ~same
> >   disk swap-in (MB)        5207       5190     ~same
> >   major faults            260148     260212    ~same
>
> Obviously this would help zswap, but what if the backend is disk swap,
> and all of this is just pure overhead? How would the numbers look?

You're right, I assumed the overhead would be negligible but I haven't
measured it, I'll come back with numbers (I'll test with the
contiguity optimization you mentioned; the overhead should be even
less visible).

Thanks for your review Nhat!

Alex

>
> >
> > Signed-off-by: Alexandre Ghiti <alex@ghiti.fr
>
