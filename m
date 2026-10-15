Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FED51D52B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058151; cv=none; b=ZEnofVHhyg+HNWnOvLsUP4vaQGNheS3RXpI97ObRMxfglSwXK8ZsCJxwQ+wXvJ+SpW003HV9vZRLt/f058C0Afl2Y4TsTS8x+3GH0movcAIYtzoltEg0lwZDQMXDdVi4MJEkxwSqtmLTA0YP4SlK/qrlgX1fOZL7/XriK6cpkgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058151; c=relaxed/simple;
	bh=0/Tr0DajWPXUzKUH5d4VC24ba2J0OELVrM1Ea+MEUHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rMtQID7jsbzX0lKyGJObEVK8vynEp/8NQDbaNbRYjsFFjrYerHqVCMc/k4YYCgwW6KcO0pYoOijkgjyz2FpzEY4TRLCL93yAh8oEPH9yLh7U81JdwWPOpzMbHlUmDM2pJ5LJoWFV5ap4lZtetpJfwKonrwXAZy9qhaXuq2gzTdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H82nV/a3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bEFFr0D7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H82nV/a3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bEFFr0D7"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9kHTQ2999206
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZRZooxfKHcxQhHly3wIZOGKjRM12w8Hjl2/Vc8SnRiI=; b=H82nV/a3ADeO5aLq
	jDspsHWEq90d9lI/NMP3EHNLd6DvjdQKJAlDZ8TNRi/fuQLubcRXddHwR6IJO6DB
	a5YxC9Qe3uSjZPxLqRnB1v5ekOzNNAMr6Nm/LU+bBaVp6KmKSYzBjAvIGu4+yAWH
	FBhXric6NDnsWolh0p7BuKxXYpP/7l8a9DWzILyfxkmA7M6CJdP+qlPH8FFhyo7O
	hdV0gmgI+m53QPgEYwDuooBOQFFv0EN4J8KE0/spqibsqxDhxQvOshUweamQqn3h
	r0D1MPhYVBxPvLTBBKxROTANfldda+u1oyd2/ApjEMyrMwJTlLrfHaM4mr9eCtDs
	POLO4Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hausm09j2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:55:41 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so14389851eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058140; x=1792662940; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZRZooxfKHcxQhHly3wIZOGKjRM12w8Hjl2/Vc8SnRiI=;
        b=bEFFr0D7Byv6a5BlDlgV1wfcxdsEQhEMq34X7O/qTFKzt/Jmo+TVvme1IPM8jpjjHG
         0qaZL0N4VG/wZPVg9L3Oa6wRy0nm4cr26kf8G6cSB7NXEHK4vnUijqqXKf18SS/NB/YO
         6cj+doRZF+gCC5zJHxjZfhmLxJlKz/pxfVLWUaLHo7pgMkvvTMWMI38odPCi87HR1qRN
         ijz23TmFBHZr9ViXGPdd8ImaOk4qYxdwnM4Pc4YU/qllxAjmifOi1e44M+vgSoF2N0Oq
         bUdQfOUll/KVQOaxGkPNNqCjeXNT0AI2hfN9Jz8x0Db8DDnenJG13zo38SKx2uWfgZ8v
         Qy7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058140; x=1792662940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZRZooxfKHcxQhHly3wIZOGKjRM12w8Hjl2/Vc8SnRiI=;
        b=G8ek+xkbFbcLETYDp0+FQrEt3tUHyVoQTRomB3yAbARdrHSaAYy19ZUlav7IWGJqpc
         2ARhfKY5ZCPdivumSS2wJihTqVaH4ZHZ0dyD9294lp3CVOw+wAvb19GzkYCIISJinG5I
         2R+AtCLEyT2WuzKEClVlTAr80ZjU3IcBw1dfjF0SPfzJpwp/bN0a8nCn5YNecJm/M8N8
         tE6h3ti3bbKSEyeABp+rn7Mx+udEET7c6tRm3y/qKFkesBV+9ppchpfKKIxuKz3hZQUH
         1uyupebDUcNyyAMyVhkrqXCNq743mfH+bEV7dDzisHNBhXTQ4Pu/65JXdecliGft4XZg
         V5Og==
X-Forwarded-Encrypted: i=1; AKwUvByNBCntvVtDmku3cTrn3W9A1qKSHyGiYuWioOUywh27fvigyevwhCon/TWRuLyzDEQXyJvRuSgdpM7eYGY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8CbD3i2K2sMS2FCU3BLYixxTvkNn2tdWZBkarfrSe3TlYhYcd
	HiubxqH4R/o4XXW3lnexn9dL9mHCeP5wcrqUs4NMqjuUuvSPcFkz+lXgfXcJidp9BOYuR4VCgdq
	0gmnAWYlHLTtA0Qa9EL5Z3AkSAvirhGP3QK+yZ2f2bQAMXlwBoG77XyODfnphISLAb6E=
X-Gm-Gg: AYBFou1zJ+iv/8Br2dWQH22wsQjOOW8OHpKhiXtEp7ARnXsrd+z0m9XDkWX7zM74AGv
	7JFs4022CUnG07PLVNTRx1sn8IYrZm7Vu+yYlmpjQ3wFMgJVr2r4Ln7QP+7oOOaxNfUZNzkReco
	K/ViFkqj172sOIs6i79Tfg6C8FsbqKLIsLBdoj1WGphl9dZx8wr9tjKCEZquiGIRUo/TFJRGMaB
	C4tZdlPhyBPZ4lZnUIg5Ea0awabf1kMRUoUxnGt4WoD9ZASuP+y3bNxEqHB9yx8BBD8lRXCAPTv
	1yTLYK98BG/RdXq00lGnX5BTI0rSdVel54q636aY+cAVlKH4ENDerUFTsySi1TDG4fzjER1eSfm
	5TrHtDz9p3asLqtSVLK7cSzsv2Bdj
X-Received: by 2002:a05:7022:1713:b0:14d:3c0c:79ec with SMTP id a92af1059eb24-16a5dbfddf2mr19682381c88.9.1792058140379;
        Thu, 15 Oct 2026 02:55:40 -0700 (PDT)
X-Received: by 2002:a05:7022:1713:b0:14d:3c0c:79ec with SMTP id a92af1059eb24-16a5dbfddf2mr19682350c88.9.1792058139747;
        Thu, 15 Oct 2026 02:55:39 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm84476533c88.18.2026.10.15.02.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:55:39 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:25:18 +0530
Subject: [PATCH v2 2/9] irqchip: irq-qcom-mpm: Register MPM with cpu_pm for
 RPM notification
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-shikra_lpm_addition-v2-2-ac7f1a0d5638@oss.qualcomm.com>
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058122; l=6029;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=0/Tr0DajWPXUzKUH5d4VC24ba2J0OELVrM1Ea+MEUHM=;
 b=qoUjJMHe5ei1QOlSNefaB4M1Rv204APQrXw+45+0oXnsjt/ofyXOG6J30jbxwiPgRFjHCSiwt
 M+iKbmisAdiChtUZxT26IREOF1qIZZcIQtWL0fs7YNGmixRtgathro4
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-GUID: 3AJDNbG1_WoLgEu3podX46OU0NeoY96p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfXyPNENE2WO9oJ
 PNA2LXVKOJSBpgO07njDWyZWhnKxf1MOH7Wwqpe70XYBrW0UF3mwhAqxTls7qG5g0JnkAJlwBeb
 N1ULROZQvesV7P1/W8uxosRwMvXxX6D3rmcEDyjjjrK6zMf86POeLRmitWS4gSGx8AScOelScbG
 ROB+y5nekyTaTHT3J+TlPrFSjqI3/9M3ICkQbNdBq/OLFRYWMV/8OUIueYTZRDsVSRLpkzeIiCu
 hqLN4ujGsOFa7vDTWd8F71HoiswqWqnVklETuKJeUS0nztK6xNfFX5rzSl2m8yk7xKKAtdqkeP1
 MaD73irTm6jO+eY+Gmyy0JXteW7awKoqpM7Rp2FNbDO4pn9z46tDjrh4OizlamxruwQIel9wPie
 kNIJ1M8EghrldzVsEka4g55lAQ6GLqZWDra0pwRediREhlc+GePxh5X+wSX8HRoIgSHRfHW6fyT
 uf7wzwUpzPjehTf4RQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX1B5cThOxJKId
 hh688iD2kzalMMSb+9+8/4Bi6f+Fec8wijkRSjmMNruxZce8YzRD4x3noOFymkOUSd6Uj7bCwLb
 YpNILIsV55rFu+rfnheFpMShhtnc0gE=
X-Authority-Analysis: v=2.4 cv=Eb5d0/mC c=1 sm=1 tr=0 ts=6ad0a31d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8 a=EUspDBNiAAAA:8 a=iYttt49xga_xEpih8PgA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: 3AJDNbG1_WoLgEu3podX46OU0NeoY96p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150039

MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
the latest wake up capable interrupts when the CPU cluster is entering the
deepest idle state. This is done by sending IPC interrupt to RPM and is
implemented as .power_off() callback by registering MPM as parent power
domain to CPU cluster.

Such implementation earlier introduced a hard probe dependency between MPM
irqchip and CPU cluster power domains. That is MPM irqchip needs to finish
probe before PSCI power domains are probed.

The above problem has since been resolved after bd7f488a8e5d ("cpuidle:
psci: Fix support for probe deferral by dropping the faux device") / [1].
However, it makes sense to remodel the RPM notification in MPM irqchip due
to general consistency.

MPM is not really a power domain provider, all it needs is a notification
when CPU cluster is going to power collapse to carry out the RPM
notification. We can register for CPU_PM notifications for that purpose.
This way we can avoid such unrelated dependencies.

We cannot register MPM under CPU cluster power domain and rely on
GENPD notifications here, since that way cluster low power modes will be
blocked whenever some consumer of MPM, and in turn MPM itself, are
runtime active. This will add another unnecessary dependency for CPU
cluster low power modes.

For now as first step, register with cpu_pm as a fallback to manage RPM
notification. Trigger the RPM notification when the last CPU in CPU cluster
goes to power collapse.

[1] https://lore.kernel.org/all/20260909134240.685115374@linuxfoundation.org

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/irqchip/irq-qcom-mpm.c | 90 +++++++++++++++++++++++++++++++++---------
 1 file changed, 71 insertions(+), 19 deletions(-)

diff --git a/drivers/irqchip/irq-qcom-mpm.c b/drivers/irqchip/irq-qcom-mpm.c
index 181320528a47ac1bde6cf7d2d0a9f79499990092..a37c20a20bed34d4f55fbcc950ba39ab9799b7b5 100644
--- a/drivers/irqchip/irq-qcom-mpm.c
+++ b/drivers/irqchip/irq-qcom-mpm.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2010-2020, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/cpu_pm.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -85,6 +86,8 @@ struct qcom_mpm_priv {
 	unsigned int reg_stride;
 	struct irq_domain *domain;
 	struct generic_pm_domain genpd;
+	struct notifier_block mpm_pm;
+	atomic_t cpus_in_pm;
 };
 
 static u32 qcom_mpm_read(struct qcom_mpm_priv *priv, unsigned int reg,
@@ -292,10 +295,8 @@ static irqreturn_t qcom_mpm_handler(int irq, void *dev_id)
 	return ret;
 }
 
-static int mpm_pd_power_off(struct generic_pm_domain *genpd)
+static int handle_rpm_notification(struct qcom_mpm_priv *priv)
 {
-	struct qcom_mpm_priv *priv = container_of(genpd, struct qcom_mpm_priv,
-						  genpd);
 	int i, ret;
 
 	for (i = 0; i < priv->reg_stride; i++)
@@ -307,10 +308,52 @@ static int mpm_pd_power_off(struct generic_pm_domain *genpd)
 		return ret;
 
 	mbox_client_txdone(priv->mbox_chan, 0);
-
 	return 0;
 }
 
+static int mpm_pd_power_off(struct generic_pm_domain *genpd)
+{
+	struct qcom_mpm_priv *priv = container_of(genpd, struct qcom_mpm_priv,
+						  genpd);
+
+	return handle_rpm_notification(priv);
+}
+
+static int mpm_cpu_pm_callback(struct notifier_block *nfb, unsigned long action, void *v)
+{
+	struct qcom_mpm_priv *priv = container_of(nfb, struct qcom_mpm_priv, mpm_pm);
+	int cpus_in_pm;
+
+	switch (action) {
+	case CPU_PM_ENTER:
+		cpus_in_pm = atomic_inc_return(&priv->cpus_in_pm);
+		/*
+		 * NOTE: comments for num_online_cpus() point out that it's
+		 * only a snapshot so we need to be careful. It should be OK
+		 * for us to use, though.  It's important for us not to miss
+		 * if we're the last CPU going down so it would only be a
+		 * problem if a CPU went offline right after we did the check
+		 * AND that CPU was not idle AND that CPU was the last non-idle
+		 * CPU. That can't happen. CPUs would have to come out of idle
+		 * before the CPU could go offline.
+		 */
+		if (cpus_in_pm < num_online_cpus())
+			return NOTIFY_OK;
+		break;
+	case CPU_PM_ENTER_FAILED:
+	case CPU_PM_EXIT:
+		atomic_dec(&priv->cpus_in_pm);
+		return NOTIFY_OK;
+	default:
+		return NOTIFY_DONE;
+	}
+
+	if (handle_rpm_notification(priv))
+		return NOTIFY_BAD;
+
+	return NOTIFY_OK;
+}
+
 static bool gic_hwirq_is_mapped(struct mpm_gic_map *maps, int cnt, u32 hwirq)
 {
 	int i;
@@ -415,24 +458,33 @@ static int qcom_mpm_probe(struct platform_device *pdev, struct device_node *pare
 	if (irq < 0)
 		return irq;
 
-	genpd = &priv->genpd;
-	genpd->flags = GENPD_FLAG_IRQ_SAFE;
-	genpd->power_off = mpm_pd_power_off;
+	if (of_find_property(np, "#power-domain-cells", NULL)) {
+		genpd = &priv->genpd;
+		genpd->flags = GENPD_FLAG_IRQ_SAFE;
+		genpd->power_off = mpm_pd_power_off;
 
-	genpd->name = devm_kasprintf(dev, GFP_KERNEL, "%s", dev_name(dev));
-	if (!genpd->name)
-		return -ENOMEM;
+		genpd->name = devm_kasprintf(dev, GFP_KERNEL, "%s", dev_name(dev));
+		if (!genpd->name)
+			return -ENOMEM;
 
-	ret = pm_genpd_init(genpd, NULL, false);
-	if (ret) {
-		dev_err(dev, "failed to init genpd: %d\n", ret);
-		return ret;
-	}
+		ret = pm_genpd_init(genpd, NULL, false);
+		if (ret) {
+			dev_err(dev, "failed to init genpd: %d\n", ret);
+			return ret;
+		}
 
-	ret = of_genpd_add_provider_simple(np, genpd);
-	if (ret) {
-		dev_err(dev, "failed to add genpd provider: %d\n", ret);
-		goto remove_genpd;
+		ret = of_genpd_add_provider_simple(np, genpd);
+		if (ret) {
+			dev_err(dev, "failed to add genpd provider: %d\n", ret);
+			goto remove_genpd;
+		}
+	} else {
+		priv->mpm_pm.notifier_call = mpm_cpu_pm_callback;
+		ret = cpu_pm_register_notifier(&priv->mpm_pm);
+		if (ret) {
+			dev_err(dev, "failed to register for CPU_PM notifications: %d\n", ret);
+			return ret;
+		}
 	}
 
 	priv->mbox_client.dev = dev;

-- 
2.34.1

