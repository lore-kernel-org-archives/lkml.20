Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AF83C1977
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790142156; cv=none; b=k32XyYv7Q8CvZt8tJ2g3ra/zCU47pOJibdvIBJiSWIdo4F6jsSyG9DznYfYOqpbyIEruLwIHCyQ6G6/BrQLlUDLO6n3oZYdrzuDR0wH/FqPbq+gR73wzmYaIf3zKQ3S+Lg9a52WSrnoAacuTs9jgY654gEJXnbn5UIcgWB0C3+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790142156; c=relaxed/simple;
	bh=l/WcINsPOfm4Hy+AM9627RLgNd5yHLlMOy+wHwwzB1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iWzDMNJT/rmQ93LFy9hm5anntGQKHo/kW4Pw9m3UhXcsnoBReekphRWa49o6dYMFpRaRuy+k8lZVn8iFy9WevP81NZkPO9+fJADqAaJiKwjFEFx4+bQJwEls9+LfL3+lxh/TU9ZqU25YpOZSgDqOzSKNThw1CjDN3rHqFIsqecQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DbWlSziG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FtED4Ul3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DbWlSziG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FtED4Ul3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790142153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Owanqqlm2F+zzhHdgO4ILjDMn6+LQqunLulaO+aFb4U=;
	b=DbWlSziGQrXgrL459BxU0hmKggBnq70MGLsn5DAetOpdg60RGU2jK9NDGp9MIHC6D7qLFC
	Y+6owghp4UdvETppin9eaSi3v2HLdc37F6uaYCmfU2MNk33PzevRConLvWj0Xop3Cmn56q
	RbZ2xIzSsyeOFjIXdUWaQFHCMi/D1XY=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-294-Q1KJ8hdnNXaUlWRmqbXMzQ-1; Wed, 23 Sep 2026 01:42:31 -0400
X-MC-Unique: Q1KJ8hdnNXaUlWRmqbXMzQ-1
X-Mimecast-MFC-AGG-ID: Q1KJ8hdnNXaUlWRmqbXMzQ_1790142150
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-39d93d95a21so3512471fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790142150; x=1790746950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Owanqqlm2F+zzhHdgO4ILjDMn6+LQqunLulaO+aFb4U=;
        b=FtED4Ul3yUM32BEo5yy1rTVVqYPcganwyTurFbW0SaH3I2T5Vy1/GNPKqFyb4Gtjul
         khuGEFIIqgh1+BnMpWKwhUYNJkw8Vg1KGtMCyEVK190YJ/ueBy8DGLHc9lHLkrcSwOJC
         dvGwpa52bCI7aZoWjjJrk+13FhicUOkRGb/Hgo7NYOfNaxOqmXpntjrHir9gVUDxToby
         xhCdHDQDtM4jwsor5e/RDI1GVwwkOA9gRjfVK8Lq4uRMGdYqON0OZDlEBYYs7l6JiRUj
         GrSCpWGC01LrdWKkuWANCorLDvXY/PmY6XgcEjcQ/gFmqj8BGWMUoP5mFi70nEqHGqu7
         srCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790142150; x=1790746950;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Owanqqlm2F+zzhHdgO4ILjDMn6+LQqunLulaO+aFb4U=;
        b=fbjDCiD4PeIpByRUyY4L8Ch3D3y5o9EHS15xBKRxUXjac9aASi8LFnI9eAXP7iwh1b
         fNIdrpaiXq6isz7ELPXMQa4lwz3AO5BxcWD8N6UqP3YbAbFzsjnuDHxy4ExoVZSWYvX9
         HNtoilizMqJwz4PSBp0Orkv3YoAQx7yWbFSPe2B/1IFE4yczHjDoyoFCQYhHmq1ruZ8O
         UNLVhWiXJfcQvWV61JfuW8SC5Ws8uwCj4/XPS5AeJxcThXdk3vysUjhHNRKnl7GhynVO
         CaFfp9NJy1KXnTu/Ybrw2PTKd/wXmE/54XJwA1Fi8RtiW8zuYRxNQW002Z55PfX0qcss
         Lphw==
X-Forwarded-Encrypted: i=1; AKwUvBwioh9mh8tvTDcDCOU0dawjZNQa2DI0WtrCG/Q/l3t+YxFu5cJbSThxKrqrx4U75CxFGQfIzYI8ioiZtP8=@vger.kernel.org
X-Gm-Message-State: AFuF++l6QTJzWt/9RfRbBe+3memdURvAsCk8XRGA+05HATvFH4a9JIAg
	dtS/3qOCY2mx+CAU5TryR7P3XNUVYKr8N5QObFf6dJQqcombQZaLohQu8CfUKRPD9e0j+zYTHUw
	k+qf69gquGpH0NQWCkTL2IeSiYKzRoBn2ydrd8AmS/HFHK7l678MjsPHdFDL/DwAy
X-Gm-Gg: AYBFou1LgSPv05ore8EF+l+9YhY3v8CxzquPh/F8Bh8A3zpFaxG9lHFIR4T0I4sYvqt
	1rKepYLk8t5k4EhkzKNrievGbsKkPUN+EimyTlopHkZD3kalfiBxozF6Tw1rxAsbjFOhEmiu4Ev
	pACu8lLN+iWXNWnmIUuI8YJS9koXClkdJugXKmW9BgOQUCxWH80co3eMmJw9llq9RatCAw4tzpu
	8Qz0OTxmb5gv/yOqR6Z5slU/bu3HUvDjQ95aT2/Lfppr67poUTptrRAr+riP0APym6kQ6eJXe5/
	iLgZdckpR38J5Qsp36epuFYLuJbvftr4e96LcNWorUjl9dV6WvJHHMF2dWp1Zdij9/5UCW0YajN
	XwqSIoLNTg49LKlFhKwNdigjGABi+o3E=
X-Received: by 2002:a2e:bc0a:0:b0:3a5:e541:4205 with SMTP id 38308e7fff4ca-3a630525d38mr3157871fa.0.1790142149998;
        Tue, 22 Sep 2026 22:42:29 -0700 (PDT)
X-Received: by 2002:a2e:bc0a:0:b0:3a5:e541:4205 with SMTP id 38308e7fff4ca-3a630525d38mr3157781fa.0.1790142149515;
        Tue, 22 Sep 2026 22:42:29 -0700 (PDT)
Received: from [192.168.1.86] (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a62f4f10b0sm3956141fa.8.2026.09.22.22.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 22:42:28 -0700 (PDT)
Message-ID: <8523ee92-04c1-4e52-a418-a3ab110bca38@redhat.com>
Date: Wed, 23 Sep 2026 08:42:27 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 01/12] mm/Kconfig: changes for migrate on fault for
 device pages
To: Balbir Singh <balbirs@nvidia.com>, linux-mm@kvack.org
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Hildenbrand <david@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
References: <20260922053421.4092027-1-mpenttil@redhat.com>
 <20260922053421.4092027-2-mpenttil@redhat.com>
 <c2b28c18-3717-43d1-acba-05eaf9b1b9cf@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <c2b28c18-3717-43d1-acba-05eaf9b1b9cf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 9/23/26 01:27, Balbir Singh wrote:

> On 9/22/26 3:34 PM, mpenttil@redhat.com wrote:
>> From: Mika Penttilä <mpenttil@redhat.com>
>>
>> HMM depends on MMU notifiers. With the unified HMM/migrate_device
>> page table walk migrate_device needs HMM enabled.
>> Enable them explicitly to avoid breaking random configs.
>>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: David Hildenbrand <david@kernel.org>
>> Cc: Lorenzo Stoakes <ljs@kernel.org>
>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>> Cc: Vlastimil Babka <vbabka@suse.cz>
>> Cc: Mike Rapoport <rppt@kernel.org>
>> Cc: Suren Baghdasaryan <surenb@google.com>
>> Cc: Michal Hocko <mhocko@suse.com>
>> Signed-off-by: Mika Penttilä <mpenttil@redhat.com>
>> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
>> ---
>>  mm/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/mm/Kconfig b/mm/Kconfig
>> index 604c58199acb..b7a485beb9a7 100644
>> --- a/mm/Kconfig
>> +++ b/mm/Kconfig
>> @@ -687,6 +687,7 @@ config MIGRATION
>>  
>>  config DEVICE_MIGRATION
>>  	def_bool MIGRATION && ZONE_DEVICE
>> +	select HMM_MIRROR
>>  
>>  config ARCH_ENABLE_HUGEPAGE_MIGRATION
>>  	bool
>
> Acked-by: Balbir Singh <balbirs@nvidia.com>

Thanks Balbir!

