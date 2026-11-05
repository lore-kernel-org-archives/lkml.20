Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890086;
	b=uGDVud7PojZeIJ2mNaNfCij8WHQdWKyc/4r8Nl3vrzD0k2hfB+4U1wHkwvn7ZEw6Qyqa
	 KWwPzci/KLfuw7Cpwrtkrwlw+TjWy0RvWre871n1OMyljaydrVHxk+Qm/NjzgjUy8MZ0h
	 CHL5Kv/34wAcybIHeSo5yb0t1dT56EFJEnNqMWG6TgEp2AEBQWXGXcleWvIXw/AZ8ejS+
	 mlLCzXubosTbB0v1RHd3wTtTQp+f591nmQx8F4WkeKuSTGviKdvM+vWm5qZsVb3x1banO
	 BCZhk8y+2PtaNJRQ7jsfQGIJg0HIjzxsll5nrK5rr4UeSMhEdoqCBUjI+/5WpV0OLBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890086;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XIUlQahuIgT2dggn3IBdwyTP4HkjjzBGnBjYhez4rP8=;
	b=w3VRX96as3kU+muq9Q9wF6fcuBe1Sojur5wJ14eZ9bx+LJhWnpzyLPOc6Q48PEbv6/cs
	 jd1/tGI0cwZFcru0HEfdRUgrCDCKdMQHOwEl1uNnIUDFYDqWlcbaO+20Rs5OW9aFwT7w6
	 91q4YMu78zeDVJEaZGJiOQ6uEiZ/npoaD5T78RquO7+CuQo3gbkHk45IP6Hjaqevr3SMs
	 P8Bh0z/7CIsS2Jo84Ht0JA65yqNKyujHzu5aCneAl9zryIH3J0yede7iBgEM9XEIPDS+B
	 eXzt5UbotesQWKwsCdp3THgximL2+KpeYTw/V8MPbBruCZ5lnuL5VIBJgaTgDbYw/MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JsILPRvH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z6TL+4hD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E94606A32F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3E94606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JsILPRvH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z6TL+4hD
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EPsT12081295
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 14:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XIUlQahuIgT2dggn3IBdwy
	TP4HkjjzBGnBjYhez4rP8=; b=JsILPRvHRooQS58yuPGOPxACkZkYcLhyFiCVWD
	F4ObpXr7YhxFiQUvFN0A7FBjVK/7O+NdIK2oytFZOEWTRlBOingOqx5lzH6mSM2P
	zuvFdgrj0Qd9FYLd2QLFauV0dq9WaGsELwZP7xXVjOvEyHBuI3AAFa/RwIwmtD1m
	V/mlzEjoAN05AtAXao64Z6jSWtCiFq8hv5XbfkgrWObCCp/EP26ule0LMbS/ZJKu
	2bPuwPkJvBeZwk1zResonU01ko1QIbQQtpLtg73McEdfbERd24pW0ad3mLc8Hsve
	0hJsIkXY0Etx/0SONzTaKt7VyAl1ckueoMtZMO4kluBaAeWw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrraas0ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 14:48:05 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c15deb3794so396779137.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793890084; x=1794494884; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XIUlQahuIgT2dggn3IBdwyTP4HkjjzBGnBjYhez4rP8=;
        b=Z6TL+4hDHS6qZz9Lqj1b5CU/aBVNX72hcDC4TSOcVCbOXfpBF3jcCfvBRtnLcRs6A6
         Sryty5mQNjZ3rE6IlKw70GhXrM/aBa5IYWKmSitqnNOqez6vtR6FbtFexssFTguO8m0Q
         OxboO6ff7rTS3tSim/I/lwcT04codb4JKY6f492260MO6vU4hVwp+rHTDqyH/YVJksYW
         er4PnnoqsGcQfxcocEX5XQfcWhpuH7cmqqj6atSTmZHd4UaaGgb15WU3QRAbgzV5o2qj
         bz8+h3RdYgYKnsA1z8N/muaP2+28MwzPCD6QOcGxG6+utW51vH9c6kemviTKl7JLT9st
         MU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890084; x=1794494884;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XIUlQahuIgT2dggn3IBdwyTP4HkjjzBGnBjYhez4rP8=;
        b=kit6HkogU+4d2fHG+El+/ArsuDrCD3mizcxjBXgQcrWpHQmD8F2iNOtPqDgqLEdcQ2
         W/IVmEtT7N/5HvUb86FynG9XctXlmSRIUwrexGg+WgKuzNrcqD6oqZbo7QP/NoljlJSN
         qE8mS4PEgBRlt6+a+3vXXqN3jyvmxhZUU/BcVgggm8O1HYFCFjTbgQVkjn1A6kln7tka
         wu+p2JuEp7MkSDef4kB06MV6hYC6ycWlu5VyOn9AjC2gZ7a4ZlRvjifAiPCZjCaXgiY3
         83q3Mg8IDGdUUXN5KRH0vLsFJXCk813QzbqxmrbzWaL91gj6Oxf6IR+utGHu6+r3Akbi
         MFlQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9IEej0bRk+a3OZUNVL8qgvHk2ReEXEI0omLSXw01v7yXSpulNPQo6h8d9cIdBK+rR7txMbDseCStn9EU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bD4qfkd7J3/g0/mhdL6MtQ2Fle4oeI+WPZpq/KMc2uUR6uc4l
	v8uBOMvytKA+SH2HOgBuXdxuQi+/zShH636QwcM7Is8KsQuytFH3qJufCgzpcHyv+USVKJxKh2g
	weyzhuCJmD2wZDbDM8NTnztxSTFB+Bk0FsV+DgL/vzA1DtFeGiksRau7jE5LMwxgpd0Y=
X-Gm-Gg: AYBFou1mC+CUiEmlHQsOTtZIB2OTH0OErDv6k3wGo2z3+R/atmxJsuieTT63bVcykkL
	dwHCAhPYgfm+oTJkp45/bNtK2FjmTrFZrNbuZJ2JQxpZCE3eg67n+tCe3nl/oedzZ1/NkkDJtJ0
	m9BuipPlmqhAcp63OJFFxwX1KG/Cdif8imsS9VGR6nWfMcmyK/Jl4dgRR0We0OTxp0wgC4KZ5AU
	NElI7lSG5EwDctbXeubKPbyBTwhiPUbvjF2T0w2iRhl/h56uDXLgdrEO3WP8rEmOMnJZTh5yvfS
	eOLd908m8Fj5wcVjHbzoT8nYLqJhyTfCdizmul4aduPCMSTQJhj9twQiFZKRNqrctME4Dpy0QIb
	5o5ngTNJ4X0XGMhv+DqlCNg/9369jC4KGuETAIPemk5G1p0NBy6pz2Z7brX6ftZHWRScz+QPB8B
	nBaQ==
X-Received: by 2002:a05:6102:148c:b0:7c3:9464:efaa with SMTP id ada2fe7eead31-7d07223f482mr9621666137.2.1793890083843;
        Thu, 05 Nov 2026 06:48:03 -0800 (PST)
X-Received: by 2002:a05:6102:148c:b0:7c3:9464:efaa with SMTP id ada2fe7eead31-7d07223f482mr9621639137.2.1793890083224;
        Thu, 05 Nov 2026 06:48:03 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda20567sm11205756f8f.51.2026.11.05.06.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:48:01 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 15:47:59 +0100
Subject: [PATCH] gpio: cdev: fix waitqueue deadlock on chip deregistration
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
Message-Id: <20261105-gpio-cdev-srcu-deadlock-v1-1-6047117030ec@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAB6X7GoC/x3MQQqAIBBA0avErBvIQo2uEi1MpxqKDCUJwrsnL
 d/i/xciBaYIQ/VCoMSR/Vkg6grsZs6VkF0xtE2rhGgkrhd7tI4SxmBvdGTc4e2OotN67pVU2nR
 Q6ivQws9/HqecP/43eSBpAAAA
X-Change-ID: 20261105-gpio-cdev-srcu-deadlock-1377b86567a3
To: Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4206;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=0fakC9EMET3jBy7No5GpBIe7f4Pl8vI+qRAGeN01JLY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq7Jcg4Ok5sTBKUiSlkopmH63APNkd7sU4H2G05
 r5sbOkZND2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauyXIAAKCRAFnS7L/zaE
 wy2UD/9FHgbARHQ555S5Rr5I1dbXyvIKKT+zVKpJ7wNIonEzr6i++NbZ0YUJ837PVwjFoSG9uII
 7tu80ivanzao805uILT/PysobDqX8UOMU2G8mUfkyyeDK3/pvxdIkAet70CkdMSQB8RO1aASKBi
 MTBg4LjR1zW+WAVzwC536rRo/r2wUMqkbzuSDLDtZccYUfh6wWD8TO9nl5XngqKiHWe3I4rbupY
 DdS06OZJ3ra1zBSvju9XpSBuWd2U6UjdwninFhtmEmL9QTaUQ5rMmh5t1fSiIJmFTbQ57SEpEft
 WZF9w/wNrv3wF1co2ehbAUgGjMsNcstFHNuTaK2WQN1BqboaRTgr3rOXmW423HkKQIrWTJj7BBZ
 zIyI/Q2rNHC3Yc/whT6ctfdBKxKwyhNlYhKt9euSNgrOdCDQsffJFtFxXMo+uOu9wO+J6EH4icu
 ++Vy3PNQHucmoxu7lyuumsAuEh7TMWnE660d6of49eh7polmB+fYgFQkp4leB58hZNu7rgjFJf/
 c+LmlfrCeHWdH0OdWhrfXYonoWcWiA9ZJ+bngT5W2MdUGQv86VB+fXYWgF5waMDcGtyjL/9rb9z
 9EbhWJ5P40NIPKwakCAnAeKuxJo4UvtPzEcA1pGFKHXY/0HyE+/JxLnqpzvxzHr0sWlMmD2Rn2y
 qX51I0+4zZiINkQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1OCBTYWx0ZWRfX9cPVO28xafCn
 l4DkCyxgd5mGylyWBjCcaVc7E/RmvKQ4iWbskZm868iY4jV5o+nKID3DFSuDIK7P6zEUrdX3LbL
 A8dzU402fjZTTppiqak9aSsDQGAoClE=
X-Proofpoint-ORIG-GUID: NKroDPIDnuMRRDRI9dNvBr_jRbCrNONF
X-Authority-Analysis: v=2.4 cv=U54Hnuru c=1 sm=1 tr=0 ts=6aec9725 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TEQn8LnYDw7bCQWhkO8A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1OCBTYWx0ZWRfX6fjIkhpY7MN0
 x3JEyaRQ2OYQY8fs7sSoA0dfnrdNNLw/hddneiCRppfzCnTvMXsJLP+02w2nTKyHPLRl1+NMwHX
 AyArOSPyZuwuWIcuwsCVTxfdtN0Q4JdU5IUpsgwl01sfsXTSWeyos1fg8xl/X2GyeY13+LP8/vQ
 iLn3rgSqTj26zqOGnWsUxLpK8q4g8MTFu36OApsIfPxDKeirIFbuf+C4IE9jglIz+0pnMo+t0O4
 kp0v6uGKz2XJeINGhZB2nVHYLM2ab76mBAp/DAkZEx4BYgY38m0uDhtyLze25gnRNhdrxFdDlif
 B6b2pSVTsoeqF9Jf80ASDx5lbSw6ca77tgL3mL6djkXr30p1CRol0A9F4v0oplKGBJ2RpDayFdl
 5VAIV9BSMKATd1+YDFahh61WaK7q8sK5gSoMd2KhVI5nBytjL2Dj/UcP8zFp1HxHy4ZRrIqMKOF
 iHCWvyshi7JJfXhBfCw==
X-Proofpoint-GUID: NKroDPIDnuMRRDRI9dNvBr_jRbCrNONF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050058

The three calls to wait_event_interruptible_locked() sleep while holding
gdev->srcu. In gpiochip_remove(), synchronize_srcu() runs before
gcdev_unregister(). The latter fires the waitqueue wakeup events from
the notifier callbacks, so a reader blocked on an empty FIFO never leaves
its SRCU section and the removal will block forever in the former.

Since rcu_access_pointer() is a plain READ_ONCE(), we don't really need
to take the SRCU read lock. We don't access the chip structure after
checking it. Remove the lock and instead make the waitqueue aware of the
possible chip deregistration. Keep the initial gdev->chip checks as
removing them may change the error codes visible to user-space, for
instance in cases of a non-blocking read on an empty fifo.

Ideally, we'd factor out the common code into a dedicated helper but
there doesn't seem to exist a clean way of passing a kfifo as argument
so let's open-code the three call sites.

Cc: stable@vger.kernel.org
Fixes: d83cee3d2bb1 ("gpio: protect the pointer to gpio_chip in gpio_device with SRCU")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
I've had it on my TODO list for a while. I vaguely remember someone
reporting it to me but can't find the reference anymore. Please feel
free to add a Reported-by: and Closes:.

Paul: I've Cc'ed you as you may want to take a look at my SRCU logic
here.
---
 drivers/gpio/gpiolib-cdev.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index f68e33cbd7d4cd5153e82ad77768cf52a90601d6..62215d43b8ac757bbd5344bbcf8631feb2443a6b 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1489,8 +1489,6 @@ static ssize_t linereq_read(struct file *file, char __user *buf,
 	ssize_t bytes_read = 0;
 	int ret;
 
-	guard(srcu)(&lr->gdev->srcu);
-
 	if (!rcu_access_pointer(lr->gdev->chip))
 		return -ENODEV;
 
@@ -1507,9 +1505,14 @@ static ssize_t linereq_read(struct file *file, char __user *buf,
 					return -EAGAIN;
 
 				ret = wait_event_interruptible_locked(lr->wait,
-						!kfifo_is_empty(&lr->events));
+						!kfifo_is_empty(&lr->events) ||
+						!rcu_access_pointer(lr->gdev->chip));
 				if (ret)
 					return ret;
+
+				/* Woken up by chip removal. */
+				if (kfifo_is_empty(&lr->events))
+					return -ENODEV;
 			}
 
 			if (kfifo_out(&lr->events, &le, 1) != 1) {
@@ -1801,8 +1804,6 @@ static ssize_t lineevent_read(struct file *file, char __user *buf,
 	ssize_t ge_size;
 	int ret;
 
-	guard(srcu)(&le->gdev->srcu);
-
 	if (!rcu_access_pointer(le->gdev->chip))
 		return -ENODEV;
 
@@ -1832,9 +1833,14 @@ static ssize_t lineevent_read(struct file *file, char __user *buf,
 					return -EAGAIN;
 
 				ret = wait_event_interruptible_locked(le->wait,
-						!kfifo_is_empty(&le->events));
+						!kfifo_is_empty(&le->events) ||
+						!rcu_access_pointer(le->gdev->chip));
 				if (ret)
 					return ret;
+
+				/* Woken up by chip removal. */
+				if (kfifo_is_empty(&le->events))
+					return -ENODEV;
 			}
 
 			if (kfifo_out(&le->events, &ge, 1) != 1) {
@@ -2579,8 +2585,6 @@ static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
 	int ret;
 	size_t event_size;
 
-	guard(srcu)(&cdev->gdev->srcu);
-
 	if (!rcu_access_pointer(cdev->gdev->chip))
 		return -ENODEV;
 
@@ -2600,9 +2604,14 @@ static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
 					return -EAGAIN;
 
 				ret = wait_event_interruptible_locked(cdev->wait,
-						!kfifo_is_empty(&cdev->events));
+						!kfifo_is_empty(&cdev->events) ||
+						!rcu_access_pointer(cdev->gdev->chip));
 				if (ret)
 					return ret;
+
+				/* Woken up by chip removal. */
+				if (kfifo_is_empty(&cdev->events))
+					return -ENODEV;
 			}
 #ifdef CONFIG_GPIO_CDEV_V1
 			/* must be after kfifo check so watch_abi_version is set */

---
base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
change-id: 20261105-gpio-cdev-srcu-deadlock-1377b86567a3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

