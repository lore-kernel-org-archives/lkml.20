Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592659;
	b=IPbPt5fdGao3noIG+6CC0KbFQheCjmuSRd+ftTpVpaCQHBcbtP9MI010akmBM9qXu43B
	 abqIocuaoEmm/nR53USAme6e14IBw8I7Q9JXgSnUmlnlVVuuTNdKMTv1nZE4GRufjyv8W
	 2d+d5wWZ1GRmmk1t7aRtYp5Lu07BKO2stZuqaVkCq9WQVQsd5EtptzC3Ced9pEaXJk/8G
	 K4/7rYqb2H8t5EGYA5hfg0hRwBSKoMg+/XSTT+4BJOzNCozK2H5pMXR9SmJHVbjyHAT/v
	 /xrlOpHIsPSGdfG519iQnqNcloAmXFPUwmrhDO+hi/MixdqjfzjWZoauUghPtHkridQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592659;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MLlLm8e0vLkKVw5dsLlLr2pfVX8lx8EmYyRkpGtAmHo=;
	b=Cs11n1NGlWOM1QFVcN2psrkygLs5iuEhKz4shSxcYsyyZzVGyWhdX14SoyZw2geeqoFA
	 xCcz17A1HW8/m5xtgY9NKiUD+KtA1pajJ/duNAhDJHeIifgC3nlenNxxfHOOvgDQNto7V
	 miVg4kU6d5EKQMIdF+pQ8oh5OXSxzBAJnshNnmjQ5+Qy09hXjTXIUKvsj3ylt4NDm5QqK
	 wQybwXKf07cWAI7dbx6zSwcgK3RNeWKP31DiQOou1F3/jzfOvZIf+2nP9IKfZPGNIec2t
	 X4Rqw+CX5ipGDF7fPqwiih8MfC87evDH9OXEJlDVK/7mjT+iFyw3+O3FSeJC5yJ9KAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="f/29jYQV";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="U/67wFCu";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3F460A2639
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB3F460A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f/29jYQV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U/67wFCu
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEExjm514704
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MLlLm8e0vLkKVw5dsLlLr2pfVX8lx8EmYyRkpGtAmHo=; b=f/29jYQVbpncRBrh
	4LDVdZqnSahIxdDh+mCXioE8phn/becBOj4HPYxLogOiHYx732zk/I91D4aBoUTb
	YMr/nNEPvk+VOBc2RJ7mG9Y9pGYFPazZyV8AnfblwhD34yA/DnoMqAtYZ5il7YRY
	BMueUcGzHzrUJwkrtNVuGz0Nq+7VYDy37osRCANoqd2cBI5IWpjtDraNxOpp67DV
	nPM7TAms3JmCzB3Uw6RByQDUHK5avgHDZJEVBuR1fWdq/g7Hy//PVvICOYB0miep
	pg5LOjcsZbd5QdRL+xDjNsIoHCRcHCCNGv5ocyhV8xjnKFgu0wdVZMSSEqdIJ0Yn
	IuZIAQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex7vr8pk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:24:17 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-98a9c848bf0so123035241.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592657; x=1793197457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MLlLm8e0vLkKVw5dsLlLr2pfVX8lx8EmYyRkpGtAmHo=;
        b=U/67wFCuirFFKNBtNDKuhYFp/hbOprpR3sWDq4pWG92TeihpLo9Z0dmbB3XMdz3JOo
         52kZurE/Mnwb1VfcQ5t0CI1MSwKOZLqhPNDcAWTlCrC4++Mb551RAgp0tQF77jy3xF8i
         LnvSNQqpOVSrbfVBeXbInKveFlJ726+ei+bHOU0YeYjSX3EIZgro0rDTBi5//00in6AU
         gvZxp1jheoY+JouZ2aYJKI/neVbuE2j127CtUJLYSyOqZIHYtL9vtqZC9oiIN2Yej+GS
         pfoJY9qnPiokrqydt6UGTrajN03YKjQ709nQCQLFaaI/Rn/QX49SlcIZzIiwMuYrUUgh
         UeVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592657; x=1793197457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MLlLm8e0vLkKVw5dsLlLr2pfVX8lx8EmYyRkpGtAmHo=;
        b=l5F38iJuMUhLqVAzRdEvsrd24s+Je4rnB7khzcP6X8JykWM4PQo6MbtE2HN0vttSBp
         Q5dvtHgbxi+jF4OxmN55dz0yPyFCf+yNKeffi0RZlkn8WP4dzSKTOJyjpN74FTsg+K1x
         DdcoNSt8nwtmAuNQrKYe3+q1EPOXe1hqjPVJNJoUpROAqM1MirFOqNtIAGI/jUatgPG2
         SOMdnlUVIxTmqAhjK8G43m+zLYGjt8dtpywNgu4tGZPau3pfoDGl34UJm7pYcoOv/lJe
         lWFoiPYeQUKEu8rlAzkdZMJ+iuXJSQYkwvKxXDfvDPBoqL/ENHowkJvOHiLlkVLfBoEV
         h7Nw==
X-Forwarded-Encrypted: i=1; AKwUvBz06BhXEbtnuWOa+vl5u3UW3RrGQpoowtv3u3h0yA9ryKo4Jmt7xwQyB96JvWcZHk4+bvFfNFgb/8CQr00=@vger.kernel.org
X-Gm-Message-State: AFq9FYJliDh+oFy65exVdKguehqYjhIGBiZh4ZyP+r1u3iDaZtanANwu
	7MNFIcS0kss/87vNyCrYTMnNrEQKoakt2yUYQ/WEiiPRnphKiWcCQvLnyhvFshXWFPsIlQdZkSz
	pOfJdbbRVXmouv1dQ1dJSk7E+Z2YHS7JOLlSqjT6Fr5ug95Yf5gvX9gl4ntN9tar29Fw=
X-Gm-Gg: AYBFou0QMM+0Tnb5XXNURW2KjHBH5g1+u1y8/o13CAcFpxqBgX8RVT7PMRemhy4hUD2
	bVDTbVfunoEZth7r3nEJrEBeHgrUeQevM+fr6WYjeHmMgZLFmnmv07lxbKsk8RZoOXSOQUBL+GI
	2l/PlXSwslxVr66b9fwEwjOZXRQ2pPbJcvgaHZKEG8gA2RInTV2zI6w3B24iLvWQZBa+CRL49yD
	oQ5W47Pmhz7c/tCQvdr9AjGnNz/Q50HVedvknjC/4Jacj9Zbwab8iIe9uvjTCzTN/Cud4D3U9Jt
	Pie3HFZ75tNe9BH6xuEvANFxA0FnwHcsta2qa6DMNWtpKH10dTBRhIcgSy2EbVLCya0GrjgEl5N
	fk/C695XV7RTNI+6Kuy2KsuSdvAYz
X-Received: by 2002:a05:6102:d87:b0:7c2:799c:9031 with SMTP id ada2fe7eead31-7cc926ec013mr722038137.30.1792592656739;
        Wed, 21 Oct 2026 07:24:16 -0700 (PDT)
X-Received: by 2002:a05:6102:d87:b0:7c2:799c:9031 with SMTP id ada2fe7eead31-7cc926ec013mr722019137.30.1792592656069;
        Wed, 21 Oct 2026 07:24:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb83ff0dsm103760055e9.7.2026.10.21.07.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:24:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 16:24:02 +0200
Subject: [PATCH v6 4/5] gpio: shared: detach the proxy device from struct
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
Message-Id: <20261021-gpio-shared-fwnode-lookup-v6-4-6af7d8eefd25@oss.qualcomm.com>
References: <20261021-gpio-shared-fwnode-lookup-v6-0-6af7d8eefd25@oss.qualcomm.com>
In-Reply-To: <20261021-gpio-shared-fwnode-lookup-v6-0-6af7d8eefd25@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6238;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=qU1bbzVFoGC6HD82aOROY+2km/oYCp2CTpotEgrYqzA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2MsHVVn+ONsnVxyh9UcGOfndF7MRA18u3rHuu
 2aJE1TkjqSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatjLBwAKCRAFnS7L/zaE
 w82tD/0a2BOa8ikIXYC5hxaDTvB3oxqEOi2gCKDoaaTiWhxzuj+gECmg36OJ/y/xHUTE48i9S+M
 LgSHLrJwTBYUJ82r1OBtPgajuXakXbv1nyYcfe5U74EGggNE2xEc9O6cDKxvdcFJrunVsU7klrP
 FYJZnH4f9BIM56+vGlY32auEC8wMapDci9YPY4P2buc2xBhWkIO1p/Zg55Hk67HvvTy/F1bB2bb
 2Zk8oiAWbc9mwc8SaPx4F9edteKPU8wJK25N8QGuim1DbHufSj48IykkHQtP341c1VzBmyPVx44
 KlgH45Nsq6IVCuvptV+XiqpiPEMdiuLEBywBpY/H/UFpXxaziHT282qd2hac3tzcym28GJvIJih
 PBSY+OJ745Dw2WMTKYQ1xlGGp+tR6x292jVVoiRo+DQY09fnkFZci9lhDqVCkFNIKPWpM2sPF+I
 NxGPeSRZcN8Z+S6TwxqcIY7i/d+XohbvbasFWfG2fc29Staoq6I7kf2w9B5sfxAPCQ/7XtsIhUy
 x4dFrqk5dHgNjjCRBu+yTFK2vtfY6NfyrrenTWp4COn7zsWNEpG/HxlicmyWuMQ/AqXBwdY1dc+
 1C9TTGfgrgUKAe2U+mjB6Hb2n0GtGh/5YRcxCoCDdgQVPtR2x4qec7FXl+OnMhrVthaU8C3tyP4
 wYG8E5+eLN/8Wqw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: c7gCyfRcN6Ccb3anb2XcGfpZl2eElC0t
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX/GoYal0qatCA
 wXxAwQ+UNzel1EPjHW0bscmKDsrnSpT0f46SKrMvEx70MVmf21X84uHug1fjISBVqQA7lqC1Djd
 SqSUCSWGHqULOKQxUeoGvGkvAe7MTvo=
X-Proofpoint-GUID: c7gCyfRcN6Ccb3anb2XcGfpZl2eElC0t
X-Authority-Analysis: v=2.4 cv=e4uT2qp/ c=1 sm=1 tr=0 ts=6ad8cb11 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=nd_FmhSvACMRRlF81YkA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX0GDjkBncchiL
 xiidPAF472zvaD4L+l54WAppQyNS69iZRZ2/qJGZcYgsBT5SdubXbZNvRzF27JC8fyXZLqq1V8T
 vjmu/yoJgxqfHsxOvcSlk2pexIIwKeK75wJxXuE/jyK8w4ypUztZ+PRRCLqV97FmAS5MRGJCNfI
 rqpUttAms7Yg7qPDfHIj07+6PsUR12ia1+PFoQypLci3WvYLAvra+/N2Sc2Qd7bmX9LRFIZFy1n
 eSRnz6w9tsXBfoldgPr2xu/FDjVrSQLFNi2YKX+4v33+9AXJMCV9xK70KjHdqGsRQvP9he0JljO
 j6kuc0Wf1z7eqFSlD0zIZjOULhxhnLWNFPFTee0ocndYtAsbfgB8qYC6hTjhktelH0MITzWrVqR
 yVz9tTr6ayYfAJOdb4h9RShAr0xIKMjxHnlYVyRpd9N4AVWeUAa5nGxJ46p0a0AJeeFifbsZFCr
 5CkwPreRC8fAqTXm1yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210057

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
 drivers/gpio/gpiolib-shared.c | 63 +++++++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 26 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 043d5daba7a73062151a089b3ee8ccdac726f221..3ed25609cae10081a0ab5276ebcd47aa3c49f76a 100644
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
 
@@ -511,10 +522,11 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 	return -ENOENT;
 }
 
-static void gpio_shared_remove_adev(struct auxiliary_device *adev)
+static void gpio_shared_remove_proxy_dev(struct gpio_shared_ref *ref)
 {
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
+	auxiliary_device_delete(ref->proxy_dev);
+	auxiliary_device_uninit(ref->proxy_dev);
+	ref->proxy_dev = NULL;
 }
 
 static void gpio_shared_teardown_entry(struct gpio_device *gdev,
@@ -534,7 +546,7 @@ static void gpio_shared_teardown_entry(struct gpio_device *gdev,
 			ref->lookup = NULL;
 		}
 
-		gpio_shared_remove_adev(&ref->adev);
+		gpio_shared_remove_proxy_dev(ref);
 	}
 }
 
@@ -588,7 +600,7 @@ static int gpio_shared_setup_entry(struct gpio_chip *gc,
 			 fwnode_get_name(ref->fwnode) ?: "(no fwnode)",
 			 ref->con_id ?: "(none)");
 
-		ret = gpio_shared_make_adev(gdev, entry, ref);
+		ret = gpio_shared_make_proxy_dev(gdev, entry, ref);
 		if (ret)
 			goto err_out;
 	}
@@ -598,7 +610,7 @@ static int gpio_shared_setup_entry(struct gpio_chip *gc,
 err_out:
 	gpiod_free_commit(desc);
 	list_for_each_entry_continue_reverse(ref, &entry->refs, list)
-		gpio_shared_remove_adev(&ref->adev);
+		gpio_shared_remove_proxy_dev(ref);
 
 	return ret;
 }
@@ -619,7 +631,7 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		list_for_each_entry(ref, &entry->refs, list) {
-			if (gdev->dev.parent == &ref->adev.dev) {
+			if (ref->proxy_dev && gdev->dev.parent == &ref->proxy_dev->dev) {
 				/*
 				 * This is a shared GPIO proxy. Mark its
 				 * descriptor as such and return here.
@@ -756,7 +768,6 @@ static void gpio_shared_drop_ref(struct gpio_shared_ref *ref)
 	mutex_destroy(&ref->lock);
 	lockdep_unregister_key(&ref->lock_key);
 	kfree(ref->con_id);
-	ida_free(&gpio_shared_ida, ref->dev_id);
 	fwnode_handle_put(ref->fwnode);
 	kfree(ref);
 }

-- 
2.47.3

