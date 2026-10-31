Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793450442;
	b=mnCAJ/kbigDqRmdLuQ8j71PXTEdTizOdJaJQpbO7qm2eazci83fnyIXp7g93hGVxPPpo
	 EfzvKwfg8ofMLW3F8oTzvK3BOtN1It/4+xwvXAt9hKt+QyJotS9sJnQ/NGTDVGM+9I02C
	 3/i8l7gWJSs0cmaGHAGeMTZYW4la7m+KrMTWmLSzealW8u4syKU3wv0udaC+3oeWWkHFe
	 +Z2nhKE9dFkCdvE25CB9pf2DvIpCqbiuPDGray24EI1T9E+ppz4Tf8Meka/jMTxVA1QDI
	 QwMrYm8oaTk3PyyhcZD/lsIWIQD0lAjmlWTRm3xvDZYl82Dy1WnUEbyPMg76j2Te3zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793450442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Cxqf9Bqorso0fGl5m6PKE59KMlkjDZ4/kjDJmjbnK7Y=;
	b=0nWxSwuyizS87nE6A5nEl3PjljAYEbwx1HoA1o+xyoSM59bL5+UCn+1XnJgrhZ9fBx0W
	 FuuZbzeuYNG5ca2lilTYSG2LFx+4enihjKiyjdNBBWEFTydgajGCNnUU0ah93WqeCHjBQ
	 zjgjZ+JR664C/PWvKNcckMIICRXknnfEYwj0PDc/3rVgvkfLRIaj23VpOqwA9cZHQK2w4
	 DVlvNIGeRs86CJgoWorf8GdtA9N5C2UO0ymqbkPJBHbDGVYeKD2KDI3ltLxE4P9jn2dEW
	 5iJ3HbDOPPLzEQ6voxFTmK3LcyP/voAWSP++BgMmOy5OleHvEzRDJx4wC9xAt1TPKTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qy8WbEhN;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6C8606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 12:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D6C8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qy8WbEhN
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dee593f18so1302546f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793450441; x=1794055241; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cxqf9Bqorso0fGl5m6PKE59KMlkjDZ4/kjDJmjbnK7Y=;
        b=qy8WbEhNvxLv28vR/bD8Dmmw3fyZBPw4FeqtBM+B5UsizZTUzx99aZZM3rs9fe3wRv
         CTZvEO/yoOWb851TAoLT5y1t/fM3PEOkEhj7XSDMljPsoYR0GhFQvSoDAvAL848fzLQp
         bXVAVuNWGnESh09nncjfS3UAOqUnOMM+BYpAGuILeFmTfDugnPI7tdNKbTqyR+xJdEoO
         qozVY55bD7jSu1YAUzrqGxzH3IPVygjs60wre44jjyjwJg4qql1xoMCfI3ByE73s/83W
         F1Oy0idXYhtOytdKxVKdQqAdnF3H8/uDPNULdTTvlD8cF94qwQjxtrDErjQqSBJu5qQg
         ZAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450441; x=1794055241;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cxqf9Bqorso0fGl5m6PKE59KMlkjDZ4/kjDJmjbnK7Y=;
        b=ApETzI04hTeJpZfcR7ayMPNP2VAOt3BjOcVAUmj/QQhE2ESPq2vxS2e7mOzeMxii8t
         ArC4aXdnvJ4lIn235m/mnXLF2lTtf0KKkv3LkvOVWWYvv+S4nu2ttFb3AfAiPcQEKeLF
         b3n64p2h4BwHfEnaR6KH69JK7z9mooIEUxsq99j3KVKtxpPLWnYIrwzwF4cf2J9+q1M5
         /rzeKxJxsOZFR+cAeuNbI74rgk9Exlx7xXKdoLvqokfEhG8U44j53F7xoGrfDRwchgYt
         YIFAgtbOxtUEyiyTgfvciT7J0AskMy/WuA0vat6fYCX+Z2k0XhitNubpEnqOtlBaFBPF
         Qpgg==
X-Forwarded-Encrypted: i=1; AKwUvBzwn6p3Q+jVVBVhEpMBFCLGOh9MyDV3XKv9OQ3oo41GvEEBxJGDx+BYiR4mZ3LDgLui0A3EGN+Kxr35SIs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIeA/wgEq+DlbumvouBdb4uUeTomS1ReNAcDD0nd3IAEA04pHF
	Y6CV5DQvL+ig+VQIyQGUPFWtykkD+R00oSm3foizSrki5+rKsJMQCBXZ
X-Gm-Gg: AYBFou1qzqMfQi/6ypmguNhvvh3NIpEVww4zVRQiJL8pMJIOaLkj7hTqzWsnq93OLgO
	vuPCPL9wG3+MeJ+mZ/IC4gnMsixWWHMYVElDz2yPgMOcw4SwW7lQI3j5S3Rvx7tZ4uctsJO9trn
	YAKZJndWdu8qMkdlt7jhBZuXvfIsm8bDk3PTWnyPgPnsHQ1NuJDFCvI3Haled3MEZ92ZH9Pn4fz
	xRjpQhdS7eK1l9bLwUKhvbElVdhe7JHZbfGRGnyJuVSkREQJEViBF5M8KV4E1i3gzmSmdg6iuz2
	OjhrT3YMeAm4kPf3bs9HAQecU8G2qqFq/eJn1udAueRJNnahv3tl1ZTa7EYp+uJz3HT+LtnKIpZ
	G3Au+C4MAwPlUYmF5xxLvn87QBdCGoE9Chz4AgUeEXFTVqvdrGBtZlrtOTPEmO6J/2aKU63JA5h
	HS6QG9Xvfp7Yu6d9zwCsSN1g8cnVER8ROpRWLScHnHrlam5kFrN0nFjUY9ajL2CIggHzkCgxkPA
	KN1twuTi/UcrlosdljmUKC+gqzlpWDdWaVbTYU45/mBKTX+ZqrWP5N0RgKbAeSAuy0P9GPrvmlO
	J396O98iwASM1gTliUO+vi+ZTH+tptTE2QUhSRtkXQloqQ==
X-Received: by 2002:a05:6000:2c0f:b0:48b:68:594a with SMTP id ffacd0b85a97d-48e6e2e7798mr11167496f8f.12.1793450440315;
        Sat, 31 Oct 2026 05:40:40 -0700 (PDT)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b789c6sm9294444f8f.26.2026.10.31.05.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 05:40:38 -0700 (PDT)
Message-ID: <57717da3-d309-47c5-8c1d-d4686e8fd8a2@gmail.com>
Date: Sat, 31 Oct 2026 13:40:37 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm/userfaultfd: recheck WP registration in the
 hugetlb UFFDIO_COPY retry
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>, stable@vger.kernel.org
References: <20261029221129.89068-1-azpijr@gmail.com>
 <20261029221129.89068-2-azpijr@gmail.com> <auWz5tAzi0p6NMou@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <auWz5tAzi0p6NMou@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/31/26 10:24 AM, Mike Rapoport wrote:
> Hi Jose,
> 
> On Thu, Oct 29, 2026 at 11:11:01PM +0100, Jose A. Perez de Azpillaga wrote:
>> mfill_atomic_hugetlb() drops its locks to copy the source page with page
>> faults enabled and then looks the VMA up again. The retry doesn't check
>> that the VMA is still registered for WP, so if the range is re-registered
>> without WP in that window, a UFFDIO_COPY_MODE_WP copy installs a uffd-wp
>> PTE in a VMA without VM_UFFD_WP. That is one of the leftover uffd bits
>> hugetlb_fault() has to tolerate.
> 
> The "leftover" sentence will be confusing for future readers

sure, will drop it.

>  
>> The non-hugetlb retry goes through mfill_get_vma() again and fails with
>> -EINVAL. Do the same check in the hugetlb retry.
> 
> No need to reference non-hugetlb path, just describe the added check.

okay, will do in v2.

>  
>> Fixes: 6041c6917903 ("mm/hugetlb: take care of UFFDIO_COPY_MODE_WP")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> 
> With those fixed:
> 
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

thanks for the review :)

> 
>> ---
>>  mm/userfaultfd.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
>> index 3b71712edab4..a70ecfc8a998 100644
>> --- a/mm/userfaultfd.c
>> +++ b/mm/userfaultfd.c
>> @@ -810,6 +810,10 @@ static __always_inline ssize_t mfill_atomic_hugetlb(
>>  		if (vma_hpagesize != vma_kernel_pagesize(dst_vma))
>>  			goto out_unlock_vma;
>>  
>> +		/* The range may have been re-registered without WP meanwhile. */
>> +		if ((flags & MFILL_ATOMIC_WP) && !(dst_vma->vm_flags & VM_UFFD_WP))
>> +			goto out_unlock_vma;
>> +
>>  		/*
>>  		 * If memory mappings are changing because of non-cooperative
>>  		 * operation (e.g. mremap) running in parallel, bail out and
>> -- 
>> 2.55.0
>>
> 


-- 
cheers,
jose a. p-a
