Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439323;
	b=lPgz7D0dgD6divpIhEtYfY3cZCMAyzTvOQJYaM6RN41mliRVzgJKZlsO8vEk7yEgbsGJ
	 Hb6TJENPLjk4l65PT8XX8l8FvnFLPoUTlWRbtW/unMPbal/1987knSOMcekzPKNVAzjf4
	 js58oHDRpBwxX6ZEZ9j/8MIEZoY8596nDPY3eAuoheMAu/jtaaw5lvmN1o5rSMJK3lx/R
	 q/tGZVPFGnLyrBxXKJN90k2c8FAVlzBz0E//2hx9AFVqVi3QA6iIBE14GwjRjOmk6z+RW
	 ewpkEMvK8Eh367PjmpchLBSjjZWeLdSYGNpHh1lmcAheTBrEPFP2fIusqJFG7xNSq+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439323;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3RDZDLRTYQ+pehNWhTTSvj1YCHvxKOaaZEnb+1PpFOI=;
	b=IRV4l6x7+4YKKbp3DM/k360gWKWA9yPu3f97lJEClTAqb8nTsCbzE98B/jk08TPxAND9
	 a2NTY97erinsyIGn1eHaPp3taeoEfkAuECgII+ORsKLUOu9f6ZL925SAwM6E23q168UAh
	 BQBYup2Ah2VndWVPUUnm98AxAaxnRTrZQGgJO5n8SZdtFAJM/WWqKE3/6mwO7A3gLJu7L
	 aqCiKGOPG2lEh5Ql2oNP2fWGaj6wa/FhBR/LYGrxln2Qm9cb64ZaGCWB29iH0OjutcG0X
	 EWJvJWNTw/KVD6w1s4oqV7Z0Q24OPDSZ+9WLJ3wivwQ59n71vDPcrwV1nQXz8LuTXuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=qyRHIxrd;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=SOvVPQ8k;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B22606A336
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37B22606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=qyRHIxrd;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=SOvVPQ8k
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABMBrCQ2546016
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:22:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=3RDZ
	DLRTYQ+pehNWhTTSvj1YCHvxKOaaZEnb+1PpFOI=; b=qyRHIxrdjV9xuKPMPbEN
	Q8jUh1svYxpXYQNwH52ReU/BhOJWekTdwXBixTj0mWGaMR2DlDzVgswqXjE9m+7Q
	NAp6z/bl1lbHdMnl6UHxJAjpVxQhbr+wyiIA1WEXfVwbGh7YPl2f4UcDlKxR/vC3
	2/W049z57Qz+vl2Y6qPrOqEgceLy3T2vDXSjZN6VdW9RuK9mVz/6++CZV7JlNdh2
	1oNf4n/NWezx68jbnYmcesANpzJLOjiYZJHyZ8sufMcPGoPWYlm5huXbbZeq3G+O
	PIr47hCB8sieDQeEShcp6BsWiXLCyk79iyeENSijxD8VvgkIaeq+s1u7bku6iNqe
	7A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hvvaqjy55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:22:01 -0500 (EST)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91ec6cd898eso70445876d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794439321; x=1795044121; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3RDZDLRTYQ+pehNWhTTSvj1YCHvxKOaaZEnb+1PpFOI=;
        b=SOvVPQ8kRjBWJNJd4287bI2gUKRZlp2V1o9FmxIvHbx4b97n95ETcRt0rxlUSSxe0e
         FPYGvK6P8LVjuCOJS7BEpfeXti6taniWJQ7PUHK0+yc1aXaRvTheR3xZR81mO3ArhGul
         K33ReC4PTi+pL7aZT706ZksFA5x5mMYjII43udip8DBtidoayb2owbHn/xS/zTnj7l9P
         RATlDk/ICOmYBLHGsLWHmBFw1yW2SVohS8/rzj4jtRJfgI/rDBk5sJDmtQMKDijGlOEa
         HNwEpQxaWzdfCShzSe0TmvOekW6MEdFFfM7FP5cCxsIiJjX6HSeW2Q1brMmPfNQW3gbv
         gDMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794439321; x=1795044121;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3RDZDLRTYQ+pehNWhTTSvj1YCHvxKOaaZEnb+1PpFOI=;
        b=rVUIGYgvm3ua+Qqw2rc6fS0ZjIJ89TP4jw++2QItsMPYLS5Dug6j+vf5ap3OiYprv4
         hNP4qHbjEFA2e3bPEodmGywASshIOp4OgYAOQEvGnWCkLCbYqVLY0AXA7Zy7H5gJoeOu
         0LSgMseHRBlEi3yjidX6pL0KsBZq6XNKDdU8KAj2LoB93bfTEe9jEHw9HP+eQaKrI8WX
         wzZlTYYUeIhPFtlWAfnVCnFIU7GFXlXeIKAzWikYqhLtoKezwQexPvbyr1w8IzS2TUK8
         72xl3XiApzTM4rNZMJrOB/FdDZNHkjE3YdtIRxLqvVqJjhR3mVIonNT3O8CBxiKndzw3
         zDmg==
X-Forwarded-Encrypted: i=1; AL+hErGZjtqUrJkphu1vhpDahtsjiopTHL/Eghw2n5ubS+ZdYidIz0Q9wrdEQcXMd0MFUgx7GV5QdsLgBBj9CbQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+8RxkPeR3hv4XZgOBmHOqgzQ7bD7Zd5ZP+P4E3/nwPL/dOy/e
	yYc30eXqAtmPTLZvpzaXuAVz03l5eFOZmbDczPaUf7kvsIYUow7UdkDXwniLhbQeOqIalDfDIx2
	19MM6EaGK4MTFbEPBpj5W8h0fcifpdg8A8PYnqR87TZuNmjDYo+Jdm7Z1G5we3n/KYWsZj0R+
X-Gm-Gg: AYBFou1GYT+f02bAx7hxQqUkfzWp5cm+UqfHSIfHYb41jHDsPhchvYrGEse1jYUp5oy
	ovGt8618OclMPw4K93jmV7Ib/lus9rUBf3NJkNGsc/MScB+5FQUQZ6sLidGSmY34c2D0cLC1btm
	nilZwMJRA+npWONrxqwMGlPvXTNJkvsVfHO3hVzXPpYxCxRrBc13LNRGPlYeqf2MLDi1m+Q8rFd
	yWU2fAk+JRfQxw5vaFzKc/aeRyRavobYiRzqB36gvqkKBYoOAxOKFvBy8q31IjwUfUJll6uZgfm
	RtU2Jv0qGV9SIDjq741kaBLSXoalZEybWN9FgVI75u80sd/udv2apyk7yiQ/fqxK5inXFy4DviO
	zX6Jb6ZnBTlk0MWLcgjUUPfGQY0efMZEvIBPxplhRJdyB6sD4LXYugQWZvqTsubcSEFl3fPpxIb
	w2pVClgcUgqeX72dDCKsIKBczi7bmEYjuqjpNy5NKkgjOrOHzCJxcEdSNO2cU2K1Y9y1btbwYi+
	gC6NsLz4P8AXVj72BxH8/huwacZFuRGgWduuBr6r6jTwR2M0UJpXr3DmXpGuJpVjw==
X-Received: by 2002:a05:622a:2510:b0:535:a5fb:67f6 with SMTP id d75a77b69052e-556c1b5dfcamr59716951cf.66.1794439321359;
        Wed, 11 Nov 2026 15:22:01 -0800 (PST)
X-Received: by 2002:a05:622a:2510:b0:535:a5fb:67f6 with SMTP id d75a77b69052e-556c1b5dfcamr59716571cf.66.1794439320866;
        Wed, 11 Nov 2026 15:22:00 -0800 (PST)
Received: from [10.206.190.80] ([129.236.225.101])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef04d8d93sm57942026d6.17.2026.11.11.15.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 15:22:00 -0800 (PST)
Message-ID: <a87cbd92-0e07-4f84-9a6f-8db0b1778fcf@columbia.edu>
Date: Wed, 11 Nov 2026 18:21:59 -0500
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
Subject: Re: [PATCH v3] mm/memory-failure: set PG_hwpoison of a non-hugetlb
 page under hugetlb_lock
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: David Hildenbrand <david@kernel.org>,
        Naoya Horiguchi <nao.horiguchi@gmail.com>,
        Kiryl Shutsemau <kas@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, tz2294@columbia.edu,
        stable@vger.kernel.org, Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        Andrew Morton <akpm@linux-foundation.org>
References: <20261106-hwpoison-hugetlb-ro-v3-1-c11186963647@columbia.edu>
 <42a60f57-5323-f981-8ef3-2e5d67623902@huawei.com>
Content-Language: en-US
From: Mani Tofigh <mt4022@columbia.edu>
In-Reply-To: <42a60f57-5323-f981-8ef3-2e5d67623902@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FraQbGrq c=1 sm=1 tr=0 ts=6af4f89a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=F4ifJYvLC05xlQRgS51V4A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22
 a=VwQbUJbxAAAA:8 a=968KyxNXAAAA:8 a=oSZCGD4z_m2zKWX6BwUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA5MyBTYWx0ZWRfX9V+XOdIVq0CK
 o2NqDwzU1kcKiXhgBYhwYSVDWSmjOwPpdURN0tv0psfxiuZgtug5NvJvqZPy8QZyEFAnsGP36st
 TwK4MGTj8C2F+gqY97AVdxsdduJI8dPVygVrzKXAAQWtgkAt2kbMWGdOMx4oF9I9hqkYi/EB9/7
 ZEcrEj5IgLeHlahRohHafNGqygDCfUUhxcdphJv2wcNm04Y0T//R8akHN/gDIFoc81szFlKcujM
 WXwXYFIy/sKpwGAjJS4P3tcVN32+SeYEgqwTQ8nUN8At/BCDh1MWAIRq7ao+ryU726NpXiJNJj+
 Dgc6+3MoFusaW+dOmOJUysxxB7UBqJUq3E4Gz+mQ3sjNOR+zFQ0PqQY0BBawyL6hin/mrb6fy4r
 0RPz5s93l7UlmZ1WsmcSBXH+GsvQsmufzU3ocUfV9JTmTL9FQBf8Fa8fzEF4xqv2PnKYhil09UT
 0bSQXbCMkL355VI6m7Q==
X-Proofpoint-ORIG-GUID: nfRTKE_hgidvHTsL14NhYBhoZE1lANm9
X-Proofpoint-GUID: nfRTKE_hgidvHTsL14NhYBhoZE1lANm9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA5MyBTYWx0ZWRfX9zhHCeNalNR1
 Za0U0yUlK3+SIoF5ygXZahjMefVhK6Flqr5DtKED/C5z4X3Qp+mmQcIrGVbactRMMSOGTNbVBtF
 ggaqYfgBR47/grfgBgaQcd+IO+Bvo8HvDDPKV53s+LfPgoj4sEdQ
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11963
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=10 bulkscore=10
 clxscore=1015 priorityscore=1501 impostorscore=10 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110093

On 11/9/26 2:23 AM, Miaohe Lin wrote:
> I have no idea why the error on P itself is ignored, could you explain that?


My bad, I should have explained that.  By then P is part of a hugetlb
folio that's still free or being set up, so get_hwpoison_page() can't
take it and we just end with "Ignored".  Nothing marks the folio, so
the bad page goes back to the pool and gets handed out later.

If the folio is already in use it's even worse... it gets split as a
THP and hangs.  (That's a different race though, I'll send a separate 
fix for that soon.)
> I think we should clear the PageHWPoison flag we just set since the retry path expects
> we have cleared the PageHWPoison flag in the first round.


Agreed, as long as the page still isn't hugetlb.  Once it is, HVO may
have remapped its struct page, so the clear either hits the shared tail
page (read-only on e.g. 6.6) or gets lost while HVO copies the first
vmemmap page.

So how about clearing it under hugetlb_lock only if the page still isn't
hugetlb, and otherwise skipping the retry like the second round does?

> I suspect this won’t solve the problem. The below race might still exist:
> 
>    Task A (memory_failure)              Task B (nr_hugepages write)
>    get_huge_page_for_hwpoison()         alloc_fresh_hugetlb_folio()
>      /* P not hugetlb */                  /* P becomes a tail page */
>    clear_non_hugetlb_hwpoison
>    goto retry
>    get_huge_page_for_hwpoison()
>      /* P not hugetlb */
> 					 __folio_set_hugetlb
>                                           hugetlb_vmemmap_optimize_folio()
>                                             /* P's struct page now in
>                                                the shared tail page */
>    TestSetPageHWPoison(P)


I think that one's covered.  With the patch, the "not hugetlb" check and
TestSetPageHWPoison() are under the same hugetlb_lock, and
__folio_set_hugetlb() moves under hugetlb_lock too, before HVO.  So A
either sees P as hugetlb, or the flag lands in P's OWN struct page
before HVO gets to it.

Also, with Muchun's vmemmap_remap_rwsem [1] HVO waits for
get_huge_page_for_hwpoison() anyway, so if his series goes in first the
hugetlb.c part can go.

[1] 
https://lore.kernel.org/all/20261111093747.50048-2-songmuchun@bytedance.com/

Mani

