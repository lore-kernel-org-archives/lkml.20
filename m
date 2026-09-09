Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EC2322C88
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788933842; cv=none; b=AuTmixUzGsDCi9JuSNa87385hA1uHVkNrBEw2/SLdBdMpNl1eBl79jDy3NY2Zm3xXDpKF6NXh4aRMF4j/Mn5q08y8B+j/0N/65uXLWezwAf21zENgqIaq9x7gUj0MgpTMtqCQ3V67ZrhnN8NKIqm16ZG30ss9vuOAEheWyEYd9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788933842; c=relaxed/simple;
	bh=xcuyhl9eQ2tGDEV2FKl7YFK2dioFXp6VQjtibFde8k0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KSq7sm4k8Ou+nmRYtEWaRC5zuyfyxM2SRHykjWMoD3Y87D7qABMTLjBHc4WHM1xqJf4rt6Dz5agqNkPHpQ8CppAWojgwC1wDw/3/ISQSS2UgcfFWIDxQcrx4NMQjgtzNGmd2197A14vi0bMvKWTaMja9nXBEFTV19rZ5j/yuQkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=on+rPIbK; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=ZwyNrMsy; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="on+rPIbK";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="ZwyNrMsy"
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6894ZlwR3247053
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 02:03:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=JD9s
	mCHI+SSIjWaqFBwOjwARRnBsMSzMXSmp0jGnZ1Q=; b=on+rPIbKxGOv9EwPYP0B
	MvKrPsJlmnzIacRHspNzH/Rt92c/EQZhD2MrXA/wlEJR9GWw4SOLnh7jL1HE2V0O
	H8BAjECNb0Z2DzswFqVu/NsjMjCyRHVcByH7MUY/GwslSM1csqmA5SzyTfXhLcjm
	0N+UlynG2tU0YUyq44+50Y6Btuq4NXlMSYmlOyWR71O9G0jmzFn/id7BlB/NdQdq
	TWuUFujeeGRdSXvquLpWQWiq7xqnQZ1cquQBvmS08FhPGcMNwcGnKapfu1I6I1k1
	/uhkK7G2EypuaO3w+PlK1I2G9/X8mpSXDgLYBACu2H1R1OgeIGjZSB5IoKYi7nk4
	6A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gjnn9ncr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 02:03:57 -0400 (EDT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93903622880so1052106285a.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 23:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788933837; x=1789538637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JD9smCHI+SSIjWaqFBwOjwARRnBsMSzMXSmp0jGnZ1Q=;
        b=ZwyNrMsyArHxK+tjwZ7VgLLKLrCfW3Cw/G1tzGCSE+8E+fbBRR1MWp3ciRegPYe0VT
         rYlDvQwDJoSimFEunCb5QwYwejvka9bP/uHo7PxX48N0RHBFL1sFI+WAEcoDArAMy8SV
         +1GOtFAPQzOKQvIWeO/PN9KJbjG0bdD7nF9+wtFqT7MAUrsLwe6enNTE4ktd/S1dQU2P
         VTxxHhI4FcbzTkzJuJCxy9Y4lpa7HKsmndUZcEjMZxt15Q/Dk/vw37kABonqrAgmiXcg
         kxCQGA0/butKnsz7Z44reA31vxZCwmD/4q4q5dsbR/kolPwgLqfh2uS1WPgld60UZYGW
         Amhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788933837; x=1789538637;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JD9smCHI+SSIjWaqFBwOjwARRnBsMSzMXSmp0jGnZ1Q=;
        b=G6qffxZngr+I2leFEd4eFPFIzzgBKbPuT9Ar+bo0TI91N1Hxsi0DiiDR41wWNOkWi9
         wmTi9VQ+XK66bzUet5C87nQ+2sIhZLGqGeG3qpv0El2o59Y6VIzl2vS6Xyq5i2CUQ783
         j13hm2PtHwOlq2PvbFi0GneIuNujuAFf/zOtwRmMP7akMHwZDd/082pYQ3I6UdvXmgKL
         jmVdRHR+eaw5H48ggV/VNAGT9r/63czTruEXJHmv0sljF8od7Pf1rIJtySgdlE1CdyCB
         WqP9yC5rcFk8fxpLUXjBpw+cac47v620QUTuBSlvAEvszcmxNi531x30qijwbtFqoKog
         lJaA==
X-Forwarded-Encrypted: i=1; AKwUvBzwtqedAQmOZ3D3XvLAjHVB/aVzh6O4Op4DfRk4rVA5lnvqQsDMdvjv7N9rVRyMqMdwb027jsJbEHm4HWg=@vger.kernel.org
X-Gm-Message-State: AFuF++lWS4rJI54jWappd/RONZcNHexc1JFtXchWQ6i2Wgnkee7Ipr+e
	q7EkeSwhB0MPDmKo0I22CGHiWM8BWoKE7nrmTmwOsj+r/5LJ+mne5zGVLIyIEgRbPSScBO3OLnK
	N+S/vJyqFyCjVXctW4fvlbtZExqxsBpEBHm+STpCSAapbBVRdoM6USvwWnp76zg==
X-Gm-Gg: AYBFou0LYI+rnm5R1dOo53EQ5Qu/6ZDKeFQIi+/X/WY87Bnu818HOXQedbmr1mcGPI6
	TF0jKLEXL7xvaEpiYPgVcFaFD1qReFtUvuR4BQdjMqke5npTCGMtXz7i0CgxM2/Mk2mIlCljzVe
	qn6m9KIMBAaKntnG9LhNQBf0IMdXvuAsIXhstdElP2gUmbNu4hAg11Y8GOYHQLRnsVQuxUIfCjH
	dT0gEYCs79bXO3f0Y/d7rxhBigZvVsvh/f3o2Dkk5Ex0m+WKa1hlwE7+gMxhzh/JHxxEeTR4JRA
	XyUYeDtQYAWXq9f50wz4JGLqupNFITUDWOr1WC6WzbKif8G+EQiyg6NDSSHcV5CJGpHRm9cv3GY
	V3etFzLXpp9fuYBfz26UJWaNsacuEJT88BZIgLSRU43xUqNFyl57825c=
X-Received: by 2002:a05:620a:4857:b0:939:5d22:d1f0 with SMTP id af79cd13be357-9396dead4a3mr2642638785a.2.1788933837490;
        Tue, 08 Sep 2026 23:03:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4857:b0:939:5d22:d1f0 with SMTP id af79cd13be357-9396dead4a3mr2642637385a.2.1788933836992;
        Tue, 08 Sep 2026 23:03:56 -0700 (PDT)
Received: from [192.168.1.62] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb6e95csm1314254685a.31.2026.09.08.23.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 23:03:56 -0700 (PDT)
Message-ID: <a8e91285-c1f1-4c3e-a3b3-b5f21d07a879@columbia.edu>
Date: Wed, 9 Sep 2026 02:03:55 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] block: fail atomic writes instead of falling back
 to buffered I/O
To: John Garry <john.g.garry@oracle.com>, Jens Axboe <axboe@kernel.dk>,
        Christoph Hellwig <hch@lst.de>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        Luis Chamberlain <mcgrof@kernel.org>, Hannes Reinecke <hare@suse.de>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Christian Brauner <brauner@kernel.org>,
        "Darrick J. Wong"
 <djwong@kernel.org>,
        Keith Busch <kbusch@kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        john.garry@linux.dev
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>
References: <20260828-blkdev-fixes-v2-0-32f3f40cebed@columbia.edu>
 <20260828-blkdev-fixes-v2-5-32f3f40cebed@columbia.edu>
 <a7752d1e-8ec1-44d1-a266-c287c315e8ab@oracle.com>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <a7752d1e-8ec1-44d1-a266-c287c315e8ab@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b5+CJNGx c=1 sm=1 tr=0 ts=6aa0f6ce cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=eLqeY6lZVrwov0sEPbwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: 9emaKL3oZTwSmyLrx-li9Oc9q7-AybTw
X-Proofpoint-ORIG-GUID: 9emaKL3oZTwSmyLrx-li9Oc9q7-AybTw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA2NiBTYWx0ZWRfXz1EXB+WWHs+4
 4/f9w9kXX9JE/oGUNyGq5Sf3R8obrfxymyG5tq1XcqOgg0/f1fSAMq1lwAZiMflo5y9/qjlIrpO
 Ouh1CyOZRKAU+M9UGcZmj4lajgvamVEqz4L0Iju4pOUvNyHCM56F8tjohhanZKVkQJfLck0VDHO
 zXrvMKsv9nUHQtH3aunhzvwOJOO6hm9j/iH22W4uMR1vWXkujFwEj9YDDTC8dzL2yiL5Z3RRnBw
 9YGUCBUOk7y3gD+OcqEiFN0etovQTWKBoQI60P4s/G3QSJR/bkpt/omRDgIgTOqNNbBC13a8VzX
 dki34LXzPOklDbAOUF9dJnNDRzULh0zg34+DQKn2BoT8V1UaoNrT36K7yilDwi7OL9vZZIkJbnn
 5LTNo+rDG4wKXrxRmKLyPWWJ7S0YbidohanDlxHBiZ828J1czEEo1+kaJJkBJ7f9/x0jcxndpAf
 SKRW2gqYZqHq5Oazi2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA2NiBTYWx0ZWRfX6qYduOXOWudZ
 dczKgt3diEMO+ZvSMFTuP4FIfM8FiiFLjb29AoyYPUVBiV21K3A8ekSZS6v6X6wOUaGioD7UOV/
 aodc4kiXXxsZ25fAgo0fDko4otIBwKF5NHKKXFy7Fn7u2JQ1M6Xn
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11900
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=10 malwarescore=0
 lowpriorityscore=10 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090066

On 9/7/26 10:49 AM, John Garry wrote:
> On 28/08/2026 14:49, Tal Zussman wrote:
>> An IOCB_ATOMIC direct write to a block device can silently lose its
>> torn-write guarantee in two ways:
>> 
>>     1. blkdev_direct_write() turns an -EBUSY from page cache invalidation
>>        into a 0 return, so the whole write is retried through
>>        blkdev_buffered_write(), with no atomicity guarantee.
>> 
>>     2. On a partial page pin, __blkdev_direct_IO_simple() and
>>        __blkdev_direct_IO_async() submit what was pinned with REQ_ATOMIC
>>        set and leave the rest to the buffered fallback.
>> 
>> The second case can be triggered deterministically. A 16K
>> pwritev2(RWF_ATOMIC) whose last page is PROT_NONE, on a scsi_debug
> 
> If there is some scenario which does not allow the iovec to be written
> atomically for RWF_ATOMIC, then we should document it in the man pages
> description of RWF_ATOMIC.
> 
>> device with atomic_wr=1, completes short with only three of the four
>> pages written, violating RWF_ATOMIC semantics.
>> 
>> Fail the I/O instead. Return -EAGAIN when page cache invalidation fails
>> for IOCB_ATOMIC rather than retrying through the page cache, matching
>> __iomap_dio_rw(), which treats the failure as transient and lets the
>> caller retry. Release a short atomic pin and return -EFAULT before
>> submission, which is what a direct write already returns when none of
>> the buffer can be pinned. A sync atomic write can then never return
>> short with a remainder, so the buffered fallback is never reached.
>> 
>> ext4 has the same fallback and only warns in it. 
> 
> It should reject it, as IOCB_ATOMIC would be ignored in that path.
> 

I'll send an email to the ext4 maintainers as Christoph suggested.

>> For block devices both
>> ways in can be detected before any I/O is submitted, so fail early instead.
>> 
>> Fixes: caf336f81b3a ("block: Add fops atomic write support")
>> Reported-by: Sashiko<sashiko-bot@kernel.org>
>> Link: https://sashiko.dev/#/patchset/20260802-blkdev-fixes-v1-0-a82fc549fd74%40columbia.edu?part=2
>> Assisted-by: Claude:claude-fable-5
>> Signed-off-by: Tal Zussman<tz2294@columbia.edu>
>> ---
>>    block/fops.c | 21 ++++++++++++++++++++-
>>    1 file changed, 20 insertions(+), 1 deletion(-)
>> 
>> diff --git a/block/fops.c b/block/fops.c
>> index a3a709697b40..8769bb13df1c 100644
>> --- a/block/fops.c
>> +++ b/block/fops.c
>> @@ -87,6 +87,12 @@ static ssize_t __blkdev_direct_IO_simple(struct kiocb *iocb,
>>    	ret = blkdev_iov_iter_get_pages(&bio, iter, bdev);
>>    	if (unlikely(ret))
>>    		goto out;
>> +	if ((iocb->ki_flags & IOCB_ATOMIC) && iov_iter_count(iter)) {
> 
> Could we even move this check into bio_iov_iter_get_pages()?
> bio_iov_iter_get_pages() is used in fs/iomap/direct-io.c in the same
> fashion, i.e. it's expected to be iter'ed only once for IOCB_ATOMIC.
> 
> If bio_iov_iter_get_pages() does not give all the pages for REQ_ATOMIC,
> then something is wrong and we should error. For this to work, we must
> ensure that bio_iov_iter_get_pages() is only called once for a
> REQ_ATOMIC bio - that would be the semantic.
> 

Yes, I'll move the check right after bio_iov_iter_align_down() in
bio_iov_iter_get_pages(). That ends up looking cleaner.

>> +		/* a short atomic write would be torn by definition */
>> +		bio_release_pages(&bio, false);
>> +		ret = -EFAULT;
> 
> Eh, generally we return -EINVAL for something which can't be written
> atomically - like in iomap_dio_bio_iter_one(). -EFAULT is not documented
> for RWF_ATOMIC (afair).
> 

Sure I'll change this to -EINVAL.

>> +		goto out;
>> +	}
>>    	ret = bio.bi_iter.bi_size;
>>    
>>    	if (iov_iter_rw(iter) == WRITE)
>> @@ -352,6 +358,12 @@ static ssize_t __blkdev_direct_IO_async(struct kiocb *iocb,
>>    		ret = blkdev_iov_iter_get_pages(bio, iter, bdev);
>>    		if (unlikely(ret))
>>    			goto out_bio_put;
>> +		if ((iocb->ki_flags & IOCB_ATOMIC) && iov_iter_count(iter)) {
> 
> At least this check could be factored out of
> __blkdev_direct_IO_simple(), right?
> 

It's gone with the change to bio_iov_iter_get_pages().

>> +			/* a short atomic write would be torn by definition */
>> +			bio_release_pages(bio, false);
>> +			ret = -EFAULT;
>> +			goto out_bio_put;
>> +		}
>>    	}
>>    	dio->size = bio->bi_iter.bi_size;
>>    
>> @@ -691,8 +703,15 @@ blkdev_direct_write(struct kiocb *iocb, struct iov_iter *from)
>>
>>    	written = kiocb_invalidate_pages(iocb, count);
>>    	if (written) {
>> -		if (written == -EBUSY)
>> +		/*
>> +		 * The buffered write fallback cannot provide torn-write
>> +		 * protection, so atomic writes must fail instead.
>> +		 */
> 
> Would it be better to have this check in direct_write_fallback(), i.e.
> always -EAGAIN in direct_write_fallback() for IOCB_ATOMIC?
> 

This wouldn't work since direct_write_fallback() takes the result of the
buffered write as an argument, so the write will have already happened.
Instead, we can skip the fallback in blkdev_write_iter(), like we do for
IOCB_NOWAIT in patch 2. The new check in bio_iov_iter_get_pages() ensures
we get there with nothing written to disk for bad IOCB_ATOMIC so it should
be safe to skip.

Thanks for the review!

>> +		if (written == -EBUSY) {
>> +			if (iocb->ki_flags & IOCB_ATOMIC)
>> +				return -EAGAIN;
>>    			return 0;
>> +		}
>>    		return written;
>>    	}
>>    
>> 
>> -- 
>> 2.39.5
> 

