Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D6A208D0
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 10:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788086436; cv=none; b=FsfA4hm3/cRbW+qoHNn64sEHyeshj+r9LBhH8Ci5QP/pbdGpOhji7I7tYHoNHDW9fI5rWG20bXTAkBnTHYiKMcqqRU7p80zAtp5hh3oW+lsVDqy+CLZicb8XK/CrL/ayp+cU2ZQkgFeJo5iPTGSuQigVTd21nVmYSB1LEe+MB70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788086436; c=relaxed/simple;
	bh=s7dNTbr/tNVz69TngDdkquZjYKowk/qW7jQMXcLbnMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pbTJmHQZKc1Pnwzbiu97s8tqC/cQ6puoP1iFv0qfwHgwM0K6l/I3hNQqRIoe/mvfd3CJ/6sq/TwMGZV3gWuqJwj2VOSbx6o0pIUcQe30rLc8WpeT/XYOE7s9kTWjancV7eOYIlADUN0zXtowOSSdT60lczi4MbxHGI6c3vNUTa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZKwTF8Xd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZKwTF8Xd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CAAF1F00ACA
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 10:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788086435;
	bh=uFsR1+Syprr5J5tje5S4jkkUx1bx6a8Akbh+NdTo87c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZKwTF8XdyuTnYcKU3cKihII2IaOstkhQwk4UQEpQ6cT6ncHu/P3ABfgk416wQMaHR
	 f9kB4VtezvF4fGBXxVKBw8NZw9KIZehBGrW63xCNaHv8x5Dn3vmtuYj6emZjkUBlpp
	 6dUtGrVlipvgx77PIkg/YwmpAKiib21K0oodlswduGfpHE9HLLgXhwsie5HUst1jYg
	 sL+zBO9LRzC264DOm1bIgZKyvPZTxfhKFAlGb5tLpv/9j4zlSlNC5iDoDjPTINClED
	 fdm11sH5J4S19pcQsY/mz4cu7nryGkI+xlrR2DFAD3TGq7O/MNjI4QX0aUE9SwSYyi
	 usCapY+9/deiQ==
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-52f2577ac01so17005251cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 03:40:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpvjaDqyZJhGkHsa50bc5s+8etrtxVPgegjjMZXgPiu66J9FfdaMKN9ZT+cOvIY7GJuLTUgRGb44KkGbX8=@vger.kernel.org
X-Gm-Message-State: AFuF++lb/4Lc8akb8vC5SXCFQFdxZHxdJVfN86b3GreV2g5DAhcJtKbO
	1S51pwrtxqkC77+5zWWPyH/BPgT6h6XGy6cy1irDzWkn627kAaF8WM6G8AL/ayCvjpsXsSyi1Xy
	ab9tyIaD/3eF3MwoHVosDAvLAgeAAWMg=
X-Received: by 2002:a05:620a:a0c8:10b0:938:fdde:34e6 with SMTP id
 af79cd13be357-939138cc83cmr1680232985a.28.1788086434432; Sun, 30 Aug 2026
 03:40:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828110919.1324028-1-ridong.chen@linux.dev>
 <20260828110919.1324028-3-ridong.chen@linux.dev> <CAGsJ_4ws6edtcToqJQ0azJPTymAYj41nzdGJvBqEM+gROiJtRQ@mail.gmail.com>
 <c0a32c3c-bff8-433c-8552-f0723e3a07b7@linux.dev>
In-Reply-To: <c0a32c3c-bff8-433c-8552-f0723e3a07b7@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Sun, 30 Aug 2026 18:40:23 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wvYNV2UMaFW0a3Fb9U09v6bPfXyg4Rzw4B27xo-NVYbw@mail.gmail.com>
X-Gm-Features: AcwNN1W5OF4FZEbyI9ahVrtlbMzghVUAZzbwgduCOLK4Zm5BUL7Ps1VGygdfhkY
Message-ID: <CAGsJ_4wvYNV2UMaFW0a3Fb9U09v6bPfXyg4Rzw4B27xo-NVYbw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mm/mglru: fix ineffective memory protection for
 non-kswapd reclaim
To: Ridong Chen <ridong.chen@linux.dev>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Muchun Song <muchun.song@linux.dev>, 
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Chris Down <chris@chrisdown.name>, Tejun Heo <tj@kernel.org>, Yu Zhao <yuzhao@google.com>, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <linux-mm@kvack.org>, linux-kernel@vger.kernel.org, 
	Ridong Chen <chenridong@xiaomi.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 6:13=E2=80=AFPM Ridong Chen <ridong.chen@linux.dev>=
 wrote:
>
>
>
> On 8/30/2026 3:53 PM, Barry Song wrote:
> > On Fri, Aug 28, 2026 at 7:10=E2=80=AFPM Ridong Chen <ridong.chen@linux.=
dev> wrote:
> >>
> >> From: Ridong Chen <chenridong@xiaomi.com>
> >>
> >> memory.min/low is silently bypassed for MGLRU during global proactive
> >> reclaim (writing to the root memory.reclaim) and global direct reclaim=
.
> >
> > I guess nobody is silently bypassing anything. It's just that the
> > effective min is stale data. If kswapd has run at least once, should
> > the protection have been updated already?
> > I guess we need to update the changelog a bit?
> >
>
> The children's emin/elow are derived from the parent's min/low settings a=
nd
> children_min_usage, both of which can change over time. As a result, emin=
/elow
> may become stale, even if kswapd has already run once.

right, let's just say this in changelog, we are *not* bypassing we are
just checking
against stable data. The current changelog seems to be misleading.

[...]
> >> +void mem_cgroup_protection_path(struct mem_cgroup *root,
> >> +                               struct mem_cgroup *memcg)
> >
> > Can we rename it to `mem_cgroup_calculate_protection_path()`?
> >
> > BTW, I see that the only caller is in vmscan and it passes NULL as
> > `root`. Do we need to keep the `root` argument if the new helper is
> > only used for global reclaim?
> >
> I'd suggest keeping it as is. This function updates protection along the =
path
> from root to memcg, and could be reused later. Note that
> mem_cgroup_calculate_protection() assumes the caller has already performe=
d the
> top-down walk, each level's calculation depends on its parent being updat=
ed first.
>
> For mem_cgroup_calculate_protection_path(), it can be called in any conte=
xt
> without such a precondition.

I am fine with this -  keeping the root there. but I guess rename is worth =
it.

Best Regards
Barry
