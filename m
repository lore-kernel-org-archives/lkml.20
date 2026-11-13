Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794609299;
	b=v6pEjfmh6Je0VmbRFLngkDKf0AA8HmDcNe3pyr/yAFCk40/1jBYyi8auWen4Fz3pUE/z
	 HKLtIv4B6CG71P9sqzh6x1qiymOQg1FY9R11PnSdScGmFMTvG1SujZ4wGHLe7nBLKT+a3
	 kNFhUrzyroW4CCViUapBqS66YlRybuvGBemKwL9yQfaIdNXKnX3/meUbo6t5EwU0YAnEH
	 44fDd+q3pGVMGAo8oq8tfiK7+S0SnRbYszhgThwAPyca8jU8noswty1ld3clcXpwNIGHj
	 ayPbqg5XQ9CdhVvmXE0qmEEB+r+KldB5IoXz1CSNakyyYGV1gQUwY2Fyv5i33BPSpGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794609299;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UWyNG9BpS7ZOyZVHydfM4D6T04LeEiI1hXz+sHf1bRw=;
	b=kXZ0riTP6STmIGX8IpYKnpfUokuf4srTiHkNzZD3z5JjnlpepQ5Rfh9m9sjxTWIqddv6
	 BUd2SnOLZQcRp62KodpIGu6/U6LP+vp5p9LlMTuGVPKwNrS37DOO6XaOSqVbWHWDZq2Gx
	 XErfpOtM5kl7XuborZyXh5p8DPmDnnZiCgLMz1EhNfMS0JwCcpn/lBOUHOROLW1TYo9BO
	 6aYkOlvA4Xtwppu5ssw3hvpuZlODqLUAhz09JeBNBfBN+1/mGGtakpU2cJXa1Ryqzy5ZB
	 wcREFJCyS1Gbg6z/ukLhB47WTIJDQfhR2GpbruKC8mIV0MsowBaoOa9zXbfwstHKNTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=hcszHs+g;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=QFCc+BlW;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BCB606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:34:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32BCB606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=hcszHs+g;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=QFCc+BlW
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADLrabs3417983
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:34:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=UWyN
	G9BpS7ZOyZVHydfM4D6T04LeEiI1hXz+sHf1bRw=; b=hcszHs+gigNCkk0L8+7v
	gvUdMe6A51CgBWWQSipAmCg1eLbkuEGQdH6VT7puFpqbGPALEWWVgCXjqMX+ftCz
	iDjAAwl/HIb7faTMRqx/jAbK2Y64re3ooOApezscoaiOn4SGDT9Gl4AtN8nazWab
	iKzk+sR4LKDNMKUherMro39r0OTUesQ6YPO3/8HvRySQG1T19C+2RW0dOrgRAwQ4
	BWAPVqORd3MFmshavP10nXp/lab/dYqPAqLHmbdYb4poBp9m6V9af3aOsQNZeDO/
	2uF+uo3RH/5frtrUH/tkWFiMa8oS2qzo82e+tpjMboCKdqqirgpbN4MMRBu9NKi7
	Xg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hx8sj9jdx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:34:53 -0500 (EST)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55bf3e01e65so18699671cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794609293; x=1795214093; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UWyNG9BpS7ZOyZVHydfM4D6T04LeEiI1hXz+sHf1bRw=;
        b=QFCc+BlWzSf8Gu4XQhpuah0PHcb/DiYwQLbyX1oxV0wf1roIQunDciWVgybGkF+2mJ
         kV3yeSWw3ka+D61erZhfs5nbdpS5fw50TdfAWCyrwHg+V0KgBwkdDEd2GXk2vQ3+6dDi
         XBVovAmdVfG90OhuNH4xjny+O6Z8AZY2BqlWPh03C2MpEaWyhSzUy45Ejb/LXwP6L4hX
         T7b0f1msd7bs7TJJMbOJj1t6MG7sBzU1rHLFW0sjo057YgCHMIQz2Ws4BV7hRtUGJA1H
         Y9GrAMlAhjPZtbzoI/GlAuGyKA+/E0YRbRBEFq/nANLyKtN4J5Tm/03fIA1npFVxkMfn
         aepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794609293; x=1795214093;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UWyNG9BpS7ZOyZVHydfM4D6T04LeEiI1hXz+sHf1bRw=;
        b=UyNGRjYXZU9FA+Nt445mA2s8DrCrQaAUvH/d6M9FE3t4G8n6HP10OpCnppvwzHlcSL
         yUfxm+Rf8I5p+un+mb53K0yseXIkY/LfKUVtgOwF6jCDnDEsng1NC/A+btvoLJZRKYLd
         JmQzqj2ea0ZDe6BVFHgHywVX8aBT4RrnE4NQcdm6HGBMWEfZYIwp4KZPHhsGtz879iQ8
         fynIg1zjSNqJ8jdC1PgvLK0JlQ1pZ1kjznsaDTNN7T+XMMmdsT89UuvIjUAyoZ9Ta/SW
         M7vmcfgaOmWa7tZ5PbLc+W3VG7QrdH5OTxYWW5M6t2tRawD7pzb4e1ESEJPF5R7H/ut3
         dQGg==
X-Forwarded-Encrypted: i=1; AL+hErHhhxdBSKZH17N6TWSnfVAmLkJooC3kmFPQR0ZOakeGdOKZuS4CAAzx/6h9vMJOyLs3Ni4pEFF+pUQ+mn8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cK8WvMUzqcq6unDshbFU+b2qAi7ZalmXHEmPyTN3aEZVWRB5a
	8vZnMNLFxlf6GfzZ7N+eESqWpb5mWzRUcWyhnmxFHIyif0zaZi2EyXGoRGWp07qGYHKu8Ju0i+j
	9O19dVyGkQleIKhUPhvSU0Lu1k9hBXBqmPTP4nmGllzsmfEHIjYiW7kWCQ1+2Gg==
X-Gm-Gg: AYBFou3eKcEyqbd6S8KS9bhiWLmcXZvbt+PT8RTxIGlC5vX7GzLdJrCkkhsLIToaMYM
	p8PNcr+B5vq4lOVmT+ObFu55rmuVW87pl3AzgVF2mG/S9N3wXnZkrhIOEx2LxH+TuZKLkjn9AZk
	qY6bFztVIhWt2h1unYfw6IfTJ+EF9cTK/iZTET7KDiKqmqg3jowwiqD/782dYwu9EHXjMUJfL9r
	mRgfRYwL4baXGLp5rdud6/zH+cTok2aoHdmoputbT6iPIvLtIIbPLzHaQAzPeuuqrg6EJTGAYpl
	yx31l5m6G75xSME+HR/+YQSRi7FqACXqBHzKtWxUCOKJhKhXzmdF62xgDNgtFC2RjRJMQd9cFgv
	uLo/tV7DXmQcLrBlRABc8/4V+LXhyPoNL6GIjmFBkxg6v+Qll4KBuXG3EMM0lx6lI1NLuW46VC+
	/CDYP+25nayVLOaguoLTPJEr6dmHo=
X-Received: by 2002:a05:622a:1cca:b0:536:620e:90f7 with SMTP id d75a77b69052e-55ac7b55b72mr63814851cf.39.1794609293328;
        Fri, 13 Nov 2026 14:34:53 -0800 (PST)
X-Received: by 2002:a05:622a:1cca:b0:536:620e:90f7 with SMTP id d75a77b69052e-55ac7b55b72mr63814311cf.39.1794609292887;
        Fri, 13 Nov 2026 14:34:52 -0800 (PST)
Received: from [10.207.116.169] (nat-128-59-178-153.net.columbia.edu. [128.59.178.153])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad1005027sm28221941cf.21.2026.11.13.14.34.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 14:34:52 -0800 (PST)
Message-ID: <2e812a10-e937-40f2-b250-74ccee5f143e@columbia.edu>
Date: Fri, 13 Nov 2026 17:34:51 -0500
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
Subject: Re: [PATCH 12/12] mm/userfaultfd: check hugetlb end alignment in
 UFFDIO_UNREGISTER pre-scan
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport
 <rppt@kernel.org>, Peter Xu <peterx@redhat.com>,
        James Houghton <jthoughton@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Balbir Singh <balbirs@nvidia.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
        Pedro Falcato <pfalcato@suse.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
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
        Kiryl Shutsemau <kas@kernel.org>, Chris Down <chris@chrisdown.name>,
        Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>,
        Michal Hocko <mhocko@suse.com>, Mike Kravetz <mike.kravetz@oracle.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org
References: <20261111-uffd-state-fixes-v1-0-00713d368976@columbia.edu>
 <20261111-uffd-state-fixes-v1-12-00713d368976@columbia.edu>
 <avYVPp7fHNg8WSUB@gremlin>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <avYVPp7fHNg8WSUB@gremlin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Y/JtIReN c=1 sm=1 tr=0 ts=6af7908d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Y+j3KQtDOE8TDC6EXH/Ajw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=kZ0dEtpUmc4MoBsJRcYA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA4OSBTYWx0ZWRfXxbiUqOgZ0NBI
 x7Jxg2UtNGooCeYsiBS2P8GkVyTUfzT0MnW+lCcHse3ZIjx0wl2mttucctHCD9P+TCyBYMKA//E
 kg1GNnotRQ6q1PDwF23r67Fv689M9pviCChiRKtKNqxAC5jJpi7CdsyEszBHQTlGDnjh6SJTHHC
 Q7QIETw4f8yXzRVsAy0tR01jwIq7hmxUPQhiq6HE5dK6PwEB59vRm15YFtR4kWxBkCJ5GSLdOOX
 khPkW7EIAEoOK5hL0B/HCcAfkCAhqNN6fAJOq5033nFt6DGeRlHYKusD6FpqrLscLG5NcLYWehX
 N61JAqb5wMecnXPuOC/hSn+poh7CqoVzVciCY/StltTYbGhWeISEm71/xsS2kzfvoo29aYZI4Hh
 sVw1T1nOJM+3aHKyArJ9Eql+4xdrWlaZWxrOYtwRPuQoC4OR6bSPqFBMPIMWqA67/irW1OeEo5E
 Qftu/fz8K90d2ngpJYQ==
X-Proofpoint-GUID: hXyd8SvjmTxCIYqQcUVj0iENx734s4Qr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA4OSBTYWx0ZWRfX6QSVgX16EB9Z
 5CCUVcZ6SBJRgUvRjId+k37A54qYePDQvWNn5c0lkWLgv2ukReNoteLErwy99pvqbM9G/v00VPV
 EzRuBCCZWQsS6IBBso7c/7cGxe30XDThGtEbrOZ/aLD4Hmz+1ksZ
X-Proofpoint-ORIG-GUID: hXyd8SvjmTxCIYqQcUVj0iENx734s4Qr
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11965
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 impostorscore=10 malwarescore=0 spamscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130089

On 11/12/26 2:52 PM, Lorenzo Stoakes (ARM) wrote:
> 
> hugetlb vs userfaultfd is a bit like the alien vs. predator of worst mm features
> of all time (TM)
> 

Alien vs. Predator had a sequel... let's see what the mm version of
that will be :)

> On Wed, Nov 11, 2026 at 12:55:20PM -0500, Tal Zussman wrote:
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
>> ---
>>  mm/userfaultfd.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
>> index bf42fabb5afd..c0076c8b4e9d 100644
>> --- a/mm/userfaultfd.c
>> +++ b/mm/userfaultfd.c
>> @@ -3983,6 +3983,18 @@ static int userfaultfd_unregister(struct userfaultfd_ctx *ctx,
>>  		if (!vma_can_userfault(cur, cur->vm_flags, wp_async))
>>  			goto out_unlock;
>>
>> +		/*
>> +		 * A range ending inside a registered hugetlb vma must end
>> +		 * huge page aligned, as in userfaultfd_register().
>> +		 */
> 
> Hmm I think this is more or less saying what the code is doing :) so I think
> unnecessary. Maybe worth using the words 'cursed' and 'eldrich' here to describe
> what's going on? Or possibly just e.g.:
> 
> 	/* See check in userfaultfd_register(). */
> 

Will cut it down.

>> +		if (cur->vm_userfaultfd_ctx.ctx && vma_is_hugetlb(cur) &&
> 
> This first check is pretty horrid to spell out loud, maybe do something like:
> 
> 	do {
> 		const struct userfaultfd_ctx *vma_ctx = cur->vm_userfaultfd_ctx.ctx;
> 		...
> 		if (vma_ctx && vma_is_hugetlb(cur) && end <= cur->vm_end &&
> 		    end > cur->vm_start) {
> 		    ...
> 		}
> 
>> +		    end <= cur->vm_end && end > cur->vm_start) {
>> +			unsigned long vma_hpagesize = vma_kernel_pagesize(cur);
> 
> Could be const?
> 
> Also is vma_kernel_pagesize() right? If the VMA is hugetlb, then that'll end up
> as hugetlb_vm_op_pagesize() which is huge_page_size(hstate_vma()), but it seems
> userfaultfd is full of this crap and yeah ok. Fine :)
> 
>> +
>> +			if (end & (vma_hpagesize - 1))
> 
> Could do:
> 			if (!IS_ALIGNED(end, vma_hpagesize))
> 
> Instead?
> 
> 

I just took this chunk straight from userfaultfd_register() and added the
ctx check, but I can clean this up while here. userfaultfd_register()
probably deserves a follow-up too.

>> +				goto out_unlock;
>> +		}
>> +
>>  		found = true;
>>  	} for_each_vma_range(vmi, cur, end);
>>  	VM_WARN_ON_ONCE(!found);
>>
>> --
>> 2.39.5
>>
> 
> --
> Cheers, Lorenzo
> 

