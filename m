Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833375;
	b=So9v6lX847uiC5+zcE6bCtSkhOXdGtJnu429mZtMgXd5eux0pDHUOKaKgZpIs451RKdx
	 e2q1kWdZk4kfFETjuGspd0wQHrf0ftNbkGVhPvQOcZw1/TqiA8a8Yc5mnceSeWDwqW3m3
	 3rQM/8TmqJNR3u7uBdHzSsVp8Esci8koQC4UWtzKY7Z7JOX4RYI92Aa43gGDz586RnEIP
	 +BIA4x/CpAZxQaC8X1tOlLBDj1C4qbXKrrAABNoc2E6Smwx0qb/jvXwyjvkCrX7dgwKNP
	 /zcm4qVCah3HDvPppgGuxzg4nH5drm3mUAHlayB3bu1rOU5sLVr/vssVyiX18ENiuGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=JjAyaGZls9f5VsEm6NTVGb8BE0iRo4CKaOU62Z44t6A=;
	b=x66b9NYkcpxQzrolW/IldIgz/7nsNyH11CtP0cMLIksW7Q4Bf+Yq1Uve43ezdal16icb
	 q4JyKWh9xML/mfUCEv7ky8FVRtGucoYYz9btUczqh1VUS4b0LYMuXPsCYcCNUp2Y82HMH
	 RuzkMxy6pMrkASA2MYXn8sBgisTn9ZXYW5Uj6qcmlOLnm2oxefQJyXIy3GMpN7dq+J6rr
	 ljBciQM+IJdEOReK6dTBNAtj9eLfkS4oueNQyZGq7f0enDhZDwNne5oWATZ5OD/oACyMU
	 To40ryf2qTjxetbjbHYhWA0TeKWJkPmtgI4VofIoJsoGcpIuHDi+vkxfpAIBhetTHqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gYnjC+CX;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263646082BDC
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:02:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 263646082BDC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gYnjC+CX
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ed28bac8d7so304625ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793833374; x=1794438174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JjAyaGZls9f5VsEm6NTVGb8BE0iRo4CKaOU62Z44t6A=;
        b=gYnjC+CXhc+JXwhfT/dJwOR141ZEGR3clsXJn50txpneu12AMqKHEeAjwiNzXGTO8x
         erByi5GTT4hXfIgiXzGjUrjkz/kuduoC4CSkDQDAU7hWCH0jpnt2NDuIrF1LqgX0tAF0
         wp7jwcufhFlmMgHpzUvyeCJX0MvmKp47XyespZQLIvpjziUI+9gNTxikG5TZyaCW1VVz
         dkoAwJSaiJ4PrVeON0bMGnfm28FzvWFL5AN+pqBE2V6CJ/PjDC7SmehM/pgPaegi+j8O
         OuBfMq1boUGEiWbkTEZmligJEX7kJsaMrwur57IxM6HPpShFMcTaG6f1imKWgubnU8EX
         OdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793833374; x=1794438174;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JjAyaGZls9f5VsEm6NTVGb8BE0iRo4CKaOU62Z44t6A=;
        b=gVxKcm6hp3wmMi+mXOF+mV4fQZpr3sjjlTfk3bhJe9xpPegeAiENCttBpT61PwdvQg
         yc2KoG2Y4XAu+729NRpweGn4O7nWIiX1AKKixFaIDvqe9Ly17KQRzwHEFxn5tCrHBapo
         1EJQIT9Sd8lwju9+c3VAjgfp1nzTZVWkuZP6mMThZjqO8BouwI+t26fgBVFVMDZqcb6V
         yEn2nZeqvjm9Yg+UbSgjBwNhhXEECBJt01Js2sSuGVLfXU9uA4aIJQHuqVRssMFALfkl
         SO1csZ3LPVJ6HR7dqtLaeWsmEevO87lqGvzN+wOfR9sjtyo560K/09PAHCI0ply3HjsK
         iN1w==
X-Forwarded-Encrypted: i=1; AKwUvBx0cACF99LuPzv7Llq/bk/7wZBGfmluVC7/2vwCz2Ta5TdIuBv7PYzqaEt8VyAWbumsW12IXg1iBFyjYGs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CtuGkPbAhM+ggkIBvpTb58qXzhSbdi+pp2BViHVE5DKU6u5rM
	2t02PQw4zqtA1vqOM9fcmC/728fvVOR1KqMgUZL7D2WsAm44JIG6CdeB
X-Gm-Gg: AYBFou37BLfOY/9BS6N0JgwKcepRk2xw9S+U97tF/ag9IUmrrPHdIAP94f1VASZdtO3
	YEWvtRwH9NSTT1HkHKGkm78zcssp4o3M7i6PkwbKHrLLB5meJiGC3lQJFGDqxLH3r80ftKsfhvR
	vcbEn84bmh/siS41nZX/sbLD+/8FGwu8BKfE25hxyK7pKqWTWuUW0iq4z5nFU+ID4PdaOSqUWdd
	verMjc0cH/C7dQOrNvavw8xUmjusenxCP9n7D1nnI1GEm8e1xks6uSvpCUGJDge/Qf8U3TRWwLb
	SEqulIFs5FwxK+uUFM+ZhOaSda+6ZmsDLdXULJorJuYoeX2svMwyMFmG0ba/mCCtRNnJ4Jf+M5p
	Oc4pINkn7FNziclLZkWMNjhrOcnsSnrQHLFBJxUfhsN55UbMgtx79dUYFBaB5HuRly5waYiKY0g
	wJa+GO4Ql+tzJIAJ0Eo9Oa2cWci+drmYdjxwhpOqFnLRtzOsEiQHd+thFrw/aYbgYsyq7tlQzkr
	D8HYKIqMZ4OkHOZ5ninALdjgLdIuBHTlLfT3meK41SRPOc85S09ZDz4HAZbbxZWj+E1xfTHunQs
	2ls8wioBoDenVq0Jdg3G6tgBGYneyQ==
X-Received: by 2002:a17:902:eb8b:b0:2e9:6333:fba8 with SMTP id d9443c01a7336-2ed23ef99d9mr5080245ad.16.1793833374462;
        Wed, 04 Nov 2026 15:02:54 -0800 (PST)
Received: from cxlqual.. ([220.120.90.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed0908587dsm10999175ad.36.2026.11.04.15.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 15:02:53 -0800 (PST)
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
Subject: [PATCH v1 07/14] cxl/mem: Drop misaligned DCD extent groups
Date: Thu,  5 Nov 2026 08:02:31 +0900
Message-ID: <20261104230445.66625-8-anisa.su@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104230445.66625-1-anisa.su@samsung.com>
References: <20261104230445.66625-1-anisa.su@samsung.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ira Weiny <iweiny@kernel.org>

Add an alignment gate, cxl_validate_group(), that cxl_add_pending() runs
before realizing a tag group: every extent in the group must have its
start_dpa and length aligned to the dax region's mapping granularity.
A misaligned extent makes the resulting dax device unusable, so drop
the whole group rather than accept a partial allocation that would
surface a broken dax_resource.

Based on patches by John Groves.

Signed-off-by: Ira Weiny <iweiny@kernel.org>
Co-developed-by: John Groves <John@Groves.net>
Signed-off-by: John Groves <John@Groves.net>
Co-developed-by: Anisa Su <anisa.su@samsung.com>
Signed-off-by: Anisa Su <anisa.su@samsung.com>
Tested-by: Wonjae Lee <wj28.lee@samsung.com>
Tested-by: Junhee Park <jh9934.park@samsung.com>
Tested-by: Heesoo Kim <habil.kim@samsung.com>
---
 drivers/cxl/core/mbox.c | 46 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/cxl/core/mbox.c b/drivers/cxl/core/mbox.c
index 18044f216de5..a605ffc4c64f 100644
--- a/drivers/cxl/core/mbox.c
+++ b/drivers/cxl/core/mbox.c
@@ -7,6 +7,8 @@
 #include <linux/unaligned.h>
 #include <linux/list.h>
 #include <linux/list_sort.h>
+#include <linux/pgtable.h>
+#include <linux/sizes.h>
 #include <cxlpci.h>
 #include <cxlmem.h>
 #include <cxl.h>
@@ -1395,6 +1397,19 @@ static int stage_pending_extent(struct list_head *pending,
 	return 0;
 }
 
+/*
+ * Extents need to be aligned to dax region's mapping granularity.
+ * Use PMD_SIZE, since cxl_dax_region_probe() calls alloc_dax_region with
+ * PMD_SIZE for the 'align' parameter.
+ */
+static bool cxl_extent_dcd_aligned(const struct cxl_extent *extent)
+{
+	u64 start = le64_to_cpu(extent->start_dpa);
+	u64 len = le64_to_cpu(extent->length);
+
+	return IS_ALIGNED(start, PMD_SIZE) && IS_ALIGNED(len, PMD_SIZE);
+}
+
 /*
  * Compare two extents by shared_extn_seq (ascending).  list_sort is
  * stable, so extents with equal keys keep their arrival order from
@@ -1497,6 +1512,32 @@ static int cxl_realize_group(struct cxl_memdev_state *mds, const uuid_t *tag,
 	return rc;
 }
 
+/*
+ * Validate a tag @group before realizing it.  Returns 0 if the group may be
+ * added, or a negative errno if it must be dropped.
+ */
+static int cxl_validate_group(struct cxl_memdev_state *mds, const uuid_t *tag,
+			      struct list_head *group)
+{
+	struct device *dev = mds->cxlds.dev;
+	struct cxl_extent_list_node *pos;
+
+	/* Alignment gate — drop the group if any member fails */
+	list_for_each_entry(pos, group, list) {
+		if (!cxl_extent_dcd_aligned(pos->extent)) {
+			dev_warn_ratelimited(dev,
+					     "Tag %pUb: dropping group, extent DPA:%#llx LEN:%#llx not %#llx-aligned\n",
+					     tag,
+					     le64_to_cpu(pos->extent->start_dpa),
+					     le64_to_cpu(pos->extent->length),
+					     (u64)PMD_SIZE);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 /*
  * Drive the pending Add-Capacity records through cxl_realize_group() one
  * tag group at a time, moving each group that realizes onto the accepted
@@ -1541,6 +1582,11 @@ static int cxl_add_pending(struct cxl_memdev_state *mds,
 		 */
 		list_sort(NULL, &group, extent_seq_compare);
 
+		if (cxl_validate_group(mds, &tag, &group)) {
+			drop_extent_group(&group);
+			continue;
+		}
+
 		cnt = cxl_realize_group(mds, &tag, &group);
 		if (cnt < 0) {
 			drop_extent_group(&group);
-- 
2.43.0

