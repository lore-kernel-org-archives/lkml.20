Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B193793C3
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266837; cv=pass; b=byGv3asD7V1F6GKL1Z8GSTVJ25DzXZ5zA7ApaMGyFTbbsLvmzeuDTISjULe+ZFgxtFq1q1vVtbds9pd7V5HflDiEuhfJ7xKvAYCu0B6/9jUStKA9wqRmspUk+wBgImFCTElOfdx3qqGJzVhQlg/8XlLKfm56KXTtjgxGKBzxKS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266837; c=relaxed/simple;
	bh=RSp2l1x3VML/TUH7NBwrx8HvLT3W4YMiteDUtD6oAoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EacRfWSzYiGQ0LOKyYPlgQBeMAawE6aphWiL1fT0mRjCWapsmvirIM0PkszKkBTtTSV4q8E1CzXniZKHY1ZL6uGFyjJFbczLxk5stoqz6u5TxoA0IeDFNzwz2DMuyZni2IEQFcJa7FPnD+m+ThCJQiLg4veNhS7P1AsGbWbw+Gs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PCpCDWgX; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PCpCDWgX"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485984ebf5cso742f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:20:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790266834; cv=none;
        d=google.com; s=arc-20260327;
        b=DA2qR20/AbFKdiaFAMQJ891ZQghEJxTY0rqPQe4z6PmPxFv/okM6/vSH1gmCeV8DAL
         bKfIymRwQ2jU/t5enpOs5oTv+NnOLyC+aAuc7V6keOuR9T0Pz8xWyxp+tkBpRmOFS55U
         i3DyP54la93lS8ylEU8NHiOt/3v4Sv6f+eoVc04RJxjH95UiobSvAn/i5tDyVKUKSUC1
         K3ZZP6WLk6uOpr8tF8eku7dHSdwedJH5YzH/egIlcED0WqZ04OD3BxG8yQJvmiBFswzY
         jluGnwzlrvUp13y1sxv0Ou+BvYJ5j6okrlo5wjSdxqDaV4eRk7ufceQxC6sRb3ksh2xR
         Fi+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y4C/eEY5hpNw6IZ6GmmYyn13brOMotH1yARGM3FuI/E=;
        fh=IcLVTTvWeoKS6LDikkkiqWua3VeoI1GH7PUc8p0wh/U=;
        b=QCFkahQ5tqsQC1wckAKLOy4NaGhWqMi/Iq4hRHrKJhwo9sW5i0GOVIoHyR40qDWozz
         t8rurCc/yLMkQ5+MzGkPLxb9f8llAPx8gxRcJISTrar2qyjpkXvIiPbFZppgQSZevUmE
         0JxiKa3qSD+LsoMi8nOraoZPVj5C9/72nAYlQcXjWIfsCmXOt/szTLP5rZ6GrwYLeRT5
         IDyx6AKhJljoLxAL6uev5L6fS+6Q1vbuZ5k2i9+xMTKHAJNZm/gzupsKD9xCRn9uFs9U
         guT4cyisaWuBj5ycnmm6ZLCT2J5AegbB2pcgfZGIXMEEQDAmZ7I092c1uuaBwOFIXRzW
         Be6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790266834; x=1790871634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y4C/eEY5hpNw6IZ6GmmYyn13brOMotH1yARGM3FuI/E=;
        b=PCpCDWgXouIzhtlsM1Cz/m22yXk3HLuDl/7iiEUVUQXb8dalyr/v+itsCLjAM3YU8m
         eAMbllXGH9dncQnIF4y35V3EnJCmKQMF+QGLHyoo0Ck102zKYF8l+O0RoUXq4VHWKKbw
         feTuDO9Fm1PmhpuosM75c04GnAmPGH5oybiaHrPFARtpdYKKeQMtf/Y/aV29/vw15BTJ
         mkNc01PHDd7BU1nNWb9H0b/1SAFbJspaTY1+K/roQqc5iJmL/9W3ByrRj6OtXjWxhOhT
         cE+KkUwWavN6PvWKvIseyDn/w0JfNWH2F5OzfnqP6zIclBexkEMQOicMq7P8nbnorDM6
         yrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790266834; x=1790871634;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y4C/eEY5hpNw6IZ6GmmYyn13brOMotH1yARGM3FuI/E=;
        b=xD/AqxIuPXkPU4Vy3h1mk474O5bhcsQQeeJkcjQrI5Kv0J89ZkCBr3nfTOeUeSDoMI
         2BfxULeuXqo7/2IVX98Brr2bnc+v3yw0B2rFH1347mXHx/TPgn+PlQHmkNp5D2RVyYF+
         AThriGVrsHQczsbb/hSQVPk1TCCuQqm0R2zLOq/Id9sRYLBOWsHa0S3xfwUZ/p4ArqKh
         omgmQmZ5mLmINJYAgxLsYfPAg7FZhIuJ21E0hFD2IZDlS4JxgVVbWw39yAdSinU6St8r
         iOxEFs+qf6NtU2kzN9yNi4+B7le8aYY0RlvUkJMxvayioZqnQ3q9ezzqyLIkwmxbqU12
         2TQg==
X-Forwarded-Encrypted: i=1; AKwUvBxQxD2bUaIf/VwexX3O5m/qJ6l4f/d7ym01FxpgrLGozqCaJ7mXKRTUoBany1ZuFuPnuU+AP3g9sM2I9S4=@vger.kernel.org
X-Gm-Message-State: AFuF++nRpUicBGw2hcK3KQaJ5oF7L4eLFUPJIUatRU8SeQu7qQpHxQj9
	MpeGUU9IRqK6dfV4eEQUYVfrtBRPOtQWnkPivpj78KZETwP785wH45CZKPJbmH17MmNrGDo29vS
	jO/Il+IdIPFKTTGVj7gp2YhBXoWir0DU=
X-Gm-Gg: AYBFou3G1zsx6tu2mCRWZOIkyMFBdoU9vXfUtEi9C464VKAbxSnyuhLJT0K4MBOx/2L
	fsI9zxbZKm6tbkrS6lVwJspHqzDB54oeauU0HlOSmnVvBzQ2CM79S/nMc3mAUgMCF5K553Dkv1c
	SXtzrcwOxXEmDzYxXERDkK5ajhLyG6d/pWAl7liee1Y+uQ/Yf5SzLcxwx9DQJz21YFRi/Ms0B1j
	Vlw1Ajbwc2pXdsoQLaBXeUCxvgUKAg+6hgvzE0jcomDdEvYQlrzVEzorhI1kYIAgQLnLO3gWqSt
	7WEARFX1HBXUPVptOYiffIC4lr/P2J9idICem0dFYyaxLjQ530OLPRaQMQu5UTlPR3V+ozYmfxO
	lUap5PiDejw==
X-Received: by 2002:a05:6000:26cd:b0:486:fe8d:298e with SMTP id
 ffacd0b85a97d-48872ad7729mr4973566f8f.53.1790266833368; Thu, 24 Sep 2026
 09:20:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918180241.3424851-1-nphamcs@gmail.com> <20260918180241.3424851-2-nphamcs@gmail.com>
 <CACePvbVaDNspMDSw_qAcapKAzXj3JGV-KMYmow7aePa0POHpSg@mail.gmail.com>
In-Reply-To: <CACePvbVaDNspMDSw_qAcapKAzXj3JGV-KMYmow7aePa0POHpSg@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 24 Sep 2026 09:20:22 -0700
X-Gm-Features: AclHuK-lGJJsKLxr6Qb-y2IvmlUpoUB7yhNg4AVw4NM-rENBoqlMKdnr9zU6afg
Message-ID: <CAKEwX=OP3Gb9sVOvch+p4j7quzgy-rUY=UTZau5ztMj7heJJoA@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] mm, swap: add virtual swap device infrastructure
To: Chris Li <chrisl@kernel.org>
Cc: akpm@linux-foundation.org, kasong@tencent.com, hannes@cmpxchg.org, 
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev, 
	yosry@kernel.org, david@kernel.org, muchun.song@linux.dev, 
	shikemeng@huaweicloud.com, baoquan.he@linux.dev, baohua@kernel.org, 
	youngjun.park@lge.com, chengming.zhou@linux.dev, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	qi.zheng@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, riel@surriel.com, gourry@gourry.net, 
	haowenchao22@gmail.com, corbet@lwn.net, hughd@google.com, 
	baolin.wang@linux.alibaba.com, tj@kernel.org, mkoutny@suse.com, 
	skhan@linuxfoundation.org, kunwu.chan@linux.dev, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 2:18=E2=80=AFAM Chris Li <chrisl@kernel.org> wrote:
>
>
> There are too many swap_is_vswap() in this series. It fragments the
> code path, making things harder to reason about. Esepcially around
> locks. I count 22 in this patch alone.
>
> I consider this the biggest drawback of this series. This
> fragmentation of the code path.

This will mirror my response at [1], but I'm responding here for the
record and for your convenience.

It is needed because vswap *is* a special device, with its own
requirements. If you don't special case-it, you'd get undesirable
behaviors.

Let's take Baoquan's patch series as an example.  It treats the xswap
device as just another swap device, without any special consideration
for it. Which creates several problem:

1. At allocation time, cgroups that disable zswap might get an xswap
slot, because you don't do any check that the device you allocating
the swap slots for is xswap. At swap_writeout() time, it is *stuck* -
we already do the unmapping step, so we cannot reclaim the page.

Ironically a physical swapfile backend could have bailed us out here,
but it's not in that patch series yet :)

Vswap both has swapfile backend, AND allows you to bypass it if the
cgroup disables zswap. Both involves a bit of swap_is_vswap() check,
but I think it's worth it :)

2. Per-CPU allocation caching: since all devices share the same cache,
xswap will invalidate the caching of other devices, and vice versa. It
would be fine if the these devices are interchangeable, but as noted
above, it's not, especially without physical swapfile as the backend
option. So you're forced to taken the slow path more often.

Vswap gets around this by adding its own per-cpu allocation caching,

So by being too lazy and not carefully distinguish the swap devices,
not only does xswap not work for the writeback use case, it cannot
even work in deployments where some workloads (cgroup) select zswap,
whereas others select disk swap. It can only work if you intend to
have a single class of device - either virtual/xswap or disk swap -
but not both.

Maybe instead of just grepping for swap_is_vswap() and throw your hand
at the complexity, read the code and try to understand why it's
necessary first, then propose simplifications if you have good ideas
in minds.

>
> This is questionable. A vswap device does not go through swap on.
>
> This changes the behavior where swap devices always go through swap on/of=
f.
>
> I wish the swap device went through swap on to be able to start swapping.
>
> Chris

What usecase would necessitate the need for swapon/swapoff interface?
Other than just trying to shoehorn it to an existing interface?

I've expressed why I dislike the interface in [1]. Other than the
sizing aspect, which we are already discussing in another thread,
priority also makes zero sense. You are literally exposing an
interface with only one correct answer - what's the point?

Justify your interface choice with real userspace use case, not just by
conforming to the status quo.

[1]: https://lore.kernel.org/all/CAKEwX=3DPEEkYiNRaVhCuM4E6mxB9huPKfkDa4m62=
VMTzedg1oYw@mail.gmail.com/
