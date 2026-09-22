Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E77741F5E6
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073299; cv=none; b=Xz/Nl5iC2M8xxEUso/8vkm7uBpQcGBFjhKdgHboZMaWAclyo2sClYT34Am3d4Bpj7bZze0/s2potYTJMKc9sSV3VYqEbW6ZtnoLzheVpSjJB2jGq6lED99ZlERJ10ibPDPXPzDumXVsjLttRWCMbaCvti9bCQo2Qg847TgQRqeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073299; c=relaxed/simple;
	bh=XO+FI1tvpHWdCbjj0csUD0G607J8vP2lGPzEtMSBNb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k5IUjiPuXjjGza3+mQGECTASq1Cp3/z4kf/yWdnxuBI/Qtg+VeFQg7adUDZph3nH2r4maeS0YwEITHBmUicqISY8PPFd4wZ+ShpyZU1MqaNl6sJbTFaBRTpsujBwlhxIbG8gKBNbsItUUwkBzvo40JMt6XhsRUeMU4EeLFjv3eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NOgxHJQC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IS2WeBhj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NOgxHJQC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IS2WeBhj"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M7Bun72166354
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:34:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TBHydZSyrHff1ApJ9bUoZm9nBCnkiZV5DuxO7M+8nK0=; b=NOgxHJQCsYAwIuOM
	V+zrWwvmFYfGSbq0d+FsFo0WmXqVRidxRBwOMQvWtWu9uoEC3v0dOMNIypiJqOwh
	V5cJe4aL/e60Rce9D+rGpyS5CACnzj0lI5Xz8VtimArMBj80RxIyScXml7GIc4ls
	Ua6+on0W00It1j7Meb+R7iZj6LcpHaFrri+p2NkBc1h3usT1gTXA3V6FwameWBEW
	yYEF/QCgDziGpNcqIKQV9lNYJAsVqRikSDUzmga7pyF4fuFob43TQAQb8ndAlCoS
	lwgMWxdpFFdda4LS7SHeggep0z5ofH1LPxQqPnoBUbkMqPoZHYwPS6y4Ovsh1Z5H
	LEViLA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xeuhr3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:34:54 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86917d18a02so6317680b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790073293; x=1790678093; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TBHydZSyrHff1ApJ9bUoZm9nBCnkiZV5DuxO7M+8nK0=;
        b=IS2WeBhj4iv1hSgzTJIGjTLL5ip0qo+25+FXUatBem5unuEKZLFiAmkyg0P0kKRQ9G
         z2wWBGABrHzwrUpnudReMiKVAlLzkLSCngourkJgCfrmgvfeY8QvK4Rfub3FPFVdsE4D
         x6R9J1QxWcMrrRA7Dow9KkjbaqXtNEJPlYPBZriMNDCWSEwbX0hgoEupanzxDoUW0xKO
         FO6gnmHaxPsdcCoRZocY5IfQkjN5ObNUby7fJIhtkjgZx+QG3+0Dn7nGQmHqcdDHTXYl
         +DqLQuaFlTXdJ1zmaoIp5ZwI8x1cp9+aEe3SOz4wL5l1ydKo0s1ujeBqsqjVg5uwUCxo
         2MFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790073293; x=1790678093;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TBHydZSyrHff1ApJ9bUoZm9nBCnkiZV5DuxO7M+8nK0=;
        b=AXLsJoy3Kt7R2OCeW7pz3oO65isQMIYxOpwVR2wyczuZa5yirFjg3UTvUBGamaQgDk
         KQky/aGmvFVSyOEwDyJ2OkyBpTUTdeOY1G+AYZswtl+0biuwBot8Tm0sjeVNuq+f541D
         n9zfSV4eyhWA9JvpDH5yEE4TWtd4vRgqn66uKVUlxw5yW/vsgJICSG23CE1mUS7w8whr
         3AtjLVKJ+gVqP0KHWBcefPkEyRE/ih22jgy6mfVk9zy/Qr7R37B6tP0KPfaNCgQHqm2Z
         WeQ3nWDyPXQcrYr23pVsE0PRKYRYZt9+CP8blEjW5OsHSExnOy/uTMHzg4lB1mR+twu1
         Oc+g==
X-Forwarded-Encrypted: i=1; AKwUvBxqNrCR6sGZKUlft1oS7u2LTbIffBWuCqMbP8aQS2ttJIClhIPUIBT2zZ4Z12oB6qKWeVQCllrUwWKj67k=@vger.kernel.org
X-Gm-Message-State: AFuF++lNthlwdK7cDG5KHmGys/O1DEX9mcXzf4QgRlnttHR6u90n5u3k
	EnUDZJ1LZ9JA1g0vXTVVuF7fJg8jjqbMFfcvbLT8i1fW332BPOT7PuZXVayIj9bjbStNZDA7e2V
	fOJUF769fK/mGYZY3OU288WFcomlD909WrwbmrSFMnov9WJfZ9S6wbGHMbKQMxT8FHKlRzXXkle
	hN7QOy
X-Gm-Gg: AYBFou1k8bhG8ZTH0/ymCA3x6qvGHqbGBupsAjxTuJcMW2xZ4IvuSdw525S/uD2ei8l
	0MYDkmgdZync31u7FB8C6x7m24N18iWoUWkPjuRA+bE7x5CxA1EbeSLOAPwyX/Kunv0BFj9+Lu3
	zBK0KtaKVuQghSETr6jYCkJWBGvjxqXiqRVaz9SBIfUhZt3jbICVmMc5FIgEs6wPNUx5g1C9XpM
	Zk3K2Tu8R8r7IIYJC8MzRqGLcKIVabxFiXjvdKNSKtJzx+ptiX3L7qIkS87d52raH/xFhZfaX/9
	A3s1ZeG2DV9k9TsxUAMIHEPWH146iT1YFhyOwtWgWCtCcGAzawCPtF6jtDmfvx4STtN2GRqrNa0
	hYVTJdf35009XP6m8EEcNweGstJfGfXRBHEdRUGQhZUEv9s0F6vX3PvrOZ89Yfz6M49iL
X-Received: by 2002:a05:6a00:1152:b0:862:72a7:eb59 with SMTP id d2e1a72fcca58-87c81bb7802mr782691b3a.4.1790073293519;
        Tue, 22 Sep 2026 03:34:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:1152:b0:862:72a7:eb59 with SMTP id d2e1a72fcca58-87c81bb7802mr782654b3a.4.1790073292817;
        Tue, 22 Sep 2026 03:34:52 -0700 (PDT)
Received: from [10.133.33.151] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87c32ea8d7bsm626000b3a.43.2026.09.22.03.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 03:34:52 -0700 (PDT)
Message-ID: <d38ed0b7-c9fe-4958-8abb-ddc7900350ff@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 18:34:48 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3] wifi: ath12k: advertise interface MAC address
 pool
To: Vitor Soares <ivitro@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        baochen.qiang@oss.qualcomm.com
References: <20260921173033.846332-2-ivitro@gmail.com>
 <974e540d-d6e2-4ebf-8714-98e4056083d9@oss.qualcomm.com>
 <c30b21e218bfb00a1eb3c52ea0b7c9f0dc828592.camel@gmail.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <c30b21e218bfb00a1eb3c52ea0b7c9f0dc828592.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Eb5ec9sqtaWhDlctwN69cnrQgRhJP_-P
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab259ce cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=m8ToADvmAAAA:8 a=EUspDBNiAAAA:8 a=W7MpxnUmcWWQ-iNiEcIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-GUID: Eb5ec9sqtaWhDlctwN69cnrQgRhJP_-P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1MiBTYWx0ZWRfX+2L/8cKpwvAA
 7j89ww3R5mZPdNN217GGeJ5bCE56Q27eFYlu3fJ90bZAx2Y4i0i/zV87LPAV6sxOADXLrB7Xq6k
 6mwIBmLEnh+vAszsmuYeG+s0lmtk2nBvZVYtts8CnwSsq1OsWC9tdtNkM+RzypG9abrO0QWMV56
 BImUUXzDbaEvwX0e7oQGukq5mAeLNbE+2sv5t0xXeeRjmvdJRtC7xoHG356/+EtSnljNmcbsaGG
 Bl1fAzMmE1ON1QN9j6lXxxhsgbpj9ocudKz6VhiI4YhrHkzJ/Ac/MZysy43PlOmTi6II4F2L5S3
 GJI1wot2NaTRicGVMdGHo7x+DGAwbBe+kLaBYnfhcCDHtkyhqRSWL0r2+T8RukWn5a3Wunny0ks
 0ePOTg3fGwKWfpcGKhO5Kj4TNp2FRUcU/zP16sJnmCdgR4JyROgFsPHnUV3OfbJ+oS/ZfZK26aT
 ArDlZuu+9spUmvSvmnw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1MiBTYWx0ZWRfX1b/Asfjd1uxt
 +G/0RmhFuq2xQy5huNVI8HEXP+hVjred18o8Niu07lXS8WBKLKvBXoWHOJ9QmUjwk4MapLDfggI
 P70HLIJltHvVKFLrvGwc6mUawHhmvCI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220152



On 9/22/2026 5:29 PM, Vitor Soares wrote:
> On Tue, 2026-09-22 at 14:13 +0800, Kang Yang wrote:
>>
>>
>> On 9/22/2026 1:30 AM, Vitor Soares wrote:
>>> From: Vitor Soares <vitor.soares@toradex.com>
>>>
>>> ath12k supports creating vdevs with addresses provided by mac80211.
>>> Userspace can already make concurrent interfaces work by explicitly
>>> assigning different locally administered addresses.
>>>
>>> However, ath12k does not advertise an address list, so when a second
>>> interface is created without an explicit address, mac80211 has nothing
>>> to pick from and falls back to the permanent address. If the first
>>> interface is already running with that address, bringing up the second
>>> one fails with -ENOTUNIQ.
>>>
>>> As in ath11k, provide a list of usable addresses so
>>> ieee80211_assign_perm_addr() can hand each new interface an unused one.
>>> Keep the first entry as the wiphy's permanent MAC address. Generate the
>>> remaining entries as locally administered variants by changing only the
>>> upper nibble of the first octet, which naturally limits the pool to 16
>>> unique addresses.
>>>
>>> The cfg80211 definition of wiphy->addresses does not specify where the
>>> addresses must come from. Some ath12k platforms use it as an interface
>>> MAC address pool, while others use it for firmware-provided per-radio
>>> addresses. Gate the generated address pool behind
>>> advertise_iface_mac_pool and enable it for WCN7850 and QCC2072.
>>>
>>> Other platforms keep the existing behavior.
>>>
>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-
>>> QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
>>>
>>
>>
>>
>> I just did test on QCC2072:
>>
>> root@yk-Mayan:/home/yk# sudo iw dev wlo1 interface add wlo2 type station
>> root@yk-Mayan:/home/yk# sudo iw dev wlo1 interface add wlo3 type station
>> phy#0
>>           Interface wlo3
>>                   ifindex 6
>>                   wdev 0x3
>>                   addr 22:03:7f:12:be:cd
>>                   type managed
>>
>>           Interface wlo2
>>                   ifindex 5
>>                   wdev 0x2
>>                   addr 12:03:7f:12:be:cd
>>                   type managed
>>
>>           Interface wlo1
>>                   ifindex 4
>>                   wdev 0x1
>>                   addr 00:03:7f:12:be:cd
>>                   type managed
>>
>>
>>
>>
>> Tested-on: QCC2072 hw1.0 PCI
>> WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1
>>
> 
> Thanks for testing this on QCC2072.
> 
> I've added the QCC2072 Tested-on line for v4. Could you reply with your Tested-
> by so I can pick it up?
> 

Tested-by: Kang Yang <kang.yang@oss.qualcomm.com>


> 
> Best regards,
> Vitor

