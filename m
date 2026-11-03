Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712855;
	b=Q4TlMymM0snYsaz/K1lFn8682UqGZSczBlBCUKEWFy8hVZGhdws901ue/MrtojQb2J6x
	 KA/bLZEL8HhaiASly1wbYhjf6B/pg7vZUTjlc9MqgmcVIEn08x72oU7TH/HmVcCMxy3/P
	 FCyaUwd8Ux2gHncMXUB4ISjaMg83GSPxuaDspgED6z9bpkQ6u+33ZRTUdz2FFGCTsxA6p
	 WRz8LYL/6QKoBOX+8L/bsXiSm+Qrc9rqsxnFwfzxp5wcA8q7fPDziYGKWbjVg4gGukpmY
	 wx089tDlFeaejtmbRK39ZUs3CqGoDPsBJh/CfUSEBM4m5P5BpXMqvd2xBJTyijfaTFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712855;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fSFNdJgGvwopHTFPREQKhgPmKSBKEGZI/r6GjlVmNlQ=;
	b=aqwpiU7kAvJhogAx6iCe7PSZ/9VBb363NxIeiyLwVO3VKJmZe1aZYMA+sSsfIZQ/y8Mu
	 vXrzXY5tK6+t7nUFkr/2h+/kcHxejZWNoxOGq6OSh/s59AjRTwQRzQmqqMs544+fV2QkN
	 hzrfFyiUnB1q97Wo0ODcQ63vpRDlGlVNoRL1WooZippZ7e7+dkhzGWObbSlIURHzdAmFa
	 2PLDhgPDIwUIsBUdW7mpJeuAp7lAuINcKzkjK6DZ0jKNMP2fnsM8rRTCWNyl+J7sJ0UQb
	 Of070Hepp+jFrmCLkBnXfYdaaOPC1U30T+gHZSIlHvH+41lpkUbGzQvhmAVp2QmKG6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1CK6Ffo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V2GT3KkJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CD8606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06CD8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1CK6Ffo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V2GT3KkJ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3ClRPL2547111
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 13:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fSFNdJgGvwopHTFPREQKhg
	PmKSBKEGZI/r6GjlVmNlQ=; b=P1CK6FfoAAkGJNL40dyQMbJWqH1fCi3gQZd/8z
	Lou6/z0PloUEvicelSjeopBBgaVP7ptdK3DoIPq8HMk4bMEhGUQuadxsE++tMOTK
	MWMysaVloK09OijfNNLA7RIGKyc3C6Uh8w0S+jG84NsC/1tKHZMZ+uo+eo/J0oVX
	el+s8EVytA1aURLuFkYk2xt3EHyABEioJqpcwLyq3k151ne1Pei8ahFdeFDtNYN7
	ak1kBMTi8a4uUgZdV2hL5iGRsx08PxySTt/1Xp539W1ZjYegHY2C61z6CfBlrNzp
	vstikzjAOadT0/+ReQov7Ve0eVsGCKx11YGiKWe0AovtqQHQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r3y0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:34:13 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eac1e41c2aso948988e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793712853; x=1794317653; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fSFNdJgGvwopHTFPREQKhgPmKSBKEGZI/r6GjlVmNlQ=;
        b=V2GT3KkJFgjiKsxURVAI6rBI31iMGhpcb0GgWjvf5jSVrZsq8ebmlRzgkEDEPGcj4S
         +JiWA0Y/BpXIdiHyNuzVNhWYGWNS20fUUA09kST4SY09v/dct5CURom7nlktksNR+k75
         Xd0E20qRt11TRpvVTgN8RBVAWfLDrlFdsC5lce11YC8gmgjQ2QJDnYgqi/6NHla9kqyv
         ybPGNDAyJmNyogfDYSD2n23YZderEhwO3HywWzgKzQ2pwMvNTHk5Qch95rmaM1JeFNRk
         zuPur7J7j05z3tF3y+6xBWa31vDVzM62TGY4ktS7ZRHGbzmc4EU7ht2gUNlXgwKXtRkW
         lLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712853; x=1794317653;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fSFNdJgGvwopHTFPREQKhgPmKSBKEGZI/r6GjlVmNlQ=;
        b=q3pKNJJJzQJzSfkUPZXlDuSHvh66itSoLVc0hJMLSM364a10pcOF6PtsneeTqYCuG+
         Q4fTM335z8diJaq2GBR1Qs00t9s1NQ5qteD1moIiHbF3natAdktcoKLImeriO/mGV82l
         k75+xa7r+Mti2YXb2SglttsUfqXy8PzBwsDpV+Z2ulMd/Ejfm42eCL7jAG1Hb9JNO1BH
         jNK5ksLfdPQKljU59SmiRR335Xdi3YhoV2Z/4GLD5HDGlOXNeyrtylFd3hUV5v1cuNlP
         LRH+uVfkIlbloowAoNBpf9zlTaS0/sQ2ZUS4UXSuSGcoLXmU4TA5jUvQtkMSBqWzGo96
         KSug==
X-Forwarded-Encrypted: i=1; AKwUvBzYJ4dzHRYtwFKxsQ1ctKZAQuMcOzocx6E5Zmuupj0qEDZR/QVPxq2v3WjU9gHi9tyn1kpMHVPBZ+ttcF0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IxSRgJN39Xs4S5jm/6ThTqZPfWOn0oW1mh9Sjae9+bxc4wkKW
	bAXB650STwpMMprjwyo3UMjG4SDCNsXCYTnKAcmqmC4CGOINV33i77U448DvCskxgiT1lWKcsrn
	RKq0C8yHk39dR0kWUaBy98K9uY1Be0NFfKaExev4bnAWJqDABw8hCoOyWhqD93yn6MMQ=
X-Gm-Gg: AYBFou3smjIHq2OwLSxeAcRrTUOmoIUvmEiCFGu5QYqUPiApU8xoXGhY1cNe0djJ/fY
	LEaQz9eMJULhfUUNRiYpwB/hyPCUucaFTVdts5Z2cQoKfVc0ZkpGjZ14QrBExcfU328lj4/eO/r
	ShLqvgPscbGXQ/Y1dU9JhK+BazYJu3JpjKTcmVB+DE4tKR9xmYPS1yyqzOeGHa6+9nDgugwoNxi
	qD9+yN6e5niwM957hYQ+LJYibWUHbPo6XyCtZYABxIsdPHqd0tAJpSbmoBfpbEZsL3P/v5O2w2/
	cbkuV93Usd5Ta9PkYWGZA6dKrQSMSok5wyIEfHdqxiUu0NCFIt46/3hFBwzxBdDyXP0JsYvnVlF
	ueHUuLiX96nrEsBiqpYv/loHLPBE8NIvtSjSS88pPUvbuWmVJhx/fhINytYO/yvi2jbVRV9DSs2
	xq4g==
X-Received: by 2002:a05:6102:3e84:b0:7cc:32ce:4c51 with SMTP id ada2fe7eead31-7d0725cefcamr4330616137.8.1793712852947;
        Tue, 03 Nov 2026 05:34:12 -0800 (PST)
X-Received: by 2002:a05:6102:3e84:b0:7cc:32ce:4c51 with SMTP id ada2fe7eead31-7d0725cefcamr4330597137.8.1793712852429;
        Tue, 03 Nov 2026 05:34:12 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba7168sm26866970f8f.55.2026.11.03.05.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:34:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/3] drm/panel-mipi-dbi: stop requesting GPIOs explicitly
 as non-exclusive
Date: Tue, 03 Nov 2026 14:33:51 +0100
Message-Id: <20261103-panel-mipi-non-exclusive-gpios-v1-0-aa862c1d71e3@oss.qualcomm.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL/i6WoC/x3NywqDQAxG4VeRrA2YEVrsq5QuvPzagGaGCYogv
 nuHLr/NORc5ssLpVV2UcahrtAKpKxq/vS1gnYopNOEh0rScesPKmyZli8Y4x3V3PcBL0ug8DOG
 JTuZWIFQiKWPW8z94f+77BxCusO9wAAAA
X-Change-ID: 20261103-panel-mipi-non-exclusive-gpios-bb27e91f31e1
To: Russell King <linux@armlinux.org.uk>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
        linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1025;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Wi99EfjZrDJfc4ByH5DW5LiPzd+d5x4qqFh6JHJjz+U=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6eLRR4h1JzI3varWGQUzdBOuYb4wR3+FhGm1v
 VLnE9/MsbOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauni0QAKCRAFnS7L/zaE
 w5RvD/9+qgHJdqEE9cOISLwTNLZEAeePooJ21oZyBXVJ9HzRowzhSVXfRV+d5UWam7pnTBKb86f
 /hFhyRxBYWnnvLzwf5T9W+Dl43T0Fv9vC/BFKpyUBUSlpZaoeCMZ9Lbp6BpPbfbDrs2ZA2GJGBJ
 /4geiGmFb9smNEX1UDPbPh4GytbFkh1ndBf47pkzIDa/5MUN0EO+BOUEWP8R68mdfEa4HO5jkbm
 a9L3eOuYNmI2O5puHkDc0I4VNhzyPvoMZz1ple0PGXsN0ALd+SEQfQb5cfssWQHKRSKDLJJRTpS
 NHPi9eaZ8ArXRDdB78eq26D1KGyt4vnhDA3j6FaD1BEz3pm14WA6whjvELRpXacKqJhWtdkm6M8
 kSRoleVeXCGClALH1TchAdVob+seZx3wqHArsiC9TC0HcdW4fWbjIAo5LXojtBYpOC9Mo1QPDDw
 wncDeDCOSlHLwNIzG4iuCw7EnNPxeSoBam28DzBbje7//AwBqDJrG+ErlZgaIJJ3ansHeIANht7
 jppIqC1pn56IQW16s7z5xpW0u6juotyKmkIteyeDnT/KCxJ4QVV7JFwmwqanBXPN4XhA8LUzWC2
 f8xoCkYRCCBjq84iApk0xhY+vDBg60VIqjo2ylevGDYOaE3CJ9XSK1KmUmBBHy4HnorbOysgo6k
 8ZDVWN2t2ktuuow==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: XPWoP9VpdY5EO-rFlP-kv5JAZMf9TVNj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX9rz8cYfVy+w2
 F95vu0u+ilrJfoWlLcw9Q9ppS3S1H028Jtr/wadUBXK7o5PdNg8xvgZ71WQL6UXBlRLJFW52I3r
 seG3IoMgGBCZIYh9rA6xt+k5U3e+fp9adfGpGkNzF5h0UUUYv55vcoNc2Axwyio5x2mxim2wxAu
 mB+KvtmQ/sXcOzo6DoU4IrDBqNMbmXenRYxtZctQpho1OsdYa22wpp8cKSVh5FZn6DTK137pjeG
 mKOtxtgfIDUqYjU6GAA4KuOkO0OVa37yhAxwX6fdS/eDf+4vUzpNh5JIgMuMpcSZJCYMG4nrufo
 PHSKdxkXnP6pctJf6kzWvQwYk5R7UhUsQ+gTFu5CW4AdfXIpygwqiYz2n5T3H6SIq6xnEg1IIrs
 OvaXsLtHU1NIuCQZMy769cgYPInNF8o1d6Bw/rQLkxa2se/t+jmM/UCBpkkTmt2cKVcp+12WR7g
 sPBS6ASjihhazIbIjrg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfXx4eetkDN+NV6
 jMba3LEVukZLx7dflRbEneq1k2HfAhXbRNaJ2OD15Tey+KELPgp4wOw8L1j5GLoGxWqELHKWgln
 B1tE63vTaj9VEfU80yGrVEyNh511478=
X-Proofpoint-GUID: XPWoP9VpdY5EO-rFlP-kv5JAZMf9TVNj
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae9e2d5 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=2ktC1rJDgDHwaXYRQ2kA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030053

GPIOD_FLAGS_BIT_NONEXCLUSIVE is deprecated and I'm slowly working on
converting all users to using the shared GPIO proxy which automates the
sharing and allows drivers to not care about whether the pins are shared
(as they should). This series selects HAVE_SHARED_GPIOS for the two ARM
platforms that use this panel driver and then drops the non-exclusive
flag.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (3):
      ARM: stm32: select HAVE_SHARED_GPIOS
      ARM: sunxi: select HAVE_SHARED_GPIOS
      drm/panel-mipi-dbi: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE

 arch/arm/mach-stm32/Kconfig           | 1 +
 arch/arm/mach-sunxi/Kconfig           | 1 +
 drivers/gpu/drm/tiny/panel-mipi-dbi.c | 3 +--
 3 files changed, 3 insertions(+), 2 deletions(-)
---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20261103-panel-mipi-non-exclusive-gpios-bb27e91f31e1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

