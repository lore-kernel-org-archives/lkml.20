Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199159;
	b=gRyOEdOXYrQyj6jzyQc/RV3SmhrDqNG+ptefOXd3lvRmpbSJW0LC3HmHkKsseMrS9CPi
	 vhATkQOBzqDZvaF06TSIy/fAbKMKIzg9l9hwnSdXvVeLx2et3b7weplXEglDXGnrLbGL3
	 ug5DekHbR/BtCZtJ9lWRrOGTALkYPd5GmqUEqjz0s8I4He2rYX/LmoMkf1PqV9wMpw3Pd
	 NsQXLwiHFZO8jf8DMyAnI8rnKlIznOdf2JtGcirwpGpOY4fcbz0pfrU/MyPsdRA+Q2ep6
	 RM+Id9X3kRLcfCvPUZUB3EToxZilF6PjdjbIUrVQCxVfedqkZ1O2MBY2La1Nk0nSJ8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199159;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MXocowpL+rI7Z95Ap+ST7tABMAuylPLkGjTudZ5eSL4=;
	b=Xuiz0IjabRNiEScMdMG+tGsrKcG4OtRbqfD7fkdo3V58+py83Hgh0ioOHLaSykJ0aQJD
	 ylwYlvRWqr7BCVM8AQdKXxu+TV1QQl5dgOYBsyFRr/6E31W6fhLYgGfNAA8yAr8G9ey2r
	 lmIEH4KIJIbS4jURgTUKrEjM+423jC+9txsTslodj2013erR9TkHsP2vNeQqBjBDgfZyo
	 Q3h+Vku9AtWwqgUsbJYQrek2kynSHRbZX84RSG/B7b1GMZjMGvXzVhv1A9whwgAXBh0dn
	 tpCFXwG3P82EEUC+X9lwHpYK6vvdO4IrM70bqooScr4DZhPjwhY2pS2XMmidsQvgg1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FCttlUdf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CEKZgUCn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5586606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:52:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5586606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FCttlUdf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CEKZgUCn
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SDIHEc3916341
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MXocowpL+rI7Z95Ap+ST7tABMAuylPLkGjTudZ5eSL4=; b=FCttlUdfFxPMKEgN
	fso/1YYi+kpRfncMw0Ru51+XqAYw5WA+vmk7jWl0H4lWSiDEx9gPwhYyGkzo/VBR
	je5eBbD2efYYLgCkp+RUfuDE0zBjKuq14I6BSeWEmqRq3C/FBhgl8LCl6ekyfac/
	comCXGmbe5th7frZoNV1AuZ4RvuVN2RUX3/cWiRyta2qNlFZgGD4pcDSkcWebvNt
	tdT2sDoxeA81C+sysW0cWBpEXDJlxqvhsuHBUYR6v/VnEcHxuyQfdJU2P9SxDU1h
	Gx/fb9nDrqnQxb80U+U8Khxp5UqrWuaCfcC59d7t+LzzNQEZwLnmw7LY/EPvP93x
	oknTQw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtngdqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:52:38 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eae4d7ebd2so101829e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793199157; x=1793803957; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MXocowpL+rI7Z95Ap+ST7tABMAuylPLkGjTudZ5eSL4=;
        b=CEKZgUCnMtpoKoKJnr1475ttjleaHNAvaXxpqmy/A0fgmr5srpPVATQ9CpkCPcW2EV
         udZyqryiqq3ptq7fI4p1ZGQuCmi1eJxe4x4EfssIIj14ST6nPZYrlLZ4xEpCwxJldCCw
         oOy1a9QFD4ubLuzytg6BIzyVA8HhpvVyEVaf/OjfYlKmpUuayDNAiBbERhZGOIogmRR5
         4a2azLpFsMK1m8GRdfll4cTQD4nWTxKZfYq2K6KAACimunMNSIwBC1Ive26tuV5B73os
         5gg59SX3jCTMJX76H3Mj5ONnBVIfPSYbtTyzNNxYR9A6EuhRMgB7JaSmFQ67vQShBdba
         qtSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793199157; x=1793803957;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MXocowpL+rI7Z95Ap+ST7tABMAuylPLkGjTudZ5eSL4=;
        b=R2GsQuv+l0Xcy1Kp6djguv4/t2xhldtO1wCkfbDuaVqhWguZATi/Rm4xKvoBNW2wXG
         i1YlRCYSWZWOTj1WuJUz2sJo12/+dROs/4BbmN0sVYPR9A2jqWjBz9JP1FBx/PGqCRXF
         e91VuDSLIt9vSRrY6qRKPZrtMR9sxrzKEhNNYpLmVnZGTurX+po1EPymCPR9MVGDNsvD
         2J2EPNZOOgsAnOrakiOKER6tbd50GCBvQAf2gDOU7AkCFfKevFWsfuDmRA4hr7EcFxHB
         cPjGTnp8eVb09xH6KdmXI9wuzaQvZtCg0vWPvRWYpF0dTghBeVcJeFQt6iP0eilhDI9Y
         2NHg==
X-Forwarded-Encrypted: i=1; AKwUvBysv70XXir68fsspz8o7NALMthhUnEMzZ4K/JP7HInBgfL4naAdAplKUZGHxjujmXv1/t/MvycCFC/g0cM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNra8djTnRjGriZXzgG2+nseHjq9ehonHKe6jQ/eQ7a77heIZF
	pf3MroTRtuEurgD4OTpHRBGmLkva6ovxxzAEGwI4iOZgftgHVIkIyqLoh+Xe8HaGTETMkvCJhKs
	we3UMs2qDtq8guT8d3UMrfJbXwOhW7yknjAAwY7TuRLyBj48dAtQiJqq52NObK7XStOnKhoxhG0
	w=
X-Gm-Gg: AYBFou1unJ2b8ZCospkSzykQ3lXFcOu2ibGVU9SR8i+zv98KlkyH8ZS+pew3VFvAAxG
	VVadrtI420clshuNHxK4DJdNRF+Qg2LHGQJZMmu9PfE1x3eU7YnVrLjFqnsUc8vzns0l1y1XyvU
	o+NvhEd5pxhbQgT8/GaJiQEBPFttqPYOWlfv7gZvQT3fkVU4WGlEkeTD3ymag+jfSpY/kcN4Sgb
	pVULgXSjhyppRtg9zVkoptNXNVzaQR4Z7m4gAcCsBnbLWdv4jn2npUzV12w0IFP+ScNX3cnZrZ2
	NSeQCej14a6vzQGrq2nJv8bLjuzPoa2nQoipwg6Eua4ePKAQxloo/YpMfW7XWq8gUiZBQEFX3tY
	XIE9ROYrwnWJLhtwCrnb8i7qiXLwna0KTnFKowSABfnPUwhLGiHMkT1NY4Q/Vq4PCcfcW7jY=
X-Received: by 2002:a05:6122:650b:b0:5ea:e18b:16a8 with SMTP id 71dfb90a1353d-5ec4c8fef9bmr1270566e0c.0.1793199157055;
        Wed, 28 Oct 2026 07:52:37 -0700 (PDT)
X-Received: by 2002:a05:6122:650b:b0:5ea:e18b:16a8 with SMTP id 71dfb90a1353d-5ec4c8fef9bmr1270544e0c.0.1793199156609;
        Wed, 28 Oct 2026 07:52:36 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70993e89sm31881071fa.9.2026.10.28.07.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 07:52:35 -0700 (PDT)
Message-ID: <fe2c319b-223a-4178-8ac9-33a3a5fc099f@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:52:32 +0100
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
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: Add refgen supplies for PCIe PHY
 on Glymur and Mahua boards
To: Qiang Yu <qiang.yu@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261013-phy_refgen_1012-v3-0-f28305289499@oss.qualcomm.com>
 <20261013-phy_refgen_1012-v3-3-f28305289499@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013-phy_refgen_1012-v3-3-f28305289499@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WL1EnfJgd24CeIOD7s1LwD776JNYU5s9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OSBTYWx0ZWRfX4s4a6svs8GFq
 qgz/1pnLOkqJMFA9EcOBBG9UP2D4wgi1MsYVTP9RpDv/h5iCE/zpxwzJrPSDGC9fQwRCV4Z4WYZ
 veFSaFQYU3u7WrPzNH3hCH2J5UhqI6r1Uv0kJfK54zF6BubJhp8ZXrk/SDV5TGDAAMJBcBoSnT8
 y37owEyEDd3XWAPdvApfXWTJ4mKwmRCIIRNL+otyDCXYY+hO7aNlC00ObZXyv5jwvKVsbSXmP06
 hzYGwy2FlPNyBWkPyvcNmnjgfYoFbwn2EI/o2bTlvcLfGaN+a3uLIsUvMcuoCG+SZCL+9SL6Hq4
 abGaTpir7Ce/ZR5RineRPCBFnxwiyocPnZRUFUxxDGgBTLroHjsJCpafneVQxEcaBWdfHrTd0MI
 C2ILdQOb0Q2h7JRGmNMCbvPmvlxIHJ5qC5Gfx0KouNXjyK8/R1OijFwEX7CaGhD1/w6XBx13FEe
 miITgKJT3raiHWbs+JQ==
X-Authority-Analysis: v=2.4 cv=c/A+0h9l c=1 sm=1 tr=0 ts=6ae20c36 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1jgiRTNCPZbMTgtKrOUA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: WL1EnfJgd24CeIOD7s1LwD776JNYU5s9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OSBTYWx0ZWRfXz0oUzZX7fQKI
 9Ntz2gCZgsaV9ifY4nUz0liNXz0wV/65T5C8xZNWiNb20lTbRHE7jsAg9X6RN8OU6pgJJO8EbAD
 lK5PUmqOxXy9XlYfV5KVMvtP8GsVjNM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280059

On 10/13/26 12:16 PM, Qiang Yu wrote:
> The PCIe PHYs on Glymur and Mahua require a reference voltage provided by
> REFGEN, which in turn is powered by two LDOs.
> 
> Since there is no devicetree node for REFGEN, add the vdda-refgen0p9 and
> vdda-refgen1p2 supplies for each PCIe PHY node.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
