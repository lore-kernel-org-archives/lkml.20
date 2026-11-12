Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794499245;
	b=OlKh2P9WNQmdLRh5PtTGPZ0JeqhKVlOn0KzeaBgmla90CVCwQDm09nznDCwxwrkgTEIw
	 tFBQqn6mh2ePkwYitDWGddTp0yXXNPPHsp+S6p0aVKPtmad4IgkgZVucE+XGaFXJoasxt
	 atM0zuum/buRO7nXrIm/40YWx4j2j97ZFKmYXfMZ+YDI/FrQpVaKx0/mlWxGxhJySCuMe
	 g4TMjN2eMdlR3cus04S0KdW0XuGKPXw/lZuscjRQSMX5OSUqz2lgcrzrXhDLf9jF8mSU6
	 W+k3QwsFYCMfiNznQj6OIfjApEDNrnATVK8OddVjrzY4S0xG6Lxp3I3o4HFXGA0NEKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499245;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cLZ9NGqxukiZbjtfJg87qreFf42dg3znk3WBgpaqgLU=;
	b=0osfWJSuhR6uTu06KfJzfgbMCcXsreRMMZ5Kg1Cb1giYF9kEKHSNkuTSzwjwvJUw1FcH
	 OqwuEGgDtpVzxCcuhvvliJz6iAvzSMfvfpMHtt3pKlszTWLZ8hUnlHmaLwlpzbBy83Y1K
	 S0he3kjkwkunFulXv9VHOnvPSmFzXbrFcV55hGIrrsep2S5JZOxDvNWqYtis8pxGxZHn5
	 Kr+2H+0rpDrAmDS2N+z+/uSRsa5/XI+blm0GcET7kxiptsfzcvk6bRNo7Ay4Hha+N+CbW
	 Acs9MWnDy98GFll3gFDcVBU1TdDqNOt6qmVWhSgRSr8Puqgc9e295uJMWJYu0zdu9Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=lucVsY7h;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=D8o2rbiX;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26922606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26922606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=lucVsY7h;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=D8o2rbiX
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFXslO3616865
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:00:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=cLZ9
	NGqxukiZbjtfJg87qreFf42dg3znk3WBgpaqgLU=; b=lucVsY7hsgWdz5JKvxiU
	PZzoe5xEJzhjzFPMM5mG6/o90SpVCVEphIQt8OU/DxoSZ2bXw0hwY1mG9qiotHoN
	VBzPqEyHg393aZJLDQ1muW02DcA9KBO3k2wUF/aIgSn58tYi6EqtKMq0JFxg518d
	VmC8/YJeo6Lfu/UuLt6njpmwsj6PCZJ7+5BTgC7LhvLQyvm7TkNdAQbd4VYqrzME
	rJdng5QnZ5vI1hZmKKVu8fneOnHcR6t2rY3703hfHIJycf67cdMn81REfnaByAmG
	fOPxuIp8sEpEa9/koFSZPUuoPi5ZTK1mRowmSPNmabKDHnjqWRvybzimrYXAqo0P
	Qw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hwbbraegp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:00:43 -0500 (EST)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-536720195ebso88683971cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794499243; x=1795104043; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cLZ9NGqxukiZbjtfJg87qreFf42dg3znk3WBgpaqgLU=;
        b=D8o2rbiXvUutzK3u1vE2Bh9eecKiCaJIwrkRT905eQ8JoA1jyEAO9SLrLAUJH9tTuD
         YyWkD8hCu+047+JY8HyOAEEqGMqycH0hkh+9+jLWsMYU3dVEH+egNSHbASJ8SD8T7i1Q
         xpjtTAwn4jZap0z4W5AUmNP2iuVhfGUcTt7Ad3qPDVG3gz0C+0XvxxwRoBjjQtnr9ytm
         TaZKSobwenSgorbMAsHIKgZGAYrXQXbJ9R3oIgt1pisUS1MApxXEq2i+skTwB+LkAWa2
         Jt1Zzgj3KQfV272H1UecmZenk5nWiGQdvzZbawfAnNFWti8qmE5v8CzVkYSsqAWSkfvp
         Ec2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499243; x=1795104043;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cLZ9NGqxukiZbjtfJg87qreFf42dg3znk3WBgpaqgLU=;
        b=zur4kc/OXY7wFgit9pEf+WanVb8/6MXl3rpveD/Chc6f6e+ZKbMESJLKpijLq6vEJq
         ORxf1KV+qys6Grv/8UaLTjt1KRJ+Y+Zcb73+TjJxXEte1ey9s8Hmkm3D0o7oDzYK61fY
         o5fX1tBzxNMFKTVsE31Cdh5xSV+N8upRQtlUVMpPCIkOey4RtWEcE7wI/d9NNweJrQUX
         Qopd+S6qNLA5d07AQN0DEpLBVJR2L8kzmOwY+7fcV8FQDzBQBx6qIMxG9zHQ/0lmDLH6
         f1R745b4Yvh3ZKY8iyQeM6U5Ory1F7NK0dWbVReid/xpMv9xZd9fPxLFMU5wfPRtLayQ
         sQTw==
X-Forwarded-Encrypted: i=1; AL+hErF9A8ya3OMb1kVWzj3OWEBJ0pQ8kIRWzKsJyQknB2dkn3eLbt33lafw+bJ2INMRYkORsekEoCepWfqNVvE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Mw6VdXpMyHUVNkyIuT6ofmAekddEVLQizQ4MFjrj8y5qwwGbo
	F4SP7uqCpsCvxu7XYKriPAyLcS8Fq8Sixo+WWvPDAOIG7LsouU0r0LHbf+l2s0rZeue/JYUFIjU
	gU57j1AHU1+mm7UfBNq0mrNFL4U/gq6LecwvC8H4MIN/SkjDlX9khgN+Zqsz/zw==
X-Gm-Gg: AYBFou1qyZLkTpfW/l7p4/HM+aRYH3Vn8GZyhccM8eC0O2/4D7FuIKaJ+8cKtmwP7GH
	BAY/K0nauIvYvXfPMWKiXNOvNdKcLH2L/OCqL1K8LIhmhkVZ2j2+BnJY0OKsU+XxaLeTwEyndud
	ZBP6H9zvq5rWKC9dozXr5aBeMtEsTHwvmh0YDfAWEOUFAGzoqKnIJmKEJNjsJlhJddVx/8i3KjK
	Y0O+nIYYNOvQUNZiCZb11OhLJRUN5OeyxcfY4aTRxGyX2FemJX96w4a8jm+hbFn8AP+hXtQQvHX
	1qAVTthho+JA068zroLOftSs+DeYsj5JEYofgT9MUfDOuqEDv7AuD3ZKALP4PwlfpKQI/d5KpeK
	hXKVOk/3DTFJ8R1e64Ez/NEmgKgtuSnrPwWuITrGkBJfKePNa91ciIp9IoJmYylY68GKv9i5oUA
	QVhSKoAIBikaAA0tRGQDCllw==
X-Received: by 2002:ac8:5753:0:b0:536:5e83:589 with SMTP id d75a77b69052e-556c157d9a1mr97270841cf.71.1794499242754;
        Thu, 12 Nov 2026 08:00:42 -0800 (PST)
X-Received: by 2002:ac8:5753:0:b0:536:5e83:589 with SMTP id d75a77b69052e-556c157d9a1mr97268541cf.71.1794499241632;
        Thu, 12 Nov 2026 08:00:41 -0800 (PST)
Received: from [192.168.1.62] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef031a1e0sm74001026d6.2.2026.11.12.08.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 08:00:40 -0800 (PST)
Message-ID: <0fa7446c-e437-4d61-a185-07a9db23ee79@columbia.edu>
Date: Thu, 12 Nov 2026 11:00:39 -0500
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
Subject: Re: [PATCH 07/12] mm/mremap: resolve uffd state when the context is
 dropped, not during the move
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport
 <rppt@kernel.org>, Peter Xu <peterx@redhat.com>,
        James Houghton <jthoughton@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Balbir Singh <balbirs@nvidia.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
        Pedro Falcato <pfalcato@suse.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andrei Vagin <avagin@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
        Muhammad Usama Anjum <usama.anjum@arm.com>,
        David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
        Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang
 <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
        Kiryl Shutsemau <kas@kernel.org>, Chris Down <chris@chrisdown.name>,
        Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>,
        Michal Hocko <mhocko@suse.com>, Mike Kravetz <mike.kravetz@oracle.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org
References: <20261111-uffd-state-fixes-v1-0-00713d368976@columbia.edu>
 <20261111-uffd-state-fixes-v1-7-00713d368976@columbia.edu>
 <avWmiBbDYmy8MKiu@gremlin>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <avWmiBbDYmy8MKiu@gremlin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2MyBTYWx0ZWRfX7jhScFol3aqM
 OhsPOxRrLYKXAq4DwqcMUhJD3NNuVSJqPlqzY1cVgoLNxdpRm5+Ji+Bl9K3oHbaS+8gAZ5VOq85
 kctfb6T075adlOISssW9rJyj7e+ggAhImOeHYBNcqcN+VF3HO3Uk
X-Proofpoint-GUID: KGJOqjynBSAu61tJzVgNI8vXb-ChH0d4
X-Authority-Analysis: v=2.4 cv=RKQmjIi+ c=1 sm=1 tr=0 ts=6af5e2ab cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=VwQbUJbxAAAA:8 a=3l2Q2GrYxJSygdwfU5MA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: KGJOqjynBSAu61tJzVgNI8vXb-ChH0d4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2MyBTYWx0ZWRfX2GXVWw431FlH
 GtLYaOMcOxafw6DwlHeU6kXTqrjHwn73BS76Uk6bpD+6Yyd+Q2AtK26CCH+2XZQFkmXHf21FyFU
 umbmNLkfqqrS5ChE9UsehOk/Qp9jFTzvYENx6N7Yj7onpxU60VVhJXvP1m7y7YodPmPsyUa5G2W
 z2X0zPUnV1YEG1tHiHP9oLpRgXtM/nZCbrZlxans6s/mLy9TFi2Ntvu/Y4syZ30exznAICfXE5W
 2DPbCbdy89H42TNMy5kpsivw8MfpTt6bV/PGJbvaQtMuZqgGlX9ipM/j2DGA8zBRVAVjTv7RYkk
 h3Wgd59vGbnmN3OFENJBKJGjwA1Ue7KyedeNExDVPbr7ZDSvEhBwtr29YG4TES2AGzkG+rybjId
 eGokedPknecqtHFT/pHCbUX25BlEEeddgCagy/yfE/CVV8HxEw1MEITPzcEIeSoTIzVwM8p9GRL
 IvB8SjVtlPzdhR4634A==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11964
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=10 impostorscore=10 spamscore=0 suspectscore=0
 bulkscore=10 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120063

On 11/12/26 6:44 AM, Lorenzo Stoakes (ARM) wrote:
> On Wed, Nov 11, 2026 at 12:55:15PM -0500, Tal Zussman wrote:
>> Without UFFD_FEATURE_EVENT_REMAP, the new VMA of an mremap() is not
>> registered with userfaultfd: mremap_userfaultfd_prep() drops the context
>> from it once the move succeeded. The uffd-wp bits, uffd-wp markers, and
>> RWP PAGE_NONE entries in the new VMA must be cleared as well.
>>
>> However, move_ptes(), move_huge_pmd(), and move_huge_pte() clear them
>> from each entry while moving it, before we know whether the move will
>> succeed. If a page table allocation fails halfway through, mremap()
>> moves the entries back into the old VMA, which is still registered,
>> without their uffd state.
>>
>> Writes to a WP range are then no longer reported, and an RWP range
>> becomes accessible without a fault. Nothing restores the protection
>> afterwards. This requires a page table allocation to fail in the middle
>> of mremap(), so it is rare.
>>
>> The uffd state must only be cleared once the move can no longer fail. To
>> fix it, leave the entries alone during the move and clear the uffd state
>> of the new VMA in mremap_userfaultfd_prep(), right before dropping the
>> context, using userfaultfd_clear_ptes() like unregistering does. A
>> failed move then puts the entries back as they were.
>>
>> This adds a second walk over the page tables of the new VMA, for VMAs
>> registered for WP or RWP without UFFD_FEATURE_EVENT_REMAP.
>>
>> Like unregistering, userfaultfd_clear_ptes() also asks for the PTEs to
>> be made writable again where that is safe (MM_CP_TRY_CHANGE_WRITABLE).
>> The old code only cleared the uffd bit and left the PTE read-only. For
>> private anonymous memory this saves the minor fault on the first write
>> to each page that was protected.
>>
>> However, this adds spurious minor faults on shmem and hugetlb. When
>> resolving, change_protection() rewrites every present entry in the range
>> with vma->vm_page_prot, so a page that was writable and not protected is
>> made read-only, and its first write after mremap() faults.
>> UFFDIO_UNREGISTER and UFFDIO_WRITEPROTECT already behave this way and
>> lead to the same spurious faults. This needs to be fixed in
>> change_protection() and will be done in a separate change.
>>
>> The entries no longer need per-entry handling during the move, so drop
>> uffd_supports_page_table_move(). Where the old and new addresses are
>> suitably aligned, move_normal_pmd() and move_normal_pud() can move whole
>> page tables of these VMAs again.
>>
>> clear_uffd_wp_pmd() has no users left, so remove it.
> 
> This reads a little schloppy, I wonder if it coudl be cut down a bit?
> 

I'll trim it a little. I was trying to be precise about all the side
effects, and the spurious fault issue popped up along the way and it got
kind of long...

>>
>> Fixes: 0cef0bb836e3 ("mm: clear uffd-wp PTE/PMD state on mremap()")
>> Fixes: 763f43865fc4 ("mm: preserve RWP marker across PTE rewrites")
>> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> 
> This LGTM and is secretly a cleanup which I love :) So:
> 
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> 

Thanks!

>> ---
>>  mm/huge_memory.c | 25 -------------------------
>>  mm/hugetlb.c     | 27 +--------------------------
>>  mm/mremap.c      | 46 +---------------------------------------------
>>  mm/userfaultfd.c |  1 +
>>  4 files changed, 3 insertions(+), 96 deletions(-)
>>
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index 09176b290f76..468a49041b95 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -2616,18 +2616,6 @@ static pmd_t move_soft_dirty_pmd(pmd_t pmd)
>>  	return pmd;
>>  }
>>
>> -static pmd_t clear_uffd_wp_pmd(pmd_t pmd)
>> -{
>> -	if (pmd_none(pmd))
>> -		return pmd;
>> -	if (pmd_present(pmd))
>> -		pmd = pmd_clear_uffd(pmd);
>> -	else
>> -		pmd = pmd_swp_clear_uffd(pmd);
>> -
>> -	return pmd;
>> -}
>> -
>>  bool move_huge_pmd(struct vm_area_struct *vma, unsigned long old_addr,
>>  		  unsigned long new_addr, pmd_t *old_pmd, pmd_t *new_pmd)
>>  {
>> @@ -2663,19 +2651,6 @@ bool move_huge_pmd(struct vm_area_struct *vma, unsigned long old_addr,
>>  			pgtable_trans_huge_deposit(mm, new_pmd, pgtable);
>>  		}
>>  		pmd = move_soft_dirty_pmd(pmd);
>> -		if (vma_has_uffd_without_event_remap(vma)) {
>> -			/*
>> -			 * See __copy_present_ptes(): normalise the RWP marker
>> -			 * so the destination starts accessible instead of
>> -			 * taking a numa-hinting fault on first access. Only the
>> -			 * marker (protnone + uffd) needs it; leave other present
>> -			 * PMDs in the VMA untouched.
>> -			 */
>> -			if (pmd_present(pmd) && userfaultfd_rwp(vma) &&
>> -			    pmd_uffd(pmd))
>> -				pmd = pmd_modify(pmd, vma->vm_page_prot);
>> -			pmd = clear_uffd_wp_pmd(pmd);
>> -		}
>>  		set_pmd_at(mm, new_addr, new_pmd, pmd);
>>  		if (force_flush)
>>  			flush_pmd_tlb_range(vma, old_addr, old_addr + PMD_SIZE);
>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>> index cb2de24affdc..97bd29925476 100644
>> --- a/mm/hugetlb.c
>> +++ b/mm/hugetlb.c
>> @@ -5168,7 +5168,6 @@ static void move_huge_pte(struct vm_area_struct *vma, unsigned long old_addr,
>>  			  unsigned long new_addr, pte_t *src_pte, pte_t *dst_pte,
>>  			  unsigned long sz)
>>  {
>> -	bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
>>  	struct hstate *h = hstate_vma(vma);
>>  	struct mm_struct *mm = vma->vm_mm;
>>  	spinlock_t *src_ptl, *dst_ptl;
>> @@ -5179,31 +5178,7 @@ static void move_huge_pte(struct vm_area_struct *vma, unsigned long old_addr,
>>  	double_pt_lock(dst_ptl, src_ptl);
>>
>>  	pte = huge_ptep_get_and_clear(mm, old_addr, src_pte, sz);
>> -
>> -	if (need_clear_uffd_wp && pte_is_uffd_wp_marker(pte)) {
>> -		huge_pte_clear(mm, new_addr, dst_pte, sz);
>> -	} else {
>> -		if (need_clear_uffd_wp) {
>> -			if (pte_present(pte)) {
>> -				/*
>> -				 * See __copy_present_ptes(): normalise the RWP
>> -				 * marker so the destination starts accessible
>> -				 * instead of taking a numa-hinting fault on
>> -				 * first access. Only the marker (protnone + uffd)
>> -				 * needs it; leave other present PTEs untouched.
>> -				 */
>> -				if (userfaultfd_rwp(vma) && huge_pte_uffd(pte)) {
>> -					pte = huge_pte_modify(pte, vma->vm_page_prot);
>> -					pte = arch_make_huge_pte(pte, huge_page_shift(h),
>> -								 vma->vm_flags);
>> -				}
>> -				pte = huge_pte_clear_uffd(pte);
>> -			} else {
>> -				pte = pte_swp_clear_uffd(pte);
>> -			}
>> -		}
>> -		set_huge_pte_at(mm, new_addr, dst_pte, pte, sz);
>> -	}
>> +	set_huge_pte_at(mm, new_addr, dst_pte, pte, sz);
>>
>>  	double_pt_unlock(dst_ptl, src_ptl);
>>  }
>> diff --git a/mm/mremap.c b/mm/mremap.c
>> index fff0465f5e06..4564416a6994 100644
>> --- a/mm/mremap.c
>> +++ b/mm/mremap.c
>> @@ -198,7 +198,6 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>  		unsigned long extent, pmd_t *old_pmd, pmd_t *new_pmd)
>>  {
>>  	struct vm_area_struct *vma = pmc->old;
>> -	bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
>>  	struct mm_struct *mm = vma->vm_mm;
>>  	pte_t *old_ptep, *new_ptep;
>>  	pte_t old_pte, pte;
>> @@ -290,27 +289,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>  		pte = get_and_clear_ptes(mm, old_addr, old_ptep, nr_ptes);
>>  		pte = move_pte(pte, old_addr, new_addr);
>>  		pte = move_soft_dirty_pte(pte);
>> -
>> -		if (need_clear_uffd_wp && pte_is_uffd_wp_marker(pte))
>> -			pte_clear(mm, new_addr, new_ptep);
>> -		else {
>> -			if (need_clear_uffd_wp) {
>> -				if (pte_present(pte)) {
>> -					/*
>> -					 * See __copy_present_ptes(): normalise
>> -					 * RWP PTEs so the destination starts
>> -					 * accessible instead of taking a
>> -					 * numa-hinting fault on first access.
>> -					 */
>> -					if (userfaultfd_rwp(vma) && pte_uffd(pte))
>> -						pte = pte_modify(pte, vma->vm_page_prot);
>> -					pte = pte_clear_uffd(pte);
>> -				} else {
>> -					pte = pte_swp_clear_uffd(pte);
>> -				}
>> -			}
>> -			set_ptes(mm, new_addr, new_ptep, pte, nr_ptes);
>> -		}
>> +		set_ptes(mm, new_addr, new_ptep, pte, nr_ptes);
>>  	}
>>
>>  	lazy_mmu_mode_disable();
>> @@ -334,25 +313,6 @@ static inline bool arch_supports_page_table_move(void)
>>  }
>>  #endif
>>
>> -static inline bool uffd_supports_page_table_move(struct pagetable_move_control *pmc)
>> -{
>> -	/*
>> -	 * If we are moving a VMA that has uffd-wp registered but with
>> -	 * remap events disabled (new VMA will not be registered with uffd), we
>> -	 * need to ensure that the uffd-wp state is cleared from all pgtables.
>> -	 * This means recursing into lower page tables in move_page_tables().
>> -	 *
>> -	 * We might get called with VMAs reversed when recovering from a
>> -	 * failed page table move. In that case, the
>> -	 * "old"-but-actually-"originally new" VMA during recovery will not have
>> -	 * a uffd context. Recursing into lower page tables during the original
>> -	 * move but not during the recovery move will cause trouble, because we
>> -	 * run into already-existing page tables. So check both VMAs.
>> -	 */
>> -	return !vma_has_uffd_without_event_remap(pmc->old) &&
>> -	       !vma_has_uffd_without_event_remap(pmc->new);
>> -}
>> -
>>  #ifdef CONFIG_HAVE_MOVE_PMD
>>  static bool move_normal_pmd(struct pagetable_move_control *pmc,
>>  			pmd_t *old_pmd, pmd_t *new_pmd)
>> @@ -365,8 +325,6 @@ static bool move_normal_pmd(struct pagetable_move_control *pmc,
>>
>>  	if (!arch_supports_page_table_move())
>>  		return false;
>> -	if (!uffd_supports_page_table_move(pmc))
>> -		return false;
>>  	/*
>>  	 * The destination pmd shouldn't be established, free_pgtables()
>>  	 * should have released it.
>> @@ -434,8 +392,6 @@ static bool move_normal_pud(struct pagetable_move_control *pmc,
>>
>>  	if (!arch_supports_page_table_move())
>>  		return false;
>> -	if (!uffd_supports_page_table_move(pmc))
>> -		return false;
>>  	/*
>>  	 * The destination pud shouldn't be established, free_pgtables()
>>  	 * should have released it.
>> diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
>> index ad9d243dc64b..bf42fabb5afd 100644
>> --- a/mm/userfaultfd.c
>> +++ b/mm/userfaultfd.c
>> @@ -3161,6 +3161,7 @@ void mremap_userfaultfd_prep(struct vm_area_struct *vma,
>>  		up_write(&ctx->map_changing_lock);
>>  	} else {
>>  		/* Drop uffd context if remap feature not enabled */
>> +		userfaultfd_clear_ptes(vma, vma->vm_start, vma->vm_end);
>>  		userfaultfd_reset_ctx(vma);
>>  	}
>>  }
>>
>> --
>> 2.39.5
>>
> 
> --
> Cheers, Lorenzo
> 

