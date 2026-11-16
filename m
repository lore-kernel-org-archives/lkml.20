Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814920;
	b=cdcW9U+JBiMKaD4RElUi7EZqVy9x5p6bh1PE85VpdM2Ts4NM0aV4joZ7Ed3AFNIPZMYj
	 6kJuf0AbfbcGw4yQa14rpNL7R375xAxAFSnkvp61ee2d+P4wSo+d1O0YNxtRomK9zStGP
	 eCq5y5svmHNIgN/U4O4fdQxn3XFrRpykivdKJp6mzjE1zPfc4Srj0h1xEmDjoU74Eycv7
	 wy6Qq7w4ppYFdtFWeb03n5Nq9kVJYRgEE/45TlHJmzuo0fydty8RcgqFfTZsjf6te411/
	 CW8Ain1YjXNCQZTUXa48vYQ0rBdjTtwhbB+zihzO65nrEgR82F4tWmY8K5jhmZ0TnPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814920;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FYBI8e5Ysw+YK+QlmiAVTKfd0et8yI6rYSa73lkGWao=;
	b=ARvHu/cGKsmKKsBBL5uFzQWp84Qayqnfa50wuPJQw3Scb0/ugdatebyH8/UnJLhRbyHx
	 wnaZC8/FKP/fsZ5CwQEW17y9pZhp5K7dGdF/wbd+VYCLuK5+7pL1vSgW9TkFQCn2wewJ9
	 OVF8s5edOB/5Q6fj78wdW3jf+FqQiHRFvKbpeqqVGw53Gsap3iBqm+D67heFdopPd3IvJ
	 K7u1sjKrBl54TWOYijf3LIujTynTCjYkpR5/L3tsfIYDe7taeYOI7yeuaQMzUwtsQ18FQ
	 ISDszADHtuNBdC1agdgjJp/KSnI2TmrR8OpR3sk44EYYXsgXAPTOTEWqzFLwbB0laCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="IVQke/cE";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EIF+nXdM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED701606A334
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED701606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IVQke/cE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EIF+nXdM
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7ekFc4149294
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FYBI8e5Ysw+
	YK+QlmiAVTKfd0et8yI6rYSa73lkGWao=; b=IVQke/cEkiGOpIxjhdBVVOfKbmt
	Uq4Acfb0OTg4rtM8ZX6H8f3uxJP6fbKsB4xsowNqUt4lTW3S3sXRjVYhoraF/VnS
	OV2FqXCeT5LGQZhcExTkztuLWUnyGW12TbMcdcX/oZ91cGw0k4x0YCnGO2NGr+AD
	m92hw4TGXI/o2RFkVIn7sUZnvWBK2KM2dfgrZWxNc+mOOYZIhG+9XMTaNJO1ftgE
	Svr+A0vKNyhExvar3JED9ZizgePB/UQ6nGuZ7MgqVpUBtjOlWviVgkJaKmqbDO4d
	VwYDk1Q0kG28SA37g8tgdmmG4N+BqA+FiBWbyoveWJv1bTwI/qxCYtD3ksg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmhnb2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:41:59 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36de26cb4b3so3911201eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794814919; x=1795419719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FYBI8e5Ysw+YK+QlmiAVTKfd0et8yI6rYSa73lkGWao=;
        b=EIF+nXdMG9/RJp+HEemmZtDwFqgnhCEInmuuKJGNJVhY6jLr3NUGSbk7XnDBRAyZxH
         hHIyVARtOsDFYo2zwEkuhKKfDIKYjDP/EA8Nn2abTZXYMIoOI18dZvfcc3asb0hn/mh1
         6AImKU1lACXStqZULbcghInBQgve9OG7OZB7UEzaLSlRtFDJPqYjIIdDe90ogDlq8kS+
         zwtkOSqajAizlvAauLxP9nLiJ77uTnq4BLKN7l302IkKAyjBnACqPROLPgryzptT3qft
         rWBRgNZG0tMed9FDtqQZrHXTWeHxvvakCyAp7/VFo4La4MzKxiAXUnR2d2UekrOmEPYd
         pULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814919; x=1795419719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FYBI8e5Ysw+YK+QlmiAVTKfd0et8yI6rYSa73lkGWao=;
        b=uCIqtyXR30/tt7rkoFH2M3zc8sUhjg5WNEK5iavRUtOvhg3g6l3Hoxz9KYhc9zfHqn
         eM8T8exI9PATMPSmTDvqNbRsO+heWaTknCkKzLhBEPaqejI6zZIiVr+dZN4N2IPv/35x
         lpj6tSfYD5QADX2H/hzwFTfrctbp7HSBlyGGAAcVBl5oSFyD5bBa3nw4yOG1qlw8MRgP
         usgKO+Tcmteth0R40WH31viT/G9NjcQNBTCkL8boQOTo5KheuOXqUDijKMREEaSTgPfC
         YTVTvVX9af4tsEe72kP3XIs9esYU9z9Fn2uHvSs8adFpDy1VUVgCu0mSgV4iQ8dlg3Z2
         GqkA==
X-Forwarded-Encrypted: i=1; AL+hErHMpPtdqnSsGxOX40vCrHCPO/JX3owdfgc5xeizTk3X9A3M3pMfukkWWkhrqxl8oNkCrzlVe+6c2/c4RQI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lq4fUr5YGo/5aYJX32f4dN00uzP1Zj/kf2OJMli7Tbb+gceAR
	Ddo/QQ8cOWMN6jMJpWO5nAN/1NsEi9FNLVzj7Bj5EIi5I5crQmLWC6gqQNHCZpcJs0y4JhKwmQr
	4vAXzzBZcnqGj3WZdiT08VEUBgGZ2qPvjvAJgHspx57LW77J8rxT43U1nATQysGMHeM4=
X-Gm-Gg: AYBFou0ei4574kKJDcG5LAcsocWbFsTtHCqyAUzOJB5cK24WoVCc0k5p+NdiJT41XI9
	/NhoAqWvtBPhQBQb4pIuwiFqGfQfCClCbuPVa+rQ8aZgy3ui6YFWbKfUgGdv9TyMFjC0Hla887H
	b4+EXO/GZ69/KalSXkv+mZKtBtYf/9frYEjr91+WjTM4bN87xA9JSwIbZH6xH319mkTWKjrR2TN
	9wPqka0mpT4abxnPmot0uJF0GMeBNTRwIAFzlCZUPWlWtMtn7lEqfUWqgpXDxd1sjyJaJX7jlSD
	WqQM4dqjFIEDkRzn4Kooe67cTxIvs8zuZixzwXafeNEY64iQ/cULL4H+m3ShTwijK3i9EXOII3w
	uYGLtC2B4Wtwfzzox2u8xjGrNVdoaTjXL2IC+qOAiNCu92tls1hPWcEJqb0sswE0Ht6CQIxFO8c
	npyTYGHBD+pq5gsl6jQcwrgMoVt5PdhG9MKQ==
X-Received: by 2002:a05:7301:428f:b0:369:5583:bf4c with SMTP id 5a478bee46e88-379684ae79dmr9722975eec.28.1794814918213;
        Sun, 15 Nov 2026 23:41:58 -0800 (PST)
X-Received: by 2002:a05:7301:428f:b0:369:5583:bf4c with SMTP id 5a478bee46e88-379684ae79dmr9722960eec.28.1794814917623;
        Sun, 15 Nov 2026 23:41:57 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm52137536eec.25.2026.11.15.23.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:41:57 -0800 (PST)
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
Subject: [PATCH v18 6/8] qcom-tgu: Add support to configure next action
Date: Mon, 16 Nov 2026 15:41:16 +0800
Message-Id: <20261116074118.822731-7-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
References: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
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
X-Proofpoint-GUID: P4_YuAnTUgUoaCa6M13a92KtKt0SlTjx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfX7Kj/39Ho043a
 CGO5czvIA7Md3zBUMtvnL8ztEWb1tYh//HFQCU8+04JupbNB+H79+gVxLBa7O0obOFecjXQ7LuE
 51FZeOMsfyv32MG+xkXy2HuljWyjRj4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfXwjQQuoZO8I1O
 X/lcH5tuHbW5ijzMOUi8r209RqwMPc/+IkHNCV8BZHSfjh6Z94xfXEMQBk2yaWLkkP2g3tiB3nv
 /TaZpATdtqYnl7yTj5y/l1r0RgcLIaaburlPvLed3NC/LUiFxo3hI6AUDQgHXMg6hAOHLdlN1Qj
 ioN4JJEyMciC2kAnAPgW4ojce3VuhV22TDdAyIP83CCXlLpnjYRXinbY8mXPG6i8WP53smzB6p0
 be8VI12ecrG6FLXNIROzwLyOL5ZQ8h6idi9v+A3BYkqUMOycqVZqQAZjjY3tRTxNSWgAPkhRdGd
 rJGKnFuMEfptstPTEdzO32p2LAvlgDpDTun1ZNhuODixkFHqWCldxNTDktmgudWCY0JkasaEvn6
 O/cgenPP9PQ0N0/SExYQO7RvoXEi5MB67hYhAam0Ma1QZL5cZ7fOrOGajY1whrvjZXI7/W7aYYP
 6QmzwFvG3BMnTzOuYfQ==
X-Authority-Analysis: v=2.4 cv=e/2T2qp/ c=1 sm=1 tr=0 ts=6afab3c7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=WxrQkracP7FNNSUBJ2YA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: P4_YuAnTUgUoaCa6M13a92KtKt0SlTjx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160030

Add "select" node for each step to determine if another step is taken,
trigger(s) are generated, counters/timers incremented/decremented, etc.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    | 16 +++
 drivers/hwtracing/qcom/tgu.c                  | 97 ++++++++++++++++++-
 drivers/hwtracing/qcom/tgu.h                  | 17 +++-
 3 files changed, 128 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index c7e6f13da83d..c30b58166a0f 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -21,3 +21,19 @@ KernelVersion:	7.5
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the decode mode with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_select/reg[0:3]
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the next action with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_select/default
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the default next action for a specific step of the
+		TGU. This is the last register of the condition select region
+		and is applied when none of the numbered select registers match.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 1809cca4a94f..04076eb7a19b 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -23,6 +23,18 @@ struct tgu_attribute {
 	u8 reg_num;
 };
 
+/*
+ * The last register of the 'condition select' region is the next-action
+ * ('default') register. Its position depends on the runtime value of
+ * num_condition_select, so it is exposed as a dedicated statically named
+ * "default" attribute carrying a sentinel reg number, rather than renaming
+ * a shared static attribute at runtime.
+ *
+ * Must fit in struct tgu_attribute.reg_num (u8) while staying outside every
+ * legitimate reg_num range (0..23 across priority/decode/select).
+ */
+#define TGU_SELECT_DEFAULT_REG 0xff
+
 /*
  * drvdata->priority is a flat [priority][step][reg] array.
  */
@@ -41,6 +53,16 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
 	case TGU_CONDITION_DECODE:
 		return step_index * (drvdata->num_condition_decode) +
 			reg_index;
+	case TGU_CONDITION_SELECT:
+		/*
+		 * The 'default' register is the last one in the select region;
+		 * it is exposed with a sentinel reg number, translated here to
+		 * its actual position.
+		 */
+		if (reg_index == TGU_SELECT_DEFAULT_REG)
+			reg_index = drvdata->num_condition_select - 1;
+		return step_index * (drvdata->num_condition_select) +
+			reg_index;
 	default:
 		break;
 	}
@@ -90,6 +112,9 @@ static ssize_t tgu_dataset_show(struct device *dev,
 	case TGU_CONDITION_DECODE:
 		return sysfs_emit(buf, "0x%x\n",
 				drvdata->condition_decode[index]);
+	case TGU_CONDITION_SELECT:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->condition_select[index]);
 	default:
 		break;
 	}
@@ -131,6 +156,10 @@ static ssize_t tgu_dataset_store(struct device *dev,
 		tgu_drvdata->condition_decode[index] = val;
 		ret = size;
 		break;
+	case TGU_CONDITION_SELECT:
+		tgu_drvdata->condition_select[index] = val;
+		ret = size;
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -169,6 +198,17 @@ static umode_t tgu_node_visible(struct kobject *kobject,
 		if (tgu_attr->reg_num < drvdata->num_condition_decode)
 			return attr->mode;
 		break;
+	case TGU_CONDITION_SELECT:
+		/*
+		 * The next-action ('default') register is exposed as its own
+		 * statically named attribute and is always present. The numbered
+		 * data registers occupy the positions before it.
+		 */
+		if (tgu_attr->reg_num == TGU_SELECT_DEFAULT_REG)
+			return attr->mode;
+		if (tgu_attr->reg_num < drvdata->num_condition_select - 1)
+			return attr->mode;
+		break;
 	default:
 		break;
 	}
@@ -207,6 +247,18 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 				drvdata->base + CONDITION_DECODE_STEP(i, j));
 		}
 	}
+
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_condition_select; j++) {
+			index = check_array_location(drvdata, i,
+						TGU_CONDITION_SELECT, j);
+			if (index == -EINVAL)
+				goto exit;
+
+			writel(drvdata->condition_select[index],
+				drvdata->base + CONDITION_SELECT_STEP(i, j));
+		}
+	}
 	/* Enable TGU to program the triggers */
 	writel(1, drvdata->base + TGU_CONTROL);
 exit:
@@ -216,7 +268,8 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 
 static void tgu_set_dev_caps(struct tgu_drvdata *drvdata)
 {
-	int num_sense_input, num_reg, num_step, num_condition_decode;
+	int num_sense_input, num_reg, num_step;
+	int num_condition_decode, num_condition_select;
 	u32 devid;
 
 	devid = readl(drvdata->base + CORESIGHT_DEVID);
@@ -254,6 +307,17 @@ static void tgu_set_dev_caps(struct tgu_drvdata *drvdata)
 		num_condition_decode = TGU_MAX_CONDITION_DECODE;
 	}
 	drvdata->num_condition_decode = num_condition_decode;
+
+	/* The select region has an additional 'default' register. */
+	num_condition_select = TGU_DEVID_CONDITIONS(devid) + 1;
+
+	if (num_condition_select > TGU_MAX_CONDITION_SELECT) {
+		dev_warn(drvdata->dev,
+			"DEVID reports %d condition select regs, clamping to %d\n",
+			num_condition_select, TGU_MAX_CONDITION_SELECT);
+		num_condition_select = TGU_MAX_CONDITION_SELECT;
+	}
+	drvdata->num_condition_select = num_condition_select;
 }
 
 static int tgu_enable(struct tgu_drvdata *drvdata)
@@ -410,6 +474,29 @@ static const struct attribute_group tgu_common_grp = {
 		.name = "step" #step "_condition_decode" \
 	})
 
+#define STEP_SELECT(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_SELECT, reg_num)
+
+#define STEP_SELECT_DEFAULT(step_index) \
+	tgu_dataset_rw(default, step_index, TGU_CONDITION_SELECT, \
+			TGU_SELECT_DEFAULT_REG)
+
+#define STEP_SELECT_LIST(step_index) \
+	{STEP_SELECT(step_index, 0), \
+	 STEP_SELECT(step_index, 1), \
+	 STEP_SELECT(step_index, 2), \
+	 STEP_SELECT(step_index, 3), \
+	 STEP_SELECT_DEFAULT(step_index), \
+	 NULL                             \
+	}
+
+#define CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(step)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_SELECT_LIST(step),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_condition_select" \
+	})
+
 static const struct attribute_group *tgu_attr_groups[] = {
 	&tgu_common_grp,
 	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 0),
@@ -452,6 +539,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
 	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(5),
 	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(6),
 	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(7),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(0),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(1),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(2),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(3),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(4),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(5),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(6),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(7),
 	NULL,
 };
 
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index 7d88ad8e730f..27eb1f81effa 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -46,6 +46,7 @@
 #define STEP_SIZE		0x1D8
 #define PRIORITY0_OFFSET	0x0074
 #define CONDITION_DECODE_OFFSET	0x0050
+#define CONDITION_SELECT_OFFSET	0x0060
 #define PRIORITY_STRIDE		0x0060
 #define REG_SIZE		0x4
 
@@ -57,6 +58,8 @@
  *   TGU_MAX_STEPS         matches the static step0..step7 sysfs tables.
  *   TGU_MAX_PRIORITY_REGS matches the static reg0..reg23 sysfs tables.
  *   TGU_MAX_CONDITION_DECODE decode region 0x50..0x5F holds 4 u32 registers
+ *   TGU_MAX_CONDITION_SELECT select region 0x60..0x73 holds 5 u32 registers
+ *                            (the last one being the 'default' next-action)
  *
  * Each priority level's block spans a full PRIORITY_STRIDE (0x60 bytes),
  * i.e. PRIORITY_STRIDE / REG_SIZE = 24 registers, all of them implemented.
@@ -65,6 +68,7 @@
 #define TGU_MAX_STEPS                  8
 #define TGU_MAX_PRIORITY_REGS          24
 #define TGU_MAX_CONDITION_DECODE       4
+#define TGU_MAX_CONDITION_SELECT       5
 
 /* Maximum priority that TGU supports */
 #define MAX_PRIORITY                   4
@@ -72,7 +76,8 @@
 /*
  * Values for struct tgu_attribute.operation_index: TGU_PRIORITY0..
  * TGU_PRIORITY3 select a priority level, TGU_CONDITION_DECODE selects the
- * condition decode registers instead.
+ * condition decode registers, and TGU_CONDITION_SELECT selects the
+ * condition select registers.
  */
 enum operation_index {
 	TGU_PRIORITY0,
@@ -80,6 +85,7 @@ enum operation_index {
 	TGU_PRIORITY2,
 	TGU_PRIORITY3,
 	TGU_CONDITION_DECODE,
+	TGU_CONDITION_SELECT,
 };
 
 /* Calculate compare step addresses */
@@ -90,6 +96,9 @@ enum operation_index {
 #define CONDITION_DECODE_STEP(step, decode) \
 	(CONDITION_DECODE_OFFSET + REG_SIZE * decode + STEP_SIZE * step)
 
+#define CONDITION_SELECT_STEP(step, select) \
+	(CONDITION_SELECT_OFFSET + REG_SIZE * select + STEP_SIZE * step)
+
 /*
  * Neutral ('NOT') value for the condition decode registers. This is the
  * driver's default so that, before userspace programs a real decode, an
@@ -109,9 +118,13 @@ enum operation_index {
  *            sysfs writes and flushed to hardware by tgu_enable()
  * @condition_decode: Per-step, per-register decode values staged by sysfs
  *                     writes and flushed to hardware by tgu_enable()
+ * @condition_select: Per-step, per-register select values (including the
+ *                     trailing 'default' next-action register) staged by
+ *                     sysfs writes and flushed to hardware by tgu_enable()
  * @num_reg: Number of priority registers implemented per priority level
  * @num_step: Number of steps implemented
  * @num_condition_decode: Maximum number of condition_decode
+ * @num_condition_select: Maximum number of condition_select
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointer, the lock serialising
@@ -124,9 +137,11 @@ struct tgu_drvdata {
 	bool enabled;
 	unsigned int priority[TGU_MAX_STEPS * MAX_PRIORITY * TGU_MAX_PRIORITY_REGS];
 	unsigned int condition_decode[TGU_MAX_STEPS * TGU_MAX_CONDITION_DECODE];
+	unsigned int condition_select[TGU_MAX_STEPS * TGU_MAX_CONDITION_SELECT];
 	int num_reg;
 	int num_step;
 	int num_condition_decode;
+	int num_condition_select;
 };
 
 #endif
-- 
2.34.1

