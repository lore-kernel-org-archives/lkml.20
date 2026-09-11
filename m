Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68AD46A61A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117295; cv=none; b=VaVV3qXRbgaR16PJbXWxSbpr0fNiDqQ/DGNIXMp9v5oABDv8TONG8CkrfQkyKUvHRYdkjZbMm/JQuNCEP2yJxZhSS1p3ewC2VryeP75I+Uiy/z+711Rvp7uO51ZkNwk+5+H3riTMtvrNrTG+R5rCfRGs5CjsxmwVTQtO+iD7Zs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117295; c=relaxed/simple;
	bh=WOULuRrXNU3vZP8q+kBbGKURV7ZcqLCFI5WsNJDmWMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fuj0wQFufc92wuJKheDhXHRcKGF2DDyyNJsXgUaGBrGLTn2J1aiEHPzhVCuOJrukwzsUq562EcKm8LXg1GS0CNKTrV1ahQKELf369HVPikag8rWfTW7xqQsDI/D8EkkQ4rN/dH0I6MN95PsaLr+R7ugQScNtmn72BOuNMy5JA3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UIj8rRs9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OBo8OEtg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UIj8rRs9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OBo8OEtg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kw913514011
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2k3ItUaVcXqldvvdP/S8//Dy6WIBqjQIGB/tc6VDfRc=; b=UIj8rRs9mOx/hNIG
	I9NFzg7htWvzpcFpzgPpHuddUcYgjzxMc8P2VX3Ve5TYOuUYiQKlMqRGJnsIcISc
	0tQxiyS2A48MeZoyUVnRPsfJQpQx05Qd0B9P1KTvNmHX9wSy+BZgclhj84O0HBkx
	1OrEW1TTPZvsGRoODzANq2e0EX6h/BcZ0G2nd40SVfCLmv5SzhcmVP/ahq00FLZU
	2lYS+S3ZnVXXHGAt6FazyPLFHh90e9PiMDaxWBxttiRFJSrsLLDn891urVPRGXQi
	1gHHayGxGesOAleesPOCFlRddSO9fuS/rRTSlI4m0CJ/2CwkdDE+YHhx7FZmer2u
	UxkEoQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd50tn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:01:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-385d2703b64so2116438a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789117292; x=1789722092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2k3ItUaVcXqldvvdP/S8//Dy6WIBqjQIGB/tc6VDfRc=;
        b=OBo8OEtgXbTluVqUSqWkgT+MhgKF76BJ04+j6mQgS20lSKQWHYHOFRhxmWEE/E73vT
         81p7W+9V4KsdudIbQC+CwlQy7hCNEYLiEcJ7/7XkLVR9XCklZ5oD6bRWhRVH4NBxztr9
         4snBBHjb9oA8Q5UM6NhnwZLDpweFXnoCla8DTiMXH/AtXdMssyl8z0q076riho5ydXur
         65xnUUsfNMvmlOw6ouMJUO+BYtz1AAsN/2uxVej6L5UuaA9MhvYwUXzCPhN57P+dl6Jy
         mTk6laCfpFwwGDUGJ7/P8xWwiHoo79f8JkL3E9uEpZA8uzGH6MbzIdd4BTm++mkvcjuX
         ydfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789117292; x=1789722092;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2k3ItUaVcXqldvvdP/S8//Dy6WIBqjQIGB/tc6VDfRc=;
        b=b+26qA+PiG6+G1dXSIXvxelRcG6GT3AXLUhW1rgHlylmdUbk3l/EY1I2OhFcjzkRJV
         Brl+7xK2wVafaSuQ5sVaClq0ZSs8fK/qvra5Yy/tHvMbNJQ1/T9LzkzZB+rfnrNtNlcE
         WrSjn9d3u0Srufx6DJl1nKgq5SFyDlb+Sbu2ToJqLcKoeVNa6k/O9cQaIiqpDpIxHaf2
         paUE3MNx8061XXvzspbJVK/ZPxt5HvgUQSx280sEwrvpgHgcbqNDm4yX58AHJDxywXvZ
         Vzre11yPFmDTm4sDgXfcCAFvBH4iTS5IjwZ+r7RpFzOsiQXxAFBn9wd1M1KJNu7hGqMU
         kGXQ==
X-Forwarded-Encrypted: i=1; AKwUvByUEyLRaW7OKdx+iG6iq7SYVQhjJR3cyO5wrDPH5fwA36J7FFwUDYMpz4w2NA5dttG8R1PUtPKwMI0F6J0=@vger.kernel.org
X-Gm-Message-State: AFuF++nMFAizKQDCfg77t7whxHfU5nrS32gFPbukAlHNy9gF47d1VJlc
	PSO4v38kJGCqflk+Q18AqYdmtM29T1XixTOFip9aezY/KIWgE8G2u3B5bRufeXdya4mrGS9ieVX
	ADLyyN6Ibi4ZVqXs/hDWYUr3t0q5QJDU/FjeYxw9TdhCPpR+ipbyCi9ZFf/OT9Tl0DJI=
X-Gm-Gg: AYBFou0wa3XUGFjgVrlY4OJF4HZrD9Q776YuYVlCIKOLfzcrcm3wGNYDs4QJrgk4QF3
	NLjHqyCQQRLtoIYZ9uw9FoGCVWsiOQBI9T+BOKprgMwwI7IYJiyO/5bcmNSczw299qNiXxUlDeH
	ZuN+aBqoeg8EYi2y8c4c1N1h031FQUZCalG/CyoOaT7ZhahcOB+SqHk18TKtBVsDoyrbD7jnOE4
	F3K3Ksoh8OOALPdaqW3Olkbpy1NavW/kSH8ZEkonCKJO7pkYvuZz2pYBtw66Pf9S21xAxG7a2Ug
	eib6FrsD0Hp1WEvkeH2H1vgVnFYjYld6MzyAhJDlabCTV3Tgz4Xii/Jw13gZWjSyi8UjNIj7UmI
	e4oaCFBqEBJs8qjCzrdlf14AfKA9Y
X-Received: by 2002:a17:90b:1ccc:b0:38f:a81:15b1 with SMTP id 98e67ed59e1d1-39d77b1d2afmr11533131a91.19.1789117292372;
        Fri, 11 Sep 2026 02:01:32 -0700 (PDT)
X-Received: by 2002:a17:90b:1ccc:b0:38f:a81:15b1 with SMTP id 98e67ed59e1d1-39d77b1d2afmr11533077a91.19.1789117291898;
        Fri, 11 Sep 2026 02:01:31 -0700 (PDT)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b97994sm8427739c88.12.2026.09.11.02.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 02:01:31 -0700 (PDT)
Message-ID: <c6687aae-1959-473e-999d-a86582d3a258@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 14:31:25 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] arm64: dts: qcom: shikra: Enable USB controllers
 and primary Type-C support
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
References: <20260911-usb-shikra-v7-v8-0-851ee4bc0eec@oss.qualcomm.com>
 <20260911-usb-shikra-v7-v8-3-851ee4bc0eec@oss.qualcomm.com>
 <x2kka6ouwalb54bv4hxszoq2qdbctp3gx7qholeerxvbicrxwb@ww5rf7tnjaog>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <x2kka6ouwalb54bv4hxszoq2qdbctp3gx7qholeerxvbicrxwb@ww5rf7tnjaog>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nYYUqg7H7ZQxwwQvO_S9eBz1mvV5M5um
X-Proofpoint-ORIG-GUID: nYYUqg7H7ZQxwwQvO_S9eBz1mvV5M5um
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEyNiBTYWx0ZWRfX2kbjpL1NbNCZ
 i1cXoFjf3fW1j43TVLE4cUln1VfX+KD+jBkdVCQRUtQDxLtEIvR/rooLOG98PA/tFE2cQDJc34q
 tBgijpm/Qo3spaukJgpVVohpjrgwWRk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEyNiBTYWx0ZWRfX8lFprJlEKsXO
 4X8BE9QJpwSkiQkZIguIqf+TRl813bGW0UImBLyrJbGxRsujICZj4cBwWpOlezu+9JqYwUQDWk4
 cnmzyoCJ9q1NGJUZsp9OJtmfhjGnU6lgEhw8WLtmLFhkO+WAtFd9BSXMq3xe4JTQkqfmKaXPM/V
 q/anhycw/LAvjMsdaQEAR4ADBv2ezjcPEMRvnhHBcf3TNADkezv935eAkfQeMgSzY5oD1QB5j2f
 XoZur+eeIH3wlupB1K/2aD3Uc+Mg1xJkxU1XadCzv2l6iSsIyk3Sclg7uSYWd1dQu3BPGQpDJMX
 ROzW9rCFbheJ2G/SjNFK7NBqPG6a2TmzGycZHVdS0LuB5uFZGPS02nBongs7JAe9ZOLqOpFIVC+
 82cKO53PraigiDbfOPaWV/VTE18A06nnXR7QCRUHod/QQeujC8jOmJuqrslkO7ClW62qu2vFeBr
 9Ke2IOGmhoeD6S5gMIw==
X-Authority-Analysis: v=2.4 cv=db0VTnXe c=1 sm=1 tr=0 ts=6aa3c36d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=BJegul65ukCT-9LGgkMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110126


On 9/11/2026 1:29 PM, Abel Vesa wrote:
> On 26-09-11 11:37:20, Komal Bajaj wrote:
>> From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>
>> Enable USB controller nodes across Shikra platform device trees and add
>> primary Type-C controller wiring for CQM/CQS variants.
>>
>> - Enable USB controller blocks for shikra-cqm-evk, shikra-cqs-evk
>>    and shikra-iqs-evk
>> - Add Type-C support on the primary controller for CQM/CQS boards,
>>    including role-switch and connector integration
>>
>> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
>> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts  | 43 ++++++++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 41 ++++++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts  | 43 ++++++++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-evk.dtsi     | 12 ++++++++
>>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts  | 23 +++++++++++++++
>>   5 files changed, 162 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> index b112b21b1d79..286ea46d0c36 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> @@ -23,6 +23,14 @@ chosen {
>>   	};
>>   };
>>   
>> +&pm4125_hs_in {
>> +	remote-endpoint = <&usb_1_dwc3_hs>;
>> +};
>> +
>> +&pm4125_ss_in {
>> +	remote-endpoint = <&usb_qmpphy_out>;
>> +};
>> +
>>   &remoteproc_cdsp {
>>   	firmware-name = "qcom/shikra/cdsp.mbn";
>>   
>> @@ -57,3 +65,38 @@ &sdhc_1 {
>>   
>>   	status = "okay";
>>   };
>> +
>> +&usb_1 {
>> +	dr_mode = "otg";
>> +};
>> +
>> +&usb_1_dwc3_hs {
>> +	remote-endpoint = <&pm4125_hs_in>;
>> +};
>> +
>> +&usb_1_hsphy {
>> +	vdd-supply = <&pm4125_l12>;
>> +	vdda-pll-supply = <&pm4125_l13>;
>> +	vdda-phy-dpdm-supply = <&pm4125_l21>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_qmpphy {
>> +	vdda-phy-supply = <&pm4125_l8>;
>> +	vdda-pll-supply = <&pm4125_l13>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_qmpphy_out {
>> +	remote-endpoint = <&pm4125_ss_in>;
>> +};
>> +
>> +&usb_2_hsphy {
>> +	vdd-supply = <&pm4125_l12>;
>> +	vdda-pll-supply = <&pm4125_l13>;
>> +	vdda-phy-dpdm-supply = <&pm4125_l21>;
>> +
>> +	status = "okay";
>> +};
> To keep alphabetical order, please move usb_2_hsphy above usb_qmpphy.
>
> Same comment applies to other files.

Thanks, will sort alphabetically.

- Komal


