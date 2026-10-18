Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6A2349B15
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 08:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792313311; cv=none; b=j/TGqEw/V7iAl+CpJWKzXOlWrLwZKIvozs/+qyMVoKrQL3/mV13Gap/G1y8RqPB/8Zbn7hI9c3dse1GGyX9CJFaPoNtbbGOZFsrpy4rmJWzs4KJTiNnRqYbPy125A0jXxQpdiSbvPBHvC+lHTST88KaytMHZMZQqYmdoWrRD7PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792313311; c=relaxed/simple;
	bh=CEOmBKRPRHQvggQ/jUprVScYeABN6UGtUJElxmkh6EU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dSxhXMuaRgVAKHjZ3FDkqREqPkpTQFzgi0zOfe9DeMa/04yk3KmvQ+Ttp/KtEpmOzjDZ8uONa0RPOAJ1giASb/+c7Z1+wzKv+gtZMkeuDqvgYFOZZWErNxLbfskkuYUb1Dqtf33P7mcGUNubQIZBM0n1BqugJ+X8v3SSQddZaLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SoiJqLSx; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SoiJqLSx"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so8869385e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 01:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792313308; x=1792918108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KN/6iLwfCQ//2avSJv9DQ5CIOHPByLS1SPM2UhK/GmE=;
        b=SoiJqLSxbWoLMSHRYyr2a0L/DpzmLUkhnrTTvmUTMK7uDoHbFHeafunDUH7F88Jv1j
         J7YtCICj9D5Nt3BTbd2qtP4HU6ow8BT65/9mYRK4U8EvUoEr8pqgEMml1tALfGEFVbHe
         u+TKcLqst+vGjmdiqA2Ib1QPuFZ/+N5X1UfZJFKUrIHgumoQfmyHW0DwMR9bpAxHrSBe
         SEaZHNUOx7A2DEnyMCBNOz42YtYa4y1e0vnjLu8mZt9RpyurTmkAC+jk5QAR4muPwTDF
         gZM6PkRf+BBlLxIdFbX41nJ1HeIftWnDp88wMHUGTa+j8wIBzTMrv8bCIj0WnrKxiKxX
         IrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792313308; x=1792918108;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KN/6iLwfCQ//2avSJv9DQ5CIOHPByLS1SPM2UhK/GmE=;
        b=RcwBJ6oL2mAZzssfNiiKW/KMbhvG67kLLFSqOYkoiG42NJWkRdhYd7rmza7Pql3c9d
         qvsibJcredlPAOv54wSUbMGD5RRJD0eWxVY7HZyasfcRDa7kJV/EB24wTOR0erNUacn0
         yQ5UtrPa5WstxlWfUs7jArTjYQBVrqLUSDfQtViv8yaSRLaBIZrpA3Wr8lxIhHbNlb0j
         +C1ufpE6TX4Q30IRWwfmiArSwWWnoxEilkZfsVJEsX2jbReJepoFR/ZcK2wIkAiZQZbi
         NzqkJrb5v83BT7J3U0eikV/JRrlKaZ46ic22LDsGPk/uE/OuAFJ6VSkqGFylORbp7Dlk
         7L0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzXpqhIfhkhU85pJx595uIvMqNQNo02foOyifZFo/C642sw6IKfB++GGERELG3lJIBvbr10zZ9l4tys+XQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfG/zk9xqwapQifwTK+PP6x1iCSZQ44GawrHQtIgys1o3HCd8K
	oGujWmoGXU52wFGjxobUdyJ5kT7M8uXLQ0irDftbGdtMhu+B3FkRp+CT
X-Gm-Gg: AYBFou2ExqWMy17ueCA3oRAPlGF/MnefvuZPOwIOcJdpMYbCAsF2M/uhNZlU8j+J+Qt
	McjMEUklLc0esld+gArLOHlPP5FAIVyc4ip3ya29319aB48mtYqNyMa0Jd8AqcbLJxLtMY/34mb
	UfN5LMUiO8UrhxIrsV1IVDmFgHHvA0TM49sqeOwJblUJ3AxgpBtQwy7Dl4cvP589hk4MDgqjyrC
	vP8eztgmoc5CPWJrraXEwLVmsOPQrjJ6nwIuxkWg5nll3DIeW4fnfBDgL/Mwt8nDVyRrVWvATY8
	k0MFhaXQrP2aiwAVKAvtiMmAZ4FPOhmVwczaQU6fSump1y+LWKon13eqyISzvqDzlG6dEU8GfWM
	W4ReFcVVkBw386DIDMuM9ExBCo3o6boeBC9TXxzzcmJ6DfdEEjo1tG+QO/Qy92m8okUE4XryXxB
	vDxP2HzB0hRDkupZHzSNuVBrxdXCQ1nGzqdTxhgdKOfcpQquPa002NKohWxOIS66Uc4aQ=
X-Received: by 2002:a05:600d:8643:10b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4a1e00ba2fdmr28805675e9.7.1792313307895;
        Sun, 18 Oct 2026 01:48:27 -0700 (PDT)
Received: from [192.168.1.18] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c10fe9d3sm248499795e9.13.2026.10.18.01.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 01:48:27 -0700 (PDT)
Message-ID: <6b17c6a5-5164-402f-8d97-2b25f4f9ae8d@gmail.com>
Date: Sun, 18 Oct 2026 10:48:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kasan: fix runtime shadow page table synchronization
To: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Dan Williams
 <djbw@kernel.org>, linux-mm@kvack.org, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, muchun.song@linux.dev
References: <20261018043501.3257632-1-songmuchun@bytedance.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261018043501.3257632-1-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/18/26 6:35 AM, Muchun Song wrote:
> -		if (IS_ALIGNED(addr, PMD_SIZE) && end - addr >= PMD_SIZE) {
> +		if (IS_ALIGNED(addr, PMD_SIZE) && end - addr >= PMD_SIZE &&
> +		    pmd_none(*pmd)) {
>  			pmd_populate_kernel(&init_mm, pmd,
>  					lm_alias(kasan_early_shadow_pte));

what if the entry already points at the early shadow table? this walks
down into it then, which loongarch does on every boot.

[snip]

> -		zero_pmd_populate(pud, addr, next);
> +		ret = zero_pmd_populate(pud, addr, next, mask);
> +		if (ret)
> +			return ret;

isn't this a separate fix? it's not in the changelog.

[snip]

>  		if (kasan_pud_table(*p4d)) {
> +			if (ARCH_PAGE_TABLE_SYNC_MASK & PGTBL_P4D_MODIFIED)
> +				continue;
> +

doesn't this leave the range on the zero shadow, which memory onlined
there later then keeps? would always allocating a table at the synced
level once slab is up avoid that?

-- 
cheers,
jose a. p-a
