Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794755788;
	b=KAY68Wu3OIyJuu8auONTCYbQNwAFKGBuwbUGWXXiC+zoLLBofMWpIIHw9+sodgMgU3ul
	 48Yo6rBRVy4G+c9zDF3fXAqfsv2MpK5pQYkm5xvVONuTfZr+rINmsaXR3wjCBMQjoWQZn
	 Yy6rHf6AuWi3Ctjg2fUYffc7addxTx0m+VZLTRBNKFoty4tH4V7AvxDK/gi2BbJtgPlDL
	 fJzhlibLZO0mMMTEwc/egPMMqxDGs3UKOKKJXj4mR/ivkMOXIocKKzEj2ZzsWlFFV1wzf
	 bscTnjv1gZtuwT2/bdl2nGLPwcn36A6kMM5WJg8bmEuOkSd3JRmfRs/SDDuyINuAY5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794755788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/kbMdsPfYVgyvUvoYxJogO+QNz+rfnD0XbM+npE/rd4=;
	b=3TqPeKPKnaYnCz24p6t4wo93oubzCHLlhZhvpEFdOcpo5PNwvNRPLswjjwAj0BZxm10G
	 XBphB4JfVsG0LITF88AC+/e03+MwiYnxQ8q4fYkyo+Pm3o28P3lzyd4zZt2zoFOz19rtS
	 33iwsBP2goZcJg45LxfNW48WQT52ogq4qFFDlqEGe1ZHdnlYRpt/vziRjbtumwZaxDkPx
	 qTcIEJtxFV+tKl+EXqXNC8PFcx82UBPmmZscyrMkt9uoOqiQODcw3/8J9nBzwAjMSV757
	 WBhc8SWRY71q43LFbj3RC91Yy9qaa1e5BVvGOwy6ndqz7eD3SjQGvpVDQKGz5O38Rog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=stqrq6hj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D018606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D018606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=stqrq6hj
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b600fae14dso1189516b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:16:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794755787; cv=none;
        d=google.com; s=arc-20260327;
        b=qwT9lGnKaDXSKhBtZJW/IG2GwGE1g3XlAlkdcTmFJjzIqRgpoxCDWM2KypnARwPdoV
         1Z0MLa0h/cGNFEsBPJjzLGmLKBGTDZwQzSSn4oErdSJxl8BZUltxYLXXSqp2VkZQK+dG
         kurnpsZE3ZnxGKxVP77c8G98bFGEUxgqtAG1CvWcow5ruX1E9C32hjmI21KAOYVKFInx
         /CrgwMSsft+wZse0wXbHFqg+LlTjRga49Nu2AeG4uS2ZIsHgv8zZxt5S0DMMAmXp4oIF
         BhwpGBuMnchZswYf81qh416rbY2aI98NrsR66RnouDhD2BoujdwyN6Nwq+LnJI6+joOC
         zClQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/kbMdsPfYVgyvUvoYxJogO+QNz+rfnD0XbM+npE/rd4=;
        fh=u+nweZ2kTaeZr08TAToPmQ7tohQeOJ+f96uey6tLVR8=;
        b=oU7FWY73HE0VEpmEyNRvcD9cTZXyOIfqSh4WdzYUndxj6eBd9DTC0xmtR8wUZLiqBr
         2o217Q0B4QW/IZpCy7266cQF1tlA7+xCBkudKIcguSbokyodQ8yqLuatzo6FtmlmPSYd
         TPu1pzXt0YBG5xFEvGRf65Z+bdQTja/oYrW34+ejdqu0YADIIGZgjnLeBvqBbYknuutk
         i0QzRhjDxyB17O8otGqMQ7g5d+ntlPw2llnf8ldsppAOaxSH4dtX/DhbVj7NEsvA3P5Y
         e2emmTANx7157Ymn7VUPPux2KxmhYCt4auilYI5B1CUjGEFNapdOADW4HNvyXlbyul1S
         XnUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794755787; x=1795360587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/kbMdsPfYVgyvUvoYxJogO+QNz+rfnD0XbM+npE/rd4=;
        b=stqrq6hjc07VTJd37LTXJA0/o0N5voZtyIwqhA1vhGi1M5WHfNLWvOhyG7jtarsix8
         EaXC/RH2QPFRS127miZKEfHZCsQrTVkI+FqYM47pWPrGx7wLSHx4OuFQN0d9DJ/zHWpB
         LUL1A3dED+ypv2mFzunzX0LuhILoIGGY4S5NadkN/XZa6/av4G7bG3+pOSS7gmgwM//G
         JIoblTRgU3jkr38vMYIsJMoy3+zSavvRvnAYWTm/h3V7raz/ElYrPiKy6KxZy76sw/kt
         CVy3mGn7lHDQbJizSGOKyYLL3hxgi0Vyhot1JLF+YQudN94SsXKg8RRDm+URb5HRk+aV
         r+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794755787; x=1795360587;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/kbMdsPfYVgyvUvoYxJogO+QNz+rfnD0XbM+npE/rd4=;
        b=iwh+1p5DgherpQMakIzyNNtMvFxhICYluoHHPK8a6Hi5I+fN3HRDIbgsMmb2vl3RKN
         vA4P21eYSJ1DEfbMjorkvQWhUj1xK94qZjbFfgZad5HWpHS9f3i3mAqdprvgOo6ECpNR
         kaes0eDG1HVBZy45bGWbMEsslA9wX/nhuLAY2XusGGIzBtZ1fljaiqx7gahV3i48ta96
         HqfL9DR4c/IPfTv4sSvQRBVwd7WemNd1lzEaRGUzsKQ21HmfeSMeTxVswQcV22ZCoGrE
         VWN4cRqYbirzzrXL93gfqeva0HJ+DumeJWcn1Ij55CkVnW40P+uXeRm3c48SE7KjJjYE
         caeg==
X-Forwarded-Encrypted: i=1; AL+hErHkvSiBjarPR/Vu/TpUNjciTjUfak7g8TyEGscezb/2m9KxhfYGRW7DcFhNPEQW7FBj1E7ck8ZvB1OZOII=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SVqZjoGlLCUnZ4Z7RPzQKV7yWu0XZfWQNBJzvbsGhqH9VmtNa
	P2tnLruBT8x6oWYXw8U6j+PcpdjOUODWE4eThswdF+RFQGW6IAKwU2m+qdRnZOsK8Rhna8TzqhX
	sJRIWfz80IfRh+G7W4sUvefs3MDvEoc4=
X-Gm-Gg: AYBFou3XNUhzGky4R/NwkEgAPvTGYlgNwzSkscvXS0y6RKDbODgZcyp5aSIuvAqY0Kl
	aVfsALk44bgQxWZzNiFZ9iKXJnAyaT5CCs939L/UpuOoEEF1Sad+z7lpRI1b9tORiDjd4RGcKF+
	+5Gr8tFQ/CznlUurdCfDPXwpQ4arCcfAL00mXd++4jlK8otUPYx1UNSWklrJi0L5OIj9YXH1g2G
	lxjvq4dlKx54iLMt/kE6vrhnYqDSUqK8qFtWiML3uv86u+oMnhJ5PuDNB5o1B0ouK/BHb6A3Ly7
	aKM24hBfpLHI1ST6LbvbpWUOGH+lsEZmaMeUhX9GZzIxk1+RgbYajM4t8HdniS9vTGRw0WSqy5h
	xT5ICd55gsq3hcRG3eRNK/8FzMb6ew1TG4yxTiYNwn1XEGL2OZZiguLxcfrMhoVDTe5RcaQ==
X-Received: by 2002:a05:6a00:1821:b0:8a0:7140:7fbb with SMTP id
 d2e1a72fcca58-8beb7d1a49amr7332511b3a.51.1794755787247; Sun, 15 Nov 2026
 07:16:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114200803.23129-1-baohua@kernel.org> <20261114200803.23129-10-baohua@kernel.org>
In-Reply-To: <20261114200803.23129-10-baohua@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Sun, 15 Nov 2026 23:15:48 +0800
X-Gm-Features: AclHuK8XlLpyFj9N4Jv-bPNR15WiG3Gcs5zf45ZlS61R4q4PyKBnJPk7NkVtd_c
Message-ID: <CAMgjq7A1dWJ6DoF6+CxfjysxjzAChWrdk=z_JvtLMyFWdoYTyw@mail.gmail.com>
Subject: Re: [PATCH v9 09/16] mm/mglru: Avoid placing rejected folios below
 populated gen
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, axelrasmussen@google.com, 
	baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, hannes@cmpxchg.org, 
	hui.zhu@linux.dev, kunwu.chan@gmail.com, liam@infradead.org, 
	lianux.mm@gmail.com, linux-kernel@vger.kernel.org, liuxiang.277@bytedance.com, 
	lyugaofei@xiaomi.com, mhocko@kernel.org, mhocko@suse.com, qi.zheng@linux.dev, 
	ridong.chen@linux.dev, rppt@kernel.org, shakeel.butt@linux.dev, 
	surenb@google.com, wangzicheng@honor.com, weixugc@google.com, 
	yuanchu@google.com, zhangbo56@xiaomi.com, zhuhui@kylinos.cn, 
	sidchintamaneni@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 4:08=E2=80=AFAM Barry Song (Xiaomi) <baohua@kernel.=
org> wrote:
>
> We used to scan only the oldest generation in scan_folios(). In
> evict_folios(), we checked whether
> lru_gen_folio_seq(lruvec, folio, false) =3D=3D min_seq[type]. If so, the
> folio was marked active and moved to younger generations.
>
> This was itself buggy, as folios in generation min_seq[type] - 1
> would not be marked active by folio_set_active(), potentially causing
> a cold/hot inversion.
>
> Besides this issue, the old approach also differs from the current
> behavior, where we can scan fewer than two generations.
> Now that we can scan younger generations, including the youngest
> generation, this no longer prevents rejected folios from being placed
> in a generation below or at the populated generation. Such rejected
> folios would then be scanned again and again, resulting in extremely
> low `pg_steal/pg_scan` ratios. For example:
>   pgsteal_file: 2312605
>   pgscan_file:  36465693
>   reclamation efficiency: 6.34%
>
> We pass `scanned_seq` to `move_folios_to_lru()` and make sure we either
> promote the folio or place it in the youngest generation when the
> populated generation is already the youngest one.
> Also, folio_set_active() is no longer needed.
>
> With this change, the results become:
>   pgsteal_file: 2683815
>   pgscan_file:  4224244
>   reclamation efficiency: 63.53%

That's a really nice improvement! And I have seen the rejected folio
got inserted to wrong gen many times, this will help to fix that too.
>
> The sys time for building the kernel also decreased from 4m30.532s to
> 3m50.188s while swappiness=3D=3D1.
>
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
> ---
>  include/linux/mm_inline.h | 22 +++++++++++++++++++++-
>  mm/vmscan.c               | 24 ++++++++++++------------
>  2 files changed, 33 insertions(+), 13 deletions(-)
>
> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> index ab69b9930893..f6f4bc9a704f 100644
> --- a/include/linux/mm_inline.h
> +++ b/include/linux/mm_inline.h
> @@ -332,7 +332,8 @@ static inline unsigned long lru_gen_folio_seq(const s=
truct lruvec *lruvec,
>         return max(READ_ONCE(lrugen->max_seq) - gen + 1, READ_ONCE(lrugen=
->min_seq[type]));
>  }
>
> -static inline bool lru_gen_add_folio(struct lruvec *lruvec, struct folio=
 *folio, bool reclaiming)
> +static inline bool __lru_gen_add_folio(struct lruvec *lruvec, struct fol=
io *folio,
> +               unsigned long scanned_seq, bool reclaiming)

A little nitpick: I think the code will be cleaner if we use "long
min_seq" and get rid of __lru_gen_add_folio, caller of
lru_gen_add_folio just use -1 as min_seq if they don't have a specific
gen limitation, but we can just leave this as it is now to avoid more
chore update of this one.

...

> @@ -4991,7 +4995,7 @@ static int evict_folios(unsigned long nr_to_scan, s=
truct lruvec *lruvec,
>
>         tier =3D get_tier_idx(lruvec, type);
>         scanned =3D scan_folios(nr_to_scan, lruvec, sc,
> -                             type, tier, &list, &isolated);
> +                             type, tier, &list, &isolated, &scanned_seq)=
;
>         nr_isolated =3D isolated;
>         if (nr_isolated)
>                 __mod_node_page_state(pgdat, NR_ISOLATED_ANON + type,
> @@ -5017,8 +5021,6 @@ static int evict_folios(unsigned long nr_to_scan, s=
truct lruvec *lruvec,
>                         type ? LRU_INACTIVE_FILE : LRU_INACTIVE_ANON);
>
>         list_for_each_entry_safe_reverse(folio, next, &list, lru) {
> -               DEFINE_MIN_SEQ(lruvec);
> -
>                 /* move_folios_to_lru() culls unevictable folios via foli=
o_putback_lru() */
>                 if (!folio_evictable(folio))
>                         continue;
> @@ -5037,11 +5039,9 @@ static int evict_folios(unsigned long nr_to_scan, =
struct lruvec *lruvec,
>                  * so this effectively promotes them by at least one gene=
ration.
>                  */
>                 folio_set_lru_refs(folio, 0);
> -               if (lru_gen_folio_seq(lruvec, folio, false) =3D=3D min_se=
q[type])
> -                       folio_set_active(folio);

Nice, this part is causing trouble indeed.

>         }
>
> -       move_folios_to_lru(&list, false);
> +       move_folios_to_lru(&list, scanned_seq, false);
>
>         walk =3D current->reclaim_state->mm_walk;
>         if (walk && walk->batched) {
> --
> 2.39.3 (Apple Git-146)
>

Thanks! Looks good to me.

Reviewed-by: Kairui Song <kasong@tencent.com>
