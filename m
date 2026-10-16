Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E09344AB68
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158127; cv=none; b=poa4NkvZ0VmDqOQWABpslw/hG/urIcH5K8b9wh3iIyOPX1lgMH9q1qPC5VYNF3tcvuK42p0mgGpYy+v5bVKxjCnMqA9xc8yrFP3ziEQITWJXwvcyu0jhQUl2tRzBMr6Q7RKSKMOi08zBHAw4IntSogAmZc01Hd4mt5JzP+IDTv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158127; c=relaxed/simple;
	bh=RKgV5hZvafCihZFGYAAI/L2obRXJPdA1lHWrYC52Kok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DLuMZ5D0tXuISiz0yGTj0D3EmGsQ3ucPJt7A6VmVmRXBCjH2+08HY6AdM3Y8KzYf1MU8RHuTzsHTFWyydkfjHVi+Dp8hIZxXFWeugCH0ja6GctLCYTBXHxNmEU3D/E/NUan9DJUYQbR37fehxcWuCeMqdrRVlh8llCa2TXmLFcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=orKZ0Li1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RCg4LdH4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="orKZ0Li1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RCg4LdH4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GDE9E62802353
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hXlYtj95HgLNKsldaNN7asPVeJJ5Fh4BlficT6fRyak=; b=orKZ0Li1t4druC1H
	6hY1MMvOXVDwKuo+7DpV93/wX0dUWT5ysZNdQwDKDYzgEGkGB6nYunT4cGGJScOp
	cUFL8cU1iLX8RakwqdJs3RP7RkbtOwGGLMqXyXURNnJ39nEcAYX4pOMXzMCmycRD
	DMWF8iQOZyhMa/yj2jWeBcufHGq910wcBNM9Ie6tEgsyWYJsuS4ekW2t1KyQ+IJx
	iZNpBq/D4cpIpZDBx+96U1dFshdK7X11wy2IEPdODUYPNiFeFqMeTnwX49sjwU9y
	L77MLVyAk5uMy6HiHViVYwxy30eNXFp51jh4d7NeuslWaDO1TL4+4Pv0GSPbGYCy
	ObVc0Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbmmq03c5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:42:05 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-915e9e1a5f1so14544736d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792158124; x=1792762924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXlYtj95HgLNKsldaNN7asPVeJJ5Fh4BlficT6fRyak=;
        b=RCg4LdH4q+LZeU/U/U3vCCcRwr1QT4Gx3xy7gbJ954dzvwRRb0ID9v1qzjrOdkTNiK
         z7iKfPPyXnjrt/iMvxXyJFUYgNvhB3U+7OvaN+TZatzI6AGKuXCQBxZ3mQ+QVAmhLbUK
         bg80BRHDMSNz/q3w5K6zbVtCnsZ/OmIbJoel+HSSkFRPHMToBJ1p7K+KsXyGWaTYgU4y
         vv2X9Sp56QdBIaIJD2jspEGJnn1IQxlvmeIc5fX6QISyg1DkWQpynqvjjHiBm7W1NoxT
         gPfs+0Jqw3pGLEvb6Yja6v0GvdbpanG+L9p3TLAwRljXRbn1u92rrCzPdxUXnLt6iJwR
         STpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158124; x=1792762924;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hXlYtj95HgLNKsldaNN7asPVeJJ5Fh4BlficT6fRyak=;
        b=ozQpdbRQSaWR/s6tJD0yUi88Xum0Yvh4Cxd5U21/Pq2kGirEgUUfCHPjvhCAXArKTH
         0bb+JYQwyPjKpMq2XIUIBmoWkIEuT86IKGdr0LGzmBHYDbKUD+ImlLi2eAEyseQYbaSd
         Tk5TjWGnhiGYuRl012QLt3WIjQh0V4xgV6xfDNlz2fT/sGwS5J3i2VIrhLfAKEl0TlS6
         SOGuyDEhODVDO2ylh0Yog2vrwuR8pVEhZdVlayZ1EeB1wUGY72wuNSgtbBgVGXq9+pDK
         CuII+pg+DKAMlGXy1NPXXZOGT0ySNyT9U0zWMEd1O+Byr1cS0E9flVxP05lvPwCxHNPO
         7XrQ==
X-Forwarded-Encrypted: i=1; AKwUvBy27wAP8onovQS3rUf1pmtb/A/TmbcmOOZvZDd+EpmKil1kFVax58tnP/6HWZLW/fiqnL+8ZdxBWHEh1/4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIa2q0bM+VnV+rs3D9TBkHsOEDT0kU+VpbcFM+H2iqgYOl0IWut
	zg9wmdG7gU7p8zTnALxFyJullZ49GAV4OEY7AxRXB8JqrMuEZ7KW1G4Loci+FIzuon6LueIREMg
	+qKYAO++NBgvkFiTaJm2ltpEr44JyhqKnBdfFR+ElcVfl1kgVaze4l8FdU3NyR6YOPsA=
X-Gm-Gg: AYBFou1U5y8biH5tE6XHx562XzlhC0N9XOMFRZiqhyzgu5dsh7ItYq5yYXKg7TuuzGs
	KubYc+uqIpToZ/RtccPv4cJzjNz6KDGWkJzTEM/bv4hpyYs7HGd7N0LVMC7T7u+KK4kuW+FpI0R
	Sso2XTy/+eGpVDeG9hAiwFaPuC140kCjd4d21MzbyvxHS7QV3Eu3KneDPMGnkQ0m6uXkadrdtP+
	yC5VISrm0cA8ga9seh8EMA2I3q7nNs4kiy1LudkMSnm4DA2zR7DcVB+NA6sSmZl7ghd7NKU19zq
	Yb+y3Syp+7VNwhS3ZDSipprkknHgW4XHUsVZqCZOoX/gQWdGdTr3TPfc3KiOJtVPk5SH3M1skYZ
	/HSbXEJ8Xxo2eRJsNNRFwMg==
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ebcd2b830mr3752546185a.0.1792158124363;
        Fri, 16 Oct 2026 06:42:04 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ebcd2b830mr3752538885a.0.1792158123718;
        Fri, 16 Oct 2026 06:42:03 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1d8b4csm877756a12.26.2026.10.16.06.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:42:02 -0700 (PDT)
Message-ID: <6eaf5257-8c9f-4cb3-9232-e8f9fb19de71@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 15:41:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: Fix touchscreen address on Dell
 Inspiron 7441
To: avalon.vargas.centeno@est.una.ac.cr,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Val Packett <val@packett.cool>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>
References: <20260914-dell7441-touchscreen-v2-1-7f7224c0cce5@est.una.ac.cr>
 <20260914-dell7441-touchscreen-v3-1-062d6b93d1ea@est.una.ac.cr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-dell7441-touchscreen-v3-1-062d6b93d1ea@est.una.ac.cr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NCBTYWx0ZWRfX7JU2vlBiJ3YR
 o3CQE1eDwMyWOO7tMQONC55Ql3li4Qx2etB34IuysO8D5UTF8DSiLUE2N/oZkr4phk2YoOq8jSu
 yFgcsxv9aMLAWyu9BNxBEWXanIPJrkA=
X-Authority-Analysis: v=2.4 cv=P9uvFSAu c=1 sm=1 tr=0 ts=6ad229ad cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=VwQbUJbxAAAA:8 a=iLNU1ar6AAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=gXMl86fzaOV-y-lz5Y0A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NCBTYWx0ZWRfX/B6WLRtKa0oT
 YBmMdSaEQoVBC4vksYoURc++kRVhoGjyvwH72ZtnpYbuCvksEqQgKyfvNalxmPhVaMoTx405aX0
 p5ABxChRzqrSOYdAMwMnNl2rfNMQxQXUayAbo3KROEQPE8fUf0vPSFEseDNi1v1NTH7LpSAN3VM
 /GeCZ6PcUNRs32XDwvxmEWenQEUdJWI0Ok1Y+ebYdDyRwDwS7kVBUv5UHEeFTKLtd9v42kiuIUi
 7NFauyzAKg0kfUyabWKr9wDcKpBe+dtoJfM0xlyGwEM9n8M+V9EB9asBzJ+pVL1ZRQ9LdDHoeKL
 lbR7LJA4kbcaw7oVkryf6JaJ0pIe3Dgpt9H9YtAMUcZX1Ed3+KgeMHQ4XfDaldXuypw+sQGd64G
 GUnCxUSnCL3hyCjEEBP0c1UJIg1u1drhx/WLGjsVfV3wSKwesLFNoTIfR4xQZ3qDZoQOpztBhmN
 Gmr4gTyJEMuO9XYUuXg==
X-Proofpoint-GUID: jHJvRVb7FosCWmmoH7hHpjkW1icnQkKl
X-Proofpoint-ORIG-GUID: jHJvRVb7FosCWmmoH7hHpjkW1icnQkKl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160054

On 9/15/26 12:04 AM, Avalon Vargas via B4 Relay wrote:
> From: Avalon Vargas <avalon.vargas.centeno@est.una.ac.cr>
> 
> The LXST2021 touchscreen on the tested Dell Inspiron 14 Plus 7441
> responds at I2C address 0x09, while the device tree specifies 0x10.
> Probing the latter fails with -ENXIO and no touchscreen input device
> is registered.
> 
> Use address 0x09, matching the LXST2021 configuration on the related
> Dell Latitude 7455. With this address, the controller identifies as
> 29BD:1103 and binds to hid-multitouch.
> 
> Fixes: e7733b42111c ("arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455")
> Signed-off-by: Avalon Vargas <avalon.vargas.centeno@est.una.ac.cr>
> ---
> This replaces the earlier report-plus-diff with a patch submission.
> Only one unit has been tested. I have no evidence of double-sourcing
> or a working Inspiron touchscreen at 0x10; a typo remains possible.
> 
> touch input and suspend/resume. The native upstream patch has not yet
> undergone a full kernel DTB build or dtbs_check.

This is a prerequisite for all contributions.

Bryan, does the touchscreen work for you without this patch? Is this simply
double-sourcing?

Konrad

> 
> Validation: Linux 7.2.4 plus the equivalent local DT overlay, physical
> ---
> Changes in v3:
> - Add the Fixes tag for the commit that introduced the incorrect address.
> - Link to v2: https://patch.msgid.link/20260914-dell7441-touchscreen-v2-1-7f7224c0cce5@est.una.ac.cr
> 
> Changes in v2:
> - Drop the testing details from the commit message as requested.
> - Link to v1: https://patch.msgid.link/20260914-dell7441-touchscreen-v1-1-d79540ca5e81@est.una.ac.cr
> 
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konradybcio@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Laurentiu Tudor <laurentiu.tudor1@dell.com>
> To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> To: Val Packett <val@packett.cool>
> Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
> index 75e10d97c..0cf5716cd 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
> @@ -25,9 +25,10 @@ &gpu_zap_shader {
>  };
>  
>  &i2c8 {
> -	touchscreen@10 {
> +	/* LXST2021 */
> +	touchscreen@9 {
>  		compatible = "hid-over-i2c";
> -		reg = <0x10>;
> +		reg = <0x09>;
>  
>  		hid-descr-addr = <0x1>;
>  		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
> 
> ---
> base-commit: 704340f1cd0dcef829eb62f5b48ae95a2ce17bdf
> change-id: 20260914-dell7441-touchscreen-6b6201348ab6
> 
> Best regards,
> --  
> Avalon Vargas <avalon.vargas.centeno@est.una.ac.cr>
