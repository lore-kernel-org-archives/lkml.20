Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E7D5038F8
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789661412; cv=none; b=SEzHWvpQB/lCiOtca2vPjldO7A2zb8KYllN+0YMHipWtoS87a71ijxSs2dPtB8kBgeEpMbp0cvTMc6/lksOVRbYZAuo/CVtmGI9NsGJ54pDnJw68CfaIgnh6FGd2Hw0UD8MOL6pSjw99PCZZ5CnGcAKTbpIEQ4RlmFJynC1Gsrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789661412; c=relaxed/simple;
	bh=El3eFx2WKoUGiyPHoRHrgvZ38tvXbwJ/GcEtCnjo+Wo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NT/FfCQc597DzBpvAZhKy9Ju6XzBh3ce2apDwiKpMyyTIAbjqC85YR1F1VVKOsZbM/W8Q/BYvj1VJnqWKN1e+TGVGusEc7Y54eZUmONW3Tvx2WxcSw98h1MDG5mKPVfSvEojAEtEDY773XgPHU/UUqcP0eIG3Fgra9kyhZ2QnVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DrCyJ16L; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DrCyJ16L"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso12607635e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789661409; x=1790266209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JCtOntWTjPZc4BpViwhdQjZl7CARnN18qaHDaorAHCY=;
        b=DrCyJ16LWoctQ7/aUuQi+uDLcrTnhYRId3nOP68Z2SbFn+agBMiK+XPWM1Uoirdgk4
         8vlxYxPsYQGb+B49A59PXoTVCcLNB0kmemcpKJHysEmeulorDCwKLft1y6W2QU2ySiRN
         HFpAZy/FeqI9nSIkPCCgaTf0GUPddMqEhYyJN4c4YLy0LtObkPn4vlBjenEBnNhadKJ0
         mu9EpZOoZe0of1Hm/XYCPh86hAc6bvXGicQZWGp/NCEyY5KSGSe0qL8ozLHR2NkNIKvi
         xDfpduaD2R4pEnzEnT+W6zVk5TYPC7z7x7fVl/bjXODzamAhDXrxQD+HMGt+laFM8OeP
         xbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789661409; x=1790266209;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JCtOntWTjPZc4BpViwhdQjZl7CARnN18qaHDaorAHCY=;
        b=MWEmrFmrF8smq5nlXHR11RGoM/MDsCV/gVzwg7khUDy7DjGnddoYYZr9/8PI6wh/PD
         VHDwgtFx+rv2nJV45VFySVwdlwHAQe5S3o3gSUeSb7C4Ti2Qx7SSsFwwfAazbcT3I0kc
         PTdg+bFEQpvDxMPZiLj6NWkYGeEVTAmtwqSOxe5fMjPXKknyxG7RwQxGuAFIVW3OWEqU
         pvzR+UfyO1PmSArDbjqeEacTID8YFXn7eCzXWOKzyCzr8cGKDfz9imY4kM02jN/jwGAz
         92a1ldpbAqQpgNMicupHGacyvclP5hJG+/tMFJyz8km3KF224fg6wfZdAFzMBoDQHzn5
         RnlQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVyBZ5jMioalawpxAO3SiXLrGC3B7NW8JzX3/84Hl31aS1LKxqE3c4iE0WvqIZMarn2Gcdr7gHPcKSnfc=@vger.kernel.org
X-Gm-Message-State: AFuF++mmXgaUbTiX7Jvpy4/shDCk6eQ/0jaMBcdZQm1kg4+sCKAPdU5O
	nP4DASVOkE3l6p48i8YNlw6pRirn4XYjrXP3CHBJQWcEkvv7SNG5tuZF
X-Gm-Gg: AYBFou32jbP8LHq6blMaQcn2+r/XCAOsomEvBp0HFtBcGMHqnUDy4XuObVB/vLmx3qA
	vFwuveVqEu4ZRZYWww3jTHmjewTBoP1zCJI3CDQ++GiqxgrH/ukkhSSOYtHGewS9jda5lK/kpSL
	jqSWIqnzViEvMUOAWMVjhH0Q8LiyZrIUinIr7hLawUJOKAGPBvNEF6pvaMZXM+vTT0JisvNzSA3
	TG3JkwPPu8X5402+cW0YYnoEKF/9Sp88rMVFPOIlK5bdeLJCXnNOsUjIjyfAoFNwEraL346VkeJ
	dWpOjPp7XagVptKhR5VHZEJM5JyZRinB0k5gyr5I2neSyU0Uo0rVeGsxtlbxLQNx4jvgC3NNdoQ
	iKyOSlnCLhe/WTpHQ0J4LoKwbSeilovXa42jSIHVRRQKlwK3wKSLwgSpv37ymQF1oj4XhFpR339
	fV21H3qUH51P5dAjaDQsvfIwggB3fOmj4CKzxjBXu8KuEfwkL3qQTMPvy5c8EG5aVOrAAoCA4v2
	X9HM2umi6PjU3ukTA0KKtInXXjrPKhL8VXg
X-Received: by 2002:a05:600c:354b:b0:49f:bd3c:bc1f with SMTP id 5b1f17b1804b1-49fbd3cbd0dmr45437715e9.26.1789661408374;
        Thu, 17 Sep 2026 09:10:08 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:b38f:24e6:c510:eeb1? ([2620:10d:c092:500::6:e617])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf34440sm16321490f8f.25.2026.09.17.09.10.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 09:10:07 -0700 (PDT)
Message-ID: <15342d9c-d823-427d-9ce8-04cf48c6854b@gmail.com>
Date: Thu, 17 Sep 2026 17:10:06 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v4 0/2] bpf: htab: Reduce memory use of hash maps
To: "T.J. Mercier" <tjmercier@google.com>, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com,
 memxor@gmail.com, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260812231905.2956588-1-tjmercier@google.com>
Content-Language: en-US
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
In-Reply-To: <20260812231905.2956588-1-tjmercier@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/13/26 12:19 AM, T.J. Mercier wrote:
> Memory is expensive and scarce these days. This series reduces the
> memory use of BPF hash maps by eliminating the per-element overheads
> below. This saves up to 50% of per-element memory use for standard and
> PCPU hash maps. The memory use of LRU hash maps is unaffected.
> 
> Map Type & Configuration            | Old size | New size | Savings
> ------------------------------------|----------|----------|--------
> Standard (key <= 8 B, val <= 8 B)   |   64 B   |   32 B   | 50.0%
> Per-CPU (prealloc) (key <= 8 B)     |   64 B   |   32 B   | 50.0%
> Per-CPU (non-prealloc) (key <= 8 B) |   64 B   |   40 B   | 37.5%
> LRU (Any key/value size)            |    -     |    -     | 00.0%
> 

T.J. are you still interested landing this? Maybe respin the series?
Alexei was away back when you sent this.

> 1) Unused LRU / PCPU fields in standard and PCPU hash maps (patch 1)
> struct htab_elem is used for all hash map types, and includes fields
> that are not always used (bpf_lru_node, ptr_to_pptr). For standard
> (non-LRU, non-PCPU) hash maps the 24 bytes for the bpf_lru_node (union)
> are entirely overhead and can be eliminated. Non-preallocated PCPU maps
> only need the 8 byte ptr_to_pptr which is currently unioned with the
> unneeded 24 byte bpf_lru_node, so 16 bytes of overhead can be
> eliminated. Preallocated PCPU maps don't need ptr_to_pptr, so 24 bytes
> of overhead can be saved.
> 
> 2) Hash caching for small keys (patch 2)
> For hash maps with small key sizes (<= word size), comparing keys only
> requires a single instruction. Currently the 4 byte hash value (8 byte
> aligned and padded) is used for this, but offers no performance
> advantage in this case and can be eliminated.
> 
> The implementation splits htab_elem into dedicated structures for the
> different map types (htab_elem_lru, htab_elem_pcpu, htab_elem) which
> share a common initial sequence (struct htab_node), but contain
> additional map-type specific fields where necessary. This means the
> placement of the key for each element varies with the map type, and
> key_offset is added to bpf_htab for this purpose.
> 
> While using key_offset and conditional hash checks adds new pointer
> dereferences and branching during element traversal,
> run_bench_htab_mem.sh shows no significant performance regression across
> 10 runs on my 3995WX.
> 
> Benchmark (all in kops/sec)  | Avg. Before | StDev | Avg. After | StDev
> -----------------------------|-------------|-------|------------|------
> prealloc overwrite           | 115.11      | 4.10  | 115.45     | 5.24
> prealloc batch_add_batch_del | 127.14      | 4.32  | 127.06     | 2.32
> prealloc add_del_on_diff_cpu | 23.22       | 0.93  | 22.91      | 1.60
> normal overwrite             | 78.52       | 3.05  | 80.40      | 3.25
> normal batch_add_batch_del   | 45.37       | 0.69  | 47.71      | 0.66
> normal add_del_on_diff_cpu   | 12.02       | 0.73  | 12.48      | 0.70
> 
> ---
> Changes in v4:
> Removed inline from new functions per BPF CI (netdev/source_inline).
> 
> From Mykyta Yatsenko:
> Factor out duplicate lookup_elem code into __lookup_elem_raw.
> Use offsetof instead of sizeof for key_offset assignments in
> htab_map_alloc (patch 1).
> Eliminate branching and htab_elem casting in htab_elem_hash /
> htab_elem_set_hash.
> 
> Changes in v3:
> From Sashiko on torn reads/writes:
> Use a local unsigned long and READ_ONCE / WRITE_ONCE instead of memcmp /
> memcpy for atomic key comparisons for hashless elements.
> 
> Changes in v2:
> Make maximum key_size for !has_hash depend on word size for atomicity
> on 32-bit.
> 
> From Mykyta Yatsenko:
> Put the htab_elem* common initial sequence in its own struct (htab_node)
> and reuse it across all element types that share it. Eliminate
> associated BUILD_BUG_ON additions.
> Replace both the hash and key fields with data[].
> Store has_hash in struct bpf_htab, and avoid per-element reads of it.# Please edit the description for the branch
> 
> T.J. Mercier (2):
>   bpf: htab: Split htab_elem_lru and htab_elem_pcpu off of htab_elem
>   bpf: htab: Reduce elem_size by 8 bytes for small key sizes
> 
>  kernel/bpf/hashtab.c                          | 418 ++++++++++++------
>  kernel/bpf/map_in_map.c                       |  13 +
>  kernel/bpf/map_in_map.h                       |   2 +
>  .../selftests/bpf/progs/map_ptr_kern.c        |   2 +-
>  4 files changed, 289 insertions(+), 146 deletions(-)
> 
> 
> base-commit: cfce77b63375dac81d53f2f85593c548415206b7

