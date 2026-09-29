Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F354E3227
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672154; cv=none; b=KWt+DBfDBuiZ5BqWlnFhSfP/q0wrUewdhxMHI3xM/ZOUlfFTeOo1+piC006B3QlmVRTtmCe3cAWPBe+M7RmJ9XotPLkg4kBlZAtCxh9Ov19u53YEV2kl9KMl/7xjGry4WtCEmbnSzVUTMkBFvk4RlbeE/AoDs8NByDOI7txoJHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672154; c=relaxed/simple;
	bh=bHaDSjXWbZXbjzHnaeozTdWBw06rVQL/VsTGMb6wq6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i+LsuJ6uBjHJI6hnUy/kBQ4sCqRcqLYRiZ09sAUZ3zMMMSkDZMSJ3+bAXdxE+4xMC7uIecb0bZEh8kTlN3kicuRFmX+gx8uHSDkTu9Bf45pUdh8HQv0UNUGoFxAIGMputqEjk5IZO+y1sH4BZzO2UpJdNYJx69HF5QslyrCw3n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gtR15o0I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K9B4murA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gtR15o0I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K9B4murA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7U1E34087181
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:sender:subject:to; s=qcppdkim1; bh=DfhU
	act2XGE2bBOExBgkUlROXqvCW+0SiOtMheORWPs=; b=gtR15o0IoQGTPDu7h1oa
	BoPjYLSNSSwsYEhyQ4dgHc/VfdUs+sM3Vxj6G0IXarazd/gF6EUdzKVBPDIW2bRM
	loNH4T+oFj28MGIWw56OWNrwi8N18m2HN4UzT3pSL5+BnCrxzq+0/snO0Vy1eJHB
	Zg07Pc/H/6u0LkuWxR6nv7pHFjpZ9oo+Z69yK4tyFVoXait0maoyA/nz8htmom6c
	j1inTrXOJLM959zUcYjnYJM1LL9s+0Ekcwuk1YC6GBO3aWWApkmR/Wa/Ie9vKwiP
	6S5JFpqQpIzEdSAaL3dcZEHD2pc2fQzCLRMjNwlaYeoPromHUMmMDn+iRNytUoSC
	xA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4t5sj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:55:51 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34afa104860so932814eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790672151; x=1791276951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DfhUact2XGE2bBOExBgkUlROXqvCW+0SiOtMheORWPs=;
        b=K9B4murARAZNnuHaafXwn38smCbUeSx8FvOOrQ0ey8l0eV/Q6cMD//lBKdzkXUmeAj
         PpihdMDQh07/5khQdje6r9NMGauhfSO+Cc2fCUfQG/ibHu9/pEQ3O+cgDv8KxFlUWLND
         PsPa2PkPAF1bSfdM0lgeKY7AAzLr2xi8Mh3KrKCnprdpmnYlHbuwi4WNd2rXrwsdnQDP
         DEG+DNA+dtYs1kdzC2xxe37xTFzebaai5Qq2Z9L17gWbQS0u5xXQsavJfWSGK3BXYlgP
         D8xZzo+kHEm0wBUBmxkFjnUQEXRoAM3grhpCLdAqjz1AFYuIieMDGoHm+D3h1PQTJXXd
         SkYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672151; x=1791276951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DfhUact2XGE2bBOExBgkUlROXqvCW+0SiOtMheORWPs=;
        b=TTijZvGk6IIzrmIpND7xsjyBjN+RdcWkXnqIz5r1UJKZE3yAX9hV0rC2TNh8XetOda
         EqLBFmG+/l6MlvQPC/GY2iK2GxHIK7OIgoBeQvFG9HOjrgbRfTLhqOWJ1JIC0Lpg+WCs
         qEc+vRXZk2bkvEgP2At/GQ91/4YbS2ogVfWc1ypnft8+vaLPXT+FCbzPDyptQ7mijZlz
         9zRLxdBb2nZwpT+ar8dCmONWYK0yy7YObcJ3fNL0/sNM7Hw3J306zrWVeLDpW5UK+9nT
         772bDsO1RWY+A8lGaRiAxf28ETgimZBZtAchqDKqSE/0jNgCqIBG+hOFT2+hwZFU7sh/
         IvdQ==
X-Forwarded-Encrypted: i=1; AKwUvByFH7pWkUPV+7xOY9kgKg3avczsT8GzG4M0L+QB/n3DbEOyXZSIYYmQ/EjLh+dFOqVD6etwfk6WWmrlzs8=@vger.kernel.org
X-Gm-Message-State: AFuF++mI3GyoOeL4rGKJ2oiVvFoAbzfKZ5C/t5q3avu1bFIrRAIcIZS3
	wI004aZBJVVVTluJpIJGzs4XqpDblEKERZbxKow8X/DmW7XAQZwWLD7avSpDCdo9bWYGlG9oVbp
	BswhFcu4dNyC8X0zPFD8TvcXkzhqgDg1B4oBiDpZWWTpeDbI/oQcRBLMJC8o4iad/Amg=
X-Gm-Gg: AYBFou3WJHBHWODtVxrIBEMdCcfexAeAWehSrmkLs1TFCxrTjX1+HIjL/gLo8c4nMmD
	yk7R+kimruT6KQlJAMUdtAtNVgIlL3ah7pu1xoIFScAJSt0SzgBD91jXnyZ82Oae+0BhkpYTezd
	zGkyObLYppT1y1zeJDKWCrz9qYzd7h/uTOKFTZKx4258ntxI9n5mwNRTXN+pd4UXZkR7q+Nbcw8
	8KRceJSNBqJP0kq/EEtm18W6DK3yQPFTCsj45Rnuhe0+EvoYyvHMNamNyuc6HflAMAN0LRnzYmZ
	ZkdJJlQMv6lkBPOZbwKjKt/dRQQ+0aiAQPtsEIUT8ZOsWqqJVhfZxRJsDn1G4YAsRClYMkh6JMO
	mbE5yl/A8LBZRlSHJA4QefZcEzRE9yzi7dn5jHlpqUvUCMV0ly751ZC6y
X-Received: by 2002:a05:693c:8802:20b0:34a:48ce:b687 with SMTP id 5a478bee46e88-34a48cec2bbmr4105940eec.32.1790672150830;
        Tue, 29 Sep 2026 01:55:50 -0700 (PDT)
X-Received: by 2002:a05:693c:8802:20b0:34a:48ce:b687 with SMTP id 5a478bee46e88-34a48cec2bbmr4105913eec.32.1790672150226;
        Tue, 29 Sep 2026 01:55:50 -0700 (PDT)
Received: from hu-sunilvl-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144f4eb9esm34294467eec.19.2026.09.29.01.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:55:49 -0700 (PDT)
Sender: Sunil V L <sunil.laxminarasimha@oss.qualcomm.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
X-Google-Original-From: Sunil V L <sunilvl@oss.qualcomm.com
To: linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Sunil V L <sunilvl@oss.qualcomm.com>
Subject: [RFC PATCH 4/5] hwtracing: rvtrace: Move to fwnode_* APIs
Date: Tue, 29 Sep 2026 14:25:23 +0530
Message-ID: <20260929085524.1554507-5-sunilvl@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929085524.1554507-1-sunilvl@oss.qualcomm.com>
References: <20260929085524.1554507-1-sunilvl@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzNSBTYWx0ZWRfX61kmKUmKUJLy
 8yK/QvvAUrnTnfNf05sTEzuiRShpRBClWF+cpbR4T85CakjXxupuNC+LCtPApkAcfyODNp13BGT
 3tCzPiAtE2BE+OX7A1J+NG6Az2dSSwo=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abb7d17 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=R8tqjmwxtafIxTb_AOQA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzNSBTYWx0ZWRfXxwSbPbG4qG1z
 G8W/miEDac5exqdl4PwCcjg/wStEoWve8AlMbHzOBWEbQ6cTMfM4zC5g+vdIW/nPbWRyJbWATop
 TwgZUgQSLxRAKReyn6+w1FWAe/34s4J58Bcz2mkWn7/sVFr2foPznS1FaZW4asUGPt4OAXzxAFq
 hYTvkJfcvl73oF/v2/0M98uhA28+uAkGLXFaMqbPGvRpJmXmjwVItX8iA/wB5Qxq19lh0FCm4EQ
 hPARN35TrtMzQkS6DzWRkeWugSGEh+/XX2h93lpgclyfiSXDxzXupE0cw3ir5uzz41n/8nt7u5q
 n//r3KmBhimOGQQ1SouMTi6zT74+VduSfUlmjtZ0ihvnvcRKmgG62EWG1iiUX5MM8nZIORVO0Hn
 e/sd489yEPGWtJxIZqYGsSzTg3iN+Zp2GYa/bSfLS7ibLMvfbR+PfXyGUzVNLkFYWPAisJzxGeX
 ubvMjYH1Qsp5blknQyA==
X-Proofpoint-GUID: zgTNuP04TZhbzkiw2Dl56aTKjOmtyjrF
X-Proofpoint-ORIG-GUID: zgTNuP04TZhbzkiw2Dl56aTKjOmtyjrF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290035

From: Sunil V L <sunilvl@oss.qualcomm.com>

so that it works for ACPI as well in future.

Signed-off-by: Sunil V L <sunilvl@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/Kconfig            |   4 +-
 drivers/hwtracing/gtrace/rvtrace-platform.c | 131 +++++++++++++-------
 2 files changed, 90 insertions(+), 45 deletions(-)

diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
index e5b62d65e2fd..86322250a6a3 100644
--- a/drivers/hwtracing/gtrace/Kconfig
+++ b/drivers/hwtracing/gtrace/Kconfig
@@ -2,7 +2,7 @@
 
 menuconfig GTRACE
 	tristate "Generic Hardware Trace Support"
-	depends on OF
+	depends on OF || ACPI
 	select PERF_EVENTS
 	help
 	  This framework provides an architecture-neutral kernel interface
@@ -18,7 +18,7 @@ menuconfig GTRACE
 config RVTRACE
 	tristate "RISC-V Trace Support"
 	depends on RISCV
-	depends on OF
+	depends on OF || ACPI
 	depends on GTRACE
 	default RISCV
 	help
diff --git a/drivers/hwtracing/gtrace/rvtrace-platform.c b/drivers/hwtracing/gtrace/rvtrace-platform.c
index f34de9183d9a..12330d9dcddd 100644
--- a/drivers/hwtracing/gtrace/rvtrace-platform.c
+++ b/drivers/hwtracing/gtrace/rvtrace-platform.c
@@ -7,7 +7,6 @@
 #include <linux/gtrace.h>
 #include <linux/io.h>
 #include <linux/of.h>
-#include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/types.h>
@@ -61,52 +60,61 @@ const struct gtrace_hw_ops rvtrace_hw_ops = {
 	.reset		= rvtrace_hw_reset,
 };
 
-static int rvtrace_of_parse_outconns(struct gtrace_platform_data *pdata)
+static int rvtrace_parse_outconns(struct gtrace_platform_data *pdata)
 {
-	struct device_node *parent, *ep_node, *rep_node, *rdev_node;
+	struct fwnode_handle *parent, *ep_node, *rep_node, *rdev_node;
+	struct fwnode_endpoint ep = { 0 };
+	struct fwnode_endpoint rep = { 0 };
 	struct gtrace_connection *conn;
-	struct of_endpoint ep, rep;
+	unsigned int nr_outconns;
 	int ret = 0, i = 0;
 
-	parent = of_get_child_by_name(dev_of_node(pdata->dev), "out-ports");
+	parent = fwnode_get_named_child_node(dev_fwnode(pdata->dev), "out-ports");
 	if (!parent)
 		return 0;
 
-	pdata->nr_outconns = of_graph_get_endpoint_count(parent);
-	pdata->outconns = devm_kcalloc(pdata->dev, pdata->nr_outconns,
+	nr_outconns = fwnode_graph_get_endpoint_count(parent, 0);
+	pdata->nr_outconns = nr_outconns;
+	pdata->outconns = devm_kcalloc(pdata->dev, nr_outconns,
 				       sizeof(*pdata->outconns), GFP_KERNEL);
 	if (!pdata->outconns) {
 		ret = -ENOMEM;
 		goto done;
 	}
 
-	for_each_endpoint_of_node(parent, ep_node) {
+	fwnode_graph_for_each_endpoint(parent, ep_node) {
 		conn = devm_kzalloc(pdata->dev, sizeof(*conn), GFP_KERNEL);
 		if (!conn) {
-			of_node_put(ep_node);
+			fwnode_handle_put(ep_node);
 			ret = -ENOMEM;
 			break;
 		}
 
-		ret = of_graph_parse_endpoint(ep_node, &ep);
+		ret = fwnode_graph_parse_endpoint(ep_node, &ep);
 		if (ret) {
-			of_node_put(ep_node);
+			fwnode_handle_put(ep_node);
 			break;
 		}
 
-		rep_node = of_graph_get_remote_endpoint(ep_node);
+		rep_node = fwnode_graph_get_remote_endpoint(ep_node);
 		if (!rep_node) {
 			ret = -ENODEV;
-			of_node_put(ep_node);
+			fwnode_handle_put(ep_node);
+			break;
+		}
+		rdev_node = fwnode_graph_get_port_parent(rep_node);
+		if (!rdev_node) {
+			ret = -ENODEV;
+			fwnode_handle_put(ep_node);
+			fwnode_handle_put(rep_node);
 			break;
 		}
-		rdev_node = of_graph_get_port_parent(rep_node);
 
-		ret = of_graph_parse_endpoint(rep_node, &rep);
+		ret = fwnode_graph_parse_endpoint(rep_node, &rep);
 		if (ret) {
-			of_node_put(ep_node);
-			of_node_put(rep_node);
-			of_node_put(rdev_node);
+			fwnode_handle_put(ep_node);
+			fwnode_handle_put(rep_node);
+			fwnode_handle_put(rdev_node);
 			break;
 		}
 
@@ -115,21 +123,25 @@ static int rvtrace_of_parse_outconns(struct gtrace_platform_data *pdata)
 		/* The 'src_comp' is set by gtrace_register_component() */
 		conn->src_comp = NULL;
 		conn->dest_port = rep.port;
-		conn->dest_fwnode = of_fwnode_handle(rdev_node);
+		conn->dest_fwnode = rdev_node;
 		fwnode_handle_get(conn->dest_fwnode);
 		conn->dest_comp = gtrace_find_by_fwnode(conn->dest_fwnode);
 		if (!conn->dest_comp) {
 			ret = -EPROBE_DEFER;
-			of_node_put(ep_node);
-			of_node_put(rep_node);
-			of_node_put(rdev_node);
+			fwnode_handle_put(ep_node);
+			fwnode_handle_put(rep_node);
+			fwnode_handle_put(rdev_node);
 			break;
 		}
 
-		pdata->outconns[i] = conn;
-		i++;
+		pdata->outconns[i++] = conn;
+		fwnode_handle_put(rep_node);
+		fwnode_handle_put(rdev_node);
 	}
 
+	if (!ret)
+		pdata->nr_outconns = i;
+
 done:
 	if (ret) {
 		for (i = 0; i < pdata->nr_outconns && pdata->outconns; i++) {
@@ -138,29 +150,69 @@ static int rvtrace_of_parse_outconns(struct gtrace_platform_data *pdata)
 				fwnode_handle_put(conn->dest_fwnode);
 		}
 	}
-	of_node_put(parent);
+	fwnode_handle_put(parent);
 	return ret;
 }
 
-static int rvtrace_of_parse_inconns(struct gtrace_platform_data *pdata)
+static int rvtrace_parse_inconns(struct gtrace_platform_data *pdata)
 {
-	struct device_node *parent;
+	struct fwnode_handle *parent;
 	int ret = 0;
 
-	parent = of_get_child_by_name(dev_of_node(pdata->dev), "in-ports");
+	parent = fwnode_get_named_child_node(dev_fwnode(pdata->dev), "in-ports");
 	if (!parent)
 		return 0;
 
-	pdata->nr_inconns = of_graph_get_endpoint_count(parent);
+	pdata->nr_inconns = fwnode_graph_get_endpoint_count(parent,
+							    FWNODE_GRAPH_DEVICE_DISABLED);
 	pdata->inconns = devm_kcalloc(pdata->dev, pdata->nr_inconns,
 				      sizeof(*pdata->inconns), GFP_KERNEL);
 	if (!pdata->inconns)
 		ret = -ENOMEM;
 
-	of_node_put(parent);
+	fwnode_handle_put(parent);
 	return ret;
 }
 
+#ifdef CONFIG_OF
+static int of_rvtrace_get_cpu(struct device *dev)
+{
+	struct device_node *dn;
+	int cpu;
+
+	if (!dev->of_node)
+		return -1;
+
+	dn = of_parse_phandle(dev->of_node, "cpus", 0);
+	if (!dn)
+		return -1;
+
+	cpu = of_cpu_node_to_id(dn);
+	of_node_put(dn);
+
+	return cpu;
+}
+#else
+static int of_rvtrace_get_cpu(struct device *dev)
+{
+	return -1;
+}
+#endif
+
+/*
+ * rvtrace_get_cpu - Find the logical CPU id of the CPU associated
+ * with this rvtrace device.
+ *
+ * Returns the logical CPU id when found.
+ */
+static int rvtrace_get_cpu(struct device *dev)
+{
+	if (is_of_node(dev_fwnode(dev)))
+		return of_rvtrace_get_cpu(dev);
+
+	return -1;
+}
+
 static int rvtrace_platform_probe(struct platform_device *pdev)
 {
 	struct gtrace_platform_data *pdata;
@@ -168,7 +220,6 @@ static int rvtrace_platform_probe(struct platform_device *pdev)
 	struct gtrace_component_id id;
 	struct gtrace_component *comp;
 	u32 impl, type, major, minor;
-	struct device_node *node;
 	struct resource *res;
 	int gtype;
 	int ret;
@@ -189,24 +240,18 @@ static int rvtrace_platform_probe(struct platform_device *pdev)
 	if (!pdata->base)
 		return dev_err_probe(dev, -ENOMEM, "failed to ioremap %pR\n", res);
 
-	pdata->bound_cpu = -1;
-	node = of_parse_phandle(dev_of_node(dev), "cpus", 0);
-	if (node) {
-		ret = of_cpu_node_to_id(node);
-		of_node_put(node);
-		if (ret < 0)
-			return dev_err_probe(dev, ret, "failed to get CPU id for %pOF\n", node);
-		pdata->bound_cpu = ret;
-	}
-
+	pdata->bound_cpu = rvtrace_get_cpu(dev);
+	if (pdata->bound_cpu < 0)
+		return dev_err_probe(dev, pdata->bound_cpu,
+				     "failed to get bound CPU\n");
 	/* Default control poll timeout */
 	pdata->control_poll_timeout_usecs = 10;
 
-	ret = rvtrace_of_parse_outconns(pdata);
+	ret = rvtrace_parse_outconns(pdata);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to parse output connections\n");
 
-	ret = rvtrace_of_parse_inconns(pdata);
+	ret = rvtrace_parse_inconns(pdata);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to parse input connections\n");
 
-- 
2.43.0

