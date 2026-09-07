Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3477537EFF4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788794170; cv=none; b=t5vVw20dqbod5VWWvfvwdsqNFJAJzw3Bnu4ZE+f0dwQzoIc2juHv3I2xQVeOa93BM3l7dUgVKbwVlTtjYQEbK/GITYWY8p+q4uEMO/Dk31nwjRrPnP3JS1MA2isPR3Fhb22siKlGzmhJFrTtuZ9AripfffRuPCH1iGh/mEclAKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788794170; c=relaxed/simple;
	bh=971moIbuxQGrNg8shhjzaiFX0Rig1XFMJuAVYBXJXiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tzqNfvpLd8whdo2s9BSTbFwBEo8sQ9T8msOT3sOde13f4OQ3OyxpOK6CI0ONiKrB/lNaD5JlQrI5tILGS32tKj/tiyAsVp/qWCwe1p53kYfFd6W+OgaiuHAg05pvjr5avWOZQx6+kq4c/zxDrqv/Oqk0oDoRoTV9QWksg/+Vfec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=fshBdm2A; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=zpwLeVm2; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="fshBdm2A";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="zpwLeVm2"
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687EYtdL2578685
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 11:16:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=c+TK
	bdK1agZJdxZqMsqMSFeIuL9KGJPEvEVEBL9qQ68=; b=fshBdm2AsgaCLXYLc3bm
	2lLQ43myR8qGRU8WGd/tVljomA6uUhMgO5t2sYWUW/b+a/gA+ofM3AhtgSx3N/Wi
	x1OrlJ3Aess6ZgeJ/E82KtJcEzDxakkkiZJEwE2MI+aC/AId514g8LKaUkYx5REt
	bVN+wDkOnv3yDNeyKR05T+aQpVh3UF/q6dkF4tz7AqASeNMsDzn9HsBJw+Z1U0h3
	NzAjIdxctvTph+1/h/0F/H8Q6BlVs8tQqB1m32zgHkhxMSGNdiYDCS7ewfldhzOE
	sOBwO67thb9h4a3Ic+ZR4pmh5ryGxkV6ZbsCkRUSPF99IGubhN6Yghy09ZgrsFW2
	bw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4ghfawura2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 11:16:07 -0400 (EDT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91049eac948so28582296d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788794167; x=1789398967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c+TKbdK1agZJdxZqMsqMSFeIuL9KGJPEvEVEBL9qQ68=;
        b=zpwLeVm2toI99NHBwY9NZP+iOVrA8VtcJW8YfxzhTI7Il9+fFOnkBSxvlnM8Pe8YVf
         2u5WrIJwyX8f/+dHleqJ91MDQMXvv9WyHEqyqez8A+ZCikSLx0HEB2YBEnBxfaTAdmGf
         O57S0NNIiwhzhieNbbWTJFda9ZGRvt/BYZFEwvM2xRsnrEncbXo692mus0NXWXRz7r4k
         1kDtAdv55cWz5WpF7vR5W7TXeOZ+Pz24rh66gFSz4ON06C04QdL3JDmG4D+xd91dwZHW
         clSrcXqSTRhc3QaeZGKGXZ7l+Ap5mcX+c8Absccm5GBYgwSt3LKKz1FFK29b4B1pH6PN
         V12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794167; x=1789398967;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c+TKbdK1agZJdxZqMsqMSFeIuL9KGJPEvEVEBL9qQ68=;
        b=e8PjzIcsv4hU28nd+C6N5dY9yumtFTIEMwS0IRFh2wtEnK+q+B2Exwxv2MyStVK/8x
         WY/03gHf+Dp+kMXFtDRhZ7rAiENv5reGBI3mDWgDQtOkYR0h6w9gt9hiyOThcAWvRyBh
         dKvZVvXFkX/SXuKb++uHZ2y19StoiyheuLZzr85JDpr5Fz4LS6Ls14TPUbgmQRFEsHW2
         UuvM3YnabmN2vSsalkYHJlrxAMm/ZLeDeD3gsUcEmk7iDGwFm00RlRdzKr/pdNZyXOwv
         gwLrWud+A9x6/HA+GeONUmBqTZ4160Gxqr0PPfHmGkVJazkYHVUHYHr4Fb7HlsVtqus/
         SjFQ==
X-Forwarded-Encrypted: i=1; AKwUvByidJD5rh1rhijwh8Ogm8O8AcnTQllRJ00DaC6JgMdT5s/2xaS0jk/MQYWGyg+6TGf+pJbboJHHAw//JNA=@vger.kernel.org
X-Gm-Message-State: AFuF++nY8NQMRl5245dXl8VBwnG1LPgSQu1nUW7hj6db7tVewcQkG0BQ
	ev/xp1DvSoHGe4j/fYq90M4krt2ekGLhDB9Hzm90GtEQiPAvIk8pt2SsCeqUe3fma/Vq8aZZOQj
	fTINMDbtF28Zm2+7cGG5v4PP4Nax4/ypBzKqFgDa+C24etCp//UpA4zSbXHrjAA==
X-Gm-Gg: AYBFou09x4lwdB+8LaQOA0U4wiq3BGmrwrf5h6ufm/gzTq5xWp/zTEHxcNseduEkIrp
	e7qow7+Wif1gcBuU3aVBCp5i3W1Ga/B6Z10z72u9QI17SXfHxwjNcKtESUM3Qdo8oBynSRFOpBy
	xDJarMnmN/TQ/lMTBPMeQJ8VHGqGD+3uPyPpy49J+3tR+AqMgu2i4UiadzqAHrkgkXTohvBI0mr
	Jkin9PlLYFUB1tbezsLQZDtaTYu9WPf1nxpOOzmNZOsosG+UcpsU4TFiiAF04sMXta40k2a64NC
	E+zD63IDs72mkXi9G0Iydoh0Buvo7x2GHHx0kV95sjiasIcYeXT2CX4EXMFttTgPETwCQSXu9St
	Wmx/pugwWmVbq7MDtDz75Icp+h1F4QF7K3kkFxrlUAe6YsO/Oww==
X-Received: by 2002:a05:620a:2903:b0:939:13a7:70f0 with SMTP id af79cd13be357-939802f7939mr2480362785a.5.1788794166583;
        Mon, 07 Sep 2026 08:16:06 -0700 (PDT)
X-Received: by 2002:a05:620a:2903:b0:939:13a7:70f0 with SMTP id af79cd13be357-939802f7939mr2480332385a.5.1788794164195;
        Mon, 07 Sep 2026 08:16:04 -0700 (PDT)
Received: from [192.168.1.62] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fbe31c6sm913141485a.46.2026.09.07.08.16.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 08:16:03 -0700 (PDT)
Message-ID: <3b01d1c8-c207-48c1-8700-0e7b350aecf5@columbia.edu>
Date: Mon, 7 Sep 2026 11:16:02 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] isofs: convert the zisofs read path to use folios
To: Jan Kara <jack@suse.cz>
Cc: Matthew Wilcox <willy@infradead.org>, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260906-isofs-zisofs-folio-v1-1-cbea614a773f@columbia.edu>
 <4cnybzi6btbswplm6xeuamkxf7k7a7hlvw5oa4urst6tltbw4x@77nu26jpv5oq>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <4cnybzi6btbswplm6xeuamkxf7k7a7hlvw5oa4urst6tltbw4x@77nu26jpv5oq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6fQv1CCaAPLfrFpUUMbva7J9ci7NZ69d
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE2OSBTYWx0ZWRfX7eSpXiPIvJ3R
 CdW5p9XFHWMj9156CY/DDqsRTZhMnS6Y7lwLIqZBEgtZ/y4V9/96EZljx+Db0iGEJv5iJAxiDFQ
 h7Xnptcjhsi412UhI2fRIkDic4QQUB2BSSxntf+Gl7uzNrN2N0JI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE2OSBTYWx0ZWRfXyMi8Tw0As0hP
 TkDGTZn8Wm8CR7/LbrG60oTzVNvImRcaDuM0wNz0OHf8J5OsJ/SJwP1gMShv1tbKZn2NN+NUFYt
 v0Vg4WDyrp9EZZSV+146z3hMJ3K+OYFAaxV61l2Dn17riKEn60dlp0B25FBdehDYF21Nf0VS/JO
 tPYbMFm2vA5SzeueQbmn4dxwA5/7F48pdMoDlcf9KlyVHoXu80ZQRS8AA9qKId4XkZbU2gpQDKf
 mdryWltl6jBK9lnauyV43j93tasHyyBjjY6OP3033EbQ3ztZv4LrjeIwf7mudnmr9bAURKUrf2S
 fJWAoeEM3qzqyt5orl9Uqv8B6OqaJACbb0iN6I2MZuxMetYe5PhGNJH4hFe9HkKHRWWhN+//Zk1
 DRs+7RAHRVydc0tvFJrWfm5Iw7XKwnDKJiRgK32SNA1+lkyuGPfbiVZ9lOoFr1Vy0Wfs7frw6LH
 UUwgjSI0vHJR/65o4BA==
X-Proofpoint-ORIG-GUID: 6fQv1CCaAPLfrFpUUMbva7J9ci7NZ69d
X-Authority-Analysis: v=2.4 cv=bvd8wkai c=1 sm=1 tr=0 ts=6a9ed537 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=iox4zFpeAAAA:8 a=pwd4NrRpc-W-YhxAJzsA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 malwarescore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 impostorscore=10 phishscore=0 spamscore=0 adultscore=0
 bulkscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070169

On 9/7/26 12:34 PM, Jan Kara wrote:
> On Sun 06-09-26 22:14:59, Tal Zussman wrote:
>> Store folios in the array that zisofs_read_folio() passes to
>> zisofs_fill_pages() and zisofs_uncompress_block(), use the folio APIs on
>> them, and grab the folios with __filemap_get_folio() instead of
>> grab_cache_page_nowait(). This removes six compound_head() calls, from
>> page_offset(), the three SetPageUptodate() calls, unlock_page() and
>> put_page(), and the last struct page usage in isofs.
>> 
>> grab_cache_page_nowait() passed FGP_NOFS as well, but FGP_NOWAIT already
>> prevents reclaim entirely, so leave it out, as FGP_NOFS is on its way
>> out [1].
>> 
>> Change poffset to be unsigned int rather than just unsigned while at
>> it.
>> 
>> [1] https://lore.kernel.org/linux-mm/20260830041901.2668-9-willy@infradead.org/
>> 
>> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> 
> Thanks for the conversion! The patch looks mostly good, some smaller
> comments below:
> 

Thanks! Will adjust all of these and send v2.

>> @@ -66,11 +66,12 @@ static loff_t zisofs_uncompress_block(struct inode *inode, loff_t block_start,
>>  	if (block_size == 0) {
>>  		for ( i = 0 ; i < pcount ; i++ ) {
>>  			unsigned int off = i ? 0 : poffset;
>> +			struct folio *folio = folios[i];
>>  
>> -			if (!pages[i])
>> +			if (!folio)
>>  				continue;
>> -			memzero_page(pages[i], off, PAGE_SIZE - off);
>> -			SetPageUptodate(pages[i]);
>> +			folio_zero_range(folio, off, PAGE_SIZE - off);
> 						     ^^ perhaps
> "folio_size(folio) - off" here?
> 
>> +			folio_mark_uptodate(folio);
>>  		}
>>  		return (((loff_t)pcount) << PAGE_SHIFT) - poffset;
>>  	}
> ...
>> @@ -119,9 +120,11 @@ static loff_t zisofs_uncompress_block(struct inode *inode, loff_t block_start,
>>  
>>  	while (curpage < pcount && curbh < haveblocks &&
>>  	       zerr != Z_STREAM_END) {
>> +		struct folio *folio = folios[curpage];
>> +
>>  		if (!stream.avail_out) {
>> -			if (pages[curpage]) {
>> -				stream.next_out = kmap_local_page(pages[curpage])
>> +			if (folio) {
>> +				stream.next_out = kmap_local_folio(folio, 0)
>>  						+ poffset;
> 						  ^^^ this is just:
> 					kmap_local_folio(folio, poffset);
> 
>>  				stream.avail_out = PAGE_SIZE - poffset;
> 
> And this would be probably more idiomatic as "folio_size(folio) - poffset"
> after the conversion.
> 
> ...
>> @@ -289,9 +292,11 @@ static int zisofs_fill_pages(struct inode *inode, int full_page, int pcount,
>>  		cstart_block++;
>>  	}
>>  
>> -	if (poffset && *pages) {
>> -		memzero_page(*pages, poffset, PAGE_SIZE - poffset);
>> -		SetPageUptodate(*pages);
>> +	if (poffset && *folios) {
>> +		struct folio *folio = *folios;
>> +
>> +		folio_zero_range(folio, poffset, PAGE_SIZE - poffset);
> 						 ^^^ again
> folio_size(folio) here?
> 
>> +		folio_mark_uptodate(folio);
>>  	}
>>  	brelse(bh);
>>  	return 0;
> 
> 								Honza
> -- 
> Jan Kara <jack@suse.com>
> SUSE Labs, CR
> 

