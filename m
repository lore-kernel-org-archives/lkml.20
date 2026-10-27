Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793093967;
	b=PinDmjkpM5TUYFCwJ2rqfCfVaPrOyd9dPU2hHCSg5m69mPq/EZQkfeGRrcYcn8x2VK/W
	 /pOQPd6JhzczBkmB2Qcobx62A6UmAWAybpxSPKSk1czpl/at6M/fvwwd9wIyqd0enZUt3
	 ZpThwBsowtQtwWYq/2gP9uhVXbdN+R/7OTL5X33PMmJLCLQHSZY0rZiFfZvzdDryIuQW0
	 JUbhIAxxbUDGBjaydcszNnWTTFvRJQRIrsimqQ7NeOH1f4Qfxsm++JJyxLmW7eaaWl5ak
	 Z+Lse9eaOE0mewzNCmavpKevgHX1BpPud3mhik2KlYHZd0NzTlH9Z7BqaAaShRMT8UA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FvxARh4T9tI5kdcX4Gm7kudKWLQhzFK8eZWFYxwcQV4=;
	b=0PGo5CXaCnWaH0oDAIhMxkJZsX6QmcXkyUNaqjxn0Biwi+slF1EMgTpNkzGd3Sx4jD9z
	 lGUl2SLO9jjbYxyR/br0ToKrKc8FRJP83K5doY8/KxrziVzAVx3lI8dKUH0HBgOZ2JG+7
	 hcnYCM/zk7rgsR0SmRjXjQe8zW+q7M+ZnxWiDjmJNSiPm7w/aYWKm+GZ3KSCSZGklvy1L
	 gtJ07+6y3720zqPXZU95WJcEfwG5OpVh2EjnzZf8cbhQseg+HyQXGrtbQH8K2NAyvfWwo
	 9r8ZFwJCnNHzsUO5/57YOSeqDI6hm3kDNi++HoItnu099F0A9QoFKMiTKqucEiR2IAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nBbfjeWq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7DE606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F7DE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nBbfjeWq
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so22282465e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:39:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793093965; cv=none;
        d=google.com; s=arc-20260327;
        b=obB+7hwwuqE8AKjTJM7TW/jufd4KoDqBdScen6dSfMoPN3BXqaB7F6dxwP0prjeOgu
         nstCEpfDy+2LurN77H3XjvE5aB//Yx780r6JpTxdUJ4Sa/wI/sQ7l0U2/eb+W7ujCkTn
         80hG5SR0iFRhIx7yAB5Y8F/BDEx5RQ9qGE29LnMQDQC7e3ktyOHy/wCC2gajEmFGdZMB
         CqXLpLpVSyrJbvS4VyQh0FUTn43ZcLKpg+euyU8P49elnYim8o3aRg/1BpmDTypaM0jG
         xKE2rvQNmb3g2zZNWBDxPnezl/Z9+ypsiPmzZ4w4pex6JtBssgW0tOeSPzpKDgIl9o4j
         fHcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FvxARh4T9tI5kdcX4Gm7kudKWLQhzFK8eZWFYxwcQV4=;
        fh=xLTcq2Q5hO2kq/rcp9aKaefIK4i5XIkvPV2ROzH8R1E=;
        b=HLcZXGZ0uyD1bjKF62pRaVzlAcLROOzr3HjdTmHJdiZVadNdtaUGIz+6OgkG9SytdN
         UVxZyNysl/Q2lG1S8E7+hrQ+dfSseL3Lbv48t5PdtkEyLXi4rDKsW6p/9sO6cQQIq+Wh
         9TA+q9H5D68U0HVA/wwczzPdReejUBKlQkFRp7qgQQvzkqKw82R8qKXfoqUzf1d0OUEn
         LRoS4FgIXLqWXg/5NCe+GS7bsuRAvCNbZNTwevMx8pxGTdSSLjsbkLGu1IG5rK2S7XM+
         gNtEZsnsagNS9SkfDaSHfkm1UvYW6iihPXgrtDJN8oTgMZyb2iXwGFxB8BILOii7/2qj
         mYpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793093965; x=1793698765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FvxARh4T9tI5kdcX4Gm7kudKWLQhzFK8eZWFYxwcQV4=;
        b=nBbfjeWqdB3RFA3SVM1a5v1/eQaMC9sYaVQTeUca/bYIL8aPnNYFsSWytrOksPMRfk
         3g/0n2B5XQHtf4h1G5qBCkFYptkuDzWYTf79mCeLEm5fM4ezdzuGxu7Ql/Q2i3mDVNnc
         fVDkDQCTBsRC2f0vKl0F96ZxNeZMcVAylvWWII/uRIGvlEjIjX5EvLp3T/d9+iMtNlmj
         TCkGTvTggYZM+i+07/VqrpD9HyhVw3Itq0LZGS5Gxa4d/32iTVjiA3KohG7l1AZAx7gT
         ZxcVjYfk7lc7+K+Ptqm3veaPfJ9UQhrSPYVW8g9o5SZkRGrRbDoyb/NZHAQpTpNFQ5rN
         8qdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793093965; x=1793698765;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FvxARh4T9tI5kdcX4Gm7kudKWLQhzFK8eZWFYxwcQV4=;
        b=GEwDHl09fSPMwk3gZ76YAenDBMJ1wW9QZrtwWEp2CFIvyqmIU44Z3DGnXMGiKid+Fo
         legHlHSCwgk1WPmD6CTZitwMJ91dRyfktNIkyrwcO0YkoJlPHQz01ONPksZfoia+zJhn
         tN1KYzt8fniQHEtNlJJO0FzYY2uhd/lyNgJQFn/URDWgV2gYpcuxjQtgGdvQHPUB7cQD
         Gj0sNAqVSPD3ES7ypAHyx/42rFAIKxWzir+qzvrazdbMdexL/ASd8jFfZ9UWSyuyNfFX
         s5PsQUy/ySYur17+U6Se8SKIUuC2CfoFd2NgHb4GA8lTtwzae3GvR4i6nZw9ZLGkrGTW
         kT/A==
X-Forwarded-Encrypted: i=1; AKwUvBxocP8LziaTQ5Eead+8GXDJIq4F4v/gRTPoFAhPHMwFTOsD5m4k59LYwYW9B0iDhQ76xWBXOPMJelAN4Jo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpZCyDG3GeDvvtSCp6ROt7aoF+PTCS+pyBrg/9ntArJfZhlZQI
	ba9DJvr9cZBrYszLs46PsicSNH+NB/SRTCr6YwQ6d/Kmmm40Kg2f8T4U2WX84ipTWQxqzA8hYE2
	9dzjmzGe0mnOq9I2R/xtMMv6Ez+9pWqo=
X-Gm-Gg: AYBFou2QQ+V2powq6m6RHAnyABv0T4QjDN3Rbq7qq/Hy6MrAm9B/w+xB4VQ+LNLuTWZ
	RHIGN1kRIEwGVMNjxRf/tG269z7ZP6OPIz/sM3+sEz1LkX/7AUvi0KvEaXyJtDBYKRxD96Lyf9Q
	t7sLwpyCQ/jmejJwJzzSWRo6DTO5XGaZe7aE+UcXQ3uROZ2zxte8XBvV6BYsBEdd7nVXrBfsXS6
	/XMRb989PWn7cLDZ2l7QU1M88u/o51a+Fdl1tIWtWkZ5jFAU+XTnUVnJuJgKPb43YZNjbkh4eCO
	qLlS+AX/YRNLz6ur/kRhKpkW77Awyu/yVhk+dbW6uI9s21J6Om6KqoMeEm2tVjlOZJzNnVELuc9
	mCRuxnTKmZie3Ixs5E5FgSK0zF7CO88BqQPM+7tluXWPf6WHtqqP2se+jhpqoCFnidcB9
X-Received: by 2002:a05:600c:1d01:b0:4a1:ac66:6ac6 with SMTP id
 5b1f17b1804b1-4a35acafdf5mr158312525e9.26.1793093964471; Tue, 27 Oct 2026
 02:39:24 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022220203.91911-1-baohua@kernel.org> <20261022220203.91911-3-baohua@kernel.org>
In-Reply-To: <20261022220203.91911-3-baohua@kernel.org>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Tue, 27 Oct 2026 17:39:13 +0800
X-Gm-Features: AclHuK8LQwtQnfDOAed72citROdISwJfQPWQCA3Tq3i-D2KJ4BqJbqxJeh4RDU8
Message-ID: <CAN_Opa_s-xW27K81UAE-xHyRnPto52bZxnkPaGug+yhG76ArLg@mail.gmail.com>
Subject: Re: [RFC PATCH v5 02/14] mm/mglru: extract lruvec_populated_min_seq() helper
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, hui.zhu@linux.dev, 
	axelrasmussen@google.com, baolin.wang@linux.alibaba.com, david@kernel.org, 
	hannes@cmpxchg.org, linux-kernel@vger.kernel.org, ljs@kernel.org, 
	mhocko@kernel.org, qi.zheng@linux.dev, ryncsn@gmail.com, 
	shakeel.butt@linux.dev, weixugc@google.com, yuanchu@google.com, 
	zhuhui@kylinos.cn, baoquan.he@linux.dev, liuxiang.277@bytedance.com, 
	wangzicheng@honor.com, lianux.mm@gmail.com, kasong@tencent.com, 
	liam@infradead.org, surenb@google.com, mhocko@suse.com, rppt@kernel.org, 
	zhangbo56@xiaomi.com, lyugaofei@xiaomi.com, ridong.chen@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 6:02=E2=80=AFAM Barry Song (Xiaomi) <baohua@kernel.=
org> wrote:
>
> From: Kairui Song <kasong@tencent.com>
>
> The search for the oldest populated generation of a type, previously
> embedded in try_to_inc_min_seq(), is extracted into the new
> lruvec_populated_min_seq() helper. It returns the oldest populated seq
> of a given type, bounded by the given max_seq so the search never goes
> beyond it.
>
> No functional change.
>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> ---
>  mm/vmscan.c | 43 +++++++++++++++++++++++++++++--------------
>  1 file changed, 29 insertions(+), 14 deletions(-)
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 3be0d6c04a82..500ef23949fd 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -4131,30 +4131,45 @@ static bool inc_min_seq(struct lruvec *lruvec, in=
t type, int swappiness)
>         return true;
>  }
>
> +/* Similar to lruvec_evictable_size, return the oldest populated seq of =
the type */
> +static unsigned long lruvec_populated_min_seq(struct lruvec *lruvec, int=
 type,
> +                                             unsigned long max_seq)
> +{
> +       int gen, zone;
> +       unsigned long min_seq;
> +       struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
> +
> +       lockdep_assert_held(&lruvec->lru_lock);
> +
> +       min_seq =3D READ_ONCE(lrugen->min_seq[type]);
> +       while (min_seq <=3D max_seq) {
> +               gen =3D lru_gen_from_seq(min_seq);
> +               for (zone =3D 0; zone < MAX_NR_ZONES; zone++) {
> +                       if (!list_empty(&lrugen->folios[gen][type][zone])=
)
> +                               return min_seq;
> +               }
> +               min_seq++;
> +       }
> +
> +       return max_seq;
> +}
> +
>  static void try_to_inc_min_seq(struct lruvec *lruvec, int swappiness)
>  {
> -       int gen, type, zone;
> +       int type;
>         bool seq_inc_flag =3D false;
>         struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
>         DEFINE_MIN_SEQ(lruvec);
> +       unsigned long seq;
>
>         VM_WARN_ON_ONCE(!seq_is_valid(lruvec));
>
> -       /* find the oldest populated generation */
> +       /* Requires at least MIN_NR_GENS gens for basic functionality */
> +       seq =3D lrugen->max_seq - MIN_NR_GENS;
>         for_each_evictable_type(type, swappiness) {
> -               while (min_seq[type] + MIN_NR_GENS <=3D lrugen->max_seq) =
{
> -                       gen =3D lru_gen_from_seq(min_seq[type]);
> -
> -                       for (zone =3D 0; zone < MAX_NR_ZONES; zone++) {
> -                               if (!list_empty(&lrugen->folios[gen][type=
][zone]))
> -                                       goto next;
> -                       }
> -
> -                       min_seq[type]++;
> +               min_seq[type] =3D lruvec_populated_min_seq(lruvec, type, =
seq + 1);
> +               if (min_seq[type] > lrugen->min_seq[type])
>                         seq_inc_flag =3D true;
> -               }
> -next:
> -               ;
>         }
>
>         /*
> --
> 2.34.1
>

The helper preserves the original search result, including the
terminal sequence when no populated generation is found.

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu
