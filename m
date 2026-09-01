Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CA547D935
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268394; cv=none; b=FYMBOSlpYreGV0J3/OXyjYMNXPKlUWdHAU7V8OeBFoxmEz2FiG2XPLY4J8JWy8Ii7XXLS9H3oIieF4/hBI+YrZcUdtp6nSmK0rv4rAvDkoRSp9cM12PsjlcB4oCIQRWBNuNH3rfClMoaMePwZQtmRS184F2RxV32HCu2y2upRMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268394; c=relaxed/simple;
	bh=aANne2xVIIgeYErCp5qy2ZJ/ZpCJrJGBduXkMLr+O30=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WbC89OR0jOnruLRjj0sVslkqpMSvWFdTFOOX6eksHP4fgtCO1trL1VP98kJnLKpwoewdso42lsoPNni5w2VVF3+t1QIrc8tHhzPJKPRlnAHaIy5URGGFdVOMqoKIwSjAbYjL819yvYUn9ATL0IRTIiieaTSU6BmMLkODofuVCeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=AjShkyBI; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="AjShkyBI"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=uoYKoPZ7YKPmsCHG/kXIjc+wB00oulf3PAI6t9L7dXc=;
	b=AjShkyBICAQG93Xx24uO5WkxiKPbiNgccEYEo+cH2GjESgyKEM//MZ278+F6XzwOlEUJ34IXR
	gGLmLMCdZY+TwaKIQcratPL0uQrHHNhh3oTLFnFNjRlq5slRg6HK0rXoLect9UvacjQfXAPOIG/
	AW3dbypsROzmFphzCRweR1I=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4hZ5bw237xzLlXZ;
	Tue,  1 Sep 2026 21:02:04 +0800 (CST)
Received: from dggpemr100018.china.huawei.com (unknown [7.185.36.64])
	by mail.maildlp.com (Postfix) with ESMTPS id C14E04057C;
	Tue,  1 Sep 2026 21:12:53 +0800 (CST)
Received: from huawei.com (10.50.85.155) by dggpemr100018.china.huawei.com
 (7.185.36.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 1 Sep
 2026 21:12:52 +0800
From: zhouminqiang <zhouminqiang2@huawei.com>
To: <linux@armlinux.org.uk>, <vz@mleia.com>, <piotr.wojtaszczyk@timesys.com>,
	<maddy@linux.ibm.com>, <dwmw2@infradead.org>, <richard@nod.at>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-mtd@lists.infradead.org>,
	<chengzhihao1@huawei.com>, <yangerkun@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH v3 2/8] jffs2: wbuf: fix space accounting in recovery secondary write failure
Date: Tue, 1 Sep 2026 21:05:43 +0800
Message-ID: <20260901130549.1761342-3-zhouminqiang2@huawei.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260901130549.1761342-1-zhouminqiang2@huawei.com>
References: <20260901130549.1761342-1-zhouminqiang2@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemr100018.china.huawei.com (7.185.36.64)

In jffs2_wbuf_recover(), when the recovery write to the new erase block
also fails, the code marks the already-written portion as REF_OBSOLETE
via jffs2_add_physical_node_ref(). However, the length passed is
ref_totlen(c, jeb, first_raw), which is the length of a single node on
the old block, not retlen which is the actual number of bytes written to
the new block.

When the recovery buffer contains multiple nodes, ref_totlen only
accounts for the first node's length, which can be much smaller than
retlen. This under-deducts free_size, causing subsequent allocations to
land on already-programmed NAND pages and silently corrupt data. When
first_raw is the only node in the recovery range, ref_totlen equals the
full unaligned data size and exceeds the page-aligned retlen,
over-deducting free_size and wasting space.

Use retlen so the new block's free_size accurately reflects which NAND
pages have been programmed.

Signed-off-by: zhouminqiang <zhouminqiang2@huawei.com>
---
 fs/jffs2/wbuf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index 61e3dbd4cd7b..360a291d9fd5 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -437,7 +437,7 @@ static void jffs2_wbuf_recover(struct jffs2_sb_info *c)
 			kfree(buf);
 
 			if (retlen)
-				jffs2_add_physical_node_ref(c, ofs | REF_OBSOLETE, ref_totlen(c, jeb, first_raw), NULL);
+				jffs2_add_physical_node_ref(c, ofs | REF_OBSOLETE, retlen, NULL);
 
 			c->wbuf_len = 0;
 			return;
-- 
2.52.0

