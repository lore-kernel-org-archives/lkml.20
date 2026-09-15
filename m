Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7B83F7AAC
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789485262; cv=none; b=E0+4UeObksA5Yg3zHM/acLoK3Q3k881H7fpdoaI21n+2/IZ2XVtEfruVIPEV5quA8ah3dxt6N06tckeMPaP86Xgs113axm8eVIAhqy3ma2tLNbIgPNuWrq26Dot8lFHbUi4UlzvvanMYoM0/mkOm+r/TrB7ZOiyv4QJE1RlfBIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789485262; c=relaxed/simple;
	bh=xkk2xHRc+5H2yxiMg2fI+LlCLg4lDDV3GbA6LDkqBXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SjFbxhnBT3T6WciVbHrb3mzk30N933HdFMgm5RYTANK/cxVJK0QTkPYM9zXbztMKJgORsYCIFOu2cly6CVRz/iXUQIoQ8qN4P2kEYk/Zz5ojAg8iTEqbsy0VLFqftDV4w3W8kUN4YF1EMuzgSmVzt3B0WNE/5i2e0MGXxIws6qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=UVmvvAI5; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="UVmvvAI5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=gJ
	gHhRIIl4KWjmYsJrJ/t66qyeCS0JmraOWC0c63NtU=; b=UVmvvAI5t10QN5X3v6
	G11JA/ARxS71gpWQSiyxu19Gtx2IvaPkMNgHxzRJP0NShzLduPdhNE2jNtp3IWC2
	XJmGEOXNzyK63B6TgWUI4MHXCVjIRUoQ7Z26xOv4C2NM2Ca4oHwlrij4bVntb0gX
	zI+XOLS50aS3gDi1RKSm5hAWc=
Received: from VM-0-3-ubuntu.. (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wAn2xWOYKlqc0VUAw--.40469S11;
	Tue, 15 Sep 2026 23:13:23 +0800 (CST)
From: Longlong Xia <xialonglong2025@163.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: Longlong Xia <xialonglong@kylinos.cn>,
	David Hildenbrand <david@kernel.org>,
	Xu Xin <xu.xin@linux.dev>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/14] mm/ksm: move the no_vmas label out of the if block
Date: Tue, 15 Sep 2026 23:12:23 +0800
Message-ID: <20260915151236.5200-10-xialonglong2025@163.com>
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
X-CM-TRANSID:_____wAn2xWOYKlqc0VUAw--.40469S11
X-Coremail-Antispam: 1Uf129KBjvdXoWruw1fGF15JF1DXF1xWF45KFg_yoWfXrc_uF
	yq9w1kGr47Jrs0kr4DuF43WFZ7Kw4v9r17uryjgr1qg348tr1kGrWkCryIq3yfKrs8KF97
	GwnrJF90k3s29jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0eRRtUUUUU==
X-CM-SenderInfo: x0ldz0pqjo00rjsqjki6rwjhhfrp/xtbC2xNBOmqpYJOGHAAA3Z

From: Longlong Xia <xialonglong@kylinos.cn>

Move no_vmas before the if statement to avoid jumping into its body.
Both goto paths have already found ksm_test_exit(mm) true, and mm_users
cannot rise from zero again, so rechecking the condition is safe.

No functional change intended.

Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Assisted-by: Zcode:GLM-5.3
Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>

---
 mm/ksm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index 1733b23cfaa2..59887a2b4406 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -2760,8 +2760,8 @@ static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
 		}
 	}
 
-	if (ksm_test_exit(mm)) {
 no_vmas:
+	if (ksm_test_exit(mm)) {
 		ksm_scan.address = 0;
 		ksm_scan.rmap_list = &mm_slot->rmap_list;
 	}
-- 
2.43.0

