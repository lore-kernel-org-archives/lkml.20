Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979101;
	b=uRJvQ9DDApyOOVJ5nISDAmvVH/2b/TFMa7jQaqRu0cnvkD90fkYcZWfgUo/HaNO0//jb
	 PzlcoLlBYEX/Y3uX7lx+NzKeMoxszH2vxT5O3nG+Mx2fO8ahbtMLZJeRlW/9fWo98wkjI
	 DjkVZlHg1UQpWIB2MFp5kGXgpsD43KpNwo5KXVR3gwaVm/3uxvioISzhXIA8DoiiJWodJ
	 LQBsTMStWK5jtTAcA6FBsV2LRgDM8Lrgjh2ky/TYcrxNJ1gRWvwoctqoyL2eM0GZgTXGL
	 O02rtf9/YSkK2bcpCYcbwTQbSU7lycZOm9MCxJWc0YKQJVyOghQ0lk8Z4W1iPzch4TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979101;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=E3u/5Ej2Q4JEKG4Ck2VXFEqrn2z5NY1FaGcHly9GgrU=;
	b=mIKIgZ9oLtkFPIYlSLxj5bKFQB5vxHGKb12WVg2dcR3afiMA270XQTuLNSfXAM2pMlQ0
	 fTQScgXVbgBgnMWQSd+w2HZAbFAuC1QZOWVn+gYPMMT1C4tJbPw+eq/9u0jeW8ZcaFPFh
	 jow+pDwAQBTfTBH9N11oGGDcgYIpM5HC7U0ZvCl1AvTz/9UAcuX1mxW7lhd4nfa6ar2YY
	 Fg1zfm1gCg7GQ/Vup6ZtDsTiDvRIjm/dfZ3SFI4i9DDJWlcjtfrAO47mgn4brU5He+sKt
	 0w9GDhapjjEfzxbJMJc81Uk85pumNPrIECljbND27jg8MwSF+VCaW0u66YrfVdap6Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PHEl8g1X;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VYvzHeDP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C26C606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C26C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PHEl8g1X;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VYvzHeDP
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F0CLL1039845
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 15:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=E3u/5Ej2Q4J
	EKG4Ck2VXFEqrn2z5NY1FaGcHly9GgrU=; b=PHEl8g1Xe+iBch6u4VMId0tjoIE
	aYWZ0DoqKy9vAe3/Y6Ly57aaB06usSg5WmOFiO4oK4I2Jpmq+IJZq51rExlRxUld
	4FkMfmFwAcmj6Fk2JWgPHWLz1M+tvRxM+bJlTqOK0MQbVeuOf/9ALUMWqi4vIVPn
	rVTyC1JG8kBtkTcYi+V/UDmJfJZEqMeASX18NOjOAWz1L+whd54N+Kaww/otN2yH
	vV9McUwu5q/498y1QGHmVGATfRW2JTxxEUlEwe6NmksI2/nEhhZPw9v66CMpMXI4
	FZUmrFFAo504HMjoNCyrgfTpORpUYHetOrW3dueq3T+ToSWlWGi0naJBiOQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9ue8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:31:39 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1307351eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793979099; x=1794583899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E3u/5Ej2Q4JEKG4Ck2VXFEqrn2z5NY1FaGcHly9GgrU=;
        b=VYvzHeDPhCE2LdQxw214j5JO30PO6eWvjLTdo7o8OMBy+yyAEawedMLejzN92FiyCS
         PNqZsL69SXTQBjqets/2GDPNh1Y6uFTGT4Vz0JjkB5UTqkfIluts0xL11b/wm2x7lW6S
         i02N8cvl8GQ/yALe0t3faJXpihL42Bo64IU0EYwLrELtzEnE7awVBOi/Kuj4yEazTimZ
         K6W+LGSE9WANTab9Spq33WDPhLmA7n/5T4qbXbvs7nggfAAx9HVVrVWRWCn9IJz7vzCY
         ERcHoCyG+jWEx5NtNagkzfpW5xekxA/xuFB4msuMv5M/+4e/fM1lVFxg99TtchVY9Ohh
         4Haw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793979099; x=1794583899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E3u/5Ej2Q4JEKG4Ck2VXFEqrn2z5NY1FaGcHly9GgrU=;
        b=AolUKgiLH0hlptHUKTZ50nEYSZFUAz8TGJoPBZc20jMT9V8sRPVlGQLENWL6eRl7l0
         t5azstnuh/fVNIB8Ml6tCfW1h1fveT77Yyf9uhKKd2NyjaTqHR8tUtYKwjFLBNuISHb5
         J6HI28gDrnnNZhdOGLncUCYFVwesrMx+iC0sH8bGyJy44hNZXK8AoJU8MQ2R9uPUpsAH
         2qSuWjberV6WgOJfIYbhvJzO+w4lGCKVhRzVpc9Js2VWsz9z0Pj3o211DBGkM/XHcKs8
         6t/pNRwXEU88pwfDNjOvVQ//fq108N61ecCbl+DQKix+77g4u392O5QKuKeCMeG+eIa2
         fXKg==
X-Forwarded-Encrypted: i=1; AL+hErE9t2tpX14cyzyRF86WUq7/FdGyaDl0rC4ThlbXxNWb/IpDbya01xklxDC0CHtuGV3bdsnuznpzHvjdFZ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+42lCk4snQ4Oxy1LGzRP77mi2IWdPh2n9XuikHj34Zq2JA2jQ0
	vq9sGVnQu6vYpDExZuGz+yl/2GA9tH1TAUwiVK8lT6w1gM0RQxHUmX8AHXk3D+s7HP9rNLlEZHa
	++4xv2pmvDBikNzKHn3ZHUSEDIitFoo6a9W8yqUifJZPyZb2pD7V+ud2zp4YuR8vLk+o=
X-Gm-Gg: AYBFou34I8l37J/FuBdBEsL8T967sh6kFcvCwhNtRmSI+p4ZKtudBnxa5hz3/9e6pH0
	PTb1uUePJntboPoBLGV8KSInTFpVRI7ReB9dv3j/OqhfBJ3uW1c6DFWit9wA97iXfhayl7Qw4KN
	kp+44Wt+KXYluKz8xC/w3/4KnocFHlVQCVkUx9I0NuEZY8pRuqd/eOE/B3HyFKYElU2Jn964MhC
	Jry+AR+j114SLZvvyHtQGl17yPsH2MQcdSQ37p7Y7XnsktRCNfKUWp4j0d/nbtrhJGR8OYreDfI
	6aJSyxqLT3exPC5ldP6Uxg6JNDHdaMP8r57MYKiDTgSeatg6XLqpVeyPHnqJsCsY3QE4SeuFbtb
	aifRzRL5yoyv09bvPAS0fmOHNMWlZXl2si9sY//49vtvxzaqE4MAtE/+Hsgk3EbAGFAkD
X-Received: by 2002:a05:693c:8946:20b0:369:7c:bfce with SMTP id 5a478bee46e88-36f75839375mr3962251eec.14.1793979098616;
        Fri, 06 Nov 2026 07:31:38 -0800 (PST)
X-Received: by 2002:a05:693c:8946:20b0:369:7c:bfce with SMTP id 5a478bee46e88-36f75839375mr3962187eec.14.1793979097794;
        Fri, 06 Nov 2026 07:31:37 -0800 (PST)
Received: from QCOM-seNJUcZa74.qualcomm.com ([183.82.133.69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm13618197eec.15.2026.11.06.07.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:31:37 -0800 (PST)
From: Dipayaan Roy <dipayaan.roy@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org,
        p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] media: qcom: iris: improve probe error reporting
Date: Fri,  6 Nov 2026 15:31:23 +0000
Message-ID: <20261106153126.120858-2-dipayaan.roy@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106153126.120858-1-dipayaan.roy@oss.qualcomm.com>
References: <20261106153126.120858-1-dipayaan.roy@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2MSBTYWx0ZWRfX4z9V98FdoCjd
 /niummmRjM+kmjt1LvsdZsxW9Wql2uS5Am9HvcWuVAJU6evq8AIsVGp/r6yygzUTUBMrRjY9L/D
 0gOrNGaNhz70tCPagTUUDku5Z51Fq7o=
X-Proofpoint-GUID: 9tbzYUNtHeOHsQdaDO1p2-uzHYOpe0Ut
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2MSBTYWx0ZWRfXzc4xzIVZ6Fpf
 FktRxoJ7gUHGgrkimxrbO+ZLWnZGB8rTtMCGyC7uZHAaVan2DHiDqCVapD2yX4JXV2D7yxoH7bQ
 tWuBDHW7pkC+WT+KDX1K/arTrS62Yq+wBA/NKGfRhld8kvSLe+sTdyePKtRWoJbU1/c2t1CA5hQ
 IYTSOP73Yi1eBgKQc+Hz2zKYDuXFdA5JL86+rOydD0PbKSOoB6ggRvK5iOdZhjvrQyoA9XZOpBt
 mOQyE14VESWlLyb631CdnN0rozQn4CKWSt6+XIr0LkNBwRyfGgqvpdx3jK38MbCNJO+/Mnm/aFS
 74T2uhAMUhanWqjEle+PS2ZL1M4pmX+5acirra83W0JMvLpY47hn2LkVYtOOBRaHLL90xXfe6nK
 Ehb0CIH4d46wH8jthEDk1Z8Bz7D7og+9GkXd/Eh15wQYCcUJyHK1hVEdsnq+48Gi6/30yyLC6QJ
 TuqXLpU1wQqgV2MLbAQ==
X-Proofpoint-ORIG-GUID: 9tbzYUNtHeOHsQdaDO1p2-uzHYOpe0Ut
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aedf2db cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=4lT0C3RFl5dsjxM0/Vd6wg==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=NqrKHNM9XWQKvme67EQA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060061

The Iris probe path returned errors from resource initialization and
device registration without identifying the operation that failed. This
made failures difficult to diagnose, especially when several resources
were acquired during probe.

Use dev_err_probe() at probe and resource initialization failure paths to
report useful context while preserving deferred-probe handling. Also
validate the platform match data before it is dereferenced.

Successful probe behavior and existing cleanup paths remain unchanged.

Signed-off-by: Dipayaan Roy <dipayaan.roy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_probe.c | 98 ++++++++++++++++++++-------
 1 file changed, 74 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 41dec90f3e2b..dd48fa750013 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -19,6 +19,7 @@
 static int iris_init_icc(struct iris_core *core)
 {
 	const struct icc_info *icc_tbl;
+	int ret;
 	u32 i = 0;
 
 	icc_tbl = core->iris_platform_data->icc_tbl;
@@ -36,7 +37,12 @@ static int iris_init_icc(struct iris_core *core)
 		core->icc_tbl[i].peak_bw = 0;
 	}
 
-	return devm_of_icc_bulk_get(core->dev, core->icc_count, core->icc_tbl);
+	ret = devm_of_icc_bulk_get(core->dev, core->icc_count, core->icc_tbl);
+	if (ret)
+		return dev_err_probe(core->dev, ret,
+				     "failed to acquire interconnects\n");
+
+	return 0;
 }
 
 static int iris_init_power_domains(struct iris_core *core)
@@ -62,7 +68,8 @@ static int iris_init_power_domains(struct iris_core *core)
 
 	ret = devm_pm_domain_attach_list(core->dev, &iris_pd_data, &core->pmdomain_tbl);
 	if (ret < 0)
-		return ret;
+		return dev_err_probe(core->dev, ret,
+				     "failed to attach power domains\n");
 
 	ret =  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
 	/* backwards compatibility for incomplete ABI SM8250 */
@@ -73,13 +80,20 @@ static int iris_init_power_domains(struct iris_core *core)
 						 &core->opp_pmdomain_tbl);
 	}
 	if (ret < 0)
-		return ret;
+		return dev_err_probe(core->dev, ret,
+				     "failed to attach OPP power domains\n");
 
 	ret = devm_pm_opp_set_config(core->dev, &iris_opp_clk_data);
 	if (ret)
-		return ret;
+		return dev_err_probe(core->dev, ret,
+				     "failed to configure OPP clocks\n");
 
-	return devm_pm_opp_of_add_table(core->dev);
+	ret = devm_pm_opp_of_add_table(core->dev);
+	if (ret)
+		return dev_err_probe(core->dev, ret,
+				     "failed to add OPP table\n");
+
+	return 0;
 }
 
 static int iris_init_clocks(struct iris_core *core)
@@ -88,7 +102,8 @@ static int iris_init_clocks(struct iris_core *core)
 
 	ret = devm_clk_bulk_get_all(core->dev, &core->clock_tbl);
 	if (ret < 0)
-		return ret;
+		return dev_err_probe(core->dev, ret,
+				     "failed to acquire clocks\n");
 
 	core->clk_count = ret;
 
@@ -97,8 +112,10 @@ static int iris_init_clocks(struct iris_core *core)
 
 static int iris_init_reset_table(struct iris_core *core,
 				 struct reset_control_bulk_data **resets,
-				 const char * const *rst_tbl, u32 rst_tbl_size)
+				 const char * const *rst_tbl, u32 rst_tbl_size,
+				 const char *name)
 {
+	int ret;
 	u32 i = 0;
 
 	*resets = devm_kzalloc(core->dev,
@@ -110,25 +127,34 @@ static int iris_init_reset_table(struct iris_core *core,
 	for (i = 0; i < rst_tbl_size; i++)
 		(*resets)[i].id = rst_tbl[i];
 
-	return devm_reset_control_bulk_get_exclusive(core->dev, rst_tbl_size, *resets);
+	ret = devm_reset_control_bulk_get_exclusive(core->dev, rst_tbl_size,
+						    *resets);
+	if (ret)
+		return dev_err_probe(core->dev, ret,
+				     "failed to acquire %s resets\n", name);
+
+	return 0;
 }
 
 static int iris_init_resets(struct iris_core *core)
 {
+	const struct iris_platform_data *data = core->iris_platform_data;
 	int ret;
 
 	ret = iris_init_reset_table(core, &core->resets,
-				    core->iris_platform_data->clk_rst_tbl,
-				    core->iris_platform_data->clk_rst_tbl_size);
+				    data->clk_rst_tbl,
+				    data->clk_rst_tbl_size,
+				    "clock");
 	if (ret)
 		return ret;
 
-	if (!core->iris_platform_data->controller_rst_tbl_size)
+	if (!data->controller_rst_tbl_size)
 		return 0;
 
 	return iris_init_reset_table(core, &core->controller_resets,
-				     core->iris_platform_data->controller_rst_tbl,
-				     core->iris_platform_data->controller_rst_tbl_size);
+				     data->controller_rst_tbl,
+				     data->controller_rst_tbl_size,
+				     "controller");
 }
 
 static int iris_init_resources(struct iris_core *core)
@@ -195,6 +221,8 @@ static int iris_reserve_iova_region(struct device *dev, struct dma_iova_state **
 	return 0;
 
 err_free_iova:
+	dev_err(dev, "failed to reserve IOVA range %#lx-%#lx\n",
+		end - chunk, end - 1);
 	iris_unreserve_iova_region(dev, state);
 	dev->bus_dma_limit = dma_limit;
 
@@ -204,8 +232,17 @@ static int iris_reserve_iova_region(struct device *dev, struct dma_iova_state **
 static int iris_register_video_device(struct iris_core *core, enum domain_type type)
 {
 	struct video_device *vdev;
+	const char *name;
 	int ret;
 
+	if (type == DECODER)
+		name = "decoder";
+	else if (type == ENCODER)
+		name = "encoder";
+	else
+		return dev_err_probe(core->dev, -EINVAL,
+				     "invalid video device type %d\n", type);
+
 	vdev = video_device_alloc();
 	if (!vdev)
 		return -ENOMEM;
@@ -220,18 +257,18 @@ static int iris_register_video_device(struct iris_core *core, enum domain_type t
 		strscpy(vdev->name, "qcom-iris-decoder", sizeof(vdev->name));
 		vdev->ioctl_ops = core->iris_v4l2_ioctl_ops_dec;
 		core->vdev_dec = vdev;
-	} else if (type == ENCODER) {
+	} else {
 		strscpy(vdev->name, "qcom-iris-encoder", sizeof(vdev->name));
 		vdev->ioctl_ops = core->iris_v4l2_ioctl_ops_enc;
 		core->vdev_enc = vdev;
-	} else {
-		ret = -EINVAL;
-		goto err_vdev_release;
 	}
 
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
-	if (ret)
+	if (ret) {
+		dev_err_probe(core->dev, ret,
+			      "failed to register %s video device\n", name);
 		goto err_vdev_release;
+	}
 
 	video_set_drvdata(vdev, core);
 
@@ -306,17 +343,22 @@ static int iris_probe(struct platform_device *pdev)
 		return core->irq;
 
 	core->iris_platform_data = of_device_get_match_data(core->dev);
+	if (!core->iris_platform_data)
+		return dev_err_probe(dev, -ENODEV,
+				     "missing platform match data\n");
 
 	core->ubwc_cfg = qcom_ubwc_config_get_data();
 	if (IS_ERR(core->ubwc_cfg))
-		return PTR_ERR(core->ubwc_cfg);
+		return dev_err_probe(dev, PTR_ERR(core->ubwc_cfg),
+				     "failed to get UBWC configuration\n");
 
 	ret = devm_request_threaded_irq(core->dev, core->irq, iris_hfi_isr,
 					iris_hfi_isr_handler,
 					IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN,
 					"iris", core);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "failed to request IRQ %d\n",
+				     core->irq);
 
 	iris_init_ops(core);
 
@@ -327,11 +369,14 @@ static int iris_probe(struct platform_device *pdev)
 	ret = iris_reserve_iova_region(dev, &core->iova_state, IRIS_NP_RESERVE_IOVA_START,
 				       IRIS_NP_RESERVE_IOVA_SIZE);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret,
+				     "failed to reserve IOVA region\n");
 
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
-	if (ret)
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to register V4L2 device\n");
 		goto err_unresv_iova_region;
+	}
 
 	ret = iris_register_video_device(core, DECODER);
 	if (ret)
@@ -346,8 +391,11 @@ static int iris_probe(struct platform_device *pdev)
 	dma_mask = core->iris_platform_data->dma_mask;
 
 	ret = dma_set_mask_and_coherent(dev, dma_mask);
-	if (ret)
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to set DMA mask %#llx\n",
+			      (unsigned long long)dma_mask);
 		goto err_vdev_unreg_enc;
+	}
 
 	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));
@@ -355,8 +403,10 @@ static int iris_probe(struct platform_device *pdev)
 	pm_runtime_set_autosuspend_delay(core->dev, AUTOSUSPEND_DELAY_VALUE);
 	pm_runtime_use_autosuspend(core->dev);
 	ret = devm_pm_runtime_enable(core->dev);
-	if (ret)
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to enable runtime PM\n");
 		goto err_vdev_unreg_enc;
+	}
 
 	return 0;
 

-- 
2.43.0

