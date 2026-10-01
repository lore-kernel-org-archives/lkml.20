Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D237E42E8E6
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 05:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832241; cv=none; b=t/9aoo9DtfX1dBmCG/XitObqVGhdTepK5ZaLGXGaOjDksOuLxm5GIww0SttlboPwN6uW7DsyG9X75k+K3c3yrEvWJqJG3qknBgHUoPvj9nwumfrBvf8HDVayR8Rkgnh09CSv89jZJctygEAeT5lvm4DsPjybHVdjWi6eG8tqH2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832241; c=relaxed/simple;
	bh=JYjzrKRW4wOBZXxv5pXWs0Ogz4DwnA89XoEQh4F0Nas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CFNgtEp9ADdhYn4+p0juandUe5murkLpV+jAXsSbQdX72KxnNhBWnc+Imu17c0XeW/Q22IDGvK+iiUikNIBSuyjWgY3nQrglJUkluX3sTLaG8DG/rZgO8Y+mEgwzZJkVvisXn6JvzZuPuLo0f79TxzKzXASbKmvJB3pgZnAndpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ji/BgsvI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IevF2ty7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ji/BgsvI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IevF2ty7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6915GJHo1952894
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 05:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N+RkyGHAtZ4
	jeVfeYfJcIP0Ux1XRCteHgZPTH9XttmY=; b=ji/BgsvIC+b247yWn+Xq+qQxWUc
	A8AqWvwnSt25Tjn1VYXPsJdndfKwwtDGTZkXJRC7iWlHVHDQWWXoFRKTNZQZSxvj
	QhmQ3xp0RU1FXc/dfKBgzOoy4Ka1+1DkX3vEkz01fiysh2L8x1Bs9GKkS3xrD4Cp
	w3ceBBVTU3SyGeuCpYXxhP+sDDKqAUdlNpQFZP60cicErZsg4u893i3nYckMLqEA
	xXnkgw/Lb5pkx2ZDYG01n7+yayA7DYIy6a2Ek6j900Axu6zRU9BnB9I+jjVwsIQm
	TNVdo6NQuacZduFc3wrucnIxY6akY1/R+lMqKuxzso+uTafpzAFKflcc7Xw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1h7nr19t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:23:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e2d83bb68cso15744475ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790832236; x=1791437036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N+RkyGHAtZ4jeVfeYfJcIP0Ux1XRCteHgZPTH9XttmY=;
        b=IevF2ty76esUl7pUqx3w7J5B2caHfJCsYprq2e7gR8feVWc63rgJswqP87Cm8bhXoJ
         Ir8IRXwUN8oh3j4yzeDImOht/C4zabAA7si9sie7qpuUaKpTIbdFohCNhXcKurDKgVh6
         F1E0q1TvTUqPcQBJ5Fq4WwVBPB+NLez1VMmpmGl516ove416LT1XuvIUJgiPXRzwblea
         bzCOFrgFkee2/OrkFFE8kc/b4sRDoOrBZITKihGDjHoAHeXgJabY1xZEW9ohgy2Ia2rJ
         JiJX1yk3hBu4QCq9FH3MOI2jPAnNF1/SrUVw1r7uR7+9dvT4YrI60798c4J2HxyvA0Gc
         IjLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832236; x=1791437036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N+RkyGHAtZ4jeVfeYfJcIP0Ux1XRCteHgZPTH9XttmY=;
        b=AKluKdF/wyhXO4nYkZ/K63hLTM+01lt1kayVchdpNBA7qeE9Qy1bqAGREogO4ZF+G6
         0b6CtVXzLTPP3AGGFfQVQJUPsMEX08iEH8B0Royh7qjRbDwO06PHGsAeUmTFyjCKadKW
         XH+KdIouXGpvJx0kTzCY/D2BdpHDGOKbVOkNB2if6D0Hgshqz7rn/b9r7isPC2DTQuQi
         zxB3Hb2Nblkm8xhFd4iI12TjkSWnJbR9Ior+3mUNndV/9K01KpxP1hUyirAituka19lL
         RRJ1eQPP/o9ZmdXEYT3+0xbmMUK44FOGY1JrUNtzNa/HN53DgcBJIKVZPA4lWcAqlOji
         +wpA==
X-Forwarded-Encrypted: i=1; AKwUvBy3eJrhCcqztx/G/dJcNeUqtymB0CUihPrvpA/vNVBttiYULYuv6jN0NSmh4CVgrncgeEZ0yH0WVCFn1LA=@vger.kernel.org
X-Gm-Message-State: AFq9FYII12jOOYYroseOXtnZZqly6WaCRtQSZJOGDyzsPuiVVsZILxKp
	JpiDJFtRhI/QQpsV9auDoZc8tv68oGk+AXcOrNysONOf4hhrEHWxllvHQHO5Bt/ijwTKFZiIMdU
	o42N2UXDls1uO5KS5j+aF7Sqn8aTD4h3K+2tqxxPTx1d3umDCSXwXlgzJQN/Sx0Su+MM=
X-Gm-Gg: AYBFou14KZv2UJIRon7/vWcES1e73FYKgqRFZc0LNn5CWQ2ylmEe55DC9TiUK110aNB
	xprtLXfnfOjzQ043IUykfI+z6dFlhPRyql7LUKLv3bAF6Pfa5Apz/bfbza7/OTkg25rQIOkJeCD
	u9H+xhp5YWvC1CFnXk/A0QidTlZhDmrNrgbVKMVjME4DJ1bmdEZEo5dI3bVdFmq8ktZ4dPObB6z
	1klOg8v0DGcoKgWzQghqWPmNYmYcs7yydFGB28XPJ3ML3rABB2QavaeyPMnMb+IfmNRVs1eM8Vc
	hjaNHhJ42weA8Bq5RW3VIS6aLR/fkKWVPni/MlyH/WjfxkXeVE3OkhkIjTeekSvHlWGHfFVTDQh
	eL9wu0Vy4H/yXkOQPuaMMgGUM4z5DhVK7ZNtPKUuTNEWM9mzvLeGXiKA7l2XiIL2NiG14ksc3OL
	m9iLUS6UahQb/YlgLGhXt721ZD
X-Received: by 2002:a17:903:b8e:b0:2d6:fd55:3a9d with SMTP id d9443c01a7336-2e2e48b8521mr28656335ad.3.1790832236338;
        Wed, 30 Sep 2026 22:23:56 -0700 (PDT)
X-Received: by 2002:a17:903:b8e:b0:2d6:fd55:3a9d with SMTP id d9443c01a7336-2e2e48b8521mr28656015ad.3.1790832235856;
        Wed, 30 Sep 2026 22:23:55 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2e300b851b9sm5152715ad.78.2026.09.30.22.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:23:55 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v6 04/14] gtrace: Add functions to create/destroy a trace component path
Date: Thu,  1 Oct 2026 10:52:15 +0530
Message-ID: <20261001052243.3042627-5-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OI6yTiaB c=1 sm=1 tr=0 ts=6abdee6d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Z2DXsEUlK3EcHYVHAYUA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX61ZlG9/AzieM
 sKB8TDvTkVNzz80Z7VVmaW8ngSbh/G1ngeJUrIKn+x3ErnMSOs7CQC8riHYlP5bThu6oXGmL0kH
 LwBDD6o7fS+lcx33jB8ieqdGlv7kuZw=
X-Proofpoint-ORIG-GUID: 5LGZvzzDIVCOuLmLUjmKDKlOgm-DlbMV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX3Bn7yQ3IAtLs
 PsQF99XkVeN9U8hG5WQlO0i4foQ972YKexDBh2kH/CzgILrVzPJZJX+Vm3DI+Uohe458azzcJAZ
 NUCTi4QeGoppURXZT6lV5+OrFP3/tJYOHuMu1dD3atJhTJvjHJ+XfxFoeKvTBjb7vrnYtnOKsX/
 TTvK3RamGIDVM0W+w3xEV03JVZrsVh0V/jl93d3vWZ4+XNH+vqN/z+PPxea9RTwNT4zpXY6qkPJ
 9qcHOcccqrMjk0JylgIuauPtxOXcO+VpktPpm7/kKLjy6lU4XCrQ0nHfA0MZ84cdZj3i4hTRDda
 q6H4BGYAC23VilHl2tCcly5pt2wrWNLWIIER3RZ/fqiBzuA4Twi6vL64FQUUGsMpbQHvgOK+Qnw
 bN5u05dWWlw591XLB9WDYt9hkZNvh9unTqDGO0ksEaqkcsO3CexYd9lHtoLomxuVp7n7SA4C003
 XELREbigks7/vZKu/wA==
X-Proofpoint-GUID: 5LGZvzzDIVCOuLmLUjmKDKlOgm-DlbMV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010021

From: Anup Patel <anup.patel@oss.qualcomm.com>

Trace needs to be configured on a chain of trace components which are
connected to each other. These chain of components is also referred
to as trace component path. Add functions to create/destroy a trace
component path which will be later used by gtrace perf support.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Co-developed-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/gtrace-core.c | 241 +++++++++++++++++++++++++
 include/linux/gtrace.h                 |  24 +++
 2 files changed, 265 insertions(+)

diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index d374c679a649..f750025104ec 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -26,6 +26,7 @@ struct gtrace_comp_priv {
 	struct gtrace_component comp;
 	u32 type_idx;
 	bool ready;
+	bool visited;
 };
 
 #define to_gtrace_comp_priv(__comp)	\
@@ -224,6 +225,62 @@ int gtrace_reset_component(struct gtrace_component *comp)
 }
 EXPORT_SYMBOL_GPL(gtrace_reset_component);
 
+static int __gtrace_walk_output_components(struct gtrace_component *comp,
+					   bool *stop, void *priv,
+					   int (*fn)(struct gtrace_component *comp, bool *stop,
+						     struct gtrace_connection *stop_conn,
+						     void *priv))
+{
+	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
+	struct gtrace_connection *conn, *stop_conn = NULL;
+	struct gtrace_platform_data *pdata = comp->pdata;
+	int i, ret;
+
+	if (cpriv->visited) {
+		dev_err(&comp->dev, "loop detected, please fix the firmware\n");
+		return -ELOOP;
+	}
+	cpriv->visited = true;
+
+	for (i = 0; i < pdata->nr_outconns; i++) {
+		conn = pdata->outconns[i];
+		ret = __gtrace_walk_output_components(conn->dest_comp, stop, priv, fn);
+		if (ret) {
+			cpriv->visited = false;
+			return ret;
+		}
+
+		if (*stop) {
+			stop_conn = conn;
+			break;
+		}
+	}
+
+	ret = fn(comp, stop, stop_conn, priv);
+	cpriv->visited = false;
+
+	return ret;
+}
+
+int gtrace_walk_output_components(struct gtrace_component *comp, void *priv,
+				  int (*fn)(struct gtrace_component *comp, bool *stop,
+					    struct gtrace_connection *stop_conn,
+					    void *priv))
+{
+	bool stop = false;
+	int ret;
+
+	if (!comp || !fn)
+		return -EINVAL;
+
+	mutex_lock(&gtrace_mutex);
+	ret = __gtrace_walk_output_components(comp, &stop, priv, fn);
+	mutex_unlock(&gtrace_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gtrace_walk_output_components);
+
 struct gtrace_component *gtrace_cpu_source(unsigned int cpu)
 {
 	if (!cpu_present(cpu))
@@ -431,6 +488,190 @@ void gtrace_unregister_component(struct gtrace_component *comp)
 }
 EXPORT_SYMBOL_GPL(gtrace_unregister_component);
 
+struct gtrace_path_node {
+	struct list_head		head;
+	struct gtrace_component		*comp;
+	struct gtrace_connection	*conn;
+};
+
+struct gtrace_component *gtrace_path_source(struct gtrace_path *path)
+{
+	struct gtrace_path_node *node;
+
+	node = list_first_entry(&path->comp_list, struct gtrace_path_node, head);
+	return node->comp;
+}
+EXPORT_SYMBOL_GPL(gtrace_path_source);
+
+struct gtrace_component *gtrace_path_sink(struct gtrace_path *path)
+{
+	struct gtrace_path_node *node;
+
+	node = list_last_entry(&path->comp_list, struct gtrace_path_node, head);
+	return node->comp;
+}
+EXPORT_SYMBOL_GPL(gtrace_path_sink);
+
+static int gtrace_assign_trace_id(struct gtrace_path *path)
+{
+	const struct gtrace_driver *gtdrv;
+	struct gtrace_component *comp;
+	struct gtrace_path_node *node;
+	int trace_id;
+
+	list_for_each_entry(node, &path->comp_list, head) {
+		comp = node->comp;
+		gtdrv = to_gtrace_driver(comp->dev.driver);
+
+		if (!gtdrv || !gtdrv->get_trace_id)
+			continue;
+
+		trace_id = gtdrv->get_trace_id(comp, path->mode);
+		if (trace_id > 0) {
+			path->trace_id = trace_id;
+			return 0;
+		} else if (trace_id < 0) {
+			return trace_id;
+		}
+	}
+
+	return 0;
+}
+
+static void gtrace_unassign_trace_id(struct gtrace_path *path)
+{
+	const struct gtrace_driver *gtdrv;
+	struct gtrace_component *comp;
+	struct gtrace_path_node *node;
+
+	list_for_each_entry(node, &path->comp_list, head) {
+		comp = node->comp;
+		gtdrv = to_gtrace_driver(comp->dev.driver);
+
+		if (!gtdrv || !gtdrv->put_trace_id)
+			continue;
+
+		gtdrv->put_trace_id(comp, path->mode, path->trace_id);
+	}
+}
+
+static bool gtrace_path_ready(struct gtrace_path *path)
+{
+	struct gtrace_comp_priv *cpriv;
+	struct gtrace_path_node *node;
+
+	list_for_each_entry(node, &path->comp_list, head) {
+		cpriv = to_gtrace_comp_priv(node->comp);
+		if (!cpriv->ready)
+			return false;
+	}
+
+	return true;
+}
+
+struct build_path_walk_priv {
+	struct gtrace_path		*path;
+	struct gtrace_component		*sink;
+};
+
+static int build_path_walk_fn(struct gtrace_component *comp, bool *stop,
+			      struct gtrace_connection *stop_conn,
+			      void *priv)
+{
+	struct build_path_walk_priv *ppriv = priv;
+	struct gtrace_path *path = ppriv->path;
+	struct gtrace_path_node *node;
+
+	if ((!ppriv->sink && gtrace_is_sink(comp->pdata)) ||
+	    (ppriv->sink && ppriv->sink == comp))
+		*stop = true;
+
+	if (*stop) {
+		node = kzalloc_obj(*node);
+		if (!node)
+			return -ENOMEM;
+		INIT_LIST_HEAD(&node->head);
+		gtrace_get_component(comp);
+		node->comp = comp;
+		node->conn = stop_conn;
+		list_add(&node->head, &path->comp_list);
+	}
+
+	return 0;
+}
+
+static void gtrace_release_path_nodes(struct gtrace_path *path)
+{
+	struct gtrace_path_node *node, *node1;
+
+	list_for_each_entry_safe(node, node1, &path->comp_list, head) {
+		list_del(&node->head);
+		gtrace_put_component(node->comp);
+		kfree(node);
+	}
+}
+
+struct gtrace_path *gtrace_create_path(struct gtrace_component *source,
+				       struct gtrace_component *sink,
+				       enum gtrace_component_mode mode)
+{
+	struct build_path_walk_priv priv;
+	struct gtrace_path *path;
+	int ret = 0;
+
+	if (!source || mode >= GTRACE_COMPONENT_MODE_MAX) {
+		ret = -EINVAL;
+		goto err_out;
+	}
+
+	path = kzalloc(sizeof(*path), GFP_KERNEL);
+	if (!path) {
+		ret = -ENOMEM;
+		goto err_out;
+	}
+	INIT_LIST_HEAD(&path->comp_list);
+	path->mode = mode;
+	path->trace_id = GTRACE_INVALID_TRACE_ID;
+
+	priv.path = path;
+	priv.sink = sink;
+	ret = gtrace_walk_output_components(source, &priv, build_path_walk_fn);
+	if (ret < 0)
+		goto err_release_path_nodes;
+
+	/* Before proceeding, check that a valid path was built. */
+	if (list_empty(&path->comp_list)) {
+		ret = -ENODEV;
+		goto err_release_path_nodes;
+	}
+
+	if (!gtrace_path_ready(path)) {
+		ret = -EOPNOTSUPP;
+		goto err_release_path_nodes;
+	}
+
+	ret = gtrace_assign_trace_id(path);
+	if (ret < 0)
+		goto err_release_path_nodes;
+
+	return path;
+
+err_release_path_nodes:
+	gtrace_release_path_nodes(path);
+	kfree(path);
+err_out:
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(gtrace_create_path);
+
+void gtrace_destroy_path(struct gtrace_path *path)
+{
+	gtrace_unassign_trace_id(path);
+	gtrace_release_path_nodes(path);
+	kfree(path);
+}
+EXPORT_SYMBOL_GPL(gtrace_destroy_path);
+
 int __gtrace_register_driver(struct module *owner, struct gtrace_driver *gtdrv)
 {
 	gtdrv->driver.owner = owner;
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index 5368dca0e936..2c3be4d161c6 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -229,6 +229,10 @@ int gtrace_enable_component(struct gtrace_component *comp);
 int gtrace_disable_component(struct gtrace_component *comp);
 int gtrace_reset_component(struct gtrace_component *comp);
 
+int gtrace_walk_output_components(struct gtrace_component *comp, void *priv,
+				  int (*fn)(struct gtrace_component *comp, bool *stop,
+					    struct gtrace_connection *stop_conn,
+					    void *priv));
 struct gtrace_component *gtrace_cpu_source(unsigned int cpu);
 
 struct gtrace_component *gtrace_register_component(struct gtrace_component_id *id,
@@ -239,6 +243,26 @@ void gtrace_unregister_component(struct gtrace_component *comp);
 int gtrace_of_parse_outconns(struct gtrace_platform_data *pdata);
 int gtrace_of_parse_inconns(struct gtrace_platform_data *pdata);
 
+/**
+ * struct gtrace_path - Representation of a trace path from source to sink.
+ * @comp_list: List of trace components in the path.
+ * @mode:      Usage mode for trace components.
+ * @trace_id:  ID of the trace source (typically hart/CPU id).
+ */
+struct gtrace_path {
+	struct list_head		comp_list;
+	enum gtrace_component_mode	mode;
+	u32				trace_id;
+#define GTRACE_INVALID_TRACE_ID	0
+};
+
+struct gtrace_component *gtrace_path_source(struct gtrace_path *path);
+struct gtrace_component *gtrace_path_sink(struct gtrace_path *path);
+struct gtrace_path *gtrace_create_path(struct gtrace_component *source,
+				       struct gtrace_component *sink,
+				       enum gtrace_component_mode mode);
+void gtrace_destroy_path(struct gtrace_path *path);
+
 /**
  * struct gtrace_driver - Representation of a trace driver.
  * @id_table:      Table to match components handled by the driver.
-- 
2.43.0

