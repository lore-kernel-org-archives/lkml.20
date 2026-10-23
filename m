Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792756558;
	b=Pq5KUNstem2HAsh4aD6QDyPGlLH7N2EpvLmqFss36sBGFGsE67kSKShIRP2v8mEMrUf6
	 9kDVbDundWK1/BWGFMovG8DPBH/kV8KZsOzptviffkNUf/e2oaaqEvXKpoaPNAqTkntGW
	 IYamxywL93CMDEsocTHhA8KRgYJ4wpNSlt50v3J1c+DKj/r7yDhnDMn51Jl4jnS9WMZE/
	 EoI0ZDrErVRvRFnu19oVGLvKQfR3GCAoYk6LdPpDFrNBahOM5Ck4mSRFod/oz5Jl+HQD6
	 yUzK0fxKHuDsJko3PZabHoIe3RyhiAfLYjkt++ENRgy8WFZGC5eLIprM07EJWp6PC+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756558;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0lfjro51D7Qg6x2xly6IGeYnaVRKofx4mi+Gn179GOg=;
	b=Fxhj8xmKDYNA31gygvBLK+S05moUMxK4T5en+pE9p7Pn8/aSa1KeCUZ//hLfN7tGvSIe
	 NdFYXlf4ziNYnoT2EYEY0skmiaGItT3gNTvmrWe0PxhzApo6hmRmd7tK0JauRw5eORSlN
	 PltzxcwAKcjNA99MUXSzboVhdlnMLl81jj8kmRKftMlm07eYPqHPJWf9nm9/VQZ6YewiG
	 mF0m/v+207TGjq4QfahqC3v3o1xqr75l1XWSQ6PFadEd5OfOU6fF5HI5Gxq4aBPKKtDBP
	 0a0U7XnAXrGokAVIDg72jmSEEcaTT+nXR/nfQf9REgBe+FS6I8KiOkrXbHEwxWJ5QYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cJKj8NvR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cYaYOz3d;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49856606A320
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49856606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cJKj8NvR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cYaYOz3d
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAYvi2965944
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0lfjro51D7Qg6x2xly6IGeYnaVRKofx4mi+Gn179GOg=; b=cJKj8NvR2w+BX3vH
	+aQ4/rwe4iSgxxjXPyYptap1oi8ylQ+JWRjwFhCH4f9p/5hzCx84yZ5T8WByfr3e
	hQWOMHlXMxxAseNvApfRTki+4bd4EJdrAj3jXjQb8sQORdUov5EK7MjlkLWbTgwa
	QpiMarlh6BIUdOu0PEYscJ/j8oJSVXisuCa6qiy/kCYiGrbopZOO9f2Ms4l6NUYy
	TdsMKwQ+jb1mQHAsXNaTaIf7HMdv/DJqAaDoSWJ/RXOdbFCS86TyZo9VyVQKVWtH
	GPkL1L2LjaALQUBqeNw8dNZs6aE8f3UFbku/7kyiyq6P+IUCizodMfx4ZjYACj4h
	s3YbHA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0m1pb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:55:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93edac5877bso27331985a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 04:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792756555; x=1793361355; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0lfjro51D7Qg6x2xly6IGeYnaVRKofx4mi+Gn179GOg=;
        b=cYaYOz3dHrMA8QLUy+K0FHR8wkiPvoNdfuBbrASgNBtBKBjOkIF3JpmPeEBiWdsxUE
         hy/90shQOe91me6DwoBXoR284ZTCD5Sw2OP1HuYkAI8I95XSxhr58H8e2Mp8pTNlWuLk
         DSdTOcb4weaX/qPhFpTpvEwtRK/jTypBT8wuelV4XNc5i0ku8qTPL6KydsMLjDLrzGZd
         AiTUj+LJfScobF+l1eNK2FbFTiFDzy7lRKyk2wcsvH209mOMHLeGs2h5GFbb2Hli4K2P
         P8DV/K+8fx6LrDVrx6Wn7kcdovqlFMc/RYne3i2PtGIEhd8rOeT7QNkl3px5q42GJXcv
         Y1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792756555; x=1793361355;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0lfjro51D7Qg6x2xly6IGeYnaVRKofx4mi+Gn179GOg=;
        b=ruyxFkwbaMeRzTcTHOgCi/+pQ+p7ABFarOp9SlqP3JP1tqfDmyo5jRuJCfGZfCcq+B
         Gj5F8gXatEA4UuGtuWDjuZtbCRtFRQSEcJfxY7lN50N3Fgfus1sES+y81/m09CvZfDu9
         8AW/HI8Ayp08yuRKWduJZnqd7UCF4A9RAuhyXktq02WSUuC5m+GXTmBr8Y3N/wLOLW3Y
         FbYbeBt4qSD0r5nSbmswqc2r/n/uFzOCPguKApy3rAT8QkKwKI0IaEvwKc7f+3AeKUcn
         Z2gUvCi/Wry1M4AYUEzdWsAbJg503E79aBDx3UQiLz98bQf+SzpgTaRc2RK2LQZzytIf
         r5Kg==
X-Forwarded-Encrypted: i=1; AKwUvBybb0PABF77psyTbRPBgo9irhmBI6ZYICOQ4cEzjoYc+c9M8XfqtBikUDsyQdumQChYT4kbmYPqAt2k41M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAhL7OF4tzbQ6EeWFwmxmc8n4SjnBNVAmhvtsQGOayfHSD8Wdz
	BNweiahl5ujKL2tur0mduqTWFNbgn6WhfRM8DNhv6MNPwQuAgE4tBDne1ckNDtcUZ1kGYtAqekZ
	abQOsbaALrKh7FMf1zawLNRmqXCJ/ORm3GLZPmIj99pe4r47GiCer4l4FUenoLLN6pvI=
X-Gm-Gg: AYBFou3BEs9/M6+NYWbyULuN+H6qmRD24PaEAect5bLJu0HCMZl3BkJELd6U5mOwQa4
	bNZ4P2L8lTqItQu9iHArxVwDs5qqRQEwtkzcK3Rduh2K8rizI6KJcmc6dxShjup4Wdzn977Ur4Z
	r7fOoo8etBhwlQn9C4RdpvfVvsXq75DEY4RmXB2DWVnePyVBtC+24R3Qwm9hqpasCI/Ie4oRz7V
	vLeBamWvdp4uG8wiqdx6ux9VmeN5dAWZm7gXY90IRa9bsMjVwMOKsc/wNR0XOpCrqpnqi9jEdZK
	jNUV2IPHweTQboasGo8ReX3p6r0ehoo823oZRRCh4+zuxRI0jdNlt004205A7Oy4jHTG2xgwPFh
	yAnRHPvB67y0FhUJHBA/YkA==
X-Received: by 2002:a05:620a:a8ca:10b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f6f54812fmr372791485a.0.1792756555402;
        Fri, 23 Oct 2026 04:55:55 -0700 (PDT)
X-Received: by 2002:a05:620a:a8ca:10b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f6f54812fmr372786685a.0.1792756554732;
        Fri, 23 Oct 2026 04:55:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5c4d67bsm95403966b.14.2026.10.23.04.55.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 04:55:53 -0700 (PDT)
Message-ID: <feb43c1a-9f1b-4181-b663-eab9e55e4831@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 13:55:49 +0200
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
Subject: Re: [PATCH v4 3/5] arm64: dts: qcom: glymur: Add UFS nodes
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>
References: <20261009-glymur_ufs_qcb_enablement-v4-0-9a6ce83195b7@oss.qualcomm.com>
 <20261009-glymur_ufs_qcb_enablement-v4-3-9a6ce83195b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-glymur_ufs_qcb_enablement-v4-3-9a6ce83195b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: N8oa2zajm0QcH6NfAOO2AcCqYYY3fZ2y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0NiBTYWx0ZWRfXwDblZFLde/ME
 YyR6nOkJisnj7qt31DNj4Ux0aXxs2O7qWbuLCNoeGkSBgQNuqPuJMA8KRjZGsEzfpoP/CMkzEi9
 MypxSR6JBlTrdFNx9MA+La0DVfZX43KaVI1UHOBbqbo+OxQNdSnGiZYERdyYv4rG4N1fgM8IxEa
 gNJN6796eG8suYHpw9N0pe/AJJy+v2wZQh5WJNAZUnNiZgXfbizUSqCGa8FWBxWdiDYTxdCsWWX
 7MUsPMh12u+sFsUn6oUDYsvBRBxpE2vrsrwk2h/DEZderG/ohtt86yOWSKAtv9x+Rzjk3Y7zBji
 PR5USHUcA/qxz8/INcinPEYeE0dbUp7uL4jqI0yB5WszOC42YPHxPkwvJajzcF/g2r51xEwUQZs
 pYLy/YcI+li5/xbUd6F4GokX1/3wSaKAp2iq23+JchKebQPK5oAe9GJbQlx1clM215mUHa6rKTZ
 9mzYw47SmTtZpccrL0g==
X-Proofpoint-GUID: N8oa2zajm0QcH6NfAOO2AcCqYYY3fZ2y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0NiBTYWx0ZWRfX+LDcOLaIC9aR
 ub/itYBR54fcLAuqRfTPxVeRc2EEUdHLswxHOraZPoChH6YdufkyjbCMmlwTwlFbI/0wq4WTwQB
 uyJbevg0l9y7XztTavk/gOeQgTkgmE8=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6adb4b4c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=BBNwevgwxSeHGHzN-EcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230046

On 10/9/26 12:35 PM, Pradeep P V K wrote:
> Add UFS PHY and UFS host controller nodes for Glymur SoC.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
> ---

[...]

> +				opp-201500000 {
> +					opp-hz = /bits/ 64 <201500000>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <201500000>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +				};

^ this should be svs, not svs_l1

Konrad
