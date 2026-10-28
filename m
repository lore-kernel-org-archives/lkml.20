Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793170211;
	b=f0S7cW0iFMDeAPq1vOVfpOEb7OeHaq/F4INW6KNgtsnhQVzNXUYhaCmeXhZCkXzZen1i
	 qADL17QtzwqnMzOFD5wSrbF61XSRvq+zXIGXxOHwfQno96+s1+iuS2VDi4v/xyz0LbQ/L
	 WBR7+IOGMJ7UXmejgsRiCQMfYnHZ6SFbvOPexUBfwJKJyZ+nUZY0dU9d5oaTQgFPRFChR
	 fVZfPihE38ZkrO8NytNB0qKfiFIEVxlf1xW8IhbBEdsHc3F+kkZCnxCjrzvomJQxSu6kR
	 33+Lfnyh8+BVmbYK4cbYDtDGQGeB0G+Q39rkdtY1KYCBzsW/U5yOpMsHnxfN1HzTybw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793170211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sFhRdI8EQ8MK0p+CW7dH/qNlkXIP7SsPBqhbqXWLgo8=;
	b=irRT2QB1+ARq+N+bI/Qtba+EXnXBTCHmm8IxAc6IyiGGlgVxFoAdTQFEWI+N29qNDlX9
	 BOgDl6kK+bFRCevBW6fOHgmCWksqmYTL9B3hoAOCsfi0aE3aBwqyED+mIpAlyUFTR+S3V
	 d9MmRZLfMwAW8+WUcp66jGWFlwwXjnh/qT2HAsvPiqSdKAknvTE9a4eWcuz1cj+pexXiL
	 CrHe2Hr1t8/AzXkJC3W+mBF0DVd3jAg3ga2wGEzUmlLAL4Iq29Swk0nrDNae8OvR6IwBb
	 E/hIYikKE/Fn+DgOHq2WtJUWzuj/jmY6TGuAfNbDKOvhPi8agX+pwXkOw+xhFAVFe5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HqMUEPXJ;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A9C606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3A9C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HqMUEPXJ
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a215e64962so6188955e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793170209; x=1793775009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sFhRdI8EQ8MK0p+CW7dH/qNlkXIP7SsPBqhbqXWLgo8=;
        b=HqMUEPXJVdP6J1IEnR1xcnYhEHqrxYYo9t0WW9OF/y887mPyMsPavGLyLE4fOEPvAZ
         1rpgz8llkCN4XHtVNIULxpHhY0O6FtZfYMtlD9mzH1ffpCb3hcEuBxQ3O+X6UX3dedGl
         eUKS88Psa82wHjupcx01IGEd/7aq7NESmRkc+AFd99PpHe3YQunLvnQ8PzPCFLwRncKK
         46/eaYSHd/oEorjebO2mSIASZUKIhXn8hhui0MAXOrUftee5I45COXgHYu8kxZWbVwmH
         t7cC7qER7Nq3cqj/uFDOnK0kR6KTXPuGuMdwTRkz6gO9cQT/rhknwACglRa7thSXu15P
         Uimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793170209; x=1793775009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sFhRdI8EQ8MK0p+CW7dH/qNlkXIP7SsPBqhbqXWLgo8=;
        b=qVmvwOgAVHEy2YE1xy0jXQdZJc6Y7PS0sFCwbdCBvubygqzgQ22R5wR6zXgMR4/MtV
         R+WrwSzMzAue1hlXkb5xqGLBXDjX/oB51HLKcLuIm9QElmwMqhvWs5wJg9ewpfEsbGl0
         5JOEW2g0b9LfGLj9rqQbu6sKeu4xjgXV5pMAzdXk9rFmc9ymvrtArU7lWAtW4A6TBwkn
         3sxDY9gkmnjUjl/OL0WYtBOcD179CbOxN9S7Qq4QFXh/Itd7PKMBiMq1DwH8iuOkhUsL
         2nLwkTvgLxyKfWrkCST8phh0ndB9EhA8WkXRRLqzTt1OMctxgI1UrMRCv2L1xXnAhF3X
         Cxgg==
X-Forwarded-Encrypted: i=1; AKwUvBw0akx3Z3WFJyZX8n37IdomW876EzGfO7byjHwNCi0DUC0ugy+pka+WsPWADZMxT5M/zlK2AcKjV2mKDm0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUGTq7Nou2QI2lbouzy+gs2DtTLZ73LnHR15dmOP3seuiQdBo6
	ZNs8WEFNkAGQ2aAsJy7vTEmXY2uEGrqF8FTKxEFk1pXcQ/btuDDnRr5+
X-Gm-Gg: AYBFou2smZWRXLH7Z2H+Hgf817NcT1DBTOVqDHIHRrTTTOQaevUmbrmPFGsAMDmNuYN
	zSqYmh/zuG9YC4XOcSxCK6Ni8oBgS9M7m1KEFTx4iFlUJ1N4kMGOud0XWXWtISlw7Q3V3KvGval
	TPkxXqS2W7WMXW6i+9DO2HCGedqnZ3NBTqkZkpTRkM3F5KRrIP7nlNsF3A5xkSwzFN63t7On5Aw
	vpnh2AQhy+/TAwjhyW6rETZZx08r/LnXZZ9T8lOEtTNjaeHrSLY9xH0+2oRd6UZKeMCZd24H5Ax
	B+zgTueuCygnNF3l8o52OUVbQiVjN3ek+a/MU9Ty2Fvt+i43qrBHr27DMh5/tJX0p5/3fIHDUKF
	/rMu4FlZNDkJuSvTOmIFyL5MRCy+/WoFi3Hd/7hbxkWA3dTy2xY3k/m+qlyJ3OSdBbMmU1iQZNX
	Le0unqxf1ndpE5hpRmtjXyV2FWbCt9kPTTFo4ZdLLjQJRWB0dX2JAddlVu0CQ2YIu+gWGDUTAsa
	WEZFiH1hGMaECPlVNNU6d/xH4O/53Ne8mb3HgpxDTf9UCSp+5okEbulCvs1n+oKeKpznl6+hsid
	41jQSHO8jvQhjRv/u+A/nc98niXndPJ6MLw=
X-Received: by 2002:a05:600c:154a:b0:4a2:fe3:121b with SMTP id 5b1f17b1804b1-4a9678c268dmr27227395e9.28.1793170208726;
        Tue, 27 Oct 2026 23:50:08 -0700 (PDT)
Received: from LAPTOP-AVI.lan ([2a06:c701:4778:c500:80cd:d127:b224:9e6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a978d57b39sm38767015e9.10.2026.10.27.23.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 23:50:08 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Dan Williams <djbw@kernel.org>
Cc: Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] dax/bus: clear parent drvdata when releasing a region
Date: Wed, 28 Oct 2026 08:50:01 +0200
Message-ID: <20261028065000.580077-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

alloc_dax_region() sets parent drvdata before reserving the resource
and registering sysfs attributes. If either operation fails, the
region is freed but drvdata still points to it. A later allocation
on the same parent is rejected by the non-NULL drvdata check.

The devres unregister action also leaves drvdata pointing to the
released region. Clear drvdata on both allocation error and
unregister paths.

Fixes: d7fe1a67f658 ("dax: add region 'id', 'size', and 'align' attributes")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/dax/bus.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dax/bus.c b/drivers/dax/bus.c
index b809e1a264afa..dceaa395760e7 100644
--- a/drivers/dax/bus.c
+++ b/drivers/dax/bus.c
@@ -627,6 +627,7 @@ static void dax_region_unregister(void *region)
 	sysfs_remove_groups(&dax_region->dev->kobj,
 			dax_region_attribute_groups);
 	release_resource(&dax_region->res);
+	dev_set_drvdata(dax_region->dev, NULL);
 	dax_region_put(dax_region);
 }
 
@@ -685,6 +686,7 @@ struct dax_region *alloc_dax_region(struct device *parent, int region_id,
 err_sysfs:
 	release_resource(&dax_region->res);
 err_res:
+	dev_set_drvdata(parent, NULL);
 	dax_region_put(dax_region);
 	return NULL;
 }

base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
-- 
2.43.0

