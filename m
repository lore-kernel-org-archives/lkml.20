Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6839B37F006
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 06:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787984742; cv=none; b=XEuigNOK9hmyOheYLVjGhI9EYauEIKzJ3AkFQRXfx1mMPaRKzlJyg4z7r+XNH1nXvB57oYRTnZ7DwnfQtc4ZIzY9FWKBd9tBcJozR66hpS6ovLCi0g20mvVtxEWbam+q/8MxqmFUKDZF0r3/PN/kYG2xUIrvCY0Zr/d3puCrPeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787984742; c=relaxed/simple;
	bh=JMM884fTlclbOvRfwT1M1d4pL+sGWqXu40JwAGomtUI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k5u1biydRYuut+l8CfOvGjlA+gRgFbVKl8Nxw6C7CpMuYjXOd+6DtGyUTE3E7r75jWiuPHub/9gh8pkMq3Je+tKQB9bEwym/Em1acqYjYyZi14pzAvRVpsFKU7mSwjKJ7Rk7bMd6FC3sux4UCYF7uPBOJYrlClQGYpTJV01o3GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=C7JNq/9n; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="C7JNq/9n"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ktiYUYsUp5uCXnvJH/BfqE9fq8l5SXsVdqzLvfHOlV4=;
	b=C7JNq/9nW8O1L4+qB8K+5l2GGzD9N3sj5EVi4EnDL5oF6x+3kjr/TdY9xkttUhd/epZ+ev4bJ
	5hgEztLJqonv6F5ys20YZ0BjHoNMDdhG8jwXb6tQTPxKCRn3gSjQig20fZertp3RZEGPOPARqMX
	1uaVaJBSLupvQPWZ6L7moek=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4hX4jJ3V8WzmVXs;
	Sat, 29 Aug 2026 14:14:44 +0800 (CST)
Received: from dggpemr100018.china.huawei.com (unknown [7.185.36.64])
	by mail.maildlp.com (Postfix) with ESMTPS id 17D3B40578;
	Sat, 29 Aug 2026 14:25:32 +0800 (CST)
Received: from huawei.com (10.50.85.155) by dggpemr100018.china.huawei.com
 (7.185.36.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Sat, 29 Aug
 2026 14:25:31 +0800
From: zhouminqiang <zhouminqiang2@huawei.com>
To: <linux@armlinux.org.uk>, <vz@mleia.com>, <piotr.wojtaszczyk@timesys.com>,
	<maddy@linux.ibm.com>, <dwmw2@infradead.org>, <richard@nod.at>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-mtd@lists.infradead.org>,
	<chengzhihao1@huawei.com>, <yangerkun@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH v2 3/7] jffs2: write verify: add byte-by-byte comparison on mismatch
Date: Sat, 29 Aug 2026 14:16:53 +0800
Message-ID: <20260829061658.306854-4-zhouminqiang2@huawei.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260829061658.306854-1-zhouminqiang2@huawei.com>
References: <20260829061658.306854-1-zhouminqiang2@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemr100018.china.huawei.com (7.185.36.64)

jffs2_verify_write() uses memcmp() to compare the write buffer
against data read back from flash. On mismatch, the current code
dumps the entire source and read-back data, which will become
impractical once the verify path is extended to NOR flash where
a single write can span PAGE_SIZE.

Add a byte-by-byte comparison after the memcmp() mismatch path
to locate the exact mismatch offset, reporting the first
differing offset and dumping up to 128 bytes of both the source
and read-back data. memcmp() remains on the hotpath for
successful writes, and the byte-by-byte loop only runs when an
error is actually detected.

Signed-off-by: zhouminqiang <zhouminqiang2@huawei.com>
---
 fs/jffs2/wbuf.c | 46 ++++++++++++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 18 deletions(-)

diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index f10be57c5543..74e169dedab7 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -231,7 +231,7 @@ static int jffs2_verify_write(struct jffs2_sb_info *c, unsigned char *buf,
 			      uint32_t ofs)
 {
 	int ret;
-	size_t retlen;
+	size_t retlen, i;
 	char *eccstr;
 	void *verify_buf;
 
@@ -246,10 +246,10 @@ static int jffs2_verify_write(struct jffs2_sb_info *c, unsigned char *buf,
 
 	if (ret && ret != -EUCLEAN && ret != -EBADMSG) {
 		pr_warn("%s(): Read back of page at %08x failed: %d\n",
-			__func__, c->wbuf_ofs, ret);
+			__func__, ofs, ret);
 		goto out_free;
 	} else if (retlen != c->wbuf_pagesize) {
-		pr_warn("%s(): Read back of page at %08x gave short read: %zd not %d\n",
+		pr_warn("%s(): Read back of page at %08x gave short read: %zu not %d\n",
 			__func__, ofs, retlen, c->wbuf_pagesize);
 		ret = -EIO;
 		goto out_free;
@@ -259,24 +259,34 @@ static int jffs2_verify_write(struct jffs2_sb_info *c, unsigned char *buf,
 		goto out_free;
 	}
 
-	if (ret == -EUCLEAN)
-		eccstr = "corrected";
-	else if (ret == -EBADMSG)
-		eccstr = "correction failed";
-	else
-		eccstr = "OK or unused";
+	for (i = 0; i < c->wbuf_pagesize; i++) {
+		uint8_t c1 = ((uint8_t *)buf)[i];
+		uint8_t c2 = ((uint8_t *)verify_buf)[i];
+		int dump_len;
 
-	pr_warn("Write verify error (ECC %s) at %08x. Wrote:\n",
-		eccstr, c->wbuf_ofs);
-	print_hex_dump(KERN_WARNING, "", DUMP_PREFIX_OFFSET, 16, 1,
-		       c->wbuf, c->wbuf_pagesize, 0);
+		if (c1 == c2)
+			continue;
 
-	pr_warn("Read back:\n");
-	print_hex_dump(KERN_WARNING, "", DUMP_PREFIX_OFFSET, 16, 1,
-		       verify_buf, c->wbuf_pagesize, 0);
+		if (ret == -EUCLEAN)
+			eccstr = "corrected";
+		else if (ret == -EBADMSG)
+			eccstr = "correction failed";
+		else
+			eccstr = "OK or unused";
 
-	kfree(verify_buf);
-	return -EIO;
+		dump_len = min_t(int, 128, c->wbuf_pagesize - i);
+		pr_warn("Write verify error (ECC %s) at %08x (+%zu/%d). Wrote:\n",
+			eccstr, ofs, i, c->wbuf_pagesize);
+		print_hex_dump(KERN_WARNING, "", DUMP_PREFIX_OFFSET, 16, 1,
+			       buf + i, dump_len, 0);
+
+		pr_warn("Read back:\n");
+		print_hex_dump(KERN_WARNING, "", DUMP_PREFIX_OFFSET, 16, 1,
+			       verify_buf + i, dump_len, 0);
+
+		ret = -EIO;
+		goto out_free;
+	}
 
 out_free:
 	kfree(verify_buf);
-- 
2.52.0

