Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9981419A4
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788157322; cv=none; b=g7Reo/vXYj/Lc0h52hon8FtwdfCGPKjuBwwiHF5Dc8igsq3uV+VnAquWGlO8cxgSe7MeBNSGPD3lFVX8jedCGu6PW8H6lt22zB4JxGlhzY0gjoc6towi+hG5UFBxtsumEE0Nn9dRVPNTm0eu8GxMBbAyQaFlDCl/0LLARTjSAos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788157322; c=relaxed/simple;
	bh=WqBC9k9dQo1Fkp8FeGnmJpcacq5DVytNnWXm1742Lso=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=UujsxdEWGxeRPxpyeXaWHJ9chfN10QoO2H+h446BAAGfRiuGnBrkVQpcKH89XD/wyTm2O8+wQtPhIWkOxHpD1dhsAh//j1kP/dFChZCJCPWZZOiyvQPo2s9Vp87Shezo2O9XV7Qz0Hw40IbUizgSUU8vVAxAGyGs4l0hPTdoIBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kn1YWkQ+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CTXoUPlF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kn1YWkQ+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CTXoUPlF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52QaS3678801
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:22:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wcg0Ez9nJOyV/8LnbrobWqWP9ec96FQgJeXfFdTZe98=; b=Kn1YWkQ+vhRQHjuO
	SVI5IsM2hTE6k/B7tdf0xyH4PlNsXgYl0N7x5vnWCEca9O8XKKg3jahYZUWkPR0n
	+qeSVd8FRmIHiewURxfvjSJx+uB64pJtZrLrdWPHjCg9DpizkuocQjaFcrVAYkdA
	WDc0L3w92gEM5Q6XgPxrcAVACH75rTknrsWOyWoifZj6aMGpw+/JdPW8KpmmqdTR
	2DNyt5eb9xVa2A/rliKmaFuK9WT9pS/5fEYovg4utjnON5Xd8G3nJx79Paor08QO
	Y4IZqDQaCcKxlz8U8G4vQ1MSFmarnUr5FdbXlPv8RgNsz599hGjCmB4+7NR8x6nI
	mTa+6g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv8h14qv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:22:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so5482953a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 23:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788157320; x=1788762120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wcg0Ez9nJOyV/8LnbrobWqWP9ec96FQgJeXfFdTZe98=;
        b=CTXoUPlFxDy5AjZY6a2DZj94A/vhfWRpXd7rGiup+u4Tc0zbU9uNwhexOwweSvyxPw
         2Zso9xODn7Yp80lPj8bZMMYTew5Q10i5omdUpQRrXlAtNQqSMlAAdR+Swko4rG3RennM
         tjZBgjEvcxAzZ3u8+Sq6H7FF7K5Ll4nCZji9S7FuIHyj06qvOGeV/kR1tbP5p90g8TZ/
         yx8aHBQGLq7SibJMxdi3CQPcBVKNWQVZRD3TWxvevGN0lmgoAoPPLXJ3V1B112u+IraR
         g46S8pzPTWVJvzmDM0bmrpcPR1QHEcgun1gjSGmGbyxNLPrFP3pQ0WHt94tGON4JuLeP
         4Iew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788157320; x=1788762120;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wcg0Ez9nJOyV/8LnbrobWqWP9ec96FQgJeXfFdTZe98=;
        b=qQXb/pxgnS3+EO3VMDC2kQMExrenT8TvJU4t03iLETMjrfhVxU4qhtXR8z+5V3JHQr
         3+4tQ4HXmqqlPE+rRNYmWHx3+HmTem+PV1D5z+XfzJ/JfbppIHkMCEBDWND15blckc4a
         QM17B00Vi2nJEkvR4vP7UMH580xhobclv/54VNx1OKPP/CBP0Dlr46+1WHtJgOPOeUa4
         SH6efKklTF4uu7jwAw2n4cNv8o5bi9ilGavQ2sM+tlaeNuIjFghyRiTADIWTUNURKD17
         j1QmRkKQjSmrQJVJvGkAsm1KwnX3BfBKNwjxus4/AGYKkD1gqJtzJZePZ1IpZ0T//3vZ
         hgZA==
X-Forwarded-Encrypted: i=1; AKwUvBzIgFEc9W/FnEH9ZGKLc04CU6Gp8+OuFtrV/v+9H6FmZ8IdrzfhL6JFaYKFRahdgd5iHZTuFNPphhqx0f0=@vger.kernel.org
X-Gm-Message-State: AFuF++kOHQH/UP0kOyBC7JvansjOklzYuxbf/O2uReAjrqKxVVtQQjPp
	8UhRDTNIwOr0juut3e4EKf4R9lK5/tq3bL1VDQZt/JvlORpSmJq5WJ4J5r0jZw7USB8SvgzgBAD
	CjRnMsrTyGAes09qRU3vdQD+L77XyqTg2U/s8cUlk2r+3xiXBf2865OLPx4V2cnDVa7M=
X-Gm-Gg: AYBFou3gI30W9rPBNp7yJEGFInPg54+OqJ6jd/ImNDnr58oD5Yypwz/ALRqvZWdwr65
	89c8emZ6H4OWdRnQkNKbF/OCXkNvCdmJ4yytwBzNIUtRtZrgeue1u+0noXHAVccKv5EZN0yYzjd
	scLqzZBv+MFSahQgr6xzq585JFGrUZHDaOd8RQ3ptk09mVTWHbmYlMbmoQfS8r0N0o2wl++leWN
	jmvVi3Ah0f1muididhlj+xZzweO5b37wG1zk7/RYZ5GqJ+R2L3xQofoE1jo18DnVI+klDZYIQYx
	WfV1JRidHU031uX9+3uqeacxgjrKXEpr/nJk3HBvcyyV+3Vv5973mnT57d8zAha4yn1jr4Wg3fP
	EePY4t0mu57c/kRYeKiYvMNW/zbrqBIYAzo9dfj98J2Do34+CtxVs5A5FVQ==
X-Received: by 2002:a17:90b:4d0c:b0:37f:c97a:939f with SMTP id 98e67ed59e1d1-396d0dd5069mr33909577a91.7.1788157319623;
        Sun, 30 Aug 2026 23:21:59 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0c:b0:37f:c97a:939f with SMTP id 98e67ed59e1d1-396d0dd5069mr33909493a91.7.1788157319060;
        Sun, 30 Aug 2026 23:21:59 -0700 (PDT)
Received: from [10.110.79.126] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d38207sm25010026c88.5.2026.08.30.23.21.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 23:21:58 -0700 (PDT)
Message-ID: <e09d1622-29aa-43f3-8e3f-776dc78c3641@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 14:21:50 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/11] FBE virtualization: inline encryption for
 virtio-blk guests
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
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
Content-Language: en-US
In-Reply-To: <d81e347e-8ca7-40a1-a428-5bce6f0d4b02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DY0nbPtW c=1 sm=1 tr=0 ts=6a951d88 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_h6NAR8LnRz2utxSRfIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA1MyBTYWx0ZWRfX9L3ujWS5U9A4
 vDKe6GRUp6nfl05SrRWu7zigBK9it82+LR//WrXmR9RggCKiQM+ZMg9zrtn4QY8tNE6HSido7x5
 wJmEJytdPTC65ADA1NrJ12qgM+8/+wrL6xyAMyAg3JzrIWrPxDB+zXmEEjU38zZmNYHuva3Qd7l
 y33KAJAGSvV1j5Tw54dOb3NkCmmj5G1rFUXXajawMLdBj+ukZTCjnvD7DYixxSGVlTQKgXKp0O4
 EfaAC1YIePxPRh0JhqLnKU82pk5MdzDpzzGRS2uY2a8w4iVbPcCg/s5qSex8wmMsHONLqRHM51g
 oM54ieqOAM59JSxX/dA3ZKk6RzHLwCTuClAPCY4At4C4BvyggTD8Wx7BWR6xyQkOKx+7b84+H0t
 pfpT3B/TBshfjAVqkQ7cD8njeY8uug/Xs4FEE+Te/T9xIE1/EkyzVQGQqCxkx57XKP0XzLvEN0K
 4OSf6GJh4J+Yp01RbVg==
X-Proofpoint-ORIG-GUID: LhO96_RtiC02lbvBXo2i3MehqPCgVbR6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA1MyBTYWx0ZWRfX24v/miu1hWX4
 epKhv18fb7LOTgAWjyzM4b/519FPre2FKCWAKeizdVZYmJ3IGLxX6M377YtGa5gx9gMJvNdaoD/
 LLFDmIy54Pe3mxAzJZzTWiytovsOPMM=
X-Proofpoint-GUID: LhO96_RtiC02lbvBXo2i3MehqPCgVbR6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310053



On 8/28/2026 11:37 PM, Linlin Zhang wrote:
> 
> 
> On 8/28/2026 2:42 AM, Eric Biggers wrote:
>> On Thu, Aug 27, 2026 at 09:07:09AM -0700, Linlin Zhang wrote:
>>> From: linlzhan <linlin.zhang@oss.qualcomm.com>
>>>
>>> Current virtio-blk does not provide a mechanism for a guest to
>>> program hardware keys or submit encrypted I/O using pre-programmed
>>> keyslots.  It drops the crypto context when issuing a bio request
>>> to the virtio-blk queue, preventing inline-encryption-based FBE
>>> on virtio block devices.
>>>
>>> This series enables File-Based Encryption in guest VMs on Qualcomm
>>> GVM platforms where the ICE inline encryption hardware is shared
>>> between the host and guests.  In this environment the guest kernel
>>> has no access to the ICE hardware directly; it supplies a virtual
>>> keyslot index and data unit number with each encrypted I/O request
>>> via VIRTIO_BLK_F_INLINE_ENCRYPTION, and the host must translate the
>>> virtual slot to a physical ICE keyslot and submit the bio — without
>>> transferring raw key material across the VM boundary.
>>
>> This seems to be designed incorrectly by not making virtio-blk itself
>> support key programming and eviction.  That complicates things
>> significantly by then having to handle the key programming and eviction
>> out-of-band using Qualcomm-specific SCM calls.  It also means that
>> adding other implementations of this would be very difficult.
>>
>> There are some claims that not transmitting keys across the VM boundary
>> is desirable.  But that doesn't seem meaningful, given that all the I/O
>> is transmitted across that boundary in plaintext anyway, and also it
>> seems that hardware-wrapped keys will be supported too.
>>
>> Please make virtio-blk support the key programming, eviction, and
>> HW-wrapped key management operations that are needed for this to work.
>>
>> - Eric
> 
> Thanks for your comments!
> 
> Not making virtio-blk itself support key programming and eviction is
> something done deliberately. Based on that HW-wrapped key management
> operations are also handled in the out-of-band path.
> 
> There are bellow 2 approaches I investigated to let virtio-blk programming
> the key.
> 
>   1. virtio_blk implements blk_crypto_ll_ops interfaces, including program
>      key and evict key interfaces.(Same to 'the virtio-blk interface standardized
>      blk_crypto_ll_ops requests' mentioned by Stefan in the virtio SPEC thread)
> 
>      The guest's block crypto profile manages the keyslot in virtual slot
>      format in this scenario.
> 
>       - block crypto key and virt_slot index it passed to the hypervisor's
>        (EL2) device emulation (QEMU, using QEMU in the following) which
>        runs in userspace of the host. Besides of transferring the virtual
>        slot to the physical slot, a programming block crypto key UAPI need
>        be added. Follow current blk-crypto design, it may be like
>        BLKCRYPTOGENERATEKEY. I thought this results in a security risk that
>        allows userspace process a key into a key slot.
> 
>      - For key eviction, it's similar to above key programming handling, also
>        need a key eviction in blk IOCTLs, but leads to the security risk
>        that allow userspace client to evict a key in a key slot.
> 
>     virt_slot, DUN and DUSize is appended to virtblk request during crypto
>     I/O.
> 
>   2. virtio_blk implements blk_crypto_ll_ops interfaces, excluding program
>      key and evict key interfaces.
> 
>      The guest's block crypto profile doesn't manage keyslot for the guest,
>      the host's block crypto profile manages keyslot for both the guest and
>      the host. The trigger of key programming operation is moved from the
>      guest to the host.
> 
>        - The whole block crypto key (key size, key bytes, blk_crypto_config)
>          and DUN are appended to the virtblk request during IO, a little
>          high payload.
> 
>          The backend parses the crypto message in the virtio queue and
>          construct a block crypto key and DUN for the bio_crypto_ctx
>          set to the BIO. So that the IO flow in the host can program
>          the key. 
> 
>          The question is that the blk-crypto-profile distinguishs the
>          block crypto key via the key's address. But the host has
>          different key addresses for the programming and eviction key
>          operations of the same block crypto key from GVM, because the
>          key is re-constructed in the host for the key program and
>          eviction operations. 
> 
>          To fix it, the approach I thought is maintaining a new key
>          hash table in the backend, and comparing the block crypto key
>          content and DUN parsed from virtio queue with that in the key
>          hash table. 
>          My major concern is that this need keep the keys synchronization
>          b/w this new hash table and the blk-crypto-profile's hash table
>          carefully, avoiding that key is still present in the
>          blk-crypto-profile's hash table, but removed in backend hash
>          table. Another point is that the whole block crypto key and
>          DUN are appended into virtio block request per crypto I/O.
> 
>        - For key eviction, adding a key eviction in blk IOCTLs allows
>          userspace client to evict a key in a key slot. I thought this
>          is a security concern.

Correction.

The key eviction operation is also moved from the Guest's blk_crypto_profile
to the Host's blk_crypto_profile. As a result, the entire block crypto key
(including the key size, key material, and blk_crypto_config) is appended to
the virtblk request. The backend parses the supplied blk_crypto_key, looks
it up in its key hash table, and can then invoke blk_crypto_evict_key() to
evict the corresponding key from the ICE keyslot. Unlike Approach 1, Approach
2 does not allow the guest to specify the keyslot to be evicted through the
block ioctl interface.

I'm appreciated if you can share your insights and thoughts about these 3
approaches.

> 
> 
>      This option doesn't need map virt_slot to physical one.
> 
> 
> Taking all the above into account, I made a compromise to implement
> blk_crypto_ll_ops interfaces in a out-of-band path, which lets the virtio
> blk only need focus on the data path. I agree that it is complex than
> the second option mentioned in the above, but small payload (only
> virt_slot, DUN, DUSize) in the virtio block request and no security
> risk of key eviction from userspace.
> 
> 
> I would like to hear your thoughts about the above and am appreciated
> if you could share your insights about the design of inline
> encryption in virtio block.
> 
> Regards,
> Linlin
> 
> 
> 

