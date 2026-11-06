Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977600;
	b=qkHxUY2+Ic0hDdfp9xIyspX16lUizuVnXwpLT/dJFGJCPGoAwJ8d5gM1dEO9d8KFIsBB
	 CrWn2nHy6R3ERCTCzrbYkOHLRwjzZ/xl5UzEngXNeq/yx4fyXQe/IJIjkGfCc5ucYYik2
	 ns4pqwBakJwN3I07CqavWfZmz4V2I5M6yF63ad2s7HcAlk8AnzNe86laE6FMpHHxP+PRD
	 8tunCL/GS0vHf/aZiyUZ4gqVitpVgi8UaNe64pMk+noegxoh0cycs/lGk6TXpeIB+QtG4
	 eNOWomgfK+diCCkYGHIOxZu6nYxqXt1GWzDMYrEflmHWX0Bzr8+zUbsZ0a4O5GUim3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977600;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=99WHrn39uhF8MOZuOAhU6ApGYxS1ibLGpRDYrU16dFs=;
	b=rlqU3H93u3oKITJFn10Kzf4sIl/k4axCSKd64nf9KRUniYXT0BlO8pfsN0q22pMrUs3D
	 WagxhhoM9OeEv0NwG//YqagIEMzPD1m0c3dc/y8Mck2qyHWEyxqx3qJ2H3TvZJc5mz7Fm
	 9aVUIV9ThJI3793LWE+VdURtBHEQK/90R9oZfvA5kqtmQDBFEZeR55IB1JHSNSgYAYoNZ
	 rmLn98pzuNWvcmWkYFoXIFh2X8nZdK4S+Pwtw7sRcLNT1Swn4PpBB8s/O3512WbaelaeY
	 yuyGp/zv8HNfS6aZn2LAoCEjqXrAU3bx2SIOM4O1BvOTy2knmmN9CTkum5vKey8S+CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="b0vOnQ/5";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XliKU0TK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B200606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:06:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B200606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b0vOnQ/5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XliKU0TK
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Exx0I044166
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 15:06:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	99WHrn39uhF8MOZuOAhU6ApGYxS1ibLGpRDYrU16dFs=; b=b0vOnQ/5IcPAh21P
	ESwufSWkqa2WlHgnCQvEueVm1DX7NhE1muU2tZuVygmfXeGKyHBoVldgukjvcyNA
	wHJhrGNyjOHwbp8v69n17tWUV7cpBxEh038PxRRAbHIV8q4a3sfKC968dFUbZ4nn
	UIhuW9YyJCjbfJIELSgP3F1w0Dg37TstYuzGEGDM40M6IJQjAlkJI7JCaN0Vn7B/
	EMMZfWkF0yt/Hcdqdu2RxVM3ryCPFthugstsCxni4jArW+Ci7CDxUa5q9AvIGfyf
	azg59TGzclW+ENIOPDNd91yo8o91WxoaSTEOMQ1DR/FJGosTbatnFAjLmMfjrafo
	wKjYIQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa38jj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:06:38 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ecbb3b4696so34396e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793977593; x=1794582393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=99WHrn39uhF8MOZuOAhU6ApGYxS1ibLGpRDYrU16dFs=;
        b=XliKU0TKFQcUMOZm7HB0zOlU9QpTng+zHK5EJXKHPLYCNxrdqvRy3zizzAvSWCoknr
         /jfy5Tybkfj9ba4OYHWeLna+Iyp0nUJih5Y4Xzk73L60EBmMtNvYjPjwK8DFWi/qVVRR
         W6uQBDFnn4XcSdD1Bvff2Trn4cK8pGZ2v20+3oHL5QoBwmNORnr3SgIr6umieC5lXqLw
         l0aloE9vcJq1ox5cZyPRkIOUdgi+OpnoqMGr1FvAdD+k9gabmWLefrIMVXJKXIB4y5X8
         LPh/BQgeBCRPS4aOZy9plSsdRdn0ri9iRDxqtkX/x1infvJalRYzDRDoBJd25Cz5E4z+
         l7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977593; x=1794582393;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=99WHrn39uhF8MOZuOAhU6ApGYxS1ibLGpRDYrU16dFs=;
        b=FPuw73wRHTQiyMoK2zbjX2Okt9ZoNWTBhwd4kRouwmS7vFfvzpVTuK4SsHMp365KRm
         7qKD8oqkJBEclTSZH18mmzBuO1a4Hqe/ED4klwmP6lSO7m9nkLJJY8sMvtfdU06tvils
         6xb0+zqBzUmD1vIe7E5f1oR1SzIB/e0sxr+aFAB4SfbBOkMwIcMxg7Ea+jW7e4r0CFjq
         WXEZhkrQjAr4MVKtOm2CL+3xGOpjbRkwAoYiG9FT4hQ/YBCp0bT9zWHERiHFpbW7EYaY
         WMT8zuy/lluMbBtXb2WPkA8FPx3MfC9EDGgUjcuZb3cgxcXOE5Gxg4Pls9evrneBjmsg
         qbKQ==
X-Forwarded-Encrypted: i=1; AKwUvBywpGdqdfH4xc92EKp0b6Ptnchz6dvp5JO57yloZ8bza0vpwMD5BqhRThc4iwTLdsuxCKg1kSTXphmao/g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KZycAUPE8J7wXXxagifkhvfz65b9QQfy9QMMqbtZ710J/U8oz
	ANxkIZsnb3rFIyQeW12s7hLZlpebOpDZKKteVgWTrYHD+OL5eaK/PYSgtB8EVE0zvMuhIa9tYls
	RQ5dCj/twQJc+QAcS+sHBX5Cws2dHP+j8xZKUSkOIo9t/VqC5w/aIN0S5+EcOBk6nxLmPTJvIq5
	Y=
X-Gm-Gg: AYBFou01hpq+iUle9M8y3C8wLQ9NPwXBb4a7pM0P2H2/S58zY4vmrJGtnvzCkzaDAYl
	TMC7fio7rkJumaDA2brZGbuvoMpAJ1J+xp7K2HCYK239RVKVBsh5ZWZQFGv/vVYP+3d9f7FKhzH
	RP8Swt77b9GPUYpHsupXuvAfunB4R2sECdkF1B4OEXdpXksJaJVbJoWHSrfw6vQTqw9ZxA6sWZz
	wwRghJPMmYuq0R77Txnq6rQ+QGY2PyFy04iphQybfdlB1e42gKa8G12IBa3IJoHFYYT9amOMVKs
	3iHD4YrlwuC/9fdiMsPwFpc2sX5QTvNYTx0hQdHyWeihkkzBtfJIJX9UnJ/CpYdwiOIcDJzlvIr
	KSpKq25O4PbJmV4Fu+7pPHIhT3KfuFnL8EVolSTkZewULkRRgvWyAYvHBHH55pgpRtkg4vA==
X-Received: by 2002:a05:6123:4007:b0:5ec:2394:ef94 with SMTP id 71dfb90a1353d-5ecc41a5a8dmr1177100e0c.0.1793977593044;
        Fri, 06 Nov 2026 07:06:33 -0800 (PST)
X-Received: by 2002:a05:6123:4007:b0:5ec:2394:ef94 with SMTP id 71dfb90a1353d-5ecc41a5a8dmr1177044e0c.0.1793977592530;
        Fri, 06 Nov 2026 07:06:32 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d487be8aasm36689066b.15.2026.11.06.07.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 07:06:31 -0800 (PST)
Message-ID: <23b5c705-cd55-4c0c-9c95-c61afb286416@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 16:06:28 +0100
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
Subject: Re: [PATCH 0/3] phy: qcom: carry live SS-link state without growing
 enum phy_mode
To: Tapas Rana <tapas.rana@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Wesley Cheng
 <wesley.cheng@oss.qualcomm.com>,
        Esteban Urrutia <esteuwu@proton.me>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        prashanth.k@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261106082716.128968-1-tapas.rana@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261106082716.128968-1-tapas.rana@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aedecff cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=UEx5U1dda6wf6Co_AVQA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX/I9WR3dDc7Ko
 11LEZuNjs1aKB68FoujpGCBzhlJ7wbet+Bj56E9v3wP4lVAwKfNRTteaaKdmeZrLWO5D0FDBcnQ
 ovp1DCp3OBeRyp072BuZboIcWEIXcYU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX8E/TJ17gL/i2
 +cv9VEGnR07SQKmGts7MGP5UvVN6Fc2CH8Yi8c6DSGZ/Xk/ZnnoCd1mBfApiYQuUV06rmkuBLlO
 m7kGmaS4M0y2XoKY+HRATa6RiIYpHu0fIzwtJ+Bu7K9UF+/MzLLMgIfOWYMa6y4+ecZdajLF2Vw
 rAQCnwH7NvQm4pr6olTy3A+ZD1NdpYRnW45GEcQD9oWHQvWIWeXDiHhJYJSiep+K6TW8SAjSVNy
 KRFVtpu6snuPb0Eh9xhSsrweUipIrrYZd6EyoH0XUw45zRiYTvRs7TkAFs/82zIVT9PYrN1QU+H
 ufKQSfgYBG8yyRO7ZKCa5MtUsQyjj39SDeCV9Cv5u1MiBoc4kp6IcZAm51OcR2hpH3CQisZsFLC
 2JDqqlXtI8CSpLIDmzgF0H7/wpj1XNqOeLEF9obMyLuvknAvqYFNAPH1BhUO93HmTQbtN2fmSJ6
 45SQbP3I7w4kmhUVe4g==
X-Proofpoint-GUID: 4NKmJBqlqCO2xoIK9-mfgM9jCu2n7Ok8
X-Proofpoint-ORIG-GUID: 4NKmJBqlqCO2xoIK9-mfgM9jCu2n7Ok8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060059

On 11/6/26 9:27 AM, Tapas Rana wrote:
> QMP PHY drivers always enable receiver detection (ARCVR_DTCT_EN) in
> autonomous mode, and additionally enable LFPS detection (ALFPS_DTCT_EN)
> when a SuperSpeed link is present; otherwise they fall back to
> receiver-detect event selection (ARCVR_DTCT_EVENT_SEL). This choice is
> made by comparing phy_mode against
> PHY_MODE_USB_HOST_SS/PHY_MODE_USB_DEVICE_SS. However, dwc3 core only
> calls phy_set_mode()/phy_set_mode_ext() with the base
> PHY_MODE_USB_HOST or PHY_MODE_USB_DEVICE, never the _SS/_HS/_FS/_LS
> submodes. 

Without much more insight, this sounds like the place to fix it then

Konrad
