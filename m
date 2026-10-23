Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792770543;
	b=T6MqW/8INQ5vl+yUeUjx5XIz4mpHHPa0PTumy6lJTc00Y3ZYbattNIq4ltsZwf2gqIzO
	 loFUcncwN5rTwoaEuTgNxIGD6Y1TIEHcktmxj1+X/OGWqC/HDvcm5zrRGcvSvQcizf6Nv
	 2Rmnan53f5ny6Vmp0RXuen8rdqLqySg1RCHnT4wOo5ruaU4RCADdltSukfEGagyieBGww
	 lYU72+rIVBDpoq5pyCJq4aRn/13udhD8aRB7n7WqCmraMmog0ljdMhrtgoVGsPWi+/7kw
	 RHoPK+OODNk9LJ/+EBix2bKs6MHMlRIC2FVfCAfCdUkZIDzU0gK4hGuIa/p3x5c/QOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792770543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=60Xs15W9jQQ2oWcJEMPCLV3YnsgNH1/hIQ/HS3LOjiI=;
	b=sxDt1H5rekd6l14JjcTbOh++07ZV88XTKO2wCR8Xb3RsCvZfUW5jaeI387iHIiDVoGIl
	 M15CueeIlGXd8JvaoVRWRdcZBVjPTP1xD/8opvQ7/oUw/aMtCgn3vVRSo0/0tbvdrugED
	 5ltDt8nDysz9i/9tlDR1DqUyuJAP8UtXaodKzLCNZHS/yMiXAQRwY/+tfNBFd0XeVQuuW
	 ibFvphzuUUA6LDAXKccPlR/XoT9xTsLLnbDszeeVr3VXjG6NaAa2fZ/IQ+eqQl30MTyvr
	 Y9Fcl0Rq7bbOVWNrcoD9ItHm1Mlj+K/yXVxjXTfayAohzj7rVoW8CszZ0CcvtY4uAKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XGD6UvWX;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A16606A338
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:49:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6A16606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XGD6UvWX
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a05b210703so532630b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792770542; x=1793375342; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=60Xs15W9jQQ2oWcJEMPCLV3YnsgNH1/hIQ/HS3LOjiI=;
        b=XGD6UvWXxifq9S1XOEE05GyMGXg4B3IUDQzD7to/TAOkeLd4rCov112YIO2g9IHwaY
         9Ppbqaa3EDp0qaDBTjWj0qDxFK//F3JPLHhCqNCvguu8rDs1PZd0zHB8vzenMBwaDoW/
         X3jaVLUB7R6JK9l++9xRNnvjI+T9yn1QyYBD1K4pJRgfUMfBNmmtm4OnqRrYTr+Pwzhg
         Wrk9g4gymtEF5SQMBbQP8pa2KkCw/oExRPtb0lfaa6G3EW9Md/5JMR5FtM4RmHzFR8jL
         HJr7VIIKlb+E/h3qjD1YKqkjyXmzZ3pPf111/3DhzTSc61SGNLqC41n8Uxq4W0LIWd4w
         34dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792770542; x=1793375342;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=60Xs15W9jQQ2oWcJEMPCLV3YnsgNH1/hIQ/HS3LOjiI=;
        b=zLbWAMYX1iG/1dxeYk3Ze8rb1/SAnXn4q5a9Hsrm9RpNhLLunYf9uuwoF+vFYXE1VZ
         9+BPCWr5c+s8DWt3FZGIog1DS4m2Ri1cNJMXV6sna6j4hSuKXpjrPob2Wdt+Y2jROmIr
         5fHqVew629kgUXPzC2ulFYCIbINJNZ0Sf687p6WNNdukso8xGQK92lCBDvgifhcRtsiz
         bNrkS5HFUHFDi1SBKVEMDKZXk7clquaEPjQ7LV6dYrdG4rirtRS5IqwFrNKCvAUB9+pJ
         orWY3O5FEVMKg+o950gIPnioZfzFITkR4KvHO4pOXPiNOj1YqLO7XDk6IaT0LDeVStWo
         C/IA==
X-Forwarded-Encrypted: i=1; AKwUvBwxAIHvKy04Lx3UXeoLukybhMZs4yTWdNyQX0YBgwt2pN8uBxEFOvEIoDsD2I66wdVeTQhsUlU0sn7Rg3o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQzin9nWeUC2Q1U3GDYdJJx4Mte1zOwIPEImLu9lpjbunyd9jU
	HjmxZemTW1YeHJiC3w5kHRVyQUtp8g5ZRoxSomuuBLviJ57OpfwvkvOt
X-Gm-Gg: AYBFou2NJsH/AXWRcDsmxhbQQew0lWC7zvtjYCCYNWUXwF+U62iWSeF7k6MHuE50iBm
	NymIsePUumPZkXCXc95aMWDRQjR+MOQ/DMt75jnrVBUEWsFVYosMJ7tXSMFmfaI4W+0L6A7WQXj
	d9s4W80vu3RkrcCOrUkGT/pP3tZPL8f668YrSH5xYj2+LfSoriMHFfbdp6ll8GAs+we46f5/OTg
	UmFs5v5NYZiLdYHCgOvW2nwgjDtyVNDVgnrYBltZQvrr/Gs4cG6z3cGHXHc5l+scQW8Eo69Q6jO
	aLHKn+x4GnEGNKgfaODOm3It+WXNEDcsBgWlYfO1hlcmWOYVl7ND1vEnSiKvoXB/KSRXOJ2K/49
	HkbwJBXkPtK7srBkjXVDwWB1Tnu8XeKc/Xp/ZdA1clVTEWt+2pnGCY5uu7MX+s+J8zm2mWy+nCT
	iMJlOh/kp7a8lRvh6EzimszJmkMbaK/Qdc89zu6qGxHQHIgWjadt/YJo6squfG8PjhYvPyTBqmO
	+9VUdZS+BuFhjA/3rNWDIhI2i01GVpWs9hgBU9MeqK8D+sdkqHvZhpD7RISG5lpM1VNz+WooOBE
	OmVen9X39MSemezhlA==
X-Received: by 2002:a05:6a00:3e23:b0:8a0:5dd9:7983 with SMTP id d2e1a72fcca58-8a2c626dc87mr2265345b3a.12.1792770541818;
        Fri, 23 Oct 2026 08:49:01 -0700 (PDT)
Received: from gmail.com (deskosmtp.auranext.com. [195.134.167.217])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a338ef4903sm149223b3a.26.2026.10.23.08.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:49:01 -0700 (PDT)
Date: Fri, 23 Oct 2026 17:48:48 +0200
From: Mahe Tardy <mahe.tardy@gmail.com>
To: Feng Yang <yangfeng59949@163.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev,
	song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
	emil@etsalapatis.com, ihor.solodrai@linux.dev, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next] bpf: Fix out-of-bounds btf->types write for
 split BTF
Message-ID: <atuB4OmqU8CsyDDq@gmail.com>
References: <20261023063133.563998-1-yangfeng59949@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023063133.563998-1-yangfeng59949@163.com>

On Fri, Oct 23, 2026 at 02:31:33PM +0800, Feng Yang wrote:
> From: Feng Yang <yangfeng@kylinos.cn>
> 
> btf_add_type() bounds the btf->types array by BTF_MAX_TYPE, but for a
> split BTF the type ids it registers are start_id .. start_id +
> nr_types - 1, so what is actually left of the id space is
> BTF_MAX_TYPE - start_id.  Two things follow from that:
> 
>  - the limit check is an equality test,
>    'start_id + btf->types_size == BTF_MAX_TYPE'.  It is evaluated only
>    when the array has to grow, with btf->types_size == btf->nr_types,
>    and the growth (T' = min(BTF_MAX_TYPE, T + max(T / 4, 16)), starting
>    from 0) is clamped to BTF_MAX_TYPE, which it lands on exactly (...,
>    928143, then min(BTF_MAX_TYPE, 1160178)).  So unless
>    BTF_MAX_TYPE - start_id is one of the 48 sizes that sequence hits,
>    the check does not fire for a split BTF at all;
> 
>  - new_size is clamped to BTF_MAX_TYPE instead of
>    BTF_MAX_TYPE - start_id, so the array can still grow to
>    BTF_MAX_TYPE entries even though only BTF_MAX_TYPE - start_id type
>    ids exist.
> 
> As a result nr_types can reach BTF_MAX_TYPE for a split BTF while its
> type ids have already gone past BTF_MAX_TYPE; a type never validates its
> own id, only the ids it references (btf_ref_type_check_meta()).  At that
> point btf->types_size == btf->nr_types == BTF_MAX_TYPE and the growth
> branch computes the same size again: it allocates a fresh BTF_MAX_TYPE
> entry array, copies the entries, and the loop is left with
> btf->types_size != btf->nr_types, so that branch is not taken anymore.
> Every type after this writes btf->types[btf->nr_types++] past the end of
> the array: BTF_MAX_TYPE * 8 == 8388600 bytes are requested, so the first
> such write lands in the 8 byte rounding slack of the 8MB allocation, and
> each further type writes another 8 bytes beyond it.
> 
> Fix both by bounding the array with BTF_MAX_TYPE - start_id and by
> turning the equality check into a '>=' one, so that the array stops
> exactly where the id space ends. Base BTF behavior (start_id ==
> 0) is unchanged.
> 
> Fixes: 951bb64621b8 ("bpf: Add in-kernel split BTF support")
> Signed-off-by: Feng Yang <yangfeng@kylinos.cn>

Reviewed-by: Mahe Tardy <mahe.tardy@gmail.com>

Indeed taking toy BTF_MAX_TYPE = 10 and start_id = 2 we can see the
array can grow from 0 to 10 directly, get filled, enter the growth
branch then the condition is for E2BIG is 2 + 10 which is already beyond
10 and thus never match: we re-allocate the array, copy and write out of
bounds. Fix looks reasonable to me (but disclaimer I just read that code
for the first time).

> ---
>  kernel/bpf/btf.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
> index 80b6f96263f1..6e54cd6c2eb5 100644
> --- a/kernel/bpf/btf.c
> +++ b/kernel/bpf/btf.c
> @@ -1724,15 +1724,17 @@ static int btf_add_type(struct btf_verifier_env *env, struct btf_type *t)
>  		/* Expand 'types' array */
>  
>  		struct btf_type **new_types;
> -		u32 expand_by, new_size;
> +		u32 expand_by, new_size, max_size;
>  
> -		if (btf->start_id + btf->types_size == BTF_MAX_TYPE) {
> +		if (btf->start_id >= BTF_MAX_TYPE ||
> +		    btf->start_id + btf->types_size >= BTF_MAX_TYPE) {
>  			btf_verifier_log(env, "Exceeded max num of types");
>  			return -E2BIG;
>  		}
>  
> +		max_size = BTF_MAX_TYPE - btf->start_id;
>  		expand_by = max_t(u32, btf->types_size >> 2, 16);
> -		new_size = min_t(u32, BTF_MAX_TYPE,
> +		new_size = min_t(u32, max_size,
>  				 btf->types_size + expand_by);
>  
>  		new_types = kvzalloc_objs(*new_types, new_size,
> -- 
> 2.25.1
> 
