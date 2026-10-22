Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659506;
	b=XE4PMNwjBpE/doxp0yEQf/sbakiaWz5kvGgmSyUmFLhVFCBxl4XAnC0PhaW4uCHoyjlI
	 zeMFlaQSafHMs4Kc1ApPtPnrFmhnafWfrZis+SFizLqE0rnN9GJ2e7rPekP4DLIIiYFeO
	 kA5ar1ns2zOsgY6Gy42MhBwjAbP5c/9fUQZPUmdgIGHCXktBtTMVYgplO4rfpmJDNy3IT
	 mxwi9bsN2k2SI5mqUB+vRAm31Z5DrWudET4KzSfENEIA8C4rB6aNerYU0vPfMiX6mRVHZ
	 gb5KRab1nNvbbcjpB9lk0L51IIPGn7Cv3/uJ+jTQQEWIYP4VKj+yAVsW+HammVzC09w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659506;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XifzIrjO8Um2mjh4fUxoQvxrf1F5cyhzZDGnoH8FPys=;
	b=CUbuD7c3kEJ3guSn1hSaiL+wWRQcDchgThdMfp9iL9SQXT50y4TM+1ipZgrDD/L7+mIz
	 6ZuuQJo/JRpA08cxvS2uJvweM03gnfagEGJS76cgxvhzJWRwlWtYCWxITFX0hCL6BclWt
	 3IvT/8uEP/e2kO1ZyZau504b91oauZxOhM8ganete3KbTtfzVWk5mI2XlXZrOqO2bsgQV
	 Z/GSLNGqDK12/IWA1mE0OtKHtgEDKhohd+7mAIeqoT2Yoe8VoJpV47A8Bv+1n2rfPJlfM
	 fwjp9fkuo8A9XIduflEeIDD4rIPsXOCf2mgTTd697PEg2T1gN7NMs4ErjEuYr/wn6Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VW6AFGvi;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VPz17Ghx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AED606A330
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4AED606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VW6AFGvi;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VPz17Ghx
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M703sh2714537
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:58:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XifzIrjO8Um2mjh4fUxoQvxrf1F5cyhzZDGnoH8FPys=; b=VW6AFGvidHvKBfhO
	WE2RWh5ufFFB60dLU7NsaPdLh0BQ7CmPsBiLA8z1hKO/mD8J+ncL8t2ggbVdStX+
	yNOPP50GMCKfoZV0KCNKWGtQ2n4WbKUcWN5f3NyQtd1353UuSqUAJiH6GDNN25Wd
	qtpM1Dq0SS4aN2/u4cL79iksf+oy5MNGrT6pZSvKU3UTsjyaNOQ7NaHKjcjZUe4r
	6a9OlV87KooNss2MJIbi5lVB6/xaP+Wx3cvMcb1YZDOMkgvtp+7x7dMsD05aHv/6
	a775mAlYqPyXuj+AoZUbEaN7z1JMUX8akZTW/axd+/isVjstbYu7yoOTbQLgvRC/
	jGzwfA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bsj3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:58:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ca9b53afaso508138085a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792659494; x=1793264294; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XifzIrjO8Um2mjh4fUxoQvxrf1F5cyhzZDGnoH8FPys=;
        b=VPz17GhxloW3VAoJa5fHOxzmYca5/oOSq0Ham9x5O1jsiSkJG+KYO+h13JTq8rNmLb
         UVJHU/cXoK5+e8SSPW6qye9zLxILJiR+4JeY4mTuqJf1io4ZRR4DZhhuoDSdMswW6Evl
         yq5SCLWyUJQo5NIUXuJUmr1I/NUrs+BItq1ZFlycODc3GbdDS14DEemz9FykePak/YUk
         Vk6QX1M8AZTvWBhRW45Wj4Vjy/dA6mEJXxAr7RRG3/TcnQ8Q3Te3hgFpLEdtmDQ5ztLz
         mv9eQaFG52+TAKQYw/EtgndZSBQBpZUo7q6rIJv0qKKOh0z2WVmLu+VKUWXk+xHPRZLm
         dePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659494; x=1793264294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XifzIrjO8Um2mjh4fUxoQvxrf1F5cyhzZDGnoH8FPys=;
        b=ygakFE21upagqudWsWAFDnd/dBxigJW4sBDf3EDjEQxgASssejQ/ZdqmCIUKA2kHy+
         NnmxgcgsjrXrDgq/4rT2iEzqmUI8M9dqGhHsiCe/J47PhAaEPSOb69XVROUUZ1SZZsHG
         blG3nmfU0zfeNOhuFYX0qpj8KUEtA1sOXjk924ShTSKCQpkasUiFgHCCMitrTVEwxDLu
         68QPqlfvI8mz+shaK6FUdbLKEOgZGdS44kfUEK0bEoxbjJh5V7mCZy7BlxGkpaPsH+fo
         myBvyJysCMfDoExgqrH5mIetGyxVuoTmpNsMjqt6t1Rx7vfhamAAhcVea1e3kODQOZLY
         64cg==
X-Forwarded-Encrypted: i=1; AKwUvBz/m417Tm8aTSJeNpP4bhEQUhfaKkKzaBPnT6onkGKrghCgVWhYdtGu/DVC13JT3mS+kp0sqj3cWop3xtk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiyefZFaC2Gvuat9zLVKhQy9r0Xs+Gl5xvC6cNPVMS8nIGTvz8
	3/eWxMJ9zoLvkjwKsqJ3fLpBexm5GczSCtANI59r7KzMxDS5B9axfnKSHfJDXesThmNX1U0w6nZ
	1oMQLaRzOMxFatmfGbkBR7K+NNYSR1sSBf/0pp2cX+BXXGzScUZVS0xSl9gVv0uKeOw8=
X-Gm-Gg: AYBFou1cE1fXSSwlI+tNmmphH81Y+B8pxf+VKrJhMmQiwYWSQwOsHsnJd6MBcJhY+qa
	xkr0uh6ug+kpwFksF3D3bvuO84NSu/goqnPF4R5WNZr6/LGot3JzVX5F/ZxuaqEvcoZdN19dvSr
	BXKIrS7FFHM8Vpedb6PeEegD951x5wfDfFZ94fMB26+H0dWCWOEmcymdkqEomHe3SYQ2O1fJU0i
	DDOuOXScc68NjD6cUvUSpQdsaf/oDiMtuuF/gcHRhjNKVdA1rXRedhlRdrmS53SDoKo+EJDmQRj
	LxB0nMra6V3fmUWFJASLKWLVk6DceOpngN8wOFFB6r/manpCA/WJpHFCvvrICKNc8HXLsM3hVdx
	FP8cfwwsiJf1gCB1yTrkw3VHo7dMD
X-Received: by 2002:a05:620a:a89b:20b0:93f:3120:6c84 with SMTP id af79cd13be357-93f57f1cc67mr569441685a.36.1792659494209;
        Thu, 22 Oct 2026 01:58:14 -0700 (PDT)
X-Received: by 2002:a05:620a:a89b:20b0:93f:3120:6c84 with SMTP id af79cd13be357-93f57f1cc67mr569439885a.36.1792659493799;
        Thu, 22 Oct 2026 01:58:13 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203b28f70sm61625525e9.4.2026.10.22.01.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:58:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:57:59 +0200
Subject: [PATCH v11 1/2] crypto: qce - Only register algos if the user
 really wants it
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
Message-Id: <20261022-qce-fixes-broken-label-v11-1-0d33c34fd0c3@oss.qualcomm.com>
References: <20261022-qce-fixes-broken-label-v11-0-0d33c34fd0c3@oss.qualcomm.com>
In-Reply-To: <20261022-qce-fixes-broken-label-v11-0-0d33c34fd0c3@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Russell King <linux@armlinux.org.uk>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Birk Skyum <birk.skyum@pm.me>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2114;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=W2vrkLJdRUgwbRgUUdohghAMPZS39GSW1r50SY5zt0A=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2dAhq4Y5Rmrd7hbC87snEjHpGkuQUqK4WRtnk
 NxCvMnPL1uJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatnQIQAKCRAFnS7L/zaE
 wyMoEACM4oZvzD9i8QC1aYfvOs5DajtJp9MEM6MGeKA4kxme/ayD10a+lSzmOLT/EqlYQz2F6tI
 RF0QNFJgnPzxzkoZOuTXRRq4+axxcWxnuSxhXsbwxCf2KJtw4+LqwKV2//rKjsiMGuGjAY4rkb8
 45VFhuktgEGhyWu6mMRywmgIXqI7q8hWOOLuExFo2zCj5ye5PgxmzxSqyswJsR2WjWVrZwthSP6
 W3uNPvxtqc+vzEKm83IuL/HuKJcjccBbNm//v1xnGGvw+doBuG1sz07ni+CX2o3G0TJk8GGZ1hF
 VmlDJeKVC+0fqejZvvmyWMrGLQTIK8h/Qa2ORWR7OB1NFOwoX2uB0z1cEI3Fkkl2W/CFFNN6Dyd
 xbv+B1pdCNjdLkN3akbEkzsl80K07HIPD7+Lp7PKnP8j/ZaWX9SpWlJtu6u3Y3s24nWb4xAAc7E
 hRNpyXc44jUJWJmRxy8t9bBS7WDgSTNpycyyNZqjHfBpnWhhd8BR3VQmaI+MOyzOFQmaTPgaHrG
 4oK9ehRydsGwNd/D1OBR8WMjgjidYafL4RIiBzQiJBXlVyKTS+lJp2bjGJF3XJ4w9cuvh3DSdQY
 qrx21B+XD3kkhKDJJPr5JLue0ZfXG96/3dzgZLM1eDc1siik+1vNqv6YoR8eJKFk1peVjSZpKJ1
 AO7u43TGZxiZ0pw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: gTkw_I5kadwfy3EdDTvnWljI0IGFImEd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX3nqPQ7r5Chjh
 FrTWuiyxU99K9pIGaFg+zVBCruCdsO18MmLnCniZV0Cu8bw3ojD7nr0GNKvPf4gGFZuoPRVFai+
 FUW5t86XKMDhUMLAAhMptgU277fcMxpteF1WALxKyDo0WXufmLYcyqY9z97+3X8BYiLuVSwt06q
 eskDbs+mjMb2jYXkMuiJuAMaENTPvra0cVOIrnAp6HUYXQ3AibSawI3HfV7AABtmpig4Er/q9+A
 Nx3KXHFr66Fou8pJCrDh6tyq6HgJFLyG7Ku6k9/QZaMnHPpn8lLPl1RjEfndVzCQRwb8Yjgwxs+
 Jpo+ZfCDzC/IJREwk3bgoLuNWBQfeCzuQpOU41GfhqORz1tu5Ccn1DFLh7w0X+/Ewtv73d4NUDy
 iv9ueZY1uDxdSucn+PDS/GYwj/PR9b18MfVFUSIeTtzwhSkpnrxvD4fkHbUY6EcY0PnXbpGhCm9
 w4+JRmhkap5TPNVUbDg==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ad9d026 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XywcRVADl8Xu_msC9vwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX2XE+2OhkCIxH
 Lqpa5Jzd2vEEtkOUhSxNTiKGuFdkpLQw4x3tnYV9gPwdKhU3xgHk1ib0aorDByY7YutLq+jJukI
 6oXO+BCp9NY+1fbKzX4/DTW6JWJuesU=
X-Proofpoint-ORIG-GUID: gTkw_I5kadwfy3EdDTvnWljI0IGFImEd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220035

This driver's crypto algorithms still have a few issues that need
addressing which don't currently trigger any self-test failures. For
that reason: don't register the algorithms unless the user really wants
it.

Add a module parameter to the QCE driver that by default causes the
driver to *not* register the crypto algorithms. It will only be one if
the user explicitly passes the do_register_algos argument as true.

The power-management part of the driver is kept as is to allow scaling
down of interconnects gating of clocks by runtime PM.

Cc: stable@vger.kernel.org
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Tested-by: Birk Skyum <birk.skyum@pm.me> # X1E80100, Lenovo Yoga Slim 7x
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index bf3c1bc3ba7bde5e5d08e06071c67ba77af95695..5b1bf7a50f88c890da1f0820fb9e070b3d3f4708 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -10,6 +10,7 @@
 #include <linux/interconnect.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
+#include <linux/moduleparam.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
@@ -22,6 +23,9 @@
 #include "sha.h"
 #include "aead.h"
 
+static bool do_register_algos;
+module_param(do_register_algos, bool, 0444);
+
 #define QCE_QUEUE_LENGTH	1
 
 #define QCE_DEFAULT_MEM_BANDWIDTH	393600
@@ -259,9 +263,11 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->async_req_enqueue = qce_async_request_enqueue;
 	qce->async_req_done = qce_async_request_done;
 
-	ret = devm_qce_register_algs(qce);
-	if (ret)
-		return ret;
+	if (do_register_algos) {
+		ret = devm_qce_register_algs(qce);
+		if (ret)
+			return ret;
+	}
 
 	/* Configure autosuspend after successful init */
 	pm_runtime_set_autosuspend_delay(dev, 100);

-- 
2.47.3

