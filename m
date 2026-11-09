Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794249306;
	b=BaCjd+0V8BhqoqTLPf1JP4ihgb4AFzFOqm3Il7YoLa3om/Hz+phm3DpUwj5qpCCEqOpr
	 NAdMTCzZrb4bPnnMqkdziWoJ4EK7hO3kR8/T8Wd33LsO/mCRuGyy6n7A6unWzswVx5+aa
	 VFLzfxngLWJQ11Hn8UEx4M3NUvHBjCPHY9Hs0ZJ3kSW2ZWn7gjyCLCHHLY2Trt96ctBKz
	 DreVP5WAtvXcdUxCIskcVtFlUxUfSejg2UP1kYXQd6QHW6mmDQtKGNYsz6ZZJM40Cq9w9
	 Hf7m4FSXt36LF5uUAqp+IF1jm7abgwOFpzu5i2vqBUrQGPm1fIBYCQrx9Enepvz56UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794249306;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rUkAN0D/BhV4eeepN5BkaPXtCpvrs73RQYqXxUHa58Y=;
	b=X9EMXMSJAsRkegtOBFjA6V7k2ZA4Ryj62Byd48kUyDBkzIpNkaJ7iZ32MERMFvwZfGB+
	 Pn9ZIC4XX0S07tqR/aFd5sp/B8j9B84zJQ9aTFrTLEDE35HX14Ww8qoDC/F0YKkdB6ZtT
	 Iy9ranQBruUynqP7JzdwlDaGW00Va9x2+6OKRfAQgpKe9oniOU9k1BD7VxG+3lbmie4nN
	 37jH751otyJaS68PmtZmdKaMhE+BO9+AN6bBNQITFsUCh7QJ5qUy5SbyWA3gUdNUmGamo
	 E5epM2/nCqRMMgDE8UL6R7L7h5xSiHiMyCwednUM+sN0DzJApVY1ulWqhtoxOoDK8vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b="l1c5/v8l";
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=TzTQAQZf;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E152F606A5DB
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E152F606A5DB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=l1c5/v8l;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=TzTQAQZf
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9ISsCc2829203
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 13:34:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=rUkA
	N0D/BhV4eeepN5BkaPXtCpvrs73RQYqXxUHa58Y=; b=l1c5/v8l49hmG858fai+
	UKKiQ9cU4c/8V70uMPbqdB6EqIOXK5UkRD67zYVJ7g9z5KskWJNjpCpK/5GCbEwZ
	OtFQRwfcBaaWbQeICmqIuzEsFQM3maFplPKYmMt4RnF0f/P41Skphkwcf+w2PsHV
	inDXihKZrJ2ip+R144IbTbMX/M+KgfSnB2XX/itGgslUqPKd8uYcdDwLrnmjoS9j
	USZhhvtSjUkCwxCP56zcLZrys8cs29eG8hL8Y0xgUvxqVJ3jTLBK1DFRHzRvrD5i
	BJONdkj1fWuvBAPtJTYtw1lJFf3jDBILj4iPygz4co7c0OqZMrIjUU4SuQGohGZQ
	lQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hukg8g1ru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:34:58 -0500 (EST)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c6c1e082bso20982556d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794249298; x=1794854098; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rUkAN0D/BhV4eeepN5BkaPXtCpvrs73RQYqXxUHa58Y=;
        b=TzTQAQZfq0XjUPsPaOslkTzmhx3irVPF938FT70tcVsvI6v3NI1XZz5NvlPd7o6cFk
         eaFKyGOz23E/d76UJyJ9nIBP3L5j8WDAS4cSHn9Q1rNFL6IDBIwWgCfJgrOZohU4/UF3
         jrEeHTU1waD4fHO68HtTIQ26sq0lfxUXULaUBJYPklefoFBJdReKvD8lc6ez/pbU1jSB
         ZwDQTLet7vMUTm7N7ozc+3gmgp/STNO4l9j9Vm8QhHXA5AImB9UiQE9dshyTBmlpJkZj
         X6NZV/22syct225nemTs5+lkfpJpWkMLubsFMQO3//vFGNoFgkt3zo8aDANNondVPAp9
         lUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794249298; x=1794854098;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rUkAN0D/BhV4eeepN5BkaPXtCpvrs73RQYqXxUHa58Y=;
        b=IuFgzPN74Y/UfzvaOsofqz6eycgHo5ae6Kqx0dlnuAsmffzEz3NBZYP5AOjWqCe/wN
         DbnPmA60AihTdP8elUNPvmvHyw53CevkQ6JJgceuHCP2/LciGV52cx1q7Gj/W8vzcpMO
         HzgRD3FWiFVW4VZMMgXrDZm39+6oEqThmRHWrr1r/50Ht3URBTOWWnjNPR6upFY+9kVa
         nbMl2fcq9BFu1HXAKNBe5IvseG0s5XCqfutHFoqMX/Bjq14phUiX/J50lQnQhv9dlGAB
         XjpsdoNzS59d4NjNS9xnzpoQSesWRZNZkBqdMz+9zFsECPAoPoFaY+gxuDKAfTlUjcqs
         qs2A==
X-Forwarded-Encrypted: i=1; AL+hErGHdJLV8/RpXufYcfOL+1pD/3peLdI4cszlMPJzj3+uil6mr6d02rYtgAv5YexpQSLt7eTjhMaptDZlUT8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xFFzzYkSC6ARH4P2VZqJkvPmra5NuXMn42Sw2uDIWqd0eZrIT
	BzbaRDAeaXpxgFvhaaJJYXeAbrEyDyzsT3qO6m+zMipeasMLmGqi5gVo50BPmDTw6DxAnhdUnfz
	Pr3JF5/7ECzeSLqVFsNHRynrQ3uxbn1PWziAWrLHa+Q8yn4SdeyyCmsVSWb5LNA==
X-Gm-Gg: AYBFou2UGekMKoBMkRsb5Fa5NR/gttpOrEiLU2n7QRyE6T3QWr5YCNw1aBvuz1RM/sk
	KFOAPzOFyUXGz8AwESOj65yKqhfLpvvQNAyGsJF2gPYZfSfjx3kG4nddcAT8kRq5Uw1/H4//C20
	jMMwoRGwKl+XDLDt8iDQuG1S5bN/klThpI+6XO00xn1/jftcJzDyQJV5WBEC0P2dhgLG0PSjFbR
	QB3c4NZw9X3TVy1Inqh1amERTvwYnVU7tcQg9bQ455gjDRab7odS/KSgz8nXNntEjQuyLkNAHO6
	zDF4NS4erdEWywbk++cZyus9wjhYbYVYhuzsSptVVwNyHyHLUXf+uCS45+VQsZflk9yyY4iVk8Y
	TuEzpdJ16I9qxh2drNreU9yzFEDoCgXTeVlSRqm62IfVPwA/XhAXIuc5GfaZ9iQAevG74m9LFbk
	2S+HzfPa6d68ah31Z9LtA+Isk=
X-Received: by 2002:a05:620a:4050:b0:93c:3863:ff7f with SMTP id af79cd13be357-9479ee3c1b2mr70605685a.0.1794249298090;
        Mon, 09 Nov 2026 10:34:58 -0800 (PST)
X-Received: by 2002:a05:620a:4050:b0:93c:3863:ff7f with SMTP id af79cd13be357-9479ee3c1b2mr70601985a.0.1794249297669;
        Mon, 09 Nov 2026 10:34:57 -0800 (PST)
Received: from [10.207.116.169] (nat-128-59-178-16.net.columbia.edu. [128.59.178.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7e7f3bsm34634485a.37.2026.11.09.10.34.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 10:34:57 -0800 (PST)
Message-ID: <c27b9521-7c4f-41ff-88f8-55313b5f395c@columbia.edu>
Date: Mon, 9 Nov 2026 13:34:56 -0500
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
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <3fc46788-d86d-44c5-8606-385d96fede4d@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA3NCBTYWx0ZWRfX10ZJC47ZH/ll
 BavivGDK9L7Ob88dlPzb539TJxKvVmA/o1OuPJPamFTWHTHDJFwDVqCj9PQJKpVrbSw7oPhY6Sd
 g4uPxKNnQ+labccDsGz7QUmW9JPncVfmeOYtW66xNTaSWSO2BFOd4Atae9HeINLNbMBYPVy3PUS
 Dl0tlZRN3exVkFfYoy9eGdzyNHF0z+88KxltlSpyiSno0J3qmmY7uo9AQpp5QGGxxw3nFlynLAK
 jZUT9F+JcsFgvtD7iiu7ur1ERBtx/t8voXp5N5Rge24Fbu2BaF8q3Q+DEr83ToKHO+jyraFDZSK
 7MDYEo/4tAzJ58qwj2hs4DC7imLAsZvAYJFhSdw7wu48lGu0H2RHQQTGXZSKPH1UpaExJhbxtEe
 7huant8ge/PX6W+3rzrz5Kw0Dm8QRNTSSn4srfZusS89bN4TiYdDUGS0U3MVzyMsqvLYpGlo3TK
 QWwrMvjTjgpg8jU8fnA==
X-Proofpoint-GUID: OPe-f0En2XJ4VqfVqk1jKgx3e4AtT_Kb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA3NCBTYWx0ZWRfX1x4Qq/fmv77v
 24BD6CCifGwLUHdO6csj+Gee15f6LA4rRUGrIcgjP9HtwiNBn7pgRyZ1zksNqhGwB7mvxGNTgye
 xu5rbmb5qLh6lbBTUwdEJhxYS5eCHHw2+72388EjV+PGvvV8VqzE
X-Authority-Analysis: v=2.4 cv=VJtIDNPX c=1 sm=1 tr=0 ts=6af21252 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=Gl6UJ28otdLh1ydVN8wMBg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=VwQbUJbxAAAA:8 a=ADIp8eLfD24IfaEPE4MA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: OPe-f0En2XJ4VqfVqk1jKgx3e4AtT_Kb
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11961
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=10 lowpriorityscore=10
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 impostorscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090074



On 11/8/26 12:06 PM, John Garry wrote:
> On 11/8/26 04:24, Tal Zussman wrote:
>> bio_iov_iter_get_pages() and bio_iov_iter_bounce_write() now fail a
>> REQ_ATOMIC bio that doesn't cover the whole iterator, so the bio here
>> always covers iomap_length() and the check can't trigger. Remove the
>> check.
>> 
>> Suggested-by: John Garry <john.garry@linux.dev>
>> Link: https://lore.kernel.org/all/82978d5c-3e08-48e9-bf0a-7913e1cd0507@linux.dev/
>> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> 
> Reviewed-by: John Garry <john.garry@linux.dev>
> 

Thanks!

> This looks ok. But I am just thinking that a CoW-based atomic write does
> not have the single bio restriction, so we don't need to fail the atomic
> in this case. However, we should have consistent rules for iovec's
> whether it's a block device or regular file for ext4 or xfs, so this
> makes sense.
> 
> thanks
> 
> BTW, you could be a real hero and add an xfstests case for this also.
> 

What specifically would you want to see tested? I can do an atomic write with
a partially unmapped buffer, with and without stable writes, and check that it
fails and that nothing is written.

>> ---
>>   fs/iomap/direct-io.c | 14 --------------
>>   1 file changed, 14 deletions(-)
>> 
>> diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
>> index ad041ac3252a..aca7cbaea4af 100644
>> --- a/fs/iomap/direct-io.c
>> +++ b/fs/iomap/direct-io.c
>> @@ -370,15 +370,6 @@ static ssize_t iomap_dio_bio_iter_one(struct iomap_iter *iter,
>>   		goto out_put_bio;
>>   	ret = bio->bi_iter.bi_size;
>>   
>> -	/*
>> -	 * An atomic write bio must cover the complete length.  If it doesn't,
>> -	 * error out.
>> -	 */
>> -	if ((op & REQ_ATOMIC) && WARN_ON_ONCE(ret != iomap_length(iter))) {
>> -		ret = -EINVAL;
>> -		goto out_bio_release_pages;
>> -	}
>> -
>>   	if (dio->flags & IOMAP_DIO_WRITE)
>>   		task_io_account_write(ret);
>>   	else if ((dio->flags & IOMAP_DIO_USER_BACKED) &&
>> @@ -393,11 +384,6 @@ static ssize_t iomap_dio_bio_iter_one(struct iomap_iter *iter,
>>   	iomap_dio_submit_bio(iter, dio, bio, pos);
>>   	return ret;
>>   
>> -out_bio_release_pages:
>> -	if (dio->flags & IOMAP_DIO_BOUNCE)
>> -		bio_free_folios(bio);
>> -	else
>> -		bio_release_pages(bio, false);
>>   out_put_bio:
>>   	bio_put(bio);
>>   	return ret;
>> 
> 

