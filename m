Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103713;
	b=saG44w1yIpCO8vxMmnSY/e803moCoGIwU6xCIs2NGUgf+Y8k7fKCTLeuXpogdM2Hf5oR
	 g6PeLAyhb1nMSmEqHC3kCupLu2njaw3VVC42UTSM8gamaeBD8LA7V/RDHs4CR+nU8t+l3
	 yP0i7EB4DMxceJ9UP7YOQApC3WorSd+u59qOhBc/TWhunjPG4JCkVZFw1/HNMj9C8sWMS
	 1UIOEH3IHX9bfTdLgVvEifNuzFarj79J0msOUYG7mJw/qYDttlPRo/jhTgMBju2B4eHy0
	 u1V2RxCHo73zv5pipM6mqnYEgqw8WP4v1sxXIKvb2l75aiLufA0R9iEaEIuP5HIEtVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103713;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7TtjdxphCRqlCdR6E2spA/NhRe0oAq26D3swKgGExww=;
	b=2r4dwIoRxjhuJiO8rk6Tp0oiiEib7OwZvWfbg4Y6YlDme0jfeV960KkIzO5Nyo1Y0aw6
	 tAJgF93FySoZ29nL3ekFJmZNki/WM8JIhGBnhcWjN1W7NqWjRhFU4++wTMy2PIm3Xrtwe
	 IMqrGn0i6y0CXEUQeed5H2KV/J6he57Bjn/av2ooHXLnGSpSPrp9YtvtJn0puS/fVWMPm
	 0b1D/pFxCMWEsw3zhuHDtJZbM/tKIHEl5r/GYqZFnPh5XDjtR/ZIRnEHcIx73SPPeWvHg
	 kR5J48oSkFcFXpntRTnXZTge0i4Pctj7RssFZB+tIVBnRX04R/YsYnBqiJN4jSkdlig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c9PutExw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DLg7poqP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0F9606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B0F9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c9PutExw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DLg7poqP
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdwYV1061068
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:21:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7TtjdxphCRqlCdR6E2spA/NhRe0oAq26D3swKgGExww=; b=c9PutExwq5FooRjV
	GyCqcBrVhxyKBfajKleQkBGVunTQigizDhQAHpznoGKRJk5CyXBSJ1jMMGomxytq
	JqPoNwH00b2JtOQccD8pUjFWwKEtAaer09ippaoT09UmAc5AKd1bpG24gI5pOuqM
	Ij/vKGERXj9msKYG4lwpsPr0q+DMslB6SY5tUBdnS+GxV8SDcOpTsCPDxAawikQ5
	1Z3qRUWiCp4GkbWfCSTzx79vknqz5nflM+QPs65m4N1EZpBO9+Fe96xoG7Hl4jzn
	GNMx2OqFIDyWNLcIWKwvcSY+ac/b3JSsHI9AKixfGtrmKvrX8CweufJh5DFj7Jvy
	tGbYrQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjp2t9f8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:21:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac77c3ff6aso5989590a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793103711; x=1793708511; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7TtjdxphCRqlCdR6E2spA/NhRe0oAq26D3swKgGExww=;
        b=DLg7poqPAZwwh8XXuGpE8B26jOo+OHc1iXIbpisrK/dGV2orXw5QehUojbpr7CpF/E
         nJFRp6rJWEHRoke4I0i/az7DjXENs3BBaxNCxsKHoaiTUVT6T8SAhMiIXEPtLraOcAj4
         BEV82qBCaIdN+q4NsTOnBB6s88QrVXem7MEX2hN8ZVZwDLz0F5GkgWunVic/TQuZn9ri
         Hca248kuLqBdBd9cpbeWcWggCGchnICPFYPKjNkRMHiJLgMp3RonnbBdtGlC+eUPg6On
         KgJoRSNKMuTSkHxnFiEppD+HGTkdaMPku7Rf0ZOfiftDmIychprvreq3wlTkh7uoYZn8
         RB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793103711; x=1793708511;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7TtjdxphCRqlCdR6E2spA/NhRe0oAq26D3swKgGExww=;
        b=xXfMtKGADoImKBlEhUqRgGUjCv0aR+WgCKSfcvUEhPtau+uxc+SEXHNrjHvrX1nlHT
         x80o/D3tPH/hN4WXqJExSM6b+9BH50Z1vEmFl2r9MsN7vHTGihGtAnkg71T7G4iDrujN
         2sv4m6GmUHTgnb2ZZeBB8q6a/cJ+jFMH13qt5DUYYVzB8s7pWv/RXJIyvDCV+8fKnxnJ
         AjJlFfEmDaseF3jHb+xhIuYpnl+BGyLwbiAV91uBTeAxysAZAI5DuV7LGS1znLrH6oCN
         izS/FRaR2PFvY3U2MoJvRAljhePt9FWclYB9dcvegtx1bI04CGY9I6LzHTeoNW26uKXv
         uagw==
X-Forwarded-Encrypted: i=1; AKwUvBw8c/ptL0NM5vaG0cqam8ZCdm6uuHH0DvqHWVzEKMxFBzKoDaBQbl6f8QNG3Vebso8QdhqDOSoEQaGFkLo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+QoEDjV2sTuCk0Gi6EDU4DmVeLacz5CYOKrA2jX+t3aDilIHS
	aeV0R6nqk7l9MrCQItmaLdifVmVmw7du64aYdzdaPDwqR9VLfRs9JPiXkko4+K3YdvB2HMeTVv1
	Zvx+Er7mCaS/vFPez8JAcPMiVTXJe8LdW88cHS6bZ4sYejinAwfeSyFtbrn1ZQjSS/WU=
X-Gm-Gg: AYBFou1jIk9oGi0DbTElKyBnPMxAC5CUkqLp7y//s5ISHrEq1jCUQxmt/HJdRwpjZEC
	PkCWAsBKhogMhl6xbmwXhahG1boMK+NPHhelyVHT7EDavpns47iaB5tXhewXXvmjOy4lEAoDt00
	0RZiUUwFg+FFqM/wmre+RZcYr8kYp/EqQAGhqGaAtZkllM02Y2Z+G1gjM3IvOkHsewU1NHx+s3l
	6jB5rOfkSgEjoCdrooNtDMwietTTqhwkJSi3KqBVWFqawR7PYHGuzIWH3L4TWtfrieprpV9+Y/o
	8t3Fb65KUaCtULjGv0VQks6QLcf8bpChq25sjlZZ6HMflFNGQevQeuNjRollbWz7r6Z03/Bi4vI
	1ncGV4sG7Yxvb84BVDU35X4U4s8kyjaAbplywUmo5rVven7bC89LxbWJes8mcsPiUnXo=
X-Received: by 2002:a17:90b:685:b0:3a7:9413:cfae with SMTP id 98e67ed59e1d1-3ae36a81273mr2151574a91.42.1793103711004;
        Tue, 27 Oct 2026 05:21:51 -0700 (PDT)
X-Received: by 2002:a17:90b:685:b0:3a7:9413:cfae with SMTP id 98e67ed59e1d1-3ae36a81273mr2151551a91.42.1793103710334;
        Tue, 27 Oct 2026 05:21:50 -0700 (PDT)
Received: from [192.168.1.6] ([122.177.241.224])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae4041fafcsm4755328a91.0.2026.10.27.05.21.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:21:49 -0700 (PDT)
Message-ID: <76f04cfa-33da-4d4a-9fc0-84427977f9df@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 17:51:43 +0530
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
Subject: Re: [PATCH v2 1/1] phy: qualcomm: m31-eusb2: Add register
 XCFGI_159_152 for SE0 recovery
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261027015545.2758784-1-peter.chen@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20261027015545.2758784-1-peter.chen@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AJjzCM5L c=1 sm=1 tr=0 ts=6ae0975f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=VANyJ50yWUE6IziFVoGcxg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bCQCG6ZwM2LpJ9RowfEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: -g4q_fJohtUUq_kgjkDz17qpvmS6B1IO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0OSBTYWx0ZWRfXyDtjJslbxeV+
 bw0r5y8WJ5fQSRO8G8iYI0Lp726HTYh75ad3afdYMfaFIkP7T1MXySLytbJ7OLPcrHy3XIZfGrj
 n1nbCWEURC5MIMePqDr4zh9fg3KFc40=
X-Proofpoint-ORIG-GUID: -g4q_fJohtUUq_kgjkDz17qpvmS6B1IO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0OSBTYWx0ZWRfX0u3vYmz3VuvE
 7WUD1n+YNi9MFboIun5tN2d1cf0Ln5nzdAPdKqjKkMioY5EIasSJ09I+4tBc2SfJAOlOHXGNlxd
 /Jf3Euedrv+NlnsbyxKm7FvUpW91OCp2pzTXyT6Md4M2Vi4+LpkagX8rGUf0wBrkKl/I1u1cnou
 0oxygoUD7/yjgVrz4S728jsqKP0EKTByV9FAO9gVXpLwoAy1lDZtxTdn37uB0DJ/mHG6bEHKqno
 7PqvZLMJl0dptLT53aK1cEqnMyRyKqO5Azo+1KcLXZFHRfPw9wtQK2TAQ0w0Q7UGVbsPwE6IyNf
 IOtPPn2PQttIvWOUrwEHo42nDizj5UO+FXdvBciVwJ5B+Oe24Mk9UmjlSa9nah4n52QdeQtHnNJ
 4ck7fSIqTS0WVIaePYRTIEFx+Bn7elk+DiiI/fLIw35WlLem6UFd3oZZA6FO5j6z+Ed9a/ldA+F
 0z8yXXsuD7ppoakatOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270049



On 10/27/2026 7:25 AM, Peter Chen wrote:
> From: Elson Serrao <elson.serrao@oss.qualcomm.com>
> 
> This patch introduces support for the XCFGI_159_152 register to enable a
> hardware-based SE0 recovery mechanism in the M31 PHY when operating in
> host mode.
> 
> During PHY initialization, spurious pulses from external devices can
> interfere with speed negotiation, potentially leading to abnormal
> behavior. To mitigate this, the M31 PHY provides a fail-safe mechanism
> controlled by bit 159 of the XCFGI register.
> 
> When XCFG_SE0_TIMEOUT_EN (bit 159) is set, a hardware counter is
> activated to monitor the SE0 state. If SE0 persists for more than 2.5 ms
> before entering L0 mode, the PHY interprets this as bus inactivity and
> resets the state machine to its default state. After transitioning to
> L0, the PHY resumes normal operation in accordance with the eUSB
> specification.
> 
> Fixes: 9c8504861cc4 ("phy: qcom: Add M31 based eUSB2 PHY driver")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>

Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

> ---
> Changes for v2:
> - Add Fixes and Reviewed-by tags
> - Link to v1: https://lore.kernel.org/all/20261020061811.3127511-1-peter.chen@oss.qualcomm.com/
> 
>   drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> index 275df38256de..8d954e772585 100644
> --- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> @@ -56,6 +56,9 @@
>   #define USB_PHY_XCFGI_7_0		(0x15c)
>   #define PLL_LOCK_TIME			GENMASK(1, 0)
>   
> +#define USB_PHY_XCFGI_159_152		(0x1a8)
> +#define SE0_TIMEOUT_EN			BIT(7)
> +
>   #define M31_EUSB_PHY_INIT_CFG(o, b, v)	\
>   {				\
>   	.off = o,		\
> @@ -88,6 +91,13 @@ static const struct m31_phy_tbl_entry m31_eusb2_setup_tbl[] = {
>   };
>   
>   static const struct m31_phy_tbl_entry m31_eusb_phy_override_tbl[] = {
> +	/*
> +	 * Set XCFGI[159] to enable SE0 timeout mechanism in M31.
> +	 * This enables a counter which will assume bus inactive if
> +	 * SE0 is more than 2.5ms and reset the state machine to default
> +	 * state.
> +	 */
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_159_152, SE0_TIMEOUT_EN, 1),
>   	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_39_32, HSTX_PE, 0),
>   	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_71_64, HSTX_SWING, 7),
>   	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_31_24, HSTX_SLEW, 0),

