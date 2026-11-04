Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793769478;
	b=fPYU2mwelaBMP9gdZQ2AAeWIPihJOMNBZDSUfc/D56nkH+7dOllSIn+0QnkCoLjdJV5t
	 hwDwnUMsy3xGLxUO4kgRSsK8hKrBOPxePpXOEF7PCxkWZLTpCJ8gU4XXxf/PymvXJMLOt
	 Vh2kF5vHCBxR0Lw2dJQhyhuXHrMvDxgSOw+ankLLkuoA+KgtzI5mC6yFxywQr6k4MatUf
	 gMDGP5sCRZ/+/h9HTOupvx5iFX/Wj6sYoTmC/CRT5cbcibmCIGGE6/uR1lR4+Y+vxfXXX
	 ShDTYJCr+zgs9U/ACXLZe6KhIew0CvXWbiZV+h8ZOdXra6HyAZwpQ3JXiCvColJqscA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793769478;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=p6KEeyjyNXQU3ayuJEeECWcZazCVcQKxSt/xZY18j9s=;
	b=YJk+55u85qJmLxDJjL3naNYTzWeXSpsXmZWOAPD+e1O5UjCZ1F+fK9hCKmp2jm4NUI0N
	 08H3qQrnG8V9zLpzzHCr3ng1M/rM33i1fPh06aYC/xWn5EwFAk4J5ydXe4gIhCs1V9Bid
	 93kP0D10W+up1Mv4H/LbGGCDyQQw8afpKqY5ZI0Uj5CQSttGZNrSwtkkEaFyRyky1E5NF
	 BgYqZrtlUeh+uEOB76p0pJy9UOqjOuNdv1C7cznY8t1R/gKQuqOPR2y5YDDpm2YGBAnt+
	 rZsxxeTtKybsyB0kPimXCs3uhQXHBZze3qnMkL+4CL+ABVFXp6tZFqz/41Xm4hjjq6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QKL+qYSF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C505606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 05:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QKL+qYSF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03F331F00A1D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 05:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793769478;
	bh=p6KEeyjyNXQU3ayuJEeECWcZazCVcQKxSt/xZY18j9s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QKL+qYSFeQgREfTjGmrOELBlqkvuOAA2XzKTc2jvFOKYa9it0Xx0nLTcsYAxZ3fTv
	 tQmiWn+U1ZzvBrN8kKuifIP7rgSJI4RJuhBH+W9cYbtu1AVf25ydGY4Hl1rekvjHZm
	 w/2BseUjEXpVRzcZ2igQ2xqQ4rtT1InfCFnPGh32m4XmQxoFfSTv+P5Sl/EJ1RSKho
	 RDju63zPSKvASjkIMQ3eyzYXNydyUsY4rF0hvvx7aYoBNcCBSl8hvv7Ss6JVjV2LA3
	 8YAn8KmXsEMpDsy47Xli6Cjco03O2HXKMWTB4QpyBujidx1TitSygtIMYketVyDORS
	 08TlCcikFEI+Q==
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91c75267b0fso3803226d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 21:17:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwGWu7/2FXjr+64K3kdN7G2OBT/fozDnFjJ0S4ZMeehUhC8W3nNNB9OBYONSoHkT4nl5w9Z1KcmIERhL9c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/4oUui3XvehpW+9Y7U/ckcFbxBMZliTQuvDCwKDwC1EmRPKXz
	CfhpPl0lH2Ice+mheygSqys+OaaYAlf/YKMaLfxQONrXm2FbSn8ew+ntFh5kBcebjGwAkaihu8F
	vnOrgutOmL+N0sT7hpsGOp5LwAmyoDx4=
X-Received: by 2002:a05:620a:2986:b0:93f:353c:6bee with SMTP id
 af79cd13be357-9442179bdeemr2649014985a.41.1793769477189; Tue, 03 Nov 2026
 21:17:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103113711.1832834-1-max.kellermann@ionos.com> <20261103113711.1832834-5-max.kellermann@ionos.com>
In-Reply-To: <20261103113711.1832834-5-max.kellermann@ionos.com>
From: Barry Song <baohua@kernel.org>
Date: Wed, 4 Nov 2026 13:17:46 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wpd-e+xjm5KwihVziAeVnQp3XYG=+-BKmx0SVEhmyqqw@mail.gmail.com>
X-Gm-Features: AclHuK-K3YmNyTgJ3q-8NAOMY6-mXLoQSaTkbTkKltCKCY_JfrfNuVcqZ-jSFOg
Message-ID: <CAGsJ_4wpd-e+xjm5KwihVziAeVnQp3XYG=+-BKmx0SVEhmyqqw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] mm/mglru: avoid redundant rotations of young memcgs
To: Max Kellermann <max.kellermann@ionos.com>
Cc: akpm@linux-foundation.org, kasong@tencent.com, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, hannes@cmpxchg.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 7:37=E2=80=AFPM Max Kellermann <max.kellermann@ionos=
.com> wrote:
>
> Concurrent reclaimers can request promotion after another reclaimer
> has already moved a memcg into the young generation.  Requeueing it
> into a random bin again adds list mutations without advancing the
> old-generation scan.
>
> Therefore, skip `MEMCG_LRU_YOUNG` when the memcg is already in the
> default segment of the current young generation.
>
> In my micro benchmark, this increases the request rate by 36% and
> reduces the average duration of each write request by 27%.

Could you share your microbenchmark somewhere (or post it here
if it's not too lengthy), perhaps on GitHub, so others can
reproduce it? You could then refer to it in your changelog.

>
> Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
> ---
>  mm/vmscan.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 3075949bf641..899f756bd15b 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -4620,6 +4620,14 @@ static void lru_gen_rotate_memcg(struct lruvec *lr=
uvec, int op)
>         else
>                 VM_WARN_ON_ONCE(true);
>
> +       if (op =3D=3D MEMCG_LRU_YOUNG && old =3D=3D new && lruvec->lrugen=
.seg =3D=3D seg)
> +               /*
> +                * This memcg is already in the young generation and
> +                * reshuffling it again cannot help the scan of the
> +                * old generation.
> +                */
> +               goto unlock;

I think this is a correct change. I wonder if we can
reproduce the issue even without concurrent reclaimers.
In other words, can a single thread running in a
memory-limited memcg trigger it as well?

One thing I noticed is that you may not need to call
get_random_u32_below(MEMCG_NR_BINS) upfront. Could you
defer generating the random number until you actually need
to rotate the memcg? I wonder if this could further improve
your microbenchmark results.

Anyway, the compiler might be able to defer it for you.
I'm not sure, though. Could you take a look?

> +
>         WRITE_ONCE(lruvec->lrugen.seg, seg);
>         WRITE_ONCE(lruvec->lrugen.gen, new);
>
> @@ -4633,6 +4641,7 @@ static void lru_gen_rotate_memcg(struct lruvec *lru=
vec, int op)
>         if (!pgdat->memcg_lru.nr_memcgs[old] && old =3D=3D get_memcg_gen(=
pgdat->memcg_lru.seq))
>                 WRITE_ONCE(pgdat->memcg_lru.seq, pgdat->memcg_lru.seq + 1=
);
>
> +unlock:
>         spin_unlock_irqrestore(&pgdat->memcg_lru.lock, flags);
>  }

Best,
Barry
