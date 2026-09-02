Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D214A2E02
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359645; cv=none; b=KX8XwvkQv7F5S6LTbPwzgECTsWSjZ2wCzEyCDiBp0s6VqFmqV0BqOkajN7d5ODeO28S6AyDSXl/8vq77fw5+XAnFEyWk3SqLgE/ycXNnAbuKPlle8j4xfQSuYCR1g+D/wgdqKEcTnato8EtHEaMJssHn8ZCVWqesO/B9iCVS6iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359645; c=relaxed/simple;
	bh=Q0t/tq/G1G6iYahafSY7REe4nCmiASWINvH8wSZejrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nvlhPpRp+MxeH6dKfEf8HVP1c2t3kifl09Y6i78ZM0cgXuRjz9mBi+jQmQt1FU+Z1vE5+qP2ooN7H841sNpQ5TrEDV83Q6H36hlqX/zTvljYYZDJfA3BX2ekL/sA0vgX3h9mRHkYlSnemS0AzgABvEnkhMsNw/5bRk7fb4wbFi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hmHgb0re; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BVr3REQQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hmHgb0re";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BVr3REQQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682CRKXb2001894
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 14:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d+TRtaIih3SdU3RFxUDMrL/VfpbAnPIZ43woQUPKeWQ=; b=hmHgb0reI4KPyazS
	m1EBlfFCVaCwOx5ItvaL/B/YReYwWgdiMXG/cqxtpdFqGdFZF9Ja2A/8ItVVBAgn
	ImHh1v7wQFy7/y/DUQHsdqS7oz6qW5Lrp2V1KFrjCvsqqsAG/rBV9iJwNO8e479K
	ygku/DBzFm5PIvJtu12ovbncCrgxAzqzHuNXc6Q7nNPj6UzpGR12FBSWgkV1tc/P
	3cbqhNR0yAyWK2roUmEYpaAAEI8Bwn71o827B1WYcYaYKOehrt5xbebCvF4+q+qA
	276AChT+PJKJfVoQVPGmhq5zFs2Uhl6LNg24UHGblMReLKlUXl3vDesCqQ5aLPx3
	hnEdZA==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy18h9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 14:34:02 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-66d309b367dso1019294d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788359642; x=1788964442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d+TRtaIih3SdU3RFxUDMrL/VfpbAnPIZ43woQUPKeWQ=;
        b=BVr3REQQ+YWp4cBtUpiqzdsk9dB4ZHiMD1NytynDhDVbCXrUUgtir904cI8IQB8ryP
         O+WJrxcEByXhRDEG6WZcCVCyUKpyWgpysZ3mKSDgeMe2g8tTSdYkGJW373daoI+E61xw
         3EI1rS2sWGiLL3zIGSWAS4WFW7nxbgu27igmvTQsshLL7DlRuqvCkUIS5ub2HIF+yKI5
         OqIo9Jc4IRUDPttKroIS5WAqi8rjvrOmMTD2LnOQOoAhJgwV2H+wGY1UfYKk8KPbGn7t
         OSCLT7rrkKdenenhhY+TECfRzdcAgLuCS5JSrIB40RGfceILub58GJB1OFDGrVRh1i0B
         biyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788359642; x=1788964442;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d+TRtaIih3SdU3RFxUDMrL/VfpbAnPIZ43woQUPKeWQ=;
        b=Qq8TpiaVEfdueC1jgR8mI2S+lSIywwjx+mZ4wPcW/ScBDYPAAiVxu/2G6T6yF94o01
         SRMww0X9ENaglBr+XHC46Ke9SnHHPFT5Rg3G8vbYdMDpfoQi88Y5cHlXlt2n4leZ8yFG
         auBZHomp3uu9X90XrtpSY1em1JWJtJUkkCr3GiKmOLVjObxuVEJP8Kktv93vJZVvebL2
         OeLigZ0s22pddrsUkL1pS9ded3F0ru8Zvym1x82g1f1YtiGJPDQs0Xaj3DTU6vDi+HUE
         ZPWejhxS7S7AjPoMDmTtBNg11JKnOcgWL/N1/NtU//7SLm/s854yDQOOW+4W0zgioznV
         2hZA==
X-Forwarded-Encrypted: i=1; AKwUvBwcn4tl0lC77t4NHxeywuMEXBXS7bDH5RRmNJtt1seLGuHiG9zCPcf0s/y05lsOLwRw2tPTKRYI2F84n1Q=@vger.kernel.org
X-Gm-Message-State: AFuF++kBXBBG1vubMJPjwhfmnVFpOwnUGW5SfW2KGi49MQxnvOdnHaaD
	YoFmuo/hMpCNFpJnM6NVMFZJ7LR7ggxfWQx4P3w6FLLZHX5D0dk+k0wmUqoLurIeGz0MIf/pZsi
	coFW2eV2oXzauPJhXVbEstAHhu8HC+3rYdvt/Y7JQC8NCfhwphne+OKvFGI1CYQFj82g=
X-Gm-Gg: AYBFou1TGKSWJ2FR+RH4PlnmglmHi1dP9Fg8/K/SxF/nBkJ3HdGeLwWsDm9yfYfW4pr
	kWMqfzfFuooTlpxD7B/m+0nHH7Di288YqDiW/KhaaeNqdK08GvyG2IvwlWAt4Sz2D7qhuW1SwYI
	C3z11NhyhrOC9AvB5NIQUyfGX0/EMJEo82wtjDFC0J8RBWzE4ICtu+YKrT5SehBzd1zXtaNIbWK
	VjasOa/dUMW/OXoiB6ayi13xn6Xnv6wbAsX76ZHeNn1ZpE+yi1aXZ4KM7yjcv4t6LwuNW61Ii4/
	mz9qNXNS9U6RRShuxGL9SbfPgyL5vyYmtF+goO2aB5YLUxCWkDBRRASOjGjMPsaeSIN+5V36+JI
	HEzFdmAZP19a6FKsuIr8Md+SlBpsnawmbDzNTa5dkCmJA7Eov3mAZIn7wWA==
X-Received: by 2002:a53:c051:0:20b0:66d:2c09:fb70 with SMTP id 956f58d0204a3-66f9b6c6c7emr1566000d50.0.1788359641747;
        Wed, 02 Sep 2026 07:34:01 -0700 (PDT)
X-Received: by 2002:a53:c051:0:20b0:66d:2c09:fb70 with SMTP id 956f58d0204a3-66f9b6c6c7emr1565974d50.0.1788359641287;
        Wed, 02 Sep 2026 07:34:01 -0700 (PDT)
Received: from [10.110.114.54] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-86c184e4b52sm18439867b3.34.2026.09.02.07.33.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 07:34:01 -0700 (PDT)
Message-ID: <2af521b1-3b74-417d-8b0b-e30bc6d8df03@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 22:33:50 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/11] FBE virtualization: inline encryption for
 virtio-blk guests
To: Eric Biggers <ebiggers@kernel.org>
Cc: axboe@kernel.dk, mst@redhat.com, jasowangio@gmail.com,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-block@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-scsi@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        neeraj.soni@oss.qualcomm.com, gaurav.kashyap@oss.qualcomm.com,
        mani@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        bvanassche@acm.org, alim.akhtar@samsung.com, avri.altman@sandisk.com,
        stefanha@redhat.com, pbonzini@redhat.com, eperezma@redhat.com,
        xuanzhuo@linux.alibaba.com, linux-kernel@vger.kernel.org
References: <20260827160806.1295313-1-linlin.zhang@oss.qualcomm.com>
 <20260827184219.GB2137493@google.com>
 <d81e347e-8ca7-40a1-a428-5bce6f0d4b02@oss.qualcomm.com>
 <20260831210759.GE86114@quark>
 <ca838905-f0f8-4f0a-96aa-2bc05ab6c0a7@oss.qualcomm.com>
 <20260901212834.GA3585187@google.com>
Content-Language: en-US
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
In-Reply-To: <20260901212834.GA3585187@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a9833da cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=v6EDwWi3nRXZDjx7Lu4A:9 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-GUID: ds3PBbMy4w07Gvw1ARo9T3b0xFBmi08u
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEyOCBTYWx0ZWRfX1EM+KSLO3zUL
 oF0ek4ZEOooe/Mv9exryV+VZe2/UeQAnkSYdkVKubJJZS+lfPDe9VMhad9mNv98MkE19mBCFU0X
 V6pgwqXnej1HkphgGifdmN0EaV7TRVA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEyOCBTYWx0ZWRfX2fUtvk5qA3VZ
 Q52Gw/aO0FQnWQ5/nucIpsYDS0pPbfcm1+M+3j8DOKdfoxNPOwuF1xGrRZN5hxAMnUxOjOMy2GF
 l9MH7nNusAyhWncfX83EbFj1V5jXbKm+zbQM8BuNdCJGNQ6QJm7Ww3wp3eutoa7bQEqDL4SyuXF
 2uAVZzx6tUqmEqFe+Qhq14Kne6tn95Anj2VcqktF4iy71vSBlAR5LedlHJ3qrNRRGCi+0a/J26U
 A2JUWeN1UAFj43oKuZoCg/IhC0PTL5UnWZiSkcD5vt79L5Fc8IckVzw46oa1bnmM21m1gPN6IHY
 bW4nR66LJBlDQa4hVHNv8ioLFOARiEf0HMZc2efzn6+s2k+VLiLQCxilwGLbbq6CygyOfZH6pY/
 a3kozQCM+EGFEJNcFTzU14SG+j/IaaW1dXPFAugdmh9pvwP7IPy5G8mAqpszoMx4Go7BeBqFkE0
 N8Io7TWusTioH2MpcEQ==
X-Proofpoint-ORIG-GUID: ds3PBbMy4w07Gvw1ARo9T3b0xFBmi08u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020128



On 9/2/2026 5:28 AM, Eric Biggers wrote:
> On Tue, Sep 01, 2026 at 04:22:33PM +0800, Linlin Zhang wrote:
>> With this design, I believe there would be two VM exits associated with
>> encrypted I/O:
>>   1. Key programming
>>      Before encrypted I/O can be submitted, the guest needs to program a key
>>      into a virtual keyslot:
>>      
>>      Guest virtio-blk driver
>>          -> VM exit
>>          -> virtio-blk backend (e.g. QEMU)
>>          -> ioctl
>>          -> host virtio-blk proxy driver
>>             (stores the blk_crypto_key in a virtual keyslot)
>>
>>   2. Encrypted I/O submission
>>      The I/O request carries the virtual keyslot number and DUN:
>>
>>      Guest virtio-blk driver
>>         -> VM exit
>>         -> virtio-blk backend (e.g. QEMU)
>>         -> ioctl
>>         -> host virtio-blk proxy driver
>>            (looks up the blk_crypto_key associated with the virtual keyslot
>>             and submits I/O using bio_crypt_set_ctx())
> 
> Most I/O requests only need step (2), since they reuse step (1) from a
> previous I/O request.  The kernel evicts a keyslot only when it is the
> least recently used among all the keyslots and another one is needed.
> (Or when eviction is explicitly requested.)
> 
> This is especially relevant when only a small number of keys is used,
> like is the case when the per-file key support in fscrypt is disabled.
> Programming keys on Qualcomm ICE has always been very slow even on
> physical hardware, and the kernel was already designed to mitigate that.
> 

ACK

>> I have been wondering whether a model similar to the passthrough
>> blk-crypto-profile used by certain dm targets could be applicable here.
>>
>> In such a design, ownership of keyslot management would effectively and totally
>> move to the host. The guest would no longer manage virtual keyslots, and the
>> host block layer would continue using its existing keyslot manager to allocate,
>> reuse, and evict physical keyslots as needed.
> 
> I think the virtual keyslots are still useful so that the key bytes, key
> size, key type, algorithm, and data unit size don't have to be
> transmitted in every I/O request, then all revalidated and processed
> again.  There is a reason that inline encryption hardware uses keyslots,
> and I think the same largely applies to virtio-blk.
> 

Thanks for your clarification!

I agree that virtual keyslots still provide an important benefit by
avoiding revalidation of the crypto context on every I/O request and
reducing payload for most encrypted I/O request.

One concern I had is around ownership and lifetime management. If 
key programming and I/O submission are exposed through separate interfaces,
the implementation needs to ensure that a programmed virtual keyslot
cannot be modified or replaced unexpectedly before the associated I/O
is submitted. Otherwise, I/O could end up being issued with a different
key than the one originally intended.

As Stefan pointed out, this sounds more like an object lifetime and
permission model problem than a keyslot model problem. My current
thinking is that blk-crypto-proxy could own both virtual keyslot management
and the corresponding access control. For example, key programming and
key eviction could be exposed through blk-crypto-proxy ioctls, while
the block device and its virtual keyslot namespace are instantiated when
the blk-crypto-proxy device is opened. That would allow ownership and
lifetime of programmed keys to be tied to a specific file descriptor context.

Separately, regarding the I/O submission path itself (patch 08 in this
series), I'd also appreciate your thoughts and block maintainers'
opinions on the direction that would be preferable from a block-layer
perspective.

My initial prototype introduced a dedicated ioctl for submitting I/O
carrying blk-crypto metadata because of the additional validation
requirements around DUN handling and data-unit alignment. However, I
understand the concern about introducing a separate I/O submission
interface that bypasses existing optimized paths such as io_uring.

Do you think these blk-crypto-specific requirements should instead be
integrated into an existing interface, such as io_uring, or is there any
precedent for introducing a dedicated interface when additional crypto
metadata needs to accompany I/O requests?


> - Eric

