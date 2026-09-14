Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5863BB9F4
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789384044; cv=none; b=U2VZ5hDqtO/4WB74T9uJ+nd9fZDidYE6dAPARd37ADQHlT2uuco7km96YTE7WQ0+T8/xYhIVaU55lExN7+RkFk9fO6NA10co6ZvGMr/TKPQtEcAz3N1lzjA7tpspTtSY0wH+erwTViAO7MoQzO/a9EmQclh6VKNuDMotqorJ/uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789384044; c=relaxed/simple;
	bh=xYsLDYHzX3vjcXE15qP88OPePOGOo8XHzB7bDzWf8KI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h7Smij6dtpdAbM5ZvP62y7lrlOnu7l6lhemdmim9O67uqTg+E67IFEBg8d+r5hhGUDm18Imt68MyZ9IJWyCMiTjFjcCvFy9g67+hogftBRdVlEK0fF/s+s4Iuoj3PVRGMzd5lQRyDfZ4BRgP8yz4mgpAPDhe8ZnwwECLehhk9Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=byBNS3s5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MBN7k0WH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="byBNS3s5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MBN7k0WH"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmA0W3291626
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iVmNbZXZqwHQu9GXVO2u+sF0wdZLciwJFvqeKGxeNv8=; b=byBNS3s5SujcMjbb
	HUssKUkGExzh/rGvdqT75AHs2YHG5ClgioucHDKX1dX8Qja+bVAAeBc8Uln3x3WY
	enlOMwBzBRtEKQDWgu/mjjsshNlWGGhHui6MMODyJ4ucIwUbsYuLQ/DHVqsqzlr6
	zRs1hqZv562dAjdwIdsYpMVSJpH6ZI0+wraPjbRNlWdsDwDMR8aJ/Be1cPLqU25E
	gcny96dfgm0Pb7SaiqVT3OUJrFDX0Qn6BBM8lnVD70pWsT3MewNWxvRLwNvTAcwo
	ri0jNWgZ4m3gYJoZO9tfnTXzHtpgtYCLa6gcWM7dk5zLxZ/d6lKjiRRYtJXj/euL
	H/mFjg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gperg8a3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:07:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90ce451128fso7291646d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789384042; x=1789988842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iVmNbZXZqwHQu9GXVO2u+sF0wdZLciwJFvqeKGxeNv8=;
        b=MBN7k0WH/Bz3yK7WKOOF7Xp7D05q6nklgsxdt8MNUXXeLBur6bRpTs8+Q4BLM0YEit
         0g9W5rhS0qdvlWBI55TyBnoW/LHeIV0cXkaEdhAiSkcj5LlOOMS6iiAP6QMvfX4f8kQR
         A6z+Y2Peiof2PFhNanLpVXKqrg+VpQq+SLBAbhnRYsiiWXtUHx6UgNV11xbCW8FM1xYP
         t/DqnQY0bWZmNYhUHEmJ4ELchjSRFRisfbFW4OUXj952Q3VgHiPR1iGr9Q0xvkXlSbZe
         ynEGJZafpi0j88w/gd1NeRNGOIua3QX9HMlUXC24vwqVwAkMSjTAWDcaiB8zFy7kDX7J
         KhCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789384042; x=1789988842;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iVmNbZXZqwHQu9GXVO2u+sF0wdZLciwJFvqeKGxeNv8=;
        b=ZIOcst4Y3NhuAmwapxW/h+C+gRYjkfm4PJIAlyKMQTjMju78v/P8V22k9WvjN9iZqm
         Nc2CtL4d0dxINGyOMocCpyVCkWeMw8SdG8sGU7sh1zHdajnItSg1H91RgoQ9BdewqXTB
         tJ6Kr3WKRgBKA6Sj/WlWsTH9Vq3OHg7SOpwU4TSsE0NOKgOjglsxbjhQcZ3PzcI6uHKU
         J3VxfWzJc1v+NDj3gOjitpMFzQHIIxoGUw1dy2RN3DRmKai9MWyVNpNAbzqFKlFk1BIa
         q7iIPK4UjM2ujayHiWM68PbqJyMow+l7mDYdZxG4DCpv61d2S0rHtkCYXM3ZEIbc77Lr
         fYyw==
X-Forwarded-Encrypted: i=1; AKwUvBweOQddOKFPPXfMt1AHdplMpiEfiJPbxv7/St8rdYGWmO8NbSmVMR42wVfhsYAryYwhGq5AnF0JPSO5A4k=@vger.kernel.org
X-Gm-Message-State: AFuF++nPtW5fa7kq31Cw3ikM5uWlv+u0fdPqPsBEWI8+39PRbSwsshyt
	WcLrLd2AWfNaeI9PoRe1AnupdiTXeykEUkizYR48rhqRJhpFu7ffkrOKkzhAHLIiTmLIo58t45S
	ARe8s+SfiWuKVDxJT5k1SIpmBP3c0nH2pQ/112iZg2oD9Yfdvdjj749x/Fc9FAdqCwns=
X-Gm-Gg: AYBFou3Foy26vNVWfrCuozazaBUPrrSLKsCWMPQR+RF3gU1r3NJ9DlXxCP92GDtdG9+
	X1QBEPw8GJ72skHEcAqP0z6lHQYIs78ytxB2iHizQMnUJ12AuGX8f5EDOl807m8ryd00D7+D+gY
	i/fDXwP36fbB5Q5Ygerk07z/mOoeztPuY8I8EHtVW1rCXC6YSS2E7oiZsnGWTCqDT/y3dzWie1D
	Z3HnRaajRKeR5ao7eTWrgMWL6VMzh29GihHR/wn5MX28jhz9RQKvm0Iq61IVJaIgIw5dHBG2jhX
	jXj7NEE4GXm/wCb+7JrF2tkqjc3N0l0YeFZq21TY0Whv6TCGER6VkqRVMwabrWTuIO6vSgq6lCd
	rFuswhqxXl3wHmupyFKU1xw==
X-Received: by 2002:a05:6214:1249:b0:912:311:12b6 with SMTP id 6a1803df08f44-9122e65e041mr27731036d6.3.1789384041551;
        Mon, 14 Sep 2026 04:07:21 -0700 (PDT)
X-Received: by 2002:a05:6214:1249:b0:912:311:12b6 with SMTP id 6a1803df08f44-9122e65e041mr27730436d6.3.1789384041075;
        Mon, 14 Sep 2026 04:07:21 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b594e462sm4164264a12.24.2026.09.14.04.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:07:19 -0700 (PDT)
Message-ID: <b550d226-e7ed-467a-8af9-a45bde169ecb@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:07:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: purwa-iot-evk: use on-board
 crystal for PS8830 retimers
To: Xin Liu <xin.liu@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com,
        guodong.xu@oss.qualcomm.com
References: <20260914101233.981643-1-xin.liu@oss.qualcomm.com>
 <20260914101233.981643-2-xin.liu@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914101233.981643-2-xin.liu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa7d56a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=D9jnvxXfBeoGJ7MCLz4A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: _aTF2mxWCGWKo_0Ip8KhKUApg4v3IyOZ
X-Proofpoint-ORIG-GUID: _aTF2mxWCGWKo_0Ip8KhKUApg4v3IyOZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NyBTYWx0ZWRfX0aogBN28c/B7
 iqRN64Z1wH2W2YP/aUCOv32sy/AG0+rC70qWXTklofDPr1Rq4+4aOkLeSGtn65FMPhFZuPn2JQ5
 ou9WQtO0qcPbuNHurEErLwymKFAd0AvbcGrRX5akg1Y6qtexPV2C9kITGU0gkosRAc+Q2gXW0Cr
 UTGqZ/cd8gevanu5IFBiWn+PxKvYuT6Cmhf1jdDo/7/Z1gMeCLIsez5U5DUWiS5xhXtKNTC54+5
 GrLVuwYFeskLXytgteNQehJK1UDT6kJZ7Mq2aFVp6nNlh4IUstd5O93FTqnkpm4tTZ6iQoidHXu
 qHfpm3Tcl+qt1wYezG6U1KPddIj57RGanUHE6xqhTiC/JrfspE+frLN0qTxVi4LUXlBmapeH1R/
 ODXFxEsgiC3msMbFkO2ENlYndOmJ1jd8x+PhOgKR3TTsLdg3HnLKG2X830LQmXxhPaDCyMaePk/
 F+DcQpf/e3ywar++7sg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NyBTYWx0ZWRfX4LTqH6SdQT3e
 ZWGRS/mR37HOkNhRrrBuCQ1AN0yF1k3Ve13TCUPkEQMk9q6PK6LN+1JctGG6Yt24j4W9BnXSt3s
 iEkkoKvLjl2om92jtBhf8KHyefwx9G0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140157

On 9/14/26 12:12 PM, Xin Liu wrote:
> On the Purwa IoT EVK, each PS8830 retimer has its own 25 MHz crystal
> wired to the retimer's XI/XO pins. The reference clock does not come
> from the PMIC, so the RPMH_RF_CLK4/5 references in the retimer nodes
> are wrong: they keep those RF clocks enabled for nothing and describe a
> connection that does not exist on the board.
> 
> Remove the stale "Left unused" annotation from the vreg_rtmr0 regulators
> as the retimer is actively used.
> 
> Fixes: 9ed20e877239 ("arm64: dts: qcom: Add base PURWA-IOT-EVK board")
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
