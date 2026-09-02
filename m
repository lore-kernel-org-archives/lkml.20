Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28BB4A92EF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364215; cv=none; b=IT1h7vHw2C827EqUaIBkfpi0EUgBG9+w53WrIpgaABDVy4LE5/I/AqF2/Cvp6pgbtL2X5Nog4cHRBzL6hE+r50/t9OIGRP4m1kFkR0lENwb/dN9swWwpdCA8YioYDdLPSOibksO8N7XQePsghc6d5CSPsCnv6+CITjlU0stbNCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364215; c=relaxed/simple;
	bh=zSyQRSX/ch71m5kpxscJdEN70k7ztZ1cUr6oUxNbrTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HoHVOaHYkG/UlP1vmID9/drC7UfqAPLHkKOktETISntpKiU/uRPsxmTXIKdI1XUaCI+czxVg7d4koaskKtcgT8E0K/U46lw2XVrZ2SDwjb3smwoP88OrwYi5TBXe3+kb18i30+euh4ldDEpRX2Du6poE+4a0Fu0Do5SKDUl6PlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ghB5WyEb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P1T3AQ8B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ghB5WyEb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P1T3AQ8B"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FZUQO770115
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 15:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ZkntpVMR2CtKH4DeLKNH7qEJxMvwEUv5ynrM9u0XQw=; b=ghB5WyEbrgwoWyVW
	gnV8u9oMY9eXCGCAhl8yU7grN+3/nO/HcKf6hDOgG+N5tyLZ3mdd2ukesqiLet6M
	QWR8S7W9bBwFwkMJ4UA1cV99YUbLVXjDVcsbJx1555+J0louMojpIrkNAUjzxxfv
	y5KZULp6Ln1czahpc1RL1daLRFSdkvZVClgYPNJ7nhW/9wl459YaKzcjtU25Hbwj
	5sohs7qWHsqwux53Dy/eSbId5GMnixJ+YkbLjWCkgDjzcBGDblZl+jXUGRETZG3H
	s+NLO4URGrKxlMzPFdlmC1UDz/LxVxn/2Nbj6NXwuj31T74GMfpOkGKX0yLlGW2k
	1oI1tQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemja0jwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:50:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934a8cd3a8bso28719885a.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788364212; x=1788969012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ZkntpVMR2CtKH4DeLKNH7qEJxMvwEUv5ynrM9u0XQw=;
        b=P1T3AQ8BKvElnVTTjgSlqp+NvTUd+QU2Pj78EjTYn36baK2c8X7TfPdqar7PAYuA9W
         FFlgw5oD51G/cQH6lxTS/eyztoyWuxToBy3uAHjEAk32uBPi7+p+yU3zI0EyXD/TJQ/N
         ZPi37T/wl149/Nh0X5r/wG/ru2yRZzUaoA9EyQ+bBoPwIEgctx5sLyr79/YOsPVdgQY8
         EbZujC0dv9xP0tfgYXGHYaayTvEjXQ2uMClzVLpv5xWCduz/XBwwZDHUX8Fl3D95Lk6M
         8HE33C7N02xTEYv6KMGMQdHhCWbgO2esoW/SbH89BdAHH9aLDxRqjuG3Uvg5i69mDs9o
         XSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788364212; x=1788969012;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ZkntpVMR2CtKH4DeLKNH7qEJxMvwEUv5ynrM9u0XQw=;
        b=Vb9PkGLFPLZS+pKcALmfZEKjWH/4aX2WDww9dQn54IzBbLi/UClGPvRJfwPlVEWEvh
         dmTUEh0Gr14BN5xGEo6AFEO3JCsbKKBc2/L3v/LOonzWRUAlv7+LpAf89XR/wDwsE5Gx
         PCi5HrFaq9AowGtJVJ4evT1BILl1ikP39fXlLLazYVJgodiTPE0xoXTPqGDsOJuP8vWE
         ykQEYKiBJAyDbO+f9RZ5463kx3CAq/P+h+WtLBM8Wz2WjTkWbEL+NjJar3r0rjNrQSb6
         reQLGV3z+H/LOA5jKxzUuMc0R6N84t7zJzFunlNqTra8RLXYoE3sOwdnPEM6jLCJc5Ew
         Zafg==
X-Forwarded-Encrypted: i=1; AHgh+RpsJyIYKQqHkoFcIrWdczwVWP1CQauumgmg5c+fbp2ryjzTmK5WMcDCXFjEz9pnVUxtSu4Ob2YwDJRlNFI=@vger.kernel.org
X-Gm-Message-State: AFuF++kfewF9Dp18mvm+9y5/jTSmQe+8rK/r4035UR/5PjUV3x6HNUrC
	BglU27yzUIE5rYRnv/OcMuAxXWO5u1tBwzYv/DLVWLbKexWyR+THnciryrUVL6nWvg39ziBRWws
	+qzFBtmLskQZeHlwxhFCIL6KvjGW/g40TFtnZBqYcro7KxZ8RkIpAIUQhvgOM0C9TEI4=
X-Gm-Gg: AR+sD12fe4zbwkcNnmkKom9xfPgSqXKI4zhHPGGRZpnIJvogQniHsyu/rgF5qsEN8xT
	yi1bBfWxCz9rDuA14DALcZ25Tmp14ADYTo5vaoBUKn/V4okhCPXryO6c5t3df1RuvOnDlJriaIG
	l2TE0B6DflerF4qKJ56MOfBbzKQJQ4/TKDMRSgILawh4EJ+uqLwgZlLVZ1MVC6w7Mx4U1M+MvC1
	vWGVMVWzqX80J88b9gAS9VDzWZ3XrI7QCgMJuZST2PzbCauGMPB6EaBzZUWj/RiMXYbKSldXxL2
	xSBck4re5TbWzthwtTOFtk7mXmZIU8BJViQQLC4wjaRFP4R88uvxuWS6V36gNugHLoVlHtBhTDh
	jeZ2SgWZ8SY7wR+94X9XlhA==
X-Received: by 2002:a05:620a:2915:b0:939:8bc:8826 with SMTP id af79cd13be357-93960df998dmr431891685a.2.1788364211693;
        Wed, 02 Sep 2026 08:50:11 -0700 (PDT)
X-Received: by 2002:a05:620a:2915:b0:939:8bc:8826 with SMTP id af79cd13be357-93960df998dmr431885285a.2.1788364211128;
        Wed, 02 Sep 2026 08:50:11 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f8c7a0esm1336976a12.13.2026.09.02.08.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 08:50:10 -0700 (PDT)
Message-ID: <762f2294-27ff-44ab-b4b2-ffd415639928@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 17:50:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/16] arm64: dts: qcom: microsoft-romulus: Mark the EC
 reset gpio as reserved
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett
 <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
 <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-8-f4ab7e4bb75d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-8-f4ab7e4bb75d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2qGYVF9d7FYkkNP3oKohHWnxUHnZvSfC
X-Authority-Analysis: v=2.4 cv=FeAHAp+6 c=1 sm=1 tr=0 ts=6a9845b5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Wad5cFZijfJPr_ZhbakA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEzOSBTYWx0ZWRfX71laW/4l+zaI
 zc5LNwqNFFYFSl2JpgwJd1SsemJK7y3Tm5inMmnPv2AHo+gUJeNYuTIfzLVZKEQxyLfR1X+dwfD
 3n/H4XQ/8U6JEIwKbY6/mIZz0GQztMM=
X-Proofpoint-ORIG-GUID: 2qGYVF9d7FYkkNP3oKohHWnxUHnZvSfC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEzOSBTYWx0ZWRfX7tPzrxkBTjF/
 geALjrzG6JdGF8pjwsxsWaX4t8BKMZES/HSIYudaAvCvi0TBznfuPNWjytL2QEAFmTU6j3EQ0CG
 hBODbmWdmnwWV3I214lhfTCKXcgPoRufkcq0GfVLCJ0M2SC8mc0FPg360gU1tZ7N1Tbv2rtwdXz
 YruSVzMX9isqKLhbHf1T4HC99aG6OXz7isD5aTPjBhTHB+EfasbasC7iiqjzPbmrlZKUDlQsKue
 layXjdrDli83OZtoMNKv2HieqerDMBBdIb3zVkalhley903eEK3mfXt6D1HS/ULzs1TQ7ZPuUTG
 v/29eyTZSpU+h8LSs3cXljnHUHvDh1rg6PDgNUcuZXTXpb5VWEVanPbps4aIV6Yoy3GZD2RnOJQ
 X3eCkISQ61fx6QMJvn7yEoPRX0T4iLLyYRDGi+edg4fLYm3UuB9nLQ8U0V28KsN+w3dDuaAobkE
 kNYRjo1uNZZ3PIHaZXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020139

On 9/1/26 10:07 AM, Abel Vesa wrote:
> GPIO 65 from TLMM is used by the embedded controller as its reset line.
> 
> On some devices, toggling the embedded controller reset line makes the
> device not power up at all, unless the battery is unplugged.
> 
> So reserve it in order to prevent Linux from requesting or
> reconfiguring it.
> 
> Fixes: 09d77be56093 ("arm64: dts: qcom: Add support for X1-based Surface Laptop 7 devices")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
> index 13d0f09e0c2a..bc684c295b89 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
> @@ -1324,6 +1324,7 @@ wcd_tx: codec@0,3 {
>  
>  &tlmm {
>  	gpio-reserved-ranges = <44 4>, /* SPI (TPM) */
> +			       <65 1>, /* EC reset */
>  			       <238 1>; /* UFS Reset */

On this device, GPIO_65 is an enable pin for the touchpad regulator
(or something else that is a pre-requisite of the touchpad working)

Konrad
