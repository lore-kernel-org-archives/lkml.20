Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793890255;
	b=CiYjozZq4Ct8ggLPNcSEOREmmjF/sQgxEbQSfUaL5UvTR78JmsZOiCPSop3LVIkJR6GK
	 bUQlLOD9mrQOHdHBhN0Jbj9aaPDx3kn7RbS3pwNntsdyxzY77p/ocsizx/Z+MMKELRYmn
	 SZ1+B0L7tU78uYyQW9KdI/E4f5Z8bkR1RWybtHmaV7typbGCtMQvXNtXS93Tnij6O7NSK
	 f0YeNzihDhtXuNrO1f8mJ0OzZ+syKnUKfcJXR2AiOCf4fOMRZxYdUGRw+X60lnKschSvx
	 qdfi41Yia+0AYzNWGry2g1jUeWL0LnqPvv7LBwlYh2xTDNiOM2di1/JjDoOefLxFd5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=x6AYBRDQlDAqtDeCOrRnb86KC7Ggop6ssABCp4bzpWk=;
	b=VZ3ODAqmBv/dGuvj2KFknJP++wEy0wSlMjfUdvAdo6VloK6l2OTcZhgpf2Qzj3u7R4AA
	 VKkLi030iLhkaanKE9XxI/OPESF17WvVtWQa1ixJBWtbtim6TOnQVpMXWZKRw+Bj4RYeA
	 YOEFI+rzZ/bO1gAHC50TXAxtXdvLwJvPqn68dsG5vV9dejScUFBlo60EjTgVGVEV1Tpap
	 0ZDmdDQKyu3casJerxjTDCWIzLUC73sndAJPGc/Tk09yBdUGE3dz2vLAFgjJTBu+QIw2Q
	 DPi3Jy0O3jlYN+8Un4JgqlL32i5A/Q6c0c9bUdTE3hFAiL9Hh8qCL7Fs0u+jHJ+y62A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qrf5XQ3S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.52
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E80606A33C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:50:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78E80606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qrf5XQ3S
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7bec5112765so1207444137.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:50:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793890254; cv=none;
        d=google.com; s=arc-20260327;
        b=JtwaKrZEbg+6kFNwPct1WEyLR8vjBaePU5/sRy4Y4fPgSO9nrXQLjqRPVhKDtUI244
         OLKmzFXJKpwGEApktObWenwCwUv14oRq5GptSadRbYJwHI3ZZKzQAMrDMl6FoKTW1/+L
         84hNR3ZucQlgnz0UJXSvwiA+x8IzvJIn09lIYCgkVxX7lckX5LbauNuAW1hg5VJVhGAn
         qYYM/LCPGhhVNmZMI8BQbKb1RiUneiTUXnd684zSx6ERUpmiEgjL07gNEFyQ6HIHrKdb
         4DFACaGBnzgcmnlHugF3puk/0bOaM0uFgVKtHoAmICSPXGvkRXKgLOjTM3lWKpT9DJIJ
         IDTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x6AYBRDQlDAqtDeCOrRnb86KC7Ggop6ssABCp4bzpWk=;
        fh=2gDXDNtkDZuBp7TMBXEQ6PRxx7xnm/6euMZb3rju3pE=;
        b=AyXZzbNUKh1DuGyORMHIG2cw//zGyGqJs223MPSl71Aa683XuGytKLrxa+xmqGKItv
         /yzdGZHElLyQy1oKV8jfSVnVEh1efFDTksRxB4uhsgBk7a0/XY+a9K+xraejsGKQkniA
         A8Mel046EL8qS3//KAcrZxBab36cn7aKp6yAWLxK8/FYNQjNvNFHH11K83PbFce4M6i6
         SrMRc25cC9zpzdRQNohqLfOPqRW8NqkqFHHnqqCy6fn3Pgp2QB9jehvsaH10kEzClnKe
         POQ6wMBpfEF673lFosJzI/QouaBM5XtQHnUyIQoqlnGU5SEDAeYIxCh9G9Jf6mGO1svg
         qnSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793890254; x=1794495054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x6AYBRDQlDAqtDeCOrRnb86KC7Ggop6ssABCp4bzpWk=;
        b=Qrf5XQ3SSTLAgWvV+nnFlsLm1JLWLJ2uInCBOKdNaEFLZlZ+/tzVzEIfIk3hbWb/vD
         hsUHhBGmPqU303eF71vK5rHMyUQ7GsuMwV6TjWns2/RoNhaU7rwom/xHkz66g+8n32WJ
         50uTk93nV2xYkb9lu4salBmLqTUfbGMA4mQqsrnLpf39FMQ+b9o/rPaVN8zdxJ7zmsv2
         F961FedeqnnlKdMl5WnurPwS+SOgPGa1mDpOgkePPcNWAlY2alAELq31DDUeGbddEPHW
         5KmJkk7LBr/4vcBaZHFUeJgMJDQgO0atmaj5t6QKpxUnX1w7n2K5KG6g4fglHKwZR1xO
         3DMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890254; x=1794495054;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x6AYBRDQlDAqtDeCOrRnb86KC7Ggop6ssABCp4bzpWk=;
        b=ukqHC67ttjW9fK/T9/AQ+Pg2U7GpohiUj9v4DiEyuuKmLLciyoWQksS3v8JYLlOY6c
         TYm/SVS4jsuZSCNmmi9p+OfUB/Uq8g4UA6/DQCj89eXrNLB1NBo6rPUqqiqe6V+HkjJu
         ATN1sLUDBakoI7G+qBSTNeOoBHuLZjGwaEIX+C1bp24yhBIwQcFwbCFAyrzhUPAHR+Ro
         F61mELUEkOBrqmFijyWGx+MggjbtamRXLNTxvsCNdcQsXQFt9LcParhSavRiGEe/67HN
         ufPyRsY1iuRLkQywxSQCoGybL1/t1UnII6meVPegDv8xc+icU8OUj9/2Bou2iM6WAgNp
         7qww==
X-Forwarded-Encrypted: i=1; AKwUvBxwjrmTjCMzjxEhm3jpfzJX1NMUkt1Z7aPmc990W+uMWgPaPxtiBZbjMYFtnJdvc2MMqH6KuMYYamW77z8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7Lm49vzyplitxHJxgDJ51oHOqGkkGNTMyPU5HrHoZIM8/I+Og
	1MTaGSsCUnyPwPq05M8S+IR6uUB1b6k/L+CxBu4HSa1zN9LT8t5ofJQL0NaU1C9Bm3Lp5pr9Eb5
	ngq3jXxIxD3lbvvDgwhNd8GoUsXBVgus=
X-Gm-Gg: AYBFou3ekcdimZah/1UK7WxYB+mtr390aEe7Ny30Z1/jK1iZ3eT5/xNv3KZWN0x608t
	ZVzuUM1k2sxvLQogymHPfSeO/6KlXfqrZgzG7MobmKOTQM34d2i9Cn49IRavmfM4q5o6WkzSin8
	dOkZFR2nAlsujeB0rSOnVy9TzrBSqIk4IsiUpZD4+S35FS6p2X4yQe+ozCZZJ6q7bxSgfiJOKVJ
	1deZ1PM+cNaj2OE0glu243PKKCMoMh51Toz8Skz/A//lXNN3jKCA/GHRlxcw1HhbIy14qc4yriA
	TD+T5ovzxQurykOU9md/1Gwvt2cUd0ZndQzcV1PzeUuwrj4JVasBI7I31ctMeOBXXvRp//AzyXs
	aOsosy2qrvv5Ie9FYNfBOR8Ph2Mqbg7QSnRrRM7XVlhluwAfQY3hesUP1YvkYnF6rdN47lA+zJo
	mzh+sLG/wt
X-Received: by 2002:a05:6102:5243:b0:7cc:115:ddf4 with SMTP id
 ada2fe7eead31-7d072cafbdamr9042312137.25.1793890254113; Thu, 05 Nov 2026
 06:50:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104233029.3282438-1-joshua.hahnjy@gmail.com> <auwfZj6QTwQqFIZb@parvat>
In-Reply-To: <auwfZj6QTwQqFIZb@parvat>
From: Joshua Hahn <joshua.hahnjy@gmail.com>
Date: Thu, 5 Nov 2026 09:50:43 -0500
X-Gm-Features: AclHuK8f94VBTeNgSM335yz-5hAFVlY2uvlhDStBMta91PSr4DplroD4jKbuQCM
Message-ID: <CAN+CAwPNsSWyqbKRGEL_rtrz9CWTdFvhKFvZpbUNoJJONXxuZA@mail.gmail.com>
Subject: Re: [PATCH v8 0/7] mm/page_counter: move stock from mem_cgroup to page_counter
To: Balbir Singh <balbirs@nvidia.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Harry Yoo <harry@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Maarten Lankhorst <dev@lankhorst.se>, Maxime Ripard <mripard@kernel.org>, 
	Natalie Vock <nat@pixelcluster.dev>, Tejun Heo <tj@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 1:17=E2=80=AFAM Balbir Singh <balbirs@nvidia.com> wr=
ote:
>
> On Wed, Nov 04, 2026 at 03:30:21PM -0800, Joshua Hahn wrote:
> > INTRODUCTION
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > Memcg keeps a per-CPU stock of precharged pages so that small and
> > frequent allocations do not walk the page_counter hierarchy every time.
> > Today, the stock implementation lives in memcontrol code, even though
> > the operation it caches is a page_counter charge. This makes it
> > difficult to add new page_counters to a memcg and preserve the fast pat=
h
> > behavior.
> >
> > This series moves the stock into the page_counter layer.
> > page_counter_try_charge() consumes the stock, charges a batch to the
> > hierarchy on a miss, and refills the stock with the surplus. Memcg no
> > longer manages the stock in try_charge_memcg.
> >
> > So the stock keeps the existing layout, which is still a per-CPU bank
> > of 7 slots, each holding a count of precharged pages that it hands out.
> > It maintains exclusion using local locks on each CPU, and for remote
> > drains we schedule on the memcg workqueue.
> >
> > This change gives us the following benefits:
> > - Separate charge caching (page_counter) from charge policy (memcg).
> > - Makes it simple to keep stock out of interior cgroups on cgroup v2.
> > - Prepares for future work for stock improvement, which can now be
> >   isolated from memcg changes.

[...snip...]

> Is the main motivation ease of addition of page_counters to a memcg?
> What would those counters be, why not add them here?

Hi Balbir,

Thank you for your interest in the series! So yes, that is the main
motivation but this series offers standalone benefits as well (which
are right above).

The new page_counters that I want to add track per-tier per-memcg
residence. Those are used for enforcement (and not necessarily for
visibility), so I think they wouldn't make too much sense to add on
their own now, without the actual enforcement parts.

What do you think? I've also linked my tiered memcg series [1] if you
wanted additional context.

Thank you, I hope you have a great day!
Joshua

[1] https://lore.kernel.org/all/20260807202059.2620949-1-joshua.hahnjy@gmai=
l.com/
