Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870034;
	b=dKasGyup6+Ov3iodM82tlYqTmb1Ff2JHG8I6f74xmNeVo1/OWLK4in+9/skZMWayxPNN
	 Xx99AAAQURVnnbbWBQA2DtIO+EeQC+9pT1cgMhBCfxzR89W4DvjNXX/XN3J31o76ysUlZ
	 LLZquCvf3UhMzPNZP8S75Uckt7oN4B1vDZ0q0H9EhQrxJ3gkkQ7yTqCpE/aIjlc0HY1f8
	 jJhKaFJ7AuuPeRRrSIhrl5lgl3tsilFbwaHKrm1IUynmV8l+CuFBB74/bRNcuYKYaBqRv
	 D//Mj3j1wdA28h1iwFv54Otg/BV0NEI6mwp9qotfUkCl4xcZEU4oLb14dfq5yw4genA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870034;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DrgpmsI4pZAgdTESjomnSbj/5rvp+0MEGWpwnCYEqBw=;
	b=pymMGNLOx7Yk59B2K6DrCbGrrKUa7HKNgkgzcfRCG319Pgtn8fLhFGlFTLS62GSh7MYi
	 1pHh82cAmCcvVf51VIABN9kDuQSnKFXx/6l9Bia3HU84RMe2Skgo4CkIZLtR+GBEHThqL
	 jUbQUtCs7c+NjgbC5JTrcE7X2+XgYbhdgjYZnQtI5XWfBSk2Q8VQ8LsgUEuypQfJgfzeF
	 pinDjH7AXWK6rgsjBJtRkEWk0Vr1aHAF9kR0zgfAdq3YTKcHkFUSFaBpvDvYAyFChguas
	 +pOcTQQE7c6WIKCa1XYz/4aSGcWkzq96Yx6T8hm9hVKjLEq2vnec89AbrYCke/Ty87A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=h8wEBqzH;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=25q9ludu;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44840606A883
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:00:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44840606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=h8wEBqzH;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=25q9ludu
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGLYoL82348567
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:00:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=Drgp
	msI4pZAgdTESjomnSbj/5rvp+0MEGWpwnCYEqBw=; b=h8wEBqzH/LUQm2YIPDam
	ND7PzYl7uX5hIzo2H0E8IKDCqczu8OQeKthgNbyHKXTJfqvSE1AtX7AAH2ET3Pu9
	oUi+s/Tw/pGr6XbXNsOFIHyuqVr/eymttT+JD9lfGEIFvEU+t68KaAfZMGuvgZGC
	EPqnwVbxA1e/RV0HrgZFSYEQGufXuJyADNwvF7rXlwqDTv6a9rxCno3HtH35BVqu
	dNoCsC/C52eCB/S5mqu0BE1pEp+1BE45cBw9QnZZM9wJfJxApwozwjL0m2qnxzYi
	h3Bmq/eFSDsyc8J6WMJK8ptkqkrqft3msvZ/6IPtZShkIH+QA63FRoOsRbuLRZ3q
	ng==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j0583knex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:00:32 -0500 (EST)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f26dd2165so1210722985a.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794870032; x=1795474832; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DrgpmsI4pZAgdTESjomnSbj/5rvp+0MEGWpwnCYEqBw=;
        b=25q9luduqSbiSzHGzFQBy7kWHby2xg9FjVeg6PCvVzCzbzGJykLZ0LzyO+0fUgdtRT
         WlUc+VMvBR/21eYd9YqPkaXynepMmzKwd898o3LPzMbVqfiZnWGTkcAdO/Q5Qv4KQBpw
         NhLaZrXuvyYn0B+13IqM6hOrXyZLquYf6Dy8BS2bClKMzRrnfmN7izTI3CbAVZCkSzIZ
         brO++n9kmGvkerBJ5PIOtSSwpWHwAjKHv75m/Vb+sB9eH7GtF+l64Jkjb4LufUMyotVB
         5ChBwCS7cONPvmRCfkuADVr6bjFpB3tQCNK7GLR1zZwzqVJvk4aELwYdeNNyQvhFCMld
         fCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870032; x=1795474832;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DrgpmsI4pZAgdTESjomnSbj/5rvp+0MEGWpwnCYEqBw=;
        b=OoOty9vi2Z2pAXpOGM/hvhyXZ2+JxoQMFE/2udU9jBXw3pM3RDwe7Z75MwDwlRR1Yu
         XAqS293LowrcmvDveAYYxroWWVU0HkDqVk5Xsq7eEsR9nIWi+eszgw97iDkJOvEG1LUi
         vn3nmZrftdnP+bYFMGbZHzD8CKuxIRQQcpVlymvp7ixq5P7gN/yvdN42S2QjwTxViZlY
         2NKuswPHNHeaK/4VpMr/xeOPE1dcSQTGP1HDC7BfpGFFiLxTPlt01LuDgfl8oqQA2Zx8
         5ElwhfgdGe5qoxMrVU19oAk+QCLWC+mQmCZRScEpaDsZD0BJq/UIpAnaAsXcC55Rg11Q
         5AjQ==
X-Forwarded-Encrypted: i=1; AL+hErH3WsUu9t+dcGjVL8DwbRZmwYuGv7whmvi4sYLxG5hXsYMTyVFACsXPp1RQju4LwLoVHKTA4AltiqBaiCQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pl92OSkiITEKXhcFUsVACcfURiE+cdrqN4wmuaurFqQ+NRT3J
	5yuWZuGNmgBvaNnaQeCgB1DI3a2TUFqJSDa8XGOiWLSS5bHGPtMbqX9NkOb3hylobHdgd8GffkU
	vUwm1Q45+sTEDL+euxxpjCq+Y0iI1uhtPmGNvERZIbgKpK2VKYZL3/nLBZkEX2g==
X-Gm-Gg: AYBFou26NawjGerq1X9h9XSRhlpwsv0QS+HIIVVFlIvhwY1MJIVYqd5U4LvPMFL+3ma
	KOD8iaKpaUnLdLTpJYVEtSTR+PEFCH/9+RVCQ/93y+4Wy19baHxASbSnNmaCW9dDS3O6pOuiWqN
	FQBrI92vvPSp2tUj5ASZ1+ZXfo+EivkOLzB6fHWecfrtulJoB22f/lAydOADUIfAwL2JjUZLdgp
	WM6FsU6HFwQ8cRAaEhjOoZa4iTJm0gP4HXJ7EsmiIfZyaa0LSzWWFLxGEZiRQf05Jx9yX6wW9xb
	eicyk9iwp9xFy/a3eRXnVU3waDx/HYypx8+zN06kT3g+t3ecwcZVrHbbuXx9y9GT9sNZExdmWZi
	NkouQzkWGbnMrSv9YHhQYFhcM6xi8WoDyvs9vDcyM11wfyYqPqwrN77QHnP6oGGxbF8/hJzR6wd
	X54Yon+rR0zX8wMCqeC8efdWc5
X-Received: by 2002:a05:620a:2a04:b0:949:733e:dde5 with SMTP id af79cd13be357-949733ee773mr1059320385a.66.1794870030837;
        Mon, 16 Nov 2026 15:00:30 -0800 (PST)
X-Received: by 2002:a05:620a:2a04:b0:949:733e:dde5 with SMTP id af79cd13be357-949733ee773mr1059311385a.66.1794870030135;
        Mon, 16 Nov 2026 15:00:30 -0800 (PST)
Received: from [10.207.2.125] (nat-128-59-176-174.net.columbia.edu. [128.59.176.174])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c831b7dsm952569585a.20.2026.11.16.15.00.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:00:29 -0800 (PST)
Message-ID: <c9d616f3-d442-4db7-8010-82aa052baaf7@columbia.edu>
Date: Mon, 16 Nov 2026 18:00:28 -0500
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
Subject: Re: [PATCH v2 7/9] mm/mremap: resolve uffd state when the context is
 dropped, not during the move
To: "David Hildenbrand (Arm)" <david@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>, Peter Xu <peterx@redhat.com>,
        James Houghton <jthoughton@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Balbir Singh <balbirs@nvidia.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
        Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andrei Vagin <avagin@gmail.com>,
        Muhammad Usama Anjum <usama.anjum@arm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
        Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang
 <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
        Kiryl Shutsemau <kas@kernel.org>, Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org
References: <20261116-uffd-state-fixes-v2-0-4397a0196479@columbia.edu>
 <20261116-uffd-state-fixes-v2-7-4397a0196479@columbia.edu>
 <20f100af-c831-4e37-8077-50f6366f323a@kernel.org>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <20f100af-c831-4e37-8077-50f6366f323a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UPN4_go50piByCPYWyq4BBVRQt7fNL-K
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA5MSBTYWx0ZWRfX1LdnOoRi97vG
 EAHiJfWacVmEtgarRMEgoWlEyLdRWOYbbn00w4QPmBgXKdQ1hDnFfAyXC3248weDmwmmEtYnkku
 L4A3N05nzFvLUIPNl1k0wQOSOAn0WxZE9j7zNx1X+aBsngJhRxWU
X-Authority-Analysis: v=2.4 cv=QfjzLcbv c=1 sm=1 tr=0 ts=6afb8b10 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=KPY1cyGZ6h6m4ASiENTC8Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=VwQbUJbxAAAA:8 a=tHa68p0SAAAA:8 a=7zGzU32CvNdQK9yYqCEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=ufIsyHvWW7FwcMbVRpPq:22
X-Proofpoint-ORIG-GUID: UPN4_go50piByCPYWyq4BBVRQt7fNL-K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA5MSBTYWx0ZWRfX/VXb+/gR/ft6
 IBAgWLu9IVDW61hYyec52krEZJ43YIWWq/K5pUBHrGKOs6LvrfBUhKyBJYT4+89Sva9KV1o/bFX
 pi5Ebbee/pygAplhPqgpxYZFJ9mtrfUYIKwyglZ627WWsiRW5Mdl1peZloVgj/Zt5WuKjo04WnO
 KoKu3DNBTTLHCk+No+RQMi4Moex5b/XodZ/xHXjeH8R5NdCcd/RaSi5aX68CQh4HYsWjfOSAFai
 rRojS0yNFPWSnmhL9rm2Aagd2phnMxCFVUKXtDDfVHC+lF0H5RBUXrQGDcZ0ohBz6H8/8W+fhSA
 xey2QfeGAukToPo04Sojj6dv41BjzDu8W26fsJH2Dl46RXyc265CY7lEhCS/ALwVfdJVJjWgzni
 LOx9IIjRQVjW12TONZGsYtSKPEspk4YtZOlHMX8BYj+8N+/qseDi83Sesuxjzj0mk6UXXMpmbH+
 8qPH53or3PAQWP/Xgmg==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=10 suspectscore=0
 impostorscore=10 adultscore=0 lowpriorityscore=10 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160091

On 11/16/26 3:41 PM, David Hildenbrand (Arm) wrote:
> On 11/16/26 21:02, Tal Zussman wrote:
>> Without UFFD_FEATURE_EVENT_REMAP, the new VMA of an mremap() is not
>> registered with userfaultfd, so the uffd state of its entries is cleared
>> while they are moved. If the move fails halfway, the entries are moved
>> back into the old VMA, which is still registered, without their uffd
>> state. Writes and accesses to them are then no longer reported.
>> 
>> To fix it, leave the entries alone during the move and clear the uffd
>> state of the new VMA in mremap_userfaultfd_prep(), right before dropping
>> the context, like unregistering does. This walks the page tables of the
>> new VMA a second time.
>> 
>> This is done with userfaultfd_clear_ptes(), which also makes the PTEs
>> writable again where that is safe. That removes a spurious write fault
>> per protected page on private anonymous memory, but adds spurious write
>> faults on shmem and hugetlb, as change_protection() makes writable pages
>> that were never protected read-only. UFFDIO_UNREGISTER and
>> UFFDIO_WRITEPROTECT already behave this way. This will be fixed in
>> change_protection() separately.
>> 
>> The entries no longer need per-entry handling during the move, so drop
>> uffd_supports_page_table_move() and clear_uffd_wp_pmd(). Whole page
>> tables of these VMAs can be moved again.
>> 
>> Fixes: 0cef0bb836e3 ("mm: clear uffd-wp PTE/PMD state on mremap()")
>> Fixes: 763f43865fc4 ("mm: preserve RWP marker across PTE rewrites")
>> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>> Tested-by: Gregory Price (Meta) <gourry@gourry.net>
>> Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
>> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
>> ---
> 
> VMAs should be write-locked, so nobody should stumble over it and walk page tables.
> 
> Rmap walkers can stumble over entries, because only the page table locks protect
> us here. With your change, that's now actually consistent while doing the move.
> 
> I assume there is now a short period in time where the PTE bits don't match the
> VMA flags for an RMAP point of view, essentially in-between clearing uffd state
> from the VMA and clearing uffd-wp bits.
> 

Yep, there's a brief window where the VMA is registered but PTEs are clear,
but that's fine. That's the same state as a registered but not-yet-protected
VMA.

> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> 
> -- 
> Cheers,
> 
> David
> 

