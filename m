Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908D737E5CD
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789332536; cv=none; b=apSE77cA6ACfD7G7HxZqyjAobCp5I+RiA3QNAN+GTPkmAIw7q4v44tn6Yix4VvMLRwAQEgWVVUlFVK3uk1kpRvS5Su5yCcbDqp5snUE1qm2A4u8XyvL3wbAIx2nQVP9CHUWYMW8u+BnKsCFFD0pdygJrOzm7v6/i9r7gJQc9wj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789332536; c=relaxed/simple;
	bh=jNktfU01Q6v8BeOxXFRVg2oNH2zs4bUdwqB62DJYJLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A4R9C0zVJR0uGab3+Xbl3NlNiR7e4yR4OQcQs17VEzF/vr77WBsC6cmD7rqZo9V/A0ycdOIi2UmfrpNRgAgAI/2Sj9b8zuLbtT5atSZ7RAxNQ0trVFk2zCVmJ8YfFpdpbA9/fdi1hF9kjAuwAhaAHHmCf5fPSuk8MH3pfd2yTk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=WWC1O2Tf; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=g7oGp8/6; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="WWC1O2Tf";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="g7oGp8/6"
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DKYGPl167732
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 16:48:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=kYI3
	BJ9us2xWooOzNBkoKwDkHgn3fqVTqLq0nuNXlvo=; b=WWC1O2TfRRKtTPV1e1vA
	XEzTCSpKYHw7BEEqISqU49QlQ348y0nzIGuCifVaMsvQGsqVDQGcNiENNH1Pnf8G
	kWREgukKIy1gEaqM8nliS/scntd3bnqBGjJg1XIv+Mfuy0lj6kTMDfyYASFbI0AH
	CgVsPPauvnuPDg7o/SwTg54ZbOa8QmzCPilj5l/jvSDuvfBpTeWCSrmMkP90Ld+L
	AsJV433Y9s40Gdkz33jU+kHAM4raRlIlSmY9RKRJyiuWPEALKRJ3dm7Jp7gSrjGQ
	knL7lp29PWOrO+A4g2j2GjZPNPEEGOVf9xtv+MLZ6RSKjqS3FB0yJYfAWxRqfZ/5
	6w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gp0qarkus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 16:48:47 -0400 (EDT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90ceabcd64aso61819026d6.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 13:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1789332526; x=1789937326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kYI3BJ9us2xWooOzNBkoKwDkHgn3fqVTqLq0nuNXlvo=;
        b=g7oGp8/6V/RMG0EBCI4vhrBac+tVm+azsBlEYiBF7ua5JT+daad9O+CjAGxlUlO3ah
         qcoL6LKgzUUqpPPBRuUSsX74GqUEvsZIMabBGQP/uXBYeTBYzdsrjoQuXx+8/IYsCezS
         9FM+pisN5PwcZmVYU6aA7UMFjQIcjoPREPP+wMKQe0HnvqkfwYDHnyhmzUZqqcAFrtdi
         UzdUx5v9bkHDVPJjhcXSWt59/KdXHYE9Mpfkgz7Z3DxiMmHpP+BKLtaSZgVEnJj7v1nm
         8mYnXzhqcpjr0UbiNddddxq6awAG4DbCGTOnGjoiHyaKtb6+qzcmzLQWT3uLF6jXDG+P
         FXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789332526; x=1789937326;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kYI3BJ9us2xWooOzNBkoKwDkHgn3fqVTqLq0nuNXlvo=;
        b=VeenwMxJfmMaxf/QSdrZZbeyzKkhX2ZUvrKkBjMISPtabSUlr02oGhj9wk+EXXR/49
         OlzxxkcjGPn5k2cu+aloRU4u9PIcVLCVRAgjJX+eftNjVp4Q1gX+5UIBYnuSebGT/+RL
         EolHPFunrWsVZiIpoUgkAnczEiWb6TO68eaOKxP3AAFdTgGvsOduXIFWGkyOUtm/sdTO
         DIH8CZ2jlexqfFYuqWIwjlb8s8c58X7c70duVQYvsGgmUVRooS0IEGg/+phH+BvKzRli
         t5qEPHiRvh8sbuV03GW7K8sUIMahNaYCqXz/pdAgPACHGwjdd7KrtrKIFCocU7jwsreV
         80ug==
X-Forwarded-Encrypted: i=1; AKwUvBy5Uqh3IF7DpdWqq4TLBvs9a82Tid7jjZY4vRVr9xEE35XCufksFB55Z8WFOqJkEFfaZwUEfCWBJXeaIuA=@vger.kernel.org
X-Gm-Message-State: AFuF++mlWovsPZVSRurHjmDawM0tQxbRBtjM+8GuLQKuTA///+c77foC
	TalOO2fJtO244YAtWvTCegxRInw7XG/cQeC4DCr8e5nqwUKarLP4OiKIPlYKAj02TZ9oH74gcun
	EqbVr5x4LhcrySWvEyYJgNS0okDGPHPs+v7rNLMs8k4R+X2s6e12XeRZiCrK3FA==
X-Gm-Gg: AYBFou0ac2POFt2OJ2GkEniMZBQOxiBn8yosz09gCcq1SmI/LrNcstTd5erc7iPnYKz
	gTQb+/34Bo/uiBP/kl7khBg77JayIbjH2G8jx8oz360NWEVp5oKfMMMhe5q3pkkz8DIpc3gamg6
	6UWpUWV2SaJizO2wQ85It+g9K+cYUxx0zKGoKrE1Zhd0v4Kj3/UZLFsx6twPvTvklbBt+NvP+6M
	rf+/JBJ25PV0wMfU1bu6OjVGg6LuECnVQVubBvHuP20iJvVbIAR1h1C2R7O0KIFKr2F021pem0i
	FBCsghF57e43dkayYIsaThk9mDtFGQvEnV0VSxzsPF6MCyxK2FoP/xEi7v++yB3ecVu7maLUHr+
	SDvAm9ONzR2LvF5x2h8F79U+DRA3kiyFa1dFg42H5c/vHV8NBlDZFTal18A==
X-Received: by 2002:ad4:5aa1:0:b0:90e:9875:b48c with SMTP id 6a1803df08f44-9121da2f1a5mr132358586d6.12.1789332526448;
        Sun, 13 Sep 2026 13:48:46 -0700 (PDT)
X-Received: by 2002:ad4:5aa1:0:b0:90e:9875:b48c with SMTP id 6a1803df08f44-9121da2f1a5mr132358346d6.12.1789332525965;
        Sun, 13 Sep 2026 13:48:45 -0700 (PDT)
Received: from [10.207.49.22] (nat-128-59-179-215.net.columbia.edu. [128.59.179.215])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f49414csm76942356d6.34.2026.09.13.13.48.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 13:48:45 -0700 (PDT)
Message-ID: <ce14fa29-052a-4473-b3fc-ce3f0d20ef79@columbia.edu>
Date: Sun, 13 Sep 2026 16:48:44 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] block: fail atomic writes instead of falling back
 to buffered I/O
To: John Garry <john.garry@linux.dev>, Jens Axboe <axboe@kernel.dk>,
        Christoph Hellwig <hch@lst.de>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Hannes Reinecke <hare@kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        John Garry <john.g.garry@oracle.com>,
        Christian Brauner
 <brauner@kernel.org>,
        "Darrick J. Wong" <djwong@kernel.org>, Keith Busch <kbusch@kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>
References: <20260909-blkdev-fixes-v3-0-1a5222c6e8ad@columbia.edu>
 <20260909-blkdev-fixes-v3-5-1a5222c6e8ad@columbia.edu>
 <6db46600-0e39-4924-b006-92ceb9fcf5e3@linux.dev>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <6db46600-0e39-4924-b006-92ceb9fcf5e3@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI5NiBTYWx0ZWRfXwF3NY2/oUzEA
 kdUei9lIQvYiONYZB5TVmvbenfghQthxQhhvEyHNg0NzXCgGRO0J9aB2LgaSH+umDc9EeNxzwah
 gwldPTkuXoRLm4Oe1Iap5YN/xOWuBfxk10NL6p6/l9znqygIcS31RdaAkbfwExxtlJrt0SOa5dz
 HIKzHObcQ3zl/BtbMySCSXLnIf6M+fbYeA0GSdoevY/usrkaVdVCcHi9YigvgTSXRI2PP4tzNJ7
 l5qP2Fi9DDVYwU1UjwC5ZS1OL1om1aL6asKMfdd2FSnW7mo1WdUUf2QLAOMAgwVcSAvy/OxLLM3
 0yrlxwJ5L0W5JCWu5yLYK/2GdHZlRGwoM4qUuOIAAv8UYelxk03TzbZ5k29BNdWRR9igIXMolmO
 LTmTTpxuxMp5CNja/fLgh9lK61Q7Kfmdf23ODd8GEeEisB9oAD9rZzDlADYld9xUPZNp4mRXvaq
 JX4UTzOtDDT5G1E3ACw==
X-Proofpoint-GUID: cC_LHZnVg2q2-vOyAW9HTJopMBqjpY0v
X-Authority-Analysis: v=2.4 cv=XvBvqlF9 c=1 sm=1 tr=0 ts=6aa70c2f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=2jelXx5xVcRIF5zNctN5Qg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=vhXS0Idcg_wXRw0PNncA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: cC_LHZnVg2q2-vOyAW9HTJopMBqjpY0v
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI5NiBTYWx0ZWRfXxsvg3h8e4pto
 rDg7e+aOQDM0dfXaKQVnaxLXjYYTGurDD1NKUzWbsNH+DZQtiOIkWgMdQlurtOBsLEAxmh/bBJ5
 IZOtnezpEa4dzL6Jwn7XJrncRSzOfXvzPWRoay+vriB7nIYZ6g0l
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11904
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=10 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=10 lowpriorityscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130296

On 9/10/26 2:40 AM, John Garry wrote:
> On 9/9/26 23:05, Tal Zussman wrote:
>> An IOCB_ATOMIC direct write to a block device can silently lose its
>> torn-write guarantee in two ways:
>> 
>>    1. blkdev_direct_write() turns an -EBUSY from page cache invalidation
>>       into a 0 return, so the whole write is retried through
>>       blkdev_buffered_write(), with no atomicity guarantee.
>> 
>>    2. On a partial page pin, __blkdev_direct_IO_simple() and
>>       __blkdev_direct_IO_async() submit what was pinned with REQ_ATOMIC
>>       set and leave the rest to the buffered fallback.
> 
> This really should be 2x separate changes - 1x for fops.c and 1x for bio.c
> 

Will split for v4.

>> 
>> The second case can be triggered deterministically. A 16K
>> pwritev2(RWF_ATOMIC) whose last page is PROT_NONE, on a scsi_debug
>> device with atomic_wr=1, completes short with only three of the four
>> pages written, violating RWF_ATOMIC semantics.
>> 
>> Fail the I/O instead. Make bio_iov_iter_get_pages() release the pins
>> and return -EINVAL when a REQ_ATOMIC bio doesn't cover the whole
>> iterator, since an atomic write is submitted as a single bio and a
>> short one would be torn. That covers iomap as well, where a partially
>> unmapped buffer could trip the WARN_ON_ONCE() in
>> iomap_dio_bio_iter_one(). The async block device path currently sets
>> REQ_ATOMIC after pinning, so set it before.
>> 
>> Skip the buffered fallback in blkdev_write_iter() for IOCB_ATOMIC, as
>> it already does for IOCB_NOWAIT, so the -EBUSY case returns -EAGAIN and
>> the caller retries, matching __iomap_dio_rw().
>> 
>> ext4 has the same fallback and only warns in it. For block devices both
>> ways in can be detected before any I/O is submitted, so fail early instead.
>> 
>> Fixes: caf336f81b3a ("block: Add fops atomic write support")
>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>> Link: https://sashiko.dev/#/patchset/20260802-blkdev-fixes-v1-0-a82fc549fd74%40columbia.edu?part=2
>> Assisted-by: Claude:claude-fable-5
>> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
>> ---
>>   block/bio.c  | 29 ++++++++++++++++++++++-------
>>   block/fops.c | 10 +++++-----
>>   2 files changed, 27 insertions(+), 12 deletions(-)
>> 
>> diff --git a/block/bio.c b/block/bio.c
>> index 898b2f5ef8c8..63e266d861f1 100644
>> --- a/block/bio.c
>> +++ b/block/bio.c
>> @@ -1284,6 +1284,7 @@ int bio_iov_iter_get_pages(struct bio *bio, struct iov_iter *iter,
>>   			   unsigned mem_align_mask, unsigned len_align_mask)
>>   {
>>   	iov_iter_extraction_t flags = 0;
>> +	int ret;
>>   
>>   	if (WARN_ON_ONCE(bio_flagged(bio, BIO_CLONED)))
>>   		return -EIO;
>> @@ -1303,34 +1304,48 @@ int bio_iov_iter_get_pages(struct bio *bio, struct iov_iter *iter,
>>   		flags |= ITER_ALLOW_P2PDMA;
>>   
>>   	do {
>> -		ssize_t ret;
>> +		ssize_t len;
> 
> iov_iter_extract_bvecs() local variable is called "size", so maybe use
> the same here
> 

Will change.

>>   
>> -		ret = iov_iter_extract_bvecs(iter, bio->bi_io_vec,
>> +		len = iov_iter_extract_bvecs(iter, bio->bi_io_vec,
>>   				BIO_MAX_SIZE - bio->bi_iter.bi_size,
>>   				&bio->bi_vcnt, bio->bi_max_vecs,
>>   				mem_align_mask, flags);
>> -		if (ret <= 0) {
>> +		if (len <= 0) {
>>   			/*
>>   			 * A misaligned vector fails the whole I/O.  Release any
>>   			 * pages pinned by earlier iterations before returning
>>   			 * since this bio won't be submitted to release them.
>>   			 */
>> -			if (ret == -EINVAL) {
>> +			if (len == -EINVAL) {
>>   				bio_release_pages(bio, false);
>>   				bio_clear_flag(bio, BIO_PAGE_PINNED);
>>   				bio->bi_vcnt = 0;
>>   			}
>>   			if (!bio->bi_vcnt)
>> -				return ret;
>> +				return len;
>>   			break;
>>   		}
>> -		bio->bi_iter.bi_size += ret;
>> +		bio->bi_iter.bi_size += len;
>>   	} while (iov_iter_count(iter) && !bio_full(bio, 0));
>>   
>>   	if (is_pci_p2pdma_page(bio->bi_io_vec->bv_page))
>>   		bio->bi_opf |= REQ_NOMERGE;
>> -	return bio_iov_iter_align_down(bio, iter,
>> +	ret = bio_iov_iter_align_down(bio, iter,
>>   			&bio->bi_io_vec[bio->bi_vcnt - 1], len_align_mask);
>> +	if (ret)
>> +		return ret;
>   > +> +	/*
>> +	 * An atomic write is submitted as a single bio, so it has to cover
>> +	 * the whole iterator or it would be torn.
>> +	 */
>> +	if ((bio->bi_opf & REQ_ATOMIC) && iov_iter_count(iter)) {
>> +		bio_release_pages(bio, false);
>> +		bio_clear_flag(bio, BIO_PAGE_PINNED);
>> +		bio->bi_vcnt = 0;
>> +		return -EINVAL;
>> +	}
> 
> This all looks ok, but I'll check again ...
> 
>> +	return 0;
>>   }
> 
> iomap_dio_bio_iter_one() can be updated at some stage to remove its own
> check for improper length returned from bio_iov_iter_get_pages() for
> IOCB_ATOMIC
> 

Yes, although I think bio_iov_iter_bounce_write() may need to have a
similar check introduced before that can be done, but I haven't looked at
it closely enough yet...

>>   
>>   static struct folio *folio_alloc_greedy(gfp_t gfp, size_t *size,
>> diff --git a/block/fops.c b/block/fops.c
>> index a3a709697b40..0b614d76d128 100644
>> --- a/block/fops.c
>> +++ b/block/fops.c
>> @@ -341,6 +341,8 @@ static ssize_t __blkdev_direct_IO_async(struct kiocb *iocb,
>>   	bio->bi_write_stream = iocb->ki_write_stream;
>>   	bio->bi_end_io = blkdev_bio_end_io_async;
>>   	bio->bi_ioprio = iocb->ki_ioprio;
>> +	if (iocb->ki_flags & IOCB_ATOMIC)
>> +		bio->bi_opf |= REQ_ATOMIC;
>>   
>>   	/*
>>   	 * Users don't rely on the iterator being in any particular
>> @@ -371,9 +373,6 @@ static ssize_t __blkdev_direct_IO_async(struct kiocb *iocb,
>>   			goto out_bio_put;
>>   	}
>>   
>> -	if (iocb->ki_flags & IOCB_ATOMIC)
>> -		bio->bi_opf |= REQ_ATOMIC;
>> -
>>   	if (iocb->ki_flags & IOCB_NOWAIT)
>>   		bio->bi_opf |= REQ_NOWAIT;
> 
> I think that you relocate this as well to have similar functionality
> co-located
> 

Will do.

>>   
>> @@ -766,10 +765,11 @@ static ssize_t blkdev_write_iter(struct kiocb *iocb, struct iov_iter *from)
>>   	if (iocb->ki_flags & IOCB_DIRECT) {
>>   		ret = blkdev_direct_write(iocb, from);
>>   		if (ret >= 0 && iov_iter_count(from)) {
>> -			if (iocb->ki_flags & IOCB_NOWAIT) {
>> +			if (iocb->ki_flags & (IOCB_NOWAIT | IOCB_ATOMIC)) {
> 
> An alternative could be to have iomap_file_buffered_write() reject
> IOCB_ATOMIC.

Yeah, I think that could make sense as an additional change. But the check
here is nice because it stops us from taking i_rwsem unnecessarily and we
already need to check for IOCB_NOWAIT, so I'll leave it like this for now.

Thanks for reviewing!

> 
>>   				/*
>>   				 * The buffered fallback blocks on i_rwsem and
>> -				 * on writeback of the data it copied: return
>> +				 * on writeback of the data it copied, and
>> +				 * can't provide torn-write protection: return
>>   				 * the short direct write instead and let the
>>   				 * caller retry.
>>   				 */
> 

