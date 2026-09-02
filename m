Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB3A4AE109
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366638; cv=none; b=UqmgmF84qDLhffT8Icj8uw2dmQsCQvbcksHf4RnQgLCbEUiFVH1yafAcJ3z2ee772Ep9HhZRlVViluoj3FxMEU+mVwL2fXO21/WJStKwbfEK/JqY6PKI9La4VGEuqrDgQwc9eQP4RyzTHiXsqax449FB+pHOMe5OkF9Tg6JgvlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366638; c=relaxed/simple;
	bh=Jm/GCgG3w1Rtf7Ytx9MV+IJejXDtp+gAXOMb3VKAutE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SQTYq8iOXVnuyex3gXSKZJR0Oc6eP8gKsa1ZclebriN/G5U5VCbpvZ9ddmVsGjpfakHP7B/4dLD3/0NVeAplk88g3pBGKm9M2VKNCkldNznXNyjXkMLQ+MVzurQVJEmXmloo8ObWtrjpW6BOZscJZuCu0lWex/jlgly1pClsa1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K4+Vtoub; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y64X2xN1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K4+Vtoub";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y64X2xN1"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FZNUi2067375
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 16:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0LmumBSHjtHOWOUT98VGfXvJdSeB0SGvuhvGl274xq4=; b=K4+VtoubPjiIXRnh
	aai/86kVsfUaBNvo4dc75Qt6FnOXokWJGQqicgCX4EpUbDw1b/OTguGDjuplV+Ts
	pr7VTupcyr5pVaKDf9bJHgmOGSpLZiA1URafPwGjO+VC7tAwJSnSEiLPaBPp6TV8
	Cb12U4EaNxIt/+cKXcM/H94VX+hCuNg5VRRQ27uqikwM/xoqoU5x68H/cMp4vH5/
	gGy00yyNOzYtEpYIwrq6z+t91AlUG4PRnEyQiMyHZjh/XrGG8wtsE3Ey0jVjE0VJ
	3/vjEZFj4I5QX0TjLGMnwCix8s58aWv0L/EuLHmJ1jje1VTex+pX/0KEWaCfPo/t
	fUj7Qg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gejv897sr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 16:30:35 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c6645a6ab1so62574e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788366635; x=1788971435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0LmumBSHjtHOWOUT98VGfXvJdSeB0SGvuhvGl274xq4=;
        b=Y64X2xN15BDxTRxKpaFdWUjMQcySFov5DCXmiVyrnQV0ZnJgPYsu4AVk2i+pKbl4+X
         2kKEtuoIkt3AWc6yIGxETsQ6TeYtuqbshW1X8kvYkuyI2PK1tYBNjZR8TAmhkuXi1/L5
         YiVAdPQc7C+YD3C3H8dEcY1qzih/PyTZwN2iz0ta/VqndNwqFl7Rtz/9WpU4vS7Gh3Pj
         pRaLAKf8H5G3hEamVk5PtHFQ7Fd9nZxQ4anAU6VTKTIjDUwKLYUnung7WjOFS/dNZDGy
         EAO6KzrWQUrDyJi+CXOijs5lJXLg4CEzTWBSQUg8da/CZn8nP2/n4LVs2JgVjU7fReP8
         5G/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366635; x=1788971435;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0LmumBSHjtHOWOUT98VGfXvJdSeB0SGvuhvGl274xq4=;
        b=bouNWlPjfS5I8xTyqtv5cmAxaGYJcSpbeOXD9Gv1VZyOVo8ZAJTrPknSuIABVEEUn4
         HQ90ROH2dUTyay9u21kcUX5loAzBw8E6TkMqu3VonvCO7lloWu/Ew3Iyk6d4FvfD8RKH
         jWTHIe4LeCdP+rz7HLjY74RttLCP3jR9NUtJMjTdgIAkC6rooMF+hQimOpaPcc6GmGpE
         SNrgzD+DoReMdWWjVob3/pkCe1C7Rqt9iyCD+nAMayhzFtZzt2G5MAU7ei/LOiQrUV+0
         R9ZrG64R2fgWLZscYRhKo7vzyRgbXCM7cafMMdFCNZzO8veL5Hs3Ha7LnkFEy9JdF2Tx
         TCkw==
X-Forwarded-Encrypted: i=1; AKwUvBynNdCcnrjkWNUxp1e0v2lKQBX5Kd+fN42xoWzG29pjP5OnMPLpoxt88d3PktJtp7xxHi+xrNANHlZvdPk=@vger.kernel.org
X-Gm-Message-State: AFuF++m4uPA2ICK0zdliG0YpJizlByR2kCa+jvYwBLt7rzu3vCHCHsIL
	eNNBIilhVuiPYSMAu2aHjHYyFsw9qvSlRhIEQBS0+KKwAr2RGhBXPe+m8vDA9ciIhSW6gAs7Lvm
	5A/BarIHlF0NmYr1XsQDkVH3l4l7Lw+qbwl10hhAyB+dclkf65UuArKRvsWmggaDrzLY=
X-Gm-Gg: AYBFou0KmpMGlhWoalg0b/Pk0XRhkddDXiUZOmoFN9OcRSvXxtmVr1pEAnXFABd+9/Z
	piAkKEUXusdRqOQ2g0L/8wyhw5sNDA9QEiSDYu8m+fmcjX8c04jf4gXBNNWVBbijF42bPrCdgvt
	22frRebKiQ5QaFfTtkSAEjHWPYPiKEBsgXXL6ussnRpw5xkQk5PXvnkHaafN3ZVRzKR+jWJmkis
	HPrZUxuCY/1Zcom+haT1a+xX4TiJWaJnNJJF6JijxuTc6lrt//aHeVrRxSpi9kBryZTuk5fQt0y
	Wqi2V3Fy7uYBN88PagpIVV4QYDl2GWwYaX3e8UQFx02sWQMMt8lnJCMJOvcHqyLF3kNAKtY8ffH
	18WDlmNsws800bM+2nLfm6w==
X-Received: by 2002:a05:6102:5490:b0:789:3ef2:1da1 with SMTP id ada2fe7eead31-78a1f2db6b2mr994103137.1.1788366634521;
        Wed, 02 Sep 2026 09:30:34 -0700 (PDT)
X-Received: by 2002:a05:6102:5490:b0:789:3ef2:1da1 with SMTP id ada2fe7eead31-78a1f2db6b2mr994053137.1.1788366633931;
        Wed, 02 Sep 2026 09:30:33 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d039d2c2sm168293066b.32.2026.09.02.09.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 09:30:32 -0700 (PDT)
Message-ID: <6d4b8ced-97e9-4926-8678-39339c5303af@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 18:30:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v1 2/2] arm64: dts: qcom: lemans-evk: Add SDHCI
 support for eMMC via overlay
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>
References: <20260826113206.488991-1-monish.chunara@oss.qualcomm.com>
 <20260826113206.488991-3-monish.chunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260826113206.488991-3-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oSZZUzY6bvCNrP8eHr_E900MQ2AEBTCd
X-Authority-Analysis: v=2.4 cv=L+wtheT8 c=1 sm=1 tr=0 ts=6a984f2b cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=sGhwJIB4vkB8Sb3_GrEA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0NSBTYWx0ZWRfX/nC6og54vGZa
 NO73C9KpBKHAn0ccKZgMlYEyIpfLyqIY6YZRc3F9rlzXUD7kBeRJkSZWFqlaU6Lcdh4NyHytxSw
 i9WC/hiKb5W769+SUagt33VBN9qZrELIvyOybISuNCbrlI+1IdCqcXmMwwhEDIr5Ae5br3g1t9a
 1IrFbtYEYUvzFf0XeyXiq6n4heke0wh8EAzZ2p+meYNvw1EX3zx2Ng4TymW0YsFy9doKUYOVak3
 BGdpakyjChnF6+SCe0owBzYb3RxsFVH95UzjNdldGY07VGq2pwsGUUGsxUSHzNjd3YGraz0zuOt
 YpxdXeJDUFrVwIdio1+jmJ8we35HBzTa6FSEt0A4JYomgG9GPSV+e/eIKF2EE+5bCVcA0NJr0Xq
 M4OXxj3eng/6o7InaEQPQkNNMPimDwaeZ9e1Zj3gOhJtwAeJmjyNwKEbs9wUykEcLPRp4tOdms5
 f6enZH3n5n7jHvZmlng==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0NSBTYWx0ZWRfX8iFLbDQ2zavW
 PFsbHY1n44CnrTlNXJpMR4Hkryp0RlkpPHNr2UmNzjVN3fSV3ODGh0jxw2Mt/NnrQXM2U/TK6PF
 o/da0qdR1MUu1aay/5VfmKNYKLx8SPg=
X-Proofpoint-ORIG-GUID: oSZZUzY6bvCNrP8eHr_E900MQ2AEBTCd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020145

On 8/26/26 1:32 PM, Monish Chunara wrote:
> Enable the SDHCI controller for eMMC functionality on the lemans EVK
> using a device tree overlay. Configure the corresponding addresse space
> and resources for eMMC.

These are two separate changes that must be two separate patches

[...]

> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 695eae1b7256..99d21e3d7ab8 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -4300,7 +4300,9 @@ apss_tpdm2_out: endpoint {
>  
>  		sdhc: mmc@87c4000 {
>  			compatible = "qcom,sa8775p-sdhci", "qcom,sdhci-msm-v5";
> -			reg = <0x0 0x087c4000 0x0 0x1000>;
> +			reg = <0x0 0x87C4000 0x0 0x1000>,
> +			      <0x0 0x87C5000 0x0 0x1000>;

Please don't deviate from the existing style (8 lowercase hex digits,
zero-padded in the front if necessary)

Konrad
