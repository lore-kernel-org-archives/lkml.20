Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806632;
	b=HZCmDo60QuE3qYt335BYIOXHQDCkmm2y9SP4VpcaLrrO20q/a705flzpVljTnjhQCQuj
	 tX8EcFITks7uk51kBx4UwYAoRCBFiNjOSRoe+ElKXxto+FGZ4pK/wdjYqsb74xQAIY7a0
	 tOLNYmCHTKrE/CnVRoT5K5YSEQcu+zXs5L+bedLeD3JERR/z4+6aUsGOfM+A1uFahgCuf
	 OaSVZ1BezaTRJFSZc9eX2lffLtdjvdbrV8UStwMtTHZsxkGXxRnMyqw3z2U3V6APqyD+k
	 KRFkNlxoW4yTFlfDqmsVqvf7dcHEZSbqzmQnFIkDuXSsUBHYIwdjWNrxgD0oFc7+8wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806632;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/wCpx7ZbYMvn+dKS5Ed45+HwLytHW0nEsPP9dFbtQpw=;
	b=PwyKsPixSUL2rDtuYP1hsyN/ARAbdVkU+dLMb3ZtaAFIWoz40iqxy18TdUtKS158vfjL
	 9pNq8aWBC+mVYFjC57A2wrO1qNVeTFVVANMfGbz+5B832EJHcvhUYW5l5XGtFfqend27C
	 p8UVLpkfnMDecGf6+omBXvtcfUo+Ue6svY6vAtKe8BwTVI6/eXNyjmCoMSHi4QLYgXZMA
	 EEiLEjnXfmV5gAK7JouGbgtvqPkDz6gF91Oxe+z5SwewNbwy8A/Gf5VAgHt40kzbbIZE5
	 jtSmltSw29F3D7LVBWOQXSCO2y7nGuaITvOPI427CSZ/OEnb0OGiC55KBx+6dsP1RSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YBeiEG8T;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P2+QtTZs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C732560A260F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C732560A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YBeiEG8T;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P2+QtTZs
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BaJLf2310731
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 15:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/wCpx7ZbYMvn+dKS5Ed45+HwLytHW0nEsPP9dFbtQpw=; b=YBeiEG8Tit99pO8q
	CfIZVSNF4ZWuzBqjHTB2N2paNjFwWHK8RPV45aixKvUck7RkCcW/qWndPeMvl2rv
	yHEA07j9D0W67c9d6OpW5bOnL+fFadlax0jTomxNfMw5h30l2OJZo/BKuFyny1P3
	gXenoVw/guQPpOxP/l35j+3DaUxk3ZJ+H+j32IjVc2kpck3ZGZZyXkh9N0sxq3DC
	PTXyfbGYXk1/PZfmG45wtDWGINtoKDcHm5IGnVcUBVBmd3MWOniILpLs4rRoFaMC
	HJ387S4aFc7U8sGBCEsrlZWy1LbrF/tf5tywrXbYRq0RQayCJ3eJA9ySEeGnNiRs
	TO4wew==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8mvjb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:37:10 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d06f3784e2so225428137.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793806630; x=1794411430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/wCpx7ZbYMvn+dKS5Ed45+HwLytHW0nEsPP9dFbtQpw=;
        b=P2+QtTZsJ3uClm1xUMSnPGCrbvctppNNpqLpNJ10GngoWt/tC48379woMFaJWrWjzZ
         3Vmpu3F7WmSIuZJOb/koho9a7c+IOa9bRLjZTClOB4ju+r46NXUIvh8CXua49+UOMGCc
         EJAfQKh9Mk1cgzgPQ7QlA+nF3x+1kPiB8sEjb1wBka2Gr/lmssVsw6wBLlILmlOrbpxr
         ZGF1lpd3GMW3Tj8zYZ3m/n1Tfde7LmO8XMPcYXiPncSu/r0M8rULj4cX+/iuuq/7T13b
         sJcUPVz8QHtQey4pbqXwYJL/t7DOKumbS9TldrI0dbBV4tNkc3due5JlxvuhAQ3vuU5m
         5e9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806630; x=1794411430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/wCpx7ZbYMvn+dKS5Ed45+HwLytHW0nEsPP9dFbtQpw=;
        b=Waj5Gi5vdQznsvGTYT13Bjh79e3e7d0sEX48cNDMmVAmUTKv2UcwvQIrhRFYvovp5b
         fF8Elg8sS4dNSoBhy+5wBdFQybbo53oKJDU4QF15/zHCNwU4jNPZ2Esf2LTtxOpaSINV
         SDb5pOitjmWCMidlyrY4sU8gqgOMlDbRp6muURcnRwcC0eog1tC3hhBq4l6TDFMqoYt3
         NES3PHxN4u1Iz+3K+gNzMLRCQPK/OvTP1R4RoDDpE5iJaLhqzgC1mkTJnzUMAyCdwC4n
         CKkOhRWmn0vPxMYjCFtFYYpmHESQP142PAFMBGfYgqt/vJ3oi4ygc4k3HG/slglhes0y
         XyRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzozoAWuFG9DJQYZES0/LE58UMoxHwj/qTlHautEz9GievVSX/xYQDhWWWxjcabnxBrtoHq8sQUbI9oZkk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YMmx0YsI9ZbRTZ++NBhnjRd8FNqZvMV0XbHd+fguMx6is6D15
	OF5ybGXvCwzVe9ayByK/jbELd0GBZg1ZPB+xOGcOFUSxgqp+rCekVtIzp9jCcjrxBifi1Fci4SQ
	Uf5WuEMSAbAxFEx4dEzIvMYkoU6NzHqb43AGHFayNz2Sj0XmlWIBajJr6hQPJjtSVc9Y=
X-Gm-Gg: AYBFou2PSYfPQhk+nl40KuxcWKzQr31PwrX9zfyj7dEYNl1Gh6w5IGL02InFTwkjw8E
	VpjUUNvP9G2hqHU/h0TYPqMsqyr9CnCST4waAWYmvgCDNe8kUswZsyX/HSJZh4Tj6g+OJWIF2H8
	9DiOJyqnK2x+RuAIgT0uDvpG8L7m134J2tLC18Fs/2VTYziF2Sbk2WHq9lkxn3QZ1HVgFKCv9vw
	kVvrQxjBqrY48t8szP+zmFkYcRCFRAI0b4fRDuFyBL31Ytyy8g2vkNkyVqvJek4b0JwRr3AGuLr
	6N+KqYHqTQa9DlXLuNcmG/ObL8iNSLiqUZo9jxga3GWUHKiiWY3K5rpAKLCRHh9WeKM3SLI/uUA
	ElEMPggQ/9EIls0akbUAcW9Eh789+tPlONB54/8tUYjaV1JSCLJDVUotOEjZFGNFGlhqF77NkLF
	fDeA==
X-Received: by 2002:a05:6102:f12:b0:7d2:7c63:5a08 with SMTP id ada2fe7eead31-7d27c637376mr562782137.32.1793806630223;
        Wed, 04 Nov 2026 07:37:10 -0800 (PST)
X-Received: by 2002:a05:6102:f12:b0:7d2:7c63:5a08 with SMTP id ada2fe7eead31-7d27c637376mr562762137.32.1793806629573;
        Wed, 04 Nov 2026 07:37:09 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4107b7198sm30388825e9.0.2026.11.04.07.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:37:08 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 16:36:59 +0100
Subject: [PATCH 4/5] gpiolib: don't overwrite the entire flags field in
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
Message-Id: <20261104-gpio-desc-flags-atomic-v1-4-e23cedf619ba@oss.qualcomm.com>
References: <20261104-gpio-desc-flags-atomic-v1-0-e23cedf619ba@oss.qualcomm.com>
In-Reply-To: <20261104-gpio-desc-flags-atomic-v1-0-e23cedf619ba@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2148;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=qfnK8NhwXPiksOiKAVXJenfSAZexKhEl6VecmEIZHx0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq61Eb3dAXKfqdjl8aAODE9wErfP/LlakiYzGNT
 Xrms8M5YhqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCautRGwAKCRAFnS7L/zaE
 wzngEACuLXVyld0G8pZ9KX+6UAPKvpcseqf45H9ED+mQV6iMR4xcAgYK+PLET7Sc1+00S5EdkyC
 516eKz6qkWlCGZnIft0Gkb1aS6k1VlAVYqnr7est8NtRxvx9KvMoFetHFVSDGunpI19CslZAxvC
 h4eMjuyFDHuy/OO2LOslH2s2cwc2IpcQbQYKjuqo0A/XpQ9ciOh+WMaHkGTIFyOcCiENS/E3YiB
 c+5hv/YCl41EnVBQQpDBYi7rkW+twxzxiJX3BjDYKveo+8Qi2z+zvEWKKxcsV99yaYyhkeo0UYo
 W3ExghwYV/O/oqN5Cf2tqfTOdG3ot3ZTqlZ5P+H/a9Ns7ECQj1quNOD5x2M5SllYp8PSdljphwF
 D+wrlXcEEthNEDt9MRx+TWT35mIHtiwxZTEbaykQMSUxAaq0FF9pKcjNbDL8cThrN/7LdTVaAdg
 UuyzLCy+hgQK7rhxEqITBULffMQzSZ4Wn5NyEuMC5nygUY7oEY+f869kuCsj4w52yMF71Q0Nsmf
 VBG48NelChhyKCRzj5EwfikuXvrTb/NAJ6j3zA6NLPofKcIQt3tv5Q6LR4qaYLiNIlBNNHvgMz6
 k63sMDEYJnHmLO2XHY6O2byxISL9wO2kcROh5asZ4f8CPBdzCNrnDfdyTQYI37Fip1z3c3tQ0Z9
 sF2BVtvx3iAz3Sg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: nrpjIKDUEBgBQasbc1MQebj92zQWNRev
X-Proofpoint-ORIG-GUID: nrpjIKDUEBgBQasbc1MQebj92zQWNRev
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2MiBTYWx0ZWRfX+dTdMbsmk5yx
 +7A5lG1tG/b2bOLRG/lfDSSDJ10YIv/W9uqe+t3wlZIZu5pkybOtaNVW+zyoGlCpNOBWIzm/oYP
 f4jC2jLdaGR/MMRaRxYphJK3D1bDVZTCtVWfPVtMMuL4rd5WcxwJV2nGea1bxq5zk/2imvJVqqW
 xz60lVtRK/595w8PqoyJM11qjRbNXM+q6Fo3JFpFFyLyIakyFJnTxq5w1BUgNYBOkEXQx2XFayN
 SvKs7fYhyEvCTdsct+0WmjXpBIA9Z0XSfz7ICFsRZiffGlDn/c/IvjEDciagqDRphgJFmtkD+8M
 OUF0pZiTXCBDOhY+AkA6IB5NnPJd/qCiSbyh8ZDDwpnZwbFiDSpKhQEpzYwRBoTm5AO7AIFteo5
 nyLZkqED+hW1S9Sm6glP6jlUXgnScjcNiejbHXoE5w+15WjQ9q9tJNqNtK0AtM889tncmn9jabL
 gQX/IRFfNB5RIRD9JKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2MiBTYWx0ZWRfX6lnxShjd81Vv
 NZqwnKzOxcVcydDvd6MsdsBmeJcpHbRU9r99xOjBZNT94ao6EmfVGata5Iu1OrUROXZYU9CaJt2
 +dHbIC/thkDEaV4g27SXo0mlL/wKKVU=
X-Authority-Analysis: v=2.4 cv=HbWB3SE8 c=1 sm=1 tr=0 ts=6aeb5126 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lCfYgqX0DhX4tC7hO14A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040062

Use gpiod_update_flags() to clear all request-related flags in one go
instead of risking racing with concurrent users and overwriting any
changes they could have done between READ_ONCE() and WRITE_ONCE().

Cc: stable@vger.kernel.org
Fixes: 35b545332b80 ("gpio: remove gpio_lock")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 63b65b646fbcfa9ea0f724d1d3e1ac22ba28f638..28d4cf0cef70f437dc4271f82975d09dc55125ea 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2693,23 +2693,23 @@ void gpiod_free_commit(struct gpio_desc *desc)
 		if (guard.gc->free)
 			guard.gc->free(guard.gc, gpiod_hwgpio(desc));
 
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
+		gpiod_update_flags(desc,
+				   BIT(GPIOD_FLAG_ACTIVE_LOW) |
+				   BIT(GPIOD_FLAG_REQUESTED) |
+				   BIT(GPIOD_FLAG_OPEN_DRAIN) |
+				   BIT(GPIOD_FLAG_OPEN_SOURCE) |
+				   BIT(GPIOD_FLAG_PULL_UP) |
+				   BIT(GPIOD_FLAG_PULL_DOWN) |
+				   BIT(GPIOD_FLAG_BIAS_DISABLE) |
+				   BIT(GPIOD_FLAG_EDGE_RISING) |
+				   BIT(GPIOD_FLAG_EDGE_FALLING) |
+				   BIT(GPIOD_FLAG_EVENT_CLOCK_REALTIME) |
+				   BIT(GPIOD_FLAG_EVENT_CLOCK_HTE) |
+				   BIT(GPIOD_FLAG_IS_HOGGED), 0);
 #ifdef CONFIG_GPIO_CDEV
 		WRITE_ONCE(desc->debounce_period_us, 0);
 #endif

-- 
2.47.3

