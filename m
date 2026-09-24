Received: from SHSQR01.spreadtrum.com (unknown [222.66.158.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F79D31E84F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=222.66.158.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790214838; cv=none; b=Sew3XO9BNMhf6hvD0Fhb7vcK8DTk/wBWuJH/SVNnaqAhU45A70zPNymKizycFATw8Z43Vnyl/HJdU9jox9PZtszN/7aclYXI7tFEVEtUu2x9F56+Tjeq6Nzsj7lm+UHwo8DtfMS2BTfYd8NyBTdsdowIfQXWZUIw43SSVnYZR1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790214838; c=relaxed/simple;
	bh=ZC3nA9AaHIFbTtV9xIRCoL85ffKUcL6awILbZtzxxok=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jZ1dp6cVKz8aGdaPbSoulXY2//TtTL6lv9gjcaYKAZS5MTfzZLK85A2+lu2iCI69tPVl5T2JbXYZuE5i7IjPq9EZCgKsw/DyvEA2j7rEP2ff+1WG7up9sn8YB1chtg3Z65td9l2A9BlhqhPN5Sc46JvfFUCU8+RJ0481We8cwsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=unisoc.com; spf=pass smtp.mailfrom=unisoc.com; dkim=pass (2048-bit key) header.d=unisoc.com header.i=@unisoc.com header.b=yL/zweCw; arc=none smtp.client-ip=222.66.158.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=unisoc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unisoc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=unisoc.com header.i=@unisoc.com header.b="yL/zweCw"
Received: from dlp.unisoc.com ([10.29.3.86])
	by SHSQR01.spreadtrum.com with ESMTPS id 68O1qx21014968
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 24 Sep 2026 09:52:59 +0800 (+08)
	(envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (BJMBX02.spreadtrum.com [10.0.64.8])
	by dlp.unisoc.com (SkyGuard) with ESMTPS id 4hqxc63GQQz2N3TjZ;
	Thu, 24 Sep 2026 09:50:14 +0800 (CST)
Received: from bj08434pcu10.spreadtrum.com (10.0.70.50) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Thu, 24 Sep 2026 09:52:56 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
CC: <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>,
        <niuzhiguo84@gmail.com>, <zhiguo.niu@unisoc.com>, <ke.wang@unisoc.com>
Subject: [PATCH 1/2] f2fs: simplify node footer check in f2fs_cache_write_end_io
Date: Thu, 24 Sep 2026 09:52:12 +0800
Message-ID: <20260924015213.1196491-1-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHCAS01.spreadtrum.com (10.0.1.201) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL:SHSQR01.spreadtrum.com 68O1qx21014968
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unisoc.com;
	s=default; t=1790214793;
	bh=MRKJ1vQk4EzZyX2zAiVgUqdcDCMqfNg3jDzgN/GS/sw=;
	h=From:To:CC:Subject:Date;
	b=yL/zweCwGse6YZqLoHAGBaY5bFLzT9TmKEOHmDDiSJygkebiM3T5DGlrs02UYXY39
	 +g/9IRIuhNu8FSrBajttHWOxMGTnHV6Eh2nADaF2JWceqXtAz/C1gu2c2MYh28W45x
	 YQJ3lkkPdppy/m9zxJ8YcvZdL7RIENl0mg2u02Yjxv2jrmQFwKu+GkL0JNiUpAm/A4
	 ZyUwhQFwN7va6RmZaVvYRjUDDoE68GqsM5/W4/TG3cRrOXLJWrz53tDINM+Y+QU5PS
	 pWbHy9foHy2Jdc1Ey+9fxiluObrXDKt4btSFnO+iBIoWYl1JMt48XP4huueoCMFMXW
	 GG0uGqXD4jBQQ==

In f2fs_cache_write_end_io(), the return value of
f2fs_sanity_check_node_footer() was ignored and a separate
f2fs_bug_on() only verified the node index. Pass the sanity
check result directly into f2fs_bug_on() so that a corrupted
node footer triggers the assertion, and drop the redundant
index check.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 fs/f2fs/data.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 6d4ba5e77906..f203f99fc10a 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -424,9 +424,8 @@ static void f2fs_cache_write_end_io(struct bio *bio)
 		entry->next_entry = NULL;
 
 		if (f2fs_is_node_cache(entry)) {
-			f2fs_sanity_check_node_footer(sbi, entry,
-				entry->index, NODE_TYPE_REGULAR, true);
-			f2fs_bug_on(sbi, entry->index != nid_of_node(sbi, entry));
+			f2fs_bug_on(sbi, f2fs_sanity_check_node_footer(sbi,
+				entry, entry->index, NODE_TYPE_REGULAR, true));
 		}
 		if (f2fs_in_warm_node_list(sbi, entry))
 			f2fs_del_fsync_node_entry(sbi, entry);
-- 
2.43.0

