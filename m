Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794608824;
	b=p2AnpsLKxRU/J9Zd0DgEc7QCa2jSFVEBLOk9dz5tsCXEM5G3bK2Rs4/QtcGhPSih27NS
	 CUPNDBsFjVQ9Nb+lqLz2hZv1KGiDK/7Xm0mrDqahG+cP2zbPFAKg6FVEe18og12vKP/7w
	 y+lyYXH+mzgnsHne18tRelphbQWcwnLvmwghbPjWYrrFjmgZcmVx7KEQa+7kW5NEr2HjT
	 2B1FKqNScr5neG1tScdQ252VqPMqBA4OaOjG5cN4O8uTPmxJz1TsoqcMmGtm7KMDefdDS
	 ft1WwZoGRi5Rk2ZjeTvkyi1z8mgRRDFThdchrXJh7xr/JrPbm2zJ8pMEULf7QYS6p9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608824;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=d3ajvUnUKvbfDkC0sZyMQAhOCqZi8Pjte/39RE1cKJ8=;
	b=doAzBE/QsHPeBBBM+NOm7JJJ0acA9GZ/ulQSNTcjNxSlhwvCnIv8vMytMxqiL06o3SnN
	 Cjk6aGUE6GyHN7T7Jf7X91oG9N21xUDetomi6N0/Dmfso6/ByfK9yo/tesog3hXwaBwNq
	 mVj9SEbn5OuI2DtEpKoEnedaQ3i+FWLUb6nAWegqZd0ZlnTlYdB5XdNXS300Sa3IrV+lj
	 90KE1A3Yz0jU9KhztB98Lj8UAYQncGxviMqhT0bTEyvIvyyy7ZWNcphuUAn2Z/3KPgBMa
	 +/4gOqUqoKIsxtsd7O0dXR5t3QBXYoTW/jhWiXG456p3rJn3/OAGF09qelPF2aXDhNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=HGicbANG;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=u0UsTmDL;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D591606A889
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:27:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D591606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=HGicbANG;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=u0UsTmDL
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADLmXtS2962893
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:27:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=d3aj
	vUnUKvbfDkC0sZyMQAhOCqZi8Pjte/39RE1cKJ8=; b=HGicbANGO9fUbtt/aiBn
	O0sACCFk6E8cmIzgCKsA6nhZEdR0F7t9f2sulpxbXAbF/IKZuu/jWZ3k1aHAMYl5
	Gyzsr6ysglkRCuVhPwS0miRm3Jc69PfXSLEEw0dUQD0DyScKj225DNGi7R7gEFH6
	TW9XgQgXErQ+NRu6TcRjYquK5cRK/B656dBLMGr0L3iUfXE3Rt9siZxNJzWSSmBp
	l0DbMRJvG/SyMolN8iAnTNIsXWNZQnRoIU2TYs5MHLlwvvlSyXx58IBELc6AlaZb
	pG1aBzZYZSS7kZrJ6b5exQE9kIATQ80gcBS2/hSSkq+YnAnjo6KL8ZZAHA0U5tVt
	sA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hxa3u0pev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:27:02 -0500 (EST)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91f0f4c70cdso22612076d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794608822; x=1795213622; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d3ajvUnUKvbfDkC0sZyMQAhOCqZi8Pjte/39RE1cKJ8=;
        b=u0UsTmDLKYO6k/GFcpFNcNv1WPSYSVTlOm2DbH238vHUR4sYPucywXaRgIJR0uVvP1
         UrzegtEVdrCW2naF1A3u9fWYNl//kQlIJw0z2Tj6MmBUWrqYgWdwxmJW4RM/4liPJl1v
         INQVKg51ZEVQnaQw4sJhfagC/iA54AbyYpS3tebRJqGexBaP5XVHSSli2JQeKesqMxs4
         GcLAiOG5BAGDvjayPf+GBcIIWTnCw9kCnASclf7sz7qm447EzuwqNGWx8I1QNXgR6CHT
         ZCD6ZeWYoLeRg705bJkgqQVkdoXZXkrU/CJXvpRUv6uBAu54DgnGQOse14GXsyU0k7RE
         INtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794608822; x=1795213622;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d3ajvUnUKvbfDkC0sZyMQAhOCqZi8Pjte/39RE1cKJ8=;
        b=xQLS4VQggLKbaXPi9Isr+xBCd3ffjxAxuKH8jMnYGpU2aTOAedG8PORE9pU8GIPn5l
         qCDMDUxPgl5WUUcDLRfe//AS9IpxXj+BR8hAO+sOX1a2YYdzjrEZ41BJ2B4v9aAlwqRP
         VGVIJYarsS1Exjnu2uGf8sYxKzxSqD25dmBMzj0H7W/bRLmufO7zGjgbJi7HfCnAfG2I
         jVvE1OGtMOVKYhX9BymnsbGJXPDLtkpQGsvSEDOQtVhuSQ0ok4K4/HC4wcAYc7TwOK95
         WNNHngqVmGGDk8Vhde+E9+YTt51shs9OvQeu/r34ykXBZSb16cm1aJD3aPQHDGNMaJ1t
         0umg==
X-Forwarded-Encrypted: i=1; AL+hErHl66jX9by+fUahWe9fDbdAY1/cwvfPntdTS1VJVYpqgHs7I2jeZEhO4EV2kMOQKg6GCcOcWJuqkC41gQA=@vger.kernel.org
X-Gm-Message-State: APuU4Z94Hs5eqCg5BB6ozjUO+uqwypcnLZpeZg6167RuhYadto+LHTOQ
	PNn6n0i0ENhp1kseLCx8okJwJxbBp7UoaWbfG0mYmrKD0Gp9X6BlcxRAmBIDHHqBSuWia1hl4hi
	x3G2c4jcmhzK/eC89/w/VWH6hnxKo4tWqHEaskTolsK+JgpcyHiigFyvyDlP9VA==
X-Gm-Gg: AYBFou0Pm/pImhe1l8Fi3rP+y4C00hnsiDYFXi0N4BodgaVHF3fnEGQx8hilgypPVTd
	IktkTdXcwJC+mGiJwNgpDgZ0RzeGp4QOuOAnmEbFpOnuuNePNYKBIOaekCVRLrw7CITv7/2QXiz
	+mAlta0G8LSr5njxf6kgqwHcpaG0ST+GJymV0XPvNd7ACr8IVFG92DfgXNx3sR0gBf8nWeYbM+B
	SUP6RCaJXTWTrQ7YYThvw1woTkAw8+DmkJ/utc3uPWH3Et7CzNZIeK2IDCXDnwNrbSDVQ1Dxhtb
	yrP54qmSzZFhQ2HQw2YhkPXRNVFd0Hq8C+J1/aBhgU5t+YRFv8BmLp6qwmbTqh4ujSsmF+UifkU
	4RYx4vpsIJSoR3G5gQiNyeOIQM3XEh3c91dkS799DKNzGN8qeLtvFMdsBRvzyZ7l9hSkaF7kvrv
	SB7zVoXUbR0I5uwLkLO0NK3pOQ/GY=
X-Received: by 2002:a05:6214:8093:b0:91f:26f7:281b with SMTP id 6a1803df08f44-91f26f72946mr45436836d6.43.1794608822135;
        Fri, 13 Nov 2026 14:27:02 -0800 (PST)
X-Received: by 2002:a05:6214:8093:b0:91f:26f7:281b with SMTP id 6a1803df08f44-91f26f72946mr45436426d6.43.1794608821604;
        Fri, 13 Nov 2026 14:27:01 -0800 (PST)
Received: from [10.207.116.169] (nat-128-59-178-153.net.columbia.edu. [128.59.178.153])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d73258sm30148506d6.24.2026.11.13.14.27.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 14:27:01 -0800 (PST)
Message-ID: <c3a51a9c-083d-4c76-9a62-b7a6fe69a121@columbia.edu>
Date: Fri, 13 Nov 2026 17:26:59 -0500
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
Subject: Re: [PATCH 08/12] mm/migrate_device: do not migrate a uffd-protected
 zero page
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport
 <rppt@kernel.org>, Peter Xu <peterx@redhat.com>,
        James Houghton <jthoughton@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Balbir Singh <balbirs@nvidia.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
        Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?=
 <mirq-linux@rere.qmqm.pl>,
        Andrei Vagin <avagin@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
        Muhammad Usama Anjum <usama.anjum@arm.com>,
        David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
        Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>,
        Byungchul Park <byungchul@sk.com>,
        Ying Huang <ying.huang@linux.alibaba.com>,
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
 <20261111-uffd-state-fixes-v1-8-00713d368976@columbia.edu>
 <179454988585.482102.2051616940227067987.b4-reply@b4>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <179454988585.482102.2051616940227067987.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Z7hdqw8E8qOrAH7wz0CdBEq5lg7Q8Le8
X-Proofpoint-GUID: Z7hdqw8E8qOrAH7wz0CdBEq5lg7Q8Le8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA4OSBTYWx0ZWRfXxRtJP3T7TpCC
 bqPN81f7eXqPvGpzNust1Q7rtQc2HBCr0Sq1BG41APU5FaH4e2LNImpLM/KBxtbPnwEd9UVj97B
 cRFV8ey5Lc0j4FPZnUV/7nWGMiqaEH0fIfbeDGoL78peaEhkL5KDC+xBmwWhfAzndScU6LCnC7g
 ICrpmPZJI39CbpnMw+m7VSI+6KLretxAfAyG3cRT2LHFzdjzZ+4lzEcptbO+cUbocxEW5zH4jvj
 9VbEaQ+BE4I+gRSxs8p58Rgq8CarOrvROiD1eN6UqpWO4r7np8vKTDvYsap77t9ijCAtyPBYBmY
 xhIoKRlcJgPfbzT+AvOiuH/ymb5IPVPPQP8r0EBkrYseRZf489VFbgPcIAINiZUqdZo6Fvu4I+I
 QPdnPGXf3hIivexKBDRMrmWK11emLF7f9XYwfsn+ESeF/N2U+1kgZNrgIrXFJdyGUO10eixS3II
 nt1cyCmFqmy1CbWZ+Bw==
X-Authority-Analysis: v=2.4 cv=KPfPn1Fo c=1 sm=1 tr=0 ts=6af78eb6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Y+j3KQtDOE8TDC6EXH/Ajw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=zVEXuFSi5soEGCQpuH4A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA4OSBTYWx0ZWRfX4inTYDcGnM5V
 m2zt8wcMVWGgLGXaQszUW1fuMNNbhkhGzBMrhJT1sWuKOoabOEPqhbs/SZBI8gbOZB196K/4wQA
 VLjT8f4/Xy6bxf+y2FY6cnARUog3WNT2/vyps7izMpSRuXa3P+2M
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11965
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 lowpriorityscore=10 bulkscore=10 spamscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130089

On 11/13/26 1:04 AM, Gregory Price (Meta) wrote:
> On 2026-11-11 12:55 -0500, Tal Zussman wrote:
>> migrate_vma_setup() installs a migration entry for each page it
>> collects, which carries the uffd bit over to the new PTE. However, a PTE
>> that maps the zero page is left in place without a migration entry.
>> migrate_vma_insert_page() later overwrites it with a new PTE that is
>> built only from the VMA flags, so the uffd-wp bit or the RWP PAGE_NONE
>> protection of the old PTE is lost. The same applies to the huge zero
>> PMD.
>> 
>> Once a driver has migrated such a zero page, writes and accesses to it
>> no longer fault into userfaultfd, so the manager misses them. With async
>> tracking, PAGEMAP_SCAN unconditionally reports the page as written or
>> accessed.
>> 
>> This requires a driver that migrates memory to a device.
>> 
>> To fix it, do not mark a zero page for migration if its entry has the
>> uffd bit set in a VMA registered for WP or RWP. The driver sees an
>> address that was not migrated, which drivers already have to deal with.
>> 
>> The uffd bit can also be set after the zero page was collected, as
>> write-protecting only takes the mmap lock for read. So check again under
>> the page table lock in migrate_vma_insert_page() and
>> migrate_vma_insert_huge_pmd_page().
>> 
> 
> Similar to last patch, this changelog could be improved.  My best
> attempt at summarizing:
> 
> """
> Device migration replaces a zero-page mapping with a fresh entry,
> losing its userfaultfd WP or RWP protection.
> 
> Don't migrate the uffd-protected zero pages.
> 
> Skip protected zero pages during collection. Check again under the
> page-table lock before insertion, because another thread can apply
> protection after collection finishes.
> 
> The alternative ...
> """
> 

Thanks, I'll trim it along these lines.

> I have concerns with this:
> 
>> The alternative would be to carry the uffd state over in
>> migrate_vma_insert_page() and migrate_vma_insert_huge_pmd_page(). Not
>> migrating the zero page is simpler, and a zero page that is protected by
>> userfaultfd in a range that a driver migrates should be rare.
> 
> This basically force-fails a migration of a uffd protected zero page.
> 
> Wouldn't we expect this to cause drivers to fail to make progress if
> they require that page to be resident on the device?  Not sure we want
> to force drivers to try to handle this special case (if they even can).
> 
> We'll need some input from the migrate_device/GPU folks.
> 

Yeah, makes sense. I can implement the alternative approach, but testing
for this is a little tricky without the right devices... I might drop this
patch and send it separately with the GPU folks on Cc.

> -- 
> ~Gregory
> 

