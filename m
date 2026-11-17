Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794890632;
	b=ftLhJUJGxeK/l0k9UZAXjckyINopQ+kGUmc5/oReOeeulbjSfIng03M4x5uCQfrNtnRR
	 AfSYcy1hhCgCWGePEyZ9yLE/LlWYyct0nyRVSahCTc6iEd95wY8OUKrGaYPmxu91VGyuZ
	 sntAaoWk47/pUa4cZ3cpa3eXwh/eUrMEUovgKebSiffkZuW17zeQGRGRmR1bZ0D5PHkoI
	 MJESmrXlxHqWr7Y3SAf8ABjTfVXreHhP73W3/rLFvmDW2EaLlXouirPMSZm1JATZe/+th
	 D2jwAQDDC1qnZD1zGL4MLD+eoeYOmIZ1iGnlrLmBHeyUCGy8Y++LyphTWEDGr/tZdPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794890632;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Aq/4bQWK6agJBagPkXF8CgZGH0YPmPBsGkYRYivAkc8=;
	b=aloYLWro/JEXu9FH4cv++ZubBfNFilFr7EhKHQgI7T81Bx2zYZqNg3Wn1KlG9qM1BjE4
	 uQ7t5HHPjEY0DAboIlLBA94zF2nCxfNhKrHrknE7f3Vt4OpPnxMwBYkRotXBs+C+W4prE
	 Ipvzfb0NfTHzgl7qooLW/2DXTEopfhFbUPQuyj7thGKiU6/4bmEUywLT1i43zxkuHbr8Y
	 PFnzfPwgo5S26zshlLcgqc4/MF2pvbAzF4GysQhK16tUdOBQAhdUp/IMEtNwZvo8YyFu1
	 7vS8lEwb2Rqmv0rq7nvU8KLxfwqpAleZbCn3bM5z3h6YnlnHUY7Yu0UswtiBwlO2i3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cgneAeOE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEE3606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cgneAeOE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 786EB1F000C7
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794890632;
	bh=Aq/4bQWK6agJBagPkXF8CgZGH0YPmPBsGkYRYivAkc8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cgneAeOEwTgh4tPllkMNymY1UAI0lM9AFpi95plKa/ue4yIBg6G69n7KzyHwf+sQb
	 f9vwV4WQoehgE8IL+KpJqH7w/saD1mzuDDVDSuCgrVD0O4DOsd5oxf9i0AO3PR7orl
	 sPTroggbYonyrZdq7Jan/i9LyN3jP4JVO2W9JgP+yYJSAqa/g9xJl0PqKDfXmZMGWV
	 iPiNpHEvhlY5i0xPNOmNPQRa3TQo5veEYT3yfAam5a0COaeKe3N2ZnnvmVcbEDmA1Y
	 ZO9vB6YenC4BufHxPIUFsGOawIsvJ1THGFD4FJCRkQJa81UWRP0n5XRNL/cdbpeZpA
	 T2IvMxN+smeyA==
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-9496473b511so70185685a.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:43:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHq+L8nur3DsZq054oKfK4I+flASsGH6ymcCMjw/TGV2jIjzaWBgv1ktspXI+28kkIQphmXGsBBICDp8y8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fuhXGL+BM/kSjiNTtooGvaRoyWihw8EB2f81hmiXOXZ5Bzx4g
	oa+gydNaufE/V/eO8yXonukpzFiP4P343jFwg43MZOi7lG+M17setVaF3oIE5TdM60pq38U9Gpz
	RWb/ahyp/j3kkITmNzjPlc8NCdtWB+h0=
X-Received: by 2002:a05:620a:2915:b0:949:70c5:c0ce with SMTP id
 af79cd13be357-9498b8ec2dcmr265533485a.19.1794890631760; Mon, 16 Nov 2026
 20:43:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179488434239.3564555.16227252580122398690@icloud.com>
In-Reply-To: <179488434239.3564555.16227252580122398690@icloud.com>
From: Barry Song <baohua@kernel.org>
Date: Tue, 17 Nov 2026 12:43:39 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wzsCm_BBh3B5s5K=c07bRk72kacU5vbzCbn_U-AvSWEg@mail.gmail.com>
X-Gm-Features: AclHuK_rtoz70VnA_M4UGikPk3EP06ruH5kDNTs15rnzs6z6G8d8BBzyRtDcXG8
Message-ID: <CAGsJ_4wzsCm_BBh3B5s5K=c07bRk72kacU5vbzCbn_U-AvSWEg@mail.gmail.com>
Subject: Re: [PATCH] mm/vmscan: respect can_reclaim_anon_pages() in MGLRU get_swappiness()
To: Muhammad Haris Awan <m.harisawan@icloud.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kairui Song <kasong@tencent.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 10:59=E2=80=AFAM Muhammad Haris Awan
<m.harisawan@icloud.com> wrote:
>
> Under GFP_NOIO reclaim, reclaimers cannot add anonymous folios to the
> swapcache and can only reclaim anon folios that are already in the
> swapcache (or demotable). Traditional LRU avoids scanning anon when
> swapcache < (anon_pages >> 6) via reclaimable_anon_is_low(), but MGLRU
> explicitly skipped this check because get_swappiness() did not consult
> can_reclaim_anon_pages().
>
> Call can_reclaim_anon_pages() from get_swappiness() and remove the
> lru_gen_enabled() bypass from reclaimable_anon_is_low(). When anon
> pages are not reclaimable (e.g., GFP_NOIO with low swapcache and no
> demotion target), get_swappiness() now returns 0, restricting MGLRU
> eviction, aging, and fallback isolation to LRU_GEN_FILE only.
>
> Signed-off-by: Muhammad Haris Awan <m.harisawan@icloud.com>
> ---
>  mm/vmscan.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 6a1af9b92..f5fa67985 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -379,13 +379,6 @@ static inline bool reclaimable_anon_is_low(struct me=
m_cgroup *memcg,
>         if (!sc || (sc->gfp_mask & __GFP_IO))
>                 return false;
>
> -       /*
> -        * FIXME: MGLRU doesn't fully respect can_reclaim_anon_pages() fo=
r the
> -        * scanning type, so only apply this to the traditional LRU for n=
ow.
> -        */
> -       if (lru_gen_enabled())
> -               return false;
> -
>         if (memcg) {
>                 struct lruvec *lruvec =3D mem_cgroup_lruvec(memcg, pgdat)=
;
>
> @@ -2893,6 +2886,9 @@ static int get_swappiness(struct lruvec *lruvec, st=
ruct scan_control *sc)
>         if (!sc->may_swap)
>                 return 0;
>
> +       if (!can_reclaim_anon_pages(memcg, pgdat->node_id, sc))
> +               return 0;
> +

Thanks, but we've already discussed this in [1][2].

This approach is incorrect, as it leads to hot/cold inversion.

Xiang's approach [1][2] avoids this issue, but the code is somewhat
confusing, as it effectively uses two swappiness values: one for
eviction and the other for aging.

We've been working on a clearer solution in patchset [3].

[1] https://lore.kernel.org/linux-mm/20261010141057.599595-1-liuxiang.277@b=
ytedance.com/
[2] https://lore.kernel.org/linux-mm/179248830836.1744016.84242178112866169=
19.noio-mglru-rfc-v2@bytedance.com/
[3] https://lore.kernel.org/linux-mm/20261114200803.23129-17-baohua@kernel.=
org/

Thanks,
Barry
