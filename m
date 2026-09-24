Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F02C2E2665
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790262464; cv=none; b=UxW+cKWDiEuSYvtnCMvkq3m0D+9Nh9l26ttZqPnW7g4+4CS/sQTItDOE5DhUPtxb/6Tqixe4pLW3uzANkTETfoWNpkmHsvs6JXpskT94XtMKJ/tFZJXi6Fu/35TUCYAe0g5eT3b5XSHy4zyaQHAeS8CVluQKD3LFB02CQR4piXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790262464; c=relaxed/simple;
	bh=UhI0Q1xkGDlIPCGxpJApvO1sZQWnHQsUpXzO2QHwXhM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=X7SCXnI58cvDkkp9n0mYYpZoVXXdJEyytnNzecsA8JNmpWOgkVueKJwCtNQPqJGb8f/3aFWApYWFexMlEsS0CJN308B4uNKxHKybm5EHnntbnr7ZnBEYgDVDBGUVttrgQY4UGyTx/57EHhf2EZfn2fHbh1BbglhHxIJTnaY/D7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hYpzFieq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jFZEn6lM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hYpzFieq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jFZEn6lM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC51Hp1430168
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KWOCUNDeMUBYtr5sC51iNU
	T7YIM/wI7evFI1Stv9SqM=; b=hYpzFieqqzWe8OYXU7AJeMuDRzYSMhxuTpUA7P
	wcguNGvMa+FtSDskFyNDMI1D8P2ns92l7OuXI7cZePWYeoSNmxqf36wEIoNMfUX9
	HbzGBdOEOesVFbwVuohGG3d16F2jwP/VPhWMZanl2VgE9WIGxCu3A1AioYE00FCK
	plqRxjg4+thIixC6re5U8Gdp/M91oP4v2Jr5PwyY1M4+C+0z040eCWeYoGBx8JyZ
	4yMnTKC6b7AlaJb2OGeI54m3Iyg4N1HMmWu2w2zHoiwA/5DF3B+ztrpr/Hk0px+Y
	joPuaXLxurxEggLXGyrdq19qTZRhCB0UeICaNo9vFWTcuVvQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvvghancd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:07:42 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97e768af628so1713982241.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790262461; x=1790867261; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KWOCUNDeMUBYtr5sC51iNUT7YIM/wI7evFI1Stv9SqM=;
        b=jFZEn6lMmTZ51IR7TzsagDsgBW9zpHMwcDm9cGr5l7ufimBDlS+X1x51NbFO8ne+py
         ZGoMXQGrtd9MGuGvgoe8U45gD1YK5VsSE5+v+XEwT7HdY0VJBimamml/6hrN7vyXeEAS
         z4rzskSBDjHu7x52tPHaMSB9Oy/aYupgpEk51TBK2+kgjDLsREYlCJP3DYJvJk8+UdES
         h0ghAT7Qo1sMLK20jl4yoOCHaJK6Q/PKMyE+9/WjhoR5v3njMq+UlNhSDdUMldv7NNzI
         O0X0PrKMzlrXHaZrDDIwOEnn3fxnxHPFDnESjxtxJb3REz/y+TlgYUG5bR3Udsae9dgF
         aQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790262461; x=1790867261;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KWOCUNDeMUBYtr5sC51iNUT7YIM/wI7evFI1Stv9SqM=;
        b=2R1jy+oXG81QVFNuXQxu87yj/oXCVLAGb3zkIi1qYciwE8EKu/AD7GlNDWIT8kaHYh
         auwI09I+M9qFR/oj46zVz4cPKGDNN7HNFNBfCVLqELNPi4woIaifPk+PWpTa87ZnesEM
         o4v1nct2KvcSOYZwxmizwwg4uiLeRQuToWgi8wA043pq77Cx//ZYlMmDUkn58UGjUHUu
         bZQl/m8z3W17NQutMElk6888cvL+N0LWDk5CDMVDb0ygBDj94sIQBFghboSvkAEfk850
         B36JZ1udRUKiOJdqgu5iVgx0czj1I2IYkA/y56Uap25PIRqJpdsZUIzm+kJaLu59Ha2Q
         9jcw==
X-Gm-Message-State: AFuF++mVqtJXm42ZfNwyIQU8GaEAVsXWGHh568rnDoCgwb2miZQOFNO4
	DFGDGZAokmXR2VjYFjM1B41Fjkcwm6GYCDg4hQO8E1mVbHzfGRxpABl6p3s9JggbUFwIzegcfjs
	m3KsSfHo7YjP4y1es8YwX8W/+RtVbFhQo+Y47QqpVSTKMxXXoJ2jXvTxajDA1g8xYWF0=
X-Gm-Gg: AYBFou2UWZl10aR7JAEcxBCuRSgj1QKUnsrPJXpZxDCoWuRSo5as3eraSHWvlRF/Eza
	beWZMdXMdm72lyx9+sjvabWZUHThmN888qT4UrxTfC3SIJbvoZhPDJIx0vnO01qgpJqKNV9RGDS
	nRE3syyQjgAr2wKNTyhzodtvBfcVRhWUpwH53xGdMi+HUqdsy3jd2byF8yfznnD3YisGhYYdRjo
	hVtWgXa7xPAHpMUa6kEok2wZRywk/CqO5n8bbxaI6Pvfqe5RawANn/hEiOTnf7rnkB9RgLaXJIQ
	eBcFFRaNRkLvmLLArxdCSya5qoKW7HKQqAOe4VuW3RGtBHtFEJfoD9tGpnoJDh8pdf/wVaJAr7Y
	6+NtvvhaB
X-Received: by 2002:a05:6102:1489:b0:7a7:198a:c2bb with SMTP id ada2fe7eead31-7af1e2f39e2mr1433912137.35.1790262461036;
        Thu, 24 Sep 2026 08:07:41 -0700 (PDT)
X-Received: by 2002:a05:6102:1489:b0:7a7:198a:c2bb with SMTP id ada2fe7eead31-7af1e2f39e2mr1433626137.35.1790262450130;
        Thu, 24 Sep 2026 08:07:30 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5bb9891sm66288385e9.6.2026.09.24.08.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:07:28 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 18:07:21 +0300
Subject: [PATCH] pmdomain: core: Add tracepoints for domain state changes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-add-pmdomain-tracepoints-v1-1-d89f3f0a6998@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKg8tWoC/yXMQQrCMBBA0auUWTuQDqmgVxEXMZnoCE1CJhWh9
 O6mdvkW/6+gXIUVrsMKlT+iklPHeBrAv1x6MkroBjJ0Nhey6ELAMoc8O0nYqvNcsqSmOE402Ug
 +WBOh56VylO9/fbsf1uXxZt/2H2zbD3dhwiZ8AAAA
X-Change-ID: 20260924-add-pmdomain-tracepoints-15254f2cd40f
To: Ulf Hansson <ulfh@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=6313;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=UhI0Q1xkGDlIPCGxpJApvO1sZQWnHQsUpXzO2QHwXhM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtTysBj1Vl4HW2CaWQYRx0VGjaJ2qdsMmbzuVI
 35TMY9j86qJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarU8rAAKCRAbX0TJAJUV
 VhEXD/wIEXEvJifEBIoQfZ62+/9YdCvJrTN5Td7UdgfstEdW+8gWqXNvypixyYSKMEBvsQoTYUp
 zsNvB8laJPa/igLmHmYye8VKemaGbWhDTxUFWippJCleilXF2gjY68Qs3L5wmzDtO4u4I2NVUT8
 M5ViW1WUAet1oJm6XP0Bi4N/Z/K2pCitT1AnQrUN8ro3yQcCa8SuscCdC2hntJdsRJZAq2cWgbb
 J0rrOhVEsLrQWAk5951caNCBxGMpVJoLfXvrDYSmtzZDhQKvk/5efpqeeGx62xPsO6CNDL33ipt
 BOlPZWFzah0n0dMd1VXkP2iXyKssu9F5BUTC2upcQlADxdwxTFc7ti9Ek7k/a/DnEe/puvmZ3R6
 J+lecQhOnuqSBWz3hwRl8v9ar43vMrv2sxO7N2PGlxBcGDzg+jAjDlJxUY0wGU9xwU8ZCGWdvkE
 21sQYiFMH8wFnZsdSNDHoZc0xRQBbQtTrxEJyQYF5rOHOOVQaBut4RPaaIhSL5BKVL+1L4HfQqR
 HiqKBVYcHInSorTaNUxU3rHbLM9130kHQRdarxxPM2EuDED/KFbmvKR8crE3HyThRChjn+obrts
 VilwMPUqKEg6VnjrxefBex6NGp11NpoPNkjo98stYqZc0Ima1BXd5ObxuCL8wMp2et9QcWGIVTg
 71DnXBs6Ew0tfjA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=KYhHIgYD c=1 sm=1 tr=0 ts=6ab53cbe cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=IKn3PkmZz6PqRJDR4koA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: 13f7R5gTXNYk1-lTtPIcjY_CqUnS5gKh
X-Proofpoint-ORIG-GUID: 13f7R5gTXNYk1-lTtPIcjY_CqUnS5gKh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2MiBTYWx0ZWRfX/JuDDhaCNL5o
 lGuwFpowo9CLgYPo6pYtB6nifKmYFbyFCcXw2FiVVr1fNd/mR1gQi2A9Ae/mTRr7KZZQGBh2alp
 aL9NIPfkvY0J1dXXPbwvqJaOj/Zfk0s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2MiBTYWx0ZWRfX4BjQLLhGEnnq
 FdoMVXgG7DKWLrarcNsSnC9+3R56BHKLFXzJWyyhXFyoJE765S7BjA/7yJcqH7JwDdRARBcTlA/
 jiGNL65b7gSuMxFUoApdlKdohWN+QRrLtj64lIkPiiLE/VIXcwMqvD6k4LSE5wLiGuirl5Ditf7
 Sn97QImashO5pyZksH+/ZQ9AiX3V8vpM/zXLKuOU5JZEshmyRnhu9KJtQy2lrMdnwrTmhhL97zT
 1lA1eew9dR32eXOtVSHrxkV6c1551dZDQsKjOCOzuTx6XlGzuQvalgu3ViM9EiestJrvnAxmhWj
 BuJXKqpip4OGj6HhQ1ZjKl0I5yKtA/eCmhnOGKGCTixwUNjQQEGBYOvKox396izN1Z7/agDmx/p
 UxwJ4fZukbpmX5HElsOCM78r4lDSBgiQDx+Y88Nmf3uu2a0fHfoxfObvtgCubgkd/qfIRK7ffuJ
 4Noc5E6C2gEzVEhe22A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240062

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

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/pmdomain/core.c      | 27 +++++++++----
 include/trace/events/genpd.h | 94 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 114 insertions(+), 7 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index b99c2dcf3d8f..62bd29e5918d 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -28,6 +28,9 @@
 
 #include <trace/events/ipi.h>
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/genpd.h>
+
 /* Provides a unique ID for each genpd device */
 static DEFINE_IDA(genpd_ida);
 
@@ -485,7 +488,7 @@ static int _genpd_set_performance_state(struct generic_pm_domain *genpd,
 		if (ret) {
 			if (link)
 				goto rollback_parents_up;
-			return ret;
+			goto out;
 		}
 	}
 
@@ -499,15 +502,18 @@ static int _genpd_set_performance_state(struct generic_pm_domain *genpd,
 	}
 
 	genpd->performance_state = state;
-	return 0;
+	ret = 0;
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
 
@@ -842,7 +848,7 @@ static int _genpd_power_on(struct generic_pm_domain *genpd, bool timed)
 					     GENPD_NOTIFY_OFF, NULL);
 	ret = notifier_to_errno(ret);
 	if (ret)
-		return ret;
+		goto trace;
 
 	if (!genpd->power_on)
 		goto out;
@@ -873,10 +879,13 @@ static int _genpd_power_on(struct generic_pm_domain *genpd, bool timed)
 out:
 	raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_ON, NULL);
 	genpd->synced_poweroff = false;
-	return 0;
+	ret = 0;
+	goto trace;
 err:
 	raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_OFF,
 				NULL);
+trace:
+	trace_genpd_power_on(dev_name(&genpd->dev), state_idx, ret);
 	return ret;
 }
 
@@ -893,7 +902,7 @@ static int _genpd_power_off(struct generic_pm_domain *genpd, bool timed)
 					     GENPD_NOTIFY_ON, NULL);
 	ret = notifier_to_errno(ret);
 	if (ret)
-		return ret;
+		goto trace;
 
 	if (!genpd->power_off)
 		goto out;
@@ -924,9 +933,12 @@ static int _genpd_power_off(struct generic_pm_domain *genpd, bool timed)
 out:
 	raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_OFF,
 				NULL);
-	return 0;
+	ret = 0;
+	goto trace;
 busy:
 	raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_ON, NULL);
+trace:
+	trace_genpd_power_off(dev_name(&genpd->dev), state_idx, ret);
 	return ret;
 }
 
@@ -2529,6 +2541,7 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
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
Abel Vesa <abel.vesa@oss.qualcomm.com>

