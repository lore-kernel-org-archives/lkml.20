Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794796700;
	b=vsoZh8Mx03tVF+mBi7/7BIkYiKT6CnZtn2w2FgtBYa3MHwREFHi0w+u1MNwcevIn0HbI
	 W55dFHIlOvHJ3pGyo6HhZ1yMRiTEgmoslADymZyenb9t3EuPA568KK8bpj4bNSpfLIgXr
	 Ix8PB/bPblIguotiylB9jx2aL+qrSEhPgXPFNLcHX9XceU5VlQLm2hHl8V607jaG16C+r
	 ZX2C32Mz58tpLpo+ExBnLKLMNDRphLzdSmKmKl/FHQI23O2NhqfkJhrJRVJnsnyb/sTsY
	 523ImGqLM2yX/Rbrj9kGi/NinTDTz+TniSmXm4+gZ59RL0EG9sLkMl4KjvFigXPwzeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796700;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TPjyQUk+vMBvodq2mBZyZe6FH5D4rzEe4fEpLwevuWA=;
	b=SQ2ERt9xRztvck0a7wnxtZUOLDPNlOIX5GYtL5D1gvmDi+nFdhMZxkIBog/TxUrMONTm
	 yRUrWuT6rhVnoSgcU3DD5IfLgAeLP91aXKf9GG6IUCN6IKd54HdVZawx1R/YNiA4V7ypF
	 JiMh/P1G/I6kIO3bKrJSgLuTRFFVbS9Lc/sLy0NgzON8EeyLdClzjn+wtzFIM9cikP5XW
	 Sl7GIoLuD1WOMxMOs/TLJJj347cYNW9EcDvB2DDtO5gVTbbpK+GDsvWGy7KYV4I/oXJDK
	 W/AnXfSLdHifQQdoOeFkfQVoXJEk/fRLxefguKQK6cinxQ62SPSAmWYs54PNxqOcoMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WJrJOScF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L2MJ+PvC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2426D606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2426D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WJrJOScF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L2MJ+PvC
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1L26v3787310
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TPjyQUk+vMBvodq2mBZyZe6FH5D4rzEe4fEpLwevuWA=; b=WJrJOScFWbmhsj6y
	AXFvn9SBm43IzYWGZMwIAmxaGxjIXxdlt9wkxfaTSbQ7E07Q0BxLROlUAfuguA80
	EmRTzEg/vKjuBQwh6zpA3hekDlZWsN4v97sul0/C/d3k+hiHtr6ZpjPb5W7rnR9h
	cnJr2qP0IUs0zf5SZEytlzqfqrfUp5LKlRQXplO16NMFIyoV72mI7tBcyJ+9Kzsh
	XCez1LSHjOKwOQr/TscCiudCBtJdt903ne639VG+gBHMZ4Z2RAuB4fmBINzLHpvQ
	ivVLHIJWMnuTCc+nVuR4SNNNoosywSJYae8TVupwaAtor8SM22VnlQjRgUUtsf+1
	OH+qUw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhkwcbes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:38:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9493e89d4f9so556870785a.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794796698; x=1795401498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TPjyQUk+vMBvodq2mBZyZe6FH5D4rzEe4fEpLwevuWA=;
        b=L2MJ+PvCZq5kFb18qBpX7JTf0iQ8hVlYPEUP3yAq2FqFXfkLwDPiclDCRp6/QN6zhv
         ZEUK0xDimgat9/EIfD91bkycRHWIboTNAspoit94Oyrb3aWc3UTfVXQvZ623C4ywwLCr
         Q+ESN0ac8BwAafWDY6zl+TUr0PZ3Bz7FcGjs2yi6WnYGyzvMi0OMa3K3XP8SCv2MctlS
         yyGmsPxn3HBJVR90AvfjECN9HgIooxR2mqDHg1JORqCX3z3s1RNFP8XTNjIr1Bkvqk4z
         B3c4IXsVnuHIMiU2K256jDt6IRChLUxFFD0Edjxi/RHx3SnNN3oVsh60CY9jfpXzfD/J
         VL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794796698; x=1795401498;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TPjyQUk+vMBvodq2mBZyZe6FH5D4rzEe4fEpLwevuWA=;
        b=VkWJj+c3022TAZPQrT3lZeNQX7Oyi5UJS3AzppCrHqScldn80/N6O4Ij93xSaiUQxG
         bGkIOnAMZNez8UMT2OhagIZ1W/1KyfJ1AZ7wTz6c8g4RyRzjHjR1rZhPNWZ+rkydq25I
         NlMMhS/f9eyxvIYrH3jOFKnrALy5bhOJiYVGBaXkOQrJCfiRwpa7lWLlX+fmTL6/kn1y
         jxwN1TMcBNydnBQsQ+L+yYhp4B7UKsJUW/Qmbn3D/5bCBE2L9D0P/fJ8QHBvqxpK6f2v
         RFUYtt+4Edua3dyyP5uUfLK/4oxZUHRCQvJCsLnoeappuk7fIEupWaGuuoAZz18B6ikG
         UmJQ==
X-Forwarded-Encrypted: i=1; AL+hErEIQy8DCWPZ0/JVDFlWjHxvyA6MfbWuHVcPkCPDGl6gdabRO//TC3iCXM4BcSk67v1edWSYW8qHp6d4jes=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XdGaTeATVxb0pP0HZCV/oTDgG4DPs699M1qhfPrnGfiujpqk4
	cW5FYVCKp52++OWVkYmMf45Mr+4yJ3yNoBzqf/nevpFQBMgXojDOO6qyYHBSVbL8cGzk8kObliQ
	nbDQLAhRJc0YJx+K6Y4QJk1EWLe31PLwAjdRdjWkxl8RZzqGWH1gP14zsfvcgtLFWDxY=
X-Gm-Gg: AYBFou3llCuqtrCWKMm4zLofRw6veGqDOPHnuGD6NJDeB9K/lxjHgqvTDNa6dGatbWR
	fzGuaEwe782CbYBQR0OTh56EEhVZbnhEvo6iN7D9mpPm0rn83Gxt096f6JXre4vcxxE2TAdO6lh
	THtaD69mcI0IkxxGV4RUaJt5P14DFI2aOhBYYyP6tfoGPBTmXaTDA0/DMTsLn2Kb+UoNjG+5jE1
	jwnaDr+GLIxA9CFT3VIbubSZB0pUnvKYUppdky6KS5+5CgiOLXI6bluKicGZFZ7hmolaxiQGhIC
	xeDt54La+QsTl2B9ST5FYc0IJ7D9BWMWb1UfofZgvDN/pGwNeQNmyYTFkmv7bL4QBVHRz3C8ZGm
	cn/4zrNzkd5FKcWWHkx+gmTL7ZCMwuCFVvSLPH5v0Rc8XOcsFrNw/0w+hnDo9NUt+RftzTvyYBh
	J84JO5/oH5iaLs+xSf8UM2P62BEYChiJ+3Tw==
X-Received: by 2002:a05:620a:370e:b0:949:7502:6a8 with SMTP id af79cd13be357-94975020921mr471817985a.56.1794796698210;
        Sun, 15 Nov 2026 18:38:18 -0800 (PST)
X-Received: by 2002:a05:620a:370e:b0:949:7502:6a8 with SMTP id af79cd13be357-94975020921mr471814785a.56.1794796697746;
        Sun, 15 Nov 2026 18:38:17 -0800 (PST)
Received: from [10.38.240.54] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9497a4f1bccsm186560185a.36.2026.11.15.18.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 18:38:16 -0800 (PST)
Message-ID: <d784b5e9-af98-40a2-8670-6c12208983dd@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 10:38:07 +0800
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
Subject: Re: [PATCH v7 01/23] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 SM8750 CSI2 PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-1-8ff2a11835f6@oss.qualcomm.com>
 <20261114-voracious-capable-guan-99cacf@quoll>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20261114-voracious-capable-guan-99cacf@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAxMCBTYWx0ZWRfX5kzvi7qgRFlo
 wodo2tYKohbqZ0l7eqkVSZSaHaPnG+2ZwOQ+zyLym8uD4TeS2+O3xh9QV/QADVasw69Pvj3JjsV
 PUrOHFTTJKhqFYdffj9FDihyK54sR/XYU3jQsHw4sCpGNUxlmSIzlCFIwRpFaRNRfKcg92qGj8b
 NTcMVBGBjo8R8rJ0Te5mELnh6wUX5GP5yjxZ1j05awLNevPRb3l52m9t9IsPMl1Bp5ojP6KjSXs
 aDeHUxQuQv+mq1roqYR4mBUv5vr1nMcK8lTGtc4KBCDpaYDAjsgJtoxZ2gfemn9Kxrbj4czoz4p
 jd0ZdKfCIvCl1LlXQnSDbCcD9MFWV5CFKYpwIIFarCAWbP/ECShc9ifSiE0NzmLBDyQV5/rVD4n
 p89Njn43irPWs96HOFHeo4gUG9cHEwDCfFeHY9eH8EZ/YtsZJxQTbDpw9WCqsCsk+MkBYs9vKHr
 2CKDg2nqwnOX3NVarMQ==
X-Authority-Analysis: v=2.4 cv=YPYKWhGx c=1 sm=1 tr=0 ts=6afa6c9b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=4xkCrKK1q9XhPcYNJToA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: VTVlDHiNz7L2tfVxVKspTZBM383w4XqF
X-Proofpoint-ORIG-GUID: VTVlDHiNz7L2tfVxVKspTZBM383w4XqF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAxMCBTYWx0ZWRfX2vgZEhL9Qoyh
 7O9kf871m97K5z5bhmut2e/eww99qozXjNWTEppgjYPhKIp3846iPt0+nWdTdmgoCZeey2HRJpM
 3lcM/kEdMxZWlhEcyFVrFNiS7FttF/8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160010

Hi Krzysztof,

On 11/15/2026 2:11 AM, Krzysztof Kozlowski wrote:
> On Sat, Nov 14, 2026 at 07:29:18PM +0800, Wenmeng Liu wrote:
>> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>
>> The SM8750 camera subsystem has six CSI2 D-PHY blocks. Describe them
>> with a standalone "qcom,sm8750-csi2-phy" compatible, so the CAMSS
>> binding can instantiate the CSIPHY nodes as separate phy devices.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 1 +
>>   1 file changed, 1 insertion(+)
> 
> Does not apply, so should be squashed with dependency. Why having it
> separate?

Since Bryan is about to apply the dependent bindings and driver changes, 
I kept them separate rather than squashing them into this series. I'll 
rebase this series once the KNP series has been applied.

Thanks,
Wenmeng

> 
> Best regards,
> Krzysztof



