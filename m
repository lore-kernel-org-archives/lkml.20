Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579656;
	b=ebwjmOBSLx7f5goOjCLE2DqL9vfbR8JK/gln0J/UKzsviG9cJRHGNCJWEP60YYumJmLK
	 rE4oXTvA+HCTfyTsJX1l+9vlp6ME7Ri4sHMNLTLyLtxbqppE4re5nU5b3UFkV+cP7Nabs
	 IDaTAM8sPqP9j8zcIE4H/udIIycLZ4hljfiE4vbrZMQPV9FJAg1D9BvMbNYgde+xywGEX
	 y2DQNCwDYfSRd0iG/XwEwlcrAQdoitOoVliH2BDeEpaCJbaEtUgELjIoyATEuZeTeMl/g
	 yh/4ARJww2fg8aJniLsW5bnzbDOhAQeuEIa2B5wKMbc3fzZ+LndYXKaTRS5gIshl5HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579656;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PIDMKBXMcrh97ujqVDS5OhOp7piRRyGKl9yfJVLv+5s=;
	b=siydCIZYXN2uamhUORfdJCGlI9VpEW3aGiQVoXoUEK5ytx9FKihvFmtMpZy4jEpGJbLJ
	 JsFoZg5xGCjUAvoJFffujeChjHI0o1ZexhV4yUFRsmHUYyp/6/zyagVrVQoF4lJtoPqrY
	 Ib+jOo4FPpY5lSEMo8QqlL3+EYQ0vx0ZkYwD6jlcJ1lZfSJ9iA7D6TpK38SE5TbATtF0i
	 FRk9z2+/YqRykY92h5qRalXM+cWqsPmr3PoV2rw2/NeDCKDToT/u0YHzbUZVHUSCF57/y
	 y7IPLgEgZIajpEJgtzlNN2Fx9h1iHXJrdpyj2thXoUkT9k7w3hXUxEm4g4Sd4kFuqUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NKcce8Ya;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KXPL7Kw5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33E0606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E33E0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NKcce8Ya;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KXPL7Kw5
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA6HGw4170575
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PIDMKBXMcrh97ujqVDS5Oh
	Op7piRRyGKl9yfJVLv+5s=; b=NKcce8YatJYHx6Uco20BLLkStYJudPvyINqNHV
	WRizjOHvVbUcyOwZv/G2rfllgJdwIqeXGYP5mNhKeS0NLHz6t7x6Rxm4hz9ip1Lp
	gwUMQqSpXidUnkwBk4csyQcrn4qt9uCK/fH3O2SYvZJn2wgNY4P+QCuXYADoFmva
	ehhMBYyPa7dK6F4K9TOKrAEqA9wnmIKbQ69HNhKOPBngqyGOTZd0EzqEhYhyrpMl
	2x2MNdXfhdth4sQmkocqqYxZyQsoQvYOsagZMkocRDRZ0Z/VO4AYDPTIQNFA/cgo
	3357J9ajQ7nEabePexY5k2u2Zf+K4tXA4ekol0rh/78RygkA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9huh09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:47:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844e383so99007285a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792579654; x=1793184454; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PIDMKBXMcrh97ujqVDS5OhOp7piRRyGKl9yfJVLv+5s=;
        b=KXPL7Kw5j/iBEZwMhZDOMZe+wfvKHUTljDthry6ulCpQrU1lqS8DIC/McJ5n8E0RmF
         EwIXTJoK/NB/NWNGXjej8nhqawiBURykwIfl/Ujuk7B9hmrxEHPI3I0o6udmQOezFyFm
         rcYJNoEPALJxbrpU1BvdRdPITAc0cE22HHL0WZntkfGngMX1gxMePpsugtXEhPoyEnRR
         uC9T+MTU/32WzGixN+X4FqihFEPN8i80p98B0t1wD4b4wBCOphDNODFPS7M+ScaSDiEa
         ogfntFU4UeTSTehbU4GySO1VPMdvYBqZdk6tv4tLMK+Qbvi/P1flnycIc6ro7AX38g/b
         pvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579654; x=1793184454;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PIDMKBXMcrh97ujqVDS5OhOp7piRRyGKl9yfJVLv+5s=;
        b=V1onLCKCPGnbtRV3g48mkE0IuHrx3hK1di7WjLUzuB0FJ65Qq+vU7U0n/dk4PPzN/y
         AqVnN5n8DjaLeozt1sBNoBciclyGMlPwyUvlnAAN8Tqc8B4L9sPbqq8urri2rSGwZHKo
         xDRXzbLjLNP/5dmvIaFHLApKmIU3zz36/SFAdCcjQe0FyIzWgNxMO4ACdu1BrTEGL3fy
         1leUjreU+0+9tdrPb2R3FWEAPIqhXgyWjKTRu14TbcDvNNX+gB0lAuTuUaDuacm0pQXk
         dHz1itfstQ60Uk4+tz8/OEXoCpSu+PRUwWHnK+mJbD+nyNS7Lp3WyxFi3ebu6x/707wg
         WzUA==
X-Forwarded-Encrypted: i=1; AKwUvBycFETB2EyZTjBPG8sqf3B66pzAZHbAg5h6GGScgqILpnCvy/QX0WEdbE0m+kdcjJKD6cwvlwp4fpYuIeQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyG0I7cam8OG1YqgIXHbbnYt0HwlIyY6EjVnx9PwevfnBv4Sww
	ona1jfHCE/oCBjdcjfSrGM8dPh4Jj41CaoJwFn6Ei9drnOUW4EZPDX1gZ43uWD4mhTXiozhlVxO
	S0qnUAvmbOtv+mOY9v4zU/eNdvhK8aVlL3gSz/ivfmt8xu6CXeY5e0GbIBOBOPas+hIqnyDhaJb
	8=
X-Gm-Gg: AYBFou0SG32Lhc4LTFTJGfuFB4ImHYdwXloEUUpxPq8T78eiwj3Ra/3O5aoShHVrZaT
	yj9ZZGSXkdTuxo793MSgrajl4ayraLcrdW+mt5jtvlgI+b1fliv2DcOYECwxyFt3xhDm9b/Zzbi
	0iSWapX3diF4L9RKAmDXaLXOT2DelrJ5Lu0/lSLl+GbCBS61yoPq75typl+DiJ5QD1B+MkjbWYr
	xeD0VG2JpPRxi/MkUEQCWUtjpGjGDk0q7zgEZp0InHSYpH/ux/AIrfFlheKszD49hT++ths94Lw
	StJgHetkGvYirND7QiaedYlYrCNx6rcjYBs0xvT1kgjnOUFKheukItlX69v2cEfP3iws1vrcMmn
	2lzlzfRkDEV2Uw93OwlUr1c2i8x3V
X-Received: by 2002:a05:620a:6082:b0:93f:d27:c89e with SMTP id af79cd13be357-93f57f72761mr329086785a.75.1792579654021;
        Wed, 21 Oct 2026 03:47:34 -0700 (PDT)
X-Received: by 2002:a05:620a:6082:b0:93f:d27:c89e with SMTP id af79cd13be357-93f57f72761mr329083085a.75.1792579653258;
        Wed, 21 Oct 2026 03:47:33 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583f25asm4530670f8f.45.2026.10.21.03.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:47:32 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:47:25 +0200
Subject: [PATCH] gpio: sysfs: use const APIs for legacy sysfs attributes
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
Message-Id: <20261021-gpio-sysfs-const-v1-1-3d89ac247086@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADyY2GoC/x3MMQqAMAxA0atIZgNph4JeRRyKpjVLK42IUnp3i
 +Mb/q+gXIQV5qFC4VtUcuow4wDb4VNklL0bLFlnyBqMp2TUV4PilpNeaCYmRz5MRB56dhYO8vz
 LZW3tA96YZ/NiAAAA
X-Change-ID: 20261021-gpio-sysfs-const-19e060af900a
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4274;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9dDH5v2k0De+yWj2b89X57Qpyn9QTdgy/GLl+uDHr1Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2JhAf9806VHM311pj+PG9hBYS+ih0eI89PIXx
 psX5VHVeW2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatiYQAAKCRAFnS7L/zaE
 w9VdEACPAw0ZFrt4mEHZXICmVA0ivMlkhtttFQpA8DkyF4Yhswnkbqy0u06rUSPFO9tYhTUBP9K
 qljcPA0LxNSVeWVkAMLmbexsl0gMUXUFD77c75GzFLYwSheVUAUFo6GViByBtMqRR88KY6bqmjM
 6Bsp0Z3tgDuYPbjHZtV5xk2WJOcH2zajwz+wZw2JZ3ZzmVr6eq8J67jwnPimA/6zOjlK0Y3VqUr
 /2CaXe2Hycpvex8tfPHjifRQDwvYw3TtvbOOTMvHtML2qLiigT4TxR7ZPPkXsrnTEZeivbFtZxA
 Sq4b9i2gkITyVqpn3+FUhO1c9rhNNmbJWNOmZ4vKTVsRUjjQCCx4PiemfX6RabkARJEukyPXtmB
 PHif8bRxwKu3YrKLsW9sOqdrX4weCm7j21sW16qGTF/cXTBAvFKNY1AxmOf5wBdthIAcvzC6ybS
 2yO4LgwkyWujS/EWsraKLZKFSBHyaPAJvlB0XhzFXnc2+LXxg5dnW4ipwjWwx1U4z+FM7LEsmIa
 rRrVcwStbFg/4H2WGjrQbfalLbLWWRxpuRVdi5+aoDoa272Bxufaj2hLPP0o5qleDx4hISWGpVn
 yyqlxw3BIRkYAUpyLTFMqrNwbcAsAu6yZvdHUON4AmJbeXgfiFNSQRfQCtv54uUszzAyFv6TU4+
 9riDZwvuQKptNIw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad89846 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ylqvVeHYuwYs7xP2k5oA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfXw1DEd1vVOKgy
 6/uoQFC1X10po/dQOUoUF0j2ctxRA6NWIX/iHAam5hcIWm6NmqyrFfJzB5ObL2K9JZAToaBjIiF
 ORhHKl3hMRm+zYciqXRGN/qi9tlabkI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX51ucUd5axS5g
 XSaz2tkOuR3uUj9C2yB1YOLf6GLt6Klh15sWVasNiiDSrbTFetyG+hPISrn5QIKK9tUMYDIkOW3
 Qf2LSR8tx8k3oBSdmcYwGuQMY1mbCii7KobrczJwtI/etJSrGDwsdRXDQKnS5eYrUN8DG8UKF22
 2h/wlNHWCm+ojFJndyhpY1EHBN9WjD4riKhKF1SPf/vz8D1AtheU36l2XSlkZ2AD0W7x72tUr9k
 8Dd9sDDoAn8BFxgly0+Tz2SucSuoxR8bK2OA9aFUVeHdq7lrFH80aRUcqypkSh3dkLqgTVXvg0l
 yU7uvwg0vFlXA1Il/vEd0bit+OjHMD4zgv6ar3DM//fe5zGlRY2dIQua26E5gvWYzvfrkVjnmCK
 7ELAMOVIXLT2th+N802l5Dikyie7mVV07hKDn2N2IFU4p90sI7Zr2ChBvAmrIbxQsBttjc+9fcT
 jUGh52EU2juBzslEeAQ==
X-Proofpoint-GUID: 2U0Lwva2ZdOkPd64I1q4oU9ZNUxd4XxX
X-Proofpoint-ORIG-GUID: 2U0Lwva2ZdOkPd64I1q4oU9ZNUxd4XxX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210042

Replace the deprecated non-const sysfs attribute APIs with modern const
variants where applicable. This leaves out the attributes embedded in
struct gpiod_data as this structure contains fields that are modified at
run-time.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-sysfs.c | 37 ++++++++++++++++++-------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index fc06b0c2881b9427c7c2e069047b0896156eda65..08f5149925694320a2fc6615ff7593ce439fd1a4 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -442,33 +442,33 @@ static umode_t gpio_is_visible(struct kobject *kobj, struct attribute *attr,
  */
 
 #if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
-static ssize_t base_show(struct device *dev, struct device_attribute *attr,
-			 char *buf)
+static ssize_t base_show(struct device *dev,
+			 const struct device_attribute *attr, char *buf)
 {
 	const struct gpiodev_data *data = dev_get_drvdata(dev);
 
 	return sysfs_emit(buf, "%u\n", data->gdev->base);
 }
-static DEVICE_ATTR_RO(base);
+static const DEVICE_ATTR_RO(base);
 #endif /* CONFIG_GPIO_SYSFS_LEGACY */
 
-static ssize_t label_show(struct device *dev, struct device_attribute *attr,
-			  char *buf)
+static ssize_t label_show(struct device *dev,
+			  const struct device_attribute *attr, char *buf)
 {
 	const struct gpiodev_data *data = dev_get_drvdata(dev);
 
 	return sysfs_emit(buf, "%s\n", data->gdev->label);
 }
-static DEVICE_ATTR_RO(label);
+static const DEVICE_ATTR_RO(label);
 
-static ssize_t ngpio_show(struct device *dev, struct device_attribute *attr,
-			  char *buf)
+static ssize_t ngpio_show(struct device *dev,
+			  const struct device_attribute *attr, char *buf)
 {
 	const struct gpiodev_data *data = dev_get_drvdata(dev);
 
 	return sysfs_emit(buf, "%u\n", data->gdev->ngpio);
 }
-static DEVICE_ATTR_RO(ngpio);
+static const DEVICE_ATTR_RO(ngpio);
 
 static int export_gpio_desc(struct gpio_desc *desc)
 {
@@ -529,7 +529,7 @@ static int unexport_gpio_desc(struct gpio_desc *desc)
 }
 
 static ssize_t do_chip_export_store(struct device *dev,
-				    struct device_attribute *attr,
+				    const struct device_attribute *attr,
 				    const char *buf, ssize_t size,
 				    int (*handler)(struct gpio_desc *desc))
 {
@@ -555,28 +555,27 @@ static ssize_t do_chip_export_store(struct device *dev,
 }
 
 static ssize_t chip_export_store(struct device *dev,
-				 struct device_attribute *attr,
+				 const struct device_attribute *attr,
 				 const char *buf, size_t size)
 {
 	return do_chip_export_store(dev, attr, buf, size, export_gpio_desc);
 }
 
-static struct device_attribute dev_attr_export = __ATTR(export, 0200, NULL,
-							chip_export_store);
+static const struct device_attribute dev_attr_export =
+	__DEVICE_ATTR(export, 0200, NULL, chip_export_store);
 
 static ssize_t chip_unexport_store(struct device *dev,
-				   struct device_attribute *attr,
+				   const struct device_attribute *attr,
 				   const char *buf, size_t size)
 {
 	return do_chip_export_store(dev, attr, buf, size, unexport_gpio_desc);
 }
 
-static struct device_attribute dev_attr_unexport = __ATTR(unexport, 0200,
-							  NULL,
-							  chip_unexport_store);
+static const struct device_attribute dev_attr_unexport =
+	__DEVICE_ATTR(unexport, 0200, NULL, chip_unexport_store);
 
 #if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
-static struct attribute *gpiochip_attrs[] = {
+static const struct attribute *const gpiochip_attrs[] = {
 	&dev_attr_base.attr,
 	&dev_attr_label.attr,
 	&dev_attr_ngpio.attr,
@@ -585,7 +584,7 @@ static struct attribute *gpiochip_attrs[] = {
 ATTRIBUTE_GROUPS(gpiochip);
 #endif /* CONFIG_GPIO_SYSFS_LEGACY */
 
-static struct attribute *gpiochip_ext_attrs[] = {
+static const struct attribute *const gpiochip_ext_attrs[] = {
 	&dev_attr_label.attr,
 	&dev_attr_ngpio.attr,
 	&dev_attr_export.attr,

---
base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
change-id: 20261021-gpio-sysfs-const-19e060af900a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

