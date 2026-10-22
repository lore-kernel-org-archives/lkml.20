Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665310;
	b=YzEx/2J/3j4k0kjFtku71L2qbmmnjgEDiKzJdvz1KwGUVxLqNC572IAnHhaMSils59bq
	 403C6O8As73FtRI6HT6a5O6qIdW98gW8sLPPadblZCpgTS/FD1LbxBJkJMKYJOdgkF9fd
	 iayB3TPLRwibwvqy6/uhntCkaxF5OntBN6qd5+wXWDI1alK2uNRHo6I0MGW5rXgvvr0nW
	 mZCsRAPylT/qR9xt7QHayBwO3ep9nGpEvHKl48Fda+0OGTTSf/87U8M7E1ZUF62Z01TFF
	 JApZ0sb5zozY03yRhTdT4ZV+mp59WUSltNsACvT0iQTc+LRHZbgNDhf/f0yg++anJeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665310;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jvNhtW+cE5LosWrzD/zgIZovg0BXl55ZhyoehTHQpSo=;
	b=Uy4yVTOPzBlPMlTnLSQtYESnEKmO2XgBJxCpuweehHQYsZua2sbcGqSENHv+TatWcRNu
	 rENMV2UeRH16gxXqLN/6C0EhaEcVbFUYwlKrYH3Dyv/SK39hgknH63GBY08MlMDFJJhMb
	 ZR2DVXppr/Kh1twfP5hQXady5YFS+J9eiagA2gfZye7QCOVSxMxo5+CMAuUflCGVcK0/c
	 WRlocin2bWnQrXVdkG/iOEeFdvIENbiQWkXhVXQYPA/jlZNicUgMI7jz8loiYHB3k8X2z
	 vNgRILLAN20YAmF87Ib4NI/laDHo3qQrTjTPNNpIYgpqWobdtxrzQklAz0oAbG8XNUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MQxmwBng;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zk2VW3p1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DEA606A326
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06DEA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MQxmwBng;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zk2VW3p1
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0KRW3995484
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jvNhtW+cE5LosWrzD/zgIZov
	g0BXl55ZhyoehTHQpSo=; b=MQxmwBngqVbTJYlLbdUvA90EhU1KKM79Cd2glIXe
	QMQiRS4x39EmrguyvaR0esBDoSMGL2TfQ7LZgkW3zypA3KE27auAEN9J7Y7uLKZX
	zQLlVHHkzh4ewGKwhWsarL5JGM1TUeuPQD9Z1hAzUzaTcwPBeyHCVMKWKGZsc+zI
	sn0MeBmP9QTJHFKKxLCAqkqPHrsaba4zLvl4UIH1IkQuXQdF0pJWh4LQuFOhdseY
	ixK4sDi7S6vuOei2pGHpE3DYM4RsThz1MbnhBCfS/8gweaJga9TCbsAyxfuBLQCd
	YSibpRFb57K3bAMALFIvVf7fx6ErOiaH/lHQxoZUIeGBRw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ca255-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:35:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53397338004so54006551cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792665308; x=1793270108; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jvNhtW+cE5LosWrzD/zgIZovg0BXl55ZhyoehTHQpSo=;
        b=Zk2VW3p1BeNTWhPd6BhapNRXYoixh8johClC3tUHaJGuyT6pSwHX/vIQHIeoYYhwxf
         QDrM/g+tAtt/o7eRk4Bb8dl7DxMTx0XJ3SSJyvsFEsxvCwfNTX7YHb53k4Xkd9PDEHz9
         ee5zhB4nB6x+Eo/Y1CvLsm/73GJ14GYpdyENYoqgVUVF/SSRWMX9Zb3VvKqGm9N8mauK
         icMRSP25jZZUeebH0i8W9CWOjHV5LW94Lru6zZk1+jo+RycRx77jqDHtSehA19zlgypL
         MkZCd4dfMhXOS4QvB0uUrXvp2RE2ZrYU4su4wBqlwdab7Il+ZuN09daKXNghtsJkw/6O
         XO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792665308; x=1793270108;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jvNhtW+cE5LosWrzD/zgIZovg0BXl55ZhyoehTHQpSo=;
        b=NJKgqpUYerpBMthI/pRw0b/LixMSCkp9LJoZa9vpP2/+Y8C/7KCr+l2s55DdrHxB6d
         LNQEYLaAKk5OPc21BcR1FDeObcz3BnBcLZv83LjMgdDgVVmQ2jY+O4XKEhT+Dfsk7/EK
         SwzG83mFjb0+xJ3M1laxIWkej25LMmg51AxUjZa6PHkzY23A48PL0T0eIv+VhpqJjSU4
         yGSsWBkFZfz6ueEGsKN7V+LHUf+57H4PW2xxztTDROGmnrhqoru0mN7yz32MPnqmNEQj
         EzROHMJj62ZlwAGp2S0o4PjOJ9iSubl3p5csvfFKq5d7fIatBB2Vm2+E2SnjHQMye5kc
         2f1g==
X-Forwarded-Encrypted: i=1; AKwUvBw+H690CBb9tP8A0L9iOZYJHq9iPi88CzN+Fn8S8tno20bFNbaolSpTrdOnf6kMgcqK3OVfDD3KgjeIHX0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZsM/HMVKi7inKtUkt3RJRpkP46Y2ci/TJssJ2iy4oGMo67svy
	x9TU5icPlHt1VL6prOYWQQ9MITWZSG0ghEaMRD2BisZoJOP8Wt+U4Kh4A/XXyIkWmaGJ/wAQj18
	8AXPHNnMMp+P1ZeKSl1Tbv8QPuZ/uIVq1PCvsoHta9wYHFpxJbskKumpwvp4GYJMBoZY=
X-Gm-Gg: AYBFou0jUMEwNa+CVOGg9eH28iz8WaqRjWoBBcowglrMU45+RAEq8yCQbZ25NpcJdOj
	ayUDi/lGV2YYTAYNSRo8Za6WV+egvWsP9haMTQGToyqdqy4FsUmOTxTvCkJ2i9dSGkwfnNVU3c9
	/uYiwtX8FaqC99ltO59NEBv60kKIBKc5Le7xoaou914mfdfx9DMFgojKC1JTC4YuelYrAQ272eV
	1CRSAC4UF0VBnQ160UxmWhZv1K22jsLpwrm1tD+tdJaOAQyVClRHIjhxu5Qftwhgj4y/8wzIDFQ
	vlYuv7F/C2lUKMlJhMSSQPzfbjtYFwJfc1xn9fhH1YbHI5oxOVh9RQ7UAZYJwQBsiWuY5pE6jd4
	Z1uTebowc1gKt9xOLkwfAaS8MqAKDbcnCwAEKMnyDRLtGnVy3rKJqtVL/dN0TGCBJx/HuQfQMX6
	WhBUMwrj3NiCz3
X-Received: by 2002:a05:620a:454e:b0:93e:c6fc:7f50 with SMTP id af79cd13be357-93f57e52bc1mr858527285a.5.1792665308254;
        Thu, 22 Oct 2026 03:35:08 -0700 (PDT)
X-Received: by 2002:a05:620a:454e:b0:93e:c6fc:7f50 with SMTP id af79cd13be357-93f57e52bc1mr858524685a.5.1792665307784;
        Thu, 22 Oct 2026 03:35:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa11f5f30sm1036059e87.19.2026.10.22.03.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:35:05 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:35:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sm8650-hdk: add DisplayPort audio
 playback support
Message-ID: <teczcryolqo3rgo2jzeafrcd7iktpzx2johlvphb4cyvdd5dml@awmlmvzqm34u>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
 <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-4-8a189c71938c@linaro.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-4-8a189c71938c@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX1eR5kMRZ+X/0
 WPQYXnnkEPKEltjBFYa/3WNl7taGxqTbJKe3Qz9X0ZkSG9NoN9fWSUDZircgh9lqk7/Vkprxj08
 5eovlSi95tW9NF+AZU9MtjK5LnZ/4AI=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ad9e6dd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=lwKPvcPLtPgdvEeQYCQA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 9ubncLX5-hNkwIRwCOSCBfoeNduHF9VK
X-Proofpoint-ORIG-GUID: 9ubncLX5-hNkwIRwCOSCBfoeNduHF9VK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX+VR2axGUFPjM
 TnIlwQk+2trVGAxXjAXyhTFWMl4wYawmEHT3u+TLnZoG39SqVXS+mY8crl6boQemGj9/NZXmjXl
 EDkw6pwCGsQlROFJy0lI8WOWtCPJOd7xse91MXu/hZZiSuRbv7MHh1Jrmlv+DX8w0M1327jTLA3
 PXJqNsv4kRiFw6ctkgXfP2dxojXOUAuFzgsD+tBmVUn70eHzvK7la8IkS9gZSfS/GUNFIJyoW0j
 wqMF6O6h8uoZXRT19E8ywrJbsAxP33uR6Qmtd1QiQinquVfCtLShZkUfVQ8OP1ivUfvRe2LrgW4
 Wqy3V/hu6Mg4Gfr4tPWu8tHz+F42TcCgPOGbNgXrVMlCsOj18HbZTq0PpkjWyN3j0ue8UGIQSms
 QmHA4Tga22bCKMMuLQqH7btU/zaXMi1Rf/TjWoXZOihcg2nAxErxnlpTk2XcNkjl0oXaEGV1U8p
 G7ba0jkYXs5t53o1NAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220042

On Thu, Oct 22, 2026 at 11:36:24AM +0200, Neil Armstrong wrote:
> Add the DAI link needed to enable audio playback over the
> DisplayPort altmode output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
