Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792617923;
	b=LS23VTTVgMTpxqUh8uD6bhr82slJ2Eedc2rvvAKYoKhe0uFy/Kesvt/8TN5SwVfjPyu1
	 JpS30j7DCxnGvkS4eXgMHpQkJMY3QdSw1Yhb3IhX+PCCuqqw3xkkWPubAUvPfgiDTtbQG
	 uy+hW/X4ziKxbd+XycZnxaiWbHY6JrPeVMSPa6gSd/6fNwCWDTorvJKzSMn+JKGDIjhbk
	 CAcQtvt5Vp33CVsKa2ggzHq1cpFeawguVb8E/50NEVq+jZZgxOQbeY+zHpnobfQThaLR+
	 RsSutoS3oL2eSCLHVRaxYfr7B9GNZDdDsymXVwZz/hKTEjYDzS5oUa27gxxxD4V5n8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792617923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=XDhuPTrkfsx2EQ87Q60VEaA6HRR45VH3CZ/hmoeLz50=;
	b=04sD9vCRiERGnyz8bfxLMtfZCCzSuEHThI49p+bdwE36j6JFhOUt9CI+gjFRqdA/0ouf
	 vN7P6dKxD+w53wcY7sot9SgivMhFjydFoGjkfb3xs8LKxacKG/tpKGEQg3Xh1w6A6WQXV
	 OcqEETb4Mn+4yi7zVpTk4W6t2e9+5rIn60oieQUw4d3WgyMzxYu1Rmb81Zx8bo4iKDX4n
	 p4dZHUnQTrtzLU5cEDFzlg4R5MeT/Kpu+4bjcxKcFgkoWljfefdt0UM/r0+udZ21x2DNF
	 ckuaJJGJUjXwffrw847ykAjoUMJAifmRjFL4nA9CUq+nJ5xXIpznhBid7QJDU+7ultg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VAdLwfUi;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2443C606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:25:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2443C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VAdLwfUi
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e9995ce866so9147235ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792617922; x=1793222722; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XDhuPTrkfsx2EQ87Q60VEaA6HRR45VH3CZ/hmoeLz50=;
        b=VAdLwfUi3V3D3ww8dDI80MpRrI2XIoWxaWgS15AWkpIWcaawZO1zDKoYAmXohWF8e5
         aGR6b27z4BQlPDMptR+gt3E3A3yjs54YdXVjiC/SQB9CHR5wxvSswQuqgidGx4A2A6oS
         S0rAvQrzSZxn439kmRyxHUuJ1hCE40q3f+SBU5DgzE2hMrhdTA4LiOLR3ZZ3yZ3/5dXa
         oa1/xMEXeUmav5tYcWxnVyP5xm+R+5MqAXTh02EwsL4XErAwblvNVyZ47cqFZPPeJ6qJ
         tD1Uz8HKZT//h/Jig1LBWTYGTXZ85CtfpKdo7FuPdK8G+cOQ/bDHdCVytDtxQX69MZ10
         027g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792617922; x=1793222722;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XDhuPTrkfsx2EQ87Q60VEaA6HRR45VH3CZ/hmoeLz50=;
        b=vZdRXpEEeJ6czuJAY5+ElrcLvmYP4+VIZ1s6UIuV3rnSP9Ikrhx69nhO6KosbQrBBZ
         cq2qsIOCVVKiF2nqhZofAE7+FbxaR/w60VBYvMYip5kya+U+w1t1TwJLzJFUtEzUuTet
         4A4VedWOeEffstPDtPzcBwbYjPsmjkO0sLNm3YPabrMtoSZS3tIAaXLSq46nsMh82qjQ
         tqAowWMjO35AAlxfJFHn3hVhQISSCv2TBoAl7lHlKkojg2kfYDCuDrBPt02sd/lEXmZo
         vvfUhKYTv+8GfvcPxThPOR2i7MnIBf/VqdylGCZg/Pc+n5urR4GresLLFh5qfESg/feo
         dEyQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/c7nqQ+Nz9caByNed21DzfueM0LvKGMxPvgDzB5iOlBPQNSpNDgFRce978yiCz+4STsna9fA/n0QDJZI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4VLW6fMxlZBLR7P/X3v67fDd3ylCEFGHVxEZRV7I4iHmd2BP1
	K7kDRs/DTu7F/yUA1aoJmCfcjAWN0rZaSG8ETW39OcKNbu3brwSWY7nJ6G+mUg==
X-Gm-Gg: AYBFou0Pm9Rmgej1jHuWevUp8s6D4stZdaasConEPvKhvey3drwsy8qokzoB81GI1Qb
	cNkRwJ5F10egTKid5i0bKTD5YN/LoNg7kGpbJqiNHIPGDPqKQq90cWR+DamjWdd1OQSrvTftn47
	q2cj3iPN32RNz+MfvfZtA4cLk3tHUb2Y+z5im+HXel1kH7UBPKXBdYNMljTVw3OwuQKUb3PkFjE
	vaP3xqrrZY+wTsa5SjsQf+rjrNi43svQRsanrfnFsfoT/XFIblBm64mX7ZtHCzu5NaVul4LSUMj
	tFk5NjjRK1Npi2pvotXzXKJw/Hgpo8xl5siM+NEd0SsHFTnWVGELvCmC3sHVbN1gV6Vm5Y+8zZi
	pmfhzhy8/UI0O3Pn450WXN3Pq3nOUJmaS3wK7x5wiSm+OQU640LrrohNp9pPrrd+8g9054YU5rQ
	n+9v2F7aWSSF7h1ciRmnTVPv4JWvAJ+DcaaOtDYiJiXdxe8rZe04Yy1/DBrl7K0+1xsLfq9hC4i
	gJTwP2/Px/3tdUGJ+VxdNIdGNdwsw9xmo98eyb2+QG5KlfVUWnsva+Lvx84qQVmrP3d19ICxD9o
	U+MQsHi7CdF8zLlP3w==
X-Received: by 2002:a17:90b:5810:b0:3ac:a521:95c with SMTP id 98e67ed59e1d1-3ad87087a43mr2443291a91.58.1792617922393;
        Wed, 21 Oct 2026 14:25:22 -0700 (PDT)
Received: from [192.168.21.192] ([24.18.106.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48bb3b6sm1081067a91.13.2026.10.21.14.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 14:25:21 -0700 (PDT)
Message-ID: <04b9af90-721e-414e-828d-9fa44ce759f2@gmail.com>
Date: Wed, 21 Oct 2026 14:25:21 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH] sparc64: Use relaxed ordering for DMA_FROM_DEVICE
 mappings on sun4v
Content-Language: en-US
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Stian Halseth <stian@itx.no>, Andreas Larsson <andreas@gaisler.com>,
 "David S . Miller" <davem@davemloft.net>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Leon Romanovsky <leon@kernel.org>, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261013133731.1795299-1-stian@itx.no>
 <e8f08d9a-8b67-4c7a-8ef5-1ed38351e499@gmail.com>
 <0892a8803ca20869cd8cc76fcffc9f7543cffd2f.camel@physik.fu-berlin.de>
From: Tony Rodriguez <unixpro1970@gmail.com>
In-Reply-To: <0892a8803ca20869cd8cc76fcffc9f7543cffd2f.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/21/26 1:49 PM, John Paul Adrian Glaubitz wrote:
> Hi Tony,
>
> On Wed, 2026-10-21 at 13:30 -0700, Tony Rodriguez wrote:
>> On 10/13/26 6:37 AM, Stian Halseth wrote:
>>
>>> sun4v IOMMU and ATU mappings carry a relaxed ordering attribute, but
>>> dma_4v_map_phys() and dma_4v_map_sg() set it only when the caller
>>> passes DMA_ATTR_WEAK_ORDERING. Some network drivers do, storage drivers
>>> do not. Without it every device write into memory is strictly ordered,
>>> which on a T7-1 (M7) caps DMA reads at about 280 MiB/s per PCIe device
>>> while writes run at full speed.
>>>
>>> Set the attribute for every DMA_FROM_DEVICE streaming mapping. Devices
>>> report completion through coherent memory or an interrupt, which stay
>>> strictly ordered, and a strictly ordered write does not pass the writes
>>> before it.
>>>
>>> T7-1, fio 1M sequential read, QD32:
>>>
>>>                         before        after
>>>     NVMe (PM1725, x4)   281 MiB/s     3169 MiB/s
>>>     SATA SSD (mpt3sas)  278 MiB/s      502 MiB/s
>>>
>>> Closes: https://github.com/sparclinux/issues/issues/114
>>> Signed-off-by: Stian Halseth <stian@itx.no>
>>> ---
>>> Tested on a T7-1 (M7) and a T4-1:
>>>
>>> - T7: fresh RAID1 on two NVMe drives, 192 GB fio crc32c write+verify
>>>     and md check: no errors, mismatch_cnt 0.
>>> - T7 and T4: file checksums on the SAS boot mirrors identical to a
>>>     strictly ordered kernel; no new messages in dmesg.
>>> - 4k random read and sequential writes unchanged.
>>>
>>>    arch/sparc/kernel/pci_sun4v.c | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/sparc/kernel/pci_sun4v.c b/arch/sparc/kernel/pci_sun4v.c
>>> index 61f14b4c8f90d..4dd17b65dd6cc 100644
>>> --- a/arch/sparc/kernel/pci_sun4v.c
>>> +++ b/arch/sparc/kernel/pci_sun4v.c
>>> @@ -403,7 +403,7 @@ static dma_addr_t dma_4v_map_phys(struct device *dev, phys_addr_t phys,
>>>    	if (direction != DMA_TO_DEVICE)
>>>    		prot |= HV_PCI_MAP_ATTR_WRITE;
>>>    
>>> -	if (attrs & DMA_ATTR_WEAK_ORDERING)
>>> +	if (direction == DMA_FROM_DEVICE || (attrs & DMA_ATTR_WEAK_ORDERING))
>>>    		prot |= HV_PCI_MAP_ATTR_RELAXED_ORDER;
>>>    
>>>    	local_irq_save(flags);
>>> @@ -503,7 +503,7 @@ static int dma_4v_map_sg(struct device *dev, struct scatterlist *sglist,
>>>    	if (direction != DMA_TO_DEVICE)
>>>    		prot |= HV_PCI_MAP_ATTR_WRITE;
>>>    
>>> -	if (attrs & DMA_ATTR_WEAK_ORDERING)
>>> +	if (direction == DMA_FROM_DEVICE || (attrs & DMA_ATTR_WEAK_ORDERING))
>>>    		prot |= HV_PCI_MAP_ATTR_RELAXED_ORDER;
>>>    
>>>    	outs = s = segstart = &sglist[0];
>> Tested-by: Tony Rodriguez <unixpro1970@gmail.com>
>>
>> Tested on a Sparc S7-2 with a Samsung 2TB EVO SATA SSD.
>> No functional issues or major regressions were observed.
> Did you also see the vast improvement that Stian has reported?
>
> Adrian

Yes, with certain fio tests.  IOPS have improved:

Note(s):

1) The following output does not include Stian's AES patch (needed to 
test against luks).   Reached out to him about a question regarding 
applying that patch.  In other words, this is a non luks tests.

2)  I also don't have NVMe installed within my Sparc S7-2.

3) Sata SSD will not reach NVMe performance (due to Sata SSD design 
limitation).  However, improvements were noticed with Sata SSD.

-------------------------------------------------------------------------------------
A = Before Patch                  B = After Patch
-------------------------------------------------------------------------------------

A1) Jobs: 1 (f=1): [R(1)][100.0%][r=314MiB/s][r=314 IOPS]
read: IOPS=314, BW=314MiB/s (329MB/s)(18.4GiB/60101msec)

B1) Jobs: 1 (f=1): [R(1)][100.0%][r=544MiB/s][r=544 IOPS]
read: IOPS=543, BW=543MiB/s (570MB/s)(31.9GiB/60058msec)

A2) Jobs: 4 (f=4): [R(4)][100.0%][r=456MiB/s][r=456 IOPS]
read: IOPS=456, BW=456MiB/s (478MB/s)(26.8GiB/60273msec)

B2) Jobs: 4 (f=4): [R(4)][100.0%][r=544MiB/s][r=544 IOPS]
read: IOPS=544, BW=544MiB/s (570MB/s)(32.0GiB/60232msec)

A4) Jobs: 1 (f=1): [r(1)][100.0%][r=36.5MiB/s][r=9346 IOPS]
read: IOPS=9824, BW=38.4MiB/s (40.2MB/s)(2303MiB/60001msec)

B4) Jobs: 1 (f=1): [r(1)][100.0%][r=44.7MiB/s][r=11.4k IOPS]
read: IOPS=11.4k, BW=44.6MiB/s (46.8MB/s)(2676MiB/60001msec)


