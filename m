Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6030539E9AC
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 22:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791673044; cv=none; b=L772yBoLe2yniMnjrGG0STxzk8WV4q4OKZ4OJv445hfDX3cHQfzvkD5RN4SJe9m5eeBtoMnSfu+3RrdFCngf9I02Q0lM5EaK+3dz9n6DVpUw/7ooZI2Wwx58Z8y6BcWnnZ+iBpwMHJkv5lFEzf6YrmqOb1ZUeq4P/+/R71yRic0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791673044; c=relaxed/simple;
	bh=rJSNS3hxFXjvhAIjk0zs30Ksq5LMT0FmugM3VSedSqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nwiXFeVSxxzdD17SXqx+v6q59sdY9feYxwS3VAeJgY1FrnQDLtTesV2ND04kWr6eVRT45qp/Y982XUSHm5L8FdMQHdeZP6m5k7qa/t3znAY54LbpbB7nMwPy9zkzeel4MRHoLzgSrxiSiGHJkgkEo5co3TF8V3P5aSOTXuGCpl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gzfsGqjy; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gzfsGqjy"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd5e2d696e0so411522a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 15:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791673042; x=1792277842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLoOW8JonK/+ilXezPkpunwCJzUAC6S3Zezv3PLAoaE=;
        b=gzfsGqjy1DmjCkVnC42xQ+ppxiyYjKN1xJZ4BSBeSAGFF3tSxtFwuLfMcf6GfOLxJz
         nwJG5reYY1Oi/3wh/AWtJJjGgwy6SG+pZ5fZOFQrjOerBt6E1BhYaD3Uwt/0fV1xoBpQ
         XWPOH5Yj7wqSc+RQ02c0Uuk8ImmBsQx8tu8u/TQB0BTniNJNO4fiWogF5/hjSQMiK4sC
         JxJvTEERwST+xYzplJXqNIiczXNnFnbGl2+ocCD5iEwp16o7DVke9zCzkYHL/ff1YGg5
         D3akDovJasFTeZg3m4ZCk1ilawOxZXdhuudJ6jmaob3Tr38KayZWe/xz1yxobdTUq8+k
         wGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791673042; x=1792277842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pLoOW8JonK/+ilXezPkpunwCJzUAC6S3Zezv3PLAoaE=;
        b=it74IpBNRzpOTtvkAjgJaJVupDMoJnV/y9xKM3P3o1lz6FSxd0a3sZMhmG68P7nrbo
         UyZ1Oqp2cjm7aZ9J84xqfA66hlvfrmVBthJI0fYGr7jxLYWbkj+oV8T8Wz9mIBXnQCCL
         UZUp2Wh8oATJb5xzl3uOt8XG0x7V2ReFK15rLHQ91emMwFh7s/8VeFRxo54NQM9i0X2m
         yQcDJygzpTRocXub2E5E/ejRDUcJ/C/wWLp1ILUInX+9sNuVP4AvNuFXqX8xIrMtUTfJ
         gBoHfklv0L6Rtr+AbsRPvUXATff/NfnQhXlQTm8z2xHj7XMpznjASsXxQ2DwFt56L62P
         ZxVQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2/nbkwI1YBVyXtrq48jIC0I5ZmlVsnw2hIrODtJHQKx6j7vNjbwJbjDkY/UW9GvgGkOAzRzZHkQzBwNA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUnAoyDmna25LLtJFuzinxzycDoJuis6cVDf9mk5lgMnrw9I7m
	gZNhQlSWd+v2YkaceHWniTWL0hDp4nh1c3PnPRv44VLm6w7OVAoVho+y
X-Gm-Gg: AYBFou0pPjlWM6r0gQfFzI6aApbrjIGYThB/AM8jO6THDixkSBSHJrdDuUlOcTl5wVC
	zTrVxfayMu6paMPcCbQpz8GN6ELiMb3EMUK3MWoJ+TP8bBstsDMyNK14fjDjFCQlJsiaNqwX9Bb
	7OBq/MQlTbM2d78mB09VTuKWTqQnpvx6Jn4j4pshyY9wdmzoUdqQ6scNgX69mGW9HNqw0qg/M8e
	yLNWwFvZZE7ZtPZnmtwj0YThSkA0JDLkff7YnkYej72W3FWI7dhbwjgH844xEogA1QsrfD/O2fo
	gAWjp73Uc/1BtwkLLz75lZ3CHVVasHypLSKFkDv8CW1gdcEVS+uYRBo/P/k36vUXDRD9ua32qkE
	1vHDc/hsq9yF46ciQl5n3oeVp6ylPZaYhY2aAe/79+a5ysqBxD4B+lgKvH6tvPNq23PtSANvJmU
	ByMeARmB41YErHh3poBReDu9PcRBjUb3Bk4jGVSemVQgOxy0wCRqNeCkMUH3PuN2GvKX8pOtcVk
	uJvLoFK7NMcpsJMa7lTvlo9R3Lb4gn3GEY4PTI=
X-Received: by 2002:a05:6a21:484:b0:3de:61f6:4206 with SMTP id adf61e73a8af0-3e16bf6d39dmr4612005637.70.1791673042285;
        Sat, 10 Oct 2026 15:57:22 -0700 (PDT)
Received: from cxlqual.. ([220.120.90.131])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e07329sm2603662a12.5.2026.10.10.15.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 15:57:21 -0700 (PDT)
From: Anisa Su <anisa.su887@gmail.com>
X-Google-Original-From: Anisa Su <anisa.su@samsung.com>
To: linux-cxl@vger.kernel.org
Cc: nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Ira Weiny <iweiny@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Fan Ni <nifan.cxl@gmail.com>,
	Li Ming <ming.li@zohomail.com>,
	Benjamin Cheatham <benjamin.cheatham@amd.com>,
	Gregory Price <gourry@gourry.net>,
	Richard Cheng <icheng@nvidia.com>,
	Anisa Su <anisa.su@samsung.com>
Subject: [PATCH v16 4/8] cxl/events: Split event msgnum configuration from irq setup
Date: Sun, 11 Oct 2026 07:54:55 +0900
Message-ID: <20261010225852.10727-5-anisa.su@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010225852.10727-1-anisa.su@samsung.com>
References: <20261010225852.10727-1-anisa.su@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ira Weiny <iweiny@kernel.org>

Dynamic Capacity Devices (DCD) require event interrupts to process
memory addition or removal.  BIOS may have control over non-DCD event
processing.  DCD interrupt configuration needs to be separate from
memory event interrupt configuration.

Split cxl_event_config_msgnums() from irq setup in preparation for
separate DCD interrupts configuration.

Signed-off-by: Ira Weiny <iweiny@kernel.org>
Signed-off-by: Anisa Su <anisa.su@samsung.com>
Tested-by: Wonjae Lee <wj28.lee@samsung.com>
Tested-by: Junhee Park <jh9934.park@samsung.com>
Tested-by: Heesoo Kim <habil.kim@samsung.com>
Reviewed-by: Jonathan Cameron <jic23@kernel.org>
Reviewed-by: Fan Ni <nifan.cxl@gmail.com>
Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Reviewed-by: Li Ming <ming.li@zohomail.com>
Reviewed-by: Alison Schofield <alison.schofield@intel.com>
Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
Reviewed-by: Richard Cheng <icheng@nvidia.com>
---
 drivers/cxl/pci.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/cxl/pci.c b/drivers/cxl/pci.c
index 2fe9db4b3d86..4867657f5526 100644
--- a/drivers/cxl/pci.c
+++ b/drivers/cxl/pci.c
@@ -600,35 +600,31 @@ static int cxl_event_config_msgnums(struct cxl_memdev_state *mds,
 	return cxl_event_get_int_policy(mds, policy);
 }
 
-static int cxl_event_irqsetup(struct cxl_memdev_state *mds)
+static int cxl_event_irqsetup(struct cxl_memdev_state *mds,
+			      struct cxl_event_interrupt_policy *policy)
 {
 	struct cxl_dev_state *cxlds = &mds->cxlds;
-	struct cxl_event_interrupt_policy policy;
 	int rc;
 
-	rc = cxl_event_config_msgnums(mds, &policy);
-	if (rc)
-		return rc;
-
-	rc = cxl_event_req_irq(cxlds, policy.info_settings);
+	rc = cxl_event_req_irq(cxlds, policy->info_settings);
 	if (rc) {
 		dev_err(cxlds->dev, "Failed to get interrupt for event Info log\n");
 		return rc;
 	}
 
-	rc = cxl_event_req_irq(cxlds, policy.warn_settings);
+	rc = cxl_event_req_irq(cxlds, policy->warn_settings);
 	if (rc) {
 		dev_err(cxlds->dev, "Failed to get interrupt for event Warn log\n");
 		return rc;
 	}
 
-	rc = cxl_event_req_irq(cxlds, policy.failure_settings);
+	rc = cxl_event_req_irq(cxlds, policy->failure_settings);
 	if (rc) {
 		dev_err(cxlds->dev, "Failed to get interrupt for event Failure log\n");
 		return rc;
 	}
 
-	rc = cxl_event_req_irq(cxlds, policy.fatal_settings);
+	rc = cxl_event_req_irq(cxlds, policy->fatal_settings);
 	if (rc) {
 		dev_err(cxlds->dev, "Failed to get interrupt for event Fatal log\n");
 		return rc;
@@ -675,11 +671,15 @@ static int cxl_event_config(struct pci_host_bridge *host_bridge,
 		return -EBUSY;
 	}
 
+	rc = cxl_event_config_msgnums(mds, &policy);
+	if (rc)
+		return rc;
+
 	rc = cxl_mem_alloc_event_buf(mds);
 	if (rc)
 		return rc;
 
-	rc = cxl_event_irqsetup(mds);
+	rc = cxl_event_irqsetup(mds, &policy);
 	if (rc)
 		return rc;
 
-- 
2.43.0

