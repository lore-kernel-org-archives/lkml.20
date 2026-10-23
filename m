Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792752453;
	b=PKQd7MrICDNTa86/3thYLVmBhXy3BMyra4/fMQeoF6GMpbxonL8WH09vuAQMsC9mZw8s
	 +LaCNuC3rJx90LS/KUYpQIsMfW+e+5Ybe9lJ9D/cUqg7gyQqj2g/sFyRUh+IfHLRYRyRM
	 4d6COPwWv5zl/msngrGanfQqmpo/9A5SMXjuY1XePr4GuLmtE37+p1Bz8whkdkHcKJ1Ly
	 3WP8jIIHsl65BCb0bdXcY6IEeM6zaLEd3Pjb5BGLDFZBpzAUcaIn7DkR7xIyhyi41U2vY
	 JbUN/yLccSA4tKnlSP4sFLgIgwlXhMYqo4cp87tPIY0IyK5AdSPApQmg7uSHG2f2MrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792752453;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VwgGM5/F73Jt9T9hXLJk5Fbp36axcuLPsz019Bv+rQE=;
	b=NX4b8EuCn+ejGQ73WFpSb2GBNXY8FH4A3MiinPyUzB7rLYwiJuubXeUEGa7ip9no1oeu
	 TAxqXXYBiVcXfi+xcOxw/l+KB0N+yA6X6u1Y42jpTfPSfiw2iTrmDnfQMhWc5oFAjHRj4
	 ZDdDzCWRuZTp0KZB1wGv+q54FdIDGpCbAGly8z8vkK2NDpcwdLPRzNs+t65Lkgl/TB61L
	 WlmDTu/H83jObLW+E+FcsDLU79CpVhAutCx3G0P0HYPvG96DXq/fSCZqzXfmI9PTtelqo
	 xLUgdEicXIRIEZ1hIh6sOyrsn4/agGuJ3lv4RiKZjBDBiZ4+qoyu48LWHFxIYyLhXOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L9ucrPfx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EEavBmXT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6F8606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF6F8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L9ucrPfx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EEavBmXT
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAATpU3560822
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VwgGM5/F73Jt9T9hXLJk5Fbp36axcuLPsz019Bv+rQE=; b=L9ucrPfxb+ZmgyDX
	JnKX8tcV1GHhhYAKhc3WdADnxaKaZLrXCfDfjuay70SEQyeaJ6tghMMoDV2jrkjs
	4aT+esgc+dDbOVGlNcddFWxMitVgeB4XAvc96bAwxTu/hD6w3oFqde/5g9CDcZCz
	/wkQlp+q5LxTo8fcBfFLFA6HDLmGdgErhPm9Icjvz83GvJuDSdc+yfH4saui8fZx
	FfQXXjGTKybISchmo3BAcU3JQ8qEVVRGs3w2WakqZKPrxR/9+vxKfR9vKPfMJ+6B
	iECMvH8QmCl+A950phbB5vw++e4DXf/WhAoz4chRh4CGC+ZqfcCKD02PQQWOGT0K
	bGU9aA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmpb97p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:47:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-536540909e5so2216361cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792752451; x=1793357251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VwgGM5/F73Jt9T9hXLJk5Fbp36axcuLPsz019Bv+rQE=;
        b=EEavBmXThk8aPanid1uL9e/glsYLVCcWokQHSVeoQEQyKOTShC1IUzBEnjdVd4UR7d
         fO3PwEGjTDXGdO5LfGpxnLteVHbtXz8CFZSufMQw9Uev8f7jp63WAI8j7QWXmcFhDx6T
         zSkfoeYFIQk/8H9H6kPXWSrKvU9h0JtLQtY9nQFDZ/eHzFbkADnlbj+xrJmboTzFF+um
         1Hhy5+31z/Ro26qAJW6cBvdDW9570A+48l27wrxMIhHz5mEXxEwgs09b051lsIvTzWjK
         R+bRKukrco/y5pNje7E1mIldsbPYwo4mNW59JmGIXwGQ7jzqf6YvSD2Aao2NwWYtmhNb
         vR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792752451; x=1793357251;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VwgGM5/F73Jt9T9hXLJk5Fbp36axcuLPsz019Bv+rQE=;
        b=wJ6BylvFwkRnTkHL7RQ0Kmm8JkwqhhTCLOJ7fHbg/rosUsOXTnhNm20op0EpHfNKxZ
         huDgZ7EpXmVlMEaTt9TQC3mOj5v9Pi5sKDF3IUKfuW0kpBYXcs/DC8n4EwvSIYOHYAuX
         eu+tCrTF3SBQzRZI17/bKJlcNyQyRAHuLHew5KrA2Qnzl9M33h+p1Zjw+6oyeD8CAN12
         QEFRZVJLEvtyjgO2koOLTyuDHHoBB1xMEQLXaPZDHce//C2KHhvPlA4ANoTYvjg/VE2M
         wCyecWHwhMz8EPqxsuG6FObyaPV1DORYTJlP881PSWjcgOqO4E001qyDvKDk7QH/6z5E
         28MQ==
X-Forwarded-Encrypted: i=1; AKwUvBykOVcFkGZsJbkA9pPydJKf9nDRBAiODE9/gbOJX8wE7GFm4nk5mKwhHFBrI8rujOdDfV4Zn2+hn70SLAA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3535POB8CabEMo5E8O7ILwJvePEKM2QJb8eQnLz4lIpxSifdW
	mWuZuZNwpowV23BY/MvtCa3H52iZ/byOLLJ/D3AvaRs8bj1oAHz4NHV2qkFXsgIgDthP3U4JZi/
	nCP+66aakI4VRubE3sZZYuuhK2HNItzI8rC+etWE9navLNpZLIFjtMIo7sz0muRJAb/Y=
X-Gm-Gg: AYBFou1bdZ5RzHSFFdhH7YiY7sKbUXdZD1wdJOe3GW1ecfxO4Urs/s5vMeSwj/9i1ra
	/esPTiq4aOopWYNL0kl+b3S8V6WVTgoUbbhNRM7odw8ZIT82PjZcOK69SGlMmbK9/btHbULooZk
	q9pUbNTnw3pvzANdJXVXuXTGrH4tMJr4snQGMhFXsctg+svLKgGQbw46YXrLuVSJzu3ZouKDl01
	/QBC7sQWrl0w8XuOVl1Xn+lw3l90+1AEIM+gcnVV1BteAKdWaSzRJaZaUwNiSQGAljHPUSV/gIW
	2cRxVLziFo86gkWG6QVPlik9KCnoVIvy8Wd45mNMYQ0JCFIiknTNQvdReAQ3aDfHClYW+/rLxiw
	qo8s/NYlvUsjRjexWGU0Dxw==
X-Received: by 2002:a05:620a:564a:b0:93f:43a4:a48f with SMTP id af79cd13be357-93f6f96d3a2mr366200285a.5.1792752450710;
        Fri, 23 Oct 2026 03:47:30 -0700 (PDT)
X-Received: by 2002:a05:620a:564a:b0:93f:43a4:a48f with SMTP id af79cd13be357-93f6f96d3a2mr366197885a.5.1792752450313;
        Fri, 23 Oct 2026 03:47:30 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5c84370sm88657166b.42.2026.10.23.03.47.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 03:47:28 -0700 (PDT)
Message-ID: <6ebd380c-1f32-4ec6-86be-99631db4958b@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:47:26 +0200
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
Subject: Re: [PATCH v4] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, johannes.goede@oss.qualcomm.com,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20261023083827.7648-1-daniel.lezcano@oss.qualcomm.com>
 <atsmQqSOuqp1LKw8@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <atsmQqSOuqp1LKw8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0MSBTYWx0ZWRfX8+agSKZRHT/c
 X8Sr9gHI+AK4r8yWHdw0Dr4Opg1hv9rJU1lbcuO5lQviiqB66lKLFydhFj6Eeasc3zyAUYqoJQS
 6Ng9ar37L77I2L/HFiqsrmW7NIpFM10=
X-Proofpoint-GUID: l26UKfGzOig60opjfBjAiKoHY5tf1V3m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0MSBTYWx0ZWRfX7+MRTl+/nBYO
 hEEYIuKtTLYMMziL6SKctE+h65rNpleC6n+7ltDb10Cvv6pSjgBTMXt5gWIT5RKXS0xZG0gQG6J
 p8wD9/LkEv14X1G+Q1yHwCjfjmC1qt6DMFEJP88BamgoGKsW+HyIQVOQnv+o5FQu6BM5H2XwMAj
 +O1RPuvOYIG4nJFAHFxQ+LaSdPKs5a5M7UVnfTNsMGTho4GQQejuCt2M/ElWAmcO8vswgLhredU
 05F/2UCnnZQ1PvYrJYfCmP8y4kS8YVIXWSUDT6GC2T64+GhIh6AUlPmCwECVyl7AmT0uPBukNvP
 oyrhOFgvTIRRn8CFOErLWQhe+ZVu+kbLjwk0FFUHldzd2OaUW0LFMEnwkPQUov26uSq1PVPQYAN
 lhv5WbToc+uwu7M3SpJnTniP63nU1meHx6Qh/eNPapW22ZtWJiVyKkAJ+zRr+kFp9FeKwo2IXpN
 Dt3d+6zjp8v4/tNIH/A==
X-Proofpoint-ORIG-GUID: l26UKfGzOig60opjfBjAiKoHY5tf1V3m
X-Authority-Analysis: v=2.4 cv=BdBNQbt2 c=1 sm=1 tr=0 ts=6adb3b43 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=rrZNFMavuSw8objGGgIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230041

On 10/23/26 11:17 AM, Stephan Gerhold wrote:
> On Fri, Oct 23, 2026 at 10:38:27AM +0200, Daniel Lezcano wrote:
>> The ThinkPad T14s needs thermal mitigation under sustained workloads to
>> limit temperature rise before thermal shutdown. EC interrupt-driven thermal
>> monitoring is not yet supported, so use the board temperature sensors
>> exposed through the PMK8550 VADC to provide mitigation now.

[...]

>> +		/* Sensor near the CPU PMICs. */
>> +		cpu-pmic-thermal {
> 
> I'm a bit confused by the node order here. It's not ordered by the
> thermal sensor (SYS_THERMx) like in x1e80100-crd.dts, but it's not
> ordered alphabetically either. Or is it still the old order from the
> previous revision?
> 
> I think I'd personally prefer ordering by SYS_THERMx, but alphabetical
> order would be our typical rule.

Thermistor index is what I'd prefer to go by, I think it makes the
mostsense 

in any case

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

thanks!

Konrad
