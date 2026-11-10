Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794273712;
	b=0GFV7Xr+VtOFPAK1JXWwpgojwZJxCqx4LSFHMn3dcQ6MQdY90neTliNLDMqYINKdigxe
	 K7Oi4gcV9N0BsfzL62N32PQD3tzQnRnk5JPs+IyosMasXihm5cfSEDuCRmYmnAy5xJ5D8
	 dTOqnERjQn3A6Q+4W4CA8oFODfWG0vlYeUuDX9wsnd8rMIO8Lb3escZvboeZwFMy86lEv
	 A5YQTSZYHCoUtTLVBohpTfoWu/QdhFRPp6bIcxApRa+X09ou+FCMnVJcUMQcZC2YbygQh
	 ednJWD3HKEWHiv5Qj0k+twGfnHNkv2HW6fuk+CWTM+2EHNgunbZLWqu3wxpMyVezAUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794273712;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1pZOfrwc9BxZ4qThTQHCc0NnWQpNbbFr2NtADn6ur68=;
	b=kDzpLMLycmOuu9xnN4xGCufAy5WC5BATCCz0ICirp+bDAi91PpAvhY1cx4QQbJTArxdQ
	 5FJT2fn+N2UTyVhp7aJmsL/tAp7OXUKjCbKkd6L6lz+m6fC5uhbv4htwDzTUaan1ka6jZ
	 /NlQGn4gnxM0+zAIEvyMVwltVh49FKSn8fXF6ZtIe+YSpMFPTshC334tmEvQq1m3r2YUW
	 leGYKYW+RAsbfOteQ9FjPjr2vdSsj4j8klXfoGC0QhajNREuP5tyIF1npRUcE49tbqS57
	 kg167bbl4fisVwtsUrO96EcYveO4ILlFi15WbIr7ALyqWnwDxInPvr6vX2ItIMEZZPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nR2PXnDk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UYbWwefx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4605C60A2626
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4605C60A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nR2PXnDk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UYbWwefx
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0jU1b2482484
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1pZOfrwc9BxZ4qThTQHCc0NnWQpNbbFr2NtADn6ur68=; b=nR2PXnDkTtl/fkgk
	ldb3TKFAyJFYSbZ6keGakKCWRYC+zljRNMyZMiuFDJyMet+y08OHDzS+tu7gunPu
	qZr3DxBT+L5ip6UY+xM/gPle4Ab9GHOI1KFlXW2XpiWAElDgIyBoykHeM22c3pUV
	e7ucc3xXZUj0dNKYKQ+XfVsj4Kue9/FKWdYyAZ1fGcSrltf0gG1xGJWkvzr7ZbGz
	vm+md8oKOPe6rQGgMLA8G7N4+Z9+H0ypOmln9UWcvfbhwbOdgqhWFxGFfSpSpkWG
	bKMnbpGC2fRkaavju+zI9p/Dq6tvVhGJdt939c7J5iashjn+CZsd/Cm4QuS/z3YL
	GhGW1A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx828nm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:21:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed8aca9775so14895315ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 17:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794273710; x=1794878510; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1pZOfrwc9BxZ4qThTQHCc0NnWQpNbbFr2NtADn6ur68=;
        b=UYbWwefxRfgF2hsdA4srd8QXfxLt1uPCrXXIIi9QsiXCfYavFQRIVDhEx/KhQUKyLK
         EBMwPkd3w00PR++XBPwhI0wdpwY9NWmjzENMeRZwS2OMBJ0A6crGZIZur9X+dwvmzVv9
         F/RcMq/fJf9SgrlKTTxXeRPriIEu6Ewbr1Tu8bSnCgORtZnqJOcKPB4msqHrrUuxbamS
         ZLeY6V9ahN6TfuQoPNHZZzgZmbhvIss0cx2EUg+PRnMspTAfGvag+pTA7RmEu3lXuUDL
         XalDP9x+QKW1lAqk6VKpJzL9dkVX9uid+L+lS7by3hMOrqJdEYzAkX9U6ywxeL8OheWm
         C4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794273710; x=1794878510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1pZOfrwc9BxZ4qThTQHCc0NnWQpNbbFr2NtADn6ur68=;
        b=GVTgJ3ijtwzByM7K/WI3XccU1+S7FgHfawhcsJyaq16qAwAgIKcw7VXyHGzQao8Ku7
         qto8dEiSX3TCMKQ0T4XNnkQ2qVSa10B45WhX/oHV1zFVlekNzGe1+zKK1d9XWJDGdunc
         DhJGNIkZekOgO5MhsaOYNwH2+HbFpv+kguPWFkeRY/tc1PN68R6CmHuTWqIhdrgqbE4d
         kuW0giR0VgzIjfpRGEJ0on7CCfD8rmQ2UozFcn751LfC7JJKhIQTubJuxlrREjEe6nub
         XfgeXC7l6aouiADrGcAYre0aEE+2VGqGblkroo1BfIQxGRhw2pmF3ngScH7t11Su6/ib
         Rttg==
X-Forwarded-Encrypted: i=1; AL+hErHHKnIKlMkkGHnlt0m5yE3W7mdmZSEUTv6a+92AXvDYaJZLMyDYo5Hct8yDYQlqzzPPHZRp5+Z0O/DfF2I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Aoz2w7YcS6YixdauykYEBPbY1Kq095H10q1DObHAQQaE1/HaY
	OKGJhEAeeckNSp/3RBQozvtkKukwZTJ/GF30jUfFn1UoGKc3lLTGPyn3LqvQdcN5EfLSjmyLDrF
	s0zwHHLVUqlvh9JXVUc9hmP36cX1j6wjD9zOVWYzpiiBU8J4ayCRI0c0VyyU3Hxun6mQ=
X-Gm-Gg: AYBFou3mahOz+x2rNDUrZ+zFLoylGERKrbqTeYfYVe/3Gbxa0h0z+n2zS1OcOj7T97l
	3K136UDDg1fHQErq60PZ/5AyARV4rEmyoYEUtA0O55a9biUCTRIz+2EDTU/axNXzN4uxOpRvdAO
	mjNel/bkUqsNZUJ+VrV9awowbqStUF/hxta1wGoLTsuBs5hzhNynLAoP/Bfo5PF/hAtQWwq7e07
	20ji9PXn5CTkLo9eHhoK7ZaR1XipZWadjpz/EWmrx2Pt/cZXBLc9n8tkarbPPW3N1Ws5ev5Iam4
	bXdK8q0iOu0flnoXRiJ79nyJt0Hsb0C0CGCoNxXj807bjgR+Yl3dpl0x2ZdUi/5lEHOtpi+BTwZ
	sryO1PnBeirkIjXd8gw4XgVSyH15RVHid2HlAiBU4lKpPFXsWUkzc7xImNZ9yNBoV+veZ7zq0H2
	5bbOAk/W8EodK/uhtzr2GL8EfKvC5zscdllFo=
X-Received: by 2002:a17:903:1b08:b0:2ed:fb0:bfd6 with SMTP id d9443c01a7336-2edb715ddcdmr8656465ad.11.1794273710016;
        Mon, 09 Nov 2026 17:21:50 -0800 (PST)
X-Received: by 2002:a17:903:1b08:b0:2ed:fb0:bfd6 with SMTP id d9443c01a7336-2edb715ddcdmr8656155ad.11.1794273709521;
        Mon, 09 Nov 2026 17:21:49 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6e0d5c0sm3148065ad.71.2026.11.09.17.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:21:48 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 09:21:15 +0800
Subject: [PATCH v7 2/5] coresight: tnoc: Bind Aggregator TNOC on the
 platform bus
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
Message-Id: <20261110-fix-trace-noc-probe-issue-v7-2-2f06905c77fe@oss.qualcomm.com>
References: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
In-Reply-To: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Jie Gan <jie.gan@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794273689; l=5166;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=0b0Jv8aa52rorusffBISB+VPX9cDckKQWTS0EKGHQCo=;
 b=tWjeepAF2OCDUzNXp6rjNTfT8NOudqM57oirueTdbhxpatFUA9Qbs96uA48P3unZzYjXyhaVO
 FHlvzCE0b8ZA+nTqRrbS6e0DmtRFbL/Y3xJCsEnezojvz4HoDhmX2Zt
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af271af cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=AgGNJJ2qDC0_l3B12uQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: zOIjI4jJI_WKPMv199VE244X_BlvCysJ
X-Proofpoint-ORIG-GUID: zOIjI4jJI_WKPMv199VE244X_BlvCysJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfX4QOIu8jggagU
 CygECuNdlFNDIz/4W4H7wecjUr09kMXfuBCjgPhAlR2+ZBFwdTlTGHt1W2cGGOU7rl8CaF0bv+/
 uKmuLMjOtA40jLvU8uG617QPNDfavEI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfX67kXrRanr4sL
 O55dBB+QGGtxDggHbMe6sL/OLr3ME43b4Yde5pkQIAawkU0vz82LXoxT9QpzqPPEEtsDggaoSsp
 vw/e/R7aRNfrbk3Ie+0fzAE7xMB9mOE6z5P9dgRvVD4e7vqgQxo63xXvcdBPv+0VVX0bqrgcDqC
 kom4EP1i5cc9818gUqgaLqm4vHw92HVtS/kOHnWYNUnsYdFrhG0Xs0q2KKrmy60L4EPqkBgJJHS
 WXkyBKNhsAyKFgIfix3l67NEUUbRQu+1m80DHJZ6MYoe8QU2UE+mf8DrLumviW4ZJQfr5cZk9sV
 hlFmFtlwNyL4MgAEwxr86XPXVcgDrtbR7LTU+nCu8JEbzffK+gQgMMwiDUxXY+4NkQG4XiLO5CN
 tTh7bvrDiFvyUF5x0gJ1VgwpLoRTweZIKpQCYcxIXH8T5ptAlrO2pKVVdInLkTAP7OzwkGZxgXz
 7bDZe3R3N87feaUxaKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100005

The Aggregator TNOC is bound as an AMBA device through the
"qcom,coresight-tnoc", "arm,primecell" compatible. The AMBA bus reads the
peripheral and component ID registers to identify and probe the device.
Although the Aggregator TNOC exposes the CID registers, the Component ID
value returned by the hardware is 0x00000000 instead of a valid AMBA
Component ID, so the AMBA match fails and the device never comes up.

Bind the Aggregator TNOC on the platform bus instead, where the device is
matched by its compatible string and no component-ID probing is performed.
Add "qcom,coresight-tnoc" to the platform driver's match table, and rename
the platform driver and its callbacks from the "itnoc"-specific names to
generic "tnoc" names, since the driver now serves both the Interconnect
and Aggregator TNOC. Update the platform driver name to "coresight-tnoc"
accordingly.

The ATID-unsupported handling keyed off dev_is_amba(), which disabled ATID
allocation for every platform-bus device. With the Aggregator TNOC now on
the platform bus, that check would wrongly disable its ATID, even though
the Aggregator TNOC owns the ATID that tags the whole aggregation path.
The Interconnect TNOC aggregates trace within its subsystem but carries no
ATID of its own, because the downstream Aggregator TNOC already owns the
ATID for the path. So base the check on the "qcom,coresight-itnoc"
compatible and let every other form allocate a trace ID.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 37 +++++++++++++++-------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index a0ab99df5db1..4b46ce995862 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -130,7 +130,7 @@ static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
 {
 	int atid;
 
-	if (!dev_is_amba(drvdata->dev))
+	if (of_device_is_compatible(drvdata->dev->of_node, "qcom,coresight-itnoc"))
 		return 0;
 
 	atid = coresight_trace_id_get_system_id();
@@ -276,7 +276,7 @@ static struct amba_driver trace_noc_driver = {
 	.id_table	= trace_noc_ids,
 };
 
-static int itnoc_probe(struct platform_device *pdev)
+static int tnoc_platform_probe(struct platform_device *pdev)
 {
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	int ret;
@@ -293,7 +293,7 @@ static int itnoc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static void itnoc_remove(struct platform_device *pdev)
+static void tnoc_platform_remove(struct platform_device *pdev)
 {
 	struct trace_noc_drvdata *drvdata = platform_get_drvdata(pdev);
 
@@ -307,10 +307,12 @@ static void itnoc_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
+	if (drvdata->atid > 0)
+		coresight_trace_id_put_system_id(drvdata->atid);
 }
 
 #ifdef CONFIG_PM
-static int itnoc_runtime_suspend(struct device *dev)
+static int tnoc_runtime_suspend(struct device *dev)
 {
 	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
 
@@ -319,7 +321,7 @@ static int itnoc_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int itnoc_runtime_resume(struct device *dev)
+static int tnoc_runtime_resume(struct device *dev)
 {
 	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
 
@@ -327,35 +329,36 @@ static int itnoc_runtime_resume(struct device *dev)
 }
 #endif
 
-static const struct dev_pm_ops itnoc_dev_pm_ops = {
-	SET_RUNTIME_PM_OPS(itnoc_runtime_suspend, itnoc_runtime_resume, NULL)
+static const struct dev_pm_ops tnoc_dev_pm_ops = {
+	SET_RUNTIME_PM_OPS(tnoc_runtime_suspend, tnoc_runtime_resume, NULL)
 };
 
-static const struct of_device_id itnoc_of_match[] = {
+static const struct of_device_id tnoc_of_match[] = {
 	{ .compatible = "qcom,coresight-itnoc" },
+	{ .compatible = "qcom,coresight-tnoc" },
 	{}
 };
-MODULE_DEVICE_TABLE(of, itnoc_of_match);
+MODULE_DEVICE_TABLE(of, tnoc_of_match);
 
-static struct platform_driver itnoc_driver = {
-	.probe = itnoc_probe,
-	.remove = itnoc_remove,
+static struct platform_driver tnoc_platform_driver = {
+	.probe = tnoc_platform_probe,
+	.remove = tnoc_platform_remove,
 	.driver = {
-		.name = "coresight-itnoc",
-		.of_match_table = itnoc_of_match,
+		.name = "coresight-tnoc",
+		.of_match_table = tnoc_of_match,
 		.suppress_bind_attrs = true,
-		.pm = &itnoc_dev_pm_ops,
+		.pm = &tnoc_dev_pm_ops,
 	},
 };
 
 static int __init tnoc_init(void)
 {
-	return coresight_init_driver("tnoc", &trace_noc_driver, &itnoc_driver);
+	return coresight_init_driver("tnoc", &trace_noc_driver, &tnoc_platform_driver);
 }
 
 static void __exit tnoc_exit(void)
 {
-	coresight_remove_driver(&trace_noc_driver, &itnoc_driver);
+	coresight_remove_driver(&trace_noc_driver, &tnoc_platform_driver);
 }
 module_init(tnoc_init);
 module_exit(tnoc_exit);

-- 
2.34.1

