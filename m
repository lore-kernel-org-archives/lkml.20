Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E24D49481F
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 22:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787783013; cv=none; b=N5hGDmnK6XHJmOpOes5Ql63w2pUGQ7O6Z0zD5Z7yw+msO/gmkfmWTP3yrdzifxmvz8+QRtSx9Uo4Og8sN4owDPeOBf7cVgJxy6WxlV82SagwOOkOfPTvhyPqpe3oYxaVLLAzdicn0Ebvrigi3BxKqatXlhuEPz99eWJoaCOLMxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787783013; c=relaxed/simple;
	bh=n6IbrIYTHJLmOtIuXuCK5v8tN+VwLaWdhI/pGvjGMQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uAZgDh5bvYu+TEToGf8rdJgVuIsqJZI1j1B3YZ2FNP5v/qGqC97RZTZtJXJ1FKSnlFMMMkyh12r0iI+TnTMNgFHDZfC7VIHPkBXEhMK1rOeaqjM/HOEN4Vo6gQ2okIt4mDEfRSFlgbl47mTWWoYThegF5vbegzaT2eHSySXGDTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=JlOgNswn; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="JlOgNswn"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d6d28aa26cso10772445ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787783007; x=1788387807; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4J37In9uEiPMWKTA2NKfVk7z3AAOEYhOfwPb0A3ISuk=;
        b=JlOgNswncO3YJu7YVQEVJ7NiJFtaOrEx4NHQxuCVVuwqpqIw5DA6ldNmuJ0yBWQaXD
         2kwVwBw7C69Bwz/eMJfD1/PIP1cnwFaYKD65R9Vwe3c9ysROSu18OLZOOVX9YJdcTKwS
         GcaWIp3CeQ8wpX/4vGV3w9WiAfg2VSPD/QdBy9EaQApLWzbTIPUB92nfpGcjIKImr/Ru
         q1244nrEK+9r6MaRL28i1v7hB+U2+O6k55gVzCBuZmX1IPdnOpH94DQHiwcJa4VxXuGS
         3fDPolN0GoLMLrYnOyNO6miDSzR7ppBHc+g6hgwSLy1tJA/5MIgykSR8HGBFlb6yW94N
         t+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787783007; x=1788387807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4J37In9uEiPMWKTA2NKfVk7z3AAOEYhOfwPb0A3ISuk=;
        b=A4xvzqactRp2Mg2vAUrSqLMKJjSNGOM2klm6WKG9JSAK8yejXerRYMCEBiTHRWedla
         PBzoj2HU+MTbFN1PmS+KZRV1woDxIgO/4+hcTGc8SBMr/jN6fLiTy6osSNUJJNFJbI49
         SO3KyEptUDkJar4WMzuSRbwgU22LBKyighZhDNO1LEFr2zCCW/iCmYFRNj+NGEdrKwcH
         5JBRLGKwPA671afnuxwvo6IUrn9AreibyjPffDBla4uqlPcs26XrkA9kVUdHOO2HjAXg
         0H5az7VcbXhHz+Gcead0L2WEKKfpm0C91gk2UhyL9ajL3DjbdHwudHZyiHvuALyyVEG2
         lXbA==
X-Gm-Message-State: AFuF++nzQFWKokXlAlJhelDSZo1HtVptQY+ANP70C6jFaTsUMLsZZwld
	mMq3IDw9Gy7bbn2LWAxR11NPeeW9MOzp0O0PrScLNlLm4UYCH+XwChnsKe7GoOhdq3wsXCNKW22
	V+Kp82yk=
X-Gm-Gg: AR+sD11U6cDCb2faXD3cxzzb0AuQlqay9eRNQsgGJfaUnp2HAZE6kNQ/Dh/cekm0xAD
	FyALkMnkZvQlmbDvJrKGqFgQBiTWZ0qQwG0SXm7KwEET2TAOxjPoyB/4wZ18UKPCyL3XpssK9Ti
	yEjo190VfsPozNoWPMdJkGNriCQI5vn6dgtSjAGaBhJzDuOP/3t1fb0klA2WET4rBncVbpKnvQh
	yF8qTPHWeosWJ2/UPqcoZpZrBrHJcWyqEUbzrBeTXNvLUkEtfyr9zqsz647Bjmh913G4rcN5t8/
	QC9ZvcrBHee3+h2KI4eolHTKAqVCEdhcbdRci2XcRPc1hD+j43J6TAGwou6QluCYgCUNnK8sqYT
	QH6Pe6Rdr3ELmTgwwBWdxU4t71uiU5CTTz/9C0ozHQNmwSYSi2Yhut8zSnMGCUe5R7SyAPAe5S7
	GakMNPV/geSny4/5gJtLK2kuX+qnYH0XPe6EFF1ExMribHPMj/Dc1mAMLnEP3Nf15KQLP2
X-Received: by 2002:a17:902:e74a:b0:2d2:da8e:9017 with SMTP id d9443c01a7336-2d707ae31e5mr146371815ad.8.1787783006976;
        Wed, 26 Aug 2026 15:23:26 -0700 (PDT)
Received: from localhost ([71.212.202.210])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2d70493f3f5sm11757095ad.1.2026.08.26.15.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 15:23:26 -0700 (PDT)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
Date: Wed, 26 Aug 2026 15:23:20 -0700
Subject: [PATCH v5 2/4] PM / QoS: add lockless read for flags
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-topic-lpm-pmdomain-device-constraints-v5-2-28cbf43f7e38@baylibre.com>
References: <20260826-topic-lpm-pmdomain-device-constraints-v5-0-28cbf43f7e38@baylibre.com>
In-Reply-To: <20260826-topic-lpm-pmdomain-device-constraints-v5-0-28cbf43f7e38@baylibre.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, 
 Ulf Hansson <ulfh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Kendall Willis <k-willis@ti.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2449; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=n6IbrIYTHJLmOtIuXuCK5v8tN+VwLaWdhI/pGvjGMQQ=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBqj2dcqI2d6UQ58+Q7igPV2h5adhEgcUI1y9ajO
 12WD+ZuqfyJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCao9nXAAKCRBZNxia0/vG
 ZbDqEACFU0vgx3RM5uBFlV//UOl0g3+KaoB+xBi9n5Y0dLeIrygdus01VjHYzTlzNBsaN9z5spm
 UpUuhJf3OpYSCyDrnDjTl6JT+pWuU3Lx5p80191S1YnGr4eGiAAzdfoa6Vq3RwUHRstdXLa9/lB
 pT6V8uM05ZXqG5y4CuT70eB2X8GPkvy1jJP1K4Ao0RNjv82eZUB4NyPf/g3c5os8gHJJoyxMxt0
 /MEPDYARZP31DtpYSBeHr2MUoaFtyHL2xa0xfrc06bgsuwBqtbK949ApmzDLK8Pi8hhMqSBeQbg
 wngiPOOk/Q1HBQYj+pvG/tGm1T5JjzK4+gwQ1cHKUFnxuVri+lhsmxntmxGexXpkZkNwmly5so+
 ZNra2wlDZwMln0M7UGpyjFoXWh53c+bQ6yRRaooJ7N0QnG/kIEVRzZqcbr/x/y6dM3sAYNo9+Bp
 aPOHIonyBKoyRSA7xKFbOKNcj913DqnQulVTDCmWoBoaUqeIR+B1oTzRLstt/j5HcFSniDDLQq0
 QOU4I6gnTtzoI2WzWOAAq9tQ3zdM0HtRrZNkH3mSPn3P2OuUERbQytT+Wvey7q4iUINRVIhcgcl
 zZ6ZBJGe+hz6aER1p2X0qnWJxKTz9hIAQuv8WHxcP63YkxpCRrSr/Fa9twjh61lPYZKcyE0yUWm
 hESO8JyTAZWQPag==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665

Add a lockless read for QoS flags similar to the lockless read for
resume latency (dev_pm_qos_raw_resume_latency) which may be called
from atomic context (e.g. genpd governors running under a raw spinlock
or in the syscore suspend path), where taking that sleeping lock would
be invalid on PREEMPT_RT.

dev_pm_qos_raw_flags() now reads dev->power.qos->flags.effective_flags
with READ_ONCE() so also add corresponding WRITE_ONCE() to the two
effective_flags writes, the same way pm_qos_set_value() already does
for target_value/pm_qos_read_value().

Reviewed-by: Kendall Willis <k-willis@ti.com>
Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
---
 include/linux/pm_qos.h | 7 +++++++
 kernel/power/qos.c     | 4 ++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/linux/pm_qos.h b/include/linux/pm_qos.h
index aededda52b6b..439a9e779d81 100644
--- a/include/linux/pm_qos.h
+++ b/include/linux/pm_qos.h
@@ -219,6 +219,12 @@ static inline s32 dev_pm_qos_raw_resume_latency(struct device *dev)
 		PM_QOS_RESUME_LATENCY_NO_CONSTRAINT :
 		pm_qos_read_value(&dev->power.qos->resume_latency);
 }
+
+static inline s32 dev_pm_qos_raw_flags(struct device *dev)
+{
+	return IS_ERR_OR_NULL(dev->power.qos) ?
+		0 : READ_ONCE(dev->power.qos->flags.effective_flags);
+}
 #else
 static inline enum pm_qos_flags_status __dev_pm_qos_flags(struct device *dev,
 							  s32 mask)
@@ -300,6 +306,7 @@ static inline s32 dev_pm_qos_raw_resume_latency(struct device *dev)
 {
 	return PM_QOS_RESUME_LATENCY_NO_CONSTRAINT;
 }
+static inline s32 dev_pm_qos_raw_flags(struct device *dev) { return 0; }
 #endif
 
 static inline int freq_qos_request_active(struct freq_qos_request *req)
diff --git a/kernel/power/qos.c b/kernel/power/qos.c
index 1944dbeb0d4c..c241da5bccf6 100644
--- a/kernel/power/qos.c
+++ b/kernel/power/qos.c
@@ -159,7 +159,7 @@ static void pm_qos_flags_remove_req(struct pm_qos_flags *pqf,
 	list_for_each_entry(req, &pqf->list, node)
 		val |= req->flags;
 
-	pqf->effective_flags = val;
+	WRITE_ONCE(pqf->effective_flags, val);
 }
 
 /**
@@ -193,7 +193,7 @@ bool pm_qos_update_flags(struct pm_qos_flags *pqf,
 		req->flags = val;
 		INIT_LIST_HEAD(&req->node);
 		list_add_tail(&req->node, &pqf->list);
-		pqf->effective_flags |= val;
+		WRITE_ONCE(pqf->effective_flags, pqf->effective_flags | val);
 		break;
 	default:
 		/* no action */

-- 
2.47.3

