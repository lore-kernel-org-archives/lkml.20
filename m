Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4FF408611
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788219520; cv=none; b=maeY/19++dwpEO1pfwm1tgP/3q3bi61QSan1uWvEiG9JkH5wPzzQMMJJ/bi6bvC2Zx/fNVPoJg3m+ca7jKb+10DQaRwD5XOk3C9oIODn5fZW8L3F/LYXuwNn+TIQEp+vXIyv0bV6N1rfC9NB0FnHEW++2+f1//LGH3UwewN73ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788219520; c=relaxed/simple;
	bh=bLk7WDYuW0bvflEbAuPpvjtUYZ2TVhZfIvSox+BgIMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F4KBAK2Uv4mffGHeYvjlv4OGN3ks/0QwzMZLuark9/Y+atWFW1H4GtMySGFxaFro+vraQ0Q+jkwD2xBV9vhl+AIl3OXEDc2H6rcBViSFEPGwzZoXjfp8uKW+KkkyM5CkUbqLPyvbOTQCD7dMAidfbM6XRbamBnacszzOtUBchSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=fNSgbsm2; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=TOX4xzoj; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="fNSgbsm2";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="TOX4xzoj"
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VMZeNA3664156
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:38:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=ArSG
	j7c2DTB+uNsBgzHLh0fINaLzVW2mblZJGAkXJLo=; b=fNSgbsm2VvfDqMfjzfYO
	k0YKPxEysqgiI6D7Qf4ZFTCDJV9N0QIuF2BPZOoiNOV3kiSxo7SP6AlJBGetjbTM
	FpQgZwtkh+gLVBrDjDS8LrlTU+1kF796i5o8VKkueQX0cYI4g0RI0IqReI63OU3z
	9qjXb1dFa2QIa51yi9Q3daDT7vMs8/zG/QWrYMjPKslBk6cON02goPUKF/eL8wgV
	RBu2yXtAHunqGaw+PDFbBTvPhtSsNfZSBDttQzy5gnGNdopWC5yPuweJSwZec+eD
	eFuqMD0TM+s/mOf6s9NzMwyi1qwUBYQSYJHucxHv0UpLURgN1leF4AhgPMCnOcw3
	jg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gdfersrbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:38:28 -0400 (EDT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93903982af1so944093085a.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788219508; x=1788824308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArSGj7c2DTB+uNsBgzHLh0fINaLzVW2mblZJGAkXJLo=;
        b=TOX4xzojUV0u8sEo7Cmg/2gUut3XfVzR8MPKaadxZ7p6kVYoW4S8PM7DY5u+tA1Znt
         W6ISidMZm2+EM3rpDpDPjEu2TToqyN/oU15gpA2w9H7MN3PNrBxpk9Me3tlxi8EbpaiW
         mDadekgGX+H7GbvA5JxoNjnDz/uItQ5GBfu0kmAM+/o84EwVbTgVXX4O7hW9DCIGVaFv
         1Y3yJmYNzBsjU5iVicpqhhj/GaILRCHX8BoQl7WQLA5fvPaa6iym93PoDPTCRBXjMYme
         ZpFUEXVlmH6mxfx/mucwfo3noV5PgGG9E3LOshXWbf7LFaxxvK44SUwGRVatnBphtq3v
         bOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788219508; x=1788824308;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ArSGj7c2DTB+uNsBgzHLh0fINaLzVW2mblZJGAkXJLo=;
        b=Lu3Kt2a9ASrPGI0s+mt7Ftm7cKrYiuwj3nci0Ln+DYac8s0coQ3Lc5mOemHRdBg2Yu
         ZR54V2F2PGkJVOr9Oa4yJ32s9z2pPKu+bZvZ281Ums8CwRxd/16IwE8FKycM/PztX4Wo
         L5+jdhr0MQp10DfOHGQV5PDN9xfmo8e6G0tGaqyLwRHhy8ZHYplviv1WtPnUlbrLJGEf
         YiPHiF+WzwAABx+AtKyc9fRqiVsSu0BwOZ7A1QojrUBoba+ekVSDDpofnP48hUJSnKgL
         Mftvl0TJDOqMdhpceaPvjtK3vNkuk4jOLcs03vtFeDirunmdlVRMtJ8wFyIU/RFLDkR+
         oETQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro1gUiuhKOUBFnh+Onw1D1BLxSW6GG8tAXU/dn+XxOG4HXcp1XMHkXuB/zMD9VHnF29uN94l7z8NE/ptkM=@vger.kernel.org
X-Gm-Message-State: AFuF++kNg1Y4yS469Zaeoh5nTW5x0N/oqFVyLo8PYTm66EtsQPe+wHSp
	Te75QjK6AGyKxpmu1SfoqCn8dq1QXrIOzON67nZO5qe5xO0IlT5CQRNCwL82jLIitn6FwUpcBMA
	UY6JVv+jeivwbi7+3177nXpNXmxMcdK0iNQlIGpBf0CAFAmZMw2WMyz6twKB0ww==
X-Gm-Gg: AR+sD128FN6OV/xQcu/HCZ+De/g1dqvlcSE6/XG60eRKeB9M66fgGJ28TCKRzrdSC7y
	MhBHjfOzEs0UZs5GIzXap2t75sGh0gos3WNuTAoLwkCIU292arwKwCt1Eqk/HarqFzTvsomKSsG
	jy2gOougira53QIXAyfVEC7PGH0ZPk3n/lhAgURizvopojxVQQc9W+iZoRlj4Rn/J75uyYHoVEt
	mKcaic2jTbSnLVVTbd+5rHjC3N0RbT7gZ3nHqftpwVZhNGXdrvaxmF8w75hf/z26VaKV08iQWBo
	YGv67yQvlv4XmA2S9xJHTAJiKG9uMbSeIhrKwmTE8sRV9GZuM3sL9OI5tfclHbsIscWaFFw2KeT
	q9hbV3QAPlHadtndslxLM4UWjxu/zQa3IP47slHB2msplo7Ay7A==
X-Received: by 2002:a05:620a:2acd:b0:936:dbd7:fcb3 with SMTP id af79cd13be357-939138ffddemr2919445685a.21.1788219503246;
        Mon, 31 Aug 2026 16:38:23 -0700 (PDT)
X-Received: by 2002:a05:620a:2acd:b0:936:dbd7:fcb3 with SMTP id af79cd13be357-939138ffddemr2919442685a.21.1788219502721;
        Mon, 31 Aug 2026 16:38:22 -0700 (PDT)
Received: from [192.168.1.62] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939173a4254sm893939785a.25.2026.08.31.16.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 16:38:22 -0700 (PDT)
Message-ID: <61dd4d89-1b1f-4185-903e-a2b1ff089836@columbia.edu>
Date: Mon, 31 Aug 2026 19:38:21 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] mm/huge_memory: use folio_swap_entry() when splitting
 a swapcache folio
To: Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
        Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>,
        David Hildenbrand <david@kernel.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>,
        Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
        Jann Horn <jannh@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
        Yosry Ahmed <yosry@kernel.org>,
        Chengming Zhou <chengming.zhou@linux.dev>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260830-folio_swap_entry-v1-0-7786b52acbc8@columbia.edu>
 <20260830-folio_swap_entry-v1-2-7786b52acbc8@columbia.edu>
 <DL37OCFFKFCH.2VWZ3CMY3EFG7@nvidia.com>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <DL37OCFFKFCH.2VWZ3CMY3EFG7@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: R6_1LWX5uACbsJaoqVsk7lkE_1CdJpqE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDIwNSBTYWx0ZWRfX2y6KN4rbUxfi
 cn86G2JiCiCQwO2mrwzvqZVsfO61hh11EHgLRTOjYuKXX9sXJZkBn088J9xfBpxPqCmiN88XG/H
 Xw/zGSLn6QW9cQd4E7tS3XEBYjDT6YX8DyZ6TjxTVW+rIQPE9Rsi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDIwNSBTYWx0ZWRfX8sW00anqw7A7
 bFPaTjjUlWSDXrLYkYIjdIndpMgS9qzXFFuXeUugJysmiGVhmd0ozstO/blhwBMTmOmszj6CGT6
 FKGD6KM26Ncv4JvLknj/jXQBDw/muKy77dHO0dmD793h54FFmKnlrFxmESiw9vy9IeT6wVY5QUi
 jFSBAPtmuSxPg/2AfEmMRkz/pV4v5zq/tzKyISPJev3merKl9rzmU5lkoPKbPay4EokWj9hizNJ
 zf+GfhvQdduyqfcSYpi5hJC27JO/EOzJ0XRrDsNopU11xnaNULmVwBIYxbbehdGZQQWK9jpF7I9
 wbIx0IG0o4/GDdl6VIpl9NXnN0CnJoPxia+dfviJ+oNpUBP2D1pKlfaJcazOND3uisqmK8rr55a
 MSIQJl6Ompcl3IQg4+dZQ962+I56xBNQ4oFdKNSmKplxRFzO00tb8Gl+/l/QNaYbxtCg7/5Ugm/
 18ucerfnADwru83wW+g==
X-Authority-Analysis: v=2.4 cv=G48s1dk5 c=1 sm=1 tr=0 ts=6a961074 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=X7tRCqHdiWbQX_0A2iAA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: R6_1LWX5uACbsJaoqVsk7lkE_1CdJpqE
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11892
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=10 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=10 phishscore=0
 impostorscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310205

On 8/31/26 5:50 PM, Zi Yan wrote:
> On Sun Aug 30, 2026 at 6:32 AM EDT, Tal Zussman wrote:
>> __split_folio_to_order() open-codes the swap entry computation for the
>> split-out folios. Use folio_swap_entry() instead.
>>
>> No functional change.
>>
>> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
>> ---
>>  mm/huge_memory.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index 54494c3fa983..03287f995d92 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -3760,7 +3760,7 @@ static void __split_folio_to_order(struct folio *folio, int old_order,
>>  		VM_WARN_ON_ONCE_PAGE(new_folio->private, new_head);
>>  
>>  		if (folio_test_swapcache(folio))
>> -			new_folio->swap.val = folio->swap.val + i;
>> +			new_folio->swap = folio_swap_entry(folio, i);
> 
> folio_swap_entry() checks folio_nr_pages(folio) internally.
> folio->_nr_pages is in first tail page of folio. If new_order is 0, it
> is basically checking memcg_data in the first new_folio. And after first
> iteration, folio->_nr_page will be clobbered. Without
> NR_PAGES_IN_LARGE_FOLIO, folio_nr_pages() is derived from folio_order(),
> which is in folio->_flags_1. It can have the same issue.
> 
> Please keep it open coded. You can add a comment like "during split,
> not all folio fields are avaialbe, open code the swap calculation".
> 

Thanks, I'll drop this change.

I was debating whether the warning was worth adding. It'd be nice to
avoid accessing swap.val directly and abstract it away, but given that
that's done in a few other places too, open-coding it is fine.

>>  
>>  		/* Page flags must be visible before we make the page non-compound. */
>>  		smp_wmb();
> 
> -- 
> Best Regards,
> Yan, Zi
> 

