Received: from mta0.migadu.com (out-163.mta0.migadu.com [91.218.175.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061D840F743
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789547163; cv=none; b=If633Rc/yYJsqVn572qGjSV2ha7n2k8cC2h7YMUMPEjEX9GUaSAv2aQ8NLWx0Eg9pgNIlFPQUEIL8sioQiuo3nN5Zs6vjH2L3fWnfag5liLuXY/ObdUOG/xwiVY1xSMcEM1iHuQeN47ndXcHZT+Az1tCbnTqnerLzMoytbr7sso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789547163; c=relaxed/simple;
	bh=jFgYLuMhSLSQE34QZ7YWi1qBRpOmgxt6A18X041cY7s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kEc+y5nq+mr/MHg1jn3OAcV1zVUyoMF8rip84BMDnWFvGFil0iAs85RWH2ZLgRvwMKv9QQn6LIqE4t8U9pXhFWOjBfhACDUiERoTyqgKs4Qm3cHH1iM9Zvx270xSAyfRWWiKbokt5SiNfl12+cOovBjRd+PITEl8v2+L9LW2pfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ACNpOlIz; arc=none smtp.client-ip=91.218.175.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ACNpOlIz"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jFgYLuMhSLSQE34QZ7YWi1qBRpOmgxt6A18X041cY7s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789547152; v=1; x=1790151952;
 b=ACNpOlIziJcMJjVV9bgvUAjoiPUr5hhT/e+mnH4Aj2rGohMGrWaSh8nOrIxFAcU+1lmoZxEW
 9pAvzI4Nhu+KbjVCzY/TBzU3wLJnNl79CeHuw3/is7OSmOWtMX4F9tN5pkHmNUAhUUVguVXyo28
 p7ytLlGQmIOTrc6bx8DyL888=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ee530d7fdc31aba6;
	Wed, 16 Sep 2026 08:25:52 +0000
X-Mizu-Trace-ID: ee530d7fdc31aba6
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Date: Wed, 16 Sep 2026 16:25:30 +0800
Subject: [PATCH 3/3] mm/vmalloc: skip vmalloc_dump_obj for non-vmalloc
 addresses
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-vmalloc_dump_obj-v1-3-7aa402d224df@linux.dev>
References: <20260916-vmalloc_dump_obj-v1-0-7aa402d224df@linux.dev>
In-Reply-To: <20260916-vmalloc_dump_obj-v1-0-7aa402d224df@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Uladzislau Rezki <urezki@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Ye Liu <liuye@kylinos.cn>
X-Mailer: b4 0.14.3

From: Ye Liu <liuye@kylinos.cn>

vmalloc_dump_obj() unconditionally searches all vmap nodes even when
called with a non-vmalloc address (e.g. a slab or stack pointer from
mem_dump_obj()).  Add an is_vmalloc_addr() check at the entry to
avoid the unnecessary per-node trylock and rb-tree traversal.

The KASAN caller already gates on is_vmalloc_addr(), but mem_dump_obj()
calls vmalloc_dump_obj() before the fallback type check, so the guard
in the callee covers both paths without requiring caller changes.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 mm/vmalloc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 30c610f678dc..b3e706fde202 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -5277,6 +5277,9 @@ bool vmalloc_dump_obj(void *object)
 	unsigned long addr;
 	unsigned long nr_pages;
 
+	if (!is_vmalloc_addr(object))
+		return false;
+
 	addr = PAGE_ALIGN_DOWN((unsigned long) object);
 
 	/*

-- 
2.25.1

