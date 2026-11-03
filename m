Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793672387;
	b=Ih44sCtUbtMz1ellQ8UyEJOp3t8/zmXAZQF2AyI0xJemnYTrk6c456GDchJN/l+IC7Wb
	 sL9PoAw77iZ7JsGm00qokbjsNUdcwyz2oQERAwes3hOrR/ymS7Qn4iDCjwnVOohd3ATsJ
	 6DVKrbkMpTujsFtkfRZXLajMtluFWL7EEKAPrN5y39tzQ9TvJAQ0JM6iiFtXo5pi8RQkm
	 IgU1ZVKe5b6uwq0IN9l0tpfWGswiqqEnrFIFIAXKPT4uO4V/V0Mnm/fV57H0HkjX+u1sB
	 o1/V2tXZ/QbCkugJH9I2QpagE8KD4xxvAwv4krbwkLAVThpB6RJc2sv/ZQEnGWPx4QA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793672387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Y+VShWs9tikJp7nMg5yS2OguM1pTvxjDCYk36G2aajc=;
	b=MImd4q0hDfea+BXsOHx/WiChb/VBCiZIntU+ONkpwC/PQhqPhEIeMZe5DMEm/VG03upi
	 ELs3sQDnF6djWaY2AoKDtq9AqooKsXEhGJI4U51juaa/y5UK6unUg0TupbZ5jD7E1BBQc
	 UbDaUh7skdCOIQYfLMGitNIWrh9rNzTUYdCbKq1zAzOxmR/2Dfm+tcQgqHaerYDiBCmef
	 FtV74JanMzU99PBj/NNoTcqqp3/YaH7spBZ99IuPTF9oUbhp7ifSVvUpIAzjthJ6uFMih
	 ufIYf8ljrb+bSLqWu6rcC/pDwdfsPYW8nb9/TrXHy1lGz2l8xkTdegqKIaKI1OqhpOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xe7MMEOW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB274606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 02:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB274606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xe7MMEOW
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so1785255e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 18:19:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793672385; cv=none;
        d=google.com; s=arc-20260327;
        b=Lciy+RrIU8SU1VmnoORF6ieRQzmMhB0do7neA1FESrId/GZym9sF2H2V7mPJc1Dxa0
         PCN4SMiGoD4P+AMNzU+MpmD4+gkGZiuwJN6yC8rvwLIrf9LmB0kTKpVoTLFF8WPWTFzu
         aws0dXg5I24svguWH5zPSheMkg7XbBpmgg4q4i1tLR+H3nVGNxn6f1HylQmfuQitdrop
         GAXQuupTKqt+2G4vaRcw3qmuHtb1b3LPgEWCJHRG1jUJmXyzIKw0bPNCteEMGjorSID9
         9rr4haz9NQTDtnbd7bBnxwdAqDZwr2a9GFzepl8r9SXlMHBvAkuT+uZb4hqmA1u0Z6v4
         RoOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y+VShWs9tikJp7nMg5yS2OguM1pTvxjDCYk36G2aajc=;
        fh=ixaGDJM4UfGb0nTkLr9D5J38cRE/k58fKTqtECN09ZE=;
        b=UPkfSTG2D12USZ/7E6n3shVBQIkcUEVn3gGjpWel/viriFJ4sc6/NgVekKeThaxVqW
         IOYLf+5bMkWLawd8UNfguA4hdw2hbYC2vnhL8Ee9yl2kmmr4RrijyjR2prUyS5hc1hMA
         s1uUG57Iy4UgZxosiah1dc4Jz8JKNlzJD2GV4SuhWFG15ZUVpDAq6fGesP0XoA/gqq2M
         VaFoA7demskrzt+1AKCsTzPQbI383ovJzje3iaiGxu4XxUmBKibsLJ6EI3FweK5TnC9e
         /Q7Mi+F84cJxTCOOt2UO92hmTbAyPLp8ya3PMfr/D7L17SV6KLjcyGiYaz97jpnwNaTx
         vjQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793672385; x=1794277185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y+VShWs9tikJp7nMg5yS2OguM1pTvxjDCYk36G2aajc=;
        b=xe7MMEOWol7bzcVbrTSbadiYCDR4ZeZjCfzpGsq6Ylnr4PfqZFxalcuTDCsHfq49+N
         JfMJAXdC8sm0lY/jZJ+jClejaY4JKnU7P+t3aBwYrk/Z8haAgCJuzSyObHwB69wNbpoj
         HaBy/nJobbWCSayT7xdAMSUQTT4GMS6JoNaRufYXCoy/5V4wfHnlXbpKDSnyM2m3sL2Y
         vSYvq1ZkgQ5jdxatDeiyaQsP9nM7q9Ic9d/kEq0V1ZzP3A1yyN4hrYr/kE8BUF2CG+7E
         QC5kXYeGO0EuOBHK/z3VGOmM1Yze1bFzx4vnr3gSxIL8q0pk+1h2oKp8P+ZV/jUTGbfp
         8bxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672385; x=1794277185;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y+VShWs9tikJp7nMg5yS2OguM1pTvxjDCYk36G2aajc=;
        b=IBnu8FsBJe35NucaYeSvmXRN2wo21HcU9qqmT3Rs3Fu55KHL0iLhSsocz7gznbjtHa
         mj7d9+TAyNL1vbNh+NJWoA6KdnigyITm4t7QBSTnFvLajlUuQjgNfe2IIbuhx6qP4j/d
         jTiIwXNPqquxSoRC0C3uc65CqYcFYKxmS8h4QImcyhCxjPOmperUQ+mjnmzDuE03WZmd
         quZ9sm1aUVBVopJo7A/wO3VhPgZA+eFKKQT1f3cpVPekSufk5EY+EZbEk46fstsDvs5z
         pIWd1zxfolEY08oF5MRh90vM3/tFiCqIfAmEi4Wwey0laUsCX5mzlEPHdYHc2hSsacGN
         VsbQ==
X-Forwarded-Encrypted: i=1; AKwUvByarBh3UP6h5p0EJQ0DMAUvl/ZtHBcasayKx6GGiOl6uDzYddumQCQ5FcHw2Qwt7a/Kq7NiT1WzJRQGKJw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKo1FZspZcrmR/damPia/sHeJetozUaAZZ7R9/zroqjFPO24zF
	rtci64sdO4RcV5/ggEAObl9dfoJiWnqCMdFJ2yY8g/ZiGEkcPrsi5FI8Vn6RwNCzJSI2mJb9DwF
	0yUhq3/FG3dUe83T7wEFyDuB5uucjzU8=
X-Gm-Gg: AYBFou2/xoCldT4Es0lUEXeRg0gu4pshmF0WSQBy6sdcIgGGtsxV9wDlMSEUiE++hDq
	NHRveyjVj00pw94EfDv/jjuUcqb30LLC8Gn7P/bSpvwsn3Rb1Wy/30iWSd5Dgye07Ic/K8rtu71
	Sz3p+DwmMycYJb4wG4aphWbTRxKs9Xkjq1E83s1w9Qu0c7KiiJlas0K9appNvXwGmfGvww4hNn2
	uT6AykjegAM1cFUr13mbi4hOMpsIXnF4PLHsAThxTAWnYGuiBftn+9ePUW0q3kchNRKTDpGMGnD
	VpLUQnpBSiSBIhBk1qPs7bW05Je4M/rwYPc+F63canHjDSpHEDgv+le6/jXG9FvYH47wqAZJ6CL
	Q8QFROQOIqu10n68LaD+lFKZLmI+VphaWf3YQGWkdwV0xFzu3LzX/MlDE26tabnNoUHPeqKGavo
	jfsmqyqyg6R4Jf0eDw
X-Received: by 2002:a05:600c:8116:b0:4a0:20b4:ba93 with SMTP id
 5b1f17b1804b1-4ac17e10724mr272739855e9.16.1793672384680; Mon, 02 Nov 2026
 18:19:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022220203.91911-1-baohua@kernel.org> <20261022220203.91911-7-baohua@kernel.org>
In-Reply-To: <20261022220203.91911-7-baohua@kernel.org>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Tue, 3 Nov 2026 10:19:33 +0800
X-Gm-Features: AclHuK-ZlSNHc_gQBqv7Q2pLdZDrXfbMg8uPwnBYk9q76TXijqjYSSVYy3bN8qk
Message-ID: <CAN_Opa9s7C_DSQcgh-r_UVkZUigN1fmaimPQpBJDg07FwiCn6w@mail.gmail.com>
Subject: Re: [RFC PATCH v5 06/14] mm/mglru: return for unavailable anon
 reclaim earlier
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
> No feature change, just shuffle some code, prepare for later commits.
>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> ---
>  mm/vmscan.c | 27 +++++++++++++--------------
>  1 file changed, 13 insertions(+), 14 deletions(-)
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index d3caed8aa789..0930bee5906e 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -5215,20 +5215,6 @@ static long get_nr_to_scan(struct lruvec *lruvec, =
struct scan_control *sc,
>                            struct mem_cgroup *memcg, int swappiness)
>  {
>         unsigned long nr_to_scan, evictable, sizes[ANON_AND_FILE];
> -       struct pglist_data *pgdat =3D lruvec_pgdat(lruvec);
> -
> -       /*
> -        * Proactive reclaim initiated by userspace for anonymous memory =
only.
> -        * SWAPPINESS_ANON_ONLY is set only on the proactive reclaim path=
, so
> -        * warn if it shows up elsewhere. When anon cannot be reclaimed (=
e.g.
> -        * no swap), return 0 to skip the scan entirely, avoiding useless=
 scan
> -        * work when there is nothing eligible to reclaim.
> -        */
> -       if (swappiness =3D=3D SWAPPINESS_ANON_ONLY) {
> -               WARN_ON_ONCE(!sc->proactive);
> -               if (!can_reclaim_anon_pages(memcg, pgdat->node_id, sc))
> -                       return 0;
> -       }
>
>         lruvec_evictable_size(lruvec, swappiness, sizes);
>         evictable =3D sizes[LRU_GEN_ANON] + sizes[LRU_GEN_FILE];
> @@ -5285,6 +5271,19 @@ static bool try_to_shrink_lruvec(struct lruvec *lr=
uvec, struct scan_control *sc)
>         int swappiness =3D get_swappiness(lruvec, sc);
>         struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
>
> +       /*
> +        * Proactive reclaim initiated by userspace for anonymous memory =
only.
> +        * SWAPPINESS_ANON_ONLY is set only on the proactive reclaim path=
, so
> +        * warn if it shows up elsewhere. When anon cannot be reclaimed (=
e.g.
> +        * no swap), return 0 to skip the scan entirely, avoiding useless=
 scan
> +        * work when there is nothing eligible to reclaim.
> +        */
> +       if (swappiness =3D=3D SWAPPINESS_ANON_ONLY) {
> +               WARN_ON_ONCE(!sc->proactive);
> +               if (!can_reclaim_anon_pages(memcg, lruvec_pgdat(lruvec)->=
node_id, sc))
> +                       return false;
> +       }
> +
>         nr_to_scan =3D get_nr_to_scan(lruvec, sc, memcg, swappiness);
>         while (nr_to_scan > 0) {
>                 int delta;
> --
> 2.34.1
>

Pure code movement. Identical check, same result, earlier return.

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
