Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538270;
	b=awnbsTE6xSxPnmc4yKRzFpUQQ339Cvov+bJIKF9AMQS0k5r7q/cOI7Hz/kdxUsljWkgH
	 /tZV9m+gzr+eEGruvEYHv4McTp6ziAswowQfRFBpPI+rUxU5aFiTQ0tdB6c8oS5jwuHlg
	 fU3f5Bn2d6q0VvJKZIcEmOnV3rnFf0f7hYRtRM/e45crpSoQ69QoPxnqJCuqd3/kveusm
	 WtuaN+2JZJywSKWHBQX1/FXYDsMS9mLhYGzdQB1dKrpOjOny8gJ+DYGNDuR2OUD33DaA8
	 FDu33RK2di1JVDwj/MlG/XII72Xde/E5MCd2MqM1rVUDCYm0TUdzqqe+LovknEASjng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538270;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M8iIF5AnyrVA2ltJIjc+aoXA+D6kw/55nRgU/ArOM9g=;
	b=ysYf5TJfIIkHj01qoM/jARK8q+PLx2jJ5h+v1KzJQsbYn2tRAQOhJceXIzzZ/RKxKMDw
	 eLwgUbj2f7H16E5MHlnWNj3hvU9zsFXEM3uuBADzIL+/Zj9ySqQafhYJT+HzC2rE0Qzvl
	 2O3sgkOmruwto4i2YjgdK3istJsR9sYGqGCtzKfMeA0+f+zUJlICMsHiw/qN/V5w0V9qQ
	 So8cm5EK+joF6Q1hlr4KAQJ2FYKigL2G79azxlv/7scBeehkVpNcjQqviL0F/KTdfrbgK
	 kiQ5dxWsiilQlq4jJPOoxzxSboq7s5HTlWztDlZJvEoATnPA6rjEmIZtSM5VIsyGmlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gcOnRpJ2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fEzrWMf+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8B6606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC8B6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gcOnRpJ2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fEzrWMf+
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2K4Lb2688701
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=M8iIF5AnyrV
	A2ltJIjc+aoXA+D6kw/55nRgU/ArOM9g=; b=gcOnRpJ2SsjkQj4+9M/GkCm0j47
	QSRbo5QJRZ6ixU00B9Y2FI2+5dTGvz0YIrhMvp5jbdYExtUF+ZFQp8fnHGHpkAA2
	X2Qaxg8Pjc8olRJYL2tRJY7ElA0jSb5eoZ34AalXVhKHZ68c0ve7B9gE4QzkWS66
	ihyALCchYBgqs2SLe5vpn7vEeNYLBa2qP/pJsQaw2IjqBsqY/W7Blx9svvowU6ln
	/1VbVer4sjesW6Ly7pP0cBZOqPDcDuRsEK9FIfZOUe7psJTdgk4xI1Smpykm79tw
	lq3gbLAbnFTgqevYZxENXDLlu3GY44VcE4yNVHfHfDg4104HkglI2jAizaw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgw95cy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:51:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e95f8543c9so6302095ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794538268; x=1795143068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M8iIF5AnyrVA2ltJIjc+aoXA+D6kw/55nRgU/ArOM9g=;
        b=fEzrWMf+N8fP1hvcpfxb1ojgXSQqaixZt0T9i0fx7GtRhKboGZ7GAIoMbrgFXYKKpD
         39aFg2TK+gAJr96tS3lhxahDrCX+7YszsG2+f7T4Dvgg24KcaDAXI+UjLxvfdCvTR31a
         5YwMuDV5CKqf8rbna7IvwDnOH77AAgfvq+gvzdETrrMq4gpad6GnRvRexN2lZx6LaymY
         E0FrFCQuuQiO4jGazXEge7Zy7SV5+PjTz8IkKf5DFHSvIVQ44MrdWm+UFA0fNEWRYWn6
         B/6a1Gl2Y4pd7XncXFL2YHb+syWlesNvyH9yHTLw2aqLTX7tdx06+OeJ40DD7t3CgQNx
         8YLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538268; x=1795143068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M8iIF5AnyrVA2ltJIjc+aoXA+D6kw/55nRgU/ArOM9g=;
        b=FbiqaPAx+HqivlSkt/pTGYxqt5VbYZy8+Vt0U6tnEijwbbCacn+fVjugNT4Gne8mla
         EOqPwG+IIPX6JndEDjvZ9KrcTKuXCKDUvLewOKPr3FrXpGzfQRA0oI28ER7rfSCQY0Ef
         vkutfFrebs5W6RrioFvnaMVjkr0OXQfe5WwfquXuaHTXh23OOmQJ6KwKtTboHkNi94Yw
         1iLzri7uN5z2FoxBwUGBNyYmePXBpTKX/kXOBOWGRSBs9ARwiLS/IwFzq5XjAP/Z69zn
         x1NkS8BHt1rl1/UBYwSjLM1WD9lDBlr6aC1AGjR4u9yWF6WLGauxzXWuehmaH6qD1IwF
         6icQ==
X-Forwarded-Encrypted: i=1; AL+hErGspiL8kZ2K2uNFbaliQIU0HLjGOS+qv7p6LKDE+5+2WQ1g+7cBW9Gd+8ONNMRdGg9VnWJ0wCYHvyOlqmA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MD2nr56mqYGVhBwl6e5I6Rc4rIkODUVFR/BBCzjt6wfZcfbSa
	kt9rJU8sy1YXEYFfMaBvfYAJ4LoGtSRGiP5kkhmxLAUliFKAbhJ9ulZBCeCno2iZg0K2OgnVcG2
	7s8VMVnkFTQnTVjm3anMWgrkcGDDBV95FceFJ5HTLcgUvMVy5Z8aiqVzno7KSMTp4xSQ=
X-Gm-Gg: AYBFou0zZjohIZw/n/rrlye9Ovu/ru0V0AjazWPklHmzjSMu77jpt0CZ5y8RQvfsDij
	MJKYfPJfAPBtl3Ea2ytudQNakwdvLsosdzjmNAuRtV3B60ohlFLhskVfeAad2UqR0bySIkiR4Oh
	BHBQ44CdiK8hg/YfupnBaz0BtzhaIdHvlrRfgRDITZE9dDK4cJbuZYgvBN9W+fjakWtUjQJMoKp
	yfB4hVkZe4wKrApBz9t9tu+L/6LSKGqhxWFlJt6HAbhCp96ss7X9TQmEGKPtIboZQr5BVhaag6q
	sCsxgkMvd+7zMKjehTVoSvwa5YxKWMWC7ebpSOTE1USkFLWgHJ3wn0+nhP6hz8s2U9IccqIgLem
	AYPZJljm/pwmGP/Pmu7Y8+DrqUQTF6S/Bie9zyvhCwPKtvGaslMqwc4WAfTIIy4XGYNwgzJUl/K
	LPnLjiMws=
X-Received: by 2002:a17:903:230b:b0:2df:90d4:7847 with SMTP id d9443c01a7336-2ee0dee40a0mr10290175ad.35.1794538267518;
        Thu, 12 Nov 2026 18:51:07 -0800 (PST)
X-Received: by 2002:a17:903:230b:b0:2df:90d4:7847 with SMTP id d9443c01a7336-2ee0dee40a0mr10289865ad.35.1794538266918;
        Thu, 12 Nov 2026 18:51:06 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0fa0b3c6sm3044435ad.68.2026.11.12.18.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:51:06 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, songchai@qti.qualcomm.com,
        Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v17 05/10] qcom-tgu: Add signal priority support
Date: Fri, 13 Nov 2026 10:49:30 +0800
Message-Id: <20261113024935.3173715-6-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af67b1c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=1rXoQJKsMvXEZDCkVBMA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: _-QjESZW7dT5RyuyNSRouGb_6BhaGYbO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX4xS8ttayvwFn
 HWF3f+Qu3cRQRk5jzNMJUOqDHUqvetxmNMkNTNy07SeZF2wgkCLOsDEYWgRPCTLP1pAi+t4gyGi
 GFgPOQYnaFR7frdJeCs0sGOLJnTYQV1BQ1hA/bDp74lRxqzSXkTh91DHylKgrn+4xY2Y9poFn44
 PtvIJapzUhxynOmO/nIOWQmxskhaYxLZwrkztqdfXOj/xiPy9sbDKsq1rxRyMwFxhmq9b4RdyCs
 0TOayCAhCrYTt0GYi6KhfYa6YfdZzkQlKDE3bLyANEWNfQwq9Df9kkySj7IxFZ8f7dJfi6r1HeG
 sr4jpPWKAggQVsEqsd3o8SCRiwwtbOlizs/+tx9LZAudSZEWBeHS6yPtzx7HAeKoeex7uV4qT1n
 h9KurKfmHD3E6/dkt9sEFSJofBlYQDigwyPv6Vh2J9EscnjonKgokHQYCN19WJR87zBHnOcmvN/
 Ae0JAAEFTsAsh66r8mg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX1jl4LOPyIRi8
 M7wbiM+eC+pg5BcOIvBR6IP/ajjmTScuoB5/aGh+PppAP60wVl75mfhy5iRrfU7ufh+0UfqPRG4
 pjsdixFFHaLAlqyLUc36/qSN4x4kh1g=
X-Proofpoint-GUID: _-QjESZW7dT5RyuyNSRouGb_6BhaGYbO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130010

Like circuit of a Logic analyzer, in TGU, the requirement could be
configured in each step and the trigger will be created once the
requirements are met. Add priority functionality here to sort the
signals into different priorities. The signal which is wanted could
be configured in each step's priority node, the larger number means
the higher priority and the signal with higher priority will be sensed
more preferentially.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |   7 +
 drivers/hwtracing/qcom/tgu.c                  | 211 ++++++++++++++++++
 drivers/hwtracing/qcom/tgu.h                  |  68 ++++++
 3 files changed, 286 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 66b12ffc2892..09370481758c 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -7,3 +7,10 @@ Description:
 		Accepts only one of the 2 values -  0 or 1.
 		0 : disable TGU.
 		1 : enable TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_priority[0:3]/reg[0:23]
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the sensed signal with specific step and priority for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index ac1ae8bb0ec4..c00e95e68214 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -16,14 +16,145 @@
 
 #include "tgu.h"
 
+struct tgu_attribute {
+	struct device_attribute attr;
+	u8 step_index;
+	u8 priority;
+	u8 reg_num;
+};
+
+/*
+ * drvdata->priority is a flat [priority][step][reg] array.
+ */
+static int calculate_array_location(struct tgu_drvdata *drvdata,
+				    int step_index, int priority,
+				    int reg_index)
+{
+	return priority * (drvdata->num_step) * (drvdata->num_reg) +
+		step_index * (drvdata->num_reg) + reg_index;
+}
+
+static ssize_t tgu_dataset_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	struct tgu_attribute *tgu_attr =
+			container_of(attr, struct tgu_attribute, attr);
+	int index;
+
+	index = calculate_array_location(drvdata, tgu_attr->step_index,
+					 tgu_attr->priority,
+					 tgu_attr->reg_num);
+
+	/*
+	 * Serialise against tgu_dataset_store() and tgu_enable(), which read
+	 * and write the same priority array, so the value is not observed
+	 * while being updated concurrently.
+	 */
+	guard(mutex)(&drvdata->lock);
+
+	return sysfs_emit(buf, "0x%x\n", drvdata->priority[index]);
+}
+
+static ssize_t tgu_dataset_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t size)
+{
+	struct tgu_drvdata *tgu_drvdata = dev_get_drvdata(dev);
+	struct tgu_attribute *tgu_attr =
+		container_of(attr, struct tgu_attribute, attr);
+	unsigned long val;
+	int index;
+	int ret;
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&tgu_drvdata->lock);
+	index = calculate_array_location(tgu_drvdata, tgu_attr->step_index,
+					 tgu_attr->priority,
+					 tgu_attr->reg_num);
+
+	tgu_drvdata->priority[index] = val;
+
+	return size;
+}
+
+static umode_t tgu_node_visible(struct kobject *kobject,
+				struct attribute *attr,
+				int n)
+{
+	struct device *dev = kobj_to_dev(kobject);
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	struct device_attribute *dev_attr =
+		container_of(attr, struct device_attribute, attr);
+	struct tgu_attribute *tgu_attr =
+		container_of(dev_attr, struct tgu_attribute, attr);
+
+	if (tgu_attr->step_index >= drvdata->num_step)
+		return SYSFS_GROUP_INVISIBLE;
+
+	if (tgu_attr->reg_num >= drvdata->num_reg)
+		return 0;
+
+	return attr->mode;
+}
+
 static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 {
+	int i, j, k, index;
+
 	CS_UNLOCK(drvdata->base);
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < MAX_PRIORITY; j++) {
+			for (k = 0; k < drvdata->num_reg; k++) {
+				index = calculate_array_location(
+							drvdata, i, j, k);
+
+				writel(drvdata->priority[index],
+					drvdata->base +
+					PRIORITY_REG_STEP(i, j, k));
+			}
+		}
+	}
 	/* Enable TGU to program the triggers */
 	writel(1, drvdata->base + TGU_CONTROL);
 	CS_LOCK(drvdata->base);
 }
 
+static void tgu_set_dev_caps(struct tgu_drvdata *drvdata)
+{
+	int num_sense_input, num_reg, num_step;
+	u32 devid;
+
+	devid = readl(drvdata->base + CORESIGHT_DEVID);
+
+	num_sense_input = TGU_DEVID_SENSE_INPUT(devid);
+	num_reg = (num_sense_input * TGU_BITS_PER_SIGNAL) / LENGTH_REGISTER;
+
+	if ((num_sense_input * TGU_BITS_PER_SIGNAL) % LENGTH_REGISTER)
+		num_reg++;
+
+	if (num_reg > TGU_MAX_PRIORITY_REGS) {
+		dev_warn(drvdata->dev,
+			"DEVID reports %d priority regs, clamping to %d\n",
+			num_reg, TGU_MAX_PRIORITY_REGS);
+		num_reg = TGU_MAX_PRIORITY_REGS;
+	}
+	drvdata->num_reg = num_reg;
+
+	num_step = TGU_DEVID_STEPS(devid);
+
+	if (num_step > TGU_MAX_STEPS) {
+		dev_warn(drvdata->dev,
+			"DEVID reports %d steps, clamping to %d\n",
+			num_step, TGU_MAX_STEPS);
+		num_step = TGU_MAX_STEPS;
+	}
+	drvdata->num_step = num_step;
+}
+
 static void tgu_enable(struct tgu_drvdata *drvdata)
 {
 	tgu_write_all_hw_regs(drvdata);
@@ -103,8 +234,86 @@ static const struct attribute_group tgu_common_grp = {
 	.attrs = tgu_common_attrs,
 };
 
+#define tgu_dataset_rw(name, step_index, priority, reg_num)              \
+	(&((struct tgu_attribute[]){ {                                   \
+		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
+		step_index,                                              \
+		priority,                                                \
+		reg_num,                                                 \
+	} })[0].attr.attr)
+
+#define STEP_PRIORITY(step_index, reg_num, priority)              \
+	tgu_dataset_rw(reg##reg_num, step_index, priority, reg_num)
+
+#define STEP_PRIORITY_LIST(step_index, priority) \
+	{STEP_PRIORITY(step_index, 0, priority), \
+	 STEP_PRIORITY(step_index, 1, priority),  \
+	 STEP_PRIORITY(step_index, 2, priority),	 \
+	 STEP_PRIORITY(step_index, 3, priority),  \
+	 STEP_PRIORITY(step_index, 4, priority),  \
+	 STEP_PRIORITY(step_index, 5, priority),  \
+	 STEP_PRIORITY(step_index, 6, priority),  \
+	 STEP_PRIORITY(step_index, 7, priority),  \
+	 STEP_PRIORITY(step_index, 8, priority),  \
+	 STEP_PRIORITY(step_index, 9, priority),  \
+	 STEP_PRIORITY(step_index, 10, priority), \
+	 STEP_PRIORITY(step_index, 11, priority), \
+	 STEP_PRIORITY(step_index, 12, priority), \
+	 STEP_PRIORITY(step_index, 13, priority), \
+	 STEP_PRIORITY(step_index, 14, priority), \
+	 STEP_PRIORITY(step_index, 15, priority), \
+	 STEP_PRIORITY(step_index, 16, priority), \
+	 STEP_PRIORITY(step_index, 17, priority), \
+	 STEP_PRIORITY(step_index, 18, priority), \
+	 STEP_PRIORITY(step_index, 19, priority), \
+	 STEP_PRIORITY(step_index, 20, priority), \
+	 STEP_PRIORITY(step_index, 21, priority), \
+	 STEP_PRIORITY(step_index, 22, priority), \
+	 STEP_PRIORITY(step_index, 23, priority), \
+	 NULL                   \
+	}
+
+#define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_priority" #priority \
+	})
+
 static const struct attribute_group *tgu_attr_groups[] = {
 	&tgu_common_grp,
+	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 3),
 	NULL,
 };
 
@@ -129,6 +338,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 	if (ret)
 		return ret;
 
+	tgu_set_dev_caps(drvdata);
+
 	drvdata->enabled = false;
 
 	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index c6426b4e3617..d769379b8421 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -6,9 +6,70 @@
 #ifndef _QCOM_TGU_H
 #define _QCOM_TGU_H
 
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+
 /* Register addresses */
 #define TGU_CONTROL		0x0000
 
+#define TGU_DEVID_SENSE_INPUT(devid_val) \
+	((int)FIELD_GET(GENMASK(17, 10), devid_val))
+#define TGU_DEVID_STEPS(devid_val) \
+	((int)FIELD_GET(GENMASK(6, 3), devid_val))
+
+#define TGU_BITS_PER_SIGNAL	4
+#define LENGTH_REGISTER		32
+
+/*
+ * TGU configuration space                                 Per-step register layout.
+ * (one step occupies STEP_SIZE bytes)                     Offsets below are relative to
+ *                                                         the start of that step's block.
+ * x-------------------------x                             x-----------------x
+ * |   coresight management  |                             |     reserved    |
+ * |        registers        |                             |-----------------| +0x1F4
+ * |                         |                       --->  |   priority[3]   |
+ * |-------------------------|                       |     |-----------------| +0x194
+ * |         step[7]         |                       |     |   priority[2]   |
+ * |-------------------------| step[0] + 7*STEP_SIZE |     |-----------------| +0x134
+ * |           ...           |                       |     |   priority[1]   |
+ * |-------------------------| step[0] + 1*STEP_SIZE |     |-----------------| +0xD4
+ * |         step[0]         |-----------------------|     |   priority[0]   |
+ * |-------------------------| step[0] (base+0x40)         |-----------------| +0x74
+ * |    Control and status   |                             | condition select|
+ * |          space          |                             |-----------------| +0x60
+ * x-------------------------x base                        | condition decode|
+ *                                                         |-----------------| +0x50
+ *                                                         |  Timer/Counter  |
+ *                                                         x-----------------x +0x40
+ */
+#define STEP_SIZE		0x1D8
+#define PRIORITY0_OFFSET	0x0074
+#define PRIORITY_STRIDE		0x0060
+#define REG_SIZE		0x4
+
+/*
+ * Upper bounds on the DEVID-derived per-region counts, used to clamp
+ * whatever the hardware reports so writes never fall outside the
+ * ioremap()'d window or spill into an adjacent region.
+ *
+ *   TGU_MAX_STEPS         matches the static step0..step7 sysfs tables.
+ *   TGU_MAX_PRIORITY_REGS matches the static reg0..reg23 sysfs tables.
+ *
+ * Each priority level's block spans a full PRIORITY_STRIDE (0x60 bytes),
+ * i.e. PRIORITY_STRIDE / REG_SIZE = 24 registers, all of them implemented.
+ */
+
+#define TGU_MAX_STEPS                  8
+#define TGU_MAX_PRIORITY_REGS          24
+
+/* Maximum priority that TGU supports */
+#define MAX_PRIORITY                   4
+
+/* Calculate compare step addresses */
+#define PRIORITY_REG_STEP(step, priority, reg)\
+	(PRIORITY0_OFFSET + PRIORITY_STRIDE * priority +\
+	 REG_SIZE * reg + STEP_SIZE * step)
+
 /**
  * struct tgu_drvdata - Data structure for a TGU (Trigger Generation Unit)
  * @base: Memory-mapped base address of the TGU device
@@ -16,6 +77,10 @@
  * @lock: Mutex serialising enable/disable and the associated PM runtime
  *        reference counting against concurrent sysfs access
  * @enabled: Flag indicating whether the TGU device is enabled
+ * @priority: Per-step, per-priority-level, per-register values staged by
+ *            sysfs writes and flushed to hardware by tgu_enable()
+ * @num_reg: Number of priority registers implemented per priority level
+ * @num_step: Number of steps implemented
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointer, the lock serialising
@@ -26,6 +91,9 @@ struct tgu_drvdata {
 	struct device *dev;
 	struct mutex lock;
 	bool enabled;
+	unsigned int priority[TGU_MAX_STEPS * MAX_PRIORITY * TGU_MAX_PRIORITY_REGS];
+	int num_reg;
+	int num_step;
 };
 
 #endif
-- 
2.34.1

