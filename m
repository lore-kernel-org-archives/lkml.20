Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466EB79DA
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788976051; cv=none; b=TabEkoMkdL8tiDRfWRoMbG7BuYnpIZRVwwpRs3uMDNY5LT3m2Pe3Ti3uX9/FE0ZMBbNv+jpSEOxouQByIiX8KvbNGa5arKs8cZwW9WN/x5+asvyG5Fb45nkPErRURHa2QHnEmUAW5/qs4d/LEL1RXEPMsRepifpjn/nlRkrudUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788976051; c=relaxed/simple;
	bh=aNeadNdo0d5nw4r4L4NGH1XMQe31Iiv2lhn6qcQq/gg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gxx4SwkZv8+mum9E2s0nbqTeUSmJvRUgaKKTKEUKUhJG1geEH3XGPQKf/ag9AVRjb4nGP2trOXeVSP1zLBSdEFLhoYRN1QZWAdZ+8xHWHVExXi5x/29HeNmiGyZhpNJd20oSC6tqcFB3NBakY8YtGJ/OBMiFsCKk2OUMdYXxhG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=DjRQeO6h; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=M8LDq98m; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="DjRQeO6h";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="M8LDq98m"
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689HS8kr298850
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 13:47:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=aPEy
	uOHa2Xf8hImQXcpukM+8uHb3YA7v7XMeWMx3v/U=; b=DjRQeO6hhGQ6ZYjAObJ5
	/57qcPKnOwj1fymOVEV+nrbxT9iWnT5Bdyg31cdt6boDVmYsyuhwvfKfxvkKfoTD
	Ll4UPjKBfzaaxj0H3M04AdKlciGt0q9P//CcKBoFBtJkdycJZtaE1uqSgMoUW3as
	YCftzjHUlpEKNZyxh7TGR5BLLGwZ4+wGYmqBHBIBbfT8aMwdz2j2KOO6x8aDoZYk
	Gp3amBJ0NYy0AO6OHdFKAKfJd07JJGvH/QUDn79JHP9mL2Fo7UzyARY3hAHRQbMG
	/UXL5xzBCj9b7xfRivTDlni7o0R7ixrTI23YkRlAsEWpzfQb9N54FJxNnWE5tB8N
	BA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gk4fh47sa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:47:29 -0400 (EDT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90ce21f2cc9so145266146d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 10:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788976048; x=1789580848; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aPEyuOHa2Xf8hImQXcpukM+8uHb3YA7v7XMeWMx3v/U=;
        b=M8LDq98mx9MUMXPFdirfU7sFFXYyAMg57FA+/FdpiEFAfYwAxnPtetZLIA7GZdTY/V
         35aGo7pWNbJ3gGr0g0rPAD0nIBkNyDQgcdWTFb6hfwJjZlfJQBreh4bm4ANbRCcEW+mY
         CjMkWGytBcQiR4hcGvTIvHhtrlyeBhWiIgMdvD7aiX//Mxql0WwEld0z/OiPX0Yvm6BP
         d3xlj2B8HlLHjxnjHGDNLF1TPX/k6w/UYQhrLFSEdcwuW/Ts3ACOwRyB/qXivfArUXx3
         cWsZ2BBmVlmR0Zdaxk5QnBV5hMwuSNYjU5/4YLcOI1bx+Zir4DbHWsR6Sm3u1Rgj0vK1
         YF2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788976048; x=1789580848;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aPEyuOHa2Xf8hImQXcpukM+8uHb3YA7v7XMeWMx3v/U=;
        b=KYvN2jESQxB21h7Cq1XPotqDZdj/uz4SvCOpyg0+xK4JeaFqHoAZtLc+oF9NRKyNvg
         FLNF9oBHePxpUNo5dHU/42g4YY6hkpkZJfPOlwt1Ps3fR7hhgD15wc6NcdDwnNI6eYO0
         JSvg6MiUqfu6jTcbMejfzO0g2kXzmQzEq40U10uapSI2iBt9JGmoR6pvfdq6WEFcF+F7
         TSj2ImxqiWYYUIE4smt3YJiFJWDFmvC2+f7D7Vv1+NgX9couFskRxCZdY2hUb+Xj0Ab2
         FzxE4kRlC8sl+LgO0/PG+if7kNUCNcu05HLN/ZTSVlkxxLN/iMkumhzyj99WFGJNTWwW
         DUtA==
X-Forwarded-Encrypted: i=1; AKwUvBy5dBsZZPVa//62f3eXFIY15RViaJBluqzwK69Q8WWj6afiY5GQd5GkFeJKU1PbuL6792ppuFMwiNajqio=@vger.kernel.org
X-Gm-Message-State: AFuF++kB7wXfLkqoRBGiLTOOfg5Fh6qT1BaLW0aHpFyJhuf+EPV7cwvr
	FEkdI4SoKoe4PuSCMsCzbWMZgIJlJUP97i0ueS32YPndR+GRZxhPIx/ysIeT9b/CyHP2ALSVLTR
	k5Dwd01CxolTqOA9Q0iDgFD6YlzK/BUaPa5CgK57oEvhUK2qhb5RP5HmgbRA/5A==
X-Gm-Gg: AYBFou0awGZOp8nyhQTvq5jLbx4jMyEVuadFmJ1wZAw0MKCDKRM+9DLf4eNRQvAz/8z
	cqoMn0FnS7IDsmcCzucRIAJCkEr4NldeRyNxL00DqVfzJt0x08BoBKoqDx5w0c/kwMsPjyQbfar
	0hAHB1hGJoYA5MpxKvkPioge7rDz2+jcwacUwFcqzbfWwYqrpfIUE+SZryq0E8MQqpmq1dNAzqr
	fJOu909/Ez9fO2hFDt59gpmJiOX2dZiRlf7bafmzttvazxCv5Wn7A8V1O2oCGLng7370BeeHTCq
	7g2My6gcUzq6FA6T7h0XgqaxezM1DFmTE7kfLM/GVB414QRBReMWZ37+KA5Gcx5Sd5TRkH/q64k
	3BoPbzjgJOOgrkSysj/96+nc5fY6CyStmsedZeSqmEu40H7rkh4eJ
X-Received: by 2002:a05:6214:5297:b0:910:345a:8bd2 with SMTP id 6a1803df08f44-9103f07142emr449128086d6.35.1788976047924;
        Wed, 09 Sep 2026 10:47:27 -0700 (PDT)
X-Received: by 2002:a05:6214:5297:b0:910:345a:8bd2 with SMTP id 6a1803df08f44-9103f07142emr449127266d6.35.1788976047298;
        Wed, 09 Sep 2026 10:47:27 -0700 (PDT)
Received: from [10.207.49.22] (nat-128-59-176-193.net.columbia.edu. [128.59.176.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9106412e038sm53426756d6.20.2026.09.09.10.47.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 10:47:25 -0700 (PDT)
Message-ID: <3dfab5df-c205-4853-bf48-86351a02b4e2@columbia.edu>
Date: Wed, 9 Sep 2026 13:47:22 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/14] f2fs: stop using PG_private
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Zi Yan <ziy@nvidia.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Muchun Song <muchun.song@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
        Gregory Price <gourry@gourry.net>,
        Ying Huang
 <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Kairui Song <kasong@tencent.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
        Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20260907-remove-pg_private-v3-0-6ae22f9d9272@nvidia.com>
 <20260907-remove-pg_private-v3-6-6ae22f9d9272@nvidia.com>
 <e5792e81-e8a5-42e1-aafe-58dc603f4968@kernel.org>
 <178889163877.1334491.3646957026033534678.b4-reply@b4>
 <83a8743b-9cbb-42a5-9ff5-718297916a76@kernel.org>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <83a8743b-9cbb-42a5-9ff5-718297916a76@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yXMt-H-klwB9BXSRucP2TQPGyRHZJWYw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE5NyBTYWx0ZWRfXzcmelaFgAdlK
 yK59aRsZWnk2QdTjYsu3XCkiD9eFI2I+LCldSoiFRt/D0jtR3fa2DdIvgxLdMBDZ0DQuMOMGzb0
 cWbL5p+kIkmUAFF1pg0k/DrOG4FQpGbBvy6wBNsWOQZpstKLox/y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE5NyBTYWx0ZWRfXxs7MnRhxbs06
 nTpVJ108l798IJi33qFuGMbGcRIxRnAB9RuLKggy13YY918atk3Dh9aKaUDH2siFbqEULEUphBU
 +5VbpsHtm3tDJd3N7rlIE7FHKxMQHTDmdBlrWeHU1Es93AOeTRRuKKKlOu3dnNlV/sJe62gQfKP
 LMC8ZUoa2VIoPMU75u1C99OHejNhsAjqb9LiQmENaWRM2SOKqi0rQ5QGUw77vkV/QRZpx76oIXU
 kCKlbWKVA7GHFbBTY+stNAKLmK0xV6l6UbSeYXZ8gragQy68pXSv1LOxCNEMeTMXpprJgw/FXjo
 VrNbkg7Yw7px8fegGqzvKoPIPuo3ywWwUBBzVik1GUg9hMjEQBTB26o3btR8haA5yYS8T/DJTel
 osAT4PFYL+OsK1dI2x9VH39dD/NDKe+vX1wh5JatuBB09ewROMYrj3dBC1YfWWO/yLdUTTxIN6d
 O0CJpdjOgJBsdxFzDxw==
X-Proofpoint-GUID: yXMt-H-klwB9BXSRucP2TQPGyRHZJWYw
X-Authority-Analysis: v=2.4 cv=LdUMLDfi c=1 sm=1 tr=0 ts=6aa19bb1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=fJxgZNdXt3opHMdyAp+FXA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=VwQbUJbxAAAA:8 a=FP58Ms26AAAA:8 a=Ikd4Dj_1AAAA:8 a=brY8mzgTOjc0s726uLoA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11900
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 adultscore=0 lowpriorityscore=10 clxscore=1015 impostorscore=10
 phishscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090197

On 9/9/26 3:48 PM, David Hildenbrand (Arm) wrote:
> On 9/8/26 20:20, Tal Zussman wrote:
>> On 2026-09-08 17:47 +0200, David Hildenbrand (Arm) wrote:
>>> On 9/8/26 04:56, Zi Yan wrote:
>>>> f2fs sets its PAGE_PRIVATE_* flags in page->private and checking
>>>> page->private != NULL is equivalent to checking PG_private. Change
>>>> PagePrivate() to page_private(). Meanwhile, in set_page_private_##name(),
>>>> page->private is first set to 0/NULL before an PAGE_PRIVATE_* flag is set,
>>>> but it can cause confusion when PG_private is removed and
>>>> page->private != NULL is used instead. Change it to initialize
>>>> page->private to PAGE_PRIVATE_NOT_POINTER instead and retain the original
>>>> semantics.
>>>>
>>>> It prepares for a future commit that removes PG_private.
>>>>
>>>> No functional change intended.
>>>>
>>>> Assisted-by: Claude:claude-opus-4-8
>>>> Assisted-by: Codex:gpt-5
>>>> To: Jaegeuk Kim <jaegeuk@kernel.org>
>>>> To: Chao Yu <chao@kernel.org>
>>>> Cc: linux-f2fs-devel@lists.sourceforge.net
>>>> Cc: linux-kernel@vger.kernel.org
>>>> Acked-by: Usama Arif <usama.arif@linux.dev>
>>>> Acked-by: Chao Yu <chao@kernel.org>
>>>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>>>> ---
>>>>  fs/f2fs/f2fs.h | 8 ++++----
>>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>>> index 9940a6cecf1a2..2f7ab5888b078 100644
>>>> --- a/fs/f2fs/f2fs.h
>>>> +++ b/fs/f2fs/f2fs.h
>>>> @@ -2691,7 +2691,7 @@ static inline bool folio_test_f2fs_##name(const struct folio *folio)	\
>>>>  }									\
>>>>  static inline bool page_private_##name(struct page *page) \
>>>>  { \
>>>> -	return PagePrivate(page) && \
>>>> +	return page_private(page) && \
>>>>  		test_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)) && \
>>>>  		test_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
>>>>  }
>>>> @@ -2710,9 +2710,9 @@ static inline void folio_set_f2fs_##name(struct folio *folio)		\
>>>>  }									\
>>>>  static inline void set_page_private_##name(struct page *page) \
>>>>  { \
>>>> -	if (!PagePrivate(page)) \
>>>> -		attach_page_private(page, (void *)0); \
>>>> -	set_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)); \
>>>> +	if (!page_private(page)) \
>>>> +		attach_page_private(page, \
>>>> +				(void *)BIT(PAGE_PRIVATE_NOT_POINTER)); \
>>>>  	set_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
>>>>  }
>>>
>>> Very weird interface. Why do we even need the page-based interface still?
>>>
>>> $ git grep -E "(set|clear)_page_private"
>>> compress.c:             clear_page_private_gcing(cc->rpages[i]);
>>> compress.c:                     set_page_private_gcing(cc->rpages[i]);
>>> compress.c:             clear_page_private_gcing(cic->rpages[i]);
>>> f2fs.h:static inline void set_page_private_##name(struct page *page) \
>>> f2fs.h:static inline void clear_page_private_##name(struct page *page) \
>>>
>>> Seeing code like:
>>>
>>> clear_page_private_gcing(cc->rpages[i]);
>>> if (folio_test_writeback(page_folio(cc->rpages[i])))
>>> 	end_page_writeback(cc->rpages[i]);
>>>
>>> Makes me wonder whether we can just use the folio helper instead?
>>>
>>> In f2fs_iget(), we enable large folios only when !f2fs_compressed_file(inode).
>>>
>>> So naive me would assume that we can just get rid of the
>>> set_page_private_/clear_page_private_ stuff entirely.
>>>
>> 
>> I have a WIP series of ~30 patches converting much of the remaining page
>> users in f2fs (including the below) to folios. Still have to do some
>> testing and clean it up, but hoping to send it out in the next couple of
>> weeks (in the hopes of eliminating some more folio_compat.c functions by
>> next cycle...)
> 
> Indeed best to wait a bit before flooding -mm even more, it's rather a lot at
> this point.
> 
> In the context of this series, it would be great if you could review whether the
> diff I proposed would get the job done, thanks!
> 

What it changes looks good, but I would go a little further.

There are only two more users of page_private_gcing(), which pass fio->page.
Those could easily be converted to folio_test_f2fs_gcing() by passing fio->folio,
which is in a union with fio->page. That would let you delete the
page_private_##name() implementation in PAGE_PRIVATE_GET_FUNC() as well and just
remove the entire family. At that point PAGE_PRIVATE_{GET,SET,CLEAR}_FUNC()
could be renamed to something like F2FS_FOLIO_PRIVATE_{GET,SET,CLEAR}_FUNC() and
all of this cruft is gone and folio-based, with no more f2fs use of page_private()
either.

The renaming could be done as a later step, but I would get rid of the accessors
as well in one swoop.

> -- 
> Cheers,
> 
> David
> 

