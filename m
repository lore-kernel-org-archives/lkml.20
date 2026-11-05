Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895536;
	b=VPTj57cHxf2EQfb3UKekaXPKRuiDVBZw9pe1yJoUfo6heqb+N0222Lc8eY7aJNba6IpV
	 wHDx8+EhDKwfWOlW/YIgV58kJzd5EHthpkw67y83sT5qN2DGOWLxRKFy6aRSYwX3VWCip
	 9zveVaKZln6WPX9tfPT46X9WtXmZVrO2RnOCeQMStKioEvF3mohr+MHKnavo6fJC14Fsz
	 zwljrqLAF/GEJs05nGZS2Lbb8TGtGY6jDfSG1tgKqpJaP/HT/V5Ecrx/6nLanPHxHFCQY
	 xfZxGi97GDQR9xz2MGI6ZGu9g/T4AsNq1oOCFytU2fuUkxTExS5i4dXKYCO3sE8YhFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895536;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DUjqXKUAIDWTOKhmYBRtQIqPRqdD+XrMg0VdExwCiBo=;
	b=IU1Q7Ux5x4Vue7YAT8EYT9pKktPK4S/74C5jWTGwVo1+YkK78OsItK4q+5EFWrxi5dNd
	 +XNzy8zLPhtDNd74vsjDfEokGanR6R2sQOfPmmbi6U2e9BApBjgwz1tuJ7SD7S7aSrKZV
	 CUoqjSZHGF41TGDsuKLF1oK0I/HcQYzRE5ps5jLWy3ddUuswF5YrwqIRnouSlVl2JJcJ7
	 av9tKSH6MBtGpUM1e2/wud+Sqv5M7boh5Wh2s0Pq9k3SuqJvW9c4HrSKtAS4jLn0Obvuz
	 uOUa15kJuquPqhOqdEctyUBZCcDOwR2YvZmFnUL1vsLoYUnALpZdh8ZDKvqnbVDlUYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IQwWq+F1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zj4ephuU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0849606A331
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0849606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IQwWq+F1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zj4ephuU
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQVvb1657303
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 16:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DUjqXKUAIDWTOKhmYBRtQI
	qPRqdD+XrMg0VdExwCiBo=; b=IQwWq+F1r+R6xFpah9v8Esa1Ht/Dd9xqC0JIEH
	QDm6IfUXzHFw8NLs+Lo5RnZ58uLAqYbMLRcC/BbmmmvdmWWqUjb/uhtEC1FH9cI0
	ZCCAFzgNZdM7p1Pd61G3Xe2tJj4/CwfJcSzKkKhMjrnvqCJMdaEAukB2MtA1BY+g
	DN/49PhGctmLRRsgA1NIBq3QEZBEJ8+7q6EjaMADh0s80TD1E+vQ0KHP3KrOrsQ3
	PRU3W4jHYgvCG8oxKekM/xItrwnz/JVFyHqlKs06C18gR7Z63u8S1bsdQ18nZM2x
	GMo19GDtnuRMx52uAdNVhBAP/oPs1lnggfk0haKKDyI8D2+A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq9f9pr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:18:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2373e9b4so261527985a.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793895534; x=1794500334; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DUjqXKUAIDWTOKhmYBRtQIqPRqdD+XrMg0VdExwCiBo=;
        b=Zj4ephuUKBorVa+Hl7s/SxUwH3gYuctgDNsdx9AUGvBpxtlN/VsRJljKROUUw0Bhi8
         iqPewmRnb+lJcob+cKlNTp9Muu3D6krhbs4xwDCMVVhGP75tn7FfBRUtWAOhEib7YS7M
         Bdnzulu0pj2szPBEdEMstKQpxFWPKp0dI0wQDAB8gBppaFwGwcWqP2bQVy7AzlGuWNUY
         cr3vNY5DztbVm1026QKB98BM6ynKhBp16Wh1iAqWeL2ohwVH6Vuz+OMaLEXt1KFwOtkU
         AigVhvY7h1Pwym25cOkBuU+319XdFYZnXBE7jP9Q/9Qzc3eL0f+3RYOu2M7R7uZczlHf
         wiHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895534; x=1794500334;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DUjqXKUAIDWTOKhmYBRtQIqPRqdD+XrMg0VdExwCiBo=;
        b=q8ctEOJvVmqoFVXzhxiqeRej+PYRFis5WxDv6ZYvzoQVmFMtK7556A5wzcOTQWUIDV
         9kQpoakBrg48q3O6yuIUG9Q3Xb8yHqkAIsCiKeAiLRu87BZtRtyyysqvBSI+N7Ucc9Xi
         DanEMdD0QP8flIJsr+CMQI2wBdP0qOatZV6Z3/IVUL7jVuq88P+KpXfVBgvNGH5MlpSl
         x1tjfJvX3eIhJFZNenwgYPpcM9xJBfMrRol7JiGF1Ex4IX6nviB6SjcvDHO28P/XbF65
         rR/au77zXuzvF0aEscENX8PGa6+5JCJQuxJUIEM0UKCWphpjtCiHF9FeV/iQEEeSUQ/E
         uacA==
X-Gm-Message-State: APuU4Z+Xf8YWTGtGikdBq/Ofbx2stJkTBfLQ9wY9oq6xgJpp6Ftk4HKp
	jAz0rTVGzrPMbjnDYRUF/Ze4eVNsXctADXfOaflqwjGRCAWJSjoQoI2TT4UJMjplnlqlWX5YXdt
	VjphDRqQPOGTGBntSGhNvRXng9AmXmCVY7zhl+z+8d67md/1mJ+GEwGKBnIPyhMtjDjK8ZRIdmU
	c=
X-Gm-Gg: AYBFou2/lU56vMVaaHym43L+uaa4kc7C6nLDImAkf45EZQVfi8HQcQaj8ABUakotofK
	HA77l6TIiixZQmlGkomvhszlipO6q3wyXod5ak6WiiBRU6ei/1OrrtJhHt/IPIRG608RoNFk59Z
	xhCel+mWJVM+ES+YKs/LzTbLqjIB4u+Hb7IDK66lZsiohEpJwRil/VmeDdA44GQIsYk+JuWvyxL
	vF/RZ214tBTFE6S/8wIIEU0Wu4LSqo7pLP4De/mZY39/bozyq+rQQkMkp9BeVOQQ5xqG6V8QBQm
	uwwM6NOQusLHr6SyrGPpNV8vjocBPofjFjWK0MLmRMjyNAY5wI0hQMUF3Qa73T2Mu6izaTCtNzi
	xW4GqXAaI7C2PD2NJTKX+/3ZG3eyguN2u+x6aZo4gZiGeTr68IVQlA6LZhQ==
X-Received: by 2002:a05:620a:170a:b0:939:ed29:8ad with SMTP id af79cd13be357-94421541cd2mr3136024585a.3.1793895533709;
        Thu, 05 Nov 2026 08:18:53 -0800 (PST)
X-Received: by 2002:a05:620a:170a:b0:939:ed29:8ad with SMTP id af79cd13be357-94421541cd2mr3136019385a.3.1793895532930;
        Thu, 05 Nov 2026 08:18:52 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b452cd020csm151080935e9.4.2026.11.05.08.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:18:51 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 18:18:49 +0200
Subject: [PATCH v2] pmdomain: core: Add tracepoints for domain state
 changes
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
Message-Id: <20261105-add-pmdomain-tracepoints-v2-1-10672995e155@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGms7GoC/42NTQ7CIBSEr2JYSwPYNsWV9zBdID/2GYHKo42m6
 d2l9QJuJvmSmfkWgjaBRXI+LCTZGRBiKCCOB6IHFe6WgilMBBMtk6Kmyhg6ehO9gkBzUtqOEUJ
 GyhvR1E5oUzNHynxM1sF7v772P8bp9rA6b39bYwDMMX1298y33h+amVNOTSfdyTHVStldImL1m
 tRTR++rEqRf1/ULUCcXJtkAAAA=
X-Change-ID: 20260924-add-pmdomain-tracepoints-15254f2cd40f
To: Ulf Hansson <ulfh@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7510;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=JgA7JDGlslfiK/0TjjfkGKw9sCjGWaPm/1jjZ5/MePQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq7Kxq/py+W5FOPxL4VGOLPnmCubV7d1r6fwRk6
 hGscsylE0OJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauysagAKCRAbX0TJAJUV
 VtacD/9ydvesSGAJHdC7UhN+YEBmI+zkRqeKO9gOcw199BK5sq5+YQgiAj8eQC9rPrYoSGzXe/E
 F1DK9QSfvuTYNVCHNfLNIoQIClQy5y8nuN3fNTu817T39X4N1pK6H6GgJkJr+0l7N/zBUY9PWaq
 zemJLqo44KaaXLXj8sY4PECRF8MmP8ViEsdxoUWQHNxVXDIApXAepxesdCprWUi0Jb6lIuDbZYY
 DzNQ/dreDS5R29Pl/zOl78kzZ1qd+KLcpRIGomW1LHW6HZa6ocuTAaeZDxrgQOYoAd3MGd+ulXK
 2s/BBuRtQf2GpxN3MSA1nfMEqaY1IgbZMQcCD8I8+YFKMC8Q9f9V1p5xaUpSxxtU0ToauCml5Oy
 FR2Bnt67jccDpGqkFSWx8/pNeglvTfeTO1Fwd6lKIL70oB1ejjOW8mBzmX0ZG9KkoSzyniQK/mH
 ARsF0nOKcZGyrj5PvLrmi10h54Fu0jU9jt6TztxdAQGF0Cb/sfHyBOl/1heCyub3XBLSM/gl8IA
 C29OAv+/xX91IWzE0OxH89MZOsue0QluqsNeHAr1SkInnOzGjH8nNINGbzrY++VrPRq1gajSJh1
 ClSA2g4nbhHKER30L7Cr2Zu73yilrn6aLyZTE2p9W7SKphhTbgEWclQi42yzk0BUXA8g0jW3A4y
 ikspFW97AWPSL+g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2NCBTYWx0ZWRfX6Z58fT5JMqYM
 kmeTPLu0uB0DM9+8xTtND8tDqHksnl3H7WST1A4xx0LPnDVav5oCK327pThzq1t9hpzz78KBA0W
 zLua46IFI2tk4AhbyKOt9GnW9f72bGX5T8ZvXOQfzhyPAoPLDckbSYPsMAL4eJ1Rd/RUcX4olme
 Tkr41Sl/o7Ss6RnIy3fUD91dHHMFpgAQdkswbIQaj74PAI7xtkRmaBy5u3CzD52M/TQ4VF+phZA
 H6A+I1AqtgQj/EPaGoKFQaSRX5iCHgqrapawONxcwGl+HzXNt/bTsQQmfKpJGgxJKEWWHCWLUjq
 RtOriW3Dh6TxIiU8Svl8RAqJj6RigB/vat8o0sT12e11Umm1zC+mIovumpSDVMm35O1QgmJoEKP
 xjh29GckeyGhlN1dO3ejuIFvak+u5uOBZiBIrZL6MsMiBIrZ2imSXqnC91ULNoaCmNqB3q9NPJp
 38e8/+6RUGSdPVp8D+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2NCBTYWx0ZWRfX5p3fIcRdQTl/
 1g6k8TnX2qFLhJ6zedOBYnc45TknbY/ZQBn94NJPLOLm4ffqYKasEAGc4IFdDCVKHt3IO1I9C1n
 i9jPRZ2VlISHjOY2ELTtMJyOGXUdfAU=
X-Authority-Analysis: v=2.4 cv=Vdhir1p9 c=1 sm=1 tr=0 ts=6aecac6e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=Yv3naoNOU6AWLRVxbzEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: OL_eGVEzyBCEnu1_QvnhD1X7ItlgQtba
X-Proofpoint-GUID: OL_eGVEzyBCEnu1_QvnhD1X7ItlgQtba
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050064

Power domain state changes are difficult to correlate with device activity
using snapshots of the genpd debugfs state alone.

Add tracepoints for domain initialization, power-on and power-off
operations, and performance-state changes. Record the domain name and
initial power and performance states at initialization. For power
operations, record the idle-state index and return value, and for
performance-state changes, record the requested state and return value.

Emit the operation tracepoints on both success and failure paths,
including power notifier failures and performance-state rollback paths,
to make failed transitions visible alongside successful ones.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Prepared with help from an LLM-based assistant.

Changes in v2:
- Initialize ret to 0 at declaration instead of assigning it before the
  trace labels in _genpd_set_performance_state(), _genpd_power_on() and
  _genpd_power_off() (Ulf)
- Link to v1: https://patch.msgid.link/20260924-add-pmdomain-tracepoints-v1-1-d89f3f0a6998@oss.qualcomm.com
---
 drivers/pmdomain/core.c      | 30 +++++++++-----
 include/trace/events/genpd.h | 94 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 114 insertions(+), 10 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index b99c2dcf3d8f..58c6fd8ef52f 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -28,6 +28,9 @@
 
 #include <trace/events/ipi.h>
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/genpd.h>
+
 /* Provides a unique ID for each genpd device */
 static DEFINE_IDA(genpd_ida);
 
@@ -466,7 +469,7 @@ static int _genpd_set_performance_state(struct generic_pm_domain *genpd,
 					unsigned int state, int depth)
 {
 	struct gpd_link *link = NULL;
-	int ret;
+	int ret = 0;
 
 	if (state == genpd->performance_state)
 		return 0;
@@ -485,7 +488,7 @@ static int _genpd_set_performance_state(struct generic_pm_domain *genpd,
 		if (ret) {
 			if (link)
 				goto rollback_parents_up;
-			return ret;
+			goto out;
 		}
 	}
 
@@ -499,15 +502,17 @@ static int _genpd_set_performance_state(struct generic_pm_domain *genpd,
 	}
 
 	genpd->performance_state = state;
-	return 0;
+	goto out;
 
 rollback_parents_up:
 	list_for_each_entry_continue_reverse(link, &genpd->child_links, child_node)
 		_genpd_rollback_parent_state(link, depth);
-	return ret;
+	goto out;
 rollback_parents_down:
 	list_for_each_entry_continue(link, &genpd->child_links, child_node)
 		_genpd_rollback_parent_state(link, depth);
+out:
+	trace_genpd_set_performance_state(dev_name(&genpd->dev), state, ret);
 	return ret;
 }
 
@@ -834,7 +839,7 @@ static int _genpd_power_on(struct generic_pm_domain *genpd, bool timed)
 	unsigned int state_idx = genpd->state_idx;
 	ktime_t time_start;
 	s64 elapsed_ns;
-	int ret;
+	int ret = 0;
 
 	/* Notify consumers that we are about to power on. */
 	ret = raw_notifier_call_chain_robust(&genpd->power_notifiers,
@@ -842,7 +847,7 @@ static int _genpd_power_on(struct generic_pm_domain *genpd, bool timed)
 					     GENPD_NOTIFY_OFF, NULL);
 	ret = notifier_to_errno(ret);
 	if (ret)
-		return ret;
+		goto trace;
 
 	if (!genpd->power_on)
 		goto out;
@@ -873,10 +878,12 @@ static int _genpd_power_on(struct generic_pm_domain *genpd, bool timed)
 out:
 	raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_ON, NULL);
 	genpd->synced_poweroff = false;
-	return 0;
+	goto trace;
 err:
 	raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_OFF,
 				NULL);
+trace:
+	trace_genpd_power_on(dev_name(&genpd->dev), state_idx, ret);
 	return ret;
 }
 
@@ -885,7 +892,7 @@ static int _genpd_power_off(struct generic_pm_domain *genpd, bool timed)
 	unsigned int state_idx = genpd->state_idx;
 	ktime_t time_start;
 	s64 elapsed_ns;
-	int ret;
+	int ret = 0;
 
 	/* Notify consumers that we are about to power off. */
 	ret = raw_notifier_call_chain_robust(&genpd->power_notifiers,
@@ -893,7 +900,7 @@ static int _genpd_power_off(struct generic_pm_domain *genpd, bool timed)
 					     GENPD_NOTIFY_ON, NULL);
 	ret = notifier_to_errno(ret);
 	if (ret)
-		return ret;
+		goto trace;
 
 	if (!genpd->power_off)
 		goto out;
@@ -924,9 +931,11 @@ static int _genpd_power_off(struct generic_pm_domain *genpd, bool timed)
 out:
 	raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_OFF,
 				NULL);
-	return 0;
+	goto trace;
 busy:
 	raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_ON, NULL);
+trace:
+	trace_genpd_power_off(dev_name(&genpd->dev), state_idx, ret);
 	return ret;
 }
 
@@ -2529,6 +2538,7 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
 		return ret;
 
 	mutex_lock(&gpd_list_lock);
+	trace_genpd_init(dev_name(&genpd->dev), !is_off, genpd->performance_state);
 	list_add(&genpd->gpd_list_node, &gpd_list);
 	mutex_unlock(&gpd_list_lock);
 	genpd_debug_add(genpd);
diff --git a/include/trace/events/genpd.h b/include/trace/events/genpd.h
new file mode 100644
index 000000000000..e2970be0796a
--- /dev/null
+++ b/include/trace/events/genpd.h
@@ -0,0 +1,94 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM genpd
+
+#if !defined(_TRACE_GENPD_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_GENPD_H
+
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(genpd_init,
+
+	TP_PROTO(const char *name, bool on, unsigned int performance_state),
+
+	TP_ARGS(name, on, performance_state),
+
+	TP_STRUCT__entry(
+		__string(name, name)
+		__field(bool, on)
+		__field(unsigned int, performance_state)
+	),
+
+	TP_fast_assign(
+		__assign_str(name);
+		__entry->on = on;
+		__entry->performance_state = performance_state;
+	),
+
+	TP_printk("%s on=%d performance_state=%u", __get_str(name),
+		  __entry->on, __entry->performance_state)
+);
+
+/* state_idx identifies the idle state entered or exited. */
+DECLARE_EVENT_CLASS(genpd_power,
+
+	TP_PROTO(const char *name, unsigned int state_idx, int ret),
+
+	TP_ARGS(name, state_idx, ret),
+
+	TP_STRUCT__entry(
+		__string(name, name)
+		__field(unsigned int, state_idx)
+		__field(int, ret)
+	),
+
+	TP_fast_assign(
+		__assign_str(name);
+		__entry->state_idx = state_idx;
+		__entry->ret = ret;
+	),
+
+	TP_printk("%s state_idx=%u ret=%d", __get_str(name),
+		  __entry->state_idx, __entry->ret)
+);
+
+DEFINE_EVENT(genpd_power, genpd_power_on,
+
+	TP_PROTO(const char *name, unsigned int state_idx, int ret),
+
+	TP_ARGS(name, state_idx, ret)
+);
+
+DEFINE_EVENT(genpd_power, genpd_power_off,
+
+	TP_PROTO(const char *name, unsigned int state_idx, int ret),
+
+	TP_ARGS(name, state_idx, ret)
+);
+
+TRACE_EVENT(genpd_set_performance_state,
+
+	TP_PROTO(const char *name, unsigned int state, int ret),
+
+	TP_ARGS(name, state, ret),
+
+	TP_STRUCT__entry(
+		__string(name, name)
+		__field(unsigned int, state)
+		__field(int, ret)
+	),
+
+	TP_fast_assign(
+		__assign_str(name);
+		__entry->state = state;
+		__entry->ret = ret;
+	),
+
+	TP_printk("%s state=%u ret=%d", __get_str(name),
+		  __entry->state, __entry->ret)
+);
+
+#endif /* _TRACE_GENPD_H */
+
+/* This part must be outside protection. */
+#include <trace/define_trace.h>

---
base-commit: 3d7783543c2646af69ad65825e810060494bea21
change-id: 20260924-add-pmdomain-tracepoints-15254f2cd40f

Best regards,
--  

Abel

