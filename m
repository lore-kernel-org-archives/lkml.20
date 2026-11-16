Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869331;
	b=tVnStTmZKGRPEGyXSk0o8/D8f+pJjUX1P/H8STUE3bX8h9l86P9gSasBg1cQr9Od8DcJ
	 dppRZzzCOLs70YqPPqlQWEwUqPa3mpp7Oer42d9IkTIcqo4GzupQ2nTthkxc/STlu/jue
	 VrrASmYqghWH78EuYbnyyCh2TwcgqZAMrenQuAqLSC31gN4Z1ER60fYaMRTY3rFNTGKgg
	 dGG3NXffzokq2Be/X9x3ApjPgYBLTy697QYvc7pEQ9z+a+2mDF0DPlwVA6xuYkUPJx7Fn
	 1KHnE7wmoBo+Z4xbCgE6Oe10ngoRKZODQ1QrM7TRhMDmoooTvEOJCoZ5Rq2XTqrF5lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869331;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=60pDhYqz+P/R0qO3ME/ENMTcAYUA1szCxs7zb9TkRHQ=;
	b=GBgviKhgd1pPI/8sSbeSMgOQ5G7aUonbXCitFZUr7ZqtyNfz1aiRbzXii5Uep9STfLGS
	 C4pRlpi6ScQUWpVPxZQyjUXRJTBcsrd6aV9w6xhXtt+YTpT+K6sllnXHe3m8EPlPElHIp
	 bxG+gIu73ah78LcrDLOxQsOTxiSvwXSn6k8/PLa/ZfMOQgsGoEoJvNa8gCal/F56kCiJS
	 iSYRHYHI9MxiGAmRgDo808vHAYuNsfqqj+opfnD3FyPM/1mSahLfWr3F847BrJKpTv8aL
	 6gkVx0kp2bhk2GIOVUZeaVL8QvYpKYZhDasdngEZaF1nzkvmoqXCF7JFqYMUL2o0W1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=k1WbxU0l;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=1v6bl3wp;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CF3606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0CF3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=k1WbxU0l;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=1v6bl3wp
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGLYgQQ4121227
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:48:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=60pD
	hYqz+P/R0qO3ME/ENMTcAYUA1szCxs7zb9TkRHQ=; b=k1WbxU0lT18UNmrfrowr
	y8lYOCZNHg2XrgLX4thXOcJ3RlUAb8SxGwHDhC8PUYAt217320UMYud3I5p4Srfm
	6QU4bFrowB3M0GGpHY1i5fHPKf0r/2A/9nafA3zaQt4eIk332NNa8mXs7Bbdw50x
	GZfTUn8r8CbEoyvCeZsHbO1sHQ1MFAUp2W75qr4SM59U+9IXrFDIarJ25YOFlOs5
	KSCyZBiQBywR8GQ/XJWEMnvcwGuVYsylasbbZEMQF23euFbKRbjtpOxTwhgLeF+L
	abnUcCxQdOEPOXg7VbMNASQC3fjzwuBCdtIrhjHTxJ/l9hgbTjBWUHePsKCTXmaF
	AA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j0598uphk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:48:49 -0500 (EST)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2005ce21so730419685a.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794869329; x=1795474129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=60pDhYqz+P/R0qO3ME/ENMTcAYUA1szCxs7zb9TkRHQ=;
        b=1v6bl3wp+bhTl3341mBPh+f6SHAGIDaLKD1bTfrwn/id8e/eHOeAbYeWhj8Q2nIpPX
         IWXvyO1G3msOQzCIxxGA/aDRe3WDDDjFpb1RkZP0q634agN8YoMfBAzm3SKWXPQTtREP
         yFTCBeSQNSISyoAnIqaeDIdGiswTbVopqQaDLTZWPffPcaM9X5kTNKhs5rHOlV9y7Jov
         cu6nTxvDZq/tWW2KHOVk14QvsYIavpnWX/PKB6lLU+PwnsEB6adsQDEF+N8SZjR7PFi5
         5+j7l9u3C4avaWiHQirZWTNupyMrtHWQ561bYN8a2ZopBXAsQFY29ljAQ2+mMR8r+Tdf
         H9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794869329; x=1795474129;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=60pDhYqz+P/R0qO3ME/ENMTcAYUA1szCxs7zb9TkRHQ=;
        b=ddTh44I51icktqT3B/BMXjdYpOJCLmkIy6dpUETv5lJcfMYlQ21WM9d9S+Kw6ds02q
         XDlZvacEg8mAKl+m2HqLjtnqmJ2hvdnjK/6dxS3wZhe3L9YUiDrhJNZKzSoPQHcOiONM
         rqpTszoVDzjw7/1ZYpT0E5G5SFuj1jf4Rws286TSTgM8Lo6Ppm3zLGI3pf53vEjfOst9
         KJSumikwBO1KR1QFt3zP/jYN4ghPoIT2Rpbp2wq7zgYsKvbX/EUFFLSqwT9QWfglgE/U
         wB25ynnZUQ3nj3C3fdmUXaDpEI+xU/LLMGabcFi0U5+mzYm5FG6qQti8qO3WdOMuhN3c
         ooSg==
X-Forwarded-Encrypted: i=1; AL+hErE0t1ns0DTyDObrKLQW71mYFFatLDWMhr/jmrdte1OIVoJz88ZcjyQhpQTzn6XRAqOFq2k0BenSUW+bkJY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SsqJJ41gJL3oPVtSAZniEnkKJLpSMP8oqQb1lj9SgvXzWbOyS
	fLgXXD5QVCRG++cQMtUH00B9aMZSh0gbv0ku/bP1wBqykpugO+p4jd8Om0hYyld31mqPBnHR9WU
	VVUhKY4EnB93SST9nZ7TnjjZZlOyPfiEFJekg+VqWixYUhYNOm4zaRFJND+DE7g==
X-Gm-Gg: AYBFou1Z5tDIcplK7CtbwBh+XOU70sqrvPFGpCDvlgiHhTy4JJxpH5Nlqi/sUF79vTi
	cP7ANxBdyVL+JRisdNpopYWkeJM1UHqZK/zKZbZ+/CeiKhObEFZhYpnRDALZRn2+ofssxjuVR6s
	FdH6R174dMZqc2UvjyTddfwJvi4rjplvHJBjzRRhq9VjsUDctRDVIvE/bm8r+2aRiVCvGG6pHio
	dwj3GYkw0Lzjref8ZqsdM7/Qt/TTJMltkxDEai3bixm9Lq2FsOpx8Wuf3K9qL8pmRMzz87pkTdH
	y7c7GKExpSR5MLmX69Ny8OWDUbRboi1dDtoYXulBC0SqzPU4VaGHCEpUvBenPi2rxG3mUHcnaaV
	hVZ0K8tZBCNBQd22sXkzUkwSFD5RpkkPMNk3NL3F6M5sjtkSBVJYBkNFg+Z9jTJFwJzoGFdn5m3
	7pZnOXKCzjplt+zvpRgUGQ/oPL
X-Received: by 2002:a05:620a:2b89:b0:949:7781:6a31 with SMTP id af79cd13be357-94977816f98mr830657685a.76.1794869328824;
        Mon, 16 Nov 2026 14:48:48 -0800 (PST)
X-Received: by 2002:a05:620a:2b89:b0:949:7781:6a31 with SMTP id af79cd13be357-94977816f98mr830652185a.76.1794869328428;
        Mon, 16 Nov 2026 14:48:48 -0800 (PST)
Received: from [10.207.2.125] (nat-128-59-176-174.net.columbia.edu. [128.59.176.174])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c804f9esm954860185a.11.2026.11.16.14.48.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 14:48:48 -0800 (PST)
Message-ID: <cc8daec0-c3e5-45be-9af0-d58719a43953@columbia.edu>
Date: Mon, 16 Nov 2026 17:48:46 -0500
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
Subject: Re: [PATCH v2 5/9] fs/proc/task_mmu: write-protect device-private
 THPs in PAGEMAP_SCAN
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
 <20261116-uffd-state-fixes-v2-5-4397a0196479@columbia.edu>
 <38750bd8-6bb3-40f9-901c-44cef40a9de7@kernel.org>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <38750bd8-6bb3-40f9-901c-44cef40a9de7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4HPmFL2_9Rm4XJ2x-G-9_W1CveZzMucG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA5MCBTYWx0ZWRfX1AKQ/r66czAv
 Jru/uS4VK8YN4Tp1zdthiPOw7AqPZJ7q4BvXse6ERZtH8cLqmiRC9Wt61tOoWzid28ZASdGbT4U
 99Cf+K0fXxQE6VRL8BSFtYk5OXFazFfPwXRWM+59H8H1c7rRB/wm
X-Proofpoint-GUID: 4HPmFL2_9Rm4XJ2x-G-9_W1CveZzMucG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA5MCBTYWx0ZWRfX+H+k1365mTlU
 RFsGa6AtPsEWX6n6rPig47ryfXip1jCO5T2faWB649FvWAsUi8CgPbCdHzCSrvUdLGZOdW+Dre+
 OajqUJonkJYgrFODCuWMlWfE+x1PHv7OvvHlp1MO2i+yVAxr9KV8KheMcJ46VfXlou9mlDAxoPV
 9X9bhQs1JSAn0Cq/PaPv+7+0GXtrA86ytgcETUpVoiC/X7Bk+dZJA4dk8MiAHh3TdTZz5J+HPlI
 rZv1B8r59tdQnWaXOh8qZjREj1mgjNhLTsz4Dx93lCQOcE1TYBFy0mRLQFHiaY818hmb2I2nm1o
 yOd9cdibQeLSierK1IKDnEoTp3Hr/4Q615/Esu3fhAKKpxvcZnSrJajFKMHOa3QJFKQOC+fzdVz
 kNntg9GEyPXOx9zH7cBXLaI/7ST66uNOcSpF2oAfubGfO0kkbU0yMvYJ0fBoXtZ5x7fQBm3ukpV
 hrXND4+eTeRSPqGuLLQ==
X-Authority-Analysis: v=2.4 cv=ZOpCCn7b c=1 sm=1 tr=0 ts=6afb8851 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=KPY1cyGZ6h6m4ASiENTC8Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=usPcmh10W0ubT8QP8_c3:22
 a=tHa68p0SAAAA:8 a=qGNAzR1j6OtaQhhBgNgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=ufIsyHvWW7FwcMbVRpPq:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=10 bulkscore=10 impostorscore=10 spamscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160090

On 11/16/26 3:26 PM, David Hildenbrand (Arm) wrote:
> On 11/16/26 21:02, Tal Zussman wrote:
>> PAGEMAP_SCAN with PM_SCAN_WP_MATCHING write-protects a huge PMD through
>> make_uffd_wp_pmd(), which handles a present THP and a migration entry
>> but does nothing for a device-private THP. The PMD never gets the uffd
>> bit.
>> 
>> pagemap_thp_category() reports a non-present PMD without the uffd bit as
>> written. A user tracking writes with async uffd-wp therefore sees every
>> page of a device-private THP as written on every scan, whether it was
>> written to or not. This requires a driver that migrates THPs to device
>> memory.
>> 
>> A device-private PMD must be write-protected like any other huge PMD. To
>> fix it, pass any valid PMD softleaf entry to set_uffd_wp_softleaf_pmd(),
>> not only a migration entry. It downgrades a writable entry and sets the
>> uffd bit. When the THP migrates back, set_pmd_migration_entry() carries
>> the uffd bit over to the migration entry, so the write protection is
>> kept.
>> 
>> Fixes: a30b48bf1b24 ("mm/migrate_device: implement THP migration of zone device pages")
>> Tested-by: Gregory Price (Meta) <gourry@gourry.net>
>> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
>> ---
>>  fs/proc/task_mmu.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
>> index ee7f509d376e..013eeea7d1a3 100644
>> --- a/fs/proc/task_mmu.c
>> +++ b/fs/proc/task_mmu.c
>> @@ -2520,7 +2520,7 @@ static void make_uffd_wp_pmd(struct vm_area_struct *vma,
>>  		old = pmdp_invalidate_ad(vma, addr, pmdp);
>>  		pmd = pmd_mkuffd(old);
>>  		set_pmd_at(vma->vm_mm, addr, pmdp, pmd);
>> -	} else if (pmd_is_migration_entry(pmd)) {
>> +	} else if (pmd_is_valid_softleaf(pmd)) {
>>  		pmd = set_uffd_wp_softleaf_pmd(pmd);
>>  		set_pmd_at(vma->vm_mm, addr, pmdp, pmd);
>>  	}
>> 
> 
> This really should be squashed int #3 I think. Or what's the reason for keeping
> this separate?
> 

I viewed them as separate bugs with different Fixes: targets, one from v6.7 and
one from v6.19, so it seemed reasonable to keep them separate. But patch 3 handles
device private entries already anyways, so I can squash this in.
