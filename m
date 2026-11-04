Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793769586;
	b=11GP9e5kROksbFY2aExmE6v8Ton9mggvBTJ2yxagL9/2lJndEk8/BaB6FJKJwuBanfuo
	 IRNCPKSkh6ERLQYKZ9jwGSWdcx0QuzimhAYVPTVkLeLg2WRtA4o96wXQcW+99hCuyt5R4
	 Lz2ybfN4yl/Rwv73ney8o+9WHtybJfNRFxglexzcU24y6SK4xkb9cEi/ueQe6yPnYEtiP
	 eAE+0+DzKPNmWu/FcYxz7LTh+ygGRd7cObFbDEdXsxY0raVpV+hp6FT3+E+PRLb+Yn4gv
	 Ryj10gydbjLQUSKmWzPAYhdtRwBAf2OolfE44KuoauIOPEgjHAUcbUTvut3LywpeQag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793769586;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Y66vBh+3OjeC/M09B6lCrJHfyOQPIK6q8FMDKTT+hpU=;
	b=SF/CXd/IHkwrXA2WZOrpHSjBPzivtMi2FkfojC54w1zsVn8firNdSjUgKmCwoTUOakUw
	 8o/NjdEbiNyN/WmJPKUOdXQbX9A/D+KX3gzRJnhsf5LrWULIibJcQwujCwjKlwQxYr3ma
	 j1uESNVHMs5ZJkGCkz9Wjgj5jDjd1kMoKBZgTpCiK4UPj8cgqkN6IWPd6Gaiq/l+5db1D
	 VYGp7b7bZWxp5SPH5rceIqKhr3TvwC4aeMgijrqtucVrJVG44pGVhr98fvP+RoQRyXr6L
	 zUfNX4sJXNbGStvaZO3yFyqYB48OjomGKFWWEkNVF6zJeMWbtOmPqd/bfLhBZd/1dCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LCJMNaYH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ixAwNKjr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71849606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 05:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71849606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LCJMNaYH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ixAwNKjr
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RJQr193758
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 05:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y66vBh+3OjeC/M09B6lCrJHfyOQPIK6q8FMDKTT+hpU=; b=LCJMNaYH6N5a4qfb
	AMsqRxjQ9Sv1D7qbDHZTHjggja1g24ojO+q5ldBJ3fJSp+30pRV7E/SKJpJTVroR
	L6Ul8XGUjYTx7i4v88WZhlzgdXUnJyD4KfQDKNOM5GB3puAjspWmdMR+Dp0flvhc
	OwxwxptqAvh88n/vJErz+pnwXmszu74kDBW/0qA4u9bayIB5jw50RUmtOMkbjagz
	pJzKywW729Y6JF6nzTyuYXNhjXIDflejcSoVXfbg8Hg9CiEyQV6wCMBFDNFK05Bc
	wKJrmlavURCofrB3733yQd3t3f6pq4GNJNo95+7fhlDgyzDSc+ivjYGMjNIXd+2s
	Xd+5Rw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8nj32n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:19:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so624036eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 21:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793769585; x=1794374385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y66vBh+3OjeC/M09B6lCrJHfyOQPIK6q8FMDKTT+hpU=;
        b=ixAwNKjr/ZDJ+Z+DR1wJWiCka6AzOHtg3gxwqkYfGvAkyr9yX6gg09+5JVPozzOvTc
         w255ErIDWbh/ATfk0n8hL4T0TzM3TnKXYw0hGhkCIhYj0sH9CovgqZvQNQFzqqzb1e9V
         qnkMn4bj21Yx+WfJUWZiFxaGidliUxbuMUwMBQc+neM8EtKEL6Zju6PDhQ1uZeiImhYk
         sZZtG9+9SlvvF0DF52+f2f6J6LhcSXpoTpvJJCfcsbmeyKepRF2Gd6wVUYM+y8jxAj7c
         h/zfEHMLirSuJOq1IxDCFkLoAvQYgq6w9Tc0QyT6M9BcM0xt6FP4tJBKoMS3RozyCSTO
         y1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793769585; x=1794374385;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y66vBh+3OjeC/M09B6lCrJHfyOQPIK6q8FMDKTT+hpU=;
        b=bdl+OC6uBeMALFb7NaGDUXQqigGdf+s47k25DvonKl6jg4YeJcd0S6uvCYB2xOYSiS
         pk5ChKR/MYOLFk1mNEVptbyrsk1pdx92BGSobFNAUGckL81HYwEqfaHCChvMwFK7ENx3
         AwYGHRx7QeBDzMtkbh1e/8V+4Sb5FSeDJp0Aqn0xw2h18cpGTRemr3WD/+xlkoGMrZGJ
         LvbJ9u2AooS/QNkfS4tUY5YV6QjF+W8bzCKAUz4sy1SAvb0AKfG4rVS7LaYVrTCO4zbL
         PzAy//OKvWuWi4KeVgJotd1aEG0/RStEiobs4kx0bx16Zgp5EOc2IJr+EC241bT3iVKz
         OvoA==
X-Forwarded-Encrypted: i=1; AKwUvBwWh3/lCJS0ZsIoqVlbGPmqbD6ml6wgAgBzr3aHeIu4kqxdfQlZepDpeXi8BQ1NTysBIYMMt8i5XyuALFI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RSkY4DlqEUhzL4qwFOHunJN+4UaMEOmj2ukc3Zj/vCk4ZHSTh
	kRkFi3YY456us6uSWkGX2gipW4EPgMETFK9tnp7dbLzaJz6ispfVwY30HKv9WNlR6yqmP6CNw2J
	vHVszCHKef11hVrWLCoRI9iFFxSj8+01bRwd1Y0sgUxD3x/EvuRXIQTIgSxm2L6YJ3HQ=
X-Gm-Gg: AYBFou2Ri3z9aGFLXrBt7scN0mMHZ0k4PhgJTqaGuA0gl2PIKfimcM0Pw30VxMb3BFW
	mQjCoTSxyBgJqL3wJ0ZvUtcm/GjDwIUa/a/d9LywExPfPiV/sC+Cenis6hK7qyJ6DpEY8fI3dvP
	YMLYQ4VNGFsmVRVc2HIMdbdVMd/FiegnSGonjNV1beNnvDtWGAN9F1i3OjPR3DDoPHS6KrNxMuj
	WRZXmr6KscGQCJEl5MW0NPMB4k7Y9l412ssd8JP+kR0vP3jov22IP8tEHKypefnU4AX7qrYgUaS
	ksz8JBZ1oZlyXK+YbK9au4fWd+X/Oi877hUgKzPeS2khg9mz0WDCMWGPx+hgwfL/ctnPaakaIDA
	dbuSWMbbQsFcnpIpfTwO6rToNfd7TNiSWA8hJXgbSMVt/sz8YXlPAoTSi9wjMD3ahEthphO1Ei+
	2A
X-Received: by 2002:a05:693c:894e:20b0:368:7c9d:1577 with SMTP id 5a478bee46e88-36a4238420dmr22199209eec.20.1793769584593;
        Tue, 03 Nov 2026 21:19:44 -0800 (PST)
X-Received: by 2002:a05:693c:894e:20b0:368:7c9d:1577 with SMTP id 5a478bee46e88-36a4238420dmr22199169eec.20.1793769583908;
        Tue, 03 Nov 2026 21:19:43 -0800 (PST)
Received: from [10.218.18.30] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39c5f0csm3356074eec.29.2026.11.03.21.19.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 21:19:43 -0800 (PST)
Message-ID: <ae386ef8-324c-4704-bc0f-a1eca3280399@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 10:48:48 +0530
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
Subject: Re: [BUG] mm/memory_hotplug: panic due to race between compaction and
 memory hot-unplug
To: "David Hildenbrand (Arm)" <david@kernel.org>,
        Wei Yang <richard.weiyang@gmail.com>
Cc: Yuan Liu <yuan1.liu@intel.com>, Oscar Salvador <osalvador@suse.de>,
        Mike Rapoport <rppt@kernel.org>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Chen Yu <yu.c.chen@intel.com>,
        Jason Zeng <jason.zeng@intel.com>, Vlastimil Babka <vbabka@kernel.org>
References: <20260903095543.3752338-1-yuan1.liu@intel.com>
 <1d625a60-9473-4f48-a384-7d756ccb7135@kernel.org>
 <20260910031609.qbn2qcxzbitau5xc@master>
 <12147238-575e-49ea-aa83-ea25c660ee38@kernel.org>
Content-Language: en-US
From: Ketan Kishore <ketan.kishore@oss.qualcomm.com>
In-Reply-To: <12147238-575e-49ea-aa83-ea25c660ee38@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyMSBTYWx0ZWRfX8Osf4MJ1D2O+
 EJpTFHa2gaqomPIfQybdK9eCbVTHsmMSie640MXvSpVVwxHqx1FvLvXGs8VvT4GSgRYAbbuMpXE
 I24nlc+K0JomPNorFb1+caZMy4Oi+Kdw6ooYcVUQuX1/qhwo8fXza/yYDHOWRa0CwOJldfnQgQB
 EmANUgBK8e/BhUts9Je5CdKQXkmGQ3zi2ifY4ogxMVSHo2m6dz2z4kxP8R2lu+Vgzq1sFpIb4vm
 bRhTGrBpHLMEv2dNIrufI71sqCHf/iEtwk0261DA288wjpSd6OijqPzQet/jDibUoTHCQSXemLj
 ryO4zbIcrCKMumIADDdBhbbOw3v+6Na1ALfticS1KZPBp1n2v5MvtNNu96VA6bS9fkh6SqolFN/
 mvRqMkc8V3fIwLc7FnyfZPlAqN8YFRILakXhl9KXSV0RSK43uBKk0tfoIVQ6V3LYP16GJ7K6uA9
 GKvT8pHP9yIu6k5glNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyMSBTYWx0ZWRfX4q0jJsFt7lYM
 2UNVErGs87UT0GwOuim9kKqyxhy6x0ajw64/4Vr+qer6/sgT47yoLtK8C3nvHdn+U16Z/0lzAdD
 Xia9sDaPNDFJHazaqv7D7WGJn9VP1s0=
X-Proofpoint-GUID: 1z9wftSbdg5hg-XEokMgrL35T-x3jnQ-
X-Proofpoint-ORIG-GUID: 1z9wftSbdg5hg-XEokMgrL35T-x3jnQ-
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aeac071 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=VxVhGbjf2C-XuTbq:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=YA6iiL-fw10CvUDPNLYA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1011 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040021



On 9/10/2026 1:10 PM, David Hildenbrand (Arm) wrote:
> On 9/10/26 05:16, Wei Yang wrote:
>> On Mon, Sep 07, 2026 at 04:27:50PM +0200, David Hildenbrand (Arm) wrote:
>>> On 9/3/26 11:55, Yuan Liu wrote:
>>>> Hi all,
>>>
>>> Hi!
>>>
>>>>
>>>> While stress testing memory hotplug on a VM guest running an
>>>> unmodified vanilla mainline kernel (7.3.0-rc1, as reported by
>>>> uname -r), we hit a kernel panic in the guest when memory
>>>> hot-unplug runs concurrently with memory compaction.
>>>>
>>>> The kernel was built from mainline at commit:
>>>>
>>>>      cee9395acd80 ("Linux 7.3-rc1")
>>>>
>>>> To be more specific, after a large virtio-mem hot-unplug, the guest
>>>> kernel takes a fatal page fault in suitable_migration_target(), called
>>>> from isolate_freepages() during compaction.
>>>
>>> Sounds like a real problem we should tackle.
>>>
>>>>
>>>> We are not sure whether this race is reachable under realistic
>>>> workloads or only under this synthetic stress test. Sharing it here
>>>> in case it is useful, and in case this is already a known issue.
>>>> Thanks.
>>>>
>>>>
>>>> Call trace (top to bottom)
>>>> ==========================
>>>> - RIP: suitable_migration_target+0x5/0x70
>>>>     isolate_freepages() <- compaction_alloc() <-
>>>>     migrate_pages() <- compact_zone() <- compact_node() <-
>>>>     sysctl_compaction_handler().
>>>>
>>>>
>>>> Why the race happens
>>>> ====================
>>>> CPU0 (compaction free-scanner)          CPU1 (virtio-mem hot-unplug)
>>>> ----                                    ----
>>>> page = pageblock_pfn_to_page()
>>>>     /* checks pass, section ONLINE */
>>>>     /* returns valid struct page* */
>>>>
>>>>                                           offline_pages()
>>>>                                             /* section -> offline */
>>>>                                           __remove_pages()
>>>>                                             vmemmap_free()
>>>>                                             /* struct page UNMAPPED */
>>>>
>>>> suitable_migration_target(page)
>>>>     PageBuddy(page)
>>>>       read page->page_type
>>>>       *** not-present fault -> panic ***
>>>>
>>
>> Does it mean, the combination of pfn_to_online_page() / PageBuddy(page) is not
>> safe, when there is hot-remove, even for other users. Not only compaction.
> 
> There is an inherent race between any
> 
> pfn_to_online_page() user that then takes a look at the memmap (PageBuddy,
> whatever).
> 
> Usually, that's not really relevant, because for things to go terrible wrong
> (instead of only being slightly suboptimal :) )
> 
> You have to run both, memory offlining *and* memory removal.
> 

Hello

We faced similar issue internally on one of our target's guest VM run,
where kcompactd de-referenced a vmemmap pointer for a PFN after the 
hot-unplug path had already freed that vmemmap,with no lock preventing 
the two from running simultaneously.
Call trace:
   suitable_migration_target+0x0/0x8c (P)
   migrate_pages_batch+0x1b4/0xc74
   migrate_pages+0x150/0x654
   compact_zone+0x5bc/0xb30
   compact_node+0xa0/0x18c
   kcompactd+0x228/0x4d0

Would it be okay to introduce something like "try_get_online_mems" as 
shown below to try a readlock in compaction path for hot-unplug to wait
for kcompactd to complete before freeing the vmemmap?

get_online_mems()
-> percpu_down_read(&mem_hotplug_lock);   /* may sleep */

try_get_online_mems()
-> percpu_down_read_trylock(&mem_hotplug_lock);	/* won't sleep */

   kcompactd / compaction                  memory hot-remove
   ----------------------                  -----------------
   try_get_online_mems() -> true
   holds read lock
   uses PFNs and struct page pointers

                                           mem_hotplug_begin()
                                             percpu_down_write()
                                             waits for readers to leave

   finishes compaction
   put_online_mems()  // releases read lock

                                           writer acquires write lock
                                           offline/remove memory
                                           free vmemmap
                                           mem_hotplug_done()

And to skip compaction if taking the lock is not successful here.

Appreciate any suggestions or feedback.
Thankyou.

> For things like
> 
> page = pfn_to_online_page()
> if (PageBuddy(page))
> 
> That's unlikely to hit (no reports), and we could likely easily fix it with the
> help of RCU.
> 
> It gets more problematic when we do things like
> 
> page = pfn_to_online_page()
> ... do all other kind of stuff
> if (PageBuddy(page))
> 
> (what we have here)
> 
> Using RCU is usually not easily possible. Mostly only comapction does something
> like that.
> 

