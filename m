Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.92.39.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725372;
	b=2WuxhIPciFOw4n2mO3bI2HnJmdDnE6t/Hkd9fkmqIWB3nJX9lfDeNF4xcGXeW3XlDHii
	 i+H4gxIE0X6S+BVdgJEtoqGKCdBCi1RHNQ1ngdDXMIqussTYO5eJLL88RiFwFOtXfHv5h
	 rc4sssWJNpksXuX7vJl7ooPnQwNC6XK1dr397uRoU42TX8CVIQBVTdr8+ZMPWcg3M1PYM
	 xRPKM59I47tSXdoTooVy/URoy7d2tVJ2fZaX9p74PzaT2MRg7F6Cpd8pQBFBIujmxfW/C
	 9f1+NBpDFpSUbOMbszJ5AduDCqwj6NLNRDEhRRjKu3n1d+P7umpQDSFR5gUe0jbAk/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725372;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=P7Y0HqqweaUG6sybM7W7gpXncgeyqYn9AypD9au0wmQ=;
	b=X7qTwS986ggiK5PdCAgvhsaI4GyBiL6j60W52/quoYS9LGqBXGuFSzLRIaGrhaebhAvj
	 k5KkVrXWr/P1DWhohg3vZwo/XnFyV5HuKSwU4JRuU1+yv/DPbOQMPpU7GVn7iY8xS9UvY
	 rERLru8SPNXsoabdJAYfUozG2ulKr7hcf9b/l23eVaOFdYaDUeUfQHZQbDFk3lxq/KCHt
	 IcQNn21Si2VAZYWcTEb5ltYQGne6vTEh4uGJ4fUVuf058DJ3CcQFHlggp7skOujbZHfoK
	 XGXznhUCb1nuXcBs3UMPWyfE5rXEKEwtabkNiV8ZuRpRf8ke6Dkct3naxl3mkr5Qp7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=n+3lUU0Z;
	arc=none smtp.remote-ip=54.92.39.34
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E934A606A320
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:16:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E934A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=n+3lUU0Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725344;
	bh=P7Y0HqqweaUG6sybM7W7gpXncgeyqYn9AypD9au0wmQ=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=n+3lUU0ZOqdPojRJWKmgsKXut9P/9BY9F29YCUxiwprONBayW35YeSV4u7cWBbtRw
	 Io23dbdA+mEMoO5NLK6oPONH/nXOs1pLR2YkamRw+4KnIZZN9W8Gwegc+NWe7n3Ns3
	 Rtf02GXb6brIBvPpTg5ditd61DNBuoRFbcwnx42Y=
X-QQ-mid: esmtpsz11t1792725340tfeabd856
X-QQ-Originating-IP: ur0wHfOUobow94QIjgQea66Gz3QbsRCxcDrMRSb18wQ=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:15:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6433505646100044952
EX-QQ-RecipientCnt: 26
From: Zane Leung <liangzhen@linux.spacemit.com>
To: gregkh@linuxfoundation.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	alexander.shishkin@linux.intel.com,
	suzuki.poulose@arm.com,
	mchitale@gmail.com,
	anup@brainfault.org,
	irogers@google.com
Cc: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	alex@ghiti.fr,
	atish.patra@linux.dev,
	andrew.jones@oss.qualcomm.com,
	sunilvl@oss.qualcomm.com,
	liangzhen@linux.spacemit.com,
	zhuangqiubin@linux.spacemit.com,
	coresight@lists.linaro.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/24] gtrace: add perf symlink support for gtrace components
Date: Fri, 23 Oct 2026 11:14:49 +0800
Message-Id: <20261023031505.2020925-9-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
References: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
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
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NuepumHJ06ewDvnZppx+3mIkzqtsFC2Hsgs5D1Rvhu2Kvdix1BI/8d+4
	BXD0A1wtLqVeBu5Blhi5Sts28gTsMa2i3z7mPs80JtHA//tncFmtXVkpbII8Elq1ynxEHFI
	LFybd9ezI2tPVxzsUdtN4m4xOQlZu2m1s5eLatjYiBv+9jEFLMc9/ny0ffDQcV+sW8zWG/1
	iolk1MF2fvALMnnw89EMjehtkz9fdqQtI+6K2PcJ40oxaAqMXB7iHb4zhA6t8AkgXKq5GhX
	DJdV6+9Daim7aUBAwMPNHjuMYhQY9d7qSzt2B1+CGpiPEiaxLQuZNND+eA5RRvps9hLWJ84
	lv7DK6uFq6auDj8ch381gCZualpedfhKh/XHyepMTSpSBupbTrqbgEFO4DbNA5nDqG8CyTw
	Gf2Av23YuunfvhyHhFcxnkynRwsVTBkSGN5RZbCZYjqwNkP/J/VeBiQ2BAw3xDI8y133EUT
	ZfdwPB2SmzhGytSs4P9VZRIKBjsnwTIkBSDI3fZnSaoF7Oa/hi32BvkFEY6RFHVbXBnj588
	2/XJOdFrWJNHAV5mfSX2M0eLeleOUAyGD1sI29rbZeBSnyvhE9VTMC1iKzdduaMBI4ifIAy
	80xOIuHmgRJu5FycV5ilsIVTXUb5bCO3z3CoguMXHzWYReXSNDYoluK/2lK23X/77XFFvq6
	hmuIcx5+5Z/quhyTNib5ASm2HG6YDUTZ28ZDqlcYOV5vxshsiwtL1G9lxcUWN5Eq9tLlePG
	dTuHhA/N960fSAeY6RqdvPEyBiIjey57Bw/ip9MRsiLiG9gQQDFT27z4sTWzcKm8+o2eJu0
	+C8CxTi4LINCLQ6xJQ1Rk2bP3S/j8QtBRDXFWazSUB51NhXIAizLc/C5mrAVqXUqvAAn6kd
	cXA6qRET/R+SMvQmiH2CjkQLYO2JT+z64U3U5YynUCUO+bT1gaOGMZQZgq+HfeltEFBHTkk
	5q07unVjDMRsRtAHpumNOeBkgsYY0R6jltNC1aa5e1BmG5aPEX1Sw+SK1gBWj89vfy9KqQu
	sJJIwtJFaalPLvbGhU0N1A8OYYPk20BhgOgNAIRHlO1p06+q0BBf0vLmGjxkgQNXi4uuoZa
	8ixzEa/pU//RkkTColS/3A=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

Implement gtrace_perf_symlink() to let RISC-V Trace encoder
link themselves to the gtrace PMU directory as "cpuX" based
on their bound CPU.
---
 drivers/hwtracing/gtrace/gtrace-perf.c        | 29 +++++++++++++++++--
 .../hwtracing/gtrace/rvtrace-encoder-core.c   | 10 +++++++
 include/linux/gtrace.h                        |  2 ++
 3 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/gtrace/gtrace-perf.c b/drivers/hwtracing/gtrace/gtrace-perf.c
index 2fcfbae9acf6..604b673a29d5 100644
--- a/drivers/hwtracing/gtrace/gtrace-perf.c
+++ b/drivers/hwtracing/gtrace/gtrace-perf.c
@@ -23,6 +23,7 @@
 #define GTRACE_PMU_NAME "gtrace"
 static struct pmu gtrace_pmu;
 static struct workqueue_struct *gtrace_wq;
+static bool gtrace_perf_up;
 
 /**
  * struct gtrace_event_data - generic hardware trace perf event data
@@ -351,6 +352,27 @@ static const struct attribute_group *gtrace_pmu_attr_groups[] = {
 	NULL,
 };
 
+int gtrace_perf_symlink(struct gtrace_component *comp, bool link)
+{
+	char entry[sizeof("cpu9999999")];
+	int ret = 0, cpu = comp->pdata->bound_cpu;
+	struct device *pmu_dev = gtrace_pmu.dev;
+	struct device *comp_dev = &comp->dev;
+
+	sprintf(entry, "cpu%d", cpu);
+
+	if (!gtrace_perf_up)
+		return -EPROBE_DEFER;
+
+	if (link)
+		ret = sysfs_create_link(&pmu_dev->kobj, &comp_dev->kobj, entry);
+	else
+		sysfs_remove_link(&pmu_dev->kobj, entry);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gtrace_perf_symlink);
+
 int __init gtrace_perf_init(void)
 {
 	int ret;
@@ -373,10 +395,13 @@ int __init gtrace_perf_init(void)
 		return -ENOMEM;
 
 	ret = perf_pmu_register(&gtrace_pmu, GTRACE_PMU_NAME, -1);
-	if (ret)
+	if (ret) {
 		destroy_workqueue(gtrace_wq);
+		return ret;
+	}
 
-	return ret;
+	gtrace_perf_up = true;
+	return 0;
 }
 
 void __exit gtrace_perf_exit(void)
diff --git a/drivers/hwtracing/gtrace/rvtrace-encoder-core.c b/drivers/hwtracing/gtrace/rvtrace-encoder-core.c
index 817535ff9558..17a3dde1314c 100644
--- a/drivers/hwtracing/gtrace/rvtrace-encoder-core.c
+++ b/drivers/hwtracing/gtrace/rvtrace-encoder-core.c
@@ -129,6 +129,10 @@ static int rvtrace_encoder_probe(struct gtrace_component *comp)
 	}
 	dev_set_drvdata(&comp->dev, priv);
 
+	ret = gtrace_perf_symlink(comp, true);
+	if (ret)
+		return ret;
+
 	if (boot_enable) {
 		ret = gtrace_enable_sysfs(comp);
 		if (ret) {
@@ -140,6 +144,11 @@ static int rvtrace_encoder_probe(struct gtrace_component *comp)
 	return 0;
 }
 
+static void rvtrace_encoder_remove(struct gtrace_component *comp)
+{
+	gtrace_perf_symlink(comp, false);
+}
+
 static void rvtrace_encoder_parse_event_config(struct rvtrace_encoder_priv *priv,
 					       struct perf_event *event)
 {
@@ -240,6 +249,7 @@ static const struct gtrace_component_id rvtrace_encoder_ids[] = {
 static struct gtrace_driver rvtrace_encoder_driver = {
 	.id_table = rvtrace_encoder_ids,
 	.probe = rvtrace_encoder_probe,
+	.remove = rvtrace_encoder_remove,
 	.start = rvtrace_encoder_start,
 	.stop = rvtrace_encoder_stop,
 	.driver = {
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index 3d769b405030..4bbe5ac835ec 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -437,4 +437,6 @@ int gtrace_disable_sysfs(struct gtrace_component *comp);
 int gtrace_sysfs_add(struct gtrace_component *comp);
 void gtrace_sysfs_remove(struct gtrace_component *comp);
 
+int gtrace_perf_symlink(struct gtrace_component *comp, bool link);
+
 #endif /* __LINUX_GTRACE_H__ */
-- 
2.34.1

