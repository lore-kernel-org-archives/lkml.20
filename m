Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792757641;
	b=LLzyyxJJL6RSIISxONyng+z8ESVob1OrN53zVGE7Dp/jC4n4qN/ykBOIQUgX3PvtLT3F
	 Tb7YxdDR8IitsYyBXd2eQCipSkatUWhsKGQRoloefPY6ARQP1PeKGRrNIgczUzWdnnNDB
	 ougK2Tfs1j3F0MwsYisd/IpI3Hvb2+aLrhr9iCQ67FoDP0g+jUKbMzeIwflQ2T/v9IDxK
	 J19sBlw35aSMahUWvdjw8Ffd2NT90c3VGZDWSX0k3YQ1siub97IXdoGBgwxX6+danq3bm
	 M8cHHoHbYU6rbX+nM9RYiSzn1seayG8a12hTdLoMbJ053g2GEcq1+mpXVZdbnpvkOjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792757641;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Z4f7ubQl5WS1WieEIVPxE9ayCQ7cIvJdX5Z1roKMeMo=;
	b=RXHh92C52mE2x+Qe/Ko1QPuEXC9FfUz/prKLa05dq75n6hQx/h0CO6aKlMZDUghgb2Jy
	 OPV94iO9tov6wRyp6XkJRNSHiTnEsddTQVqVYJz68CmAJzxtX3v2CK4Mw6rrV8a2LllSQ
	 V1OoiHrvcPH7Db29HeLGQJNs3vSrOAqoxt6cJz2V1oAToFeD+7b/Enwx4EGEYyrlz6zRk
	 wPw06vHI1sx3dnikneCu564PjGDhMXhncvDoPzYTPwz7hfWSiuqHpZumWTZvTaL7IsJN2
	 uWEDTl2HvJ+Fw/+M8CgzkOqMvYrr2hGr8z21fMhY98rTwFEXA/tB8ngddbd1grrEVYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MSeSHGzq;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9C7606A32F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A9C7606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MSeSHGzq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792757640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z4f7ubQl5WS1WieEIVPxE9ayCQ7cIvJdX5Z1roKMeMo=;
	b=MSeSHGzql6Dqv5bvd1VikTanqB6bjmjWdizDvYPBDpq2wWxihWXqVza2oF2tl2CEX0U0xK
	y+0CYmfJyBjEtufTOVjmnN3vJnlwO19oA6GM7sAn8+7A6Wk3uDJ6tvoGU0I3ANIl8lUiPe
	Qe0T+BQ3pO3II8xw6W1EeUJm5N83nGw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-hQaEDg9TPzWl1-2nJ-v_9A-1; Fri, 23 Oct 2026 08:13:59 -0400
X-MC-Unique: hQaEDg9TPzWl1-2nJ-v_9A-1
X-Mimecast-MFC-AGG-ID: hQaEDg9TPzWl1-2nJ-v_9A_1792757638
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91b529a8610so18908736d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:13:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792757638; x=1793362438;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z4f7ubQl5WS1WieEIVPxE9ayCQ7cIvJdX5Z1roKMeMo=;
        b=NetB/SU4ez27T1aJNZizRW4LQ+RNbzln2vnKnc3wHI8pGN2A2BTBV59oR/3P1kAD0l
         pab+PmeSSt8W0wCB7QyG46Oq1WORP/YK5KdNsw/H7Bd75nQacGZfU7ZeL0/xcixU4wob
         G3pJJdHa1Vn8GOSO+V4H7Dh1vE5lSXRaK3lOq13WYfQMmOAOpW+wxh9yCAP+8IY4ggQ8
         QU/YiNOFcmDAD8YWx2QgR9A5yrell8MjMm+M9czjjDF3t6Roid76W/StfpLw5YMh9Vxt
         qpfQh6I+x/Zknmn4Q0nLiEHH04OFBkKHGWEO8NZlyoy6DjW+EUd+zpklVWmWXyhM5bxl
         FiEA==
X-Forwarded-Encrypted: i=1; AKwUvBw3VxgWBIJxvo2Cu58SgTkpJciznfHT81kwpXshC4c6FWjLNmR8ZHdemdRbXC14kfFz82APYKGahKxD+TE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFcvfyWu59DXuS459D4eGGnbYHgzfRHdNgSBEFIaYyTWqgiwNm
	wCoCdDAT0o36kezmVpngGgr7yU897hEIRkhCwq8LuAx9LxoS499enmZ7fIvWoNH4Z1D+4XrLkx1
	v4J6tndBxymFuS8m7iZXl2JgoigVFVeAvQDSCQMyYb7wjHphVp3bjNHnDD5E6u2za+A==
X-Gm-Gg: AYBFou2ZSqkXkPcihcorzoVf1g4qIRrMC6ny2M2gMFAQUf4Fm1hVjSiaAjVX+4DpiYI
	FQgqgaIZkSB/jJyXgeNjMQfqareLjwNd8hUbEW1L5ThFV89AA+rxpzIOChvdbxkQdvGROiOTjN3
	jmgrN9J5aqGSy0begvVmh9uvA9oAXwOyRn5yItj6HbdzoaOAfqxr9ANNdbHUaRg7ftBdYXuv7PE
	fj1Uk/90QuSMjsERz/ij11k0jiJ8xRds2djBmZd1VOiTkl2X18NqDL4dNPHiFtiJ8eP3dTT3p04
	m7jy0ljkUDBQPSdIZfVVAVQJx35CmvAicBrHfMJxowQtOVF99QrBKSXrUv6WeQXphVXHoiuRF/3
	TBnw=
X-Received: by 2002:a05:6214:5c03:b0:917:8752:8214 with SMTP id 6a1803df08f44-91c3a609a10mr28184026d6.1.1792757638295;
        Fri, 23 Oct 2026 05:13:58 -0700 (PDT)
X-Received: by 2002:a05:6214:5c03:b0:917:8752:8214 with SMTP id 6a1803df08f44-91c3a609a10mr28183596d6.1.1792757637741;
        Fri, 23 Oct 2026 05:13:57 -0700 (PDT)
Received: from [192.168.2.110] ([142.172.30.162])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c3fd665a4sm8079006d6.35.2026.10.23.05.13.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 05:13:57 -0700 (PDT)
Message-ID: <9544f4ce-f5d1-498b-91ed-906b37122e31@redhat.com>
Date: Fri, 23 Oct 2026 08:13:56 -0400
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
Subject: Re: [REGRESSION] mremap() fails VMA expansion when VM_MIXEDMAP is set
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>
Cc: Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 David Hildenbrand <david@kernel.org>, Jakub Matena <matenajakub@gmail.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261023023106.515365-1-luizcap@redhat.com>
 <8c53e58c-f7d2-4e98-8d03-7ff1163c1159@kernel.org>
Content-Language: en-US
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <8c53e58c-f7d2-4e98-8d03-7ff1163c1159@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/23/26 3:16 AM, Vlastimil Babka (SUSE) wrote:
> On 10/23/26 04:31, Luiz Capitulino wrote:
>> Growing a VM_MIXEDMAP VMA with mremap(), with or without MREMAP_MAYMOVE, fails
>> with -ENOMEM when the address range after the VMA is free.
>>
>> This regression was introduced in v6.1 by commit ca3d76b0aa80 ("mm: add merging
>> after mremap resize"). This commit changed mremap() to use vma_merge() instead
>> of vma_adjust() for the expansion case. However, vma_merge() returns NULL for
>> a VMA that has any of the VM_SPECIAL flags set.
> 
> Hi,
> 
> 6.1 was a rather long time ago. How was it discovered just now? I.e. what
> use case broke by the change and prompted creating the reproducer?

The use-case that broke was an application running on an older kernel
and accessing a GPFS volume/FS. I was told that GPFS sets VM_MIXEDMAP on
a VMA because it inserts pages in the process address space with
vm_insert_page(). I then asked an LLM to check if there was anything in
tree that would reproduce that, it found the tcp_mmap() case and created
the attached reproducer. Btw, the LLM also told me there are more cases
in-tree that can reproduce this (but they require special hardware or
setup so I didn't investigate).

> 
> Thanks,
> Vlastimil
> 
>> The issue is also present in latest Linus tree, except that the code has been
>> refactored. In the current tree, the path now is expand_vma_in_place() ->
>> vma_merge_extend() -> vma_merge_new_range(), which performs the check:
>>
>> 	/* Special VMAs are unmergeable, also if no prev/next. */
>> 	if (vma_flags_test_any_mask(&vmg->vma_flags, VMA_SPECIAL_FLAGS) ||
>> 	    (!prev && !next))
>> 		return NULL;
>>
>> This issue was originally reproduced with an external module that sets
>> VM_MIXEDMAP on a VMA because it wants to insert pages with vm_insert_page().
>> However, there's at least one in-tree reproducer: tcp_mmap().
>>
>> Note that commit ca3d76b0aa80 introduced other VMA expansion regressions,
>> but they were caught and fixed early:
>>
>> - 6f12be792fde ("mm, mremap: fix mremap() expanding vma with addr inside vma")
>> - d014cd7c1c35 ("mm, mremap: fix mremap() expanding for vma's with vm_ops->close()")
>>
>> Below you'll find a reproducer and an attempted fix.
>>
>> Reproducer
>> ==========
>>
>> This reproducer was written by an LLM and uses tcp_mmap(). It reproduces
>> against v6.1 and latest Linus tree (2a08195e4db5). The issue is not
>> reproduced on v6.0.
>>
>> #define _GNU_SOURCE
>> #include <stdio.h>
>> #include <unistd.h>
>> #include <errno.h>
>> #include <sys/mman.h>
>> #include <sys/socket.h>
>>
>> int main(void)
>> {
>>          int fd, pagesize;
>>          void *p, *ret;
>>
>>          fd = socket(AF_INET, SOCK_STREAM, 0);
>>          if (fd < 0) {
>>                  perror("socket");
>>                  return 1;
>>          }
>>
>>          pagesize = getpagesize();
>>
>>          /* tcp_mmap() sets VM_MIXEDMAP on this vma. */
>>          p = mmap(NULL, 2 * pagesize, PROT_READ, MAP_SHARED, fd, 0);
>>          if (p == MAP_FAILED) {
>>                  perror("mmap");
>>                  return 1;
>>          }
>>
>>          /* Drop the upper half, so growing back into it can happen in place. */
>>          if (munmap((char *)p + pagesize, pagesize)) {
>>                  perror("munmap");
>>                  return 1;
>>          }
>>
>>          errno = 0;
>>          ret = mremap(p, pagesize, 2 * pagesize, MREMAP_MAYMOVE);
>>          if (ret == MAP_FAILED) {
>>                  printf("BUG REPRODUCED errno=%d\n", errno);
>>                  return 1;
>>          }
>>
>>          printf("NOT REPRODUCED\n");
>>
>>          return 0;
>> }
>>
>> Sketch fix
>> ==========
>>
>> In the fix below, I started with the same idea as d014cd7c1c35: on v6.1 I
>> made mremap() expand VM_MIXEDMAP VMAs the same way that commit did for
>> VMAs with vm_ops->close(). Then I adapted it to the current tree. It fixes
>> the reproducer and I didn't get regressions in MM kselftests nor the
>> tools/testing/vma test.
>>
>> However, I'm not posting this as a fix because I'm unfamiliar with the VMA
>> code so I'm not confident this is the right approach.
>>
>> I really don't mind someone more familiar with the code taking this over.
>>
>> diff --git a/mm/vma.c b/mm/vma.c
>> index 6c35f0d775ab..ac9a0a8a4be9 100644
>> --- a/mm/vma.c
>> +++ b/mm/vma.c
>> @@ -851,9 +851,15 @@ static int commit_merge(struct vma_merge_struct *vmg)
>>   	return 0;
>>   }
>>   
>> -/* We can only remove VMAs when merging if they do not have a close hook. */
>>   static bool can_merge_remove_vma(struct vm_area_struct *vma)
>>   {
>> +	if (vma_flags_test(&vma->flags, VMA_MIXEDMAP_BIT))
>> +		return false;
>> +
>> +	/*
>> +	 * We can only remove VMAs when merging if they do not have a
>> +	 * close hook.
>> +	 */
>>   	return !vma->vm_ops || !vma->vm_ops->close;
>>   }
>>   
>> @@ -1093,6 +1099,20 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
>>   	return NULL;
>>   }
>>   
>> +static bool can_merge_vma(const struct vma_merge_struct *vmg)
>> +{
>> +	/* VMAs without prev/next are unmergeable */
>> +	if (!vmg->prev && !vmg->next)
>> +		return false;
>> +
>> +	/* We can't merge VMA_IO, VMA_DONTEXPAND or VMA_PFNMAP */
>> +	if (vma_flags_test_any(&vmg->vma_flags, VMA_IO_BIT, VMA_DONTEXPAND_BIT,
>> +			       VMA_PFNMAP_BIT))
>> +		return false;
>> +
>> +	return true;
>> +}
>> +
>>   /*
>>    * vma_merge_new_range - Attempt to merge a new VMA into address space
>>    *
>> @@ -1152,9 +1172,7 @@ struct vm_area_struct *vma_merge_new_range(struct vma_merge_struct *vmg)
>>   
>>   	vmg->state = VMA_MERGE_NOMERGE;
>>   
>> -	/* Special VMAs are unmergeable, also if no prev/next. */
>> -	if (vma_flags_test_any_mask(&vmg->vma_flags, VMA_SPECIAL_FLAGS) ||
>> -	    (!prev && !next))
>> +	if (!can_merge_vma(vmg))
>>   		return NULL;
>>   
>>   	can_merge_left = can_vma_merge_left(vmg);
>>
> 

