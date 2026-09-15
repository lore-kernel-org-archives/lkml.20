Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64DD3E49F8
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789485257; cv=none; b=QUKSikHZVj5JYdgq2B/QUX0YHq17V6rbHKcwbqqa0Yj5ZU+b2g8paYbXqB3ENyg/1EyBEe2o8fAqaW0r4xR/dq2GKalVlt0L/UHTOHSAukIS9KN5KbbCa/31Mdpv6oyS6q/TsSymH4n86ZvXacGOGjKxIxr3IlcupmfZfIg6rXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789485257; c=relaxed/simple;
	bh=nLcAiSsgtaO0plNuqST/gONNukAOAs4dlluMluIgnfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ioplx1dMctY7630g73fzjGTI2XGxMhKn0dLeDMAFTCRHEb9gS8oeCUdvRP9uPn+4ChGXi8i2aJp5wvNQKp31iFeoWuoehb4wcpmPYCSBDPjm7EM1GaYGSzoviCV2mniJK0TlHgXuhBG83WCzZJt8Qo0KvDqJbwUGvnhH45aSUQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=GkJqEp1X; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="GkJqEp1X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=6q
	4gcoe8kuH2QdxsQJ5k7lgZ2jFMRw97/pDg4Zh17sU=; b=GkJqEp1X+ZfBaBgGDn
	RPBgeZ26L/i+8J+rRKjjITmUjyWUN2moa6jfYEuBjgmHsztV4vzJ5v3+tLV0/M63
	coXPjQCCbvdq4JzFYHKQ3xJ5N4JsPAfFq2ne8Zxq6XZIDpZ/yu4LomVDh2cnnurz
	IxCrmXER2l3dxuTdJV/cmdeAM=
Received: from VM-0-3-ubuntu.. (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wAn2xWOYKlqc0VUAw--.40469S5;
	Tue, 15 Sep 2026 23:13:20 +0800 (CST)
From: Longlong Xia <xialonglong2025@163.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: Longlong Xia <xialonglong@kylinos.cn>,
	David Hildenbrand <david@kernel.org>,
	Xu Xin <xu.xin@linux.dev>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/14] mm/ksm: use the correct format specifier for max_page_sharing
Date: Tue, 15 Sep 2026 23:12:17 +0800
Message-ID: <20260915151236.5200-4-xialonglong2025@163.com>
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
X-CM-TRANSID:_____wAn2xWOYKlqc0VUAw--.40469S5
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw4DZFWUWF4rKrWrKrWkXrb_yoW3ZrX_Aa
	sFvr1rGw4xKr9I9w409wn3trZ7KayDGr1DWryqvrsIq3yUK3Z5XrWDWrnIvr1q9rWDKr98
	CwnxZ3sFvrZ7WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnG2NtUUUUU==
X-CM-SenderInfo: x0ldz0pqjo00rjsqjki6rwjhhfrp/xtbC9xFBOmqpYJFRyAAA32

From: Longlong Xia <xialonglong@kylinos.cn>

Use %d to match the int type of ksm_max_page_sharing. The accepted
values are at least two, so the sysfs output is unchanged.

Assisted-by: Zcode:GLM-5.3
Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>

---
 mm/ksm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index 1e4d77852fc8..18d037f571d3 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -3676,7 +3676,7 @@ KSM_ATTR(use_zero_pages);
 static ssize_t max_page_sharing_show(struct kobject *kobj,
 				     struct kobj_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%u\n", ksm_max_page_sharing);
+	return sysfs_emit(buf, "%d\n", ksm_max_page_sharing);
 }
 
 static ssize_t max_page_sharing_store(struct kobject *kobj,
-- 
2.43.0

