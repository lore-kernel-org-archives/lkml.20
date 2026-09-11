Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E462377A90
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140221; cv=none; b=onx2shmasUB7+p5u5XzMPpjUk7WBBjU8ZuDGfUVJit0roI0jJUhiPurAS6rjaXi8dzuWclsFdbaWKII6SiS7blYs/IT/uCbdpq6Mg+Xm4+O9ENHFYbWO2QJ/lA1Odf6JUMyLiaTU8i597ahmKVTklbDYHVwPBtPN4xSPZ7Kok98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140221; c=relaxed/simple;
	bh=vSYj1Ys/owwCN8sFbLJ/5CPpCU7lY6/j6/iPP19TXz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AYTBaztlrMp4HY+HmK/jX1WlgQ/gK3DjlNPEYOYe6CYWCG60bqi6wJcca6tP4qJenI0+SBYXI8OGQdF1GV9/YdkjARKhfdfR7T5StENzaMymufnHmFOQRdX90MPILLQxa63nR4IlG8bw36T1SwUNmtwnYcMfalbQQoU9NWB6Czk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZiM8bxI4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZCYsYS2B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZiM8bxI4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZCYsYS2B"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmADR222588
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pEM9jPOOZuj
	CwjK6sG3Tm845ZU4s2wO25Iym0LKZjIU=; b=ZiM8bxI4nMUEqrC442er4jrqbUH
	15aqptBgNvibc3upEYfytmBbcsCHkD/ncccW1GvkaVBXzt/+oOtAruWnGH0SUQMN
	CmiFAHZVBtupYwcz7YbvUxg9XsAy3tcHzC6WOdDUIHEx29TsROsHHEa2f85v5BaO
	79UwxKDJfUD2jRWWHxkTGZ2IwBjtntKf/Bi7+VCX157Psvk/Tw/e8TRaHcgQyGx0
	AUC/W/aanHgMU0RsP7kRGDb46yI+hEk3CBNG6fCwgPU1jKtaGjMuvb8JP3DzSZwi
	GZOd5bvBSB82qQQV7uzR3xQk3e5t0uq0THESI8zhwjf/aZ6AsBCY5+fZrhg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbdradyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:23:37 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-785b66a7017so237351137.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789140217; x=1789745017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pEM9jPOOZujCwjK6sG3Tm845ZU4s2wO25Iym0LKZjIU=;
        b=ZCYsYS2Bd0Nen15tPFzu2IrbKRASBmkiPeTJLIBbQjb3JTszRchKphJx3R8e+Fllee
         XO6PUxwqTJ05lLcLhKNUBWsguf43Mt1i1+fo9ld5egY49mcvI1Kr9jydoYcdzgGgwr6G
         Qg4Hj2dRdz7R+IAfLrxuKjrPMVkNINtxt3UuW6DVieaBsKHxvFJx3N+GD8Tdb/++EFTH
         YwP0dxDxGwmndGYD0FcHHW7ddQfPMey3SlsNUkY/27+GjmM5g2CsRNpwVz3D7nWUrNxS
         4ibhZGWGh8hDk1BVvDl9YNM6QaoQlPGUQUoCC1J/kC4NANcZEIV+rqbx9qhEOSZQP503
         6l0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140217; x=1789745017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pEM9jPOOZujCwjK6sG3Tm845ZU4s2wO25Iym0LKZjIU=;
        b=M6pYhDxroZGynxhAWDWL0qjsbRYoMDwivtlpTWXgRT7g+jxi6yYGV37xzAcDL6NuPg
         heCmJnUCqnOWXXhMzqmi8dKOJPez27N3SzhnbNWVFbbik2bsWW4pqi7co8PUrqt0Z3iA
         EvRF/azzcfaKrKvsyDrhM76LwXJ1HLO3ToDLDGusgkRTwkKHttxwSok/QmgVSgQj2VWP
         L1PcXAbxh4a1SdE0PQ1R1eYLJL/s/YAjivEPWjaGcayiPoQ3xg+1w++vgwSDjjPlya/f
         k/yQx5QbN5Q4cl5FOaTEb1hwk4tqI53AufhF3oYfWkRVCCd74/KBiSZStmQq/2kgUY7J
         yipA==
X-Forwarded-Encrypted: i=1; AKwUvBwyrNgCdrTthWePLy6Q41tervY+AvxIZyjKYen3tdVpeGqR27qGcrsFwuoUtyREqRz8DLj6AXVvARYSbhg=@vger.kernel.org
X-Gm-Message-State: AFuF++ma28oF3gHNhM3Rlx3PPzvkhvVwYDbpLHcmPzdZF+RYdFEoPj3g
	PPu0tfZRiCX9thLMRBvLovnDn/PLWSgylEyIJ5olRwi3OTD2374wnHsut9vsENyJB+JChtEUIhI
	ZW4zwPG1LLqq4+FkmnKlTlaNlEn6MxHJNCOT22aXh5Kfa3ypNGMOjCgEF3/+xqT6dPVs=
X-Gm-Gg: AYBFou0f7j6GHHiL2Pt6dD9CNujMZlgK8B0d/nmwofk1m40gPeAHyp+KFm/n1gbUoDV
	2lNg3mLGCtUgVp7h8q7mWX5mDHyWvFzeRgZbYBu40+wGE7JBgS1xy+sGFcBG8GzUmlCFi2NFM1t
	MzgKtzBUR8di79fzyN+uVvttXItLXlMgV9jihccQwexm8vetz4rBiS/rwdO0OxhhY1Ulu6x6wse
	mlJArcNRxsu3kfZ1e/zXCs61/r6UzBEEehvDDil04b7jw+XEHCwXhYyR+kiyernjrm0RHGkuQLs
	lpFYceZLAw72i2ZZVDYtnZwxSDocGR8+7XASSA71Du+jIvJprUhOfYR3/80e6sQy8uGXT87gcg6
	/LY5EeGgTR6PkIcnTeDqfWv9W0Ti78UVVqaT2fV+LhgkvNJREhP4xLXvYEmJ3CLwRiaBexWNKaO
	pJKAj46EKZC9cG8ryQxXh8NqIA/9QXw5elwArU
X-Received: by 2002:a05:6102:3970:b0:782:de7b:eead with SMTP id ada2fe7eead31-792a53b19a3mr5186274137.1.1789140216461;
        Fri, 11 Sep 2026 08:23:36 -0700 (PDT)
X-Received: by 2002:a05:6102:3970:b0:782:de7b:eead with SMTP id ada2fe7eead31-792a53b19a3mr5186201137.1.1789140216013;
        Fri, 11 Sep 2026 08:23:36 -0700 (PDT)
Received: from t14s.space.revspace.nl (2001-1c00-2a07-3a01-8e96-3679-0b9c-de47.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:8e96:3679:b9c:de47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296614323csm94042566b.59.2026.09.11.08.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:23:33 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/4] module: add SCMI device table alias support
Date: Fri, 11 Sep 2026 17:23:26 +0200
Message-ID: <20260911152329.5822-2-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
References: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CBKMV7pSnpj1Bot32KyZ03SRj-zb3_ej
X-Authority-Analysis: v=2.4 cv=PLmaavqC c=1 sm=1 tr=0 ts=6aa41cf9 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=NbjprmzQH6tOvfj-_-IA:9 a=gYDTvv6II1OnSo0itH1n:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: CBKMV7pSnpj1Bot32KyZ03SRj-zb3_ej
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfX52kvN3/9dcqM
 RS4PmMX0r9R6+I1VyFWzvb40RFAkbMF0YsEOAcZkjXubz0hZjazawrKuZaYG/c12zBJUrf1ko4e
 u1ZzO8D00Sy75dLCXbGgWZohL9tdcg0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfX96+d36VDoE4m
 6Er8i3JDC188RHC0yhAx6LYlT2BKYnuI0dhoQTBZoc3Orr/92eEKvcmaKne8YUcjjBvfFSR+AcJ
 KCdH4WNPuM1OzunMYv4nnHLQ8mZd83OWLmaJLxaF2Uqh0XpwPgI5CvCSn98cKhjT8yy3Zcjk8IC
 Jv1QysjfmnDoflpUd1T1kPt3W1nyl0qYuPqa4E9p/GjxukNRMn9L3WYiimTDxO7mzClI17qtcCC
 W6YiVk839awRSY6aeYJg11Ps9mM3L7q5pnk2CjTsgZdp/BUXRwWqEqunzWaU38oHXS0PsgEUK0x
 YX0fNXy1fCyG84BENJs1R7Toy9pmwmc35yAeKmhFqWegwPkoqsdMJnp3Wlvi4ZIKCXRvgec7oBo
 BH13g3QktT1IRDKCy6wMJg6Trhp8HmlzR9LTrUJa2pxChF6EaFd2n5mILR6s/uYASB3W8jj6AKl
 VjN+bqFxitFQy1sszfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110214

From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

SCMI client drivers already describe their bus match data with
MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
SCMI device tables. As a result, SCMI modules do not get generated module
aliases from their id tables.

Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
visible to modpost, add the corresponding generated offsets and teach
file2alias to emit scmi:<protocol>:<name> aliases.

Use the same stable alias format for SCMI device uevents and sysfs
modaliases. The previous string included the instance-specific device
name, which is not useful for matching modules.

Assisted-by: Codex:GPT-5.5
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v4:
- Drop unused driver_data member from struct scmi_device_id (Uwe)
- Drop device-id/scmi.h include from mod_devicetable.h (Uwe)
- Add device-id/scmi.h to devicetable-offsets.c and file2alias.c (Uwe)

Changes in v3:
- Adjust for ad428f5811bd ("mod_devicetable.h: Split into per subsystem
  headers")
- Add '\n' to modalias_show() output, matching other subsystems' modalias

Changes in v2:
- Drop #include <linux/mod_devicetable.h> from scmi_protocol.h
- Link to v1: https://patch.msgid.link/20260616-scmi-modalias-v1-0-662b8dd52ab2@oss.qualcomm.com
---
 MAINTAINERS                       |  1 +
 drivers/firmware/arm_scmi/bus.c   | 21 ++++++++++-----------
 include/linux/device-id/scmi.h    | 17 +++++++++++++++++
 include/linux/scmi_protocol.h     |  6 +-----
 scripts/mod/devicetable-offsets.c |  5 +++++
 scripts/mod/file2alias.c          | 12 ++++++++++++
 6 files changed, 46 insertions(+), 16 deletions(-)
 create mode 100644 include/linux/device-id/scmi.h

diff --git a/MAINTAINERS b/MAINTAINERS
index fc6ca082106f..ee5beee606fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26334,6 +26334,7 @@ F:	drivers/pmdomain/arm/
 F:	drivers/powercap/arm_scmi_powercap.c
 F:	drivers/regulator/scmi-regulator.c
 F:	drivers/reset/reset-scmi.c
+F:	include/linux/device-id/scmi.h
 F:	include/linux/sc[mp]i_protocol.h
 F:	include/trace/events/scmi.h
 F:	include/uapi/linux/virtio_scmi.h
diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 793be9eabaed..d12d5de15a1a 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -13,11 +13,12 @@
 #include <linux/of.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/device.h>
 
 #include "common.h"
 
-#define SCMI_UEVENT_MODALIAS_FMT	"%s:%02x:%s"
+#define SCMI_UEVENT_MODALIAS_FMT	SCMI_MODULE_PREFIX "%02x:%s"
 
 BLOCKING_NOTIFIER_HEAD(scmi_requested_devices_nh);
 EXPORT_SYMBOL_GPL(scmi_requested_devices_nh);
@@ -141,7 +142,7 @@ static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
 	int ret = 0;
 	const struct scmi_device_id *entry;
 
-	for (entry = id_table; entry->name && ret == 0; entry++)
+	for (entry = id_table; entry->name[0] && ret == 0; entry++)
 		ret = scmi_protocol_device_request(entry);
 
 	return ret;
@@ -197,18 +198,18 @@ scmi_protocol_table_unregister(const struct scmi_device_id *id_table)
 {
 	const struct scmi_device_id *entry;
 
-	for (entry = id_table; entry->name; entry++)
+	for (entry = id_table; entry->name[0]; entry++)
 		scmi_protocol_device_unrequest(entry);
 }
 
 static int scmi_dev_match_by_id_table(struct scmi_device *scmi_dev,
 				      const struct scmi_device_id *id_table)
 {
-	if (!id_table || !id_table->name)
+	if (!id_table || !id_table->name[0])
 		return 0;
 
 	/* Always skip transport devices from matching */
-	for (; id_table->protocol_id && id_table->name; id_table++)
+	for (; id_table->protocol_id && id_table->name[0]; id_table++)
 		if (id_table->protocol_id == scmi_dev->protocol_id &&
 		    strncmp(scmi_dev->name, "__scmi_transport_device", 23) &&
 		    !strcmp(id_table->name, scmi_dev->name))
@@ -245,7 +246,7 @@ static struct scmi_device *scmi_child_dev_find(struct device *parent,
 	struct device *dev;
 
 	id_table[0].protocol_id = prot_id;
-	id_table[0].name = name;
+	strscpy(id_table[0].name, name, sizeof(id_table[0].name));
 
 	dev = device_find_child(parent, &id_table, scmi_match_by_id_table);
 	if (!dev)
@@ -282,8 +283,7 @@ static int scmi_device_uevent(const struct device *dev, struct kobj_uevent_env *
 	const struct scmi_device *scmi_dev = to_scmi_dev(dev);
 
 	return add_uevent_var(env, "MODALIAS=" SCMI_UEVENT_MODALIAS_FMT,
-			      dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
-			      scmi_dev->name);
+			      scmi_dev->protocol_id, scmi_dev->name);
 }
 
 static ssize_t modalias_show(struct device *dev,
@@ -291,9 +291,8 @@ static ssize_t modalias_show(struct device *dev,
 {
 	struct scmi_device *scmi_dev = to_scmi_dev(dev);
 
-	return sysfs_emit(buf, SCMI_UEVENT_MODALIAS_FMT,
-			  dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
-			  scmi_dev->name);
+	return sysfs_emit(buf, SCMI_UEVENT_MODALIAS_FMT "\n",
+			  scmi_dev->protocol_id, scmi_dev->name);
 }
 static DEVICE_ATTR_RO(modalias);
 
diff --git a/include/linux/device-id/scmi.h b/include/linux/device-id/scmi.h
new file mode 100644
index 000000000000..1b4ccfa9dcc5
--- /dev/null
+++ b/include/linux/device-id/scmi.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef LINUX_DEVICE_ID_SCMI_H
+#define LINUX_DEVICE_ID_SCMI_H
+
+#ifdef __KERNEL__
+#include <linux/types.h>
+#endif
+
+#define SCMI_NAME_SIZE		32
+#define SCMI_MODULE_PREFIX	"scmi:"
+
+struct scmi_device_id {
+	__u8 protocol_id;
+	char name[SCMI_NAME_SIZE];
+};
+
+#endif /* ifndef LINUX_DEVICE_ID_SCMI_H */
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 5ab73b1ab9aa..ba53302d95f5 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -9,6 +9,7 @@
 #define _LINUX_SCMI_PROTOCOL_H
 
 #include <linux/bitfield.h>
+#include <linux/device-id/scmi.h>
 #include <linux/device.h>
 #include <linux/notifier.h>
 #include <linux/types.h>
@@ -951,11 +952,6 @@ struct scmi_device {
 
 #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
 
-struct scmi_device_id {
-	u8 protocol_id;
-	const char *name;
-};
-
 struct scmi_driver {
 	const char *name;
 	int (*probe)(struct scmi_device *sdev);
diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
index b4178c42d08f..91ec3704ee2b 100644
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #define COMPILE_OFFSETS
+#include <linux/device-id/scmi.h>
 #include <linux/kbuild.h>
 #include <linux/mod_devicetable.h>
 
@@ -144,6 +145,10 @@ int main(void)
 	DEVID(rpmsg_device_id);
 	DEVID_FIELD(rpmsg_device_id, name);
 
+	DEVID(scmi_device_id);
+	DEVID_FIELD(scmi_device_id, protocol_id);
+	DEVID_FIELD(scmi_device_id, name);
+
 	DEVID(i2c_device_id);
 	DEVID_FIELD(i2c_device_id, name);
 
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 8d36c74dec2d..5379b1def07b 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -121,6 +121,7 @@ typedef struct {
 /* Big exception to the "don't include kernel headers into userspace, which
  * even potentially has different endianness and word sizes, since
  * we handle those differences explicitly below */
+#include "../../include/linux/device-id/scmi.h"
 #include "../../include/linux/mod_devicetable.h"
 
 struct devtable {
@@ -852,6 +853,16 @@ static void do_rpmsg_entry(struct module *mod, void *symval)
 	module_alias_printf(mod, false, RPMSG_DEVICE_MODALIAS_FMT, *name);
 }
 
+/* Looks like: scmi:NN:S */
+static void do_scmi_entry(struct module *mod, void *symval)
+{
+	DEF_FIELD(symval, scmi_device_id, protocol_id);
+	DEF_FIELD_ADDR(symval, scmi_device_id, name);
+
+	module_alias_printf(mod, false, SCMI_MODULE_PREFIX "%02x:%s",
+			    protocol_id, *name);
+}
+
 /* Looks like: i2c:S */
 static void do_i2c_entry(struct module *mod, void *symval)
 {
@@ -1491,6 +1502,7 @@ static const struct devtable devtable[] = {
 	{"virtio", SIZE_virtio_device_id, do_virtio_entry},
 	{"vmbus", SIZE_hv_vmbus_device_id, do_vmbus_entry},
 	{"rpmsg", SIZE_rpmsg_device_id, do_rpmsg_entry},
+	{"scmi", SIZE_scmi_device_id, do_scmi_entry},
 	{"i2c", SIZE_i2c_device_id, do_i2c_entry},
 	{"i3c", SIZE_i3c_device_id, do_i3c_entry},
 	{"slim", SIZE_slim_device_id, do_slim_entry},
-- 
2.55.0

