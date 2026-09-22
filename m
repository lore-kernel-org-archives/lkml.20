Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC317549371
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790093162; cv=none; b=QjPFd4jEp8WLdfufDFf9q2+NXeu+WLVZULReQQYfSsdM8g9jTdW9bAGq/tuwui3jdIIxUYy7UHsQjKeQQ7MacueuBb/VBpjOnfRCd3GPrrcCT4Bh0dVcCI4B+0z/lEfAAMMN+D3ezu2Bf+BtMky9fsbIWeYifwp3WWCg1z257Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790093162; c=relaxed/simple;
	bh=rNkK8sT5wuOA9IxHlcykcIXbvdkf1C30+zMq1b3ID+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kIsTUysFCrRwUBFnXzyNf/b3Jbf4k7nI1s0TXE52XfQOnseTz7NrOPlmW9SqkuKFXAMaxjP31ZjtZnuBZ1VN1QjfdjdEx4wvIKtZFaRIfWjj+5LiH16MTsR/oFSnioay7Hkrh04tlvgA2b2aXNEYoL0t4b2gLnSqDIRjPhAoxoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SO+dKuzx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hbaP3CFb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SO+dKuzx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hbaP3CFb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjoW13952917
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XLUNTUDXdFhA1icixcnyozcN
	bkzgegFZZBk2svM3Bo4=; b=SO+dKuzxyL60PkWEmSp1SRuJjcYLPKy961Eleun1
	v8MFU5dy/4leFkwqOwdVBxM4txv47LloJ+gFO0T/OPKLGk0Y/sF+tJJQxUXPI/8N
	YY1Z3Ulbi9+EOntmycFyQuyIBOGgEjh56+diT40ZpxirL0NZNTWcEZ3nO33CRIfb
	tFrUc2Pk+dcNvex5S4twUBf1ht0Qoup2CB8JKck5RyFo/s7dYKck+20O+QLLYmaq
	H/AkPC9BAXflidl/+N66NG+0/1xm3GT6ybCZUiSvOhnouSVEdtywAlo9mkXOOuUh
	hAelbW8bXPWWERfFfZ2RkvaBzGXVE0N+6OF+UyH4Nt0qJg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufsqbf98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:05:59 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c93c294214so9707e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790093159; x=1790697959; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XLUNTUDXdFhA1icixcnyozcNbkzgegFZZBk2svM3Bo4=;
        b=hbaP3CFb503mm9Z3j60DJZCBOSRAIrngTvS34DjnQzoPInyplHUxaGuaUkW++N7Pla
         p5i2t/ND83PAP8IMw9mMa8UwalGVfCMN3Q/TYXZMtOcoV2TxN/4d8D3GIglunH1+1Xdu
         7BmSrQU+acggpjaMF/04f6XG2AXM4yQaD0sWXQvmNURkaGThgKDTl6gOfE1xUP7BFbGO
         ZeMxzbM3aKREOB25KQ3USzcD3J4+faF3vKJU1RROm9nBpBla1U5daNGCxN7SN3hx5PWT
         3AB1HoQUUGX1BJZUNekuE3yGjNeXLCIXAKsdVGD8JLVGC3807JZpKHiKqaxMbZedID2m
         wwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790093159; x=1790697959;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XLUNTUDXdFhA1icixcnyozcNbkzgegFZZBk2svM3Bo4=;
        b=KT+/JAXIO94YlpTv8PHiD926A2GY7ENTzIV+VK9UbNXbYsCe2Bbfj7jG+vHruBSCyO
         q9/0x9nKakLesHglJ0I0H5xBkws+oyrURrnllFy5Yqx9oO4gNAVHW15ZHTm+jqrhjyJm
         dPbrWriElNMpVMGazKn+p4jvN8NIhP5T+ygLfdN3Dhvgg7hGy8gooUWkhn/hJYBczwGP
         9Z4DJ6nwO4Fj4BMz/Vr7TtVMlLRPJCPj7AK8yu+YhmxOjiTIK1lXZIGiQJnO3/uWUmyP
         ay3uPakrUBoKIhpH1a6GtxDOufsm+VHL0DrpYOHmOPyh7GSL4CZ5AtWWcB3u/5Bdb9WM
         5nEQ==
X-Forwarded-Encrypted: i=1; AKwUvBy03/5K+eKrMk3BcuRObJ95GdzBNbTPD71gIb6Aull2wm5+ZWwi8UDhC5xUsnTids7RHR7wgY1T8dSaoRc=@vger.kernel.org
X-Gm-Message-State: AFuF++m7qxd9bCPJKk6OTRRlYoVS8lJUIq6+/f2ab8afs2N+dwqJ2qWj
	XSPOMW9ODlBm/twfrPv8UsQdASsITRvPbgaLu/VKabeEfbAVLFGgnSNpGc3YJN4iuTnOsbxjBCN
	mAfxRBjg7piUc0NhN35enrtuzqoXjenwBlciPVSSXue6dKc5EWiZueP+rt/Nlwf71pSw=
X-Gm-Gg: AYBFou0alVxIQ1UAbLRe8vwv1hQqk5ZLi4CWgk3fA+Q5OY/1mPD5sOx0zinr1U2FTxT
	QIcyQNlky7UD5I8eX9IiiQrdOb8Sy7noMKRIY4mrN/tRDLQwZx2zH0k94dPFISny/XTKhWPbHoB
	QG0kpnPPxyA3QFZSofs31LMvqtHwwThhLjBqK/cHvuh00ByYtAv0LduUwxih6Or2y4IUTqtSXXg
	CL1jIudYEZKvLL3ynFaBsbmAzvonjvNyx3D7bX0OEQn8Yq0ZMvzO9mOCc8Y81WrxdV+38pqh/fn
	C1wvMml5i8CVSDs49xJOsMOzc5TXCHP8yhUQAjIfCr29isKu4aWSK0IgXyRqbhALx9AunBU/3xM
	cEoNc2RKIzIP4AMDooKZi7+uMucYdUuRFdp3XuV1Ef16+ONLsMjxULrNKFIwEgkyjekGL0RtX7u
	3ieNkWj24dDp/a
X-Received: by 2002:a05:6122:1791:b0:5c9:c60a:e9ac with SMTP id 71dfb90a1353d-5c9c60af4a1mr7516303e0c.18.1790093158820;
        Tue, 22 Sep 2026 09:05:58 -0700 (PDT)
X-Received: by 2002:a05:6122:1791:b0:5c9:c60a:e9ac with SMTP id 71dfb90a1353d-5c9c60af4a1mr7516247e0c.18.1790093158307;
        Tue, 22 Sep 2026 09:05:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d8552e40sm9743e87.9.2026.09.22.09.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:05:55 -0700 (PDT)
Date: Tue, 22 Sep 2026 19:05:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Arpit Saini <arpit.saini@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: shikra: Add MDSS display
 subsystem
Message-ID: <4adta4pixcnjza26rwjx6fxeolthe2apcyam66nxbstrkbanzp@jevuniiarck4>
References: <20260916-shikra-dt-changes-v4-0-d5d5c3ffe070@oss.qualcomm.com>
 <20260916-shikra-dt-changes-v4-1-d5d5c3ffe070@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-shikra-dt-changes-v4-1-d5d5c3ffe070@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: _snbliApwXYeZLJt3ann_mH4JQNKT8Qb
X-Proofpoint-GUID: _snbliApwXYeZLJt3ann_mH4JQNKT8Qb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzNSBTYWx0ZWRfX6ymWItZ53m0x
 sZRLq/uz9h9Auwt/oBfKqGKerhF+EnunKVw50JP8rpNS+Wk9ErsG5ZuOCziNC9BqFjR1795F0XE
 +0/EWrvQOP1Dsg9HAemDqb8hGY/WaJc=
X-Authority-Analysis: v=2.4 cv=NKBAaE6g c=1 sm=1 tr=0 ts=6ab2a767 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=X3kk7DLqdN3b1gy5tGEA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzNSBTYWx0ZWRfX4L3V+xEAG8F+
 4Ki0XtCghuE4GWMM4dQBDA42abv3fVOS3mMql58QyGSZJMV1Ph9RYb9QIVaMUNlGS+gsQIkPrXs
 +z/Igkkcp/otj3lOi8GNbOumPGZu/6Ob9UQQIREc+dGGbaXQh6FmTVkXQymRN3yL04iRGlZ9QNm
 oh/YZuhYywOohEdsnrwNygkXlOeOkwR480Iduck6Vx5MaKpz2CMuCFmxlwVpspfY012E7+yP78J
 6r3nct/pB7enS0MHHGdEV1yQNYgM7wwZ21vF8WoPzvTrWvS9ZMHqG8FVcow+o0Fihza/YuhMAI4
 JHVN91UmccgqGE0IWjklrdTA8SlJagLsxwO2AoCRxXtsw1TE+Fsi9A3G8b/Naat87bkbASxncu6
 4RY27E7JeZ3DCPm/pymf8fYxUBfvEEKclNIqx/UPCK56pHg7/MigqCBCYwYf1MLbwkFdaHIWpWE
 mYuJa3ze25uIzgCSMhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220235

On Wed, Sep 16, 2026 at 02:41:18PM +0530, Nabige Aala wrote:
> Add the SoC-level display subsystem nodes for Qualcomm Shikra:
> MDSS wrapper,DPU display controller, DSI host controller, and
> 14nm DSI PHY.
> 
> Qualcomm Shikra uses DPU 6.5 hardware (same as QCM2290). Platform-specific
> compatible strings are used as the primary match with QCM2290 fallbacks
> to reuse the existing driver support.
> 
> The dispcc clock inputs for the DSI byte and pixel PLLs are wired
> from mdss_dsi0_phy.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 206 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 204 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
