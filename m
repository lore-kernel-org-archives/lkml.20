Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641A73E3140
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789485256; cv=none; b=NtTxX/zOzAukQnSE+wR1DBBIhhnQETVade8kgySywnOgm8cwtRLx0nQ30SY5HRU6C7itEyURrlAYonokqk3dna8Ps7I2UH9DmnwAQFCyd8ZbQgcOmcSsTSSUmk9B7kgMz5fLz/K4jPnjit0CsBD4aP6yNjykq5YVqf5P2+20f8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789485256; c=relaxed/simple;
	bh=I9oBNc3ZzWGLs68veeMSuMoInX5lHZZvYWE8+R8toAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z0q76Q5GwZnk8duNBBYDXN5wgwTPk8jdE4+YTp1T8EAms+5syoAaAFvpyGpt0ObTGHp7U3CTykzrk72FMz/LOPT1kcyJQGu6GibVIipByF36aX4l2mAfYbC97T4QH8jFmc88xV9IGjniw1YOUjosR3qTOIlqCHACLAgvni8Fl2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=J+YFrG+y; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="J+YFrG+y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=nI
	RCRjaAuMv2QZADS7mCIjWRPfqdJWUY1VCE1j3QO9U=; b=J+YFrG+y/sUXr5jGUM
	4QclUUaid2LCELZzDqL4Zq8aCvoIqJuPKGHpkj190HDoeTKUWKZuf7YkEWHsj9+v
	GKX/8HXofuiCFNvnl9+4GFf/Ui01OplJDI2mc+ldsKulQbjYLaSEYkOVABUe8cPe
	7IxFuetiQHAMcjP+de7DHsEqs=
Received: from VM-0-3-ubuntu.. (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wAn2xWOYKlqc0VUAw--.40469S10;
	Tue, 15 Sep 2026 23:13:23 +0800 (CST)
From: Longlong Xia <xialonglong2025@163.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: Longlong Xia <xialonglong@kylinos.cn>,
	David Hildenbrand <david@kernel.org>,
	Xu Xin <xu.xin@linux.dev>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/14] mm/ksm: document the two remove_rmap_item_from_tree() calls
Date: Tue, 15 Sep 2026 23:12:22 +0800
Message-ID: <20260915151236.5200-9-xialonglong2025@163.com>
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
X-CM-TRANSID:_____wAn2xWOYKlqc0VUAw--.40469S10
X-Coremail-Antispam: 1Uf129KBjvdXoWrtrykWF13XFWUAFWxGryrXrb_yoWkuFgE9r
	4qqrZ3WFWDJrs0yF42gw13Wr98Kayjgw1UXryqg3W2q34UJa1kurWv9rsrXrWfurZ29F93
	GwnFy3yUC3W7ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0eRRtUUUUU==
X-CM-SenderInfo: x0ldz0pqjo00rjsqjki6rwjhhfrp/xtbC+BNBOmqpYJNWAwAA31

From: Longlong Xia <xialonglong@kylinos.cn>

Explain why cmp_and_merge_page() needs both tree-removal calls:
non-KSM pages are detached before the early returns, while KSM pages
are handled after stable_tree_search().

Assisted-by: Zcode:GLM-5.3
Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>

---
 mm/ksm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mm/ksm.c b/mm/ksm.c
index 7fc9dac5d67c..1733b23cfaa2 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -2313,6 +2313,10 @@ static void cmp_and_merge_page(struct page *page, struct ksm_rmap_item *rmap_ite
 		if (!is_page_sharing_candidate(stable_node))
 			max_page_sharing_bypass = true;
 	} else {
+		/*
+		 * Detach before the checksum and zero-page checks, which can
+		 * return without reaching the removal below.
+		 */
 		remove_rmap_item_from_tree(rmap_item);
 
 		/*
@@ -2338,6 +2342,10 @@ static void cmp_and_merge_page(struct page *page, struct ksm_rmap_item *rmap_ite
 		return;
 	}
 
+	/*
+	 * A KSM page can still have an old tree association here; non-KSM
+	 * pages were already detached before the checks above.
+	 */
 	remove_rmap_item_from_tree(rmap_item);
 
 	if (kfolio) {
-- 
2.43.0

