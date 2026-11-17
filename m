Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794891902;
	b=lUVfn920ehi1Fc228gaMhbC4ofqhsv/d8LWsoqnZeN8BEodVGzwnLehC2VY3+VymfpEs
	 qdJ8/ujf78quZyCQU3ebCmxcAdrwMtbf7exsGzIY0rSxR+Q/1sWlaU/9Feb62fPSahcDk
	 dYPbShDq5unGnQDb7FfQnYN1uE0pnyjdwTxFRf7JnIQ1dcqS0ak/uvh0Pgw+/KPjx2VeN
	 jzI6hPBmXGfyqNk9C5mCgtfk2F6jsXy6cRfcZMIIiKB+Tylhm1R6/Jr+GXwVoARvQMPi1
	 EUDPPJ1YkUv1ZM73y4nPH8yYng6XMQA/Ft5HFph4uZuuCXAuto+Oam2LaBp7AWHP0ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794891902;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D3O8HSwk3gV+MgeK/2x8V/O+dnoKtfrQX17a7bHwQ8A=;
	b=irWKYOzMqn9UIJ6w7OV9UF6JdqPjQnEjnhGzkqlbTFdh+eeyLBR5VtLsHaKrhIeR+CMS
	 ZuMr/PkWZm3vrqfgKrzrzNUrwoKLF1moIEZxUukif1gBLfnnmRgYaTb3Bbwfexe4z62dT
	 h/kokSO3xyw/eY9QbUeNzOKadYgijSjLjgL6ODURaXjbLzA9dHhKFuC0FYZtD6k4mu/AV
	 UZZe+rXk7X5CPgA/mP/ChF+NDtM+lSBlpnbjctZIb2vZQXdWOqFJK5l/aNBXz5jG9kCV5
	 BHTIoyhaUlJayglIJyTsnrafRqUV8K5gld/6eXGBtUC4fV4RSACiPR6odAQyODw6xEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UyR2Xvr5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RHkZQaS2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9BB606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:05:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E9BB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UyR2Xvr5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RHkZQaS2
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aA1i3486577
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D3O8HSwk3gV+MgeK/2x8V/O+dnoKtfrQX17a7bHwQ8A=; b=UyR2Xvr5mgnBNFXX
	m5z2sk5nqcqjIuG2LbsieBw2xqL10aw688SmCyRstdkHPG1FJZOoKTLWGUZ8iYbV
	AadKpNBqRLG9aJxV715SCdaoPrnYPIm46bwK0akZUQzaycSCspUy5d74C46jmFfZ
	i1KKjkepaYeVferOskHGdIligD/U69dbi5WcQXtrMlMDVJKwwA2AdvDUF0Lr8sQ+
	qJjQR8FoUBZ+l4LG6Xp6lyQUtBn4UoRzU8uhkweKSUBUeQ16pFmNVfRDu/VHyGBf
	RMo43qg1oL8450LO5UkropBDG3sZoHLBrjjJgC5mPb1RjndC4BB4b4tM/BK+aH5q
	B62j3g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyxx2m8bn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:05:01 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so5423405eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794891900; x=1795496700; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D3O8HSwk3gV+MgeK/2x8V/O+dnoKtfrQX17a7bHwQ8A=;
        b=RHkZQaS2MZtvr9lY7Z8D8+OkVnghhoESST2B/YndphFb2ect3aUlXAa5fP33mU2q7u
         PE7TNn1kTsZghXhKHEhBL5nerfFkcEjIiOyYZY8ZuKL2j4GGoOFgnqB/rQ+TWe/q6Mxj
         q2JVcQ2YNM0bD7XkP+gfrNVmLUGB9C+prurACA59vOdP1dHRgq/yKVYCfcsoyOTgNQdT
         DxiGNN0RGFQowlqDA55JdwONfRXc6cZXYmnTJk/dohdTgEYmjFq+gJuA06M+ETNbb4es
         /Y0NnGm11O1EULBqhQzVl38t8ujxUXg9RDnoCT+0MUgYpuCR+/L0Bmy+ZSRGJ26Pz3ve
         F7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794891900; x=1795496700;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D3O8HSwk3gV+MgeK/2x8V/O+dnoKtfrQX17a7bHwQ8A=;
        b=UrMjDczd9j1SOyEZtXqooz8/kXJzmy0RLKvAZCFhTUCz7ij7jmmh+DFkuZCzvrT223
         0GlKMUX2cKmyheBqqtFcmZ4hlFcyNBNIWn15bD43gkjpCrE0S+Ru+VxPdZKzgoaauDHM
         q3C2SMZ2PJLtxhnDL+uk98U6w/4Wru6USXlqioyLxpPJ9EgEElg3nq4sY83vtosg8+3v
         1m2Ugjb9D8X4qcmFCWrdz7ptdH+lqjSFvhwzyJtCtjfnIV4fWxrA/GKdaM5opLMwojEK
         psJMP7OMr7XN792jgh1gKSgy6Rv8IXyRccgdhiu1n5Ygs35R65nQTcrA9xxd1jEUspw7
         cXAg==
X-Forwarded-Encrypted: i=1; AL+hErE8B6kRbWd7wVl2bawPM/NzMb9sPIrqzgfDqAIBGiIKPBCjHY2r+7ASAzfWKvi12z62X0b7yFfH1bGBp+g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+q8m8k4hSWFnAE5ltzHER6JsinnnyCBJsNfQKtapjBktVTcbMv
	QjSd6Rw/8Yfm3zoGdOZmGi11VR4uAFbzVKMg7pXpWqjd33vfiyPVWZFPPlM4Vl75zGQl7R5Orzl
	S69XeDvVojHo4sVvG7PRYtMFvdtGn0UuhFJlGii/5J7E4UaQB4sxyhQ+bkRq7uAWhH84=
X-Gm-Gg: AZFdTZcMzts7bR4glgrcIHcJPdx7+4dsxqIUr1zQ4hdmwKUKNWGrsi09yKuxaOq7k9G
	xWhViafl1d8T/uxgNpvSN5qK2d6A/RsdxyO6ocnnE5NP4ZuZACKng1A+bDii0jwlVv/53mDCQcM
	7NkGbmWHbwzigJLZT3ja1KEE0W5OqjaeZqGgfbM/05BEfHZhFLtSLI2497TBGMImzauWQs2gXBB
	5jp6y8iBnccCMh8I/AnecDdJqJBbRtnnqCj+l/T/Li2kHdvZSZjsvN5e4l5TbYBe2sVWlw1AvTV
	jK3W7f2rHqG+vQGM2oi5efjromnbmE7kda8f4KArzyd+FoNbwHibF8O1rVyB3oj2Z6bAwv8ra+A
	g7UvtVOR9IeOHxpZlJqWY+4YPV6ImSwmDa/vjNYxBIZemy7k3m1rcxchBchJq19rbv/EVdYbDPF
	yT4xE=
X-Received: by 2002:a05:7300:de01:b0:36c:a154:db1d with SMTP id 5a478bee46e88-37963373955mr11307806eec.4.1794891899980;
        Mon, 16 Nov 2026 21:04:59 -0800 (PST)
X-Received: by 2002:a05:7300:de01:b0:36c:a154:db1d with SMTP id 5a478bee46e88-37963373955mr11307779eec.4.1794891899424;
        Mon, 16 Nov 2026 21:04:59 -0800 (PST)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-381a55555dbsm1297729eec.10.2026.11.16.21.04.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 21:04:59 -0800 (PST)
Message-ID: <d3060950-04ea-4f9b-b160-0e068946e623@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 10:34:52 +0530
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
Subject: Re: [PATCH v2 1/3] dt-bindings: power: domain-idle-state: Add
 system-state
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Kevin Hilman <khilman@baylibre.com>
References: <20261113-s2idle_state-v2-0-ad604182e7e7@oss.qualcomm.com>
 <20261113-s2idle_state-v2-1-ad604182e7e7@oss.qualcomm.com>
 <20261116-icy-free-lionfish-c3eed8@quoll>
Content-Language: en-US
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
In-Reply-To: <20261116-icy-free-lionfish-c3eed8@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R7WWitRX c=1 sm=1 tr=0 ts=6afbe07d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=CCHPWfvzcojU1fbeCg8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAxOSBTYWx0ZWRfXzHxlQa3zQRg/
 +RG/o9ublKRwGjFUyN3a2bs5LSz8ZRh4thwO6KOVqaBmk9zbKUtSASbxX+g0KJAGq+Gs2cR79+e
 +kXacvgbf6yR/j13Rd/I45ZmGhnDWCE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAxOSBTYWx0ZWRfX81Hjm5tuJJAY
 gz6pxe3MvpFOmfPnEFMT8lvuQY2GY49ykHNNI3y/v3OnYs6isEAXbHdUd/cQjpBzxekiXEwEz5g
 foWngHAal4oLzUOtVfMxyHc3NzLct6qfJAaFx8PC11NsmkeYCYbHYgGPwMo/i6rvi0r1evqrbYk
 jQZMlZmYWR07YvlEnZ0IOvwscgqkpSLjPTCR4fWanuxlPn1us7R/+1Gnr4TxbwHMkXd7ySbzV7B
 jT6bb9HnsWJeub8lG9ean37KlvqBuL5ZEw1ux35Lc2bcLaXHWQG3AaPh0Nt/5GqDWo8+QHae6/Z
 aNgTxavjSajNxvvMpZkiwPJxRBR+WeEzfsf868Em3EF6BT/yhqfElR2CHjiQQjGHa2mF3mRz+8h
 qHP7Gai+DvTJ5jSDm6w3u8Ggp8BfoRJ1opkFPfrmIrMa3yNe8Z8bX8lJ5eOZTulQgt1o81D4tSh
 SFCgGKOc49hSd6l2KiQ==
X-Proofpoint-GUID: x_mMDZNq6_vuClkS5z5T9viyBaxtGSZy
X-Proofpoint-ORIG-GUID: x_mMDZNq6_vuClkS5z5T9viyBaxtGSZy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170019



On 16-11-2026 17:28, Krzysztof Kozlowski wrote:
> On Fri, Nov 13, 2026 at 10:25:25AM +0530, Maulik Shah wrote:
>> Some domain idle states require system-wide coordination and are not
>> applicable while the platform is up and running.
> You repeated the property description. Say something more. Why they are
> not applicable when platform is running? So if not running, when are
> they applicable? Why?

On certain platforms CPU subsystem deepest idle state requires co-ordination with SAIL subsystem
such that both must be powered down in coordinated sequence. During wakeup SAIL subsystem must
be powered up before CPU can resume. The wakeup can take a second or more.

Selecting this state during opportunistic CPU idle can therefore cause substantial wakeup delays and
repeatedly interrupt SAIL operation whenever the CPUs become idle.

Add system-state property to describe the state is reserved for system wide suspend.

I will update same in v3.

>
>> Add a boolean system-state property to describe these states.
>>
>> Acked-by: Kevin Hilman <khilman@baylibre.com>
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/power/domain-idle-state.yaml       | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/power/domain-idle-state.yaml b/Documentation/devicetree/bindings/power/domain-idle-state.yaml
>> index 4dd4f59bbbec..b19952f6225d 100644
>> --- a/Documentation/devicetree/bindings/power/domain-idle-state.yaml
>> +++ b/Documentation/devicetree/bindings/power/domain-idle-state.yaml
>> @@ -45,6 +45,12 @@ patternProperties:
>>            state will yield power benefits, after overcoming the overhead while
>>            entering the idle state.
>>  
>> +      system-state:
>> +        description:
>> +          When present, this state requires system-wide coordination and is
>> +          not applicable while the platform is up and running.
> So when is it applicable if not when up and running?

I will update in v3.

Thanks,
Maulik
