Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793146460;
	b=QHJodeRlzGGlbkGJFywpuyCEDjzNDPq3DhWKcdg5PbKzLfpCSpYNr7dw49RK2mEjDQwH
	 NsudDT9qFheJcz68Al/6nWP+LnngmDZhVvF5VLAixGfBNgP4Aq/aT3TiW3DzHcV38hoAY
	 IUaPgfoB3j3IofcTqDmELbOcHBcGDy4g8wbwJ7FTLQLVfXcAyZZwfEFMIc6fE7/xjqf7f
	 XreR78QxMHOcdqjjj+tNWh0jecxTcZxw8XBngrpIaamJ0ZOdzZJNQavWK2lW5qNBQ6swC
	 YkzdBmTqyF8JfOAet+i/r3sbm6v2p3hXeCU3AX/cq9eF6jnanjBOo6xX8eUugBmreZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793146460;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7p1ucq/Ny8UBz6ghlqYuLhKrCHyG8ylaL7otql1jOZ8=;
	b=A3I8w0xNTWQAtkCLjAfnF6eHo3WQuJWihJIRDw8de9xxxGOd/RqnDrhm97/V3VE/fUUP
	 ZUmGfaHJ5EO9DIgaQnC662F5TJfL5f9CYoM9n/TWhf5uZe2PzbvNzdWXbT2GHRWpYM8pa
	 8lN57JnaCTgJhlPs7WYd5fu1/Q2nxz+s5ChbAA2uN3NHLSmfMrW6K6KLIpWUJ5xqhHUd+
	 Y/X66sYzQPqxkM5NVszrlyW61T2l+VuRMK2hnQMwXR5DP5Mh71IQY+7HQ0dhpf4y09i5k
	 T71MfNpK/SiVIEBddMqnup2r8wYZoIPBNCq89G8VbW+W16WKn/1FuIt13Luga6miBUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=lsovCs6I;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=Q4NLyjW1;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE551606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE551606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=lsovCs6I;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=Q4NLyjW1
Received: from pps.filterd (m0499199.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RIuqs9479609
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:14:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=7p1u
	cq/Ny8UBz6ghlqYuLhKrCHyG8ylaL7otql1jOZ8=; b=lsovCs6IxaWMyufeHyab
	UGnNVfqeJNBrnilLDH1hmBBzIDO1Xw2PYSUP6AO5lBNUxpxEQbs+32FmrWqXgs2U
	tOPH30t80MNHG2qpSiuiuflnpzM+Fl8MrVaIQ/TzOQwsV3+8EA9G3C0UHn/qCG3Q
	PQj237pzIWWLwXlIO/8itmTx5LzX4mvdorMSSEhTUlDiVt+iAvZg3DPutnck/E72
	SD4t4EgnBW4hfXCWuhw5rDgUQrr386PNS4Nzie4yCvvMNEyT2eeHSzgksDyKzRBz
	69BiiAg+4Y9BSAZh6oP9aUSXMEnXOkAGEduwN+78Gc0cdd8YkiEvb2dw4F4cmelV
	dQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hjxk9mh0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:14:12 -0400 (EDT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91b8c60c550so13968956d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793146451; x=1793751251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7p1ucq/Ny8UBz6ghlqYuLhKrCHyG8ylaL7otql1jOZ8=;
        b=Q4NLyjW19/i3ait1GGvuGUivPbsqagcGPGP+qWcDf7njdgRSJuYGwHwfXBRn6+WApZ
         u2dU/OtMje0X9b8UevuOY8/zp+xcTBSlA+AQPyXfpQIFvqXQkrx7HvxUuLeKu1xIjmOz
         kiBinAtDG9/rbdMBTxkVC2eZ+5y6Lcu8Hj86h5xFKIuiV8Oo+uj+Ulbj4qOr85BrMbkh
         EyxD2Q8Thz/bitPJU4cocw8Ol6X7hbw2JlkPyQ66x5sGjM+qvJmR/qMkUXyApTT34u/s
         sZcQJdUwxGiWQoZpZVBv/TUZjOGT3aT0Y0GxHW03AK0xQsXqWosKF43hPhwNOMY3TfSO
         p3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793146451; x=1793751251;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7p1ucq/Ny8UBz6ghlqYuLhKrCHyG8ylaL7otql1jOZ8=;
        b=OjypaYhlMS/+mfIn5DEd4YHiv8Rk7gW3/KHHTRds+UcPdhwj3eg2Qzrl54bngg/ONH
         W5KWNp9cJ7FwMBoqJENEM85reT8WfnLPFF/e0dddUonHrw6H0ht7NBgCWd8//lbbD5Nh
         bMxQVg26V1gaA3jPCK8SM5dZWCyklY1op+kppLse/4jKoo9if/2Fcqp/sgRbAHuccV+g
         BQmLBpWkBCfZN2B0D+HIcq3mIsJGuRYf1PliPLYtJzP7Y/qd3b+7swNblgKG5tp/fwR7
         lyqqivVk2ZmCwHAWj9eUWaFegEio+s1ZMXnyFJCZbgXI+kYHjYBX2kGSTC3WH+svrAMl
         ZMaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCtycTaul8/6ypEUo5eaQbte80RIUrqhyhH9DCK+EEJCt2F5Qwaa2HdhIEf/a2dMS2Xr5PoHxj9TiiRa4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7gw4xsJ7piuRwg/vmdtFG19Vq2RqER++3GIuNZ7wAlhzAfTbT
	ozCN12znPrNnQskJvix1gInh8WajQNxjG9QJ6UAIEHJxT1I3o5blu9KbxNWEQ5JOIWi6t5hqAtI
	OzPV7FwCJ/O1SL/MtwaCdI/t3+AenHMrZQhCz5mWorquGkKoXE0kJsCyG36nb8w==
X-Gm-Gg: AYBFou081NZrQQedkP7Mf8WSLq8PKgTg9mqh3lLJi1pndb3DWYtRO15QilEoJy6Z7CK
	EbOQUP3VuHE8JpmCHS2G+YiIMyVDNa+zdpk+uU2PHbZ3EhkHCphm+tNUKrj0ZXjjo7AojmYdG58
	Zqr4AMZpDqqfZPnLFUvKh98VTWj0rWouRdCl+dAKJii8nkLC9z8jCOGP97005gO5QTxruExp94W
	MS+eAru3Frpcu77mTMROoPRzig7l7tsyPpV+7fshSgynWogU+U37bD28KVvPBhAQCEeNwrjPGmj
	LT6dNmM61zfAmYEJY8CfzqWQpTgT9DVC/Fwujl+VyAWC5A/+miXBA1fY3oGM9XThh2DCn9Ygu0W
	8aSnZM5/5qFrulgim+IyJSjOR4W8+B/6rHxpt/GYfDuXbqhguR6+nIqAKtvQuiw0WvHPKeJlBKD
	OhbiX1BRvXk1erpWYBWI7Fc4oNiEmUazDX44GJGrfMY0vEC8C8CDLUvQMreEUfDsAcky1293GIQ
	IL5GJ1i4W3HoezVJxGkkt5ZcYF9OnU1rJbCzhSe5p8fnH/jCbGXYSrAb1Nq0hNe
X-Received: by 2002:a05:6214:21e7:b0:91c:76aa:2c67 with SMTP id 6a1803df08f44-91c7d1aaecbmr12070816d6.39.1793146451427;
        Tue, 27 Oct 2026 17:14:11 -0700 (PDT)
X-Received: by 2002:a05:6214:21e7:b0:91c:76aa:2c67 with SMTP id 6a1803df08f44-91c7d1aaecbmr12069876d6.39.1793146450883;
        Tue, 27 Oct 2026 17:14:10 -0700 (PDT)
Received: from [10.206.51.58] ([129.236.225.183])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c6d8103b1sm40645156d6.44.2026.10.27.17.14.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 17:14:09 -0700 (PDT)
Message-ID: <3c754c36-86de-44a6-ab3f-5c86e4bf83a6@columbia.edu>
Date: Tue, 27 Oct 2026 20:14:07 -0400
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
Subject: Re: [PATCH 10/46] mm/huge_memory: fix list corruption when
 deferred_split_scan() races with deferred_split_folio()
To: "David Hildenbrand (Arm)" <david@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
        Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
        Lorenzo Stoakes <ljs@kernel.org>, Kairui Song <kasong@tencent.com>,
        Barry Song <baohua@kernel.org>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
        Baoquan He <baoquan.he@linux.dev>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
        Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
        Hugh Dickins <hughd@google.com>,
        Pasha Tatashin <pasha.tatashin@soleen.com>,
        Pratyush Yadav <pratyush@kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Jan Kara <jack@suse.cz>, Zi Yan <ziy@nvidia.com>,
        Lance Yang <lance.yang@linux.dev>, Rik van Riel <riel@surriel.com>,
        Harry Yoo <harry@kernel.org>, Alistair Popple <apopple@nvidia.com>,
        Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Usama Arif <usama.arif@linux.dev>,
        Kiryl Shutsemau <kas@kernel.org>,
        Matthew Brost <matthew.brost@intel.com>,
        John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
        Will Deacon <will@kernel.org>,
        "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
        Nick Piggin
 <npiggin@gmail.com>, Oscar Salvador <osalvador@suse.de>,
        Minchan Kim <minchan@kernel.org>, Muchun Song <muchun.song@linux.dev>,
        Xu Xin <xu.xin@linux.dev>, Chengming Zhou <chengming.zhou@linux.dev>,
        Chris Li <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>,
        Nhat Pham <nphamcs@gmail.com>, Youngjun Park <youngjun.park@lge.com>,
        Gregory Price <gourry@gourry.net>,
        Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
        Ying Huang <ying.huang@linux.alibaba.com>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        kexec@lists.infradead.org, linux-fsdevel@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-cxl@vger.kernel.org,
        stable@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
References: <20261027-fixes_core-v1-0-6f74bec9a5bb@kernel.org>
 <20261027-fixes_core-v1-10-6f74bec9a5bb@kernel.org>
Content-Language: en-US
From: Mani Tofigh <mt4022@columbia.edu>
In-Reply-To: <20261027-fixes_core-v1-10-6f74bec9a5bb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAwMCBTYWx0ZWRfX5hoWeetK7BPK
 IjXXLVJCuK3cpTlAnZJ8soPKsTDHqzgL28kCT+kLjSawWqUgi51hhooDnE79WN1mDG0qq/G60HJ
 EOwPf09oqETqRasmPLwF9i3XXwu9sAZ+xLO+6iZppx/+a68YO+3I
X-Proofpoint-GUID: w_HPfunollSRqfGFcOmbgeTWX9gZrFJk
X-Authority-Analysis: v=2.4 cv=SowFe/O0 c=1 sm=1 tr=0 ts=6ae13e54 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=TdXXog4ttPu8yHJGq4T0ug==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=G--0XuH5328wxK7v7Suf:22
 a=VwQbUJbxAAAA:8 a=maIFttP_AAAA:8 a=_zromwrzjHPDTWxWFBQA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=qR24C9TJY6iBuJVj_x8Y:22
X-Proofpoint-ORIG-GUID: w_HPfunollSRqfGFcOmbgeTWX9gZrFJk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAwMCBTYWx0ZWRfX/o9N5VgaNsrX
 Cg2jk2lQ2/lSGkfcznk/fX3nMGY5zzUzpYltfEvjFUGQrBHUP/s5tqTsNq4ippuyR25x82U0CrE
 TyUsuQ43lEPMEZr6yMT86wBGJZ3qaaqNg+QZvLSwggcoPC0HcvMnEt4m22p8M0Xrq8kkoIi1SjN
 zkY1lJ8aCjt+r+SuVAe/A+PYpuEeiz14tbOVCvQ8UH5L3xBGBynClYTctQ/uoESoAIgMqsIFpgL
 bZXBKxdTSXnB8X7Sc6BGADwF2lxjgzoMopHp2L5zBPWqB2MMp2ZMUWc74/GKUok00UiM8fLGN3S
 u5EMPX2kLjZYhUmW2oJC/bWl9jv+X0bgzFuZj1hp38jZZDKwEG4EycopGi/Jc6jU1SZNv/sHueb
 EZb3Q49tPTvMUMbWTuLV0l3i8XjGqIDmuVDUMAxprTFelpM+Yn5/Vcceoc2z/GGGyk6kk9y0Jys
 uzVjxRB+utUYb2db4ZA==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11948
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=10 bulkscore=10 lowpriorityscore=10
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280000



On 10/26/26 7:17 PM, David Hildenbrand (Arm) wrote:
> Since the deferred split queue became a list_lru, the isolate callback
> moves the folios it took a reference on to an on-stack list, linked
> through folio->_deferred_list, and deferred_split_scan() takes them off
> that list with list_del_init() without holding the list_lru lock.
> 
> deferred_split_folio() does not know about the on-stack list. It only
> holds the list_lru lock when it looks at the same list_head, and it can
> run for such a folio: a THP is queued when it is mapped, as a candidate
> for the underused check, and is queued "again" when a part of it gets
> unmapped:
> 
>    CPU0 deferred_split_scan()          CPU1 deferred_split_folio()
>    list_del_init(&folio->_deferred_list)
>      next->prev = prev
>      prev->next = next
>      entry->next = entry
>                                        list_lru_lock_irqsave()
>                                        folio_set_partially_mapped()
>                                        __list_lru_add()
>                                          list_empty(item)  -> true
>                                          list_add_tail(item, &l->list)
>                                            item->next = &l->list
>                                            item->prev = tail
>      entry->prev = entry
> 
> The folio now sits on the list_lru with ->prev pointing to itself. The
> next removal leaves the neighbours pointing to it, and they still do so
> after the folio has been freed. With CONFIG_DEBUG_LIST:
> 
>    list_del corruption. prev->next should be ffd4000000270090, but was
>    ffd4000000278090. (prev=ffd4000000270090)
> 
> Fix it by grabbing the lock around list_del_init() so
> deferred_split_folio() cannot race with it.
> 
> Fixes: fafaeceb89a5 ("mm: switch deferred split shrinker to list_lru")
> Cc: stable@vger.kernel.org
> Reported-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Mani Tofigh <mt4022@columbia.edu>
Tested-by: Mani Tofigh <mt4022@columbia.edu>
