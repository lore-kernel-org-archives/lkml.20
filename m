Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE124A4403
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820357; cv=none; b=pOmcYj/0xbbaoIuQnfBMO4bw2dBbIo9TCP1iEoECwuNaVJZdzeQzj60f55Dwk/xIi2PLx074AKaiBosOKhgkAdXa8yn+2L5ZlSl3aQ1F/leFyj8uiQIXmtN7Kd/W39BFDYg8bABWcCpXZbw2ma7AHfXzEndrwa9rTkOgLWZlYvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820357; c=relaxed/simple;
	bh=BAVulmbfeB4WFKNjWlELp4bbnw2TudrBhLztaBT565I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n3ghw70+BlcfSGMAwoWm9x4fxoLQtWzPXWFk6KQkQaZq9AsQYw/bITDWMo0WPxGILnae16zYnw3b1YTcX6IJuzMn/74eA9HyYmeVg+MVv9ZFHIJNH9PfRgIaY2z9ELBLfdOId5PykhAgBcYOVcFwY1Gv/Ac6lfnlf00mY1WOveM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CGaoAsxS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bo12ahuf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CGaoAsxS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bo12ahuf"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFev451895521
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xnkCBBW17Ri5LY3kFYxYgET+/g7jVRj8ss0xDPrWsNw=; b=CGaoAsxSEbglfnaj
	MvnlCyS8J9tjH0a3InFETOfmOgpU0XfJ9rD0Uf44p6mfYiq90Jf8VmsDDVBiHCR1
	CFwogwqjpj7yiezyhfj11VrggL+g1N0dfjJ9/xFA4hwG+DEAZlOx+9uKYiixISDr
	vJCxhRr6fWTEHRr074y9Msr/D6+WjvAsKSVR4ZvUJuDIqGa+paftMElC/k5SEoUl
	WIADcN1ui+Xulzq6MYZmUY3haGftUj50XSyNxubELihm7rwEqgqgTiD0Ym8EVXYv
	2yZcps/BUqP5Qsyhv3lvFjxTd15V0Y7DL4qx7gmNqwns2uqBmEjKQW3b1GjAr+Pf
	DAKQzw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8v7kswpb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:52:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e629c7b16so27706285a.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791820353; x=1792425153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xnkCBBW17Ri5LY3kFYxYgET+/g7jVRj8ss0xDPrWsNw=;
        b=bo12ahufEc1DPn98dV+qdnVJU7Z9LxUdnkregrGX0WX0IfBSIdPh2ekw5ZV4onkKrg
         HGbU3SFblCyZhnmc2iqzekrCwlyrq1BBRMmnFm6FGbJjTnKg6GLaCycdOua8Pd0gHRfQ
         1xAgs8/tvHvac5WpUAwhuy5j2as9Zc9FxlcsNZjFrvxzRFLZF71h0o/rcGXTrqJ5mv0M
         byj9JcFqmIHdmS/dm/PonHoNgZT9/Wzzb/yX5MbkfhRMj2/Q+t8AASzF/qiQvrHpy2nc
         /Q+oOpkeuajTdAodzMO4qaeGy5MkUuTpOXcSV0Gc/jTX6FkPwevg8ETSoiFcYSCbyFRE
         2RRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820353; x=1792425153;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xnkCBBW17Ri5LY3kFYxYgET+/g7jVRj8ss0xDPrWsNw=;
        b=JVL+foYQbOyeugBGp9PYMZ1MljYPRTAzWn8LzJsdcIbdssVLx00H3SmzeWemKEwMBp
         VGNFWoTtQkfiJA8y8w6YMw4sfPMqm6O3sO100h93WcnlojFinRvIgp+rMUnbH97FI7bV
         TcqyH2wDAt3DQBp4lnoNswa45RHNzpEeh8qwSx+mPusdIAVxxOLFaBUtBY/R2Hz3Bi63
         tJ8bkDjmT8omHrimFg3NHozMDiFN8OJzjiqA2T6xSI0PraAKdJVBaVg0qVdu5aQYDUk0
         VN+Dqb5bCdHecceyyT7W40/yvRS6XPl7/jMZWCnMq/rtyFAaf//oAvvheJxmClBxqXIQ
         iN+A==
X-Forwarded-Encrypted: i=1; AKwUvByhFoJfVEM54fuJuoid2ULnI0SSaD9//7PDWm8phJtwXYbcM7/+j9YceZpeLS5Ee4ZgF4aGnqrTyKGzoyA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrarvMvnz1in20k0gJRxk7t1DS40qv4aXjxx77zbjJ3WmrRn9C
	CI3Wr7hHn5BadA5NjM+d5Vq0N6grOBdDDaaz/ZfKGsTIBbRw2VFTaBKgXONPSVoDm21+1MH+CaS
	rXgwXE4LkU3FRaqGgyVh7hwUxJO6OpXHa9yMxNwGPi52IQCnRwczsmVT0X3Cei1UaaOFG1MrfjT
	k=
X-Gm-Gg: AYBFou2hTuLrO1jGuDq1t8bX63ai0yNUZ4FAFI4UDG3JFROIZDLwbWlRSE+Bhs4Mjaf
	P1V9Vfy1w3Ia3AbH5px0OXO4LMjLTlA2c3E3uJuzC/k1P6s1siJva+tHvxB2kpPqNrrbyc6p+fD
	KDuXahh+Nha+60cloTlq3I/QwCNxcpaUSkTcTGCmpWy0Rr419dWE+W5F1yNknP0DJAJwTWltPLp
	fAoWny39zeZyi6hdBtgUmn2/6phBDrlgD+USEVCJXdf6dV0tkiB1r/m3JZGMR6pV2hFIIPHgF53
	k9hhtKVIJqQI/LkwvLb+GQ+IRVXrV5QklR0dlg+CTFjpTG0WHirHxGeMnl98+pYa8qis+fmSF0Y
	rNBhNrQnASSB77m9NqcTZZQ==
X-Received: by 2002:a05:620a:72cf:10b0:93e:e24b:32e3 with SMTP id af79cd13be357-93ee24c5086mr447408185a.0.1791820353266;
        Mon, 12 Oct 2026 08:52:33 -0700 (PDT)
X-Received: by 2002:a05:620a:72cf:10b0:93e:e24b:32e3 with SMTP id af79cd13be357-93ee24c5086mr447405485a.0.1791820352604;
        Mon, 12 Oct 2026 08:52:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3bbc9sm480313466b.20.2026.10.12.08.52.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:52:31 -0700 (PDT)
Message-ID: <f2bde571-89d2-40c7-9ff6-c23a56b3dacd@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:52:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/38] arm: dts: qcom: apq8064: Align multiple property
 data
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <c1886d808858a195ec78425b293b2ccd3756cfaf.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c1886d808858a195ec78425b293b2ccd3756cfaf.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfXxuXJzZrBtkmh
 mo5FKeU+5AFNDNyzOmBJIsJL+ZumtzF35cdvPJBfl3tduj4i4iYRnqI9h8bMpSnSQLBxO/mb8nl
 vP/SRof7i8ty259DHiVRgaV4G5CIzBZ+1xHZ4A5ZlwKLtLiNnwwhv85BngzO1bc2VWGxARNe5EH
 H8PthE3PQkT//xKqcstwx46d0X4o+dbJCMJPV2BnFqWzaUx6jATqqLDTYtMotaesbfScGzvA/AB
 mCaqf8bxC9/T47y7bxZkNOxjVIkw1b1pkHAlCjl11bzkWt2aKHSC945Vtriwgpi6HITq8HzJ2ac
 dyJHy3p3yNj1zT/r9SpyT25mZCoX7XLf/zpkseKjMCd8VyJKRu57Q1dNs47gYHJRnFhtefMwdvy
 IfKXUBFV5k2udEjK8Sl7fP4+m5ZqBToXtkMrHJdvir8OG12O5XLS+jOTLKIsOGLbO/N3AwMyZP0
 xvvG6RYYiXhtrWSJHlQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfXwFUwOMWXbv8S
 iKwHeustOoaCcbpXMuMEwCb71H7z4QpDsER1u4TifwrC/w8+oyHJXPdiW12HMeX38Tdpk2gBKFr
 EjKeQXJWtHIw8EFkBvsH96EHz+IJoUM=
X-Authority-Analysis: v=2.4 cv=VOtIDNPX c=1 sm=1 tr=0 ts=6acd0242 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=3-RhneuVAAAA:8 a=aOV02CK0EVwC807Rud8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-GUID: XlWF6uoaL1LmWxYnOecVgb3bjpa1bORg
X-Proofpoint-ORIG-GUID: XlWF6uoaL1LmWxYnOecVgb3bjpa1bORg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120063

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> Multiple property data on a newline should be aligned with the first one
> or properly indented with tabs. Found/fixed with dtfmt (Devicetree
> Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 98 ++++++++++++------------
>  1 file changed, 49 insertions(+), 49 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> index 150b5670e13b3..565f98c00b3fb 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> @@ -89,7 +89,7 @@ l2: l2-cache {
>  		idle-states {
>  			cpu_spc: cpu-spc {
>  				compatible = "qcom,idle-state-spc",
> -						"arm,idle-state";
> +					     "arm,idle-state";
>  				entry-latency-us = <400>;
>  				exit-latency-us = <900>;
>  				min-residency-us = <3000>;
> @@ -1036,15 +1036,15 @@ gpu: gpu@4300000 {
>  			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "kgsl_3d0_irq";
>  			clock-names =
> -			    "core",
> -			    "iface",
> -			    "mem",
> -			    "mem_iface";
> +				"core",

As before, let's add a rule to prohibit `property =\n`

Konrad
