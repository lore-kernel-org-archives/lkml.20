Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793195848;
	b=KicgNeqYqCo1vbzoUtfMySSA3uYsCLK1vUdCfUlF7KvmfyRZE/MrV5ilDboyu6+Vy9bm
	 3rt8A8A58ppekDYMMdDuzou+ESvg9MGxvCfF1p+hPc7Aqueo74lr+MPYx1aSeljZ5T5bC
	 XVIbM7dHEspznLpP8yKRalGAEQysaHMGbWwZITSgbpLMI5aOzOl0zwR66eVbuoMjqKqVZ
	 BdgKydeX263a1w65m7FcA0YrIC3DJ927zQM36IFt4BjP/cLmHIN2DoCCk7/Yt8QtPzumi
	 b/6u4l9BOdChVyFNrgjUBbrkVHDe/JXX+PHlzGSuUPb+xpKxwmpPXeRu9nBsl83RKtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=N6jb7B/1j7cEHHeX+fTV0XB71j0TCm943LKPkVSn0vE=;
	b=SEZKsAW5+B0VNZC40yoDdW0QmRJJkFX0bPnk/SxfCi1K+DMMYGhWqz2GhChM7is+ifqb
	 PJW7731Hc0WV7LjMXsbphclNEIu+PxNHW+uDIVsq202UgYdwJ4NlA2VrJ9CyIj2y99uFq
	 KAebBmPpZVg9CJJs5uNP7dMjPVU1eaefFs4ETDNEJMysjHzW+fZaQO1dmcusIbZyI5LuU
	 SNcyguMYx0xAeCpzbZwacdE9nQ0jx5f4X/au8w/BW095TC3fMoTX5QHJk1H9hdgvEV9xL
	 Lcn18LMoax6LiJTsTh/oM3YXfZBJ5bs1hKsYXWBPMFawHIbyPk7db1BYjdjLKn8cKWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bPl8YJty;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E4D606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05E4D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bPl8YJty
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b45f9ec1ceso1283643a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:57:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793195846; cv=none;
        d=google.com; s=arc-20260327;
        b=QYnhJ19EEMiukIp7mgnz89dRRnK4wuGkqKOb8fZx6f92SexQDwv7G7m++cBim8/kqv
         vi2s4vO43FHMrs6CyyS9ewchwRgpZUxqbzDfYc89RWYbmbm1Bq7qvwDzjA/jtpmNGMab
         7S9IiNfIxfxEtnRLZq5/3SjCnxtamUGlhcKamghC6g3uCpaK5kZPvCXDcfQVq4i181yy
         EFaAGo458NRvuc7KoVllcBaDBxzYjICogNzt0o/f9Nw9b6qpaLSEDRUIXEaGWSlm6Sig
         Ohc2Rsz7J3p4N987Ryb8u8Dfx7Xan/1hTJUDskyh8a0YlWSSATQGzoK11WF/vHN3TPBS
         I4FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N6jb7B/1j7cEHHeX+fTV0XB71j0TCm943LKPkVSn0vE=;
        fh=LU3MjwV8nu2ypXhOfMSKnzolFCCIW8AAmiPx+Wqdx+U=;
        b=Vl22biu2jqnNZelNEoGju4je18vqy0oP+Id6nOfefovOUp6ajdj4NrYpG3AHwhS1ri
         uAu0/eDtcyE1D/0XcGIl3tNfguWRCag0iqrlq8k1Ca6sGyaIa0Ijg+2RNdN33iv+4Hah
         trEy0w5+CllIqsd+OQuxA6NSY4MAuPVSRTYlW/c7lDOLv3ch+Spg/ifCLk2kzsqCQjWz
         JiPD4oNmGUJ0ZcfSn2h0rkNmGaHISd3ud1ldBdvGGJAe9wWDcGUxP09CPoiSfgrpihof
         lk6FFHx6yI3bB9obw9z+cCOxjWmSanuTq1wVGiRgdd0CsiM8qJKMuWUl8MrQQp3C6CUR
         WN9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793195846; x=1793800646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N6jb7B/1j7cEHHeX+fTV0XB71j0TCm943LKPkVSn0vE=;
        b=bPl8YJty3EY6Wq7xeQgJ/geL6+J4EUyouDm9pdGsaRIgaydTnJiSqkk3OxnMM6vqeQ
         lUCyiQuit6WGJft5ZEC/S67eUEZW4J1gjq3ukktVQhf4xmXj90ODyrglOzm/fUDMOGmb
         36FUShq9IbcRdCNiNYxPobOCIoDYU0Mr5/TVh+Lne6yJoq0TXVTdD4bgSAaMXNBHG/br
         UQhE7Z7v9vkLwVIEz812u7DrEW90ft/4MzudqaM05osee33jfQwNJqorR2hg5rkb/hUf
         yLncoAdQllZ475HveMnJ7uaHPH3V6Kz1S6ug7R3yQhs5B01p+fBKRsU7GOYb+QtsRn4j
         /Vlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793195846; x=1793800646;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N6jb7B/1j7cEHHeX+fTV0XB71j0TCm943LKPkVSn0vE=;
        b=J9gDUjswjnpIKC6N0yGYRk+6Xxkfg8o+XJZ0aADSJRviAH6fnNuh9l+sMVedvlMRG0
         9T6ul+sLZHJC8625QHbHdtkCEWFDQhbL1p/FBhSg94PK7t1lmdWQlMuQ4O8RX6Ov3Oj4
         t1a2M0m6tbAFYYgd984xlw6VdKgFJPqZzBHD+ugqLW4atYoNX67fyWNtv7rzYJQ175fw
         v0nOetbPpsH9hk3qJTs/dJhi8b0mGIn/kGXuBdtcSU4jmUSnK8M2Hnf/mAota1mMvxFw
         f+yyQ7F8KC0d62JYBRcmnP+7W5xq2OzGszHRHZMoXTymIdtV0rNg3Y9bfjLrONU+ZLhK
         2ErQ==
X-Forwarded-Encrypted: i=1; AKwUvByYURBg08o0KG1qpfQ5yCSsPG1CWLYAA7ZCZaxxeH8fj/gTweZ55fsYpE9YWFNsLI28+AAj+RXzLkwnNKg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJS/K3D8nUKcHmeWRnXEiIkebJoDSEUWzsmakWJc9yttW+ytgNH
	ctyAhTjX3SkcSvngIQUtVVkJBn803cyG0ArAyB8EZhE2P58a0L3QTSvQd8lY3yb4SclBZtnArNm
	DU7NJ1if/qq/cCxM+KY0QxBt8kwLzHwU=
X-Gm-Gg: AYBFou20VGjn6UX8YeeFxG/SczB6GhFaeG5cuQ+O1EqlpKto+I2Vw6PTyisbSE1cMBv
	Iuttf/fiK3XXBxPrDfaQ6w9strYBvcQjO1y/DMyssrFpf7yMJ5iR6MmNIYRX1dw3n5DUvaFIq94
	sdfLF1C41kVoyA+G/vAqHRh1kL0uuaavQ/HsnCYa4RZqD3lLmrNZ51LOhnPbzIlrjhGzRuVKfKH
	IXTTAbufZDyxCpyl91gUvSLJ6/+PgPwjvm2gpt52PWSDVfwkTmJliYb5d9kwkUOsIoN8AhQ3X7+
	bgiS9I1ApT62Bbegaz+vsv+0/4nNxLbkdF+2zvWSCCJEabNtX6FR+0MzUQ6ZFQ7ajuJrqFmu9gu
	fSp9ZPtFE2W44/Kr77MwKYhYx+TKMJDoNmgmWbUFPHAxHW3ffxduRU+XDutOBt84laa/LNg==
X-Received: by 2002:a17:907:980c:b0:c41:cf68:bbcf with SMTP id
 a640c23a62f3a-c49bdf2c81emr204613066b.32.1793195846170; Wed, 28 Oct 2026
 06:57:26 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-fix-mglru-kswapd-age-v1-1-b1ffdec4ae52@tencent.com>
In-Reply-To: <20261027-fix-mglru-kswapd-age-v1-1-b1ffdec4ae52@tencent.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Wed, 28 Oct 2026 21:56:48 +0800
X-Gm-Features: AclHuK8y7VKQBWVhXVH-qtsChj_MIThWMcMwlYaDr56F0maa3oCruvc7sukFQ_c
Message-ID: <CAMgjq7CcSxNMx9UxVjjM=W11fhd8sh3PgkHKt2kvdah3fy6kXg@mail.gmail.com>
Subject: Re: [PATCH] mm/mglru: skip oom killing for high order allocs in kswapd
To: bingfangguo@tencent.com
Cc: Andrew Morton <akpm@linux-foundation.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Yu Zhao <yuzhao@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 10:21=E2=80=AFAM Bingfang Guo via B4 Relay
<devnull+bingfangguo.tencent.com@kernel.org> wrote:
>
> From: Bingfang Guo <bingfangguo@tencent.com>
>
> We observed that when MGLRU min_ttl is set and the system is highly
> fragmented, high order allocations (e.g. order =3D=3D 9) will fail and wa=
ke
> up kswapd. It can not make any progress, while pushing generations of
> memcgs so that they all end up younger than min_ttl_ms, repeatedly
> triggering the OOM killer in lru_gen_age_node(). Then the whole process
> repeats until all processes are killed and the kernel panics.
>
> Fix this by skipping OOM killer invocations in lru_gen_age_node() for
> sc->order > PAGE_ALLOC_COSTLY_ORDER, which is also what the normal
> allocation path will do, to fail high order allocations without OOM
> killing.
>
> =3D=3D=3D=3D Testing =3D=3D=3D=3D
>
> Tested on a VM with 6 cores and 6GiB of memory, HZ=3D1000, MGLRU enabled,
> min_ttl_ms set to 1000, and a workload that fragments the memory then
> allocates 2M pages.
>
> Without the patch, kswapd kills all processes and panics the system even
> with plenty of memory available. With the patch, allocations fail but
> the system remains stable.
>
> Fixes: 30d77b7eef019 ("mm/mglru: fix ineffective protection calculation")
> Signed-off-by: Bingfang Guo <bingfangguo@tencent.com>
> ---
>  mm/vmscan.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Thanks! Really nice catch.

> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 9959ca158ce83..b32777468ead8 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -4407,6 +4407,12 @@ static void lru_gen_age_node(struct pglist_data *p=
gdat, struct scan_control *sc)
>                         reclaimable =3D lruvec_is_reclaimable(lruvec, sc,=
 min_ttl);
>         } while ((memcg =3D mem_cgroup_iter(NULL, memcg, NULL)));
>
> +       /*
> +        * OOM killing won't help high order allocations. Skip and let th=
em fail.

A nit pick, OOM definately helps for high order allocations :-D, maybe
something like, the OOM kill is to prevent thrashing whtn all memcgs
are younger than min_ttl (and maybe merge with the comment & check
below?), so OOM for fragmentation is definitely unwanted.

> +        */
> +       if (sc->order > PAGE_ALLOC_COSTLY_ORDER)
> +               return;
> +
>         /*
>          * The main goal is to OOM kill if every generation from all memc=
gs is
>          * younger than min_ttl. However, another possibility is all memc=
gs are

This patch is good to me on its own with a nit fix above.

And checking commit 30d77b7eef019, you might need a Fixes: or maybe
even bring the check back which was removed in that commit?

But for long term, and as a follow up, the whole idea of OOM in kswapd
seems kind of wrong, maybe at least it need to check the water mark
here?
