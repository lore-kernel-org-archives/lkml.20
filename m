Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3EB258EE9
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 03:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789875862; cv=none; b=jOWeK+wL95CeIga7mKrWtIhvZKM5ZIhH2++c7Mf6C7uolR4cnxkBulQKMj5E7t04OGT8e/yCpSGb4heAwylx4KVuqJtc1w0WStC9aoiD/ZFNKuX7qyFviPXJ/jHdesI5autwm/oWuDNC3+v7sxDRp5KK/I07IcR8gYAQM0DnM0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789875862; c=relaxed/simple;
	bh=Rzuj9iTUj7qN/KDU4lrEr1y5WJZPTTO0ADn4JOLXIfw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UZMfWb7vNGn31zKLK/9Q0DX0PTYsV5XPPp6aeGGdFF3CLO4FN1IglkrnX3+/Q9UyJPBR7rPu+Jm+OlMbf7LmqZMuPPNjr/rOC3sDS29B20Yv52GYsXmLEwHPzDm84VRqHAHr/WKZFYRaAjR7HM0KrzFgaL1apyOLEo4osUg83L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=KhO8TJY5; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="KhO8TJY5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=/4
	6K7CKA4FLhX8P6PiPB9A09fZBI9tPYG8e8QYie1OE=; b=KhO8TJY5g1a3ioZPnF
	cuXNGN9dUvAgRLekldk2ssfQBCsNtmDCmjJmQhOVU1d9K02XaScw6d6OHgtak8Jj
	2ok7aQWYd7itUYCjuwwB1VDrvPF/lzLwRz1/rLXK8GZ3vn80ttzk8/AwiOnttNv1
	QxkvN4H3har5U7egTcO+v9CgQ=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wCnd59jVq9qEHkyBg--.226S2;
	Sun, 20 Sep 2026 11:43:34 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: alessio.belle@imgtec.com
Cc: luigi.santivetti@imgtec.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	imagination@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	frank.binns@imgtec.com,
	matt.coster@imgtec.com,
	sarah.walker@imgtec.com,
	donald.robson@imgtec.com,
	boris.brezillon@collabora.com,
	hppiscas@163.com
Subject: [PATCH v2] drm/imagination: clamp freelist reconstruction requests
Date: Sun, 20 Sep 2026 11:43:29 +0800
Message-ID: <20260920034329.16614-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCnd59jVq9qEHkyBg--.226S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJw47Jr43Kr48WF1xAw15XFb_yoW5GF43pa
	95CayUJrWkJa1IgrsxA3Wjqa45Aan7A3WfKry5WwnrZr13trs0ya9akF15Xry5trs7Zr47
	ArnFgrZ5ZF4UA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziBMKNUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxQY1-WqvVmaBAQAA3+

The firmware reconstruction count controls accesses to the request's
fixed freelist ID array and the copy into the fixed response array.
Neither access currently bounds the count to those protocol arrays.

Clamp the count to the request capacity, which is shared by the response
layout, and use that count consistently for reconstruction and response
publication. Keep the firmware recovery exchange instead of dropping an
oversized request without a response, as discussed with the firmware
maintainer.

The issue was found by our static-analysis tool.

Fixes: 6eedddab733b ("drm/imagination: Implement free list and HWRT create and destroy ioctls")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
Changes since v1:
https://lore.kernel.org/all/20260813152759.35856-1-pengpeng@iscas.ac.cn/
Include drm_print.h for drm_warn_once(), brace the multiline warning
block, and shorten its text as Alessio requested.

 drivers/gpu/drm/imagination/pvr_free_list.c |   15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_free_list.c b/drivers/gpu/drm/imagination/pvr_free_list.c
index e85cac83834c..faf5e586d8dc 100644
--- a/drivers/gpu/drm/imagination/pvr_free_list.c
+++ b/drivers/gpu/drm/imagination/pvr_free_list.c
@@ -8,6 +8,7 @@
 #include "pvr_vm.h"
 
 #include <drm/drm_gem.h>
+#include <drm/drm_print.h>
 #include <linux/slab.h>
 #include <linux/xarray.h>
 #include <uapi/drm/pvr_drm.h>
@@ -612,13 +613,21 @@ pvr_free_list_process_reconstruct_req(struct pvr_device *pvr_dev,
 	};
 	struct rogue_fwif_freelists_reconstruction_data *resp =
 		&resp_cmd.cmd_data.free_lists_reconstruction_data;
+	u32 count = min_t(u32, req->freelist_count,
+			  ARRAY_SIZE(req->freelist_ids));
 
-	for (u32 i = 0; i < req->freelist_count; i++)
+	if (count != req->freelist_count) {
+		drm_warn_once(from_pvr_device(pvr_dev),
+			      "Requested reconstruction of %u freelists, limiting to %u\n",
+			      req->freelist_count, count);
+	}
+
+	for (u32 i = 0; i < count; i++)
 		pvr_free_list_reconstruct(pvr_dev, req->freelist_ids[i]);
 
-	resp->freelist_count = req->freelist_count;
+	resp->freelist_count = count;
 	memcpy(resp->freelist_ids, req->freelist_ids,
-	       req->freelist_count * sizeof(resp->freelist_ids[0]));
+	       count * sizeof(resp->freelist_ids[0]));
 
 	WARN_ON(pvr_kccb_send_cmd(pvr_dev, &resp_cmd, NULL));
 }

base-commit: 518e5b794c06c0f0eb40df3e202274a66202c137
-- 
2.50.1 (Apple Git-155)

