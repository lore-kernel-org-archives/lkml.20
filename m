Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812118;
	b=D9sfZtWwPpPcQSHaQBbjgjaB7rQcveqTp1OyaMMpzT6YoNka6sUVviRmORPltISJ4dN8
	 7uSgBT2L3aOO4eDRIsBzHp0l8sPdkzJVdHyydxnRMGraCnemTN3Inl1BI1cKGBvX4SkEk
	 itN8CnRZLF+Hjngg1Kr1oivVoqAqPmdAAcRVa8sOvFzfngq9zbpWIeRPsjhTZH4eozqpN
	 cEMyEfIdhY2CtbqWQORSQQt8DJ6U60xPDeSAhYQGFy/uGihpTBD5NA1lkKVunb3YNhb1X
	 mqPIX/XPo0wPqyP2zcBSBKlx0QO+jPZpPHvAzz9Jy/qLohJCax7Rxuctf570Y/nq6Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812118;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=M04KcOfwG9b8qc/Tzo6l+/Fn22+OnPocu0yxZRNzOqw=;
	b=DmFSDBkV70tKO3tUzrtD1n04FmPm/82fPVZFru8XhlTko0jcheftYLhQJja5THjd6r+P
	 cEPgczV4HUbHQBN/rbiUG4D7WkJCDQud6J1gXPRfavYg/I5w5eakpOy/dphKZINLBAOln
	 ql8Vy4SBw04e+lLicMkSI/VDqOZzxqg+LrxDE7fwM5SWr6TS2g/NDGFhp3OHc32A8JITF
	 SkyKGsPyS4Pmy8RN8SpZKgQ9ZCLXH1dRj1KfQOe27WCahv1dDO0Lgkf5/MSONhGwbDzly
	 WI1aGnBuiwEDLNEkAtAiBHFjaDSx7k/QDiovIGJjQs75qx+cNgvHOv2nwvnaZcCXxpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CiC5mAwZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iPqJx6uW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3439C606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:55:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3439C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CiC5mAwZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iPqJx6uW
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LVMF1585507
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M04KcOfwG9b8qc/Tzo6l+/Fn22+OnPocu0yxZRNzOqw=; b=CiC5mAwZQuhjA/3S
	vrccdDUJBeR/HCw0avDpc+baNEZLEHdQwnxrvTbCZwJNprg2nHmcy7AmmLoKRCk2
	VST4d83JLMhkAgKwusf+MBUj5UgOIt+PeNKoG3qvaaDXttwrTH6YiIK8eMLBLdMr
	yeiD1Z0HPTKTdPcuXQTJjO06e27AHKX/ucdjpFzB0HKm/isnMJLesQ3pkZJmP1zs
	Bf55cEGE/FxR6WyXaGT5zkdrHGwRUfWl0POTLEKNIDS3fFlUbOs69nfcEfmUYMqO
	UoNDDVR7KcFS+HTZQ/1g6TDwouAeOtJSlygJWoolxl+FSMPoOjSEOmnEZK+4gRjF
	VTIs0w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhdw5e5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:55:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0afbf532eso2814155a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794812117; x=1795416917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M04KcOfwG9b8qc/Tzo6l+/Fn22+OnPocu0yxZRNzOqw=;
        b=iPqJx6uWOM/PxWP+hSQ8QFJbKKTkXnUxkjS1BxXRyfuy12vUw/tTBIF0rarAG9IpeP
         0XwX7w2ZeLfKr580CGjVA5SYhcMBnwWrwgyUCNhe6eoV4L0X6EYclxo72TcpZFz9D77a
         kLr/C3c1DdTK6BLTA5FicwvXKL/+UWkJ7v1pCwd0VsTcN75roggTWygdhOt06pjSS2Ma
         TAXEcr3BWV9zHa4n4OqfMpD+HMS9csBJlCCltyJQxq/JI8rmeHMkVz3WxwJVO/m065tR
         RWnRGZykq8sQetnW3b+Vb6uc8BYZsA+VwIZtb9iMv/9wBSSVLaLzsgcbRP1vj38jxVo1
         Qytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812117; x=1795416917;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M04KcOfwG9b8qc/Tzo6l+/Fn22+OnPocu0yxZRNzOqw=;
        b=fOBBGKGaEhVbDrhk84jgNbvkAf2zfabm7qxmhCJ76GiKVPFnwUgdlGNLVkt87VJEdU
         oAxrRhib8mq8+7jMmVSYnKLEx0cJMBfNbJCPd7KVVclg5QGtUW9zLMwsW976pm5P8mku
         fH3L38Vi9zI5tBwL6p/13vlvNR7qDbccrMb/PxDxWLBJoaNi3PI+KfqknKclPoXbREmf
         eJzVTnExMNbR2hi6EpxDTM03x3+pSlFELEW8fg7NS9+yHy4iuC/NoLQkJfnESPX8Q/1a
         ePwt8TjSQgg4pQzQFdGl2cqKQdPuYdR344p1quSQPwL/XZcUyMvvHh4BmE1CIbVtgNDt
         Gobw==
X-Gm-Message-State: APuU4Z9CqGScclOiU8T3stolUgaRwX8X8R7yPlPBCPrjLrewRMFZkXVw
	I0wm9UaDCv+B1UeWzmURF+lj5sZm+St8WCGn+KxWi30yiUQaXFP2TVR5oCRcJym4iq6wqE1U8PI
	36gJuxzTtmLOwvx12fDv3V/Vp3aT0MIAROkjmCcdiLc7D6ihG20jraOyp0EuEcZRkiJk=
X-Gm-Gg: AYBFou14fX6Tgb6w6lP2B5ZZeJaHYTIIvSlk/vNqxB+ZTi6cRkyRnCQq0aEVTxs2DQX
	56YTmx95sntWnibUmKdMzlpXgoyvaEENk6Ss7Vce3YI0qZm3C8w8IDKf1KTEEqE+sdE3qYCM3HZ
	xOY7B0+kv+c3ME3CTdvYlrx4zA7icTI4uwc53OkkJZ7hdjPYxWkdSbX2QjeYnGHd4ECnhcTSXhv
	iFgfWk2+6zgkQTPhjLDdjsfPmp8axrpolEHXUJQaMAFI8itj0SKMM5Ff2KNGu6k95swY5ZzJc2O
	evZ1it9dVkng+gPeRfhOcCrA1fOYElB9pfjWF5tLoOT17J+NUW03/RieCXNw/bl58+9Bm8E4HS7
	Y0V/JIe4boPr6/wdSF3IruKXdLj+nX+jymOaEVdoQ16M9thFxqUrs7T0d9OgkqJrdG+lZjDBZzX
	ja9R3l86nB6K8kfdlI95HF/07UU2BWQB8ZCFih4ZlRHd4=
X-Received: by 2002:a05:6a20:c998:b0:3fa:1ebd:2216 with SMTP id adf61e73a8af0-3fa1ebd2b12mr3667890637.19.1794812116526;
        Sun, 15 Nov 2026 22:55:16 -0800 (PST)
X-Received: by 2002:a05:6a20:c998:b0:3fa:1ebd:2216 with SMTP id adf61e73a8af0-3fa1ebd2b12mr3667873637.19.1794812116086;
        Sun, 15 Nov 2026 22:55:16 -0800 (PST)
Received: from [10.133.33.59] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2829dcdsm3208979b3a.48.2026.11.15.22.55.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 22:55:15 -0800 (PST)
Message-ID: <01333b29-8739-4791-9339-45a66811fc51@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 14:52:56 +0800
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
Subject: Re: [PATCH v17 02/10] coresight: Move CS_LOCK/CS_UNLOCK to
 linux/coresight.h
To: Suzuki K Poulose <suzuki.poulose@arm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, james.clark@arm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
        songchai@qti.qualcomm.com
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
 <20261113024935.3173715-3-songwei.chai@oss.qualcomm.com>
 <2246263b-a872-4a65-803d-ef1e031522f9@arm.com>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <2246263b-a872-4a65-803d-ef1e031522f9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VOVIDNPX c=1 sm=1 tr=0 ts=6afaa8d5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=HS0qQXPI_2Gq0Hqk6xEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNyBTYWx0ZWRfX6SFlXhyWvDoU
 yvM9MaDhvZ3Y3XLJIjqW8wqNTfL9r+baWi7S+pyOyrA5zQ3+Z5iJT1d0ngxWIEdWb1hfWXGYRrk
 90NGHeaSRY9q6pkkouXh4h2kMQ5draY=
X-Proofpoint-ORIG-GUID: 0T097-qSzXA3PjGR9rl0a1zy9zW3zG35
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNyBTYWx0ZWRfXxW40h/JJVMyE
 vXy/UIEEcoL7N+xUd18iT3dzD3e3zZl5UQeps7rLZ+/I/r76RhFEM1G3B9r05jdcbQXLcO810fU
 +ChREpLKYv1QmMk4fv9FcE1uDIHmTfoUK2LqhqDWCzpoQvVjBI9FZRrw9kSnJvJjLY1Cw9qKlzL
 JeucXZMaOG5rswYhHPBc/lV/wAY1ArQ2H52uCJsvPSa17RKeu9XVKPDdnkVN+8V1ZZpT6LmQp+K
 65tLTiMw5YP++FgiJPhaPkJal/RnbdVx+6arhs88Ep4H4h3YAmpTygz/yWFlKbFglpLSr7StP/d
 9030mUV5NLMPnjUHoGJfAjffQMyPLtytVX/EsFnKlBs1975bfS8ZIIhZstXsvPsyqJkHjSDTp1w
 aE/Ki1IFpzNidvzYToyWMD2NJ2DLpeCIfxWLgygXAYnEXywrMuyCjTBiMcJpiX3mABiPcIBOmxW
 gsl/SJuGZlBeZRNXD+w==
X-Proofpoint-GUID: 0T097-qSzXA3PjGR9rl0a1zy9zW3zG35
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160027


On 11/13/2026 6:25 PM, Suzuki K Poulose wrote:
> On 13/11/2026 02:49, Songwei Chai wrote:
>> CORESIGHT_LAR and the CS_LOCK()/CS_UNLOCK() helpers implement the
>> generic ARM CoreSight Software Lock Access Register sequence, which
>> is also present on non-CoreSight-labelled components that follow the
>> same architecture (e.g. the Qualcomm TGU). Keeping them private to
>> coresight-priv.h forces such drivers to duplicate the exact same
>> definitions instead of reusing them.
>>
>> Move CORESIGHT_LAR, CS_LOCK() and CS_UNLOCK() into the public
>> include/linux/coresight.h so they can be shared outside of
>> drivers/hwtracing/coresight/ as well.
>>
>> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-priv.h | 19 -------------------
>>   include/linux/coresight.h                    | 19 +++++++++++++++++++
>>   2 files changed, 19 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-priv.h 
>> b/drivers/hwtracing/coresight/coresight-priv.h
>> index dddac946659f..0d3f6229b282 100644
>> --- a/drivers/hwtracing/coresight/coresight-priv.h
>> +++ b/drivers/hwtracing/coresight/coresight-priv.h
>> @@ -23,7 +23,6 @@ extern const struct device_type coresight_dev_type[];
>>   #define CORESIGHT_ITCTRL    0xf00
>>   #define CORESIGHT_CLAIMSET    0xfa0
>>   #define CORESIGHT_CLAIMCLR    0xfa4
>> -#define CORESIGHT_LAR        0xfb0
>>   #define CORESIGHT_LSR        0xfb4
>>   #define CORESIGHT_DEVARCH    0xfbc
>>   #define CORESIGHT_AUTHSTATUS    0xfb8
>
> Move all of these register defs above to linux/coresight.h. We can keep
> them in a central place, in linux/coresight.h and drop patch 3
Confirmed.
>
> Suzuki
