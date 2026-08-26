Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1A9494812
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 22:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787783014; cv=none; b=Bi4MpqwWTNGJNh+Wh+B8tZzIv56tpbiYQTt0PyWXIh217J4Pe40Bfn/ZTqepxHZYbU3NQSs0kMrn/8nR0B6fMBJPa28TELGuMQiQd3QHYIiNo7CCHumRqidM0mi/UXZGp67N5FfTjVALWsJDnx0p5nmDdyUktdpefjqV3MjKlzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787783014; c=relaxed/simple;
	bh=qhCmIzp/0FT1HMjgFAUTckPFBnGHIlkyocQYAr+qsWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JroGfnaIroBXN0+gKu38FKd/WYuSziFkz3kMqGiL5v7MkG5j0etJj+MsCRaGsx8f7plPyO9IZh0uc1DtIR3OR4we2Sx5zkSqY7eRIJWY2ErjraLzbAdYMvYSMLMQPuXqF6xSoPyOW1kHJXncz4OuEvRmCyT4c2RK1R0K5Q2xQiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=jx2yrz1x; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="jx2yrz1x"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3964e76d0f4so1889686a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787783009; x=1788387809; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YCxM69mybT560xdAeAhYtpvxwftOy/Pc4vdQDPlFYCQ=;
        b=jx2yrz1xUyqqVIhq07Bdq5FWXVFLAtuiLrWwQmxynD07tbfLIMagIIvdXaQZeTYx9M
         lDFA9PfqTY1+5861TgVNoan8KtHjddlHOPDrzUTSMzRGc0DkMF5AYgxeByCv5Iq/nNko
         EvIsAMB4G9+3ZjmTeiRLDKMfZWQ6QZ96IPQLPxY4O2wijV52Zd8mQEoQ1+PTV8zcNCzg
         cspucb+5v3Ej+WfoColiiVFJltykaMzXLPQiT7iL1Rkmnrw09p+VPmngBo//PnFC/pN+
         HtLmQOY8KLnmKDLiAgWYFYTnDiEQjaAPvwxPu8d9ZCwEW3sO+ejQC81XNKnbRHM7aE3l
         KoWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787783009; x=1788387809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YCxM69mybT560xdAeAhYtpvxwftOy/Pc4vdQDPlFYCQ=;
        b=RCjoiIN++0Y9Dhs+5UzDIAGmq0nJBgnWyZbqcYu3qOJf2NfivwK95g8LIPpIWWPOPi
         IcG16xAND7vm3dVnxb1B+k5OTGIlyFTKfyr/VMBTGAEPzjyN9ZhhkHvHl6sIlcGQXXwb
         hiPvzXzRU5hOvUpwJkv0Yu1Z6GmKJ1aYiCO4fp37RvpDyyIiVnTsY//syCjK9cNXimry
         60+ioigQVANEaaOCe+azbOw4qe4ZHXh/xQN1w9JZyQtGSp4Z7CmU44vwSmdxJqlu5MNf
         pk9Hpn90xixdrYhkK47kAl5IOWVv8wm6nfKk3T+4Ecaw55+SWYDUVhD4/aiRsaV49zhs
         KbNA==
X-Gm-Message-State: AFuF++mUAoGalZlplcQs1KYzm85jBGhPnZcQ9lB4nlRIP9ymuhCMgKJ4
	Y7dLhSeBF6bEa78M07qcu2Euf87/fKNO2ZfvYu9+w7Fxt18sEGqXqD75Ww3n4Q8YTas=
X-Gm-Gg: AR+sD11JY7t44xaqq8MyXg3dB5gW0uDGc0hjvcsppD9F9GV/nvKOD8vKNoiPu/YWYj9
	PE76gcIU5lQSr8/+ZNy569WLwECoFGl6jqMnw0DriOqM7X581B44O9pCsZct+d85XvgnXwOZQ3h
	6UrJ6PQa13jC+qkcPs7mkLbFsZbr8X1GA4BDpK0ccPnbRom0TEmUHyPmn/VGybP+rTF6g8pEOCy
	euz9wX90D2MxW/ec5RNI/jiEEXvNN4HhX3Nh0XIs1hD3hR7ug3wOj9QMDk2Mw/ynKhcisY8TDe3
	LeLi+MPdykKZUtuRz/WS4bptKf7KvqdtBGfnkKljq2eA9Sos6Y6OrebnRERVvTVUus3fW22Y4IB
	8hErjReYJgicYaMwNKhFSiWFxhaZZPHQg1EsUPWUVuvhWfGtunqbnH7U8gD2ZV3a6cIsfXPr3Bf
	5luoqxmdBBb+RC+9ZpzOxfdbxDNnOqXh+NzHGUGIn9g/60fmbnBRLjxmdtQIrnQ+kwiTmW
X-Received: by 2002:a17:90b:2e83:b0:38e:bfe:81e9 with SMTP id 98e67ed59e1d1-3966d160e93mr22267129a91.1.1787783008980;
        Wed, 26 Aug 2026 15:23:28 -0700 (PDT)
Received: from localhost ([71.212.202.210])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-396afff2650sm66414a91.0.2026.08.26.15.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 15:23:28 -0700 (PDT)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
Date: Wed, 26 Aug 2026 15:23:22 -0700
Subject: [PATCH v5 4/4] pmdomain: add support system-wide resume latency
 constraints
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-topic-lpm-pmdomain-device-constraints-v5-4-28cbf43f7e38@baylibre.com>
References: <20260826-topic-lpm-pmdomain-device-constraints-v5-0-28cbf43f7e38@baylibre.com>
In-Reply-To: <20260826-topic-lpm-pmdomain-device-constraints-v5-0-28cbf43f7e38@baylibre.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, 
 Ulf Hansson <ulfh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Kendall Willis <k-willis@ti.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3785; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=qhCmIzp/0FT1HMjgFAUTckPFBnGHIlkyocQYAr+qsWQ=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBqj2dcj8LICYsP6kcZl89EKdspM/Bdva8ywEm3Y
 OnpiUwXjXeJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCao9nXAAKCRBZNxia0/vG
 ZdJdD/9/yRdiPtHBllwGxdBuUwGb/82KJnwYCFbHbnuGPOAIE7XSrnOuNl/Zcnq45oSffcCuwU3
 z8YkqPXWPqOrS9rpuHW1uRt6Z4SayFqUUfO4r7zY/T2BusrhA9nW3So/DbbB+x5rH7eb3BtGKuA
 lg8VyDtVBcbPlSP5xIDCW5cTyzFBMTkVd0Tm+rAtGWJ4KuPj6ZyEoSnc2zni1lwyKhaRcZL5MgM
 opZg0W4pQAfeDN2cdMLHn2L5XQRtHeTv9rct/9nk6tqXzni5mk9rW+TyT5GeOokok+zlPFWp+Qx
 G6tA+QMt735Ntxcys3meMjajhBbC35IwgteyCx68aVozaolnWTi/+5NmyjKcjAWiVzL3e0jFjGs
 zrqbBf6cXvzZcreCBsLa6TNwMUbux70OJm23/Y2yVUTYI6hohUuvtXdfCywLUUD78Npq7bPHBE2
 Ti7iNRuW5fDmrVOzLDrz6yxNxXTutGgnqnJmCjEsT8XE6hVCaddsnWdVGCCfkrgoHHDah8eHHSV
 vflkb0N+FA45K7aWpfAMhl6xM5us4SZOlvTe5XugTBeHxxaBMKErIsKvBqwQolsrjDFKqP0gSTq
 JsBDijLV90hPwTh2hsWchFgKDIGRZcFDcXLvjpvFysH+nVuyaQ5ZvYn704Tr6Yfd6dU8lN2g1h/
 vPHDlDbLHAmK0Cg==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665

In addition to checking for CPU latency constraints when checking if
OK to power down a domain, also check for QoS latency constraints in
all devices of a domain and use that in determining the final latency
constraint to use for the domain.

Since cpu_system_power_down_ok() is used for system-wide suspend, the
per-device constratints are only relevant if the LATENCY_SYS QoS flag
is set.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Kendall Willis <k-willis@ti.com>
Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
---
 drivers/pmdomain/governor.c | 56 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/pmdomain/governor.c b/drivers/pmdomain/governor.c
index 96737abbb496..1a85fd375db9 100644
--- a/drivers/pmdomain/governor.c
+++ b/drivers/pmdomain/governor.c
@@ -13,6 +13,8 @@
 #include <linux/cpumask.h>
 #include <linux/ktime.h>
 
+#include "core.h"
+
 static int dev_update_qos_constraint(struct device *dev, void *data)
 {
 	s64 *constraint_ns_p = data;
@@ -425,17 +427,71 @@ static bool cpu_power_down_ok(struct dev_pm_domain *pd)
 	return true;
 }
 
+/**
+ * check_device_qos_latency - Callback to check device QoS latency constraints
+ * @dev: Device to check
+ * @data: Pointer to s32 variable holding minimum latency found so far
+ *
+ * This callback checks if the device has a system-wide resume latency QoS
+ * constraint and updates the minimum latency if this device has a stricter
+ * constraint.
+ *
+ * This runs in atomic context: for a CPU domain the genpd lock is a raw
+ * spinlock and the s2idle path runs in the syscore suspend window with
+ * interrupts disabled.  The lockless dev_pm_qos_raw_*() accessors must
+ * therefore be used here; the locked dev_pm_qos_read_value() /
+ * dev_pm_qos_flags() would take dev->power.lock, which is a sleeping lock
+ * on PREEMPT_RT and must not be acquired in this context.  The values read
+ * are best-effort, which matches the sibling cpu_power_down_ok() governor.
+ *
+ * The system-wide flag is checked first so that devices that have not opted
+ * in only incur a single lockless read.
+ *
+ * Returns: 0 to continue iteration.
+ */
+static int check_device_qos_latency(struct device *dev, void *data)
+{
+	s32 *min_dev_latency = data;
+	s32 dev_latency;
+
+	if (!(dev_pm_qos_raw_flags(dev) & PM_QOS_FLAG_LATENCY_SYS))
+		return 0;
+
+	dev_latency = dev_pm_qos_raw_resume_latency(dev);
+	if (dev_latency != PM_QOS_RESUME_LATENCY_NO_CONSTRAINT) {
+		dev_dbg(dev,
+			"has QoS system-wide resume latency=%d\n",
+			dev_latency);
+		if (dev_latency < *min_dev_latency)
+			*min_dev_latency = dev_latency;
+	}
+
+	return 0;
+}
+
 static bool cpu_system_power_down_ok(struct dev_pm_domain *pd)
 {
 	s64 constraint_ns = cpu_wakeup_latency_qos_limit() * NSEC_PER_USEC;
 	struct generic_pm_domain *genpd = pd_to_genpd(pd);
 	int state_idx = genpd->state_count - 1;
+	s32 min_dev_latency = PM_QOS_RESUME_LATENCY_NO_CONSTRAINT;
+	s64 min_dev_latency_ns = PM_QOS_RESUME_LATENCY_NO_CONSTRAINT_NS;
 
 	if (!(genpd->flags & GENPD_FLAG_CPU_DOMAIN)) {
 		genpd->state_idx = state_idx;
 		return true;
 	}
 
+	genpd_for_each_child(genpd, check_device_qos_latency,
+			     &min_dev_latency);
+
+	/* If device latency < CPU wakeup latency, use it instead */
+	if (min_dev_latency != PM_QOS_RESUME_LATENCY_NO_CONSTRAINT) {
+		min_dev_latency_ns = min_dev_latency * NSEC_PER_USEC;
+		if (min_dev_latency_ns < constraint_ns)
+			constraint_ns = min_dev_latency_ns;
+	}
+
 	/* Find the deepest state for the latency constraint. */
 	while (state_idx >= 0) {
 		s64 latency_ns = genpd->states[state_idx].power_off_latency_ns +

-- 
2.47.3

