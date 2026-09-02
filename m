Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0BA386C3F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788328990; cv=none; b=epiU+G68iKNfOrfjRvcRIJ3Xw+RUPU+UmvRRuvsG1RhkVGxsNEYW4j8v6mOs7nfrs3tGrMPCfSLy+71x3g8Xmgzkrd9CXl5+ecae6JBfWYiyyUaJQByTl/8b2UQ6zhFIOCHhPvs4aKgrM6CWfdRCJOwXy/RPpcLWeEhVD3QETqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788328990; c=relaxed/simple;
	bh=lbpHvV9nwxHUmABpWmOFrhwkTXsjfOSaP08IrwX0zyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bRzp62PGg3d3zyh6UqKZckCKnehtk7w+IkcCEKTd7pL4Bt1vw9CT/l01vsPSAiaAoga2rH6RYPp4o9+oTzZL5eZU9aQL8/qdFoFQLlQjWO6dzRy7aS78TugbLT52/Yt5YEazpaXi0ejtKkT4/q0fb/6lAHNKPVxtMiNOfApPCI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fZXk6xUH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KYonrtqb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fZXk6xUH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KYonrtqb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6825YFWL014435
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 06:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EcSnLB6WKmAsBeRVJJ+St11n89Sukxc1aDDh+R8r5IQ=; b=fZXk6xUHRubKSz4v
	PWhkAY7U0kvr7kfm3f9+8ynciDF6bPIo655pYwp75e6CrJQJJSXuVoELWNyLQXKu
	8NbxmXHh9TWZ/6CUdoNfLK/3TcPzELEx2C1lr3zhU5LJLHKGVwEGqIeHC298ROwG
	Jq1+zES01/2Rj9c2aqlqx5LWp4sZf0WBJ3SLV1L4L3/pwYHF+uERoFGNRCn/y2dj
	RpMft9/++EtmMnUpM8LYJAl28inGtjTm0+E7iLKEq55Gk05aiQgUfIBuLwVOxOJq
	QQy8JuifLdoY8CpUpm922uwCMnFLLYCk5UhhatZbvpQ5NMmS1sjdohV7rxsQClfq
	omwfCw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge397acyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:03:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398d7e0f3b4so983824a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 23:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788328984; x=1788933784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EcSnLB6WKmAsBeRVJJ+St11n89Sukxc1aDDh+R8r5IQ=;
        b=KYonrtqbd7vL4151Rfih8vykYU0k/roN24sz+cq4yO91efPmrU3z4TIJW3vA0u+lF6
         y1YWpkJjn/DfE2fUAWGC+vqlXb3IAB8I5R0XrTZSChK97RRckYVfygyqcCxp9HeEKbkX
         VVEOugPTfdwy5CPQgaiBx8yEQSNUK09zBVQ04tWyQ0gTtb1XFudmHpLpota9duGmR+Am
         ub7n92/4qaH93VSMDc5jvIyWS+Duf5dVOspbC+BnIiGbpazZo/RgNTpwn7AhcR0a6VnY
         SosQUOBkymSFg9zFqNKUgwOi8Z38Gvu88cMK00R83x6WVXoNLb3CAdOtwlYTt2o5SalE
         cXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788328984; x=1788933784;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EcSnLB6WKmAsBeRVJJ+St11n89Sukxc1aDDh+R8r5IQ=;
        b=dDYDvk1T4Y12yzrOhuMjj+2P4S1Qk1E1+ePJftjvEsTBcWoCOXBX5Jr1LpiNMArRNg
         w00f9dtw/J0ks5+Uw4OleZZDymWlAU38ZkfhYflhn+oDIEQEFjKHdnV7aCPxcjeTMfDY
         etgYwuLzhx+5cNOhEO9JTekOSgOQxTXWDzHI5hdqBFs84uzHOLitYXyZimzn3zdHSqPP
         2k4SQxBS1t8lA91s5IeRHC4zAfHyQ7G/EAQAlVQ/CECY+V6n2fLKjeflY19pYpWzqgFd
         vmQSTWwmJT8eWHZaKPUes2SIyXiI0iml0IM0+rfl9vGUQeN3IUcghZgwo1U7r9WsVP5u
         BQpg==
X-Forwarded-Encrypted: i=1; AKwUvBw2Nw4nhpAHpG9dWyafvaFfmnKwr6ObSxnf7UmCAuBHrs7/upLd2dh56z42MgSim80wn18avAu37gn+qVQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nVtDEIG4ORbkUOZ1m1Ali/s5A0rQEpCN+3jLlIwk8y7oOabpL9
	8kxyEr0k+oUOPR2UGvFl10lQuoPjbDfsSjMKSeD7ybhu3+hJ2ynWdFaBCh/XUWCJHFlpSyrdxzn
	MFbcxpKgjFKBItBQlI7LOcSV1tge15isxLKDZTKQ/sK/7ABQ1nV1l+rRtYrErLzA9tb4=
X-Gm-Gg: AYBFou18mxtAOX8g3ccUYR2SomLPFmSuRzLX6F1F7BsGf+VkRKdq/JU+B8K6wd+vI/0
	ltNbwOMwTE2TDVONge93KU98CJJSbxnLllYsdgDhinMRGNp6aON6DwXl5FyaYbgN+Dq+a33SDas
	gp3zBs4dohHlSY2VplJsjw8kzoB6zBvYhCM9Vf9iTaFI5I2Mm4AJJR8UrVi7tXNyvJYjbnoHJA1
	3uPZ9BILBXBhljz3RWDTT8NqjKFHifTYRDvJu0Yd8iDufvHmaJ5nd8If9PctjKYA8XhoyEBUv7e
	dGpmoBaAVAnvT4PSBlJiKjt8LGn992RMio+3bIjBLuG1FXk90UhwEfxl5arTAq/uQ3jFh8uyxWO
	y+U/BPKJxFdfGExREP7cPdncGbDs/CPuX+CAOE+30xTDvW91HcSvYm+7j
X-Received: by 2002:a17:90b:55ce:b0:395:4de5:1054 with SMTP id 98e67ed59e1d1-39aee066e9fmr3902087a91.16.1788328984256;
        Tue, 01 Sep 2026 23:03:04 -0700 (PDT)
X-Received: by 2002:a17:90b:55ce:b0:395:4de5:1054 with SMTP id 98e67ed59e1d1-39aee066e9fmr3901979a91.16.1788328983698;
        Tue, 01 Sep 2026 23:03:03 -0700 (PDT)
Received: from [10.110.50.50] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430e9eb4dasm5534267c88.2.2026.09.01.23.02.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 23:03:03 -0700 (PDT)
Message-ID: <9352d44e-ef61-43f5-85c9-eae267762e84@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 14:02:56 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/11] blk-crypto: move bio_crypt_dun_increment() to
 the public header
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: ebiggers@kernel.org, axboe@kernel.dk, mst@redhat.com, jasowangio@gmail.com,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-block@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-scsi@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        neeraj.soni@oss.qualcomm.com, gaurav.kashyap@oss.qualcomm.com,
        mani@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        bvanassche@acm.org, alim.akhtar@samsung.com, avri.altman@sandisk.com,
        pbonzini@redhat.com, eperezma@redhat.com, xuanzhuo@linux.alibaba.com,
        linux-kernel@vger.kernel.org
References: <20260827160806.1295313-1-linlin.zhang@oss.qualcomm.com>
 <20260827160806.1295313-8-linlin.zhang@oss.qualcomm.com>
 <20260901191342.GC729142@fedora>
Content-Language: en-US
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
In-Reply-To: <20260901191342.GC729142@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA1MSBTYWx0ZWRfX2NLv0LBTBYci
 b9GceQlNzqRIqm0ClbwVgBSpGHMhsRsTnhix7yyV6frHDFjxdzH6TYh1W1RZ6ABdVJFUGDAarBS
 Ywh2F+Ir4+FCXx/0Hol04VcSxKrAML0EJwQe2G5KiQ77Tt+z8PMbUz5r3qpr0aI3kbJ5FeKXKKd
 6LvRoG3yYJBrG0eatlNXrSrr8r4y21Im8+afv7OllJ7yQkp7PUjvQuTBieHWnlkHYw0IrLc9+m4
 InhemHGu1c8V+7VHaEepUmP8HL60L2P1gkPrsm5hxkNVauA2vLGuASgfmKpVfqr3+B4YOO9wBCZ
 6j2GsEbQqHmFWh9U+4s/cRZk8OGZZW4tLxZwmith/ro6FW/uPH+/uSoe9XyHmyE6BrGMnbR2MdN
 e889WQ6CL4Js4rzubnHoe4296xbotY9/YawLvbhTpM/GdOdQ2zTTtIygsBBglgMzjXXqewc+dUn
 iDelwhSoXdAKWvSnqFA==
X-Proofpoint-GUID: BBlxw8fRyfXQsTFjEihMvZW5cax1A2TC
X-Proofpoint-ORIG-GUID: BBlxw8fRyfXQsTFjEihMvZW5cax1A2TC
X-Authority-Analysis: v=2.4 cv=Re6gzVtv c=1 sm=1 tr=0 ts=6a97bc19 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=-2wExInEUDM6fBQoz8IA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA1MSBTYWx0ZWRfX+vCNdyA2IiCj
 XwKJ70gEI8RUSUSpJVZZPp00iQqsyPyRwEAwm4Bp85vuua1ygvAwmpMJy8q13kGv6ibtPkB68hA
 O6j9xCpzWnEq4a4T64FTdDxBoGyLoRw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020051



On 9/2/2026 3:13 AM, Stefan Hajnoczi wrote:
> On Thu, Aug 27, 2026 at 09:07:16AM -0700, Linlin Zhang wrote:
>> From: linlzhan <linlin.zhang@oss.qualcomm.com>
>>
>> bio_crypt_dun_increment() is currently declared only in
>> block/blk-crypto-internal.h, which is not accessible to code
>> outside of block/.  Drivers that manage inline-encrypted I/O
>> directly need to advance the DUN across bio_vecs within a bio,
>> or across multiple bios in a request, and have no other way
>> to call this function.
>>
>> Move the declaration from block/blk-crypto-internal.h to
>> include/linux/blk-crypto.h alongside the existing
>> bio_crypt_dun_is_contiguous() and blk_crypto_init_key()
>> declarations. The implementation in block/blk-crypto.c is
>> unchanged.
>>
>> Signed-off-by: linlzhan <linlin.zhang@oss.qualcomm.com>
>> ---
>>  block/blk-crypto-internal.h | 3 ---
>>  include/linux/blk-crypto.h  | 3 +++
>>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> Other include/linux/blk-crypto.h functions export their symbols. Does
> bio_crypt_dun_increment() need EXPORT_SYMBOL_GPL() like
> bio_crypt_set_ctx() and friends?
> 

ACK

your're right. EXPORT_SYMBOL_GPL is needed. 
It will be added in next patch.

>>
>> diff --git a/block/blk-crypto-internal.h b/block/blk-crypto-internal.h
>> index 04035d237f03..32c720aabba7 100644
>> --- a/block/blk-crypto-internal.h
>> +++ b/block/blk-crypto-internal.h
>> @@ -26,9 +26,6 @@ int blk_crypto_sysfs_register(struct gendisk *disk);
>>  
>>  void blk_crypto_sysfs_unregister(struct gendisk *disk);
>>  
>> -void bio_crypt_dun_increment(u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE],
>> -			     unsigned int inc);
>> -
>>  bool bio_crypt_rq_ctx_compatible(struct request *rq, struct bio *bio);
>>  
>>  bool bio_crypt_ctx_mergeable(struct bio_crypt_ctx *bc1, unsigned int bc1_bytes,
>> diff --git a/include/linux/blk-crypto.h b/include/linux/blk-crypto.h
>> index 33ae52b77522..c9f436b6b2ef 100644
>> --- a/include/linux/blk-crypto.h
>> +++ b/include/linux/blk-crypto.h
>> @@ -181,6 +181,9 @@ bool bio_crypt_dun_is_contiguous(const struct bio_crypt_ctx *bc,
>>  				 unsigned int bytes,
>>  				 const u64 next_dun[BLK_CRYPTO_DUN_ARRAY_SIZE]);
>>  
>> +void bio_crypt_dun_increment(u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE],
>> +			     unsigned int inc);
>> +
>>  int blk_crypto_init_key(struct blk_crypto_key *blk_key,
>>  			const u8 *key_bytes, size_t key_size,
>>  			enum blk_crypto_key_type key_type,
>> -- 
>> 2.34.1
>>

