Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE75280CE5
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790127481; cv=none; b=cTkZdXj4VtvRgoEedSDxIrVaK42jiZwEGjMixPYLc/W5Dwr7tyFiknRB0n5QkuxdA/PAenGJnXG16OJSWAKWf9vj7+VNpCBOzbj5h3AHNvXZpmkZZRJV6EnxH8uLNmo673k+aa7IBHmt35aJm4CFF6STUbED5iW+yzlp9klSoyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790127481; c=relaxed/simple;
	bh=6A12+1Agsn6iuWqdYYIqIXnHbkvvQZPU0ThVdZI8Lg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eSIcRq7yuJtaL/hju7X5x0yWuJ/ElggD4wLR4XVJY5Z9nUyK/dKHoHEz5yvv6LBIhVA9Dbx80ZjlvMTIWE4mgDfnNAcrSiDZ133BEwRqEpseDpPBPDniFVdl+lOyBg6z3pbTffsZYnWrxMn7Lmvj/90GbOhJi4BE5ThyQxiOWuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RIdidowT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RIdidowT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790127478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PxGCM8xxwnmehx2AfVy1IEcUOYJtD/f1L22IPBat84s=;
	b=RIdidowTjNzjwZ2m7m3B8H5dm5iZYA9mfq1NUr1QVRwxX0gL9s6mwYR2Pk8J0BAkOD8+aM
	GiFFIj6XdP8+Vo5a2RmsUnB/OfS/bOUUvaixxPlAGGZ1B20kcQhStIjd6ib4m7C04Yh0zP
	ydwZCu95Pd/veHBnLkffdATB7R/lYLw=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-MOQXXiHvMlOofg_QbDB_eA-1; Tue, 22 Sep 2026 21:37:56 -0400
X-MC-Unique: MOQXXiHvMlOofg_QbDB_eA-1
X-Mimecast-MFC-AGG-ID: MOQXXiHvMlOofg_QbDB_eA_1790127476
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-530d912b923so9144071cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790127476; x=1790732276;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PxGCM8xxwnmehx2AfVy1IEcUOYJtD/f1L22IPBat84s=;
        b=ms+m0X/M6uoYbU/euhXRKo6u/CQVnlLXD71KTTbtnxumSAkurwfaSTf0bySSvKmElR
         QwfgebHSe9ZFDzFiFMX7Riwgog4i/8uVy5ngncOxh9EUZ53TsU+5Uefn3c3wwwazJj0U
         lYrfOKc0t8Rm4xV4r9/OQL2LqGmq4U3ZquGDWp7diNxxVALr0GJs9VuHddZb2lEaqXYv
         TYy+xSN1AefbwH6nKMTqkfQwR/RIXu0RMqEHlrpTlOQ3ZGtWe0HUPkOq1ZpqczdgkKU4
         zSdcWiSJH0YCrXZjIobmrtQ7KLFSLiWMWYyySJ4ZVgujyTAX9Zjg2jQzZMndP5XNEXzY
         byzw==
X-Forwarded-Encrypted: i=1; AKwUvBzsbKPVk8dheQ/khhAEPa9fDHnMfZZk1e/k3UcaxXTwTiE8weDVJXYXKq/kuHVzQwRyZNlYxf/dRMALboM=@vger.kernel.org
X-Gm-Message-State: AFuF++lnJkBs38liUrLDPnxlvCE5PLv/XE4EhIit1MYynuH+jeVlVU2v
	tBMw/Yc9DdUqzWZDOzTM5bcdT87t4+nGcDkHZr6jNsYrJxeBNdalQfPH0/aPMNHmQ7atseg/Pn7
	utJqpgu1u2d9RXEGKWm+JwdrpNfHRds0rjXTfEEZM5r/I2sutBTvGOrb6ScIVW9Aq2Q==
X-Gm-Gg: AYBFou2BSYFwcsR/PChRyOGOMnuN6dEabMLZmFZrIIjPgAPFnShv0ln1pKLcsmZGM7e
	l8RYZxmvyjto7ugxFr1bDYzR2VEm3oHtSp8pBXO4Wf7rpxXVXU+FGQK43vSCtLiQ+NvOczBk1Aa
	PwTKaxfUx/cPboN8AhjXtTVCmzfnJ2NRsg90CrFtfzG8tqfjvUniV88H0tCMn3O7uP91aFmV0q0
	AbZCQFtr8hz/mVpPabbMEVZRMCvwhX9ziW0jLiHqnp1vLbNt7szRtU94jfZAEwk0vMn4FQVgEf8
	vd2ID5KYJ10mF/HzLoN9U1nm+v+8fDPg9te+IFU3umdXDya6fTAM3KOlbSt5u/wQ4Zxq/+rqQI2
	4Rwo=
X-Received: by 2002:a05:622a:d14:b0:532:f0a2:ee3 with SMTP id d75a77b69052e-532f0a212femr1998341cf.68.1790127476098;
        Tue, 22 Sep 2026 18:37:56 -0700 (PDT)
X-Received: by 2002:a05:622a:d14:b0:532:f0a2:ee3 with SMTP id d75a77b69052e-532f0a212femr1997961cf.68.1790127475647;
        Tue, 22 Sep 2026 18:37:55 -0700 (PDT)
Received: from [192.168.2.110] ([142.172.30.162])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb399581sm9358311cf.28.2026.09.22.18.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 18:37:55 -0700 (PDT)
Message-ID: <3d914185-ac87-4fc7-ab21-de184bfd4e57@redhat.com>
Date: Tue, 22 Sep 2026 21:37:53 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 07/14] mm: shmem: allow THP support determination at
 folio allocation time
To: Zi Yan <ziy@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, david@kernel.org, baolin.wang@linux.alibaba.com,
 lance.yang@linux.dev
Cc: corbet@lwn.net, tsbogend@alpha.franken.de, maddy@linux.ibm.com,
 mpe@ellerman.id.au, agordeev@linux.ibm.com, gerald.schaefer@linux.ibm.com,
 hca@linux.ibm.com, gor@linux.ibm.com, x86@kernel.org, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, hughd@google.com,
 dave.hansen@linux.intel.com, djbw@kernel.org, vishal.l.verma@intel.com,
 dave.jiang@intel.com, akpm@linux-foundation.org, yintirui@huawei.com,
 dev.jain@arm.com, usama.arif@linux.dev
References: <cover.1789695931.git.luizcap@redhat.com>
 <f74ada750d1910f8ea7e55955eb0c330747b93d4.1789695931.git.luizcap@redhat.com>
 <DLLHIE1QXVF2.38IQWBL11QXIQ@nvidia.com>
Content-Language: en-US
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <DLLHIE1QXVF2.38IQWBL11QXIQ@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/21/26 10:20 PM, Zi Yan wrote:
> On Thu Sep 17, 2026 at 9:45 PM EDT, Luiz Capitulino wrote:
>> In order to enable THP support in shmem today, besides the user
>> configuration required, the CPU must support PMD-sized pages. This
>> is the case because of the following has_transparent_hugepage()
>> usage:
>>
>> - shmem_parse_one() and shmem_parse_huge(): Check if THP is built-in and
>>    if the CPU supports PMD-sized pages
>>
>> - shmem_init(): Since the CONFIG_TRANSPARENT_HUGEPAGE guard is outside
>>    the code block calling has_transparent_hugepage(), the
>>    has_transparent_hugepage() call is exclusively checking if the CPU
>>    supports PMD-sized pages
>>
>> While it's necessary to check if CONFIG_TRANSPARENT_HUGEPAGE is enabled
>> in all cases, shmem can determine THP size support at folio allocation
>> time. Therefore, drop the has_transparent_hugepage() usage listed above
>> while keeping the CONFIG_TRANSPARENT_HUGEPAGE checks.
>>
>> Additionally, we need to check if PMD size order is supported in
>> shmem_getattr(). Use pgtable_has_pmd_leaves() for that.
>>
>> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
>> ---
>>   mm/shmem.c | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/mm/shmem.c b/mm/shmem.c
>> index 776dff8a848e..930657d05375 100644
>> --- a/mm/shmem.c
>> +++ b/mm/shmem.c
>> @@ -690,7 +690,7 @@ static int shmem_parse_huge(const char *str)
>>   	else
>>   		return -EINVAL;
>>   
>> -	if (!has_transparent_hugepage() &&
>> +	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
>>   	    huge != SHMEM_HUGE_NEVER && huge != SHMEM_HUGE_DENY)
>>   		return -EINVAL;
> 
> This can be deleted, since shmem_parse_huge() is guarded by
> CONFIG_TRANSPARENT_HUGEPAGE and after the change the if is always false
> under that guard.
> 
> Otherwise, LGTM. With the above code deleted, feel free to add
> 
> Reviewed-by: Zi Yan <ziy@nvidia.com>

OK, here's the diff:

diff --git a/mm/shmem.c b/mm/shmem.c
index c00bc1829fc9..d12995d41846 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -690,10 +690,6 @@ static int shmem_parse_huge(const char *str)
  	else
  		return -EINVAL;
  
-	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
-	    huge != SHMEM_HUGE_NEVER && huge != SHMEM_HUGE_DENY)
-		return -EINVAL;
-
  	/* Do not override huge allocation policy with non-PMD sized mTHP */
  	if (huge == SHMEM_HUGE_FORCE &&
  	    huge_shmem_orders_inherit != BIT(HPAGE_PMD_ORDER))

