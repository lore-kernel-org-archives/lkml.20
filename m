Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EA0459AFC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790665162; cv=none; b=eCQRHKpGu+J+CrasVnJjM+/JIcTGzNVbuhUcattvXJHmykWHmzwEYQvcAHkVuju93YRsVo6bq7puBaGNEkifVF5XFsoV2WDH9E/M1PLYpkWoJc8USwcxrRFF8q20hErN2oOxUHKXB6lf9xwRK5vFtia92SOHhckilPgxtvPu+HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790665162; c=relaxed/simple;
	bh=ZklgOQcwPBgcF+FY6lQInVnvguQFWdms67o0H7e3hxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aTRkWkGL50osls3I9z19x5fKNcf4SxrE5b4ckWE+RkcDSgWd8iK7JYFHKhf0jsiDp9swNQ7u6/kq5Oyn+DNOJ6NXl8Ei9yhP92RhkmR/inmYZICkAvAc/XcoVD43nSDMCL7tjrK5+m0muQyB+edAewC7QqQxqn5J1hkKqqRSX6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DVZFtaqE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YYfnXYi5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DVZFtaqE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YYfnXYi5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T470jZ419566
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fW5DRUsCcbLeD3llus6C7UVKS1kxhpTnHFxnIYGddMQ=; b=DVZFtaqEENb2+2n0
	neuosQgeL9HZZU0T/SdS3wZm0ltmKPVUYONl5MfawuZoQ3yqIgGeBGgK+1kNR5zz
	dzBRb7a79eNLH15nFbaFONjWZXtxhXkVW+5ISpAW4V6PjjZHIvb5M55PKcZJlscr
	SfXk7vfdjB8aau4/qnNNggK+71UaU63DuiRpX8N7uOb+LBzOx8DuR08Tktl40s0X
	G1pK8Q08BhkEUWY/l2aBZVLKVTT2y2uyeMKkaNOjky99WPEkqabtc6E1NYxJ/UIg
	pSlzvSmApOCOAbGTZaPPGXGcqA+vF66PMW+NMcEADO1qweCrV4JysdP1C1v49spa
	q5lY4Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyxmua4cn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:59:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d55d8cd938so62149415ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790665159; x=1791269959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fW5DRUsCcbLeD3llus6C7UVKS1kxhpTnHFxnIYGddMQ=;
        b=YYfnXYi5QLv6t28f8950/1VrxfA1dMXGYbJDwyBYQfb/eRnXZnU3arPPkPeSCvDPwr
         DJH/RLNpW85jyj+QyuweyHGeN7OYvIf9uX41muli9MzQfK9xF54MBALuE+ypi/JhFyr6
         VFsUHOPx9y3Hwbibwx6AOU1akhzO9SS026xPXYn1dNbd4uuBxgGhc0eQSYgdmrL4LQWi
         +7wbjEJwgNSbCvMyWRwUziwFpaoQnD2w135hVswnQW8/G9AU47QSfyMdlwWeQky/o5/s
         affOwvfeik4gl7T1CRoWqZrbuJKsYwDBEm3NM6/fUo1kGL0Xwc8+cnD4fxJAjZpmBkoV
         cjcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790665159; x=1791269959;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fW5DRUsCcbLeD3llus6C7UVKS1kxhpTnHFxnIYGddMQ=;
        b=n+lEP3TTCZYc+Df5sOt83u8L+ZDqawfszCaHCPs3He8OJSq0SuLqIQoULHYFUnT5a2
         mntZ+YgwFoaDx5ZsU/vL/1d9ZgUdip8YmqYZMdeX1PfcXytrt05BR8rwBHAflb3uL/or
         Q67V9cki0z2OYZ1F0+lTEH8mVZqGgKI/mpuV9g2knB+LbHIq40yj7Zn0JGO82a0j2wEg
         pU+Krk24Kjc6/M152obo72AN+rXUvfGNy8fjH/ZOJginOTzqmx0B+GRN8NeZfhxQGbrI
         9Pdm0XvS3ULmMGy52IMjLRprFjd13W5a5T5VyFcXvZIBZvsOSnPZvYRBv5KI58kAE8zf
         08VQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7v+ZsgYrAOJG5WOguR5mDt1dcHKlCaMQF+nKjL+/hTwwgqmhKr2+21FpX56x3ScSOtSDDb20SWfvd1mM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFRiVkw4ETmoNyBDv+v7+KIwao3BMwYP+h1RSWmu72AuJtOpJ5
	mU5lCW5LNJs8XOMq2c7gt5RrMAKlrBZLTVGgtbScaZpkXAR806XBv/5o7iHveoPJNIkfKtZuxN8
	Xn4h6HzD6PFnLLhrm4WQMsoT22frBTs6TcjDza8UAACgdrkdvaq3C2HeH3DHhoGKBMOw=
X-Gm-Gg: AYBFou2QiouDLF6HRHO5J2RrMLeb8vD+d9q7li9ycZWsQwJH1fHScxCQQDhzr5Aq9IM
	Jwu0QdcLeZrTxPU6pUtXVob7NIBMHG+wcIsIjCmo3vo5aLaLSlsZrth9w466GE/mRfCygrqqQMp
	vwuk1ZI1ubPvHUomLDdW+MVF/mrJ80aI65XgBXXabc/BEPaII9HbfQmx/ZxCJOTGiP/qeHAyHPI
	9HEbpXOZtdp6OR8f/xNU/jku5xkY/GzarAtTSsv2oe0XJLQFTJhheGaQK4zTWuYJ8QcsdDmHrwt
	Y21o3KyK0Y+RTSDvkSC8wVgZMRpXOdvOEIfegAbnTVcdoR/Fb+6O4NL2NyOU+4w8xkh2cjttjMr
	B53UdxWtmTucnIsEy9Uf+vsUKtxizSfRbXhqCNHKlexFStM8H3O25yC+gX1k2SjpZfWYKZxbEe4
	ySNAXEANvyezniCAZ5vEOW
X-Received: by 2002:a17:903:1b70:b0:2df:4876:50d9 with SMTP id d9443c01a7336-2df9499777amr91491605ad.18.1790665158893;
        Mon, 28 Sep 2026 23:59:18 -0700 (PDT)
X-Received: by 2002:a17:903:1b70:b0:2df:4876:50d9 with SMTP id d9443c01a7336-2df9499777amr91491345ad.18.1790665158454;
        Mon, 28 Sep 2026 23:59:18 -0700 (PDT)
Received: from [10.79.116.189] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78791c680sm5559478a12.16.2026.09.28.23.59.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 23:59:18 -0700 (PDT)
Message-ID: <5a55edf8-bbcd-4e2e-aa08-c9b62e527a43@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:29:09 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/15] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
 <20260827-kuno-soc-support-v5-15-6d47636a8f09@oss.qualcomm.com>
 <97fd5a30-9469-482b-be0c-0ed6da6424e8@oss.qualcomm.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <97fd5a30-9469-482b-be0c-0ed6da6424e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfXzRVDU1aPOE9Z
 JNxNzpmBdOPxQ75uY5C90pxM/mFJvz1VSHd0cN8LKrmMzc+Cdt9Yoxjuw4IE3Ok6T3KrSusyvXs
 prKLwAcPfYF9qIhISCtq8T7cTci/hIz881U0iaDtn/xdug9WGNeAnZKvrzqZXE8uIVsXOr0QzI+
 KfD5mBahIllih+vyyrv8LmPNrUV8bEs1tolfiGOBT+KEQ9/uNtJutaaBrbKG53UB8ODU1b+EBcg
 0943o+uTmE6TRj1AmMBV4q+s1armeBXkevLj/tXiMT8mykTxfAblAKp0JwwgzhlhAiA99xPOaN8
 5NYqgMEYH2CFcNneln7BlM7ep3gQDauG7dMhjUvhW4CDOqNKsyt5Qjmrr4NA1vl3e2269SZuYcB
 LdnXkzyRj0nhdrSj9rZ7BR0rD4qkp5r/eyYRKi80j9p+0YpV77by5nNqfhLKvtd4KLuS8UNs7gR
 L1h5Laf7/bhB1LsfFOQ==
X-Proofpoint-GUID: xzu7faitAeax8w6Ma6qr4UI8Z0FbvZTo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfX7+Vnw1gop4ed
 DP+0SXv720NZh+XKzKowv4Zutf+naUpRZQT/SNqYrAyGJ2dOdUQIk0BdHHe8Kh7K8TeAPUzIEho
 uefpE8R4PgUCyUkiPg/ki9RSUZXFcsk=
X-Proofpoint-ORIG-GUID: xzu7faitAeax8w6Ma6qr4UI8Z0FbvZTo
X-Authority-Analysis: v=2.4 cv=c70+0h9l c=1 sm=1 tr=0 ts=6abb61c7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PaPtSKYIirbzHVDMbN0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290027


On 9/3/2026 4:27 PM, Konrad Dybcio wrote:
> On 8/27/26 7:51 PM, Hardeep Sharma wrote:
>> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
>> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
>>
>> Peripherals included in this initial set:
>>    - Single Cortex-A7 CPU with PSCI idle states
>>    - RPMh RSC with clock controller, power domains, and BCM voter
>>    - GCC (Global Clock Controller)
>>    - TLMM pin controller (110 GPIOs)
>>    - Interconnect (aggre-noc, cnoc-main)
>>    - GENI UART console (QUP SE3)
>>    - SMEM, hardware spinlocks (TCSR mutex)
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Reviewed-by: Linus Walleij <linusw@kernel.org>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> ---
> [...]
>
>> +	soc: soc@0 {
>> +		compatible = "simple-bus";
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		ranges = <0 0 0xffffffff>;
> that's just "ranges;"

Thanks For Review.

fixed in v6 : 
https://lore.kernel.org/all/20260929-kuno-soc-support-v6-1-a16afafbcbc7@oss.qualcomm.com/

Best wishes

Hardeep Sharma

>
> [...]
>
>> +		qup0: geniqup@9c0000 {
>> +			compatible = "qcom,geni-se-qup";
>> +			reg = <0x009c0000 0x2000>;
>> +			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
>> +				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
>> +			clock-names = "m-ahb", "s-ahb";
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +			ranges = <0x0 0x0 0x0 0x0 0x1000000>;
> likewise here, you don't need to precisely limit this.
>
> Konrad

Hi Konrad

Here I cannot use ranges;

An empty ranges; only works when the child node uses the same number of 
address and size cells as its parent. That can't happen here:
   - The binding fixes qup0 at 2/2. qcom,geni-se.yaml requires 
#address-cells and #size-cells to be 2.
   - soc is 1/1. It uses 1 cell for addresses and sizes, like the other 
32-bit Qualcomm SoCs.

Best Wishes

Hardeep Sharma

