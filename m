Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248861;
	b=MAeKgaDQpVDxNA5dBONJERSudZOuoO4KUiCvt5K5dvJImzWt+09mCsk2N9nDqamnjeOw
	 pecjJz14GjwWOkBbv7b99KHuITIu1EI78nw+w9CX67CMDN1wA0YL5LhEWrfCIIaeToO1n
	 PUd6PyVWpATmhurwOMvycPbvcWCdNy7jHNyOcgfxNWC4IdS/Yp/nTWDTaI/Ut+YyOItTb
	 Fo90N9+h+CCNO8U2fHkgdCNmXqHTWn4GxTls0KeyRP9g1Fj4+T98jrmrBPd7Ts7nETlhS
	 PtcdJEXi3FFwtK/RxtCb/H5CDsUv7Eustet86EJN6NeRhETqxWuEMpWgND8FJaaThUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248861;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3LmoJP6g3WtU8XQSQhoDtd6EbgMyoETHVY4mSGzEhSU=;
	b=AkRXQ9u7eUVLHIaFC2PumT4xSxRvszyPi8EUyX0pIl7xLMLo9J/TPKaTCLp6ukpSVwb4
	 sKE1HehiCZF/8Njit0w9Uyu//yoTaylGKQ1Mcr3Mf+xKJwv/HbzsqjBcBg8Adu5LRYvKz
	 hh9TcuGDfWOXCfq/8BuB3jYo294LAAezLWUh1KepisdtuW4CzKWZ6d5S8fXQPz3HoBpDE
	 kxrH0b0UcmtQfxqMj9f6jbwlQIqyhvquw7hsQ6TS6eF0R4GxIb+jFkEzZJjz6k9LpWBB3
	 upbEA9cx4qkV/isLcwHx+ya3I1e1lROQ5KCe7hgyiYHZ2h64FgzlTZLB1622uWmqwEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=kCc8EzR+;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b="uF9wMu/4";
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6BB606B5B4
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB6BB606B5B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=kCc8EzR+;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=uF9wMu/4
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9HcVrO1361010
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 13:27:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=3Lmo
	JP6g3WtU8XQSQhoDtd6EbgMyoETHVY4mSGzEhSU=; b=kCc8EzR+b4HrbTrsozWd
	wB3ICfreUm+eixPxqajsNMRIlnZon/Sy5lgy3EzkzghBxLoNs7vYP8QRVS5rLdLC
	kEVhJL0Ph48wv907s6NMXcnDWDU9YBxuYW3XDklW9eHfl3reIVYXlFL8w4j8XZ5S
	rpePeD7RDGFYYNe+aTEy/xR20NBr+fZ+WZKH93POyM4xwQ+vdsJsmIr+vUBE86gJ
	QtxJVaJmLLpxBpdT9BkUENMgRHdgQ2KPWWAzb8uyAyajGaEByZH3EnEtyGEvXqEc
	WzNgU7Uv19RY6DHPQkYJ/3Wr8kf8Jr0eb2FmHas8iniDLBLHep7M7Z9JCFaHSFP2
	gw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hujrn8d3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:27:32 -0500 (EST)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-544019b1831so23442211cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794248852; x=1794853652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3LmoJP6g3WtU8XQSQhoDtd6EbgMyoETHVY4mSGzEhSU=;
        b=uF9wMu/4H29cIsrk2claBd6GaJ/dUYrENKFpwSi28u+CaRmvimN68tPNtHmySxeLun
         jyKS2DHQVN4yQZaxky8bS+m8V0YULEcbTQX6OQ6aIm2ooqwu9D6GycZ9NCrwr8pkxhop
         K5BVAgDopGr3LXDX/jm+yhNEmR7oQGqooYsqrhPtq3PdzSO/34akVMHykDBMAm3Z8PXt
         ztZlwpy/hm1BKK8DfAwWwYP6Emzq+yIAiG5XqrmuvWQoLGxs3oqMvf+7MQ24nCdFFoeO
         UQLoOfFL47g1UrujfRiVj/fpeQdmsSD0f8+IwmhPbp/5JYloVmMKseRWrtZOZDE8oijx
         5V5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794248852; x=1794853652;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3LmoJP6g3WtU8XQSQhoDtd6EbgMyoETHVY4mSGzEhSU=;
        b=SY5FJiQyizpkIAVeaLnHREhltG1oS75X1NgjgH16v1Hxw35L1d7rPNg/1AufGUWkmE
         fma/WCgK5KzTWQhN7tIZdvb17Xj1PlcSQqqE6UPAWe+/wd4DphWbrYbPUzX1GoAb6t89
         OSCZWrHD9zQsECFgj6/1MHEHZ20yMC7a8tDw9/1UWjFpz8jWlyC3HemkLyOVY8wsJxdq
         8r0z1uwB9Qvw3IRQHidGHjpuXz9qO/+jx7azzMIb3uLiXioU4izvqZ2u/N6vjkz2j/n3
         57rHXCF5MPMinvrBypBdNc8qP8qLWK4QbN9SM54i9LPJOvh1e2K5NRvgzFUcXLs4hmWx
         yaNg==
X-Forwarded-Encrypted: i=1; AL+hErHz5kUXdILWKNYYicDDSmnhaMgtAagDkrPzcqjvU6X2LlIVvVQMbftUp6YL6v6CamT7rmIasBi0Cu1xnDc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JUZ7Jw69icTNaA8UFe3nJHSeY0wbjrRV8T3XWm8KGr8iSWj3Z
	8RU1e2FqS5NTI9G7AH6zYQT/bmO/LJ1hFCfpo8laOV6MsBsSC8g0aPzxHguBzVftwBy8150cXyt
	e2Rk0T9l3PYocbXM9kUqtPNXhd2fmIiyjz85NKJX4eVtN0260ayUXyJ1QlWCivg==
X-Gm-Gg: AYBFou0AR+XBktgH50K7MUuOHC8L9a/IlfMC8fvyVywH3sjBo7Z2LaV8Um4EgG3xXaU
	oCNcHxugvILBWW8e4VQgmYo36LdN9O6znE5MnFVI3W42Wdr5XZSAdZXomBKQA1aTqz4l7HWCbZK
	dc06H8dEdGVHtUaXTds6g+Gf1aOvfnGB8vo5goEOs3mFad5FZX++RGcPe6NJf3bZ34wJ9hFLvwA
	cSgPSE+/7Ba/Z+WsH5ecAGzZx9UVZL015M4Hphh0ZSat3EJ80FpLUc2TMw0v73lDXhGKDQthvhr
	uPxFAdJx5j/a4QGTQGUcMFoyGoeccEO2pGmI+C3YbDBFE/W88vizltPG0G7kg0Wcgm2eFQWR5YE
	cZWnD8zBTpTcv3h6dyoD3hCeNvEQD8GC3wWdbqzsqMS6xlatK/eW9unpwtmtx9evzkJ7MjwDm9B
	W43EfERdIqPyGLMOvzL/7gW0Q=
X-Received: by 2002:a05:622a:5b8b:b0:536:6c87:ebd7 with SMTP id d75a77b69052e-5552b64e9f2mr1970971cf.69.1794248851904;
        Mon, 09 Nov 2026 10:27:31 -0800 (PST)
X-Received: by 2002:a05:622a:5b8b:b0:536:6c87:ebd7 with SMTP id d75a77b69052e-5552b64e9f2mr1970471cf.69.1794248851255;
        Mon, 09 Nov 2026 10:27:31 -0800 (PST)
Received: from [10.207.116.169] (nat-128-59-178-16.net.columbia.edu. [128.59.178.16])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550b4516c6sm3479241cf.12.2026.11.09.10.27.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 10:27:30 -0800 (PST)
Message-ID: <74c7632e-52fa-4378-a15b-f90b492fe613@columbia.edu>
Date: Mon, 9 Nov 2026 13:27:30 -0500
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
Subject: Re: [PATCH 1/2] block: fail a short atomic bounce in
 bio_iov_iter_bounce_write()
To: John Garry <john.garry@linux.dev>, Jens Axboe <axboe@kernel.dk>,
        Christian Brauner <brauner@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
        linux-fsdevel@vger.kernel.org
References: <20261107-blkdev-atomic-bounce-v1-0-f66344262096@columbia.edu>
 <20261107-blkdev-atomic-bounce-v1-1-f66344262096@columbia.edu>
 <6bc16c54-a9f1-4c51-ab68-b227eeecaf66@linux.dev>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <6bc16c54-a9f1-4c51-ab68-b227eeecaf66@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d8NgWhjE c=1 sm=1 tr=0 ts=6af21094 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Gl6UJ28otdLh1ydVN8wMBg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=sFb2lJ8PKqpIU8oD2L0A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: i6f4BNTbCSwUq0gsc24BNL5Erphgxgqk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA3MyBTYWx0ZWRfXz5cWLGV9yrRX
 F/q1qYXfaWulJKLdBghucj++dhamAeyznPQvBW8TMMnJDRnz8sg+zZ/un4R5uenQ33tar+VPEA6
 KSF8nk4svCyefpFrKZ1zoGc+3Ty1GF1nTb9ARCEPcD4c2jORI2vp
X-Proofpoint-GUID: i6f4BNTbCSwUq0gsc24BNL5Erphgxgqk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA3MyBTYWx0ZWRfX/sKfS9h9CKKb
 RkotMTrO+9O4EuwkJMcEqcIYZ0mNQKtQF6lT5gQZ9yPCpfodSkxbXsYC3ewP8KWgO7lBM9T86Je
 K5Biptv4dE5LSIKpbZDRqMlNF62DR1WdJccWevxTKsrNes1HqX7+wYw0q7mUZJMvsjCq1t1sAE2
 M6mIOxbcBfirPRRJtDDRmPcirmmsrJupU6TLQ4CPvh4SivPlAkSdV8uNIMJWz4ObQN8hrOexWxX
 sjkcVMdkv70lO9KbtB5/RgsTVsFywlyMZS29WHTSzMxbMCKc5AROePXT30ShPmsXFerC1UtdzFZ
 GaBZ5jLTiQTHpq/6VXgO8/H7cPRszN5PxEXkkOPWFvcQZXdMfgboG9dK3flYUZWt/ces4OuUv/9
 PW109QK8F+7y62y1Lvg6IPGi+zA+J758e6Vry8mm/IO9OD/sqyicFlaQmmOIqpmyFxQsNCTvTbs
 Db15AwxEGdM0ONCoSdQ==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11961
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=10 impostorscore=10
 bulkscore=10 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090073

On 11/8/26 12:13 PM, John Garry wrote:
> On 11/8/26 04:24, Tal Zussman wrote:
>> bio_iov_iter_get_pages() fails a REQ_ATOMIC bio that doesn't cover the
>> whole iterator, since an atomic write is submitted as a single bio, and
>> submitting only part of it would tear the write. In contrast,
>> bio_iov_iter_bounce_write() doesn't. If a folio allocation fails partway
>> through, it returns a short bio, which for an atomic write triggers a
>> WARN_ON_ONCE() in iomap_dio_bio_iter_one().
>> 
>> Make bio_iov_iter_bounce_write() also check that a REQ_ATOMIC bio covers
>> the whole iterator, and clean up and return -EINVAL if it doesn't.
>> 
>> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> 
> This looks reasonable, as atomic stable writes are implied to be
> supported from 3373503df025a ("xfs: use bounce buffering direct I/O when
> the device requires stable pages"). I am wondering how to test and prove
> this (change is good and maintained)?
> 

I tested this with XFS on scsi_debug (dif=1 dix=1 atomic_wr=1), doing
1M RWF_ATOMIC direct writes and using fail_page_alloc to make the
folio allocations in bio_alloc_bounce_folios() fail partway through.
I had an LLM make it pretty precise and target bio_alloc_bounce_folios()
using the stack filtering mechanism, so I don't think this necessarily
makes sense as an xfstest if that's what you were thinking...

Without this patch, the write returns -EINVAL and hits the
WARN_ON_ONCE() in iomap_dio_bio_iter_one(). With it, the write returns
-EINVAL without the warning.

This also happened to turn up a scsi_debug bug: with dif=1 dix=1 it
doesn't store the protection information for WRITE ATOMIC(16), so
reading back an atomic write fails. I'll send a separate patch for that.

Does that answer your question/is that what you were getting at?

Thanks,
Tal

>> ---
>>   block/bio.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>> 
>> diff --git a/block/bio.c b/block/bio.c
>> index b0fcc69de653..61a3812520a2 100644
>> --- a/block/bio.c
>> +++ b/block/bio.c
>> @@ -1523,6 +1523,16 @@ int bio_iov_iter_bounce_write(struct bio *bio, struct iov_iter *iter,
>>   		}
>>   	}
>>   
>> +	/*
>> +	 * An atomic write is submitted as a single bio, so it has to cover
>> +	 * the whole iterator or it would be torn.
>> +	 */
>> +	if ((bio->bi_opf & REQ_ATOMIC) && iov_iter_count(iter)) {
>> +		iov_iter_revert(iter, total_copied);
>> +		bio_free_folios(bio);
>> +		return -EINVAL;
>> +	}
>> +
>>   	return 0;
>>   }
>>   EXPORT_SYMBOL_GPL(bio_iov_iter_bounce_write);
>> 
> 

