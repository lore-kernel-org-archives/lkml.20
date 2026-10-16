Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108403921ED
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131400; cv=pass; b=Of22MJPJwjNvQrImClKuT14PvLNWP07/uxauu8GRR3Yo464c7qmJhJ7Ryq7EaxymQOmaqYhcHo/kVgeY0d0gC9BbMdyFgZF8DRhYZxjMn2bWGSqzjwW4681CxslrQJj1QkNourD+x/YkygPJXoWdBm0OSY1pEXo9oZ4o9t6UT9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131400; c=relaxed/simple;
	bh=btnoV6CU2q0UBdK7jbLnMoo6ItmP18ZDQfYmAVaSBNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O0hK4gQpPfFdgzhn07yqrigGdheHeBIvkVdiA6ij42Kv/OgUsYGnRKnp3Itxgk/mP/HewiZxUNm41V7BS8DnQ1SZ0MQ3VX6MHvjdCKUIb9FZOXHWmG8DlM1EJCNhwfzUeP+0QkiUWNCeMv3NXMJ9wneqlgPFHA9BwA8wMOMzQ9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HLqSw+d1; arc=pass smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HLqSw+d1"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-89f1318195fso423826b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:16:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792131398; cv=none;
        d=google.com; s=arc-20260327;
        b=SybFGOTuU30lOA7VQ20dLFk7M1j6ZSoCtCiz0vvCwZYcCn0/AdAKQ6prfzQ2rH65Sz
         n/yMvJLb3b6P9RnqaKu2YMJDiYGKNi1KFhdVpKMu/UkyzOLR8a4T0Iy1YtCIl9BY2xg3
         r+fWNY4fT0bo7PjWzXXv96W9TttvSNHjWvbPRRhPaFj8QvGOmxAER1CtW3kCj/ABb5N9
         hRGsuvLdqbdGU3FfJoYVAuZrUjODA3GbOs8hWWrtvLXKiIwEMFeQ9mxxYwZDrSgKTMIM
         4Agoa2VeFP3+hTLkHkbO4RlfYjGjaEa809De/P+GMKqoMATjc7Jpmaq7+wDSIwZOQNKk
         ak5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Nw95ViH0murspGBeVdDuR7/ikIvvt0nVUNuA1BMwLqs=;
        fh=cCMR4qnPGK4rKBKMlgWy3boefqRkjGUrg5CprSdaEME=;
        b=b7BZRyxrBNywKtB20xZtMXxQ3mJ5z69Du30uFoEQUcUOqsTwIR2pDroGvu8bcL0KX0
         PzcanUBB6AbimzctV5sHOu9aMjqR/ZesJkJ29TYsU52ASQZ2ebRkMfHiOIRBBlC04m+m
         jnGAv6bJhpZLBV2ncTxG/mU6k4jSyRZc1Gt+V1oZKgzndaeYIjIP9HBSEHlWA2ajrRDf
         7qZ49mmqzpSeb1QhIAPSPDAMM7QBrczdUQCXyUfeE6nzaVp5zcMu+7VoL94zbzrDl2Cs
         +On7xZPQvCZfXBpxgp9vZqKDwLI5ObBaVQK+suzT+t2pvG72xGV7cvq6R1ft+7vyz2tR
         HLHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131398; x=1792736198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nw95ViH0murspGBeVdDuR7/ikIvvt0nVUNuA1BMwLqs=;
        b=HLqSw+d1c5BP3YfnQSbETX3F1bFbr1NwlertT1k0xGAN68/dGLHBFi4MjPBEmblQow
         rfYKoOr7uKTjk2RBD2MZZquiaZ1GJgwf7kXUMpwIr23BECbq0yIS2vna8GnAQbbxQHRs
         FyHUARSj5NdA+u/C5BjzFAZs46EQsd8tLaESvOX8SBs3BASBp6ZzRZJDXLjY7lbQrvq2
         TWAsJw8v0tpXlGJ9Z9xpAS2wBxxEvF+AdrRsu+hWM6tFjGMf1/bh3+HbxLoK4Dj48HfO
         +Ciyg9CPpL7wSOf6901qidksaVg2UDm73By/h1QZ6im4OW73WnmF3DUR1zBFXp4MumoB
         WYPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131398; x=1792736198;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nw95ViH0murspGBeVdDuR7/ikIvvt0nVUNuA1BMwLqs=;
        b=cyiaCGxfv4V5FcFIs6npTnBrwbhFT+QCIKlm1Dtm/TTfbPQ7By+sPBTmTYj4bd2d1q
         hcJ2/Ca7y3XzW8P7VHxnAH2wafdKEsp3M4S98K32q61GrhE1DxfUgjhbXKwvtx/395ei
         sTxGVFBRAOzTc0NM4qWIpa5AGPwGBhs1B3iQV1oltO5vwsDPP9sd+cKcEUw8B3SiywoD
         H1tPFID/F/GYVXgHvLjZ3XtlVPBoV88dv3DeBG8Bhv/cJvfBId7kWcDfI67tEpEkup2L
         UTY9SHr4/KsYLmwP8WEbyE8OOKtNclK/YSNL9pKTIsr5dabHdJrbs6jCJTXpmtuiOqlx
         V4Jw==
X-Forwarded-Encrypted: i=1; AKwUvBztEb9Vsix2VFWNmiPiRxW2rLye8PuJ/cHW2U7EM3jOqcbeABO7ONzlFWp4x9vKB9dWR6OArqqIVgmYNxE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhVWQ8WQzewgPykR0eMEY2LCXczj98SV0qqhbRPyu6GZ4OJF7o
	gg1ABqOpUXWnyRHq5KOoD4DI+9XbUS7YtL3E5VcDQykJx6jtN8AY5Wtm/nNLEstcFcLR475mU7A
	eCRMLe7stkprUiw2cXZgXXPAclvQ8q2Q=
X-Gm-Gg: AYBFou2vRy+jOX92/sdp0vY+X38Iu1YXPJW/fMwhWRehjQELUJhTcB9uA7AAifSOp1b
	uYndptFAdDunuYiZHHhr09EABj+m4Fy+ioMFQidq5exlbdQKBAO4yBOPbaHkoLnGpRSEypr8b9x
	8lcfii+Ba5Mk4TMeOthoNDT/qFFGN/MN014Wzjx/uBjSgDtCiJLkQSg1G/JaxmbeSH7T/RyEqTu
	XNZkI7mgg+IWXC0zeoVspfeKmhtAws8po7l4Cm5Ix9ri8Vm9Zcz0clSOxqJBIJUHzJVPODTWEK3
	Cdg8G8i68JH2UGk06qBwDb+GJ/S4zVQEckp9l+IRfoNUyHNuBZoaxMQi4EHtcUA6Xm+xdO2maKJ
	JsJCTNnxUzEROCpSBbt2yrYwVUzgcRi/yCNDP2S270BnEC5KHrBJlKjsN3e0RAsWkRebZHA==
X-Received: by 2002:a05:6a00:3d11:b0:88f:9fd9:3779 with SMTP id
 d2e1a72fcca58-897c65410bemr19217680b3a.19.1792131398279; Thu, 15 Oct 2026
 23:16:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016-mglru-fg-v4-0-2106750c0bfa@tencent.com>
 <20261016-mglru-fg-v4-3-2106750c0bfa@tencent.com> <atEkfmRFgXJCbJuK@thinkstation>
In-Reply-To: <atEkfmRFgXJCbJuK@thinkstation>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 16 Oct 2026 14:15:59 +0800
X-Gm-Features: AclHuK9suf2MtgpJ8U-2R0dSol8SG-UyxjWNOAi7XM84G6vCwX9BAPJIIlEtxbI
Message-ID: <CAMgjq7A6Yom=dHDMXk+mpYm3dotgOaVRjPHgUsOryjJ1VjPC6Q@mail.gmail.com>
Subject: Re: [PATCH v4 03/17] mm/memcg: add folio-based lruvec live helper
To: Harry Yoo <harry@kernel.org>
Cc: linux-mm@kvack.org, "Liam R. Howlett" <liam@infradead.org>, SJ Park <sj@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Muchun Song <muchun.song@linux.dev>, Qi Zheng <qi.zheng@linux.dev>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Chris Li <chrisl@kernel.org>, 
	Baoquan He <baoquan.he@linux.dev>, Nico Pache <nico.pache@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, 
	Gregory Price <gourry@gourry.net>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>, 
	David Rientjes <rientjes@google.com>, Yu Zhao <yuzhao@google.com>, 
	Vernon Yang <vernon2gm@gmail.com>, Zicheng Wang <wangzicheng@honor.com>, 
	Chen Ridong <chenridong@xiaomi.com>, Tal Zussman <tz2294@columbia.edu>, 
	Xiang Liu <liuxiang.277@bytedance.com>, Ehab Ababneh <ehab.ababneh@intel.com>, 
	zhaozhengzhuo <zhaozhengzhuo@uniontech.com>, Lian Wang <lianux.mm@gmail.com>, 
	Kunwu Chan <kunwu.chan@gmail.com>, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, damon@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 3:11=E2=80=AFAM Harry Yoo <harry@kernel.org> wrote:
>
> On Fri, Oct 16, 2026 at 02:15:52AM +0800, Kairui Song via B4 Relay wrote:
> > From: Kairui Song <kasong@tencent.com>
> >
> > Add a helper that resolves a stable lruvec for a folio under RCU
> > without taking the lruvec lock.  It takes a folio directly so the
> > lruvec lookup happens inside the RCU read-side critical section,
> > which a lruvec-based interface cannot guarantee.
> >
> > No functional change.
> >
> > Tested-by: zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > ---
>
> This new helper is doing the the same thing as what
> get_non_dying_memcg_start/end() do.
>

Hi Harry, thanks for letting me know, I wasn't aware this helper
exists, this series started before the re-planting work, so I missed
it.

But it's a bit different though, get_non_dying_memcg_start assumes the
caller holds a reference to memcg, while folio_lruvec_live_get only
assumes the caller holds an reference to the folio.

I'll check if I can deduplicate it though.
