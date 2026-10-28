Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176386;
	b=U5709Cggdepg0vPfWQOLekrOo2pkOw+oxGCBqCEC4wWUtZq/zJ5F9ifyCWL2OhvtDVc6
	 RkgoNTF8S8O+Ggi5Il1bYZk8R/De/UI/szHwOOgJCbkpkQDPViB+XdHflL+8l5ohG93Mh
	 oZyvlCyX7Yswfxf9p7io8WLIKHFE4xKjTGiKwHOo+BcnkoliFKMs/G58LnVVz9oUsHBuJ
	 BnIaII0cqVXUhhmjm2MjCQpJkuWGWrfvn4AAfMAK0y9fBpSmEkMIFs42soInMtRlKhKYc
	 KP829WrRoeMID/j0TCg897ivB12f3Nwwo5leSRbZ0xaTE9KiHOFPshbLD2sKbXhLtSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176386;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=viqlBcGtG71a8N4wre7oeGoEXuTxbaTYX3CjvxX08Fo=;
	b=qkEjKR9xEqD4isKacukGnZdgDDcvtsBdQwklCVYFItaHCAgMck463CUd/4JjiCtGriqL
	 Fifklaps2gSsuFlzdx9LxEk/4JXLKt0WT6Yrm9qHvK7/dYHzmT/+xGHdmbrlBJ2HmcRDO
	 0OoooyudHlO3aoSo6/nWid547Cjs5QwNr9TCeMOIEIW6BqNf2oXODy8H2Uwri2lYShll6
	 YEUkC+KHLqp+bN8aklG/3ew+/Jm6tPs1L0iIBr5Hc3q5tgZGyjVV6RVDkJ8YFNmrjHNXI
	 ngkHsmfLuFtjUpbRGkDC8ivv7bDS+ORibQiCND5z7HbRmRjHuYoOPEJz7ULWRtBx47Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cRqiiwO9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UAdhJmMq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E5E606A323
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78E5E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cRqiiwO9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UAdhJmMq
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8KNrB570442
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:33:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	viqlBcGtG71a8N4wre7oeGoEXuTxbaTYX3CjvxX08Fo=; b=cRqiiwO9Gu60KS+8
	SmrH4pGEEf+k2Tng6ZiE0GUC5w1Nid4/klDoXOasDd3/k2OUF0XOammmXW+9QIJi
	qGTOKyM5tcLHEpfhqMLipfp8Ascwb6gc0Mc3wEzZPfp+LioYKZ69gBNY+aT5aIO3
	y8umv6NN8Aps1sf0VhdMHuv+MgYTl/w97q7IVg2vF+o6C6pplO5dsjxYD+V1K7C1
	UcUEsBL59oxUOpYA8DCH3noRDbvhhvSyLMA1sOe/rUivqdZpL5yzRiMXhMW2qtJi
	Vlx9OMvGXzfpmeooqj7U4K7/uIDpsStZzczTIFfIoqf49+Uk+h+G6nKl6lsztq0M
	Ce/m4w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy6738kp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:33:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f37c94ceeso366475985a.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793176384; x=1793781184; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=viqlBcGtG71a8N4wre7oeGoEXuTxbaTYX3CjvxX08Fo=;
        b=UAdhJmMq84zogFkGwG3a69dGAvi/WXA/SpwonQHu+7EMfmgpVBgMqlIUVJmSiM7hRk
         jfg3zxLZxniDaw8m1YtO90g+ynT2Nj8UiXlIz/TlRjFE4M/hmqH8soaPZIjiB3pbpJFG
         H15FzJzGi+IfetT94muEUKeOhkK+mgpmOHJvLqTS8y6rQmMaBALgHL8FyoFBibFT23+H
         C2ey6gcyVHVp5YV1W1XKnUXbULjxbG82TCP1dodb6f85YFBvtkSTmK+zUYRK9ZLiswIW
         CjNNO2a8qy/GaIoHhrAuhp5erAuWl57c3nqymlKZthCBQmxiL7xv3I7NjvlX569/LHdp
         alqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793176384; x=1793781184;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=viqlBcGtG71a8N4wre7oeGoEXuTxbaTYX3CjvxX08Fo=;
        b=HY3Zcovd1Gi/Brotr9sdN53YWc1igkogYuzCz6GPWGdTfsM3wxduuk50nAQHu0Knp+
         6rVDNpkDnfIf0ITSFfgZZvIyiAorgxjCkeMwltcT6iAeV66tcARLlwANg+MGsk9NGLOk
         sAGTii1ocXgkoOd5WPXDcIUmJmvFlRZif2fhY3BnQKvo2d8WiT92bG2VdQN6oOShhPqX
         CAePH5lrLDiuxkvMKRHNVH+is6BKzUO40G+UrhnS/QuBswP6WbUEOgVyJKykpfBKllp+
         1tQD36SnW9tUHVkppHMZCdFyoTgSRuFvvCQLSBNx2hQxXpY3yVhGcdLzKb5/6bN4yKWN
         E+Jg==
X-Forwarded-Encrypted: i=1; AKwUvBzpMMuXQ8kaOEKX3QY1aGAPYJWdXthLQ5EVvGli4GghmiJwn8EAvXYSL9DWOwJC8kJ/VVYDfuGO5KuyjYc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9VsaDk2NjLfU7qOOpkD2tHl2d/otYkLUEdPv86H0foj6MSXrL
	KIgQp0xxhI8D4/FGUoACc2x/ZAtxebLJWwuypwnTRBp6oasNFAw955kkvZqJU6ne8dsp4g8N+8U
	2uCcSqoXdBz8lDFqCkjMpWm5mUWx/plN2IlpHa/TGtU9e8+Y9Hn4TanAOhX9lQuF6Kg4=
X-Gm-Gg: AYBFou1iJiPElUtH4OAbvpVPwwCcsm3WEfb+mAJQst5MI6UZduB0cWrV4Aq6QT+4ERY
	ddde0ixhL3b4TpAkayzKaTZFePaGLQzB+TTAG00O2Med4X/4pMAzv0TkS409hCd5Vo4AqMtXNe8
	A3VoZFPg2s8QCcTA/NfND+25L9jBuB21N0ntnOC1WdQFiSVQODPxX3N4TFwEH9MG20wjwz9yKZo
	wITQFm/+zS5CAOq2+mBxWrZZZ6xjG249zrqqaR6rCYYwHp21o3aGMRDMhBCfMpJ75FGGTEYQAj5
	7gJEhzAYDZIcM9S/nY32SVEsxoZkC+hcMeL8wgtsvkdmXHg4H7U2dBEsobPAEB4VWbXCGyTrboz
	43wm2oyAPshGbawdXPMD+4xE7sKmX1TgeGgYyjbh3ugHDPZ8w0USkNzTkxx8tAuUhulHN5kio34
	Yb
X-Received: by 2002:a05:620a:17a2:b0:93e:e111:2778 with SMTP id af79cd13be357-943f4b3b1bcmr884134485a.14.1793176383654;
        Wed, 28 Oct 2026 01:33:03 -0700 (PDT)
X-Received: by 2002:a05:620a:17a2:b0:93e:e111:2778 with SMTP id af79cd13be357-943f4b3b1bcmr884132685a.14.1793176383199;
        Wed, 28 Oct 2026 01:33:03 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3a1csm27503404f8f.16.2026.10.28.01.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 01:33:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: virtuser: constify struct configfs_attribute
Date: Wed, 28 Oct 2026 09:32:55 +0100
Message-ID: <179317637229.6922.16842408860731140713.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021-gpio-virtuser-const-configfs-attrs-v1-1-bca474c9cd12@oss.qualcomm.com>
References: <20261021-gpio-virtuser-const-configfs-attrs-v1-1-bca474c9cd12@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 99T0JYAllW1iI12iLWf36fXgq_CRRDNL
X-Authority-Analysis: v=2.4 cv=QvfLTlyd c=1 sm=1 tr=0 ts=6ae1b340 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vBPT46HQKAXVtv7808kA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzMyBTYWx0ZWRfXyIv0gdxYzaPb
 MzLymNbKmSgHsUKF7ms8dtL9WirwD6m9IBmZRZJEBIA3WWQp/6/2g3AUTvSPaSizjtWyPtXwwZu
 m5uqa1hBEECb8JpsIJZj+D7HaHW8i0g=
X-Proofpoint-GUID: 99T0JYAllW1iI12iLWf36fXgq_CRRDNL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzMyBTYWx0ZWRfX/yMXN5m8kb5A
 M6iGQQmZH4L6SbjiBEw2mpha8kOsm/YaP9oQmbONlJukw6cYDOikP9uSDLGQmn85vAsIUlf65Ns
 nJsM9/vm2dPBT8QAQq+s+m/Eni9GxsYjUvyNQfYk9Jp24E/KmV9Ow26J7tIbCzDhU6eyDNJy+JT
 CO/tdJbNmjx0Ds65n3u9dnzZDh2IGI+RhnwcTWYfCeliMRBoAu9XbXAgWiCG1tAQtTxqvL3vAGx
 +/AQaykP3xmQwocvN8qUPVJ3GysbP+71CsRzCIyJrUhMAsVH09GiSmXWeakvYQDOSune2GGOM3N
 wF+WEBDJ5XqxZ+2XbjpTOXKo/zUd8PZI/KeQFC+JJaLLlwLDczHWGdRXuE8lwhGiqsdgFpX5jN0
 pbJrOdWkn+lht7SlAYlEZLOX6dim2yO18cgVpMaLdG+sMMjdbEVYp7B+KBbsbIb/E+8kJu4qFjF
 zLpt/dxQrNmhO77joyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280033


On Wed, 21 Oct 2026 14:24:29 +0200, Bartosz Golaszewski wrote:
> In preparation for the constification of configfs attributes, make the
> existing instances of struct configfs_attribute in gpio-virtuser const
> and use the new st_attrs_const field of struct config_item_type.
> 
> 

Applied, thanks!

[1/1] gpio: virtuser: constify struct configfs_attribute
      https://git.kernel.org/brgl/c/a67ab3994716e1bfe86b53330d1cf2f5bf6bfbad

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
