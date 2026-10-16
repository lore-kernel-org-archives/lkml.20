Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A1A470EA0
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792147608; cv=none; b=MGQDmfa58qUyoqOefaXKYunRa/gUN/Pr7JAmOluB65JjzvCeuvvW41+8zTPNhBCBLMJ+6tErAnt4QBGHzrQX1KYQPk3aT2DNpDeDh4sBdUA2zlMoFBARORdZ0q5LxkHQ8SWusadJW06UPemzTQQ6mEi229HYUmVbaSB1oX3PaT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792147608; c=relaxed/simple;
	bh=dQ4AMYifWiPTHxrdavc9IvTNofNXjMeTisigIsK+ljE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uVz3FVbqoXiAal8lZwoKcygXi+sjSICTqshcKFjLkZ0Q9ZrTDA3YIYXZeBgGPVgCcmklvkGSvK4I8OxA+gnj4qhWTHshrTsOOeDIUa+j7gHnRuzNJTxYJGWnxjMEgYPsTZtwG+e0OHkzWelVXJF/79MH4lXNdbvoZIGtltpSxGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GNcIdBRT; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GNcIdBRT"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b042c0728so1517167f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792147602; x=1792752402; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TSW2WThj73JXjd4G/88Mui+8Sx1DN1Ao1kVmiqTqMR4=;
        b=GNcIdBRTzkm2MAPqchlc5T6a3IH5zHP7RmRbRxQseOUvGjmOFktoijKoyfxnIc81/Z
         dKuqrB+2mwdAMro4QuftFmpc2975GHeZgkVXJOfh7TATd1CFWjhnOfsOG9dDq3919VoH
         rmQ9Szdgch+y6c0ZsIv1Qfu+wi75e6AXx56nK8cC6zyRswOKWJY1lhJsOFMMqT3xkJIH
         BykPviw5ztHncQniYDjpU8wZYhhRGS0K2YCdQBUY8NC3Gv/raMXxSKvLpBKwp0rS+5JA
         FKH023IL5P95PhM+UuHzuhItR5Xvgq5tBgRfsZzpXMIFX0OX8QhXqRAI6njprYXmW5b2
         eEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147602; x=1792752402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TSW2WThj73JXjd4G/88Mui+8Sx1DN1Ao1kVmiqTqMR4=;
        b=xO/As6EGkkvJqHRU9LaYzXWfe87ZVSMgpo63PqB1mrHFZxEBQTeqlGWWuAHg587s0v
         q0XLOX6Z2vUnxMPAXgkH3Ls4yp+/sJfA/hyXLmWSdjEyZ26WEVW/r24YdF16ozECKVz3
         o5I0B6eCex3N/T20lVG67BkX5+iA0/keY0a+WLWDKLt8e0+vkskcvvQA0WLNVaU7irgO
         NkPOPP+c/8NuHPHF9nkpwtERlyYDY1e5RWSVhPpkdRKutOgdD7EeNb8hGAwZYTJnU+L7
         jXD6JDlarzp5poZyjPDjzcppLGWnorKp+Pa14oqj83foCAqxI1Jd3fQIMXt0HTmqDdFp
         SjPA==
X-Forwarded-Encrypted: i=1; AKwUvBx75Nd+H2fhUdzUu0o0z1lqc+Q/tYxHrd4CbvJO/+j58+ko39fcdci0O0vzs8hKJMenm289ulRsauSQpvc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3QFoB3RsQXMBVktwGsAOY0usWf6KMnr0gJ3ObLQy0wCKEOL0A
	Ic71UHE4THwatHs8V/FYQAQWKhurtdmOLcUKzRJf8fWUsDkF5MWtX7MNT1CFkTLQi4U=
X-Gm-Gg: AYBFou1OqVpQVoGKf7QWr8wPqEweELlWRa/4MQPTsi0YyZBUg+ROdUMBvItAE2asN3O
	TCiWSgGvbpmA5GMKFoFt9aUK+2exHaLrDw/zjAEk0IYjCVfQnGueqdEyrfrzgN4jk8VB405GWYb
	Uq8xLnsrxO7Eb/3OPRfo3AqBBhVkfEnCCOP0KHIvIEOn6LtoUfvtziRYhbHzAbHy7Wv0z+MCA1C
	1K4DfxvHrviyH9eqzoKMFGpVcsofXIk2OcDPA+zEBkYZCWN88u2xN0c3HNkpM/XGCGWgRymbUjq
	MHm7VWYkCkllkksM1jRchhLKxVQFjjviyC1lQ1iUoUDYbt5q8hQ/lh8n4K+/4Sa1FUN+IsTIlVd
	6mDiklGxY9yGenFct6x0VmvBTPfwxlUSTCajvh5aH71srdpEAGUUTXZ1cKafQUyBaZw2L1QwEpw
	X25UBI/q0/jvOKQtjyEB7Hot/6MhJci7BISghwHQcULrOhmb6Sb/wijQFk4rZNexQ67JpQqLShn
	N1XzT/Tu/02
X-Received: by 2002:adf:fc50:0:b0:48b:69d4:bb35 with SMTP id ffacd0b85a97d-48dbaadf5eemr31637435f8f.12.1792147601803;
        Fri, 16 Oct 2026 03:46:41 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e7ff1sm4556570f8f.25.2026.10.16.03.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:46:41 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 16 Oct 2026 11:46:11 +0100
Subject: [PATCH v4 01/10] coresight: configfs: Don't assume active until
 cscfg_mgr is set
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-james-cs-multiple-per-threads-v4-1-dedf961aca0e@linaro.org>
References: <20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org>
In-Reply-To: <20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.15.2

Perf's etm_setup_aux() calls cscfg_activate_config() and dereferences
cscfg_mgr, which can be done after coresight_init() has initialized the
Perf PMU but before cscfg_init() has finished while the driver is still
loading.

Fix it by only assuming cscfg is initialized if cscfg_mgr is set.

Fixes: a0114b4740dd ("coresight: etm-perf: Update to activate selected configuration")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-syscfg.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
index 2bfdd7b45e49..7e3c9844bc00 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -26,6 +26,11 @@ static DEFINE_MUTEX(cscfg_mutex);
 /* only one of these */
 static struct cscfg_manager *cscfg_mgr;
 
+static enum cscfg_load_ops cscfg_get_state(void)
+{
+	return cscfg_mgr ? cscfg_mgr->load_state : CSCFG_UNLOAD;
+}
+
 /* load features and configuations into the lists */
 
 /* get name feature instance from a coresight device list of features */
@@ -581,7 +586,7 @@ int cscfg_load_config_sets(struct cscfg_config_desc **config_descs,
 	int err = 0;
 
 	mutex_lock(&cscfg_mutex);
-	if (cscfg_mgr->load_state != CSCFG_NONE) {
+	if (cscfg_get_state() != CSCFG_NONE) {
 		mutex_unlock(&cscfg_mutex);
 		return -EBUSY;
 	}
@@ -662,7 +667,7 @@ int cscfg_unload_config_sets(struct cscfg_load_owner_info *owner_info)
 	struct cscfg_load_owner_info *load_list_item = NULL;
 
 	mutex_lock(&cscfg_mutex);
-	if (cscfg_mgr->load_state != CSCFG_NONE) {
+	if (cscfg_get_state() != CSCFG_NONE) {
 		mutex_unlock(&cscfg_mutex);
 		return -EBUSY;
 	}
@@ -902,7 +907,7 @@ static int _cscfg_activate_config(unsigned long cfg_hash)
 	struct cscfg_config_desc *config_desc;
 	int err = -EINVAL;
 
-	if (cscfg_mgr->load_state == CSCFG_UNLOAD)
+	if (cscfg_get_state() == CSCFG_UNLOAD)
 		return -EBUSY;
 
 	list_for_each_entry(config_desc, &cscfg_mgr->config_desc_list, item) {

-- 
2.43.0

