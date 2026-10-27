Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112074;
	b=KA8LohE0hMXymQK4/BbNRvQmzcv8j9Dwqc1xeicRu7CNfRPBdfvGiq0Um/pzNLXrNg21
	 R4Z2M0yTgg7wFSJ5cVvdQu1+1djmUO1+uIqO1P9uwTfh5rNys3gueahL6XiMT52eTW3zk
	 8DWhMMj/AA6IBAVYdS6k8gxGQy90XMvhEDmQc9sKegujnM/i/iynpA/5BZwlAaa2+owfI
	 CkdACqvuMrRKKTt4gQsoH1Ozi8gjN0vM8EQYQJHKDKL+UGeLVSdvft1qK0l5hImb2cAuS
	 J0Ca0j7bYiLrbCR/yEakAprPqhlnm/tZ1BJF1eVozuaZFfQTuAOEUXipwHBkPPcgYPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112074;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sNQrFSxkwb67TfqeaBXfew762KaolB4SZFqEO292Eew=;
	b=4PiLYtLRj0ezh6gGvfk+C1R1e3QGWuHTm557Ddd+RuKjWtc5XRgcy0sk+Q1879S6x6Y9
	 CIH7hMzjMB+roPiL9C3lengQkHfFeE0BIyA7D9lm61dRtBfhE32xWWU2nVyen6U5xSxWc
	 1LxgQJdHNXQSdHF6wBIgklLgHt5rm9l/sgTX6NbwGciVTz521IY531TCa6bKzp+Xd86SE
	 lWSMY/8Km/e9cTcejt0EduRojR/CkGHDWMPdnutgM3is7EM2ntNwQZ1DDEJCs80pdg61G
	 LcA3ctdZqEYkz1OopV4m0CDqyqa1O9TzDHCxgb5m7Dz/3fid1rIUrUR0a76k6TqXrIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=izDmuO17;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G8dBbJLB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C5C60A260E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:41:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62C5C60A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=izDmuO17;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G8dBbJLB
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDo1KU3449475
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sNQrFSxkwb6
	7TfqeaBXfew762KaolB4SZFqEO292Eew=; b=izDmuO17AwPsHeD7MyLx1exD3hk
	xKne7S5232ZqgYfC9W5U7AimIwxH18lWNkFy9HscrsSftu62DNLCYs8uqaJCR15F
	92QJfZn4kZujDqFMucTPDNL2C8joNXHyJotJZ54g6nSgPRBIj+D3sTBCj84Z4x6Y
	nYxc/AFcgFPh3OCRtSL9kjbkIgg7y97OQI29odGPG0WHIy9RN79kfXqHqdw3vFIQ
	FpfxMZ+qpsnRcbsz7vWqIgYYc00aSW306ym6C+sxf5F7JTQvwQ7t+6F+a6MdYQy5
	t2ejaRstQXfFkeFkWf/VORH8CUeKj2rnRJbiCdITRXl1+oStK0VvztiRbSw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh91b0ns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:41:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1e62510cso1025414685a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793112073; x=1793716873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sNQrFSxkwb67TfqeaBXfew762KaolB4SZFqEO292Eew=;
        b=G8dBbJLBQGHbb/5ZGioW3IsRwJ2MlLlswnWj24TMNWIperXhNJJ2ML2z3rf25opar2
         2eNXagIMop4VAioLdeW9RhHmg6CARmj0liCMVPUvtpH5horJeMmFhL1JY2hGlZSuawmR
         EEQyjb80WqDOc1LLhPI9dG4u1uJw9Sh5GR6AeeD1gb0g8eM8foGHioOuhEcaqv609bJF
         gjX/dKUaYUHV+/3dNhxaud6wLhOF4V1uayZtrSZao7wyYjNVbLMUMNrg6McDi7UovXLW
         mRBuGAE1UVWHkP/o4ZgoUahJTRXwsqqbIAy0GylH8L0yn8E/k7KyyxcuGbTlqpGGKanV
         8LFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112073; x=1793716873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sNQrFSxkwb67TfqeaBXfew762KaolB4SZFqEO292Eew=;
        b=qJl5lkeGs9lv8ZdMo/xqOFsdpkWNtacUzRo5mScz/AP+2ksDg03rS5dCCTaWmmrG8L
         t17P+L7rNQFzC5C/HVsv+7EW8hVewXmFbd5cw2W3WsTrUEMFwp/l57RZlz/KspdNgXSV
         YFK2WDDEgZby2p00IvNeGRa6w6ZliotBHklHh5gKMHa10ssIdixwSKRXInEyuTy1JBkS
         vNmOkwCBrC1t3WwEfRxIgeHNsJz+tF55A8KpDmpHROxd7+umLmmI4AummpjaNIg1ASze
         mKDyU6XTjnlbtiP2JxhHzqmsGmk5qCJr7bFCV6S74zATin63sWhA9upqBY5/V3b9N81b
         DgTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUj1tZHcYzHkoGjz/6KFJYf05CRXHrqcrVfY7T7Y0N8SpcGISd9hi40ewg9xEJWcWni9IP3yGj9rQwy4U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcFo0oU52Qj9p2lZZ9nGP4gZRMtfJhOw8FB62UYPdRlrKXenMr
	N+1zEn5FX4CaCusNLLMEz18eViG56GJSpmn8nBdennBzpd54McOr3HzD0kMoUTPnzyEFJ8rIM+g
	d2NoKIwHJPG44RLMCZvLAZP3w4fy9I+Y2IQ1zPxcTSS2lQW/PeIQhY+RIsdNwTHfbJ0U=
X-Gm-Gg: AYBFou2H1HoZwlg27TmPdvyYCDXLoIIqQHJNgIHmY7i4Qwm+Arxuj3xCxCyl/1rg63h
	SUMkvZM+j3XJX9lGEBmZObhRvDP0NdVFVxK2p+hyt6ahufzWFs/s3p/KlxDM5HwoKGDxFekie6e
	SMlD4l5MwDMu1BqHqGqDoNcLAJEQ2y1XIEjhEfFdzjNfylvGULUS6RouzABKePzApMLTowHKG7/
	imo828QxBVMech5u968xWJrRXhyrpCte07O6cvx38GjPAcZlF1MPgKppEG7XPdF0gRK6tFq/YZ3
	SJwY+uSWii5dvMu/GNwt4fI+R9y0JV7pQjtlsio13vRRz4pNd/IyBwXbsSsz48PZTHN6RCTQ8n0
	4XkIGs40PxcxyO1iXxFw3f+Ov3bwQe2tSzgltSfFkfGIUJwTMZvylmWg32A==
X-Received: by 2002:a05:620a:40c3:b0:93f:4d4e:ff66 with SMTP id af79cd13be357-940ef7d522emr1513746985a.5.1793112072671;
        Tue, 27 Oct 2026 07:41:12 -0700 (PDT)
X-Received: by 2002:a05:620a:40c3:b0:93f:4d4e:ff66 with SMTP id af79cd13be357-940ef7d522emr1513742185a.5.1793112072192;
        Tue, 27 Oct 2026 07:41:12 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66bd3asm468527766b.56.2026.10.27.07.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:41:11 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: linux-mmc@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
        Kamal Dasu <kamal.dasu@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v10 4/6] mmc: core: Split sdio_set_host_pm_flags()
Date: Tue, 27 Oct 2026 15:40:42 +0100
Message-ID: <20261027144051.249211-5-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027144051.249211-1-ulf.hansson@oss.qualcomm.com>
References: <20261027144051.249211-1-ulf.hansson@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: tDRCeK0UHdNWFRfFIz1b7O2fEPgbby_J
X-Proofpoint-GUID: tDRCeK0UHdNWFRfFIz1b7O2fEPgbby_J
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae0b809 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=IhfIabCZ21jgF8dh9BQA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1OCBTYWx0ZWRfXyakyaW+5d3FE
 39ZD3fhASlABZ8MEDjL+mVZAdBrM3tk4E28AfXw++F9clLy0K1PvcIYpBNT7gjbCcLTx8GdSKXS
 9vrWehAONvkKD8cQGhP5r8Fc3KzFNS5uAHwIHbYgVaIb/D3SbkjafvWjyoMIyoq1U62myledF1d
 eFMNkFNLG1SPrBoZg46QmUiOo9NyIEpfN8BTNnDzF3oynocfZFMP3ZFD4Vdh6VbPKR+DFO3xED3
 5vQp9S0jp9rLkqIXd1wZ/6yXfiyPZkoszekyDith9ao7T8ItVCvBDUegelSZYescdbDB3vswWQd
 jK0GLc70i3MCLFKwF3fZvSmS5yHy+lYnem7+w6smMBoDB4G7aegVK592Q7vxTrxsPe6na3eDROA
 8GfdK/7GjgIIIfS7usMM141TQYaEqZY0vTFmRSdQn2r5FBoWficr9RKnZkK2Pd5GqGLmlD42kSS
 B9HkMfe2QDWVIOffAUw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1OCBTYWx0ZWRfX63xgkTqLwRcY
 r1S6jLGzWI38nxRHFIjAtbfMryoiyOeQPIjhf798F5weoePCpQK1lEJ44Sh4Jd9wIRXwtmfs650
 QiVFVpyMjqMJjCDjRqKZZsdmT0ZFr30=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270058

To prepare for a subsequent change, let's split up sdio_set_host_pm_flags()
allowing the second part of it to be used as an internal function for the
core.

Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
---
 drivers/mmc/core/core.c    | 9 +++++++++
 drivers/mmc/core/core.h    | 1 +
 drivers/mmc/core/sdio_io.c | 7 +------
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index 677e445dc48c..49c0494932cc 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -1422,6 +1422,15 @@ int mmc_handle_undervoltage(struct mmc_host *host)
 	return host->bus_ops->handle_undervoltage(host);
 }
 
+int mmc_set_host_pm_flags(struct mmc_host *host, mmc_pm_flag_t flags)
+{
+	if (flags & ~host->pm_caps)
+		return -EINVAL;
+
+	host->pm_flags |= flags;
+	return 0;
+}
+
 /*
  * Assign a mmc bus handler to a host. Only one bus handler may control a
  * host at any given time.
diff --git a/drivers/mmc/core/core.h b/drivers/mmc/core/core.h
index 9be2875608ce..d3a2ff00b18f 100644
--- a/drivers/mmc/core/core.h
+++ b/drivers/mmc/core/core.h
@@ -64,6 +64,7 @@ int mmc_handle_undervoltage(struct mmc_host *host);
 void mmc_regulator_register_undervoltage_notifier(struct mmc_host *host);
 void mmc_regulator_unregister_undervoltage_notifier(struct mmc_host *host);
 void mmc_undervoltage_workfn(struct work_struct *work);
+int mmc_set_host_pm_flags(struct mmc_host *host, mmc_pm_flag_t flags);
 
 static inline void mmc_delay(unsigned int ms)
 {
diff --git a/drivers/mmc/core/sdio_io.c b/drivers/mmc/core/sdio_io.c
index 12716ec0e35d..99f857514b63 100644
--- a/drivers/mmc/core/sdio_io.c
+++ b/drivers/mmc/core/sdio_io.c
@@ -726,12 +726,7 @@ int sdio_set_host_pm_flags(struct sdio_func *func, mmc_pm_flag_t flags)
 
 	host = func->card->host;
 
-	if (flags & ~host->pm_caps)
-		return -EINVAL;
-
-	/* function suspend methods are serialized, hence no lock needed */
-	host->pm_flags |= flags;
-	return 0;
+	return mmc_set_host_pm_flags(host, flags);
 }
 EXPORT_SYMBOL_GPL(sdio_set_host_pm_flags);
 
-- 
2.43.0

