Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7423C39280A
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 20:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791404323; cv=none; b=RNV61ZcUN+GOGPG82pVcdHvxAWWGI3ficIArsy+DhRuMMJ4CEUHlEFEmxC40wFqPxFCc1zMkuVPLdcIvKEV9nhmH6C8K24iIO8aov3LLjW3nPtemm3JVAey29f/x9OYbDwwFT/LXN5uQLbAy3KX6LwNeE/LBUFOQwpcZmeGMkDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791404323; c=relaxed/simple;
	bh=1tLVbNbDl7HUDxUPwAgwX4uqgjQuBujm+60EP1X9Ssg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uTTFTOeLgk/V3OAi/qA/Q890lHrHp8GXv8w90uMeJJb1dWte+mxE7DbHzhoQGbhLrusgQNln77YC9k63hTVIuxCODryuq/Ywqbhx8WZ2OxYDFsZqDifZ+KivllDLLBCr1aYCvsJefx7M1Low4yYEvbG2KXg4f/nenztXurFzPJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j0sBWnWM; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j0sBWnWM"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so13577a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 13:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791404322; x=1792009122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98oKjZ2K1yRfCkrJS+595quXtp5aYGeP0oglAScHwVE=;
        b=j0sBWnWMRx9RhkDjFPz5MoM5g+/5bud6df34TfmjM97b2YkxA7s/9MaNcq9UK5dZg9
         pt/c6G++i49wREwgOQ58eEy2QxV2sHA+bGr4qkeNhrOD3bqcp0q6eZ5BCawAqrR/qnP6
         +YDb7vlAqWtNjiZrZ/u8EjXENaBl3cH0/nf2vXFn7RGrkP90sn/dnIiWlaOV9iy4tp8p
         sQ6xED1xL/HYXrUOdhwo/63V/pEoIGLEuWKfO9v6QIlOCABqy1gwxlhZyyrQ7HuYSSp6
         R7P7Je7a7+f9fcZ3gR4npy6rpjm5GBcJTr8zUzP9l/Dw2MjrpfUK60wiuwrGpL/fZ46i
         ruGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791404322; x=1792009122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=98oKjZ2K1yRfCkrJS+595quXtp5aYGeP0oglAScHwVE=;
        b=pwEu4eUlESLJnWIy0neSsGTNbTdtZdNsRryYNY4VCfJjL/txwYDVRCnF327dE+CGZR
         zZR/6TfD5Kz5QWW+lblvNCgltObB0M4A2gm9JMVKd4qizLdGZNgpZlQIzKFT2RfrmFqE
         mhvET1OqZcGZS9DCgNTOItDbWeAMD0z37H3BqLR5cQsYBX/0h2bvWpAe1PVJ7TLMFxuE
         KKKLV0IG7MLWLw7wdN1Qv2Va6+OgdHsNxsI5VB6sK63v1GO7rqIwUtM10N70dBIoM4Pd
         mTuLZIJRv5b1JJNtpFzmX41PZOV1ynUNRolI890QC32kOv3UX3gZX0EyKK7026V43wUv
         Xwhw==
X-Forwarded-Encrypted: i=1; AKwUvBwl7abWiG640DC+bRr2QrvpHv/GExTEYNqbSH5n6XrrSKxKoGz7s3apqt6sXdhmIB7hWzHHJfOrGa2HPO4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXHMrubc9H/H6oJb+sg0gMP3xqYEKR2Lw31x0KrFMBYRtCQtMQ
	3KAjXp65sopkbSmCnNBcBx7r24ZAnRFSYKi3Q5vPdqG7lbGusoQmALiR
X-Gm-Gg: AYBFou3JYIottWXRjVpAp+02Re0QPvDd+bGiriq967r0C0oFxK39L+kWbD8AjU1uEyB
	aMMrSelOuhMLuQJaQt7j8fwcaor1BgJjODDMU9prdpZm1yQH9j7K7zEAMSHeoseIV99Vc/vuQFa
	NlfSfCKwtJAFLQeNb65mXTJoUINTBM4+FTAskt2KV/ZfnTyC0gLGOuaB40e2fkRJr54rLHQwg09
	tO2O3tINcyZEDw8Ii3fJwtJusNqYkme/xFcXvK/X3XTUyxS2By5Tp4FxmxN3SanHdw2l8VYHE3G
	DMrMmn30dxf+QCSXuiCgFFUtX8k6UxL2KXt7yaAjR2vmGpioSVSEh9GGqsmas9w6T8wD//xxND6
	X64XBv0cNWJ1GYHsq9fdFsJbNMsV+wskLAeiqvHTDVXkvIBmghG4XZJtgd+3iRcLV0x4K1iVTbZ
	NDIk3sgnlXfq3eqA35Jjs51KD3dyt8cd0+YuZUH1B83d8b5bgRLVFzF9GD8fIHZY8+ruHysTVEV
	GK1vvItn7AwZM6z6bAy8R0Q9qtbLe05iRCL7r/lykgYIGdMwyOtRUwm42uYqqpPJU0YxrcGMCcW
	mwxuVV9CgEAqIg==
X-Received: by 2002:a17:90b:2789:b0:3a0:c85a:ee12 with SMTP id 98e67ed59e1d1-3aaedba393fmr139084a91.41.1791404321274;
        Wed, 07 Oct 2026 13:18:41 -0700 (PDT)
Received: from 4470NRD-ASU.ssi.samsung.com (c-24-19-224-150.hsd1.wa.comcast.net. [24.19.224.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff7ab034sm967623a91.4.2026.10.07.13.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 13:18:40 -0700 (PDT)
From: Anisa Su <anisa.su887@gmail.com>
X-Google-Original-From: Anisa Su <anisa.su@samsung.com>
To: linux-cxl@vger.kernel.org
Cc: nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Williams <djbw@kernel.org>,
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
Subject: [PATCH v15 4/8] cxl/events: Split event msgnum configuration from irq setup
Date: Wed,  7 Oct 2026 13:16:37 -0700
Message-ID: <20261007201828.952-5-anisa.su@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007201828.952-1-anisa.su@samsung.com>
References: <20261007201828.952-1-anisa.su@samsung.com>
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

