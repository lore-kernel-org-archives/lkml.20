Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAF1486B81
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 17:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788282636; cv=none; b=SZL8z0yqIJGLgdyPnq89OfT9YaN39tNqCwkD3vOc+8URLGoM/qG0GvwVacWbS/OyEIyXh6uMpMKjiufjtHbfwRkLbOLNszRCxD8qDGVSV/0a4T3sF4n26D8+zI9I01LZQas/sZMehDV/tqUQj1WVFLekWNVuEqGpTyVHpZCxVB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788282636; c=relaxed/simple;
	bh=1EyrdpqjQqyHh3jE/lmR28NrAqL4wgfNCNPQ9Exz81s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nmvB6wlDFaiyHQp8Eo2vOJr/FbRh7CSUO0sm9qlRy/kzRhgOiox/zEBbIL+iwphayNtIIKWvY7Q3FU6ZJtak67RKxSs0oZPRnHb2FJ6ZCqmy1Y1HcAEhcYVTQkEaoZ+Y4iX3/9dp5u2QUI0GjXV0gk8CpIrnadFg2hEmgXHDgXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JuAOv1j3; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JuAOv1j3"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b8be0409fso16045e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 10:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788282632; x=1788887432; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LO/tmfF2ANZjALAcTnvQI6CixtWn0Z9DWifGrRqbIBE=;
        b=JuAOv1j3A2Ei5qSmq7jygNBBv/O5nVrGad7n4lPxqHS6MOCeArBQ0n4HKnfFo4ED7u
         rcORWhDpQJ9X7oQH/jNPU9bWsz3lPDnSDqLAEJMl0/MKidgfoIFu7CgeSZ6w3SzmO9nC
         wUg5ZGPWntSWQcxMwH5DnyoPyS6bdJTu/0KaoeVtaO17crQI3Y5ocpUIEpdFQWuyBz1q
         45dogb7TKCt52OZeQMwr6RCuDvDBgi4HLkI4LV1jwSzntl/TX9SDP49idwQn0kDMFt26
         9diPeu/ALWt2llXChvwU8abClOKmfo6q4ZYGXEHKjx1LLWRJHFV5TCMWKsFpmCl/N6fK
         mcmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788282632; x=1788887432;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LO/tmfF2ANZjALAcTnvQI6CixtWn0Z9DWifGrRqbIBE=;
        b=AJOeQ6yg+BAGVUwWN6D5+kRn6GoqIDW2YvD8N5P86An7Ib8AbpSEapvWYubjreYrQ0
         HqszPj2XoW/eldyWMuWvX+TssuRxE3Ao0X+WFcCyP7J2fV0XOue92CmHeJ+jywqfr8pR
         5zQMAJKlpBNObKFdO0fBBShojXHVSyKKS8vNwmzhhxlWdIh9A0AsdR7hF+87mxwO60m/
         6pnEN863fTbwLl16Y+8r9AdI9Ee0tjqp39nYPtxuzQodoGMkKRjzbPjGUGj9AgXDXg1m
         oRNSGR7e4SwwRCacaNc3QGsbgWoW0h7et7DxV22L53U35KSQV79hLElvmkrTLB6UrHSV
         ulCQ==
X-Gm-Message-State: AFuF++nG+1Q1z63IHzihvUbcJ70sfAqBVRRQOtkhbK8+7m1HIHARpqSf
	Fz9ewEjug534tnu5Z3ZUFVTgB4MlCCXfAQl6UVZw0KpIQK1gpdUdRQ18
X-Gm-Gg: AR+sD11jNBFmxBMON5JZcC0b0q2JkzAvrH8ipqQPDuZwI7Ao7uq8c/sSp5ofkWM0zP2
	zQjtVHkT+YVfsEtWIQnFyP1M3hpdMrDYj+KWYrGQIyJ0bTawV887Dp5UkdJ22FWrJR62hcEUNJq
	9+fySaxLx6koACLfK+ZnEZw3yEknXXbhv3USEAHjXcu5mDejXI/pEAEloCTpKqOyhGgyZyF35RB
	8e20o86Lb7jGPDi26vceTQ+Q5aDN1zgW0iTf/8slExUYL3JsPX1VK/cf8jRi0KaUGaKBJG7MHbu
	Q/bui2WuXl7Uft+ODbgItq8G0JcgJRivPE4+UDPdUKmmRcxPu31uIe812zVLx3Lg2iM1reLDj8X
	xS93c3WTQl1CMd5jnFtn6g10OQoGVTiujdW+ECezd3MX6+SU5Sm3k1f/HTLPrwqRhYhE2ETvP33
	2Ozf2/ix25aT8KPQWViaJ0btgynnY8TuLxVkXGv5rCfhXxTsqFpZLaNDhoY7Y2IZZKOVtPjNRyI
	nI1ttkFDE4x4lopd4Bh/Wlrzw==
X-Received: by 2002:a05:600c:5288:b0:499:84fe:5f3e with SMTP id 5b1f17b1804b1-49b91c41014mr633455335e9.9.1788282632123;
        Tue, 01 Sep 2026 10:10:32 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:f403:a537:85fc:d569? ([2620:10d:c092:500::6:3965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4780f0dsm303135e9.12.2026.09.01.10.10.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 10:10:31 -0700 (PDT)
Message-ID: <ff4637bd-4919-4532-a416-fd98e2abf747@gmail.com>
Date: Tue, 1 Sep 2026 18:10:30 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 2/4] bpf: Fix use-after-free of program BTF in
 mem-alloc destructor
To: chenyuan_fl@163.com, bpf@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>,
 Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>, Yuan Chen <chenyuan@kylinos.cn>
References: <0560a24d-2cf9-4e5b-aa61-580af1e56de1@gmail.com>
 <20260901062845.1379760-1-chenyuan_fl@163.com>
 <20260901062845.1379760-3-chenyuan_fl@163.com>
Content-Language: en-US
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
In-Reply-To: <20260901062845.1379760-3-chenyuan_fl@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/1/26 7:28 AM, chenyuan_fl@163.com wrote:
> From: Yuan Chen <chenyuan@kylinos.cn>
> 
> bpf_ma_set_dtor() duplicates the map's btf_record for the bpf_mem_alloc
> destructor. btf_record_dup() only borrows the BTF references held by
> the fields: kptrs and list_head/rb_root fields point at the program
> BTF, whose lifetime is independent of the map. The duplicated record is
> used from the deferred mem-alloc destructor workqueue, which can run
> after the program BTF is gone (bpf_map_free() drops the map's
> reference, and the RCU callback may run first). Reading the borrowed
> descriptors there is a use-after-free, detected by KASAN as
> "slab-use-after-free in btf_is_kernel".
> 
> Keep a reference on the borrowed program BTFs for the lifetime of the
> duplicated record. The record is freed from a preemptible worker, so
> the last btf_put() (which only schedules RCU destruction) does not make
> the field descriptors safe to read; snapshot the borrowed BTFs, free
> the record, then drop the references.
> 
> The rhtab kptr selftests exercise this path on every map teardown and
> triggered the bug under KASAN; with this fix they pass cleanly.

Does htab trigger the same kasan?

> 
> Fixes: 1df97a7453ee ("bpf: Register dtor for freeing special fields")
> Signed-off-by: Yuan Chen <chenyuan@kylinos.cn>
> ---
>  kernel/bpf/hashtab.c | 66 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
> diff --git a/kernel/bpf/hashtab.c b/kernel/bpf/hashtab.c
> index aaedda3730f3..30bcc573772e 100644
> --- a/kernel/bpf/hashtab.c
> +++ b/kernel/bpf/hashtab.c
> @@ -493,11 +493,76 @@ static void htab_pcpu_mem_dtor(void *obj, void *ctx)
>  		bpf_obj_free_fields(hrec->record, per_cpu_ptr(pptr, cpu));
>  }
>  
> +/*
> + * The duplicated record borrows program BTFs, but is freed from a deferred
> + * workqueue that may run after the program BTF is gone. Hold a reference for
> + * the record's lifetime and snapshot the borrowed BTFs, since
> + * btf_record_free() frees the record.
> + */
> +
> +/* Program BTF borrowed by the field, or NULL. */
> +static struct btf *htab_field_borrowed_btf(const struct btf_field *field)
> +{
> +	struct btf *btf = NULL;
> +
> +	switch (field->type) {
> +	case BPF_KPTR_UNREF:
> +	case BPF_KPTR_REF:
> +	case BPF_KPTR_PERCPU:
> +	case BPF_UPTR:
> +		btf = field->kptr.btf;
> +		break;
> +	case BPF_LIST_HEAD:
> +	case BPF_RB_ROOT:
> +		btf = field->graph_root.btf;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	if (btf && !btf_is_kernel(btf))
> +		return btf;
> +	return NULL;
> +}
> +
> +/* Snapshot the program BTFs @rec borrows into @btfs; returns their count. */
> +static int htab_record_prog_btfs_snapshot(struct btf_record *rec,
> +					  struct btf **btfs)
> +{
> +	int i, n = 0;
> +
> +	if (IS_ERR_OR_NULL(rec))
> +		return 0;
> +
> +	for (i = 0; i < rec->cnt; i++) {
> +		struct btf *btf = htab_field_borrowed_btf(&rec->fields[i]);
> +
> +		if (btf)
> +			btfs[n++] = btf;
> +	}
> +	return n;
> +}
> +
> +static void htab_record_prog_btf_get(struct btf_record *rec)
> +{
> +	struct btf *btfs[BTF_FIELDS_MAX];

it looks like temporary array and htab_record_prog_btfs_snapshot()
are unnecessary:

for (i = 0; i < rec->cnt; i++) {
        struct btf *btf = htab_field_borrowed_btf(&rec->fields[i]);

        if (btf)
	        btf_get(btf);
}

> +	int i, n;
> +
> +	n = htab_record_prog_btfs_snapshot(rec, btfs);
> +	for (i = 0; i < n; i++)
> +		btf_get(btfs[i]);
> +}
> +
>  static void htab_dtor_ctx_free(void *ctx)
>  {
>  	struct htab_btf_record *hrec = ctx;
> +	struct btf *btfs[BTF_FIELDS_MAX];
> +	int i, n;
>  
> +	n = htab_record_prog_btfs_snapshot(hrec->record, btfs);
>  	btf_record_free(hrec->record);
> +	for (i = 0; i < n; i++)
> +		btf_put(btfs[i]);
>  	kfree(ctx);
>  }
>  
> @@ -521,6 +586,7 @@ static int bpf_ma_set_dtor(struct bpf_map *map, struct bpf_mem_alloc *ma,
>  		kfree(hrec);
>  		return err;
>  	}
> +	htab_record_prog_btf_get(hrec->record);
>  	bpf_mem_alloc_set_dtor(ma, dtor, htab_dtor_ctx_free, hrec);
>  	return 0;
>  }

