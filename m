Received: from mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B44C3CFF72
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789440226; cv=none; b=AJplKGNz7rDiCi1GmyChHQv9g13tRfNZ2GXc7CoyRLYAcNw9gYfUWiR6SPSN5XFcu9cwpKM2zlqaz9miW4j/mxhDMA3AzLhr++L26yBvg+nPU05UpZDnhQEtzUPgBytgD3ipqh3w8QBdS5lM4RMTfAaIU+lvnoPnxIRQVxbhjL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789440226; c=relaxed/simple;
	bh=bALxJHIgAAekMhWqcUjYkzxgbHtb4sDDdgHlmxKh0to=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I47o7rQ0whbSN3Uw/ucidq/NIp4CANzvwmH2wBxVugKeBP99rMYAbxcc1UM4GmfFV3Fn80qM1LJ0bOSoRlEaK8bygIuvkLlNO2tYnfhsyeTqnzoYykhNm1lqSaC5Ieg7xCEnGPUhz9qiELvi+rvU5z5zxP65XdlbCUDYDriYU2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jOLQNcla; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jOLQNcla"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bALxJHIgAAekMhWqcUjYkzxgbHtb4sDDdgHlmxKh0to=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789440222; v=1; x=1790045022;
 b=jOLQNclagNVGQExjMJXidEsqipdzNc0JwJw4bcPHEAwXdQ1mEyk9k5JwUqouz8yv2oHwwYiH
 0FtHRT8gUjUdRitaoPr4B1xY8wy/O6zBww+DsfpiTkr/uH/V13Y0DbLEgru8o4SKVgO5tIybstx
 UONbIVXYIZF1IRrxHoz169+E=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b622b93473112159;
	Tue, 15 Sep 2026 02:43:42 +0000
X-Mizu-Trace-ID: b622b93473112159
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Date: Tue, 15 Sep 2026 10:43:32 +0800
Subject: [PATCH v2 3/3] mm/vmalloc: extract show_busy_info from
 vmalloc_info_show
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-vmalloc_study-v2-3-cc4dfe635e22@linux.dev>
References: <20260915-vmalloc_study-v2-0-cc4dfe635e22@linux.dev>
In-Reply-To: <20260915-vmalloc_study-v2-0-cc4dfe635e22@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Uladzislau Rezki <urezki@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Ye Liu <liuye@kylinos.cn>
X-Mailer: b4 0.14.3

From: Ye Liu <liuye@kylinos.cn>

Extract the busy vmap area iteration into show_busy_info, mirroring
the existing show_purge_info pattern.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 mm/vmalloc.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 973d15ef4f3e..e09d6c8c8b35 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -5345,7 +5345,7 @@ static void show_purge_info(struct seq_file *m)
 	}
 }
 
-static int vmalloc_info_show(struct seq_file *m, void *p)
+static void show_busy_info(struct seq_file *m)
 {
 	struct vmap_node *vn;
 	struct vmap_area *va;
@@ -5415,12 +5415,18 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
 		spin_unlock(&vn->busy.lock);
 	}
 
+	if (IS_ENABLED(CONFIG_NUMA))
+		kfree(counters);
+}
+
+static int vmalloc_info_show(struct seq_file *m, void *p)
+{
+	show_busy_info(m);
+
 	/*
 	 * As a final step, dump "unpurged" areas.
 	 */
 	show_purge_info(m);
-	if (IS_ENABLED(CONFIG_NUMA))
-		kfree(counters);
 	return 0;
 }
 

-- 
2.25.1

