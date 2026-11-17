Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904395;
	b=OfgeB182D1K8JXuDrV7I61UEG28zMqabJKMni3YLviIHDhkhbu/9yt0IxQ2EqVKtAarB
	 JaJdcDeWYClhYJlwNI1cTELfk+h0D1VioEQ9hD5rYzI+Kv3Xc0Q1DAQatiE+RZwoSP8P9
	 N2YOBqp0kAElLSnyNoJjmWTqarUUcPGiBuFKXW5MmmHf8qy9fyYVGDLyAjOjdWf3aK0HI
	 C2cej+7GsZDzOr266tPmn+crDG5FTZidF1LgMYrsERY0wvfZM9Hq82VoRgaWgoBCes7nj
	 ZpucNJJleO2lTUqpAT8otDsnV6l/Eosy9CXYKgVY976972msRNeVdse3ynAUnIEBuHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904395;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qTaPbmNErXBwiuOezragKKQVbgX59r+D/qqn57oH2Ak=;
	b=NutwoMdoEcDK2yoGhiq1oL3Y4097Fv1yxifKNW0aIpWuBc1pot4JJtUj5xuOsgqcG7mf
	 hNGjnJIt/hTCBr6uiQNn2HnG6qE3lMYEyCN8d7ROz8qIhgf3tqS68JtSGbWhAyjqw95VK
	 QiGWwOhJWZroSL3QzwwRvhBHKK6uwreD4HiXo5nMRC9Dtg09l/Q3bID2mqITxSKew/R1T
	 fpmLY/3RDX2WQZR8UlEgUjouhMg5efTTsBhI0wRhuoIJC0KDJhPoHm7wrCwq7cSkOWZff
	 x4pFQAV9OyMeFdhrxUbjlCc7l5RWpJmiEK9/O3YEIoyyvLGBlyM7pTS0+zGqRt4VEJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JlcKKq8s;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OMHntUea;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D47606A882
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:33:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05D47606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JlcKKq8s;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OMHntUea
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aKd31800820
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qTaPbmNErXBwiuOezragKKQVbgX59r+D/qqn57oH2Ak=; b=JlcKKq8sGs60RAQo
	yoWKJ/Mh7qfqqXU0Hw3Mersbr/hZLvG8eTW+duvHiA0cPb9qpcaPIt7dkPwLVqsN
	/lAMNtPd1RAIwDQalhBTEk3BefKtWfequ+oihB4lBXpK/MYFp3euoYQhNki1sulM
	JXb1OR/l86Jo/yozADRutrfStKrkdBy5ZZKfPFoTEJ8JT7UHsjjzIOIjs/+4MOmE
	psDApJkJMtjZE1SYWM1Ji96M/SPI9eGUMfOg9fS12auqD7U/AlbxfsDwakatC8w6
	Jg7Jtm0NUbhcvCs5HcQ8vTt8jh+ssuY7H77JLcLJRV35NDtQ/uIc42ldqHaER7PY
	Y6Vv7g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j034y3vq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:33:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so1102017985a.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794904392; x=1795509192; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qTaPbmNErXBwiuOezragKKQVbgX59r+D/qqn57oH2Ak=;
        b=OMHntUeaNhpVYlWuzU5G2GuPCSHURdW/7DR8u2UUXC9VbUvu01Vd70ZVIvhizGWp+p
         Pd3Uikfvl6ITMkmxbCKHR/e63MMGjD43PjMqkC/BwgnmFeQApFxKoR9Bg4f4Jgo76r4s
         gRB/8JcCwbPwet4g/TcusqmnIivtRjLQk6/MQrxe0Ul+f/LyG9nIOQmp+O4z4It1CP2z
         yzbs6W/TguPZ0rNb3OQ009ViehRDylIpDj3NdKkTod+mPx8b8xllxe70FGFWttjAa3M/
         OGTXfB5qUj53UVOYWnp6w9J3mFMi+UfH5hPTKsGc35PJpspBiVuG0+4ExM97FAb2fLfv
         BEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904392; x=1795509192;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qTaPbmNErXBwiuOezragKKQVbgX59r+D/qqn57oH2Ak=;
        b=ZDgTvdjeyAyuGdwDSrAOttEfu3mHbYlHB4BtrTO/7Cs5hzU0j4U9kS49VAsrNDjO+k
         ugbAx0QlrO/OIH0d3QwcfnMTW42niSm7FUnrW0WpX/MCsTOrrgL7ovYInZ4in/KnliNv
         JPwHIQALTyleW7DBA+hYfv7ChK20gxsfIVZ5FWCGtDLsFkFwO4mNSWiJCnjQvtZnfosB
         8HPx6iLCP6mwg1doHmBY2POKzUsIzrH8bkIQUyX2mjPvgx3qZGTpUq+0n0/poOeffBGn
         cWW7wf7Ng+ZH0rl1i8Mfg+VFUEzVqnM4kzWryhDJYnjJHNRSXVmiGuLyU+Th3PXXZj3J
         BMpQ==
X-Forwarded-Encrypted: i=1; AL+hErEP95eeCVcQ4xuTCCAdDo2G7BVbolo13qzVYXrVLoAw1lV+1EkB+81pLtcd7f/DKSW4aMX/yTpvcxOPZCo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MrrWwQtmE0w+Wby4NIhew3yLdX7U5Lg7GjLSLc7sdRDpDS8wF
	USmXZyg0X/zngtkm2ysy/TqWCSV5/1E8guHtAZvOh+qjtCwbrcHkQJc8joDJ423pltdsENjDo85
	SO8wnT4WlNZUC3CX7nz028T7/nShPQuaO02BHIApzsX0PviX9DSVo0f1DxhF6BFMdc50=
X-Gm-Gg: AYBFou3GRhkVA6xSlf5yoS5TE5SrXLRzx3Yhviq0kx0RT0JXCgv73xBN81WZ7U4UsZt
	VDyMFo9BIkkt6TEw0bmO3lNbzU9ZfAUg5wwz8TjjGeE4U7MapYQNDWBMFcGMZsbiiCeIngLpghc
	ddC24reWKlsIkDxJ4TONJPylIJB63AKwZPcGTuCkGhNCXpV9AuwPzo04ss2laHv3o8eiX/4z1Lj
	oznHkI/ld4Oqfj+JdwdW3Glq7PPOwAc+Rhnd+Y/1vf2CQm83PQzgZ26PuKVrH5qZB1k2gjN2yOS
	wW03j9vibAvd+igGL/s3MzoOKdOxeRPwX6gp465RI6SqbrYnzK+xzwi4fCQye4tV7vRx5SRUEd4
	VL7DO4hZlO++5+Ev2W8V8ZZqXxHSSf1Ckks4HR9orDuoS4osKPKCKAl/maiBraEMroRLQz4gwTr
	A=
X-Received: by 2002:a05:620a:4693:b0:949:6e15:e1db with SMTP id af79cd13be357-9498b875f48mr363268785a.73.1794904392303;
        Tue, 17 Nov 2026 00:33:12 -0800 (PST)
X-Received: by 2002:a05:620a:4693:b0:949:6e15:e1db with SMTP id af79cd13be357-9498b875f48mr363266385a.73.1794904391831;
        Tue, 17 Nov 2026 00:33:11 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571d7e87sm246783055e9.3.2026.11.17.00.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:33:10 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v2] gpiolib: keep the line state workqueue alive until device release
Date: Tue, 17 Nov 2026 09:33:08 +0100
Message-ID: <179490438637.15815.8754565205390800066.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110-gpio-line-state-wq-uaf-v2-1-ce6d8266656e@oss.qualcomm.com>
References: <20261110-gpio-line-state-wq-uaf-v2-1-ce6d8266656e@oss.qualcomm.com>
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
X-Proofpoint-GUID: QU9hjK7oiX31Mw9t0jGLFytRA0LgiYmO
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6afc1149 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IXciJTxnJKSDCwE9BYQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: QU9hjK7oiX31Mw9t0jGLFytRA0LgiYmO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMyBTYWx0ZWRfXyygno77BQqoL
 uh8z5U9KGcGDhWPKiqB9F1k6G37MnaojVmqd6rFaq5j4YLJEzUeycq0cahyMEvaTHf2eegQMGr6
 KdEZVyhPaESa2tfTZYeSeNhv2yPIx7U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMyBTYWx0ZWRfX9w22brsKdAID
 CPsi73DKCKs5ECvt28HDAkdg1bAYPJyADG5UsAJ04Pjl4WVshwoJdt45R/Mkl2/fd2T880jPg4T
 u7iwknmR7wr4Jo+Vk8k3r291h7P2cVJMW6Y+rVolIpM8BA35Zv9vBUHXpYQgto+g88XaYnCL92w
 vkJFzdn/lWTwlu3vPq1i2dxpX3bRePBmd0e9A6OWEFArog/lOordYxTA27NHUvDpZvIIdMhmcpj
 a6hKVlU7oNcKiNU8E/I3htqo+j1RCY5wfBT52oeknfCeVXEj9G1NfmS5pNwcwDOZkUj0jnvKDuZ
 gHErkbyb98VoMNAShGk6a9tKm8HbyPNkczMiMRUxLA2ZFaWpvnO39eJDWu4FALt63LbYMqtB9cm
 Ytiia3Rks18OpyzJfAkxRrOh4xP1r4YmlFBMeUX/gtWHsgWKuI3Sb1FczltO1Vn1rJolZcRxq1y
 uqU2SSerc5Oj4VNxFdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170033


On Tue, 10 Nov 2026 10:29:34 +0100, Bartosz Golaszewski wrote:
> gpiod_line_state_notify() races with a concurrent gpiochip_remove() which
> unconditionally destroys the line state workqueue causing
> a use-after-free situation where queue_work() can schedule a work on a
> freed workqueue.
> 
> Keep the line state workqueue alive until GPIO device release.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: keep the line state workqueue alive until device release
      https://git.kernel.org/brgl/c/2e002a1d05b1979006f3c46eb6cb5cc36e5630ac

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
