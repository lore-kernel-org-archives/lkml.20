Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794264393;
	b=ROSGJAwhbRJQ2AjkdOhOSv76hNqHw4dZUj+bLM07e5wKyxhekBT9ke7XFULqpnU+lo7P
	 ACXfRyr7V+TbvsAO1VzTJAr+c9tcgcGDhmQl6hhBJRudLkztM2uFkAg60Q7zZEuER4OxR
	 sR42KaKgRQyZC3jfMOSuELB6JsywV8Mk2Iehd5gOWrQWHRvdGFKNyCy5xySvCmh/kZSF/
	 RxpMoOjCbv9aWILI6EOmQgi5VfgktzT1qejZMvImmWyD7P6eSCIHZeKZe5o//RlHslTr0
	 4gn06RuCqyGIHrzwb+1jOcreJx2Wz5di+rnfak0FsWTCnG3GUqLT3J213OLmFiZDvYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794264393;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WIZBljhWyOjAV704JqzV8vhFcRwS8d3hm/gLxcJtn20=;
	b=Pb8Fs1D5sRNEhNkGTEEPTRs00PmfbzqaZK0S8JA2fsT4GTIINOO+9wTI5FKbmogs2qzF
	 9RaOrKvBIYeCqycmHf3nXW4h6zIRWnaXKY6XmKUzlzOEOBDKUxtXnpjkTNmvee8feGOuf
	 LCt/8e7AyZtXrRsmnAhdnRoAkTNURiaMkmnNLhoVBsD1QCf0g1E5Xy7MXuWIXrHRWxmev
	 08MBR4lZIKlofUtTKCwUpfgArL8XIf9cq71MDqfStW8npHAbzTTbOwxnKkgx7WsX5T4SY
	 6JJHxln4Ci5kN5APlNT7Bqv7Crvdq+QyoZHvzxR+ml62IT8U4nRNqHVqPFt/Xg+XMEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=rJPYJ+Pf;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=0enM7fbI;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7F0606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 22:46:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C7F0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=rJPYJ+Pf;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=0enM7fbI
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9MRlLT3684072
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 17:46:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=WIZB
	ljhWyOjAV704JqzV8vhFcRwS8d3hm/gLxcJtn20=; b=rJPYJ+PfHhoR2aC5ddre
	KeX0TdnGyNff0y44edc9qO8omnXiG0NrT5sfljaWfFAbsoL94MHrzXPazE3d+qFT
	/SKQftG+Rknkszqx3bWtOTlRrOoqsD/qf1W7Pani/bgd3TS8I22tMOP8VJ5rRj10
	l9M9Nu8XtoWOYmt5kHgVpCOWVmo9hHIiaGFMK8XsGzXv7eVyeq5gtDm9v8p8wJWJ
	bSzVKEkv/r88EFjHPXlneH6gL9V9wgG7s3ylcsavjTXCEIPoyRKkPBLPwA4foQe5
	VkG4/vTvUMZWQKljuE5sEeZynPzCtkcnfE372yfe2FTqyT24VAmBfWGBCf405lJL
	uA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hupvug54x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 17:46:31 -0500 (EST)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91ec0ed4af9so20746146d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794264390; x=1794869190; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WIZBljhWyOjAV704JqzV8vhFcRwS8d3hm/gLxcJtn20=;
        b=0enM7fbIEkgCaPHnwROs1AH+cT8C2XUcCsXLOvY0FNHtdlsJTHTXomRcBL2cs6p99B
         jwtZ22W0o+vlGDwzmc7juR2+s5sw2UgSUSLcfgsW8SREua//529cOBkGMx72FFyAIaoz
         m+dhgkl4Ic7F34MIlY1YAoisB6ujfzRxxGO7pKYE6J3qXDedlDM4/ZZPMQfd/TsY1FoF
         TVfGm9FYineb6HKUXZdXw7+o+EuULwwDBXTiOwaP15VhRDjAWZoTT1vZoqy0OWnWFOIB
         FlKAtgI8FATZ4nqzVjbnR7HnNJX/CvwrbhXfwXCgbUmBKdhP8nxmak5G7iOLfFqvHOgR
         QRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794264390; x=1794869190;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WIZBljhWyOjAV704JqzV8vhFcRwS8d3hm/gLxcJtn20=;
        b=Z6azaoKHKgjwuzKfXh21n/f1laM37z8kCj7Mgcha8kIDdE8CzlBe7ThOCJCbGIe7wV
         Sg1mgBE5684nTteL7U3QD47hCBMW3LM6NrWKIcNof2itKRVaEx7x2nOpMLnjbdj9uAs5
         eOwYwyPUkvWKHNMcIsF16QDhuvu9PmWsFg2jZJdNYzkMFWQFU6jAKfLT4xABHHfl2/QI
         JtoqqKvUlfZpErjuA2Ok35fxLtWrTYtI7xSRIl4v3wj/7u3MCMixdNqQSO+SbLz+mKBm
         cOo62E1R+CD6Bw+71ORda2FuF08MLfJ68TQoK2somKE1XQkDsy8eXgRNAwivvbvZIf9f
         uhAg==
X-Forwarded-Encrypted: i=1; AL+hErFJI3FdD0M4jDDVQzwiP5cwtkY5R3by8Ld41WfuKtnde6sdLYYfUjWxPRjL8uNzxp0kwfaFvh4QmcdWz9w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kp9P+njHGY/gnmQAYMjEe8O29sz9WlO4B+cU6QN2iFfiCM5Fe
	pVSliLiltxN0mFokE69s3xN8c1anXGWcZV5+dM9au1fHwXbojEBKdHCZ1uAwKJCx6ufh0IODbmb
	KYDPIqaPdfy/2ZqOlm1/S9EiMmKpI2wIg8t2HylFywzAzVfJbHoTFvZ3Bfuw8/w==
X-Gm-Gg: AYBFou0s5xdBlKFbM4hREFFVy534z40QYNRdn9huFijDYMtJnBcCV4P7uJq6PzeWBUY
	q+gN2vmJbKZ2P8X2Y0wyrdYNLE0Y5aVlk1OMimh4gnbopdZE1cEKeQrhjRlwNvt8ndMH8cIRoqu
	stKAV3yKjGY7GeQfdKF/AohojfEXlYtco6u/RIwpycKm8WVmh1S5u4hK+EC0qt9g15MDaNVK2u3
	zN0cq4sYPLnxUMYP9vlyB4hzYl2i+w8WjPHjhinVGpkj7derX09ifsLtz1zkdIBCeP+Fb3jXQFC
	C+zOUMWS/Nc5a1yBQAOIdA/fb6MDJbJWGDVaaPrdVjRsidydd93chPCmhwoWoHhCKXJoY9Zm88K
	AwHekX2AAClU2glnxAS8UzNYPR3S19hJM/WWAyS1yWHv9ni3H/4glf+5wBZvwH5gV6lhelyOFpW
	qATpgAjfLnC7YTUyORBa/RBfg=
X-Received: by 2002:a05:6214:cc8:b0:914:cdbf:b6e with SMTP id 6a1803df08f44-91ef049b91amr14954486d6.22.1794264390535;
        Mon, 09 Nov 2026 14:46:30 -0800 (PST)
X-Received: by 2002:a05:6214:cc8:b0:914:cdbf:b6e with SMTP id 6a1803df08f44-91ef049b91amr14954056d6.22.1794264390014;
        Mon, 09 Nov 2026 14:46:30 -0800 (PST)
Received: from [10.207.116.169] (nat-128-59-178-16.net.columbia.edu. [128.59.178.16])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef031aaddsm7023636d6.3.2026.11.09.14.46.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 14:46:29 -0800 (PST)
Message-ID: <21793564-61f4-4d57-b375-1271ad9bc70c@columbia.edu>
Date: Mon, 9 Nov 2026 17:46:28 -0500
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
Subject: Re: [PATCH 2/2] iomap: remove the atomic write length check in
 iomap_dio_bio_iter_one()
To: John Garry <john.garry@linux.dev>, Jens Axboe <axboe@kernel.dk>,
        Christian Brauner <brauner@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
        linux-fsdevel@vger.kernel.org
References: <20261107-blkdev-atomic-bounce-v1-0-f66344262096@columbia.edu>
 <20261107-blkdev-atomic-bounce-v1-2-f66344262096@columbia.edu>
 <3fc46788-d86d-44c5-8606-385d96fede4d@linux.dev>
 <c27b9521-7c4f-41ff-88f8-55313b5f395c@columbia.edu>
 <4022d4f9-5e2e-45d1-b9b8-208c80f82ecf@linux.dev>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <4022d4f9-5e2e-45d1-b9b8-208c80f82ecf@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA5MCBTYWx0ZWRfX4oiujcZwLJL7
 gPXXuK+aoiTLJ0yW0dadY9QnuZGUZ48MgPrLPsL63wZ/OLjrzKMZdLyllDkFZjfLgBNaioTBhyr
 PWDZfgY5QmsCbhui3iPkj7NTvQvp22faCCOjaLp2CKA6HoY8Akdc+V5o7ojyPnwPBusTU93Pp2k
 XXF2vUbA9almZyDlx9MyIZqtc2oJ9DwVyI0a51moTvBIYTZvHjzjajmSDS2JwT9kpt0OCqw9yQ3
 O5/3mRjsKWT34M2X7gFT4oEy1iqgzUP0Aec0WGSKbYehWwbC2o1IQlW2PW0xvgaRKZEbJ04JTuy
 bHQm/8TVMCRQT+Nb1Zn7z+P+bIN94yQF11QbsAEH9fz+jQASyDRZPkasIJ9qXf1dS8I5vy1ZA4s
 vq5H1StIFJZ3kEVck+PoOOavrFJeFlQOy1eoaNNz9X0lYADXZnzVU5oUnsVERI9+pU/AfE+3t+j
 VCSBebPmV5jlofG/UBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA5MCBTYWx0ZWRfX+YAxS5oZFTQV
 eahkzW9x481HP0kyZm4W+LOikDoUiW8uBwKvskyen1fjpVW0fKUeIEMLBXvPnki7JpqSZDxLL2G
 bjTTyLXETAMXkMCxSwlM/5ivw/HEWZAAHQzgtglrc3tVt9gIzyPf
X-Proofpoint-ORIG-GUID: nH9ZIGOUcVdbv9vH33pU46u0qAAXCQGP
X-Authority-Analysis: v=2.4 cv=fcA4WEQF c=1 sm=1 tr=0 ts=6af24d47 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Gl6UJ28otdLh1ydVN8wMBg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=usPcmh10W0ubT8QP8_c3:22
 a=-APkALjPeVA3zQJKllEA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: nH9ZIGOUcVdbv9vH33pU46u0qAAXCQGP
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11961
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=10 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=10
 lowpriorityscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090090

On 11/9/26 1:44 PM, John Garry wrote:
>> 
>>> This looks ok. But I am just thinking that a CoW-based atomic write does
>>> not have the single bio restriction, so we don't need to fail the atomic
>>> in this case. However, we should have consistent rules for iovec's
>>> whether it's a block device or regular file for ext4 or xfs, so this
>>> makes sense.
>>>
>>> thanks
>>>
>>> BTW, you could be a real hero and add an xfstests case for this also.
>>>
>> 
>> What specifically would you want to see tested? I can do an atomic write with
>> a partially unmapped buffer, with and without stable writes, and check that it
>> fails and that nothing is written.
> 
> Just something similar to the blktests case which you added.
> 

Sounds good, I'll add it to the queue.

> BTW, have you tested this partially-unmapped case for CoW-based atomics
> on xfs? You can just do that by setting atomic_wr=0
> 

Yeah, I just tested it. It behaves as expected: returns -EFAULT with the file
unchanged, both with and without bouncing.

The single-bio check depends on REQ_ATOMIC, which only the HW atomic path sets,
so it doesn't apply to CoW writes, both before and after this series.

In terms of consistency, the unmapped buffer returns -EINVAL on the non-bounce
HW path (from bio_iov_iter_get_pages()) but -EFAULT for all other paths. That
should probably be made consistent across HW and SW and bounce vs. non-bounce,
but that's a separate change.

Thanks,
Tal


> Thanks,
> John
> 
>> 
>>>> ---
>>>>    fs/iomap/direct-io.c | 14 --------------
>>>>    1 file changed, 14 deletions(-)
>>>>
>>>> diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
>>>> index ad041ac3252a..aca7cbaea4af 100644
>>>> --- a/fs/iomap/direct-io.c
>>>> +++ b/fs/iomap/direct-io.c
>>>> @@ -370,15 +370,6 @@ static ssize_t iomap_dio_bio_iter_one(struct iomap_iter *iter,
>>>>    		goto out_put_bio;
>>>>    	ret = bio->bi_iter.bi_size;
>>>>    
>>>> -	/*
>>>> -	 * An atomic write bio must cover the complete length.  If it doesn't,
>>>> -	 * error out.
>>>> -	 */
>>>> -	if ((op & REQ_ATOMIC) && WARN_ON_ONCE(ret != iomap_length(iter))) {
>>>> -		ret = -EINVAL;
>>>> -		goto out_bio_release_pages;
>>>> -	}
>>>> -
>>>>    	if (dio->flags & IOMAP_DIO_WRITE)
>>>>    		task_io_account_write(ret);
>>>>    	else if ((dio->flags & IOMAP_DIO_USER_BACKED) &&
>>>> @@ -393,11 +384,6 @@ static ssize_t iomap_dio_bio_iter_one(struct iomap_iter *iter,
>>>>    	iomap_dio_submit_bio(iter, dio, bio, pos);
>>>>    	return ret;
>>>>    
>>>> -out_bio_release_pages:
>>>> -	if (dio->flags & IOMAP_DIO_BOUNCE)
>>>> -		bio_free_folios(bio);
>>>> -	else
>>>> -		bio_release_pages(bio, false);
>>>>    out_put_bio:
>>>>    	bio_put(bio);
>>>>    	return ret;
>>>>
>>>
>> 
> 

