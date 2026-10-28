Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194045;
	b=SWxVzdzyfBTJ/2jvKu1qj2svgwLOXlDzqWmeGz7hv4cfBhTHhYjHg1nqaR1i0xoU4lHc
	 WvqKJlF9wjzn0ryZt1aCBC3v+bfY/YSwKtbAgEyo0+gM5CbcRL/LFr4rLxpyksR4xEZ7n
	 vem6ePEv37+VS2UvZ9qXSYA2v4roMDEKBraFJf1yinc1mb3HA5NMtbasbfue0RfuvxAhW
	 mkQh0m8SmVXZFDte3oJm62AekM93XSepkJeAGUUviDB8I50BGfQnGu3de46gnwe3u79w9
	 NC6ID8RLyl6m7DcNE17Xjl356QGX0BFZMpuz/fdJ0/Jm6QUGS8TegNfZhBvogdw+aEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194045;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+mVvp7TjbMKQWDHg7IqBJlBTx3ZQ6XoSxRPaCYFhPkw=;
	b=QPfTzaBid55lLtVvAVXNwkNlRBRd7WgUDKkk9MBSYSlqnRrZKmm1DzZCvZP3Rcggvv7b
	 D6EiwW6cAfiqpSpy39OceLngMZ0FjH70UgyaEW6og9t96NTftnEOW3bJU+SpQG7kK2zyg
	 ryUymNBKuW5B3ep3Jsjv6X4GAPHRlYhKLznv1Mcy0X1i7IPRbWkr3KrpersNxyUqgGm1Q
	 CJ3nmLsoLnNbgLncu7maNbR0Pq3ca/mx4gIx4FrEROEoiDu3fgyg/gwyz8v5sCOrDs4CU
	 +KgCh54jfaJkcnCMOFtQHnxbPaIW1QQFmcWyXMZouKqKXm/+Cmah0vuV+WdajrP2zfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a1l09Ix2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Er0SBlZ5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC43606A324
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:27:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABC43606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a1l09Ix2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Er0SBlZ5
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe4lj1053339
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+mVvp7TjbMKQWDHg7IqBJlBTx3ZQ6XoSxRPaCYFhPkw=; b=a1l09Ix2BCcHKKKZ
	fGLBdzeI4THVJWj8zMXDns9+h457BVMzP063mYKfUi2e4qQdrdTNmSn1r5sTI7Ls
	Tw5Ja+63kly6j/NeA23Qg8wsZeLUjpT7m+LkNYWz6cZklBO6T/wOGjMtQNAybUmH
	3VwafKKTZ7CbGhcY/1eZhv9QQZh1rIefZyAGZyXuR3SfX7ml6j2KeMM/SFSS+d32
	8q5AtVgI021rI9d2pC9gW6mZlzmH+Vfan1kqRYN2IRTMfQoi3wCvvmtBG1C118fd
	npVRNI+WseHZgqa5jP5+j+P2BMWMDpPzxtCDjp4JxK6TvTopn10GUTxrTPByalPq
	Phqftw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhw9kb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:27:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1e62510cso226747785a.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793194043; x=1793798843; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+mVvp7TjbMKQWDHg7IqBJlBTx3ZQ6XoSxRPaCYFhPkw=;
        b=Er0SBlZ59z6qbciRcWPXsOMYAey8/finMAPhax7kY4vnYn4aPuRhj5ffQjw16FJvO+
         5d99QwAalDGCIm9gLCu9G74JBf+ub0LPEe/15XfjZjD3EOVw7e0xwDGwsIXr/ygsUQPZ
         XwQPtvdZmgcFN0agIp4l061nYee8KMRTTPpYDArgezJwOo8Iskl93IHJ+7GsBZolsDqx
         hm0IXz+BKZBeFpg7UZCUMUtRVZEvLA3iLNbZ0foHtYjkaFfbf2hr8xjpiGVkkGYxwO6t
         M4Ye7bajeHhVREbukdnGsHnW9jpEVa/r8i4pXSGkfRvuS8mVYjSJIcI4xmH04TtyfRPD
         t3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793194043; x=1793798843;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+mVvp7TjbMKQWDHg7IqBJlBTx3ZQ6XoSxRPaCYFhPkw=;
        b=M7rOBUz7bSeDhhMJGj7GVoTs7rSxzEqC9Du0uGdZIwBYta8M44VewxI4PMlch92b3i
         +9V5PWib6GeWzR1ehk2xnTPXs3sZEBRGeAgbiqNAA5rng6Dz5Pdj/EZh/Shb8MBTWANQ
         JNkTfTisMtVK+TnfwtBLfFKaTpKPi+ogPyJYs1Guxd0Z71X/MQ4X8P7Wee1QxI4105vC
         Reuel8VhhCH30ykiI6QQnNDUDytVsmJCRjAHdkpbcme4usuf0agd7rwWjgnAGz6/V43W
         1UH7AtLDDtdnRZK8GBCt3NxDXgF5Gx9rWY7JLR+XbwWtrf/GI16bmvzkXAQZmNevVSeC
         REVg==
X-Forwarded-Encrypted: i=1; AKwUvByr0a9MVEatZHTjhbiprL4nEujgAVisuI3fggeRrx8v4s9gmUobdMGR0yndRoZf6yWmgVX33yII/ceOyUY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlq9VaNOQ24YC9FdmR/jcfwGx9R2owCSBpYaHWkxOpYezaDpdi
	x3TcIhaXCw5sudHTvyGd11D+PdeHCoeFXOwleBoCGJzpdrUQkrqsxLYpY5DvXsi99+urmUpOXNk
	TckGOr8Y2qRFpDtJPAgBg2aJT63s4rM+85wYIIePDQ4cb1FuaXU/SzHNaBZBcaXDPTRc=
X-Gm-Gg: AYBFou0fGfrx9V8MaRwyhmJaWsvvqfZP0GniTDGBG6yNVeJv1O9tET+DgZ3J3mMMi2b
	DZb+a5zqWZqq3kux0zaH1n4YFWTtlkLBIvFNXq0O3fQkDVq4kcV1voOvsq0Ult11+a/io2GLN0C
	9ICyWT1Q84EESleCVg9Hxi9y5xVHiSC+11pld1JUZElY1hD1JcRUjbW//pnfOv8zsaEC2xhAJ/x
	BIHIf94zYG4vcffuwGDI5AAxaXH3B/yYftp7lV7hpMokKvlk3jw6JzKqs3Iz7eG0xaLtRW4brD7
	n01Qy0o/PVtB6vvCryvRjupQ3NmMsrgNu10R5uhmm8HdHS23fMcygIpH2dFVGUp8fVG/W/egj+5
	gstPgeVGIHdJtj4c5MBQpO5xLdvb3THb7LyuorgKyur2LBE7AfyjENpZLl82oilxvRJo3B/oKxI
	lUzlKPhw==
X-Received: by 2002:a05:620a:6ccd:b0:93f:3219:835f with SMTP id af79cd13be357-94408d6566fmr316578585a.81.1793194042832;
        Wed, 28 Oct 2026 06:27:22 -0700 (PDT)
X-Received: by 2002:a05:620a:6ccd:b0:93f:3219:835f with SMTP id af79cd13be357-94408d6566fmr316573185a.81.1793194042330;
        Wed, 28 Oct 2026 06:27:22 -0700 (PDT)
Received: from t14s-gen7.fritz.box ([2a0d:3344:53ef:7b00:6223:3974:4196:280e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94fce50a8sm37133035e9.4.2026.10.28.06.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:27:21 -0700 (PDT)
From: =?UTF-8?q?Lukas=20M=C3=A4rdian?= <lukas.maerdian@oss.qualcomm.com>
To: Luke Macken <luke@phorex.org>
Cc: =?UTF-8?q?Lukas=20M=C3=A4rdian?= <lukas.maerdian@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7: Add Elan touchpad at 0x15
Date: Wed, 28 Oct 2026 14:27:05 +0100
Message-ID: <20261028132710.10051-1-lukas.maerdian@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261014234949.1730808-1-luke@phorex.org>
References: <20261014234949.1730808-1-luke@phorex.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wRglPS5U9-Q_Qp_v8x8w8tGwmZ8lMlXH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX+ap1IZYt/78h
 QlXQKcYUpn8FulGGCrgnkH2mfEsA8NhE4b04ss0f4kMaaeSaSkcyMA9qQS1BAkH69WJ76Vf6xgJ
 SZh9h1VzHZWJmBUL77iZJOXB2jiIkBg=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae1f83b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=meHnPOM5Jtsmck6FLoIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: wRglPS5U9-Q_Qp_v8x8w8tGwmZ8lMlXH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfXzoMpIacg53zj
 oZH9JAxUEjn7tBdFkCVwECxVAMM9IqeiSFGxbPTxwlEbaLpdAb7MjAtB9qbZNJ65qNqVbhyDuQy
 bCNInaVI7MJc9+RJcFmd/Gz+N9XPJj382nmZ7gRLIi8g9cV6vqNRQ1G/UICdghzV3z5SF6aZYNL
 zVif5WsO43at9qbGYcVEprM1psF2c0p9QXkPTCc261KM/9rGdAMsIFjo/6024ce/jaq4TbXq+CD
 jawQeyPeuon/pNJuN1I95q//+JXb/t29QhYrEKpEDTP4OZeJdPNNSgmZl1iubrrZB2ErfXygH7G
 8CIgH0bzwPOhprF/7BaGyED978WQf5i0vqQWTksiOS2NKrGXzS0xRmA0V5Ftl2bx7O9FUvkcgxn
 UOl4PeP8PH+PRp0gj98BTCGEgOFGrz8kwqz5DFeTWGY/xEHichqCrTh6yMH8ng3Mi6AUf75Stwy
 gSqV+AqSBu3vfXmserg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1011 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280053

On 2026-10-14 23:49 UTC, Luke Macken wrote:
> Like the T14s Gen 6, the Gen 7 ships with either a Synaptics touchpad at
> I2C address 0x2c or an Elan one at 0x15.

Tested on a ThinkPad T14s Gen 7 (22A8S0070B, BIOS N4PET33W 1.14) with
the Elan touchpad (04F3:3327): it binds to hid-multitouch, touchpad@2c
fails probe silently, and no pinctrl conflict is reported for GPIO 3.

Tested-by: Lukas Märdian <lukas.maerdian@oss.qualcomm.com>
