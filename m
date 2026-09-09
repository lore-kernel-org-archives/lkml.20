Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510BD583AD8
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 16:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788972124; cv=pass; b=OzAWijkfmCs+NFV6WRnLUTOTC22Qr992/8pG30LBR9HGycohDF7kI7lBXQGMfM7SA8LM1SS1aq5pDZlrOgEpg7tnLzSXNi0GcGEkwZKQt51RQ+6jusoJmFgjstDBOs5DN0qQUln+DzzQ0XVJ93QhLXfmvWNAebA/vf43yJGFicY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788972124; c=relaxed/simple;
	bh=/PVQoRJaxnOVHklysY+eFPRn0PjfeKzNOqRGrKxgA1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TxS+lSpZym3RoUt3AgEWx0QH4q6ctoi3xszW69RbLLbFyo7PZ3LPj6ExTI/ibH0xT2rYDYLFVhdN8Vzeqk5bLd2qzeP8/AO6fuA3HycijtMziXKlsG+DLB/fZwH0f1OwB0rBskX5q70rECZepCvipjUyDkc6tjYRgr0KyRnUdqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KMdV5HJZ; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KMdV5HJZ"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a49d2b18d5so7098231fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 09:42:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788972120; cv=none;
        d=google.com; s=arc-20260327;
        b=mVFyF/w5rsewR9wReWCiaCIp48qGUnRpMxB/YiAwVUSHzRs0xhBa30rNJX8xOHpe+w
         X1YqjiouX8FFeK23WP0ixvMFnMqmhU01mv8hGpXd2PQGDAj6vHKoTcY9qVpQXQv8a2I5
         UmSI0Z3LrZDMusBYXy7X3wTy4E6SfCRY0iIU6dqNIoDIEXjIjJ2G1iZ4wai/rFiTBWYP
         MRzEXjin99dUYhXB05L2y4KjU6Ziyi5PIni6x4oyCt2CxGYHUslhmMyIM7pZRFlQvMi5
         MUX3LE9yXKhw/Xelz8+hZqHKM/OTtna3mRWIicbxGsuSqe80C3OmSI0gzQlwfFjz0Tob
         qTdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/PVQoRJaxnOVHklysY+eFPRn0PjfeKzNOqRGrKxgA1Q=;
        fh=gN0v25NU32KL9sgL1v3lyHHhYMZulIPZZub4MLqtL+M=;
        b=DQGPtQgoSGbMEQMBaSGNPHOZyctYhUgLoZI2LG0mvwojF4eKMx10UPW4EmX9vAt0di
         l6WzVqmhprregUb8onkirpFe10dbDmL1Da4Gpky9iouG3wbDZjAEq9kvdsrHmbc0OLUz
         0RyL5SgyKfsFYfBgRBuA+beg6uevRSvwhxQMOoER5es5oI2ZxutQy3RygHpKQ4A7zOH2
         le50Da/DOtW9sAksOSX5zNLalyLKWagmz/6LIB1xESk6vYmZCq23MdL7go41u/OhKxpY
         X7BA9/BqzuOoZ3VCV0cpGcdnY28EJRjO/B9u6ZXdravRMMmsSZxtDABvI1XYu4AYgn1m
         LAjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788972120; x=1789576920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/PVQoRJaxnOVHklysY+eFPRn0PjfeKzNOqRGrKxgA1Q=;
        b=KMdV5HJZLLIGtdTClDxjzcAuheXnvNce1P1lhEryWKx2i8eALdZs63zfXF+uUbfM2C
         XToTkhlCI+ek3ljZF0Cew7UDx038xg1rJ3x+oJshyqwgORB8iiCvpAOjAv4LgcFBxBJa
         g0qiswT5jPVitQmJvPqLoRjKT359Nz4buKHHuksAgwUQnVp9GwHZ1DS5xI8+WcmpNGgK
         7Nu91E2WjY9yxcUSlcC/sFq2usp1DBmdr8iaGTJzbgoOJ06J8ibkvpSJlIZgL3VeJvqG
         ozrJJwvMMjy9d7XW0YzsoAW/Q2ZEFuXct7MHPiPDKLgizH/BUTkNWGrbndLP+Kum1SJc
         +JLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788972120; x=1789576920;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/PVQoRJaxnOVHklysY+eFPRn0PjfeKzNOqRGrKxgA1Q=;
        b=RH/CcDFt6j3+nbIedgY7j2rNWohuXs2y7Yq2pXw4UqYMd/F+uB+ylsXPzs5z2dlGnF
         /s+e/YMtIE1rF4lSCgi3GCSbLse95mswQ7eJsHfHI8n0DBzpYdrLXNcxV3ev9OTnJRpu
         uR717RJNl0V1Of5qIlaDHe7319lGDbGEf5ndBbRSQv94aQszVA+TGD+g5xAaf6wTUuuQ
         ReFbqovz5hoTcvygfvfENrM7mY9rIIDFGpET7WFNYjMW8BPsLux1ssgW0vR/fPThVlzx
         NiY7GYzZ1LsH3ny0zS0RxlHlCHh+gbR/bGiCYnUMyhN30c0b6mrs7RVPFvMpoaVAt+b6
         5zZg==
X-Forwarded-Encrypted: i=1; AKwUvByyTBqgNrlP49J0RuM0DpN1oUMxbpcLrbiY55xidTTHEn6WLMXMMPbxctkyl3d/1LJjgAf+riKHr4/a/W0=@vger.kernel.org
X-Gm-Message-State: AFuF++kFS6L0wl+i+cZXMPldzRv77GQnZWIVliRkPMbE+bd8Gi+1VRQL
	4yFnXOH50ZuT5bwG1g1av/TSXFSE0Tfml4EygnxkeIyPUUHhoLcYAZQVXPsM1u+nf8B3dzfB/u2
	0gXaVQMizz1OLhfY73c9kVZHFS3LxcMY=
X-Gm-Gg: AYBFou2Fri+IveToyqk8IK+/1H4s4yDCfY6sdTAX2ThYY2UAX+pkpo04UmetXump6wJ
	gTKALkfw6q1oA4CD2otVqCxb7hYJBYh+4hspIP37MOvXnb62Mt9NOdy8kvqIfhreVcPJdjeKASQ
	6UrEjXLr8K6NY3EPFw6e2M7YaGdqOPm4cZ0Br4x9KoY2MFEJicfI09x80/oQGtpDxXasU/C+dN0
	K+zLC/cMNV+IZFRsfuH4qHtTvwiKikpt0DfKAA9gRVXqLEmccO+hZL+XZS1BiVmHr3U19rN0G+j
	rGEmXEQlWwE7BuLvs+N4x9IMjR0xWTMEtqf5bVh+xIpwVS8jSDdgkP+cXmt0rGtMIFPkqf2Oj52
	1g/DcQm2xE2E=
X-Received: by 2002:a05:651c:221f:b0:3a3:2585:3bc5 with SMTP id
 38308e7fff4ca-3a371a898d4mr40270231fa.3.1788972119897; Wed, 09 Sep 2026
 09:41:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <CAMgjq7AHRzBsbmGOx0s=TQFBwcn=DEU1naR443sO6x+pJd6hAg@mail.gmail.com> <aqBT_35E-eSoN_zj@cmpxchg.org>
In-Reply-To: <aqBT_35E-eSoN_zj@cmpxchg.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 9 Sep 2026 09:41:46 -0700
X-Gm-Features: AcwNN1VWXPWfi4oFELOf49OQVDIrkZtLFgj_RbpHarRwRGht_40BlAv3JxkMu4E
Message-ID: <CAKEwX=N4aaq_oD2agTUNrUNXhaYGeQ9vxu+dywFvEFgWFi4uQg@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Kairui Song <ryncsn@gmail.com>, Chris Li <chrisl@kernel.org>, 
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

On Tue, Sep 8, 2026 at 11:30=E2=80=AFAM Johannes Weiner <hannes@cmpxchg.org=
> wrote:
>
> On Mon, Sep 07, 2026 at 01:51:31PM +0800, Kairui Song wrote:
> > Where I've ended up is that unbounded growth is a real concern. On a
> > host with no memcg limit (root cgroup, and most desktop and embedded
> > setups), an unlimited pool means usage can keep growing, with no
> > admin visible ceiling at all. I'm not attached to xswap's percent of RA=
M
> > knob specifically, but I do think some kind of bound makes sense.
>
> Swap space is just process virtual address space, no?
>
> Swap entries already have one or more page table entries pointing to
> them, which in turn are managed by trees of vm_area_structs. That
> means rlimits apply, overcommit protection applies, and OOM killer
> attribution works as well (oom_badness()).

I tested this theory. I spinned up a process, and let it spam 0-filled
memory + swap these pages out continually.

As you predicted, oom-killer picked it up eventually. The host was
(and is) intact otherwise :)
