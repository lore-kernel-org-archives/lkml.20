Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E94D3955C3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254528; cv=none; b=A8Gj4WugT+alkKaXKMmsfAIwyPoPFRDl8aD71OL0nHYB6sqp+OevGKJw7idTiunoWKCvfiNaMYbQTtC82Yg4zRvoj8KNzVIKIfMTKP5VFL+laocHELmotQLyPf8SOH7sLrR6ieksXVAeOAeFdUfWieD2xapHply9ExULgCEObk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254528; c=relaxed/simple;
	bh=lVoV0z/h+BIQ8/TsMH7a01vK8QqEFJO2O1FtJp606sU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=twLbi8HJxwKCQiQYJWcVPKNAT2zquMDSU2vgzInKsAFclJ+llipMgf+XYCB5bDMb8ScKiySCYDEFa72Cq/p+/yOaU43q1g6FIZS2ZG7p3NYESpSnrKR221ghnkb+VmrJ3HTozQPxM2lqXGjUST5s0tG8vTqqAAQ1YVus6lJmEIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e6J7+7bZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qhoee4Er; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e6J7+7bZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qhoee4Er"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179C742061566
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 09:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rm6DL5PXgyAQVwy90n47DMB/p3S20FLi4SKYIR2B5ic=; b=e6J7+7bZ3ckBrBuH
	EwM5sC9BLK2CWa+8FPKe+B13VaLuH67QcD26cUavICHru0MhOYWVjeRDRgUSsjcA
	buT1NfC7v+Ro5AxPrum6MXM+/MgS8IwPpWSbB+F+7sWtkz/Untck+a1J1tw7GSUF
	C7N1uZUNcFPykFyNN0i3tjd9qDvMPplJvO1uZuMGfjT7pjdk+t8jjzzHQxvxpymu
	bHONulO1wcFJNh7BLMrnOLQN/dT3s86cJmZFCCqgBUmc0e585WXUDtWRqRtyOepY
	figVOoInV32UPrp7Z+YbXVzMsnz8PCwncQ3zEgaJHeZP8Uiirf/bIfZHwRdLa6GO
	EDhcUw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh19q1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:22:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39906175917so1142997a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788254524; x=1788859324; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rm6DL5PXgyAQVwy90n47DMB/p3S20FLi4SKYIR2B5ic=;
        b=Qhoee4ErjvmM4H2upHsXbD7arOQqPyH2gHskxqX2ws/x1OTsLpRFFGut7sG4G7qDoF
         +NSBpf1UZe4kX8T5Jm9BdIJhwzLZv4Wwk+h3fkB9zXPdz70nYxBda19jwKMj6dKt/3Mu
         5GunyMogsAMZnJOdDpqdefkwjp81cpEVVHa0vzmsCOA9MuxrdvSmdYWeVruoOjEZIhbi
         kFHR1JWyqvhf/L6KvPSvL7kb2QnUzRCyrzlKMwdxUMQJn4jAdJ0u2Li9lqQvfhZzWxo5
         xBLoUfBCGBH/1DNQDlyFaMzggUgZOrvh94nMzjUKsa3lQAsCqf3cbzfZbi65ocgoz0sl
         ZliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254524; x=1788859324;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rm6DL5PXgyAQVwy90n47DMB/p3S20FLi4SKYIR2B5ic=;
        b=Ot4b2mxGTwmhP3oWHpqpRrK64sfnxroJp9Dyr5D7YKZsgOe3I4qm3Ke3SfisyII83j
         YCc8NOjA2EjCQ/KEBcPuLm/9qvLg1hyNan/5sJHpcxWdVO/6daLtOb+RLKGadBUbI1gv
         O6Lr//8OD7b7jmCKosYO/nPDaQ+b/ecFpiCnI0Xa78GGMII3Auf3R/DjNkPKquvdd9F/
         tdJfowlk2HKda18XNUzvmilIboSF3zG55sYbDVSLVeO4dXZZkNVxKUck1zHNd7BvGUcC
         hMmd55s40Qw3rkf2YtjERWoLWcbkHMpiuMWdWbjD4ER7fTHFUbZrN6MnJBEb3RyEn8x2
         G/2g==
X-Forwarded-Encrypted: i=1; AKwUvBwDvUf263kvz0UbbApxiS3NASvHlI5IiAW9ZZs/wRMv3E2bvpwgcyJjmnMKZl0pvT9OjRql0YTfOzLZnrw=@vger.kernel.org
X-Gm-Message-State: AFuF++kEiBv9Nmk1fySMYjyEvMAqCGDeAp9w3yC67Kn6bPspZZMJj5Fv
	e/deNda6tOIuA8Zvue6ciatdejyne1idDsKb2x3QYxt4QIJj0CatHoHdnsJpyWlC6WvCUMfzwta
	oki6JA6+s3Rj4+SLdZtyqrXfnq0mUqhYNKOVJX/ewHrrhYBv+1Fcz2mvUH64Hv9yLAQw=
X-Gm-Gg: AYBFou3Pw+NcWY4F8t4eqSm9k3qLoA1On7j1cyyLB/Kd7jQ8joYe9FJTLJkwljwM/J9
	NbQk3KiLfDQXC2pLC47zc/ZC4ZlT+hNYDF7rgkyJh2ox/ztSjILpGLWKv/h9luqEmxHUEXtOf5A
	O8pR9d8cW/Twzu2q8RGlqTossfrDU8D+uaSriRevTOWRUFIzkxxD4iAdD99o8+3nkwsL6qyPRjj
	kPJqQejDgoQNVvOJPRkUuVG1NgJ+OyCsCM0mST0Z1c8bKjL2QElwGmxy5hlHSou43VVYFhLgFUQ
	Tg8WNAg6kAqcFck00PCnvfbq15bXAyV3/9vHMvIwGZMPQYU3jYyvg/kfY7UCn4nlxB0NvSQazXl
	T5VHlJlTpraqblJ84cxvIQX8AyEc6nzOe9odgmHkR5Mz/dVaUyW/xMnln
X-Received: by 2002:a17:90b:3ec7:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-396d1041324mr41350582a91.16.1788254523476;
        Tue, 01 Sep 2026 02:22:03 -0700 (PDT)
X-Received: by 2002:a17:90b:3ec7:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-396d1041324mr41350500a91.16.1788254522876;
        Tue, 01 Sep 2026 02:22:02 -0700 (PDT)
Received: from [10.110.34.210] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa20e2fsm37626913eec.28.2026.09.01.02.21.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 02:22:02 -0700 (PDT)
Message-ID: <71fcde90-3d26-4f34-8908-7a0947d8ceb9@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:21:53 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/11] FBE virtualization: inline encryption for
 virtio-blk guests
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Eric Biggers <ebiggers@kernel.org>, axboe@kernel.dk, mst@redhat.com,
        jasowangio@gmail.com, James.Bottomley@hansenpartnership.com,
        martin.petersen@oracle.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-block@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-scsi@vger.kernel.org,
        virtualization@lists.linux.dev, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, neeraj.soni@oss.qualcomm.com,
        gaurav.kashyap@oss.qualcomm.com, mani@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, bvanassche@acm.org, alim.akhtar@samsung.com,
        avri.altman@sandisk.com, pbonzini@redhat.com, eperezma@redhat.com,
        xuanzhuo@linux.alibaba.com, linux-kernel@vger.kernel.org
References: <20260827160806.1295313-1-linlin.zhang@oss.qualcomm.com>
 <20260827184219.GB2137493@google.com>
 <d81e347e-8ca7-40a1-a428-5bce6f0d4b02@oss.qualcomm.com>
 <20260831204122.GC527638@fedora>
Content-Language: en-US
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
In-Reply-To: <20260831204122.GC527638@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4MyBTYWx0ZWRfX3EhU+oADd1zQ
 Gnc3I94KlZBG7R7v1h+M6OPiN2blUolaRfSEwZRrnHcact6tWXqc0Ci+45LO8xUyupZ1soHk4bc
 pP87peQawLBPFouZTW2L5fImLEIJm7s=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a96993c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oV_aNMpnlp7R0Wfg0uYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: LdGJm6S5r_4Khbx2jnxsxhi_dTbqQfU1
X-Proofpoint-ORIG-GUID: LdGJm6S5r_4Khbx2jnxsxhi_dTbqQfU1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4MyBTYWx0ZWRfX55139TrYEio+
 4EnTMbyFhH1Qzb2u9i3QcIl4ujSBIPDstFjKOGHKy+TkmYj+C5nq2uux0Z6MEPOHeL47ZCqL6e0
 JoR/+PiU6WfM6j4jCtCigInZ9NYVuPFWtpfIpNacmWjO6GLJS7IK3VBLa1H4PKk9YNcZQhR6q6g
 mU7RBuN2P4TTqNegcfUZMjATUr/hpDeLAI8ZVsp3qbBF4Sh8kMzYBJzLYt6wMh7Gk/JB7edeaTH
 N1sYDAygIfBqgD04gDXLlxNiYXbqT1yU31hWPJxd/1IB4eDXA9CWz+zew6qwMFnXmizJFbJTDLl
 hM9Tl9IRjP+fIvdiUq684uGWQGDSxHc+I8hEHkaZtGM8J31718/nF98fGUn5Im+LjxTYREX5mWu
 RgP+L20Mjgy5g1011FdKW466SHeFIwcKk9HuTWenOX9rfPa0/02DTcmE6k8B7OjJp+8lJVpXQwj
 F0Xj0ucOM2jZzKi2zjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010083



On 9/1/2026 4:41 AM, Stefan Hajnoczi wrote:
> On Fri, Aug 28, 2026 at 11:37:57PM +0800, Linlin Zhang wrote:
>>
>>
>> On 8/28/2026 2:42 AM, Eric Biggers wrote:
>>> On Thu, Aug 27, 2026 at 09:07:09AM -0700, Linlin Zhang wrote:
>>>> From: linlzhan <linlin.zhang@oss.qualcomm.com>
>>>>
>>>> Current virtio-blk does not provide a mechanism for a guest to
>>>> program hardware keys or submit encrypted I/O using pre-programmed
>>>> keyslots.  It drops the crypto context when issuing a bio request
>>>> to the virtio-blk queue, preventing inline-encryption-based FBE
>>>> on virtio block devices.
>>>>
>>>> This series enables File-Based Encryption in guest VMs on Qualcomm
>>>> GVM platforms where the ICE inline encryption hardware is shared
>>>> between the host and guests.  In this environment the guest kernel
>>>> has no access to the ICE hardware directly; it supplies a virtual
>>>> keyslot index and data unit number with each encrypted I/O request
>>>> via VIRTIO_BLK_F_INLINE_ENCRYPTION, and the host must translate the
>>>> virtual slot to a physical ICE keyslot and submit the bio — without
>>>> transferring raw key material across the VM boundary.
>>>
>>> This seems to be designed incorrectly by not making virtio-blk itself
>>> support key programming and eviction.  That complicates things
>>> significantly by then having to handle the key programming and eviction
>>> out-of-band using Qualcomm-specific SCM calls.  It also means that
>>> adding other implementations of this would be very difficult.
>>>
>>> There are some claims that not transmitting keys across the VM boundary
>>> is desirable.  But that doesn't seem meaningful, given that all the I/O
>>> is transmitted across that boundary in plaintext anyway, and also it
>>> seems that hardware-wrapped keys will be supported too.
>>>
>>> Please make virtio-blk support the key programming, eviction, and
>>> HW-wrapped key management operations that are needed for this to work.
>>>
>>> - Eric
>>
>> Thanks for your comments!
>>
>> Not making virtio-blk itself support key programming and eviction is
>> something done deliberately. Based on that HW-wrapped key management
>> operations are also handled in the out-of-band path.
>>
>> There are bellow 2 approaches I investigated to let virtio-blk programming
>> the key.
>>
>>   1. virtio_blk implements blk_crypto_ll_ops interfaces, including program
>>      key and evict key interfaces.(Same to 'the virtio-blk interface standardized
>>      blk_crypto_ll_ops requests' mentioned by Stefan in the virtio SPEC thread)
>>
>>      The guest's block crypto profile manages the keyslot in virtual slot
>>      format in this scenario.
>>
>>       - block crypto key and virt_slot index it passed to the hypervisor's
>>        (EL2) device emulation (QEMU, using QEMU in the following) which
>>        runs in userspace of the host. Besides of transferring the virtual
>>        slot to the physical slot, a programming block crypto key UAPI need
>>        be added. Follow current blk-crypto design, it may be like
>>        BLKCRYPTOGENERATEKEY. I thought this results in a security risk that
>>        allows userspace process a key into a key slot.
>>
>>      - For key eviction, it's similar to above key programming handling, also
>>        need a key eviction in blk IOCTLs, but leads to the security risk
>>        that allow userspace client to evict a key in a key slot.
> 
> Yes, userspace shouldn't have access to the entire physical key slot
> range. The host kernel or other VMs may need key slots and an untrusted
> QEMU process must not be able to modify those key slots or use them for
> I/O.
> 
> The uapi design should include a solution for this. For example, there
> could be an ioctl like BLKCRYPTOSEALKEYS that permanently restricts the
> key range on this block device file descriptor and cannot be undone.
> Libvirt or other management tooling would call this ioctl with
> CAP_SYS_ADMIN before passing the file descriptor when launching QEMU
> without CAP_SYS_ADMIN. This prevents QEMU from ever having access to the
> full physical key range.
> 
> Just an idea. Those familiar with blk-crypto may have a better one. It
> seems likely that we can find a design that matches the level of
> security of the out-of-band approach.

Thanks for your comment!

Eric mentioned a proposal that each virtio block device has its own *virtual*
keyslots in the host, which is not static partitioning of the physical keyslots.
I have concerns about the new key programing UAPI and 2 VM exits per encrypted
I/O. I'll confirm with Eric if that needs be considered and if we need pass
through the crypto to the host blk-crypto-profile (which means the max slots
of blk-crypto-profile in the guest is 0, and virtio block driver only doesn't
implement the key program interface in blk_crypto_ll_ops).

> 
>>
>>     virt_slot, DUN and DUSize is appended to virtblk request during crypto
>>     I/O.
>>
>>   2. virtio_blk implements blk_crypto_ll_ops interfaces, excluding program
>>      key and evict key interfaces.
>>
>>      The guest's block crypto profile doesn't manage keyslot for the guest,
>>      the host's block crypto profile manages keyslot for both the guest and
>>      the host. The trigger of key programming operation is moved from the
>>      guest to the host.
>>
>>        - The whole block crypto key (key size, key bytes, blk_crypto_config)
>>          and DUN are appended to the virtblk request during IO, a little
>>          high payload.
>>
>>          The backend parses the crypto message in the virtio queue and
>>          construct a block crypto key and DUN for the bio_crypto_ctx
>>          set to the BIO. So that the IO flow in the host can program
>>          the key. 
>>
>>          The question is that the blk-crypto-profile distinguishs the
>>          block crypto key via the key's address. But the host has
>>          different key addresses for the programming and eviction key
>>          operations of the same block crypto key from GVM, because the
>>          key is re-constructed in the host for the key program and
>>          eviction operations. 
>>
>>          To fix it, the approach I thought is maintaining a new key
>>          hash table in the backend, and comparing the block crypto key
>>          content and DUN parsed from virtio queue with that in the key
>>          hash table. 
>>          My major concern is that this need keep the keys synchronization
>>          b/w this new hash table and the blk-crypto-profile's hash table
>>          carefully, avoiding that key is still present in the
>>          blk-crypto-profile's hash table, but removed in backend hash
>>          table. Another point is that the whole block crypto key and
>>          DUN are appended into virtio block request per crypto I/O.
> 
> This sounds like an approach that skips key programming and instead
> sends the keys along with each I/O request. The device implementation is
> responsible for managing key slots on the physical ICE. My main concern
> with this would be whether the blk_crypto_ll_ops semantics can be
> faithfully replicated (e.g. error reporting) without explicit key
> programming operations.
> 
> Stefan

You're right. When the virtio-blk device processes encrypted I/O, it
would be responsible for extracting the blk_crypto_key and DUN from the
virtqueue and attaching them to the bio (via bio_crypt_set_ctx()). The
existing keyslot management logic in the block layer would then handle
physical keyslot allocation and waiting as needed, so the rest of the
blk-crypto infrastructure should continue to work unchanged.

Regarding your concern, there is already a somewhat similar
implementation in the device-mapper layer (
dm_table_construct_crypto_profile() implements a passthrough
blk_crypto_ll_ops profile. See
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/md/dm-table.c?h=v7.3-rc1
).

Based on my current understanding, I don't see any obvious
architectural issues with this approach. However, I may be missing
something, so I'd appreciate any feedback if you see flaws in the
design or potential problems that should be taken into account.
> 
>>
>>        - For key eviction, adding a key eviction in blk IOCTLs allows
>>          userspace client to evict a key in a key slot. I thought this
>>          is a security concern.
>>
>>
>>      This option doesn't need map virt_slot to physical one.
>>
>>
>> Taking all the above into account, I made a compromise to implement
>> blk_crypto_ll_ops interfaces in a out-of-band path, which lets the virtio
>> blk only need focus on the data path. I agree that it is complex than
>> the second option mentioned in the above, but small payload (only
>> virt_slot, DUN, DUSize) in the virtio block request and no security
>> risk of key eviction from userspace.
>>
>>
>> I would like to hear your thoughts about the above and am appreciated
>> if you could share your insights about the design of inline
>> encryption in virtio block.
>>
>> Regards,
>> Linlin
>>
>>
>>

