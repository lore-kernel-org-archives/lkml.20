Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5BF3F9F2E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790206681; cv=none; b=h7hzB20Wh6ibeQytS1M+BXvhUu4SkporzlQ3sxsvJuWcytCxCGjMIx2bKuly6k/fYqLpZETCn3bQl/8Ov26koN20P7alFCV5IE4KajWv6zvIMC/bXkTrC+ftVjEAAr/p2KwPkgVZ00HiqUoC4Xx9VVdJepIQhp1HxaBCld5p14g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790206681; c=relaxed/simple;
	bh=dcfmSxn+2CV96ThFPMNpllLM7s3GmJ078hKUMBhwuNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OC6mKgpmeyIB+a55pnJU70jU9bjnSpzEMz9PTRuWEXU1fdMS1E6LYj7AUyNbkqkLBVJEbvEbZQ/yY8KUkuZFGuPyKbxWV1jUWxzdoaFROewKWYYccy8D4f58ORSjgIBBWzUVQOmWrEz4B6mgEU76AhYrq/iyqEJKcD9pG0Y75cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Zfpy4QsH; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=RX56wHae; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Zfpy4QsH";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="RX56wHae"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NNCOAF3593984
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:37:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=Fre1
	WHO0lJlp8NzPGt+Dbdc0Mc7dWtqphdMSVSo23R0=; b=Zfpy4QsHvaaLa94MobnT
	kwCXTAddtrnNxbwBhiy+m6KzVoOlqE15kvem3FlO+h0otn4GKNJTj/rQjusGjhYZ
	tj3ALk3Lz1bNp2WbDLrOi1AfZcrgEyzmfKtkc3WSn+f5cW/kRzjwMeHnn//mjwEA
	96XllbxosC+Lb80brveDd5koiLolwKrdEJeMvYg5K3AZetdtFfTdTEnPNsCOQBrr
	WR8inS14amtV0eUyJjsnJw/F7hAjEfrNfVbscvsU//SB+xoXp1XmcdNNq14yvcVt
	EfjHnJmAGR92wYVAy2alWJumy3Q7Nu+gYV1bDhfKBefSvywfpQZgIiuY07HIZbbf
	9A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gvhw6v32w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:37:53 -0400 (EDT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so2724075a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1790206672; x=1790811472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fre1WHO0lJlp8NzPGt+Dbdc0Mc7dWtqphdMSVSo23R0=;
        b=RX56wHae1nIB1QlA+wG6Npwytb5d1421P6jq8gi5Km3m1MU6eGWDopKFmrPkQnEwqU
         b10ykrNqr5JYo1w7drNGuWRgFChf/TSGbD1ubNrMO5AFD28NrSN7rcFb+BP7GEv6zpxF
         JsWdEaRddc5Ct+waJ5rgV+4pYWMdgIEE3JWUz5Ha+prS3X2mLdag8BFC25HWdfDl69Nf
         Tu3B29iz7dEFlC5QGmlSRhpasPynDgFdfhhD8fMa7CwpKIx5wTQxlmfJCcT0bvBAXyTk
         vymg28ppdZCxyVMjCKHEqRTBKNZG2tniKfotB5tLnhKPlq8eWxikUKAhQCOEFsSSBQ+B
         zi4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790206672; x=1790811472;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fre1WHO0lJlp8NzPGt+Dbdc0Mc7dWtqphdMSVSo23R0=;
        b=FxKIKyyWpF2HHwv4N6U+9yPNjFKITedjevHCFNz4/OERpdWkQTVQ5k2FLI41u9t+RJ
         RuL7CRvLIUgUpFacN0og2wnN4uIv/r8YLHMfmF08MvQtgWNmJswGI01Svo3PJF7Cx2Bi
         x3APNdnhuXRMFJf1aJ9cUlyvNenyH/CdgLiF/25rxvHahQ51n4vV8LEmJpPfRN0Yq72r
         LVfYXgWJZL/ikljRW4J/dOVmQyOQxDuN520AlQoAcWXpoUSkawH0pfviIzRjbG5gY2Jc
         x2VyHbV0psl7o2x/8aQBz0KO94tHT9NGSTfugqtBDI39uudd3ruTMV8mBDeo/DW4ozGj
         D+qg==
X-Forwarded-Encrypted: i=1; AKwUvBwsrRje1YWbBEWAPGFMRC8Zexl5ccGDW4fWF7H/SRMPrhxpgatQdDxSiZ8jaPgbwlEpyuNuTROGZdyvwmI=@vger.kernel.org
X-Gm-Message-State: AFuF++laMS2NLT4FdtWusMRthkt2JPoxgwr144sm33K/GdOJoYOd9RGe
	R5soVTv+RbmIV4jBUtulS3OKpROYMBbefF1h4OwcyZRxau/fUEAujnAXaWsPlOPdPXacWhrEzHV
	ska0PLT6oQW3V6v5JEjM3HE5QFGEIR+EQhIuydXUc84thzZNVLZxqaJk7Eu+6Eg==
X-Gm-Gg: AYBFou04eJis98DwdKWjVXYiq6J7FbM2sJfb+wgdqYLyeoQekgo4xs0J2p0CmNnqrC9
	GI6k6xsBnzBNsXVCA3wlWEklAa5CCSSlWWmhemOMd4+No0/7wZosz5u84DdSV7kYOWkeEoswipT
	YTbgNYfmcHmrvjobtyIPUDgj1/8ONuqog5myTdw8lrsh0//eTujRbjEIXNiCLC9U2elgpNtrRvb
	NZsjaxIQmJ++OJj9sPxdauXh578m13FCGQ430EdHBEWq+nzdcV/32LZH6wbM8I1kFIG1wuzVzgo
	xVVx21u7WLxcsoNjr8CsO3pPOpH9lCYhRWdsZRs7Gpg7L3Vro1g/lR6G90VAoziDZNjflRVtAoQ
	xaQIGKghGy081g76sANYRSR/BvXtvTp9lx2YaHfHtq2VhVDmxdg==
X-Received: by 2002:a17:90b:4c0a:b0:39e:6a80:b792 with SMTP id 98e67ed59e1d1-3a098728e24mr545490a91.34.1790206672573;
        Wed, 23 Sep 2026 16:37:52 -0700 (PDT)
X-Received: by 2002:a17:90b:4c0a:b0:39e:6a80:b792 with SMTP id 98e67ed59e1d1-3a098728e24mr545473a91.34.1790206672082;
        Wed, 23 Sep 2026 16:37:52 -0700 (PDT)
Received: from [172.16.0.184] (RED-LION-HO.car2.Seattle1.Level3.net. [4.53.155.98])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976ca5f9sm1275340a91.14.2026.09.23.16.37.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 16:37:51 -0700 (PDT)
Message-ID: <eaac7a07-db86-41c5-9fdc-0e9ad142c5ec@columbia.edu>
Date: Wed, 23 Sep 2026 16:37:50 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] block: fail a short atomic pin in
 bio_iov_iter_get_pages()
To: Hannes Reinecke <hare@suse.de>, Jens Axboe <axboe@kernel.dk>,
        Christoph Hellwig <hch@lst.de>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Hannes Reinecke <hare@kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        John Garry <john.garry@linux.dev>,
        Christian Brauner <brauner@kernel.org>,
        "Darrick J. Wong" <djwong@kernel.org>, Keith Busch <kbusch@kernel.org>,
        "Martin K. Petersen" <mkp@kernel.org>
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>
References: <20260921-blkdev-fixes-v4-0-e2801f71ede9@columbia.edu>
 <20260921-blkdev-fixes-v4-5-e2801f71ede9@columbia.edu>
 <341ec217-4b3b-49aa-9481-4cf7e8952228@suse.de>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <341ec217-4b3b-49aa-9481-4cf7e8952228@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA5NyBTYWx0ZWRfXyeFd1kfLtz4/
 l3Cj1sF31x7+5/THd8SkTcLRzFUxN6abH1GrK1SAmb11PmEg/vgMzmrNHnw73qs25kkf52shs7c
 s2DdJtkp5yIRJtRcLjax3kislciQ0j6Zt/SG3ZcMgoq0cQXllA3x
X-Proofpoint-ORIG-GUID: 7BNfxLII0pfnmlhBqo-hJtuGDmqYbOgE
X-Authority-Analysis: v=2.4 cv=HcaB3SE8 c=1 sm=1 tr=0 ts=6ab462d1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6aZ3Ysb2zzbY2sELL/OBJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=XJsBi8-B-AtTf0VDNmMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA5NyBTYWx0ZWRfX2s0jvMUgA9qF
 RGdcMnL2TxYBixZ4I8hzUXHK2DisupV/wzxVhAuumr+vrnlYorySnKLYS5TMCddMe/s9r/2Zsy+
 CgZlzdJliPtBNNpPSGM/j+sHdOQYQyY+sgezeP+277k4jTG3zg3TxE2JWKptFz9XVLJNGjZPMfq
 ICpk5aILeCjdbRzDwqNP86mca39xll8Uo8hF1DjZ2+np6Ej6YKB8iQP9lJxB5/jtj5NZ8KCvTIn
 Yd3twwSprOiWb0akl5lCDCC1ZGZSVLvcNp9d+evh4fRgsIYL9qzIY57d3k32r3JVE/5MmDHbtWd
 B9l0eXPVEPtjvsoAPTZWnzlaR2Z+pUq+MiW6oKCiwHX/IBOAPyNXmoJbcgmoW0a/uA0SQ7FIijy
 jb41pKaB4V2A2uDtRhM4dB5VxaOWzTZi2NINUDtKT/lC4DRjcXGsXIjNEuO0z/189SQyZmVQg2U
 qDm5m/zLCDbTLnu/H7w==
X-Proofpoint-GUID: 7BNfxLII0pfnmlhBqo-hJtuGDmqYbOgE
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11914
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=10 spamscore=0 priorityscore=1501 impostorscore=10
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230097

On 9/22/26 1:40 AM, Hannes Reinecke wrote:
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
> I would swizzle the use of 'ret' and 'size' here; leaving 'ret'
> untouched and use 'size' as the new variable. That will reduce
> code churn and makes the patch easier to read.
> 

I'm going to leave this as-is per John's previous request.

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
> Otherwise looks good.
> 

Thanks!

> Cheers,
> 
> Hannes
> -- 
> Dr. Hannes Reinecke                  Kernel Storage Architect
> hare@suse.de                                +49 911 74053 688
> SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
> HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
> 

