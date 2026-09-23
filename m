Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B637B4334D0
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790206723; cv=none; b=UJDPTdLdM4MoL3B0dpnAb64RQkfSGX1cTcg5TQBd3NS0Z/k67dimTQbHgTHfl4m/fZqB9iaczG6nFsACh/xtjue18k2Tm3TG1IqbI9gM0NtZJ/aYK3ycYpViluwncPRK1fqEzfdA7Kl1nq5tDWrFaSm1eiM2/E5P84fSxghWNYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790206723; c=relaxed/simple;
	bh=uvjliwc5dWvX0yJGmF6xGGfU9SCVJG2FjlApdxVUrvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mE0AYJsaORzVTye7SeT/4dQMQgqh+ztsULtvHWPBrvEZsR1Ae2p7kOdfkZBa4BZ670hA3Vp3LF3a95DQ/8eWT8rUz8C6Kxued0D5yriLVmHKNdTKNCH0IjkT/BydfADyfm5VJIAGCq8KQzew0drF4oHD8UzFTDp1HA9n+YdDG04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Me/wKhQl; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=WfXwM2pJ; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Me/wKhQl";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="WfXwM2pJ"
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NNCd452685753
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:38:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=Zx+k
	9D7Ap9j3fQM34zf1zNWA4velobJXmZMpA1ZCyc4=; b=Me/wKhQlCxo5Q+vaKK3/
	3U89LdILpHbgrth1EogDPvG9ZC0Si92p6Q08KpCAX3c/+SveEg00n5BOi7wrh2Tt
	EYMpcd1V0gBBpFla3wdTGgbEZfrN2wDK608MJe+4VYoChSwhTBl/Pt/JvjciAtFH
	xe54ZTQprcEAkDR9+L8vPCXdsODKI9F9morl7a+0MRKwy2pRGKJEeEyy7LhttO+o
	7UAZKhKzON8V0GS1TZ8LI36p2XILUyvBPO9RdHHbXbj2ymNJ4A9rvc9/3dTG6LGN
	BvIdwusdP76MosdBu4XIXqblJMhaIk/CQpbdncF3G9AGBe8PprxJgJMeluSqoqXh
	zQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gvjfgbrhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:38:32 -0400 (EDT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so1399591a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1790206711; x=1790811511; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zx+k9D7Ap9j3fQM34zf1zNWA4velobJXmZMpA1ZCyc4=;
        b=WfXwM2pJpxwMBNHjGJAsp59DFhQt1dGXlet3mY61jeUnHXF6h09T4QjZJ9LPqsrKwt
         WjKeSkDt5aLTCjOzCSizZtxkaQG4MRFTTzBxQaruhjhr5Q0X29g9rQGfIHBWQmddmH7N
         jMkOv6FeevxRLFeOIcr1gHg3ASt2UZkAmCHd9efPNTXo4SfJTU8rHAMSdDEEsQfyrHnu
         oXeGsr04LhSwPXlX9WLRSDnuWZ4JfoeDt5TfyxbPh+U/Ch82DhbUTEXSSjC87468YmTN
         MVto9cOXavuUWKWbm188UI3lCyCRYiV79BPJGl7jsOj8i6pAvz4F/TliKF8hgSDcPw8l
         98OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790206711; x=1790811511;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zx+k9D7Ap9j3fQM34zf1zNWA4velobJXmZMpA1ZCyc4=;
        b=LGeaupFV+FFe3S4H/ZSK3w70vVe4o5EpLu6CzUm6ldUg29ESpxAaNrxKcMxAJQcXSU
         cKOvKBxqgfBHThe5XE0+wlwzjFYlyasVbUZL2bGDoQcUcuOakGAkqZBO5M9exFV73lw4
         glKFKhVgstRw7D5PhbuS4BaZiBtXnD0oZ3jdU1YTzVqheJXkEYbV+1g9mttP5E5KLLHo
         jOtnG3YhtjUvj8KymPqItMlbjx8UaCPmXM0fZTWJzcKo+v7BLfe2VeJMZplPTGQjsxt+
         O8HX1cfTQPXtR3QH4t7dlTv33uDwV4EYFQWAIssdsSpweswd0DAJf9U9qze3oIt2gQMp
         0fiw==
X-Forwarded-Encrypted: i=1; AKwUvBz1fQq/rlvuLITW9yNcm6WbUDYGGyLRJ4ot6hqFZrbO2gddTjw5NIhK8M05GKVeks7lm87eCMY/cl0j+vg=@vger.kernel.org
X-Gm-Message-State: AFuF++nl14OYoglfvrsus8ZofPVVUr/1PiPB0x7s8krW74jiS1fLDa6/
	hGRDLGpBKDiHafgPmEbzq80I+Fj39NrNbRTnSwkfMse3yURx4ghBisfS+TBcKxw7o+sxiLSeIik
	TLEBkNcmE8LOleLtVY0pWpNcXXbU/s9j6rl6SZO1xSdbcet2UY4GAEE+AU9xHAw==
X-Gm-Gg: AYBFou3mtwSJlzxGBTqhftVamRSZjGDh8DimKiRG5nIRXSzyQzSuiLbrVCnh8qN9vzY
	8W2/pMeXBfaCO6/lE98TsLsakw5Mw0haP8kGistAGhCxNJjNAkRZ64PLoysjgLN1UWx20P8W/qm
	UonB9/hu+V5IjjRsUFq02vV6MaPBYsy3YP4SNBS7OoziOflCWcafkNvepj5RHwC7zaRDrgzuAP7
	AaNJJyNvRujBBsoUW4GEjOCJssxJzwYONatYzDoY+gHOMyS9mR4LqxSfHRbwoqAQ6Ig6w+y1+hZ
	Sa12zuGE9FVgDCYbCVw4MUttupuIYgXBigbW3VTicqexYDRhxvD8y0ATmo2c5GsKscZyJFcw3yq
	U1wDZOVg6ZQXi1mSlmgRpgc6SF3ugYZlAIxLS7RQlgrW3tgMCrQ==
X-Received: by 2002:a17:90b:2f85:b0:39e:6a81:f348 with SMTP id 98e67ed59e1d1-3a098bb785amr470056a91.34.1790206711129;
        Wed, 23 Sep 2026 16:38:31 -0700 (PDT)
X-Received: by 2002:a17:90b:2f85:b0:39e:6a81:f348 with SMTP id 98e67ed59e1d1-3a098bb785amr470036a91.34.1790206710609;
        Wed, 23 Sep 2026 16:38:30 -0700 (PDT)
Received: from [172.16.0.184] (RED-LION-HO.car2.Seattle1.Level3.net. [4.53.155.98])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976ca5f9sm1277439a91.14.2026.09.23.16.38.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 16:38:30 -0700 (PDT)
Message-ID: <c911d621-2fda-4768-8c90-c46dcaa5dd0d@columbia.edu>
Date: Wed, 23 Sep 2026 16:38:29 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] block: fail a short atomic pin in
 bio_iov_iter_get_pages()
To: John Garry <john.garry@linux.dev>, Jens Axboe <axboe@kernel.dk>,
        Christoph Hellwig <hch@lst.de>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Hannes Reinecke <hare@kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Christian Brauner <brauner@kernel.org>,
        "Darrick J. Wong"
 <djwong@kernel.org>,
        Keith Busch <kbusch@kernel.org>, "Martin K. Petersen" <mkp@kernel.org>
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260921-blkdev-fixes-v4-0-e2801f71ede9@columbia.edu>
 <20260921-blkdev-fixes-v4-5-e2801f71ede9@columbia.edu>
 <07aced0d-35d4-4c4f-95e4-9d3168e24617@linux.dev>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <07aced0d-35d4-4c4f-95e4-9d3168e24617@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA5NyBTYWx0ZWRfX/0uwgYXOd5p6
 WNrMWhqVxb7vkGksnHk8luUIlEYDo+GeCRpTRGv2K6mlKanHxnoPbxKnuaQ1CHj4oPw8u/iSP8o
 PFja5P5IDwc2a1swtgiCPyvwvDkuEBw+8I6OdjN4+FmwHNkp+iE4vZtGyQ1UOyGLMKGIxXGZqgo
 t0iaf6UJLr06gVGlol+atxV8GW/NS+r7IH16VA3WBGSsdAUlUejKYQyDF9XmZa0SzXM09Bfn6Wg
 zXRX6rUGY/y9KjrqQL4hOEmRJRZcDkBQIADlt0sVWriHFMo8XivkHJM7opVKOi7mQ6C7SSKZD8D
 V9qgdbvDhORghDxYPFVTogELjZfcws3zTY5ZSTnxvwG9QQXoAByG6Pof77zVHiSyjIpc67uou2v
 TEsb8w0WKElGmcuh42dmvab94s5S1QwZF6CtqLS3iLc23aSsBVGOW3RRNPWkNprMaphlsFVlG/s
 8JK2SL/3dfjPl6Wjfxw==
X-Proofpoint-GUID: bJSsU55ZT-2RzPXCd-EJ45Roqqc8zfwN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA5NyBTYWx0ZWRfX9BXrY5tCrIQA
 bjn7EVsKq3UDZIxVmVCbLIaZ+cYnH+sBtVbC0ulefAq1PbVjL7YhI42edZB9vmHifZ0tADxlRPY
 qhHvPGsecQHx8vkvt5SF386e6n2kuhQWMaigztkOh7DL0QFq/Rr7
X-Authority-Analysis: v=2.4 cv=QqjLTlyd c=1 sm=1 tr=0 ts=6ab462f8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6aZ3Ysb2zzbY2sELL/OBJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=XJsBi8-B-AtTf0VDNmMA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: bJSsU55ZT-2RzPXCd-EJ45Roqqc8zfwN
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11914
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=10 impostorscore=10 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230097

On 9/22/26 6:16 AM, John Garry wrote:
> On 9/22/26 03:54, Tal Zussman wrote:
>> diff --git a/block/bio.c b/block/bio.c
>> index f95b63c0604a..14429a5d4e68 100644
>> --- a/block/bio.c
>> +++ b/block/bio.c
>> @@ -1285,6 +1285,7 @@ int bio_iov_iter_get_pages(struct bio *bio, struct iov_iter *iter,
>>   			   unsigned mem_align_mask, unsigned len_align_mask)
>>   {
>>   	iov_iter_extraction_t flags = 0;
>> +	int ret;
>>   
>>   	if (WARN_ON_ONCE(bio_flagged(bio, BIO_CLONED)))
>>   		return -EIO;
>> @@ -1304,34 +1305,48 @@ int bio_iov_iter_get_pages(struct bio *bio, struct iov_iter *iter,
>>   		flags |= ITER_ALLOW_P2PDMA;
>>   
>>   	do {
>> -		ssize_t ret;
>> +		ssize_t size;
>>   
>> -		ret = iov_iter_extract_bvecs(iter, bio->bi_io_vec,
>> +		size = iov_iter_extract_bvecs(iter, bio->bi_io_vec,
>>   				BIO_MAX_SIZE - bio->bi_iter.bi_size,
>>   				&bio->bi_vcnt, bio->bi_max_vecs,
>>   				mem_align_mask, flags);
>> -		if (ret <= 0) {
>> +		if (size <= 0) {
>>   			/*
>>   			 * A misaligned vector fails the whole I/O.  Release any
>>   			 * pages pinned by earlier iterations before returning
>>   			 * since this bio won't be submitted to release them.
>>   			 */
>> -			if (ret == -EINVAL) {
>> +			if (size == -EINVAL) {
> 
> *
> 
>>   				bio_release_pages(bio, false);
>>   				bio_clear_flag(bio, BIO_PAGE_PINNED);
>>   				bio->bi_vcnt = 0;
>>   			}
>>   			if (!bio->bi_vcnt)
>> -				return ret;
>> +				return size;
>>   			break;
>>   		}
>> -		bio->bi_iter.bi_size += ret;
>> +		bio->bi_iter.bi_size += size;
>>   	} while (iov_iter_count(iter) && !bio_full(bio, 0));
>>   
>>   	if (is_pci_p2pdma_page(bio->bi_io_vec->bv_page))
>>   		bio->bi_opf |= REQ_NOMERGE;
>> -	return bio_iov_iter_align_down(bio, iter,
>> +	ret = bio_iov_iter_align_down(bio, iter,
>>   			&bio->bi_io_vec[bio->bi_vcnt - 1], len_align_mask);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/*
>> +	 * An atomic write is submitted as a single bio, so it has to cover
>> +	 * the whole iterator or it would be torn.
>> +	 */
>> +	if ((bio->bi_opf & REQ_ATOMIC) && iov_iter_count(iter)) {
>> +		bio_release_pages(bio, false);
>> +		bio_clear_flag(bio, BIO_PAGE_PINNED);
>> +		bio->bi_vcnt = 0;
>> +		return -EINVAL;
> 
> There is some commonality here with iov_iter_extract_bvecs() failing,
> above *. You could add an error out label for both error scenarios.
> 

Will do!

> If that does not work:
> Reviewed-by: John Garry <john.garry@linux.dev>
> 
>> +	}
>> +	return 0;
>>   }
>>   
>>   static struct folio *folio_alloc_greedy(gfp_t gfp, size_t *size,
>> diff --git a/block/fops.c b/block/fops.c
>> index a3a709697b40..90777e8a9a6c 100644
>> --- a/block/fops.c
>> +++ b/block/fops.c
>> @@ -342,6 +342,12 @@ static ssize_t __blkdev_direct_IO_async(struct kiocb *iocb,
>>   	bio->bi_end_io = blkdev_bio_end_io_async;
>>   	bio->bi_ioprio = iocb->ki_ioprio;
>>   
>> +	if (iocb->ki_flags & IOCB_ATOMIC)
>> +		bio->bi_opf |= REQ_ATOMIC;
>> +
>> +	if (iocb->ki_flags & IOCB_NOWAIT)
>> +		bio->bi_opf |= REQ_NOWAIT;
>> +
>>   	/*
>>   	 * Users don't rely on the iterator being in any particular
>>   	 * state for async I/O returning -EIOCBQUEUED, hence we can
>> @@ -371,12 +377,6 @@ static ssize_t __blkdev_direct_IO_async(struct kiocb *iocb,
>>   			goto out_bio_put;
>>   	}
>>   
>> -	if (iocb->ki_flags & IOCB_ATOMIC)
>> -		bio->bi_opf |= REQ_ATOMIC;
>> -
>> -	if (iocb->ki_flags & IOCB_NOWAIT)
>> -		bio->bi_opf |= REQ_NOWAIT;
>> -
>>   	if (iocb->ki_flags & IOCB_HIPRI) {
>>   		bio->bi_opf |= REQ_POLLED;
>>   		submit_bio(bio);
>> 
> 

