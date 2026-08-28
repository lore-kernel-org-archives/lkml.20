Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F42368D5E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932571; cv=none; b=I8B95G7jPZaiEmPoL1nBCWYvQTkzwJ30EH+a/GBBcHbnbk3z9LKK355mzrbqGH2yZaOoTgXnPDHzZWQ++VswuAw+V1HBotL5t1AA8cmM5SnvMW04EeTISuRiOv82Ml3yWfG6L5f/ivpdFvcUmSaHLbaNTYAgTND3Ye/gGZYS550=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932571; c=relaxed/simple;
	bh=YPFAfwgLXyRYWu0qKDT7O8z9rx4Le0VUAMpakSNW0Is=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=au/CSR7u8tRFYNkLw/dfRIHDHXsBPFs1+B1hmIijDfcv7kg+qCidaDc4o6qN64U7ug+TdjkSGZWTA24ELUIvf+RHKuUivMa2ksM25s/ZT0+tg7EAME9fSgCKLHgnFH4+W/LBzgXB3Di6IXR069bnaUw8CMLuRq4yn6PurumfvHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DvsjZ2Ls; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fuBiHdcH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DvsjZ2Ls";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fuBiHdcH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDkiEN3790355
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QWK2pao1WAM8yI8Fl2//fFtzpUUZCvVVyo5r8hizPUA=; b=DvsjZ2LsVsvmIPjD
	cj7LSSEwmXlDTK+zsDzSAGaxZlfNi+MtDuMlbE9tq/aGlM4kd991+VMkWZITv1AP
	ZDtm/5x6tea1dQQp/stuFNciPiC2wsHtjI0W83fbewoGJ5F2d2TP0txv23SXXDUM
	x5Np1nwAagHAeY94LmjuSfTcCpkOiH9FZp8qji89R/Czmwpz+tI78oBJUFIU2OP1
	EBf64brrOr/k+4w5NENc4R1Nk2xv/skup7H0UdrEVW2pUJ7m0KsZkffsK9fvU/52
	/NdgLhOuTD28ELOrSvt7RXkv9GjhTKW7Oih9zefr/eASuUxpYJ/q5PdbQfXy24KO
	/go55w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb42pabnb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:56:09 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb92868263so1071716a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787932569; x=1788537369; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QWK2pao1WAM8yI8Fl2//fFtzpUUZCvVVyo5r8hizPUA=;
        b=fuBiHdcHuZ/XGaCDvtUVfiyfrowD6FYbBDOz3FAV1kEjxIyZq10BJn4BpaNT7NOocM
         bDLXqdolxBhi7VQt5RwpaYx4fCTlCSQtFuJ8cYIS/y+oVN7cyEphWdnIfG4aCKtcF8Ry
         42gPeprh1spF1tnYeWmImNJd97e4jfR5KfUbsdCbH4jH/2+zv/cV/k4+zpY1Dn9Ctvhi
         BFYIVmgjIn7CkLK9DSfglyYCSAJao2vuAQdsAN9XwnFL/A5pnJ+FNu4qu91LWYgXjUlZ
         Rd3O0/a5l1QS+OBqUCGEK3I+85f8CdjYhOs5yCbP+5Ia22RDkxUBNYjNY+jPunjwxmZr
         a1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787932569; x=1788537369;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QWK2pao1WAM8yI8Fl2//fFtzpUUZCvVVyo5r8hizPUA=;
        b=ldb/AnAAX9TkF9RyIcv6zotB0NCprkXTg0+v7qtplui8n19BArl6EQ9tDDkY2s+MeZ
         AewzTzcsbgJ4gM0+0xNK66yoF59DxAEBUaaUCmN+AC9QKuPgJT2chkgvGtS9nyrafRYw
         YwVa+IY1JDPo6aZF5OfGjTd9cOer6bYTQEKiamd71I8v+41GhD4CM9ORwoHjGLoj/UD0
         98rT+hmDfSVDKj1W57dDi3nyggl5ysWFyiF2pHZEgGMEuMd25LUVah/ejJl+lnTLL9HR
         cviVdxVFjESHzFpNwm5oSUTPoz39uPqNkU5JKo6iZew0bVzMSD5G9JqUqBJJlc/wu2xc
         cP2w==
X-Forwarded-Encrypted: i=1; AHgh+RpNNYSyTPL6sUB27Fc1W8v9iyMjpOWOlOyoRyjtX8xka0Zhm9P/sQ78061ktf00B8VIUs4K0OGcpcZt5Sc=@vger.kernel.org
X-Gm-Message-State: AFuF++mMqEUvY9r3lswM0wCY6Yu3bNrehiYH35wyFocq3/2LsrsRcKqG
	qFfUN3DA8MCVRKoxi4CGKAops0rN330SUHpCeYQqMpErKKHeP9HgMr2fZmMYEEMnCkDTC8g4dJB
	DkKN7ick5yuvNyFky1MzQadX6RQEkmNua1hiSdGoQmZimPoM0QwMtgnld1BZ10QKao3o=
X-Gm-Gg: AR+sD107Hl9ibFh/VutZK+UlXOXy25pm4bGtoy1N0sZSHt2bl1n8I3cZ0aSXtOP91qi
	yGqc9wCH7iF8EeGlhx5+DNqM1MLfx5t2wfGresc24JMycrKR2OjLLGEJIo90A+0IDyaoQlKWLON
	8m72cUjr3fafvGzHFGhuylOM+swi6RLJBSLKyhMnTZLvOTaDvNv0EnXRcLYX1/APcDvdvgE9Os2
	Ml5mBISgE5ilnDyGYLrwGou8wbHyCtckQsACafHZI6hdTfV8CxlMfHwGMA672W1x+aMZCQsujf4
	mucjcvx+n8brrB+X7AgkgwXqKeMmyINMKXHN0t5xYEip3kwg/1cuCWxB5RtAdxaY4wNLw81QjVC
	SStuFoMl3rG08c9lssKbhFpWMsSnBWAbn/6MbE8HLqTLC3qAJPHMPUdobYwg=
X-Received: by 2002:a05:6a20:a11c:b0:3d3:adbf:777f with SMTP id adf61e73a8af0-3d3adbf8124mr1206755637.20.1787932568996;
        Fri, 28 Aug 2026 08:56:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:a11c:b0:3d3:adbf:777f with SMTP id adf61e73a8af0-3d3adbf8124mr1206667637.20.1787932568530;
        Fri, 28 Aug 2026 08:56:08 -0700 (PDT)
Received: from [10.110.102.109] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b944bsm6433151eec.27.2026.08.28.08.56.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 08:56:08 -0700 (PDT)
Message-ID: <431215e8-1c80-4aa4-8407-5b3779c344f8@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 23:56:00 +0800
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
X-Proofpoint-ORIG-GUID: 3eva1_gx-XtPUNC_9c_yq5hyY_XpXzUN
X-Authority-Analysis: v=2.4 cv=ToDWQjXh c=1 sm=1 tr=0 ts=6a91af99 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_h6NAR8LnRz2utxSRfIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 3eva1_gx-XtPUNC_9c_yq5hyY_XpXzUN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEzOCBTYWx0ZWRfX2Nnx4WiYnWwp
 JrXfwkj+PRwayU8RgN3iNzgfq4fFbOT8UoYWc2R5TARBvc31sqJMsEwWZPHSrne3o37BU0ae6xg
 R772KeS99JfmvthxqCt8NILlzzWKu8A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEzOCBTYWx0ZWRfX7wJXoYkGNrP2
 11OF+GOMVzu7+h9wbdDjnUO1W2UUBI11HQ8p3uxQSXfwQqjnDB/4CewarKDzknZBzube3rOOIN8
 Smp2nN41f9PLbd9z27EdnmDAIe2Av92GRadO8zZMXfSWfbK/7/e73/VJRUVNeiqvCj9e11bUDQc
 O0pfz4BnXrYSbg+GD5EHOaIt51cwDq1A7V3I0yX41LZb88Z3GzyChTb1UXQeg8xVdnetVhKyozF
 ytuFwUK2DiIMBIQJUzVKSb9EB+MvDpGtaag5QjiH0eONE6x8Uu5fE63hvMRWfbT5PeVTAfWMQ7M
 y9IZ1c/m6+aO2qfw7z6Owzcxb0KPVx9sV9L6sESZG6lgf9sKhBDWZwdZyg6Kp1+pYgzEvaIwA33
 auIe5UHkXSfjWLluqS1OfkxeAZ8g5xIXnHPoFALfxTKcLtxfmgQAvQYow3KI7BS/hFj/p8xBiB6
 /H+t6vaxs5UX49C7mOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280138



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
> 

Do you have any suggestion about the key eviction operation? Could this
key eviction request triggered in QEMU be accepted? Would you please
help share insights about how to handle it?

Thanks a lot!

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

