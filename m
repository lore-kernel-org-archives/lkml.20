Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4999E486403
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398128; cv=none; b=KgE6fwa0LH7XkI3td18KXphP4rC6JIpPEAj0j7t8CkHS8nW0oVQ3W+5QNrfJ/YR8p1+DUx5hsPtvsgYSswZUvwj/pNkvQHNI36pnPy1x5BFGo2i6mqb9ha+mhNuxkWgvpU5zvNNxZhL+bIL6Ct5EsLwbm9A/6y8zjL0tR3T5t/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398128; c=relaxed/simple;
	bh=2JxEexPiRwQ5O/ezc4RXBoagSQLg8sZDBQgHD+IaIMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LaRIDg1Czahvi+fPPu+j+ORnfV0lBWTZbL5fMcen+qIa2XdEAYSSFhkZhKoGkrgypZaV8vPjdmYurgr2qR6qx8s+AKKP+zvJXO5MlKQwSl2pjxCDQ4+U87ctNPdxlHgggFcfHwwGzT8wVvbittXAe4J0tlKq2TytbYrEBHKY8IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TGM2mxMi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HiNBGscs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TGM2mxMi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HiNBGscs"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0hkO1200872
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=URETtrpK8wu
	vrqfyx7NJrivdefwUx3tTphYnqoPD05M=; b=TGM2mxMilAx7vd3fRxJbN0wvoHc
	QX1cwbvlMV4uEdNfYpqJfLnAcSSVBHfRlveU/jqBWhW7q1cy8O8aMBihyywOBMMh
	3x4smFRgifFppnJXY78YJkt7v8MiAo6VCKpLe/ySZ16IhSVeEP9DIGH/QCJUiBFz
	0T/pm9w2guxrf8wvaz3b1qpyE9e7xm8FJb+mwctPVmzGUtzIyYtjL+pgrZ/R0KHh
	qHzuioJlhSqFEamDDK0WpC3t+9AkS10xKuVViNYzHpcCuAeCTYNTCUYhFEi4GYkR
	5cv+DQ/CD50L2Y6Z/G/KVIlQp1PTOVZd6bfWkQYBlmmZnwNll/Xz5/WmTXA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevsehx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:02:04 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-806ef75f2ceso1953778a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789398124; x=1790002924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=URETtrpK8wuvrqfyx7NJrivdefwUx3tTphYnqoPD05M=;
        b=HiNBGscsltshrIDyoKbLtbWNXta4FkCTNfecACmOJedhBqkPHYzNF6phspp02luIhJ
         pb7T9gd3IPiFhm+0CCR4kn6OZ1OxGidm2oru2Sd+Z/79pF4PbdTjUqskqtnxriEFcyv7
         zVqLnmzT5ewS8vFxnBb20RVbXiF2rTCmasY9L522vgmkLnCgbqQ8Y8wtQaMha1WF46tX
         1dGghE7odUhcJVynvdB+HL2mOmLja0aOjtJkNSBIxopzeqqRS7dgicE4glGy7mv7aoxh
         LBKl8S+SCQqVLjpJ55k91i3K+VkCeIUkoksmJND+wQ2q5czWBPm7SOdy/+y1ArdUd1o0
         YiyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398124; x=1790002924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=URETtrpK8wuvrqfyx7NJrivdefwUx3tTphYnqoPD05M=;
        b=en2n9xFOtFMUVufSJTs4ZNyqkYCrUmnPZV0FZ7Gkb4AyPHVU95qRIA8dcHHeOQc4xO
         jneZCerrWOouS3F7AFZqd/BaYq/cSf2Foguj3OuGuOa316UCFSuHeY97JDAftXFEEgu4
         O1zeAj1u39amFwezHagUb6OmODJiZavbFTn5DN6UuJf9LbwxFb8ZjXoEGcfw/jrJLxdO
         C9Ux2pTBwj+UtiDxSG/vOgFBWb0Zxmba2z6jQLzplVU1os5V5WFzhBR49jx18XCNYQb2
         U6yMJfvqn7v0zGglKSPO+hQuxnUIsaVmjrMqY4lzZz6s2/pl1GC3f0xOu3XXM5bLb9WR
         QtHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzoQC/eOil6LwqdlO+U3HuAyMY6+c7eH7A0O6ZxVSFovxxPblKgGq11Hid7TN1+WsrFddWtjPAlYbcvWFQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kql4o0LbJqe53fMAXLVzLSyTzj5kG/7f65tKA6dBnV/aWVq/6z
	JQZpjtOEUUOUoOsIrCw/ongoUCi2v3kctmxvbWF9b+PpEhsN3n/xZFB+nO6Q3rKSsw93p5v0iOJ
	2ri2KBWZpwZLYNvd8bNhIn+X7qmBTCU7i2m5DqgkerJTo6Hw12oKHNf3IZb9o2YHknKs=
X-Gm-Gg: AYBFou3+IGZ6Gdb4WfbWl0d7FkeF6QHag5bF0lIcCc86yJY2UEKyijF1nSlzaxJfvH5
	Q56CKHIwl2Bg9zGk/ffhziGG2OMdP9iXzAsLK3jHcR54br3U3clyDlHy1rSG8t1k8p3kln3ture
	yjU7fjmqLioA4NDiJvXBxVUCZSS4N73Uv+fapZKf3NP+dq8LeLgBbvxBe7wFyfEjjigHJe4cWfA
	n1t93Y4/43k7+4nNHPyEUZzRJwEycDJhXxBQeKe0sfaUEbg7JCtDnGg9fjGtlfRLlvbL4ZWOXvi
	VAkFw8Yd/Y1FIRSlBgMB/IA9/uGo8Z+YMq2C8T1UAb/FCcURBzJ1//xerA9MjBlhX23dvNH6MDW
	CVhxH14Wryzmeaj0VFk0/tShgy6HYhgdvIYxGX9BIxrXG0uqYlyHT1hHjng==
X-Received: by 2002:a05:6820:f008:b0:6be:68eb:e0a2 with SMTP id 006d021491bc7-6c540087048mr1536969eaf.9.1789398123520;
        Mon, 14 Sep 2026 08:02:03 -0700 (PDT)
X-Received: by 2002:a05:6820:f008:b0:6be:68eb:e0a2 with SMTP id 006d021491bc7-6c540087048mr1536758eaf.9.1789398121612;
        Mon, 14 Sep 2026 08:02:01 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296608480esm468632666b.36.2026.09.14.08.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:02:00 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Dhruva Gole <goledhruva@gmail.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/5] pmdomain: core: Add a genpd config to support unknown initial status
Date: Mon, 14 Sep 2026 17:01:39 +0200
Message-ID: <20260914150146.187622-4-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914150146.187622-1-ulf.hansson@oss.qualcomm.com>
References: <20260914150146.187622-1-ulf.hansson@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: aVeo0-C5Wxc8kc1RI9OA8Gd2FS9tOzed
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX5DExs78vEOI+
 64DHlFHWB0pCZmTSjdWRXuBYfPLZU9OxUa7+S/zcg+Tmiq/AwDGls7O8Hb0IEPK4yJsb4J32EHN
 xC7Xm2HvnuMglipatMN3wBUQ9bYD3zI=
X-Proofpoint-GUID: aVeo0-C5Wxc8kc1RI9OA8Gd2FS9tOzed
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa80c6c cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=EPyTabgPSFAr6pNicGcA:9
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX6Nv7mAXY11Gd
 4OEUGDCLDhN7WP6UEzE8Vet6z3p8hSGMQisDJxNd9U5PtX87qIA5PRGZ0kE5i/zYwhXzi0Ha9+m
 uuCAVAIXdSnjiwSF2UEvmZK2f39afldXuTdVebkvoiOnWWlDJi300cW7NMwRarH6pLNKCViLg3V
 sYIN0+tde2yotWsizAqxaL6xv4Psg0sVmVIPXPw6FUmCedAGZrlRz09T+c6Nyef6t+SK1G8AJef
 9qNIMD1l5kXy6WcIVbZVKbs0TQj7VBoZIGvDVNO3zxQXL0IpDCbAqSpnjsKK7j4H+HZ6Nt7V+ri
 Mdd9DeJBewneTEoupW3UnC4UZQLUIhVZV7cWkTpJFh8LFWpBe7t4urH325bxEsBGVZEbh7LbdZe
 vPrqbf0ujjCbWm7fsvGP7Niu2pmZwWGcQ6t94TGab7EdjVzSF26qiQK7+khCVpGu2Wj+JxXjeyD
 P5ZeGqB6k8WbSUBvqZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140215

It's not always possible for a genpd provider to know the initial status
for its corresponding PM domain(s). To register the PM domain in a safe
state, the genpd provider driver may therefore have to initialize the
genpd's status to be powered off, as a way to prevent the PM domain from
being used when it actually could be powered off.

In these cases we may end up to power on a PM domain through the genpd
subsystem, while from the HW point of view it may already be powered on.
Under these circumstances, it may also be required to keep the PM domain
powered on until all the consumer devices have been probed. In other words,
until the ->sync_state() callback for the genpd provider in question have
been called.

To support this behaviour for a genpd provider, let's introduce a new genpd
configuration, GENPD_FLAG_POWER_UNKNOWN.

Reported-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Link: https://lore.kernel.org/all/20260811-domain_off_ss3-v1-0-6a0a0fc023f5@oss.qualcomm.com/
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Reviewed-by: Dhruva Gole <goledhruva@gmail.com>
Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
---

Changes in v4:
	- None.
Changes in v3:
	- None.
Changes in v2:
	- Rename the config to GENPD_FLAG_POWER_UNKNOWN.

---
 drivers/pmdomain/core.c   | 6 +++++-
 include/linux/pm_domain.h | 9 +++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index c593a3479ad0..e8473f5339e5 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -189,6 +189,7 @@ static const struct genpd_lock_ops genpd_raw_spin_ops = {
 #define genpd_is_dev_name_fw(genpd)	(genpd->flags & GENPD_FLAG_DEV_NAME_FW)
 #define genpd_is_no_sync_state(genpd)	(genpd->flags & GENPD_FLAG_NO_SYNC_STATE)
 #define genpd_is_no_stay_on(genpd)	(genpd->flags & GENPD_FLAG_NO_STAY_ON)
+#define genpd_is_power_unknown(genpd)	(genpd->flags & GENPD_FLAG_POWER_UNKNOWN)
 
 static inline bool irq_safe_dev_in_sleep_domain(struct device *dev,
 		const struct generic_pm_domain *genpd)
@@ -2445,7 +2446,10 @@ static void genpd_lock_init(struct generic_pm_domain *genpd)
 #ifdef CONFIG_PM_GENERIC_DOMAINS_OF
 static void genpd_set_stay_on(struct generic_pm_domain *genpd, bool is_off)
 {
-	genpd->stay_on = !genpd_is_no_stay_on(genpd) && !is_off;
+	if (genpd_is_power_unknown(genpd))
+		genpd->stay_on = is_off;
+	else
+		genpd->stay_on = !genpd_is_no_stay_on(genpd) && !is_off;
 }
 #else
 static void genpd_set_stay_on(struct generic_pm_domain *genpd, bool is_off)
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index f925614aebdb..14e0e346c610 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -121,6 +121,14 @@ struct dev_pm_domain_list {
  *				powered-off until the ->sync_state() callback is
  *				invoked. This flag informs genpd to allow a
  *				power-off without waiting for ->sync_state().
+ *
+ * GENPD_FLAG_POWER_UNKNOWN:	Use this flag to inform	genpd that its initial
+ *				status for the PM domain is set to powered off,
+ *				which may not correctly reflect the state of the
+ *				HW, as it's unknown. If the PM domain becomes
+ *				powered on during boot, genpd will prevent it
+ *				from being powered off until the ->sync_state
+ *				callback is invoked for it.
  */
 #define GENPD_FLAG_PM_CLK	 (1U << 0)
 #define GENPD_FLAG_IRQ_SAFE	 (1U << 1)
@@ -133,6 +141,7 @@ struct dev_pm_domain_list {
 #define GENPD_FLAG_DEV_NAME_FW	 (1U << 8)
 #define GENPD_FLAG_NO_SYNC_STATE (1U << 9)
 #define GENPD_FLAG_NO_STAY_ON	 (1U << 10)
+#define GENPD_FLAG_POWER_UNKNOWN (1U << 11)
 
 enum gpd_status {
 	GENPD_STATE_ON = 0,	/* PM domain is on */
-- 
2.43.0

