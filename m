Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316922E1F0E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 04:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788927922; cv=none; b=isu24CoritVDeA6JPln89cBHK8sJCwk1ZVAFbUM/Q7EtXt1nDZkn/K88Scwk2/t/akcPEWv74dn420H7v3Pp0cIrpyYnUwu1oIdU7qx+5w1k188azS77gybSTwRFTL8zrbpAJJWm+tP7IYIJd0RD/Kug+NloUfgEpVJCu7FXzHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788927922; c=relaxed/simple;
	bh=KO8yXtxYH2MCUHZPuhwewSO5ZtrP1TPBrP4qFC82Ig4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Td0EfejXg7CPwobZPQwsjnjtX6nHa+Lgo/5d7pCs5QVBrjM9Ux4WvkDK9VaIrGhkMvtcrqIV8ErOasmLlGGBpAmLpF1ddjaK5rXtKmDkgP0rAjpRUY51VKWHX1ClbJP7RNgtCF5y1X+rMjGkBv+ni7K4sc1cJO+yU48HfxDOsNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=UzXmIBNa; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=JgcKSqZJ; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="UzXmIBNa";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="JgcKSqZJ"
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6894In983118410
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 00:25:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=iSNP
	tExQYSX+MMrAE17ZPKsKoZbCJiQGDmfeE4bJ21M=; b=UzXmIBNaP17M3phBLH4u
	tqDhRBGYAP/2bgl7VUEXw1lgXLTIeSrMhhgJB1Ar8YnRGHSdztm7pBlTEm1HYW+s
	IsbLT2p3bw4fgjc5V99gjjzNqW+py0DG1ub+pHuaC2wgQPC72rqReWTOgqcgDSSf
	yFvZESHRbgItqX3K+JFQtMN68q3PGSKGqNcyyvYAi57+A8CbX2K0cdVP5+/BHsLh
	pxefySrsX9XFtEWh8ECksYAJvQzzvPrn0zfeVebhOTGB1c/Hhqmxm2ICPKbU3Qsy
	eFyv7MuDLamVZkt6ByJmDysEHFnDtipYUPktarnvKwe53F1+9fCqmVm6f8WXScQ7
	Tg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gk0an00j6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 00:25:13 -0400 (EDT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ec3146553so1247197185a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 21:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788927912; x=1789532712; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iSNPtExQYSX+MMrAE17ZPKsKoZbCJiQGDmfeE4bJ21M=;
        b=JgcKSqZJDw2+OXhGiKNRsyfETCptIU677Vn4v4if1a5Rx/LylSpWJPMBhbPIayCRm0
         R9QClJkuVa06jZ2+cjXSLfDqioul2+Ev1YS2zz70DMcThqBVG4SSiuS8DInjrmPezMs3
         a3Y6Jm7SXo+iw3hzaR9lcE1STH00YXD6zYk+7Kq+LG/VUiMKYEdGN4J9lw24k+1zi4ox
         5j2rcYqMIBrWtVBd7UHVhiTlM8leVVkUjTnNaTrfH+dxx/UAsXUd2pDmiBCAXe3VGbsO
         7IHt729U/HA60Q8VJN/zwN/Ou6paVC1LbPUGFzUfHtI8zrsza36LHOUkfBiV/IWmPBYZ
         o51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788927912; x=1789532712;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iSNPtExQYSX+MMrAE17ZPKsKoZbCJiQGDmfeE4bJ21M=;
        b=OQRiiomT6XVXe0X+7aK/BJPqZHreQezjvm5gVa7nlRBN1MdYNNyp1uhtKtwePjvr6L
         ZpEOiP4zFCRmGbnUbVTrq9L1iQ9N5ITuVfbPHs2FUiEgXOWb+6wgLFuVBcBJKDAG/rp8
         7ZgAz/6ZTGfEXBgi/odPMErKRUUGQShY4otsTbxaHaVv9JvFLg+fhUU0OuYRvFfE/NtC
         9j78q1iLw5PM5jZSVWMYzI5mMnuG+XOsxfZgs2bWECE4sfpD6YWYrv03mLxMnu2CeaiB
         bufSgAfPUtzld+sguVZsMHhoiX9G+TRC4HzJE+UYivdLHJurGW4800VJEDnXC92ct43K
         atVg==
X-Forwarded-Encrypted: i=1; AKwUvBxBLcYfEapimMUWwkgjgGo8qqq9VzaseY0h823DUQBl3L2SzNUyi2A5ZgNvOa2ofl+z7uByPf2O/Ao5MHs=@vger.kernel.org
X-Gm-Message-State: AFuF++lgCQQ7IQ1LU2DdKzPyml69fglVeFcYKmlEN4LkJalb9h/ZVXJc
	c2VucKX6tr4k2yJ6yG/XZ4Cj2yflh6Hupg2wljp8D2UfB40mdoEGEb0Y/hUj8vbK5+PBF0mvy9Q
	VtdzRzcDSlZG363Z325X88WoPyVJxs2kIs4eq9LtvVl8Bp0dzDIcRqbZAkLH2lQ==
X-Gm-Gg: AYBFou3Khhmr4SS+r4yagPC+RhPpMeeIGM3EpX/HsyC6uQHvk56WXk8w4YcTo2w9U1l
	duhM1k55Y/shpwUM16sy81JJz9wJC7dgRBWyAfLmyyLIiwokGk7kKO4dRo5/+Ltx9wKy7KZXJo9
	U0BO51lbZgJlIGhgAdifIYoySybJbvsZOpZXfowbgv6bnPmJr0Aa4ay8YmHivP2/MTmjuusvNKi
	0E0xxwLJvtfMOe856L6+AUPOijNrSMxfO1lAv8+g60ZNn65dbpjwFhypjm58w6oqVQNUKM6CydU
	HDCEuZLO0l4YwgzcbHDA6FWxxsREzIETDOru5Ga6X9+E6FhYd4qvDRf1UlfWfCnxOvs85JzFf81
	cm7pXNqrA85b7HiuG7M/C1BcvYykLQBABFhBmK2NERcEsfD6nuPkyyL8=
X-Received: by 2002:a05:620a:4494:b0:937:7836:1501 with SMTP id af79cd13be357-93980599a88mr3451987385a.10.1788927912653;
        Tue, 08 Sep 2026 21:25:12 -0700 (PDT)
X-Received: by 2002:a05:620a:4494:b0:937:7836:1501 with SMTP id af79cd13be357-93980599a88mr3451978385a.10.1788927911180;
        Tue, 08 Sep 2026 21:25:11 -0700 (PDT)
Received: from [192.168.1.62] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939aff54ae0sm599275785a.8.2026.09.08.21.25.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 21:25:10 -0700 (PDT)
Message-ID: <f5eea2fd-61d7-4cba-bd0d-f6d454b8c221@columbia.edu>
Date: Wed, 9 Sep 2026 00:25:10 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] btrfs: convert heuristic_collect_sample() to use
 folios
To: dsterba@suse.cz
Cc: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260907-btrfs-folio-conversions-v2-0-b5fe79f7607b@columbia.edu>
 <20260907-btrfs-folio-conversions-v2-5-b5fe79f7607b@columbia.edu>
 <20260909012633.GI9053@suse.cz>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <20260909012633.GI9053@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XbsAHxl1lZsPzMjDUpmtBgbPh2_318G7
X-Proofpoint-ORIG-GUID: XbsAHxl1lZsPzMjDUpmtBgbPh2_318G7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA0OCBTYWx0ZWRfX0+yK+KDyAeEe
 TGVi/68r+qHDDkJAWtJfu51M+gLv7RQY07/m8L3wc6+hlYEw2OEel9G124nkQCxJ9JXEz6qM/vS
 5nGMlRitVePx8POzFqiLWFr6oi1O3YRsYyLSLVeW5LJ0GslPGzrbfUwcWfv/66J/9lIfS3c5NQe
 M9+gliZb9bD5zk3QS6IyBINEsv8eFuvqiA/h/oW4CQ80RrMd2WGLZHEHcH6XXqXDSAuW7cfOt3g
 wwrtCXWckni7zB7j2/Ga0bDbtR4+rfrE4tTcN2qnCyXyQuxr4bpZ5vsrao/7DDmIf4/CIxoNAJW
 bZvRYE67oG3mYA3fAdKXgbWa360PGJA7c3xrgn7sa/OPeKTnoyftt85HIadJUT0ickFf/ZKvCVU
 WJ+j5NT+3T2+Du+0EtIp1FODJ+uvvKiNjVoADVZcXNK6zepDqfZTBg4Z2vmZNFz5WmM0gb0DNjw
 05e3gtdnrji8HZ5rrCw==
X-Authority-Analysis: v=2.4 cv=dbiwG3Xe c=1 sm=1 tr=0 ts=6aa0dfa9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=iox4zFpeAAAA:8 a=OO2bWSZ2hmC-76FcYzMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA0OCBTYWx0ZWRfX1qFDVbo7f6BF
 Vdro3vNIciCsLPOev42j/N9JSvfY14QdyRW9dlUGSJ54OViDgn3Zs8s86Lyu2P9Zlw2EZdDtaw1
 toJO9otjxDpOAtEEsRpMxd7Q4BSwhyBS/+zlK0aoE+CAGYWnsrMA
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11900
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=10 clxscore=1015 priorityscore=1501
 spamscore=0 bulkscore=10 lowpriorityscore=10 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090048

On 9/9/26 4:26 AM, David Sterba wrote:
> On Mon, Sep 07, 2026 at 04:19:59PM -0400, Tal Zussman wrote:
>> Convert the sampling loop to folios. This removes the last caller of
>> find_get_page() in btrfs and saves a call to compound_head() per sampled
>> page. Document that the lookup is not supposed to fail with an ASSERT().
>> 
>> Reviewed-by: Qu Wenruo <wqu@suse.com>
>> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
>> ---
>>  fs/btrfs/compression.c | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>> 
>> diff --git a/fs/btrfs/compression.c b/fs/btrfs/compression.c
>> index 979b2ffbd8fc..fa8b92592321 100644
>> --- a/fs/btrfs/compression.c
>> +++ b/fs/btrfs/compression.c
>> @@ -1488,7 +1488,7 @@ static bool sample_repeated_patterns(struct heuristic_ws *ws)
>>  static void heuristic_collect_sample(struct inode *inode, u64 start, u64 end,
>>  				     struct heuristic_ws *ws)
>>  {
>> -	struct page *page;
>> +	struct folio *folio;
>>  	pgoff_t index, index_end;
>>  	u32 i, curr_sample_pos;
>>  	u8 *in_data;
>> @@ -1514,8 +1514,10 @@ static void heuristic_collect_sample(struct inode *inode, u64 start, u64 end,
>>  
>>  	curr_sample_pos = 0;
>>  	while (index < index_end) {
>> -		page = find_get_page(inode->i_mapping, index);
>> -		in_data = kmap_local_page(page);
>> +		folio = filemap_get_folio(inode->i_mapping, index);
>> +		ASSERT(!IS_ERR(folio));
>> +		in_data = kmap_local_folio(folio,
>> +				offset_in_folio(folio, (u64)index << PAGE_SHIFT));
> 
> It would be better to avoid the cast, this is source of subtle errors so
> we try to avoid that. With demise of 32bit architectures it's less of a
> problem because index (pgoff_t) is 64 bit type but still.
> 
> Please insert a patch that changes the type of index and index_end to
> u64, we initialize them from a u64 type anyway and we know the value
> fits to pgoff_t (as argument to filemap_get_folio()).
> 

Makes sense, will do.

