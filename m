Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318435;
	b=WCZ3BnS+N3PX6/2EuYIj6QpXErsOkIMojGez680Iy8A9vLc3uwAQTm+iO2Rc9s2Rbv8x
	 cfzK/iDzJdS3WKLaP8IHN28BbU3tgjjRdLmcZdF3sqvY1cFUqO7azfs+wB7qStbAzyH4v
	 a+eCZI/UJ3fB+vRm9nA8vFi0aeMDC0XtQgcsvAhmJqpHR5n3zxVvzA94nM9QZcw3F4jNz
	 m5MULSuA7kDQcb+A6NzWlfrQ4fsTsRFalzXww6EaicLNtY6y5siMmKebw6brWcOJVpxW1
	 SV7BF2RiTZrExRASJH7j92M99DeznNWAThGBdkFa1jEtYvqQicXkS/9bL/EjkjgZ0lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318435;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wytSs7MahgtYGzkZdLfHUX/IsEktfM4Edh5KjgwtzPk=;
	b=t7m4Ml5hJqeB3/CBz+pe/L4/lw2EOvo79edf23GSlxeCBDG6VWqYSF7/jU8JH0wyAmQy
	 XLN+1d5HEky8lp6xe5sdS2FsY5HDfgQkvKILnpVbw2jGY0rRaSiWiY5bsE5IXA+pkj9wF
	 K7hR3RV6WzzKqmM2JRgPgJcMPwh8hPJsbTXeVPMY25f8iKM94SVkRySlZNHuZUkmry6K9
	 rF3MQ8zo43X4nm+oH4kjZko6IOhNkxySbe0TQbPp+/2SxTnkDLNeVyvpp6f3VeV9B+QOb
	 kHlW3SMb2E/7PcMs3I2eEzOrr/WQt77N/x0R889Jqp3Cd6VXfazB6rkxCe8MBneoRRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YIZg7UNt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iEnRc3D1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F171606A334
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F171606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YIZg7UNt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iEnRc3D1
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAB9ufQ3195889
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wytSs7MahgtYGzkZdLfHUX/IsEktfM4Edh5KjgwtzPk=; b=YIZg7UNtDBKcGzss
	JFMpYtUnfBoGK/V1JTJDWd5hEzeZGADkLJC1tUKofivDR3aHahtVKxV//ZTMGTUj
	VjbJ6+Ju8+1VpQ5rFH1vuDPScGr1/W8yL3ajwc3IhGIrMQaix1G3FIjCWu0rFPOM
	UlyMzKZhusRuqj1eoi8ae4hiINWA8vy+mZUdqjHXvu2RcbWObOwJVJKqTvfsBO3c
	2mwjyEeScxrmL3FcCyDl417p3HNoTNOHzSnDJYvQ0HEv7Emz0b3EnTSnQh8CA4YR
	QVEldW3hUUT0dE1F5f2iLW/3IYaSGTlwfs59KEGeblRn5YSY3rXomeOwp1VJV9II
	3socOw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv03cs012-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:47:14 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9907de400a6so328626241.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794318434; x=1794923234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wytSs7MahgtYGzkZdLfHUX/IsEktfM4Edh5KjgwtzPk=;
        b=iEnRc3D1NcsZPa0rVSWZhET2AcUno/lCKQZka4e5kJUceQiuvjuOV+DrkwvsRGWWGw
         i2CkSa03+hIy8eco8EmkitZrTLyP5dKOOdsrpnjszjTsdR2L1cgISrIcvN7aoW5fpmwh
         lOPYtAcuTEQvivY4r8ayKeeVG0rq2FPyIeHr8mY8WSG+ZDUi8eNk5f59Oxh/ee3IEntp
         R+JLtsL11UOEl6mYdyg+UMoxUk1J46hTKG2sYOs1s2yjHChLemKn4nTcBzGtyYZZNIa4
         C3deeYlblqRKb8f4wf9j79Cm+JuB9bzZNiuehdn+kdXOGlB9Knw47wmp8XaIhmA0LbP5
         o7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794318434; x=1794923234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wytSs7MahgtYGzkZdLfHUX/IsEktfM4Edh5KjgwtzPk=;
        b=0BAV3eHlr1flxg0nColqW6LTozlDKEotwkJ2dAEPS7Sa3CLDIc5gvZ0gwD19smKF0i
         w2XzUUYh+MBXAVU7907Z+OnT7veSZl0LNWcim/FOy5v5s7ItslxOUzh4Kk/wBslO4gdl
         AU8ZpDO9+gGYHpYrK86HshD9ELxq1Ulsy0aBby/+IteYycxGXU4/aGiTzAFQ94OLYKFa
         vGuKB/YPtyB/rK/n4sQRyPYpJOCIOMtd8C9AhMnQbtQt5mqGnmnRBje7KV7XsSzlUN9i
         eJ8TZWFgfYhkw4jO5YWGTszmeM34TD1FRY8lDnDLI+Ru4hVWidvew2dx3wgKN1u943OX
         FLVA==
X-Forwarded-Encrypted: i=1; AL+hErFEq/qNXXjl3w54hT28amFklQjI4Xfh9VuE5+WHSF0eWyGcVOTmaCsJcwctRyAxRPeLHo/vcIjP1iqHrHQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Y5aM+Bv6b/TEl1jB6374QHMASE9c7gvRkXPfMGabqYEMm4HKx
	9QDCf5T+vTjhnC/4BnjlQSKX+8CFx4IcLzV68BflrE7GdfNZhct7CeKQwB/0ta56nyDUw0v00m1
	xaqvDBLHDSjQcpCggfr/DOlrXFC2LBeLL477dMOWfbj3reGmhxLq4XO88rIwi3lWeb4g=
X-Gm-Gg: AYBFou0JFMh31AwuTzEFpHQPtZMkwsdVYc1wQZXVRTEBk1NfuiIxc2bZ+kqcbIB4TQn
	EXrU0PwqQXzbhCc2ApeKM7bpfO2RSmpZ2qTJe7FJ7GuRM3gpmhczts+T45mn7Jv+pGcy7XTX7VM
	zanXG/6Fy1TmdQmOgyMelBbyA0q4auD9HHP2fNI6wwumd4INNqlYP+BxGj8I/vvrEPdkzecqajw
	0BgAzFurzwQYvRrlq2ghTr1ORyQYXhcWbSnMhaJLuaeeRuCwXYcH7t6oGWRFnZ9drnpNuXrRnCH
	k2yE6LfpeEDMdioTKrtXS1Lz8F44uZjeQ3fTERcELragSVJt0FrJ4medIUfUoaruf9Q/MwQ2IVL
	e3ouzrp4byKVJAuolXiLr/FpeHj8nv8Y2oKfwji0Qs/ZfghnhQS4hYyZJEkwhWKd7G/38R1ZPBC
	9ikj2r8n6I1LZDPNb7suucO7xdGHYdmdSnOFiKi4DGfyn833liRR4zuXTcy1viPb0=
X-Received: by 2002:a05:6102:f11:b0:7cc:9d47:9c9 with SMTP id ada2fe7eead31-7d301c1781cmr695799137.35.1794318433866;
        Tue, 10 Nov 2026 05:47:13 -0800 (PST)
X-Received: by 2002:a05:6102:f11:b0:7cc:9d47:9c9 with SMTP id ada2fe7eead31-7d301c1781cmr695788137.35.1794318433396;
        Tue, 10 Nov 2026 05:47:13 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02387ad9sm75913445e9.5.2026.11.10.05.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:47:12 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:47:04 +0100
Subject: [PATCH v3 4/5] gpiolib: don't overwrite the entire flags field in
 gpiod_free_commit()
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
Message-Id: <20261110-gpio-desc-flags-atomic-v3-4-2f463bce8086@oss.qualcomm.com>
References: <20261110-gpio-desc-flags-atomic-v3-0-2f463bce8086@oss.qualcomm.com>
In-Reply-To: <20261110-gpio-desc-flags-atomic-v3-0-2f463bce8086@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2171;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+7HEOYQ1ox7kOlfRzmeCQKPq1CmvSqUEEvB/5aEZEUo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq8yBYrywnZ9aWE2gewHUDqnZGE3CrsSQzAF0yx
 ihOo8La4EGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavMgWAAKCRAFnS7L/zaE
 w6eSEACDBXBXoY0UAKzn412ePTCqZDS/jJWY78hlmSpAg8jx2cwLcwUcZXOWiZiDDwFtxK6C4MZ
 8mTiVu8CaJz/iHxXGE65w88MwbQNBQYtYUDJYKN1TalNLPtmBHcvRT1Lylb4UWHEj5qrg5wibhv
 WqxSCumOfTQB/sowqulgaZNkj+XN25uZGKFRssPxaKktU/48Y5jSrqHw9uNs2RWbeqFSJR5i7Ni
 polrmmQI4bDhHaghhbCPWeLkiepnrNZ8YSVZaK54m5eWN6Whs7iKk50MURIxEz+9aQ8G8b367ov
 V6aygZke6/OBIv2nsxuO7jPDI2rFYSoIe24C1M+5Tbqtt496yE+87WnobtI4xjNeW1AwS+wDlLB
 flNj/jmWW/0MG/DcOWno1Zwk6o2HaepcVKrP0ql2ltzE/vLjBS2Mb4K4cN7aHXByl+46NjbxpT/
 h5Qw4Zhnb1b0qctdPbnIcViCEwjDPUVKqv8Qa2ZsNzV0wsUldPYAiGLLVk3zqrjtM2VHBRcI1v+
 92lBnUlcsdDQ5ykQYUC+olGToBL/JLWCa/bnF8fJFBlAZO4WclqfL6LZ6l5LJW48P1plyIwd/7F
 JMBHfxFEqdIJFknBoE5Adn2fVitvh16Hm719hcDmzAVlbjGv0vZ6FXKv/DPdyQdVSZNCVIgKpw6
 MPQihoV6IIToX3w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: q2_qNQgvHAZ5ayNfON_XiZoohoSgSe4I
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NCBTYWx0ZWRfX0dOtZWTW2FEh
 3WP0izmmzlSbQgmRsYlFFqhxmZ3uYkgTMUcuDCP0qMr8Vj1UJSbMj4Ha8C6ER8MPSp6+TOq/ZY5
 9EqUkuZOejALyAwpq9YSd2R48XHAmWQ=
X-Authority-Analysis: v=2.4 cv=FuiQbGrq c=1 sm=1 tr=0 ts=6af32062 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=m7D0vEob7tz7g0OC2VgA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: q2_qNQgvHAZ5ayNfON_XiZoohoSgSe4I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NCBTYWx0ZWRfX6U22nGShH9Id
 iDWOwF2q4l1NLHBJhaygQF6aJro9IRQI6uNZTIDBcTbW4Wnb9TeeCBIlHAAMbLUaEQgSSgfcmYe
 tVOrlVSlcaCZ/KGVQSloIgTIfCRolSGRI1yQnkyIOyp6j3MNLBjPfbUs2EvMzK8/+lWzCIiV3cb
 o7hZp96dQq3Un/Km+oJud+oH8b1ur84l9YumZ1jIxpaaZlAZq4UCjsyHpviV6UosO6GZDpAPtLI
 MWvJz+IH9BXxKZrAXMjV2DkZDVGnDxk9ZRf+LWPHLxGKSxPIsK2g7Soz2kGIruQgjLzyWKsVCAN
 H/tEBDLuoGbab88Hmcz9AeD2cJuOUhcPcM+fUPwYo9rCZBbPyhTnOkk50p4gK+fScz8xhJ8STN5
 ydqGVvzjHoLvWmd2v0AoSWb4LYBF8oTSpMpK+pg1vagPSH6Dwn6GefvhHQjWg0mSNPgWOhGpwAK
 qDfr184aIw9qcsjrMxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100054

Use set_mask_bits() to clear all request-related flags in one go
instead of risking racing with concurrent users and overwriting any
changes they could have done between READ_ONCE() and WRITE_ONCE().

Cc: stable@vger.kernel.org
Fixes: 35b545332b80 ("gpio: remove gpio_lock")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ce8531a8e95dd3bdff7ca32f4e486b329a19afaf..9ebe1d398014a17bb14e7c62a35478c497f6155f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2702,24 +2702,23 @@ void gpiod_free_commit(struct gpio_desc *desc)
 #ifdef CONFIG_GPIO_CDEV
 		WRITE_ONCE(desc->debounce_period_us, 0);
 #endif
-
-		clear_bit(GPIOD_FLAG_ACTIVE_LOW, &flags);
-		clear_bit(GPIOD_FLAG_REQUESTED, &flags);
-		clear_bit(GPIOD_FLAG_OPEN_DRAIN, &flags);
-		clear_bit(GPIOD_FLAG_OPEN_SOURCE, &flags);
-		clear_bit(GPIOD_FLAG_PULL_UP, &flags);
-		clear_bit(GPIOD_FLAG_PULL_DOWN, &flags);
-		clear_bit(GPIOD_FLAG_BIAS_DISABLE, &flags);
-		clear_bit(GPIOD_FLAG_EDGE_RISING, &flags);
-		clear_bit(GPIOD_FLAG_EDGE_FALLING, &flags);
-		clear_bit(GPIOD_FLAG_EVENT_CLOCK_REALTIME, &flags);
-		clear_bit(GPIOD_FLAG_EVENT_CLOCK_HTE, &flags);
-		clear_bit(GPIOD_FLAG_IS_HOGGED, &flags);
 #ifdef CONFIG_OF_DYNAMIC
 		WRITE_ONCE(desc->hog, NULL);
 #endif
 		desc_set_label(desc, NULL);
-		WRITE_ONCE(desc->flags, flags);
+		set_mask_bits(&desc->flags,
+			      BIT(GPIOD_FLAG_ACTIVE_LOW) |
+			      BIT(GPIOD_FLAG_REQUESTED) |
+			      BIT(GPIOD_FLAG_OPEN_DRAIN) |
+			      BIT(GPIOD_FLAG_OPEN_SOURCE) |
+			      BIT(GPIOD_FLAG_PULL_UP) |
+			      BIT(GPIOD_FLAG_PULL_DOWN) |
+			      BIT(GPIOD_FLAG_BIAS_DISABLE) |
+			      BIT(GPIOD_FLAG_EDGE_RISING) |
+			      BIT(GPIOD_FLAG_EDGE_FALLING) |
+			      BIT(GPIOD_FLAG_EVENT_CLOCK_REALTIME) |
+			      BIT(GPIOD_FLAG_EVENT_CLOCK_HTE) |
+			      BIT(GPIOD_FLAG_IS_HOGGED), 0);
 		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_RELEASED);
 	}
 }

-- 
2.47.3

