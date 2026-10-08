Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F026219E8
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 02:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791425662; cv=none; b=Sc3W/XIRpXwj0hGXfOkrHTjoKNloAwVMhd9ZltuSkKls+SIdIsiW9Yaw6tzXtI3yd1tDvRNhz1fFxIvNBsEJDFPVnX8XQ8OFzh3dO1upOgyiyzWxDS+pI2onxSwp7IhGFIk6dfK6fTfaelo4VPdOvDoL/u8M/ZQG7VdJh5vCbCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791425662; c=relaxed/simple;
	bh=AgyMNieGYLhbQmEIfDK6G9m1Z2B/8C1dCL/WUlBGg3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ufmCBo/SRLnZ2WdGvsmxtJ8CX0N8gunTyE7EEcOk2002lV2VE2lsGMi6nfkKSj61LrMguTWKL16rXuxCkff3yK+0+/ILJfKxPVc5bkZ5fQvHTHuWMlc1JBZ6aalMXRMxL87CAEJZwiA6YGSM+S5DWsd6CuqPaIK+XPOqaLjs/Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cW3OC8/a; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cW3OC8/a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791425659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uUUWn17KT8+7jjp2RfjC1mY2FecZ1lvMH6OaztmS8Jo=;
	b=cW3OC8/a6JrPugVr4XjJIo/c6erYHqHq0OKEOAkrJHnzp/cnZjsZiyZVMP/ks95dVRuTDo
	vMMSpaQI6PtQwHJWq/xBu6oSR3qT5oFMTLjuX71MjLlEXlKxuwl15KgDp/hmTyBIv5gJxk
	ZkgkBHoqdcjGV4BxvhkaaxBfrN41nzE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-_c_hbCHFPmCh41_98t9qqw-1; Wed, 07 Oct 2026 22:14:18 -0400
X-MC-Unique: _c_hbCHFPmCh41_98t9qqw-1
X-Mimecast-MFC-AGG-ID: _c_hbCHFPmCh41_98t9qqw_1791425658
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9179a556c43so107365966d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 19:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791425658; x=1792030458;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uUUWn17KT8+7jjp2RfjC1mY2FecZ1lvMH6OaztmS8Jo=;
        b=Nd/tWz4LO10RoG0aFsojfssID1T7kKxhbaz8q/5PwDuAwAtuX4oGIydbjRJ3D/Q6Lq
         2I7bSiogepoeDJou/tBSsVcfDuhwvCKIMG47hVTuM90jVIQb8SmqrIWBDypadN1PqP0k
         8SSCjseHYej5u2io/zwEDtK4rFWA1TlBa7Q3B67B00kjT27vFrLH3/AXr99jzNRskSrg
         t2wn+OyQaSKBf/ukUL86uGqTJsjBMJheUj5sANup5SMKNvtWXUlBRq0QBXKb3z0rGntC
         Wm5rBMhCGBqw1u6mVqn//NphkFG63mmerFpA0IjykqwN+75+Vd+f/llBZJmk+jzVK3Dk
         22Bg==
X-Forwarded-Encrypted: i=1; AKwUvBzPjTB4/lxWXs7pEljg4WsXbz/q1qto3+XaY14flaLS5NCUyUAs7eRYtQzdhRTVbwgDirzlPsG0zsRDo9Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJD76hIsjYDLKlZJ39zCgWAf9QrDAeLOzc48RAfpB5cOK90YaJy
	WMHfrjMzG80grn7fw9ql/m56y5tFzRXLtDoAxDgKTHmG9kxqtafqaN4IgUFr3fXEPNqj4tM0U6Z
	NkAJZYD5ttC72cbYLOMOeC9k3Pp/oMHwWcVWjo2wzzIPWrouhN4LQGvtzjrJOGl5wXvvJLkE0qn
	qqx2g=
X-Gm-Gg: AYBFou3CUK2SAkvChliVrGaqjII4xOacC4CJE6auv7/BtTgRMp2pbYXR8GqtJ1v59AL
	3xHk5SHSYUInPus9mWWJDFnhcC1YdYyv9bAsVq360pdZgx4WiIMyGL6WkQzXh/0sGr1LGY3lHaz
	vTosGCJPKpuf0zNK/bilmUZ1fRwtTQdPasa0qwDiwqvQ7gwpxelT/mow961gZ4EdLzlGLpbHVuK
	qz/7dg6ulIHHZ5kmnsUY8biWfCtFCInC2G9GbvxUdenIq7WXNPdX/VUDdFa8c2Apfmw3s2vd8b1
	SDBjFkdF46GKQaKbY6f8ogKL/izV9QXmFDYUwc1zVZuQyZR8ypAO899jB45DzxtHcH4i+bhdcS3
	qwNM=
X-Received: by 2002:a05:6214:29cd:b0:919:952d:f5bf with SMTP id 6a1803df08f44-919978a1398mr75159336d6.57.1791425657678;
        Wed, 07 Oct 2026 19:14:17 -0700 (PDT)
X-Received: by 2002:a05:6214:29cd:b0:919:952d:f5bf with SMTP id 6a1803df08f44-919978a1398mr75158896d6.57.1791425657213;
        Wed, 07 Oct 2026 19:14:17 -0700 (PDT)
Received: from [192.168.2.110] ([142.172.30.162])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91996d47f6dsm35515866d6.33.2026.10.07.19.14.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 19:14:16 -0700 (PDT)
Message-ID: <11295e45-c1ca-40d6-9d21-dd118cc1bce0@redhat.com>
Date: Wed, 7 Oct 2026 22:14:15 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 07/14] mm: shmem: allow THP support determination at
 folio allocation time
To: Baolin Wang <baolin.wang@linux.alibaba.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, ziy@nvidia.com, lance.yang@linux.dev
Cc: corbet@lwn.net, tsbogend@alpha.franken.de, maddy@linux.ibm.com,
 mpe@ellerman.id.au, agordeev@linux.ibm.com, gerald.schaefer@linux.ibm.com,
 hca@linux.ibm.com, gor@linux.ibm.com, x86@kernel.org, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, hughd@google.com,
 dave.hansen@linux.intel.com, djbw@kernel.org, vishal.l.verma@intel.com,
 dave.jiang@intel.com, akpm@linux-foundation.org, yintirui@huawei.com,
 dev.jain@arm.com, usama.arif@linux.dev
References: <cover.1789695931.git.luizcap@redhat.com>
 <f74ada750d1910f8ea7e55955eb0c330747b93d4.1789695931.git.luizcap@redhat.com>
 <b63f546b-ee92-46c3-85bd-bc64dbaae367@kernel.org>
 <0162d0f5-8e75-458b-a0a1-6071f46d4b35@redhat.com>
 <a14c2287-8d7f-468d-b0d4-1d445d2be277@linux.alibaba.com>
Content-Language: en-US
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <a14c2287-8d7f-468d-b0d4-1d445d2be277@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/7/26 9:50 PM, Baolin Wang wrote:
> 
> 
> On 10/3/26 11:09 PM, Luiz Capitulino wrote:
>>
>>
>> On 10/2/26 3:23 PM, David Hildenbrand (Arm) wrote:
>>> On 9/18/26 03:45, Luiz Capitulino wrote:
>>>> In order to enable THP support in shmem today, besides the user
>>>> configuration required, the CPU must support PMD-sized pages. This
>>>> is the case because of the following has_transparent_hugepage()
>>>> usage:
>>>>
>>>> - shmem_parse_one() and shmem_parse_huge(): Check if THP is built-in and
>>>>    if the CPU supports PMD-sized pages
>>>>
>>>> - shmem_init(): Since the CONFIG_TRANSPARENT_HUGEPAGE guard is outside
>>>>    the code block calling has_transparent_hugepage(), the
>>>>    has_transparent_hugepage() call is exclusively checking if the CPU
>>>>    supports PMD-sized pages
>>>>
>>>> While it's necessary to check if CONFIG_TRANSPARENT_HUGEPAGE is enabled
>>>> in all cases, shmem can determine THP size support at folio allocation
>>>> time. Therefore, drop the has_transparent_hugepage() usage listed above
>>>> while keeping the CONFIG_TRANSPARENT_HUGEPAGE checks.
>>>>
>>>> Additionally, we need to check if PMD size order is supported in
>>>> shmem_getattr(). Use pgtable_has_pmd_leaves() for that.
>>>>
>>>> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
>>>> ---
>>>>   mm/shmem.c | 9 +++++----
>>>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/mm/shmem.c b/mm/shmem.c
>>>> index 776dff8a848e..930657d05375 100644
>>>> --- a/mm/shmem.c
>>>> +++ b/mm/shmem.c
>>>> @@ -690,7 +690,7 @@ static int shmem_parse_huge(const char *str)
>>>>       else
>>>>           return -EINVAL;
>>>> -    if (!has_transparent_hugepage() &&
>>>> +    if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
>>>>           huge != SHMEM_HUGE_NEVER && huge != SHMEM_HUGE_DENY)
>>>>           return -EINVAL;
>>>> @@ -1524,6 +1524,8 @@ static int shmem_getattr(struct mnt_idmap *idmap,
>>>>       generic_fillattr(idmap, request_mask, inode, stat);
>>>>       orders = shmem_huge_global_enabled(inode, 0, 0, false, NULL, 0);
>>>
>>> I'm curious: why is that not handled inside shmem_huge_global_enabled() ? If PMD
>>> order is impossible (well, okay, it is possible, but we simply cannot map these
>>> things through PMDs), I would expect that we never list them as "enabled".
>>
>> Yes, you're right. What about renaming current shmem_huge_global_enabled() to
>> __shmem_huge_global_enabled() and then having:
>>
>> static unsigned int shmem_huge_global_enabled(struct inode *inode, pgoff_t index,
>>                            loff_t write_end, bool shmem_huge_force,
>>                            struct vm_area_struct *vma,
>>                            vm_flags_t vm_flags)
>> {
>>      unsigned int orders;
>>
>>      orders = __shmem_huge_global_enabled(inode, index, write_end,
>>                           shmem_huge_force, vma, vm_flags);
>>      if (!pgtable_has_pmd_leaves())
>>          orders &= ~BIT(PMD_ORDER);
>>
>>      return orders;
>> }
>>
>> Would this be acceptable?
> 
> Not a fan of re-adding the wrapper. I think you could refer to the changes to shmem_allowable_huge_orders() in patch 14 and filter out the 'disabled_orders' in shmem_huge_global_enabled() directly.

OK, I'll look into doing this.

