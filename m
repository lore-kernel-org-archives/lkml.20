Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280962;
	b=nDqIDMyLeVpVLz2/DKUXP8z1gH5QJtaRzhRyYuh8Wo37kknsJqSN7JjKswhSXyBDKfaa
	 aBjmYkJ+k1Z7n3tIAwH7BsTCZSGJkq6m54QsGZcQDXbaPMeTpA5TwC00sfZZhM7LatHAq
	 SE6jPH8MOXjwmJ0IdM+UW37ZXlqJCJMbPVuUd3nqNUBpe5PCxdRkcxIqebEBXEyaTZz/w
	 5nKWFcpU/L0ISCUVU2alr6PcaJWm9k/2WuKHYpFTul8AAIhlhwtnO9RLFmnGsrJ9icfoL
	 w9Lp2f3PkSsgmQsppD2Ksp2u99CVWm3Q9vDNzDiXae2KU2G8lffROp8sjlQIf9MTrhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280962;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=;
	b=aB84JZne6i3GNtbW9GCW3ZUOawJDx6pEOee9GYIS4vRizkPNEONnk7xXOpYVxHi8VwvR
	 WtkorLFFspklKMS+/dxPC3fkoOx+kbb1QY/XewYwtdULAaggzKUKuiZ1LiwPtFrWKFeBe
	 4k9PJGHNIPDDKsa30sp641zY5k6cmGDqEAryxwrhHySDM/qsBX4V/YuZtezs6AhfE+0Fr
	 2hh+jXovSUUMDNlgzOSHwe478jNokxlthFHl9enVeod+I/frbOSAFJONsW5gKA87Qb+Gl
	 ClC8LJylupjmv44IxqCzge/1A41QtcWgzVM24IA1idrqvGc52K0sZlNsp8qurMK8AzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Po4jOEZc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QndX910H;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EB660A2606
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:22:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74EB660A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Po4jOEZc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QndX910H
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0jF8p764491
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=; b=Po4jOEZcBUQbQeze
	GcJKCdD8Vk2MttFayOzP/2XrF34DaUEekOMLcs376n97OS2CLeT+X7yJE5YO3uxs
	Et+Pnmd9rqms35GCdxAS2OGpVdTAXNvXeVfcx3zBAX20I9vVQYBePeqLSw8sTnwV
	G+kN3lIFclZyEmcNgLgIE334Tup6oMIdlIiXOselYyo4uz2xTpTutE62q3ujXtVD
	9MqscxJBerS3erquUxCWkjqgFGgWmp/u3HIdUi52L0rmIEAkPsOfz059TVGnGolG
	MGxXEVlZsbVK3wwkPSnQGayB9POB9L0JurjHBqEpxKhjA2A7ssGEMXbzRd8VqCmQ
	07/0AA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkh59q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:22:41 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdb8931aeeaso883239a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794280960; x=1794885760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=;
        b=QndX910Hrkv47KV8ZVLkaYJd1ZYfCgfJH4GeHTNdOii5yXgleazqAtdevkO4y03313
         fxacqv9n1hw7VI/mEkcdSqypUBAjLF3VfhHkyqV3beY32haXpMiRX1SNbAgPum3zgCgK
         aOvHYbymSudykCybxKAnGLsz13nM7kLiTd3J4LmXLgNADZa8b1bWS45PElm9uf3G0A8j
         nSL+u2Sz3c1am/EIBoFBBaBFiGJyvnhftxZUcEsjdJmccN7LYHIi7ulHLRiLGVPspgop
         xY3gvk2xeBzrNWzPlpj8ggXJ2tKTkpPHxcyuZlpVwOsjDMO8ju0E6dFHOudvw+PCfdTB
         KrqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280960; x=1794885760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=;
        b=MLJ7331S2v4RtzuqtESxj2U9qq1Q/HuDt/SggFPRHZbJJb7fl5dAtMYY18kD1gdozT
         VYLLB9A4rSPGLvh5Z288L3qq2rZyJO4Zn4WLrYdV5HOHSCBa6+2GpdAghdBuw759Wq9Q
         zR2AJp6fheV5ME1JvljHLhupesKV2Ws6YMhT+dtvcyY/esLzUNXFWOUGdRQZxH0+WxVM
         hYB0x4ika6OYT7wx+tqXqOZ6qGGePgRnuerocu96AJDHLrx4cOYWYzOWfmjbb2NJJm2W
         vCZpbNwry6tU5bvL3eDkM8cpn5u8G9EgRi74KDHBZOj5H2OY7vKkkoNNz9tAsEYdnley
         ANuw==
X-Forwarded-Encrypted: i=1; AL+hErGN+SISnHw35ZM8DUiZ/UxS0bN97Lz0kAtBDCP9JLoJbHFlhMscu3bp1eLSqmbiNtYnn+/yGuKDwAyE3Hw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ojgn3R/lIq7v31+uACLjsC8d4jm0zuEZ/eRO2X27a4+YNe8Cp
	8nM0neFqOdy321lcsXOQyMf/s/M/ELkFmem0rusIy42iHwl5rzGXAP8UMlQvwqSXyBYhbGFYgCS
	pBnCqeJOOhXdlJ5WSusaAuCKIzEhmAKYUpkZibeR+XdJs6gk5uGhqz7QmTC62hImtCm0=
X-Gm-Gg: AYBFou15HmF8pdsxKAdOy/qKvNgf2Y7zsh1Y9ld/3OQgcvh+of/EqTlEo+W9H3ibJCM
	50j4K1/oQKCGPEvkr9bfmEYNR5FmxBibO0za0eMBAg/57i2FQa2y0lxktpAZE9FASda/j/s7Kf/
	Jsm54TQIVjaymKf1C4JkxWEzmOQNVLsEQ1NjIPNtMzFeQRIAGS1aTBeR0uSFbNwCpwDODaf2Gkf
	yVyjixa6WnZPQSjHHi7QSV14wOy9yh2HJKlPqYcGb48DZCiNUFzPACjMmVgtgf4kK1x8ufFmHj5
	omvAtlf2erk/CUSfiiR2Wxo/uZ8juXiRvBQPFvIzkyl06p75dw6OFQE/PGilXiq/AIjYtaBdpQP
	CvFzvxxyeq7ywloe7pgJl5ev4evUWt1KlP432GGzoI2/gqca3zQZR+ESOA1s4Pl6cppzE4vmtZd
	44P3e6Gu2ueQ0fSsQ63q+lwFridzYdLo3LuBgu
X-Received: by 2002:a17:90b:3804:b0:3ac:7116:434a with SMTP id 98e67ed59e1d1-3b166cd72a9mr1611673a91.15.1794280960403;
        Mon, 09 Nov 2026 19:22:40 -0800 (PST)
X-Received: by 2002:a17:90b:3804:b0:3ac:7116:434a with SMTP id 98e67ed59e1d1-3b166cd72a9mr1611630a91.15.1794280959879;
        Mon, 09 Nov 2026 19:22:39 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16fea4243sm2341a91.14.2026.11.09.19.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:22:39 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:21:26 +0800
Subject: [PATCH v22 4/8] coresight: tmc: introduce tmc_sysfs_ops to wrap
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
Message-Id: <20261110-enable-byte-cntr-for-ctcu-v22-4-05d48c0eb110@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794280922; l=5197;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Zyx/d9oIgPkQ60/304aFUQUx4sMlZWIw6sxJoMobPBo=;
 b=kpRNVhutXQ7gohFYZQCqNm1H40Kl3zk4+d4GQd1BPz4yWZX15elY/hEqALIMQRcM7mvFBSwB5
 ua4YckmM+PHDsJBSzHNttGsPiM+rvMRt9Tnl1YxkYUJOqv93jx9Np7o
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: T95-4zt97KAGrNknDOi8bseYGjV9FjkU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX99MyI9iMJWTi
 phNKyp5KElFauXUo/nuNC7vY3ncZ/dQJexglPdCAZQ/1tSbZeVU1bpvaKiGy4Aq/ax2HfO1pVIH
 bNhc2tVsAwGYMhs11GpVLLuHn82CH7s=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af28e01 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: T95-4zt97KAGrNknDOi8bseYGjV9FjkU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX3wnXTT9EBB4/
 LdEs62TVoRSMkI4JqYR3U+eQaWzbaj2cEthcOPhA4QFg0vY2lLFA0UCq6K0Kw7H0L6gSold9tsL
 S+RPVus7gB7iIAqv9UeRKdLSTH2iifm+7yVaYOCiluYj/l4/Fzg9LF2p1y6ywRxwp6ILuFho5Ou
 lPuo/Zuo69srl741Qvuae/raUrOCl8ukvY5hCIgPk52GNIl097tcxHaOM/JTzP8UKkOGJ2E9duC
 iiNgxny6R45UPN5GC1zZNkLpl1Mxxa0OSlzxCfPFbjrenK3lc973kcdnPzi802HqGj37SmOlLiq
 DEzt0B3KWn5Hr5Gt6Zw4O+74luVj96xnR2f1TBbi8SO+GWQo8DYpVNLY8o7QUOegfLl9qgTMKBj
 YFI8vjVHRhEKU+pd8LnG5yqu3YKq5Ll6KeLLsrgT0lNmLVCqHhEu63AtEHIrpLpGRnm0HCRKjHx
 4rWFARtEU/NoI6fqh7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100013

Introduce tmc_sysfs_ops as a wrapper, wrap sysfs read operations,
for reading trace data from the TMC buffer.

Reviewed-by: Mike Leach <mike.leach@arm.com>
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
index 30b15c38b080..36c80918958f 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -263,6 +263,7 @@ struct etr_buf_node {
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
+ * @sysfs_ops:	Read operations for the sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -294,6 +295,20 @@ struct tmc_drvdata {
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

