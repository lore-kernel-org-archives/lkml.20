Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900833;
	b=sBPk4o4Pq0B3Y7EZ4cMW1SKQ7GaMMzlm+ECRqpJBbU56Hpc3vxP23PnQ1IW7BvxpeDGs
	 o7CS5dv9vwtFfNOAyIp89/SvsAcVX5THfeDJy1/9Uo5bdX+/tB3PbwWQxtyu3g2piIt1p
	 qEzCCHFafxHJ8nwk+jbGeNr3l8e2pH3d1FH07lYCL8/sNgwgcVgCi2me9u5pE2gdxCA6s
	 qawXDaed0iXyPwF0h7FuqF3BDTilp/qj1TbidlMP6XOD02ULCnEPjHN71BZrsEKHAVSl+
	 GJd/fWojbduen2fKIOrcaVZ3ZXFfQqGpgLiFr6cvSfSMjQ+PmcdZTfsS76Y+FKAazhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900833;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uh9/rQpnzRZH9grYVCaP61T9t+zi/VROGrqzsiH9p6s=;
	b=ciSWGbln4ef38mfYISU7EK4V/n3kqKIxP4YTkJxaNMsMHwi0QiQT30QQc8WWceI+G7VQ
	 sVV3et75gcrV4jiHHV9wWruLeb39FCxgz+B+j4PY1XJo97Srz9jQLIzmElJ8a+KRIosJn
	 AQ8KFPe5eHOOvNHHycR/EyKvFnQUdlFKUXTRKG78dtyL5cxAeBewa3fdknwxZgmmnEK2r
	 JM8yE5+/d+lL1ju2vp0e5u/GtQVIFsbEvCeeWvmHZEcBowg9xNHJDWyGVHAHPSY3b57Bk
	 yAubf5A6zwtGN6BwYoB3lvV6crqGOTUDkWqS3jHlW1Y+hmUxP+UTxwy6AKxS4O4HgIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DgkpCPNC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YCXd8VDz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A1D606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:33:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8A1D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DgkpCPNC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YCXd8VDz
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aNMC2935297
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:33:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uh9/rQpnzRZ
	H9grYVCaP61T9t+zi/VROGrqzsiH9p6s=; b=DgkpCPNCdcWirO97Rv5pNEhvLqi
	CgtRA5K2Y7iXLqNSGYDsGI/+YSWbml4iPo56jLe783wCd1EMiLdyrJQmClTe051y
	MzVzF2NV6LJRjENO3wdz5/FAANrIPG740UzLJC6HcESXaNLbiNloCdP4OBIZruf+
	ZBrBQv3DmEhVz8D4HVv0OZI+tBGRQ80L8+k2IVHBhR3wYhZ9q95iaWKkbBfm7ZL6
	AobhrNtiZ1EBiegxn5876a7ThYf12lCbp+nfCd6lXmdj1YomcQjbEWcyzU55ASGF
	dAioYC9gg3m9pUIxuwAh8NVgrrob+xSRvnyCFsv0E+JgIz9FyEhd0uPZzvQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09m09wkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:33:51 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-862cfd7092bso1122873a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794900831; x=1795505631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uh9/rQpnzRZH9grYVCaP61T9t+zi/VROGrqzsiH9p6s=;
        b=YCXd8VDz9FRsDYhoeZ8kDfAr4Pwsarfb8yyqI4Ap46NBLTbg3Te+fcGfj74ls9ffI1
         CrSOc4o3QwktTtch4IFYMp3SI7LqhmAagSLYSulpNVZnDchtwHIjnvj/66oGs8SuI6FU
         5SVKuCdeq4iUkukRPL9OWPdMM07oC9FPbCBJUx3/AEM6yHhTr+HDfaBJdkkDaDM3KQw8
         YSJaKmCe656WLBNarI8uzJIK1bvcprgkf1PycTqye94XocRFrTm7Y7oHHf15I5ClBt68
         PZDct35J6QRqdDltubmGOTp5W5OvZYePjWlluOJk0h0KHrQrWRKQBGBG1L7T5QQBqWwk
         VWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794900831; x=1795505631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uh9/rQpnzRZH9grYVCaP61T9t+zi/VROGrqzsiH9p6s=;
        b=C3Zfu5+i4e3VzSNCKWYJ19VRnWCvAzPIr6FsNAlJh0FZXFsjycG+j4pwIxQrim1nno
         5IId4jnG/6zVFyfj7/peqOddQ9J+uwi+oeUB5ubzaJzpbfoBti/g0S07sf9B0Zt14uzt
         PPlmHXbUA9vdLzSfxmoeskDb/+5yYhAvjQMVyzbFzp5OMn6u+iLk9s8yrwLTT1wS6dNL
         nU8RPgQvdmpHFR8cMJMyDY8klcp4x/UVlDrHwRkgZITqP1OtohsMR5GnuvDH5vlaYO+t
         Pcj/ZW9VAg/9W4O0jATXaqpebfUpJHm6pUbBtCr+XRkpQOfQEzjpqx5PurDElLjcHcEO
         YGPw==
X-Forwarded-Encrypted: i=1; AL+hErFyAJFMZi0hBcAq+XaZYF99AS9+J83JXMLZcuQSr+tuD4ZSMIjrYn6A+J/f4zd/ayCm5CKqamhnE/AoCuM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tTO57B/+qyo85+IfoFRsqB0spwRIrWV4UtpwFUgNM4KgiD1S/
	ANZ/E5rhNyjfPo0mMUvKHoJVBQz8HYfX9mMe2XBWhu36ZokzbYrjAB9uvBrOwEZ+OtmjObNssYM
	mVioAG2s+4XP7HlPzNPUn/ZheggU/BOvEjzJGCqaWXxqWzDf4IVay4hnobJReTNGHqDUeeePi9J
	cmyg==
X-Gm-Gg: AYBFou1Qa1/7hhxdlgdcQjdwt5beKMAyTzjHfLvEY/kyH8s0MuQoIX+VUIGnwZZLz1n
	1HzePc9CKH+X8nekcsJJVcxTma0J+DuE+odAeBIQe3mrNy5ZnEgdOfTJAcTfmnlREhYlrVEkYeT
	aN7/spqi3C5TvkYWbmB72O5vW9X1FPdf1dpkGg+L2dPd+UtG0MvMLKfIbvSQsIHb6c58pH0XBSF
	U1X7xwcXfo3w+nl9vAWC45eMss7zmK5M/Jx6jGfRSJvY4RCgE/gBjDOD/Nu0jVAKZsum6VPTgJT
	cVlDfhtwbozne0E7/zszFgIwnmqzZCGiuIhTkit15hIetWl1nGLEzdqsgMvWFUSfWQr0aVujTCb
	9oF3wWZq9lSvZsHaUMFiZrZ7bXBdYykeX/5bQZDdeJd0KiBuzCQmmR6PAaVkuoIaL6H5qB07UKF
	qPl4kRP+jVZy49O/ay1Cp5xcw5N0AEYvxd/g==
X-Received: by 2002:a05:6830:25c6:b0:862:bda5:b88b with SMTP id 46e09a7af769-862bda5c594mr6102166a34.21.1794900830841;
        Mon, 16 Nov 2026 23:33:50 -0800 (PST)
X-Received: by 2002:a05:6830:25c6:b0:862:bda5:b88b with SMTP id 46e09a7af769-862bda5c594mr6102143a34.21.1794900830360;
        Mon, 16 Nov 2026 23:33:50 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862c67db8basm4944508a34.13.2026.11.16.23.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:33:49 -0800 (PST)
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
Subject: [PATCH v19 6/8] qcom-tgu: Add support to configure next action
Date: Tue, 17 Nov 2026 15:33:03 +0800
Message-Id: <20261117073305.3854951-7-songwei.chai@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX3EPzjHoZjvzM
 jl0fMZnNRzc2h4jaPL/HAgXgYd6mAjr95ZXFZb5OqOxHwmTTx8cvId/cPuC4GEA7VKvMuaRp0bL
 qMRx85o5/4vaG+VC7AdL0XtkPQ5YzWU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX5jkLjIGzh5zF
 5O0cJvM6fo8F31+a8hFAtFDgY2uCU9mG1Hj/PoTD5cZlU3+QUkJHisd4+5a4VVmCk2ZjAl3jrt3
 cyMSK6njMpX3dmu0lRvv6j7V0vz0O2vquGWDgBApBHBMaYBO/VrxFrLhMzmvzSMVKQ/158vU48X
 ga1nRmH68vXc092rMgfVb9WmXpFZy3jLbiFQpromqZe67odwSQRQXqGI5uODxsl1bTtYUNEy0TB
 SfpjGapOU/dbb24R/D3X776mi+g0os253IpEa0FbPUAPAp9Prxc7JbCOI31C8ZuMCLWkw2YryNG
 6IK0KifroheQcUTGis1H1P1bk0fMoMqh2XAuKKKgvC78XhfYOfZ6okPhvtxeQPtzO3UrXeAzAwl
 Y1XqkBtokw9/mhywOsuBEnTidbK9u7E5LMqeiBOAAWxmII3o4RsuQPzLquoNDxOhPdq/y9yisC/
 iSLjiAaO1Ni/4OgCvSw==
X-Proofpoint-GUID: Qzs6-PVRa5dlFEkEx9kNF5_OQtwrKr5V
X-Proofpoint-ORIG-GUID: Qzs6-PVRa5dlFEkEx9kNF5_OQtwrKr5V
X-Authority-Analysis: v=2.4 cv=F7rC5ahN c=1 sm=1 tr=0 ts=6afc035f cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Kr544KC8-TckwPajLNgA:9 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170029

Add "select" node for each step to determine if another step is taken,
trigger(s) are generated, counters/timers incremented/decremented, etc.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    | 16 +++
 drivers/hwtracing/qcom/tgu.c                  | 97 ++++++++++++++++++-
 drivers/hwtracing/qcom/tgu.h                  | 21 +++-
 3 files changed, 132 insertions(+), 2 deletions(-)

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
index 5562b3d83ff9..dc4e60380565 100644
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
@@ -80,6 +102,9 @@ static ssize_t tgu_dataset_show(struct device *dev,
 	case TGU_CONDITION_DECODE:
 		return sysfs_emit(buf, "0x%x\n",
 				drvdata->condition_decode[index]);
+	case TGU_CONDITION_SELECT:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->condition_select[index]);
 	default:
 		break;
 	}
@@ -121,6 +146,10 @@ static ssize_t tgu_dataset_store(struct device *dev,
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
@@ -159,6 +188,17 @@ static umode_t tgu_node_visible(struct kobject *kobject,
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
@@ -197,6 +237,18 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 				drvdata->base + CONDITION_DECODE_OFFSET(i, j));
 		}
 	}
+
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_condition_select; j++) {
+			index = calculate_array_location(drvdata, i,
+						TGU_CONDITION_SELECT, j);
+			if (index == -EINVAL)
+				goto exit;
+
+			writel(drvdata->condition_select[index],
+				drvdata->base + CONDITION_SELECT_OFFSET(i, j));
+		}
+	}
 	/* Enable TGU to program the triggers */
 	writel(1, drvdata->base + TGU_CONTROL);
 exit:
@@ -206,7 +258,8 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 
 static void tgu_set_dev_caps(struct tgu_drvdata *drvdata)
 {
-	int num_sense_input, num_prio_regs, num_step, num_condition_decode;
+	int num_sense_input, num_prio_regs, num_step;
+	int num_condition_decode, num_condition_select;
 	u32 devid;
 
 	devid = readl(drvdata->base + CORESIGHT_DEVID);
@@ -244,6 +297,17 @@ static void tgu_set_dev_caps(struct tgu_drvdata *drvdata)
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
@@ -400,6 +464,29 @@ static const struct attribute_group tgu_common_grp = {
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
@@ -442,6 +529,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
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
index 1dd99db09f39..b51bc47637e5 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -54,6 +54,8 @@
 
 #define CONDITION_DECODE_BASE	0x0010
 
+#define CONDITION_SELECT_BASE	0x0020
+
 #define REG_SIZE		0x4
 
 #define STEP_OFFSET(s)		(STEP0_BASE + STEP_SIZE * (s))
@@ -67,6 +69,8 @@
  *   TGU_MAX_STEPS         matches the static step0..step7 sysfs tables.
  *   TGU_MAX_PRIORITY_REGS matches the static reg0..reg23 sysfs tables.
  *   TGU_MAX_CONDITION_DECODE decode region 0x50..0x5F holds 4 u32 registers
+ *   TGU_MAX_CONDITION_SELECT select region 0x60..0x73 holds 5 u32 registers
+ *                            (the last one being the 'default' next-action)
  *
  * Each priority level's block spans a full PRIORITY_SIZE (0x60 bytes),
  * i.e. PRIORITY_SIZE / REG_SIZE = 24 registers, all of them implemented.
@@ -75,6 +79,7 @@
 #define TGU_MAX_STEPS                  8
 #define TGU_MAX_PRIORITY_REGS          24
 #define TGU_MAX_CONDITION_DECODE       4
+#define TGU_MAX_CONDITION_SELECT       5
 
 /* Maximum priority that TGU supports */
 #define TGU_MAX_PRIORITY               4
@@ -85,10 +90,14 @@
 #define TGU_MAX_CONDITION_DECODE_SIZE \
 	(TGU_MAX_STEPS * TGU_MAX_CONDITION_DECODE)
 
+#define TGU_MAX_CONDITION_SELECT_SIZE \
+	(TGU_MAX_STEPS * TGU_MAX_CONDITION_SELECT)
+
 /*
  * Values for struct tgu_attribute.operation_index: TGU_PRIORITY0..
  * TGU_PRIORITY3 select a priority level, TGU_CONDITION_DECODE selects the
- * condition decode registers instead.
+ * condition decode registers, and TGU_CONDITION_SELECT selects the
+ * condition select registers.
  */
 enum operation_index {
 	TGU_PRIORITY0,
@@ -96,6 +105,7 @@ enum operation_index {
 	TGU_PRIORITY2,
 	TGU_PRIORITY3,
 	TGU_CONDITION_DECODE,
+	TGU_CONDITION_SELECT,
 };
 
 /* Calculate compare step addresses */
@@ -105,6 +115,9 @@ enum operation_index {
 #define CONDITION_DECODE_OFFSET(step, decode) \
 	(STEP_OFFSET(step) + CONDITION_DECODE_BASE + REG_SIZE * (decode))
 
+#define CONDITION_SELECT_OFFSET(step, select) \
+	(STEP_OFFSET(step) + CONDITION_SELECT_BASE + REG_SIZE * (select))
+
 /*
  * Neutral ('NOT') value for the condition decode registers. This is the
  * driver's default so that, before userspace programs a real decode, an
@@ -124,9 +137,13 @@ enum operation_index {
  *            sysfs writes and flushed to hardware by tgu_enable()
  * @condition_decode: Per-step, per-register decode values staged by sysfs
  *                     writes and flushed to hardware by tgu_enable()
+ * @condition_select: Per-step, per-register select values (including the
+ *                     trailing 'default' next-action register) staged by
+ *                     sysfs writes and flushed to hardware by tgu_enable()
  * @num_prio_regs: Number of priority registers implemented per priority level
  * @num_step: Number of steps implemented
  * @num_condition_decode: Maximum number of condition_decode
+ * @num_condition_select: Maximum number of condition_select
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointer, the lock serialising
@@ -139,9 +156,11 @@ struct tgu_drvdata {
 	bool enabled;
 	unsigned int priority[TGU_MAX_PRIORITY_REG_SIZE];
 	unsigned int condition_decode[TGU_MAX_CONDITION_DECODE_SIZE];
+	unsigned int condition_select[TGU_MAX_CONDITION_SELECT_SIZE];
 	int num_prio_regs;
 	int num_step;
 	int num_condition_decode;
+	int num_condition_select;
 };
 
 #endif
-- 
2.34.1

