Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933D435F609
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 02:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788490367; cv=none; b=Qi+6bU0oAB+XG3/Lt4soYV2UlzC0I6fhEvgpVKS/c3WT6SD+J6CaY7jp0+8JcF3PxfqJt6lUNHbBVpFoNjW8unjmfL1ffVTWrWRUN57tbSLiPNdsj4r0EETwgMkaDGmFePiSFSBKD19asdLSisQPhU2gs9b1xW6oIgeOGGfNDeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788490367; c=relaxed/simple;
	bh=QlMujZHC49IWB7sZXkB18nNzk/S5D8y89vS/hMwmN7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rMaiAG21YgARUYZ/SuuosEpfp/EyoNk/xL1VQyHJzyokj8cdyblnWqGRfuk5xdUJMqgtC4q9jGfVe7sByN4BIl3+gTQzKrr8xcE23s9qBCNYNCAuzgyFP4BTNjotniA8jyAs0jUd8zgSHu3GnK+vanezOnLSRfwOLzBCjKKVXw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BHVHwmbo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E4ofAtMX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BHVHwmbo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E4ofAtMX"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6842l5OF1136186
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 02:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FnVT70+tbIY9nO1tANIx2ub75kL7OtpAGxjZArmoyvM=; b=BHVHwmboAVjavFlr
	M/bwo9cFOktxOch1SvGGL27JT5WKyHSRKcEulq2mTu/6ffxeUklaQKP2kq8nbBqa
	PnyCo0Hmd7ehwlf0x+iUVRUg7BpmgrAsAgRl3unAtE4H7D6fVEgWxwfGRwEKWC6H
	ZEbgl2J+++VTVRO5HrsSyFEnOKO7LO2ocEoA0/aofQjsvVOwCjXh6gCAmeO2FskS
	cnbNwh3Bd7i4koi/97+xAm8OgiIoqQXoPQabLETW7J1GgItplbcfdhInw5QKJq5+
	MiKSYjJD/FolL8aQIfxyFzT/YEaTCBLHokQsHDNQAA0a+yNnlElzKQHySWuy53l3
	6OVwOg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5d149pk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 02:52:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39af92138f9so837999a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 19:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788490358; x=1789095158; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FnVT70+tbIY9nO1tANIx2ub75kL7OtpAGxjZArmoyvM=;
        b=E4ofAtMXNxQ+E0oSzzs1U3OB7CDfZ+SscOVLocy8V8r/RTZDJmsxoMeVq1/i6YiHbm
         jd/n9daignLnNoIEJ5f5A5BgqlZ4YD+ZQQ2m9PYcnBkqEbvg06aAjeIocqkL34qHeO1v
         F1ZXMJNKOVV9TBVhYqnHCpxzWpNdopGZ23lGlukqQBqg4Y68x2bY+Aqsy3bp2kx3WrOM
         KykTBs+GnFcFTxr6X8F2Q68UIpCxFp8Z1gMfBkqd7NTHo0zi+U2s6tLOIJgf7iRf+6t/
         wN094Hp+b4GCHaiDsZ1xqmwScQlPa3YVY0CKBu7kDTb7uvVaMUAiU2U9DPG6fuN0nxvs
         923g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788490358; x=1789095158;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FnVT70+tbIY9nO1tANIx2ub75kL7OtpAGxjZArmoyvM=;
        b=T+KayMAS3+OIFu5UrWazg19U2nP4GVUuFAsedd8Pcmr3+39sWn/rYaPVU1FjLq3hMQ
         FZUgTZHxcRjJH65fz+a1BQSn63MbNIdo8tOn8qNCeuZeHkY/6MSUuV+H/h8FfQbdeuqw
         BEQP1XOJCVOxT9xkC48VRuvVBh7XzESs6s8R2ToeVOUoMQp6I2yKuHc2GpXhZEeVNvwN
         Mhp50dgAw/2TceKghGTScVZiREshGVJr4Pr6vgisnbm6kXffaTp3E/Sskb54BmSiyz7B
         OfCpC30y4sLN8QnJqgJkB0lZBC2OgOqRDquXBsM1hWXmtakbHvYJVVP2iqYf+ISsxRqL
         qWSg==
X-Forwarded-Encrypted: i=1; AKwUvBzMmFfhLgv7r2p8jYsWrUPSHupOaX6pV/cgNjPKySItiu8O0nfOGtC0Lsj6/8WM4nLllIUdSOeP1ZGXD2A=@vger.kernel.org
X-Gm-Message-State: AFuF++lcLVR/adqZnNiHoNYVuOBmc/ZadqAxy9VrWl37kDJWRcjCYMQh
	Kc17AsHgKikzbUwH2ku87XfnusnrY8sMzYvo+BaGlVH/P4DgJBb0KQDokjMfhnHU9Zz6o+UHIU/
	uBErG4VX9UvXsu4cabDOhAxcmn/ebGk1KxXvVFv4Nst6bzan8h+xaWxGxfDGidJ5EAUg=
X-Gm-Gg: AYBFou3p3ajoAp82mlFcSxRd2f7puQGda/7h02r9ZnPRW72Fq8UvDNYUoh+ly64D/9B
	aSC6Vnk+1TlDk5LIwq2LA6WllaymnUF2NAHXBTdrKzIuIN6p+MQu96y3p24d0JA4juTOuH/ggcM
	sezjHiYsV8lcjG9woUVEmf9T9JRZnUeFz/w3o+7ydi4WIl/kYQnlcNQD/Cl7Plkepu8pl8mCaXv
	4T2nd4unb8f6+OwPSC21AKIxsyVuOOd9iDQcM9rTJGylK9YvoD6OmXSQoqxIG9GT3UsihE8QX3/
	Zur15suLEaZ9eIydTQDqNcMpKbbKjaU8OAU9MIujrmNulmhCMJ+7vUwEnKeIQO8QdSgkmb7nXQY
	7sOUlSC9NK1EYKiC/ajeEgaI+5zUXyUEjcnVr4/wlT6iJ8NRkl4YPlqHALlhyed+m
X-Received: by 2002:a17:90b:1d4c:b0:38e:6d55:b1a6 with SMTP id 98e67ed59e1d1-39b27c121dcmr1781114a91.3.1788490357899;
        Thu, 03 Sep 2026 19:52:37 -0700 (PDT)
X-Received: by 2002:a17:90b:1d4c:b0:38e:6d55:b1a6 with SMTP id 98e67ed59e1d1-39b27c121dcmr1781087a91.3.1788490357390;
        Thu, 03 Sep 2026 19:52:37 -0700 (PDT)
Received: from [10.133.33.207] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d7e8sm8536044a91.16.2026.09.03.19.52.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 19:52:37 -0700 (PDT)
Message-ID: <0365be38-954b-4aaf-b73c-76bf9e3a86b8@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 10:52:29 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/15] arm-mpam: Add basic device tree support for
 resctrl
To: Ben Horgan <ben.horgan@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        James Morse <james.morse@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
        driver-core@lists.linux.dev,
        Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei
 <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
 <8f0c4f14-d0fd-4b57-a080-7011fbc54be0@arm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <8f0c4f14-d0fd-4b57-a080-7011fbc54be0@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDAyMyBTYWx0ZWRfX6ULziOkqW90S
 JQ4Ny6L4CL/xTL9vVWkVS8O/UPSM2lVdxt4udecFtB3zkTor5QsNP5XJAy3vsCP7DAl59onNqok
 OBgx77bcGNVZ5nqRpfuosgbfQUbhGKgSvZ9/0XYxZfmSkLbiMEiq+mOmuWiCh3ff3KSxazVASgB
 M+ZiiKpk+t08UGEtFALRKqJMWO7pI1ER3caHQUID2wlwBY6KMaHAfIlfMZGHCbDYtQ7aZYy9r2s
 323KS622aJrxG6gfk9dIRQxQL+ROqXcqZKQ0NJYvXH6FI9NjzlfL4NTw9nwhE97vLm9gVf6vE2b
 JjmGXPsusuZ2MCLQcwcuNvwfdGJ4ZgqYFUtRnffbEw8rc62fngtcgdDOmgA7m1SCjoA/mj2jRrA
 D7BzMgIpy2TWsx9ajSEBMkzbrpo5TkWLYGHNNb2Nees4ohfEq/C2w9SCAzL01EsS9VMZh+I47z7
 Rur8bdHzIlN2Ix/NJSw==
X-Proofpoint-ORIG-GUID: fk46N8YzPn6IPwjOhYCmekVkdhfeMFDu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDAyMyBTYWx0ZWRfX7gc/A7DuOvLx
 nIxIlMhVXfTOY3bRanfb56CWGHYtD/3dq80Xhpw+5nh/K0mw/ErgRrBKqKPkWmLchbjwnK9COUc
 mB7NU9ipbtv+bxlAFMUysETESwUdzdc=
X-Proofpoint-GUID: fk46N8YzPn6IPwjOhYCmekVkdhfeMFDu
X-Authority-Analysis: v=2.4 cv=J4GaKgnS c=1 sm=1 tr=0 ts=6a9a327b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=Ikd4Dj_1AAAA:8
 a=ag1SF4gXAAAA:8 a=QyXUC8HyAAAA:8 a=JZ0jlq9R20JS8rWC7cYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040023



On 9/3/2026 6:11 PM, Ben Horgan wrote:
> Hi Yin,
> 
> On 11/08/2026 14:30, Yin Li wrote:
>> Notes for James, Shanker and Rob
>> --------------------------------
>> This series builds directly on your not-yet-upstream MPAM snapshot
>> patches from the mpam/snapshot+extras/v6.18-rc1 branch. Two things I'd
>> like your guidance on:
>>
>> 1. Do you mind us picking these up and continuing to extend them? We have
>>     kept the original authorship and Signed-off-by intact and documented
>>     the inherited-vs-new split below. If you would prefer a different
>>     attribution arrangement, or have your own plans to upstream MPAM DT
>>     support, please let us know so we can avoid duplicating effort.
>>> 2. The fixes to the inherited patches are kept as small, self-contained
>>     patches on top, purely to make review easier. Since fixes to
>>     not-yet-upstream patches would normally be squashed into the original
>>     commit by its author, please point out which of these you would like
>>     folded back, and we will reorganize accordingly.
> 
> Yes, MPAM DT support would be good but does rely on the DT maintainers having sufficient evidence of
> platforms that would benefit from it. Folding fixes into the patches is the way to go, you can use
> square brackets, e.g. [li: <what you changed>], in the trailers to make the differences clear. This
> way we avoid having commits with known bugs.
> 

Hi Ben,

Thanks for the guidance.

I'll fold the fixes back into the respective inherited patches and mark
the changes in the trailers with square brackets (e.g. [Yin Li: ...]),
so there are no commits carrying known bugs.

On the platform evidence: the series includes a Kaanapali DTS node (the
DNM patch at the end) as a concrete example of a platform that would use
MPAM DT support. We have validated this series on the Kaanapali platform
with that node enabled on a local test setup.
It's disabled by default in the DTS since production firmware doesn't 
expose MSC register access to the OS, but it should illustrate the 
intended usage for DT maintainers. We're happy to provide more detail if 
that would help make the case.

> Thanks,
> 
> Ben
> 
>>
>> Rob kindly provided some early off-list feedback on an earlier draft,
>> which this series has tried to address.
>>
>> Add Arm MPAM resctrl basic device tree support.
>>
>> Arm Memory System Resource Partitioning and Monitoring (MPAM) with
>> resctrl requires device tree (DT) support as a prerequisite before any
>> higher-level functionality can be enabled. This series provides the
>> foundational DT binding and parsing support for MPAM, laying the
>> groundwork for subsequent features such as MPAM Firmware-backed
>> (MPAM-FB) partitioning.
>>
>> The patches are based on earlier work by James Morse, Shanker
>> Donthineni and Rob Herring, with fixes and additions on top:
>>
>> Inherited (authorship preserved, with fixes noted in each patch):
>> - dt-bindings: MPAM MSC binding [1]
>> - cacheinfo: expose cache-id generation from a device_node [2]
>> - arm_mpam: device tree support for MSC probing [3]
>> - arm_mpam: memory controller MSC support on DT platforms [4]
>>
>> New on top:
>> - standalone fixes extracted from the inherited patches (device_node
>>    refcount, cache-id sentinel/type, RIS index range checks, MSC window
>>    size, accessibility return type, foundling MSC creation, cache-id
>>    error path)
>> - dt-bindings: schema and example fixes
>> - arm_mpam: derive MSC accessibility from per-RIS nodes as a fallback
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=b38bed339681
>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=2af39084438c
>> [3] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=a6ab8b6c77cb
>> [4] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=c1be40782ace
>>
>> DT affinity model
>> -----------------
>> An MSC node is nested under the device it partitions or monitors. For a
>> cache MSC this is the cache node, so the MSC's CPU affinity is derived
>> from its parent cache; for a memory-controller MSC the parent is the
>> memory device, which is accessible from all CPUs. A per-RIS fallback is
>> also provided: when an MSC sits under a generic container with no
>> affinity-bearing parent, affinity is resolved from an explicit 'cpus'
>> phandle or an 'arm,mpam-device' phandle on each RIS node.
>>
>> The Kaanapali DTS patch is for local enabling and verification only and
>> cannot be upstreamed: the platform is already upstream with a public
>> device tree, and production firmware does not allow the OS to write the
>> MSC registers, so this path only works on a local test setup. The MSC
>> nodes are disabled by default, serving as a reference example for other
>> platform DT authors.
>>
>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>> ---
>> To: James Morse <james.morse@arm.com>
>> To: Rob Herring <robh@kernel.org>
>> To: Shanker Donthineni <sdonthineni@nvidia.com>
>> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> To: Ben Horgan <ben.horgan@arm.com>
>> To: Conor Dooley <conor+dt@kernel.org>
>> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> To: "Rafael J. Wysocki" <rafael@kernel.org>
>> To: Danilo Krummrich <dakr@kernel.org>
>> To: Reinette Chatre <reinette.chatre@intel.com>
>> To: Fenghua Yu <fenghuay@nvidia.com>
>> To: Bjorn Andersson <andersson@kernel.org>
>> To: Konrad Dybcio <konradybcio@kernel.org>
>> Cc: trilok.soni@oss.qualcomm.com
>> Cc: aiqun.yu@oss.qualcomm.com
>> Cc: ganapatrao.kulkarni@oss.qualcomm.com
>> Cc: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
>> Cc: linux-arm-msm@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: driver-core@lists.linux.dev
>> Cc: devicetree@vger.kernel.org
>> Cc: trilok.soni@oss.qualcomm.com
>> Cc: aiqun.yu@oss.qualcomm.com
>> Cc: ganapatrao.kulkarni@oss.qualcomm.com
>> Cc: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
>>
>> ---
>> James Morse (2):
>>        cacheinfo: Expose the code to generate a cache-id from a device_node
>>        arm_mpam: Add device tree support for MSC probing
>>
>> Rob Herring (1):
>>        dt-bindings: arm: Add MPAM MSC binding
>>
>> Shanker Donthineni (1):
>>        arm_mpam: Add support for memory controller MSC on DT platforms
>>
>> Yin Li (11):
>>        arm_mpam: Fix device_node refcount in DT resource parsing
>>        arm_mpam: Fix cache ID sentinel from ~0UL to U32_MAX to match u32 return type
>>        arm_mpam: Fix the RIS index range check in mpam_ris_create_locked
>>        arm_mpam: Fix ris_idx type to prevent range check bypass on truncation
>>        arm_mpam: Fix MSC MMIO window size to use resource_size() instead of end - start
>>        arm_mpam: Fix update_msc_accessibility() return type to void
>>        arm_mpam: Fix mpam_dt_create_foundling_msc() to create MSC platform devices
>>        arm_mpam: Fix get_cpumask_from_cache() to clear mask on error
>>        dt-bindings: arm: Fix MPAM MSC binding schema and examples
>>        arm_mpam: Support MSC accessibility derivation from RIS nodes
>>        [DNM] arm64: dts: qcom: kaanapali: Add MPAM MSC nodes for the L2 caches
>>
>>   .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 202 +++++++++++
>>   arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  50 ++-
>>   drivers/base/cacheinfo.c                           |  19 +-
>>   drivers/resctrl/mpam_devices.c                     | 401 +++++++++++++++++++--
>>   drivers/resctrl/mpam_internal.h                    |   2 +-
>>   include/linux/arm_mpam.h                           |   4 +-
>>   include/linux/cacheinfo.h                          |   3 +
>>   7 files changed, 638 insertions(+), 43 deletions(-)
>> ---
>> base-commit: 3d08ff75a47a3e7e2ab45a3bcab6723b4d906422
>> change-id: 20260731-mpam-resctrl-dt-knp-support-c15dcc3a4a98
>>
>> Best regards,
>> --
>> Yin Li <yin.li@oss.qualcomm.com>
>>
> 

-- 
Thx and BRs,
Yin

