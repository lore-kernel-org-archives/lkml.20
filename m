Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870890;
	b=yFUCigszvAHI+c12lM8a9/28VcFyvbE9QBMDak++ewSXMWQwAyAv5E960EJ78wvB2SWm
	 326OeImMCdzLVAge4OzzTXBMajmmv6AtQEjlkqsXueRXzzDxqiTfFTJL06NxgLgdEQJlw
	 Ht7pLuxsvDjZvA0cxlVlUfyzRAr6k8ERI4DpmaaDZROLYah+8spJ7aBj5PkiTy91y45Ei
	 PbwBUj6bX4vpx8Icppo5umQfKxeHI3MwMTibLzGVTrniieBtW3eifyuxbutFl00k1DQH7
	 10oHW+b2jtlABj3O4zo2lZQQu/JgtbqMYburFoPCcwTPANUn3dUxwSjWiltnOf339aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870890;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IBaXENMZ5iJzgPOhruOKYZkY/jWJHWgOsTH8WaEBqtw=;
	b=MwAy/v7BvU0vW1vwWbJT87rk3WkqTzvjehPUrMAI7Khy4CMj8/DiGCzkL3+fQG2DGVya
	 MWcOpcMvH2SBXEoLymVLs5NtAaHTdjetp+o1y3Bo6ONZ4hY5Fh0BptRu1QEb2NzAmV/yX
	 A49Mh4VvbqONAZp3yL0uM01xF+ZdvETGVUd6PzmUmdID0ebTdtxCokFrUplPOLoYDHMe4
	 GTtiVnZzt3/+RXdy2x1hudnHU7DAserJjNAY/KIslj3vxeEu4MN98svwuflz8wWq+rgqD
	 3PESaweaeq1+qt7Pf1tOgB+nqdRx2b2v+eyuyTl+gEOyshcoMY/GVfjhFD3NcqVSCQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b="Qvu/LNvz";
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=pCDz93to;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D71606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26D71606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Qvu/LNvz;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=pCDz93to
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGLYu6q238458
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:14:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=IBaX
	ENMZ5iJzgPOhruOKYZkY/jWJHWgOsTH8WaEBqtw=; b=Qvu/LNvzQdlVIXStaq4d
	19eskLdatEfmi5pLGxcKnYo8l5kOsaQaX2JUwjTB0BZ8OpyfjV28Aue1w7kUDboz
	zI4ShmiWepAsmKYnQOrkRRYqoxkMwgLRQO/aZX2MJXGT3XkbowQcPPjYt9Dm6tUZ
	cbApTydUQZt6ExO1EPrsezc6g40V0InjycEB2XsxZP6V3LNBKQZ5zihIRsW1U0MM
	XKrAuVyIP/HnnuhfBpwPIZc5kWgDYbYCa/J0LjtKmbcJVHTdEMpwzFcNGF/yPVmB
	xD0K4Zs8sQEjDMSW91uOLpo5S7ih9FjJJECeBAlwp9zuK7JdKlyexuPqqCdkNOEX
	wQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j059dktue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:14:48 -0500 (EST)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5364f562140so6958601cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794870888; x=1795475688; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IBaXENMZ5iJzgPOhruOKYZkY/jWJHWgOsTH8WaEBqtw=;
        b=pCDz93to1q/C40mfWRjKHhQ/GO+oSEPp77VsZqxR1p+ozVJwR+eHIUIMiAo+ybDqte
         raOljD/8fQcb6SgkuSoE/kCB+jkI3Pt0noM5IOVFx8UKyEZ7tcdK66qd6I6kiKNUiOPr
         Ec9aMjjskXCDR5vFSgNhHFwpGfv/YxgUuN0DWFRtkei3ec7m8yj0ApCzKN3MlSpDnhwO
         1h+15WTgvNNnshmwQduNAqGoZnMPuAMtFnN2Xx/yTkVMjsigojWnBHXQZdvS4L+KMspY
         wlwTBVXM4QVTIJzWRTIKedRhrEPI1CRf94VnT/XoKvVPL/vxmqSgFdma9+Ck+t6efXtH
         v3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870888; x=1795475688;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IBaXENMZ5iJzgPOhruOKYZkY/jWJHWgOsTH8WaEBqtw=;
        b=Us37Aimyyxeh3ksr1tZ4+rZY6dnLCqfzLBvZBnY8hPEWqA3IyfLjP1HLhwjCh0AapO
         HmNInyB+VwPn+oeCravsj44Me8gd9YKomyvPwpB6k0pa4PSxH48nY/+gdKn6YZOjHKP7
         3QKqSKolzlN/oR1AyUarCGKkZD0dSNP7sTW97XLzJs0lEPEJQH3qU8+kGCcP3Vn8Dn98
         KMvz5ybZXYGL9gVmMvddTsrSpCQcSUQ0pCldn5VxCzTbUIVBxHvpqhoPMPuehGgvTVyY
         1d/UczQRaYet0bBUs9c10yuLDczBTfxhLnfGzI3QbAaQN39QPP6UfgsOmKNhM5Ic5Ur6
         TwlQ==
X-Forwarded-Encrypted: i=1; AL+hErHFhw4Z9MxdC5AqPh7PfKzqMq7HHfV/TzWWeBUJ1VCY3UWPVjW7uQq7wCAqr7m1fXlKhhZBV/y+obMEAe4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UlCamAkMc/91CbJ1bIXU7WB2YE+btvnyNM2RLhxiO2n3Qx2Jn
	EiCbDZcTuGcaaUE6Zo933bvnh8eUh6xxbDBE364NBbwrlxcUHdmFuGdH9x6j+ZvVr9hphlCvYFG
	vNgIq5Z9jJYZFQEaYOZwLUCNNfBWJdZIokJBeC3YhPiQNPc7gnlEDNlbRx52qdg==
X-Gm-Gg: AYBFou0LzgpiDACX3Oyebny/jlp2XqhKYLXO1AmvE6PKbOel2KTcIw8dt8gLVFDnUp5
	TreS5SYiIcyaiPo0Xnl0K9Tl4Zxk8tSrpTYY8ShDNTMkl+3j6mti7hons3zAvTfbuw3g7lY0EdA
	SsDSoSk49sxw2Fw4f22hlvnTsTEz7kC2Ny/sVGSz9dehQ+/8E1218HgXMAiR558253XanfukYgH
	7dgsdPf3A63uI4ey7y7mXQK8rhPOuC0KaoGfi8G+1YCYSvuhaBI07JyyfxqmTVX4ohic025Ybnu
	lQZKZmlpB1sT66EkbYh2OnKxWqZPngVPV6UD8YKRXmM3UKAJgOgu4VWAYC3yONxzDK8fMkIlxfR
	T200bg9OlqIXhvwtNB8aruxXwrsffAEUvlhcSi+aF6ncuk4Pb0A4/4r9SDVPSsBz9y1nlJaHiVs
	Ca8cRywGWrVRg6ytWBNWERTEy6
X-Received: by 2002:a05:622a:1aa8:b0:55c:216f:38b7 with SMTP id d75a77b69052e-55d494730b4mr16217961cf.35.1794870888201;
        Mon, 16 Nov 2026 15:14:48 -0800 (PST)
X-Received: by 2002:a05:622a:1aa8:b0:55c:216f:38b7 with SMTP id d75a77b69052e-55d494730b4mr16217361cf.35.1794870887543;
        Mon, 16 Nov 2026 15:14:47 -0800 (PST)
Received: from [10.207.2.125] (nat-128-59-176-174.net.columbia.edu. [128.59.176.174])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad043f2f7sm91128191cf.5.2026.11.16.15.14.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:14:47 -0800 (PST)
Message-ID: <6d884706-1e5d-45ba-ae02-60c8067c910e@columbia.edu>
Date: Mon, 16 Nov 2026 18:14:46 -0500
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
Subject: Re: [PATCH v2 9/9] mm/userfaultfd: check hugetlb end alignment in
 UFFDIO_UNREGISTER pre-scan
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
 <20261116-uffd-state-fixes-v2-9-4397a0196479@columbia.edu>
 <2837958f-5a9d-46ad-b6ff-5a922b09e81a@kernel.org>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <2837958f-5a9d-46ad-b6ff-5a922b09e81a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YuGIgW1to9bVxwRNEK1uX7dqWFL3PSof
X-Authority-Analysis: v=2.4 cv=Utf2pOwB c=1 sm=1 tr=0 ts=6afb8e69 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=KPY1cyGZ6h6m4ASiENTC8Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=DH_EvkwUbuc_xQPnRhkA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA5MiBTYWx0ZWRfX8fEhNbi2sHY5
 BeftwF1ZxsUp+2l/R2s73dmw+JaMNoyYG7PS8wClOvhCqIlJM45JuLG6f69HQXw/VJ2sQbHIs8L
 Zg7M0wRV9oFW7d4g/PNfR22rKFbyFvpXJoRSNPRyuDJ6NSt9OYlp+zxI74fsmtrilDdlhw2QSZg
 GDxl7GKZukR+zzyj0CFYfiZAL9CUcVCeFflzt045UergtgyARwzcvIVKt8Edj5NpKbMsoMH9ULj
 TDKshyrj7xDekgoJ6XwjQhXRtkiDG3MI+nUVp/T6Y1R4yFYL5RHe/inIWJFlo1fkwOEPvFRCByd
 waCjU68XYfrN6X3v9lqkx2P9fG/IsMRIP1XuWeehbebgmYDIE3Ja7qZEpQg+LLYnhnzd4bnDXgR
 l6F2oYbdLbkDmdfgu6K1cfZSbplETG7Xjf9ok0xXZ4t/fkL0hggGSIJ3zYCWuAGpzKabw31vFc/
 SxKBX79BuOiufT3dHRw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA5MiBTYWx0ZWRfX3Nn9PaZU1Ldc
 s+9aJouB2yrjSny5q137cihYenEDZQpXeZbTjLfzWCo71WseloHR+UHku4+ExL2p0OpUWwJQpDk
 A42g4aNPyV1GF34i/+R0OCoDH3tLu4INy33hBfkSOzIWkub8RbSA
X-Proofpoint-ORIG-GUID: YuGIgW1to9bVxwRNEK1uX7dqWFL3PSof
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=10 spamscore=0 adultscore=0
 clxscore=1015 impostorscore=10 suspectscore=0 lowpriorityscore=10
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160092

On 11/16/26 3:56 PM, David Hildenbrand (Arm) wrote:
> On 11/16/26 21:02, Tal Zussman wrote:
>> UFFDIO_REGISTER and UFFDIO_UNREGISTER both scan the VMAs of the range
>> before changing anything. For a hugetlb VMA, userfaultfd_register()
>> rejects a range whose start or end is not huge page aligned there.
>> However, userfaultfd_unregister() only checks the start.
>> 
>> An unaligned end only fails later, when vma_modify_flags_uffd() cannot
>> split the VMA there. At that point, userfaultfd_clear_vma() already
>> cleared the WP or RWP protection. The ioctl returns -EINVAL and the VMA
>> stays registered, but accesses to its pages are no longer reported. This
>> requires a caller passing a misaligned range.
>> 
>> To fix it, check the end of a registered VMA in the pre-scan as well.
>> The ioctl still returns -EINVAL, but no longer unregisters the VMAs
>> before the misaligned one first.
>> 
>> Fixes: cab350afcbc9 ("userfaultfd: hugetlbfs: allow registration of ranges containing huge pages")
>> Fixes: f369b07c8614 ("mm/uffd: reset write protection when unregister with wp-mode")
>> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> 
> Okay, I assume it's not a stable kernel, so we can fix this in a cleaner way.
> 

I wasn't sure about mixing fixes and cleanups, but absolutely.

>> ---
>>  mm/userfaultfd.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>> 
>> diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
>> index bf42fabb5afd..d8abc24353e1 100644
>> --- a/mm/userfaultfd.c
>> +++ b/mm/userfaultfd.c
>> @@ -3960,6 +3960,8 @@ static int userfaultfd_unregister(struct userfaultfd_ctx *ctx,
>>  	found = false;
>>  	cur = vma;
>>  	do {
>> +		const struct userfaultfd_ctx *vma_ctx = cur->vm_userfaultfd_ctx.ctx;
>> +
>>  		cond_resched();
>>  
>>  		VM_WARN_ON_ONCE(!!cur->vm_userfaultfd_ctx.ctx ^
>> @@ -3983,6 +3985,15 @@ static int userfaultfd_unregister(struct userfaultfd_ctx *ctx,
>>  		if (!vma_can_userfault(cur, cur->vm_flags, wp_async))
>>  			goto out_unlock;
>>  
>> +		/* See the check in userfaultfd_register(). */
>> +		if (vma_ctx && vma_is_hugetlb(cur) &&
> 
> I'm not sure if we really need the vma_ctx. I'd just fail this consistently if
> someone passes hugetlb VMAs, independent of if they are registered or not.
> 
>> +		    end <= cur->vm_end && end > cur->vm_start) {
>> +			const unsigned long vma_hpagesize = vma_kernel_pagesize(cur);
> 
> vma_kernel_pagesize(), yuk. :)
> 
>> +
>> +			if (!IS_ALIGNED(end, vma_hpagesize))
>> +				goto out_unlock;
>> +		}
>> +
>>  		found = true;
>>  	} for_each_vma_range(vmi, cur, end);
>>  	VM_WARN_ON_ONCE(!found);
> 
> 
> Can we clean all this up into something simple like:
> 

Yep, this is much better. I'll mention that this changes the ABI to reject
all hugetlb VMAs in the commit message.

Thanks for all the reviews!

> --- a/mm/userfaultfd.c
> +++ b/mm/userfaultfd.c
> @@ -3669,6 +3669,19 @@ static __always_inline int validate_range(struct
> mm_struct *mm,
>   	return validate_unaligned_range(mm, start, len);
>   }
> 
> +static bool vma_uffd_range_aligned(struct vm_area_struct *vma,
> +	unsigned long start, unsigned long end)
> +{
> +	unsigned long size;
> +
> +	if (!vma_is_hugetlb(vma))
> +		return true;
> +
> +	size = huge_page_size(hstate_vma(vma));
> +	return IS_ALIGNED(max(start, vma->vm_start), size) &&
> +	       IS_ALIGNED(min(end, vma->vm_end), size);
> +}
> +
>   static int userfaultfd_register(struct userfaultfd_ctx *ctx,
>   				unsigned long arg)
>   {
> @@ -3747,17 +3760,6 @@ static int userfaultfd_register(struct userfaultfd_ctx *ctx,
>   	if (!vma)
>   		goto out_unlock;
> 
> -	/*
> -	 * If the first vma contains huge pages, make sure start address
> -	 * is aligned to huge page size.
> -	 */
> -	if (vma_is_hugetlb(vma)) {
> -		unsigned long vma_hpagesize = vma_kernel_pagesize(vma);
> -
> -		if (start & (vma_hpagesize - 1))
> -			goto out_unlock;
> -	}
> -
>   	/*
>   	 * Search for not compatible vmas.
>   	 */
> @@ -3774,6 +3776,8 @@ static int userfaultfd_register(struct userfaultfd_ctx *ctx,
>   		ret = -EINVAL;
>   		if (!vma_can_userfault(cur, vm_flags, wp_async))
>   			goto out_unlock;
> +		if (!vma_uffd_range_aligned(cur, start, end))
> +			goto out_unlock;
> 
>   		/*
>   		 * RWP uses protnone as an access-tracking marker. PROT_NONE
> @@ -3797,20 +3801,6 @@ static int userfaultfd_register(struct userfaultfd_ctx *ctx,
>   		ret = -EPERM;
>   		if (unlikely(!(cur->vm_flags & VM_MAYWRITE)))
>   			goto out_unlock;
> -
> -		/*
> -		 * If this vma contains ending address, and huge pages
> -		 * check alignment.
> -		 */
> -		if (vma_is_hugetlb(cur) && end <= cur->vm_end &&
> -		    end > cur->vm_start) {
> -			unsigned long vma_hpagesize = vma_kernel_pagesize(cur);
> -
> -			ret = -EINVAL;
> -
> -			if (end & (vma_hpagesize - 1))
> -				goto out_unlock;
> -		}
>   		if ((vm_flags & VM_UFFD_WP) && !(cur->vm_flags & VM_MAYWRITE))
>   			goto out_unlock;
> 
> @@ -3920,17 +3910,6 @@ static int userfaultfd_unregister(struct userfaultfd_ctx
> *ctx,
>   	if (!vma)
>   		goto out_unlock;
> 
> -	/*
> -	 * If the first vma contains huge pages, make sure start address
> -	 * is aligned to huge page size.
> -	 */
> -	if (vma_is_hugetlb(vma)) {
> -		unsigned long vma_hpagesize = vma_kernel_pagesize(vma);
> -
> -		if (start & (vma_hpagesize - 1))
> -			goto out_unlock;
> -	}
> -
>   	/*
>   	 * Search for not compatible vmas.
>   	 */
> @@ -3959,6 +3938,8 @@ static int userfaultfd_unregister(struct userfaultfd_ctx *ctx,
>   		 */
>   		if (!vma_can_userfault(cur, cur->vm_flags, wp_async))
>   			goto out_unlock;
> +		if (!vma_uffd_range_aligned(cur, start, end))
> +			goto out_unlock;
> 
>   		found = true;
>   	} for_each_vma_range(vmi, cur, end);
> 
> -- 
> Cheers,
> 
> David
> 

