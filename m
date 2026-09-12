Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1941A3F9F50
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 09:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789203682; cv=pass; b=dmhcTn6C/gX2Ty21UlqqUvgO7r3PWwMdVyn+61pyjaAodQC9jUVNfHyukgU038f9L/QcKLABHUjSbHkjFRHyfsZnI9TUpxxXuPswLU47dd5jFDnTnZYOx4FCGiJnxAdiMlo4ijpV6USrbvL8m+PSmKfe7am978URGt27IJpZR44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789203682; c=relaxed/simple;
	bh=IPNosc/r0xfulC5WG68kmh6M6W043Uql4TTAQdGiAs8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pZo8nO8lSDjKrsn83i6PprKo5QTbKvZHXE+swZOn6pUdq7/jKiQ+tftrpiaNRG0cxq0DDVZBzyJu4Y0KmW+NIKSGmSy8+D1eXnEls5d/fvR9onNqS3J6xXyD5FHsxJsnPEv5NuFqZjpj5vDTVrrp96mbilLwsSo7cPOokJmpHTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cphMH7I2; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cphMH7I2"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2940d16190so251332766b.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 02:01:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789203679; cv=none;
        d=google.com; s=arc-20260327;
        b=nz/WafeALfV6EdDyXPZ6VzuiNzHc28kcbC7CIV/2gcVfzuXWPin2+NqIYrNnwr/+Zd
         wHQUM9GN01tZ9OU2zy9nreIz4vzspeSvVz6TVfTuXn42dso7pdpa8br1GvM5UF9z1vod
         t53nvz35W2zduOFDSMTodDsykm37Lpjw9lb16VfMLLHW9jFzlt4oDC9MVFOzIPHBTsjh
         iQZxLu6QamaRg0gjq39vfflnQ7+bk2Dq6QJ10vaDlrUyRLARTfLBNTvuGSZ0rrZ82+8e
         WFXYrcEgWAc1plP5Wma5CAN9Bmd9taNEJHVGoeamQv3f8yI8A13nqU5xK755ohE5wN0U
         bYmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Emo/VHVaZMhmQcduzPD7yxfTUOKr9C1DEbaLmLBuIaI=;
        fh=7FUilFmKJgqEZCq/FtQFoBCqkB+HuNeoyz51RC9rFMY=;
        b=ZgcGBWn/hyuWlbLwNZ6NPbpn3TRXDCZyFm66IAbaHoOXBeg2L7/mvBwFI3B2/itzBh
         fnYWXSyJH/V5ih7jVY+LZVpCQ2t7a5WYyj1UWU/yDoyd1WUPtH+pIcCz+bf6Hmbr/rgy
         B+GdhEoGX6rE1h17vjJqnnLBbbDHSHP7P1NgtxScq46Uvgu6V1URnDG9KiSFZuOdAFgK
         ONx6yoo4LspPXepcBQfoyL3AyA6QvYvE7gpkDs5ClpXPNqmKBBiCQrlj9NYDEFICcb0x
         eTtSp9N+qpBw6ZRULT1w/92DMpIoY1k8o8hZD06idDtKt2aJ9qGIEDLtztoiJIB7ptHg
         Jvfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789203679; x=1789808479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Emo/VHVaZMhmQcduzPD7yxfTUOKr9C1DEbaLmLBuIaI=;
        b=cphMH7I2NbjgYz9Y7q4cvOIjKX5pGTY8W2/iskq9B7nGNj0k7301wz5doOVV6+aTVr
         LIo6OcxJqd/it3YEzllDVrdV+6MRbfFIJhKgiwjAwQM40YgAkJs5YRfSotp+m4AZEEO4
         tRNBQw51bNBDE+YMltcv1NIYcxldHzDQXK6MaWlhu52lLDd0lMYK0x2MN1wTUqFXB6Nj
         RtAlSwE9KgvQvze3Y/My6eAYs90PvCCc9HxZXLn8JZy3P2QX/aoYs9fT6t+xEZxhgpap
         +BDLXm9FF6AygIxv1GYhBoEg2KPJ0kYc4upched6ca/pIqohLomPB/aC1RgYAnVLX3IP
         LsoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789203679; x=1789808479;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Emo/VHVaZMhmQcduzPD7yxfTUOKr9C1DEbaLmLBuIaI=;
        b=GeRnhCl9SU1dsy9GVCqd9BO+TO+7l3G5rwZ2ptXt/ZspVR5zo1iMFLzVqmnBMXtKw9
         hfUtylIkjS4a+X5Q4UOdMwFZcP8YD++bt3NaXa1oxexv0QX3gmE9KL9hOuBpDWJCmYUY
         LMMhUTZYA6zu+vZ7N3pELvOjcmDgJLlUohDeAVi0w7LuuiwbyH8FamQ8ntZODaZUlVTc
         0Y3g9geWmLJjGG1BSRj1CWOx6rD3wi/wACDVeoMUmTqjPsKI3P7d6BNXoKJlbBRmGRKr
         Kw6qyfAEj0lb2MeM+sR+cMM/qxNly5vTQiCuVFYldeNFIssl3IyVgpj/KmV4+9rLX6X8
         Ah1g==
X-Forwarded-Encrypted: i=1; AKwUvBxPgiJxV3FRlMpRSn74xxGmK9tImYV/GDxoBMMV4UI8hjufJuGioEAFOr8aUg9Hzl1AU+E0aU/YfB8pp8A=@vger.kernel.org
X-Gm-Message-State: AFuF++lyZzTJbdejO6sLunWfAnwKRfrFjhxIjPj2jGH9D0dUVty71R/Q
	h6XifK6mNoWRD9exXFpS/rWtIGjRJUJFZ1iljh5MqN2P4Q+1dOK9URh3a6Zz+c+6Wb39tzFt/OO
	cVs8SL/I7qZIHprILE+PvumUuV+gShgo=
X-Gm-Gg: AYBFou2y9b+IDJcNWfzKrwR8Zn0Mz5MjxLyoMn/Z9ZiRVijq3M9zn59BWghZiCv6/Xn
	ggx50a37XjBSRdA4qU8G93qVPMoTCZtfNnZ3VFBn7YZAkHJYN7iYGzz7p6KnlAfOGXAMBny5c1f
	G6+VD+QkDGLjgxxFfeFiqP5//IIOymghQVqWK9rHxeqjcU8FqEwD78d0Vhu7mVdRzX2Qy3EBdVw
	H+0gP/G9YeticU6hN7JPwzAKblfx3SWoezgQZI7iRmHvYIYeBmorOXPZb0Lybc5iSQfsl1FWnMU
	K4RRCNwiPGA/2bWR6Z6GZX4D2NrB88hEfirWbIwPstrZmIqW82YDvtKFCDpNWT0tA80+JCtzWL4
	6gn0NkzJjaXM0
X-Received: by 2002:a17:907:3f88:b0:c25:9102:ed with SMTP id
 a640c23a62f3a-c29665ff973mr349742666b.5.1789203678979; Sat, 12 Sep 2026
 02:01:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <CAMgjq7AHRzBsbmGOx0s=TQFBwcn=DEU1naR443sO6x+pJd6hAg@mail.gmail.com>
 <aqBT_35E-eSoN_zj@cmpxchg.org> <CAKEwX=N4aaq_oD2agTUNrUNXhaYGeQ9vxu+dywFvEFgWFi4uQg@mail.gmail.com>
In-Reply-To: <CAKEwX=N4aaq_oD2agTUNrUNXhaYGeQ9vxu+dywFvEFgWFi4uQg@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 12 Sep 2026 17:00:42 +0800
X-Gm-Features: AcwNN1VTyrOeQmFG_efe2_ca4qa89c2Nr9YsCc4NghZiW0bnHUOivuHs2n-bDVs
Message-ID: <CAMgjq7AfNBUpMamcv29JFzpX=7ApNYVLtPjWT4Sm8cXjSLYL9g@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Nhat Pham <nphamcs@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Chris Li <chrisl@kernel.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, YoungJun Park <youngjun.park@lge.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Rik van Riel <riel@surriel.com>, 
	Gregory Price <gourry@gourry.net>, Wenchao Hao <haowenchao22@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 12:42=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrot=
e:
>
> On Tue, Sep 8, 2026 at 11:30=E2=80=AFAM Johannes Weiner <hannes@cmpxchg.o=
rg> wrote:
> >
> > On Mon, Sep 07, 2026 at 01:51:31PM +0800, Kairui Song wrote:
> > > Where I've ended up is that unbounded growth is a real concern. On a
> > > host with no memcg limit (root cgroup, and most desktop and embedded
> > > setups), an unlimited pool means usage can keep growing, with no
> > > admin visible ceiling at all. I'm not attached to xswap's percent of =
RAM
> > > knob specifically, but I do think some kind of bound makes sense.
> >
> > Swap space is just process virtual address space, no?
> >
> > Swap entries already have one or more page table entries pointing to
> > them, which in turn are managed by trees of vm_area_structs. That
> > means rlimits apply, overcommit protection applies, and OOM killer
> > attribution works as well (oom_badness()).
>
> I tested this theory. I spinned up a process, and let it spam 0-filled
> memory + swap these pages out continually.
>
> As you predicted, oom-killer picked it up eventually. The host was
> (and is) intact otherwise :)

Good to know the kill path works. But I think the accounting side cuts the
other way? Won't that conversely underestimate the host's ability to
handle memory alloc? Not to mention a lot of application are
swap  space aware, some built in logics like e.g. with vm_enough_memory:

On a 1G machine with vswap enabled:
[    0.241906] vswap: created virtual swap device (2199023255040 pages)

a 2G sparse anonymous allocation fails:
[   46.044002] __vm_enough_memory: pid: 1129, comm: search_agent,
bytes: 2147483648 not enough memory for the allocation.

The default "Heuristic overcommit handling" policy is meant to handle
seriously wild allocation (as documented, and it's named as
OVERCOMMIT_GUESS).
totalram_pages() + total_swap_pages

Is the limit, the heuristic exists only to make "a seriously wild
allocation fail" (as documented). But on a vswap-only machine,
reasonable allocations fail. Common swap devices, zram, or xswap don't
have this problem. One could argue that the size there is just an
optimistic guess, the compression ratio is not controllable. But that
heuristic is a guess by design, and a plausible number serves it fine.
"Unlimited" seems break that.

One can switch to strict overcommit limit, but that is limited by a
user specified ratio or number; again, we need a concrete number. A
fuzzy "unlimited" seems odd.
