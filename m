Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794547907;
	b=pVCREd7q9I0QXoWqipKdhvpJF+psXIvELGJf1nThCyKEVaf/rwmVuoQsItQhLGr1i0KC
	 BIJZX5Vi4hd6IjgZe3s+oTup0SvwQZm20L+hzGQkZRIhjW4vF5SaiV05wkfmTGTxgnVPV
	 Dio0XW8VHJ4YzTzFqn3KkyLDRQclDmFrZlFZw/zp/58XgnnL/JWFeeOSvu1Sf8p7V/Qqw
	 Qf/XLMau5vvYYPPinOoGXBuAyjjal69kz8bPSvI5069RBjQXUH0nV5jB6vaVaoGcgYCdd
	 1amCNtGLRC8CxXWTHKbAaOPWWZD3lb+LTuRXYzPkvI4WN92Q+WaKzpKWcL49hmkDYeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794547907;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=q5ccHDNjOaQuKoYDwy7TH67pGGdmawXvtZ8kWuEfWxQ=;
	b=QFZYJ0ggxTzP52u64/GVc6MjmmVzY5rztom4ab0xVCMi38OHN4lPK6ZTASc22g2KM++J
	 P7AAhGgDKojHS9WMic6vV3F2x6cVqd2MuPyb1hmrC8rv5y93wkPg8yw5B5ysYER5i4anl
	 HtrA7LjnAOlp4ihL3zpBpi/ls8jQu2spKcGdtiXXECiIowPCevon0v8+fJcAX89b7rmOV
	 CSGPw9sDRHBNxP8I/LtHeY9g5jI7f/g5GcTFpW3/qDLmWrmTqGOziqd/drry5YPYsauIE
	 yhUz//iGeTHS6Uo5tQqAL3eTiotXKHSTnOHFQZWr8bv/MfBzug2kgB6eeZIcpRF0asA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=fYwQNPxv;
	arc=none smtp.remote-ip=115.124.30.119
Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5E1606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A5E1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=fYwQNPxv
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794547902; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=q5ccHDNjOaQuKoYDwy7TH67pGGdmawXvtZ8kWuEfWxQ=;
	b=fYwQNPxvRQJlzErwIX+teaCpJFwa8yY/UZ/OVdvetOSLA6veOCHBHvy2G1VLMI4nQZ69NdCWq6UzKvJYLWRo3fJAYxryNH7bZBb6DFTSIL9mtJ9AesaMpUoG5GylxxWvnnxSnSr1MaJ39IH5NnRT1KJtsV5Vs2o2yry+Vtbovok=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XEe41eT_1794547901;
Received: from 30.74.144.124(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XEe41eT_1794547901 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 13 Nov 2026 13:31:41 +0800
Message-ID: <319d4cc3-93a9-46ad-9d03-ceb22d0f0aa2@linux.alibaba.com>
Date: Fri, 13 Nov 2026 13:31:40 +0800
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
Subject: Re: [PATCH] mm: mglru: use pte_table_clamped_end() helper to
 calculate the end
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, hannes@cmpxchg.org,
 kasong@tencent.com, axelrasmussen@google.com, yuanchu@google.com,
 weixugc@google.com, baoquan.he@linux.dev, qi.zheng@linux.dev,
 shakeel.butt@linux.dev, mhocko@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <b2386c5da61f9a15e60daa421b033bc1e0bcdd41.1794481498.git.baolin.wang@linux.alibaba.com>
 <CAGsJ_4y82CKoLx=HC8zUpHz+qwT8sNHjqT0bbrfLuCRYrWR1iQ@mail.gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <CAGsJ_4y82CKoLx=HC8zUpHz+qwT8sNHjqT0bbrfLuCRYrWR1iQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/13/26 1:01 PM, Barry Song wrote:
> On Thu, Nov 12, 2026 at 7:13 PM Baolin Wang
> <baolin.wang@linux.alibaba.com> wrote:
>>
>> Use pte_table_clamped_end() to clamp the range to the PTE table and VMA
>> boundaries when batch-checking young flags, making the code more readable.
>>
>> No functional changes intended.
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>> Based on mm/core.git for-next branch.
>>
>> Note that this was found while reviewing David's series:
>> https://lore.kernel.org/all/c31cc8a0-c098-4784-a843-f13f51914094@linux.alibaba.com/
>> ---
>>   mm/vmscan.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/mm/vmscan.c b/mm/vmscan.c
>> index 5495d9be90e8..804d4188e7b4 100644
>> --- a/mm/vmscan.c
>> +++ b/mm/vmscan.c
>> @@ -4470,7 +4470,7 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw, unsigned int nr)
>>          walk = current->reclaim_state ? current->reclaim_state->mm_walk : NULL;
>>
>>          start = max(addr & PMD_MASK, vma->vm_start);
>> -       end = min(addr | ~PMD_MASK, vma->vm_end - 1) + 1;
>> +       end = pte_table_clamped_end(addr, vma->vm_end);
> 
> 
> We don't have pte_table_clamped_end() in Andrew's tree yet;
> it's part of David's patch:
> 
> https://lore.kernel.org/all/20261111-pte_table_clamped_end-v1-1-2dbe339c487a@kernel.org/
> 
> So we're not going through Andrew's tree for this patch, right?

Yes. I think David will pick up this follow-up.
