Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794576242;
	b=kg+0/+xrwYsOo1YsWwl/ZG9SHQDJN/QAP1UKbSZSWeFuaqnvEeyWswT4qkiUZnI1ksWp
	 KBdUKWTqy0TVDTDk5RDEDP7x/J/qixgOu1Upx1pW297Lp+vQ5grvEN12Cal8WUOZO2nTD
	 n1riYOrH6tJcHTSA57VgS0Y5fPNIhxPAjCE+83Dpdo13fBs1lGHVlkJsR4aPzpF3c1aE3
	 7+ff/S9RDK46esTJK7/efmA+yzlLXp035uUanTXDKu1px2hdujF7rDR3OTF2NYXsxpGsU
	 f/03aRY11FFdt716j3wAXtliCmISwk8p+Q6rWiAEuTOpYclqd6GNWPAUgj7KZ//Fwhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576242;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MqQSzfa4X2q1eaOzzledzFWV9wSVN6Ii42fhCdUzIzM=;
	b=so/xsFNsZzfJXwgY/O21SFmU4adHatcl8QUjeO99NzHBw2fKg7Dy6krCyWB4qr6E3x4L
	 DgtMcWtVN9oUrumkidweMYk45V07kv/Ib1szPT5Rsi+fuXvO/6Fy4Ls/cs9WpHxO9FsCS
	 r4Fnr57YymRxy0EMhXUtlTVC1NxUHz7tgwhIaGDaSvkh7ROsKti68OoHM0cKsZC6JqFMC
	 DzjWYkPzTFV2LnF+C12w201zwwb1GZdJ1lEGtZG4me9ySnzxVia7ZUGnmEzT6HBrf+sgf
	 0o3NPO+nViqpLAon57iZnoJYlhJMxMLTLMGFUmek2Wa7SG8ontn2aXO5lFraGn/lMBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gSvbWoS8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KvFIjsnO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D0D606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4D0D606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gSvbWoS8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KvFIjsnO
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJbrP688756
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MqQSzfa4X2q1eaOzzledzFWV
	9wSVN6Ii42fhCdUzIzM=; b=gSvbWoS8Oi2eyjt1WvdU1+Ub6y4YmzlIfZRc4cpx
	vSBQLHqz06je8f6hf/DLqfnFtBa+nMNxMCPecB7FR0JUDu947qCjlVhKa/WSpDBC
	7yIhzd9tnr9WKP+7x60+T7leBlgoAHz4CefbIwsy56O0zQ7xbdTX8dZ0Wcl/Sgrq
	YI5tlCu/aFC/T7FWfMnjCdg9Kbl1ZPrf6JQNOR+au6O7ior4Ay37H6ZirhOvtbCK
	yITIPAHxWYt8gJufiakwd4+Ujk8VTMSgmlKB8n7O8TB7b41LqLNyQHLehwKPrNA9
	LPoK/oWvaggNs7E6tWSFESq/4XlRfIpZ28Hx63LpwbPGTw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufjgux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:24:00 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eacc615f73so1361970e0c.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794576240; x=1795181040; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MqQSzfa4X2q1eaOzzledzFWV9wSVN6Ii42fhCdUzIzM=;
        b=KvFIjsnOvrEeB6AzC4YGO647jDPM/TXoHx0DHxRQgweuBRwfxSLVkELgpT852a5yBf
         jVr3jKVAxCnJ7u3OI43buKefZ7FkqTD84kH67RSJ3SfW25LTw/NQKZBCRv2rGHIzMvWe
         9fBsqgDH6qX00S7bZQavA3e9gxFsElz2ZJxHBHsTM9QBNm0GOvNrvMlXN1c/8uVzavqz
         frDKBpqeY0PR+0MCXjrt4kk4/R1ZkKW06A/lGH0qyQrj4/j8ziL/7zY286CXOYVuCVfs
         /MmNDwVGNrRPqth8sMoL6tBYm8lH3GxGN8NVxGK7HsKIKvB8P1kNDuYV1TE450R0qviu
         I6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794576240; x=1795181040;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MqQSzfa4X2q1eaOzzledzFWV9wSVN6Ii42fhCdUzIzM=;
        b=O+VsuehUgcF7u5wuyJYAY+N46cyiiavD/lHdo5Xd0VoVU6oXynUn6n0it0JFKs/vEJ
         bC/noIjrugUA6Y9Eh/32lpkQBspJ3P9itA6OpmjBMpw7oSgHTr+dLTy2BF+SdwmSFl7p
         8+r9hhP6Kp7oAKfRa0GIHkgjxoD0f249Hpm+ymnBPN13C+Ue6dY7XYmGSQkMqHcL8nou
         RdrlYtoiV2CqQ9zm3sHoioVseRjutSTrWbUPHNPvloa9Lb6WmEpcn5mzzGFAyohDGRh+
         fpwBS6zT/25NlSt7F/m3kHEU7xlbBv5ZT468x+PD5pHgZ6m7leOXsxkmvy91v+sLqOUY
         T7CQ==
X-Forwarded-Encrypted: i=1; AL+hErFtHSaseClCufPPfquXu9cjQvnkgWTstxoy5toj2/kd3BguMTbop8a9NrvimzsPCC7edsVpYW1GqVuC6c8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8C4IMPVsj5FhC8idJkPnWOwfRzQV8xPElC+wq6la7e5mdPFFFF
	lJiI2fsqNPYmqdzaWcvs5JTvUvDv+EFK7IVzAxbCz1uaULIKmlC6Tz+dtnMoGx0R+KgOGryS9qL
	ynJcXJhz71Sz27NPQkILIxaDGAHbsZ+i361XJTnZahfcAoHwHmB4FEq0CyIwVxSOSpJ8=
X-Gm-Gg: AYBFou0nGZI70WAIfLylsW5rZBk+Gjp3M3BzY3rBGs3O68oTskldoRdhcboKSXc5s/p
	1QrLdP1XE9zmyc+Ms8KGXecDPUQ0bc6xKHLQgE/kuV1nqN8pyY5GdNN9yytRSgf1moI2vI+dOZM
	o3Bwmj4MKhBOY3xyiy5OvmPzVTCkAXwD+BeOGxAlDN8jf4dXXcVgzNAchauBWx5PA6GeS5WgbAu
	HJYXIYO9HtlQVwO9xWCmR1hYXUu6SQfHISQ1BlHkZWdxtB33N6L7Lavp1cDFxCJ6V4FejGLaMWj
	h45XcE9k9iiMgZoN7Xktndk2LS5iUgVGBDIKsnQwwmfxiN9SP62i2L/5kohU7y6PNundrUGlJy6
	hYuqrjXSZygxsMACNCAWz12MrDuxIkUo+0cjjJAZ9uKvhoo+VYgblqgOVsnjBYtsXwvIPSxuMmy
	igxGdrSkysLZ5KdHl5FsFTCHcfWIEoTQcx+FZYfy3ffepTG72I2ICUtAY5fTyVMQ==
X-Received: by 2002:a05:6122:c84:b0:5ec:d5e1:ee47 with SMTP id 71dfb90a1353d-5ee34a46714mr861532e0c.5.1794576239761;
        Fri, 13 Nov 2026 05:23:59 -0800 (PST)
X-Received: by 2002:a05:6122:c84:b0:5ec:d5e1:ee47 with SMTP id 71dfb90a1353d-5ee34a46714mr861522e0c.5.1794576239222;
        Fri, 13 Nov 2026 05:23:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712d9f7esm747180e87.12.2026.11.13.05.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:23:58 -0800 (PST)
Date: Fri, 13 Nov 2026 15:23:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add MSM8996 SAW3 syscon compatible
Message-ID: <wy654rwebljpfzii6liwqhebk4vuohlskhp66g45fwei6zwtj5@kc3k4enc6s6e>
References: <20261112-dtbs-qcom-v1-0-1978370c7cad@kernel.org>
 <20261112-dtbs-qcom-v1-2-1978370c7cad@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112-dtbs-qcom-v1-2-1978370c7cad@kernel.org>
X-Proofpoint-GUID: ZUg3h8fXlzgEZ4eMP6lZIe5z1NPURyFQ
X-Proofpoint-ORIG-GUID: ZUg3h8fXlzgEZ4eMP6lZIe5z1NPURyFQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1MyBTYWx0ZWRfX+ju6aqGNXVLM
 BQY0qKcf4D43v8lylzbPknEHVkkx9hteeIyQ4q1LJXnh5e2cVG9kkk4ZEJe2ePz0rWH8yoCes9i
 rHrNy+/WqgCcFpHqEBHLgyWenRqMdaG8GIFmGcZBw63SGYhK1xVW8AUXGnVWbexs6vKwTKPGecH
 6zyANtiq+KFmdFfo6wbcx4G513HuI2q5DiunVizgj3Ns6c3xjbviwEG5XRag1W0MPRcOFjAS/5q
 wJIYEZNdxb3Tza/MJwzlHqvzGXYRGYVbL+eU/wGdKX3WiNzTbMAFo/8YQucgBdg+zjgIEY3SQFM
 an4ezwrWoo7r8bFPMG5GgfGadRpcsVjBONwbML8BxjN9vOZbFqJpcva3kwjhfWQp3S02JdklUlR
 R6hGxZcyDlfzL9qAjiZPxszZgndp3EQLBKqq0AYqxZX140Bd0VLVktb6VAf0NWvrNqpkWEuz9UM
 Z1ZxdbJM+eoK0piJp6A==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af70f70 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=9GAwKLooXcChzj6GhEEA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1MyBTYWx0ZWRfX5QIK/vq50mYp
 5ZWdfMAUEHKvyTYok3IaowMaa7hRxiewVMjPNHsF13PmJ9ziW+lwODQrStSocE00vbj7loxadAT
 GkKdF+/ROd+akVVnp42GQLnjuOUYCtw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130053

On Thu, Nov 12, 2026 at 02:26:40PM -0600, Rob Herring (Arm) wrote:
> 'syscon' nodes are required to have specific compatibles. Add
> "qcom,msm8996-saw3" compatible to the MSM8996 SAW3 syscon block.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 1267c56d586b..4e8eb82420e2 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -3793,7 +3793,7 @@ frame@98c0000 {
>  		};
>  
>  		saw3: syscon@9a10000 {
> -			compatible = "syscon";
> +			compatible = "qcom,msm8996-saw3", "syscon";

Can we please follow the rest of the SAW devices? Rob, would you please
change it to qcom,msm8996-saw3-cbf or qcom,msm8996-saw3-v1.0-cbf? There
are other SAW blocks on MSM8996 platforms (which are being controlled by
the firmware on the devices we support upstream, phones with older
firmware might need to name and control them).

>  			reg = <0x09a10000 0x1000>;
>  		};
>  
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
