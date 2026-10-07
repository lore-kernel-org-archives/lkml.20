Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7306D40961C
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 06:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791355862; cv=none; b=P1O5HkefUEKpnK95athd/oCje1R+XUZGCLfFy+4I4uaI2TMm911v2jxHSpDbvyiBPQzqO5Fs/p1Iu4BoxBuh0jtMa0bRavtDSGeFQW53TOp3aXtVwdBJjjzvgXsPUoBP96OnStQkSKD13begg6ihbfBLcglbuxnD4XwqqjHFYfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791355862; c=relaxed/simple;
	bh=aqwYlbBZfPmAovG9tQvJQ34ckDn3s8ZtxB+c4NH+OBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m1RIC5kkmEVu+pJm+ldpzYyk0PQCZ25SoeJE5fpqB03LJIxZsdynTYGAkuoXT/KyPaBMQiHEhz7YW3o9JeGwCLyV55ExWqyRQ5EpLOKhUFUiLORgU0ijzUBN6ThpVCm1iceb6FCm2uolek792BfoWih4VE3/bR1l7n95MWWaX5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ASLcHgRR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cg7pMHTG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ASLcHgRR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cg7pMHTG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6974lPH83929718
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 06:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	52nzYadmue4RW4uwDkTflPSkr2BZLVWcOLb+4ASjXtk=; b=ASLcHgRRptef5lgR
	RwEp8AqhDOPJ9G3CrS73dkAPuI/kz0Zo1FczV9FCv/HqPaht+22y+lX8CXzxdMlT
	wPMmLVodl1X8GhVMQrofDQnMSMMUiWpX2IRT2ReamK8YQH7KdcUpLt3fEwaTnbur
	y+43ufPhmMEfTu2/sovHUqfkfee1O4Vq1pDUW3OqzvlkZqEFJ9LErV2COifmIRid
	QgzcjWdBNM8FbkXWIbXUsKqqXzi4BX49ZZEQryGCTIrVLv4lo0OLNpn58kcmvAnp
	UiLlTauM232+LsE40rxmMQVvuhpo4yk/SxlkoRlWu6N8f85ZCjdZz/Kej0tCKHOZ
	V1doQw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fc58awx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 06:51:00 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-154e9d2d94fso7901935c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 23:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791355860; x=1791960660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=52nzYadmue4RW4uwDkTflPSkr2BZLVWcOLb+4ASjXtk=;
        b=Cg7pMHTGZRmYjOcfaEvDUjtUll+SS36QFaU37OndegXk3MxVlM8bSp/EBdHtqwSwWO
         lkr8BF79tVbq4KZmwoZpG2EiwVG7TBhEIh2DTBugaJ6i1/zbI4kJ1whmNXjIc0uGA7eF
         A+Pdloulmyl1xtnFKxjEjEnqYjlPiaSz9wjHFD2ejT3YKeFXYSAArt6kqdB7UTKgxOhV
         04cXgbqRjeHanzTccntmjCCD0JRb7v5/d4tIr80nPARNJ+geKMOKn+TKpVhf4Dno6hSp
         tPTNOougKuNKiA8ILO8IEcFTxIwZZLw58QJQPMSDz8+1vjn+KRpsV9YG8LgpCqNuiz6u
         LcmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791355860; x=1791960660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=52nzYadmue4RW4uwDkTflPSkr2BZLVWcOLb+4ASjXtk=;
        b=WPm4zuCBpByapOcvMLf6hz1eDGBNeS8wW2+N97mqd6elri9rU/rdwfhHneb2IPRiLb
         UeBu2McJLLv2dIHC3PyLhzrM9wjhng6Url6MIsTEe/+w2jWk+7cQyyGvQ+GCJmoNTbCu
         cz8xe1kgQRS0UUvYf/iR75CHOzdrCvdYh4ThDqKDZREeNbpzYOP5GhoixdGq6gQDlmr4
         Dty0QRz5Ay9v+YKKRZAFV0m01UZrWoC5lPqhQcFf/roUco+ezMPt7IOnBBLDO9CXzt0R
         6VeO1yygDemwlZhWRHJ4N+qmATIQY6nUPze2bgPwHzb1997j9l75gyvZhmmKJeTiz8e3
         LrIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBk3pVESMKKjbt58SFLgvhi5c1KGMeQpeS916ExA1MaIkWUOoAbKTFrWAe7XOeVn02iuLSi36aha0klWM=@vger.kernel.org
X-Gm-Message-State: AFuF++nhtEVstAsTiqpEA9qDisKcffGLbCzaHByqGIVT5495sYdIhflZ
	Chx5r/MKay+XeZM0U4jN7XiY7nmrC6mQxdZIPg5wz/hvJObTwTl2H3++OPJkppmdW5WmIn/tgW/
	q5Mm6hziEiKO6qloBEfbJpp40kFs9vbPOs86nTNaClDMCbC2HXJVlfSKTaPJY77HnzBzavz6VWl
	0=
X-Gm-Gg: AYBFou3HAIsIyHrtehtLje3DyJ+nt7WiuBtCInGp0gTN4p0MpGmI1ysb2g+Xlq4maVB
	BFqHg4AAtUdll1Qj5CjlpxKj0xxToZdk+HvG2RuXbRT27kLJX4O5apTCIGmcvgmTy3BLV/rzQvi
	/V9F8FRI+vYwaa2HZDvk/CQipOXcn6mRyvoHvXQ+PrXZR3jPqDy+aCtMZrcTWLihQgKBe9jU1zP
	eQ+pZn+wBmQhV6e7NKVIzJbSPy7X74E7rxijHe8qUK3N65OLGOKchFTWa40yDxS34mxhJfpZsMa
	okyT7aT848xSfWPnZwqd7+cS6d4CGzJ8ycuCsJLLuq/a2ENsiNDEuRd7S7OXftGZQg/O1QLlrzY
	+qYw21vRfz551FaG6Dd5rER+RrtR1VRZb0GJqV1XLuh33/FVAIghnDsnqMYp9YElieetHx0QA5H
	fIi+Dc+NYWPlVo5plnXsmxSEaOqJvdS6PnsjM=
X-Received: by 2002:a05:7022:28d:10b0:144:f47b:58b0 with SMTP id a92af1059eb24-1620ab90a5cmr1315394c88.47.1791355859855;
        Tue, 06 Oct 2026 23:50:59 -0700 (PDT)
X-Received: by 2002:a05:7022:28d:10b0:144:f47b:58b0 with SMTP id a92af1059eb24-1620ab90a5cmr1315366c88.47.1791355859178;
        Tue, 06 Oct 2026 23:50:59 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm7374730c88.2.2026.10.06.23.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 23:50:58 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 12:20:44 +0530
Subject: [PATCH 1/4] interconnect: icc-clk: support N:1 master-to-slave
 topology
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-ipq9650_apss_clk-v1-1-fd4c2b3cbdea@oss.qualcomm.com>
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
In-Reply-To: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyNyBTYWx0ZWRfX8XMvbQHCa4WA
 MnPI4h76kCnBiWky0SieYtrPayuDAZ5f4oP62H+uKsfPG26LiCIeeWInFTMbwG2JFQJK3EMCUYZ
 4yq0vE64BnpF/MVNWDHTpmRu7HNmLXc=
X-Proofpoint-GUID: E2yCSldc7h5YGHJEYe3_Gt6y6zTr5Mjg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyNyBTYWx0ZWRfX3RmoM5Sfu7Ya
 9dkYhux1znhx5fAtpOrty0YyTKQ55rsU81BXDXCz9i6mS0rAve8+dV6VgKxaRTubwLMC511QmZ5
 tNpC9IL9RIc3zeny+Fdzbl81NRx+8q++TsgIcXtbY66j0x85AyfMIb8/gKhjz66dzt1JjDbe0Up
 TQI6BbfTj8nEgoNvmoXTWWWcsArw+eWLbsqrouI7vkHob5qG9D7MNzVKCKe/8QulaY5DWe7bl6x
 w8Ye+pYlCPda2DctrbZJzKQMg5zudc6/znQBEpb0DMC3bR8y/KlJQD784mp4WV+XmRqL3XVz/i9
 D0PYls0bNiv2yE7HaI57aVNIYVztOvCgD+3rMsPCo89gEApo4hOsH+VnNqc44qX5Jr2kOZTArjC
 fYJ/GecuiMMrI6tXzDA7qE/b99LyGYjftJHdz/tt0fnN+1MDtYZes7mXOlOCJSDgFBPqU5JN5Ep
 16x16SE20GBE79xOh3w==
X-Proofpoint-ORIG-GUID: E2yCSldc7h5YGHJEYe3_Gt6y6zTr5Mjg
X-Authority-Analysis: v=2.4 cv=a6+lZkSF c=1 sm=1 tr=0 ts=6ac5ebd4 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Wq9wk9AxASzClJd40FsA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070027

icc_clk_register() assumes each icc_clk_data entry describes a unique
master/slave pair and creates both nodes for every entry. When several
masters share the same slave_id, the shared slave node is created and
added again on each later entry. icc_node_create() returns the existing
node, so icc_node_add() hits WARN_ON(node->provider):

  WARNING: drivers/interconnect/core.c:1103 at icc_node_add+0x10c/0x120
  Call trace:
   icc_node_add+0x10c/0x120 (P)
   icc_clk_register+0x1a4/0x214
   devm_icc_clk_register+0x18/0x80
   qcom_cc_really_probe+0x4c8/0x514
   apss_ipq9650_probe+0xc0/0x108

This topology is needed on IPQ9650, where the silver and gold CPU
clusters both vote on the single L3 clock through a shared SLAVE_L3
node.

The onecell table is also filled in registration order, so xlate only
works when the node IDs happen to match that order. Size the table by
the highest node ID, index it by ID, and skip slave creation when the
node is already registered.

icc_clk_set() also passes only the requesting node's bandwidth to
clk_set_rate(), so the last writer wins. A low vote from one master can
then lower the clock below what another master asked for. Before setting
the rate, take the highest peak bandwidth across all nodes that share
the clock.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/interconnect/icc-clk.c | 45 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 7 deletions(-)

diff --git a/drivers/interconnect/icc-clk.c b/drivers/interconnect/icc-clk.c
index 93c030608d3e..567d071fade8 100644
--- a/drivers/interconnect/icc-clk.c
+++ b/drivers/interconnect/icc-clk.c
@@ -24,7 +24,10 @@ struct icc_clk_provider {
 
 static int icc_clk_set(struct icc_node *src, struct icc_node *dst)
 {
+	unsigned long rate = icc_units_to_bps(src->peak_bw);
+	struct icc_provider *provider = src->provider;
 	struct icc_clk_node *qn = src->data;
+	struct icc_node *node;
 	int ret;
 
 	if (!qn || !qn->clk)
@@ -45,7 +48,21 @@ static int icc_clk_set(struct icc_node *src, struct icc_node *dst)
 		qn->enabled = true;
 	}
 
-	return clk_set_rate(qn->clk, icc_units_to_bps(src->peak_bw));
+	/*
+	 * Multiple master nodes can share the same underlying clock (N:1
+	 * topology, e.g. several CPU clusters voting on one L3 clock).
+	 * Aggregate the peak bandwidth across all of them before setting
+	 * the rate, otherwise the last caller wins and can undervote what
+	 * another master already asked for.
+	 */
+	list_for_each_entry(node, &provider->nodes, node_list) {
+		struct icc_clk_node *n = node->data;
+
+		if (n && clk_is_match(n->clk, qn->clk))
+			rate = max(rate, icc_units_to_bps(node->peak_bw));
+	}
+
+	return clk_set_rate(qn->clk, rate);
 }
 
 static int icc_clk_get_bw(struct icc_node *node, u32 *avg, u32 *peak)
@@ -82,12 +99,17 @@ struct icc_provider *icc_clk_register(struct device *dev,
 	struct icc_provider *provider;
 	struct icc_onecell_data *onecell;
 	struct icc_node *node;
-	int ret, i, j;
+	unsigned int max_id = 0;
+	int ret, i;
 
-	onecell = devm_kzalloc(dev, struct_size(onecell, nodes, 2 * num_clocks), GFP_KERNEL);
+	/* Find the highest node ID to size the xlate lookup table */
+	for (i = 0; i < num_clocks; i++)
+		max_id = max(max_id, max(data[i].master_id, data[i].slave_id));
+
+	onecell = devm_kzalloc(dev, struct_size(onecell, nodes, max_id + 1), GFP_KERNEL);
 	if (!onecell)
 		return ERR_PTR(-ENOMEM);
-	onecell->num_nodes = 2 * num_clocks;
+	onecell->num_nodes = max_id + 1;
 
 	qp = devm_kzalloc(dev, struct_size(qp, clocks, num_clocks), GFP_KERNEL);
 	if (!qp)
@@ -106,7 +128,7 @@ struct icc_provider *icc_clk_register(struct device *dev,
 
 	icc_provider_init(provider);
 
-	for (i = 0, j = 0; i < num_clocks; i++) {
+	for (i = 0; i < num_clocks; i++) {
 		qp->clocks[i].clk = data[i].clk;
 
 		node = icc_node_create(first_id + data[i].master_id);
@@ -126,7 +148,16 @@ struct icc_provider *icc_clk_register(struct device *dev,
 		icc_node_add(node, provider);
 		/* link to the next node, slave */
 		icc_link_create(node, first_id + data[i].slave_id);
-		onecell->nodes[j++] = node;
+		onecell->nodes[data[i].master_id] = node;
+
+		/*
+		 * Slave node may already be registered by an earlier
+		 * master in an N:1 topology (multiple masters sharing
+		 * the same slave, e.g. several CPU clusters voting on
+		 * one L3 clock).
+		 */
+		if (onecell->nodes[data[i].slave_id])
+			continue;
 
 		node = icc_node_create(first_id + data[i].slave_id);
 		if (IS_ERR(node)) {
@@ -143,7 +174,7 @@ struct icc_provider *icc_clk_register(struct device *dev,
 
 		/* no data for slave node */
 		icc_node_add(node, provider);
-		onecell->nodes[j++] = node;
+		onecell->nodes[data[i].slave_id] = node;
 	}
 
 	ret = icc_provider_register(provider);

-- 
2.34.1

