Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604871;
	b=WqE+zMddjFftVL4O3DvVGyXdcuLh4ADvik5+BjA3t9WHy+342oz23ofBgBU6IqxFcaY5
	 rJXJTuOUxlnu+SY/xEjgXzQUteKWx/T7ZYAhMqRnxkec5Yi1QbbQuK1aOuIrlC0uTVwL9
	 9Itz1T8USAJV9Q0vDaHe0qvTWrrftCQUcJpyM0qRgFHCjh65zeBW4E4Zbo0TV+HNUt3ld
	 fXN+sv/SOomOKvPpaH/jkuQQi4hF6b1JllecSRFjHO6aAdy1yP53XbsG6gZjI3pXJsBc9
	 +E8+D8IUYr8s7bCPxB+XLD/DHfI1zErww+85UKCSyBiSBeabiTSD1skd6FUT16QdG7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604871;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ruQ3lHOmeWuryZ2uUe/iR9zV6WBvZ5ex3uR31DU9w70=;
	b=GMJ4KFM5vxkt8tU+wbY1R5D0wdBrXg6GHRvU8i8OaEGL2kVtuJ0RsEwPpmRwKaCBrQX8
	 8riV3o5Ib2dZ3nrZTGuDWqN3MhdjsuUX3q09tOw9VwjBEmBA/kjNHGUG67ML+KwoZD11K
	 oofDzhxM5FFjARH/QCVCQzryRHbQC5lmnjpsVADY92dN+yrTbz85Q7lzasYtAECHAAuYv
	 bAHHMm/KrU2DxgtyU1XoQ9VY/JwSXNvkPMHsGgsr0GkUQeZG0TKldLBSdUEhJhHjIq8kI
	 UBJq/RWfOQDR03ExVSaIDCeJBYbnpSi1xQKKlOf4Zr7WF0IgLo8bdmVtK1z0G8hW4pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=cSzAUYhn;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=5pDjkxSy;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70EE606A88E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C70EE606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=cSzAUYhn;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=5pDjkxSy
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADLD4nq3150546
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:21:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=ruQ3
	lHOmeWuryZ2uUe/iR9zV6WBvZ5ex3uR31DU9w70=; b=cSzAUYhneIKURlzsloWl
	Th9bGaxgkk/kFRRqzp+w4qllkj+vhDxOlOcCOEBg189VBN5iUBP3U8SKjsnGdukh
	+En5RD33jw1ZG9DlETweMUyUOMjhr77/YVmegQ5ZOHdIXiwuwyGOUu8FaARP/gFq
	hj22JC9DPE1RDRPB5tLBei/uKJvS7y+uIMCL2fSZXegk6UkyoV52jgL5RwnSfDur
	7nLy4no1XeB3FL2UsboBghgeX+03Gau6yi8SiR9nnLX1jg6GqV87x+2s9sT1bG2F
	dGkbJkTE8C0G918xasthcTxG48a7iChehb7tqLZlktn6XgFUCdRgTcwBKfyVB+LU
	7w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hx9kb8e8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:21:03 -0500 (EST)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-55bc8181defso15101431cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794604863; x=1795209663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ruQ3lHOmeWuryZ2uUe/iR9zV6WBvZ5ex3uR31DU9w70=;
        b=5pDjkxSygDuBc7Fi79vk+bAReyA4MIFYf5Bp7j9UFF8YNQBBgWPnLRKonee6k8SmMp
         ku9eLxesmDEZCeUWfmIFdGWML7QwbT3E7i3c/q6143A9OMYmWlqDLGaGP+pOpJy+bd9G
         tFgbvezux0v3Vd9l24xi8gCFPwmDmBIuZqQhD3Us8PaKK6iy+BbSd11DXC/Gj5lWY3Il
         emAgnKIukycU2jj9JtBOB50g/oPqBZNzQ42PfICcFVOuc6ErRziRXOHu0vramQ1zyyh5
         vwtQnVbyV32ASj4hikEsR9W4natoiRD44Kf+egS3LYDpeGG/FB5Ay+Is/jpQnHZ4vk4u
         xuEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604863; x=1795209663;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ruQ3lHOmeWuryZ2uUe/iR9zV6WBvZ5ex3uR31DU9w70=;
        b=cs5PNxCjd2zwaNACr08sboVxu8un4qLXKFk3RX4bxV7cbsD6ByyJr+5DuAo0UYj5eZ
         Sbqc6lh8vFFhDd5Qk5cow2qmlu1FREXcrUNU5v9Dqvzi1UGuWCXQinsvHZkQKYkOB3ea
         jXGO72YXReu/ioYOZUJdlICtUHBgQ+eaxZOs8jQRQoLCOn1Ux5h8vKPYIFSfgl9T3pcN
         iRo3/cWg5O60zltwPApa8YHT8f67Xj8dzob86IwK+GEaUbn3OVm777y0lLTy0lUFVRfv
         dg3kzFu0ygfqu9it1FTczR/t1em9iVztiRZ6bj9f6sSgi/zpi5H6rWWHg1XY183PI83H
         hJtw==
X-Forwarded-Encrypted: i=1; AL+hErGhjeJ2AjpVRXMRmf8U+DcIQMBJZDVzXlKzcfZ62Sop+WhK2c47KZJvAWEfgVVsI3o/k6RHuln0w0DBl3I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/T3cHsqxP2dyIPdIh76rA6CGA34L8BpVYC9Nke48J4W05mxabc
	C2qJOr+oIMA3nnu0uglFi4x1futxJZ968iHw8A68jsB5d9q4/cjjL+wA+rbf7GDf8+rlzUkpuyI
	MwWCAp65WZmJcxZS9BMOUek13TAVMo5wxY7YBaGB/H3Xnj7Fo0bhgzHtooJfSGm9yP7sigg==
X-Gm-Gg: AYBFou2fC+slGGVgkjfsCMLnUK7KRFrLnOu3jgmTfb740KXywqaEsrRw4zMh92/AvVd
	nY1XyzF++Lqn21iyq9OTnuNaiU2bQmKMk9M2ifng82Owo74DlKDcWfDmIVl9tCAbUU52FB95aGZ
	t95jvrPslX5sChSn1H5q4EVN4dlF6+wtlYbDz78dJHsUEijRx8S5s+BkmUro1zddnkG8/wuJ+gT
	+PE4WU/F8+aIe8EzV9y2b6zBh1iNUPZbjZBaqPRBZm0eWYPFvntOdO7dZ1ZlswZeP3jbGISThRY
	3IVZrp2OnArlEMzwFGrivBCxM59M+aTJLJOscsGK7PB2EYBjGgsKc0fsg/Cz+7hPBIlPOkxKx7+
	SdQgEaHA37hPNyV8GCkHizvLnkBwruI13IfyhNal7kFEYMRQ0OMk4sCX+ZoRIrMsvisLrLesyhm
	sc6xRl38uOht/Ii9Qa5k09aHBX/Mo=
X-Received: by 2002:a05:622a:4c0c:b0:550:fe12:22b2 with SMTP id d75a77b69052e-55ac8e8a89dmr58388591cf.67.1794604863027;
        Fri, 13 Nov 2026 13:21:03 -0800 (PST)
X-Received: by 2002:a05:622a:4c0c:b0:550:fe12:22b2 with SMTP id d75a77b69052e-55ac8e8a89dmr58388061cf.67.1794604862426;
        Fri, 13 Nov 2026 13:21:02 -0800 (PST)
Received: from [10.207.116.169] (nat-128-59-178-153.net.columbia.edu. [128.59.178.153])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad0533d7dsm27217721cf.8.2026.11.13.13.21.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 13:21:01 -0800 (PST)
Message-ID: <1a77055d-c628-4832-becd-e2ca647b97c9@columbia.edu>
Date: Fri, 13 Nov 2026 16:21:01 -0500
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
Subject: Re: [PATCH] mm/madvise: disallow guard region installation in
 uffd-armed VMAs
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
        Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        stable@vger.kernel.org
References: <20261112-disallow-uffd-guard-install-v1-1-bcf8b1aaa72e@kernel.org>
 <0e3e876e-c3df-4660-ad89-a5f0fd7dedc8@kernel.org> <avcNcL6svEOTg_3r@gremlin>
 <0d6e29f8-54fc-427a-a979-1a8c6f4e3f06@kernel.org> <avdjMNNkOXm2khTW@gremlin>
 <f53458fd-c268-4dfe-aa99-b050f63af728@columbia.edu>
 <avd6XEHndh30hyc-@gremlin>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <avd6XEHndh30hyc-@gremlin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA4NSBTYWx0ZWRfX9wn6bymUAYa9
 r/TP7tVBjlrp2n3pPLOXoNb7eUc1XOJ+mJd7fOmOoeUW+qVUgJoMmbN15dKwFeuw1Kvw56/p0UZ
 ntjChVL0s/YD3Dn7Wya1vbpDibexpmkbo6WzodRMKM48g+DpRVEv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA4NSBTYWx0ZWRfX24tQGaRU3gGs
 UUkSMjBAcd2uZ5A49HbjL1AvuOgSIHo8ORrUav7itWCvWUkyXqPo7TrOFMlWZXY/bSTgOU9VrDb
 xoZLXjp/stb7NJmU4g/nbqnf1hj6A49GmlUcSsGEtthz21vBBnJTLjhPk/hoBMTEUWfB1nwEKnZ
 nvSfGD1QfNF7qksOkkooz0ozcB/vgkrVMRRGc8HoIefP+JuDaU2kiYHnv/fb9LNw0vSl4tMYhe1
 3QTXx2x0I6AKGoQoCipLYf6xnOPBK2iyd2BgDDhtzD3/sklSuCszU/eXfYt78hyCJD7jAWuU1cW
 yTQ2rHyBO1uAG+akfcJOsCG2YfoZhq2kjnueZil/n48Ji27Gcc1SoL3LMN24KvTVpHyrg+hKd7b
 ZKxgkyZCz3nmNDlx3v/f+VaQ0SR00z9H83FLo1jDw9ukPztWrfXdk8szc23Ud0j8DFvlgtYR+Wn
 F3RL8fUVhROSNduvTzA==
X-Proofpoint-GUID: tFC4dEUtgMH7e-BtJHRI9uFbM6Oi3W5I
X-Authority-Analysis: v=2.4 cv=FbSiV5+6 c=1 sm=1 tr=0 ts=6af77f3f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Y+j3KQtDOE8TDC6EXH/Ajw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=1OPhSWX3wqg4YRnK4OYA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: tFC4dEUtgMH7e-BtJHRI9uFbM6Oi3W5I
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11965
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=10 lowpriorityscore=10 spamscore=0 adultscore=0
 suspectscore=0 clxscore=1015 bulkscore=10 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130085

On 11/13/26 4:09 PM, Lorenzo Stoakes (ARM) wrote:
> On Fri, Nov 13, 2026 at 03:55:41PM -0500, Tal Zussman wrote:
>> On 11/13/26 2:22 PM, Lorenzo Stoakes (ARM) wrote:
>> > On Fri, Nov 13, 2026 at 08:15:34PM +0100, David Hildenbrand (Arm) wrote:
>> >> On 11/13/26 14:59, Lorenzo Stoakes (ARM) wrote:
>> >> > On Fri, Nov 13, 2026 at 12:59:00AM +0100, David Hildenbrand (Arm) wrote:
>> >> >> On 11/12/26 18:38, Lorenzo Stoakes (ARM) wrote:
>> >> >>> In order to establish guard regions, guard markers are installed in the
>> >> >>> page tables of a mapped VMA.
>> >> >>>
>> >> >>> However, problems arise when one tries to combine this with registering a
>> >> >>> VMA for userfaultfd, as such operations may themselves need to install page
>> >> >>> table markers such as uffd-wp.
>> >> >>
>> >> >> How does this interact with UFFDIO_POISON markers that can outlive even
>> >> >> userfaultfd registration?
>> >> >
>> >> > The zap clears poison markers, as is standard. It's really horrible this logic.
>> >> >
>> >> > So the code path for zap used by the guard install (via zap_vma_range()) is:
>> >> >
>> >> > zap_vma_range()
>> >> >   -> zap_vma_range_batched() with NULL zap_details
>> >> >     -> __zap_vma_range()
>> >> >       -> zap_p4d_range()
>> >> >         ...
>> >> >         -> zap_pte_range()
>> >> >           -> do_zap_pte_range()
>> >> >             -> zap_nonpresent_ptes()
>> >> >
>> >> > And zap_details is NULL.
>> >> > > In zap_non_present_ptes():
>> >> >
>> >> > 	...
>> >> > 	} else if (softleaf_is_uffd_wp_marker(entry)) {
>> >> > 		if (... !zap_drop_markers(details))
>> >> > 			return 1;
>> >> > 	} else if (softleaf_is_guard_marker(entry)) {
>> >> > 		...
>> >> > 		if (!zap_drop_markers(details))
>> >> > 			return 1;
>> >> > 	} else if (softleaf_is_hwpoison(entry) ||
>> >> > 		   softleaf_is_poison_marker(entry)) {
>> >> > 		if (!should_zap_cows(details))
>> >> > 			return 1;
>> >> > 	} ...
>> >> >
>> >> > And zap_drop_markers() checks zap_details && zap_details->flags &
>> >> > ZAP_FLAG_DROP_MARKER.
>> >>
>> >> Right, my intuition tells me to just nuke that thing by setting
>> >> ZAP_FLAG_DROP_MARKER.
>> >>
>> >> MADV_GUARD, is just like munmap() another form of "zap it all and protect it".
>> >> >>> This is especially problematic because guard region installation causes the
>> >> >>> regions to be zapped first, meaning that the removal of userfaultfd-tracked
>> >> >>> ranges will not be logged in this case.
>> >> >>
>> >> >> Again, similar to trying to uffd-wp-protect'ing a hwpoison marker (which will be
>> >> >> ignored), and then zapping that.
>> >> >>
>> >> >> Isn't guard marker installation/removal just another form of zapping?
>> >> >
>> >> > I mean users being weird could decide to use it for that rather than
>> >> > MADV_DONTNEED, but zapping is a side effect really.
>> >> >
>> >> > Really the idea is that you might have users who, for whatever reason,
>> >> > faulted in some range, and now want to make that a guard range, so for
>> >> > convenience we zap it for them :)
>> >>
>> >> I think not just convenience. There was this problem with faultaround / THP
>> >> placement IIRC ...
>> >>
>> >> I'd just zap everything that's there. That's literally what the user asked for.
>> >>
>> >> >
>> >> >>
>> >> >> So to me this all sounds like "if user space does something stupid, it's user
>> >> >> space's fault".
>> >> >
>> >> > Unfortunately, as per Tal's series, there's more to it than that (linked in
>> >> > Closes: tags).
>> >> >
>> >> > You can get an infinite syscall restart (ugh) if you do this on a shmem
>> >> > range (Tal's 9/12) so it's a kernel bug that _has_ to be fixed.
>> >> >
>> >> > The other bits are just about a user losing track of uffd stuff if they
>> >> > guard/unguard, as you say.
>> >> >
>> >> > But every other zap code path does the uffd remove event stuff, so this is
>> >> > still an exception.
>> >> >
>> >> > If you support uffd, you have to add a whole bunch of horrifying, awful,
>> >> > terrible open-coded uffd crap, e.g. the userfaultfd_remove() etc. And you
>> >> > have to drop the bloody lock and reacquire it too and make sure all that
>> >> > works correctly (...!)
>> >> >
>> >> > Anyway there's basically 3 options here:
>> >> >
>> >> > 1. do something like what Tal's series does - add a TON of complexity for a
>> >> >    use case that nobody uses to get behaviour on something nobody sane
>> >> >    should care about (i.e. uffd/guard/unguard/expect uffd correctness).
>> >> >
>> >> > 2. Zap with ZAP_FLAG_DROP_MARKER, and silently lose uffd-wp state but
>> >> >   'support' uffd. It does fix the 9/12 bug but then subtly breaks uffd.
>> >>
>> >> Right, that's what I would do.
>> >>
>> >> MADV_GUARD_INSTALL zaps everything.
>> >>
>> >> It already zaps swap entries, migration entries, hwpoison entries ... so just
>> >> zap everything.
>> >>
>> >> [...]
>> >>
>> >> >
>> >> > If you're really concerned though, we could go with option 2, which will
>> >> > just make UFFD behave differently for guard regions.
>> >> >
>> >>
>> >> Not really concerned, it's just the most consistent one for me. Zap everything.
>> >> The user asks for it, like he would ask with munmap().
>> >>
>> >> > (I regret, obviously, ever allowing this for uffd ranges. And we _all_
>> >> >  regret that uffd was _ever_ allowed to be merged in this state...)
>> >> Yeah ...
>> >
>> > Ack will send a v2 doing that then :)
>> >
>> This sounds better to me. My concern in [1] with completely disabling this
>> was that it could break a uffd manager that doesn't control the task it
>> manages (e.g. CRIU lazy restore registering the memory of a task whose libc
>> uses guard regions), but this should avoid that.
> 
> But they were completely broken already? So we're 'breaking' an already broken
> user? :)
> 
> It's moot, but still!
> 

Only WP and RWP were completely broken! MISSING registration, which is what
CRIU uses, worked correctly apart from the lack of event notification, which
only matters if the manager still has contents for the page (which, again,
is unlikely for these pages). But yes, this is moot now!

