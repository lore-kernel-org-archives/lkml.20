Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627283;
	b=xdsOYi6R9kCqB6Q//gW6zaHOUNIHUQthMtwIhAZDrWBlaqpTkUy+K7QXtQlug3GgRMeZ
	 wnptiKTTBxysfEcec7CWJk/A+fYiNc9BFwI9SdZwOwPmPMDfDqF+cVDzBykj79gMox1Kf
	 F2ZGPWjWk2lVIAMu366lfVI+/z//t4lLq30nduq4NAnSHZLW0kSJ0cWuXk7ppbxAHHPjY
	 EGhXTXxy7Ql0ccOrlS1FoymfoIfVEr8Mvl7lZDdU3wvWYvrghutKWVSksfXZjPWBAyXvi
	 Z/GXYka8gj0qLBE5Jh1DYSBnHI7S2HeIfS+Sg9yAND2zEPzJoXDfg6AU/iz1DL2cxfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627283;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MkXiy7zJNKorCt+VPjjrN/hR8YEy6PfDMROpIRVksVM=;
	b=Nv4vFrHgfZe/pAJSvW3nmYYMIO3gtCXRsAF07wKCFMykG7Kd5AxZfM/4k0n/2aZCMv1n
	 nVmZKvEufdMOz7fUfR9YDpUrlK8p/Ja6rYmXqYR2HyrCIJCx/Bm2nMZo9oGsaoV+0w4MZ
	 t4ELPS185MMdGY96Qx2cSGg1DyTXOjy2riejD5iBy/GiBW4C591ygbRGabde0VCckXQCu
	 578UJNyVvH9o5u5gM1nHA2YQHwaf2TYbXo53fRhRXcGGBnAnwA//poyAvsm9LprfiAqDN
	 7vIUexIjc2wav+kH1imvHFf9wAKUMtTyB6LNMheYUQfp2TGArW9cUJdvTdieNwqs8vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fgg5wZjM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FyCFmQmY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8C5606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE8C5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fgg5wZjM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FyCFmQmY
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DApiU3627865
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 13:48:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MkXiy7zJNKorCt+VPjjrN/hR8YEy6PfDMROpIRVksVM=; b=fgg5wZjM2tsbZBkn
	gv4uDezjS1ARS8eHK17bP4DAvYmtsQuIvfAr2tx04FElPw8Stx4FFQW5AoH4UgKl
	dwwEgGU8l7n5dk5f1T2bZc6zkMJJHx/rqGudeOq9FjFTVIDPUgItrJUBADr8IWV5
	MjAouwmiQ4Su7nt2UV9xABytogc8WyqYXMcD8lzpsFPmR55d3lQDOkmwiKVChmpi
	x70nvnjr+NKdzgGmsm1bhw38QubFbm05e+/ccyDZJhkQ5pNBUBDrJ0TNUdGi0D38
	IPuWElnFZAhsKitXnt7C7P17WYyTggfBEd2Bmv1DPlIAUnRdBKx8SQOTu1OSaFEm
	2/6Jsw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka622df-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:48:01 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9906ce36960so102702241.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793627281; x=1794232081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MkXiy7zJNKorCt+VPjjrN/hR8YEy6PfDMROpIRVksVM=;
        b=FyCFmQmYsmD5begNM397YRuKQB/afafmCgzlQfyAlYThflD95PTYc/C2PbKfMcB2R7
         MSqNS82JS+zboxyQnAFmX/6aJYpSjZha1KRCKJF3hqv3LA753vlnLgHZRb8BtF5l7+cO
         1myLYDhjm28x+7Q4Tnv+1QkJDnRM6Bc1ymowtBQGYbl9y7zxyh8qwDAqeOuCvKKt34r8
         Q4CFtBKhpa0d1e6zMJU6wQFFWFInmptYmYYZCGfEwkpet9tZeiPk4usFdrato981QSa1
         OJ0MJ/4eAFv4upP959xp6rI1OdDDbTju+D16TI5wbkAi38RNVJI51qiHxv9EoRd8bXNp
         sivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627281; x=1794232081;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MkXiy7zJNKorCt+VPjjrN/hR8YEy6PfDMROpIRVksVM=;
        b=zGmqqdQUCJVa9Z89PFlJ9uwpzcxYFbuzgKf0/Mz6y4xE4i7PLCl6hdtc7sAbz98v6R
         XbrSHBjzzBl3/zYxEOrFzIkKL+kDAAoq26ON0S/fi23CV3s2oGjxLlpT5SRUxkdBlY0+
         4C61BsWl40eJ5WHoaIMrJq2meJtD7fmYfVThUtSYbqcKebJCFTLN1HagoGjr285ajV+g
         Qs9sE/NKCmkwkk5duwYehKNJKdvx0V27rIoAZiG0fC5kmhMRkkWaQky/KpOOvXMWJiSd
         oDzzk8JQmxtDhfCYMnKvEkrjG5H5NRgw8VLWD+k4bQXY4oG+drdCVpIM/UBuy/G7CeGA
         YmnA==
X-Forwarded-Encrypted: i=1; AKwUvBzJDUQuYuTn/n54zNb5tVn8D6M9iUXfG/8O4EGXMGa6Lzb8GWI0VkYXqcXFehVjxl1b3gSejILPJY9K7qY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MzCTusG3bV47wWK0xaTItW8nHSMx/c0GgyupdjurbnaKZAvuO
	kVJX7M2pC4sgBay4lK38X2NYa9VpOZCUV9LFf/DTsaewXTUqgz1YGxmN5g/OBmzOTZJ8WaUbCTm
	WFxa8sSwQol3/21bfAnAWzKiu2RQu7xasplAW/hgOF0bPjz1uW156krSEzlPjL3VRLJQ=
X-Gm-Gg: AYBFou2gMZ8wR5npDkg7Y2GjxCri6ojNXH0etgwk192pPKJmyd7I+bZY4doWqWEwZ6Y
	KIpDZmQDrT8D7No99S9FP2J5jG2EsBq4VdsV7sXOjNHWY3LZqJpCNhnJsiKTkorA+EkxeyGarLw
	9p2vWxfiytEH/P1dVOkXZFCFuXRzshoVAkZWDx1NYBFt4lZpKTl48ZW/Sgq+yls6AvdYlzDmDLx
	NSNd8mSANtvaAk2wj0Z0w1FxFobnDAA8GBcTP88HgF+bSZVcj+gDtCvGie6TA+sm6CjqyYKOMM2
	+KobzKTiyxwH5DA3EGbEqrEFQBaG8CzAb1KhWzI/howJDoB2Bz5CDcaaQmSgTgn7ZYpZ0V22Dpa
	CcITzOVDppHDA2TiWpjvKBFvLbPt+RiEUXUisG7ccdZjNSPf8F16K1/dA/pNG5uHB2M5xyVw=
X-Received: by 2002:a05:6102:a21c:10b0:7c3:99a3:314e with SMTP id ada2fe7eead31-7d071f390d7mr3263381137.0.1793627277434;
        Mon, 02 Nov 2026 05:47:57 -0800 (PST)
X-Received: by 2002:a05:6102:a21c:10b0:7c3:99a3:314e with SMTP id ada2fe7eead31-7d071f390d7mr3263376137.0.1793627277041;
        Mon, 02 Nov 2026 05:47:57 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca29382sm3342417a12.37.2026.11.02.05.47.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:47:56 -0800 (PST)
Message-ID: <e27e0fd4-c072-4d88-8e3d-107fa7a97923@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 14:47:53 +0100
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
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add Microsoft Surface Laptop 8th
 Edition
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261027-mahua-surface-laptop-v2-0-7dd903a12d22@oss.qualcomm.com>
 <20261027-mahua-surface-laptop-v2-3-7dd903a12d22@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-mahua-surface-laptop-v2-3-7dd903a12d22@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: c_7F5Q_l3HOGccc0V_NQcQm--V9STYGw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfX4IN4v1frQS4W
 avFGmIBBMGyrX+5JFHpTy/yuhn9NiYfe9R6e0RDSvrs0BsOTFHJYQxwrDNHBXtS+p/k40MUmzRi
 Y7FpjsxvWTpgwbLx18LQbO3DYyI2210=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae89491 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=b-6vMC33NXqCuZ8Zj8gA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfX/Onqs4rt1lhX
 TPjU/K1YcjBKeG+0QGqSwhdakZWeR1Zoo1csdMT52WOSl4FvM8hvYFH8VBuVD1Eh3GRJr1//lNc
 klP5z54Veu3ekhrZlIXtNOGqhlq7CVPqeqcNEmqzE+pA/sL1buYhjB/Ly0QahZateTSO3EE8J1d
 4kTKnK9RK7MJdzSGMlUuHozihJhuwVRw0BFuRWpwEBQ9fnRvkKWNAJOfITFut4v4wBdOKzuIm9z
 +armoHvenU+VR/9dIOgcXr3UPqLnOEFgNlxEYK797Q1lf+k/WPUoANxZL7i5AZF5GSlYtSEFAON
 zlfe9llrW2r2M/hjRq6xcsHxYYiDSPHWU+53iIdamliw/gJb2qcw6UoUwx5LYwvWAWaRzeotqIM
 XiJ9WvQhTqpi3ODmmSszHhoJVy/IEkzyLyQl0fHv7i/UgdAQ4TajrYjjXLvi1VrB7+46tj2eSTD
 dTKYHeFxf/TGUwYo20g==
X-Proofpoint-GUID: c_7F5Q_l3HOGccc0V_NQcQm--V9STYGw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020054

On 10/27/26 8:33 AM, Gopikrishna Garmidi wrote:
> Add support for the Microsoft Surface Laptop 13.8" 8th Edition, which is
> built on the Mahua SoC. Most of the board follows the Qualcomm reference
> design. The keyboard, fan and platform profile sit behind the Surface
> Aggregator Module on uart22, same as on the Surface Laptop 7.

[...]


> +		serial0 = &uart22;
> +		serial1 = &uart14;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};

This sends console output straight into your EC, either enable the
debug UART and point it there or remove this hunk

[...]

> +	reserved-memory {
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			size = <0x0 0x8000000>;
> +			reusable;
> +			linux,cma-default;
> +		};
> +	};

This hunk should not be necessary, it was on Hamoa laptops because we
didn't have control over the PCIe SMMU and needed a CMA space

Konrad
