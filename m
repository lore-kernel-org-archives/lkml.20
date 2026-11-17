Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900814;
	b=RhZIi8idK4BddBMBz1q0rWOkquK+CECcbxtYo8l9MIAwhoVjccrRV52ha3EkYGTUmDbO
	 ZusXoc3aHpQL3HyPKV4VAidK5sVul8T+aVLMLjFT+iC2UDTMfBNJ7aKPwM5vi+Epzmwct
	 cYotLKjYh7MTd+knguN6ftSEKHgLcaTM0PplStfY976i2eeJdY0tXlXuhTZiEyLbcw6KT
	 5Wrv0GwwoaakkA9cyRH4hD9rNoSHXtXDXQfXGN2zkqje7kZQPI7PPPtqNhajg6T74FPr2
	 bqIANebEKb2mfaXbvvPR9kEJ4bocnAWkW95sm82TJ4pWqLt/2gFnZgjXlHhJkIBds2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900814;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=R4AnKfy9vaOFdUcffAacVVa5fJOHRuc6CEJFDQor3xc=;
	b=oYp3/qToVL1+uuHHJbrdIJpzUKUD4bCMSS7Q8hRApg1qq5KRkXqWmkS6AmZ4xdw31qnG
	 3DkSXzrXN/nVUJlg0gz5KBkYzaVCo73X7gGufdkGSn9huzHIuuvP8Z3UeVjJUA2ftDtdp
	 Rj22pZc+rHWPUZ1h1B6Jo043NyphJ3vzLU/1v9/exSH+R5qbUk4N6AwbnIy4dQIibfjd6
	 rDvUFNRpQquD0wPDVIFM8JOY442kRxgTJZ2GxFqIjyKC6qRfIDICufoOzn1AoeThi5DGW
	 +25DpymI9j5Ktc5ilKvKxoieLsWN4Jyg/y2hgjGxmwrEubpRTx6EajJv2ujCArCTc5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IGybIeSG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N+pQtC7r;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A19F606A898
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A19F606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IGybIeSG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N+pQtC7r
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aMN11801060
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=R4AnKfy9vaO
	FdUcffAacVVa5fJOHRuc6CEJFDQor3xc=; b=IGybIeSGuNdUDznr+bDjSfEeDYS
	n7CL/CcIqLFlQ8wLIHzcXGoI+UQXAWNlUB/7ssH7dIUTlyQsV4M9nCtqIcFwkQbi
	OYHWGBxoztG3UKDRkJPHaEU4FaUdprMCZ/HhkWoz38t+FSSaAdumglb73PNo3XOz
	9xMK/pdE8WBzfyGkpIv0WWIrtLSSGOtidXK1sAiTpBx7ea15MLMEbVLzFQb6id9f
	KKFImQmMCQzS4DvqtMXaEhRDBaVriYFfEaWOUOtrGZ5FgcS1a6Ul4D4vwVSQ6wAP
	TZs/rEJfAKMIvTDA4GI50+YGKjlMSOsEwl1Z3HhbnvntYHiDVfMmCXghlzg==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j034y3nd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:33:33 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-8628955a085so5733445a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794900813; x=1795505613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R4AnKfy9vaOFdUcffAacVVa5fJOHRuc6CEJFDQor3xc=;
        b=N+pQtC7rLEMaQYuY+rY8yCODC6zlTSNTX0jQ2lO7lecRLRBnCijCX8fS2JcmxbBXph
         cxVaXA+MKlV25VTt6s4SVbR8YXeUyG79l92T1fWS1MuYJzP5c63uvKM02kqkRm5hq0tz
         aaGoQMe5H0R7vXsih9J2zU2uhZoY4BB1T9IsZRcTJndqg8reeOntHuBfhHnCqMsEooMi
         7EDuSNgdc4SCw3ncbWLgPc4jtv9fhAYkAsLUPiQQ5opn4U7NmQTzrEqYzST/IfSR0lZd
         KvWlOTXvI7/jw9smSElzwIRiLV/6dkSvib57P/46RFLEG4VZ73pJxJM+ygFKQ30MdhyM
         hEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794900813; x=1795505613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R4AnKfy9vaOFdUcffAacVVa5fJOHRuc6CEJFDQor3xc=;
        b=k2+VgOvxqwn65QSULiMV8gTvmseHvNixmRfBaiEmlo937v1D41S7bxX0vU5zSfGvi5
         JSDByNXBvqlHkF+YrSUBIdfVQM0S9Bv9rwxOzAnh8eCalZjEPR9Q+1QhZ+0WDTjrYoZm
         ym13lUq6SzvoIaZNM7f/qsnw8UQ5FZXgH/xsa55v4S1/oPB35VhPgPNZ618SQ1BKo/74
         K/ZTHYkXej0LEP8a5/ZleX0OIA6ghho0GOSnfIQZRwwByHPVI7VFXW21Tc9s1vty8uJ/
         dvNKlYqvdN6QoGmoY1PrezBk6LvNJHXh9MHJdY4OqAwrkBDkJC4MJ14gkv0/qHTofL/n
         Vc/g==
X-Forwarded-Encrypted: i=1; AL+hErGbKHoqfn/4HqvN5+tVQBksERAhpVDrVUk/faRaU3Dqb1S0mFHPiqms6Zu+Dp9ScB5VIKEGF5YoaofRZ58=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8ury86wAVG6yAXhc76eYK7BJQkPsrfdvSGPZMvDMfEDKrL2sz
	BsWO8L9EbqD0k2fOTIf74dqDjOfDfSZlV4giaSK7sSoWU3RAwg0IICEfAnZ/81HkMT/CQrzRzYV
	CZfJmeCbROBg4G6DKzu93UNWve04Ayl8iKOo1/dDM6jVYv8OcfMTanNotGnq6+0amBj4=
X-Gm-Gg: AYBFou3PqBcIggF2HB0Hjm0MAhbnETVy8pXGGgYb/haGY0gWKi4eRD8/K6TUAZJ3XvJ
	PLlfugu34CZyCYiEM2A67/9qdY35A9SWwdTZ6CD/s3tNWr3mzuEjd/dn/A2Ho2dx1ICVerzceKo
	qxScdHwGyG52ucLHqrn4dSb3uulLn3gl5Y9VKyAgJpcESgODEvkLMxtnbghv5ciOgeUiMtBNx1R
	V5NhpAaIgXezOdPpjsTTk8cOFQ+HOQkDGys1Br18ytX49B8I1VFLyBbja3P/EOim7bezRB5oE8m
	MJgPTO4yAroEzZoGpz0n0PLOOJblthF+N/wrHb72k46OEC1/l+9CrMx0QtMHNYAp+dtOrHN4nD6
	tSTliU4LoBGTPWKcfPaUP5RWeVG7JMcNebe0qq6N1sqGQBG2bH6BHX8Q8h/tBpRUi6j1UCPM7Jp
	5JEW3/oNLr1o8rKJaBZlfRs+Fn5vGJLlqpmw==
X-Received: by 2002:a05:6830:2692:b0:829:2af1:a07d with SMTP id 46e09a7af769-86289818d7emr12815762a34.5.1794900812774;
        Mon, 16 Nov 2026 23:33:32 -0800 (PST)
X-Received: by 2002:a05:6830:2692:b0:829:2af1:a07d with SMTP id 46e09a7af769-86289818d7emr12815734a34.5.1794900812245;
        Mon, 16 Nov 2026 23:33:32 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862c67db8basm4944508a34.13.2026.11.16.23.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:33:31 -0800 (PST)
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
Subject: [PATCH v19 3/8] qcom-tgu: Add TGU driver
Date: Tue, 17 Nov 2026 15:33:00 +0800
Message-Id: <20261117073305.3854951-4-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117073305.3854951-1-songwei.chai@oss.qualcomm.com>
References: <20261117073305.3854951-1-songwei.chai@oss.qualcomm.com>
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
X-Proofpoint-GUID: hxGR_OU-9xhzSIdOVtyNSx65S-AZRsL9
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6afc034d cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=Rd-eziGjFw8r9s-5bI8A:9
 a=EXS-LbY8YePsIyqnH6vw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: hxGR_OU-9xhzSIdOVtyNSx65S-AZRsL9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX8eRCA06XTeSr
 GWXSd589kVhskZAMvd0tgAUPlS7JOuIjxQPlkSM7k4CWxm/jKMQZ0xff062n2nBvu9utDWADSI6
 pGDpcmhhnXX1XEBhJzSfXsMiNzbptUM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfXz+Cj6TIHJdTp
 HPuuRJ+bQ/mE7SVSp5JwnuCFtJkEnFtHBbk9rnDgAHKeWo7gJrRkQSq5qOPyddsE2EUkXwEAWUv
 T7ri6wm6NrdO8BQA5GJVg5LGVICr5QJ+D0QJSUlCw/LsvrFz/c+ucTKmvadHSbrS+ca/A+OdSY+
 Qf5nWRmdeG8mNKJHBOjYZMZT7S2wjOl1JFMM/u1xAa9YQECOh8iJMdmcNaPOAu4Pg+j1DAWaX4x
 47pgnZlKTaTLR1mmjaxOPzD+/py2Rw0KuIyMkpP11NIbJit+e2LcL44gNPDvlVRmj5/X9q1vr3e
 X0OI1GwpwDaha/1HIuvt//41qaidd8h7hsaCqF9kUQwiqiqc84WJD+1wGspWrOLvJLyXRBJ94QR
 /BqgNVYXmNntey5t5Lh+QMJFAhibqEm251MSqs5513wRwrQKdW6wm9JZrvFlJh+GCHwU6lH/y0+
 /7InV4geKeaUvuXR9bg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170029

Add driver to support device TGU (Trigger Generation Unit).
TGU is a Data Engine which can be utilized to sense a plurality of
signals and create a trigger into the CTI or generate interrupts to
processors. Add probe/enable/disable functions for tgu.

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |   9 +
 MAINTAINERS                                   |  11 +
 drivers/Makefile                              |   1 +
 drivers/hwtracing/Kconfig                     |   2 +
 drivers/hwtracing/qcom/Kconfig                |  20 ++
 drivers/hwtracing/qcom/Makefile               |   3 +
 drivers/hwtracing/qcom/tgu.c                  | 193 ++++++++++++++++++
 drivers/hwtracing/qcom/tgu.h                  |  31 +++
 8 files changed, 270 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
 create mode 100644 drivers/hwtracing/qcom/Kconfig
 create mode 100644 drivers/hwtracing/qcom/Makefile
 create mode 100644 drivers/hwtracing/qcom/tgu.c
 create mode 100644 drivers/hwtracing/qcom/tgu.h

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
new file mode 100644
index 000000000000..798a0e51e27a
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -0,0 +1,9 @@
+What:		/sys/bus/amba/devices/<tgu-name>/enable
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the enable/disable status of TGU
+		Accepts only one of the 2 values -  0 or 1.
+		0 : disable TGU.
+		1 : enable TGU.
diff --git a/MAINTAINERS b/MAINTAINERS
index d738990161bd..d7598cdb09f9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23270,6 +23270,17 @@ S:	Maintained
 F:	Documentation/tee/qtee.rst
 F:	drivers/tee/qcomtee/
 
+QUALCOMM HARDWARE TRACING DRIVER
+M:	Songwei Chai <songwei.chai@oss.qualcomm.com>
+M:	Jie Gan <jie.gan@oss.qualcomm.com>
+M:	Suzuki K Poulose <suzuki.poulose@arm.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git
+F:	Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+F:	Documentation/devicetree/bindings/arm/qcom,tgu.yaml
+F:	drivers/hwtracing/qcom/
+
 QUALCOMM TRUST ZONE MEMORY ALLOCATOR
 M:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
diff --git a/drivers/Makefile b/drivers/Makefile
index 0841ea851847..f37edcf34e0d 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -176,6 +176,7 @@ obj-$(CONFIG_RAS)		+= ras/
 obj-$(CONFIG_USB4)		+= thunderbolt/
 obj-$(CONFIG_CORESIGHT)		+= hwtracing/coresight/
 obj-y				+= hwtracing/intel_th/
+obj-$(CONFIG_QCOM_TGU)		+= hwtracing/qcom/
 obj-$(CONFIG_STM)		+= hwtracing/stm/
 obj-$(CONFIG_HISI_PTT)		+= hwtracing/ptt/
 obj-y				+= android/
diff --git a/drivers/hwtracing/Kconfig b/drivers/hwtracing/Kconfig
index 911ee977103c..8a640218eed8 100644
--- a/drivers/hwtracing/Kconfig
+++ b/drivers/hwtracing/Kconfig
@@ -7,4 +7,6 @@ source "drivers/hwtracing/intel_th/Kconfig"
 
 source "drivers/hwtracing/ptt/Kconfig"
 
+source "drivers/hwtracing/qcom/Kconfig"
+
 endmenu
diff --git a/drivers/hwtracing/qcom/Kconfig b/drivers/hwtracing/qcom/Kconfig
new file mode 100644
index 000000000000..5c94c75ffa39
--- /dev/null
+++ b/drivers/hwtracing/qcom/Kconfig
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# QCOM specific hwtracing drivers
+#
+menu "Qualcomm specific hwtracing drivers"
+
+config QCOM_TGU
+	tristate "QCOM Trigger Generation Unit driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on ARM_AMBA
+	help
+	  This driver provides support for Trigger Generation Unit that is
+	  used to detect patterns or sequences on a given set of signals.
+	  TGU is used to monitor a particular bus within a given region to
+	  detect illegal transaction sequences or slave responses. It is also
+	  used to monitor a data stream to detect protocol violations and to
+	  provide a trigger point for centering data around a specific event
+	  within the trace data buffer.
+
+endmenu
diff --git a/drivers/hwtracing/qcom/Makefile b/drivers/hwtracing/qcom/Makefile
new file mode 100644
index 000000000000..5a0a868c1ea0
--- /dev/null
+++ b/drivers/hwtracing/qcom/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_QCOM_TGU) += tgu.o
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
new file mode 100644
index 000000000000..5bae46db4f8c
--- /dev/null
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -0,0 +1,193 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/amba/bus.h>
+#include <linux/coresight.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/pm_runtime.h>
+
+#include "tgu.h"
+
+static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
+{
+	CS_UNLOCK(drvdata->base);
+	/* Enable TGU to program the triggers */
+	writel(1, drvdata->base + TGU_CONTROL);
+	CS_LOCK(drvdata->base);
+}
+
+static void tgu_enable(struct tgu_drvdata *drvdata)
+{
+	tgu_write_all_hw_regs(drvdata);
+	drvdata->enabled = true;
+}
+
+static void tgu_disable(struct tgu_drvdata *drvdata)
+{
+	CS_UNLOCK(drvdata->base);
+	writel(0, drvdata->base + TGU_CONTROL);
+	CS_LOCK(drvdata->base);
+
+	drvdata->enabled = false;
+}
+
+static ssize_t tgu_enable_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	bool enabled;
+
+	scoped_guard(mutex, &drvdata->lock)
+		enabled = drvdata->enabled;
+
+	return sysfs_emit(buf, "%d\n", enabled);
+}
+
+/* tgu_enable_store - Enable or disable the Trigger Generation Unit (TGU). */
+static ssize_t tgu_enable_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf,
+				size_t size)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	unsigned long val;
+	int ret;
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret || val > 1)
+		return -EINVAL;
+
+	/*
+	 * Hold the mutex across the whole check-and-act sequence: the check of
+	 * drvdata->enabled, the PM runtime reference counting and the state
+	 * update must be atomic, otherwise concurrent writers could each
+	 * imbalance the PM runtime usage counter.
+	 */
+	guard(mutex)(&drvdata->lock);
+
+	if (val) {
+		if (drvdata->enabled)
+			return -EBUSY;
+
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret)
+			return ret;
+
+		tgu_enable(drvdata);
+	} else {
+		if (!drvdata->enabled)
+			return -EINVAL;
+
+		tgu_disable(drvdata);
+		pm_runtime_put(dev);
+	}
+
+	return size;
+}
+static DEVICE_ATTR(enable, 0644, tgu_enable_show, tgu_enable_store);
+
+static struct attribute *tgu_common_attrs[] = {
+	&dev_attr_enable.attr,
+	NULL,
+};
+
+static const struct attribute_group tgu_common_grp = {
+	.attrs = tgu_common_attrs,
+};
+
+static const struct attribute_group *tgu_attr_groups[] = {
+	&tgu_common_grp,
+	NULL,
+};
+
+static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
+{
+	struct device *dev = &adev->dev;
+	struct tgu_drvdata *drvdata;
+	int ret;
+
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	drvdata->dev = &adev->dev;
+	dev_set_drvdata(dev, drvdata);
+
+	drvdata->base = devm_ioremap_resource(dev, &adev->res);
+	if (IS_ERR(drvdata->base))
+		return PTR_ERR(drvdata->base);
+
+	ret = devm_mutex_init(dev, &drvdata->lock);
+	if (ret)
+		return ret;
+
+	drvdata->enabled = false;
+
+	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
+	if (ret) {
+		dev_err(dev, "failed to create sysfs groups: %d\n", ret);
+		return ret;
+	}
+
+	pm_runtime_put(&adev->dev);
+
+	return 0;
+}
+
+static void tgu_remove(struct amba_device *adev)
+{
+	struct device *dev = &adev->dev;
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+
+	sysfs_remove_groups(&dev->kobj, tgu_attr_groups);
+
+	/*
+	 * If the device is still enabled through sysfs, disable the hardware
+	 * and drop the PM runtime reference taken in tgu_enable_store() so the
+	 * usage counter stays balanced. Use the synchronous put: the driver core
+	 * disables runtime PM right after ->remove() returns, and the barrier in
+	 * pm_runtime_disable() would cancel a still-queued async idle/suspend,
+	 * leaving the runtime-PM state inconsistent.
+	 */
+	scoped_guard(mutex, &drvdata->lock) {
+		if (drvdata->enabled) {
+			tgu_disable(drvdata);
+			pm_runtime_put_sync(dev);
+		}
+	}
+}
+
+static const struct amba_id tgu_ids[] = {
+	{
+		.id = 0x000f0e00,
+		.mask = 0x000fffff,
+	},
+	{ 0, 0, NULL },
+};
+
+MODULE_DEVICE_TABLE(amba, tgu_ids);
+
+static struct amba_driver tgu_driver = {
+	.drv = {
+		.name = "qcom-tgu",
+		.suppress_bind_attrs = true,
+	},
+	.probe = tgu_probe,
+	.remove = tgu_remove,
+	.id_table = tgu_ids,
+};
+
+module_amba_driver(tgu_driver);
+
+MODULE_AUTHOR("Songwei Chai <songwei.chai@oss.qualcomm.com>");
+MODULE_AUTHOR("Jinlong Mao <jinlong.mao@oss.qualcomm.com>");
+MODULE_DESCRIPTION("Qualcomm Trigger Generation Unit driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
new file mode 100644
index 000000000000..c6426b4e3617
--- /dev/null
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _QCOM_TGU_H
+#define _QCOM_TGU_H
+
+/* Register addresses */
+#define TGU_CONTROL		0x0000
+
+/**
+ * struct tgu_drvdata - Data structure for a TGU (Trigger Generation Unit)
+ * @base: Memory-mapped base address of the TGU device
+ * @dev: Pointer to the associated device structure
+ * @lock: Mutex serialising enable/disable and the associated PM runtime
+ *        reference counting against concurrent sysfs access
+ * @enabled: Flag indicating whether the TGU device is enabled
+ *
+ * This structure defines the data associated with a TGU device,
+ * including its base address, device pointer, the lock serialising
+ * enable/disable, and the enable status.
+ */
+struct tgu_drvdata {
+	void __iomem *base;
+	struct device *dev;
+	struct mutex lock;
+	bool enabled;
+};
+
+#endif
-- 
2.34.1

