Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792584767;
	b=W7AkisOxY0UkFJKhsCzcbdIK2hnewpipbIoaplNYtvkSU6fICJfIbBu7veuFZB0CEICO
	 W4oJ8IzK1YuXhfrVsLYw11CKRbIANMg2taNYNJRXJvwdTfThLlsb9m+4nY0Tt6rMMKkzX
	 3NGgyoZDwO1OfhXo/KixoylBoitKsx5cU7FWSx2GCVNFvfDlJKXbhC3f8JsBr/xpC/+/f
	 kZ+lTF7Ra1piJZMplIrGL89aK2wio+YAbwoFyxfjhhM4oqupsDG3DtmMAUuurLXCmP283
	 uUznnghqafhpWYjmxcd5DX3EJlTsRgOBhlkr/3iiIgogOzRPsTKdFKqelanU77swFpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792584767;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4VUHRAW8yx/sOc44JfCen1/+gJw1tTZHwwW5QW+SJDQ=;
	b=eiYVe9ddFobPs/USJdkHjGcUZ07dmp6XDoD8GC8/ADemWAkmqmr+LoJQCzypOKXQcskT
	 IK6fxTsAJqJHx7wYS62a5aAI3qGAXDq4TZFPUQ7jXCjEX1bYi3d8hPDpnTM0zbC06G758
	 ADNkmfR+neuCixr0OpzDI244omCsW4PLYqlZEXGwzg2YMpE753P5xy+h5/AhD8ygqizIU
	 E6PLHlwoKF1SEvIVA+xXdW3WRWt5vErOzfewhqsCUMBxAS/ozlcUbAKBzbOPsHOQ46oH/
	 scPsTgtOeBrnhMM+NakWWvdbsFANzxCtl3P6RfvPDHOAjH6+Pxx+msv8QDwULV2Xtuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BUVdilvL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b7vlvuOY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D926606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D926606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BUVdilvL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b7vlvuOY
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgJCs184019
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:12:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4VUHRAW8yx/sOc44JfCen1
	/+gJw1tTZHwwW5QW+SJDQ=; b=BUVdilvLGxveg0P/M9LZ+StTgzSf48MqZkAQIe
	hqbZARAPPPkY0j8nQnrdcOFMmwPeiNN7rKGrO7LxBtoIgqqJ5CdL3UMPtahVajQC
	F5hlGDjxLXXKy9v6Yk/93lioL1sfEsHZrm1yfw0Y8cGcrU+d26RECl4fnhX3t5PX
	dQB7AWM1XrUwlZinECRGmRF/rFUNJ4uypINj15+V9bFhn1eeQ3ZjylWauvdgmhHM
	JXMywrvwavEuJsKmGkTSF6xKV97/6brSBYYgyE3xZH3R4uQGsONmIBkjodm0jiNa
	+MpG8zKVreHpb3OEoe2/4SsTpJOUMl9zInlYlfL7CTEZZuIQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9husp9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:12:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf6c528aso110027685a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792584764; x=1793189564; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4VUHRAW8yx/sOc44JfCen1/+gJw1tTZHwwW5QW+SJDQ=;
        b=b7vlvuOYZRFl3dDhvEoNwM+2oOSOIMtn7mYfJNTwHHrTrWuVaCMKLKGc9n9nhClm7v
         +yXq+zs7cFHQ8JLj9hQvojdSOW7AZQ76Oid7n8BQ7q0pQXV7L9kKCsKfzEvQcleUAkcv
         2sX+fyXOY3vTy8V8wqD5w2sZ7d8H/vF3CmLIBBOQuxftdbrc9bbTUeosAVUrBypkVnAa
         Q0EMJGWSNqPjUXqoCyxtbhK0Yo+HnxPc60j4+uXO6jhYdTDt/KfSIRIUN7zj/3eh0we1
         BIZfbmnYLTzPKslBTdrAv919b9PfZsuK910KeZteQ2cM+znneTHn+ZtAP1yhiNQ+d3ZT
         JnGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792584764; x=1793189564;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4VUHRAW8yx/sOc44JfCen1/+gJw1tTZHwwW5QW+SJDQ=;
        b=QM59QQHnn1x6xiFPcmwLTKFOY0GMrx/WDcpT7X9SPNbTm9W1UYW8cfGA62V754m7fG
         1vdC+YmoOjXxwRzQ4Ffw1v+4fnUPnZzH3W/306UYp7xlAZ6P5lnHmTjhtpWbGM30afmO
         eonqpCP6vURPfvAeEr6sUOheCFI4IhvTqOpVJ97s14RBHJt9TvdzqokEqlCsxJY7WF2q
         irQoFVstxsM3y5A9tzeP//VIVEOQPEW5XPRsgK41HGWb0wjkcPy80CdXmsvBqoQ3/Fdq
         XY3Rznjr1hy11LRTfFiFlv7sfqWiLppkvD9vV+aCd2hXVe7+IO8cZ7IMpSGeGeKpqbrg
         iVHA==
X-Forwarded-Encrypted: i=1; AKwUvBwY7l18wwYOoHno9MF26Zz4Zjvb+Gi4O1J1LBpsfF61qCbcPlFaP8pz8ovqwuRX1JhH2U/WiFTUghR0yjQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLX1HeNw1JeG58ZSRlpKX6vy2WACvH6XtKYaK6wq7al9QvXKQRY
	2c8dZY5vbcjo9IKb75ubfGuev6vCy7Qvcwi3T7PndxcvX+ehblcH396B6NkkGEOKfT0P9OUWhe5
	D910wTgSqKH6hNOUHkJXOvon6wt9AKx2vdsBCOQ/2r4rDU5hq8Iz2L4TbyOnMXGLILkD/G6A8V7
	4=
X-Gm-Gg: AYBFou3+YGmo7PPGuiVFirYGinpLeqbsPv0kNWJm/8rFwBs4wopK7okLfDUipQTX3kI
	JljpWbG4XWb2NVx7IKpapf8e8PvI6kSVnFwPpO4fOHhtm/gG7EnXkBjm3g2tFHjC8zmCaTGfYXB
	kwGvXFr7UJ7hV3mEzhHMafpjus+puyI8WR7EUIsr6+BLjcj/egdsiLUM5QYWyQ8VF3E8VpKJmZE
	FWyY5c2vUHlhK+yxv0aF+bLfKKI4U9NTDgJ55ztGwGIQNeVcEjVcmn6dnTzQI2YAg6yJWzRkd1r
	G900e+cjmmsw7XCvfKzpJ1dY7w1Mrl56f2BEJae6AOXr/99uochSJetbVjsW6kWNO9V/IrBRkk2
	pZGV9lByzYuxnVYRu8MDhAUnrn61+
X-Received: by 2002:a05:620a:2796:b0:93c:9c0b:3898 with SMTP id af79cd13be357-93f57f58197mr340694585a.59.1792584764356;
        Wed, 21 Oct 2026 05:12:44 -0700 (PDT)
X-Received: by 2002:a05:620a:2796:b0:93c:9c0b:3898 with SMTP id af79cd13be357-93f57f58197mr340692585a.59.1792584763897;
        Wed, 21 Oct 2026 05:12:43 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828caesm4848548f8f.29.2026.10.21.05.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:12:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:12:36 +0200
Subject: [PATCH] nvmem: use const APIs for legacy sysfs attributes
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
Message-Id: <20261021-nvmem-sysfs-const-v1-1-a35251dcdef6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADSs2GoC/x3MMQqAMAxA0atIZgO2phW8ijiIpprBKo2IIt7d4
 viG/x9QTsIKbfFA4lNUtphhygLGZYgzo0zZYCvrTWUNxnPlFfXWoDhuUQ+k4BpH1tdEBLnbEwe
 5/mfXv+8HZAtLfmMAAAA=
X-Change-ID: 20261021-nvmem-sysfs-const-4f5754263444
To: Srinivas Kandagatla <srini@kernel.org>,
        =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: brgl@kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2917;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=19dq4HY3Y/rbbAfsWvEJQNUKCnnOmrkKOSYEOTb/nWk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2Kw2+8fY0/fqstSzE+LDHys66Oq6nabUuOAQk
 jejKdXDw9GJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatisNgAKCRAFnS7L/zaE
 w4xvD/91HfcprtWySdDHfiP5FI+caCXF+MegPMpQeviaMi9DhTFbLjd5Em1KmcJN9PzUVLNl1DT
 eYRI8ZyGqtF8FsTaYUCT6bRilQFPRoRjBZzB5Zh0mhuwSrTbSLvbuzlCjIb0QWMsl3BAT4zQ5v9
 ywYt2oPMIB+Swb5FEZ8uqDEfQ5UX3MWBwSJ95Z1gAidAkrZTmQao2yVSMZzdDZVaUUedUalZ1o6
 voeQYaxS/2I2OiXEHf2CVeQBek0XXDflG/zbmJ2U2u8rTxB3eXIsD/UYay/jpDL0NRD7SdCMMjY
 AIS1ASflBEuNr3xr+vRD/MGG48e3NNDq6Dl/Kdt+nPQum4uTFzYwW1lZNMmKAG4dfeRjDr29Fsq
 bNxxIq06nBpDe2Yl8Pm1XW1arqRrxWpMmg9SFjeEbamfV4NBI7pC+utsWfsYKazeM9xip/JvTGu
 XmN/D2rVGdmX7eJsK7IdJlFNM9pLDc/7d2gzG/hlkwk69AvJtrgpM3X/GaytNePfa2aBeaH2MCl
 mTPxlJuk5Nx/sW7whUCelUpyLkj8ABEjriRIj9TmqRWy82FiaRAq+QteYTsOiq2G+ucPlfIr0lk
 9Dld07avkw+FYU3cB6ReLVKSWB91wjLPMOR+N9WI/dup0LYhW6SEAau0ZlWEUHtFu9VdkTlDorM
 Q5FlxTH/3xBy76A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad8ac3d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=7s19T6IPwhMXizvUvl4A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0OCBTYWx0ZWRfX8g4pdZ+6hBbu
 yRlbElU63YlTZl+bAQ1NqJsv7r27jttmZuZIUZliZJIv6kXHCGHcjvXBZBIIWNCdsokI4abVjSw
 bwlB9qnYCbYg9edPex8nW2OGc57MyoU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0OCBTYWx0ZWRfX0ifhvxIXufKD
 mZG5AFidx6ccx1KNimMZ+ai63FuXqG5Zflf52HrThHBLJyVfAeUbIjKf+5y2Yij4+Iw6CNSjuJa
 yUCqeFmB8l4C6GURPjjPcfIq1pHI8aEatLhZlc7zwSCt2HMyabtyx3rlRHBUI4F38fXedsZUyjW
 KbWoOSpvqNuvpQdruAFsIL9E+fDExPKo0gCCU2VYPwQNQkhOmu213fF31o7XrQkfayKBExa9CBj
 ULg4UhJ8tO0ae6NfFup7WB+LAoANmBh+07/0fQDO1X1ggb74RH0xlPWps/FHYope029N6hLAGfr
 E91jFAtnMVqicBYmS1V7xxBGIrgoqioGCaAKrhx1HXV7WCuFIBD4+46fyvrxgJS/4AY2vm0HCgR
 r2uZtZ5X9PWuSJj8a2citBY8g6a4wqthnOiXaHzSeOlzDfg5qUqDsJ6OHO9g/NehixTqWADhs6Y
 sOwcW/+Mvr6qGDEC0Mw==
X-Proofpoint-GUID: PbY30RL7xpivhFNYvv13j54vFtFIT6S9
X-Proofpoint-ORIG-GUID: PbY30RL7xpivhFNYvv13j54vFtFIT6S9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210048

Replace the deprecated non-const sysfs attribute APIs with modern const
variants.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/nvmem/core.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 7d4cce8e27424a032fff59a1189847adb1898168..f84f664deb84280871411c33f67ac846f7642161 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -193,24 +193,25 @@ static struct lock_class_key eeprom_lock_key;
 #endif
 
 static ssize_t type_show(struct device *dev,
-			 struct device_attribute *attr, char *buf)
+			 const struct device_attribute *attr, char *buf)
 {
 	struct nvmem_device *nvmem = to_nvmem_device(dev);
 
 	return sysfs_emit(buf, "%s\n", nvmem_type_str[nvmem->type]);
 }
 
-static DEVICE_ATTR_RO(type);
+static const DEVICE_ATTR_RO(type);
 
-static ssize_t force_ro_show(struct device *dev, struct device_attribute *attr,
-			     char *buf)
+static ssize_t force_ro_show(struct device *dev,
+			     const struct device_attribute *attr, char *buf)
 {
 	struct nvmem_device *nvmem = to_nvmem_device(dev);
 
 	return sysfs_emit(buf, "%d\n", nvmem->read_only);
 }
 
-static ssize_t force_ro_store(struct device *dev, struct device_attribute *attr,
+static ssize_t force_ro_store(struct device *dev,
+			      const struct device_attribute *attr,
 			      const char *buf, size_t count)
 {
 	struct nvmem_device *nvmem = to_nvmem_device(dev);
@@ -222,9 +223,9 @@ static ssize_t force_ro_store(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static DEVICE_ATTR_RW(force_ro);
+static const DEVICE_ATTR_RW(force_ro);
 
-static struct attribute *nvmem_attrs[] = {
+static const struct attribute *const nvmem_attrs[] = {
 	&dev_attr_force_ro.attr,
 	&dev_attr_type.attr,
 	NULL,
@@ -339,7 +340,7 @@ static size_t nvmem_bin_attr_size(struct kobject *kobj,
 }
 
 static umode_t nvmem_attr_is_visible(struct kobject *kobj,
-				     struct attribute *attr, int i)
+				     const struct attribute *attr, int i)
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct nvmem_device *nvmem = to_nvmem_device(dev);
@@ -412,10 +413,10 @@ static const struct bin_attribute *const nvmem_bin_attributes[] = {
 
 static const struct attribute_group nvmem_bin_group = {
 	.bin_attrs	= nvmem_bin_attributes,
-	.attrs		= nvmem_attrs,
+	.attrs_const	= nvmem_attrs,
 	.is_bin_visible = nvmem_bin_attr_is_visible,
 	.bin_size	= nvmem_bin_attr_size,
-	.is_visible	= nvmem_attr_is_visible,
+	.is_visible_const = nvmem_attr_is_visible,
 };
 
 static const struct attribute_group *nvmem_dev_groups[] = {

---
base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
change-id: 20261021-nvmem-sysfs-const-4f5754263444

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

