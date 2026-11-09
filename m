Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794220039;
	b=WWQVV/BBJikuUFxvMzFHwadebUX0zZN/9xLI9BPzQpsXwJJn3ZTUJaTTLcQfNVI7+AEc
	 g9l7rTp385t4uzsg2/KQ09tx70OBgCuF5Zo0fRqdw8tR0rLapiK6S5Ty/XqeZzzW/mV6N
	 QHSfEZKX/XxaIRvBleZBkY4xDhWWQgzIEaCnvf5z1EE+ec99ob0nY4igB4qkDCt9hFmas
	 B/EoAOt1HJOd1IoWrBB+L6/tZV+2uFxqEljFfkAU22tGRvOoxM5RaRaeoRridaZafceeU
	 GbGWzyXGSV4o9jK6L+52XWHY7YEqj6yyYKTqy8ZeR/i7pGGlaWADrwroxNI9sGVJzWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220039;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vxIqLlqHQBIFPLmScv9Sxb0MBD7maGPGOlcFyAlmpvE=;
	b=Whnvkbe+XyaeZ1lrTgWeWKf/WY/jsiHWmrKxNaKhFBxsC+geogIQ2FCUxbb8CMO2SKH2
	 rw8nZ01bRTmVw6gACyxqnIlQvMdjIem2uhmGw257476luoenyH4E22PtMZ8qBkz0A5sK2
	 KdkXcnGJpwkpoWwFJ26M6sZc8F+rFq/+ufmdIHcGYG3v2Ylq1x6mASnD+tXrFAdgL/dYG
	 H2sXJOJYgJWmusaZhvLPMQ2c8MJI+ss7qBSlOO9j0AyiqYTDu1oeDWmhu0Wlr9paj75d/
	 bx7HRL9IHX9IareXTmVvwCjPqj09/fEg5QBbY/jtnxCMKp260Qz/FsdXQgCk0uHw2BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m171uR2c;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LHdODxl9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7F9606D83C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:27:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F7F9606D83C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m171uR2c;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LHdODxl9
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99vEUj4107917
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 10:27:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vxIqLlqHQBIFPLmScv9Sxb0MBD7maGPGOlcFyAlmpvE=; b=m171uR2ca1CIs4SN
	xcafXoyqukjRLI6SD/NAZ/g8zvLKvXx2YIXg6KBDXSyGHedk5OigdW/BtH/lvO4i
	KxxJxMGZc8cgLajkZOfGVbIDSct68GMXK8W/5e8qTROsFX2gBlYbHGsDhK7CfDFO
	85j3xeA8B6VF4z3jJCQZ9FI0OMfZP9j5nQRuM3qXdreisx+ffb8EjEsRqQWFudH7
	6YfWxqPLn8GQw88D0HUVsBKV5sxm9yOiV4NG8+lk+OMHg5el9G9bi9aEeTv/Abrz
	6g2VYI6u5V0A8ZrkfQi7+ayvlbCdX2roANFc/CwWJUT5Bp2kbZxkCdU6EJdveXrj
	mTKK/Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnxa4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:27:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e92aad34aso193066285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794220037; x=1794824837; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vxIqLlqHQBIFPLmScv9Sxb0MBD7maGPGOlcFyAlmpvE=;
        b=LHdODxl9qIq3IXvYNQuJFNj8bJwlgEJW384iEea7qw2+16wrPLlJZnV94hrNWFwdPD
         gYBHI9FQ0A0vOt2kpzrFcdE7rZ/li+BAToxmtSJoff+AMY58xYDTGeU85Voe4zxAYkRU
         B8o/NyJM9u914NCKnwOlCvdkDwaTHYh6BtLV9AUqr1Fp6RGjFtXpgYN3kd3AQj+aVHRC
         4mQWZysWGoCtboACuTYG1B/J/AMz241o/eoP6lrMbhR5YfeujkNWcVZUhmuXj8zI/v4O
         L6Dk1OM4GY4k/J+ZTZ7xbsUiFFdoLudKdjrqwKzKI0Mb1og7e67tWPTZeL3vuXfysinL
         T3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794220037; x=1794824837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vxIqLlqHQBIFPLmScv9Sxb0MBD7maGPGOlcFyAlmpvE=;
        b=a3NaWe+U2Q6d+0qn5kHLM6wq8KUytFgLuwetloOSf8x+XiTS63EEi/9nKXPiqkbSAh
         Okae4408tEDyWjVDO4UkK76zVWpyvjRPLFB0hm+hwI0ZZFh/jCXIpkwIeCkIVOeAWX3f
         nHt2Eymi+xToS4vlg9+VB/TGPp5VCb6dBEqyQiELtyh48QqZqCyOpmLBNtEMxcr9CHwT
         BLybYoS7Nief+2W/17YRPaUzcn+ehtwVUCb1FSuwvzlbZURrobyGX/InYtEzayflgP4Q
         CxHffDDyjV4x4qXF8kb9U4KQFvxhJbTCKqntWBJf9ySXzutgS726GgsajJVNhP1Ga7Uc
         1W3A==
X-Forwarded-Encrypted: i=1; AL+hErGmg2xwajsOHK0z5PvBLYxk12kTjSprNTqzBcMZ6kWnYV9+4Dg2GCGe0H6H7hr0so24/Cw35yYQqlexTi4=@vger.kernel.org
X-Gm-Message-State: APuU4Z86cANga8f34jEr3RKAEzthtKB3x6sAd882Lxk7EZCvwb1w/Z5L
	9G913MApzDSrMgKjJ/qiylGVrSNiu/j2V4O3LlEfkDzoK1eMZmryXfxyIDyw5FW+cu3xvBf6lLY
	dovEV9BXE+lgne2Xh+UPQzZgHHUaBNxjlJhh5WLLTTzlN7Q7PcRSx34q89t5ymU52pkdwmHbRPZ
	s=
X-Gm-Gg: AYBFou2hm2+/MivHUZ11eaxZxnrTpN08aB0ObbKm0IYRCZv77UdbgmXsEKiyf662YoW
	3+3OAM29+xhYKPmBoSM4Y4I3LUh/rUAi0bWCiI/VSrRUZ1krJ4UQKCOkMS0Y41cb0nnGe6HACUc
	1OQvN9c2Q6z9Y4/fBQCFLKNZYKo4hreOx5nOMGbWKu474wtTRJERErWGIjuhHQd9pL8aJZaq6vu
	FZRcoAw6gdSycCFTMyUy4ohkScqw+yPzIgVsEed09FpRxTNYC+aqUJqSFbIYPzzExOc6e6jPhln
	KUP6hTOwRBUxugm6p7bBLLbW1VaHlq+lLqFc0vIkOIfCBwO8TWkLcTEE+bOdrFvMjp85nQi1+z2
	g7pYqTSBs6mGJrgzdlygjBMMK/OKH7Z8ALLwBWPa19/b9xeqQiZB110DAQALoNTHF1nrfbtiLqs
	Xcbqfwx3aH7eAip0k9sOsRs/QuTwP7TTn76+/ib+NuE9gxSB+SA0tmJgpsGvzW4zY=
X-Received: by 2002:a05:620a:2b46:b0:93f:e52:40ec with SMTP id af79cd13be357-94784916c8emr463470785a.81.1794220037358;
        Mon, 09 Nov 2026 02:27:17 -0800 (PST)
X-Received: by 2002:a05:620a:2b46:b0:93f:e52:40ec with SMTP id af79cd13be357-94784916c8emr463468785a.81.1794220036886;
        Mon, 09 Nov 2026 02:27:16 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad4d1sm237381545e9.5.2026.11.09.02.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:27:15 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 11:27:08 +0100
Subject: [PATCH v2 4/5] gpiolib: don't overwrite the entire flags field in
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
Message-Id: <20261109-gpio-desc-flags-atomic-v2-4-c4c54b476628@oss.qualcomm.com>
References: <20261109-gpio-desc-flags-atomic-v2-0-c4c54b476628@oss.qualcomm.com>
In-Reply-To: <20261109-gpio-desc-flags-atomic-v2-0-c4c54b476628@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2370;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=eW7d6lPWl7JriaxL+uhRZPNurMSB5KL7r6fnnNoTZzc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq8Z/7NZwQ0eloe0hUFedBEHfBkhMOZQUx7lAkp
 NvmON+qYaOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavGf+wAKCRAFnS7L/zaE
 wxR0D/47Vd+uhH4UtFj31MSdEIBL4QW9yNIK28Urt611VYkzrDhSvWvWheZ5dw0Vw5Useug87DE
 GeWTeqrPu0mUnCvYbfwe/LEsQP25WY7ADS4t6GggvUxfB03MEhzzN6+RFBQnsPJbVeUcCDSCeRV
 MtICCjMme08661JY70THwjgTHkquCXJH3wBFaZrRsQyh2YkTXck0OijP58PmZcXvicdWfAquFFG
 7Hpt3swV8EcbP/bQgRGo5/ZufyzA9rsbIv7pK1Qhln0VwXXHlu8YZtqPuf0a0h8BRSuLRom4Dkx
 DQDzqf0yQWdTN1gQWaofFGLHt3YUTrKOZoZe8A5clxkz4BqLNNxS/RWd707rX2N3aQl0vkuka5z
 KFnF7iEXbEcgDUJawtS9jurDP7eKXGNri65arJ0zi+6si4BTLOWJWM9Jz0oCyUMK6ln0zqeuDp5
 KLD/Sikzb5uJ6s2R35q3GSveTyI4r7kvn97edFOFyc8kSnzXdKkaeTOum28lQ/mPckn6odDrdY9
 4AMBvu8YPZnGK2oLdapMOQ7/mtHMhjZfeQUXUD6Z1JVw8KtGepQCMT5V84xL71MfskIwDNjEJSl
 rBnYLtijSxQ0guZlVKt1gYvvFNv4teZRs+ge/VjaXDIsPOODEtEnh/Vl+YuzI5NNudaSO1l4uqm
 No+4QwkmGC2uv2Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 38zHGeJ1kMurbbc03qnIZRilFC9Hg6Z9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MSBTYWx0ZWRfX4a5+jvMCce1a
 6uZ8DzWeVlxnkn3D5s4ffcl3RqKDL9Dj+JsFFJLkP57n9RJdHjAyirPu7u+iJTKpPIfl61KqPt+
 /B9O0YV6WYYWIXAaSLYwInlrEVLX1ZoXg1/FnDOVXfug1J+udlkc/kJLskG4RHzOC+ZG3ix0II7
 YSI/6xh4DnfmDk12EVLVQdDAHcHm/6M1x9Gg055ppHtrnl7PW5FLM4bAugltS7LFQAC00LIDtYY
 ATdJu7K8tLRxAayjkNMxJzSOR+xX5LAAP/g2Ohz82Jy+x49JAUjeBrHF2n/jqpXD8teotkMNwRM
 s0vB2wYKgl/VuWzksG17t1d0rLzwT1ht+l0HNH3u/8TAm/PEpdIogzlQgvl4bDyJNnXM4iWhQsj
 BlxsgBwtu7+KmuKu5YdB979/Cxdo0NuTAe3nGF9qRSp3OMcCiQEGSRzekVaUFawa50yeWp5IFgb
 7r0ffHJ+KPAwYdstWew==
X-Proofpoint-ORIG-GUID: 38zHGeJ1kMurbbc03qnIZRilFC9Hg6Z9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MSBTYWx0ZWRfX3aHe7gxn0p8G
 nZABCg/1SKc0mFhdHW/eT9p9cKV720rUr+COIjw4c+zJ6KeEmOv2sRH6ENWTyTjSKEpmBmGkdZa
 wBRvyxD8qvjWQ5firI1qXmy1FpCR/Ts=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6af1a006 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=obTuVQ2JAUH4m0gggDsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090041

Use gpiod_update_flags() to clear all request-related flags in one go
instead of risking racing with concurrent users and overwriting any
changes they could have done between READ_ONCE() and WRITE_ONCE().

Cc: stable@vger.kernel.org
Fixes: 35b545332b80 ("gpio: remove gpio_lock")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index af2d67d977f4925558ab77c34b37c3c29bd12a6f..4c9c524389ca13e422bca8c217b7f47477cc0dd4 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3,6 +3,7 @@
 #include <linux/acpi.h>
 #include <linux/array_size.h>
 #include <linux/bitmap.h>
+#include <linux/bitops.h>
 #include <linux/cleanup.h>
 #include <linux/compat.h>
 #include <linux/debugfs.h>
@@ -2696,24 +2697,23 @@ void gpiod_free_commit(struct gpio_desc *desc)
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
 		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_RELEASED);
 	}
 }

-- 
2.47.3

