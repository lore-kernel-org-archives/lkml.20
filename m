Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793559484;
	b=sJFk2xU+/USyfQpsQuXhPpGwqg1VllYLLcKsD7PoRbcmAs7NEmQk45VogZVpUysY/tB/
	 28sOe4IKZXs2oj4wl1qJxrBjqLx/ErWn/D/z4LPhrFecOs/98HfWZQCMjSNpe2gtXdsGZ
	 l9k3K38WkWj2Wq0KlIEbKW9etaaFRP3xup7739XW4SMYW7hKnhHOJIhFWGKcB04tauunc
	 XnrnyEpk+s8sYOPotyqVBHCxtgTkssbod/Tc3oonGWd2ed0smfnGwHq5H6XukEgL2uLZR
	 JYZ7E+5HHH5PeQ1y09JDaKPWRWYs23lEH0D8U4DKL+1Gr2NEhnT87HlnH4vxF8mhx+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793559484;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CXYY2davx3hhXmREYRpR7y9c/hR6BJTh9T5lsz/xFXw=;
	b=WJcj/40JuSfPk65YJX/XaMd254dgqPrGytP7NlyF3yBRIOgfKgM7Runw6/dM6n/haCl0
	 SnHEj6z5PWndJzgkUYetx6E0rl6gxzYczhCJar1vR6maBExhyZViXDePBh+WI0fXMQL7t
	 ZIDcd6OvEmVytYyqM5NVxVhrsuw2mgxcc2L2JCG5SLzm0S2SfamidU4lx9nzZMmg+Ezd8
	 cnBaE1m7Vp/Qf3YI/4+DCmEZjymO1IwXMl/jQxd92P2/ZzW0HRrMLyiwm7IkqP58DTZgE
	 YKwVMWwjiKY8wUHQWyFfgv/Ig/U323ECJ1OzlfAGj8XJ7jMM3c+NvJyM7wG+kd7qxIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=WSYejO69;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=i1WVUosU;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5332260A2628
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 18:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5332260A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=WSYejO69;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=i1WVUosU
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1DSfaP2915245
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 13:58:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=CXYY
	2davx3hhXmREYRpR7y9c/hR6BJTh9T5lsz/xFXw=; b=WSYejO69CfdNT81DJFNR
	cTmv2KRMB2Od6Hr6tPG8f678k8F9kgVny2jDKBb7rzPcX8OzDcQ+Q/nHuHfrLMBE
	Wuvye5NceqxWELSLKYTzrwKWhInhEq2ZXZiJjH7TiVJP+RrydeRait9QXjJrohcn
	IazreHB5Ht8aD5qiFeapcTqQhP211JwT3xRQ+WQkTye4Izdv+tuDejCl1m2eL13x
	+UV70Q0BlGM7Qt9pKdSq4W3CqfSrDl24yloIiDMU1BmVJG5/YcMYV/Xi5lp0QBRn
	4g5Tnui1BW2bPVelveiAE51q0wprWe7sX0wMBqJ6dvkasteXLlVlFjeLZWPU7bol
	tg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hnwtt32hb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 13:58:01 -0500 (EST)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb71b1443so486081285a.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 10:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793559481; x=1794164281; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CXYY2davx3hhXmREYRpR7y9c/hR6BJTh9T5lsz/xFXw=;
        b=i1WVUosUK+tKdPcwdvkB8p8ZsQvohzdzyFrUraXdDbEUo/GBwHzZFlm/pN2ozsMog+
         /IO/jLYPgXsTUuWDefz4vlq21tHjFWxHifdIGbyUlOVrzNUS58zS5A9pRg4TA+TjPWqn
         j5JRsLbXHLmA2UfmdM+xpaSC2q9sC8cCfTurFXpKBBKf60Ck+0IZfJVADIahWuEEUPP+
         ScmyPErtn0Nrx2PEIoerPVNEd26I8OgC83u93rNsmfsxI6fY0OLcDDfIG0eEIJK9B7xP
         MEPlPcRYb2uK0AeAKuRBfL7XdQZhZxJ1IDQ/pz3fy+sJjxheOYGMb+ReHVUoetW6Twbe
         Gbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793559481; x=1794164281;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CXYY2davx3hhXmREYRpR7y9c/hR6BJTh9T5lsz/xFXw=;
        b=C30LHaoR7w/fLDbBen0R6QHStqCxU3tzGsebj9gPkA2fFptFnMWuB12nvscifLSbtY
         6diuQ1sxbhXyLMZSJn4ffSRNQOC+qj4Rp5ckNP2GCXLeiHFWKvPjXPErgmqH1LkBcLbf
         ECjXlBkGaQSf0kAt99/nN35XHFV9497aZEaDWTYPpuf8wHW+fXVVXWZwFQRz7d444m4L
         5wbR2Dcp7iAUfr3IdB3S0t5QNPyX8E62xz0ukwOLNqI2hgjQUn1E6Rlpii/xOSpoNJ+0
         R4Nx0HYuCoOTAqakkOD4Ftx6i17JDSXtIQlvEceHsGWitdCZQSXQIEX908gFVGYTFL48
         cRCQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9P0Pl6lz+WsIboVHni/+fRRd2VhpMCcbUWOFs+rnUWXj1D/yRU94uFHgI5GGrfrH/jsKpNv/xz9jYK2o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQSyVicES33GMWGZC6B1uWIeg92wVeoUXPJAWC9WMPesM9iz3p
	VNxeSH5FOzQvst3sL2C1ZBgtyRPw5PwX0HHZxh8Po/CJJh9OgcIMtQoEd6HPM2N04dnoa3DrMsu
	oTec/GWYs2mIwfqVRMklCIaHUzMEaBIF/Eex1zKq68CtXHR99f0Rr4O8o2gpb2g==
X-Gm-Gg: AYBFou2L7W9ZBgLGJzcS4WUPRub+HvMtHLmasdbUMYq5Ynk+38YxZDasV8MyvFNlDfM
	DC1dkQOWYwJ5sBKo34x/W+kOlTznkNvAEPCKs2vsg1nfPaRBqg9LhgFeF7Q9Kex+mMVB9Hs76vH
	rWgFHTAzKz/9q0fHkgTrp1GH+e/sLPFMeeCFA/gOPNEI+RmZzvNLCH4Q2nWnN3DoHnNA0epHzH2
	k4A/HUlc8Rhban8jXhcaACPpEq9WchA5/RXj7h2jSOlIG6fTEsPS2xEeAgas3qsldTUq7S/Cqs0
	CA9T7g+Bawus5jBwa03SuuZoa4XpDLq+GhB2YVHy2hLBG8dTjI6B2G34yATx0+hgBhQjXovlOYy
	ncRQoZqaEjWz45Pcwir+Rh5Z4gc7Z+SmmWC1lGX7SlHbb06JK6DEZvzaMwEuKJfQrTvjGNApxja
	IBFYclKKY43tp8LZ5iW+q1OFHW+Tbv5IanioI=
X-Received: by 2002:a05:620a:468a:b0:93c:8544:6ad8 with SMTP id af79cd13be357-94421747024mr1398579085a.28.1793559481405;
        Sun, 01 Nov 2026 10:58:01 -0800 (PST)
X-Received: by 2002:a05:620a:468a:b0:93c:8544:6ad8 with SMTP id af79cd13be357-94421747024mr1398575885a.28.1793559480868;
        Sun, 01 Nov 2026 10:58:00 -0800 (PST)
Received: from ?IPV6:2a00:a040:199:85d9:400f:a731:3a5c:25b9? ([2a00:a040:199:85d9:400f:a731:3a5c:25b9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf67aa704sm205875525e9.8.2026.11.01.10.57.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 10:57:59 -0800 (PST)
Message-ID: <b8847a58-1c43-46a8-823a-4ad7a14c8f93@columbia.edu>
Date: Sun, 1 Nov 2026 20:57:56 +0200
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
Subject: Re: [PATCH v2] mm/memory-failure: fix folio refcount leak and
 min_order_for_split() locking
To: "David Hildenbrand (Arm)" <david@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
        Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
        Usama Arif <usama.arif@linux.dev>, Miaohe Lin <linmiaohe@huawei.com>,
        Naoya Horiguchi
 <nao.horiguchi@gmail.com>,
        Wei Yang <richard.weiyang@gmail.com>,
        Nico Pache <nico.pache@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Luis Chamberlain <mcgrof@kernel.org>,
        Li Youhong <liyouhong@kylinos.cn>, stable@vger.kernel.org
References: <20261030-try_to_split_thp_page-v2-1-c957c9b42eab@kernel.org>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <20261030-try_to_split_thp_page-v2-1-c957c9b42eab@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KekHOHIzRFispZyCVzoqfKyLG6HEE5sT
X-Proofpoint-ORIG-GUID: KekHOHIzRFispZyCVzoqfKyLG6HEE5sT
X-Authority-Analysis: v=2.4 cv=RsRQvymK c=1 sm=1 tr=0 ts=6ae78bba cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=Ikd4Dj_1AAAA:8 a=SRrdq9N9AAAA:8
 a=i0EeH86SAAAA:8 a=ZVJNLgniXcJRS-GVAekA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3NSBTYWx0ZWRfX90C8cJiW4++1
 fv/R4kHjVDCAxNqB5+I7qgCNvILu+0au7eSHgulximfsJIrAtMvGVkhukFuUF2IiJ0G41joXwsD
 m6ij2ZEQSrzLo+HV62z/z4/svKdMs0bmieughJmmU6Ac+z/v5PsL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3NSBTYWx0ZWRfX/EX1Ie42Sm81
 M4jKegiI1bqSYmoy6yjnNFIHwOwRZKKrw7yuVMhc70k4CxGRkK1SRKCW1zlIFi/9K7kVgmoS2k8
 1LT/i5mxWbkQiAUzEg9QZ07YkE7KGRLNPoWeDANt9oNK8ZBWDwYTauDRadXKN8YZn7wmR8ok4XX
 f36t30Sisd/rHqjrsOQmTanHL/06lt36Os/QFVI48HAc8JsqVMTgLOunz3zC+mrRQHNjWjOSUxu
 5AVdQ0Xp78nbTKMdgAec8M7bu0GfMZJJVonQSKmioQqwPqXoRXEqWWHngDg664Tss7K+4yUBrTd
 VNuYyIQbBD3mj26gi75IjreqXQIK7sCJcQtdJBWwckeAojkp2PvgnVdTdA/qmjYGFRDsIhUmzgQ
 6NYdzTHmGkOjLsH2XZLJj9rx2HLrsFqvm3Y3QYsAG/csw6TCQA/eAZE3WKmOAUm3r0vsIAY3Bms
 8dC9eRZ4+rJkitzThiA==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11953
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 suspectscore=0 lowpriorityscore=10 impostorscore=10 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010075

On 10/30/26 6:29 PM, David Hildenbrand (Arm) wrote:
> hwpoison code can end up calling min_order_for_split() without holding
> the folio lock. There isn't really something that would prevent
> concurrent folio split. Consequently folio->mapping can get set to
> NULL after checking for "!folio->mapping", and if the compiler
> reloads folio->mapping, mapping_min_folio_order() would try to
> dereference NULL.
> 
> While very unlikely to happen in practice, let's just enforce that
> min_order_for_split() is called with the folio lock held. We can
> significantly cleanup the calling hwpoison code, and just get rid
> of try_to_split_thp_page() to hold the folio lock for a bit longer.
> 
> Just work on folios now, which further cleans up the code. We just
> have to be careful about doing the page_folio() after splitting, which
> we have to do already either way. Do not change the way we split for
> now, this needs more thought and should be done separately.
> 
> Cleaning this up we fix another issue: in soft_offline_in_use_page(), we
> would currently have leaked a folio reference.
> 
> In min_order_for_split(), document and assert that we need the folio lock.
> Drop the questionable VM_BUG_ON_PAGE(!page_count(p), p) check entirely.
> 
> While updating the comment in soft_offline_in_use_page(), just drop the
> "NOTE" part that does not add any value to current code.
> 
> The folio->mapping problem was identified by Sashiko, and Li Youhong
> reported it by sending a proposal fix.
> 
> This likely does not really warrant CCing stable, but I expect little
> conflicts when doing the backport, so let's just CC stable because of
> the refcount leak.
> 
> Reported-by: Li Youhong <liyouhong@kylinos.cn>
> Closes: https://lore.kernel.org/r/20260804035828.2684059-1-dayou5941@163.com
> Fixes: 689b8986776c ("mm/memory-failure: improve large block size folio handling")
> Acked-by: Usama Arif <usama.arif@linux.dev>
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Acked-by: Miaohe Lin <linmiaohe@huawei.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

I managed to trigger a UAF via folio->mapping due to the race with truncation
that this patch fixes (KASAN output below). Soft offline is preempted inside
min_order_for_split() after it's loaded folio->mapping. The file is then
unlinked and closed, the inode is freed after an RCU grace period, and the
subsequent mapping->flags read hits the freed shmem inode.

As noted, the potential folio->mapping NULL dereference is dependent on
compiler codegen. x86 GCC and Clang only load folio->mapping once on the
versions I tested, so I couldn't trigger it.

The above UAF was very, very hard to trigger, but it's less theoretical
than the NULL deref issue, so I think the Cc: stable is justified :)

Reviewed-by: Tal Zussman <tz2294@columbia.edu>
Tested-by: Tal Zussman <tz2294@columbia.edu>

KASAN splat:

BUG: KASAN: slab-use-after-free in min_order_for_split+0x78/0x80
Read of size 8 at addr ffff888114bce3d8 by task mfsplit/230

CPU: 0 UID: 0 PID: 230 Comm: mfsplit Not tainted 7.3.0-virtme #1 PREEMPT(lazy)
Call Trace:
 <TASK>
 dump_stack_lvl+0x66/0xa0
 print_report+0xd0/0x630
 kasan_report+0xe4/0x120
 min_order_for_split+0x78/0x80
 soft_offline_page+0x900/0xc70
 soft_offline_page_store+0xa0/0x100
 kernfs_fop_write_iter+0x2f5/0x4a0
 vfs_write+0x60f/0x1100
 __x64_sys_pwrite64+0x18a/0x1f0
 do_syscall_64+0xfa/0x5e0
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
 </TASK>

Allocated by task 229:
 kmem_cache_alloc_lru_noprof+0x1e0/0x5b0
 shmem_alloc_inode+0x21/0x40
 alloc_inode+0x5f/0x1f0
 new_inode+0x18/0x180
 __shmem_get_inode+0x173/0xdf0
 shmem_mknod+0xcb/0x240
 lookup_open+0xbb7/0x1760
 path_openat+0xc8b/0x1dd0
 do_file_open+0x1d2/0x400
 do_sys_openat2+0x126/0x170
 __x64_sys_openat+0x122/0x1e0

Freed by task 231:
 kmem_cache_free+0x29c/0x610
 rcu_core+0x691/0x1de0
 handle_softirqs+0x204/0x8e0
 __irq_exit_rcu+0x153/0x1e0
 irq_exit_rcu+0xe/0x20
 sysvec_apic_timer_interrupt+0x3e/0x80

Last potentially related work creation:
 __call_rcu_common.constprop.0+0x80/0x270
 evict+0x4da/0x910
 dentry_kill+0x1f1/0xa90
 dput.part.0+0xa0/0x180
 __fput+0x42a/0xaa0
 fput_close_sync+0xe7/0x1a0
 __x64_sys_close+0x7d/0xd0

The buggy address belongs to the object at ffff888114bcdf80
 which belongs to the cache shmem_inode_cache of size 1400
The buggy address is located 1112 bytes inside of
 freed 1400-byte region [ffff888114bcdf80, ffff888114bce4f8)
