Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D89486658
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 17:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788456363; cv=none; b=jj9uBQxIKdC+IcfD4/Ggg7Yi/C2p8fHR1bSVFzGtDI12n30bSPQbVJKIXs6b30+ZyxOmK6D44M7H7R49Q20y/EBt2qAcAvqU2xgtrq/wa+p1k6jCcqwtpex7YP+MZ9VjssiDO0F3cRPQqAdYWKw0tSNU+/461vzk02IxMfOC0+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788456363; c=relaxed/simple;
	bh=w+O1sH22NArhRo9yhibk82VLhoaLFZB8GNRWPiP5ibY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M/iSxwBU+BYgC5jMIPedXWoRzfF4s8Nk395hRKAdQnIEnAh891SMme0falnu77Xpx5un+kI4j+haCnONd+32RiR1l46AlSJj60ZKwZduzDRRs9kPqfWgwafZ+19CfpM+OkirRvyuVbkMcN7hwZpuvCul6xZlSoe2sNIum4MHiIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eKpjyoh9; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKpjyoh9"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso58263a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 10:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788456360; x=1789061160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rO8qlfauoesgDqAvc32sBU+CCSZKWvXFmYR0AW+q2uo=;
        b=eKpjyoh9vjEqyL3PgXUGo0aabTrr5fw5qRWLo/m+T41MTImRfqpXsOomcxFLnghGA6
         WJt0MpP1khd/XLEko8Npo5TWfqgLB1W/yidC1NdTLqPZL7+UH0RcJqtJEwXKVPDsmyXy
         WwnEaJrphdWhqO1HwcTIvRdD8malOBC/rgKC5I91EhlNTGoJOZ0urC7HlL/gyhBT1NoM
         OrUl+Zp0iD+fn0pHCDI0EZ4bjympQGSn6uYqq1KpYA/forojB1Zm+tQ/WLohVELA8k/8
         xJC8DhROvUH2T89iBih1OOME5Xo8FyWRqB9PW18zI1L4bqYuJ9qB7ANklL3m59hpwva5
         JStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788456360; x=1789061160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rO8qlfauoesgDqAvc32sBU+CCSZKWvXFmYR0AW+q2uo=;
        b=RbU6R1lFlrE4Qx7jSveA5zdfeW/YwL6I+jaoF6sYj9xGwXzpJYhKnIGXh2Zlk1wMMg
         D65iWPlbg46gmDnm3oCFB+x0LCrVy3O6wEVnGWdQOMv75n2e2UgfJcVWbJc+K4AYBOSn
         WNDl4rb0CxV7F3zbc6rnK90+W3Dd1uwh+C693MQ8faasJbCkHkR0yX6+wb3Dd8REhnO5
         /WMPzTKFIRaEf5vmb/fVD7jaL/57IbOZTLy9ScznXp8e3ieVNOTS2Do9/Ig3+m8uUaFb
         87g6DduWTU06TBX/XjPTyxF/ILmtIrMtx4JjJFSfZPpLxRtfqJTYAjMMrer7H0IPpsqh
         PUsg==
X-Forwarded-Encrypted: i=1; AKwUvByl7jS0+/rYIUEVEejnrXJVimXvh70gM5KWFSUfz3cjA9p/TNpOzv37ti5SzJNIbkPqlyg2G3I1tHGN1+M=@vger.kernel.org
X-Gm-Message-State: AFuF++nXsGVQSIm4i1/3JhA1/6lVmQohFCPBJRR/LKCYP/67VDpRDmxS
	vvYCcapgEjQ+AkWrWce9VjFewZkNxiJt99RsAcBrKqkWAHBPb1wnOAoSm5fLjA==
X-Gm-Gg: AYBFou1FrkulY/TYCJp97dXpqEElZd8rc+Ldf3OGTvp+Q7wyKQGAie3hoN4i0GbZJXe
	zjAVdv4pk/nC3uLXPAVAHzznfGr62y8RZlp0HUqSksKv1RNlgOo/PsuX3cNG/fQUEw9vPkPVgEC
	rX8/dddW7SHb4Zvxd7Rb6d8SFnPemIOdPi70K/IhxkD3XHRtwdza8NEsXkW8975Adx2vzJphGed
	wgtlPWEAmjAl/T/QzAr2qE57PZStNgWFDUQWQFcUZxsphJb0EODz314GNzRn23LmdyRzqBuf4ox
	PNBN9ToWAwx+RrxqfQ+T1NAxOy4TMRSUitL/l7FwtMhN7MT0uxHDfNyeOVOuTTiea4a8FhSRS/p
	HRsmEeIZh6IyqvZtHAoITKjeW7LvHMpd76FlPIZJDVwc1LMy+wXABiOtunu+V107Z11Goi3hFEb
	4Muovqcb7IQ+0eyatwtH/PALAFgip86WFIsG6uL6HnMxonhSKAD7l53B3h2bF1AfHmAmIfM/Pch
	DAZMMKNcX1TZCNsOYNkKtc=
X-Received: by 2002:a17:90b:5106:b0:37f:c22a:c188 with SMTP id 98e67ed59e1d1-39b260feb03mr87910a91.4.1788456360320;
        Thu, 03 Sep 2026 10:26:00 -0700 (PDT)
Received: from carrot.home.local (madb688455.ap.nuro.jp. [219.104.132.85])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c39227sm6283070a91.9.2026.09.03.10.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 10:25:59 -0700 (PDT)
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: linux-nilfs <linux-nilfs@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] nilfs2: strengthen consistency checks in nilfs_direct_propagate()
Date: Fri,  4 Sep 2026 02:23:58 +0900
Message-ID: <20260903172557.9446-1-konishi.ryusuke@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nilfs_direct_propagate() is responsible for updating the virtual block
number associated with a dirty data block in the direct mapping.

It is not designed to handle intermediate node blocks.  Furthermore, it
assumes that the block offset of the passed buffer head is within the
range of NILFS_DIRECT_KEY_MAX; otherwise, an out-of-bounds memory access
could occur within the inode containing the bmap root.

While such inconsistencies stem from bugs, they can cause silent,
harmful side effects unless a debug kernel is used - as was the case
with a recent slab out-of-bounds access issue found in this function.

Therefore, issue a kernel warning via WARN_ON_ONCE() and return -EINVAL
for these anomalies, allowing the bmap layer to handle the situation as
a filesystem error.

Signed-off-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>
---
Hi Viacheslav,

Please queue this for the next cycle.

While the recent out-of-bounds memory access issue in
nilfs_direct_propagate() has already been fixed, this adds extra checks
to catch and gracefully handle similar potential bugs.

Thanks,
Ryusuke Konishi

 fs/nilfs2/direct.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/nilfs2/direct.c b/fs/nilfs2/direct.c
index b8643d3aa2f8..64da677dc8d4 100644
--- a/fs/nilfs2/direct.c
+++ b/fs/nilfs2/direct.c
@@ -270,8 +270,14 @@ static int nilfs_direct_propagate(struct nilfs_bmap *bmap,
 	if (!NILFS_BMAP_USE_VBN(bmap))
 		return 0;
 
+	if (WARN_ON_ONCE(buffer_nilfs_node(bh)))
+		return -EINVAL;
+
 	dat = nilfs_bmap_get_dat(bmap);
 	key = nilfs_bmap_data_get_key(bmap, bh);
+	if (WARN_ON_ONCE(key > NILFS_DIRECT_KEY_MAX))
+		return -EINVAL;
+
 	ptr = nilfs_direct_get_ptr(bmap, key);
 	if (ptr == NILFS_BMAP_INVALID_PTR)
 		return -EINVAL;
-- 
2.43.0

