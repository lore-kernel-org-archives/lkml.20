Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903897;
	b=c9D6sc9n0VW+mFKSPc59t39jzLonhghCwwr2MYNlZ4Jhz+4MlkloJZ1w1gURrqk79x4I
	 wubRHu2sd9H/FI2+9QBo/LFmFxXVm9PAbzCH72PG/XU+3RKYNOUIxE2mCXcr385YGYOPW
	 nPo9imfx7HNG4EGSQXf9yQLJVb22K/0zmbMRgjBuJmLLm0b8UJLUyb8Ho1uTJ+127RAFI
	 jk6UvVbEE2kZrb2lOgYqZ0IMBQ4ptlU8X4qwzBTPxeuc77S4Jvy2P82jDXpm0uKYzc48F
	 GyyiMvf6VKARAiF8p32l4fNGcE8CBALNv12z1r4dYcvXenNXu6EZeHUIUaeESz6G/Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903897;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oKpw1EgHR1aB/CQrLKrjzYM1e+jNP37ETeLTc6XVfHE=;
	b=yiZXi6YtVfXafOO7KdQVWYgdWHxn4paJhXb4rIt91/Yk2011Xgdgprf38A4NKDEZD3l1
	 GwTBEWJ/8iVhU1faAmeyWipEoyUQeX51Bi1s13jp2uVgly807RhwkY/W30AGDPze5EeVO
	 IaEmU0V+cInyafRoLbz0Revs009ZrVx98bjgqus6QPTHtTgHEqb5brJmeb3D95Ka519bD
	 U5QrYnEUKYV1Vgjlf9QmJaj7OQYQwaPOUohuZ3wAhy4uYcg32d277T5xa8ShGJhSbcf63
	 H0EmFXHm8tta4QdVAdA2JFYgsbvSUZqM7/Ts4AAgYC4s1GDTeEYFDWx+xMhBI8MhmuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="CcaRp/CE";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O77X8iu8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2D8606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A2D8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CcaRp/CE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O77X8iu8
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8NGdj721418
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oKpw1EgHR1aB/CQrLKrjzYM1e+jNP37ETeLTc6XVfHE=; b=CcaRp/CEr2dke+E0
	5kstYP68Yv/FudXjdjfwPhpnQmQzpSW/A2fU7Kr2xt8X/SXS/8zIHI5IbfxoRa3A
	71bfo7coGXogtIMq61qYVdSbivvZxAg++p/9/BwAhmrjvVdmvGHqbP4e2KMkOO92
	AC9k3W0UG+15XWfQb3k+RKnVfB3jDXa0+HfFy4vG8faSelyX+GhAm1mEfjdZwcx2
	NZA4Ioc5WmCzpC+TCian2z7DjctJjLs1a7f5T5PwFW1tE0KS8yxMzr3aS8NVtElZ
	yae0qc4MqzopoT0HQUvlbmvGPnL6e1uCA7RIV9QjZI+tPsrD0XJhhFCMd77hTosh
	HKfE5g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0kcc808r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:24:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-947a607ec40so419478785a.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794903895; x=1795508695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oKpw1EgHR1aB/CQrLKrjzYM1e+jNP37ETeLTc6XVfHE=;
        b=O77X8iu83LxNV7yDJR4XdQcSxDHdIzd8fAUj1EkUYb9fqZXJiXDkuZWaNpRwgO9kA6
         2vQEXGBFDqCIX0IXxoQO1bABnLl6C1ClXIKnP+eQWnk3RmnuT/xL7VbN8tR/p6r0Gise
         ZyQ7n/FaoEXLmH5jfCbJvtaODouVuWz3ThqHMQoNd7JQg6T93mZPv442dYTkcOl+OCHK
         Ov3GhOmAiJzsF30Vy1XpyybycaRnOqMKMZPuP878KLJ72g3QaHDpxbFqkeuU/5PP7K4W
         9CjTykpSJmn9a1mJwWaYR46uTJ0x4tlL7T3vZWqcXU158/fxYg+No4iHSFP9BV+FM+Ti
         mwvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903895; x=1795508695;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oKpw1EgHR1aB/CQrLKrjzYM1e+jNP37ETeLTc6XVfHE=;
        b=sooNVzvvRkancGU6LJk2pLhbPbgQg+mEJS4drWXECcKNDK10hNu+JHsd2AP/N+q5UZ
         kPq+8pOyC2zEeWjkJd4I0JNa/Ll7JaJ0zp/tSHokI4hjE9Vx14+bPh2bVE7Nup71n2gr
         zrAY3eEvUwqyXz9LG8h7/aku3YD8hPGCeQK0SFnk2iuHg0wG+4buMRNGSrVIWbGnpLO4
         sMAitfV+E6QouirU7pK9jWYlGIenvfycl19oSYEc8MIogqW/VDAUzGxxwL0KFBOrHX8d
         R2lWzF4WFRSK9M5j09dearN+Hl5F2v8BvHIrLW7lOj7h/44WYJKSeyBlOjo2rAeij2xw
         Tnww==
X-Forwarded-Encrypted: i=1; AL+hErG/5arcK1m+33D567Fz8c70BuxRhB7tnRSr93kJ2AIycmP9MmpIjo3Z/A5EugiINaLyu8szGZXd+ZYLIrE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ziuiE6OoBKW0jCqv0tD2ecrw3DQm+SRKbutCeJ0onL8jtwlbB
	VUaOFnB3JX3NZPvgdyGpPFRXRG1q4xhApwdgvau100QxYxJ9N0PPY17fHnnfgndod9NJUDCnJp7
	z5gdb9JIBGIVx+mt6zLpXZepYZMRvJY7ydFvv56IQ1sIUdzgy72LwkeOq0R0RpXRBKRw=
X-Gm-Gg: AYBFou1UwZsENCQYcbAXfSlB0kZPIIsLT3KNkyEFfHh1OZvjnpmGKJsgPtEh/zUUXQ0
	ogZNXr5q5YYl70hEfZuJhvEtuN9QA7c+FQWmVK0MdkD+EbzrZK7qIm83FpefaBZKK7QcfTFpFBs
	UQrNlFTTk6vzw3sySfDhUWDW2AzBfruQn2oY2yF5AHLEGAsTnd4lfkDAaksyYGMyXAOyB5OtVHY
	8sIYTdiXTg+rYEY2ZX/nbhiCq6zAeH3YHZ6Q/IUa8cKrCfchjeUaykoCZVgOjOWPxDjDf3ioRWJ
	8U1st/SpRN8XIUEVv0D14rmtvNNQ80OGwAJflAtMykETUAygE3wc5ZyyQhHMdIIM5JAgGi1ryQG
	woUwUa/0JELdBZpTA41cNRbkcjuqziR//E1G7qwSysiUt1P2+qBzxvDuUaMBPP2Vn/3nYkOZ7Pg
	k=
X-Received: by 2002:a05:620a:1a09:b0:93d:23b3:5088 with SMTP id af79cd13be357-9494bb88e1emr2099311585a.16.1794903895309;
        Tue, 17 Nov 2026 00:24:55 -0800 (PST)
X-Received: by 2002:a05:620a:1a09:b0:93d:23b3:5088 with SMTP id af79cd13be357-9494bb88e1emr2099310085a.16.1794903894864;
        Tue, 17 Nov 2026 00:24:54 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb62d0d430sm108041035e9.3.2026.11.17.00.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:24:53 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Andy Shevchenko <andy@kernel.org>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: (subset) [PATCH v3 0/8] gpiolib: scope-based management and cleanup for GPIO descriptor arrays
Date: Tue, 17 Nov 2026 09:24:51 +0100
Message-ID: <179490388564.14898.15796530386189672600.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
References: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMyBTYWx0ZWRfXyLngZvbyzpah
 uLrv9FcuUuEsRG9xm2kYU7a+iBg1wKdE/3bvSLl4UZndRqL5LDhfrb67LcHeJr4CLCCmUJ8J5xs
 L0F8zN1FxX7XX9RGixeUYG1v63kkQO8=
X-Proofpoint-ORIG-GUID: fxyaw-EFJzCweyI8U2Ru393xAOhObc5q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMyBTYWx0ZWRfX3lbcoLNizQm0
 m3HeC2BW21au3uaEypMrPn0+xq4mCtKhcGOSysKUrbEYU8B1dGp+McKSav/Tyl1/fsPp2909Eby
 FpLRH7CqKebrj3y7KngcHQFNTavkbSUv5dFB+CayKxgqJX3Nv8eUk7QT4xE8n0WWweNLql6bzWQ
 RyIPvRX+esyQmGUTi0ebCUq3nk8eYqZkXm+wwcbhF71RU+N7cuZklqnTVeXG9EC8aDg/+YJXA5r
 dnAYL9+bF517VnqtXQz18yXYXZVA6wApdxQP3e2kamycw6z8k8DgqvlMzSpMZUZyfrqkMF6PRSe
 m+L5cLFx3dMuxOiZ+KZQKCD++aa3AXVW0RbUk5vIWx4hz5292nQDYYWBWZX77vZuys7MOSgRdMv
 M4F5MZxmmBiuZTDbkgwG/1Hl7pRzdScA4av+vtbQJl3VDE3mTGTE9VeoJq9S7GtNNjS7+OqeV/s
 OxlMhv0dKJiXDhPjxXA==
X-Proofpoint-GUID: fxyaw-EFJzCweyI8U2Ru393xAOhObc5q
X-Authority-Analysis: v=2.4 cv=ZP1CCn7b c=1 sm=1 tr=0 ts=6afc0f57 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8ZxHLKPBVxxFydpm5EYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170033


On Thu, 05 Nov 2026 22:30:14 -0800, Dmitry Torokhov wrote:
> This series fixes a GPIO descriptor leak and a fast-path cancellation
> bug in gpiod_get_array(), fixes the !CONFIG_OF_GPIO stub for
> of_gpio_count() to return -ENOENT instead of 0, introduces
> DEFINE_FREE() scope-based cleanup helpers for GPIO descriptors
> (gpiod_put and gpiod_put_array), converts gpiod_get_array() to use
> them, reworks descriptor array allocation to avoid krealloc(),
> switches fastpath bitmaps in struct gpio_array to bitmap_zalloc()
> and bitmap_free(), and uses the %*pb format specifier when printing
> array masks.
> 
> [...]

Applied, thanks!

[4/8] gpiolib: add support for scope-based management of GPIO descriptors
      https://git.kernel.org/brgl/c/fea70edc18a1bd360c2f1b090662dde3d38d5357
[5/8] gpiolib: use __free(gpiod_put_array) in gpiod_get_array()
      https://git.kernel.org/brgl/c/d8e2afd9d40f7ad9514fbf7aa725558448f7d679
[6/8] gpiolib: avoid krealloc() in gpiod_get_array()
      https://git.kernel.org/brgl/c/7d930a8b28f40ed7737b49b8143fda2489732e22
[7/8] gpiolib: use bitmap_zalloc() for fastpath bitmaps
      https://git.kernel.org/brgl/c/fc5fab320c2b8bdabc0412d3f5a5d1e058a56d87
[8/8] gpiolib: use %*pb format specifier when printing array masks
      https://git.kernel.org/brgl/c/90000c03a9f6c74759f773a5078088db81514347

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
