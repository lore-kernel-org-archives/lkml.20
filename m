Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4D54F3EA5
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169678; cv=pass; b=ud33Jn5E3mCpc+u/tkWn7ttUqBDfR/Ma3hUmjAEbeuvcFCDbeRhHTpMWmgb/1nVnilQ6SWmmi7T39ShQMCFS4QWHu+g2mxK7dhFj0BAVBjrEhDqm1amU1K4RirUoeovWhYUzodVm2h8HYkT07F6ph1e5JIZUtsuSpNKhNKwggvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169678; c=relaxed/simple;
	bh=EzdvEOTVEqn+D3H7FKcmRLjynThd1200BtlnmXo6lr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KlKhFd3K8GxkqkIUvNpj5uamqwElC+Rc0wjqIw7HjN79K4hmqsH9WmdExUUDU6zfHvzXh0mYNmrf9hC1e0JsEJGUDGfEzFvRb6jMHrGUfvemSJnWLGSiTglvhCQBUzpY0T0E3tHx3gBar0W0Ni70YFhjDOQYIF8l18msB5O3xMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BNl6mVVv; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BNl6mVVv"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so214244eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:54:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792169675; cv=none;
        d=google.com; s=arc-20260327;
        b=HNnZOalPyftLNSOl9UfQWolWBsKxoMrzQC5no2yot8Vl8n7MLtUNxKck2Z4teYmuK6
         glyAWX6gVJgEe3g/h+Ql87YNAu/umtbxhCCzFwzhIJMOVorUdWlhOcZiwn/he+0sB+Xq
         EhEo9or2Sgnva4xdx7jAKWZwS637MkbBCnEeBQu5PTCd2RvfvSzidV3UbonoHFVPuXmi
         lf9tUrl5ehrjLoXnNA7UjKfANavE5WVVeTOyhV8ea3zTS61xAMGHp3XVrgUfYm9lV0v+
         6rGowuoA6q9cqogkkOrtBZmxpXdXlUKfy3kV7TarxLF/nodL4PKKujzRzSM7nopDx45E
         XT2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KNk+lPAYmreHNBvy4VSXM9whOEM/ui2VVdodl4iXdms=;
        fh=2lLCClnISeqx2oI+FfbLy2BO7OwEax4TQepozcIBDMM=;
        b=dIFALG2C72UU/h8r2jgoXAggrOKgLxtI3GyXp+0Op7+ny+CNdXQy1W1orxZVcrMSSk
         J6HnmWwpGM6n75aImc2UkQ1u61USnq9wKFI4iweJGMUiZ11U2bdt85+DReOBTzBYQPug
         2m8c8cR0UBtThjBmTm+pnh6jL3I7ve4xFqQvFnSO4Ykjp5Z4llrkmHfSZKnvhFe9DnMY
         A+Mz6vLLSocgPrQHaGEoLxYwrtvKIzwaNInOrEiOxwt/1/qurvqW8mv7THztEhlpV2n2
         c2cyenqp8aa2hQYc2OnK1uXBVEDZAGjnr/X8F9w7UVD+V728yU4p4Ker41qX2tMD0lfe
         R/iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792169675; x=1792774475; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KNk+lPAYmreHNBvy4VSXM9whOEM/ui2VVdodl4iXdms=;
        b=BNl6mVVvOXNneIISMOXsr2Z+alc53DaHeWkE9FYkL/Wnk6HB61glWwm2gDNiiiX8Rs
         96lmxqgPbX4e2P87UQFWnLnsIVZgySGlLKiiKx3AQ0B/W82vughzOjubtwSmzYyhNaM3
         Eyy8mOhA9IPfhYF64ubhEbEYbLdiPvvdEfqxCxNa10H4tL+8Qsi3AH+ww5uqzPB4n9yV
         ksou+vUHeIC6ySEd4nm5Z3ZCaTtO1c+WmeKcAzt4/bbKfWxR6ESCG/AktQOA2woMMJXX
         ypRxYkIQf4Iupo0331g56XeRSVg5jhuKfFXNZ3/kICEjt1Gqt4aGBGk1iTRMexKOnR3P
         Ib+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792169675; x=1792774475;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KNk+lPAYmreHNBvy4VSXM9whOEM/ui2VVdodl4iXdms=;
        b=pVuGIFM4l90RB4pVBOWnzMPt2nLhFBa6ShTy7wKOrPNApZwW7XnmRen4ov5QyMYVKz
         UscgRcXE3+AkXnrDqYx33b/EiB05u5QWw3oeWB3fHcH92Ud/hGgYA1lw812VfvWEU5Wn
         m3qiWb4hVtAzDS+so3xtXPXPJQyG4tSYNIievzPEmydDPApdD27bxES9u6gvzfrtsILA
         OPp1gUZnxEnglr2MrGF/l8pOcEaksvha2OrUihUZdggWeqkmH5i6GarlpzGvaSxMVGrm
         CwpuO95sQwUQx6FShuu0NLpMrEnk66kTg0Gu+AMrCiNS44AOBl1f5jhz6cx8+ipuSIkh
         JWXA==
X-Forwarded-Encrypted: i=1; AKwUvBwsou3XivXS70cITEuWpIRRXVeETK71sVbxqsspVcwUQ9CsdmIXSo3nubVXstxjUJ2PggKNcUgoYh1m7gc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkUewDO7ZqIyz24DmwUt9AtOEkm2UHQBe9PnNdLd5AbCbjKYbE
	GIp6+QxIiJGv3V8pbhV71eQKLJhu870pYDfUe8hEI9i2JMDQNtvASxsWq8J2WS0YLroXRcPGCi+
	wQpzpWG/4OsRsASDwWLowSduD0WXyt95xB8eJlVTq
X-Gm-Gg: AYBFou04MDbTh8y7ZJlihotaOklLOVku26FukJbXbWjNTblacrPklZhcnUSxXzgJKOp
	LC/X+mO142Nu/Ix3BNH+dzp5z7wJEioHlyLsZbscevU0tb4CdyNSLuOBeaxXbkhmdSMVKAlpPLd
	Ab5J3h34tW0jT5cIcAW2eAGhU5Yomn6cjf9lFrxjYvXMp+edskEbLdWq1jlfhv+0UE9/yr7Zpl2
	o5SJ617QAC6ysxBK9O6Z+ab//W8mSt5Rm/crRf1LAsuUMX5rs2EYkKx2OTATgN1+JHNiAs2m1gl
	7T3sU8JgxMf1cfqIJAzG/qqpbjHrgdchDHDveQw9880WdjznYkwXOZQ40GK2/KIFZh5yeq+FXlF
	FuHKo8lfOigE=
X-Received: by 2002:a05:7022:fa06:b0:181:8948:f017 with SMTP id
 a92af1059eb24-18513b9aed5mr734680c88.41.1792169674334; Fri, 16 Oct 2026
 09:54:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-stackdepot-trie-v2-0-1996d5cef732@cloudflare.com> <20260908-stackdepot-trie-v2-1-1996d5cef732@cloudflare.com>
In-Reply-To: <20260908-stackdepot-trie-v2-1-1996d5cef732@cloudflare.com>
From: Marco Elver <elver@google.com>
Date: Fri, 16 Oct 2026 18:53:56 +0200
X-Gm-Features: AclHuK_WxF5EESzu0hGJdibTwB6wHoZiUHQsU4A86X5DIragIIphY4_fzhWq1Ec
Message-ID: <CANpmjNPGWC06f+gCu9gwjnBQfJigVyK94HOFOT=en4t3Pz2r9Q@mail.gmail.com>
Subject: Re: [PATCH RFC v2 01/11] stackdepot: stop preallocating after the
 final pool
To: Caleb Kan <calebkan1106@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	Vlastimil Babka <vbabka@kernel.org>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Oscar Salvador <osalvador@suse.de>, Caleb Kan <ckan@cloudflare.com>, kernel-team@cloudflare.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Sept 2026 at 15:13, Caleb Kan <calebkan1106@gmail.com> wrote:
>
> From: Caleb Kan <ckan@cloudflare.com>
>
> depot_init_pool() decides whether another pool is needed before it
> increments pools_num. When it registers the last allowed pool, pools_num
> is still one below stack_max_pools, so the existing comparison clears
> new_pool.
>
> With new_pool cleared, stack_depot_save_flags() can allocate another
> order-2 pool after a lookup miss. depot_keep_new_pool() retains its pointer
> in the global new_pool, so the allocation is not lost. However, pools_num
> has already reached stack_max_pools, and depot_init_pool() rejects every
> attempt to register the pool. It remains allocated and unusable until
> reboot. The non-NULL pointer prevents later saves from allocating more
> spare pools.
>
> Account for the pool being registered in the limit check so registering
> the final pool installs STACK_DEPOT_POISON and prevents the extra
> allocation.
>
> Fixes: 31639fd6cebd ("stackdepot: use variable size records for non-evictable entries")
> Signed-off-by: Caleb Kan <ckan@cloudflare.com>

Reviewed-by: Marco Elver <elver@google.com>

Please send this separately.  I hope to find time next week to comment
on the rest of the series.

> ---
>  lib/stackdepot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/stackdepot.c b/lib/stackdepot.c
> index dd2717ff94bf..90c52f2e0d3f 100644
> --- a/lib/stackdepot.c
> +++ b/lib/stackdepot.c
> @@ -323,7 +323,7 @@ static bool depot_init_pool(void **prealloc)
>          * NULL; do not reset to NULL if we have reached the maximum number of
>          * pools.
>          */
> -       if (pools_num < stack_max_pools)
> +       if (pools_num + 1 < stack_max_pools)
>                 WRITE_ONCE(new_pool, NULL);
>         else
>                 WRITE_ONCE(new_pool, STACK_DEPOT_POISON);
>
> --
> Git-155)
>
