Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391086;
	b=Lg5ob4VH7dmdQSuw8OUWKCdLpSW9JpYHmyuG4zgcDxtrdK4bzZR1JJ1noUgY/iTf5GnX
	 oRNYKil+qycXzEoFV12ak9TxQoeQj6whlsj4EG5S2JGYz3+qu47Y8uQdIch/pMR/HTsmD
	 NJrw4p/S/Y3WaMOxfH55yV83TjAb6P2YfuLyaS81Hliu8L8H0/wPAcQc/y7TsTPcLVTYc
	 9w4xM+7aUYAGcjxfbPTTCXYK4uO0bk9DaF34BUDQlPOo5axWKjlRU0YKG7b7bRTNU131v
	 BaJEj+If9pkXDYo31W6DSw7ceWRa/gG7pq7W0JooGD9cLt/G8ywGu/+MD2pPv6CvQOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391086;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=x8WYaUyHEV3s5p2jssXz770F7CHpaoglZMsT5OswgdQ=;
	b=Vm+hkkY+2vrXSYBPgOvBDsBydKSvkrmNLzfaWRtO7R9XJDqIvDSgnvYzrJ4kNR3tWBAA
	 55pS20ME7gagsZ2GHhnjw+bZSyyMa5L6kEjXYO95IPMBiy6eMe30XsZqv399zNxA16as5
	 ABVFzaCFIajvqm8493z8xX+cI+2BEwAH61WikJvo3KTBt7oq3+NjgsDNMqHGkBJBisTlv
	 kMAA+RFS07nwfigSyb/d6OaXvUOMpIKTQTlBG0ok3MeuDuUS5VekxNKQ8qCE+ipuHzadX
	 /nuTU57d1u3qSC3tA/rsy8GtEYFiG3J+mJjUO3ollo/5wygEvCW+fU/6tztOFs3VLbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N857zjfe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B33606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N857zjfe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB66C1F00A0A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794391085;
	bh=x8WYaUyHEV3s5p2jssXz770F7CHpaoglZMsT5OswgdQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=N857zjfelwJgxMwZgeMvdviy4yb25FhIkfYq9xYiegrSWPbwNMp0kTtnImQAwnhLx
	 QKigHsKalH2vjAw/nxrSgVxbl8NitojaovS5jx9jR2An9toiCSIXjvbUVXXGo3LXRH
	 x/2WHbp9K0hGTSnSvseQzBQIbwRiZLInhUZS7zbONYGXfBZwBJ6Bm/KzauvYrSPjT2
	 GsA1dHR5bUM8ZsGunn5xNirPgvnmG9DBk1CS3Jq2WZrbl7pSA9AiQRRABBZXxIR24x
	 xg9CYEYdZRbnT4xig27wGxrETP3lprjb5D18kPE1VNECuj/mqmgcVUI1gnkIM3/l8v
	 qNv2GaBfHwwRg==
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93e63ee7b4cso269965785a.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:58:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEQLwWvu8pXHZc0JVXpQbck/K/D+P7VCd+80bJxFPULi4hHo2P4N/c5DcQ0HaZW0BXQWACwzp1E0mlVUZc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Yfi8jXg8RgoYasFcPqWF7JxZ8k1txR2k40Sp4OGGiC7sXchki
	t1Hq7gqwOGZ3zKtWWKUIh8xX9ZFO1+lfHIvHFHQQ8/ZDSRm0lsfS1dTkBeZBvXqVu0kssF1CxJh
	GdCtrMmIk4voveIww4gWJp/c/EATKLQE=
X-Received: by 2002:a05:620a:2805:b0:93e:e425:229f with SMTP id
 af79cd13be357-947b00ea38amr289814885a.77.1794391085076; Wed, 11 Nov 2026
 01:58:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-maintainers_mglru-v1-0-c25e6de60bcc@kernel.org>
 <20261109-maintainers_mglru-v1-1-c25e6de60bcc@kernel.org> <20261109104142.c4e01c2e29ee9ead4056f354@linux-foundation.org>
 <CAMgjq7Dd6UQWfBwex4vTLdxAhHKMfpmgTG9DB3MG+4+qig0Eig@mail.gmail.com>
In-Reply-To: <CAMgjq7Dd6UQWfBwex4vTLdxAhHKMfpmgTG9DB3MG+4+qig0Eig@mail.gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Wed, 11 Nov 2026 17:57:53 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zrBB80iR+R0oi7BaLGNcw0sk_KNEFYns5G1WEsMXCQ2Q@mail.gmail.com>
X-Gm-Features: AclHuK-Ghv2CWsuvoFAiqxBS_I6Udh_YXnqVh2xFzO-4R4-Vf_0ARb-xDyX3CmE
Message-ID: <CAGsJ_4zrBB80iR+R0oi7BaLGNcw0sk_KNEFYns5G1WEsMXCQ2Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] MAINTAINERS: MEMORY MANAGEMENT - MGLRU (MULTI-GEN
 LRU) update
To: Kairui Song <ryncsn@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Lance Yang <lance.yang@linux.dev>, Ridong Chen <ridong.chen@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 2:16=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> On Tue, Nov 10, 2026 at 2:55=E2=80=AFAM Andrew Morton <akpm@linux-foundat=
ion.org> wrote:
> >
> > On Mon, 09 Nov 2026 19:31:53 +0100 "David Hildenbrand (Arm)" <david@ker=
nel.org> wrote:
> >
> > > MGLRU is currently the only MM component without a dedicated componen=
t
> > > maintainer. Fortunately, Kairui and Barry have been actively
> > > contributing to MGLRU and have volunteered to take on more responsibi=
lity
> > > by officially taking care of it.
> > >
> > > Given that Kairui is already an established MM component maintainer i=
n
> > > a related MM component (SWAP), add him as an MGLRU maintainer right a=
way.
> > >
> > > For Barry, the idea is to transition him towards a component maintain=
er
> > > role over the coming months, starting by moving him to the top of the
> > > reviewer list.
> > >
> >
> > Yay, thanks guys.  It's been wonderful to see the rebirth of MGLRU over
> > the past ~year.
> >
> > When do we get to remove the legacy LRU???
>
> That's on my radar :), though it will take some time and it's always
> hard to give an exact timeline...
>
> Items I'm aware of to sort out besides the FG series, maybe we can try
> to make MGLRU the default at some point during this process:
> - Refault distance, otherwise we still have a major regression in
> heavily overcommitted cases, also protects cross-memcg workingset
> thrashing. I also have an idea to remove memcg id and node id field
> from the shadow so it will have enough space to hold both the gen
> number and distance, will post that in a few weeks hopefully.
> - Memcg LRU vs. iterator (Ridong once tried to unify that, and it's
> good to see there have been optimizations for memcg LRU itself
> recently from Max).
>   I also noticed recently that the Memcg's LRU reclaim balance is
> somehow a bit broken, I'm not exactly sure why, nor a very major
> problem, I will look into it later.
> - Isolation protection (from Hui, not a very high priority, but still
> on the list, we don't want premature OOM).
> - IO cost & swappiness (Barry and I are still looking into this, with
> an series posted).
> - Page flags usage issue (FG cuts it down by 1, though it's still tight).
>
> We also have aging optimizations and async aging planned. I'm not sure
> if we are missing anything else, but we are getting close and with a
> sane todo list.

Thanks very much, Kairui. Besides the items above, I am also
thinking about a few more:

- Cross-memcg aging / look-around folio promotion (folios with
large mapcounts across multiple memcgs still easily fall back to
rmap walks today)
- mmap_lock contention during aging (perhaps switching to VMA
locks, as mmap_lock contention can cause jank in Android
foreground UI)
- Baoquan's PUD filter
- Making MGLRU more friendly to Android foreground/background
workloads

Thanks,
Barry
