Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280968;
	b=G7mmpT8Ox10rK5RaWJ8MjOncWJcAitZvblZobwHcpnOEcM3yI9cISKafmay2odIKRjyB
	 ITPYxzB+qaTSGOtGJ4dC0hf6dzc9FKtstjhG/QGcYmSIarJnn7ImlOKp7S8j2zr0D0+Pr
	 YpJr9nEoD8BDAyWWVEMU1LR4kQhso6rNyBzP6LQa1uzk29NCHzbr5QENt+35L+zWIrwqj
	 C6FLJYJEEpCSNMdEezmbK4SxuoPxExT7fjc5NZU0lUxgRU8PUnFrwgluoWNrj8KhSTBQW
	 LoJbNgVDCJzGXT8Wx6PtCOHzowlqVwgrg1IXNrovqdcxLOKY9gFNnU1LXLRSXp4HRMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280968;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZuqNEpDUlfFbdnNWjZAurd0lzCiaAXeLtHn+BckMIRg=;
	b=ffTIg87PhUPzrFvNrkhzXF7/Yyl2Pi2fZLnST0KZ4vSwnXVissUKfVlhVZxsKG/DtLwg
	 lig/AJrvJ5mcH+GHNLdGYbKYPn56q/QxlybnplKPTLFdGzT92X1984mn7h8q86rXz479h
	 14BVVyBJN9KmMIUFUahMSOitl/Fw7pb18vKB/H2NzFKbyKmrnL70uzO41kuV5qMd0sf/c
	 urtKBIZwymJW5uUVdrVJXTH1U8D07DX8TC3JoMvuDCpjcgg1XYTCuVHDb4+0BtN3/vemZ
	 8yZb467ZMthOIBkM93gGr2BM4WATO2rNUeLT6qPgv7SnBP5AvndbKhp6VdflJDIfJxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y9NeKlJA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dUA2Ozqj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C7360A2610
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:22:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7C7360A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y9NeKlJA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dUA2Ozqj
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0j6uY1850504
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZuqNEpDUlfFbdnNWjZAurd0lzCiaAXeLtHn+BckMIRg=; b=Y9NeKlJArDDZik6u
	i9r+Gc4AC2GlTg+Dgud0mbuq6zicQ2UbTDtbGicesU80GkiWuOk7f8CwJo+CrPD1
	kftSTGmQaC6cTgf/pXCY84uVI1xGqg5Xc5Tdk1JELl1PaINFaPzrvMkJdVNd8tTI
	Ly2xub9qnwbaeyAT1sey7CvkJpP+0S0OEXxvFIC65F2LGEvNTn4RYgCkSxBhrT+4
	N/gZ9DRad6UblyX2S1wxN5mn5FfmDH/DEfvR4O76H9qJrDCRkGkhiLhtgiQf8DHz
	XWTgylQsN+cZqf9oVmvLjNquAH/PxcwXS8yliiL2aJPQIkWKJnFUWrmYxh5vWCgX
	GZ2AuA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5ubt0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:22:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b09a466295so1319588a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794280966; x=1794885766; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZuqNEpDUlfFbdnNWjZAurd0lzCiaAXeLtHn+BckMIRg=;
        b=dUA2OzqjfuPKww139zibdMIN267Zqs6B4SW9713FlkUHfbbHLN/Ug2zQnaxc54n+/t
         Eg7vahXJYSeuin5xtfaXerEewdZwzXTKzP4WkuFk4GzYgSoElkoV4Ua3TaRrbjwPs0it
         OJq3eSmCfqcEY2ML71st/ro9V+PNhUSUzLtvfls6wIjRFI58uXQHrFv3PsZk1gAoLX8j
         a+HGvy8RIJPY+KjdvetbIkR+Wp69SjM+5itJMWBCfJTrC8YSGNNwyFmwriNwYmHFWViP
         VQEwa1CGvgT1T6FRT0RJTLt3UiOJRF86KdXs48bKNH/NrnJLiewyUKTx0D71Khau2yBQ
         H6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280966; x=1794885766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZuqNEpDUlfFbdnNWjZAurd0lzCiaAXeLtHn+BckMIRg=;
        b=x8e9RQz8Y3Qj+/P8ksAcfLPcFARehgTApdZmVUf/W9cukXNvIco5pLWLdNnKcsVymS
         HhZOUixqFShqa1QKaj0z51ySgKaKFG6UGqkyu3adgLGMXwMtOOCV56wYohT4tukCGL7c
         e5/LcQoRM8UU69vp/OVZUc2WFSzAcTI1gkHxAMB2Zu2E6FKkf4pJLfxQSNVato+QhxXs
         ENfO31OTqCrYgyxhlqOxaQdIkvaJJ5S6Ct0NVU5k25WaOwQiYuSnG+tu2zfC0gjAWIT0
         xzm3TaG3OIX6yTguhKoYlUUq7xnpYQcV/2t3ktF0SJnyX5tpHbZAaBQ3E9yLfwyhqD22
         e4Jg==
X-Forwarded-Encrypted: i=1; AL+hErHnP67zoNWfhqs4cPhArq51JbaNpYzY9dyhmQRVx1a92Nmul33NWrGZbSd5CVwx6dgOdsjPkl0FffH/CYM=@vger.kernel.org
X-Gm-Message-State: APuU4Z80PuiDa86lPNTfy6I6VcdlYH1GLWS+18njtXWDSJ908tZHxSuN
	CBnHYwejQaJGnJLGGEoRHAn1fi1M6u3C0bmzrpr4EV7Qr4fFqgPb8lTzfLx4SemRRq6ObYrcB48
	bq23JwcjdizCsJ1Theo54T7PZr1eAa4zkCWGGX2SV2Y611OC0Ymdba6neyFTIgIk1Vbg=
X-Gm-Gg: AYBFou2MCJMkyTC6AY2VCTUi5E8KZHmkLu/vbRuZ/d6ny7Kcj7IAy7htUMw397OpoWz
	8UKlelMu1IRdpL9ACuHXEKdrDJNPug4HsFQuuiPB6Pd8tXK9zoXCKvgRE2EmPG3Tg4nQsxIkWsu
	5pG0qfgsjsdRpReICxeqrdXgfYzLIKiav8uBgmo7dRhtYMGFPxdcSXBm4TSxYjMnxsyTEzFtegq
	IZF8yFRlY1S7NMzMsFHcDDLt65Z0a+Y1fsWc5xViWqgq6WgCu9/BTaCqY2y3yl9g98iXQsPHl/V
	3vjNZlt/6wymXhMjg1lXSCKm2gmdIjcfOxKp/GTH2ZYxx9KhINroKww89JFGpXcfycmBpPU7F0c
	HCYhGeq09K8od4uEsFScj/wp0sa43OI3DkF+2mNJlssTQZGdd655GieiV3hr9Wp0qGVkzHGqG82
	7V5ZiPDPgokP7Mv20dXQxPb/IWE3V+P1D3hW3W
X-Received: by 2002:a17:90b:48d0:b0:3ac:7c52:faeb with SMTP id 98e67ed59e1d1-3b166cd0dfemr1871316a91.41.1794280966207;
        Mon, 09 Nov 2026 19:22:46 -0800 (PST)
X-Received: by 2002:a17:90b:48d0:b0:3ac:7c52:faeb with SMTP id 98e67ed59e1d1-3b166cd0dfemr1871273a91.41.1794280965687;
        Mon, 09 Nov 2026 19:22:45 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16fea4243sm2341a91.14.2026.11.09.19.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:22:44 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:21:27 +0800
Subject: [PATCH v22 5/8] coresight: etr: add a new function to retrieve the
 CTCU device
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
Message-Id: <20261110-enable-byte-cntr-for-ctcu-v22-5-05d48c0eb110@oss.qualcomm.com>
References: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
In-Reply-To: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794280922; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Y/FvSaBbedQq8aKjgsZpsJQaVI9vU9ZVyO2kbtYJAR8=;
 b=V6M7HUx9Kms3500hr5WZuGK8cd06NyCwD55SfWh+pDqabilgAIs6G7iRqWoYD5IMsLKodsx0c
 g6c8d2cIg19D5JiY8rMe9D+/kgU65OIqoDGzzMAuOw5l76/ZxcXBWLu
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfXxmjH90cv1Vvq
 UnpkOsVeXVEm9h2F4nFxIQTkoeua0GoLTHYO/qe2YeQtiv2K9Scs2HmvbqSM7wlRpK41NMaBWY0
 Vy/rP8VXgL8kDddMoeQ0kfa9hjjC4zg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfXzKEeiKecvthQ
 BOxK/kewEXn9u9JtEXTT2s8CaJYoEGHHsT1TEh/4VHDWwHiLnXOjfXdogDlQ2iMWvkUKRRhqkjV
 vxhL/3yDkuIFzftX7CL6zkoqwSLnW7ehLgxoy4Cc+koZX+5NAnxwxju5SqmLqSjpbHgMj04JV34
 NV3FNVygATJ+uhQPa31imqgGIiJ0ZeUd74JydA5oaHTyrCHhsF+X59ZysT6TBzcCv4snIpBEeSW
 8fgZDVlCRY+25nLWu++BmAZEFAhn67oziCnBg6eEO0ntm7KAW6QESlDRU6bpWe58epyhzT/7coI
 ooyWBW7L0daw/CJwqDsnWYEdrEKkqFq2nmMJQJqXh5Dxxo2f62RcHt3BQZ9n73tcvrhm9zhedre
 ZWCv3JKk6OHY0ZKyCr6TLQpPeY4WTNcBetW24cRUXvvpXqL+fg3NcKjAE7WOxs5oQjgJK5xyFUa
 59mLY8wzBvZ2twa43LA==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af28e06 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 5RLBPHW2lgL1o3viiQvUgAQoPIXF6Vx2
X-Proofpoint-GUID: 5RLBPHW2lgL1o3viiQvUgAQoPIXF6Vx2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100013

Add tmc_etr_get_ctcu_device function to find the ptr of the
coresight_device of the CTCU device if the CTCU device is connected to
the TMC ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 5032f5598e15..cc341cdf8d8e 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -865,6 +865,30 @@ tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
 }
 EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
 
+/*
+ * TMC ETR could be connected to a CTCU device, which can provide ATID filter
+ * and byte-cntr service. This is represented by the output port of the TMC
+ * (ETR) connected to the input port of the CTCU.
+ *
+ * Returns	: coresight_device ptr for the CTCU device if a CTCU is found.
+ *		: NULL otherwise.
+ */
+struct coresight_device *
+tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata)
+{
+	struct coresight_device *etr = drvdata->csdev;
+	union coresight_dev_subtype ctcu_subtype = {
+		.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU
+	};
+
+	if (!IS_ENABLED(CONFIG_CORESIGHT_CTCU))
+		return NULL;
+
+	return coresight_find_output_type(etr->pdata, CORESIGHT_DEV_TYPE_HELPER,
+					  ctcu_subtype);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_get_ctcu_device);
+
 static const struct etr_buf_operations *etr_buf_ops[] = {
 	[ETR_MODE_FLAT] = &etr_flat_buf_ops,
 	[ETR_MODE_ETR_SG] = &etr_sg_buf_ops,
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 36c80918958f..2345bdbb0b9d 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -474,6 +474,7 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 }
 
 struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1

