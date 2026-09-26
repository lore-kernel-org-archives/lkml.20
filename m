Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B2D37E5DE
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 04:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790396982; cv=none; b=lVLbz6OaNk7v86ZZfHlflVDo75VQca/CRKZrbAXjOGGuc7oEIX2Z5BUgN+IYklBazkPnm+LcPr9I6jMHoRnql01d9/b1NgCEMjTZxzuVAGaB09hTP6tvaHjCe/BP60XBQPEEjK95FWZcGXMp4DbsC5DJ8PqVFrnaFYvDZKUUfus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790396982; c=relaxed/simple;
	bh=bWpGiVkFMDuSssWxODbLxUjWtqGMiUCzQ1jlycUTq/A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AeYwxPf5ujOHggfqgL3byNkjIY33ipyS8vlCPXJGTLjpjd7DP80p6w4M5x6V/oJpULpkhxzTjSS1hXaokxvQ/2T+V8Hdmq11N28DL8PHy1TqPgktnY6aANK69lIHPx2pyokDaGvDelD8FqheU6Z31Wvxk9VpDMoRfllkNXmJfus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L5dWfZJg; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L5dWfZJg"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398beb616f5so798231a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790396980; x=1791001780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MnArI2zFMgSLXsIUz65zFL4A+lede9eeiAgX2MVd7/Q=;
        b=L5dWfZJgldykQ19Xj0dh6bOpFhcZVz9//fpHJPWZzdZm/a6hBjUqpViOBnpzgHtGP9
         Cq83AlgrDfsWMCODSHJDaAQXt8EZ/OS2Cb8IJmowDYPsCJzFY0wOKu1LuhbTIIFXAljj
         PGCMJwF7/OjADRDjwNNOwqpqO8CqRB7yITZUmXvJlJuQbW4uV6w9i31ovSSEBwYP017m
         sBYosUoVouYEfxnZ1jZ5wLIQQ9Y/r06XXS9xuXIwhQV7Bk11qvL7k6Qa4pocXMbp+bao
         S5/OXI3cXx2ez4mIQ/HoGmSbC4OHWTwUYSuC0oXKAhI5TIhZ0sPkHb8Q/YOOdwTchp3/
         htbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790396980; x=1791001780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MnArI2zFMgSLXsIUz65zFL4A+lede9eeiAgX2MVd7/Q=;
        b=b+sYMLAa0IEVS38Xreaha/1Bdsq5WKAfkEwK/6qXkyO2rmPl67nUrt96vvdUmw87/+
         FIBrXSFKMDkUutFwTgCsvvxNDjLbrs699mHijF1FaqoaOMHgNMNSWXMFN5N4fXHN8IMh
         1y++0NzCrZlVMkmMThDgjeFohedeR/ZiwX21PM5W2qYrrGC4YhPrQPPNPPP836Y+K0Ow
         dl6xz406pbWRyAGddOxVwyX/YuiNWJQQ2w9L7SkxY37d5dD8EZ5nit8aBMsW19nxFRDL
         1/uvofrSGqIEq0gRQiC901kheuwB2E4l6dpQ1nNNO0R9agwSr3wpgzfWawD1tlvR8S5H
         21rw==
X-Forwarded-Encrypted: i=1; AKwUvBxt+FKA0TtPgGJdiD544Ta64YfMtnSOQIKAQ+FyqXMfU4SLC2VDFzim/zAviT7XRVvwdsUlhQqpRvBVoNE=@vger.kernel.org
X-Gm-Message-State: AFuF++kbr68Gds0t8ShonDfSsHknOjhUoKU6kIyWdD40bshMUb19bIjy
	/q9zsUozDqE1mZu9pYw09TKcaRlrjUTeVLTlAXVa/Jkkt8ybGKDptWQZ
X-Gm-Gg: AYBFou0MNAYOkByjOzyPtzTKZ6hZ3a8zncaFioRTOyZEq0UURx0Wan4vuRDHu3gMpho
	25ehpCctsf2jdQ7TdJYdomv/1sbuzR3HiJtRWXWg9LuuWeDVkNZ2w726SIFISm9jtXZQqRO6dXW
	omPnqhiV9sjVaxmyzO1exglDr+mAFulSkkB8DKJ0OxLWLyDjPvacbPqO6qomWjpb+oLg9gXQFqv
	zIqtlo7dkrG8/EgkQ9kM9HxRDyKRfBTbc0qJusdBh32MKDzMqYXL6e+E9o2oWUnETvsjChy0gLb
	oagIymuG8vd/tPEADR+/17HeTJuKaKXOCFieGCBp1wFvPCMm13LMmgTk+BbFmiPUKUwLi4Jm9Sl
	JOt/maDjCyx1TSXfE/73QIBRskMU5gR+YdXTW1slh6ZEEYBYbqC4SEomLji+g6ar4FBr4+S36Tv
	iUvnCQkhNmfuyKFhwagWCfQTPgzpxM69gInLv8+3m8Tq+Fq+ua3dkC57XnUQMNo1fhnxPCYc9Zq
	Q5KCQErxx6m90n8A1nFsR7TDkCqAlBKsAB0CmCYd8u6fC4IiQX4xd175JOUJku/KU/SJ5FK0REV
	U/ynpK7FPtdtJp8rj3QYR6oHbs+SSxvL45HzeF7f455QbUiC
X-Received: by 2002:a17:90b:5247:b0:39e:6c68:fd8f with SMTP id 98e67ed59e1d1-3a098b628d9mr4490672a91.36.1790396980415;
        Fri, 25 Sep 2026 21:29:40 -0700 (PDT)
Received: from dell-pro-max-tower-t2.cse.unsw.EDU.AU (pag-t2-pc.cse.unsw.EDU.AU. [129.94.173.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0974ec5dfsm13884039a91.3.2026.09.25.21.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 21:29:39 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH] soundwire: master: use sysfs_emit_at() to avoid sysfs buffer overflow
Date: Sat, 26 Sep 2026 14:29:35 +1000
Message-ID: <20260926042935.2284011-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clock_frequencies_show() and clock_gears_show() loop over num_clk_freq /
num_clk_gears, writing each entry into the sysfs output buffer with
sprintf(buf + size, ...) without bounding the running offset against
PAGE_SIZE. Both counts are taken from firmware-supplied properties
(parsed in mipi_disco.c via fwnode_property_count_u32()) and are not
otherwise capped, so a device whose firmware advertises a large enough
array overflows the single-page sysfs buffer.

Switch both loops to sysfs_emit_at(), which bounds each write to the
PAGE_SIZE buffer.

Found by static analysis tool CodeQL.

Fixes: c5778ca49a194 ("soundwire: master: add sysfs support")
Assisted-by: LLM codeql
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---

Notes:
    Compile-tested only (ARCH=arm64 and ARCH=x86_64 allmodconfig, W=1). Not
    tested on hardware, and there is no reproducer.
    
    The CodeQL query behind this report was synthesized with LLM assistance,
    and the fix and changelog were drafted with LLM assistance; I have
    reviewed them.

 drivers/soundwire/master.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/master.c b/drivers/soundwire/master.c
index 440bfc52ccba5..fb1ef2210732d 100644
--- a/drivers/soundwire/master.c
+++ b/drivers/soundwire/master.c
@@ -61,9 +61,9 @@ static ssize_t clock_frequencies_show(struct device *dev,
 	int i;
 
 	for (i = 0; i < md->bus->prop.num_clk_freq; i++)
-		size += sprintf(buf + size, "%8d ",
-				md->bus->prop.clk_freq[i]);
-	size += sprintf(buf + size, "\n");
+		size += sysfs_emit_at(buf, size, "%8d ",
+				      md->bus->prop.clk_freq[i]);
+	size += sysfs_emit_at(buf, size, "\n");
 
 	return size;
 }
@@ -77,9 +77,9 @@ static ssize_t clock_gears_show(struct device *dev,
 	int i;
 
 	for (i = 0; i < md->bus->prop.num_clk_gears; i++)
-		size += sprintf(buf + size, "%8d ",
-				md->bus->prop.clk_gears[i]);
-	size += sprintf(buf + size, "\n");
+		size += sysfs_emit_at(buf, size, "%8d ",
+				      md->bus->prop.clk_gears[i]);
+	size += sysfs_emit_at(buf, size, "\n");
 
 	return size;
 }

base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
prerequisite-patch-id: c5a3be8688fd8e88a00352acb1374e91fcb52a03
prerequisite-patch-id: 67693e2c08624df0841619cc085ce9200f4385fc
prerequisite-patch-id: f3d73f7c19be7e952aa8061303f53f9a08576a88
prerequisite-patch-id: 541e578709d048f4c8115f1d926be2f2c03ecb0e
prerequisite-patch-id: f23f8e0693435497645805822d98a92e57fb46f3
prerequisite-patch-id: eae82895db8ba67018a777a91a283ad6bc4a55b2
prerequisite-patch-id: aed00f7502865e3f9262959d828eae4a4021108f
prerequisite-patch-id: 4cd2054e4973f2ed050d71e0ad73147165913916
-- 
2.43.0

