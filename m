Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538293;
	b=PXVCDDL6+BlX0i2r28zmx+excVJnzo1CmnUVtiuqVes2C+1zVnup2MsYJfUTyIWhHWfR
	 DDqZ1UoZwJ+WFECddmVhjl8Ieu3zAcLkJKp+gP5Xhw4XBA4Nhzr8YQ4jYl7tEJue5c96u
	 3EtbQJFp9UZoqAbKzIPwJsChqqpzyy4/K/6LzUSVvbYBn1Gh+m5sk4C8NA5T8YQyEbTK7
	 UXsZXjOynR6aSVXgP7PmuA0dmlakJmtpQ/lXf1uwuh9L0ozAURhIVRJQ+5hSU2gu6/6eU
	 HbFg0H5MTr920d1CDubgXWHOPrjk5VdwrSEkokzgqnXSYXQYSUO4HHNjfEK0ZZiMHCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538293;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rl36cw1gVFmGoZtYXMSAEWqDAzA+HL3XtZTbip9gbU0=;
	b=mBRKAwRIZc6PBUyZRZh2L0bLqmvX2QVt2XZEJa/DEumWp3RQ0fp3fM4mMKIZuV1IfNWw
	 dgXXc4w3R1UQDNzUrA6XSAyiU6rluL08fVVkDxT/Y3wxct6mDcAJPAc2G8pc2lNP6gnL6
	 GUkDmIDVRZxawrhjIFzeTdeDbk4zKc7mLN6qyB7lCDP3eSpHtKGSM5lOdGhedUmFQ2zOX
	 a4DteoVJ83ymFRWQGSMnESfiTAJzn9tdwz3QDIlKXAc4MlbZRwW0O2apJXD7YfoFRoFS1
	 GApBnO82UonzJHgTrLZyOYuVX2bsHeOonfzZUF9LkcznxB7i6VL5TMkQXuOtuEfQsNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WLr8dNE0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TXLP7wxz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60661606A8AC
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60661606A8AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WLr8dNE0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TXLP7wxz
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2K4Bi2179665
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:51:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rl36cw1gVFm
	GoZtYXMSAEWqDAzA+HL3XtZTbip9gbU0=; b=WLr8dNE0PyxDcJgqBfZ4fxM70bn
	WnD96xYibeCONIquYtt4FWkST/92PZcF/aTc51rRiKW4UIhwDOYgKPmfo+x452I/
	k0KQ8nCDMLlw2UbLo+As4qMquUDfe4WRdS/7dAbSpcmgIXM1AUyOWJjSOgGnMgQ0
	oTZktTZG5oOjIPp9gqEkVNzScK/9G63ko0dsIVZjaW/yuWGPNNvUTt6ThchPgQYP
	zDWvGi4+jhkwrSr0ZIT0dNsmXs7xwzXMSzMuG8pwCkYT1q2ilwZTWsvXrPG3oGAi
	FwVogRKKaQJDRU8eXCecaTEOEDUU7bx4cYfIwOKCZTuOmHNL0RdbYUfCSUQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yum9rm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:51:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eaae62796dso4660685ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794538292; x=1795143092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rl36cw1gVFmGoZtYXMSAEWqDAzA+HL3XtZTbip9gbU0=;
        b=TXLP7wxzqesEQLw7PssTMSl9KjlrOxQzdeq2QeUf49i162XpZkBjWFFnWk4wsSzY55
         WheSJ58FhIDMka8jzUolmsYCsYASPlTK5oxvutHFjubFl8wAZv6Uryu4bcYti9PcVg/c
         H8b/p3FySMH9x8he5Zu94fYCKCux4GDzh6rNjX5W8IhrZwo9ffXzegqR/S5x+eLzyMSL
         xnH26NycDaVgUFbfsdA5zQzJe5OROmlpJ/HVVAgXUrkUpqrFCS9BT7LpvRp98YiMUEl4
         dEMa61+hWCwWzKgrBluoGEqW0ig7SZDL2Hkjm+HckxW42mcRxkR/uD9nPQLI25uLTHmV
         DqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538292; x=1795143092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rl36cw1gVFmGoZtYXMSAEWqDAzA+HL3XtZTbip9gbU0=;
        b=u5oy5gJ3QzBFwqn4kGo0+AZgtn5ADEu7H6SdQighhyU3LC8p+k0q3w+6gk/ux6t7tN
         gDoo0HPkcWWwOTb484tVVk1QTqGTbgpDUo05I6bLSsg6NF0kQQfmZHl5ViTq0XiNI9aX
         1Bp2BTgKKUMVvNeoWhrdqv02LVIupy8Drz0Hh6KweXL4CzHx85GlkL+Zdm+ZY9mdexX+
         K6+HXgu00TdxvrCdDfhXEWBtxu7JEDSBnTfi2enSnwmNC9mcBM/XEfjb6GPyccv+nCQx
         WKbUg99/F23IbDt1aieEotTyeVqHh5HdNaMNAO9zHpylGIcIxbf1mX5n7QG4YFhdjIf7
         BmOA==
X-Forwarded-Encrypted: i=1; AL+hErHUqC0rWIAKxVHLDFvM1q6z7haqjKlI9rgJ0L9d3b0THhsk+MHFeyn70hBRD9ZZ//8BySCsNCu4oOYHeLE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8bnaTGjT/L0fizx2GD5mqm/yn/OVoHltxOQpy6yrhzXCS5tvq
	jyDXnupM+9WrnJgUc+z8VwGhOJt/EgUQXE2LUEQ0b7LdxKVP/MgaTiiOrfLhwZwzzAN1pH3OXKt
	O/hju7BClvF5e/Iy5Ujo38agz2FASm1E+VP0Gy0JKV8nL7aocSh8lyADKn8MfeEkexoI=
X-Gm-Gg: AYBFou28edPoHHZYDG0e56I5YlFO3Z9QI+DcPwWyOw8Z2pgJaSsNAZt260d0tZjlB9D
	GPZBzukg6uUggSSmORhZ/KQbWs1ie/kIDFQARRd+PIjRSAWu/1xauLwMmxHA9/PQxoSq2xfAyOm
	my6hRRdlB2kMctV1bPUJK4PrZvsjs0V6vR1Un6renRBk1Xirn6CPDLqLI+RKVQTtGIfPoWUOBzw
	QHj2RKHnuW0lG1zYoW++yUVHDpbh39WiNq7StRsgTiCHRFkVCNFg9xhtCIpn/cA8rF/v6snVz/a
	L47LpSD4KygYdsiVBfV6vbW10hOo2rd6sL3hRq+VMA60pameXm7X7YUsiipxyWJ1YpnA+zRnF7H
	41+S0tDEIo5atqcYsVVEYpWJxZMU/5P6F4yhpXl5CNfj9k59gwaWQ/6ez04a/csyXD/+/L7WYKR
	RgiZUGUnc=
X-Received: by 2002:a17:902:d4ce:b0:2ea:fb8b:258d with SMTP id d9443c01a7336-2ee0d66007dmr11694705ad.6.1794538291863;
        Thu, 12 Nov 2026 18:51:31 -0800 (PST)
X-Received: by 2002:a17:902:d4ce:b0:2ea:fb8b:258d with SMTP id d9443c01a7336-2ee0d66007dmr11694345ad.6.1794538291262;
        Thu, 12 Nov 2026 18:51:31 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0fa0b3c6sm3044435ad.68.2026.11.12.18.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:51:30 -0800 (PST)
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
Subject: [PATCH v17 07/10] qcom-tgu: Add support to configure next action
Date: Fri, 13 Nov 2026 10:49:32 +0800
Message-Id: <20261113024935.3173715-8-songwei.chai@oss.qualcomm.com>
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
X-Proofpoint-GUID: npKHajcNqfOeZLrhRbyv5aWt-BCuRgVR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX0VTAZxyV81Go
 zsGEq+abv3703UkZqhja+E2jHDuOxaDJqs3CUTqXaNuORCZLTN1aLq20X+YMoSfUtuJchE/dbTm
 WjOC8ph5j/kmc3ENuu2PMtZHHSpTC8Y=
X-Proofpoint-ORIG-GUID: npKHajcNqfOeZLrhRbyv5aWt-BCuRgVR
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af67b34 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=WxrQkracP7FNNSUBJ2YA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX6qOxR7YgggKX
 wgoWCR0lRh86f4SnySDPd/p7K0S+hyzLt/LONFgfGLc7Ng8kK2j18lG/PFawvj5g89+GGt+xaYo
 5UQ/2ndxCNtnFy/+7bR2YIuvdY+47yIgQiAxpOuGaHwKgiqWyV2LvrapDM6iHz1KvdhEPWo0+2P
 MASzdt4UAZjQdlQOog5a6vFqyZX1vTquBO55AfPQ9o+pddmbATi3WJCrZxkoH5kPLzEl0P68Hhs
 Nw0SbXW222Rymqwl8juQCy9QbezV6z2BlMhGI1VpsuhTBUIxgs0uEb1uzhoqjXVGbhPUkRfCwOw
 1uDX4vRomLtbma2F8XGFbTIDF1n/ySKDKquXLBxK1SGLEp89GqzlDpOwBW8dgrNg6B5TyS2zZXU
 9zXg3b0+ZNHB+E7MzgE4SnsujUwAeiQudwP3U6OqwKXc2CE4UdUDJDeIqPmfCPwxDwmPtMaR/uS
 8mQRmB0Nt9LRGOcKKog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130010

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
index b94da9497243..f487881b7def 100644
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
index 72b98a96d7f2..6e66752a7b8d 100644
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
@@ -409,6 +473,29 @@ static const struct attribute_group tgu_common_grp = {
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
@@ -451,6 +538,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
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

