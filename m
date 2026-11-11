Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794369992;
	b=MSvgou+pCy8Yj/uL0rBGK03k87BFl8jXVAQ6dpw70r1v8oKcW06L/8BwGsyt+Mxt0Boa
	 F6tTzBFOzI+r7x17sYbWe7xYdkWnjBWUpiLxV5yQ1dJYN4/qJ87xConLLCD0hkm6IWCZK
	 laPW2tSAYHWZaESWQELq7AMzGl2afiKGZ3SKR8ZAimA5Y0/DNs69xYOAtXVyMZL2DcKbu
	 ZcIz/pHuQT9Jnj47scUZHGvoYv+TYH7DKAYJTTSOEXZSG4TBN7S78t0RMQxYcaZ/vTKKk
	 OqCeqIJE9uCXkJYdXqgr48SwZRKmw4bb5A0r7p0P/S4XpSTV4MRBovU3FsLGpuUIH0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794369992;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=X0N+eXPcaXDvyNvT+oaZCqoDi7RGGzFN8kPT+kr2B2g=;
	b=t2XRiDcS2UsMpT9OqqQmUwRNM/bt96l6vM4TDU6Ak9U2tmopTHmu2rT3EATXh1/udRpE
	 +o2jAIMG2QoXmmHWQDdhPwbg6ZnHCfZ9ogXc81N+JPGvjTOVMR5ioYYWYQrcL2JI6iCVe
	 g/LuCRx5VpRURT03pJS7i6XWZZgoZ4PBiAwk8ct/YIUaQ8CSrTb8Ia7psvQ1Sb75VPeQH
	 Xouq/nUlytSGY5NnMvmHkUkI6bC7mq/uAa6zZV/1rHhi93mbRgyy3eg6dkUIPCEb/x/MC
	 UeBOnzDGnABWPJeWklM3Zhzkvmq2iP1Gggk4XZnidu2ata6G998nMMN8WzR3Xo/uuKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mcL7E54o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VDKfoVmn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39579606A338
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39579606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mcL7E54o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VDKfoVmn
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB1tZjh923311
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X0N+eXPcaXDvyNvT+oaZCqoDi7RGGzFN8kPT+kr2B2g=; b=mcL7E54ozQDbMzmA
	mNpGJabuuRSkm1Vm6Iutj5fzqHDToSWvXi1Z3N3PWkoqcXxx5lUE2AX6Uc7XxFEc
	Mw5xjro7woOr2ZRIAe3EJS0fNZOjXjSl06H7AZuU62I6JK1/Me3CuBDf51crIaBF
	vgMAMDAq8vodazyRJPY5s+zJkO72Dz8ARIEmFlsXyRqJbEfAlzndz+E1Kl7fFVkL
	X5fFMUGyfCy25vKKmnfYNEtpCUiDOwmevJm/tdNyUw9+igItkG1DDK2V8Z0quL9R
	fxpLRcNdUywVS0/ql9XKrAqLuFAdVS7JmRWjhsKHXOSRjEFKq/TrOT6t3+/lUaKP
	Ve+jdA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvcpegwn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:06:30 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5565736eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794369990; x=1794974790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X0N+eXPcaXDvyNvT+oaZCqoDi7RGGzFN8kPT+kr2B2g=;
        b=VDKfoVmnyJ79zCu6kB5nprMDfcU72xDP+b4NGCmXmpBli3VwnBTj4GDoCQn6XRgHRG
         P3vZuAVmT9zEpMYIdzx+zBh0J3GNDR/Jvq7zI1zZYbopdSOctAHqgWbJQ648Ta6N4dLi
         zQUtKCCHlyaZhTsHQjTmE3fkb/P67nxvhijvosrr7c/FZuV5f5gXx4EOsEb5WFDTpCxo
         CLjiMQDlXJbm6f2uuZtBLuBu6Iv0dROKHJV6OpnnMM4X5LQ4nd4x1F8LpVJ0L3ooYAom
         SexMOu81myHpMMN8SEiGYTDR8MvHrhct1R6aPm7ET3A3lDmpVQRQ0rCA6sM5c/9F+WKV
         AMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794369990; x=1794974790;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X0N+eXPcaXDvyNvT+oaZCqoDi7RGGzFN8kPT+kr2B2g=;
        b=MZ9vmeRIK4j+9Uw2Ytxb1JfODNFyWe8/Uzzj3+jhIFsZIrwAa5YsSKKKVN80D5Zswc
         EWLz0JW7YIAcDFeFGDAgpbwcNHgphLdsfbMbBVDuqDf4bShMGe3R/8n2cR6j1LAQVK3Z
         Sr6s5weru1Tsq0eewoCFbgl9iTqHpL7WFsGXVtLZXxt+qKKBYTeh/aHr5yXu97DhQ3dh
         SaRTTaSnVK5jdLtU/T/hDhKdkrLfCPlBO5obdoC3WKC1ywV3ArP3Uizq46FZ/NZmXJAP
         sKcBW9NexFycZSG6WlCH0Yzojpw37U5QYImsM2J4+t3cA84F9Jfjt1UXWDhDOB0N9+VE
         fFzA==
X-Forwarded-Encrypted: i=1; AL+hErFTvcRmjsiEAKPTUvvXfOJ7JP1vYMhD0fF77c/h3qG+UHFrJORCNIl4Y8q2fg9N1SOxc90v/ZbBNqd46gw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+A2LXQk8K6jd3WYYKTwRe9tMM35I0TJ+GevTWKC9Bcwygybs6N
	uHcD/ivCm2c14+cblDWq1LbIJRu6MOohfjZdgosAHsFhUXDCCUVJX5TDXCwmTx9eE4rcrgty1qM
	NzXp1HJTghfWy8YpgicqhNRTNrNhtOqs0iZz0a7Ngtaq2LQzESaqKGHBAHxUsORVJKKI=
X-Gm-Gg: AYBFou2ExSpRTkYLITcYAdpa4B1wiGxsZcv4tHE8eIFt4naqqn+5Ni5P26npvWyZhyn
	a6W3AajgZEBkeGSj5Ec/yc/8knVhz5GmjGlBI0flReyCh5Xe4NfgxMSkVR9FrNNjgjAf/hFBr5+
	82o+FYl0M9nDnj39ThsWiaTXiUzTM33RQhgspiFt8rX7coRKPaSSGFvIgn91pb8mwQGTJCKJ0yc
	7pz2j4j9NVdInObPIIMR9OmuGfK68oLxynVWMRnCV3zDBhUNljxN6DkFTHbe8iUVTLWc4dyEIep
	tKAqJ3Eh4/epo3aP6Fb4jW19vQuWMtIYEXapfUaiy9VsY49yzPmKX9aNcZHO0iHcx7ahkYpOYfs
	po6uFKW37gmwcApY7abAjP7m7oIHzDqGOTCj4QrBFKJ7fSQ4M3mLQuMmmeZYpK6KxvpFLMKNccq
	VwHJFTZw0qAcT8mGprad5gN1DxWzeS0og6mcwb6AoO
X-Received: by 2002:a05:7022:5f08:b0:1b2:471f:c4c with SMTP id a92af1059eb24-1b3c030fcd1mr1051463c88.19.1794369989745;
        Tue, 10 Nov 2026 20:06:29 -0800 (PST)
X-Received: by 2002:a05:7022:5f08:b0:1b2:471f:c4c with SMTP id a92af1059eb24-1b3c030fcd1mr1051345c88.19.1794369986889;
        Tue, 10 Nov 2026 20:06:26 -0800 (PST)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890e04sm11420079c88.2.2026.11.10.20.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 20:06:26 -0800 (PST)
Message-ID: <b47f5ff6-014b-4b4b-924c-bd6310bcbded@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 09:36:21 +0530
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
Subject: Re: [PATCH v2] usb: dwc3: Update nominal max votes for qcom usb
To: Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20261105100626.2003771-1-akash.kumar@oss.qualcomm.com>
 <e2847855-c096-4aac-bc85-386f5502131f@oss.qualcomm.com>
 <875bc537-af18-4d4e-86d0-9bf0ed7992db@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <875bc537-af18-4d4e-86d0-9bf0ed7992db@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxNiBTYWx0ZWRfX2el5CV34lDUB
 HLhtXfTe7vICTnYzf61CzbOedqI0wgPRmTYOJFGqtzi6LgdyK336WjhMDUptGm3FBVQcmH/7c3D
 qD7dunqCBqddkrI8e6uDV7DJMi1DDUZ9pLb5cC02jhnh2YTerRSLDqGgClIInPzZrBKE4Zhndqh
 DtpIzkj5Gg8084glMNbTLFle1G+0Wh095MEWThWHjAkgX4zGqCZUTYovTVg+BLcA3ZjGWKgGqQI
 XN9Gs+ZNjqycXfjmqx0mDP9wCLB72m7G3vI833C7RxR9aGGtwwi3uqAVs9v4ulGSHQPRYOjAbUb
 ND6pjfXTzezmZXxe4tlcQyiAUu+gBiO+qW7kCTWtQoWftQqCMgqGGH7CaAT4kxT6MavHB3kSsb5
 dklhW42eXl3/cnUfL6N3utswJ0m5PRIpwYvM2Bj4rkY8FGZPufujClCYQREv4grd1F0HjV85ZqW
 fK5j0tpIzI4fHPmoSSQ==
X-Proofpoint-ORIG-GUID: WPwwWKcrkk55tmpvUqas8CGLgL7SH4jt
X-Proofpoint-GUID: WPwwWKcrkk55tmpvUqas8CGLgL7SH4jt
X-Authority-Analysis: v=2.4 cv=RfAFmFtv c=1 sm=1 tr=0 ts=6af3e9c6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=dkA42MIeFly6lUBFm3wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxNiBTYWx0ZWRfX2npWnX+2vzO+
 L9N7JTRd4q1yjq1srVA1OcwPwR9U3804iHlAXbNJh76c1tllejqSFvtFb8KZ55Krgv1Xk+323cL
 koXJbke9+kWII2ewK+0q6ftCZUpssRY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110016



On 11/8/2026 12:52 PM, Akash Kumar wrote:
> 
> On 05-11-2026 21:11, Konrad Dybcio wrote:
>> On 11/5/26 11:02 AM, Akash Kumar wrote:
>>> Increase the nominal max USB memory bandwidth vote to let DDR scale
>>> higher within its nominal corner, fixing glitches seen during
>>> simultaneous USB audio use cases.
>>>
>>> USB_MEMORY_PEAK_SS_BW is raised from 2500 MB/s to 4500 MB/s (+2000
>>> MB/s, ~1.8x). This ICC vote does not by itself determine DDR
>> Can we scale this depending of the real speed of the connected
>> device adjusted for the real data throughput? i.e. if we walk
>> the tree and min/max as appropriate, we end up with say 10G
>> wire speed, out of which we can shave off some static overhead
>>
>> 4500 MB/s is 36 Gb/s which is way beyond what USB3 can do, in
>> any configuration.
>>
>> Konrad
>>
>> Hi Konrad,
>>
>> Two things worth separating here:
>>
>> 1) The ICC vote is not a USB wire-speed requirement, so it
>> shouldn't be compared directly against the USB3 line rate. This
>> number is a DDR/memory-interconnect bandwidth vote; the platform's
>> interconnect/OPP table is what maps a given vote to a DDR
>> frequency/voltage corner. 4500 MB/s doesn't mean we expect 36 Gb/s
>> on the wire - it means we want the memory subsystem's bus matrix to
>> have enough headroom that the platform's table picks the higher
>> in-corner DDR frequency instead of pinning it at the lower one. The
>> vote intentionally carries margin for the aggregate memory traffic
>> of the whole USB subsystem (descriptors, buffering, concurrent
>> audio capture/playback, etc.), not just the raw bulk payload of one
>> device, which is why it doesn't map 1:1 to link speed.
>>
>> 2) We do already have a speed-based split for this, just not a
>> per-device dynamic one. dwc3_qcom_interconnect_init() picks between
>> the HS and SS vote pairs based on usb_get_maximum_speed() of the
>> controller:
>>
>>      max_speed = usb_get_maximum_speed(qcom->dwc.dev);
>>      if (max_speed >= USB_SPEED_SUPER || max_speed == USB_SPEED_UNKNOWN)
>>              ret = icc_set_bw(qcom->icc_path_ddr,
>>                              USB_MEMORY_AVG_SS_BW, 
>> USB_MEMORY_PEAK_SS_BW);
>>      else
>>              ret = icc_set_bw(qcom->icc_path_ddr,
>>                              USB_MEMORY_AVG_HS_BW, 
>> USB_MEMORY_PEAK_HS_BW);
>>

Hi Akash,

  Rather than relying on DT parameter to determine ICC bandwidth, we can 
do the following:

  a) In host mode, we can register notifier to usb core and based on 
device connection speed at runtime, we can modify the ICC bandwidth. If 
its High-Speed, we can scale back to SVS. This reference is present in 
downstream.

  b) For device mode, we can register a post-conndone glue hook to dwc3 
core and depending on connection speed (DSTS regsiter read), we can set 
appropriate ICC vote. This is not tried on downstream but I think it 
must work fine.

Regards,
Krishna,

>> This patch only touches the SS tier's peak value; a controller
>> whose maximum speed is HS is unaffected. It's set once at probe
>> based on the controller's maximum capability rather than walking
>> the topology for the actually-negotiated speed of whatever is
>> plugged in at a given moment, so it's intentionally a worst-case
>> value rather than a precise per-device figure - which is also why
>> it's sized for the glitch we saw under concurrent audio+bulk load
>> rather than for a single device's best-case throughput.
>>
>> Thanks,
>> Akash
> 

