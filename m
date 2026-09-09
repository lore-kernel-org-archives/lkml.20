Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E208749CF29
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788979463; cv=pass; b=Ybr4aeSW0DbWILfsw56/sC7wV903RtAR8p9y6Rv+UBzHk3hD8dJL4BbZImDXxPnEopI/9zQ3u01cGIiZyW87Y9CLWSjQeGBnqvq5tDSsJwhjt3G0ZRUr1Akcf/y4k70vvCNROG9feMsRD3nNft7p9VEhXtBNEjDRoxLoWopEsl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788979463; c=relaxed/simple;
	bh=lRCQMgZU5KaSAjiyFkXlYHTFSCujf28dXZY3CY107XY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W6SJwMc+aQ9YbiIDnx6vOvYWmorCP/1EtskfiFUYOVRsLq6uWy4yECPIo8vwkFU28mXp4P4CUNaFLzP/IsgQzuZCADQXcmnUFaFLflp0Bl2x2GJOh4yViD3LZv2z0kHobMp+60S6VdVrfvA10GTubqRTAOo+/dBCTyC/lak3orw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GV3FnB5J; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GV3FnB5J"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso76075265e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:44:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788979460; cv=none;
        d=google.com; s=arc-20260327;
        b=K8SbKl29p5bJymasYxPKPGHMktJchnbglz5Nu0zfYegnBkG0+Zx5058pSzMWSbXkic
         i7Y8/m0oRhGfvdquCrjjGZ1Zt9+8jaOX68R1hEYN2qiZh/IJS13VbvSWg+RuRWBCFVuw
         s6Rua91EJHbSHVtOAdhQdD1o5zf9MojK4fLLUJIDMQ3Nlpd10gS5UXQoFuKvULcB6yIX
         yPbil7FYHm0CY/rV31Y7MP02nc2ev2OrVIEO+bp9Xa8yqQ64uzSUMm37TCQ1ErCikqv+
         x3Kvb6ZVqbMXbY3FJA+ndGMOioPZ3cuZN2vl3V9RZzpDbqqHvYd7EjXZuWZT58B2FTxx
         Z5Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AtwWC1+qW7EHRBWzjzBbABxb5OjED8iNfu/dXUIcGLg=;
        fh=DnEX/Qnv5hiegtsEDLFYfX8gMY+UQ4/QHSIsJHHLMXo=;
        b=GsFkRjlFtfGmnmy54NMA0ZpYjEylJhjDMZ9Qe5BLKIjfrXrXxkYN6rZLsdB5RwcBRP
         xHc5Yj1iAzFEW+e4pAXlE00sSg1rE54chuNDxg3Mpvh4RUaNssYlCecJMbNDtF7fpw8K
         GuxnhMJK+xRWsvbRAdao730spHwRR0BYouJc1ed3qnDgY+dRxaUbtwW21B9WaYUzXUMC
         Ku3bg2GlS4FR+tmf0rXz8cSg+zCOglbhAPN2Xt7HvjAqFeave9GESdUESdX61k9Ajtqj
         5mFLdPvfmjHNAjMRv8KzhVC7XKrOC7Sa0Z5olQGqzGaCxfp2o/IxRSuHosIuKODQSmHq
         F0mA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788979460; x=1789584260; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AtwWC1+qW7EHRBWzjzBbABxb5OjED8iNfu/dXUIcGLg=;
        b=GV3FnB5JgpqkV10kiHe3IbQ2+AV2Z8iFEluZ/QZXShNH4AFQxiD3m5NUE7Q6qtnrGH
         oC1IyyOR9Jmau2DqHIwPH6C1bA6yxj+EsTihyeCfjFnB1fXPMr1RoShblQNFUT+ZgzoD
         d46uan1b45PgfZSQEFMt1dsvYH6zkcQg1jYPxmnenQseyLAo2QjbGiQgCHZD4VxO1hLp
         FTd5LoyCG+DSf29kxhop2w3YJyPx3W29on2ZFDGb1XZs1xfqqCj+QOBCvvVprr4gNHXG
         bTBs0Q/BsoCg7dIwbFvvpiM89XTwwYa+yREXGhqLd5VsqZqpjG6X40w7E0npXPk6ZJZV
         YKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788979460; x=1789584260;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AtwWC1+qW7EHRBWzjzBbABxb5OjED8iNfu/dXUIcGLg=;
        b=op9pQC2013ACZfd6b5bnEIqJEPGEduOunOdeGHULbtXAi+0PfAA7aHnzRmtZel2mUl
         5VEfz79tW5YofvdPF37CEtSwjEoG+yW4aq/pgCgJYWlaZMtI+r/0pnmwV9uioxtvtIpf
         eOAFQiP84Ja1l6/di8SGxX0dColteNV/gCXX0Jpj+i3LJfZncCWY0PiotwHlg/qNU6NM
         8GzkFEIL0hBbGKRnJ9Xl8XTzrbKwjUSqk1UaBSx6KyOkP5m8IZx/n4QF80xmJbjJ7UxZ
         n2KGnAhfq5gIr6eU7wEFEcVv7KSYcWdhJeNTyXm6mNVopNqhvXQgN7w1IJQhVrFdw0zG
         ZrVg==
X-Forwarded-Encrypted: i=1; AKwUvBwrl8IqjGf1hqbbGir0pJiKBtwXH8a+eXbSlx+H4mvkJmqzIWGd9aSrBTmj6aYOJR3sR2zqJ7ZWYZiJ57E=@vger.kernel.org
X-Gm-Message-State: AFuF++nKVWxOj5tYGMubGttVOrfSvc5E0gK0zFs+t0CdyWeHBSH+PXlC
	vMBnbjyi5zH5wdCtFZY+uSz3/smOaoWe7utssUlUpXymw9FkRFIEARNUltVk+z8+fmeKdg6+ig5
	H8cpGSiCf18YOWz2XWpVGNoppOIF5gwQ=
X-Gm-Gg: AYBFou01qfOsY7gP1ipcd31fV+mh6hEKLtxtjClbuqN/wE5DGr9nD38fp7SQ/UVQNT1
	RjD/ool7gVVxrFi8y99rYNantKT0duP9I1i5JyeNrcZb1+sWdiwoLPR3vGaGLmCxLpUdrXyRHMm
	0li/YDpqCe6k5sGFKIvBuPJFNCfxwkymd+HQA5TeRSHDMREijvE7mciOSZvxgG/Ck2Kt4sxBjiR
	koq3SHPPY9XhDAS0cphBEECyw2I323Odnmn/fP2m3cuaeCNJYdJFcpMWXErPjYMIHf4q//Qsnr/
	kFhAVVoG8i4liwb2aLREAsYwp0iVBUz8WfT+zvK3f1vnxYkhb8e0BRDiV8A+J3VJz40PV2Rxy8r
	c4iWOfLg7ePQ=
X-Received: by 2002:a05:600c:3b9e:b0:49c:fc6c:be1a with SMTP id
 5b1f17b1804b1-49cfc6cc121mr333765985e9.32.1788979459824; Wed, 09 Sep 2026
 11:44:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909161552.2335971-1-youngjun.park@lge.com> <20260909161552.2335971-3-youngjun.park@lge.com>
In-Reply-To: <20260909161552.2335971-3-youngjun.park@lge.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 9 Sep 2026 11:44:07 -0700
X-Gm-Features: AcwNN1U3zCOUDirZGczH6cumAYxCXyzTPc9AmDFeHgypiiCXyiICy9Nt6_R0FYk
Message-ID: <CAKEwX=NHbAvgmyCnV6mkBycDnozJ_Fse=OYXVdFbRC4piN9j1w@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] mm/swap: scan by cluster in find_next_to_unuse()
To: Youngjun Park <youngjun.park@lge.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, her0gyugyu@gmail.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 9:16=E2=80=AFAM Youngjun Park <youngjun.park@lge.com=
> wrote:
>
> find_next_to_unuse() walks every offset from 0 to si->max, and swapoff
> restarts that walk on each retry, so the cost scales with the size of
> the device rather than with the few slots the shmem and mmlist passes
> could not free.  It has caused stalls before.
>
> The flat walk predates the swap table.  Slot state now lives in a per
> cluster table, and wait_for_allocation() stops all allocation before
> try_to_unuse() runs, so a cluster that holds no slot in use stays that
> way.  Skip such a cluster instead of reading all of its entries.
>
> Fill a 1 TiB swap up to some amount, then swapoff.
> What is left sits at the top of what was filled, so every slot below it
> is free.  Medians over 11 pairs at 32 and 128 GiB, 3 pairs at 256 and
> 512.
>
>         filled          swapoff
>                         old     new
>          32 GiB          92.4ms  66.3ms
>         128 GiB         157.6ms  94.4ms
>         256 GiB         209.7ms  63.8ms
>         512 GiB         391.8ms  73.4ms
>
> old grows with how much was filled, new does not.
>
> In the ordinary case swap still holds real data and swapoff spends its
> time reading it back. it is tested 4 GiB on an 8 GiB device, where the sc=
an
> is 1.4% of try_to_unuse(), and there is no difference either way.
>
> Commit dc644a073769 ("mm: add three more cond_resched() in swapoff")
> answered those stalls with a cond_resched() every 256 offsets.  A walk
> bounded by one cluster no longer needs that counter.  The loop now runs
> at most SWAPFILE_CLUSTER times before it returns or reschedules, the
> same bound swap_reclaim_full_clusters() already scans between
> cond_resched() calls.
>
> The scan end is clamped to si->max, so the walk stops there rather than
> running into the masked tail of the last cluster.
>
> ci->count is read without ci->lock, so READ_ONCE() marks the read for
> KCSAN.  Allocation is already stopped, so the count can only drop, and a
> slot stops being counted only after its folio has left the swap cache.
> An empty cluster therefore holds nothing for try_to_unuse() to act on.
>
> Signed-off-by: Youngjun Park <youngjun.park@lge.com>
> Reviewed-by: Barry Song <baohua@kernel.org>
> Acked-by: Kairui Song <kasong@tencent.com>
> Reviewed-by: Baoquan He <baoquan.he@linux.dev>

Reviewed-by: Nhat Pham <nphamcs@gmail.com>
