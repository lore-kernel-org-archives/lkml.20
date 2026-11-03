Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793708490;
	b=l2Ilpd8hsHt1ERoMOQkbtaQ6zC7MPWqhg6nA5G7UPLufdFKn17hsAHcs1i6X7fm73xHl
	 Q6QCODgOtOqeascF27X9Z1lsffupSIa+23oqLfT8rxMs+gYahOaOqyxpBwd25e2CMMNTH
	 bvOkbHCtYRa6JieoV9SI4i+YrgijAwa2rq64okmIO9wG+qXcobB5VVePSytIe5il2XbVC
	 wqDYu9HUApa6gSI/u54NVCRROgBj6bhosCYnV6IRdxDu3LVjD3VG7gmep+khhRTMsZQWO
	 dpx8YFemEUJ43/Gu7k64l45zd3T/wAi25bBI1MRK+xKHT80AD0yyCTD1rVRf3j7NSnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793708490;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jVsUHPoyhDSKww0+dFJuDm9UgxlWudWo2Y0gRhQ0Pis=;
	b=hisLGDLtjsvGAKrfDT9sDy9r5JV3a+dod7zF3sgGOR47+QUgy9rhORWyrxjs46QI4BDD
	 BP8fzIDPShqXrlMvnZl+kTYkHSTVuTv1xfp5I8KfLSO5+ca/plCDpc/CiU0yRFLg7o9bt
	 1+sWPtWmoxIcCyl7sEBZtzUQr9nXFOCyOXcVXULSiMKkTDVf7dMv4grRG0Ugt+dF8bCrB
	 bShjCiEjGRF1Wc/bWWH8s3OLEPX8qbSP35usLtS2mWaf6GLcXzNLzIafEtP2XA7kot1EA
	 0/4zXVmU4+QIntE906xcdQSx93pU7OChno+8MzY5kzxA5hoDzUoQGfeX1S+2QHdUxOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a3sP5r3Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WrNz21db;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F84606D811
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41F84606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a3sP5r3Z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WrNz21db
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AApIj928227
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 12:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jVsUHPoyhDSKww0+dFJuDm9UgxlWudWo2Y0gRhQ0Pis=; b=a3sP5r3ZU3Zkf0Kv
	eSteTMnI9tndWozIp0anVLyAT5rdzyqdcIZ/DlrMxdxhQOpxTUOlRK0AO4BVwqoM
	eJ2WPrxIUpxwMeFA8uGz7NPrnVxPGEwIvnKtL8XscjCJLPXxK1XtCt4qJe6wTY4w
	v/OPoYOUwQRS3qFXd2+9reehg19HV8ESnlNmvFsS6T81vkYQGTTAo1vk3yP/0c97
	1Wut6/Be4C/1lBhkt+z/rlDERJMnBGcls8KDc1eTaKLdYDbvv25a3rVsvrIHSO8d
	OhbNxBBUkMhhR7y2qZ0rxTMhsxSx6OKqAneOBfg1gZ/QUN37W2HEd0UW3gB/hlso
	lmPa1A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07ekp6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:21:29 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d06f3784e2so1010684137.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793708488; x=1794313288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jVsUHPoyhDSKww0+dFJuDm9UgxlWudWo2Y0gRhQ0Pis=;
        b=WrNz21dbc+yRo6vXSA4YeudyRwM44qaDC2fE9kDtC3HkDheCKduLYsrl+lTSgDFb/R
         27ULiBwAVNy9HQlQlfOiNFj8BHqH2ZuUNgnmOJWqEn3AhCnWLKmRSojFTfQYUQZf8/Eg
         ljd/5Qvtv/SQuWBXb9kByneKuQpGVj3y0ttexgHbbyyfsgW0DHdeKkNEhbNj6/+5M7MP
         J8j6/ufqTgfMScvUFG3GdRxIPwumfmWOYpHPDTv7xLzjQxvHhexQO/diRG9ryZrFbuIy
         vTx9yc0Xll2uEOK2YMNF7YxiakkUM2OoGRrWXm4tmaBFJxmfSWa5OQsf/42+pQqn3TWh
         VhNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793708488; x=1794313288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jVsUHPoyhDSKww0+dFJuDm9UgxlWudWo2Y0gRhQ0Pis=;
        b=ekAGWC4Qme52Y+9z+Z1qA6Xovom+DP3ERkJRqGyjD+bjnB+2YboJGx7nLtUbaUKlns
         Y19QKiGhpMjig+FmTVYD1HHhBeCvdWAY+UMYoiOyc7gkIrLxTYvak73ZewblQgB+4zCn
         49Ik/DZANOOc2TvGHSKaVr4Ezm2ySrZXCbOhjVnoRzwd3QiItf9FNnxOZGpkEMKYxhJY
         DMTwKDokGb7fEon1Mz3/qguH39TyKOAL5WbLRiOMjOx2iIqLaHU+xAqwyAx8/CKqDaPZ
         GCTrlJQtj8jWKkVWvgztY6VLyxo6q/+s2pxN/wC7IL99R/HKa372UIoCMprcepr1FaWR
         yW1A==
X-Forwarded-Encrypted: i=1; AKwUvBy8rbRbxuAIKPs2zJqLZlr+M3tI2OjQKxzbVY13eVxN+YfXEoabS5esxNjp3869rYc9Bevi7qXV2iUL73A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/t6a4X359upsEv/NXNcFriGojjRIwK8GKGhVPr1sUnNawTAuiI
	dUy9bZr9VRt3G13ChutrAPxC3fqoU69e+X9axGApm8/aocTFq6ujSHk0UDGE1TIxNUQFztDJQhz
	2hzOCDF+jKi0bS3UFjGlSJMfYNqaVHkrVXDfG1FJRi7f+dUexM2xPa/9fwdcwkFAGpQw=
X-Gm-Gg: AYBFou3demFWjr6caN8eGdLOMXgsaDcgqvLMC7JsSXvJBJaSZVFksmEQ+G4bbjadQp7
	ITGNiHAh3P9zdmuuEvQgRSnerknjRbCmkWb2U8C4P8cXmPG8oVBUWmkYi4MMyUqaX2EMGz4y5E5
	dCvILL57HmEIGaDK2LYJpaBAg9wuiNlY5CGPthUjgwDhnfiWCWY3tFkzNt+FHZ1gb89w5z9mAvH
	C8gvG9aUzi0LP97M0KpyA942zpl9Hpz8HYX/Ei2C71KfXBWsPSKQCCNFD7EpK+vXO7D+c1b4hDz
	1WZbbc8m8PdsiZ2VAhMKeogngY8lLebALWB+bF1b7o7QG3TVtHAHlxPUwtW9EeaQN4KckKNR/xr
	q9WrPZVW3Zw6okLUDPDjU3EIj9a5lU4RtaIOQGWXkuA/PhZPdV97tFFMwq2eY8fdXIHS+6LZTWD
	mgfA==
X-Received: by 2002:a05:6102:a4f:b0:7a7:198a:c2c6 with SMTP id ada2fe7eead31-7d072d4634amr4041973137.36.1793708488338;
        Tue, 03 Nov 2026 04:21:28 -0800 (PST)
X-Received: by 2002:a05:6102:a4f:b0:7a7:198a:c2c6 with SMTP id ada2fe7eead31-7d072d4634amr4041965137.36.1793708487847;
        Tue, 03 Nov 2026 04:21:27 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9b54dsm24378293f8f.47.2026.11.03.04.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:21:27 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 13:21:17 +0100
Subject: [PATCH v10 4/5] gpio: shared: detach the proxy device from struct
 gpio_shared_ref
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
Message-Id: <20261103-gpio-shared-fwnode-lookup-v10-4-c0c592c8ab0a@oss.qualcomm.com>
References: <20261103-gpio-shared-fwnode-lookup-v10-0-c0c592c8ab0a@oss.qualcomm.com>
In-Reply-To: <20261103-gpio-shared-fwnode-lookup-v10-0-c0c592c8ab0a@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6235;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=r6QbQj8Ax9PQvoHE2LMYLkSa8l18ETTwNCg83EIkJhI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6dG+qeD2j1dZMuOew3EtTu+tPmMY1owOEYP/w
 Aj4GTEvVh+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaunRvgAKCRAFnS7L/zaE
 w3dCD/9raFnbiOLCQA73VBkUGud1naW8cYIvToqpKra1VkkxjluxJpL2k301ez0Y147LG2WG6Ul
 GBQD9eQ73mhzt506xwA6WVDg7enI1DOD0Z/creS33HhbOokxByy8Ylrid6ipnVwL5vvgnt2QtGU
 y+tq1/hYK+Z/TTMXH6vzOyF/8PlKS65wWx0LvM/ZLnS2yQEsUmyOSgIn4QnVVv7/YRIiaMUq0+u
 IURc1Lw5cAwnmBcXNSa3LOtEcRzOH2bIIrh+WbuQeC1UkreQvtb8X0AxdnpAPkbtJwxqSkSp+dH
 qtgg7fvzQHEIStmIiPexy7s+eaHaYPrAUv5Pu9HQZD4n8XqRkkLKnwvGis7X1wH0uNJ+cYaMXCz
 bKy50HWvZeulag+knDASnleAB0W4V/6JXR/ZYMLlI4Bk/URohC5StUx3leRSMgDJfTMAzKk/MJA
 Wl38/nGlvd1m8GuUf3eoRT28I+Vf96LPS0wLu4uyweCdwy4+b50Q5N39vsD6uVPwpI9/01wey3W
 8D19Joa0tkoN6dgnbX3AnPQYOedaA2YR3L4uvVBN7cfMqGU3MXhMLSee9blvv1/7TZ9ED1ZmyTL
 1Li4J7JtoqCMekJHmid3WeB1Sd8wMElPHn3sV/6tyKer7/7Me6cmKQZQNL3/8CAI3yvHHDHTGeg
 f6Y2BHlL/bb5M7Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfX53A7VdnQBs+q
 iSM0mM+dR1g3Jr+dKfE0Y5E4g1zwARL7e63O8xFROWkrmbt0C3vubtiE+rKGXtkwmIFWWm/0TYF
 i9L3hbM36Hf+MPdQeQ4we3uwtitCJNAAZqGJlf5fH72eva3d9GJz+7sAozLemXe0qksAHup7kBT
 iWvMjnwckP0bbwEuUoDrUAzzw4kFvo6mxxHYFl85QkZ9rTh4dBt2yYnEVw2WQP/D90AoZUHG2wC
 suUfF7la/3xyUcVA38JsELLMu5x7vvkdfLhkkgxw4TtwttZRJ1ptJXRxf7gm8Lztis2t0afeYdb
 8YBamyt4BFPsMJDig8WWnuRQE6NTpCQPyxTx3gZneOmhW/nWG8LeP+zChLfSiZNe8S2ezN1qouh
 iBTj16WO5DBf68Kw0j1VDkTMtfWjMPLPEZFxfGlWtnAjOhRKHrgAPTlf2+mRD3DGZqRPSfy+ZEL
 QQgMXmFxnuhgIyCDD7g==
X-Proofpoint-ORIG-GUID: odHgEfmH_BzFP2mMmvSUtzDN1HVvFofd
X-Proofpoint-GUID: odHgEfmH_BzFP2mMmvSUtzDN1HVvFofd
X-Authority-Analysis: v=2.4 cv=B/wsQ+tM c=1 sm=1 tr=0 ts=6ae9d1c9 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=nd_FmhSvACMRRlF81YkA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfX2CjiVutzoX3A
 u2r10v0wHImithxGuaWwU7kJsCXnd/xAgkBFWJZfeU7fB7JOxG6y0+s+50CkeBpQ3rqV1wPKwPW
 A8TJnCHBNbbGc5hVzxIJ4gvfP08JOJU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030049

Sashiko reported a pre-existing issue with the reference-counted
auxiliary device being embedded in struct gpio_shared_ref. We
unconditionally memset() the struct when setting up the GPIO shared
proxy parent while there may still be references to it held by users.

While in practice this would never happen and sashiko seems to have
confused the parent auxiliary device and the separately allocated struct
device embedded in struct gpio_device, it's still a bad pattern and
could lead to memory corruption if a user deliberately took reference to
the auxiliary device via one of the lookup functions and kept it over
the GPIO parent's teardown.

Move the auxiliary device struct out of the shared reference structure
and allocate its memory separately on proxy setup.

Since we're already touching that field: change the name to something
more meaningful: it's more important to point out this is the proxy
device instead of indicating its type in the name.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 69 +++++++++++++++++++++++++++----------------
 1 file changed, 43 insertions(+), 26 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 6b183864933870e54780715c4dd9179faf800d09..9d73a02e998909746f5216f40dfe4d82f7be9e1c 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -35,11 +35,10 @@ struct gpio_shared_ref {
 	/* GPIO flags this consumer uses for the request. */
 	enum gpiod_flags flags;
 	char *con_id;
-	int dev_id;
 	/* Protects the auxiliary device struct and the lookup table. */
 	struct mutex lock;
 	struct lock_class_key lock_key;
-	struct auxiliary_device adev;
+	struct auxiliary_device *proxy_dev;
 	struct gpiod_lookup_table *lookup;
 	bool is_reset_gpio;
 };
@@ -94,10 +93,6 @@ static struct gpio_shared_ref *gpio_shared_make_ref(struct fwnode_handle *fwnode
 			return NULL;
 	}
 
-	ref->dev_id = ida_alloc(&gpio_shared_ida, GFP_KERNEL);
-	if (ref->dev_id < 0)
-		return NULL;
-
 	ref->flags = flags;
 	ref->con_id = no_free_ptr(con_id_cpy);
 	ref->fwnode = fwnode;
@@ -306,31 +301,43 @@ static int gpio_shared_of_scan(void)
 }
 #endif /* CONFIG_OF */
 
-static void gpio_shared_adev_release(struct device *dev)
+static void gpio_shared_proxy_dev_release(struct device *dev)
 {
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
 
+	ida_free(&gpio_shared_ida, adev->id);
+	kfree(adev);
 }
 
-static int gpio_shared_make_adev(struct gpio_device *gdev,
-				 struct gpio_shared_entry *entry,
-				 struct gpio_shared_ref *ref)
+static int gpio_shared_make_proxy_dev(struct gpio_device *gdev,
+				      struct gpio_shared_entry *entry,
+				      struct gpio_shared_ref *ref)
 {
-	struct auxiliary_device *adev = &ref->adev;
-	int ret;
+	struct auxiliary_device *adev;
+	int ret, id;
 
-	guard(mutex)(&ref->lock);
+	adev = kzalloc_obj(*adev);
+	if (!adev)
+		return -ENOMEM;
 
-	memset(adev, 0, sizeof(*adev));
+	id = ida_alloc(&gpio_shared_ida, GFP_KERNEL);
+	if (id < 0) {
+		kfree(adev);
+		return id;
+	}
 
-	adev->id = ref->dev_id;
+	adev->id = id;
 	adev->name = "proxy";
 	adev->dev.parent = gdev->dev.parent;
 	adev->dev.platform_data = entry;
-	adev->dev.release = gpio_shared_adev_release;
+	adev->dev.release = gpio_shared_proxy_dev_release;
 
 	ret = auxiliary_device_init(adev);
-	if (ret)
+	if (ret) {
+		ida_free(&gpio_shared_ida, id);
+		kfree(adev);
 		return ret;
+	}
 
 	ret = auxiliary_device_add(adev);
 	if (ret) {
@@ -341,6 +348,10 @@ static int gpio_shared_make_adev(struct gpio_device *gdev,
 	pr_debug("Created an auxiliary GPIO proxy %s for GPIO device %s\n",
 		 dev_name(&adev->dev), gpio_device_get_label(gdev));
 
+	scoped_guard(mutex, &ref->lock) {
+		ref->proxy_dev = adev;
+	}
+
 	return 0;
 }
 
@@ -480,7 +491,7 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 			char *key __free(kfree) =
 				kasprintf(GFP_KERNEL,
 					  KBUILD_MODNAME ".proxy.%u",
-					  ref->adev.id);
+					  ref->proxy_dev->id);
 			if (!key)
 				return -ENOMEM;
 
@@ -511,10 +522,17 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 	return -ENOENT;
 }
 
-static void gpio_shared_remove_adev(struct auxiliary_device *adev)
+static void gpio_shared_remove_proxy_dev(struct gpio_shared_ref *ref)
 {
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
+	struct auxiliary_device *proxy;
+
+	scoped_guard(mutex, &ref->lock) {
+		proxy = ref->proxy_dev;
+		ref->proxy_dev = NULL;
+	}
+
+	auxiliary_device_delete(proxy);
+	auxiliary_device_uninit(proxy);
 }
 
 static void gpio_shared_teardown_entry(struct gpio_device *gdev,
@@ -534,7 +552,7 @@ static void gpio_shared_teardown_entry(struct gpio_device *gdev,
 			ref->lookup = NULL;
 		}
 
-		gpio_shared_remove_adev(&ref->adev);
+		gpio_shared_remove_proxy_dev(ref);
 	}
 }
 
@@ -588,11 +606,11 @@ static int gpio_shared_setup_entry(struct gpio_chip *gc,
 			 fwnode_get_name(ref->fwnode) ?: "(no fwnode)",
 			 ref->con_id ?: "(none)");
 
-		ret = gpio_shared_make_adev(gdev, entry, ref);
+		ret = gpio_shared_make_proxy_dev(gdev, entry, ref);
 		if (ret) {
 			gpiod_free_commit(desc);
 			list_for_each_entry_continue_reverse(ref, &entry->refs, list)
-				gpio_shared_remove_adev(&ref->adev);
+				gpio_shared_remove_proxy_dev(ref);
 
 			return ret;
 		}
@@ -617,7 +635,7 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		list_for_each_entry(ref, &entry->refs, list) {
-			if (gdev->dev.parent == &ref->adev.dev) {
+			if (ref->proxy_dev && gdev->dev.parent == &ref->proxy_dev->dev) {
 				/*
 				 * This is a shared GPIO proxy. Mark its
 				 * descriptor as such and return here.
@@ -752,7 +770,6 @@ static void gpio_shared_drop_ref(struct gpio_shared_ref *ref)
 	mutex_destroy(&ref->lock);
 	lockdep_unregister_key(&ref->lock_key);
 	kfree(ref->con_id);
-	ida_free(&gpio_shared_ida, ref->dev_id);
 	fwnode_handle_put(ref->fwnode);
 	kfree(ref);
 }

-- 
2.47.3

