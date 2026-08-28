Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D566360EED
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787931489; cv=none; b=M2o62VCkQXv5rkISmq10gbqsqBMfWv3dgevkuuhrIAuXMVADI381KcMfgts2hdurzvW1zYETgnmZoSSHLHu/oPQJ5a+ascqo47haKX0JRi+ZBfg1OJjxQHcqX49pPkeSybDSb/IrN+CNPMepf08wt7qpljiresXBZdHfOf4+QO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787931489; c=relaxed/simple;
	bh=cz3F+ErOy0RXfPiWVt2Rk09qsZ11xAKIDCmzOQpDc10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NIkhrF2tkLeIjN8d0WnNEg8IUCN9LTethMfbNMhxJVll/Sc55pnJ18dTpn7o+5sWfZ3YLBQtC7NXth66/IiFz1z3QJ/6ov4QDyL5g2v5+9JgWPuuNfMd8Ftd+1VCcfgcMfqjHUfiZJsr0j4G0kJRYOQ+2WiC5fq4/jE4FEDTDHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K92Tm9LY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kDXgz7Rk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K92Tm9LY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kDXgz7Rk"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDklWu3280262
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BJdt0aDQo3QWYjdT6UEMt92s1/oBkWrWP3BZCycXw4Y=; b=K92Tm9LY6warnFMn
	r+KgWglRN5lTmnNv4TYdixWUW6+LNsArcFIQRkefUgXn/+GVgm1HHB88snwc8YWk
	EW4K64uIBy6dTmpLtqj+AjTGh9Vdh0EjPhFic6UXf8P3SCkwVsGsbq8ZF5Z6kSKO
	SGmJo81d+l6vdqdOmM2lMkUEqoj4z85gHnp1IfCicCqL/suABpsn+Jd3mpcAvQ8+
	OHf+bhdX6IrbS7YloXPyPevYHkCpedIznh9wsz+fLli61XmyFFADDoyacKHNH1+K
	ewHwLWtaer9PqpugYeNWIFwKeX9mCLHkdmvdeZyCLVkBCBbuFUGCbRhrzZEbwsaZ
	1JX+4A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb62h1x73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:38:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso2361952a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787931486; x=1788536286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BJdt0aDQo3QWYjdT6UEMt92s1/oBkWrWP3BZCycXw4Y=;
        b=kDXgz7Rkj0/gSnRi//S0ycxr6nu4QTNh4Lpm/YK+JKwhHuQUet3w3LIGGP5+pva4cw
         JrHNHyibZbjlEiQk5JkqvylwtHe9VSIDZ4P5mFTJynHZ9ON4CLTLFXa9eL4/wTNFdMTy
         pzq5aynGweDQhLEB1LSQstWPJPChmZSh0uJustGMSrK2i63a2mz/GRwD6PGL9uUkQQ1j
         jIobLQYCe3H3ufcJpUeX6uuHWnqMqsbI3vZov/7BqGaiGJTzJ9OK9ShOqxw7k02uuR9D
         3rS66xCd6i5ubfS1XvKquUfqHE30BverZ+HpbUyk6+qRmy7KY78ov2rltnOxWKuJLPbT
         tRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787931486; x=1788536286;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BJdt0aDQo3QWYjdT6UEMt92s1/oBkWrWP3BZCycXw4Y=;
        b=Md6a3KXYqs9cdgJdbStFxW8S1DF7aHqo8H2/eKeht9FQ9/xUy/TeQ/EfTwdp3xHBdM
         IOdFlGIy0vkrTA/SubIX1t5DP49a86K4DsNh0tmgwcyIDY17DNXorh834waupSXbqM3j
         Lv1s683JA+3uQF1cGOohXyS5atjl7GJAf2WsxbKy3Ii06yj5i3tctDHlyf9KDtaFQ4lZ
         pt3bjArk3l/fKQDbXzq9FMJLSA6fj3fLHhmvzj3GMkNdAPEr1qOhkch95q6IV891Vqjf
         0vtITudAL5P/QzJ55tX22w6awICqA3thVBEcD824jb0sG5NZL7HK0/Onf7C8heuDy3rG
         Mj6w==
X-Forwarded-Encrypted: i=1; AHgh+RowUUBax8UOhqajfhRsNZ8OEholiUpDUl91T7clovVMsHwWafvbqei1Bi9A4EkIUL4zd5tM/JnwOMM0ncs=@vger.kernel.org
X-Gm-Message-State: AFuF++kLc5eiKSDDo/X4ce0V+cLQICt2RwZB4T1oy7dlphIq8n5bMM/Q
	LGkvAfs95xRKtmrVYIOaSs7bnDdDjL1IBJu/mh2GyH/uVzWZBszPC5ukQAhRsyQhs98YmI+v68A
	w9uteknmDtYV3M6uuEVW122/VgsDdrzhT+GofoDN1Z25jw83FgCyv1bXBBi9Eva/Cg8o=
X-Gm-Gg: AR+sD11WDHYduvhvansSF5vVG+a0TkToGVUJNpk6aLz1zz9aHnvVAcvPLqF8rlqOHpy
	yLD/EYD+tYeh5tJJmxOiFZwH9RZwO3SQoflPQHpXJLmx8kFytpSjLOrGMbRDS+69RRDLOMMAZbM
	FB+bb0rVTgZcCscRNyNiirg5QYlhOXbEyYUSVHrIP3rn91hZfxF4vlBNGzmeylkSVndPk+16Rlb
	7T3GU7ktn+qBxhopqzkpNKWNxU8PBjCS2zfNVsWRP/WIKhG4ElimEhUpztfp4H4Q5Ze4BTqel5E
	jxiwjlVPsU5aEdZx/xynXZ6TVHqYHdfUk9jsBiGdDqIatIlLhNt+0i3vfwOIcdVyzsAmDM+a62E
	Q5o25ctRqB7AK/k4BSBrrYRq+uyje+dWWN+pQqQCNPV0GddPUgM5piv4Y9Vg=
X-Received: by 2002:a17:90a:d44d:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-396d0c15f3cmr16719876a91.0.1787931485827;
        Fri, 28 Aug 2026 08:38:05 -0700 (PDT)
X-Received: by 2002:a17:90a:d44d:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-396d0c15f3cmr16719807a91.0.1787931485324;
        Fri, 28 Aug 2026 08:38:05 -0700 (PDT)
Received: from [10.110.102.109] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0de4d92sm6485178c88.13.2026.08.28.08.37.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 08:38:04 -0700 (PDT)
Message-ID: <d81e347e-8ca7-40a1-a428-5bce6f0d4b02@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 23:37:57 +0800
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
Content-Language: en-US
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
In-Reply-To: <20260827184219.GB2137493@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEzNiBTYWx0ZWRfXy306+fRxU6N1
 Ybx/8k5FWTyQNU34h/g1NW1/PCa68tmOyxosLPJtqFjOsrXnoH9VE70lF2L3W9nJQ49YEP+qjqw
 l5Rl+kjFf98EK2n2BWRiU2xxILB9lwA=
X-Proofpoint-GUID: BoCjAJ4Rk2WeC8yUfaBzpOFZSo8FVXbN
X-Proofpoint-ORIG-GUID: BoCjAJ4Rk2WeC8yUfaBzpOFZSo8FVXbN
X-Authority-Analysis: v=2.4 cv=I5dVgtgg c=1 sm=1 tr=0 ts=6a91ab5e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Z1znHgkL5aNkaA1FTC0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEzNiBTYWx0ZWRfX/A5r0QseJUS/
 2SnF2b8I4zSGmAiV9FT0byn0KGrrqi8rfS+qo1UpthxY2sURVmt8RflthXmyTwFsd4yjItWVRN6
 F8+poiVKBG5uMVnDydlS8AYRz4wpuYDnzWzZjIOdCKhh/JSYhnr/kANNtCctPsAInsZyq0CKtPf
 B5XAadX3CHwqSZwDCi0zbCl1iW9WOan/ol1PIAfEgkL55ut5II6A7IImTtWsMTs/mGy2sKpNdRk
 efXlbjV3CR3VtpmTLHD3YTUBCmgUyMRR+hLMHRIMnLA1NDAshufKxWjAytASKmE1Y5hyr2EzSLk
 t+WQQ2bs3DcMFRv2KH0JEWxaMKHLcXEoB8xBfg1d4PFWV3XuDQhID8iH23RZyFL1TZ+p6jwnz0X
 NU+58xg4AJZ1GREfTuyvsQyS4xKDceNahqz4tqCHq8IPpqTqEZ8F/IYVm8o/QQseeaKbS9R23ds
 YtGdI9YQt4AISosWSqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280136



On 8/28/2026 2:42 AM, Eric Biggers wrote:
> On Thu, Aug 27, 2026 at 09:07:09AM -0700, Linlin Zhang wrote:
>> From: linlzhan <linlin.zhang@oss.qualcomm.com>
>>
>> Current virtio-blk does not provide a mechanism for a guest to
>> program hardware keys or submit encrypted I/O using pre-programmed
>> keyslots.  It drops the crypto context when issuing a bio request
>> to the virtio-blk queue, preventing inline-encryption-based FBE
>> on virtio block devices.
>>
>> This series enables File-Based Encryption in guest VMs on Qualcomm
>> GVM platforms where the ICE inline encryption hardware is shared
>> between the host and guests.  In this environment the guest kernel
>> has no access to the ICE hardware directly; it supplies a virtual
>> keyslot index and data unit number with each encrypted I/O request
>> via VIRTIO_BLK_F_INLINE_ENCRYPTION, and the host must translate the
>> virtual slot to a physical ICE keyslot and submit the bio — without
>> transferring raw key material across the VM boundary.
> 
> This seems to be designed incorrectly by not making virtio-blk itself
> support key programming and eviction.  That complicates things
> significantly by then having to handle the key programming and eviction
> out-of-band using Qualcomm-specific SCM calls.  It also means that
> adding other implementations of this would be very difficult.
> 
> There are some claims that not transmitting keys across the VM boundary
> is desirable.  But that doesn't seem meaningful, given that all the I/O
> is transmitted across that boundary in plaintext anyway, and also it
> seems that hardware-wrapped keys will be supported too.
> 
> Please make virtio-blk support the key programming, eviction, and
> HW-wrapped key management operations that are needed for this to work.
> 
> - Eric

Thanks for your comments!

Not making virtio-blk itself support key programming and eviction is
something done deliberately. Based on that HW-wrapped key management
operations are also handled in the out-of-band path.

There are bellow 2 approaches I investigated to let virtio-blk programming
the key.

  1. virtio_blk implements blk_crypto_ll_ops interfaces, including program
     key and evict key interfaces.(Same to 'the virtio-blk interface standardized
     blk_crypto_ll_ops requests' mentioned by Stefan in the virtio SPEC thread)

     The guest's block crypto profile manages the keyslot in virtual slot
     format in this scenario.

      - block crypto key and virt_slot index it passed to the hypervisor's
       (EL2) device emulation (QEMU, using QEMU in the following) which
       runs in userspace of the host. Besides of transferring the virtual
       slot to the physical slot, a programming block crypto key UAPI need
       be added. Follow current blk-crypto design, it may be like
       BLKCRYPTOGENERATEKEY. I thought this results in a security risk that
       allows userspace process a key into a key slot.

     - For key eviction, it's similar to above key programming handling, also
       need a key eviction in blk IOCTLs, but leads to the security risk
       that allow userspace client to evict a key in a key slot.

    virt_slot, DUN and DUSize is appended to virtblk request during crypto
    I/O.

  2. virtio_blk implements blk_crypto_ll_ops interfaces, excluding program
     key and evict key interfaces.

     The guest's block crypto profile doesn't manage keyslot for the guest,
     the host's block crypto profile manages keyslot for both the guest and
     the host. The trigger of key programming operation is moved from the
     guest to the host.

       - The whole block crypto key (key size, key bytes, blk_crypto_config)
         and DUN are appended to the virtblk request during IO, a little
         high payload.

         The backend parses the crypto message in the virtio queue and
         construct a block crypto key and DUN for the bio_crypto_ctx
         set to the BIO. So that the IO flow in the host can program
         the key. 

         The question is that the blk-crypto-profile distinguishs the
         block crypto key via the key's address. But the host has
         different key addresses for the programming and eviction key
         operations of the same block crypto key from GVM, because the
         key is re-constructed in the host for the key program and
         eviction operations. 

         To fix it, the approach I thought is maintaining a new key
         hash table in the backend, and comparing the block crypto key
         content and DUN parsed from virtio queue with that in the key
         hash table. 
         My major concern is that this need keep the keys synchronization
         b/w this new hash table and the blk-crypto-profile's hash table
         carefully, avoiding that key is still present in the
         blk-crypto-profile's hash table, but removed in backend hash
         table. Another point is that the whole block crypto key and
         DUN are appended into virtio block request per crypto I/O.

       - For key eviction, adding a key eviction in blk IOCTLs allows
         userspace client to evict a key in a key slot. I thought this
         is a security concern.


     This option doesn't need map virt_slot to physical one.


Taking all the above into account, I made a compromise to implement
blk_crypto_ll_ops interfaces in a out-of-band path, which lets the virtio
blk only need focus on the data path. I agree that it is complex than
the second option mentioned in the above, but small payload (only
virt_slot, DUN, DUSize) in the virtio block request and no security
risk of key eviction from userspace.


I would like to hear your thoughts about the above and am appreciated
if you could share your insights about the design of inline
encryption in virtio block.

Regards,
Linlin



