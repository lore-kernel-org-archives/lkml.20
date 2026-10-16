Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA922F0C48
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137296; cv=pass; b=N7hTL143feGFGsqrwWGC+RZI+iL+cXj4MBp2vTBX2+HJMXy3mo5H/P2fPsMxrG43O+3jpBVULKWQ00qVMWy7Nt56OoLHyHd+3z+tZIoBTKfzr1OK+Kj5ZCsSnwvlsYh/K/rQ/mLdMDNVqO7FPQFGU53ZZP6uUEXpcyKCTKZ29/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137296; c=relaxed/simple;
	bh=Asd1LyXfmZ/wMvQJmtWaI8YOR4sVcoYcjj3fIBEE5QQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X+OgG/ze5pj1iQFrp4klz8gb96Dy3Ma2Iv0BO0BUKi3Nyd6xWNitCWdMpzWsV4Ma6lZ/7+/s02lzLV3aSd45kfRoEL5uIZBP7t52JWPAe/KESiwSGUMZyD/ZY1GOm0m8bmYTSJgyzQdqCAzpYSnkJfHJWtPSpiLfPEEXPZ82vuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RyCQhiob; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RyCQhiob"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so8198055a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 00:54:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792137293; cv=none;
        d=google.com; s=arc-20260327;
        b=TfG94Cp2/jzQTwNjEyHOoD/atEIwBJoIkfoX9pazOMGnFmSGsE7qxL5iyARKStrfFv
         w7b+AxSpfz4xu0m0iqjyyTjcCiLqfmlgA13BXwmrWr0Ye+9rzuTbQ2Mr52O1h69+4VE+
         BfYQd44xCyJ7XfF5MFujCHtHmWVSfrsaEYmIOZuaAGmQ8qklcgj82lSiUWs5BjRYFnB2
         tEX0LJ+Y47k7Kn9V05NGdBg5TN0Y89a4kkvi6Hfnug2oL6/5b1RQMbJjK0Kjg+of8anR
         spuCmD3X91q6I9C05zLCibFKX9UAzJ0SigZoKe5Rqqktam263UtqlDHy+EbOi0SrnQjh
         0QxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sTydiIf1dz0lwLgVUeftG7/xPlIHpWwfPGV7qf09584=;
        fh=OHy2MmvNQuEhR2dfQZgYZuRzpeQttkwHtgUIIV+F/7M=;
        b=fjS+6+53TnHA38sYyMP/WuwcViKn2c2Qzk2XlEcIKHE/CsGt03zo/jhKMa4HBfHp+G
         SpWoSOF6EBl1hPaJ7cIdguoapWAWo8LQ9QZoMZwjeM4rvzdippW9qLRBiFWFI4/NcWoZ
         pV0/8wBxiGYmBdtzMs3aBNba4vewdzOmGVWpiVGdpu8ltWqOBhMmDvvP5SRFl8mKH7JN
         SatMuqqotcZ6eEVenm13WsO1s+4kArKxXV/TtkxtvtevsDcPcVb2/QfOwSc9WA9Cj8Qm
         Ar73bOZJ9uCmEZis6PC1M9xr99CKC+HHFB2nfoi72Uprn0idVqKOImhWgin5EvXceQjN
         sMkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792137293; x=1792742093; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sTydiIf1dz0lwLgVUeftG7/xPlIHpWwfPGV7qf09584=;
        b=RyCQhiobmg7+oR8HaTH9P/HSiR5vcRktzRPc8cfuIHUBBiY4vLw4l4aTriMy4Wwhss
         1Z7yIrGVLg6USy23x/7sGnm83/pXvIkYASwGRFlHRtLzSqTPDXrUEBg8KPiVl1FJj2AW
         NUNHMbD7BjjcMwsrs9JR92IBXlAPskLP6sCs/c06x3yEcQromRcNgHTcAxpB0gaMvfr0
         ZzmWwWaF8OamMyHXV4Nno1lKLmGo41cuziFIOrFik7UUBWmdE9WPoJbwjE8/Pr089XFK
         5v5WKjbbILpoeCkoBUAj7ZPzYBtOvUspVWe0JPW41Dh5UwuVXhDV0UqlGV2SWmlpy9fF
         m/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792137293; x=1792742093;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sTydiIf1dz0lwLgVUeftG7/xPlIHpWwfPGV7qf09584=;
        b=Tlzz+pz5mrKM1VU3ZrPqFT5pEq0C38fQBj5yKoTEYDtK8lmqKotf1JGi5ucK16IJCq
         fYx+dj+x2eaZKInypE7FgkG2k1YW3YR7y5ogAKRy/TrkQU+SZl70YAnirefxajrwnnvr
         X9zkqnUl44nH1nTVfHFIyqjHnh31ED9yONdxv2+el/gu2R7sWcxSxlapJnOGNdwI6Djy
         qGmdjv1aWzrgr/d3x26gGxLredgdRNFjJz8Lvm5Rg3jJqDJLSWOcVmFBR2yysN84Baav
         Db6iXdrJcB0SRFNQ3BRe/mlxNT/i9yYACiGt9ItfnVwk5ESBq3JhjWy+k1RreIpK41It
         Fz8g==
X-Forwarded-Encrypted: i=1; AKwUvByvLSvRj5K0dtM8UNYu3GtA/E3f2n+J56k+SyanC5Gs/0NpPcrl0wZp3TQ6zHbiFW0k2MEqkXUzqDCQDC0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcYwqtw7bgkwU0K7uQRzDpf+eXfVcu6MxTW0NvgaMjuI1ykb0j
	M/+t4e6TCrmVSQDrW6v7XGQOIZqEBL7vldWOGbPhPN9bTnl/664Y/yAiswYTZqJvMRFfFU+0ZHW
	tcyI574J/0e5FgiWqBoBgcUo1jDPWARg=
X-Gm-Gg: AYBFou3lH+USRvYR1GG4cyAAq9c0a0kzbbZz5p3qfCsJQdfNe+ntMBWdzaX92S1Ztsz
	R/K0QuYKcOYcqiNpwEg6sMmnCF48OubIIquCKwZRuP1KNX3l6wBI8UcIMftKdrzSGyhGLsMLWra
	wq+Zn6bf90uml2zuii5TCiSQ0UNXqzyVBmMcOlg1lVmLtIR1nJThih8XizYC1QQecg+x1/ZdaD7
	01vaaMDy1D/IoLro7k7DApnNqBJtKA4O9ex6xuCexjIzbc8J8XK4Nemzt9sN0mGJFoD4+6tPABe
	G+LffSCkL3ZIa0ZhIX7W+xAP1ql9g2YSIB6Y4wnwdZvb0MvfYw2ESWarzZgjznQ2YRTrSzSilVD
	GhwLDyN/yDBjLBo65QCCZK6dBxpOCTATXtHkXKIEckjG+flEVt6nKBc+PC7OHSt/3gPInXA==
X-Received: by 2002:a17:907:7213:b0:c31:6bd8:b13e with SMTP id
 a640c23a62f3a-c31a9fd33d1mr1854131766b.11.1792137292409; Fri, 16 Oct 2026
 00:54:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016-mglru-fg-v4-0-2106750c0bfa@tencent.com>
 <20261016-mglru-fg-v4-3-2106750c0bfa@tencent.com> <342E57E7-9B7F-4193-805E-D1EBB41299FF@linux.dev>
In-Reply-To: <342E57E7-9B7F-4193-805E-D1EBB41299FF@linux.dev>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 16 Oct 2026 15:54:16 +0800
X-Gm-Features: AclHuK8lfaJLkt55oh9aygbGuPc6XqqQ5L-gpY7DcUfl3-ol56sFY5yxSCzcN1I
Message-ID: <CAMgjq7D-2HyvuD5U58ohv4YuyuCEbxYAO_wxkx==WxhsNQrXXw@mail.gmail.com>
Subject: Re: [PATCH v4 03/17] mm/memcg: add folio-based lruvec live helper
To: Muchun Song <muchun.song@linux.dev>
Cc: linux-mm@kvack.org, "Liam R. Howlett" <liam@infradead.org>, SJ Park <sj@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Qi Zheng <qi.zheng@linux.dev>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Barry Song <baohua@kernel.org>, 
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

On Fri, Oct 16, 2026 at 3:39=E2=80=AFPM Muchun Song <muchun.song@linux.dev>=
 wrote:
>
> > On Oct 16, 2026, at 02:15, Kairui Song via B4 Relay <devnull+kasong.ten=
cent.com@kernel.org> wrote:
> >
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
> > include/linux/memcontrol.h | 39 +++++++++++++++++++++++++++++++++++++++
> > 1 file changed, 39 insertions(+)
> >
> > diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> > index 74110a324f9e..829ab776ab44 100644
> > --- a/include/linux/memcontrol.h
> > +++ b/include/linux/memcontrol.h
> > @@ -1535,6 +1535,45 @@ static inline void lruvec_lock_irq(struct lruvec=
 *lruvec)
> > spin_lock_irq(&lruvec->lru_lock);
> > }
> >
> > +/**
> > + * folio_lruvec_live_get - get a live lruvec for a folio under RCU
> > + * @folio: the folio
> > + *
> > + * Computes @folio's lruvec and walks up to the nearest live ancestor
> > + * if the folio's memcg is dying.  Paired with folio_lruvec_live_put()=
.
> > + * The result may be stale: RCU keeps it alive but does not pin @folio
> > + * to it.  That is fine as the counters are fixed up on reparenting.
> > + *
> > + * Return: the live lruvec, with rcu_read_lock held.
> > + */
> > +static inline struct lruvec *folio_lruvec_live_get(struct folio *folio=
)
> > +{
> > +#ifdef CONFIG_MEMCG
> > +     struct lruvec *lruvec;
> > +     struct pglist_data *pgdat;
> > +     struct mem_cgroup *memcg;
> > +
> > +     rcu_read_lock();
> > +     lruvec =3D folio_lruvec(folio);
> > +     pgdat =3D lruvec_pgdat(lruvec);
> > +     memcg =3D lruvec_memcg(lruvec);
> > +     while (unlikely(memcg && css_is_dying(&memcg->css))) {
> > +             memcg =3D parent_mem_cgroup(memcg);
> > +             lruvec =3D mem_cgroup_lruvec(memcg, pgdat);
> > +     }
> > +     return lruvec;
>
> Hi Kairui,
>

Hi Muchun, thanks for the review.

> Actually, we don't have any means to guarantee that the memcg
> to which the returned lruvec belongs will not become dying
> after the return, right?

Yeah but Qi once mentioned that RCU prevents reparenting, right? Even
if the memcg is dead after return, things happended to it
(non-hieratical counter reparenting, ones in __lru_gen_reparent_memcg)
will only occurs after RCU unlock so we can apply counter update to it
without grabbing an ref, just hold the RCU.

> > +#else
> > +     return folio_lruvec(folio);
>
> Then, I'm wondering why folio_lruvec() doesn't apply to the
> memcg scenario.
>
> Internally, folio_lruvec() obtains the memcg through
> obj_cgroup_memcg(). So when the memcg becomes dying, it should
> be reparented to the parent memcg within a short time.

I wasn't sure if grabbing RCU can ensure an already dead cgroup has
not been reparented yet. If we apply the counter update to a already
reparented lruvec, then the counter is leaked. This new helper is just
a folio version of lruvec_live_lock_irq.

I got the idea from commit de4660898b7a, which says:

"""
.... check CSS_DYING under RCU before
flushing the pending batch.  A non-dying memcg keeps the original lruvec
stable against RCU-delayed offlining; a dying memcg redirects the deltas
to the first non-dying ancestor.
"""

Applying counter update to a dead but not reparented lruvec is fine though.
