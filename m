Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECAF42E40A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788768251; cv=none; b=Jlq4RqaMmycz6HfZ+GnlEwXsfESMUrCmhTijz4nYskZnHxpydOmkYCSzVts2S64SumZY9TZEIdJNx4r8ZjQ38+EetvZcrc0xs22wogB2Kl/jDbp1mHGwAPWiuxF3Z7+0t892+nDBts1zeNpdL8sZNlhzY2l9YikbWefBgc30urg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788768251; c=relaxed/simple;
	bh=oziYxAd/m21PsjsH9JcZw2rfYlL/dO7h6Gs7rvOCtnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sqoxbo5MYXBgJ6h7VKFMpb4uBaxPm+lERolYlWJ/BVnPrBbSZGTBrA3H7uz3Ka45j3n5wXzajB4y9ltjGc8VL2Fcz5D1Od5sUmk2RCmmmdN6vVXYwCRuJ33TKCug90Zo+/gVyrYi7kQLH+xwxEAnFPerwXY6D6k+uabbiBgQlpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a+Rubs4+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EZRWRxEx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a+Rubs4+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EZRWRxEx"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777Je14161115
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 08:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BW+sr4jN+ose11Q9LLfUbtTTJFAJTWx9828aoUckU4M=; b=a+Rubs4+SZNwG0Ac
	YBO8tt392ROtPd62Mv+rqJy9OkmmHkJybzwbj8BdyoMw6/KJb/0t4YUqHfEFLnrB
	gtsb1iKB+YjFOWtmn9/ouCWHC6QUIEFzE6nCg2krN/d+n+0iDWFi43T13iIIMkKx
	8FPwcoUq4QPwVEtYhSUUFypqrKF7SypMJ7VrqmnSc1S6Rlq8GT3hTSyvwOK6CzpP
	HmyPdGBCaL2c60inti/fwjFfx1+GQLecn1dFgjTpoqGIdrl12fLp0dbw5YNSdAYV
	F8L+HyytdKIc0WXxHFBdHOL7PMVRAfA+P2Ti53r0rqquYAwnyUY6B36ZPO6ZgvfS
	ATfsCA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfwjhm85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:04:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c9e97b626so4626941cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788768248; x=1789373048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BW+sr4jN+ose11Q9LLfUbtTTJFAJTWx9828aoUckU4M=;
        b=EZRWRxExcpv5tZ6Z9aeVeVKrfcz4puHDMNWQ5GfTSk/Pv4lY0BrMTu33mVVVu81LBb
         NUuyQm+Y8hrutgOS6QymGfIS+/oqKcNIST/1RvpysyRtJBcaJVE3kNFcLnHUOuwI7rTs
         1lmof5mH0rhrnmeHPfuTaBJavsoq607reAFxG23t8aBXO6SSCqvlWZtcImfR81YOwMiM
         gaY2JfO+9tGb4fb1cdJchBFMMQZqPYRuV8fS+KJ9p71CH9BbRTqtRbnk7EvKtvCsqStM
         Pt15AXYw37y5m8K65LxPf9zewtc7B0x22NHVRw4b+qSZRzZrC2K2o/E2n77NyVsqYpoC
         ixig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788768248; x=1789373048;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BW+sr4jN+ose11Q9LLfUbtTTJFAJTWx9828aoUckU4M=;
        b=ea/sMKypdAVUJibvG0VS5TIWO7lG15VxdnT0TRkjI+SRbmQ2VVi/LiMrCz35MDJppn
         PIO10knaFPWNWF+1xZBw7BSQ2OH11Wo4GLDfulC+VlCSguooXltaGUp1NUe7VnggA48J
         ujIa1Ho1SKB1Tr4RPmRXFlfKee4zaKalnj/DjZE7VU8duWQQ+sP3aogeYbM2DCh2x0nB
         /bFFF1bnZsEzSqWgAz/1F2VhCtuRgH6QSQJYtuoFoIzB0yeELyWjyzs+63Hyvklg+FcP
         j/bHEfOxkfGLSNhynoi4NbYcP84jthcLbNCf8XL9numC9/7Sa7/hSePcvMwKxbuqZ3sD
         sE4A==
X-Forwarded-Encrypted: i=1; AKwUvBxiN7+0Rd+W4URd7SiIVgSMDYAZSc3nXR5ZZoblS6mW2oLQmNmBjGfFLCzj2O4uZ+eDZWJ/kauLJa+HIMA=@vger.kernel.org
X-Gm-Message-State: AFuF++lwzwjY8+xrlcomVlu0OhUcnStacM8hWoDwOGqxA1DM5wD+KpqT
	8L/Y7iJoGCiiqwjMO6xOsD3SvIY85s2TetVKa53m2mR62yPqUAu4Zo0wnSuiHxkBor/zQlT1bbn
	G685svYKRI5U7fyZ39y01MnKkVhGeJjr5b7H0dqDzD8wmf78iK4xMO8x94gCE7yebmkk=
X-Gm-Gg: AYBFou0ORJihTzpiYALPCz+SoN57eONaRwHzj7fgHCUy4mzqqLfL3uAqvglCdKHcGif
	CqT1lClYIrmQV76JH9rF+ItdrOuaFEMOc+xXP9CKFX3gmiEVsHpRffzdWnqzcUr4CHsSgvfBwxO
	KWssnJKld3ZjzunR4QljDUdH+XoR+/bihXI0WtLx/0sjNji/nfpU7bpb1MqvFMNyvh4v1vByIjE
	xfqU00peuU4pJ+LsmgUTG/Y4DrnQKkCxbZ0jPRm5GgLGfNQhcUWk5zW2dJmZdtXXiTeJQ6BYHv1
	zP9wdJpbUkXdg4iWbya6+g0hHSJuz1ZnAXZQ0yieAGdeQRWtcDEHBV86j83i7T6R+sz0KcYyABn
	D/gTxJW1rF6SNCDyODBKlQA==
X-Received: by 2002:a05:620a:7111:b0:939:9f50:fa50 with SMTP id af79cd13be357-9399f50fbb7mr689786785a.5.1788768248638;
        Mon, 07 Sep 2026 01:04:08 -0700 (PDT)
X-Received: by 2002:a05:620a:7111:b0:939:9f50:fa50 with SMTP id af79cd13be357-9399f50fbb7mr689782685a.5.1788768248240;
        Mon, 07 Sep 2026 01:04:08 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d503f96sm423598566b.26.2026.09.07.01.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:04:07 -0700 (PDT)
Message-ID: <92aa00c5-b089-4381-af91-7bd063e13191@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:04:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: ipq5210: Publish the OF module alias
To: "hpp.iscas" <hppiscas@163.com>, Bjorn Andersson <andersson@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
References: <20260905134340.67477-1-hppiscas@163.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905134340.67477-1-hppiscas@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4NiBTYWx0ZWRfX6hJQDlxQ9pCt
 teSeJ5nFXwsIGMLF0KE//aq6D5yWhSDB/j//GsVtNwroGQ9S7UXGXCuBXSwKQXc+pxXz/wDmhIA
 Pf8AQBuU2eWxnHBSu9vO+42DYTif5mY=
X-Authority-Analysis: v=2.4 cv=NanWEWD4 c=1 sm=1 tr=0 ts=6a9e6ff9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=UYzP0Bt1LNVb4JyMi9kA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: uPYHBu69gVgMD3Q_Yn_oGg0O0uDPmNsb
X-Proofpoint-ORIG-GUID: uPYHBu69gVgMD3Q_Yn_oGg0O0uDPmNsb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4NiBTYWx0ZWRfX9vXhSqxy4FX5
 wGTnP/Z1+mqL0g9VJeyTiqjQXSVUd0oeOm/OzW+Jl8vm9DvkS1CeYZNA+Ods1QFlsQt4NRF3UK2
 EPrv12XrzBZN+FLwtSah8fX3nW324In0YKLNmiEFFUp5EhvDSblJQJMMgI5zifgui0MdR3yVwx3
 NzlJ8cQRRcMz9YZLeEoCtG6956LV1oIHXDC2bDNb2MnWLTft4P1cnA/c1Moz1z+NKpzkXuVZDyp
 cEpfeUx0ucfGnOY/THFeQ2qF3e+bXsyCLw9Uf51ufyjQw2b9ZfsIWqkTvozcNbD+cMfjhNi1HZM
 1+OSIEMoD7lWjPmcmZ73BAmWJAEOY7qfoGq5QUE4WuOGoyJSnVo2UGS5d5J37ODTdWPhly6Rtuu
 lyIq2aRkLVxocE0Fj6npUbu8Vq/P0/+7bTeTwcpQ9OJ4El7ev/trY/wgsa/9eUsPC5PC3qNYfMc
 w5IlffJpDoDLCLgyo8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070086

On 9/5/26 3:43 PM, hpp.iscas wrote:
> The IPQ5210 TLMM platform driver can be a module and matches through
> ipq5210_tlmm_of_match. This table is not published for OF modalias
> matching.
> 
> Publish the existing table, preserving arch_initcall ordering and
> the shared MSM pinctrl probe.
> 
> Fixes: a549fe22376f ("pinctrl: qcom: Introduce IPQ5210 TLMM driver")
> Signed-off-by: hpp.iscas <hppiscas@163.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
