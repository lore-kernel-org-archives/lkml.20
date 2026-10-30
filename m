Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793340103;
	b=OVMwh18ZwJMxsYSvzuorFhFbwstPj/Ggiip+m/oVpMMksRTm3iuV3VFskEPDm2Gn12sG
	 lI+WaqgfzYxPO9oL00bJD+3cucf1iEVwuMBMbRIOGGPl422161Yib1+3ioIOMAMF7/kUn
	 EfAPhSGm5Udkq0TEEL0TU7AiNXtliDH3RzeTGGrlto6Dqk6kIqFy6F8o8F2yCGp0+g9ek
	 rwbaFGUBenTi2M5+m+gBCRUZuueoi9qQFwjohjZ121GQxkTWxTY/QD5fNZUNqv9a5NzE2
	 07GP/F/KED1SRINJf4amikJK0K0kKwK4+IszcmB9tBXpz2lMKy+E7tHeuZ4EbEi4KSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793340103;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=C4m/o41K5fL/YEM2+crvUsuSSJz0c2LF9MIABocLHis=;
	b=yAo+6lzMjmIB4mx3in3ouzeHb7H30vj64isOA+WhvPKQMzFyS7NhkmxqGBDw7zMBJhze
	 /SHYiPWyAIVAaan59F+qpEUhMCDYelnxO08fTj2PJan9rG+3xu7krZ2Cn74DD+2dB8uM9
	 HlMBPMNVfagf02GZkp9Cf5v0pcZv1CEi/QK3kDtBa1H0Jg02zjzgt6X8KuovhuvwzV+Hv
	 aa9jfO06bxWgPF0J1yLkhRl3hCt7U71tZffwpaaIZS59akGJKo9W7qyLg4ShmmgtR5HOV
	 DYVvBdBfrfsb9YcoZb9FjhF7U8Y+u+ajM48FDLyvoRAueu9bs5zSeMJ+bWX1ahPwc9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aYR70t5J;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eL2fxupU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3167A606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3167A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aYR70t5J;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eL2fxupU
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5Exm13312262
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4m/o41K5fL/YEM2+crvUsuSSJz0c2LF9MIABocLHis=; b=aYR70t5JduIjjGKK
	G5+PjIsWekmlPVo13zV0JqgAhuKErTeN826gNYJAI4srNX/dVGIKAmYIBb44cHoV
	KyfINgEFGYRzlsJce/Iti0eMQ1foMfaKd3Z0yDZIQJjezL4UvVtTN8mmTfz33+RG
	gwjI4SX8uCtjW8dt66oBg1FeFNmd146psQ4DFdBh2kTMxf6a6cJa8owg6jqF5BV5
	44Zp2KJqyTBf2DO1K9cw4c7/dXHayNAfnfWAteHq/pdgDkVSk4gGeGt7nkBWIU9u
	CaR9q3bnkBNHaLYZbKpgHq7pLEyqHswcbP0wLw2mxKD8gAVCCocVS6zjJY3xTmnj
	GuqgmQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6rhgma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:01:42 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso442846a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793340102; x=1793944902; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C4m/o41K5fL/YEM2+crvUsuSSJz0c2LF9MIABocLHis=;
        b=eL2fxupUOM1drAujwN+DSROYaMI3fb2CwehHsJARql/LEF4LiWIcVa0FwkbgSYw8/X
         lEaMAa8hXOgo86FXLpMzsmcuUA6Evs4Kpx8fBXwThJTXmk1FQ9jZhF2BNWCR6kPMVEb3
         FcbUasJjJtbB2CWR0liMpDDM9drzqtBbfLtKv6WGk+g6bcEojG57h6L9rTN5J0hY714+
         773DN1amJqaaSIwS1yX+8OJQnGNkIrLktd3bjmf3ejL6CFqWVLy2djkDaX/JItljhVzW
         qyIcLFbubg//B+OqcPsjHD+sxWFwarmKZviAcXpbP7kQ/M91dVD+uM8P/BP2GXai6hLG
         t4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793340102; x=1793944902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C4m/o41K5fL/YEM2+crvUsuSSJz0c2LF9MIABocLHis=;
        b=0c9e3VR2o0grfaU+tEl3gVEvYK7tIg2gxIOrPDfilNLC5lL7czDVFAyzVpSNIEIesC
         IGTLzNRzVVKRXanRnugcMkKn0ExYOO9pCVU21GVWvODJ7ZiDom/MZZ5hB4GWbzC5ii6M
         FKweLyu2NhtECQplmfjt9EoFqoovnLwMX6VN3R+jWCF1TfB8E+0UU10vFZM137IADhV9
         lf7rZ8LppOpjhAWf3g13xUzcJVjeakD60WuxJGzTu5r099D0ubSlf+94fL/JWEYNGZ/y
         k8/GQqrm20GicNi5AOomy6SusCJm4lUkiBRg5yHezvdtDRuFIl/jFKMcfUOIOFkvQADe
         IDmw==
X-Forwarded-Encrypted: i=1; AKwUvBxbhUQGi8OK96mZ/woNUPdY3cgRrdHE0lAIwT6EhkIVv/pkZTHk3mg/QaN2yITWVKU1HIFPJfedMgB+Rug=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmuJu4+9+VnRpzCuZkuUjlw7QlKG6rjnuPXw7fUalC2+m56a1o
	mQhG+pB9ECG1K8AIC1fskGpn7Wa6tDeR8RcIiY6wiIDRUROr070F9ET2pcAJauMCujB4VX7mCfJ
	fBz5ulaiKvzlDvg+m9jBfA0oYDdv5iakAuSmN7/IpInpzHDBKX5V2DR6g5/YfigmId2E=
X-Gm-Gg: AYBFou1DivjNZmw/WRcl8Dwn4P2iXfgwyRxoIdmLznOxuzTbBWcDX7Gnvw1Pr3sKqiV
	6O5+gpTeYvSOayLTgdamdRH9EzfBBRK2bUltF707AUEi9P5ItSf8e4dC7yZACNGDALgFv5DsJL0
	0497D/OfEgpg0xB/K4A+ooCRNV9NAQEWni5K7NcTBGwuTQfP3vOP7+aG0d3eoMtpATJL/6Qk9Gk
	PMlkxwgVnz0JEcJqlvR5eFBuvsJPc+3of2/verqoWEyo8CS9g5OlNORGkkrRekhvF8tpB83xo5H
	ZPVMNRJnvalULy9jiVl/eqPSVmMPxpyjtblnZ73Rhf+gFRBJjgQWGuEZMt7+jC+WGK3CJGcOJb9
	SE7dA+fxtzVFBBy9bm4GJY00DTzLxZe2jtJU8/ie84Bc3YYHx29Q7GkNDSpDGgCZQqyO0aE4IXh
	C1cOuc7+4gJ1BZRRoDjzwhdVl4eG1N+BjhQXSE
X-Received: by 2002:a05:6300:49:b0:3de:7dd6:ff8f with SMTP id adf61e73a8af0-3e928a07d14mr1355918637.50.1793340101756;
        Thu, 29 Oct 2026 23:01:41 -0700 (PDT)
X-Received: by 2002:a05:6300:49:b0:3de:7dd6:ff8f with SMTP id adf61e73a8af0-3e928a07d14mr1355893637.50.1793340101300;
        Thu, 29 Oct 2026 23:01:41 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09706f01sm252292a12.20.2026.10.29.23.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:01:40 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:00:27 +0800
Subject: [PATCH v20 3/7] coresight: tmc: introduce tmc_sysfs_ops to wrap
 sysfs read operations
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
Message-Id: <20261030-enable-byte-cntr-for-ctcu-v20-3-bd5c3ac9f916@oss.qualcomm.com>
References: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
In-Reply-To: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
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
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793340076; l=5200;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=tijaxrXD7Cb53GGSRhRGBOVQmb2AQTa3/Hi3VM9v7z0=;
 b=lcngeArK+hG1HE06QC4drcK1PNcAswiCJ2SXbCLp9OlqC78DzI/2TEz7Ri65PNIFWhwa9GhsR
 vWpbYYov41RBSFEu0fHHTijKJIDfJdQCcRv37gOuFV4U6Moqa3kcLpt
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: -9fZLnkYUar55UF2KFIlC4bxR-Fe-IaA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfX/eIqi3dL6i1g
 5YnGc+tySelPbGQ5cMmG59nJzYwucnANq/WxcdTe8ogFZlboE9B1qV6MmNtS4OBWgv2wKeHgkdE
 3JrINJ/GvUX6A1xIhOqDhPmpsfA/CYc=
X-Authority-Analysis: v=2.4 cv=PIqaavqC c=1 sm=1 tr=0 ts=6ae432c6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfXx4RVnEWRudV9
 UxGLarkXndYba4NnGkw/kGgHb3x8wQ3ird/m7xryMRBSqQF6qTWSelWrjN/y7XWAm4YLz9sI6eI
 I8/edOKVb7LNPYcSSjJJe1KW77F51TKadmjg7Q8X9AjSlnFRnfZ0QTQpkMxDvW5FzSWqcZPxZEu
 KjLWQfDTiP3obIcxThNlC+P2+xDKCDwLK6zZBSFhYgh+4zBvvRO2dKjVqb3oGiJY/GKJ3bXbLb/
 XwGpy/oL9xArHXKsBk7pBUfcUBg66c6rtB6f9vMO0vTXigN4qQ5ha+6kmEyuJIiN5+S1iuPpvgO
 4YNswfLPkvoAl1RBZHCZSC1EUQlY7A2NwX75s37y3JMWOf5p0fDObMxrOwbwIRU17HkKmcjX+N/
 ZC9yJNavzyDF0rcTZ5wLZv4Qn20vpvrLzFe9F7d42AcNSuTp8yltinIBlN4GpVTlammmD1f847H
 /bfsESB6Id2ColHDeiA==
X-Proofpoint-GUID: -9fZLnkYUar55UF2KFIlC4bxR-Fe-IaA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300023

Introduce tmc_sysfs_ops as a wrapper, wrap sysfs read operations,
for reading trace data from the TMC buffer.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 51 ++++++++++--------------
 drivers/hwtracing/coresight/coresight-tmc.h      | 15 +++++++
 2 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bc7dd676da47..4b40b692be4d 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -228,17 +228,10 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_prepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_prepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_prepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
@@ -250,17 +243,10 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_unprepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_unprepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_unprepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
@@ -287,15 +273,7 @@ static int tmc_open(struct inode *inode, struct file *file)
 static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
 				   char **bufpp)
 {
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
-	case TMC_CONFIG_TYPE_ETR:
-		return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
-	}
-
-	return -EINVAL;
+	return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
 }
 
 static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
@@ -764,6 +742,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
 			"Valid crash tracedata found\n");
 }
 
+static const struct tmc_sysfs_ops etb_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etb,
+	.read_unprepare	= tmc_read_unprepare_etb,
+	.get_trace_data	= tmc_etb_get_sysfs_trace,
+};
+
+static const struct tmc_sysfs_ops etr_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etr,
+	.read_unprepare	= tmc_read_unprepare_etr,
+	.get_trace_data	= tmc_etr_get_sysfs_trace,
+};
+
 static int __tmc_probe(struct device *dev, struct resource *res)
 {
 	int ret = 0;
@@ -823,6 +813,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
 		desc.ops = &tmc_etb_cs_ops;
 		dev_list = "tmc_etb";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETR:
 		desc.groups = coresight_etr_groups;
@@ -835,6 +826,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = "tmc_etr";
+		drvdata->sysfs_ops = &etr_sysfs_ops;
 		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
@@ -844,6 +836,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
 		desc.ops = &tmc_etf_cs_ops;
 		dev_list = "tmc_etf";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	default:
 		pr_err("%s: Unsupported TMC config\n", desc.name);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 6e994678f926..a14645b04624 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -259,6 +259,7 @@ struct etr_buf_node {
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
+ * @sysfs_ops:	Read operations for the sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -290,6 +291,20 @@ struct tmc_drvdata {
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
 	struct list_head        etr_buf_list;
+	const struct tmc_sysfs_ops	*sysfs_ops;
+};
+
+/**
+ * struct tmc_sysfs_ops - read operations for TMC and its helper devices
+ * @read_prepare:	prepare operation.
+ * @read_unprepare:	unprepare operation.
+ * @get_trace_data:	read operation.
+ */
+struct tmc_sysfs_ops {
+	int (*read_prepare)(struct tmc_drvdata *drvdata);
+	int (*read_unprepare)(struct tmc_drvdata *drvdata);
+	ssize_t (*get_trace_data)(struct tmc_drvdata *drvdata, loff_t pos,
+				  size_t len, char **bufpp);
 };
 
 struct etr_buf_operations {

-- 
2.34.1

