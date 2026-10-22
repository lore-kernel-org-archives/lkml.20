Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661048;
	b=hmXXHStmE7sTIpcDHtEJeuJZxouH42Y9gKNGqAaJvRvqPcwH8kVdrnvfchRJsftaLLiG
	 pctAh2065n/802LwF50XWzAwFCgr86HhLxNCEusz3Fhi91ccFrif9S0G/RepHJI+zoAIp
	 DPpGvlprOEn+Rsgle0Ymm3Aa2/+BZxnhL5M+T7oyCUeaFBzYdD3uhk3racVUG+E6bQ8eD
	 QmE0OWdM1QXrO6y2wi7Upsj+w/izuRGcePCX0YMgIJS2657JmCm0UvA+BWTPl2LjKjMSu
	 5qodUSC1ME6bsK6AyqYnUn4lFt+eo+CSoheKCWud1qqFkPGFDs0imwi8tof1QOWx4xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661048;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nj8FdNER1lQPCWEuHuwJP70WHPIGMEouL3wovVOCpDA=;
	b=0Y22sxK65AYpvC9GLq+pRPh/ZLCftQxeLXJYApnDvZpmwicS4DWwz+R32MnSQBLJBzUt
	 o1ZiF9+4LJM1Ous902nzd/Z80uuxbga8DLCHZwS+nZeXRJpeiS59ODzVuSrPddE9ovC0c
	 rmZFEHj7R54CtlrU4JJGPYk8v2YsDfGOOiZWnDTYZA99+8AStbUCr0ZrTD7/ZaotCYkiI
	 lU/GEtEsDkcjfYgCnT6xWrHDKFqVmh6zII8d2WeZ38k1UDiA13y1CPGTSBGr7+UDwGsya
	 rrt31b7pguIEkKSP23JZ20BFyeOydgL3hDL1CYXZAMi62/6CTDT1SdlDk/2r9q3ySXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="N/vFE1/m";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bxfxs+re;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F22B606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F22B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N/vFE1/m;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bxfxs+re
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M8LnGI3194723
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:24:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nj8FdNER1lQPCWEuHuwJP70WHPIGMEouL3wovVOCpDA=; b=N/vFE1/mSFa1ukaD
	js8Y9n/UES/1A5o0ZBcxd7RGhw+5/9hVxywK4c9OUPG64JY3SqJ+nqR4ouaZUhcb
	jgS8mFF+bLVkexlScNtM+dmXHGrySH3WxTnEJ46co3aNwZ/QUIWFfeT8tWH9X22v
	hT9Rj3ATyXDnkbYFWNgY9FydISUj8y4z67cHv/AjuvK3l5dsaL3C67UYKoclRX0y
	5v9UWWFPeFunnYrqMbUWweWvQOuBGPBKI0qi7plXvRG+rz6n3e+LmH9fc/KLkXG0
	cddLivR76IM6IO98gGbM5dNMKsF/wDULpj9ZbZAmwzOEQXN55/HtMHac870WPKnD
	pwPz0g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq09n7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:24:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f3960dca5so49241085a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792661046; x=1793265846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nj8FdNER1lQPCWEuHuwJP70WHPIGMEouL3wovVOCpDA=;
        b=Bxfxs+rekTZ7XMEy202kKQ+cS+YdsqYn7i7eFnrv91PFpsPTe+gAb1EGge9dhLuZhc
         2z5qkzsldW37/05NIGE6YxnnSho8dFaupNy9u6gvxI/9LhUrA9NNg0ZKXJ21qZ6Z+zhS
         KFkcLOEYymnJSN8ZFr0FDfuM1cc7Bsgw69coimBtAFK/HF4qxBYp+V19ngY47FPeWKNf
         0KiJGoVHpD4lbFyxFqv1tc/Bm+N4XgG+s/nxgzhRk2rAEGPJrCMmWEOwtTVZnhlNWC5W
         aY2nuxvtAsmWvAWiYkeEEARIYPj1TsUWGV3AS24cPB3VtF+GN85qISJa0DggzaFKEdpk
         GqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661046; x=1793265846;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nj8FdNER1lQPCWEuHuwJP70WHPIGMEouL3wovVOCpDA=;
        b=jXxafg5d0zsPnk/qZyXxsD2PPV3VK+AyRVmpABHzfYe6s/ou+6dNsJPvf20hgUDw5x
         gum0JCOUJ8BTT9b+HddXZawrZydMAI9jDeq+pl/spFCXGN166YrPIgiPcL9pllWbGVCV
         QIlyTkhfrSu9ZkkhXQ6/Y9qVPJE8cHO6xadQzf5wGfKC9kQnmD36cQFae6yPNICpOM54
         18aoUivcHiRndJo6weAlxH/tfqBj3PbiNdgaUvyclRHwrwr2Ls2VP6yOIjAGZzEQRLIS
         iVxkd+Ld9pJE3lAlYVoKrcA41QFpfx6wuogA5tiZgvUdyxlRbr2lrluKVBnBeNsluFeJ
         8MeA==
X-Forwarded-Encrypted: i=1; AKwUvBx2RZe8ZYSog3gnS0GeAKqmrTXiwLKoQNIDaooSCIv17MstODBd6MG4bNV6kvPobFNL9XXGgONp93P331A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDZtK7+svCFMoIccx4JOdxw+3JyVdqgW+7qwCbAJHQEZhYgQuv
	qdMNcfhPzyMerIZ9qGoTBx5qm2AkkCeHcQQQnkNZzfG7kpipZj/jxY+fs3oSbyu6DvpySdU4GCK
	PMcJeKd5r+Jj70d76FIIQkbCrMK7hahoH05+y97w4RqIKN37hrzKfl3hByPQl33fxzd4=
X-Gm-Gg: AYBFou1Ntu9ZTcudrrunc3m7uZkLaYa+K7usAj9jSHEuc03+963g731LVao4bawAJzU
	PCIrihIhgM08jvVGtZc7djP9JXjzGM+dlDPCoMaQXU3TpDv52VADu49LX1rQv9JLjhUmK9vtxfq
	iSqj5Fa9a9vXEm6GOzEqDoLVhONXsJM9MWisYGe1bxOBH3k4nM6Ps5y77B9LVjIEiDhb9C0OGd0
	jXEKIMts3+78GBWBZaBNy7fg6cBrOATYW97d0WIOfwvH0sZG3xASrOHsHJd+HImNJbhFevP5hG2
	IPoYqbhgBAkRbibgL37muZS91gDSgDBKW3E/9Z03Y0ps63gCH75ZS82i/d0eQbvdhCu2m6ZtBnM
	cM0qGMNe2/wqSYhoXgayj6g==
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr1116781185a.6.1792661045771;
        Thu, 22 Oct 2026 02:24:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr1116778285a.6.1792661045267;
        Thu, 22 Oct 2026 02:24:05 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a55ccabsm83948366b.33.2026.10.22.02.24.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:24:04 -0700 (PDT)
Message-ID: <0b829c36-ea7a-472f-85b2-c32ca8121047@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:24:02 +0200
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
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sm8550: Add support for Samsung
 Galaxy Tab S9 Wi-Fi
To: nacht@dxdmail.cc, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261020-gts9wifi-dts-v3-0-afd06fb2d9f9@dxdmail.cc>
 <20261020-gts9wifi-dts-v3-2-afd06fb2d9f9@dxdmail.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020-gts9wifi-dts-v3-2-afd06fb2d9f9@dxdmail.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -5t0byU6JqTORhj7GATzI9Fqa5CCUji1
X-Proofpoint-ORIG-GUID: -5t0byU6JqTORhj7GATzI9Fqa5CCUji1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX/wAq/s5gmawe
 uUv703/g6OrgGWUXhDYjm0uz0q2i2sjRRYRtiCCMJgrxH2wzxLgwE9LhZUMJ1Hy43Xo/ajUfR8g
 AmU9xC9/EMoqBAE/DIbReneeutT/xbI=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ad9d636 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=AqZmfHzJsoaMp3Ki:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=hvBRWEyMk56MnqwRZ0wA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfXwhkiEHLCFpc8
 DSSXGBQm4QM1eAMEFwbvFrlYKA12C3ghrGJmgDZ+jAyhXy0TeOLilgTFGBNz7EdYB8VYuq91Y03
 qt+CE2aRj5TmUFRss/9c1oevbWRb24rsBAyUuDiNwZFvu/4cqnY6v2lNcAILIauiQg35ue1US3r
 Mui3GafHBUGRnlllE6D1askSyT1Jv5jmoildZvLA1hciqwyLi/03IOUcJiGd3CigdGYQBwvSCux
 q96k0V8XDE5kAEymQur9wanTPtqpvjN0JTOWdOGHf3fdBx2ZSOFliCncD7xwWf2f93AqeoqvpRu
 cQ6qoD0g3GZ0p50Kxye6q8/jd5pEOHqzpIgFlRNLUgt1JyOuFbp+6DktctVCodkvdp61zlTOj3X
 0ZwszjHS6ECZ6JU1/ZQWzamlEhG03j/VQgCICHhiB32yQceavlnYrDmilUAekcDO/LtsM85mDxf
 fJG+XIHg/YqrgABXwww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220037

On 10/20/26 12:42 AM, Nizat Mikayilli via B4 Relay wrote:
> From: Nizat Mikayilli <nacht@dxdmail.cc>
> 
> Add support for the Samsung Galaxy Tab S9 Wi-Fi (SM-X710, codename
> gts9wifi) tablet, based on the SM8550 SoC. This is the Wi-Fi SKU, so the
> modem memory regions are removed and no modem firmware is referenced.

[...]

> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include "sm8550.dtsi"
> +#include "pm8550.dtsi"
> +#include "pm8550vs.dtsi"
> +#include "pmk8550.dtsi"
> +
> +/* This is the Wi-Fi SKU: no modem firmware is shipped. */

FWIW at least on older chips, the modem would still be booted to
provide e.g. GPS, check if that's not the case for you. You should
also boot with memtest=1 and CONFIG_MEMTEST=y

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
