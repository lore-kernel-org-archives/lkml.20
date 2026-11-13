Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794608201;
	b=ATAgdYHDEk9YZfl90O+ypSqYE+k3bX++BSz8RuNh/NB2F/y8zY+Dtpo83GbahUbJvLPF
	 T/dZ1df3KN8pBqBsGqQn0x3MhLMxGQw9+8IhIdWfEbXTmUkdzIHvFNk4fwuwrE7ELXXkT
	 xXTaxn67mxRIf6lPyEPtoOB69uTKYNTmfWFWy0GgeK0z0dlX9mm+Iw0SAJqEybmhXAouw
	 glxYgFLcop6G4aNGgU2IH5GdnPg38ahNmPKvFbKjWTWX/hyrYdhJgya8Np+6TL5sPeRwx
	 OT9kD9v5tKTKHsJsdVQyAmCKLCSMQuCcxI+FgTHc9+ssBDUrX0ZlmofCwdlr187LXvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608201;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=07ep7E3t/zTIZImeWja6Vo87wy8J7vuG0Sw0cdppt+o=;
	b=sQzbCqke/f+CngJ8Aq4dYVH8pu2VcY30LyiHgnaUI21bsvQjuGfPM0KbvsiWoeOgPCPU
	 a8kT3Xa4WdCrG+OjazaFL2PgJij4EhKxEMtb2G7rvwqdwuqJz7Mo4AlgOMNlY9uKbkBos
	 2TMdAEDn0XLghkDD+tWwVl9S9zUZxUs5pxXwi7t2SHtMGqZkYuO16YN7Ta10OKStoWjsS
	 QKQlgC3jX9+zpjkeqLt71ZUtSJ8j4MsLX1+NIOCvxbB9Ihmb5n+Z3eLiIQWCCGBRaW5Ms
	 4j3TW6CNaZ1yi3S0bh5cZDVJky+aLBdFiwEPXHq4Vy6h/0J7UBph/8yiuAJR5E7u24g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b="F7rT//sb";
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=JKWePy5e;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1CB606A336
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A1CB606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=F7rT//sb;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=JKWePy5e
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADLmVP22758425
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:16:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=07ep
	7E3t/zTIZImeWja6Vo87wy8J7vuG0Sw0cdppt+o=; b=F7rT//sbLAORqUQMxmvB
	TBuGYuf+zUKrcS6K52tTE3r2XHyb0xxQwQhjqHHiIfZog4E9g7ZQl8gRVBLITHke
	AJuoWCYAKLFwmmsl6r2G0UOexNc5IMsTwMhQwRQpRYWnkouAgzBxOsMCRSgLJ0PH
	+I/o4OlJNXt264o2Y6Z+FE51htktnBsDGQ5JDmpgJvSbGzFj+7q0r9hVTl988kEd
	DdtigUo+10bJC85i/nXj3mPuKV6sGN1ORlboO4SZBhOFPb89FUGhIAnj9qTKcUua
	bYYCZccQFhTxhS058qTuLaKUTY46uh0yNXPSsw8/BGcjycKQjdLgJnxF+xNckdWx
	dA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hx534khqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:16:39 -0500 (EST)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f33438950so317439685a.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794608198; x=1795212998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=07ep7E3t/zTIZImeWja6Vo87wy8J7vuG0Sw0cdppt+o=;
        b=JKWePy5eKMKhf+qkki66IyDGaXCdQBZBJT/hY7Urb/SXsOTmcMRKldNxgil+ESFVVD
         irlAiOluEiJk+OVF1ESqeErT1Yz2ZkrXL5nJjuEs2z9NNQA/crrP51Vvb5QnBXLKDCBY
         h1urXU7yPlLqOMMMYYmeGm42d7X4EbzS5h8rX3Vgh4o41h7jHKBE0UwaHmdp+T0fDunx
         tr276Ut5zH+wGbjs4+h23PvBMyqbznesCobdgv/ebkAh77UU/7pwcEl5gYIX0cEufnzC
         wRjoSHC5vsNwbdG5ReqEoTvsTiaRBd+kqMRj8mvqFi4Hd8Ybf4zMkgGSKU6sI3KC7Bqg
         5s3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794608198; x=1795212998;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=07ep7E3t/zTIZImeWja6Vo87wy8J7vuG0Sw0cdppt+o=;
        b=wQevg0j1h0yaPd5TarY1XzMOAZYXz07OVhQl/Be5mDwDGIRmJBKVUwncbC/2LIQ0MN
         imqzpaobDOCp0DUYQOwg+FK+9TlgfxkSXS4g7fptkrAgESR7t38oPRimaUoMfcPoADgF
         k0BxbQGE519gO6HWPgYr4X2crf+SRv2ZdP/+ikD1PObYCZ3QV9VFOXRuYHTGEq59rVuF
         if5yBKs1gUYSMNXcITP/nA9MFLPqI6Z/Uc98FRTlAF8Izqbmim36lQYS2BDHlV4QXaeH
         qL1/8NQsgZ2ZHKxliieGwsGFYvW/Ur8yACbpnM68+1K0m2NcOXg2U1hjvPyRU6L7Pfap
         JTRQ==
X-Forwarded-Encrypted: i=1; AL+hErF0EONzec30/IXTOLq0mmBBDXsrQXF1YHlPICPVm9bNCVkJw6mqhVS2VxcfPYbB1V3iri774yWkqKjdjBE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DPRN/77ZMRVMXiSxdi0FrQGvlbQBtKUi4ezPqZaS+fri/mjYh
	0aMaGNH+hDfzJTsQVvgoS4cqCI/Hl1WAfUPrGkHMA3VKBZqFm9XW7Zm8W7A32AGw/pbYT3mQPQn
	Lrh6Oir9gM2Atds7sD9VYJso8u5QIFexg8k11i/9494aYLhFo3u7ege6xzcIfEA==
X-Gm-Gg: AYBFou3Y3Q83x2P54kjZpPGSEFHeJoKO3Q7q7tkCQDHPHA7HKzrcZNdCbMxQjKQWhwX
	6CNlCUDLuEyTgXhEoXp+E7mQzdfmWmoX6ZJC+Dz/tWA80DRqWJeZW+Tu2UhUdY5lpC75x6EmPJD
	NduuhugD3BJZn2m6tln2V/NbenZ9jvYvy1j72FgwtJBm84IKE6xdFDAr1LTha2drGIhtTVjf3mQ
	/9TfKjNZooIh3AXHQFQrruGkrq5JI8URDdBtNIdJ6qwgxyrRlfuaLap8rO66BkXA9XT5Ucx+J91
	2uQ2Ja1i696KSv/KSjeasjoppL4YlGcV+DQ8vLrIi6iYxyUcln0ZjtMohYJrhKWFK2g7MAmPkEJ
	YNT9a17nD/X2UaDqSZLzYbUdLprAtH0zQ+M4oK9uFj6y7T/uAFNKKmvhQ4FZg+1BWtyB4err84j
	jJT2J3L7H6XRaJDtxyYTiBEQANqCA=
X-Received: by 2002:a05:620a:628f:b0:946:44bf:9169 with SMTP id af79cd13be357-9494ba7e00fmr662818185a.17.1794608198201;
        Fri, 13 Nov 2026 14:16:38 -0800 (PST)
X-Received: by 2002:a05:620a:628f:b0:946:44bf:9169 with SMTP id af79cd13be357-9494ba7e00fmr662808985a.17.1794608196819;
        Fri, 13 Nov 2026 14:16:36 -0800 (PST)
Received: from [10.207.116.169] (nat-128-59-178-153.net.columbia.edu. [128.59.178.153])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c836b60sm281564785a.17.2026.11.13.14.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 14:16:35 -0800 (PST)
Message-ID: <e4b60f0b-ccb4-4a7e-83e0-81fa1fd0c88d@columbia.edu>
Date: Fri, 13 Nov 2026 17:16:32 -0500
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
Subject: Re: [PATCH 05/12] fs/proc/task_mmu: write-protect device-private THPs
 in PAGEMAP_SCAN
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
 <20261111-uffd-state-fixes-v1-5-00713d368976@columbia.edu>
 <avYQteUm963AKJQ7@gremlin>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <avYQteUm963AKJQ7@gremlin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dqFOmFg4 c=1 sm=1 tr=0 ts=6af78c47 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Y+j3KQtDOE8TDC6EXH/Ajw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=jLqENXc96tZTD5fVGMQA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: x8SX785V8FHSvUHxVTIP1NJY43jchfr3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA4OCBTYWx0ZWRfX8VKPmCyB7KaM
 0RrK2R9MC4TV0gWOR+x4IsxmqRz9O7IPNcY9roia/ulmtROKH45JMlgDv2uYYkdhwpU5p5g59Bi
 Aat5G7fmsUTX2N7vaGL/pt6y/chmFmfL+cEOgtyl3TSM28vmqMnW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA4OCBTYWx0ZWRfX8utl32BzWiRY
 aMJLfnuYZkKeBIzwTYF7S3Xacth506ad1zRpo2PeZ0ioctyJqwRGmwITU+BjmBmgzflvXxkngst
 ZcAGvn7tCuu6Z7DDsTqt5uBa6nDDXcODhFXgT3CN/azEfXwAx1IuPJaWbbQhhd59PgR5bswEWk0
 a37SB7qj1H6YMnaEL7u9FopvdB8EkdDx+QYzs5q+Uu1AugMKNcEqoH0rKKe9Ux4lN2JJNxTSJbA
 DjchBqh3hB3VxJ//HmbaxA29hYdP/KbQq6D8O3Qc0oVdrCOLNbdRj1dlOAMMeGKk/9+RQd0nBNK
 Gt3lpMaBxXspE5L9EQrL13ZJJrAN3XY96UT6vVkiXv8S1zdXH2nxRf9UL0IMVPHxHatTDBNzhaS
 6hSEhVBLv+AFastqhEbCmOZNPzrrTQruGpTovjllasX/yewyhe6atnalXLesWiVrQZRmes5zJHd
 PXHDh1trSI6ddrSBiwQ==
X-Proofpoint-GUID: x8SX785V8FHSvUHxVTIP1NJY43jchfr3
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11965
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 impostorscore=10 lowpriorityscore=10 clxscore=1015
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130088

On 11/12/26 2:34 PM, Lorenzo Stoakes (ARM) wrote:
> On Wed, Nov 11, 2026 at 12:55:13PM -0500, Tal Zussman wrote:
>> PAGEMAP_SCAN with PM_SCAN_WP_MATCHING write-protects a huge PMD through
>> make_uffd_wp_pmd(), which handles a present THP and a migration entry
> 
> It's crazy to me that we write-protect page tables through a procfs interface
> like this. But I guess we have to live with it now.
> 
> I suppose that answers my q about this on a previous commit...
> 
>> but does nothing for a device-private THP. The PMD never gets the uffd
>> bit.
> 
> Sigh yeah. Device-private feels like another 'just have to happen to know to
> update X million open-coded parts of the code'.
> 
> We really need to find a way to abstract this stuff.
> 
>>
>> pagemap_thp_category() reports a non-present PMD without the uffd bit as
>> written. A user tracking writes with async uffd-wp therefore sees every
>> page of a device-private THP as written on every scan, whether it was
>> written to or not. This requires a driver that migrates THPs to device
>> memory.
>>
>> A device-private PMD must be write-protected like any other huge PMD. To
>> fix it, pass it to set_uffd_wp_swp_pmd() as well, which downgrades a
>> writable entry and sets the uffd bit. When the THP migrates back,
>> set_pmd_migration_entry() carries the uffd bit over to the migration
>> entry, so the write protection is kept.
>>
>> Fixes: a30b48bf1b24 ("mm/migrate_device: implement THP migration of zone device pages")
>> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
>> ---
>>  fs/proc/task_mmu.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
>> index 53780a454432..752f1b13d47a 100644
>> --- a/fs/proc/task_mmu.c
>> +++ b/fs/proc/task_mmu.c
>> @@ -2524,7 +2524,8 @@ static void make_uffd_wp_pmd(struct vm_area_struct *vma,
>>  		old = pmdp_invalidate_ad(vma, addr, pmdp);
>>  		pmd = pmd_mkuffd(old);
>>  		set_pmd_at(vma->vm_mm, addr, pmdp, pmd);
>> -	} else if (pmd_is_migration_entry(pmd)) {
>> +	} else if (pmd_is_migration_entry(pmd) ||
>> +		   pmd_is_device_private_entry(pmd)) {
> 
> Could this not just be !pmd_none() + cover all softleaf entries? Or is that not
> valid?
> 
> It seems completely insane to have to specifically spell out all the
> possibilities, open-coded, everywhere.
> 

So we actually have a helper for exactly this that I didn't notice before...
pmd_is_valid_softleaf() is equivalent. !pmd_none() should work but I think
the existing helper is better.

>>  		pmd = set_uffd_wp_swp_pmd(pmd);
>>  		set_pmd_at(vma->vm_mm, addr, pmdp, pmd);
>>  	}
>>
>> --
>> 2.39.5
>>
> 
> --
> Cheers, Lorenzo
> 

