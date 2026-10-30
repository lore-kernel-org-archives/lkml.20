Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349398;
	b=DJHsLETKiOxMgLPrgZl0PC916WEP44BtG+z8p1ygSl0zqMTBJCuqAMWXztoOpC/EKucR
	 rB3t75AjlZPg+ahydjMllALmX1nxxXtk+uhWTotbhVgF5Hw4hH8fY8jqSNypdwc1bUBgO
	 3GSCOLWP2OvKM26/RpCc27p2xbybeJkt4PYH4gtPmXO3QFUIEzp80/mTIbkAt4ZzqUqwj
	 d0dT0i3f5ymSPPReJ/SiPiGcHT/dkphpZvyDzzR0HbsbQCtNBbUOBe0bmCNCxFqPlc3qe
	 0F7uGrK91OmzslIUIyQUbKAMzZEjKNjj15+Zs4Cxyb+ALW+drckFRZf3wRId/YxW73w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349398;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pw/rj9q+UHb3g+b1NG7ao5fWfl9kHMdGuItNZtveQI4=;
	b=peY9Z2Kj2RjW6VArlX/EQ7wpyFc54Rj2X+eYToH550NyjPsBJox/pkIWFPUKqj6N4j1D
	 jzgGuuNnN4QEPcyM68fNBmDPLnDpUZZ1jXR0ceT3YvNUUZftEXrtmMrdRlayPTapVKC4H
	 3f5vNGO8DkpXcwdaZah+7BNMqhWDPtimTo5Z6CO+skwf7RnO0rK/42JZqIHrYMaF4eivd
	 Od5qW3U94N2envSSDQz3pxiBBf5vGs/hawQv8EvgKeh03d40EJegRjspVaKWSqrbNBht0
	 wL1VVCJFVvYJfFXonFaCz+kvFLtfw0kK54s6SWhR8HvcmTIw7KyBbsLCxJnxa62u7VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W9WnreYI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JHOqJwzU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2562F606A33E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2562F606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W9WnreYI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JHOqJwzU
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F9lP2374149
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:36:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pw/rj9q+UHb3g+b1NG7ao5fWfl9kHMdGuItNZtveQI4=; b=W9WnreYI9LphC9NW
	1Jl61Ic1/IqHICYDUusvMS3TjbBd/x++wnlCc8YqRyZqNELPMI2HmJYyGbdTZmrD
	lWnf0s73ct2gBXV2CgH5ZakhKUVVEsFh3Nswc7DGQ1xUpDw/sKPNvU7iO5EPCi6/
	xIP2qreA70Ji3gKqW60Axu5STb6xCfQ3QJeCoAn+XdVAu901ICFMt05rZmioqwWC
	d7mc7wvd/L/LgI0sJzUnaOkVXeHQFrFyrOAeNXxQBJXeFOitROEsTPHulU9GzAUj
	RTiryNotolacpDpyVHMfVbU+/vD+7Xk1EJMANdQh3WKJaA7N+K6jWko98+mGEHLs
	YGf2Pw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qj0v7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:36:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e629c7b16so9578585a.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793349396; x=1793954196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pw/rj9q+UHb3g+b1NG7ao5fWfl9kHMdGuItNZtveQI4=;
        b=JHOqJwzUUXwG+aOZGzT51qye0LfFfTWIuilmocscHFmkIJYVOB5SiNQ0Gacr6eeoy8
         SZsMJo9xkWCasb5DAfszCUedPFk/oKlkTC1bo+wpIN8wQnYW+X3ZCG0q/fnnI7X4ySrQ
         K4U6b/xhBt3Hxqvg84OlICsGoHPi36gpy9FN1CoU8vSAszGa9+BpI+jIEM9Yur4/WYSo
         qCSqX7Clv4GU72ZfCTitkwUNwr4OcZjvOx6Dk3zY23/wk1RsOGuSfBXcrcNYnzQ8Hs53
         FevjLnlhjFfrOdZb3KNPYfkRGEHnPWYXnrMEUx3bbG5FDC4ftObjOALL5pMEx0w9TCxe
         NsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349396; x=1793954196;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pw/rj9q+UHb3g+b1NG7ao5fWfl9kHMdGuItNZtveQI4=;
        b=gIcmUhKDlF9Yuhrws8boMPIm3NlO6e2VWnJZb++Sw+5FgGreR8YPC9RUI/BjWkokor
         l8ewkudZfnl/KvKn5HsNPyuQoH2pEwFzVsNVHlvSN6YwFvFHRfZpZ5HjgAaqATdtt+u1
         ic9CoxdzoXR+C+jO6afBQLBQbovcSpYNIhV5s9TRSIST0HucFqDMr72TYsmqy0WNfq9z
         AOpyw8N/KkRntXwXEyl64dV4ikfU/wxERjR4vPnXjtuLAxJFdynO9lc8hdzbnxDSW+/P
         Rc+9lVo9pmWveyAM+udAvkL5V1NG6D4PbySN+pmVKEv2sjTs8PKEh3aUZFZZZ3DmUvhj
         +HhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVGDg4LVOhAYp9+ncuMPkVmD0wWkUlyc93Fj23XWdqp2ggepLq4bMLUS3YXihPYj3H6MAD5hJKOznwl6E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxMWyHsLmcV0hgm9IJQrKF5VYYNdO3nN9ql3ovEBSGKK1AN65c
	DiziskGILmVvJi4QQ1+dM7XKcXkxX13yEzDlr02eQO2I1tTLKP/E3FTwR/M5oYYmkScFa1LeprB
	qM771oqyBYkbcxxNmmt50ECm2hOdqi3KTI7G17hJ/bJSwaFXVoiHYPhDPcOn37G+ymCw=
X-Gm-Gg: AYBFou3G0I71ZorA7Row9RPRr31gWTZTPlesRNJ7Z8w10SM0CsCRrb3X+kdZXAMTXKL
	V/cevC+KnZEE0fN3EFA/HiEYlnt63I3861lq+qHGB5KZDhDiDKeMtjXAHvD+lEC8RqGMLuoAcSn
	VFJkol6BE4Su820Yiqqn4li+R4yLpiXC8fMs7KLlDbiNA1Q98KDha/xiEu42e4lV78IH++kpmYM
	qooY32HCoDb0bW5x2xfWpaesmhXGadhRKj1mIHq0YXRrAD7t7Udv0pSGmGZHCg07eWTMr8TGkLK
	GgBWxq5oZxaEt+BEL2JHKmPU9I0VeE8yMKFPTIHaVG9p6rBkBj5uZFNC50+A7IUMV+8yAxAej9q
	ppi3L/mceMprj1NKWEhZTww1pJXsp1KRtYQZ891OdBs84faX/R4dKZXouxVS/mOj8l62Lz5g=
X-Received: by 2002:a05:620a:a40e:10b0:92e:6485:f640 with SMTP id af79cd13be357-94421762860mr267864385a.4.1793349396377;
        Fri, 30 Oct 2026 01:36:36 -0700 (PDT)
X-Received: by 2002:a05:620a:a40e:10b0:92e:6485:f640 with SMTP id af79cd13be357-94421762860mr267861685a.4.1793349395882;
        Fri, 30 Oct 2026 01:36:35 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe96185sm38480866b.68.2026.10.30.01.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 01:36:34 -0700 (PDT)
Message-ID: <831671c3-31ab-47dc-8e9d-5c8015549121@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 09:36:33 +0100
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
Subject: Re: [PATCH 3/6] arm64: dts: qcom: sm8450: Mark USB controller as DMA
 coherent
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
 <20261030-usb-dma-coherent-v1-3-3147b8f7aa64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-usb-dma-coherent-v1-3-3147b8f7aa64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KsrYSmWN c=1 sm=1 tr=0 ts=6ae45715 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=bZAcljcOyrLSmtN0bq4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: GIkyXnhDAwIRNPCnPUgrOOTG5gWS7wNE
X-Proofpoint-GUID: GIkyXnhDAwIRNPCnPUgrOOTG5gWS7wNE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX4kTOyJA6echj
 0BabWParWmbnIfEBa1+wmnBcfAWCAlyC/R1D7WUdIB2mZ1rSywsDgMoUD5+OXKLbIcLF+1pB8/u
 Cye2Q0YdDOKwlsMwjiKvJpVE5W7tJ0e9gp9Ki/2+S9gZJ0slWFiGOMZX3TfQ4CkGyvH3wRrYXyB
 iWyKFITw8dhQHuoV5geb7mvBs+y8ChWoWo2spRT3O3tKwjgRhgT/4OqStmfBV75QTW1j/aP9CvV
 nvPhm963OpPgcu4vl0I7nuxqnms/sGKSlh4CgFzz+49akW7nyI7UgJhkFrLC0HjiPJcFBimutjE
 B6ZL6M9qQ2+m9WYnO5iAhDVUi0i1prHAtkv8/AWi5Jev9yEcAnFOWYxtQMCPuZVF4FVQBz8vWNn
 IXR28EqQLN9zyJtFnLEir5XfS4pXYvk2UWle8SQiw/gS1p2aDs51N5bYsfx0j6Qm6zkTkEXCPL8
 ualPqECxUTc2m/CK2yQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX62tLE8ceWAAk
 82SkuSnzfir7St/IeJfc0XZLTuPHwch6U51DXFpnFcbgrDVw5qJlLxgy/Mi8w6jfmvTv99kEWD2
 DTsBqMI0LxQgyyR/XFyVCqKT1l/QUnY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300034

On 10/29/26 7:33 PM, Krishna Kurapati wrote:
> The USB controller on SM8450 is DMA coherent. Add property
> indicating the same.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
