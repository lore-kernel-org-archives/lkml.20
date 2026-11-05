Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793881210;
	b=U/E1dwcbHTK1+SsSkC6I5CD1kYZ5WLxnVYhq7aWzUnwHBPjQou4FVbSlY8bgnMSksfsF
	 ZVL1GyvhcomDYKq+cw1K/4xLsFQNBn0PTacD15RjERyc+mxmQtcgwjH2ikMs2pdpACxDr
	 USco4WmRsfvWRLRRJvwfWagSmIogCsYJzXYsOBh+VR6YXNgSpOWTK8/B2N66x28T5UV+Z
	 Ma2ZYNCTjP8Ifc+DZXNp+GAcP/v76EWDX/LiCm7epqh2NAbPjfRIDTbUvr4a6hVY8wnHW
	 s8FBbJuFlgEs4qttIUGxPf3cKPf8GH0QvoC7lcGaIMGxXinB/fEzKiWofgKSMIapjiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881210;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UEl4twqur5IngFkbSGALZnssW6BYpnNSqz5to5vk7TI=;
	b=Dj0tE7xmEVUY2LJL1/UHSUyUislVB1f+aX4xUmusndDuikgqVvpFrSFKsSgGCmAuZehw
	 KThHwMb4a87CCqNAxzO0g5v0QHhF8fcLoQBUuhtw/Wnq0ohrUW+6EcLLCSb7jWq+pLVP+
	 7h2hbtTota6EHaAiW1txgMMmSXPzvuX+Lu7N0OQQXnEr/qUUYgPZzscSXxiKrqMk0jR1J
	 zGdNaqy8MNPn6kNOyJ3e6CBr9MkShF0NEW/yJ4pe8eng8si3PSahjyIQ5lzCBzEyJnE+W
	 7UQr40gClMfTPZD7uB4uilCkAMZZIN37ubHtJov/1DkfrKWBb/kf3bOlBiU5W+LBpzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lzc3Q93Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RLkzY49W;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFD1606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:20:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AFD1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lzc3Q93Y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RLkzY49W
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tJAZ082990
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 12:20:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UEl4twqur5IngFkbSGALZnssW6BYpnNSqz5to5vk7TI=; b=lzc3Q93YvIwIfDDH
	4/8VpNsLpDqtFtO8zwoLyTUNtriRBLcym9Lr9CV/MsBm9gJofzuYV2G81H/SGL4H
	AHIF57WyibJ3oNcREhRawGVJruw349p4tumJq+aehm+wVM4/pqcibl46BI9PQGIs
	bY33Pv5mP0zZalC+F49Qyt7SARD95ZGQnQFrZzN6y+w75GetHg9es7w1alRXKqTj
	20OA0FGc/4Na2Dhh4AXm2JKDPoYNRdwK8PmiQOf9w9d1RIRtkCYGj22/Ti9yxs9B
	Ve11ZYIbXgiczGqn1h24vurQvSgG2ARtRf2EjWVz3/H54QT+CGs0Y95j2I8TbUlx
	crXBbw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq1p0r3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:20:07 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd652c0385bso1175877a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793881207; x=1794486007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UEl4twqur5IngFkbSGALZnssW6BYpnNSqz5to5vk7TI=;
        b=RLkzY49WSC1aXaWnhYfy++8mWqI626VI6kxtGEz3m056/Oh6jsVmcc1JnE8/wbavGf
         BQlM+wQSD0vZf9HSdEuaeBtqZ5XdhubSy/lv+MKGBOJ7BiyeQWoJU99ZNHOfAjXSHWns
         wG9oGujhNgsc5ouodHQ1TgfKkJobIZ43hnoALKEKKVLpvuHPNykRLvHDG6UmSROFt7ig
         8Ncj4rryMzEscEViSF6UZ2KDaRfcfhDyfTBZ9GC/kd9S5IRcdz75e2zheR62i8ht20pd
         A81ZjurRVdTynevxQmQtXWXViybr3bjzIs1EENoJRPsybh6RtG/7egkqG+oR8w83WeX/
         xIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793881207; x=1794486007;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UEl4twqur5IngFkbSGALZnssW6BYpnNSqz5to5vk7TI=;
        b=mzjd0j5oCn6jGkBV/zfL4zDJUn0URj1HP5LT/uGxR1VqU4nJfpolaObxYjMEiec7Ku
         sykJqNcJO2TRH7kRBh2nFecqVUR1Xt/ezujCOL3NMnQ8wXRkA+odZqow6mNkBWFbjEVn
         ciipaFf7L2xHKXussPhdmgrnHQxkhPSMe6+vYBcXivfx8N5F8ZYk09i4pESsjgzL7nWT
         cSbkQizOsuexFg+A9P3+nzR+Zi4v1I98xG6mdosLYJOTiru/0+ZO7TIZ7B62rRVMWpmk
         COJKIxtlgALquU9mR/t7Y7+Suz5XmkOAmHflcABunWlpbUolR/ccchKo1/4FMBDVKXK9
         03Vw==
X-Forwarded-Encrypted: i=1; AKwUvBzyZuJyFTbK/vcqaFuYhwDDdaYBm5Zu0t/jQAqE9o6Jkb79IAb+1xEqUb2gbsWrmYoBchzRjNSPvAy/DRE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9G5ediZTX6PA1Ut0LRp16B7MmfiMOxjM8vNfOyjBNDp3MhFJip
	LnqXxgn/H+hMBqAVRw2DeWToqsU7E6Nf6w7Ycm/jWA5IYm74fY6udGUZ0Mr+E/sgRbwxaNIjFPj
	TM8JrrNR7KSDFs3MiCybMPckZFq31sphtf83ZEaLxjhl79gM/1yVDQuPJFzd329ufAH4=
X-Gm-Gg: AYBFou0a6r55bIo83Li72ydgxQh/3p+mkzZ9rK3ASFJKLbzFIXlfrbaVXSnhaS5cj0x
	pbyQufnD76o9mb/5NeCLSwKHUrKKpzGFPxbJWLicqQgPfcbv1DJ5KPyNAmwxAz6pBiUSa0VlcV/
	y3+x7CGE5Gqy7LSr8oJiF4/m0NSUMVWltFVVKDWwXl3k/SDKGiySIQpFVllgm1gDD1StBQPu03U
	bgGElEuSyB5wO1PAP40CChvt5T58nss3LVN0BQibtCRNC2cQh3K+wz/1PoN+aytL4dWjzdsNxoa
	fxYSa3ZbT1j089uA6Z0uCFoesQJETP0urqQ6OnoH0mQ/mnGix6I7NdrW53i9AK3iUvg5LNk2oaf
	xAosB9mUmUWuQNmSPjxSTPZecLGAj78o/tiTAIZdXO/mum5nCFwhDrwHF4sYlZ3sbm+arCyouIe
	B2x8204dMFufsWWoP6dhL0CSybahcX98eEt1Hm8a42RaVr
X-Received: by 2002:a05:6a21:6f0d:b0:3e8:b7fd:628f with SMTP id adf61e73a8af0-3e928c8d3d8mr15995257637.22.1793881206561;
        Thu, 05 Nov 2026 04:20:06 -0800 (PST)
X-Received: by 2002:a05:6a21:6f0d:b0:3e8:b7fd:628f with SMTP id adf61e73a8af0-3e928c8d3d8mr15995228637.22.1793881205786;
        Thu, 05 Nov 2026 04:20:05 -0800 (PST)
Received: from [10.133.33.115] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b26cb5354bsm543613b3a.49.2026.11.05.04.20.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 04:20:04 -0800 (PST)
Message-ID: <ccf65ad9-b472-4fb1-871e-c0b1a09b5971@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 20:19:52 +0800
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
Subject: Re: [PATCH v16 0/7] Provide support for Trigger Generation Unit
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songchai@qti.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
References: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AaYkjHXG c=1 sm=1 tr=0 ts=6aec7478 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=QAo8fJdoNwDdyN2yiNgA:9 a=Y9flqnBAzUAcuvk-:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0OSBTYWx0ZWRfX9TPVdNr77Ujl
 jQXkLbwttM9Lr4N+sBBV4qfhz54c06QtBkAZkzZwYkRU0aFNV4VnBISw2/Bqwo5DEJtd63I4PQB
 ZiNaHD1100mHr+sJzom1duMvOmIpkPdmjxmnoRB+VLveIRI261DcoIyQD7w71FXvW3dR/mbcTsk
 ES7DUWSRbuwdFjCEANdngAGJElThFNIbiFLJmxnP7sGdUXbeA29e37PqbxUthf8HsL3X283TbsM
 uo9Jh1FSVNKNpx2dcO5GXnqKZwwO5FryqAAS2PbDQR5nJknVWJtGWXMXUtY9ZYj5C0j0MQ/ed+b
 YLkF/QQeYU4yKpysVJnKUrukelLpn92LuZMNrRc4K7pbFJ1fUOm4uaY5o6lAeGS4TTwDgCtzKM5
 OZChpo6sceci7u7hS39lA//JLlGvimuFNvUqrfXO4T6yha1qprbjEqOLuNRnH44q+6eHOZ8j67b
 KVUISlBoQF2QQ0gwLfQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0OSBTYWx0ZWRfXyACC4Ns25OeY
 tDzC5eoKfVYzAi9mqqwHVFmbP9Uc5XSypGvzfpR/UycMFsojiH1SOD17gVLS78AVIhi45OskA3g
 mnkb4QIUOaf9oHH9LXiduPza2pmTKn4=
X-Proofpoint-ORIG-GUID: Oc-a1nQ5puV2Sxf2sAFMSR78gZ8X_gif
X-Proofpoint-GUID: Oc-a1nQ5puV2Sxf2sAFMSR78gZ8X_gif
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050049

Hi Suzuki,

I wanted to follow up and see if you might have some time to take a look 
at this patch.

We’d really appreciate any feedback you may have, as it would help us 
determine the next steps and move this work forward.
Thanks for your time.

Best regards,
Songwei

On 7/30/2026 4:06 PM, Songwei Chai wrote:
> From: Songwei Chai <songchai@qti.qualcomm.com>
>
> We propose creating a new qcom directory under drivers/hwtracing
> to host this TGU driver, as well as additional Qualcomm-specific
> hwtracing drivers that we plan to submit in the coming months.
> This structure will help organize vendor-specific implementations
> and facilitate future development and maintenance.
>
> Feedback from the community on this proposal is highly appreciated.
>
> - Why we are proposing this:
>
> TGU has the ability to monitor signal conditions and trigger debug-related
> actions, serving as a programmable hardware component that enhances system
> trace and debug capabilities. Placing it under drivers/hwtracing aligns
> with its function as a trace generation utility.
>
> We previously attempted to push this driver to drivers/hwtracing/coresight,
> but did not receive support from the maintainers of the CoreSight
> subsystem. The reason provided was: “This component is primarily a part
> of the Qualcomm proprietary QPMDA subsystem, and is capable of operating
> independently from the CoreSight hardware trace generation system.”
>
> Chat history : https://lore.kernel.org/all/CAJ9a7ViKxHThyZfFFDV_FkNRimk4uo1NrMtQ-kcaj1qO4ZcGnA@mail.gmail.com/
>
> Given this, we have been considering whether it would be appropriate
> to create a dedicated drivers/hwtracing/qcom directory for
> Qualcomm-related hwtracing drivers. This would follow the precedent set
> by Intel, which maintains its own directory at drivers/hwtracing/intel_th.
> We believe this structure would significantly facilitate
> future submissions of related Qualcomm drivers.
>
> - Maintenance of drivers/hwtracing/qcom:
>
> Bjorn, who maintains linux-arm-msm, will be the maintainer of this
> directory — we’ve discussed this with him and he’s aware that his task
> list may grow accordingly. Additionally, Qualcomm engineers familiar with
> the debug hardware — such as [Tingwei Zhang, Jinlong Mao, Songwei Chai],
> will be available to review incoming patches and support ongoing
> development.
>
> - Detail for TGU:
>
> This component can be utilized to sense a plurality of signals and
> create a trigger into the CTI or generate interrupts to processors
> once the input signal meets the conditions. We can treat the TGU’s
> workflow as a flowsheet, it has some “steps” regions for customization.
> In each step region, we can set the signals that we want with priority
> in priority_group, set the conditions in each step via condition_decode,
> and set the resultant action by condition_select. Meanwhile,
> some TGUs (not all) also provide timer/counter functionality.
> Based on the characteristics described above, we consider the TGU as a
> helper in the CoreSight subsystem. Its master device is the TPDM, which
> can transmit signals from other subsystems, and we reuse the existing
> ports mechanism to link the TPDM to the connected TGU.
>
> Here is a detailed example to explain how to use the TGU:
>
> In this example, the TGU is configured to use 2 conditions, 2 steps, and
> the timer. The goal is to look for one of two patterns which are generated
> from TPDM, giving priority to one, and then generate a trigger once the
> timer reaches a certain value. In other words, two conditions are used
> for the first step to look for the two patterns, where the one with the
> highest priority is used in the first condition. Then, in the second step,
> the timer is enabled and set to be compared to the given value at each
> clock cycle. These steps are better shown below.
>      
>                |-----------------|
>                |                 |
>                |       TPDM      |
>                |                 |
>                |-----------------|
>                         |
>                         |
>      --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ------
>      |                  |                                                 |
>      |                  |                          |--------------------| |
>      |    |---- --->    |                          |  Go to next steps  | |
>      |    |             |                |--- ---> |  Enable timer      | |
>      |    |             v                |         |                    | |
>      |    |    |-----------------|       |         |--------------------| |
>      |    |    |                 |  Yes  |                    |           |
>      |    |    |   inputs==0xB   | ----->|                    | <-------- |
>      |    |    |                 |       |                    |      No | |
>      | No |    |-----------------|       |                    v         | |
>      |    |             |                |          |-----------------| | |
>      |    |             |                |          |                 | | |
>      |    |             |                |          |      timer>=3   |-- |
>      |    |             v                |          |                 |   |
>      |    |    |-----------------|       |          |-----------------|   |
>      |    |    |                 |  Yes  |                    |           |
>      |    |--- |   inputs==0xA   | ----->|                    | Yes       |
>      |         |                 |                            |           |
>      |         |-----------------|                            v           |
>      |                                              |-----------------|   |
>      |                                              |                 |   |
>      |                                              |      Trigger    |   |
>      |                                              |                 |   |
>      |                                              |-----------------|   |
>      |  TGU                                                   |           |
>      |--- --- --- --- --- --- --- --- --- --- --- --- --- --- |--- --- -- |
>                                                               |
>                                                               v
>                                                      |-----------------|
>                                                      |The controllers  |
>                                                      |which will use   |
>                                                      |triggers further |
>                                                      |-----------------|
>
> steps:
>      1. Reset TGU /*it will disable tgu and reset dataset*/
>      - echo 1 > /sys/bus/amba/devices/<tgu-name>/reset_tgu
>
>      2. Set the pattern match for priority0 to 0xA = 0b1010 and for
>         priority 1 to 0xB = 0b1011.
>      - echo 0x11113232 > /sys/bus/amba/devices/<tgu-name>/step0_priority0/reg0
>      - echo 0x11113233 > /sys/bus/amba/devices/<tgu-name>/step0_priority1/reg0
>
>      Note:
>          Bit distribution diagram for each priority register
>      |-------------------------------------------------------------------|
>      |   Bits          |       Field Nam   |    Description              |
>      |-------------------------------------------------------------------|
>      |                 |                   | 00 = bypass for OR output   |
>      |     29:28       |   SEL_BIT7_TYPE2  | 01 = bypass for AND output  |
>      |                 |                   | 10 = sense input '0' is true|
>      |                 |                   | 11 = sense input '1' is true|
>      |-------------------------------------------------------------------|
>      |                 |                   | 00 = bypass for OR output   |
>      |     25:24       |   SEL_BIT6_TYPE2  | 01 = bypass for AND output  |
>      |                 |                   | 10 = sense input '0' is true|
>      |                 |                   | 11 = sense input '1' is true|
>      |-------------------------------------------------------------------|
>      |                 |                   | 00 = bypass for OR output   |
>      |     21:20       |   SEL_BIT5_TYPE2  | 01 = bypass for AND output  |
>      |                 |                   | 10 = sense input '0' is true|
>      |                 |                   | 11 = sense input '1' is true|
>      |-------------------------------------------------------------------|
>      |                 |                   | 00 = bypass for OR output   |
>      |     17:16       |   SEL_BIT4_TYPE2  | 01 = bypass for AND output  |
>      |                 |                   | 10 = sense input '0' is true|
>      |                 |                   | 11 = sense input '1' is true|
>      |-------------------------------------------------------------------|
>      |                 |                   | 00 = bypass for OR output   |
>      |     13:12       |   SEL_BIT3_TYPE2  | 01 = bypass for AND output  |
>      |                 |                   | 10 = sense input '0' is true|
>      |                 |                   | 11 = sense input '1' is true|
>      |-------------------------------------------------------------------|
>      |                 |                   | 00 = bypass for OR output   |
>      |      9:8        |   SEL_BIT2_TYPE2  | 01 = bypass for AND output  |
>      |                 |                   | 10 = sense input '0' is true|
>      |                 |                   | 11 = sense input '1' is true|
>      |-------------------------------------------------------------------|
>      |                 |                   | 00 = bypass for OR output   |
>      |      5:4        |  SEL_BIT1_TYPE2   | 01 = bypass for AND output  |
>      |                 |                   | 10 = sense input '0' is true|
>      |                 |                   | 11 = sense input '1' is true|
>      |-------------------------------------------------------------------|
>      |                 |                   | 00 = bypass for OR output   |
>      |      1:0        |  SEL_BIT0_TYPE2   | 01 = bypass for AND output  |
>      |                 |                   | 10 = sense input '0' is true|
>      |                 |                   | 11 = sense input '1' is true|
>      |-------------------------------------------------------------------|
>      These bits are used to identify the signals we want to sense, with
>      a maximum signal number of 140. For example, to sense the signal
>      0xA (binary 1010), we set the value of bits 0 to 13 to 3232, which
>      represents 1010. The remaining bits are set to 1, as we want to use
>      AND gate to summarize all the signals we want to sense here. For
>      rising or falling edge detection of any input to the priority, set
>      the remaining bits to 0 to use an OR gate.
>
>      3. look for the pattern for priority_i i=0,1.
>      - echo 0x3 > /sys/bus/amba/devices/<tgu-name>/step0_condition_decode/reg0
>      - echo 0x30 > /sys/bus/amba/devices/<tgu-name>/step0_condition_decode/reg1
>
>      |-------------------------------------------------------------------------------|
>      |   Bits          |    Field Nam        |            Description                |
>      |-------------------------------------------------------------------------------|
>      |                 |                     |For each decoded condition, this       |
>      |      24         |       NOT           |inverts the output. If the condition   |
>      |                 |                     |decodes to true, and the NOT field     |
>      |                 |                     |is '1', then the output is NOT true.   |
>      |-------------------------------------------------------------------------------|
>      |                 |                     |When '1' the output from the associated|
>      |      21         |  BC0_COMP_ACTIVE    |comparator will be actively included in|
>      |                 |                     |the decoding of this particular        |
>      |                 |                     |condition.                             |
>      |-------------------------------------------------------------------------------|
>      |                 |                     |When '1' the output from the associated|
>      |                 |                     |comparator will need to be 1 to affect |
>      |      20         |   BC0_COMP_HIGH     |the decoding of this condition.        |
>      |                 |                     |Conversely, a '0' here requires a '0'  |
>      |                 |                     |from the comparator                    |
>      |-------------------------------------------------------------------------------|
>      |                 |                     |When '1' the output from the associated|
>      |      17         |                     |comparator will be actively included in|
>      |                 |  TC0_COMP_ACTIVE    |the decoding of this particular        |
>      |                 |                     |condition.                             |
>      |-------------------------------------------------------------------------------|
>      |                 |                     |When '1' the output from the associated|
>      |                 |                     |comparator will need to be 1 to affect |
>      |      16         |  TC0_COMP_HIGH      |the decoding of this particular        |
>      |                 |                     |condition.Conversely, a 0 here         |
>      |                 |                     |requires a '0' from the comparator     |
>      |-------------------------------------------------------------------------------|
>      |                 |                     |When '1' the output from Priority_n    |
>      |                 |                     |OR logic will be actively              |
>      |     4n+3        | Priority_n_OR_ACTIVE|included in the decoding of            |
>      |                 |    (n=0,1,2,3)      |this particular condition.             |
>      |                 |                     |                                       |
>      |-------------------------------------------------------------------------------|
>      |                 |                     |When '1' the output from Priority_n    |
>      |                 |                     |will need to be '1' to affect the      |
>      |     4n+2        |  Priority_n_OR_HIGH |decoding of this particular            |
>      |                 |    (n=0,1,2,3)      |condition. Conversely, a '0' here      |
>      |                 |                     |requires a '0' from Priority_n OR logic|
>      |-------------------------------------------------------------------------------|
>      |                 |                     |When '1' the output from Priority_n    |
>      |                 |                     |AND logic will be actively             |
>      |     4n+1        |Priority_n_AND_ACTIVE|included in the decoding of this       |
>      |                 |  (n=0,1,2,3)        |particular condition.                  |
>      |                 |                     |                                       |
>      |-------------------------------------------------------------------------------|
>      |                 |                     |When '1' the output from Priority_n    |
>      |                 |                     |AND logic will need to be '1' to       |
>      |      4n         | Priority_n_AND_HIGH |affect the decoding of this            |
>      |                 |   (n=0,1,2,3)       |particular condition. Conversely,      |
>      |                 |                     |a '0' here requires a '0' from         |
>      |                 |                     |Priority_n AND logic.                  |
>      |-------------------------------------------------------------------------------|
>      Since we use `priority_0` and `priority_1` with an AND output in step 2, we set `0x3`
>      and `0x30` here to activate them.
>
>      4. Set NEXT_STEP = 1 and TC0_ENABLE = 1 so that when the conditions
>         are met then the next step will be step 1 and the timer will be enabled.
>      - echo 0x20008 > /sys/bus/amba/devices/<tgu-name>/step0_condition_select/reg0
>      - echo 0x20008 > /sys/bus/amba/devices/<tgu-name>/step0_condition_select/reg1
>
>      |-----------------------------------------------------------------------------|
>      |   Bits          |       Field Nam   |            Description                |
>      |-----------------------------------------------------------------------------|
>      |                 |                   |This field defines the next step the   |
>      |    18:17        |     NEXT_STEP     |TGU will 'goto' for the associated     |
>      |                 |                   |Condition and Step.                    |
>      |-----------------------------------------------------------------------------|
>      |                 |                   |For each possible output trigger       |
>      |    13           |     TRIGGER       |available, set a '1' if you want       |
>      |                 |                   |the trigger to go active for the       |
>      |                 |                   |associated condition and Step.         |
>      |-----------------------------------------------------------------------------|
>      |                 |                   |This will cause BC0 to increment if the|
>      |    9            |     BC0_INC       |associated Condition is decoded for    |
>      |                 |                   |this step.                             |
>      |-----------------------------------------------------------------------------|
>      |                 |                   |This will cause BC0 to decrement if the|
>      |    8            |     BC0_DEC       |associated Condition is decoded for    |
>      |                 |                   |this step.                             |
>      |-----------------------------------------------------------------------------|
>      |                 |                   |This will clear BC0 count value to 0 if|
>      |    7            |     BC0_CLEAR     |the associated Condition is decoded    |
>      |                 |                   |for this step.                         |
>      |-----------------------------------------------------------------------------|
>      |                 |                   |This will cause TC0 to increment until |
>      |    3            |     TC0_ENABLE    |paused or cleared if the associated    |
>      |                 |                   |Condition is decoded for this step.    |
>      |-----------------------------------------------------------------------------|
>      |                 |                   |This will cause TC0 to pause until     |
>      |    2            |     TC0_PAUSE     |enabled if the associated Condition    |
>      |                 |                   |is decoded for this step.              |
>      |-----------------------------------------------------------------------------|
>      |                 |                   |This will clear TC0 count value to 0   |
>      |    1            |     TC0_CLEAR     |if the associated Condition is         |
>      |                 |                   |decoded for this step.                 |
>      |-----------------------------------------------------------------------------|
>      |                 |                   |This will set the done signal to the   |
>      |    0            |     DONE          |TGU FSM if the associated Condition    |
>      |                 |                   |is decoded for this step.              |
>      |-----------------------------------------------------------------------------|
>      Based on the distribution diagram, we set `0x20008` for `priority0` and `priority1` to
>      achieve "jump to step 1 and enable TC0" once the signal is sensed.
>
>      5. activate the timer comparison for this step.
>      -  echo 0x30000  > /sys/bus/amba/devices/<tgu-name>/step1_condition_decode/reg0
>
>      |-------------------------------------------------------------------------------|
>      |                 |                     |When '1' the output from the associated|
>      |      17         |                     |comparator will be actively included in|
>      |                 |  TC0_COMP_ACTIVE    |the decoding of this particular        |
>      |                 |                     |condition.                             |
>      |-------------------------------------------------------------------------------|
>      |                 |                     |When '1' the output from the associated|
>      |                 |                     |comparator will need to be 1 to affect |
>      |      16         |  TC0_COMP_HIGH      |the decoding of this particular        |
>      |                 |                     |condition.Conversely, a 0 here         |
>      |                 |                     |requires a '0' from the comparator     |
>      |-------------------------------------------------------------------------------|
>      Accroding to the decode distribution diagram , we give 0x30000 here to set 16th&17th bit
>      to enable timer comparison.
>
>      6. Set the NEXT_STEP = 0 and TC0_PAUSE = 1 and TC0_CLEAR = 1 once the timer
>         has reached the given value.
>      - echo 0x6 > /sys/bus/amba/devices/<tgu-name>/step1_condition_select/reg0
>
>      7. Enable Trigger 0 for TGU when the condition 0 is met in step1,
>         i.e. when the timer reaches 3.
>      - echo 0x2000 > /sys/bus/amba/devices/<tgu-name>/step1_condition_select/default
>
>      Note:
>          1. 'default' register allows for establishing the resultant action for
>          the default condition
>
>          2. Trigger:For each possible output trigger available from
>          the Design document, there are three triggers: interrupts, CTI,
>          and Cross-TGU mapping.All three triggers can occur, but
>          the choice of which trigger to use depends on the user's
>          needs.
>
>      8. Compare the timer to 3 in step 1.
>      - echo 0x3 > /sys/bus/amba/devices/<tgu-name>/step1_timer/reg0
>
>      9. enale tgu
>      - echo 1 > /sys/bus/amba/devices/<tgu-name>/enable_tgu
> ---
> Link to V15: https://lore.kernel.org/all/20260701055529.445819-1-songwei.chai@oss.qualcomm.com/
>
> Changes in V16:
> - Fixed enable/disable race and PM refcount handling.
> - Fixed sysfs exposure before driver initialization.
> - Fixed priority allocation and access races.
> - Fixed uninitialized return value in condition decode.
> - Fixed sysfs attribute naming collision issues.
> - Added ABI documentation for the default node.
> ---
> Link to V14: https://lore.kernel.org/all/20260417073336.2712426-1-songwei.chai@oss.qualcomm.com/
>
> Changes in V15:
> - Add a maintainer for "drivers/hwtracing/qcom" in MAINTAINERS
> ---
> Link to V13: https://lore.kernel.org/all/20260402092838.341295-1-songwei.chai@oss.qualcomm.com/
>
> Changes in V14:
> - Fix some typos and formatting.
> ---
> Link to V12: https://lore.kernel.org/all/20260317032639.2393221-1-songwei.chai@oss.qualcomm.com/
>
> Changes in V13:
> - add ":" after "KernelVersion"
> - add an enablement check in the enable function to avoid increasing the counter each time
> ---
> Link to V11: https://lore.kernel.org/all/ee1ca8e6-8e5f-47d8-8a24-f904ee2fc6d0@oss.qualcomm.com/
>
> Changes in V12:
> - Remove the in-ports property from the bindings, as this device is decoupled from CoreSight.
> - Update kernel version and date.
> ---
> Link to V10: https://lore.kernel.org/all/20c5406d-3e9f-4fdb-84ba-4cbe629c79b5@oss.qualcomm.com/
>
> Changes in V11:
> - Change the names of members in drvdata: max_xxx -> num_xxx, enable -> enabled
> - Use "FIELD_GET" to replace "BMVAL"
> - Use devm_kcalloc to replace devm_kzalloc once create members of value_table
> - Keep a consistent \n above return
> - Keep reverse-Christmas-tree style
> - Add checks so that the enable and reset nodes only accept 0 or 1
> ---
> Link to V9: https://lore.kernel.org/all/20251219065902.2296896-1-songwei.chai@oss.qualcomm.com/
>
> Changes in V10:
> - Modified code formatting based on Jie's feedback to improve readability.
> - Applied inverse Christmas tree order to the variables.
> ---
> Link to V8: https://lore.kernel.org/all/20251203090055.2432719-1-songwei.chai@oss.qualcomm.com/
>
> Changes in V9:
> - Decoupled the tgu driver from coresight header file and registered it as an amba device.
> - Retained Rob's reviewed-by tag on patch1/7 since the file remains unchanged.
> - Updated the sysfs node path in the Documentation directory.
> ---
> Link to V7: https://lore.kernel.org/all/20251104064043.88972-1-songwei.chai@oss.qualcomm.com/
>
> Changes in V8:
> - Add "select" section in bindings.
> - Update publish date in "sysfs-bus-coresight-devices-tgu".
> ---
> Link to V6: https://lore.kernel.org/all/20250709104114.22240-1-songchai@qti.qualcomm.com/
>
> Changes in V7:
> - Move the TGU code location from 'drivers/hwtracing/coresight/' to 'drivers/hwtracing/qcom/'.
> - Rename the spinlock used in the code from 'spinlock' to 'lock'.
> - Perform the 'calculate_array_location' separately, instead of doing it within the function.
> - Update the sender email address.
> ---
> Link to V5: https://lore.kernel.org/all/20250529081949.26493-1-quic_songchai@quicinc.com/
>
> Changes in V6:
> - Replace spinlock with guard(spinlock) in tgu_enable.
> - Remove redundant blank line.
> - Update publish date and contact member's name in "sysfs-bus-coresight-devices-tgu".
> ---
> Link to V4: https://patchwork.kernel.org/project/linux-arm-msm/cover/20250423101054.954066-1-quic_songchai@quicinc.com/
>
> Changes in V5:
> - Update publish date and kernel_version in "sysfs-bus-coresight-devices-tgu"
> ---
> Link to V3: https://lore.kernel.org/all/20250227092640.2666894-1-quic_songchai@quicinc.com/
>
> Changes in V4:
> - Add changlog in coverletter.
> - Correct 'year' in Copyright in patch1.
> - Correct port mechansim description in patch1.
> - Remove 'tgu-steps','tgu-regs','tgu-conditions','tgu-timer-counters' from dt-binding
> and set them through reading DEVID register as per Mike's suggestion.
> - Modify tgu_disable func to make it have single return point in patch2 as per
> Mike's suggestion.
> - Use sysfs_emit in enable_tgu_show func in ptach2.
> - Remove redundant judgement in enable_tgu_store in patch2.
> - Correct typo in description in patch3.
> - Set default ret as SYSFS_GROUP_INVISIBLE, and returnret at end in pacth3 as
> per Mike's suggestion.
> - Remove tgu_dataset_ro definition in patch3
> - Use #define constants with explanations of what they are rather than
> arbitrary magic numbers in patch3 and patch4.
> - Check -EINVAL before using 'calculate_array_location()' in array in patch4.
> - Add 'default' in 'tgu_dataset_show''s switch part in patch4.
> - Document the value needed to initiate the reset in pacth7.
> - Check "value" in 'reset_tgu_store' and bail out with an error code if 0 in patch7.
> - Remove dev_dbg in 'reset_tgu_store' in patch7.
> ---
> Link to V2: https://lore.kernel.org/all/20241010073917.16023-1-quic_songchai@quicinc.com/
>
> Changes in V3:
> - Correct typo and format in dt-binding in patch1
> - Rebase to the latest kernel version
> ---
> Link to V1: https://lore.kernel.org/all/20240830092311.14400-1-quic_songchai@quicinc.com/
>
> Changes in V2:
>   - Use real name instead of login name,
>   - Correct typo and format in dt-binding and code.
>   - Bring order in tgu_prob(declarations with and without assignments) as per
> Krzysztof's suggestion.
>   - Add module device table in patch2.
>   - Set const for tgu_common_grp and tgu_ids in patch2.
>   - Initialize 'data' in tgu_ids to fix the warning in pacth2.
> ---
>
> Songwei Chai (7):
>    dt-bindings: arm: Add support for Qualcomm TGU trace
>    qcom-tgu: Add TGU driver
>    qcom-tgu: Add signal priority support
>    qcom-tgu: Add TGU decode support
>    qcom-tgu: Add support to configure next action
>    qcom-tgu: Add timer/counter functionality for TGU
>    qcom-tgu: Add reset node to initialize
>
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |  60 ++
>   .../devicetree/bindings/arm/qcom,tgu.yaml     |  71 ++
>   MAINTAINERS                                   |  11 +
>   drivers/Makefile                              |   1 +
>   drivers/hwtracing/Kconfig                     |   2 +
>   drivers/hwtracing/qcom/Kconfig                |  20 +
>   drivers/hwtracing/qcom/Makefile               |   3 +
>   drivers/hwtracing/qcom/tgu.c                  | 782 ++++++++++++++++++
>   drivers/hwtracing/qcom/tgu.h                  | 318 +++++++
>   9 files changed, 1268 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>   create mode 100644 Documentation/devicetree/bindings/arm/qcom,tgu.yaml
>   create mode 100644 drivers/hwtracing/qcom/Kconfig
>   create mode 100644 drivers/hwtracing/qcom/Makefile
>   create mode 100644 drivers/hwtracing/qcom/tgu.c
>   create mode 100644 drivers/hwtracing/qcom/tgu.h
>
