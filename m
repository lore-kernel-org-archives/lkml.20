Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623837;
	b=NnJ+2AE9YNVBbeX94fMRoTu312itb0Plueev3EwtND1ECr3vVZL/eMyp9byE7uAcrj1O
	 56gnEs87VCULzoDIy5LGWASS3fJcxGaW7FjwIpYR5lPxEt2SQ2E0UDKUveyHZ4D0b0Dh5
	 I+yyQnA7mtrvSC9CNi4AAhfsXrqgCfFbLt5BPsbiDESqZQBjmovSrXiJDNI+USx31HGF3
	 nR4fDDC/8bljGz1YDV0Sya7NIvkYnxLihg1LpHQU2ciTvYX9t+oaQI7sklOfE1mxNGC02
	 EIg4fbbWd5mJIwLwACCnCtv5BBF7+f6kVzn9K8h6RWSIpA2JvCKPidamF9/FQ9JvsvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623837;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jVsUHPoyhDSKww0+dFJuDm9UgxlWudWo2Y0gRhQ0Pis=;
	b=GGXaX2F4dJFE7rrV1b7X8NPEXTEyYDVGQrBbe6pfa+ZPsoJwIRVgOwgZDVLAkh3vWb4k
	 v6aC/gWMZb97wEPKJhql/w7nMWsqvMMnL0uniFEbXrnurZHyiLKbBn7+zY62OKOon8KZi
	 l9MivQQfuL3bhlr6mxgp+1h9a26aOTsaUeF1QC00sGBQ+elt3k2+PPQZW41Y1/C6Qn5cR
	 jH/JRngGC22iWQNZ3C5Vg2jN5CVcXvs37RU2TIAYTxI3T3vaXH7XdpL8+irnu8ndIsgLY
	 DBhHCQXFoxuJIbWIuDxF7x7MTQR7r9L2oIM68eg9a91qEsoZZsGY1GGG6kLPp7XVugg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MXagzSFL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="SLbioN3/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26F360A381E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:50:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D26F360A381E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MXagzSFL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SLbioN3/
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2BYmgH3762983
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 12:50:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jVsUHPoyhDSKww0+dFJuDm9UgxlWudWo2Y0gRhQ0Pis=; b=MXagzSFL16RdDPZW
	LMoKn2MNbOJajyWxLVcs0kPhADPKDtj0L2ELDcRdFn1y3YpAOTVKPD6KX3WLfF2S
	EapAcTHOkKIf8oqPErQVFMTEm3z2/J20T1STfGkdE0cWtGcluponpGfbdjWXhOBw
	Kh0U9eInEIkY+ZD/j5tLGYgg/XrStfA3eJ+37SkmidRo/uql/1RvnNl0p6rgIGPk
	E3Y3+C6lN1nfp1fz0mRhQ6dvsTqS8JSGZbpjFiAfgrjGdFvrj1ts1cEkP+FLWJX8
	/cS4jRvbm4NI8T9Cop2jjNcDy/Pqh7OV1Cs0AYy9dzOaz/upcGNfgSm5ANH1yIjP
	qq5WOg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpss5g8v1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:50:35 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c84af45c8so61505626d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793623835; x=1794228635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jVsUHPoyhDSKww0+dFJuDm9UgxlWudWo2Y0gRhQ0Pis=;
        b=SLbioN3/bgRvj7xq1iS6wA6990rk/umEZfU9DAzx9nCL2/qlP25hiSlZsmkvybOlMT
         gukX5lRh6IszbE4hN8Mhmo9H3hMWsQnLfebTWb4pRlakzSFFToayuaixb268bUU+2DxF
         uysD6YN+4oPkZg+DewsDE1LLw31mz6IgBLv4Rr+N+Zc6roDhQR6GigVPcTwcY4BPDc6s
         8ewapb1+O2IXbiEKmQlxehIr6Ntk8uxOQQh4YYZ9kKEJVYvYY0x1XHGe+w3GSF967/5j
         Hb+uYvvtmMK6OzHISD9B9k2GEGffwyoGfi8mknFBYZupPQv/pi1vrA00AvAolD3xwXU/
         JzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623835; x=1794228635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jVsUHPoyhDSKww0+dFJuDm9UgxlWudWo2Y0gRhQ0Pis=;
        b=wsTFsmQcV/hf5vaqaqNTp3FfYJE0A5LDWf/LvEZFk00eB+3l+KV+Z8DzbLmrDKH1Ay
         6yYAOpQwvnJTZW+wzx2Xfqc8rhui27w4eOQwtiBb2kmBMH8vNoje8whG/JjB9KhHKYmL
         /5j8H6fAhXkO829Mk2CbKRK3v92ymPL8N7Tnhw8P+Vsy3MquQOSY6Jub7sVQMm4temwe
         6VSAtuFAAtvk6siqSYyJP9kCWWMJvXDHXvlQNRe8m5ZwSGuTFX7NVvsyGmBXL1sS3ZHF
         xj8d38qZue/tTvkBmkAAB+IjIsktoJL1g9PdZ4grjKRejwR7WStdrM5uKsszD16DVdBx
         4coQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhZrPY3yPR6dLQLHhGAbkksvQgbkpp9TclZKkcQg6ACDnUVmxYCrBP6WyvFukS5U2caqNsBCAH5weqOD8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaenNovPLL8+66AgJui87ImE37b0ilLmHjdcKH7yKIvX3yEV42
	ZK07yR8HIVL5EsxP0baZSnwnKn4Wwb+1ZVLXUwpeftgUZACz9qTx3LM4BTgZTS8akhBf1XxRmgr
	7BP+GEdSBswiu9mtHUhhqXD8OtnbkE93iDspXfFz3T2JIXpBlQlkaBSLn5slWkWq+Bgo=
X-Gm-Gg: AYBFou0RYYCLZTCjHxhGQwiJ7rCfJReEv/T1PXOBa+BqlyUGujUX4wwa8yEMhCRgMcY
	eXD2roxljx5NYUUaQZx1r13/ICnIdWdQjhwF+LnkgcVTOL6p8F4j3FB9mCXse8b8SMQ39sye7/E
	mM/wackYfD/0SBBAdt7y2N9J60iWicyTeSKDbv336d64y1Rh0FQmSVs8cp6pa2PDJCqZq7zy52x
	QH7zctfja93ykyV/i1en+6rHPRuDOH+067RUdYfxmuzcCEODEC8I3Dzi/U0KdftjaB6GZWrDGns
	O9DIN7qzAwI4DBH6CagoTUQ1uD3oqaScBHcJaO2tRq8no+1AwZqtqGc5E6kSZDhXEYa8QEhfls3
	j3ApVPqXQTeMD+hBcXWNCnXSLwnqVtnpeUDl8B6+LL6S3BAWVJ9MObctnr7wrifPyDujJy4dc4p
	5atA==
X-Received: by 2002:a05:620a:3705:b0:93f:19fe:e6ca with SMTP id af79cd13be357-94421745e9bmr1712750385a.43.1793623834407;
        Mon, 02 Nov 2026 04:50:34 -0800 (PST)
X-Received: by 2002:a05:620a:3705:b0:93f:19fe:e6ca with SMTP id af79cd13be357-94421745e9bmr1712746485a.43.1793623833739;
        Mon, 02 Nov 2026 04:50:33 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba24f6sm20464910f8f.51.2026.11.02.04.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:50:32 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 13:50:22 +0100
Subject: [PATCH v9 4/5] gpio: shared: detach the proxy device from struct
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
Message-Id: <20261102-gpio-shared-fwnode-lookup-v9-4-a1d6cc501098@oss.qualcomm.com>
References: <20261102-gpio-shared-fwnode-lookup-v9-0-a1d6cc501098@oss.qualcomm.com>
In-Reply-To: <20261102-gpio-shared-fwnode-lookup-v9-0-a1d6cc501098@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6235;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=r6QbQj8Ax9PQvoHE2LMYLkSa8l18ETTwNCg83EIkJhI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6IcR2aAmLu3amjGoeJXIZIPPfPqQDE6LIOwWA
 btDZYsAjv2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauiHEQAKCRAFnS7L/zaE
 w00rD/9xLjTw7C+3m68uzxaax+mBVyMZOuJu/IWPxLSCqWpCZ4K1eLJ86txLdpJ2fOgH1wsSW8p
 7Z4oZtH4Ib9GZsAx6UGW5cUQAcjRoQVVKwdCOUETR/R0u6YlzjQV3BmLZQfmfn3sFrETFu7An+v
 Tn59e3WNV462LwO4vij19gYzNVO768tJPkTeaULoT0ikXDPxt2CxmHAWF0/+dQey3KbYBnoYICD
 fWtu34Tw7XQT9NjRv/e3xiUFClnErrCkxWsAB/wwBMHkoKYSdfb/Ju9SbhprsFjt1R0w+kQPv6N
 sPuqxtfMk0YhiR1kFxzM1z9hk1iDxov3ie/O96W/9EZPc5ud3UOAdBfZGCzmy9nVFRjnyOlBF1F
 gY4xgWoWSObk7SMwT7U5qba/hGVPMwsCwv/93dir51OOjWtw/MBmM4WMgPUV9T5iOnMns0AMrek
 14MgFHgixi4TXA3fr8L1OkS5uOmzIG5+1Vc0Fm7iXIcygpJUfAGvPUJbIfq1un/rYBDqscoSgAZ
 hMNJLZH/hdJ47t0NjckgF656u6GPL/uU/8EDC31goGykqzZAXmY13jTqLlIC7S800JCJQlF/QWd
 btTQ1LegngdfbM92K9wDknZ1dOWYGg/at5Z+xpoKNnFhpA7bJTCyzHkGp7tHCuUdUc0FkbsDBsZ
 BVUMyjbxEJqXJ3Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=VORIDNPX c=1 sm=1 tr=0 ts=6ae8871b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=nd_FmhSvACMRRlF81YkA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: JEeyFrvvhBFW62mm9jd1dnTuWpbn5uip
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MSBTYWx0ZWRfX24umfAceNzzR
 s4hL6v6IkkSwdXviNISk1xH/cpQlucaaONo/ZqpnH8/vIdiaIyeCKbt/KyjTcpFLyz/YoiDlJtN
 2kwZg7e2Ubrh1Gexd7SosxRTwz/Q4M/6s6dNFrTp97NSN9LU6pfdtw71QiqABFeZyAyDUr42djK
 weMT+QRYS7tnC/QECPvLTY0RCd8cmXVmzO0Cond9GB0rgIK1x84bPwTdghJWiDY84SC/YCdgq6K
 BL6X7S+e8EsmpbqOHgxkpXGyQxzMNf6KQbnlSEgS/RCakU7RoQEIep3YerZDkcjHArMRwtkeQR1
 ZBzqH+/HgbZNNdxq0D2Yf6Q1RQfqX86zrgPMXWn3Tut65NRZKpmWVpywotUnbKpCQw1nwIqFjSw
 uOtTKpnlzKFoSVPWkaTLI/CHufwdfBRfAbcHtNFcq/hWBUslVGusjVQT+rUUMz0X/xdJsTRw7MV
 fa94QjY2mLheX8IQF9g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MSBTYWx0ZWRfX1S75OvnXWiqa
 qad5OHvanXxY7jI52HkSP/viw0cELNPH9KQM7o/Y5EibSeoDBQEWJyszZv0KmCWGp28/aNB4EkN
 +D1sB9ZLhz4BaRVUH37hgz2xIYJrUu0=
X-Proofpoint-GUID: JEeyFrvvhBFW62mm9jd1dnTuWpbn5uip
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020051

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

