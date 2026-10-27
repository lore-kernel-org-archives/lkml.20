Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124250;
	b=fSRA8FyTsuQmO6zSMYN3ImOTWZhZKtekz16671siVy5mLHWAJqt4qVosYskW4PfH9AuV
	 ldMwqNJC5iZwSw7Lj5dEnyRm2nvZNHh8uQQ9ymOu2CHHNyyOpmrB2WAodRG2LVXXw7YFN
	 9aw+Irjr14HVW2SH0S7Kk3lvUliuB7Kd7S9aX3r3ncJyeeiixx19Zf1Ooq3N0LY4tmitE
	 74jQsDFJxqjbhZ8I6Os8V6GTrq6XTOnxeCcEi0ACmCegPOS7ftdJX1wqkDEu+mO5We02Q
	 q4vIzL3kepbUJolxSnDiYpqQo/3aryiuJaq08hsWk50528HNt+vI/rdct1M/a8HE5sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124250;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CbwQln0osS5Ody02EmE3zfTJ+96bXVyWs9ItOG40Y20=;
	b=pR1R+y4mw7yiiHqDxMEsLZ+gUn8Uciwwst/7d+asqpRXnrC8+RK0TEd0cuh+l/6wzt1Q
	 I/6wdRWSLeOSxyCGRp9PG70zqOIPM5wYCeNbtXnR8Uxa/OBWCLjShPIq/N+JtlLiXkoPd
	 j478P1x2VuXp2oyVaOuao45git5hNKM3/n8otQSd1dKvoBfAjoCaPqp7wMFUxfDmW6NuL
	 dsDjF79FvSnQr+IGHqbOck9sl4rB/gLQ5Wrfk1NbkrlKUGusvVWf1xCHeWyCkyh2mANyY
	 9gk8/nwcdbgI8w0WUg/fohyFrqY+CKsxlE7Zf2FjeJ0o/VUo0ORjo7m0OnlLBCfcWYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=temperror header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=HWMW+LuC;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=MkOva+DP;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E24F606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E24F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=HWMW+LuC;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=MkOva+DP
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RHh6fP1276249
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:04:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=CbwQ
	ln0osS5Ody02EmE3zfTJ+96bXVyWs9ItOG40Y20=; b=HWMW+LuCz6utW8S/VyIJ
	rHuo4CHhRhfcBnkgT2it5oCdt4YIlLKc6jaoFTG6NBRm9OQx8/Gj8cgBC4Do0iWk
	mAEHeGX4ZEQrgjmx5BHUqwprw2uw/fxZQF3p+JzRElcb76yXcKt4GQvOnFFzOajv
	msygurYhvvDfEXZY1Y1OFRcS/MQ3DzxL1Zn7WjVKu/boL2iCknUIbvotLMEHVOFn
	8z9EcTAubn7A/+OQElkqnT0CU8euYHGKsuMyJovfBE9MpfZ4akkMjYw62aGpHRD7
	9NYu/mzCxLPH6caGTchbWrsAFJNSQvq09+77FlRkr73QTb2lnAcZCq5a3XUaooGA
	UQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hjqe5vwty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:04:03 -0400 (EDT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c7bf2d734so1594056d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793124242; x=1793729042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CbwQln0osS5Ody02EmE3zfTJ+96bXVyWs9ItOG40Y20=;
        b=MkOva+DPKFBicQaIHSSly2JfoMAicHAbd7jFFZ2jAPfMZSSAxwOfcC3CPShO84ijPq
         ZECGGl73Kz7/09FPj4HtrAatZ8+T45RQt+M4cGZiieC2QJbgruC3B154GGVXb7OAzN+0
         2UhtrH2K//SHtIBzgQwch7+1xSTuSdd3XBXrSOFftUuUdhA49+eAWmetIwHQ/lmQkNU1
         eDgkpiPJIa7m+mdnAJUQCGKhtaBLbGtQoh5/+RjGZf2sev+2X2y5UVI9n1Ip2H0WcVvt
         DLiMDqjdZzodxrWp70M2mYAtjmKnXIkOjZKPebpETepX3BO/HR7B5Mv3SiADMWH9paOp
         KEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793124242; x=1793729042;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CbwQln0osS5Ody02EmE3zfTJ+96bXVyWs9ItOG40Y20=;
        b=oppkKdRcb1BiZOKMnZsdsATOSKopS8lZ7oh9snlSYEsf29ocoMEr2BMKuIZgfaVud/
         WLg+BcK48FVAYWwomxoZeCHaa/azSGYlb2mK7xWOgrfxsCfjmAz9oDzCMRqyokQqP2sZ
         YIuUrsOnj+Sg7x6Cpk/E89fTkBAN3G1mGkott1tmvdEZucwawCVywNa8hTlgUi8/CE1A
         giVyq39NRAEV9Gfu8jSBTdfDzqGHxzd6uhi7lYjEvW41QP6WX3qeINM+vGqeyjo6H/oh
         m5YREztSAQlQFaY8/DgJkpGvbbkreztyn+K+e1Xr/TIte0foVlOa81A/lF04UoKr/148
         pPEQ==
X-Forwarded-Encrypted: i=1; AKwUvBytUQ0P0GQRYsrEv5Wexdpc9ZeTTjQwSUbh1yYDo9lOVSSsD/BJksoSJ+8/FktJ5IM2SWJO4ykH+cZoycc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNoXdOfTwXo47dc3XPPjBGmCEmssFtFDxcZwYIH2Y+mQVlgTzX
	91Jnrm+uGdJM3KquZ7BYWlnC1VlWRUQQW2ag+dr5Sl7pDV5CZSq6qwvPGGgNV1/bUHWt/pQHXix
	ohjury/8rG60aeDxXcQ/kXrBg2m5TedJZXp5UViVCn1lbySsEnP2GjRKGBDEGrg==
X-Gm-Gg: AYBFou0nIkp/+HwhXunLgm/AEWVPiXCLd3txUbGbJtxCncSQpxJ5c1iqINOMyR6YzB4
	ebj3nOLFE5z1ey7ETTcTKL78tm/T+Xe9X0nYbiEwCbq5IdRE+jbsDVxEpzjgyWepTyjFTYPPVxd
	v5TRhvoTo6WjkRev9I2EnJ9gUlnf9EK+D6QFcl9ZY7SX9aMZ56jQ3uvQQvZMgBanNe2jHkEziDF
	EgLjVt1Ua1TMQqrO/la4q89SIf4N24lhSGr4o3TMSO3iaDZUFtqiC1xDRErhDOW9mAlTZ90pZib
	MZn8AbJKBDXNdoOVYT1XXFVdNLCHmO/9IFrWdbKw9Ri810fU9Rbu6ZoYK4n63ipwxeB39Dhh5IC
	SqMFACLz0XiAAKfrogXWrBBBilvhOZBx4S9Cp5bKzqv7ckETFhNAwcCqq/8ThOKizMGTinyjP0i
	LQC2SKlLrvlnRkmx6tMPr4U7XiJHoXgkPx8ZhKkJGz2i3Z2AKbRDbIzm+a2V5TPuz9HcxO/H1Jy
	IunbhBf0zQCZ90=
X-Received: by 2002:a05:620a:2a06:b0:93e:c12c:9dd2 with SMTP id af79cd13be357-940ef9ed966mr1547495585a.82.1793124242358;
        Tue, 27 Oct 2026 11:04:02 -0700 (PDT)
X-Received: by 2002:a05:620a:2a06:b0:93e:c12c:9dd2 with SMTP id af79cd13be357-940ef9ed966mr1547486985a.82.1793124241704;
        Tue, 27 Oct 2026 11:04:01 -0700 (PDT)
Received: from [10.206.51.58] ([129.236.225.183])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f0a94a5csm1037624685a.41.2026.10.27.11.03.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 11:04:00 -0700 (PDT)
Message-ID: <208738b1-35df-458c-9955-e2e5318fd2c7@columbia.edu>
Date: Tue, 27 Oct 2026 14:03:58 -0400
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
        Johannes Weiner <hannes@cmpxchg.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>,
        Shakeel Butt <shakeel.butt@linux.dev>,
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
        Jason Gunthorpe <jgg@ziepe.ca>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, kexec@lists.infradead.org,
        linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-cxl@vger.kernel.org, stable@vger.kernel.org,
        Josef Bacik <josef@toxicpanda.com>
References: <20261027-fixes_core-v1-0-6f74bec9a5bb@kernel.org>
 <20261027-fixes_core-v1-10-6f74bec9a5bb@kernel.org>
 <auCw2-_yjh1_RjiO@cmpxchg.org>
 <5d431bf7-8813-4e2c-a40d-b45d4ff39a5b@kernel.org>
Content-Language: en-US
From: Mani Tofigh <mt4022@columbia.edu>
In-Reply-To: <5d431bf7-8813-4e2c-a40d-b45d4ff39a5b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DzBUE-I34SUdoYh-WFFnp9PYz5m0rbY5
X-Authority-Analysis: v=2.4 cv=Xt9vqlF9 c=1 sm=1 tr=0 ts=6ae0e793 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=TdXXog4ttPu8yHJGq4T0ug==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=VwQbUJbxAAAA:8 a=pJWPUViXIfCbsMganCcA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=zY0JdQc1-4EAyPf5TuXT:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MSBTYWx0ZWRfXx2ZpnP7DHh9w
 2exT1+JDVzYv6Aye5EEgzztVsyOlDHTAZw09ajKphZCIgCVWbi9EyksLwK6ZSJ+rf04oFiSuOag
 Y6a+T7IBQMfL5aLfvtMNXhH2a1JavTNy+WhcUh32ZETTBLZZsTtR
X-Proofpoint-GUID: DzBUE-I34SUdoYh-WFFnp9PYz5m0rbY5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MSBTYWx0ZWRfXwKX2TrRNP5F6
 0LDPH20wUSSWzhdCkEGFEb9wqkc/YVngvuPVnftB7USYvbcipqXoeolV9jBNaQk3YuP/EBPGMWG
 zBcY7GaWUUdKnbgrSw+tNAMGhUm7E68prffmaqLNHsRmFttsNbU8DLwV3PiY4MoAfOQvRrtrK4f
 3JtDXtjDn2ddCa3l6CwgtD+YeE9RJSqJ1zHcSAj9egRu/0AiJ7aDUJPeBCCHU2Nn+2Gw3BzRYQu
 xjuzobVimvgJccCueABy4FuaI5AUqt8CiYov0vzG3xci9l+aEEBikEASnTH+gYT4PH18/m1ImE4
 8NImZaVMna3MuI+pD8Wt0KD5SmSM2lG7F7lMkwwvUDChOjFzvNwaE7UCXluDtTGPx0tG5jkF1cM
 lMLbwL7MeADLTovJA3Zi5Sfqqeio01RHBF8vkb1ka14/WBetcIhwyYw0OufKJCjoa4VIVt6nwy+
 umE/J0UchR85mdd37sg==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11948
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=10 phishscore=0 clxscore=1015
 lowpriorityscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270071



On 10/27/26 11:15 AM, David Hildenbrand (Arm) wrote:
> While I have your attention: This variant works, a different proposal used
> 
> list_del_init_careful()
> 
> instead. However, that is documented to require list_empty_careful().
> 
> Do you think it's worth looking into?
> 
> 
> https://lore.kernel.org/all/20261026-thpsplit-careful-v1-1-d357d70fd6f4@columbia.edu/

In this case the careful variant is fine without
list_empty_careful() since it writes ->prev first
and then ->next with smp_store_release(), and
__list_lru_add() only writes to the entry after it
sees -> next == entry so it can't race with the ->prev
write anymore.

But your version also covers the PG_partially_mapped
race your comment mentions, which mine doesn't, so
it's the more complete fix anyway.

Thanks,
Mani

