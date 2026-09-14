Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EAB3EF0C2
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373418; cv=pass; b=fZNyNCzbIKUgOyFcWpHs0+PaItM5hOrGRb9aVpuYG7tN6GtnNjCKXMinP9E5jLu1rPmxgrgGEnO20IexywB5EGavNOykW1UTiBhHBKu/UwpR4vMQ57GclplQAT8bk8GPq5kKClhdjXhWelmcjK/FJer35/nQ4MEQ3gfWBqzcmCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373418; c=relaxed/simple;
	bh=h0s8XF6Ov7W7pfoDrabYaERETdJXiADVfJTEQ7GF5hE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OxYgOvQfsBttutCFAxI80qy/AkWbVGqM+MytFrRb5/IyvViIuT3e2+iHgyZpG6k5qKk4xYCO3e0F85xbdI7n4mXxPP4U5N+rZTjZWDkMQdX0SlCw5GhW/6FyIakxF2tUYPkFd3/TSuE1ocypQQowmHtwHq2HsM5VhVwJXtYa40E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f5wI7Ugl; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f5wI7Ugl"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f705536so421590066b.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:10:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789373414; cv=none;
        d=google.com; s=arc-20260327;
        b=ZCERjHx2yhHdyEq77X5TxR59Cq3CPzMrmVmfwOJSqDUsd5W7vUx5et7ZuyDll27AbM
         lk/f3ie3hcnd/YNccfwEpARhi9o/WZFcN9iiZ/M8D68ay6MiBE6jZp1WTJzY+ta2u7Bs
         fsQCQTyWWorkG4Mw52W9h6yx4ZbujHu4trLCKnBUZDBxWYFv3y1QDws2zs6T6dYWvf6Q
         S76W9MTpuYjcbVqSqKrBi5RtjTMjpXuHho/rO57+watLT/P1vx93qmyce4+wk8gYG/bg
         SbN43rwTnS48N7cHJ3H4k2l5yndUpuocWOgJbRaH5TNqdLovCU4BVCLjkd2a6NhUbsPM
         mcrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gbupapCaPX6GqH+Zj6CPFJqNq2nMbywMNp0mnaUzXz4=;
        fh=qEK07X52i4Ia2on3CWm26id9Um7CjPCmw2iyCyVGsAs=;
        b=Yl0qtwfUDu0ZoEtrLC84+q8xWV5hbdaFwdROfZZs3FkFIa9Hvn3w9uZm+4xE4CgSKC
         fLoLarmBWmrQq0y9+1x4MFArdyCVAR1eAGowpUcev9xdrF+VbZy46goNFgdcegoQ4xeO
         Ly5wlVroZS75dCD2oWsjyy7JuLl+3j4FTrRPBkw8d8uUS1pj5yFVNS/V+ZRcYy7cjFvU
         JIqboNef780KxqlCIXf01b2OTSejJKtZC3YqWgvpHYcTZW9CcX2+JMVwYyDZmYmT4YJn
         DhvjlVImlYWTKqvj72eeK906F2QtR7RkujAjF/i3lNovs9I/EXrpvF5/2UQt1Z/NJ18M
         Vc9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789373414; x=1789978214; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gbupapCaPX6GqH+Zj6CPFJqNq2nMbywMNp0mnaUzXz4=;
        b=f5wI7Ugl8OylVaVatdO2z46fBxuxCAxC/jx9xgyKr4YePLnud3tPz5c5q7Avg0u6tX
         jnQH4adlDnJAdLExG/F9+r5n/gtxSv4q6mI5O0vH1oqJDT3XrkzkbPIwCoX/1bV1UXS3
         xB0tg3Ke84Xw8butEtl8v8aCyZVa8CwRnXRvDQrGWi5IFKsHzw9rG0gfJ2ZXHR5GODJK
         29Ux4Nzy0GlyyPkyQtUWw0g1IZryiS5aXAJe4I70KTofOBJlpuUSYjs5jPkom+Unwxul
         0NR4yabE2Tmw1LmtlZXUmUuIwhVb9SDsf87kgxJfjjz14OJroDcHkpgto3YoxTdCyhPI
         6QkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373414; x=1789978214;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gbupapCaPX6GqH+Zj6CPFJqNq2nMbywMNp0mnaUzXz4=;
        b=d3QDg5iUR7+oZR7TethGix+dcDSgcOeYvIfb9BrAvZ3kR+8pWZy2HJavczwZTFuIWE
         sbDWPWrKMDybTX1Ewee5aS2Dhmlpmg26krUJ/Vaye9nJNjI1YHap8NxKEDQS11+g4Knw
         irDK9zrCqio/h98hsotYMRS2DBZV2x9XByd48RWBR5ZmJdFCQOd/qV+TSUToMH/jojQ3
         +efslm5oKmy5ywRe7ckewsKVVBMbdBjam919qM82CY+oEulULTOFBYiU7MdFy0P3QA19
         guxTp0axGIcigEZR73TAX3uHJ/gjNE2AGE7WawOr68xf9r1bWTQ6VrCaG/ARN9bLtuTP
         sfgg==
X-Forwarded-Encrypted: i=1; AKwUvBw9N69JHWzQE/ztlH+E5XggOiHawNRzxIGddiZa63vnefx6eFKRqeEOiEE8eV5gBla2HDqEYfgW9ARdr2I=@vger.kernel.org
X-Gm-Message-State: AFuF++lfy6+JAKCVlP3W1zoW47mF207O+4IMjh5LLh3tG25cJ31CWQ61
	7klVIrdFUD+ALIl7fN2NulGLEAovA5oxtSrw25l3y5Sw3Ucex0YGyQP2UAxY+c+2ewtLiA22jsn
	1qMDxL1F1M/Y3m8RJW034/O95Bv/nGiY=
X-Gm-Gg: AYBFou1cgrB5CkXiixLnmzcddWPExEmeiPFxXvthqpbxou57ikD7T90mCSSnxyHq4G9
	LJihJDIxfchbtrhjXJME7BWjMcF+23U2cbrTu6fb09VsQnX9sFY7y750c9y0GvjTLY/T8AulnwM
	nfBAtjXBU+yYcPRT8WX03yG36idGmLEwrYCrdkxdtijA1lQzJdrfqLbCoysMVpH26K3w3nwgVqG
	3HXczKDUEo+NrWW+kt88XOc10Np6grTbQ2JvYu8DgJqpfzGk5C5sZwtP84c8W2tHMVjY1INNzPq
	Qf5w4V2p5Cp1o/OLI9UBwwXbYa+YDmcqj2zdUdwDBZzrsC1F1N+0RxUT6Bfq0OcuwbyAqI5w8Eg
	ZxoZzzFkyfwqaEg==
X-Received: by 2002:a17:907:9619:b0:c26:1648:a074 with SMTP id
 a640c23a62f3a-c29b87d8a8fmr90164466b.47.1789373414434; Mon, 14 Sep 2026
 01:10:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <9214e36bf738fcfba86acc8cea85dff4010f66b0.1788918714.git.baolin.wang@linux.alibaba.com>
In-Reply-To: <9214e36bf738fcfba86acc8cea85dff4010f66b0.1788918714.git.baolin.wang@linux.alibaba.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 14 Sep 2026 16:09:37 +0800
X-Gm-Features: AcwNN1VSUYAraBKk949cUbwQn07C_1-qFVIQEVtt3AUC_LCdeRgMe-Y0Soko7Zo
Message-ID: <CAMgjq7DdF_fi_MserE_P_AbKR23mrqPLZ-VD71eXH6iv1ncdzQ@mail.gmail.com>
Subject: Re: [PATCH mm-new v2] mm: mglru: clear the reference counter for
 rejected folios
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, 
	baohua@kernel.org, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, hannes@cmpxchg.org, david@kernel.org, mhocko@kernel.org, 
	ljs@kernel.org, ridong.chen@linux.dev, baoquan.he@linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 9:57=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
> As per the comment on LRU_REFS_FLAGS, when accessed folios are promoted t=
o
> a new generation, LRU_REFS_FLAGS should be cleared so that the reference
> counter can start over.
>
> For folios rejected by shrink_folio_list(), we clear LRU_REFS_FLAGS and
> set the PG_active flag when lru_gen_folio_seq() would place them in the
> oldest generation. That's fine.
>
> But for rejected folios where lru_gen_folio_seq() returns a generation
> other than the oldest one (which can be treated as a promotion), we do
> not clear LRU_REFS_FLAGS. This can violate the promotion mechanism. And
> this means the rejected folio enters the new generation with stale, infla=
ted
> tier bits, which can inflate reference counts and distort eviction
> statistics for these rejected folios.
>
> Fix this by clearing LRU_REFS_FLAGS for rejected folios. Of course, I nee=
d
> to evaluate the impact of the changes, which mainly falls into 3 cases:
> 1. When lru_gen_folio_seq() returns the oldest generation for rejected fo=
lios,
> there are no logic changes, and they will be put back into the 2nd younge=
st
> generation.
> 2. For rejected folios with PG_active set by shrink_folio_list(), we only
> clear the LRU_REFS_FLAGS and do not change the generation.
> 3. For rejected folios with PG_referenced set, the original code would pu=
t
> them back into the 2nd oldest generation. After this patch, we will put t=
hem
> back into the 2nd youngest generation.
>
> I think case 3 is also reasonable, before commmit 6cbdd9726fb5 ("mm/mglru=
:
> use folio_mark_accessed to replace folio_set_active"), a rejected referen=
ced
> folio was also put back to the 2nd youngest gen. Meanwhile, I didn't see
> any noticeable performance impact on my 32-core Arm machine when running
> 'make -j32' to build the kernel inside a 3G-limited memcg with either zra=
m
> or NVMe swap.
>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
> Changes from v1:
>  - Update the commit message.
>  - Clear LRU_REFS_FLAGS earlier.
> ---
>  mm/vmscan.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 40d3f1b48a74..1557679aadb1 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -5020,11 +5020,12 @@ static int evict_folios(unsigned long nr_to_scan,=
 struct lruvec *lruvec,
>                         continue;
>                 }
>
> +               /* See the comments on LRU_REFS_FLAGS */
> +               folio_set_lru_refs(folio, 0);
> +

Will it be better to mention that we never add the folio to the oldest
gen (since `folio_set_active` below prevents that) so this is
effectively promotes the folio by at least one generation? Maybe can
be combined with the comment below.

>                 /* don't add rejected folios to the oldest generation */
> -               if (lru_gen_folio_seq(lruvec, folio, false) =3D=3D min_se=
q[type]) {
> -                       folio_set_lru_refs(folio, 0);
> +               if (lru_gen_folio_seq(lruvec, folio, false) =3D=3D min_se=
q[type])
>                         folio_set_active(folio);
> -               }
>         }
>
>         move_folios_to_lru(&list);
> --
> 2.47.3

I tested this, and also tested with MGLRU-FG on top (the posted
version is on top of this):
https://lore.kernel.org/linux-mm/20260911-mglru-fg-v2-4-f26e5cb26da7@tencen=
t.com/

Both cases looked good with no performance regression observed from
this patch with a few quick tests. It also has no conflict with
further changes. Nothing surprising was observed, so:

Reviewed-by: Kairui Song <kasong@tencent.com>
