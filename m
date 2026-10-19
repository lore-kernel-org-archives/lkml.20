Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7284EC662
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792411725; cv=none; b=q3U10dGWlPmwgBCzIYjbA7KIu8v/AyrxwFObWhKEwzmg3BNOG5e+wvNKkDudMregAbVjldOnfHk13uGS+sIar7UIk3w6F7Z/jsd4mliK0Mep4fEFzLzfqXR3+rkP8RJsazab+eN2tACbHsVmAtBvYeLEuriyR3DiMzmXXaisYb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792411725; c=relaxed/simple;
	bh=CQ+LxFQSBmtnuVFJPPeu22Sd8E/FkQAEssKQRfoeiO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tCawgyv+DXJ1QXUjqLQwauOuOvGOOko51LeI/Opqui7xcYiviigaew3U6Z6AtPPWpqVDR/YHUX9B+9QunUBpnMUldNyQc898z7d5RQerMlMoaN2KMptfPrpLCdEEvCmcCSvVQKWN98tk8zc4CMSrDIIdPJxhbBCgG0d2pfnrnN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F8YQzDLN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V2Jbyh44; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F8YQzDLN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V2Jbyh44"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Opsr2234252
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MPLcVEpabOhDQf+ydVhM3A3ikEBH8XfqoAA71Iezzx4=; b=F8YQzDLN93moeEZX
	KFLp9Pu4x3VfjGAFjDJxGm+FmgzN4G1bXSJKt2/YXvZT8WMIY+J0Cg/Py5wy48wH
	oRRmI7zzrmeIFP7wsLktFj6LOL7tnRkvLvtoXkjynydUqzHob8ynRMQI6qN/dgxO
	DCkNsIZFpNGl4KzbKI6g8sTMm2uj634y94kRlF1nX3FFeqBM8JLBISRVa1ZfqMM9
	I7gGu7bpjnGz+/D7Fvm7c0SgnL2EXksv/9d+MXjcWKGuXYdNwnx9/ApZUYjteqX0
	xBLwZ+yNLJTYmQ0jVGACPshw+guoFF7z0aTQ7eMwUVIO7MAjjHcsv1ZUk04s+3+W
	SJIVeA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3x90fn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:08:42 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-77f133855b9so42574137.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792411721; x=1793016521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MPLcVEpabOhDQf+ydVhM3A3ikEBH8XfqoAA71Iezzx4=;
        b=V2Jbyh44pnPsArhAUcvdIKn4kbN1IXKzGXsZzPEvjLovBahKYZ4aYfp/a8JINvmANk
         XgznrwpPDdRAvUYsvSHiUwkOTOvKCUVuN2PAnfPGWzeTGvINbb5Hnc03klrRyVsZ0OVl
         Q54UE6lPeDBQL8vwytJQhSsinDYs+TfxcWMyDV4drFVD/fOOuOzDiPFkSW2aZp2uLukM
         ua0N2f/qFHW2Rg8upZrggRz6i0g8XakO+eQCOHKZMFNo/4UAiWCWfpm9ONqasIQz9qgV
         92nCBkEsCxPD+VFBREG59hPaMutejh9NwxGuIs7hk8+rGhrQMYCCKL2Mn8mQPIOuxbtl
         EZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792411721; x=1793016521;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MPLcVEpabOhDQf+ydVhM3A3ikEBH8XfqoAA71Iezzx4=;
        b=jiPTnx9miOqUm/PL1TXwjqWciwCFluIhzyrT4xGar66bVyBZde7FQO/bA/zjAeWjGB
         1QMmmbcODSrzBjHs/lhCRIWterahwBmgK/Eg8q5qXpb0nlBakTTjeF7CevmqiEkIBq7y
         uO+2eAS9YM2NYg8fBGrjU8qgeVSzZ8TyTriU9BHzquNBf91mO2W0JNj+BNsODN8BEMiT
         qbiOPC+rf67/sPDmx9yWiaYlaI+SkgI38BSnNOY1Ak4A0UrQI9uMcT5akNnyMZVfMihZ
         PvU5F/Xh7yAFwG251RsZhICesYBNdtphoDW/DllQtrMsDrgIVqcOD/wHSMMTzPCKmpS9
         UDDg==
X-Forwarded-Encrypted: i=1; AKwUvByTS4knET8ldngoelx8+rimnHRp0FZvrFuMld0CAvXt9KS4pF0MDavVP3mVeZWH6UNAMCoXQXUN0Q/o0ps=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuVJxzlhICuT23pgJuBl1syCD2MuEYPa+Vs+Ui7jWj1WluWZ6z
	mye1a3hVLyt/ZD49eAOswtNa69uhD3cViFrZjtCHVWr5ejxiv+ZNoAaGO+uEYW0IlYEBdgzy46S
	ExgX6hLzg3GkhGC7vsFrFEGYk8dYtNNze7328ceNE7FKNZhEVrr4Cod9PxIebhnh9R1gY6DpXKF
	E=
X-Gm-Gg: AYBFou0znllIDuvsOj7m6bYm2g0/S0s1tXOucTn+fXYzl1Jw8KlvZPAozzNUc221JCg
	QmAeDak/OvrM/Hx0broK0gkE0R+PQy+1m5FLr0IPdjkuqYP2rcW++18Cm4IpMQx1TU7RsCfz5VY
	bH442Ntu/R9kYnv/U+TtMSVoy5XpKdVFQki/bldh3m8rNHP/9BelDe51u5UX7VntCqoIX4oTWF1
	iHG834zplfBvSvcGnvr1tXrBVkfP6aNx77+yCWhI/H9OLOr3fCYFRzTUi9ENzN9fs325csq6UlI
	I8i+Y3Li7kZa4oL/5umlHZULIkaE1KsVBoh0XXjnAz4CQSJyz4CwceZB68EMgSPW4rAYPVACTzD
	KOpkqSo52FEsOauGKWBCUkQ==
X-Received: by 2002:a05:6102:418a:b0:7b4:f1cd:80dd with SMTP id ada2fe7eead31-7cc36731b1emr1233395137.1.1792411721051;
        Mon, 19 Oct 2026 05:08:41 -0700 (PDT)
X-Received: by 2002:a05:6102:418a:b0:7b4:f1cd:80dd with SMTP id ada2fe7eead31-7cc36731b1emr1233382137.1.1792411720491;
        Mon, 19 Oct 2026 05:08:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32874bsm347024866b.9.2026.10.19.05.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 05:08:39 -0700 (PDT)
Message-ID: <f9de345f-ae9a-450c-bd49-3598fcfe3137@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:08:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: glymur-crd: Add PM8010 camera
 PMIC
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
 <20261015-glymur_camss_dts-v2-4-e7b1f403146f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-glymur_camss_dts-v2-4-e7b1f403146f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oXV11_a3gdcPSnD99-cVqreKn8Tyv7c3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0OCBTYWx0ZWRfXy1HehpqOgUqm
 3cfh18vfgdvp+uKnNl9KZlvfMbUv9n8LWltdWIugOFOs3wfY9yebCWw+ICVxf2pxjNy41pnTUt/
 8pPlr4/HKbLOciX/oEgGIUnZchVooPU=
X-Authority-Analysis: v=2.4 cv=XPOl2ghE c=1 sm=1 tr=0 ts=6ad6084a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Ere-zjln2nqZyYFjUl8A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: oXV11_a3gdcPSnD99-cVqreKn8Tyv7c3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0OCBTYWx0ZWRfXzWBxaEib16Vy
 SO8Me+J2YO6FImSkTTyDkLGpVVCweXxv+rXd2QursKrOBnndYPqGvD3ONOIVm0Pzx94wK1J0BHN
 //3ENRH2FY/7tMVzCsE0pc/LQJ4J1mUBO0yJXPhxW8+pW0abFOGSE14w8nycxz3Nddw0O6JwZID
 L1xPE4WcPJJFeWVLj77+6sSOucO1enHPODJ1ZyygZD1/JTB/8lvzuIVHCjKHGz8d6mvoaOOFods
 Mx6PMU0uPx0ng6Ybdx+qrdNqnHyrq2rrNsGuDWm2/PwRJ7nK5vnAlH95rJj/bGThDsJfQCB0hBi
 D+4hezCq2FMUJPKLBOz8yu9iiOoYHhKH6bm9ethumv29r1D6pz7tv85+UiH+st2Li1IOa02AsJH
 jFE7hCQ6l9Za29zTRBtZs/NgZkVSeCgppuoThQwGK37H33JSUb+at6tuSRqFcEXcIhk65ImPoyG
 1qYXfty6M7WbTA8/mSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190048

On 10/15/26 12:52 PM, Nihal Kumar Gupta wrote:
> From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> 
> Add the PM8010 PMIC node with seven LDO regulators and pinctrl
> configuration for reset pin. The LDOs are needed to power the
> camera sensors and associated hardware.

[...]

> +	pm8010: pmic@8 {
> +		compatible = "qcom,pm8010-i2c";
> +		reg = <0x8>;
> +
> +		reset-gpios = <&tlmm 106 GPIO_ACTIVE_LOW>;
> +
> +		vdd-l1-l2-supply = <&vreg_l6p>;
> +		vdd-l3-l4-supply = <&vreg_bob1_e0>;
> +		vdd-l5-supply = <&vreg_bob1_e0>;
> +		vdd-l6-supply = <&vreg_bob1_e0>;
> +		vdd-l7-supply = <&vreg_bob1_e0>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pm8010_default>;

property-n
property-names

in this order, please

[...]

> +		regulators {
> +			vreg_l1p: ldo1 {
> +				regulator-name = "vreg_l1p";
> +				regulator-min-microvolt = <1200000>;
> +				regulator-max-microvolt = <1200000>;
> +			};

Shouldn't this be 1.104 V?


[...]
 > +	pm8010_default: pm8010-default-state {
> +		reset-n-pins {

Drop this inner node and put the properties directly under pm8010_default

Konrad

> +			pins = "gpio106";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +	};
> +
>  	sdc2_card_det_n: sd-card-det-n-state {
>  		pins = "gpio221";
>  		function = "gpio";
> 
