Received: from mta1.migadu.com (out-193.mta1.migadu.com [95.215.58.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F036247DF87
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791961490; cv=none; b=eLgo/7SppW+gU/Ir0z0w/jaNv2lfVp2Tu8/JEEzleEmu3OPviRyYG8rX73qnEmmsJfvbGDzP6Yvl4Fn7qm+m1XK0+e3mrWCcOxAXpIjflhdlBO7j4NXwrgNXSF8jKSQoq2ZeZlYlPixIovH5tI8fDiHgMV4J0OSugUBe3zXnBBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791961490; c=relaxed/simple;
	bh=a8IVuRQyar4rCZ1VnViGaDLpXC0Aw1KqpIOSXik/RRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sJS7915iDIFEx6d2TZuCzbYzMdMVuFWlXfkaK9sZBIe91t2YFA+GJ58EJwQch0walo5Yb8PpcwqnyUcpGPTUe4OUvzFsadEMOQzYNe9gLrJwODNE6zoGo2vazgKGD12aqXlaNT0flQ+Q5axvnrUpdNYaK/4nsRD0RuOGvKCz0dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=H+FGwyaD; arc=none smtp.client-ip=95.215.58.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="H+FGwyaD"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=a8IVuRQyar4rCZ1VnViGaDLpXC0Aw1KqpIOSXik/RRU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791961481; v=1; x=1792566281;
 b=H+FGwyaDNIKzF+jdFvOzYNS7JR9+rXkt2D5nwa4r5hjM3vfWtfG5HZgZP+uE5Yh8xATlCCol
 X66hZtsTw18VZ4bjVswkas/3FweJlB4V+wNsFe8RY39FY3+PHcJtZj4Wk3MbSm2DCrulfe2GHdY
 PwoIBAmgZJ8PMwVfTcBBTHyo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4460845ac86d30e9;
	Wed, 14 Oct 2026 07:04:41 +0000
X-Mizu-Trace-ID: 4460845ac86d30e9
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Date: Wed, 14 Oct 2026 15:04:28 +0800
Subject: [PATCH 1/3] tools/mm: fix memcg info retrieval in
 show_page_info.py
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-show_page_info-v1-1-7a68aee0114a@linux.dev>
References: <20261014-show_page_info-v1-0-7a68aee0114a@linux.dev>
In-Reply-To: <20261014-show_page_info-v1-0-7a68aee0114a@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Ye Liu <liuye@kylinos.cn>
X-Mailer: b4 0.17-dev-39d60

From: Ye Liu <liuye@kylinos.cn>

Fix obj_cgroup type casting and slabobj_ext field name compatibility.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 tools/mm/show_page_info.py | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/tools/mm/show_page_info.py b/tools/mm/show_page_info.py
index c46d8ea283d7..9cfb5cac05a3 100644
--- a/tools/mm/show_page_info.py
+++ b/tools/mm/show_page_info.py
@@ -53,17 +53,18 @@ def get_memcg_info(page):
     """Retrieve memory cgroup information for a page."""
     try:
         MEMCG_DATA_OBJEXTS = prog.constant("MEMCG_DATA_OBJEXTS").value_()
-        MEMCG_DATA_KMEM = prog.constant("MEMCG_DATA_KMEM").value_()
         mask = prog.constant('__NR_MEMCG_DATA_FLAGS').value_() - 1
         memcg_data = page.memcg_data.read_()
         if memcg_data & MEMCG_DATA_OBJEXTS:
             slabobj_ext = cast("struct slabobj_ext *", memcg_data & ~mask)
-            memcg = slabobj_ext.objcg.memcg.value_()
-        elif memcg_data & MEMCG_DATA_KMEM:
-            objcg = cast("struct obj_cgroup *", memcg_data & ~mask)
-            memcg = objcg.memcg.value_()
+            try:
+                objcg = slabobj_ext._objcg
+            except AttributeError:
+                objcg = slabobj_ext.objcg
+            memcg = objcg.memcg
         else:
-            memcg = cast("struct mem_cgroup *", memcg_data & ~mask)
+            objcg = Object(prog, "struct obj_cgroup *", memcg_data & ~mask)
+            memcg = objcg.memcg
 
         if memcg.value_() == 0:
             return "none", "/sys/fs/cgroup/memory/"

-- 
2.43.0

