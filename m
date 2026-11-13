Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794571840;
	b=zEOQ5MjGI5OBRI9ITqCTdjp38kVi6WbdcdBhTkROJly8vGSqtOb1OSj0Ean2vB4tfFtq
	 8/z6Owb51eioYP37BDDiF6EQhJB5cxCSJBv38lFXv1UdP1fwaQrqBlqqy3dmQkmTCwcf4
	 rIinWwBA0Qn/hiqmZXutZtdQ/NG/ixEwEV7Hk0kbNJ4/9m0CVkZe3IL3oOvDkOg4+42Iq
	 j+GzkX58d5PXRRFk+IapltJJE7/38eQ7FZrx3kc0LVAY30SU1Ek8FT2saYtCcSxLRXovk
	 UA/8X7o2V4wtw4Yk/4cpy2Uz0Lusl5dUXjHXGJGOj1844dt6QB3+mZHIoAmP4WGcVUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794571840;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4hEbvuDKTvq5Xc54WAfLx4GkA5m8TdMCxYJefmo5WTU=;
	b=vbkXy/f5pj2mvSAosYSUvMA49IMQFJ7q0uWEjR19RfVvQUoU1XFT/stv+69++sYGKJJ2
	 MHZ1fn22v4zYE1ca9L+i8MhxJ25yVwv8Ft1pyZbHMZx9jgJk1iRmYkXxTNFtj7nxFUwSf
	 6kMocXQMv56+uV+2rrtoiNmIuMOQ3qwD6R15MFc8x4e6shnq4LK3fj49vxGtRW0G4y181
	 9UXPiaEJcsQGTRYXIYaGP1X4Til6NOTe9+8ZBooLriPS/94HfCxwKrbV9f+uvrWo/mJxE
	 POqD6T2y+1ZUpdH/TZGfplvsHUTypvw0UXb2CUqlKDr5L9SU7xkag8rx/Hlp2oxWZ7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ObBtv92B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f6pDA0Mv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E003606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E003606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ObBtv92B;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f6pDA0Mv
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADC0hqF186693
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4hEbvuDKTvq5Xc54WAfLx4GkA5m8TdMCxYJefmo5WTU=; b=ObBtv92BXUpOERJ+
	2WgyEdl4lbkD7pOLZH5GrGlE+98lvcAtyZbrkhFvxZIDGjJzZVfGGQmQjOzKKPqb
	9K3j6lvWgfinVvqZG47jlC4w4AXyt/jPlZVU3WapMHA5Sy+vPNw8jOIillPbbq6L
	wKuOh5azgiMcnunj/Z40CesmKcHwMvZhU5R0KC1cbbj3u36fdS1l5b/z7PXJ2iY+
	zLZIH7q5h76zuRurP7DnTiUTYFek03tFCNYM1cnBI3UTlIm+56yJ1kG7RpaJMMys
	1+TvvsDds1L1WqJ+1M8yRZjaLK3jgQVzjL33ANFBF7C2BLbiqj6+tEyCd7ssXpN/
	08SwdA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37hde2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:10:37 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99c3ff9015aso9215241.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794571837; x=1795176637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4hEbvuDKTvq5Xc54WAfLx4GkA5m8TdMCxYJefmo5WTU=;
        b=f6pDA0Mv7h+NLAPznkf87t003GPnTWnW5SUmYSmwtxWRlRRfczwL8c/e8IbzG1YI7f
         SqZZA8wNyCF2PfC2s8jL7HpezttHGn5ybk4tX9d5MCaZ0H7TmKCHlN0YxITUsWER4QcG
         vjRSh/bTrCFKG3WnTZqMs0pJGF/AImMEePS2244H9pXkCeVyjPrhZ9xPHtb7fsphDQws
         S3WCvIaoL46kCLUkD7v/Lf2hvkWPwYFqiFIaspgc2cfiyYHIJZadQ6nQoFaWiaSdekCL
         4SSzKQCJsH7q8PqndvB0oP+5344iJJYuNtJUEtvOhVyZBX5+iXNrpJUXGZweBD6JvOEJ
         V0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794571837; x=1795176637;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4hEbvuDKTvq5Xc54WAfLx4GkA5m8TdMCxYJefmo5WTU=;
        b=lOcFsDRgtExIml83hwypab0IHYroU6guIu5wcGuMo4PXd6/4Ns3zQ7n8MpppzIJuL7
         zm/Vhi4S7FBci3N80QSmB0YYV+2U0/STrCUW359CtT5mmAlvUhOSeOwCORgUZYF85i1n
         BHoyL/hATOFE7Nw3E2yF42T0dmNoPnAlFbhfGzm1jQqtal7rQRGm9TGjawANZYCR8lYa
         3AhNxD1/zcTnuOQF5PDB84OiCVObLRT+XhWwZtJNIj1saEf3lmgHUuoGI5ZskbxugvkC
         03f9zHeebmpu1J6CBqlYY6/RWuwtR1FUAj+7rc1EOZZ/QMwdkLIWvee5LvGu7N4WaVni
         iRyQ==
X-Forwarded-Encrypted: i=1; AL+hErGuAVsUvY2TednAfya5omA3pVaUmPHBqdNP3/rKHzHZ7lBG/clNY+JnVM8AxWJmXPXq0h74VoIga0+KH8c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TT/rQ5jgfA8wzf/UQI8MLQ7MzF++yKX2lOfk4n6dWOGXLAT7M
	mj9MQ55XyITb5nGkSm9+2W8qIs7C4zY2JhX/Ic/e4Kmw/7Q9rtLMuNZlcEuX21VTI7u+aI+LpFq
	+vT3PKsRjpU+Lz/XAAoa9uaNtpqf7ZAFzwZVNNWdP4q7NmmOYN4MzuA8NLSUYJ2NvFKM=
X-Gm-Gg: AYBFou1wyy3YR5NeRSXktW8jHJvLINeEwO04OzS+NQ3++QLr6bP36z+5jSsZ4yCqY7Y
	cB3hUE7Pij7XrlHhPJzcBXQI5nxjwzb/3z7TA7iK1QTSPRHsIOq5n0ajVHCAQrCsPSc1L5pf29W
	NQKSfwuiRKUJsphIO7Or21f4gPWUrmMEDH45FuhO2OZqg+VMlVJ5gluKRW6z33hG9TWhxA6QpTU
	vFyU+U/x8Y8SJb0n7PV/GkH9+CIWR5vVMGvlvIi2QyHxhGtqJOsN1Y3SS+BXaEKpzXFCjHKFRmq
	JH/3pucKD6fII3bjrWciShYhd7xeM14fboHuNljJlZUwxkP9skAicCtT1Y740MhdNIntDN/QLw/
	tl/qaIqvFBO4DjR9JH7VaqMyXQjelR6EKYxSvVffVwHR+0jmWWuc+Vkx5HpYZaha5+w0DkdE=
X-Received: by 2002:a05:6102:61d6:20b0:7cc:32ce:4c41 with SMTP id ada2fe7eead31-7d64d6c510emr550105137.2.1794571836907;
        Fri, 13 Nov 2026 04:10:36 -0800 (PST)
X-Received: by 2002:a05:6102:61d6:20b0:7cc:32ce:4c41 with SMTP id ada2fe7eead31-7d64d6c510emr550065137.2.1794571836420;
        Fri, 13 Nov 2026 04:10:36 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23ddf82sm870968a12.26.2026.11.13.04.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 04:10:34 -0800 (PST)
Message-ID: <0cac5090-a135-4a6c-8221-846b34ed5513@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 13:10:29 +0100
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
Subject: Re: [PATCH 16/17] arm64: dts: qcom: Add initial Halliday dtsi
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Lee Jones <lee@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
        Stanley Jhu <stanleyjhu@google.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
 <20261109-halliday-dts-v1-16-289114ab8197@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109-halliday-dts-v1-16-289114ab8197@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfX/yP1HY1JXwCU
 bZKRv+TAdVINIzvnmSn67/NXrdnxhEjdnRAyeuNR9s5DgMb5Fu5VsLyRn3/pLC9Ragz+K9lehuR
 17NOXxrTPN/2EniCpinwXto3ox7Jf0s=
X-Proofpoint-ORIG-GUID: YQHh7XEemIUHEVKnvsWpU6SFA17dD-mw
X-Proofpoint-GUID: YQHh7XEemIUHEVKnvsWpU6SFA17dD-mw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfX8+9Q0PghmbKf
 08+EEe+hDDbFxy8VSHTG+HElcy0hMxEsW8HRuVfHCOTfbNkEwJAtp1D4bRMGjLRVqiaNfTlzNM8
 IOp/m8hP3RIT7sCV9E9FaSRElytNA22TdGCXGEntSicPlcPWChgXmYS8oxiMVVjEaIv722REmRZ
 bkT8Q8GMmZevX7AhukYZMWpmM4TOtKuMAbhJG3R2Sw+yUgKuqI5ulZiwVtI3m9vL8Fx+D4bRUPA
 RfgIbKoN/plJkJxHY7tUgObpzTjX1dStUHlrNyFsLIjBnbFMKH3KXAgKPgsMs81ZIpTWaNbN/0H
 me40YiF7sU74LMcY2ix7mSAt6EblSrdxsV9HamhxxbRiOMbHk/+6gp9ITLMIRKmI/BJhhdgYEUp
 S5baDwZ9RhcaJAAE8cbd6hd7momOrkp4q9x+bbqqGfVdhiEjT9Z3tOTDYz0b9gKyOyviCt2FWHI
 c6Sa+Y94Vk6ltX5YRNg==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af6fe3d cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=U5E2jiqv92kUeAjINO8A:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130048

On 11/9/26 1:33 AM, Stanislav Aleksandrov wrote:
> Add the device tree for the Qualcomm Halliday SoC
> (SXR2250P / Snapdragon XR2+ Gen 2).
> 
> It describes the CPUs with their idle states, cpufreq and OPP tables,
> the GIC and the PDC, the timers, SCM, SMEM, RPMh with its clocks, power
> domains and interconnects, TLMM, GCC, SPMI, the apps SMMU, USB, UFS
> with ICE, TSENS with the thermal zones and the PMU.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

[...]

> +		idle-states {
> +			entry-method = "psci";
> +
> +			gold_cpu_sleep_0: cpu-sleep-0-0 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "gold-power-collapse";
> +				entry-latency-us = <400>;
> +				exit-latency-us = <1400>;
> +				min-residency-us = <2207>;
> +				local-timer-stop;
> +				arm,psci-suspend-param = <0x40000003>;

Please add the other idle states (D4 and E3) from the downstream
devicetree and match the order of properties (psci-suspend param)
to glymur.dtsi

[...]


> +		usb_1: usb@a600000 {
> +			compatible = "qcom,halliday-dwc3", "qcom,snps-dwc3";
> +			reg = <0 0x0a600000 0 0xfc100>;

Please use '0x0' for zeroes in reg values

[...]


> +		spmi_bus: spmi@c400000 {
> +			compatible = "qcom,spmi-pmic-arb";
> +			reg = <0 0x0c400000 0 0x3000>,
> +			      <0 0x0c500000 0 0x400000>,
> +			      <0 0x0c440000 0 0x80000>,
> +			      <0 0x0c4c0000 0 0x20000>,
> +			      <0 0x0c42d000 0 0x4000>;
> +			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";

Let's break up such long lists into one-a-line

Otherwise lgtm, very nice!

Konrad
