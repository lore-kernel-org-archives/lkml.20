Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6562847ECE4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957665; cv=none; b=odny1Z/ZEL4HwWnxc2xT0fPRTNhJEb+/nbCyKfaxxqC6pQnZTTAlTIRBBclAOXIyGQtYe8I34tHIh/vmI9wBgt1GOsvxBUHNucD3BpTM1/nnAveq+RR8i1CLP6K0CZ0lae5JF59WHfh2AVr5P4vCvQCeQG3A1mvFN7HTJS9Ppyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957665; c=relaxed/simple;
	bh=mAOeGgqZpoUnhK7c+giQe4dLuI0lwdz7a/xuTj0ZKzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ahuDfudk+1t6Pg31wrcg7YqQwmLTUDXkoN8nl6JJQ2kvMvvmfv7gxbe18iOqMMO9m1xl3D9YDTVhx9gElyEwsCoDOsddatKKCOhPTRPgagRc/fg8G/50I8C7s/TNvOHsvujWTzoLu/T3PXEMR729A9wJCiHoE9VqBiNUHq/vYeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LacJz//s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FLY2jeCx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LacJz//s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FLY2jeCx"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU6Uw599697
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 12:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+czh1A3D+YBFR+KqXehnyt2C4qAKnD5hwhKwNg2nHmc=; b=LacJz//sDXqP2tNh
	PVtbycauQJljKVumbNno70TXYqXz4wceJ3DRYT2lGjQYDZ5be+VlCaNwQ/OEY6JT
	gN4/TT7dRZFcgWOxQBGDbBSRSfue08PYq3WOanmZFmh3SH4LiyvE3J/56EmPfDc9
	tsraOV6nWxQuo+eFeRFDlc85WSKJx/UqZWNB9pevW/pNO8PuD6HxYRP8g7cvgTWq
	ccyLca6yDsoTZZ/xc7DfZha7DqfBAcS9RPCMDI6OkVyLSxQZtPxhuGzJwaCm552X
	tupdOFZ6w3tVMxHbc8T/tJIg+qx3/ENWyP4z20uTpmoyTa9nmNd5lDwu3+PtEWJ6
	CNnBJg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr1y1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:41:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9375d92d0caso65524085a.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788957662; x=1789562462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+czh1A3D+YBFR+KqXehnyt2C4qAKnD5hwhKwNg2nHmc=;
        b=FLY2jeCx3Xc+7PzpjhUX2pgudsb1q7PxhJLmWXy+1iPfchjPm7jlHZnKJch08QF1Vm
         IvLp0qBcrknc3s76opdnIozA6kT1XSgoYRbgSbakLQEVV1hZ4ZZrgpApYXSCj21w71+f
         i11vBllsi5FgvfDiEjO/YilFWy5qF2YvveeI6nah12Wo/84/kWAIyKa7Ev+CkbaaCn+8
         uPdcPqlFkkK2EUAyivAV9nTPGDX6NPTX/DdOJ36fTEKljUCOEyXTW59cSePkj/adUmNj
         kVdQIDWRiax09aRRyZJsg/FDPt6cTIfm6RRHwtnUpor9AN5x7FE5VLB/lsEtLXX3cBzJ
         thGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957662; x=1789562462;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+czh1A3D+YBFR+KqXehnyt2C4qAKnD5hwhKwNg2nHmc=;
        b=gt2hNTQudlTeWFuYpcAYOqaLPVe0Vlb3GJ+CZwfBUwxfCED+34s5U1iZ7Vd4pvSFVa
         y8Q80xpcw9S+TWLnDdvi5zH9MmPhiDu2o1lPYveqcqfFu2O6bnoDku2LTECASChG3pkl
         oAUfv3UY9OKAkHIVe8mw6qiFJxNEBfAtCO0yWoziJoZpxd70yBMWQ3EgNcrfC1gi85J+
         mj1C1p+1y3PLmCLV9RWIxv9Et7XlT/CGut6rhaGkY4AXbbR02280GmwUNhZ7z7H8Sk0z
         sJMeRFO9n/R6Fam7kyRNMNLpzzrQburA7lbs/d+zZkdL0mqbX9UINB2sLl7DW9LT3pKS
         /BmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRa8EtJm9YQQz0k1y3rnvgYBTZ3iBkTnPyuvsPafv4vENqyMad0g5hLVMF4AdYFhqNjntQeEwDYEH3Do4=@vger.kernel.org
X-Gm-Message-State: AFuF++noVJX5EYeUyZkr396hyKseosKEDPS+c/2BZOueaJ1LcLH4RDdc
	OyjoJb2jfnTTccK7KJiNCls4YGfedA1mGpfdDOd30oaQJx5P4rRZRrQUuoY29wGvr+G2c7VHdzq
	K6SFl7Oc7iteVOJCzY2dxnbGOhaXRr5mTIIIqPDifHWav+qdKQR4sAwGE0Vb4g52A93o=
X-Gm-Gg: AYBFou0SAxRmNc0ty8zjrgIUA6AS4mExEnWeL4zOmOibuCNInjEXwyZMbxX4L8J6aUa
	U9FOmb4r7cs+P6Tl7Q0euvE7LHSrdx+6CPJgDUYdyt+3c3HY+730c4zbOxRLb6KEeFU4IbdAoy/
	aMl9jBR0KTT9/vTNrYGQQXNYwbZB+iHrClaoZXqVPvq4+jKfivkHI+Ql70tHl5MseCFUbA/fdqX
	rNKPz26b5vVTCs8k2KahjD0KIxyxinBh56X83tlOx66u6tL12qJYKqZeC1VuwDy1RVtBYygp2K6
	oU+em3j0CaL4wC0M6UydXkII6D1WAApDGEdOl4gh20mGTNut6m6BmCR4sFw4btLHmAND4rny2eu
	XzNQWiLwgpCcKYIzPpN0Z6w==
X-Received: by 2002:a05:620a:4141:b0:939:47f4:935a with SMTP id af79cd13be357-9399188d614mr2540884685a.5.1788957661945;
        Wed, 09 Sep 2026 05:41:01 -0700 (PDT)
X-Received: by 2002:a05:620a:4141:b0:939:47f4:935a with SMTP id af79cd13be357-9399188d614mr2540880085a.5.1788957661423;
        Wed, 09 Sep 2026 05:41:01 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9863cb3d6sm1362285a12.0.2026.09.09.05.40.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:41:00 -0700 (PDT)
Message-ID: <b02e141b-8e7f-4904-b9f5-0a9cd0ecd377@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:40:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/13] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD
 pmic,id=m regulators
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
 <20260906-x1e-camss-csi2-phy-dtsi-v6-6-067f2ecc4630@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-x1e-camss-csi2-phy-dtsi-v6-6-067f2ecc4630@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa153df cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=f-AdFH0jOpSPBr_pIgEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0MCBTYWx0ZWRfX1Ubw87S4oThg
 uPO2t/eskr19pJc8CdwvJT2aluKVr9uyu3PDXok7tD90xyT1kkey27akZGIbYiuabeH5zAvBHVv
 YWRpyO2TbJyBoDtv4u1iGUykrOk1I49M+p3XaSA5yZ74dWSAgkPnuadpHABKz6QHc6t9vuiNnUY
 3Vyx6tHjG5+LKFPiSEso+02QCCGDBFD9F6VAK90JpD4u3NOfZ5fIVYfauN4JLY2v9gJp8k3VV/C
 HGk+cQ7WTovwbxc3NX5TSpucSuCr6tJ9mu+nL93wJh1FnB1/Zi5i0HkX3QGXFU6Qwkv75afEeOe
 knYJ3Rsl047WncjHHfSITMXB9lLVaOzOa/d8UB7Masqjby4EjiY8MB65QenuZdljVPqUTw0YwzY
 PAvGP0sne9lgJVpEhsDXoxKtiAeeUDE4OnUMUm6x844AVI58BK8iLtK4r41bEEcC+v68A8uYAJj
 5sY1k9ZVYRWd2VENWEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0MCBTYWx0ZWRfX4BlXBOjN1Hig
 jmYPjj7pJ77AtJzPYMDlG9+U0TDot/9zOnEKZbBneBPFPX7J+BcDHjHx6+BDIZ9LbKwTFrKsfV9
 MP3gmPkH2K6/QHKAHEvEqYMyDkgE0wA=
X-Proofpoint-ORIG-GUID: b-QgeKTlWCkiIY3nY8Nixn84U1ei0YHE
X-Proofpoint-GUID: b-QgeKTlWCkiIY3nY8Nixn84U1ei0YHE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090140

On 9/6/26 4:20 PM, Bryan O'Donoghue wrote:
> Add pmic,id = m rpmh to regulator definitions. This regulator set provides
> vreg_l3m_1p8 the regulator for the ov08x40 RGB sensor on the CRD.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

this somehow escaped:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
