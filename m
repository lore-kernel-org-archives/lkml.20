Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3F13D523F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789485256; cv=none; b=OyB3Yu2OTDBESxeMIy0nYGJVKYHXznQ3VQKbtI5Ac2/YrEu3USx0G0Xgx8X2GKa1cvuRB7LIOwvLmJh+hdV/oOV6oj26JAaYKckQ9kxAAjso6Bpw4Qv1I43aG8WUmNl8FfFvVqok5giHe+tf/+eIlJyRohMPNwM0+t4/fPTuswo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789485256; c=relaxed/simple;
	bh=5Q2bPEl7NPYC9AcnzKBr1fkvK1AhrHFhprFYiIvPhYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UqPrbFB8bJFd3fFNNDvhKy7wYfAjU3Bo7vtTJgnJ9CAdphDtj+MttQDQv2vDTl75Q+eANxx4YzwetH2TcwY3YezHcMBuCH1ObSSarLK8c+mFsxb6o9khNE53KUUz/wdkivhoq+RW9JRbyFfBsfWgsTFexyc7GfUwD1AlPpnV2V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=PxZXa6YZ; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="PxZXa6YZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=wz
	jjP3sMaRbt1nIGZyrCw0oTAfLtKcqQAE2afGv8ruM=; b=PxZXa6YZ8teADp7KfV
	AqBANt55a9rfnNffg55Wpvejk9AqbXOqaja6NoX9OlDFchABtk9QA0dqOYqxx40c
	qAJI+uTyS4DyFg4EWObY1QuntJAe+gIKX+LlxiBwulxM/+ExJMBWLsfgUpTKP6Hr
	HNg9ww8Q4OBO64P5S1pqmHY0c=
Received: from VM-0-3-ubuntu.. (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wAn2xWOYKlqc0VUAw--.40469S7;
	Tue, 15 Sep 2026 23:13:21 +0800 (CST)
From: Longlong Xia <xialonglong2025@163.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: Longlong Xia <xialonglong@kylinos.cn>,
	David Hildenbrand <david@kernel.org>,
	Xu Xin <xu.xin@linux.dev>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/14] mm/ksm: make remove_stable_node_chain() return bool
Date: Tue, 15 Sep 2026 23:12:19 +0800
Message-ID: <20260915151236.5200-6-xialonglong2025@163.com>
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
X-CM-TRANSID:_____wAn2xWOYKlqc0VUAw--.40469S7
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF4xXF4xuw1UXF4fZF4Dtwb_yoWkurg_Kr
	1Sqr92grWUXr4rArWDWrs7Xry3Kw4DGr1UJrySkF48tw1UXr4rCrsa9Fn7Z3yUur4FkryD
	Gw1DAryxKrZ7CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1RVbPUUUUU==
X-CM-SenderInfo: x0ldz0pqjo00rjsqjki6rwjhhfrp/xtbC3BFBOmqpYJGacgAA3s

From: Longlong Xia <xialonglong@kylinos.cn>

remove_stable_node_chain() only returns true or false. Use bool and
return remove_stable_node() directly in the non-chain case.

No functional change intended.

Assisted-by: Zcode:GLM-5.3
Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>

---
 mm/ksm.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index aa33522627c7..99f0bd3a1ae3 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -1177,18 +1177,15 @@ static int remove_stable_node(struct ksm_stable_node *stable_node)
 	return err;
 }
 
-static int remove_stable_node_chain(struct ksm_stable_node *stable_node,
-				    struct rb_root *root)
+static bool remove_stable_node_chain(struct ksm_stable_node *stable_node,
+				     struct rb_root *root)
 {
 	struct ksm_stable_node *dup;
 	struct hlist_node *hlist_safe;
 
 	if (!is_stable_node_chain(stable_node)) {
 		VM_BUG_ON(is_stable_node_dup(stable_node));
-		if (remove_stable_node(stable_node))
-			return true;
-		else
-			return false;
+		return remove_stable_node(stable_node);
 	}
 
 	hlist_for_each_entry_safe(dup, hlist_safe,
-- 
2.43.0

