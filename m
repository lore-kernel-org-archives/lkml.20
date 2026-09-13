Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132553F926F
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789330276; cv=none; b=jAjVVXvMweovsHSUwf/BIiU/8SC9RW2Q8uc84U1OwhTmrW2WyxKWOT6ikGLaM7qSCjXuc1Y+xIOiAyqk+eAkELAJN9zY3Uq4lezzWF2k2L9Ns9EKuQfrWBlPtEojoN7IVcMf5JrSzloChGodwjoMZdeiD6oPKwn8AHwFioSuj+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789330276; c=relaxed/simple;
	bh=ipUTRa5FmU+A2K5pQZIRNAubnbHnTgWKwnBQZqiDsNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qhCe6TLSQ99aSd6krl+f/94E7y1AmVd9cpbvxEpDeufkm8rkHqf1uqffuBAlnhHQf65cg164pg91v9oblZ5pK02yNC1kk6DzYLmsexgBzZUWgQ9TRjd5rA+g7jwWQitUI0j1ZH2iQD5A+Omkov/Y+wcxCqM4zxIPolgHUKVkVqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=meP7My1q; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=dlELh6vG; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="meP7My1q";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="dlELh6vG"
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DIYccm311769
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 16:11:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=xmmC
	bWeNjsNg9Gzck7tgmssf89nltQI5HT0F64h0084=; b=meP7My1qraBPv99/dAct
	c/kxivRvRltxw9A6To/cOqKHpDAm+YNr566ZKHQ1Fg6VDfO1lg22RQflyrXDDfLA
	a1HBRKgeUcVtf0UlvgPz328n8zl1aG9fa9SycosDvXclEvReC8w3YnfW8hEBx0my
	Rm7pH1UbInIC7q30KWdnKhymAimiiRlj0m1+5ePEijhir0Fi6FEi7Ixun692MifM
	n0BWUdTH7UpQ++WYr8OVkt/V0i2ppih16ZjGfZ7Mh4pL1BS33j6YahRVevB4tmVB
	RBSNITLU9JDlP6kV8GL5j15Yfe8yKdJUcGPB2hhHAKMSa78Hk99bB7C8QlNAcCKo
	3A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gn2qjpyhd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 16:11:06 -0400 (EDT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a1bffc2eeso148523485a.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 13:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1789330266; x=1789935066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xmmCbWeNjsNg9Gzck7tgmssf89nltQI5HT0F64h0084=;
        b=dlELh6vGe0pEhT4vBt4czDMAup/BO4Q4pnw2AmgKg+EsQ7Rxk7QfX+EH6Ksf50t5l+
         I5HEi37S8a4nxdQn2+2qGEfGzIzsVFiqR431KHOVdmdBkZgnMb595TukiNlpvD3pEAMr
         JiQ0rPBcKGaRs92AZtpVdEwDfO6Y1L8YKybuRcA5/W1g9sjdmrh19dRxVfKirlWG+ngB
         +jqmXGP4lem6zZkzweuBbA/7Gv0w9jC/MXM8nTl0VJ640jb+UKmSihsneZGMsW2iLXfj
         Pki6yi0W/BOQ/EXcjZcd4ZC3CoOqB+xPUOp5iFSp0qh1HLKYbw/8aBIWoxtUUoYt71lN
         Bm/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789330266; x=1789935066;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xmmCbWeNjsNg9Gzck7tgmssf89nltQI5HT0F64h0084=;
        b=gz82AzmU7VxXCF4KRiz7qSvFgyjm4znR4s6LL3XahlgKqEzx8WOA3mPOQRcml+O2Ur
         RkjOD3FJMUkKBOV4EDDQCtsbWHp8NDyx3kdLVseAkKyHTuvJ8GJoaMOc2gW0+p1W6BgW
         FwIH9/r0L3mSqShz/FOtpBEPaYcgPma6/fmLh0nktX8kQI9lXfDsxCe96d+KH+AJHoSQ
         d2lIxZ6TU/f4HNenCSRpCf+NVlZXV/ss7BYiSI4jXNaw58hQp9GU9ANE1xoO32guj3Kb
         o255vcoK4VgxWeYh32MQrz7obEuS++Rg7wqVJVwC4IO4f8OyDYmPznDc5xGwNK6ONo52
         a6CA==
X-Forwarded-Encrypted: i=1; AKwUvBy1xf+E09WnU5meB4Wv1Vd58r72PWPI1umcWqwlPQxbQXA7D71vLMGwoxfV6I5w/FIIvHkbJChDnkoyk50=@vger.kernel.org
X-Gm-Message-State: AFuF++mmWfttdRDdt3F3SX4Ovxf41psYuMtZnkZ9bmf+1/lSehW01gdW
	FUkN7pw5kJYvCG98i9uvfVdPb4EfO/1F4x9x+luGo0lGv8H3oQwsi9LacFueajgb1dCOfsXmAaN
	pMwBMYH57GQySo6t8iFVtZvurTWImksWXWjH0Fu3yS/WbE/u1Sk/tnVH9TzQLjA==
X-Gm-Gg: AYBFou0hbdrDe6FcWHDQXsbhcjOFRZbsqSwztn/hwOMvEZJuqs2zp5CJcl2XtNlTvw3
	xK0djbBzXHmPGnz3FtDRo5WVW/hbMUM7Cy+Ks661XvDKsJOMC2JGvQdut1tCPLjx4WSyB8untqg
	UxYFGZfDwBPEJCo0vprKkLiYPqhTBMJuwwoCcFHEDIpNi9ZPtudWH2DHZ5CJDzs51WJw9Rk59as
	ykcTJ153ZvbPtXHcYwCUMLY4yPU6KX6YnDICVARHWmHzwf1FNgyw/zOgMnc5LChQ62wzZtGXgds
	WYgrrlDzeMSxzH3FY51QX9kwW/Cydjb29inqDZyVCTDH8umSN+eBzKI+eqz2wt2WMooOzGZkSQC
	BK5SpotMY6ITMX5kuumXA7cDnoYlQwCyuG4NWX+KwLYhLEALwp81Q
X-Received: by 2002:a05:620a:4443:b0:936:eeab:307e with SMTP id af79cd13be357-93a0357e40fmr1139531885a.9.1789330265919;
        Sun, 13 Sep 2026 13:11:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4443:b0:936:eeab:307e with SMTP id af79cd13be357-93a0357e40fmr1139526085a.9.1789330265446;
        Sun, 13 Sep 2026 13:11:05 -0700 (PDT)
Received: from [10.207.49.22] (nat-128-59-179-215.net.columbia.edu. [128.59.179.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939f592c482sm659587485a.3.2026.09.13.13.11.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 13:11:04 -0700 (PDT)
Message-ID: <f971be6c-c3e8-42ad-ae4b-fb3d0753a8c2@columbia.edu>
Date: Sun, 13 Sep 2026 16:11:03 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/14] f2fs: stop using PG_private
To: Zi Yan <ziy@nvidia.com>, "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
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
 <3dfab5df-c205-4853-bf48-86351a02b4e2@columbia.edu>
 <927c0ec3-4183-4355-9269-721d79f4983c@kernel.org>
 <30DEBE66-9E26-4468-9A12-123539ED68A3@nvidia.com>
 <DLBY1EIZD8G9.3O0LMDKCMNPIB@nvidia.com>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <DLBY1EIZD8G9.3O0LMDKCMNPIB@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: E4H_nNSY8Zx7YSWGy5CMkPMcuVhDjhQZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI4NiBTYWx0ZWRfX/veS6kMrWLa9
 Dah4dAhU66p9ZOEOEQ/eMnmK6YzuYlfnMY5MVArIrRjEC+LH6GvaUjxCwfK2JAWmwgbPiE7dztj
 3F5SbMwKIiXjquec4YmY3T9iHLzaZ/MMRCzym9cwC/6K2/mzItUt2/AM5dlH7TmbXCBpVxu3ChI
 VNbJhoEbG6j3uJkY1dHVETs7oENQFidZAX4krhNQqnIzc+N2Y0Y96wv72G0CQ03r9P7+RB82R1y
 EeJsVxELhIvNsNM+mFuJ7HN9W+HM6JiVQKHttLYNk59DnIo+QN21B+CXFgIL0bbmNz++2EXt7G3
 ttI5Np04P2OxuzKNPBocz0X8YCIZ5chRbLo3olduT/2u8G/uAB4BSvItMGa8aLpCMDrRl6uNn7F
 2IP7TqaDY8m4akgosqL42hFHRNSqlCuqg1MhSFVzakKq7DpV+y84F2N5YkYVrXBn6t4amJrYQCa
 k9dQPD4e9De7NcdZLGA==
X-Proofpoint-GUID: E4H_nNSY8Zx7YSWGy5CMkPMcuVhDjhQZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI4NiBTYWx0ZWRfX5d63t9z8EeU/
 WYaSUQ8OvdLcfID9vxg6wXGcJcv+7vnyq7UZETI74MDcAlOge0ylsfR1XqEYr3uVoI7Vtt6abvg
 GrMI0SlFL5+63EVZM35+KN5B2cAoGgajEV7bflVBwi3fhTYWr8pQ
X-Authority-Analysis: v=2.4 cv=Bp0IUoX5 c=1 sm=1 tr=0 ts=6aa7035a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=2jelXx5xVcRIF5zNctN5Qg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=Ikd4Dj_1AAAA:8 a=VwQbUJbxAAAA:8 a=FP58Ms26AAAA:8 a=3Zgl-KUdFkos_lAptz8A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11904
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=10 clxscore=1015
 phishscore=0 bulkscore=10 suspectscore=0 impostorscore=10 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130286

On 9/10/26 5:11 PM, Zi Yan wrote:
> OK, here is the patch. In addition to David's patch and Tal' suggestion,
> I also
> 1. converted PAGE_PRIVATE_* flags to F2FS_FOLIO_PRIVATE_*,
> 2. converted page/folio union in f2fs_io_info to folio only, since no
> one is using fio->page any more.
> 

Nice!

> Let me know your feedback. I will add this to my patch series once you
> are OK with it. Thanks.
> 
>  From 3bae5c494459b3dd05893df6051e3eb37164f810 Mon Sep 17 00:00:00 2001
> From: Zi Yan <ziy@nvidia.com>
> Date: Thu, 10 Sep 2026 16:42:39 -0400
> Subject: [PATCH] f2fs: convert the ->private flag helpers to folio-only
> 
> page-based ->private flag helpers are used in the compression path, where
> large folios are not enabled. They can use folio versions with
> page_folio(). The two remaining users in data.c and segment.c can use
> fio->folio instead of fio->page (two are in a union).
> 
> Drop page-based helpers after the conversion and rename
> PAGE_PRIVATE_{GET,SET,CLEAR}_FUNC() and the PAGE_PRIVATE_* flags to
> F2FS_FOLIO_PRIVATE_* to match. Convert the folio/page union from
> f2fs_io_info union to folio only, since no page user is left.
> 
> The folio helpers do a plain read-modify-write where the page ones used
> set_bit()/clear_bit(). It is fine because the converted code either holds
> folio lock or, in f2fs_compress_write_end_io(), matches what the
> non-compressed code does in f2fs_write_end_bio().
> 
> Assisted-by: Claude:claude-opus-5
> Suggested-by: Tal Zussman <tz2294@columbia.edu>
> Co-developed-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> To: Jaegeuk Kim <jaegeuk@kernel.org>
> To: Chao Yu <chao@kernel.org>
> Cc: linux-f2fs-devel@lists.sourceforge.net
> Cc: linux-kernel@vger.kernel.org

Looks good, so:

Reviewed-by: Tal Zussman <tz2294@columbia.edu>

