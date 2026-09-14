Received: from mta0.migadu.com (out-5.mta0.migadu.com [91.218.175.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DE52EEE99
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789356868; cv=none; b=eg9EYNTX3G2jrT9VEzdGn8W0lmUNlL2HPhFtJf/m8JoSkdy4KpIIn7WVZdmEQmHaAe+KRfaIumiZh2jWRUW/EvEn2fJ4M65u+kHYe+cCKaEiYSLKDUmS8fR8K0KgzXQPuQ1fy6W5cUBlgMMLS9pGA7Y5YjurSENRR0hz/ak8UXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789356868; c=relaxed/simple;
	bh=GcO7629LLmWdKveTN71W2Hm5N+m1skxoYeOST5aDrko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iAGQIva1NBCTNFgP918ifccsXoPVaaiF3EjrJeCaRGByfDvpvUGv697hIzcd8nWk/U3BttJydO9q6zRvjmCtdBaw2CzMHLRB19THJIacEx4duDDnP4i0nAaLhJM4gECUrIGcGlMrr8GL5dHRvK5MnsFi41ZXG3AM73R05zNdlFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=quOVkhvj; arc=none smtp.client-ip=91.218.175.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="quOVkhvj"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=GcO7629LLmWdKveTN71W2Hm5N+m1skxoYeOST5aDrko=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789356855; v=1; x=1789961655;
 b=quOVkhvjkgIAyv+cCaLsZXZhIctFJxSfOV0sKiZ22mIcuMjCDn4z5XNF385jQy85Cwv5IkAW
 x0DkSZf63o4CgbfK7GXbduRXa089ONgyggIAuRc7T27BW4NM4+MhCzVxO63zp0zRWDmdaJ8rdKa
 d2Iuk39tME82mh6nv94ZdsQU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6ddbd71e14968a1a;
	Mon, 14 Sep 2026 03:34:15 +0000
X-Mizu-Trace-ID: 6ddbd71e14968a1a
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Date: Mon, 14 Sep 2026 11:34:02 +0800
Subject: [PATCH 3/3] mm/vmalloc: extract show_busy_info from
 vmalloc_info_show
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-vmalloc_study-v1-3-526f68559706@linux.dev>
References: <20260914-vmalloc_study-v1-0-526f68559706@linux.dev>
In-Reply-To: <20260914-vmalloc_study-v1-0-526f68559706@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Uladzislau Rezki <urezki@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Ye Liu <liuye@kylinos.cn>
X-Mailer: b4 0.14.3

From: Ye Liu <liuye@kylinos.cn>

Extract the busy vmap area iteration into show_busy_info, mirroring
the existing show_purge_info pattern.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 mm/vmalloc.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 797933ba9451..7638845377f5 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -5345,12 +5345,12 @@ static void show_purge_info(struct seq_file *m)
 	}
 }
 
-static int vmalloc_info_show(struct seq_file *m, void *p)
+static void show_busy_info(struct seq_file *m)
 {
 	struct vmap_node *vn;
 	struct vmap_area *va;
 	struct vm_struct *v;
-	unsigned int *counters;
+	unsigned int *counters = NULL;
 
 	if (IS_ENABLED(CONFIG_NUMA))
 		counters = kmalloc_array(nr_node_ids, sizeof(unsigned int), GFP_KERNEL);
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

