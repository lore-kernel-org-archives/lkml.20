Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793770594;
	b=CdSjjqyfLkNP9pZy+TckT8DjRyaV3EJZdMY+9OamOmBt/3G+AXX26NOjlrNI/FNnmvVY
	 5oOyspAv3V4DqY9BcgHVRdXeZ9OMrNd89zu/xjOJmKtJKfDsmeLy5NCJOJEftAMAMgtSA
	 lpEm5OGvv1QjaTfEF7n+YqudBvFojqwN8uih07QYMbvmYKTJS5mDhL3GzOfzIChtTp97f
	 gRCJplgqGfLnmMF2f/F/qIvaSGV2O3nTeA6rNqRttjzvDE2FSCyA0H5Rop+dXRJG1Cxcb
	 v3CtVrH8hUXxxK1KMQY9IIH9BW8B8ae5+6cuOiW0gFDflHU56sdDFYLcvl8ydcKgsDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793770594;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IYtH/SnSy9AjEKHDiN2nuLd+EI4m1HjRC8v3W6Xw+00=;
	b=NcGbPP7y7zwzAGhluYQQ+8H25wwiaAXQS+E+PNLA3p8LVdAGc/L6ohAW34z2OjzlCVx9
	 oCPaTGFkRwyVOV1UuRYinKtTkPfGmp0KBxv7WArw3FSDtUAH/igRYWe/pOnHSO9RsV4bf
	 fKtjQDNo74rGszhTNTtL/tEH07w89bW23RG/iESFGYyBbJ7teCxL+9b4vXNegz+uY4oJA
	 OR8bRW9+Vqwbzc4ZpZdMUQiHVb/BDJUCCkfVcDOnJgsuePm7tAGK8E+N6d3smDbhVKXtL
	 WJRjEaEg0KUftuka7gUQ9aJGQlRfrjGXp4S622YEQDs0/E9StsNeklfVszi78ppgSFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UvGAnR2y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MkZs77EH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209D6606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 05:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 209D6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UvGAnR2y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MkZs77EH
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40R7tV193436
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 05:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IYtH/SnSy9AjEKHDiN2nuLd+EI4m1HjRC8v3W6Xw+00=; b=UvGAnR2yTFvuEiSw
	VK2U+znlfnOxWXNA/sPLMZ1NvNeoEYyZfLohFWf6402MrKOxpirR5l6qz+HQjSW6
	9Ir8+EbrRj/PPAoTK5sSP/4KZ83OTyt33oFzaAU7xvyFfcLG/AVmaIo7/vZgsKfp
	GzmYawkDAPPojLLGcmddmpG+YwbKCPMRUY0ghh99m5QJIthd+opu84sC675D1au7
	fbuFQlu5kF3NydIa7L7khV3B+J87nkBlcmEmRUvGLlUITodRGlXC4/bKqpP90bYX
	hmhhRJC/KUl/Y2+SZwplJsbbmw14xFaGdc6Eu9iy+fbmKqdiq6DOgEVPJ9JKY7Bl
	IUhj4Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8nj4rm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:36:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35cbea41088so456106eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 21:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793770587; x=1794375387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IYtH/SnSy9AjEKHDiN2nuLd+EI4m1HjRC8v3W6Xw+00=;
        b=MkZs77EHJP9hOg7R/kyrEOWa3SYMKLPGYpf5SPwH8i6G2OT462WG0xssw2CJi1AbtT
         vjU6wFJAu1415Amyx85p8lHmr9R9DqRkbQmwPxP51lz4Pq7NpNtvfnkKFq+YaUyUk5vY
         4mfHdHHdGUyUp2gccw869msOKLpACP+f4QAFeY1il8MPSHqeQGMFQF3puft7FIqXhPb2
         x6+oojj7z+7Ds2qpupa8hKU788YhV/Q09vYLVQmDlCCmlfgOWlof0q8mVQ57wxTCtRdm
         rtMw032Ww6ArH+al3zUlPhsprxS1eUcS2jY4wrkvJyiKS2ulCk4Z1wxULHy8546WMYAK
         ckEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793770587; x=1794375387;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IYtH/SnSy9AjEKHDiN2nuLd+EI4m1HjRC8v3W6Xw+00=;
        b=citXmnyrWBKzUoD/JZb5rx0Gc+HMEJjVCRGp/BZnSkViYDc354txiVDjXZCVDcCqKr
         8hbiIfvOFEQCE1VsvLZNDSR4GKo2U/A8SfKY1cRJVL8Z6Wljs/To5j0n9a9mChM20AWc
         wRufNivlXxe5nGl0d3vt+eR5gL2+k/AjxNyzSOLo8SVzqwLFZO06O/3aoOADYJziX1ZZ
         k6RLojo++wFkENlgH9l4PZufuNdV8wPmwd1GxG0d60TB5kswY3XDyDH2m1sf7v04ABit
         Z8aCnN57XYtkHJTgnVp2V7ZnonvwB3VP+leLeTk+YCfYPo2JmES/7vCAHfRd9CYSGgXF
         EM0g==
X-Forwarded-Encrypted: i=1; AKwUvBztOyALvQML+6/Dr4S4ZWCirwW8nbTXjYtT4c0XBO3ZPii7qeYTkQTPzoQAxX6UmaXKvJY2X6NfhEMjfrM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Jc94JhA1yZ7Gd2Zib5LnGHcAi4tuxF0JSoFEGBYb1d9P36+t0
	z0tr1zweTfUrcyaisfyjFO1TNsHIHKT9loO3i7r+iR4Z8G8ISpuoiHJoCAteL++X5FmZSukTrHX
	BotDp0eN1qVFY27uA+teCH19PWqJijk5OdC/J7uwLCjLiPILLg+R7YU2fMqNBfkuTjcc=
X-Gm-Gg: AYBFou29EHTNRQd1UNU8ZritGmFIa3OnXnd58cPOFzGdOSjWlW90tevxJH84tEMatkG
	vMAbs385/2xd5ErP3WqfkR770TYggUgSb2fSGwNVF4uKvJnKK0pRc+19JpcPt5hcc8Ix0OgFly0
	pReX85pRGj6uLktAWiwamcdmmDP+HTFbOuE3GrovmgKXfr3TLdCjVGGIf8dwoUJ8l3Z6r69J8ii
	1/VEEGmoMtBSPUSb+fLfYVg4GyM80Y1LfDLGjBSWlvFfRBbg1DP1eON2xtDFBWweYdxIKf7xPpT
	mJdULKcdCPtWs8nLWVCEgizPe1fTZ9OJrkOss1y18FPRrjASxY3h5egaZzWbcRg+msI1uYYl5fB
	NPPD8Z1a4mH6A+vJzdIOVEyC+kpqd7Nb9qRkpmiEaVkpR/SSWBUfiJmJP4p7LGYNc4ipxqnmh5R
	5zflOgDrjCPlC8kMxa5S3E0YQLlIopYQsY5Q6vRQwiAFQRrdpP2Rq+IxWTSYnzZBpbT0l+NqVr8
	YA=
X-Received: by 2002:a05:693c:6407:b0:36a:7b3c:4e0a with SMTP id 5a478bee46e88-36a7b3c4f8dmr6743601eec.24.1793770587332;
        Tue, 03 Nov 2026 21:36:27 -0800 (PST)
X-Received: by 2002:a05:693c:6407:b0:36a:7b3c:4e0a with SMTP id 5a478bee46e88-36a7b3c4f8dmr6743551eec.24.1793770586560;
        Tue, 03 Nov 2026 21:36:26 -0800 (PST)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3966daasm4765452eec.23.2026.11.03.21.36.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 21:36:26 -0800 (PST)
Message-ID: <8bed7caf-2b15-4b8a-ae9e-78f34ed780cf@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 11:06:19 +0530
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
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <e27e0fd4-c072-4d88-8e3d-107fa7a97923@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <e27e0fd4-c072-4d88-8e3d-107fa7a97923@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyMiBTYWx0ZWRfX2cCNWHRgCZYD
 J/gLe6JLPP/oTlZ/789UHvBm71qLKWP5bGlyiv6sGydvaJoVrVhIOzxuksc3bEipXbyt6EKsAq1
 UQQyeTVLvNkWK2xRzMtSOgtX3pevh4s7Qo7etVSZ7gGUuhAO+AcIEdfXWR92O4P8FLA/a4sgGKN
 2yra7V6yNbwJb8kQawI98cBXrIWV7+NydPURk4JAFgPl++Yf2VtAhWF+ItsnHMZdXRW4cc5QqIl
 tXpSdpUa10hK5OXTqAAH14PC2DwaMkL+bbPDETQdX+TADQt1u0gUDaLowugmlAICuDI0kcCNx9s
 FQTPoep3TqB0up9RqkZguxU7LTmVccOX8qkFN7gdgB7MGQWb0krg48+V3n8Zw6P1+Sti8z6CPJT
 xFjkVSXGfRy+ZCiyNBDqziqXDpFPSeQOm52IsFnZ0HeVJ0ytihIKl53mFFp7PapcfHzcasXdzyY
 en5pWLl825x5gm+IkSg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyMiBTYWx0ZWRfX0G1SV5rr7vo8
 55qZar3YgGA6MpKJcuvANnQ0JGwuKWMET0JFFFmn33yVbFIdMwrQruNhxkWBxKH6Ja2D7Wmwb6Y
 SVSxqZs0u0tVy9ZbaLucBZAtjuKuuhM=
X-Proofpoint-GUID: rgB1-8qyi6fvT4PE4yEsE1BCGn4XTD9_
X-Proofpoint-ORIG-GUID: rgB1-8qyi6fvT4PE4yEsE1BCGn4XTD9_
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aeac45c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=YwhHPVNpwWi31JhFHYMA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040022



On 11/2/2026 7:17 PM, Konrad Dybcio wrote:
> On 10/27/26 8:33 AM, Gopikrishna Garmidi wrote:
>> Add support for the Microsoft Surface Laptop 13.8" 8th Edition, which is
>> built on the Mahua SoC. Most of the board follows the Qualcomm reference
>> design. The keyboard, fan and platform profile sit behind the Surface
>> Aggregator Module on uart22, same as on the Surface Laptop 7.
> 
> [...]
> 
> 
>> +		serial0 = &uart22;
>> +		serial1 = &uart14;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0:115200n8";
>> +	};
> 
> This sends console output straight into your EC, either enable the
> debug UART and point it there or remove this hunk
> 

Right, thanks. There is no accessible debug UART on this machine
(uart21 is not routed out), so I'll drop the chosen node in v3.

> [...]
> 
>> +	reserved-memory {
>> +		linux,cma {
>> +			compatible = "shared-dma-pool";
>> +			size = <0x0 0x8000000>;
>> +			reusable;
>> +			linux,cma-default;
>> +		};
>> +	};
> 
> This hunk should not be necessary, it was on Hamoa laptops because we
> didn't have control over the PCIe SMMU and needed a CMA space
> 

Ack, will drop it in v3.

Thanks,
Gopikrishna

