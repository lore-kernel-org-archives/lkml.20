Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439306;
	b=BN+8bEIkt6+4jMULUSaPkYdU17uW57nx7PcWZKUuAmBH/Spn+6dE8xy7FV+6u1h8eST5
	 UAoI0vxOsrhcUH7P5+lwfeWfpGTVyVPzVGAj+AnB/9sT8XwmOm6hLPakBxhY0Wnrw7yyQ
	 D7wsFm35cq2l8hlf7J8ud0QbMJG/ZRnhD6QLDghVRPYPXcwY051+HeBbd6+ORVTpsIiSk
	 6WQNnZTtVt3M1eJ54XMGN/w/GS791LTq6k1REWFPEkqBKjjeJ4Vctkkf0WhjmCNxMgLJs
	 1xYGfXGQ3fa1fCX6y2G0XqUrN1Uy2WeFrXL1a+ri6b7Ap5oSxTStz6JCbDuaD/2ypOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439306;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=E2Z2d4ubA/vBybLDW0A3M/dONekPuI7b74giCSqVh1w=;
	b=NExT9iusrzNAxbZ9jJurxjgnkj5qajl1cPwZ85XXJH5ha2lLkJF/zvNz2dtiW0weqyFJ
	 XusILJRKgl0A7CZ2hDR6MTCmCbss3H568QG9mxCUNglFwr/JRPN2RJcbgNozmYBarxrxE
	 k/dcL1v9D8KIrv5LKMv7XU3fRdLVYi9z/uTVsDYoHRvfrfjP4go1C2vxieFvL8nsI+PLw
	 pc5OelzLaBf66XH+21Udgk9f4XyrIA0sYf8oNiUl5m6eeXVDWYB2EuGpL1n7bHACla3B4
	 DJ5HB+LDJmSjbjyM8qm8kQHB9KQtVibo61ZNGPhpT/woef7IzvrLg/hjPIf4s1XFCAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=VU36wWCz;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=Cd5Tmp8+;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1079A606A330
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1079A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=VU36wWCz;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=Cd5Tmp8+
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABMBsGB1795617
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:21:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=E2Z2
	d4ubA/vBybLDW0A3M/dONekPuI7b74giCSqVh1w=; b=VU36wWCzQDQPCDJskRC8
	GUumOBIPmH3k55QPlp1YNsxNWGQx4zstGDwIkhP9sggGaAtNDOxVNPM+CIQjV7M0
	d76oIXkhjHWJS6/sJD0V7xwxACCKXbEImyr2R53OJ05AYwSPslCjX6JDP1dkJFLt
	ZGLE+lAezMF3v+tbabY1FXS8t+DLmwNBkOOjfe50Y+e8kR16R4byD26CbkJ1engs
	dELYjDkL4R1vzPRAlEtkmGpBtSZPDEYDeCqZDX8LFf2EW4XF+J1pPYC3lE2ZFibP
	e1E7tig8fu3kP6Kh4QBMujICqMTX3AetkkzRw/0wJjtqfoXr5TsZMDAY2ei2x4fR
	0Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hvyxkgwqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:21:38 -0500 (EST)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91ea39a2f8eso65585816d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794439298; x=1795044098; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E2Z2d4ubA/vBybLDW0A3M/dONekPuI7b74giCSqVh1w=;
        b=Cd5Tmp8+IxlXDjA5tU/GgeRi46Zb3uDPWz+QALmyneKQOujMP94KHDunl7wTrDmO7M
         yicU1Bfn2b1YUNO7g3+boC/Cw7PN7mTm1MTLHiVRNJ4IK/JFRKDqE9NxF0ihrE4hXjCU
         383Oy8N9LtvRkxFAMGOk61eAd6JLxQ6AGCDjS4qtQ0ou6A3kbpDRHHJ00ZkQoEYXOoLN
         0cpw0wPJnYon+Zb2VGLtItmVwo4kBbRFQ8k//L7AlWyfpesHMZ25RCIMLZ5MvOQ/vo2C
         smUr6ARSSboXegQizc/stiEPiVMiYfoaFneA2YQjjCoCAOWufOiMEHsjWUbAv2vTMr1C
         1usw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794439298; x=1795044098;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E2Z2d4ubA/vBybLDW0A3M/dONekPuI7b74giCSqVh1w=;
        b=W5ZyiXxHgTSrrzRTqqFk5ZPzFW80NUIJKd4KEKe3w7gfjJ2qw3nlzR4uBxQlvMOeRg
         F6Seg7coUtC0lJZ53EN9ypeItIoEb5GSg36b1k86YPtKNJk+lluDNaqFngIRkyiF0yuO
         25QMz1wV/ZAw/KySPPSmsmhnKbKcMaZ72qLLmftSTEoI/9YPqsKCIr8jJn4V/uZErW8A
         pq2371+wfQFZKEX2JWlP3o9oyl7omuO3WYHRuG8xNxXntmFF+au4r1oWoNvMj1P9Nsf9
         ZCMfuJ8SYxAghv4G6/soVMGGUZZw4xo/ATRQM9/EnEmuYkRKP4Lg6QLLjFZdq8ZU2SgT
         7pJw==
X-Forwarded-Encrypted: i=1; AL+hErFQ0lSFahIPkx4xL1FM+uJd/ibp/B7gcpjsA2fPIDFfY7nsceSEKauKha26cTQZ20yNioAdupNCTBhwono=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PGwwThSMcuE8grLmyI69QmN576MIJJ+HG+9TJ+X8nhkHmDWne
	hUwrDNwf6mgguStvddiHMYR6zXqYKu7lktnE+nujljyfhJu/r14LhPE0KiF4SFZn37czV7nnfzq
	rWn0wyyfsm5yrX1JvI3lSD/jutgLQ8HazbOCYU9aD21lijhz5J0gHNPCOhSIREg==
X-Gm-Gg: AYBFou2Gzsc0Sd3ty9TImg1HcAS2WMuRHCDtCWpq+rim5+rKRwBJAy0tSbJqFcuQ5Xk
	2c0yqBh1T6wTjUxXHCJcqv4Q+1mZKyDG8Xn3zul0Da3E2GKuAPTk61VAinwayNi8V2v0tHKM9Mp
	l+NmdYHvYsgZqGVRXB9PtNxvcWP9i9rAYRgKv6wuJWtk2TfvPQ2bvAMX8qM3cfURuhGWu3ynZqU
	TktzmP9f8RZqJeSAKC14frEJvbD4LkSENiSXDNT83kK4aGxv9s74P/Ol+clbjpdC9c//f6UsT39
	7Tj37Z6XCRVzhbbX4TqCIbVS21vy2mkJBeoOq3g2SbMv55xO/+Gb5a5vOUsj+KRYUyAXKX+CCcG
	SpDfHoX29XUQCB+/DyLaz2T3+CDyOuEBY43gZW26IJzdHY7RAp1r57NvRwk4jIZgYkyXIh0iFx2
	0n6/moJEeYPNDEcntJtxnFoGL4RfY=
X-Received: by 2002:a05:6214:d86:b0:91e:a629:ff92 with SMTP id 6a1803df08f44-91f04196dd4mr71943176d6.42.1794439298052;
        Wed, 11 Nov 2026 15:21:38 -0800 (PST)
X-Received: by 2002:a05:6214:d86:b0:91e:a629:ff92 with SMTP id 6a1803df08f44-91f04196dd4mr71942586d6.42.1794439297418;
        Wed, 11 Nov 2026 15:21:37 -0800 (PST)
Received: from [10.207.116.169] (nat-128-59-177-239.net.columbia.edu. [128.59.177.239])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f02fcc4b7sm33094936d6.44.2026.11.11.15.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 15:21:36 -0800 (PST)
Message-ID: <e19f1fff-f1a7-4c2b-8908-2d3ee6a49069@columbia.edu>
Date: Wed, 11 Nov 2026 18:21:35 -0500
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
Subject: Re: [PATCH 11/12] mm/madvise: send UFFD_EVENT_REMOVE when installing
 guard regions
To: Kiryl Shutsemau <kas@kernel.org>,
        "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
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
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang
 <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
        Chris Down <chris@chrisdown.name>, Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>,
        Michal Hocko <mhocko@suse.com>, Mike Kravetz <mike.kravetz@oracle.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org
References: <20261111-uffd-state-fixes-v1-0-00713d368976@columbia.edu>
 <20261111-uffd-state-fixes-v1-11-00713d368976@columbia.edu>
 <avTA58zlxJZ69TB8@thinkstation>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <avTA58zlxJZ69TB8@thinkstation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA5MyBTYWx0ZWRfX47puus0b8yKs
 mGHqUR11BJGtxr6ipS9fPr7HXzXoLXG3mOdqdagsq8syain5KtspUUY0l4Bs9ymx7G7Yh9iq4Qt
 CYyEYW3HmTOLpe/1x5ts/WBV7lHWs2xu8TSRsvKR6ff2DgkReNXvUq/nEOeZDN+mQ+HyDY4OfT9
 dap6wzlxa5OJGix7qjeh25WLg4i8isNwL14PCn3kjW8nlb0MYtFhOjtgGIw7KcrrO5+aQ6mNgac
 AW63SFrdh25dM7aFKUtI9HYJqt3a9eF02QmN7IyyTUhUshIT7qKOUvw7FhYP8RfuIokASicPveL
 5qGtL5bSTxdZdFpdPNTeHzdnSeJO9YLjo3pDhB0V1SB88vD5M1nq1xqJENQ8KLpx8ADR7ToZasO
 vH7zzAVbe6Gten6piu/pQIV5wGoysUh2v+BDOZyVngA2VWN7r7dPkdPCJT8A+VQmadBw5gP608L
 fr4ZkTBNHW4In2akuMQ==
X-Proofpoint-GUID: Tj9kWdbYyJ-Lzx9j-Ab9FwUuI5vJIl6M
X-Proofpoint-ORIG-GUID: Tj9kWdbYyJ-Lzx9j-Ab9FwUuI5vJIl6M
X-Authority-Analysis: v=2.4 cv=L/yI0OT8 c=1 sm=1 tr=0 ts=6af4f882 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=BoHXNMl2GZKy+iVh/K8zVQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=eFDYe-PYqAWV_-s2uwYA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA5MyBTYWx0ZWRfXzxA+RYG0hN78
 Lv5ObNO9j8TlfgmTJiRroy/1s6TFdixjsJeXOKmG9bilmd/VSSzbhmeqvQY8R1RYiGsNlyPHFbD
 W7P6JUUYNlsLndib6eVoObfqrf8iR7nrB84T3mxwU7/xbVeYdfhS
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11963
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 clxscore=1015 bulkscore=10 adultscore=0 impostorscore=10
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110093

+ Jose

On 11/11/26 2:25 PM, Kiryl Shutsemau wrote:
> On Wed, Nov 11, 2026 at 12:55:19PM -0500, Tal Zussman wrote:
>> On an anonymous VMA, the zap drops uffd-wp and RWP protection along with
>> the pages. Writes and accesses to the range after the guard is removed
>> are then not reported, and the manager cannot know that it has to
>> protect the range again.
> 
> For RWP this only holds if the range is registered without MISSING.
> 
> The zap frees the pages, so with MISSING the first access after the
> guard is removed is reported as a missing fault. And there is nothing to
> protect again: RWP only covers present PTEs, and a page faulted back in
> shows up as accessed in PAGEMAP_SCAN.
> 
So this makes sense, but I think this gets at the documentation point
raised in the other thread. It seems that to use sync RWP "properly" it
needs to be combined with MINOR for shmem and hugetlb (and MISSING for
holes) and with MISSING for anonymous memory. Is that accurate? If so,
this should be stated much more explicitly in the documentation + man
page. I see that co-registering with MISSING is mentioned, but not the
rest of the points (reclaim, collapse, etc.) The example in
userfaultfd.rst also registers a MAP_SHARED mapping only with RWP and
MISSING, no MINOR, so that should be clarified too. Hopefully this will
make it into Jose's documentation patch.

In any case, this change is also needed for MISSING faults. If a guard
discards the contents of a page registered with MISSING, the manager
isn't told. Once the guard is removed and the page is faulted in again,
the manager may fill it with the old contents, when instead it should
have discarded them and filled it with zeroes. This is similar to
MADV_DONTNEED's handling. I'll update the commit message to emphasize
this point rather than the WP/RWP aspect.

Thanks,
Tal
