Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4933737F73A
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 16:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791649285; cv=none; b=QpAftsbZiL8OQKedlzdHUPyjKmtbHg3qOD7K+IY3U+2d97cJcScW2BVhpcaEa/T4EVFKoddIvZEfvf9LJD0P53CuSdG9lYHJ+9ZAkwD4C8Unk0nfqPWyrhq/Wbjmcqxp0aVBCjQOEEbuMKSOmQk2Gt5CPpegu9PkrrBi1F9xtlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791649285; c=relaxed/simple;
	bh=ti6lMVLsFbkO/cP4TZ8Ckp+WRadDUo3yV1V9rhGVx7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QX+pCuIOMrdchwf+S/DvneGnsB1aRK/wDyUMpwdkWbzrZAEOKfPLJjmCGZXoOBnQ5Bi64c0BD2LqFwQoglHy+GK3Q0ijNLj71F2BZTfTwdS7g7bN3kxKj2UvMPCYYQImTR0yu+vdzi51KShllf6UcUIgHx4e6JiL+wKXosN+cVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FFD4hfhs; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FFD4hfhs"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so1037159eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 09:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791649283; x=1792254083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JK7tMUimMJdBOEqaL9WlBjYAfUfZHviVsycPcwxmo+U=;
        b=FFD4hfhs/0dtbNLyp+lDIhr22ea2xYANS+U6IsGZLiioywET8Ll0HCv58VVAWdw3yV
         Y8I2O49U/Kc68vCBXFDdi6ZfuU2x3cx8eYzDM3EYhI8QBf3GKAb67hhhiRYyoKpYLkfg
         ZOFSS1U680dNOWhXKrerzhzbvDdYgXEnBHWgWWpu3td4+0tR84ZTDbOCG8qtHco8khTz
         OYkZtOrWgWMsCmAVDQLOJDy0r1/npMSAKr8VKEiBfUy0deb2gD6VKu1V5KypvRl+T22v
         lT8qbjyqwm6M6Lqu0UjY5nJUzpvquEhG6Nh3fa0cnVLJ3/FeETLr4FMLmqAkOZ+MieM6
         kvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791649283; x=1792254083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JK7tMUimMJdBOEqaL9WlBjYAfUfZHviVsycPcwxmo+U=;
        b=WOhi8EITIJzSb7mDiGUZ2Lj7zZSjEc/10V8RQbxzQDaWxf6XzaXLLSp9z0M8dYi1HV
         H0e7CsuH8LEbAACLQPz5Wn7K8mzmsSYgfpN1Sb2DqdKbpXuFNDLZWeGce2XrcwDm8/C9
         ab0GWEHHw3+s10zQBTaYBqsFHk1SVI3ziDy56M6nGVUyAA58LYWH3jbHUgt3mIMIVAHk
         b2+NQKG5xQtnzfIHnYTS8W2dsLqRY1sSyP3azjXVKIQ8HTRaS89Q8Duu7Kzk9Ce1EuAa
         ssWj9N/tnNbxN2T3bpvitjwPgLrO3A+kLSXoQf7kzmrizPx0iM0vt5Zjd6dtLMUdMu1e
         hHBA==
X-Forwarded-Encrypted: i=1; AKwUvBzCYv6Xigi0HRjx9D4NYdDp4wB+zjMoCiAO6l7toUbNR5evu2ljMYIce0VbJ4oAxDoQ/0MptMxCl2SWi70=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFZf4DMylKcqyi3aVPQzGybQNfDyJyIZtHoU4fIk+zbjsf4PLI
	09z30ctZ+j9VGyq4lLAtu/tp+TLzcVXoB7bmDILbCxDhy5o7eUVFRyVz
X-Gm-Gg: AYBFou2gABuHl9wocU8Wu0w9qyPxY6mnYfMsZDSylacxhJRiXKkXL9z/cBZV6W+W+AL
	eesCL0dUVJqOc59sL1a1+UTEIo7L/c6jPfAELdtqTwkBLaQWTvjgR0yzrnpLhmKA/cUXahL4lEq
	z/ioDrfg+qIWFIDC4yA9I1KKfZG5TjW8AlmCIQAPo3Mec8GAYEVy+C2jsanIl6OvJLDLsLpP94d
	qWJ4mP5st0UDuJZbF5GgdgVx6mpTl8qogHvI0LaiOyrr94x3mBIIZ7h8AKb+dz3vNcwXvf4+gXu
	kKqXG0jQ0KPnuUNj6vU8xGq6l5PTcPwIDL5s4X+7jLCDGWt4ttWHgU74GJ/HNsSZ8Gsh+yH5w5p
	Y7yUhAFGGTeXGNOOFkENgac/gvHyrs6pYpCKUN+rJfbJH5um41i5Rn2YYtZgiLEQX58hHTUEbIf
	XUZCmFv3N/ot8L7hR8X1yd6p2qdaPCK7cPISNxbbpmJpvMwpZvyncfzdFHgzrQVX/jG2WanvhBm
	S9TsHzZCTme2yskfA==
X-Received: by 2002:a05:701b:4502:10b0:143:50a0:56d6 with SMTP id a92af1059eb24-16a5faa6991mr6411962c88.7.1791649283242;
        Sat, 10 Oct 2026 09:21:23 -0700 (PDT)
Received: from acer-nitro-anv15-41.. ([115.96.176.39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a3f6186fsm15778622c88.14.2026.10.10.09.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 09:21:22 -0700 (PDT)
From: Shaikh Kamaluddin <shaikhkamal2012@gmail.com>
To: Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jic23@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dan Williams <djbw@kernel.org>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Breno Leitao <leitao@debian.org>
Cc: Ira Weiny <iweiny@kernel.org>,
	Li Ming <ming.li@zohomail.com>,
	Richard Cheng <icheng@nvidia.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Kiryl Shutsemau <kas@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Shaikh Kamaluddin <shaikhkamal2012@gmail.com>
Subject: [RFC PATCH 2/5] cxl/region: Factor decoder poison-list retrieval
Date: Sat, 10 Oct 2026 21:50:10 +0530
Message-ID: <20261010162017.62506-3-shaikhkamal2012@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010162017.62506-1-shaikhkamal2012@gmail.com>
References: <20261010162017.62506-1-shaikhkamal2012@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

poison_by_decoder() performs two different operations: it queries an
unmapped DPA gap preceding an endpoint decoder, then queries the DPA
resource assigned to that decoder and its region.

Factor the second operation into cxl_get_poison_by_decoder(). Give the
helper an optional snapshot so a later region-probe caller can retain
records from exactly one mapped decoder. Keep the existing endpoint
walk, skipped-DPA queries, partition-tail queries, -EFAULT handling, and
trace behavior unchanged.

Signed-off-by: Shaikh Kamaluddin <shaikhkamal2012@gmail.com>
---
 drivers/cxl/core/region.c | 41 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/cxl/core/region.c b/drivers/cxl/core/region.c
index 75b8092e6dc2..c72524923b38 100644
--- a/drivers/cxl/core/region.c
+++ b/drivers/cxl/core/region.c
@@ -2940,6 +2940,40 @@ static int cxl_get_poison_unmapped(struct cxl_memdev *cxlmd,
 	return rc;
 }
 
+enum cxl_poison_query_policy {
+	CXL_POISON_QUERY_DIAGNOSTIC,
+	CXL_POISON_QUERY_PREONLINE,
+};
+
+static int cxl_get_poison_by_decoder(struct cxl_endpoint_decoder *cxled,
+				     struct cxl_poison_snapshot *snapshot,
+				     enum cxl_poison_query_policy policy)
+{
+	struct cxl_memdev *cxlmd = cxled_to_memdev(cxled);
+	struct cxl_dev_state *cxlds = cxlmd->cxlds;
+	enum cxl_partition_mode mode;
+	u64 offset, length;
+	int rc;
+
+	if (!cxled->dpa_res)
+		return 0;
+
+	mode = cxlds->part[cxled->part].mode;
+	offset = cxled->dpa_res->start;
+	length = resource_size(cxled->dpa_res);
+	if (snapshot)
+		rc = cxl_mem_get_poison_snapshot(cxlmd, offset, length,
+						 cxled->cxld.region, snapshot);
+	else
+		rc = cxl_mem_get_poison(cxlmd, offset, length,
+					cxled->cxld.region);
+
+	if (rc == -EFAULT && mode == CXL_PARTMODE_RAM &&
+	    policy == CXL_POISON_QUERY_DIAGNOSTIC)
+		rc = 0;
+	return rc;
+}
+
 static int poison_by_decoder(struct device *dev, void *arg)
 {
 	struct cxl_poison_context *ctx = arg;
@@ -2971,11 +3005,8 @@ static int poison_by_decoder(struct device *dev, void *arg)
 			return rc;
 	}
 
-	offset = cxled->dpa_res->start;
-	length = cxled->dpa_res->end - offset + 1;
-	rc = cxl_mem_get_poison(cxlmd, offset, length, cxled->cxld.region);
-	if (rc == -EFAULT && mode == CXL_PARTMODE_RAM)
-		rc = 0;
+	rc = cxl_get_poison_by_decoder(cxled, NULL,
+				       CXL_POISON_QUERY_DIAGNOSTIC);
 	if (rc)
 		return rc;
 
-- 
2.43.0

