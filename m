Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318434;
	b=UnlpHTgWW0g6FicoQRAlQipuANZsV/bG7Z+6Gy9xM7iSDOMofOaL5Xx5eChz8kHjg5qB
	 szk6sGXex5xtGyltMkFcGFBX3zP6qE/go/gicSZm6JA5vI9bjCUIq25csp1L/2uF2tEav
	 0W2IVeNXEJv7S9H33xitbiTpVTv2hLi+BfB1Bq5oNyiZ87s6KrCBnDwLVDmWZlH7U1PeS
	 fe/B2Kph2tf+F9ROxkAJli5nxlCT2ggy9MKPQtITsC1Nldr4unIWX89tTq+rvEBTleRTU
	 520zt7vDPt/E0q6UUjyHZo8G0lJxqTyf67tCQqccoa2qpWhlOu6MA5c0fSb7jt5mM8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318434;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=l7bXKhfrbBlXJKf7wq9aR9JbITecsmYDAQOYKFv+gFs=;
	b=RzInU07Gr/KFzXJ5JW0K58yT9SV2iOTAZvVmsccXvd8QoWYN3oU+0v2qpgsE2l2YP2Ba
	 hVqvcMwFctfZ2a5ZPdIPaqZbq2sBnVRw7PsNVVaZm2jJ9W6+272fUy4aqlMBxLqH2fng5
	 YD4/w6hfE52s5me/gZ6B+nbDRwlzSLxB5pBpKd3P1RshKjlx6fdNlpHeo+Li8miuoSBCD
	 tQj5BxS/ZkV/+htF+LiNZQcnz17I9JRMmyeAU2VjRQDUpl2FfW9nr6hJ0YPth19Cfq71+
	 3enCVV6mLdJHbEKOiOuQGlUAercs3G+g9qIZdVcNrCz0HVnCdfGEt4TLU85zGhOJVtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nRhzBFgN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="cNv/25sC";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B0360A2634
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6B0360A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nRhzBFgN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cNv/25sC
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAFmQ3178170
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l7bXKhfrbBlXJKf7wq9aR9JbITecsmYDAQOYKFv+gFs=; b=nRhzBFgNikXfHnTn
	v5UjdDdu+9Xa+L1HSOoexBXzZaU73r4IKGy16trtKjYtA5ta9B7z+mAYP50H9wbl
	AybP6edwYHNC5GIKuCt3cuIURF7VlmO5AdFEE0kxs3HUfH5IltOU931yiut+KJpy
	7YDxbMUMxRAS2o72qlmAm0++iaEcjHzSIevOlMNWKnv7kEm85Kn3/ye4Gx7JbhP/
	FWLORf8TI8GIeE39IVEFABwv4Y1svuQ0Afu6r3SgIP3JYBZmayMbGaO5MnerWVxj
	YNkAEeFwrV0eqZAra+D/iMvGsq20uKu1u5nJGqC3tvVNhbTT0+P5ywM4KNhw/JGM
	4IEO2A==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyufs1dk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:47:13 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-999ef3a68adso340319241.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794318432; x=1794923232; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l7bXKhfrbBlXJKf7wq9aR9JbITecsmYDAQOYKFv+gFs=;
        b=cNv/25sCxDcaRAHhWgtaOCQgBvvBIBTlEQ3op4vTjq9qdKcejoN4U3y6YtxUlmGNoc
         7iUAiK/+HaFSSH1TzAKuEZ4tMMfiHu965EaeuVTSk+aG/uZxBXmrfmT5qNP7XzSyCZ3G
         fcC18srHLic7HEtWkuAhT0/c83N9HLdUQjheIYKiOjA3GuVDQdDW4A1EZGjyFp7YTQ8g
         67jTygMXiK64/0f4ihM9P9KE8JDWm9qS+0qumBAo547p0VX5nta4QIk2eaYjiIWO6zoQ
         zEStPlj2/+B8FcTNNhufBi8p2hDMbFRRGdRcSdjpQ8kPWgaMIwKsTAIp0PTDKbVYg4x1
         ViYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794318432; x=1794923232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l7bXKhfrbBlXJKf7wq9aR9JbITecsmYDAQOYKFv+gFs=;
        b=Ykv7xwYD+JcxAqjFq50Vj+c4kZDmTeDR2fHANI8JZ/yN6iAdFF6GjxKAEEAzm02KLr
         jqsuwLPu7IMjAbXMgafyj/MpKIRuSGLwpy9pZNocXnH2vT21CcOo1uuBdknZPIIEX4C7
         CZsyd+8JsdU6HP4QEVK9OdAF0n6RQTFzHeVy5nO9GNY1wXYhDytw6OCaqKTkW9gMfOA5
         s64m3/19+0y2pakbJFyCBS48joDdSnZ0hbEfVfIBfkBbBEVkaC40wCXH1p5TNXBJHId+
         vHJXwfKfenJ+V6DgbTOmw746asM5ZH2haoJcR4MuQnqr/jv4FFJINqc0smWsjo7DuZla
         1DYw==
X-Forwarded-Encrypted: i=1; AL+hErG1UbXCjIJDAJxfGD9WIuswKfdW4+GjaVNvfJ2SOVLRMU/6mZwWk6KAmeXKwS3c128vgetyeRANDPCUOjs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9o1uwF8/8p6/TS0oyhEnJUym8zsI8SzrTbqt5dLOsSSGfnpTvr
	KjVCcz+H9Q5cImUCgi4M342cLkbjt4rjOgq42DY0mnYKxDl0+isMA1gc6WoVJo7RYg2DIAm1kGX
	Y2ssrtb41z1jUGuPvlzSlQk74dKb5Ue4fNzgka2ns8Y3MwRTyxyv8i3ncDtvJesHt8EQ=
X-Gm-Gg: AYBFou2cawx/ZD7U/OT3psUdhVWWoqKDe9JNEY3OHpdRrOPjyxpozyzesPFQBqoxkII
	CQED/eoc8bUNZAZn/H4SGFICoA5JPIIVglFUDD+t1tCNC60LjcgDDEB+kKvyuukskaFHllN7G2r
	9QWz8Vva+9fbPRAup3Zl/UOsuNpRZw8IlRGxD68LUN9RDawaH4/o/4fqNQ4sw32gecwruAJAXnx
	UQMoaramjvsWsYLIZ/KsseCyPACchP327L8+hZsTuZQ/txARfloXoqtQwTjUyuZz2NuA0yAxApQ
	vsic/BLgxuqxGfVJ06CMHj5LtZrvJrnHIskbu16teIjHrNyjLJnMjD9IzxnfcE/oixV9WTYbS9d
	O3YOoPKtTXzW164h4+oasMORSDWO2x908wuvQgjjAYF2jBHO+9h+Ez2aDPrPUAZ2sUNqNbSnemf
	EIwjZmrKC7HM2dQtlWtG/3O5Kn24ke1GoKmShWgOLpodbpE6DaFHXku90NqVNOl3A=
X-Received: by 2002:a05:6102:a4e:b0:7cc:9d82:ae17 with SMTP id ada2fe7eead31-7d301b84485mr732423137.11.1794318432137;
        Tue, 10 Nov 2026 05:47:12 -0800 (PST)
X-Received: by 2002:a05:6102:a4e:b0:7cc:9d82:ae17 with SMTP id ada2fe7eead31-7d301b84485mr732410137.11.1794318431576;
        Tue, 10 Nov 2026 05:47:11 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02387ad9sm75913445e9.5.2026.11.10.05.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:47:10 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:47:03 +0100
Subject: [PATCH v3 3/5] gpiolib: clear debounce period before the
 "requested" flag
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
Message-Id: <20261110-gpio-desc-flags-atomic-v3-3-2f463bce8086@oss.qualcomm.com>
References: <20261110-gpio-desc-flags-atomic-v3-0-2f463bce8086@oss.qualcomm.com>
In-Reply-To: <20261110-gpio-desc-flags-atomic-v3-0-2f463bce8086@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1458;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=n5aU8hfTbQaTDD6CR2UvXQ7CGKlgeejUOYHOO+krLYw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq8yBYSDlDmdcAXZ+enYVY/Ky13Ulm2wmGRT1xR
 0yM/9YUHNeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavMgWAAKCRAFnS7L/zaE
 w8q3D/4uVXif5jirTVOExGMU6FiqdU1om/mcyNQdOekd7sX7T1xpAD9UGjbqin23ESA2UfyOldi
 xV7yDu5WN/pfzQR2VzLdQhcbBvLOPp5c9lvsY+lhmroZuaiG0TxX3Ib+ddgEO1Nsv2CzmepqdeZ
 +aJIlHshADiJiOGpqSbVV+Iz7ibB+Zrz7SmOnLLdyiQqyjskUkjFIOkuMb8shnrKcYY1DSIS3lX
 Qqi36+vacxpOyKmzJgM8z3yA4KoLBhTGERuRVBrqJYACj89NFScSlql4/44e59udEw+cSgGtZG/
 ua8XZ/dur/XYJ5UQ1NfUud72Flx6Ls1nafouWp34RcNrveRiisCu4XzRCEmPuPLpoJQpuGon5mZ
 8R5A0J77+QlwqlruMhm49GD0Af6AUl7nYzuefo+q1qztoz4mH/9zUldRzaN3OhnJyuJHBC0Lzu5
 k50ommPzlq6DsrzIxSKWlmMpul0axO+ymFJOKNxNxUJ3QQbpaHcoyqnw1FetT4W+aqCoJVMh4f+
 SZ0tjMGkgkFz6l1ZNJM9oNMKCNIuyiqlMvQcK57nx+DN5jxUiyo2wIe3RYLy6KDkjsd4iy5VMDT
 1nrNFc01TksChRUqQ6czXjedoKEynMPf9HIbbMI+PegEeId3lfYsgGRon/Mov+omTmaXSc59moI
 vVY9VNm4/149epw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: fVTlCw6n2aJUG1RiR-ODRO3wxuPIRJVR
X-Authority-Analysis: v=2.4 cv=S6lMU4sP c=1 sm=1 tr=0 ts=6af32061 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=KlaQiORTA54Oakicw68A:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: fVTlCw6n2aJUG1RiR-ODRO3wxuPIRJVR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NCBTYWx0ZWRfX/GpUVHdi9rds
 2K1K2B0ZgdLb6SIZTZZxv0EhnmYjZyNwP/RxT2YyZmfzdpOjVfFiv49KXQg8o1gyjxwe5hzq/za
 936hop2fPdUG0veANcC4NQh/Q1dOxBE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NCBTYWx0ZWRfX2P4nFNh3zAoO
 TZ5lygJNrHG/F3Jw7fppE69AyNL7c5uQ2WRAq+RtPWmRVSOZqsCQKK/lx+2It+NFz8Y18dEyKTy
 7ZdW3B7P139YLqCz5pKpCTA1sChXeJxuoDy4p6vmCpOjwae8WlkR0WQTIaxA8u76ncHf/pycUaT
 og5x7qPn6wjDavbucmSf2eJODAgCaIDqNwtHd4lueN1X+nEhYaD2GdGcnGZYizmhj8KGmhTgC+u
 XwX2Lhmpo72DCdwYMbhN+RfuqvqHESLBbYicSPq6JH7aszlw8qzuSmSBgT09M8z4Kq5LkH+isJ9
 vJAmGuARBfElY6olw4ZI56+YrMAUXfX4H1/wG1xibxEUBafmeL7QAEaWfWNJlD0aJqcPNsWfwuP
 vyFLeL8BVZARTEV0bbf62c4dZBJftyyhyRT/zA3KmNY6vUsTQ8VuW5P+t7dzMfdf+hs+QjX1s35
 gXBy46srRWgJNEHO1qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100054

The debounce_period_us field is protected by the GPIOD_FLAG_REQUESTED
flag, so it should be cleared before the flag, else it could potentially
race with a new request.

Suggested-by: Kent Gibson <warthog618@gmail.com>
Closes: https://lore.kernel.org/all/20261105042905.GB8436@rigel/
Fixes: 81625f362497 ("gpio: cdev: go back to storing debounce period in the GPIO descriptor")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1285a993a1ceeff719142ad019451d2e9af6a520..ce8531a8e95dd3bdff7ca32f4e486b329a19afaf 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2699,6 +2699,10 @@ void gpiod_free_commit(struct gpio_desc *desc)
 		if (guard.gc->free)
 			guard.gc->free(guard.gc, gpiod_hwgpio(desc));
 
+#ifdef CONFIG_GPIO_CDEV
+		WRITE_ONCE(desc->debounce_period_us, 0);
+#endif
+
 		clear_bit(GPIOD_FLAG_ACTIVE_LOW, &flags);
 		clear_bit(GPIOD_FLAG_REQUESTED, &flags);
 		clear_bit(GPIOD_FLAG_OPEN_DRAIN, &flags);
@@ -2716,9 +2720,6 @@ void gpiod_free_commit(struct gpio_desc *desc)
 #endif
 		desc_set_label(desc, NULL);
 		WRITE_ONCE(desc->flags, flags);
-#ifdef CONFIG_GPIO_CDEV
-		WRITE_ONCE(desc->debounce_period_us, 0);
-#endif
 		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_RELEASED);
 	}
 }

-- 
2.47.3

