Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806619;
	b=RkgtDhk5o42kXXYRFhdrfhzRjfPvUQIDJ+0ZmtyhQfdK7gibDpHSH2I4gfzsUTqnfe3r
	 jgcPrTUdjokPJUDNAS4F0ZJe5Wqs20yV2S/Ve09iwzswOHcnABIM16LVLzXqJNIWahdA6
	 RjRgAQajta2qS/rPjlFkFdlGHsVhN+hgBTQoGcdfKtbnH7t+TVeGt56aCcF7jKzupxx0c
	 tijHFkttUpNAeapeFXL9Urk6bgEUxE0aRKy0B9kQwURdbfMh1sU8u59wsD1gYlSel1yL4
	 oCX5htc/7A/SaEID0YV/n1pPKVBdsoXEB6745IpjCyp3UEar49+kg7DFtwZZjBo3NOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=3fjvYxL1CcyYarRBHj/5LrpmgJVswx2GaGjokKiBvVE=;
	b=hsTZnWLh3oD627OxnpnmMQBFiqw5OQeVOUXriLpTT9tnmImCCKzcs5sbKOFz4NoOVolN
	 YLBuqr9EQgShz7/SBTIv0bEVEi7Pqj86c7U4kNTVi7yM2NMluGfewuBJShW3r4ZFtZtI4
	 ad97jFbR8PMCxTY5kppF+754xsVDSRYXKBhPa4cq3sfkWPG6I2y6KZmlVucSwhtD/++T1
	 OiVqrrscxB5bGNiT11UbDa6slR59tUvVrlwZJWX1K+WcxjSqO2km+Ffvvhx3TkzBoE2FF
	 p9eGGKANMb4KZ67mV+/X29hS0nWtfOZ2GhEmWBpy6/WY+UYkX/1m+2+EuMnqBl0DStw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UA3gnVfc;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AAD606A330
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8AAD606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UA3gnVfc
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso7815155e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793806617; x=1794411417; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3fjvYxL1CcyYarRBHj/5LrpmgJVswx2GaGjokKiBvVE=;
        b=UA3gnVfccpmDJ4IhOE3O8EPsf4KwA2QPM1zCqGSmWaHc7OYNkbweR4Aiq/HwSDNN3u
         ZxkpQ7IGLDJ4jkkBaixnNuIrc/PoJDCQcmegonek33fbvJmHnjjSsvZQd2pumy2CQ6K8
         fuFxkXTENjjdRE5QfHg4DlHFJfHok/FXKfSWnl5RyEP40VOIB3QvDqEdTp33CtvW/oZ8
         YffxWE+7GyONzMKCLrpPM7fqX8f6G+YjmQT8jhyp7GAXyt75y2ek9Hoq9Lrl0CC+2dQk
         joJDGs7Oyn7/wV/TwpvAPyuJeAS8jJj40R2OU1aJWqifMnm2gttyjKsrChCBzg8+FMXB
         2rxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806617; x=1794411417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3fjvYxL1CcyYarRBHj/5LrpmgJVswx2GaGjokKiBvVE=;
        b=Gdd3VaQV01VxItxTZaWAeTZC7XbpI+3dJp44R8Ep45tgf5hPPWPKGsqR/e1vqTWP2z
         7W9bEsbut6M57XHKLC6Rm1H7wn1goFXXhsq479SE2cykWqNjQC3PDj/zYxI5sXiO1O7+
         CfFUEH28kzPg3IhFY9m0SwJb9o3N+rQjrnVdR9cakPuPBxSurt1rMCIYgGDoKE6nbrpR
         lmDWOGMni313d8DetOGcniv1JrefPxg/fZodletzgGUtBDPO+X4SiaaNgkSMgP9Lhm/c
         QxpbYOtDAOSNAn9kjFaR7AamxNmxlPYt61dd7GMW0g+7T31oGjU/13THJ52YdqytSxx+
         slvw==
X-Forwarded-Encrypted: i=1; AKwUvByaOwNMWxS941cVa5V9pbVHFtQ4hp4y18fJ/TN/IB1IOEJioxyiBVy89YPoFisQIfp068Vco8KSsv3HKcs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+Q5U4BdgmzAjQbmWX4rRBjaIrxqxCJKJYCRnLzVBdNQwZPW08
	NwFAvR1XeEDutDiVYAdvdgGkUGcXEChXy0mIF+m0ecQT2TbInH/KIRCZNpOTg3jZos4=
X-Gm-Gg: AYBFou3u3FhnMhpskJNkMfdZrSOIY4Dt0POd+5Nooq6Bv8oV2BG7d48Lku4X0Le6SAn
	FhqmmrhGqUZ/vzCEM4wN8XTDtlUjB452PWk4/iaqSeA1p7pfYmqkTGjMe30eiLoAL6IR4rX1nsR
	YnkNjf4R2r4is4LifiUADV+vt52pEUbRF8Tzu4Z/xpybDBPJh4vAiAj2SNy70qwauxbA2wTJZHn
	o03tvj+b7P33ual868/8KzLfSD0RUJX+bRwLZn2gmPvj6vUp1U740L4y6UQSV5wURhVW78pd+R/
	4gnfnwQFRjqENvNvcmdA4160rHRblrq7LLjBg8e4rHQfeXRzAkdiGAYFDf57h62R3G8NrANuIei
	HP6OSxf64AjbbVzkfb2Urz4MMKnLJabfdKSzST1QY03+xL5VYckSdbU5+qAA7qQt4DQ2dwI3r4n
	NTTG2VmOEz6wtb6tI4iaq7x4c1+hQDO6uKYAv3CJpR5OvI5pyMXUvz07N2jwWGB08LV4ybPZAF2
	Hm8oIFZSXSaC7sWg3lF6FjXPHhboaFCwx4zyfpEHzXe/DMsUj9E5PeMEB/aIZcZhSmEkdSsAWtJ
	wIyXFl9zsoPxdVHWPutkHgLapZl/lcoj
X-Received: by 2002:a05:600c:4715:b0:4a3:598e:e7a8 with SMTP id 5b1f17b1804b1-4ac150b28bamr382209415e9.4.1793806617228;
        Wed, 04 Nov 2026 07:36:57 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43d4c9d4csm82566395e9.12.2026.11.04.07.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:36:56 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 04 Nov 2026 15:36:32 +0000
Subject: [PATCH v2 1/9] coresight: etm-perf: Serialize AUX topology access
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
Message-Id: <20261104-james-cs-sashiko-easy-fixes-1-v2-1-410c03941267@linaro.org>
References: <20261104-james-cs-sashiko-easy-fixes-1-v2-0-410c03941267@linaro.org>
In-Reply-To: <20261104-james-cs-sashiko-easy-fixes-1-v2-0-410c03941267@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

Perf AUX setup walks the CoreSight connections to select a sink, build
paths and acquire references to the devices and their helpers. Unlike
sysfs tracing, it does not hold coresight_mutex. Driver registration and
removal can therefore change or free connections while setup walks them.
Adding a CTI helper can also reallocate an existing device's output
connection array even when the device is already referenced by a path.

Hold coresight_mutex from sink selection through buffer allocation.
The allocation must also be protected because ETR buffers can look up a
connected CATU. Release the mutex before calling etm_free_aux() on error.

AUX cleanup walks helper connections again when releasing paths. Add a
locking coresight_release_path() wrapper and use
coresight_release_path_locked() for sysfs and setup error paths which
already hold the mutex. Leave sink buffer freeing and configuration
deactivation outside the mutex. AUX cleanup runs in sleepable context
following the preceding workqueue removal.

Add lockdep assertions to path construction and release to document the
existing sysfs locking contract and enforce it for perf as well. This
protects sleepable AUX topology walks; connection reads in atomic path
enable/disable callbacks need a separate solution.

Fixes: 0bcbf2e30ff2 ("coresight: etm-perf: new PMU driver for ETM tracers")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c     | 20 ++++++++++++++++----
 drivers/hwtracing/coresight/coresight-etm-perf.c | 11 +++++++----
 drivers/hwtracing/coresight/coresight-priv.h     |  1 +
 drivers/hwtracing/coresight/coresight-sysfs.c    |  4 ++--
 4 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index d2f9c1fb77d9..c05d657cde73 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -30,8 +30,8 @@
 #include "coresight-trace-id.h"
 
 /*
- * Mutex used to lock all sysfs enable and disable actions and loading and
- * unloading devices by the Coresight core.
+ * Mutex used to serialize device registration and removal, sysfs enable and
+ * disable actions, and perf AUX setup and path release.
  */
 DEFINE_MUTEX(coresight_mutex);
 static DEFINE_PER_CPU(struct coresight_device *, csdev_sink);
@@ -910,6 +910,8 @@ static void coresight_drop_device(struct coresight_device *csdev)
 {
 	int i;
 
+	lockdep_assert_held(&coresight_mutex);
+
 	coresight_put_ref(csdev);
 	for (i = 0; i < csdev->pdata->nr_outconns; i++) {
 		struct coresight_device *child;
@@ -1046,6 +1048,8 @@ struct coresight_path *coresight_build_path(struct coresight_device *source,
 	struct coresight_path *path;
 	int rc;
 
+	lockdep_assert_held(&coresight_mutex);
+
 	if (!sink)
 		return ERR_PTR(-EINVAL);
 
@@ -1065,17 +1069,19 @@ struct coresight_path *coresight_build_path(struct coresight_device *source,
 }
 
 /**
- * coresight_release_path - release a previously built path.
+ * coresight_release_path_locked - release a path with coresight_mutex held.
  * @path:	the path to release.
  *
  * Go through all the elements of a path and 1) removed it from the list and
  * 2) free the memory allocated for each node.
  */
-void coresight_release_path(struct coresight_path *path)
+void coresight_release_path_locked(struct coresight_path *path)
 {
 	struct coresight_device *csdev;
 	struct coresight_node *nd, *next;
 
+	lockdep_assert_held(&coresight_mutex);
+
 	list_for_each_entry_safe(nd, next, &path->path_list, link) {
 		csdev = nd->csdev;
 
@@ -1087,6 +1093,12 @@ void coresight_release_path(struct coresight_path *path)
 	kfree(path);
 }
 
+void coresight_release_path(struct coresight_path *path)
+{
+	guard(mutex)(&coresight_mutex);
+	coresight_release_path_locked(path);
+}
+
 /* return true if the device is a suitable type for a default sink */
 static bool coresight_is_def_sink_type(struct coresight_device *csdev)
 {
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 09b21a711a87..86ec4708b7e4 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -411,7 +411,7 @@ etm_event_build_path(struct perf_event *event, int cpu,
 	/* ensure we can allocate a trace ID for this CPU */
 	ret = coresight_path_assign_trace_id(path, CS_MODE_PERF);
 	if (ret) {
-		coresight_release_path(path);
+		coresight_release_path_locked(path);
 		path = NULL;
 		goto out;
 	}
@@ -438,6 +438,9 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 		return NULL;
 	INIT_WORK(&event_data->work, free_event_data);
 
+	/* Protect sink selection, path construction and buffer allocation. */
+	mutex_lock(&coresight_mutex);
+
 	/* First get the selected sink from user space. */
 	sink_hash = ATTR_CFG_GET_FLD(&event->attr, sinkid);
 	if (sink_hash)
@@ -508,13 +511,13 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 	if (!event_data->snk_config)
 		goto err;
 
-out:
+	mutex_unlock(&coresight_mutex);
 	return event_data;
 
 err:
+	mutex_unlock(&coresight_mutex);
 	etm_free_aux(event_data);
-	event_data = NULL;
-	goto out;
+	return NULL;
 }
 
 static int etm_event_resume(struct coresight_path *path)
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index dddac946659f..edec5a7d2be3 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -143,6 +143,7 @@ coresight_find_default_sink(struct coresight_device *csdev);
 struct coresight_path *coresight_build_path(struct coresight_device *csdev,
 					    struct coresight_device *sink);
 void coresight_release_path(struct coresight_path *path);
+void coresight_release_path_locked(struct coresight_path *path);
 int coresight_add_sysfs_link(struct coresight_sysfs_link *info);
 void coresight_remove_sysfs_link(struct coresight_sysfs_link *info);
 int coresight_create_conns_sysfs_group(struct coresight_device *csdev);
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index 75000fe64fda..5dd4e9b0426e 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -230,7 +230,7 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 	coresight_disable_path(path);
 
 err_path:
-	coresight_release_path(path);
+	coresight_release_path_locked(path);
 	goto out;
 }
 EXPORT_SYMBOL_GPL(coresight_enable_sysfs);
@@ -256,7 +256,7 @@ void coresight_disable_sysfs(struct coresight_device *csdev)
 		goto out;
 
 	coresight_disable_path(path);
-	coresight_release_path(path);
+	coresight_release_path_locked(path);
 
 out:
 	mutex_unlock(&coresight_mutex);

-- 
2.43.0

