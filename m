Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048AB3E63A4
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789485258; cv=none; b=oHRuWyEf9ZDxBEVihHxifJvppavGZscC8ME4+7W39zYSgWVIequz72vhhgEksA1LURgEOsVxbC27D/Ao0zRpizFl2+r8cOjb8HRLp3NplOSENwUoIpKS/BXUCgzZpyPf+asLyFDNs8G1pa8St+/K+iOUhFtOWqUJseLzM7vBX14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789485258; c=relaxed/simple;
	bh=H09WnKHQWv0//xXPz3XFXvQfStnbiN9d+Cht9xQOMoY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E1nZrUFW4bEzYCCf6LWgCSSPzkllGiMoKqm1e1rpxGuPk2sfx64yN7Kj0lWzo2oDZVUYKQIJMQPwOjr9qcZqgQnQyIrpKn3FCEd/kTpejTGtPNypsNR5bFN2hpfZFErq+PqtSe++2UveD4Us4NvZ83ZBDTK+FaRBpqnJgxA56Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=SqjFaPkF; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="SqjFaPkF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=LN
	634Sdp2f5j/tm34FDy8iveeBNcOZ65RfXwsn4p7Yw=; b=SqjFaPkFYTMDJNibYg
	hXYfjeldUrGC23cll4q+TgLF4nd+90grhHmxL4KJcpEwlSkSyX73DlBcvrqaqBAo
	iNdoZGhCGj+KIFdPNsekyirEqtePchWjkNcXDXyu262u4ViM7cFgcMQ3o4kWqEoj
	KUnsO8H/Ev+OWg39BTx/XX8dI=
Received: from VM-0-3-ubuntu.. (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wAn2xWOYKlqc0VUAw--.40469S3;
	Tue, 15 Sep 2026 23:13:20 +0800 (CST)
From: Longlong Xia <xialonglong2025@163.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: Longlong Xia <xialonglong@kylinos.cn>,
	David Hildenbrand <david@kernel.org>,
	Xu Xin <xu.xin@linux.dev>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/14] mm/ksm: constify ksm_next_page_ops
Date: Tue, 15 Sep 2026 23:12:15 +0800
Message-ID: <20260915151236.5200-2-xialonglong2025@163.com>
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
X-CM-TRANSID:_____wAn2xWOYKlqc0VUAw--.40469S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtw18urW5uF1UZw47tw48Crg_yoW3Xrg_Aw
	12yw4xGrZYkrZayr45ur17tryIg348Gr4DGw1Ivwn8t348t3Z5CF4DGFn7Xr929w4j9r95
	CwnavryYkF4kujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1dWFUUUUUU==
X-CM-SenderInfo: x0ldz0pqjo00rjsqjki6rwjhhfrp/xtbC3BBBOmqpYJCaXAAA3C

From: Longlong Xia <xialonglong@kylinos.cn>

ksm_next_page_ops is never modified. Mark it const so it can reside in
read-only memory.

No functional change intended.

Assisted-by: Zcode:GLM-5.3
Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>

---
 mm/ksm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index 624f37975e12..f637f3baea69 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -2603,7 +2603,7 @@ static int ksm_next_page_pmd_entry(pmd_t *pmdp, unsigned long addr, unsigned lon
 	return 1;
 }
 
-static struct mm_walk_ops ksm_next_page_ops = {
+static const struct mm_walk_ops ksm_next_page_ops = {
 	.pmd_entry = ksm_next_page_pmd_entry,
 	.walk_lock = PGWALK_RDLOCK,
 };
-- 
2.43.0

