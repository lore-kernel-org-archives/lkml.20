Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794436759;
	b=zIcT744Qf+qaJXJ+UwiWBEPSG1synB/GONlBDke2HLlz47OlRvMEpVUBCbTtrOlffHyv
	 8E+c3IwuJsjLJoFju6+WutSe9uRixujfIY3kYuTmPLYSQGwHwO4BQME4biSTVEs2rN2dU
	 rPOWnUpB6AyULCfcxbYUSWR+PRH18+/OVqb9cN4fdTmKsu+PU6oz54i9BHAXJZ3Vxdxez
	 ExcoYzgSeJcQzn5iAGXtufXjnRgu7MpZu5ktfh4n8TD3VtsdGmCIymzHJoGfPQQ2Cxr+y
	 uCJVZa3GySdrlVkuzPXM8VxZNREHBxAUp0n+6ltlvQ/iIvSk6+NpV1lTSOfKdOXioFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794436759;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tyB99dES1VWSWEDHCuA5hRT/5p/ujc67VH3aWrgWNkc=;
	b=fjYHKz9Y11WlCOIbcFTaHpjGGcTuc+ygjFD3SmMmGCeVGfy28A/LwNN/JLn0YYCZX3ry
	 lCw/Q3xygRB93pIeQvCxazYNJWgyQm3KgYGFQt4cr1/3XZ/yfP+Ifl1GVHXGlQxKigMPH
	 AyRIXRzP7C9zKZC9jvW5vKlxPIdz4x/S4bXiRgXssQhHj8O7pkWnLT9lqF9YxgasOgWO2
	 uZLmhK2BXfcC7SkdNMkfeiDyZvrtTMA6+L0qdDRAgnzkUBM14Lw5NXuWlBiHIpBE81KdM
	 wvpkHFMDoRx8z9Mo+gRnw6nlMVuTLyacg61e0MaDPeh0cETY3uywdItufDFhFxRzPBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b="IT/8NHst";
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=m2ipMgTt;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F01C606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:39:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F01C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=IT/8NHst;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=m2ipMgTt
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABMC2Hx1362430
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:39:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=tyB9
	9dES1VWSWEDHCuA5hRT/5p/ujc67VH3aWrgWNkc=; b=IT/8NHstUgDEGgSQnLX6
	Vaiv1AWGs/qhkiRKlUcq7D3eR5gJ6ItvRqnKsmZtifCmYF83Etsk6xnSg4ghYtJq
	E3Nqa0kPb00QkhUF3JRsTPPds/3MgmGm6kO+aDh9nKa4vJnXR2esYIlCFPgPXPSF
	lDUFil5vp3qkfjAq/6sbqbK9b31ugJ/b+kyU7psmTCLkP66JQr1rsht9NlWn/cmN
	je7rKgCUnqELG3AW5AuZzJoGUPyEc5DA6apdCCOb7QTWpyxE8PDE5hdqLeYunDsC
	dTBiuFo0GmbBv8Ls2WN0w0DzSQA2IFSMjQ7cwioWb1nXGym7TLR/jbioy1JwNf9Q
	0g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hvvarttkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:39:17 -0500 (EST)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91b937ecbb4so70638946d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794436756; x=1795041556; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tyB99dES1VWSWEDHCuA5hRT/5p/ujc67VH3aWrgWNkc=;
        b=m2ipMgTtQ01aPSI3MnlI6+7Ebr6Gg6B6s3/hgBmmCLfHtrrGc6Fht9Xtxn34JDJRSY
         Wi0Vc5mc0T12XHIiMt3rcJDcK1ciqmQGVKx0NpabmZ6TaNLGVlJuVEZOkzK2XZyWbXLx
         r+7sbLhztAGJEGbgXUSY/ofSgqYKc+t2UqEjQ85rj3kHh6JB7mxNZg7+UnRkzEat6Olw
         spsRk0qdEg7xzBFvCLGd4ZPD/TXPwLZHONYzigvtK2ZJ1QTPdG7re/OeXmGFp+oqc2bN
         GDYpFlfQaehnkb2pA3EAL9UO+NEJXZEcCtChO891xp5rUT8RiY+hTLAbWw2nINzDBTyV
         fQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794436756; x=1795041556;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tyB99dES1VWSWEDHCuA5hRT/5p/ujc67VH3aWrgWNkc=;
        b=p/YNWa0Yge87OvOB8sQ7Ub1CIM+DEfQOWxhvl+dG2jVU5CWphNeCx09VxAsgj7DS2T
         5F7HtVGeJm1gNcxN7OJIkQ8G6qdNUaYmM1Oc+4Nidt7Cmhn489aae/hDNjXk0LoVlqef
         DUyQnaaqtusRU+TBPNtjpFRWV8hYCK6t5hpKhuYNjJpCopc5G0w3BWkC1HxJmRN77leS
         TfDVcOAesu1AmlYpXEUu/MB8P/cq7WzVKDIk/pVuSbbMfeHMuX1wy/nnAgtY2GGLvpml
         F0Phw7uuT1A1Xig3b6TbMRocYitxGc3CLGm/A49Q99lE8m1ObWx5p5aMZYrFocDSMMPH
         0Ruw==
X-Forwarded-Encrypted: i=1; AL+hErFvMbHYet8ImaBs7bgLXQTpdbqVyKibS/ViIjwXTuxpe+7r8pVUidOtWAIfoVqWVQAlhAyS6uLX5YRb9Io=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vNPfaWQ6Q9Ip0oTqpEYmQct+bK4NaFt1IurvRZkwpGWaO2D0t
	wkZcQszHZvIpu8ct0eDFS4AilfbUtl8pwyJTe1IT2LiQbd+m7rP8EILb9yOG5VG91fI+ZlqLUo8
	3imQhQiZz0c8/Sfy69UOzI4vEjxi3b1QrDYyBNMjSeU6Z7G92rTEt+31JvyAJ9A==
X-Gm-Gg: AYBFou06U5C8awkSks9l5CXX+ZG75BpxABPpVW1kcTyHZ2HkQSgfxt5yGMae0xSA9Yh
	H7VFJtMjJVXIts3JJDPtQfDV8hBUvA+n0OvE7+9BpubAK90nzgY8JqY8riILTp404Ax4KQCAXrI
	gLVDwq4Xq40Cbz1GUDVvQFq2ZZ3Rya1xScDZoCGfVbi/w/gaPyjPLApPEVuuuX6npWLdU1reCjJ
	OYfhmeWaKDGF1dIOlPoUMB4PMHCwy45ClNXJSML4iCvbVBDJ56oMdgG2Ksrk4R/1tXRRLqG/Pul
	AYU1oyxoiZsZsFnazbg1vpWQhyW3q2aK8Sgv8+4uYIpE0q0IXaXF/f5Nu/euAaCHq2oFx7cFYS3
	t5EIb7inqFvhzzwImX8f8FOr4tH3y6t28ydyfXCXFX7x0D3O6LeAq9Z+BwAnYWK+Evq/zne1Cm3
	eGcYm0abg01fzPJsGmHTUUL0RFWtA=
X-Received: by 2002:ad4:5943:0:b0:91c:996a:7fc6 with SMTP id 6a1803df08f44-91f03e26d40mr67403436d6.6.1794436756506;
        Wed, 11 Nov 2026 14:39:16 -0800 (PST)
X-Received: by 2002:ad4:5943:0:b0:91c:996a:7fc6 with SMTP id 6a1803df08f44-91f03e26d40mr67403156d6.6.1794436756029;
        Wed, 11 Nov 2026 14:39:16 -0800 (PST)
Received: from [10.207.116.169] (nat-128-59-177-239.net.columbia.edu. [128.59.177.239])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef04d8397sm57802366d6.18.2026.11.11.14.39.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 14:39:15 -0800 (PST)
Message-ID: <956d86f1-9d8d-4d4a-91a1-00583987c622@columbia.edu>
Date: Wed, 11 Nov 2026 17:39:13 -0500
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
To: Kiryl Shutsemau <kas@kernel.org>
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
 <20261111-uffd-state-fixes-v1-7-00713d368976@columbia.edu>
 <avS_43B79K2lUV3Q@thinkstation>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <avS_43B79K2lUV3Q@thinkstation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Q81HcI2a c=1 sm=1 tr=0 ts=6af4ee95 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=BoHXNMl2GZKy+iVh/K8zVQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=VwQbUJbxAAAA:8 a=kkTTwOaqnXeBwKB4IF8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA5MCBTYWx0ZWRfX0OCiWn4cEC8P
 Mz9Tka/lNsnhPv96wP8s4B47FdM0qwFzvLGxOA95KLwuwmH9dVhR1NjInG/FRahus+A/3boaiRa
 WpTjRMO/5lvNQOU80qHwvNORTZ6fmMP2H7lzcpw+bcSx+Xhffo4J
X-Proofpoint-GUID: 4lpEpUf7In0f6Qj8CFmJAmPsDKS6GQgW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA5MCBTYWx0ZWRfX7gQrUYrVZFSo
 4Sm8yG+5ur2/es5gx3fvo/7MgQyePynU3ldHyvQKppEgc41L3hjR6oV9AOegtPycd8IBaN0GUTi
 sRxlYSXNoOEqt1BtUYRBNnRKyKI8OYS//5YRvjz6aYvjG8LahW8UqmuSWXq741X/5dfZAlvgQ3w
 ZOLGsG7ypl0vDeYDsTRsw5UHx1jzKTZ4slVmV7Yyw2b/kjYr/sjOjsQBho/ZXLXEcRIQJgO3aJY
 CI755yN5L+Qxbeo3fJkpvNonLthcFNUAMgpFUSvxLQu8LBeTrhioC7hgTn4CshgxOaN1JX0y1YY
 IfiISZdtWhuNS9dWOsO3e6W5Wy0PeFOklm4qRbuELMcwGvYxpBaDsbsc5btpPcKOFxa4EfIsCs0
 FVhjQ5Z59CwVOSKOQDtVRKLJa3a/QQVdSkWpFE8ncTL5AzTF9uu2oYN6fF9soSoQm+TLG0rTga5
 SnSYZsvGVG2b5sB6m1Q==
X-Proofpoint-ORIG-GUID: 4lpEpUf7In0f6Qj8CFmJAmPsDKS6GQgW
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11963
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=10 priorityscore=1501 phishscore=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=10 bulkscore=10
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110090

On 11/11/26 2:20 PM, Kiryl Shutsemau wrote:
> On Wed, Nov 11, 2026 at 12:55:15PM -0500, Tal Zussman wrote:
>> However, this adds spurious minor faults on shmem and hugetlb.
> 
> "Minor faults" reads as UFFDIO_REGISTER_MODE_MINOR in a uffd changelog.
> Maybe "write faults"?
> 

Yep, will change for v2. Thanks!

> The RWP side keeps its behaviour: vm_page_prot does not depend on RWP,
> so resolving with change_protection() gives the same PTEs as the
> per-entry code did.
> 
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> 
> -- 
>    Kiryl Shutsemau / Kirill A. Shutemov
> 

