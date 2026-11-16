Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794868265;
	b=eFt7N0lJcm5BvWya2HV4QlnHrtrCp9y9ekz+nP2Jo3gX3Oxc/hhiiGQVhuSyLtsMpkQ0
	 e+ht6wdiM8xukiSHhEIqIOxh4ApCpYCD4pU9sBzOHGW5G5o1ExncdzuJWY/cuX/wqviPl
	 x1VhsUAhhQiFbjh7X1eRmThctnIKMd6kbchhyLRepyPR2YA0nCBg9VsJdWCjNCpy79S0i
	 QSMjGP487aa/Q1Kqu0tqvws0Vhwk97dWO6hf2nGD61QX1J+Eh/+4p0igXi9d0IOuzGDlg
	 NLQYWxW4vAfLn0dCGpCQrXXc38KMJ9aEnJwIhBncoq/m8RtyB4NJHxspkm2H28L9Uvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794868265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=flBIwrkiz4CrL8ZnZbUIHi9/+ZYjmj62+yS9Tn5YAWI=;
	b=TyeDsWtO1PWYd9+iZc2T+vvIYFokRqwrZqamUvy4a1d/EvM30G63kbuywkeai3ctcQA1
	 dYbAd3lTBIi6X8H2luSebilywZXH/yA5IJojiq1afrMCPP5oTzNhlgn5elAN/d9tqqBCw
	 /gdrKmdMdtnfvOQqMULrydMIG8F+C6njl3n8yfsQsUTaFIVsNZ64QhhxJ0bozI9HNZNzK
	 wevi6l1D0eSOeHrs7gzaht7G4R3u3Wkso1Z0w3hIbjP6VqHxYjlHll1Zd0wdq7qQB8LZT
	 vYu/PAcKs296w9uUmQA9F8Qw4sk1cnsIHUscCNrjK0LfdzQ82eEn67Dx+jI66xqoH/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iXNhvm5C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F95606A896
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:31:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04F95606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iXNhvm5C
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb5b33e2ffso6065e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:31:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794868261; cv=none;
        d=google.com; s=arc-20260327;
        b=DnFZ1ftLASovvohx4yQkTEGh0bpO+bzm40wCbSf8nb6Gy/UHnUFepzVUtiSXWptAUR
         YIB3Mc6btVN8puaT4IRPThfkdDV0Qrld1R1AxzrlaF8ezky0Az2g4pSLBrJSfLJHak8J
         UCVNnHlFMMA2nVoUOFDlylqJJHq/bnKswp1A+sk2O9IIIKKTsjcpqcdVB5J1mvvsYTFC
         SGSLG5M0K8+1B9sm4CtvGxJ+bxdiXM4UH2nMicPuLVSNDywDgrtrCbz7wdPAeVYXgdYB
         gdt7Ofm4RknGMHC10kCSXHmkG9P6BYN0omG2z0x2CV+yM+tdi5iS8pIKPYo7FJ7o9HOg
         Lmcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=flBIwrkiz4CrL8ZnZbUIHi9/+ZYjmj62+yS9Tn5YAWI=;
        fh=G6Jb3aOxAsQw6j7lT6JPpqGXHZE9tsRX7xZ3tok88nc=;
        b=Dx2YGUVZJlDY4HDvxP6SjP25cCYgW99M7gPnxk3aGsoNhKPYh8qjUXDw0D6lnaEQML
         6rBIdqqIoHGXVHacMU8waRHGtc2+5tlKWtp4rG2sWnJumVcAH9pUFwatpImWAYdUwdhH
         m6WjSyn4LnMLPhX5w2D05Ut+XsPjHsHT7MR4YevC2SGEhw+fffN7fEhxDA3ZBhKL8Jc2
         boviBNJte0Laa7oaiPPzS+sAOaEMIRp2SeG2HP/72iHDT5clP3aaHwl4pw5xVr6asRex
         hUvC+yS9d3U67hnUQAcNUb4AZCrl+CKFhZ+woFJdVpWF1ZKTWCS+yeY82g66hLZ6WrYB
         E61w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794868261; x=1795473061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=flBIwrkiz4CrL8ZnZbUIHi9/+ZYjmj62+yS9Tn5YAWI=;
        b=iXNhvm5CBoV9+kqxjF33xBnxtOkXJX21/ia+FsPJWq8wIWgw2FMxvYuqhWcwvSNSJs
         gkCi7hAngX1UXxTkrzrTA3KP6pHwYkSSYQ6xak0MjxYKMS4Yy0ElpUQbSff/ZFLwSXed
         G1vzbE33KNM6p844F0eoXLlNrOq/l/ptLuCdJHw8iJFrIxHxiZJvvkG30gmdw/vVhu0h
         PFdZIRu5zk7JzDIlaJDvW/SVerrxGHrsihkEUO6HCU2HK9xBYMd7r+PBg/zoP13k8EQR
         4pkGMutu9QpaBHBMl6eDZC8G6G3ssLMLU7V+0cLZ8kS3+33rNG+QCvFRMSAVYfPnwZq1
         3SXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794868261; x=1795473061;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=flBIwrkiz4CrL8ZnZbUIHi9/+ZYjmj62+yS9Tn5YAWI=;
        b=sWP2natMuKN/oWpZE+p96KbmqBDhx93ebAhDAkntS1iyhEwwdGtgNrGQeifzHX/LpS
         bZb54+pGttsEt4dCJ97AP6rgW2sNRkAtTEL6dKv+heKoTimzoJJkZolyTxf8UNMSNuGm
         5hyDtb3PnvmcMFb/+m2km5ZhC6oxVOjmksKv1owQKc10RqPHviA5Uzq7wiXPb2FGNFps
         UEIFf4IqG0XKpAlPA1ynyEa0q+58c2L3WHax1t4qLN6u7d1G72xwms29JBWORDEHYwBp
         IkCT7X2Uc/V0C3cEC/z+cWG7nJJt3W2dqXlY1lZjyu3JQF1sjPPYA0CvKMUiMxoO7C3t
         kRhw==
X-Forwarded-Encrypted: i=1; AL+hErECseQB0pEPKVLjQEVDVVCH1V41kJIzcegIi7voMbumXAaIPLcSb9Zw4zzt3F0xxgOzNYwHwEgMvGAfWSk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ASVWIQaX/AxdqJ6mExaVDE8rvZSeb7bqvlbST8tbU15g82xOO
	CWpbYKpdIlCaoQuMDCzSpYDdWg+S2j/X7g5puF1Pie8EtuzyfLhO6bpDHcKdJXByEAlVw4KpQgk
	kNcXdcK1GQydhV8NUmS+c2BDrEubEnnCN4Id1ifO2
X-Gm-Gg: AYBFou2BLgyBReJ+Nv+mkGQKxaNLTgp64IqauemIiKcnw6WlONBczRBy+iUs3gcaZS8
	k0zmTjOm4GR3UDj04BT8abmZneFNjQrO0Ir2y6itWhoEvRPKXqNcGTZKEwoaNEFeccPswnV8uGY
	TItcS6hXTkXtbg8+ZJ2N8pgIrRsRVfk0r3aubqtT7X4UBWFp+GZGH3X1B5gKa2wxrCxoL37UPPz
	cdwtRKI3MxY5qp83c1V8c7OS5HzqPTVR2wh13ci+XRgJBvG+mRps2po5dylrMvGssPiDCO5iDot
	oYNMOmW8myWhfyZb33CMKE4q45jdP5G9ScPdFsPt6IOWjavJHSYiDQ6C+2KBHWk4FFl6XOic1Qm
	XH2dP04K3yXtS2gKm70Yznv9F2MVYtjqJuhzVkErdcOPxmPC0Wlld9vzHJ5nARRJB4oN1aTLLsR
	EvWBcAJLQTX3b6MLBvE0dnot0=
X-Received: by 2002:a05:600c:58da:b0:4b6:5035:d54a with SMTP id
 5b1f17b1804b1-4bb7899bf04mr226565e9.1.1794868260939; Mon, 16 Nov 2026
 14:31:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106235904.1092712-1-tjmercier@google.com>
 <CABdmKX1gdOH8R6qyjw6XN5VdpAZKVR8NZ=R7Y9Db-BEhUrX-1Q@mail.gmail.com> <CAGsJ_4w4rNzvaOK9f4D56opW7TtUWL_6srxJoyWXWDzhfgm4ug@mail.gmail.com>
In-Reply-To: <CAGsJ_4w4rNzvaOK9f4D56opW7TtUWL_6srxJoyWXWDzhfgm4ug@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 16 Nov 2026 14:30:48 -0800
X-Gm-Features: Aa3M54qWwlAq7r7UGFJTztgBBMUBZhaJaGwzwqSekoGuVRPRGEupivlWBRBOvBQ
Message-ID: <CABdmKX1v0Bs4U255krWQF7eh2gfuL7-zsvSTEtO3_vMs0OKgDA@mail.gmail.com>
Subject: Re: [PATCH] mm: workingset: compare shadow nodes node-wide without
 kmem accounting
To: Barry Song <baohua@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Qi Zheng <qi.zheng@linux.dev>, Dave Chinner <david@fromorbit.com>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jaewon Kim <jaewon31.kim@samsung.com>, 
	Jaeseon Sim <jason.sim@samsung.com>, Youngchan Kim <ycshark.kim@samsung.com>, 
	Dmitry Skiba <dskiba@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 12:04=E2=80=AFPM Barry Song <baohua@kernel.org> wro=
te:
>
> On Tue, Nov 17, 2026 at 1:40=E2=80=AFAM T.J. Mercier <tjmercier@google.co=
m> wrote:
> >
> > On Fri, Nov 6, 2026 at 3:59=E2=80=AFPM T.J. Mercier <tjmercier@google.c=
om> wrote:
> > >
> > > count_shadow_nodes() limits the number of xarray nodes holding shadow
> > > entries to 1/8th of the pages that could be using them. For a memcg, =
it
> > > counts the LRU and slab pages local to that memcg.
> > >
> > > With kmem accounting disabled (cgroup.memory=3Dnokmem), shadow nodes =
are
> > > not charged to any memcg and __list_lru_init() makes the shadow_nodes
> > > list_lru non-memcg-aware, so all shadow nodes of a NUMA node are on a
> > > single list. shrinker_alloc() falls back to a non-memcg-aware shadow
> > > node shrinker, which shrink_slab() only invokes for the root memcg.
> > > count_shadow_nodes() therefore compares every shadow node on the NUMA
> > > node against the pages local to the root memcg.
> > >
> > > When most tasks run in child memcgs, the root memcg only holds a smal=
l
> > > fraction of all pages, so the shadow node limit derived from the root
> > > memcg page count is far below the number of shadow nodes on the NUMA
> > > node. Since the shrinker has seeks =3D=3D 0, every root shrink_slab()=
 call
> > > trims about half of the "excess" shadow nodes. Most refault informati=
on
> > > is thrown away, so refaults of recently evicted file folios are not
> > > detected. Refaulted folios lose PG_workingset and the workingset_refa=
ult
> > > and workingset_restore stats drop.
> > >
> > > In testing on devices with kmem accounting disabled, moving tasks fro=
m
> > > the root memcg into per-application memcgs dropped workingset_nodes f=
rom
> > > ~37,000 to ~900 and raised workingset_nodereclaim 4.6x while
> > > pgsteal_file rose by ~12%.
> > >
> > > When kmem accounting is disabled, compare the shadow nodes against th=
e
> > > whole NUMA node, as is done without memcg. Behavior with kmem
> > > accounting enabled is unchanged.
> > >
> > > Cc: Jaewon Kim <jaewon31.kim@samsung.com>
> > > Tested-by: Jaeseon Sim <jason.sim@samsung.com> # Galaxy A18 LTE
> > > Tested-by: Youngchan Kim <ycshark.kim@samsung.com> # Galaxy S27
> > > Tested-by: Dmitry Skiba <dskiba@google.com> # Pixel 10
> > > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> >
> > I'm guessing there aren't many other nokmem users?
> >
>
> Out of curiosity, is `cgroup.memory=3Dnokmem` commonly used
> on Android devices? If so, what's the rationale behind it?
>
> As for the patch itself, it makes sense to me.
>
> Reviewed-by: Barry Song <baohua@kernel.org>

Thanks Barry.

It's a mix since we don't currently require kmem accounting. The main
reasons vendors use nokmem are to avoid kmem-specific overhead, and to
avoid bugs they've hit with kmem enabled. We had one report of kmem
increasing clone latency by ~25% because of kmem charging in
dup_mmap(). Another report of a NULL pointer dereference in
list_lru_add() during eviction on 6.6 also resulted in kmem accounting
being disabled on the affected device. Those issues were from over a
year ago, and I haven't seen anything else recently.
