Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1D23A9636
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790218248; cv=none; b=bBpPAUyCLAHvqwlzJ6wQz524+sovqa3xICNo0+l/tUaU/cNDZZiGqoum6ISeiIJHnIW+F2bzveEpKx6nZcFzrH6A4jsRvlYkO+njsUSbKDnxWFzvYsyDzKTHvv7Wmg1DWfNu5g/bisH97BUBYICjHfDUCyKsXrN+uBG6CSIUNvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790218248; c=relaxed/simple;
	bh=mCoA/4PWkcVLARDW7POm/fUPES/RjctwuWoj85qvfHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WQJEInVtZS8kZlxSSQJvL5bYj9s5QmKpIb60PFjB+fSG+AHB7ZeKnGXNeJGwcXeVdFwQJ3Kqfa0WnwS/wwdaPA9ljeYB+9Z0JfA3OIwmpPsIYFxD0HkbO6hp0TmPUBlzvLT/jeOY5VyLRK3faSs1vrdjOdXCCYgQM9jo9t5Mp0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=R/ZWKhiA; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="R/ZWKhiA"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fdc579daso10604205ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790218247; x=1790823047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UHHDPzFrQhdNJxIffI/oMYWvvRfPgA0Kd3oP3j+c7uM=;
        b=R/ZWKhiAVu+oJPsOe1k6FgkTeT7/bGOVxhsAd91rNDC5Hk1k4hPqFMnOybY/5GhnT4
         kWF9HKKhn1WMQU0+bj4nPwf7mms8wfOHxRpI4K+1Cv7I76GEPnhZsFIOmcWI4lw9BVBr
         j0SeIFfwv4yOXU+KZMuAWl6wsc51ep/P3hZuwnWvQRRXlnzE9TzJ4fKzMmPcxm8mlfH5
         Vtak2oHXddQdtvUyU8KdgXhGYmj5smWpoOYfUjmTB0bnUQhOnPX8qJZJ0/1a+iMGa/62
         O89RG9X8/TA5vCPqMoYLqjoqVIRGothU3GAgijRoCm+7QbOQ5Un4IJKff3IfQdgx63y9
         SegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790218247; x=1790823047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UHHDPzFrQhdNJxIffI/oMYWvvRfPgA0Kd3oP3j+c7uM=;
        b=iX/NOqk9dAxLZxJKbNp6x3R0M4kH4mPP3AHAM3AvER6DlGdz4fio1ptiQIQ3E3/rEF
         aZHJZP4iYeALQOkx7s5bL9UQVbvZW5peqV85x7Y9bEL31WlV3wtLAiHJ4HCfjyy7VG+C
         9Z3Jd9IfH3plly9i8rBTL3Ohr0di2vpOmWqSi4BiQv33FvDZKlaZdSUQO8KHyZghZhb8
         lCVjsR4CBSiitJU/2zpWJcvqeARlmNE2NFXsCHg+CErXzPzHt+8rvKYh4fqtNAK711CN
         vpRQD3Q6ItzRfVbSPwP3B+doxtP92JFI8A7B2+0EEdZidSxd6VHZ5GFFYLWoW2jFNTAH
         17CQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEPgWS2TSaJuj904OQ60OAozhJyV6iOJV9Ga3tr1o18MHVZvgaOKBrHiEujrdlSGSJX4syiJGgtFWlcjQ=@vger.kernel.org
X-Gm-Message-State: AFuF++k3m44t26NtRjcN971nLXzkNnabHRdMkyEnwhNebWmoUFcVcNg0
	HfG1dw+399SurcGmxFqqNWd8VXeCrhsH7YhSYEmKp0expyJI+nKhoAOqq9JFRpWOBWZerJiXYrx
	sdtag020=
X-Gm-Gg: AYBFou0BvjBF+ZIMlA7DbpEpcC0/IzZeuL4tXge7KeFdT4FkB/MyvWaeU+vMf+9gDkV
	smVlrhC9j4qDKjfodYVi4nVZIiWRIro7BM59JfX8Is/cBrMfA3gTMnLyhq4+RtCAoE2CnQnCOBN
	fVjnYUiqgYvArq1hpgsWgb3gZ7Tye5lhn2uSc9FMXwDigOFLVP4BriqG3iEKSejS00zJFlI6OK6
	/21M90YbbZ8SzOuRMSl26XI8eDKMXPvJjDWQryTiZntbKwEtKWRJTxn+aA2oJL9bhwgwwIOE1Ua
	WqGZ6FpRrRbWiG4Eut7g+kL1ICzl/zoBcPd1ocHuXz21njdUxhBclnvVDtL/GOd5OujELoESXSf
	j5uhN1h8v2nvWC0NfcafbKbIan4Bx82K3sQvuPGYTIfojL724XiMCUKmE7AOyd5M5yuOp7yAvBJ
	3bO/2cQHyiUsSw0ICUeZ/i3V+g3Sa0KozgyyrBL22ELYNOrxD7QvGWsC5i0SJQw1Tg/lr+pdfJe
	7IA5VqkLzNHpup0gxOP
X-Received: by 2002:a17:902:f70d:b0:2da:eba4:b640 with SMTP id d9443c01a7336-2df7dd77c83mr9879905ad.6.1790218246767;
        Wed, 23 Sep 2026 19:50:46 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a4f6bsm18638185ad.15.2026.09.23.19.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 19:50:45 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Dan Williams <djbw@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Joao Martins <joao.m.martins@oracle.com>,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>,
	muchun.song@linux.dev
Subject: [PATCH v3 1/2] dax/bus: fix mapping attribute error reporting
Date: Thu, 24 Sep 2026 10:50:34 +0800
Message-ID: <20260924025035.1265035-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260924025035.1265035-1-songmuchun@bytedance.com>
References: <20260924025035.1265035-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After the DAX configuration locking was converted to rwsems, successful
lock acquisition leaves rc set to zero in mapping_store(). Two error
paths can return this stale value: an unbound region driver and a
misaligned range size. The sysfs write therefore reports success without
allocating the requested range.

Return -ENXIO when the region driver is not bound and -EINVAL when the
range size is misaligned.

Fixes: c05ae9d85b47 ("dax/bus.c: replace driver-core lock usage by a local rwsem")
Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Dave Jiang <dave.jiang@intel.com>
---
v3:
- Collect Reviewed-by from Dave Jiang

v2:
- Return explicit errors before Device DAX range allocation
  (suggested by Dave Jiang)
- Move the patch before range alignment validation for independent
  backports (suggested by Dave Jiang)
---
 drivers/dax/bus.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/dax/bus.c b/drivers/dax/bus.c
index b809e1a264af..e40c25401cf0 100644
--- a/drivers/dax/bus.c
+++ b/drivers/dax/bus.c
@@ -1192,7 +1192,7 @@ static ssize_t mapping_store(struct device *dev, struct device_attribute *attr,
 		return rc;
 	if (!dax_region->dev->driver) {
 		up_write(&dax_region_rwsem);
-		return rc;
+		return -ENXIO;
 	}
 	rc = down_write_killable(&dax_dev_rwsem);
 	if (rc) {
@@ -1201,8 +1201,12 @@ static ssize_t mapping_store(struct device *dev, struct device_attribute *attr,
 	}
 
 	to_alloc = range_len(&r);
-	if (alloc_is_aligned(dev_dax, to_alloc))
+	if (!alloc_is_aligned(dev_dax, to_alloc)) {
+		dev_dbg(dev, "%s: size: %zu misaligned\n", __func__, to_alloc);
+		rc = -EINVAL;
+	} else {
 		rc = alloc_dev_dax_range(dev_dax, r.start, to_alloc);
+	}
 	up_write(&dax_dev_rwsem);
 	up_write(&dax_region_rwsem);
 
-- 
2.54.0

