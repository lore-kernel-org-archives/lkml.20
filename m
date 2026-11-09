Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242984;
	b=XePPBGRZVvpiLoqw5566HO12sVmvAFgm1iXB8PQRKLWpYo480pJN0Ik43ZkAvBb54LtX
	 H1i7Yvu+a9ebi10rTvW+kRdZIdC9WIjl5myDIPJ7OfPhy0d+Xc3XoADb629q/vYKhOz7U
	 WomK5yP+ew1C1QsQRZ14JBdskfXUOlvIqFQsTb5gzkJAYMCi3KMbavHOqDNasvOFYc/Pt
	 OyEhNR7SV0jG6kXsasCHKjPuqqPARNv0cEJ1x7IzNd7WwywjvNmKo24FYXLR/5UXqRLvv
	 BBNMsSvGsjN+LYfyw+PdJ1etkafj57moW+AqIJD7ykDY8i+dyJdK5fRMPLGirZExBXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242984;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0MUhxbWDDfH0Pr44fdAQRQQ5nxMYgF5W2NWtbwUlm6Y=;
	b=18hNYwXscQ87PvdvYXPhnY311szPLYkOB6LI6DtQMeXQy8kaJG3DOjJjlSxt/okToylx
	 EKVwqO/kvW+WvotK9pS3qlAFtakjYPkSKhxUMxyVE2PeNaQuBxbhBSZfweX7ke1YSX+BW
	 B3SqlGMZsBBT/okVUBjNkvqrwuzXpWTUom3LKzvrZn8GR898XG8Hj39PjMATpFeRZR+7W
	 en9dij63nz2N8jmUFJ4MZ3uZJygHgxXgoh54ZsVkXuv6QG7dI781GTinOQIidpMQqpBi1
	 ZEmr4E13d1bIUAIAE+Ag6L51FW9Y4dMkwKrM8eGB9qiDhfoCVqO9nEXtjzNFsnc6DUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KC7CguAf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S4KYiYgh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC59606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:49:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAC59606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KC7CguAf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S4KYiYgh
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFNM33589056
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 16:49:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0MUhxbWDDfH0Pr44fdAQRQQ5
	nxMYgF5W2NWtbwUlm6Y=; b=KC7CguAfa8iBs2P29e6oQQPgHbafjEd2ffGuL0DW
	UqnHX5yB/jTghZ6hUFCCtTZAnWkk44cc9vx8MyLXLoLFZNwv4da0brsRaqfDMI5K
	JvNoZxQvq9YfoOZqobJKRdjW+I8MQAGxjyoojtY8dFzaDyOHsGbfREfxdROcqHZW
	dhiybZIRpy033tEJd76g1eOHGzm3jaOxWnqENtpN+TnWXRQjodKMMDnDb+TC5ccu
	ipJrUzBlkHzfwRmNe3vma5jUPwP+c5xLBWoaWHKq6Dq1Aj7+SYj5V/BUhQTU4pU6
	UjT6NdIlgOWEj4EvvcwMQ4TWUHMZLXnvOw0vP/C3gy2eAw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudcj94k6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:49:43 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc10da5ad4so179063137.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794242982; x=1794847782; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0MUhxbWDDfH0Pr44fdAQRQQ5nxMYgF5W2NWtbwUlm6Y=;
        b=S4KYiYghSTSwwrSjsJ7a6xgKsLVHMyUM9E+pHccQFK7ny0VGNm1RRP97I+ZkU6EPFf
         jiE2v1jvWH8P3ffVAm2cWE00E7TF01nHO6PmKWu1r+qu24QYP4+n2uKuH9Tyu0Dk1L+2
         vrNHRr5hYiyFteV2CzpUE94RWum6vK1WMYX1keOcOEM4GFCjiHbN/vL8LevPTUhJulCy
         /AblkjbJ2pU+HYF1q6tmrNOWy32FgychJtCt6y8xnmWB+5V0gA3zT9boTP+mQs/4z4CV
         S/xeduoo/RtG6y5NqxMaApLR4PxDPCkuFOjAasnpMebAFr0i3KzdhpE97porFEM5x5qP
         9AiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242982; x=1794847782;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0MUhxbWDDfH0Pr44fdAQRQQ5nxMYgF5W2NWtbwUlm6Y=;
        b=UQiduAG3E/Dq6TLdTrD/pqtuHZaKRN3QCZdiDmf0DcW4i4GvsGqmvzR0zez9yd1Ea8
         SD0oLCofnQDL3BFHzd96JrVQs61MrFscVVgrcnEiyoGL+4t1B4gpTtF5IYf5i/nFHWwY
         Od6ZE2WtLSy3F6W+02leN0iAn7BOFA5C9P9K+9EoqjfV8KyuulSMX1KDKprmtKbO+3RZ
         I2ImcbNNLNZuBvdEuWZ2VcFcwofIiuVVbSNmQURojDCrVYv4zjt+fb/zaPLtc3+Ov8bc
         o0bqkp+adJnRHMZ7JoAc+lJ540WtRQquq0j3t+gn/YJd7Gn0VGVD1Pl67Qy9qlBIdhHz
         TidQ==
X-Forwarded-Encrypted: i=1; AL+hErEDD+T1srfWKL67OEOHYfHTxSsjOAJmnKpupJ4KcY6Zo9ZX2+FZYIIh3Oz4c+Eto/ed3Ez7JKpRQ9NLLiA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Q6ekeTxj+Zn4iamcn2MU5MclscqITiZhjyWXjPe11GXWkwB0U
	67uK/3pEhiKAG9BEUTXx0ou/pnQgv9vLVKLQbD2XD63eGuZQjw5otZ/wpmVT0h7BKcYeb7C3N7E
	IPqy0EXLRWO8RQOKlBik4ayz2TJ8RLG5DeW2CuMJ2KfqQZoY6h1a1g+vuUCV0oTtQCYk=
X-Gm-Gg: AYBFou2s7P9qjYTGafP9Hfy4YCs20yY8J+XajycFV5FPhwAHYpEzRIdECTlveOP1igB
	anHsLlhlxxc03shW2uNWY68nRQdJCLcXVhOAB3pwB5+gPJ1BTCH96jMIQI/XNjXX5p5KRQARKo8
	C0AaF4mHz9j22oCWSoEsTG/izCueAL3CDQXnzhbvdTiaHcHdxDliIytZJB9fZNoQOib01CdxgHz
	FlfUV4aLyFxVhwnCXx3iEIXR9leOt9Os7+c/8G/yzMPk/FXIbRrjt6djJ2980KyY+f2wvaavS5S
	Nc27i7Cmc5dOReEJNYZK6y+5m9GhnP69ZpKL8mtYTvUL0OhSzsYmLbYlhhpX5Z+k7eEN+AfdqsO
	aEeKVf/JRA2wGRlvrRLFX4MafSD1UmuhE/DBKJ602IB8zh0Cj0TojRIlNm2X6FZE=
X-Received: by 2002:a05:6102:548c:b0:7c3:9a36:bbda with SMTP id ada2fe7eead31-7d2daaad4dcmr1467425137.5.1794242982020;
        Mon, 09 Nov 2026 08:49:42 -0800 (PST)
X-Received: by 2002:a05:6102:548c:b0:7c3:9a36:bbda with SMTP id ada2fe7eead31-7d2daaad4dcmr1467408137.5.1794242981355;
        Mon, 09 Nov 2026 08:49:41 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fc8abcsm629675e9.9.2026.11.09.08.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:49:40 -0800 (PST)
Date: Mon, 9 Nov 2026 18:49:39 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: mahua-crd: Enable DisplayPort
Message-ID: <3ldmalxx2qiphh2bmkru4dgf4j5k4q5rlhsn4urbwmwxit72zh@7bzssinqivhy>
References: <20261109-mahua-dp-v1-1-c1fdfb8eedb5@oss.qualcomm.com>
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
In-Reply-To: <20261109-mahua-dp-v1-1-c1fdfb8eedb5@oss.qualcomm.com>
X-Proofpoint-GUID: snVR2t5qecviD5vNArDoUYSdGD3t5OIG
X-Proofpoint-ORIG-GUID: snVR2t5qecviD5vNArDoUYSdGD3t5OIG
X-Authority-Analysis: v=2.4 cv=au0nmiZV c=1 sm=1 tr=0 ts=6af1f9a7 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ArbKvjEle962CzFOaqYA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2NiBTYWx0ZWRfX2VFXf9dSdzk7
 JvFYX3B7+ZclFz9v/INhRHIY7JMzCJeCjkHt4T8Yt2JXQUk2TVa1FmHIWqfBOYSWZ4jQltZJabR
 lnYn7jc73G3IORBDsm0gy+jeuXQROSA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2NiBTYWx0ZWRfX9pUCJsfCKwmV
 U/Ixb5Zj2e0OIeHna7c0/tN4c8daKx0OiMoaSYVXFxp5IFu2swIbtJ+KUfqAT2fOJk7QERA5NVs
 6at5usuBS5hD7wzHXrnfZ89pWhDqyuobKcv14ZlTiZotTn2ffxsYb1hVi5vliREu7To878YAVxr
 dBmJK5uYGftJcmg5eJR9w1VVgADc0kHgJrKVMByA4beae/evTgeIOsSjB9YSmdckKgJtlSdThO2
 ExqjjkBoagrOIgrsz2o6duNv5MY73i/wcPJ+q9A4YwxSyrMfwwIXF1oHhHrIom4o34H3XmBHVNG
 AKrvGQPhqVtXNIPXjXsS+SqxESQnvV7kTyvguVeO/u7IRaYoq6LahK/BtWbbtllMHH6P0LO7yW1
 fy+86NfzdbTzrQ51M0SOsUen2cnBe2O3pZUF29wYZpAKUZfC21UwhCxLsm2IOfMzY5jQiJ8YLsx
 kjNfBKw/dxcKM4dK8Kw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090066

On 26-11-09 21:20:00, Nabige Aala wrote:
> Mahua CRD uses the same DisplayPort configuration as Glymur CRD.
> Enable the two DisplayPort controllers associated with the
> Type-C ports and define the supported link frequencies for
> their outputs.
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
