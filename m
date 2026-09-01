Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A5E42E439
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 02:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788230802; cv=none; b=X6WqUn0vUb3GRIRjwPhaUH9uodjCxOmB5J3CHzDsTEk0S3T/MiYX+f8pZR6YGBEBKclhrex853c2h0AY1Qj25PBD8W1kE+8N4TeAWsUtb6uz5G3mSjB0jIeNgCqIaXCf9abnjndSPudo38V53W/I4lLUIl077NaKyeiq6+hl3kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788230802; c=relaxed/simple;
	bh=Kof3HYR0mYhpxVe+O+oMBtSbLkr1f7IE0arSeXyBnWE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hjYW0l3YMsnUK5A3nbsv/N4BTdv/sb78e95ssOoaB29FUVY3xcwxBt3WOHAvvnGAhT/3S+45W6Y4Nq2/VPSGzdusHj0RrUOVPsUfPppX8dvVZ6ho4dvZQ7ib+Gk1ETwDgWT1vdoEOGW8cw2Mx7blJX70spl22Tsm56Lae5W6j0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=VKIUYw8B; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="VKIUYw8B"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788230783; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=IyaV4kBdlXf7cBkSle+mYaQW1tk/WVCgk/l7xdb2q8w=;
	b=VKIUYw8BDx1rH9FD6Vj7+4sXBVXK8Aw+2vw655FV2OpuQDyKISaFkCmKRDRfeVCpyeDM2jqwevtb4JqMPzPL5ZgJ6NRsiKaHZUxjIOcEsnRhc+UiBpfkij2XdE7efnCTASHjDPTvzSIXHbp2JoQnfKp5nDD5Yt6kItVGCoYQQVw=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R721e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=jefflexu@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0XA1RXuA_1788230782;
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com fp:SMTPD_---0XA1RXuA_1788230782 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 01 Sep 2026 10:46:22 +0800
From: Jingbo Xu <jefflexu@linux.alibaba.com>
To: xiang@kernel.org,
	chao@kernel.org,
	linux-erofs@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] erofs: add sysfs feature entry for xattr prefixes
Date: Tue,  1 Sep 2026 10:46:22 +0800
Message-Id: <20260901024622.108319-1-jefflexu@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let /sys/fs/erofs/features/xattr_prefixes advertise that this kernel
supports the EROFS_FEATURE_INCOMPAT_XATTR_PREFIXES on-disk format.

Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
---
 fs/erofs/sysfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/erofs/sysfs.c b/fs/erofs/sysfs.c
index 6734483a440f..dfcec9376cd5 100644
--- a/fs/erofs/sysfs.c
+++ b/fs/erofs/sysfs.c
@@ -95,6 +95,7 @@ EROFS_ATTR_FEATURE(sb_chksum);
 EROFS_ATTR_FEATURE(ztailpacking);
 EROFS_ATTR_FEATURE(fragments);
 EROFS_ATTR_FEATURE(dedupe);
+EROFS_ATTR_FEATURE(xattr_prefixes);
 EROFS_ATTR_FEATURE(48bit);
 EROFS_ATTR_FEATURE(metabox);
 
@@ -108,6 +109,7 @@ static struct attribute *erofs_feat_attrs[] = {
 	ATTR_LIST(ztailpacking),
 	ATTR_LIST(fragments),
 	ATTR_LIST(dedupe),
+	ATTR_LIST(xattr_prefixes),
 	ATTR_LIST(48bit),
 	ATTR_LIST(metabox),
 	NULL,
-- 
2.19.1.6.gb485710b

