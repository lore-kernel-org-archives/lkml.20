Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794420857;
	b=TM6+dmcH0d72lpb8y0RjX9H8Wbo7ACxycPZ0NyU+fy5RVW2nhLR1+88pmvHaTMd724uI
	 l1+V+1+7oEv0kpsYEtoGbHSzlfXVD5iZzi0YwB1JzsD8bIzJTbQXx8aiW+UK10aC1SPSu
	 Wa7MIP1EgzEx35b6MrWawDfXrMpOQVyfK/2ndzeMHhwU5184MI2vZ6K6XCsyQkSNSTImN
	 ehWeWCSHEpvs3M4DhH9CROmlNOdzq065AkMF+DbcddizGv+sytsg8daugK7tKtK91eEzG
	 x31XzVbOz5/DrW6LphJDeJTUpoTjWeYNdTGp+n+VdVnyiSQjpHX3Hevv1LWxxA38lOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=u/plPOsLmxcLve8ez+d90RlH8s4a6+KgPsXYYRGMH+s=;
	b=KV2sljX5Ir0BR6x740A5GcaOAZUQ+CeESJ/8UvvCCwIc9aN0hWBDLyxsfVgKYhnxvKBO
	 7d92CKpLZUh6zlpRE+m5TN3myQ9uAKZhVLx+jiQJE+hoxJic0ZycG1r9MEd1/VVctP39C
	 4aAIETE4jOR6XOfLWvwI3/uUveleKd7o1bvboSlhNfXrLGb5VUq+Laf2a6M7X+ReXbL/p
	 Wa0sztuOwdHL5i9Z7VqdgoOIpsyoV4jjnW+0QLR2rk0ciAfnfSjX8XgRPeTum1Uaqb7Di
	 G9xT+fqUGYngX7vdafgZghr9n1UxzgT/f8wQpeh+wOiE79pZY9Sa3TwmB4GHD4kTbWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gK3Ktt7u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F9B606A883
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00F9B606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gK3Ktt7u
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b56bbf8330so4425667a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:14:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794420855; cv=none;
        d=google.com; s=arc-20260327;
        b=NP7ZDR/kqrooPKkdmJzhZfToDXPuOP+EWCd9nqkhJcrxEVsw/YmT/Z2AQUS++eZu3E
         ikowpBfnGY2H39an9HII/QFpSIhZWdpaaHE44Z4CeWBfyNX0VbuFbSevfR79rE3Bc1ME
         TPApYeLqHd4NQNGzzJ0+bZHJxeQn1j6vEqRtSt6YUtrmiexdn/0ZlYjutta6rrnEDNeB
         sIVrmKK+sM03uzrtYt6s3IDV9dM4G5mUBfkv9W3KhAEVR9i3eFU9cbuHRD8DIlz5Fr1H
         xzobbeap42961UuwEqEVm6kdLhDFti9Whq3zOMRTtQ1Cvf5EuSOLj6sO2AhjBlpsYnfi
         zXTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u/plPOsLmxcLve8ez+d90RlH8s4a6+KgPsXYYRGMH+s=;
        fh=rqLuus3brmmYbLaSY6w62QkEgpVTZCAW2jpdi0IJiVY=;
        b=UPj/ek0Zp5tufxuelxuBxf6E2wTwojWCbK/zqpharWN2BUhSO6+xDvtWD13Hyt+PdU
         7z3lAyGHlz3AuAX6PtwtNWWYedFRcDVlGe47Il83GzP/5qvbmWPz5oP1pEzNnv3v2Csz
         6SvmAbKj6liuzwRkOLYGI1nX6XxQAPSzqvgQTGXoluDANDPBGmapXPOMw3Z8WVs1ozqk
         J03vgapA2GU99uMonqP3jvYakvOP4raSSR59wtmm7WPvV/V36mo5SyJ8Ozwns4T4EIgC
         WJLVUmB6eXU51+tqydbD8tJtzzYNBh1jn/bLCxJ7OsSKlqr8f72X+woZqGMIUZj+tYVT
         sjNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794420855; x=1795025655; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u/plPOsLmxcLve8ez+d90RlH8s4a6+KgPsXYYRGMH+s=;
        b=gK3Ktt7uO48sW2HgQ0sVF9ZavycJxcbvaivLmHcWQulOKR0K+srmmhX0wrZ7nRBmRa
         QoFZ8MoNmA2K+OPj7Vp/gk683cYhzgQhGkxGXWkIk9U5lxsLcrvcgbF16iKFYlJhtLUP
         EYagIys/GjeF/5rBRMry/hZGaW87hXgjPbZlgYQfMhr70TSnSll553qcRhgEo7JH9ITI
         HVNtK0HAl/YlKDhN+5Pb94TLqbEjvyimuxozA66PEoXg6IuhLOeKB3NjOAYRx1Pm3x0J
         kIuL8HfSuEoQgBdDFTJTIIFkx+ySUshUusQ2esQ0fjviccCV80pg0SJsrkbz4cCKqIFP
         5ZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794420855; x=1795025655;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u/plPOsLmxcLve8ez+d90RlH8s4a6+KgPsXYYRGMH+s=;
        b=ttblW9LAXMSUN3bB4uuodRuJiPCpNhtWeA1HFUAjUfChSr8T5LarQmXdoa2CW/5bgX
         8LD9z+mij9REmA6KkZzl2pQIbX6sbd868zDzXjYIpp9wEp68TpFuIKHD2dYLtVKoGshI
         oi1+P/UPjL9xQDffIKfPoOxEd/BLnxvYKU8/ohJ2Ie0+Zv6lYosgKF9Gs8xe6uXQjojb
         RS1ezeSpqt9Hnnq2NjsxrBLpT+nUZnoj3SDLDJFm2PRKuVRIdvbiTFU/9ZYizPKhOrXC
         vdGod+QwSW7eZjFEIhk2pfOTE2+NXdfezESmpb1vuGZmACItRJwtVDZ9VAlzLkfSw3x1
         aldA==
X-Forwarded-Encrypted: i=1; AL+hErEF3IuG1H4qxEt/BKYWqA416x9tC+9PRDKSJBb4oI5bS6HX6G9HQ30KsAb73nWp+RlP2iULySXKAH4C51w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iEqjo/eFvoHOANp5ev+kTiRtXAOVmJzhhxGY4qPz1spnlwtD9
	Q2dAQymympbWJBLwEqwUkU7fufW5Z2V8/SGCThx7veHMWM6aSCx//tPRSWSY+66JHp73IU28Mew
	1rOzsx7lXnK6mZIbgtp0t4ZMLoUYuFLA=
X-Gm-Gg: AYBFou0ejC5qC4krLicRToVsr+aqrQNsZ6REQS9xdaKZE8vO4Semwq6ZofvJ7vJ5YD4
	qiAEaULIRS/29SuBaATlDdeKgywVhdKysk5eRIdGOd7XkYQauhYBL8kFFCNBAd8KobAy2gpb/bs
	50LAWeMt1CkhLb2II12sweA7ggIsujhb1w20f2+qzfHyGSIuPDNJNcRrnvRV2HOukx38lEPDaHb
	lApHw0SX68WE29B3mSAShaku0a2WKoPTha4w9L1Q4SgO504na6caQUrHpn90GuhK2sohLMiygds
	YM1rNS+4laWRsuKccjxlVf06Mm9/9Ge1tfeZm/ApoazWHWQP/iwQgO1kcN5KecrA0SAwEWyf4/H
	JFZGaO6p/BktZr7BalrD9qHA7UDNo7RSgrZ50Tyrzuo6o9FBm59ApmZRe3FS8+auxuSI99Q==
X-Received: by 2002:a05:6402:1247:b0:6b1:da03:d010 with SMTP id
 4fb4d7f45d1cf-6b7777178f4mr1942836a12.23.1794420855147; Wed, 11 Nov 2026
 10:14:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111000913.22943-1-shakeel.butt@linux.dev>
In-Reply-To: <20261111000913.22943-1-shakeel.butt@linux.dev>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 12 Nov 2026 02:13:38 +0800
X-Gm-Features: AclHuK8h0ELM0_haw4Gg_bsSdt3hCgaLBxy2Y7ejZe79euvCzbW_wpkEQNryCYE
Message-ID: <CAMgjq7B+PE-Tw_v3bKYzNOTaT6+0_fn8gW7sNpMwzP1tPGbDug@mail.gmail.com>
Subject: Re: [PATCH] mm: mglru: splice all generations when reparenting a memcg
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	David Hildenbrand <david@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, Barry Song <baohua@kernel.org>, 
	Meta kernel team <kernel-team@meta.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Noah Feldt <noah@feldt.systems>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 8:10=E2=80=AFAM Shakeel Butt <shakeel.butt@linux.de=
v> wrote:
>
> Noah reported list_del corruption on single-node hosts running 7.2.11,
> which already has commit bf4ade7dbd76 ("memcg: keep folio's objcg same
> as its node"). The bad pointer is an MGLRU list head in a freed
> mem_cgroup_per_node:
>
>   slab mem_cgroup_per_node start ff31bfa36a3c9e00 pointer offset 528 size=
 1920
>   list_del corruption. next->prev should be ffacf881ccc70e08, but was ff3=
1bfa36a3ca010. (next=3Dff31bfa36a3ca010)
>
> When a memcg goes offline, __lru_gen_reparent_memcg() moves its MGLRU
> lists to the parent. It moves only the generations (gens) from min_seq
> to max_seq, and it puts each list at the same index in the parent.
>
> A folio's gen in folio->flags can be ahead of the list it is on. In the
> parent, the same index can stand for an older gen, so the folio's gen
> can end up older than its list. Once the parent's min_seq passes that
> gen, sort_folio() puts the folio on the list for max_seq + 1, where it
> stays until the next aging.
>
> If the parent goes offline before that aging, the folio is not moved to
> the grandparent. It stays on the parent's list after the parent is
> freed, and the next list_del() on it touches freed memory. This needs
> two cgroups on one branch to go offline one after the other, such as a
> container and then its pod.
>
> The parent always has MAX_NR_GENS gens at this point, so every index is
> valid in it. Move all MAX_NR_GENS lists, not only the gens from min_seq
> to max_seq.
>
> A reproducer that drives these steps through the lru_gen debugfs file
> gets a KASAN use-after-free on the freed mem_cgroup_per_node without
> this patch, and no report with it.
>
> Fixes: f304652609ea ("mm: vmscan: prepare for reparenting MGLRU folios")
> Reported-by: Noah Feldt <noah@feldt.systems>
> Closes: https://lore.kernel.org/all/20261110132853.71228-1-noah@feldt.sys=
tems/
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> Cc: <stable@vger.kernel.org>
> ---
>  mm/vmscan.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 6a1af9b92349..902616a3b755 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -4751,19 +4751,25 @@ void max_lru_gen_memcg(struct mem_cgroup *memcg, =
int nid)
>   * The same generation has different meanings in the parent and child me=
mcg,
>   * so this compromise method will cause the LRU inversion problem. But a=
s the
>   * system runs, this problem will be fixed automatically.
> + *
> + * Move all MAX_NR_GENS lists, not only the gens from min_seq to max_seq=
.
> + * An earlier reparenting can leave a folio whose gen is older than the =
list
> + * it is on. Once min_seq passes that gen, sort_folio() puts the folio o=
n the
> + * list for max_seq + 1, where it stays until the next aging. If that li=
st

"sort_folio() puts the folio on the list for max_seq + 1" seems not
very accurate as MAX_NR_GENS - MIN_NR_GENS =3D=3D 2, could be any stale
gen outside [min_seq, max_seq], right?

The fix itself looks good.

> + * were skipped, the folio would stay behind on a memcg that is about to=
 be
> + * freed. The parent has MAX_NR_GENS gens here, so every index is valid =
in it.
>   */
>  static void __lru_gen_reparent_memcg(struct lruvec *child_lruvec, struct=
 lruvec *parent_lruvec,
>                                      int zone, int type)
>  {
>         struct lru_gen_folio *child_lrugen, *parent_lrugen;
>         enum lru_list lru =3D type * LRU_INACTIVE_FILE;
> -       int i;
> +       int gen;
>
>         child_lrugen =3D &child_lruvec->lrugen;
>         parent_lrugen =3D &parent_lruvec->lrugen;
>
> -       for (i =3D 0; i < get_nr_gens(child_lruvec, type); i++) {
> -               int gen =3D lru_gen_from_seq(child_lrugen->max_seq - i);
> +       for (gen =3D 0; gen < MAX_NR_GENS; gen++) {
>                 long nr_pages =3D child_lrugen->nr_pages[gen][type][zone]=
;
>                 int child_lru_active =3D lru_gen_is_active(child_lruvec, =
gen) ? LRU_ACTIVE : 0;
>                 int parent_lru_active =3D lru_gen_is_active(parent_lruvec=
, gen) ? LRU_ACTIVE : 0;
> --
> 2.51.0

As Barry mentioned this is basically the same code as a prepare commit
for MGLRU-FG, which is a fine and clean fix, I just didn't realize the
problem was already reproducible though.

Thanks!

Reviewed-by: Kairui Song <kasong@tencent.com>
