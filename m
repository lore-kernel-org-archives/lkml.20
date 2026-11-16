Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822000;
	b=2neA0JJA5ahcIPkHeXYjUPnX0xuNAzHDpxWp6SqubJSTNXrZ1Sxg1QgzRG429JgW+FVp
	 MOhhmVKD+01o8rx6JxsRqBWCs7eSjlSoJQ4PEl+fsBhxAbmdn3HcvFxsHua81qWDtA4LB
	 yxdHmAnrRVv2RVpuJ3hYAnysQP6TVrBVoLdWHzrfYwI09R3m5ymRNXMhBOjGtYeF04qC3
	 JqK2jkmAtF76hFDu7ASs1F5n0zfzN+RuUyYBXum912Scu7yCoFagfhDAS7CStieqoHFfd
	 3RHK6pAEL7/tiJ/smB8YiYQTfJeLvVUuGGo2jHiBosnOn5jj8J7kCGAHheKQF48INAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822000;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3NS380Ta+SsnqX0SjlIM7PyqYuO0HINtcV8uX5UeGVE=;
	b=jbCQpInVTiTddKOSUiTmCvRA0Lk2HdX6cOwxj1DPx87O2Yru3v6nkcwMzD0UlZ1YIT5p
	 vL7XFmPjOQ0WkrHoaUbCCwDHUvcU6pxSa3a5yZNTZweHKZDGwz/4JOs/SI0OaWw726XK3
	 b8IyVpvDw0vEjXTMXTY9nrc0Jg0b5n2f/0fR/SaG7TjHEgKLZRkz7NxU8UaCo+2LP4Ee5
	 r1WvikbDhr8CUABia9Et0ZY+tyiIRtCNF19fg+IaaWGBHpZLrQXxmpTNKVnA9z0oqbBJj
	 uHMP3HBXmll96yxsIgrp7GWvlNByabxbJ+A5KGCTF6bTo0iLmQ977EGDfDKYzZlwgIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pp3+xQ1J;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DuEsfVH4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECC2606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:39:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ECC2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pp3+xQ1J;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DuEsfVH4
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7f1Vh424086
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3NS380Ta+SsnqX0SjlIM7PyqYuO0HINtcV8uX5UeGVE=; b=Pp3+xQ1JDN2qpTOU
	apUC6yvkxPlSK5KFEa+zl/QGNENbtMcroH2IUsU1OMCnOP2IuIdQcfVJPdornGhL
	rFhD+n/bSuOVdIyn0TD9/cvY04xIzmA8aRD7R9QI6bUKNKNtybvPXKfavEUtRiOS
	nZPF/j0+qBEan+xWGTWBNFTE+V4rbA9wM+tsyR9Rk1H6tFK2fIKDuHBM6Ks/cRFC
	5Y2Igtex1JXTGEAYYA7cXXUdBfi3QUk1S7/1xpydZxqtHZeDpvRfwxDqdtJD7iWm
	WpJeU3kRE8fzFd7Nz9jezzjGuAglSe59BP7/aqO/H55dKBbqYfHF/tUgnuVljp4c
	PaYYsA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhkwdsdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:39:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed02a00b24so28519655ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794821998; x=1795426798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3NS380Ta+SsnqX0SjlIM7PyqYuO0HINtcV8uX5UeGVE=;
        b=DuEsfVH45w4s2jEA6sxfwOsvyVkrOuewGtJq220h/0UtVbQRSB6e06oRa7w52ONz9+
         auyPpyozNrmhbxBT+jG1Vm2/a6ho8QsveOZIrLu7onny+5ytoMeiig0pnEdKj/DakPm2
         Xuhcu8VFyDzehfFqJGqWpT5HibpZvCTPT9GAA+wJJBvFxKB546rcrjda4lASjI/DIeTs
         MayDqTlCHZ2sEvIjO+I6z3N9GayERiIL0IetNHpYHs1wN42qMT+bTWZ4fYtVPz3Xgk+c
         9BYu1oU+T2pm7uJ8UAx8hbP2vpcvplfYrkHADvnGAfGhSTLJ/Mq92lLHG0DDhj2D0M5t
         2COA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821998; x=1795426798;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3NS380Ta+SsnqX0SjlIM7PyqYuO0HINtcV8uX5UeGVE=;
        b=SJsRtlv2eMQEhG2Vcr+u6dXHEbZ2vP+78YFYQVR0TCvaVKhpN6J8xuR+ADWphY+apm
         jhNAXisnGIOZVxlIi0AiMGXH5jFGttAk1/8Lk4m04xmRPvrg4764RDsbdyoZdm3mqAHz
         7ceSvTV2O1uWUtmXop95BaYpzVkDqc7zQrnOpC0GO3jjHhMJ5SI47qlGwEdwcd8ghL/3
         GIxJetmYkQSQWKUUIpXT6YBSIwtNi5/N/cxjlNWJboPM386IFg3ULlcUwoZEJx8z7nN9
         mZZxAa0baqeWRArZuDFF5Ji9h8Q4PpiR7Q2p3PJJMIOEHUULn1OE1avgt04ZFgmu2nY+
         bU1Q==
X-Forwarded-Encrypted: i=1; AL+hErGjFKljP/8bKc2uOHB46OBw+cQKXTyWm1w9ulqDM04nvTeeXXJxZEfjbXYrx+OdB0f31yDH5GyShQXxGl4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2Xt4ym2R5itS5uBK5Gl67L3tPwxhl4KMVvUS4oTvtfhoYT+Tt
	tbpJAMT2Up5oZ+ydlG6l1QwQojS6p8xMhVQ4zPSuAXmaANcyx+/CCGVd8MB4yHujvpUBuGaAXDF
	EmwvnyreEq6hKHwaz2Z71HwOeL3koE5/CybE4CsRhYzLLgRWsCjGrZSECIq7AzK9Ad/ccvk/G66
	o=
X-Gm-Gg: AZFdTZcqwJ5ci8GP7nz1e/dWKkD2jwicjtfZjcpfNi5n1wB7xdeWN/Ztup62fgzROb5
	Z6TBejkzO/5BVN0GHsv9b7ZeUkk7U4Rxfe4wIamGjmzpj8PIpj8rA+1ZQ8ug27W3figLcqs2+CZ
	aUk5XKeP2a/RdlBHLZMZd/2oVYOXVodi3wEcuy+IE+B7LnNVc06KCn4/b6QpZr3aKWIpT540/og
	yYzF4L5K+/xwvVpzD8IFDSPUsBgizljHZSBV486aUy89Vha54nDzLceeBZZ9+sLrr6anq7VQ/G8
	n39x60IBDWfcE2J5YvFSY3XAff/6n5zGtQt3eTn+pFGmRiXefimW+v+b3Xa2YU0USLXmkCvP9YU
	A1vpoyiXq6OO4ina5lm0YPFBB5SeFw9W5qB5yqtQbDp3QMqnpOivyhZpg0z+zwBPxgri7V59jCS
	YPpHz+N0ih8B9n6/tYUJ/JGYzfPrwVrnMcDg5JbkNmAF26jUbajCBaeXCcCEvbgzhwEINnKaNmX
	FLK
X-Received: by 2002:a17:903:2a85:b0:2ed:eb27:6c5c with SMTP id d9443c01a7336-2ee0dca8c24mr98437715ad.50.1794821998069;
        Mon, 16 Nov 2026 01:39:58 -0800 (PST)
X-Received: by 2002:a17:903:2a85:b0:2ed:eb27:6c5c with SMTP id d9443c01a7336-2ee0dca8c24mr98437575ad.50.1794821997614;
        Mon, 16 Nov 2026 01:39:57 -0800 (PST)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75de7esm35587675ad.21.2026.11.16.01.39.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 01:39:57 -0800 (PST)
Message-ID: <2c7a2571-6683-4f29-8d5b-c3e8e87d520a@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 15:09:53 +0530
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
Subject: Re: [PATCH 0/2] phy: qcom: edp: Update v8 programming sequence
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260622-glymur-edp-phy-v1-0-814b45089ac9@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20260622-glymur-edp-phy-v1-0-814b45089ac9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzOCBTYWx0ZWRfX170AT60ARc0W
 n0vFJkk2PY+HXpEt6P2QS392yi/JqkLBiVdmAzKbeNf/HjMaUV4Q4nWmgMBCQ01sMut+Casm9qe
 Ui/CoINFAAesUuBPIkSYJISuQxGdnnYhSrDQSfyNQj2uwV8MK+MpPaOtBIAlhD0OGTs/+4VgPn7
 PFm8/uFo1cI5RrtNHMoAuRVgZZPvaBrkoQVx1ULZVcTZ0zXwyriLb3aZmEGX/WEz/s2JOIGrqMm
 RicHOwAshHtF/QkFuT/hFIZnAQFmq5j39fJ4dEheeORhlXcobqlx3atO8rbz/MlhI0vz0+HiE9a
 g+fELBJqu6dhBB7GbL30Pmd3a/oNsjccKOTgHnB6iuYeAm692XW+uZnWazIgf5W7Moa2+3bMF6v
 cr2EyQPvFde1zHVY2uhCrUtFEQGaUWAMlacbycz/Vr3jbzrN6+XcZHGELaTEHSFOb1NGkhJ6MOX
 VAkIf0KXBfzWv/1Pnhw==
X-Authority-Analysis: v=2.4 cv=YPYKWhGx c=1 sm=1 tr=0 ts=6afacf6e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CkkWTzGYo-v6zW51zJgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: xT1RV-v39vMbmHLeLFj2wocX40hpJhbA
X-Proofpoint-ORIG-GUID: xT1RV-v39vMbmHLeLFj2wocX40hpJhbA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzOCBTYWx0ZWRfX9G/RqRSj1WMV
 OMiSw73f6XN2t78PIcDMqd1cu3vuXyz2a6tYgPme7Ury2O52zhB+WlgnOqGYPPkAC/z4ztaqPod
 zx2oFxd2CR79OsPkgVqHp7q5uF1q+YQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160038



On 6/23/2026 4:59 AM, Bjorn Andersson wrote:
> The programming sequences introduced for v8 doesn't work other than for
> 4-lane 8.1Gbps. For 2-lane 5.4Gbps link training fails and for 2.7 and
> 1.62Gbps PLL lock isn't reached.
> 
> Update the driver to match the documentation (and Windows driver for the
> 1.62Gbps PLL settings), to get past the link training on lower
> resolution monitors.
> 
Hi Bjorn,

Gentle ping on this series. I've been testing it on the Microsoft 
Surface Laptop 8th Edition 13.8" (Mahua), and with the patch below on 
top of it, the eDP panel trains at HBR2 on 4 lanes and has been stable 
in my testing:

https://lore.kernel.org/all/20261109090449.410840-1-gopikrishna.garmidi@oss.qualcomm.com/

My patch depends on yours, and I can only send the Surface Laptop DTS 
with HBR2 enabled once both land. Without these changes it is limited to 
HBR.

Could you please follow up on the series when you get a chance? I'm 
happy to test a respin on the Surface or help with review comments, if 
that would speed it up.

Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com> # 
Surface Laptop 8 (Mahua), eDP HBR2 4 lanes, together with the LN_DRV_LVL 
fix above

Thanks,
Gopikrishna

