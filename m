Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4722636F426
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788974505; cv=none; b=XmK/erB9m9RzyhWwhIZDOLaMK27g4A+Rj2mwxPGLoKplLel6r8wWCZwemUTiqjFyhkwv4uoCAefZuPKdDEbTIEbNiRltMKI+jwFH293BG5oCfAd/KDnWppvliTizRsHRfDCpzm/88uJ/aHXQmBgZ52HVpA7jsW7UfcBWAtO1i6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788974505; c=relaxed/simple;
	bh=BDR0OBb9ANrb1O1PwCMd8HUkQgbqMPdRKX7R6RyVmQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u7GRsFG3dLrJiGv4jAB5p1C8NeSeTbJZbwK8U7pnHYtmUSmOEkpdRMXoRmJ+/WyC6uGiUp+537aplZE+tWtkj/eBiMD17PQoD70SbenHA65+1tlgW+bsTUrAU6On6qH/X3j1RWwnPH7mtBhWQavI3unA8NZ2Oar4EEKujv3pGjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=lnF+tDfL; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=B12yLQfx; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="lnF+tDfL";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="B12yLQfx"
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689GZ0a7582153
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 13:21:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=iW6s
	RnR+oQYWv1NkGkTa8AIJzqy44SrJn9mDEbTMddw=; b=lnF+tDfLDLC8zKGeJ7sI
	xJRtIeZcNmXG67Zr5UNCF1jcUSs7Md6RqW3R8kY6eZrCG9TVNI1Yv+yWlQZkoyxq
	FcVfcIdTqnVbLEFqBdLQcYGzf6a1eOJTGf33c0PEH1gsXdMHLOHa1fHresCicD6U
	hWzWNsR+qVSKFpg8DA1Uztk5Wmyg55jb58Dpt55AgxlYchc2hPL34WEb0ZPRmGk4
	XcZR1lxgEWXDmw54cBX0Qlv5FwHZl9d67dFz3cHGXK7XORSdN7F0Lk0MBhtmFY1J
	swFKU15gKmi9tUGWNQi7gR3DCAA9XUsgQi0wveu/pG3xI4T1h8cnoKKJ2VkVBlEt
	/w==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gjy1emu54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:21:42 -0400 (EDT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66988049306so8068912d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 10:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788974502; x=1789579302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iW6sRnR+oQYWv1NkGkTa8AIJzqy44SrJn9mDEbTMddw=;
        b=B12yLQfxktV32hNPj45U3TV+om+/IFd7xXtGCltWUYgGK2/D/uQizoOMrXszldSmNg
         YVMl/zozGtzJxDur4IpltOrdXaHgA5yHKRv+hbup8DIz6THKcGsRJHCXC+y9tdJbXvXw
         YSzblQ5bC1+Xha4tWg6yrn3f2GQYTx8yDBzvx9qI8lLeh47JEpiRfWCN6mw8a/qkSQdu
         HTqjgGt5xX4r1YyPznKhfNF/6zya7W4VHWEHWwNRSfFGJWRp78KZmog0w8XeoMw0IEWQ
         V0zr8ogn1n7aA/yLqB8+Yt4PqWdHr4FPHcuapBvcQtsZm4cxDWNMdKFk2s4PDeWYWfp9
         t0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788974502; x=1789579302;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iW6sRnR+oQYWv1NkGkTa8AIJzqy44SrJn9mDEbTMddw=;
        b=gMR39I3UdyoCzMHIFl6mKafbuXDUvlJcwBoTHtyAGVnW7BCDof7McIf/7/1/lC76QV
         zdY6o+hdUHHkN646Nb5OdIEUuwni1znmidKUN0qysXySBmjq8/RT5xGHbYkb0uvZY9dr
         ZYT314Q/9mjsMTxMXZ8QB8URp+m9CQLlB9Ka5sTOhEPUH8PdNthE+/RG/IUNxLnaSORx
         tPPl9W+uN8X6dtkHQ/MB3lBsAyxwIJLLw9r/xnzW9Dv+FwEOvmBPsk/HYXobE0VdlIkG
         aR7VkGMgbBMgQRkWn4vlnnmSWKQm4nArbgpfR9p+0S3AriDRzyPqqJLMHvqEyBYJb4O5
         83PA==
X-Forwarded-Encrypted: i=1; AKwUvBytX8sTMRXqjlGtffyfMEexeDDyUScO0ykMxQVLTyXHElZy4yU3p+JZ3iuwevljcT3FvSNsHDggxRNCWYM=@vger.kernel.org
X-Gm-Message-State: AFuF++n5ySg0PdmMlyY822kUW6m10PwpMP/s2u3fYOarlODV0KKjTRgN
	w23JdxPMRnYJn4dQO6V1BYHItC32y7OhLJZKOs1eDi7Nql22oHJrwaZ8o6CExlwepgdQ8maR7MQ
	PdhdHeyneGwcLDJr6xdFykpIbO2bt3/wVIBLEV6K+s+4OvBrJAWv0I9Y50mwZvA==
X-Gm-Gg: AYBFou1FkklVDM8LhN4OH5gqXqBw6cw2/EkBL1IGSvYvaBe82PnZWkUSHGJrBtPgZUT
	EUQMpjHvbjlEE1mSuAQbwmKvhFHGh7gXBAMGt2VrM55WNGCMjUcXrYfmFJu9etPvSo1aL3vVAi6
	E6ygr+hyGnHP1kzaDO6C9FKtjOdAnO8tTQQJWvaet35boyIuvR2/v8bKiWKKi8VP0fIAoFMRQ+C
	atvMOqgCtDYNlaKqaOqO4X7EEGNUnCWPC2iYcO1KGL7ADgMN4fD3hPPuxHVSrnO5qaQgIP/N2DE
	H9SL+U098MYLjMiHXlt/DfPviCfIh3UkFxar5PgCxx2s0LRupuJ0IdpBTRGOXGXWOHbOGgsUk57
	CzKCKRf1lhjuG87NKmETqWf1YY/RrkkQBUYcgHM7xT7FYpMIg2Fsx
X-Received: by 2002:a05:690e:4141:b0:66f:bca8:78d6 with SMTP id 956f58d0204a3-66fbca8b1d4mr11506167d50.18.1788974502306;
        Wed, 09 Sep 2026 10:21:42 -0700 (PDT)
X-Received: by 2002:a05:690e:4141:b0:66f:bca8:78d6 with SMTP id 956f58d0204a3-66fbca8b1d4mr11506121d50.18.1788974501815;
        Wed, 09 Sep 2026 10:21:41 -0700 (PDT)
Received: from [10.207.49.22] (nat-128-59-176-193.net.columbia.edu. [128.59.176.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9106702d8f3sm43456006d6.23.2026.09.09.10.21.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 10:21:41 -0700 (PDT)
Message-ID: <cf9a0873-5ef1-4a5d-ba16-8ba3583ac8ba@columbia.edu>
Date: Wed, 9 Sep 2026 13:21:40 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] mm/swap: add folio_swap_entry() and
 folio_page_swap_entry()
To: "David Hildenbrand (Arm)" <david@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>,
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
References: <20260908-folio_swap_entry-v2-0-ee6d01dfa5e1@columbia.edu>
 <20260908-folio_swap_entry-v2-1-ee6d01dfa5e1@columbia.edu>
 <d0aa1ccd-d99f-4fa5-98c2-21cea0f413c7@kernel.org>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <d0aa1ccd-d99f-4fa5-98c2-21cea0f413c7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: daF6pwyZ1__osq3JdyXjpuoAM06_NGrZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE5MyBTYWx0ZWRfX67SguvTtWWZe
 LQfOIQxPVD+srQUWFsxBQNTW0SCRzLoa06PTjPReOCjtMG9qG8bBqwyH8IvCbvu7GUiJcQNbs8Z
 YMsLRGOCYcD9I2OoPBjlc7Ii9XQGuzHm3GQW0lbwvEzWtiJiaY2K
X-Proofpoint-ORIG-GUID: daF6pwyZ1__osq3JdyXjpuoAM06_NGrZ
X-Authority-Analysis: v=2.4 cv=Qp5uG1yd c=1 sm=1 tr=0 ts=6aa195a6 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=fJxgZNdXt3opHMdyAp+FXA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=umqIAqnQUIpxI_lDA3YA:9 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE5MyBTYWx0ZWRfX36uvPnq633Lj
 4VJGDkxdI7Bsf7sW30skaZNVd7KIOo3IcAwPfbNlPX57SJm1UtAghNLcE405VZ0hms2j8QyrwkJ
 rdSCWFyq2pJn2gHtaH40m6eL3MPhNsN+U26/o6OP8FnoLQBAoR4ScfPg6cA3Gd0cZFtkFhVia/R
 LjP+4QGD/I5UAp3/IxXMi22vku1hXHKTqr760OpSbmYvpDPIpkEps5TzFUY+6oX8hkh04PSeIp+
 mRlcOIx0phhaUzcCM7qOa5OzEPCIqmdciA1pU79jxlNHUABbyop1YcIvy2RTngFkKBuJlBKSW45
 fM93jXY2yAFy2S7aZ4j0moafi92hhIUNeyvUQLEDikZebyKbkbic0YH9ZjXMbdHfA9wsyckZykB
 7ZQolnHZsINZKbb4vsKl/s1F7c2KfX2NuvfniXsuqpQ+GGDhGY7j7cY04LrfXko3p0ZGz6AQfhj
 xOARDEZZ+FXIsF3N4xg==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11900
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=10 spamscore=0
 lowpriorityscore=10 phishscore=0 bulkscore=10 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090193

On 9/9/26 5:00 PM, David Hildenbrand (Arm) wrote:
> On 9/8/26 17:16, Tal Zussman wrote:
>> A folio in the swap cache occupies folio_nr_pages() contiguous swap
>> entries starting at folio->swap, so a page's swap entry is just
>> folio->swap plus the page's index in the folio. page_swap_entry() hides
>> this behind a compound_head() call, and callers that already have the
>> folio sometimes open-code the arithmetic instead.
>> 
>> Add folio_swap_entry(), which takes a folio and a page index, and
>> folio_page_swap_entry() for callers that have the page.
>> 
>> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
>> ---
>>  include/linux/swap.h | 33 +++++++++++++++++++++++++++++++++
>>  1 file changed, 33 insertions(+)
>> 
>> diff --git a/include/linux/swap.h b/include/linux/swap.h
>> index fc290e29e4a9..1d979e76e78a 100644
>> --- a/include/linux/swap.h
>> +++ b/include/linux/swap.h
>> @@ -272,6 +272,39 @@ struct swap_info_struct {
>>  	const struct swap_ops *ops;
>>  };
>>  
>> +/**
>> + * folio_swap_entry - Return the swap entry for a page within a folio.
>> + * @folio: The folio.
>> + * @idx: The index of the page within the folio.
>> + *
>> + * A folio in the swap cache occupies folio_nr_pages() contiguous swap
>> + * entries starting at folio->swap. The caller must ensure the folio is
>> + * in the swap cache and that @idx is within the folio.
>> + */
>> +static inline
>> +swp_entry_t folio_swap_entry(const struct folio *folio, unsigned long idx)
>> +{
>> +	swp_entry_t entry = folio->swap;
>> +
>> +	VM_WARN_ON_ONCE_FOLIO(idx >= folio_nr_pages(folio), folio);
>> +	entry.val += idx;
>> +	return entry;
>> +}
>> +
>> +/**
>> + * folio_page_swap_entry - Return the swap entry of a page in a folio.
>> + * @folio: The folio containing @page.
>> + * @page: A page within @folio.
>> + *
>> + * The caller must ensure the folio is in the swap cache and that @page
>> + * is part of @folio.
>> + */
>> +static inline swp_entry_t folio_page_swap_entry(const struct folio *folio,
>> +		const struct page *page)
>> +{
>> +	return folio_swap_entry(folio, folio_page_idx(folio, page));
>> +}
>> +
>>  static inline swp_entry_t page_swap_entry(struct page *page)
>>  {
>>  	struct folio *folio = page_folio(page);
>> 
> 
> "Return the swap entry for a page within a folio" vs. "Return the swap entry of
> a page in a folio."
> 
> yet only of the variants has a "page" in the name :)
> 
> A bit confusing.
> 
> Not immediately sure how it could be done cleaner. The minority of cases seem to
> use folio_swap_entry.
> 

Yeah... I considered naming them folio_swap_entry() and folio_swap_entry_idx()
(or a variant of that) but I liked the page version more. I can update the
comments to try to differentiate between the two a little more if that would
help. How's "Return the swap entry at an index within a folio"?

> -- 
> Cheers,
> 
> David
> 

