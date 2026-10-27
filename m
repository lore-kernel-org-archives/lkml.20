Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793080102;
	b=bHzhUh21pAfPzugF842G9d/XaJI31WHW9Yvf2z6DnIRi4uL18DLbCFSFM2unV5aVeoAT
	 MUOgjx4gxz+OqAqRkMbDyoCBuZqjpgL+XzXt5IgwFjtbbTrqPPwA4bh+ZKRLgdFUevok8
	 HpY5Pfs4m5jaXBCaPdt95LHzaEx5qvS9WRN8w6xdte+xgmLsjiX3sYGfzuz5tSI3cdPON
	 OrZ7MPqZ5DPLXAZVrPe+FrA3hz85bpvBc+oM4o7wwK74JVDBpEzCzH4dc4nB3zW131Wjp
	 TDgNaqa9Sxvf96x7pteY17BSwlX0JoAzuxYIdHsUSLHVZNZXxnlHkxZwmCNGld5do1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793080102;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ESb3SmQ8meudOtCfPOx8wemsamBBkJfF9HrJP+pAGkA=;
	b=Pv9DVCS78P9AxFCwzb4Hu5Fh7/VIeBp4I5PZB8w84JyYZKoyWqCTmwU0s/Ln9eKyFora
	 L+QaWJLNdqxzKKYYQ4fsMB1X8ddTlZvz/xV+gX3azdTfoXaWcr4qG7tJJ/xlurm06iorc
	 G2/6PDsjH03Ej7mcu7Zaa8UdUChZWQH9RDvkTBkTWi4OdAUCcnf54/sflENRud5rRSyRu
	 ThEKX82rNN3KsYzeHLX5zN9H0hOnMOFn4shP+kuRy4ynjtmB9LDyWpKf9YFRYfzTGyUDG
	 hNyDyBK6LpdC4BHeU4w/tLfqGwI7o8C8Oc/yIAtP8N1D6OH9Hvbivb9cBQrVWv5dJEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kw6X+lgn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jZRQwKt6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D75606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64D75606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kw6X+lgn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jZRQwKt6
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5YwBV2336795
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ESb3SmQ8meudOtCfPOx8wemsamBBkJfF9HrJP+pAGkA=; b=Kw6X+lgnXrRlD6sO
	n0LqdwhzK5HQiwnbjJVucUMo8QaixvlobbRKcKuB5pkg/xYhJBo+Zz3J1GPRaNRl
	LjsmBsg0vGlNlgM48M1V14ZVU+BQmSSSD4Hv6iuB/a8VvZq2ESN3eYRUhhNLj4bO
	Fu51VRgld6cYq2dsueb7rHbfvduZ3zetGi8ruxs4Waieyh79rovR8X3KbTA3Fq8+
	cTGnLCg+EXDT/Z4yHF9noV3xsn8d0pchmPpH1sTZ+QC/qeRdMweDMYDy5uOkS1Iy
	57JsmbSZChlZOV/UKfbiV9WtFMh9ywogZfkrHf4MJBKDTExx29+WCFWykGlqOoD5
	1tjAzA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3d9h6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:48:21 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso7922369eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793080101; x=1793684901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ESb3SmQ8meudOtCfPOx8wemsamBBkJfF9HrJP+pAGkA=;
        b=jZRQwKt6q5Hrv7PSbGi5kVnn6MtHnvjRSlI6vbnSiH3g0qY+Dc1LQftlTiuo/6UALP
         h9qD5dOaSeF2eoowZmFvl8cfuwGnwjwKJHV1VR/A05TuYv8ztsdhnJzPArPezSYaT6PM
         j6/24VwcnSIUsbSMxAj8WHjK4ss7vPr8pWtEROS17Y0vWUJenYHazwE5ZSr1du1m2Dlm
         KAmeCZlRAssGvrZzD2QYE3s2PNesbA+ouaWC5SwQjYoe8rXrR5zjnFXGpwv2VcztONq8
         zhytX4mE16slsDBIAz8euCY8giYFGRDk2O6SciUd9L9FnODUYxsT3yDaaunSHDvsmdqJ
         i9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793080101; x=1793684901;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ESb3SmQ8meudOtCfPOx8wemsamBBkJfF9HrJP+pAGkA=;
        b=Y9fE2ezThyY80riu1zXSf4q0Jq2LltISPi0vADaZCKoEQJN0KHJ6Rw6DAUG1HmpE13
         SKlQR6NjFACEv7kwni1fzqWJ8j+sUtAX5N8jKDsd/+wSEKOjjio3clwSIPEWpN7Eu+4q
         +HiQeHKkVIRN7rlQ+ojopsNxxS9i36BXilNE1w5L51uEhTyE8w7d6/NBCbVbIItrhOLk
         3/hNBs3gK64K2SS1JAsa2I1KskMiIgWRg4SRLAWrOZfNYm3jDIPlvGVYrea9F6QTdznQ
         iLKEnijRY6+hZgPIKwgavlIM5cZ9vMEM5yw+pqrJRotWV4XqDw9unBMkhAr/tweM0PEL
         kunA==
X-Forwarded-Encrypted: i=1; AKwUvBxg2KnAcFP46No/t57kQnrFg1rHEZEg9zScJAAk5hAqCShLFChrFwldlNzJbUm5WEgAnEb9f0RapO3AK+E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYoULwOOjqwtiRFWxKoVxBRP3MgexLkvRu4CTBlVVLWp8E+68X
	tzHjz1cvs6DBZs6enlKVZQ0p8htp/P0cPai8TBxOeTVA4RDu0I31VFWUFDcCRNSgRk3GUzCBkKg
	MMf95eQF/u7xY5zgaoneqU4tAso77mG4n+VVXNNw/Sf5CKRGXlEtJpQ/QFRhZFtTY6R0=
X-Gm-Gg: AYBFou0IWZ4fW0fWFv0WEwBMvRCtA2ImoQs7C1nw/Q0Lj5YqQ88gaQCisw3n4WaM4fM
	c39BaXfWELLzyBmYtmjJLXEMgFi5P8JSYlmnYYOBjoBW8hNU38SWz/ChutfUUoCq3qoBEc2YxZW
	dcdvjfdrYVZAwLs3aWhMXQ5EqS7FZf3OYNYTQFb7gJHznOW4wc371dWU9EKhFWjcvXKm4xmoLAK
	TNpWMqjPzXJWoCwB9eoVZWQrM4gBs5LrFjNlfLfj87NFs7/I7Iq63ieph4qsOhNVa8GT6tZ92uy
	E9YzvTxt/tBWOvLBOxp7AhP9aaygY291dUVP9R1j40rnUxgsHp9AJeFeY1t6E0TJmyf9oKabMOT
	pqCNLP5b41ftX5w1LYW14fNfgQw==
X-Received: by 2002:a05:693c:2807:b0:369:eec1:1d7e with SMTP id 5a478bee46e88-369eec12196mr11695150eec.11.1793080100881;
        Mon, 26 Oct 2026 22:48:20 -0700 (PDT)
X-Received: by 2002:a05:693c:2807:b0:369:eec1:1d7e with SMTP id 5a478bee46e88-369eec12196mr11694676eec.11.1793080091301;
        Mon, 26 Oct 2026 22:48:11 -0700 (PDT)
Received: from [10.218.2.197] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ee71f5sm39226087eec.28.2026.10.26.22.48.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 22:48:10 -0700 (PDT)
Message-ID: <9387d067-cc44-40e8-8d60-d547d222522c@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:18:02 +0530
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
Subject: Re: [PATCH v2 9/9] arm64: dts: qcom: shikra: Do not mark MPM as power
 domain provider
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-9-ac7f1a0d5638@oss.qualcomm.com>
 <883e7b91-d2a4-4c3e-b6e9-32d0a87361e4@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <883e7b91-d2a4-4c3e-b6e9-32d0a87361e4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyMiBTYWx0ZWRfXwAqh/CkWs12n
 748VLrXhKmHT/JLc8q5cq0DYIWB03S/CoydXpkL05uzxy0iq7Slh+kqrev0YBJboGdGgfZMMKH9
 37a0hDF4/mKqeFgRoRu4COiT+8AuJNo=
X-Proofpoint-GUID: IYpPFfEVpyRXsq4WIwH-GkKSGwsBAhB_
X-Proofpoint-ORIG-GUID: IYpPFfEVpyRXsq4WIwH-GkKSGwsBAhB_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyMiBTYWx0ZWRfXyIDgUaBMlr/u
 jfi+raYvyEy/em7m6XfIvn99I5GYHo6Av4zpxkd3Q5EZM6Kj7nwrIIVxkYaPh8WbMf+X8QaYrv0
 ONHoCIO2na5e2qQ8cOxH87YtXTdqVf0GuUC0SUnW03vLfbqRvz/imz0t5YVzjXgAeVj67/igtFY
 K5zhtdXDK2vSDlhYs+5UV4sXElseKwXF0vJCBF5wziRZCc1CwqRkru/Wszob0F/0t4GjC56w9KC
 YJM98JHDb7Et4VEqTOLwPLVKTOIVS52zVCX7SMwawf1YANsUAmzfpetIFSWEINuChBz6ai/tN58
 bvpU9WihrTnAzL18i7nkQPbS2qikIklg/oDRb5IZwwmbMqJbXTDgxrp8fYLOtZ5aSVvdcbmgYDE
 sFNtieiyZzQfz8lu6Q6MF4FwmYTTzzU8nR4LvKcG0aHCw29pfV15S6LXpXLQ09K6m3PBwfiRZlR
 jzwl1csABODV+U0kD0A==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae03b25 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=EBxl5K2b24NMC96zZi4A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270022

On 20-10-2026 19:29, Konrad Dybcio wrote:
> On 10/15/26 11:55 AM, Sneh Mankad wrote:
>> To make the MPM design more logical and avoid probe dependencies, the RPM
>> notification is managed by registering for CPU_PM notifications.
>>
>> Remove #power-domain-cells property from MPM device.
>>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> ---
> 
> Patch 1 introduced it!

It was done to enable LPMs in Shikra without depending upon MPM changes. However I get
the confusion, I will combine both into a single DT change and send revised series.

Thanks,
Sneh
