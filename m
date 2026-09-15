Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3953DAAB8
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789485404; cv=none; b=CnyvkRYCuKPHNLSyQvEsXw/HYduEwNPYdx7zGU44nkA0fAKINPNQ8aiZR+CL7QJKHlj0Y8+zMRX+wLXbnY38wdbnBUek00nbplj+VMdRa7obzGEfobqFnJJh4SpQKm103/kDY8iRmluv3HkKakZzXSX+QCGwH0leckfeSuXCE+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789485404; c=relaxed/simple;
	bh=2lD2Z8S6RJ5Kp0oQG8vpwRWO2VWDsZavNFoFcKl9NIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OMxU3nlhiNscR2mJCrXISwsLb3+NG4l2+LCKMT662XS/YV0rqXZILq+ka9Ycee0XZ1ZP+YMPbHVjwVDMLcMdkh4GWlTJpRUlZ+0PPdmn0dYqGAD859FJK+x0Tj6oPhDqZdG8wQIXpM86wVMYvZJPTrX4tfkPmxJ5NYqmqPTO/2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=jAlv/xI0; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="jAlv/xI0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=9K
	ovkK+R3B1fGsnwRXiy8Gef8asbStQKpT8+L8s+88I=; b=jAlv/xI0ltT6pnuan1
	2O/0t7dZe5XRIetoUOMNWoIkRbPYJgZGmEdSaXvaXbcmbyfg92DSBFA0FVrtwL6D
	kMurKMy51TtNql+GQ1yainbz58w5rPLXeJ9DtqtfIry+i3Wshf/IMjxhhb6o9Eoh
	XL0D7VfNN8jpYEUvwYkEZTqRQ=
Received: from VM-0-3-ubuntu.. (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wAn2xWOYKlqc0VUAw--.40469S8;
	Tue, 15 Sep 2026 23:13:22 +0800 (CST)
From: Longlong Xia <xialonglong2025@163.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: Longlong Xia <xialonglong@kylinos.cn>,
	David Hildenbrand <david@kernel.org>,
	Xu Xin <xu.xin@linux.dev>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/14] mm/ksm: clear all slab cache pointers in ksm_slab_free()
Date: Tue, 15 Sep 2026 23:12:20 +0800
Message-ID: <20260915151236.5200-7-xialonglong2025@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915151236.5200-1-xialonglong2025@163.com>
References: <20260915151236.5200-1-xialonglong2025@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAn2xWOYKlqc0VUAw--.40469S8
X-Coremail-Antispam: 1Uf129KBjvdXoW7XrW5tF13CF1kCFWkJw4xJFb_yoW3CwbEqF
	1IqrykGrW3JF4SkF4UZrs3GrZ0934vkF18tr92gF43t34rtw4FkrW5ZFn2v3yUur4DKFy8
	J3savrWFkrs7CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU055r5UUUUU==
X-CM-SenderInfo: x0ldz0pqjo00rjsqjki6rwjhhfrp/xtbC9xJBOmqpYJJR4gAA3c

From: Longlong Xia <xialonglong@kylinos.cn>

ksm_slab_free() only clears mm_slot_cache after destroying the caches.
Clear rmap_item_cache and stable_node_cache as well.

No functional change intended.

Assisted-by: Zcode:GLM-5.3
Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>

---
 mm/ksm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/ksm.c b/mm/ksm.c
index 99f0bd3a1ae3..78040ed99ccf 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -523,6 +523,8 @@ static void __init ksm_slab_free(void)
 	kmem_cache_destroy(stable_node_cache);
 	kmem_cache_destroy(rmap_item_cache);
 	mm_slot_cache = NULL;
+	stable_node_cache = NULL;
+	rmap_item_cache = NULL;
 }
 
 static __always_inline bool is_stable_node_chain(struct ksm_stable_node *chain)
-- 
2.43.0

