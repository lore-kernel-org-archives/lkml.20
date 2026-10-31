Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793481701;
	b=Mgiu2XokU4Tt7G3C0Z7m1XBPvJGznTPeYOmR+IqzfyzMVu+kF4t9rexSw6JJ3RFMthMw
	 irXIVuotOOnRsBH1NAH8QhZfOj3iWLoIxysyf9o/6WXNEbL2seOyAZy7REfnZtPkfw5io
	 QXBxaUn0fVLCCZWpUIWtw8jKRFWptq3ivNI8uzArJYs77Codcu00RWuaMmSYcb0dUHiXM
	 66f4728ykwe9xC4adEONRTefbMgiHDL1whTPtgrJSx4CiqqG+DHbRwzh38JtdSm6anuJS
	 KrmXkHqw8tmBPFENJCevRR7KCEuYh3drjDYcuzW+PqFIZznXxzyPazZJwiTs3kaPEJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793481701;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ty94gSbhmDD5BIMgrsH4AK83dBi7LvnXvW0bmqOEn6Q=;
	b=RXJBK7mWgPRFcaBlAElItsNUUDp0P7MBwZDJORQcMQlnav4ozZ2UDkhG6Zwx2cDecO4r
	 k7OT74JRIAL8tVD+FbQhCy9TiqkLh1xSkiAK7TLehVzhbNFY2OuugdIn+FFC+BLn0RWsE
	 8iXRF+cBptLexLgPdU+rsEQY9/o39fqRRAFzRzhYO9e2sLMWL0AQUttnCXhg6uIc+ND4O
	 xEOq0fyz5YCkD8WMWaXmb6TtVsXlYvUo2SBqSAbonuVta7a48SL+QhRE1+LMTW39e2+z+
	 YmCmS1byyQM38TeNPaNGKyFoLWHivErQkaYOtF26dD92vJVxvAldscuMQ9DHwlEVWqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nv0K1geW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA30606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nv0K1geW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4F791F00A22
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793481699;
	bh=ty94gSbhmDD5BIMgrsH4AK83dBi7LvnXvW0bmqOEn6Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Nv0K1geWEW21EP+164tZ9ZkJwnFe5As405lOGWO05ZYOg7Lx1i0lmjU6Jao8qCyQN
	 6kkf86pcNxo+ywvYPj/rGZsWRf2MvqsJhX0nC5iDudHzpU5LqtDe5A1F3HPiGUNfuA
	 JaYI205jkw6gNuzTRwyhonMiz41vd3QmhBZRPfMkgoPHlFN6SKGKDPF9Y28Se0elkA
	 8bFMZB5SOE/Ny2FWsDfPWdDLl5BjKKJilm6NBMqz966pnvFjTio5w0uqC2dtoMPEWT
	 ott9wyW7S7gZPTyupY7DCxiVQVwg6XHctY5+AOUqjVKUb+QGQwCNA7hxm5IKr/ulxd
	 zjgRTUm2h8X+w==
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5365b48238dso17116351cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:21:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByJS1Ohp8T4dpUjeFMS+5Yl1Qpi22dLjqce7L/AEDQP1mv6hZsp/gzLl5azFa/SqfA36XKtXBs19quFOGg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfU9kqqk6+BiMwip9ndFNxsXttJVE6ZNl74iBmLuOucx9KN7oK
	yUfqKd+A2IyaFxcZnrdaozs1nCYWH3OtLntmEKefU18nGB58a5KczagKtnDfDM13sfN1fJ06C5z
	Z54tgmaAv+1CJECS1U4pViS4LHe1Qtr4=
X-Received: by 2002:a05:620a:1a04:b0:93e:7939:acd0 with SMTP id
 af79cd13be357-944216bd289mr1066244785a.37.1793481699158; Sat, 31 Oct 2026
 14:21:39 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031090041.58574-1-ridong.chen@linux.dev> <20261031090041.58574-7-ridong.chen@linux.dev>
In-Reply-To: <20261031090041.58574-7-ridong.chen@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Sun, 1 Nov 2026 05:21:27 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zUbkFXBhAesVV74-Ndga5f6xEbestK7Qinqddip8xBrw@mail.gmail.com>
X-Gm-Features: AclHuK9WNH9aLICSgSeVZV5too_5MSDmgtyvPVk6Q01fvL_ZF8MPvPlJAdKgm4w
Message-ID: <CAGsJ_4zUbkFXBhAesVV74-Ndga5f6xEbestK7Qinqddip8xBrw@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] mm/mglru: add tracepoint for inc_max_seq()
To: Ridong Chen <ridong.chen@linux.dev>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Dave Chinner <david@fromorbit.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Muchun Song <muchun.song@linux.dev>, 
	Qi Zheng <qi.zheng@linux.dev>, Kairui Song <kasong@tencent.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, 
	"open list:BPF [MISC]:Keyword:(?:b|_)bpf(?:b|_)" <bpf@vger.kernel.org>, Ridong Chen <chenridong@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 5:02=E2=80=AFPM Ridong Chen <ridong.chen@linux.dev>=
 wrote:
>
> From: Ridong Chen <chenridong@xiaomi.com>
>
> Aging in MGLRU advances max_seq via inc_max_seq(), creating a new
> youngest generation. There is currently no tracepoint on this path, so
> the moment a new generation is created, and how the min_seq of each type
> trails behind it, cannot be observed as it happens.
>
> Add mm_mglru_inc_max_seq, emitted right after max_seq is bumped while
> the lruvec lock is still held, with the node id, memcg id, the new
> max_seq, the anon and file min_seq, and the number of pages in each
> generation for both types, summed over zones and clamped to >=3D 0 the
> same way the debugfs lru_gen file reports them. The nr_anon/nr_file
> arrays are indexed by generation slot, so the emitted max_seq/min_seq
> say which slot holds which seq. They are printed with __print_array(),
> so the output is hex and its length follows MAX_NR_GENS automatically.
>
> Only the lruvec is passed in; all of the above is collected in
> TP_fast_assign(), so inc_max_seq() does no extra work when the event is
> disabled. Paired with mm_mglru_scan_folios it makes the full
> aging-to-eviction window observable per memcg.
>
> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> ---
>  mm/trace_vmscan.h | 47 +++++++++++++++++++++++++++++++++++++++++++++++
>  mm/vmscan.c       |  2 ++
>  2 files changed, 49 insertions(+)
>
> diff --git a/mm/trace_vmscan.h b/mm/trace_vmscan.h
> index 8148b8224422..cddf42b5849a 100644
> --- a/mm/trace_vmscan.h
> +++ b/mm/trace_vmscan.h
> @@ -456,6 +456,53 @@ TRACE_EVENT(mm_mglru_scan_folios,
>                 __entry->min_seq)
>  );
>
> +TRACE_EVENT(mm_mglru_inc_max_seq,
> +
> +       TP_PROTO(struct lruvec *lruvec),
> +
> +       TP_ARGS(lruvec),
> +
> +       TP_STRUCT__entry(
> +               __field(u64, memcg_id)
> +               __field(unsigned long, max_seq)
> +               __field(unsigned long, anon_min_seq)
> +               __field(unsigned long, file_min_seq)
> +               __array(unsigned long, nr_anon, MAX_NR_GENS)
> +               __array(unsigned long, nr_file, MAX_NR_GENS)
> +               __field(int, nid)
> +       ),
> +
> +       TP_fast_assign(
> +               struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
> +               int gen, zone;
> +
> +               __entry->memcg_id =3D mem_cgroup_id(lruvec_memcg(lruvec))=
;
> +               __entry->max_seq =3D lrugen->max_seq;
> +               __entry->anon_min_seq =3D lrugen->min_seq[LRU_GEN_ANON];
> +               __entry->file_min_seq =3D lrugen->min_seq[LRU_GEN_FILE];
> +               /* summed over zones and clamped to >=3D 0, as debugfs lr=
u_gen does */
> +               for (gen =3D 0; gen < MAX_NR_GENS; gen++) {
> +                       __entry->nr_anon[gen] =3D 0;
> +                       __entry->nr_file[gen] =3D 0;
> +                       for (zone =3D 0; zone < MAX_NR_ZONES; zone++) {
> +                               __entry->nr_anon[gen] +=3D
> +                                       max(lrugen->nr_pages[gen][LRU_GEN=
_ANON][zone], 0L);
> +                               __entry->nr_file[gen] +=3D
> +                                       max(lrugen->nr_pages[gen][LRU_GEN=
_FILE][zone], 0L);
> +                       }
> +               }

I feel this is wrong. Can we calculate the newest and
oldest generations from seq, then print them in order
from newest to oldest?

The nr_pages[] array isn't ordered from newest to
oldest or vice versa, as we have:

static inline int lru_gen_from_seq(unsigned long seq)
{
        return seq % MAX_NR_GENS;
}

And I added a helper here:
https://lore.kernel.org/linux-mm/20261022220203.91911-11-baohua@kernel.org/

+static inline unsigned long lruvec_gen_size(struct lru_gen_folio *lrugen,
+ int type, unsigned long seq)
+{
+     int gen =3D lru_gen_from_seq(seq);
+     unsigned long size =3D 0;
+
+     for (int zone =3D 0; zone < MAX_NR_ZONES; zone++)
+          size +=3D max(READ_ONCE(lrugen->nr_pages[gen][type][zone]), 0L);
+     return size;
+}

Maybe you could port it here as a separate patch so it
can land earlier as part of your tracepoints series. We
could then use it in the next version of the swappiness
series.

Best,
Barry
