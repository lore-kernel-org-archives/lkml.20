Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792991972;
	b=MB6k/OMl0jC1tkZRzuGObJmJfg3pngxy4NshvMikkt8Riy/3K4f6vZj2ow/GX/3CUcHo
	 gFUKTXwCnGRd1u8z5jwUyNHGGmUesE+Jp4W6RVAVohhIZJCDRGMCguiyArqvtd6j94Wi+
	 xr9LEQm1DisB+GC9L2netVMoX/db5UaL6U3OrlW+g6algDeD+MdOkdyoh83TVZwfTttL+
	 ZfbvNe6h+i4u9plnG0zoABcF0GoC404XNCvjT+swf//jhsPLHP4K0/LDa524/jJosMGWt
	 qAJ83SOW0oZ7QUc96Iq7Aa/URcXHM/0LzsrBdPzfOFRRyrfsREPH1GLiTTD5i9hT6Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792991972;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OHOM8Cu7CdWrDvbIao5t5J+yLFREYpGZJ+T5gds31o0=;
	b=G2YR9COoE/uSdsSdtBRQnGMSLswADtdUVdXXYLVtaMDb8wg8HqPZemkoFfMn0tONw9dl
	 Rhobzp8+h5RpDv40D5u/zFu9GZmrhVr8zGFAU5SDEV5wIbga46qcZCGlnRQ+45kXgkXpE
	 jJM8wpVfscoMDPXI30SUujP1HLQHXDuMDkAvcoJI3NlWjRrh/IU1/p4B8kHgHFeSbU5OF
	 h3ZlI9WeehxNTIBOXgFQcW3xD4ZBrMNdda28b0GBTWC7VnWoKjIzH4XBvUzg6s6QhWUWl
	 CDUCfsJYiwopz/cxZBItWWIBBWdn3ThCm9+xtLBD/SxjC7LELCjQD2qoKCSV9Z+5LBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FAvxXeJT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TpzJx7Fn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF68606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CF68606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FAvxXeJT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TpzJx7Fn
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4avCD2727085
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OHOM8Cu7CdWrDvbIao5t5J+yLFREYpGZJ+T5gds31o0=; b=FAvxXeJTkmgLobHK
	V4DG018BE55SPh9JT+LXRr7nDfgVUxBpmnWfGGp4aHj6y+aYGPsi2X6stGLf0yTn
	J0ifJiZ+MuQxO+nlb88zJgKtjp8UvS+NeGZwn2Yxtwjj9RPuC2SlbYKzV/sfZzNz
	U+vPwS2UaLNaze6Ufmpi9E5CLd/lHma+QLwagSAS+P5tqSYP7CBzrRnaGVBIWPZj
	qZHdzKJa/yrNT8CRQvhd1nijXRfjpGdo7/D1ku/DoaGB8p17044GoYlGEZfOCee8
	kNS79AqL8IM+Zs9ipz5sdWlHz2R6S/N55EwSGOkkZI8nK611ty3NGEAecaanVDGr
	P0IFzg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkp6myub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:19:31 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-169846a19aaso3614698c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792991970; x=1793596770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OHOM8Cu7CdWrDvbIao5t5J+yLFREYpGZJ+T5gds31o0=;
        b=TpzJx7FnVHuZldFTkR2JGkcpiAO5ue0fPzgO+UuGlUZ3c5IOogd4iI+sxzeWfhmeiP
         7NqAp8pyEqQBSSMs0SFEirICLeMOMFBGG/wjehNH4RNcJElNKgddbamNDKAVQzYgbtkX
         G3AWpTZgSfIca3Sd32+6RzYg0+XR0+g1FVdLMbtwXPN5WLEV5CZ9s+IrOyQkFnum3W7c
         Gwa7jPvdS30GWgtSEIQ5cG8KVJMudLjtqAmCdhkEuq318UUCdYPk8vB0Evw2/fQNCuav
         JFbpb6vmXTTnCDazWM4DlVNAIMhGIaod7mtHIPSs2ABkcR+QydJE9F5GqJ8B//Oa4LaB
         a2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792991970; x=1793596770;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OHOM8Cu7CdWrDvbIao5t5J+yLFREYpGZJ+T5gds31o0=;
        b=HCcjL5FYFxdW84wL3ZCw4iK0W0rkylj7WThDyxXHXB1f3Cw4vnzFIKZpZe1z1Fiiko
         vsUoFT/UkdEnayunzijtZkNgQMn+mLaKgYIDjyVXCa9Im7AxKa1zXRAw1igDxUpFqiLo
         8E3Bwj+FDighCcP2nm4sFVsPj9asDvibcdHZLo3mEvznxUfOyRqTEWsrZ4RA4a226gSp
         75td+R89cf/4p5gzFLFOJeREBcTJyO83D1PTnWNiFZ+1JsH3kftahRI6g5zOlQ5pIJST
         c3mMbVXNfOpjR5b/otKnt2hhTSy0byx3IOFUvN8FeOuCP2ydGlk9nnUUnmjP8yEZ605C
         5abg==
X-Forwarded-Encrypted: i=1; AKwUvBxf6vmwMG2OBasbjb/cuhSkpjX5ehVX9qbmxUQMPIvtRSJZKGVfuVEWeKXKU3sxAI5qdCu0dHXOK1o+EI8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIL8ZfGNP4cbDlKGU+VRZdIEJqArQcohQFG3R2YXEX5xeRVIaqd
	6+wL72QXrkQ/FBF4GAtLfVcTEtOF6YC9PLHqDMl7XpmZkRChYApvhIopL5ii51g8RFF3g1M3NkL
	1J2DFEw0rWv6Un5mExjBq1S/ExPmC2JN/mTELJHzQ9SEzHiD5cWXptNQ6oK5EELuRygo=
X-Gm-Gg: AYBFou0GuyzQNyQ2PBDHzg9VhBSYJuQymXXzK6BTirFk2OdslcjEK6Wgv1nNKAx6kg7
	sqXIWWGwLblOu/aiR1SH4q/Uy3hgJuFWfiXLWnXHAkqvmHuhkoE/QGXQIOfHum/+G9GtGoEaDdP
	Fp8k77zSRls/UyQDek3DsGrvKWu8Flr0dt7lRe/7sn/bc7L5nQvFdGScbj+ZvXwCwSLh5Jv3PgU
	X/1h+ZiWAtL0dB96gfSvrJZyZimO1qz5DiyKgNCcUg1MakhCI8VEqea+0i44Q7uDiDZH/9FoUOM
	Apm5rmS0T5pX8hN8gURXsJjmZqmBAdJatUSWweIEsnLg20vjfllleIItGeL63Qt3BWRiUmFIGW4
	NwlbT36OpTH9NYIXkthqeE2h+PV13
X-Received: by 2002:a05:701a:ca0b:b0:17d:7b45:f91f with SMTP id a92af1059eb24-1993580fcd2mr9596163c88.32.1792991969819;
        Sun, 25 Oct 2026 22:19:29 -0700 (PDT)
X-Received: by 2002:a05:701a:ca0b:b0:17d:7b45:f91f with SMTP id a92af1059eb24-1993580fcd2mr9596126c88.32.1792991969030;
        Sun, 25 Oct 2026 22:19:29 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a249c331sm45504857c88.17.2026.10.25.22.19.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 22:19:28 -0700 (PDT)
Message-ID: <9d247a5d-5afe-4b57-997f-b6edf6d0a3fa@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:49:21 +0530
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
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: glymur-crd: Add PM8010 camera
 PMIC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
 <20261015-glymur_camss_dts-v2-4-e7b1f403146f@oss.qualcomm.com>
 <f9de345f-ae9a-450c-bd49-3598fcfe3137@oss.qualcomm.com>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <f9de345f-ae9a-450c-bd49-3598fcfe3137@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hpYvUED4Ijr9m50d0y4tkNHjNS5Kp_RU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyMCBTYWx0ZWRfX1MOyEPM2z+7B
 CLYU09CC8l6UeqF0A3fGglGLKk3z57Rxv90z2rn4o5N7/Z+6vARq93Yk2p68zgMoKXs8Pc8xQwJ
 Saaw49bt85NCzTprq+iuaI1+4TBdvZs=
X-Proofpoint-GUID: hpYvUED4Ijr9m50d0y4tkNHjNS5Kp_RU
X-Authority-Analysis: v=2.4 cv=bq/Zl0ai c=1 sm=1 tr=0 ts=6adee2e3 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=IRdjy-4fp-2gG-jZbTAA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyMCBTYWx0ZWRfX7/mHJ2DuA9Fz
 N1r86wYAFHlB0uinmXN3BI5PvBo0CZQfdXhNr5WuKyYCAePYiOOHkAHeOPDyH7IEGpJmYjGel5W
 Hy21xq3wHw+pbWOJbsW0RSffDzBWsLypPdjsmSHyfKzshh3W+B2o8k/QI+Me6LdrEIGRsrQaxXe
 bRWGRDwXy32/gq/BBRbn4ggUjT0XhzCzVgHcL+epB2lE99f5ae8/nVU5zifP91tzbGWa0lCSx1k
 YIN9+3ddyLHh3Sb5gfuGxeJ4R18SHwq6TGw1u5yebwWZqXh/p8udj0MDF4fxztPtICjTYBeGWkB
 Dllg1rnkCF56mC563qi3Re/5uWiDvhxchcJlBadx71DGtfgQYJxLhGl0JkjKYvb2sFsqO/UOF5e
 3OZWUujMgrfeH4uC+eWhRABVMWSturOJLKqN1VWg4CGtH6+LvVsNJMn/GpZWWhOyCxpWh0EKcxy
 8y06HRjw41d4QxWTbMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260020

Hi Konrad,

On 10/19/2026 5:38 PM, Konrad Dybcio wrote:
> On 10/15/26 12:52 PM, Nihal Kumar Gupta wrote:
>> From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>>
>> Add the PM8010 PMIC node with seven LDO regulators and pinctrl
>> configuration for reset pin. The LDOs are needed to power the
>> camera sensors and associated hardware.
> 
> [...]
> 
>> +	pm8010: pmic@8 {
>> +		compatible = "qcom,pm8010-i2c";
>> +		reg = <0x8>;
>> +
>> +		reset-gpios = <&tlmm 106 GPIO_ACTIVE_LOW>;
>> +
>> +		vdd-l1-l2-supply = <&vreg_l6p>;
>> +		vdd-l3-l4-supply = <&vreg_bob1_e0>;
>> +		vdd-l5-supply = <&vreg_bob1_e0>;
>> +		vdd-l6-supply = <&vreg_bob1_e0>;
>> +		vdd-l7-supply = <&vreg_bob1_e0>;
>> +
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&pm8010_default>;
> 
> property-n
> property-names
> 
> in this order, please
> 
> [...]
> 
>> +		regulators {
>> +			vreg_l1p: ldo1 {
>> +				regulator-name = "vreg_l1p";
>> +				regulator-min-microvolt = <1200000>;
>> +				regulator-max-microvolt = <1200000>;
>> +			};
> 
> Shouldn't this be 1.104 V?

Yes, you're right, I checked again and I see L1P and L2P should
both be updated to this.

I'll address this and your other comments in the next patch version.

Thanks,
Jishnu

> 
> 
> [...]
>  > +	pm8010_default: pm8010-default-state {
>> +		reset-n-pins {
> 
> Drop this inner node and put the properties directly under pm8010_default
> 
> Konrad
> 
>> +			pins = "gpio106";
>> +			function = "gpio";
>> +			drive-strength = <2>;
>> +			bias-disable;
>> +		};
>> +	};
>> +
>>  	sdc2_card_det_n: sd-card-det-n-state {
>>  		pins = "gpio221";
>>  		function = "gpio";
>>

