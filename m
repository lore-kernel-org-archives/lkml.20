Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806627;
	b=eJzvpDC8pp8FqupNM7KGnOr2at3MDIk9xLam2Qnf6RDc+iuHj8SV9Uow7pdz7sCEnr68
	 Jc3u1fV7lIRdE31PTfN2khE+YX8/nfBXRjkxI2sMzrfIO+ieX68cHyBfnOc6CMUvASziI
	 vTnnoYSGmbWxu+PZva6IwgH/h+QAfLS9yEJ6bhYZMIWTiV935NW4N9RFs6per2Wadw7F6
	 /dgLPxSP8Vb8pMEhy/GHkVCL4ApQ5raP67dfdERQeXXKIbLPqtwP6n4AQqGnAWQrkHJ+K
	 rJnSTFvv5yLhPRcl6A4qJLJAinrfzLrwyZJpDhLUAdqM5oODUsAJ2abXbtFqprNdjmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806627;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6VkGul/A8qLYHFVGluV9qcJV3TfbgVqP3JtUTvoLxT0=;
	b=rv28wMH381Wj8DMfK7X5r5jxUgNHM1JOO1xk+uKTq6WF6+P6w56sM2yJVERETs6xjFb1
	 3wUzeRsJDsfHP85D6tekYO7HFYw2aeLDNJ5v22SRcFwedYwnSYNT9nzTk2KdE6ULOkwp+
	 I7ed69jbDtuDZaX+cHAinY+HKlLCdoi3FLtcYK2g8FXD54Sp09/5x58SeksXPJH78OlJ0
	 dmxPqk+jrtH9n7tJ3My4qLtl3ideQf1VkTHxfmsF0JMBoMcXo6XWb9M/3TUQexswppAfv
	 KEJjgLqy6KS9ZMZuI6NKqPQpsVhqpPh9BfA6CkJxAnNPVhJPzcnUAqMG2FMnAVGEhCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NReqiMPk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Q2/yXPSi";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20636082BD5
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D20636082BD5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NReqiMPk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q2/yXPSi
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZs2G1700278
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 15:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6VkGul/A8qLYHFVGluV9qcJV3TfbgVqP3JtUTvoLxT0=; b=NReqiMPk1nrl9oR/
	jprGixl394gSRVV0EDX9mAImS8lZmyupSE9k0SjyfOZPj97Dp5XVkqhjF6Os+GZm
	AHTd9m9E4OQ74OyOSrDkK3v2MUXKBYg7P4DYhojGSVXl1cIyzLy8tH1dEsVgNmd6
	QN6ihMwCebWtQFGvVX9WXH+QaZOYBV41FKjAUmkXx4DdAeCiygdq2StTodqVO+tf
	zTrWEe1SjGn6XKa7ouGws8oSPB//D/p+VZ9OxCpHpL+zlt5DkuYzAgFIdaIUpgyW
	uFuVoYzjH8eHriMWGz1pouRRX1nkazjbHaj/mT1Rrl6cUfpsNQJPMW6yEx71hTP2
	CmQ0Hw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3pyh0vg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:37:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f20addba1so183030685a.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793806625; x=1794411425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6VkGul/A8qLYHFVGluV9qcJV3TfbgVqP3JtUTvoLxT0=;
        b=Q2/yXPSiYh8RgBANaBtaR9NtCARbFjXm4e69Hyv3cAKKLfy65co44XEU1ZnbprHCgt
         8TvvPbUNazkKSsG5Czksi9NeUlq+qOqzSXb1ThhagLhkahWttPpzBgi/WG6RlDsoCt2k
         xWEEJA+U+EwCLFqoNpLX2ic3NgjnI23auiuPPIRTMZgZH43g1VPF/P9MZHO/8jrT1/p8
         Lv2f5IRNJI0m6Gb0FnqvJMbNYviA+VmGCCTfS4Oke+zn4qDRsAVPoi2jS5prRZyQJhJz
         yBEQgwGOE8oHHWoHxxqn8gmhK8sKOhFNAdzmTeG6VBP69roT27lREvXEy+J+AkhBuOpw
         NFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806625; x=1794411425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6VkGul/A8qLYHFVGluV9qcJV3TfbgVqP3JtUTvoLxT0=;
        b=XsmS4PoSKQBJKbBWzn0RCz8zMTCDb/he+C1KrJ8Mb4bg4Bu1qdLaKyF3xJInNs1EOJ
         BZgZXz6fPupGan4jZPCjTyJbpvwXX/9Y/GC6jDk4iNHHctrid/cEpv2/PVvsIzLsMJ4s
         OXp/e0wcXEhsmM+GVQPlIRBxhpOdlkdLy9i5YhZAI938qnPReJ7+QUzN36PrYSYxXtwn
         gOlArXbnbNxTGXADTIzgYtEeFLa7egWYzueSzdaDYP7wT9aR/3ZjnyQDgAQwIQdBgUdL
         5Ubk64DiG8ov7Tyg9Y2PmxOxh+5QXRvYVHG+hfcuV7oz4GtMoMQ0RdjHq48FGOJ4Y2w+
         2wEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwRITBslhdmmLxSETKdejkLV5qnjMledlEARLVYByH+KXy+9TlZU2hfz7W2TR/zg8Oq3ppogvZ1MMWa2zs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Hd1zM+3lojWOXmy87d3TdaZjHlRyeNAme/0S3XFTpHA51jMi8
	kROWm9fJVF1LfNqCah/YxD0BOdBIlaq4r3O7apM8NN4bIAU4XQnNK7f5ouBG9SVnwBm4g11X/yc
	q3f5DfUoK9gpT7aQd1ezxTsZ40l7epq/m+Q9ycJw9ubZwiulOf8ZEEO1cUNSSoeqT1HE=
X-Gm-Gg: AYBFou2UVup2zh7ZyqsoFQjX5WWTIStKgB9r+Ty+638VBmaWXBvmJUWDQ0LM9WtlliV
	Y6x5TetSu0g7nKtu/xw768NAnAqllheifGeHDg6pt54Pdnz1Av3/Q/n7LLUUx+mHTY4Ultb0hwB
	ALgiw/ixRiIPW9nCNJV0tButMjCIE8AjvQUVV/8oEtCBhQbCDKjneWJMnkdrEZ+2xMS0UdJG/EV
	1Rr8eDYwozGBII+r4q1ydaP3QjkplWKlMqGvDsMUUPSjvInkGOZlWu+yIeYG8+hEMM0oJOfzSeJ
	Lnar+MeEKv49gvJKKseV2nGnl6dEfeDHH+/9l7WJ8D8wpMbRxElSh+lRYHygws07NH7vkeFhA0s
	NBkZDCcxd4xTLwQRHvxOvvEYPZd9lDaBrj9ALbRDG88ze+crhB3OO9umB7jD6jwVsDN06ANuNHh
	EMig==
X-Received: by 2002:a05:620a:8806:b0:93e:4d74:68fd with SMTP id af79cd13be357-944217b2aeamr2673124485a.65.1793806625227;
        Wed, 04 Nov 2026 07:37:05 -0800 (PST)
X-Received: by 2002:a05:620a:8806:b0:93e:4d74:68fd with SMTP id af79cd13be357-944217b2aeamr2673121085a.65.1793806624817;
        Wed, 04 Nov 2026 07:37:04 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4107b7198sm30388825e9.0.2026.11.04.07.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:37:03 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 16:36:57 +0100
Subject: [PATCH 2/5] gpio: shared: use atomic set_bit() for descriptor
 flags
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
Message-Id: <20261104-gpio-desc-flags-atomic-v1-2-e23cedf619ba@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1518;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=sMmWnya14YIAq0vwSErMArXF2T6bT5ovzCJ95r5ENFU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq61Ebhf0q5C3a8TYWNX2m3wEDzl1DfFdXy/QYM
 Uc3c12MwyWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCautRGwAKCRAFnS7L/zaE
 wzcED/0WO1uAMKKGnyIlXKcueWgZ7lHWtYfTCFx66uukryBrJITMHy8+f6fTDEbV8kABF9vWNOk
 w3BhSDj8lL4Yb0/RuS4b1tCqLyjMQt63kup7Gh5h8KWNYzwkLrcZhRllGt1nUQfeeERmFvWpXBl
 2eyaV5pbmnH90iW+SKYhehkS5IzMu4UwH3SCvdsTf/FxUPGs9C9ZE9/bYD/eKtYPsQzibVLtJCz
 GFGsuPrZ56I6fq+G9TPRnVBvJqJAsUE6V+m93hVGSxBhXiiH7meziX88yT+uHnxy7rkHb94jsRx
 FCVO6ai7oqvANh/LCAzixbXKyPvLHcaRzYIDSTZugikWpkbWKrA2TwBdGiPBQPazC2ybp0pfMXD
 zZWUiW4+WV/mieoxu9s19Y+CKs24GRIgIp3H1bQ3lvL6eof/oVMsKUragftcx7J2uLR852Q9B1z
 qd7izYni6PdlYL0ZMw2cUea1dhnDs3fmIeGWjvGKLugF/M4W0YlQsLvYXMMylesl2lrkWVhlL/Z
 /oMK7BP3Oj236LzYPEhN+mx92x2lOUFJpncasU3dwXAYRcqD8XCmBk95O6VciimEAOjCYbv8okv
 TQZByt3KdgcJxbrPgBOmvkdN/sVXQsQHLoNUcJe5rgYJr1Lb0I3Sm3iTsHZcsBPC5f3OAzz0KTd
 E54ilmx+nQcmN3Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ZbmIpcVA c=1 sm=1 tr=0 ts=6aeb5121 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=H6RLajfuJ0QrpAsTGAkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2MiBTYWx0ZWRfX59ij6Pka4Nu7
 fapjrXDT2a/0mT6aRrKS9vOOgyDcem9UD7VMSfOcW4Q8IQtWCW8HvzbFieNtpw5RkaqWLbVAsUf
 7Tviutvk8iApNnQTYa4uFBcsr5zKGH9+hMgdhlb0gwbw5/wvXWvAb4dyWMkiZ0mNnLi5i2YwZW5
 1Y7f9p1U2cj4m+7FyVXNdKG1eYtHlAE0McmT3m2+8BIVMf3LnwcSt646o7eLd5T/ocwlu6Pevf+
 qCxJup5NOPraHigKawnMjsFMA8iSt9r1vVj9GO0fMzJcgaGS3kxoOhe634WLvEzdQoZA+z40v6N
 EQJQemZAjQrU3a3xm65B51xhg4Hqe28qVCaZqs7VtB27PKJ45XMjIDYQSwiBTNjy+eQX2wSKybk
 kSPPU3THAybP72bJna3vOqypkBcty/iRBDZsOxjKsQwy6KySoK6fCcGv8912SAw+vm5xosTiemB
 ooK7T3vjTnVGzWIK4cw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2MiBTYWx0ZWRfXw7fZpWHqSS8p
 sl/BUKYzCRWhDrwTbA3ngGZuhxcuIkRRupLo9PrQQKSsQG8pa6n5I32J493+a6VFvbzN6F5Fazc
 sWHOVjhDHKGVLFH6BzFuF5AOpUPT9uE=
X-Proofpoint-ORIG-GUID: ymFbj_iC9u3KkJX4zJjEpth5_tn6clZq
X-Proofpoint-GUID: ymFbj_iC9u3KkJX4zJjEpth5_tn6clZq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040062

Use the atomic set_bit() instead of __set_bit() on desc->flags so that
every modification of the field uses atomic bitops. No functional change
as these run before any line of the chip can be requested.

Cc: stable@vger.kernel.org
Fixes: eb374f764a70 ("gpio: provide gpiod_is_shared()")
Fixes: 310a4a9cbb17 ("gpio: shared: shorten the critical section in gpiochip_setup_shared()")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 8c9ac9d9330490b17fb3936b8758beb97a308a15..d94fb94f31c2f487d2e45924e11c33570466a0f1 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -532,8 +532,8 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 				 * This is a shared GPIO proxy. Mark its
 				 * descriptor as such and return here.
 				 */
-				__set_bit(GPIOD_FLAG_SHARED_PROXY,
-					  &gdev->descs[0].flags);
+				set_bit(GPIOD_FLAG_SHARED_PROXY,
+					&gdev->descs[0].flags);
 				return 0;
 			}
 		}
@@ -573,7 +573,7 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 
 			desc = &gdev->descs[entry->offset];
 
-			__set_bit(GPIOD_FLAG_SHARED, &desc->flags);
+			set_bit(GPIOD_FLAG_SHARED, &desc->flags);
 			/*
 			 * Shared GPIOs are not requested via the normal path. Make
 			 * them inaccessible to anyone even before we register the

-- 
2.47.3

