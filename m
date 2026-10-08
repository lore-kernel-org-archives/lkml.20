Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2EE3A4F58
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 03:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791429127; cv=none; b=KjG7KHlyaP0SgUlbIJWtWqUSx7BZRtsLrCGwCjCaBuCd25QwsHTl+A0ICu/de2iUOzk8Kxt13svA7ll18uH8S38IIIB7BqLY7o+VEx0nGc0IyMrBF/ZBPYKSWWSCSIQmmk6+mpdtOOHl4SqhiMSXwO08BW40YUAdB+oEoZmoo48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791429127; c=relaxed/simple;
	bh=7ijS/TOAzTV5NWOFXokJRwAiAUu+gJlV37Lq2OGX2QM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=im9aWRQLs2iAGcbwiQ48UOUU8wiyBYuipiX6NlP0wa9O9cyJ4/K6y4s96l2pTf5RGiI9m/z2S9Uaftwe7EK2htAPVB8lIU5CSm4AXwdsKhgtMtChT9yzfl74EzLS6rv95RGwEzO3DX+SERIk8NQ9+3WdFbCOHVeAVvSbeB1++BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I/NmDDtE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E0nJVN/6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I/NmDDtE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E0nJVN/6"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6981hY2Q607671
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 03:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6wJnCzUlDD5MfrFRYrCj/LQYjXikZd2YnpB
	6KpaefGM=; b=I/NmDDtEfyXjHaRxIrJU2vf33OYKyNkTBTW27GDWbmlVrKjcJ+V
	SWC7cPerGYF0T7O2wFB9ExWunKDmnOtOm2Ep8UTr+3Fkm7db0OU5ISojhq/j1Slz
	fEHCNCtxzTG3NScs9nDLHFwN/cI4uzSxcfricN72tvPuEXkCD/m+ZKDnx3+TUI48
	9v18qIjV9tzkLXqNfNK6EPChMLnL10uUsuZNCByAdVn+QZnJTjNm3PkbSXCoMUT4
	6ch/M+LfuG3V4Mmdp/plj+alM879hKByjN0vZ9WgdfK1TTiAoYDH0CaEpXmwleEW
	jmUsOfCEPhNXLZuyflBTQdnMKe2ciwbLwVw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2rv2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:12:05 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso9264090eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 20:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791429125; x=1792033925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6wJnCzUlDD5MfrFRYrCj/LQYjXikZd2YnpB6KpaefGM=;
        b=E0nJVN/6be40qrA6j5FgczGsF83msKocRVGeZaaifk1f7cezKswO9skN9R1FXa0BO3
         yY8uOUVGMmJM8mgW7tfah60x5hozlWhvWexyuFvph0I9vaFRvQ8TDUoVwNYLOP4vhBdR
         4uR+zyQvdufaT6CfwuFDY0wb6WkdzzieSs+DlgqfEJ4Y38L+MjN4x/6weaNRQcId0J9q
         bDv4SHs+cqEwcinTxZDgojoZDMgw5c1J+KTgMbZAoxk68aHXfIsZCeQGQ8eC1jqXyQaR
         MkAsx7qPyTvEuQJGxsJ3fjkoTUbQjNGVMYRQwu1stGr5blbS5OaLYumx2mrhqnmvoT86
         auWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791429125; x=1792033925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6wJnCzUlDD5MfrFRYrCj/LQYjXikZd2YnpB6KpaefGM=;
        b=VUseicGt1NgXlHSienKqahPJNdOGYw+e4fRa2d2aUZzGJK/TCY4iIx6aA06tNOcmE8
         LkSCKP2XJEkWHDKoun2g+LryV6M4YWVDQeZqjkkAK0GphD9juH0Nr0BV4iyTr4L6Gu3x
         vQU21ajeKRQ1yIytAPlzA6eFvgvrMCVOT78R4pjWWq0mRLApunw8DKot8PC5Qv0Z/P71
         0GMEqRad9JduRCQ4CYnzIv3C/x4Zh/sRHoTbVM5ci+iHfPdXikcvToU9SjpfikKUduIT
         aLiXup7PtS1TlBwFFM2mx3yaBuiYIWaydn30nQRilQszARsvN4XAmYODoD9pzu6MNLIH
         /W5w==
X-Forwarded-Encrypted: i=1; AKwUvBxZI+99C3NicJxYwPm+GV5kYlfyfc+Tmm1ym9NlvXVtE79C+0Q2zJnOCiq1p3eiFEZIWDTnxx1DNZ98gGc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpbkTIRdbibPuz/kfpAhpSXzFgZQ5mcNGM6LrPWMuojTZaxz+9
	MTmYVvMadorRqebncQMvt4oL8NNjhYaOz7Pf7cuzlVcpS5mYIhMe8LrD8FL848ineTm7PqU2Om1
	CsjPC6mXC7a5U6vnJ/qEJFvWIEsvkgnoje7lCizSM8mjFxMFl9W/kRlY9iv7lidKYI8Q=
X-Gm-Gg: AYBFou36hUp24SraBvmUzIT7+EEYUAQqz9qohoNQdniRhAcbUTy3Ijn9ihJ+c0H+yjf
	EiOwczIdBIcHKDzAlBWvWwyZst9LHjZf6lmYehni7EpYL4doP0RPB9K0bcGCL4fpx91ZRCH+fWR
	guSx49o/FAjOcs9FfFQDsz313oKVVqk71BmWvgkHJxlUhqR0+CgF94UwBEgmv299GudqS92zGXC
	A96Xt+meWgaemp4SSbalFaWuXY1njJrCZw3yjO6dSNp9n+S/FVhljUtXW6H0kk2hUMWptOTbTrO
	gYR7CS43dVpGSxC3qtczy2pmEpOk1jAGM7+R9LZ2d6LPE+y6yLzfBDNCeaItnGDu1dm8JjdbN59
	tDHxTY/d8LdqkTlXVpKIj2JtVz90iZZ4PXviDxPI0iPiFmsw/356BMe0N+WI=
X-Received: by 2002:a05:693c:6391:10b0:34c:d1f2:b552 with SMTP id 5a478bee46e88-3515da5dd21mr4625778eec.4.1791429124728;
        Wed, 07 Oct 2026 20:12:04 -0700 (PDT)
X-Received: by 2002:a05:693c:6391:10b0:34c:d1f2:b552 with SMTP id 5a478bee46e88-3515da5dd21mr4625725eec.4.1791429123893;
        Wed, 07 Oct 2026 20:12:03 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515afd00e0sm12179530eec.23.2026.10.07.20.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 20:12:03 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Dan Carpenter <error27@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] iio: adc: qcom-spmi-adc5-gen3: Allocate unique ADC_TM aux device IDs
Date: Thu,  8 Oct 2026 11:11:54 +0800
Message-ID: <20261008031154.3440632-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAxMiBTYWx0ZWRfX7QEwEaK+WKBZ
 KI5yp+6a3mZjL6bwA9KmpOtnQ2zy8jjZiOiRxsN5+nVIsS64dPFnSZYZA599sz1S4hACZKk0Mio
 CKXBJWW2N4CY3+8lXFYLNeMd3xfqgrU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAxMiBTYWx0ZWRfX5tfgZv5bdT3a
 XyobSkG+jJnH/qprg2a3RwG6CAWnz60HYrJBknEUah4nIuF8SHJIG1suMwc1hJKAreqvwKt3sBr
 sd3BBAIXPOAl3KuqZav1rIf6NT2SmpOT6d/5pk3mgCHR5nUk7d3AiAh+J5dAwFL/khfAVZDzfwX
 GIIxioYO0xXkc6PqgerrX15lWDZhpwy9fYl8UusNhWCyd1cmlrc1BKG1TdIkE+k/VGSnubFzauR
 piE1WA00Qi0jy0bKJHShDj+EnG+hejIMA+45UF7XlYTCqIR2Hn/leJJH25jJo3XWOA1X3+QkSu5
 22mXpbmSJ8HgRqsA3+it2w0obfdhEC8GAxoxBiZYGhfgh4kyH5n4i7chlajdm3xrSYEhHWJioAv
 e1NNFtUdY75m9FHenvgfZ+hiQXkgqGEup2yc9aJxjNLssqeEBz5OsqRgIQ9L25JQmW3XSSefjx+
 jmqLy2WSyJZjd7QEHvg==
X-Proofpoint-ORIG-GUID: se0RM7HhK8xBY97d44jAuFOlh4WB5VI1
X-Proofpoint-GUID: se0RM7HhK8xBY97d44jAuFOlh4WB5VI1
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac70a05 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=izmiiGAzHhnd4z7VojAA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080012

adc5_gen3_add_aux_tm_device() never sets the auxiliary device id, so
every ADC5 Gen3 instance with at least one qcom,adc-tm channel tries
to register the same device name. With ADC_TM channels on more than
one PMIC, the second instance to probe fails:

  sysfs: cannot create duplicate filename '/bus/auxiliary/devices/qcom_spmi_adc5_gen3.adc5_tm_gen3.0'
  ...
  auxiliary qcom_spmi_adc5_gen3.adc5_tm_gen3.0: adding auxiliary device failed!: -17
  qcom-spmi-adc5-gen3 c400000.spmi:pmic@8:adc@7200: error -EEXIST: Failed to add auxiliary TM device

The ADC probe then fails as a whole, so that PMIC loses both its IIO
channels and its thermal zones. This shows up on Nord, which has
thermistor channels on two PMAU0102 PMICs.

Allocate the id from a driver-wide IDA and release it from the
auxiliary device release callback. The ADC_TM driver matches on the
device name only, so the instance number does not affect binding.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/iio/adc/qcom-spmi-adc5-gen3.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/qcom-spmi-adc5-gen3.c b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
index c68c6c5f6aca..f0b2544c1632 100644
--- a/drivers/iio/adc/qcom-spmi-adc5-gen3.c
+++ b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
@@ -15,6 +15,7 @@
 #include <linux/dev_printk.h>
 #include <linux/err.h>
 #include <linux/export.h>
+#include <linux/idr.h>
 #include <linux/iio/adc/qcom-adc5-gen3-common.h>
 #include <linux/iio/iio.h>
 #include <linux/interrupt.h>
@@ -608,7 +609,14 @@ static void adc5_gen3_delete_aux(void *data)
 	auxiliary_device_delete(data);
 }
 
-static void adc5_gen3_aux_device_release(struct device *dev) {}
+static DEFINE_IDA(adc5_gen3_aux_ida);
+
+static void adc5_gen3_aux_device_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+
+	ida_free(&adc5_gen3_aux_ida, adev->id);
+}
 
 static int adc5_gen3_add_aux_tm_device(struct adc5_chip *adc)
 {
@@ -642,9 +650,16 @@ static int adc5_gen3_add_aux_tm_device(struct adc5_chip *adc)
 
 	aux_device->n_tm_channels = adc->n_tm_channels;
 
-	ret = auxiliary_device_init(&aux_device->aux_dev);
-	if (ret)
+	ret = ida_alloc(&adc5_gen3_aux_ida, GFP_KERNEL);
+	if (ret < 0)
 		return ret;
+	aux_device->aux_dev.id = ret;
+
+	ret = auxiliary_device_init(&aux_device->aux_dev);
+	if (ret) {
+		ida_free(&adc5_gen3_aux_ida, aux_device->aux_dev.id);
+		return ret;
+	}
 
 	ret = devm_add_action_or_reset(adc->dev, adc5_gen3_uninit_aux,
 				       &aux_device->aux_dev);
-- 
2.43.0

