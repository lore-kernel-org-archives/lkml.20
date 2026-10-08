Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6577C48F832
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 23:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791503662; cv=none; b=F6X7qgZNy6AIRfZIVzG8SSHHbIKwiNdTlOevoqRDXGh7Nlwdc9N77rCTmACGt/61HE6zxbt+5jhS+1HBXpCXFnaM7pXs7G94XdqgYxORVIVmptH4lqhekbIvO7EtIMYrQE+Z0ytlQigAR4PPdVt4CxwKBcqMhro/AEsGgAE4lo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791503662; c=relaxed/simple;
	bh=m3CYGZJNAhzPMUFu7GeaoaRd2e9cCQEQ06WCsBTVa/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bmmYG4Xwmwjk9iNO8Exq1VWno2Wjsm+LubWAF/o62WuIqpQCXkJoRn6mFGJtxOCjq8WjZbFK19xrpz+WJOp+UgtAoOxOWZ4rLiZ7SycBEyf1KQm/kso9V+5JslUxqC+Lfn2/hsXrHYz5Y6KQYll41nE/YQZp6Nyr3EWMSkA0UJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qpUrz+cM; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qpUrz+cM"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-9196b81f00dso1429876d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 16:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791503659; x=1792108459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6nrBGseu0RKze7XYtGVGT/Lh66doqcnrdj9NzSKYKos=;
        b=qpUrz+cMh1tbCixyeRQC6Jh+TqgqLlrqXam9ksowDply8tX3+XLMGSKcjrutA7meja
         7XPRQGVrdZP5er16xkTfb2vZ6jtdemD2qZwmmIvyQYVWIlaGEmpbonmjLv5rM4F8BKuI
         JUnjG86pMIwJU5NmLrGxhBwFyCYtMmCcS/4aN9Er44IZHFjiydePfmCtl5yYhg9uIUD5
         Hnvb9erTTGukp2NzYIFSN4SJ8hrCMajUuiTdFWqcSLwGG28zHke+FiXYne6JKCeCdWTN
         CH4j7O7qpb2DydfHqwk31ZfQbHtQ6HNMAvHsP2hRKrT4DCX0ETgh5/V5wT6QilIJ6XMe
         dpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791503659; x=1792108459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6nrBGseu0RKze7XYtGVGT/Lh66doqcnrdj9NzSKYKos=;
        b=1w/RseUwdCF0lppMUhAayOnk56flYmU2G22koi3Em8yXqLwI8GkgVOTHEEjWta4gG+
         t7ER/5WZ9e14u4JFVEzth32BXu64Geqsm4phazcnU6gyMgcr8mzYIzahads492Y5rTaj
         clnh9JvImiMn3Rs3fxUuwHzOx61aJEfNvUdWdblLIHGm615Qdz7jXQ2hHmCguh+TWTMe
         q4/u0kC4GshnJO3doZw2LyxLOaRihDe8jZcEp3McAgobG3+24AfbqpMItjlmiSZBYKb5
         ujzUJfUnmVPWRDSJPgL05lJlxK/8XPXoPZ+g0HiLHp7PfxXIq7UvBR53781l8ZjKp2tC
         J7Mw==
X-Forwarded-Encrypted: i=1; AKwUvBxTBgnAjF2Rk/KlycjVJ26Og5+L/i73oj42DqPY1o6/ExD8CFWyWvaTDhotFQar6rGeHa85jvTObeT7KL4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdzkXw5sXfPO96zy0kKzLqKNwEJH8gGnlpq8p/KecUJQhjq6D7
	c6J8rcvm33bHw4L1bNL8B9GpWhGDtG2QYvgUYN3U46DvIrHvRB7HEMm7
X-Gm-Gg: AYBFou0E3kdhcmowb4ybYb/26HVKt8HQayCfLf2xy5xNuggBhRP6uyGjgbHi7OCLv0/
	k9MfHdiToTxkA9PLL8XWpgkZqqMej5gLorXLBCsouChoYidsKANnc16/Mg+vD8q6BdmVFuy3/Bs
	cLNHuyB63A0UTawlFGfUtgwwFFPKKIMu1czK4Qrf4NUF6yiPtVNaG6Jn2oDpisogtw9R51FXoUq
	AQ/1UzdHV8GfUVIEqDZlp2bsKf0k+tl4+gd9h8APAV2GDPVU7OO5i3XYWnL9/slv1mLyxPbqnfZ
	MKPNmWin9t7tk9kYtQqG52mL/LJ7MnvQ5Y/aq1Mj5UrObDew2BQP+80p+YR8mVKVFNEiNsjXQam
	2eSMiuJAGxRceBOjylPxiazXkBE3iUGSc4ZTL7TQxEVHsOQhIVWTPgMWOCRqht0axKb+kJf/wAX
	r8Fb8tAmVaRSdOTHuYxzIiZGh2flO8R6D7aZ5pq3vd4RPNVuohE1XS/mVM5EMYyw5WkQSxYgdJU
	2kEls0UJBqZ78iR74ZdlT4YwkKLtfgc+cP4DO6F+kU8rW6FkCfhlE9lk03PTeXmTjGMqjjrD0Lh
	1yn+Zg+BNUNj4FimeAY=
X-Received: by 2002:ad4:5767:0:b0:919:59e6:f517 with SMTP id 6a1803df08f44-91b557c3a96mr7022486d6.5.1791503659259;
        Thu, 08 Oct 2026 16:54:19 -0700 (PDT)
Received: from localhost.localdomain ([132.170.205.109])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b550e6609sm3451586d6.43.2026.10.08.16.54.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 16:54:18 -0700 (PDT)
From: Sanan Hasanov <sanan.hasanou@gmail.com>
To: "Martin K. Petersen" <mkp@kernel.org>
Cc: Sanan Hasanov <sanan.hasanov@ucf.edu>,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+fa495e1497c48a6ed885@syzkaller.appspotmail.com
Subject: [PATCH v3 2/3] scsi: target: rd: Release protection space on allocation failure
Date: Thu,  8 Oct 2026 19:54:08 -0400
Message-ID: <20261008235411.56641-3-sanan.hasanou@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20261008235411.56641-1-sanan.hasanou@gmail.com>
References: <20261008235411.56641-1-sanan.hasanou@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sanan Hasanov <sanan.hasanov@ucf.edu>

When rd_allocate_sgl_table() fails, rd_build_prot_space() returns the
error but leaves the partially populated sg_prot_array in place.
pi_prot_type_store() then restores the previous protection type without
calling ->free_prot(), so the pages and scatterlists allocated so far
stay attached to the device. If the user writes pi_prot_type again,
rd_build_prot_space() overwrites sg_prot_array and the earlier
allocation is leaked.

Release the protection space before returning the error, as
rd_configure_device() already does for the data space.

Fixes: d7e8eb5d9216 ("target/rd: Add support for protection SGL setup + release")
Signed-off-by: Sanan Hasanov <sanan.hasanov@ucf.edu>
---
 drivers/target/target_core_rd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/target/target_core_rd.c b/drivers/target/target_core_rd.c
index 97c63b122..b73bdd733 100644
--- a/drivers/target/target_core_rd.c
+++ b/drivers/target/target_core_rd.c
@@ -263,8 +263,10 @@ static int rd_build_prot_space(struct rd_dev *rd_dev, int prot_length, int block
 	rd_dev->sg_prot_count = sg_tables;
 
 	rc = rd_allocate_sgl_table(rd_dev, sg_table, total_sg_needed, 0xff);
-	if (rc)
+	if (rc) {
+		rd_release_prot_space(rd_dev);
 		return rc;
+	}
 
 	pr_debug("CORE_RD[%u] - Built Ramdisk Device ID: %u prot space of"
 		 " %u pages in %u tables\n", rd_dev->rd_host->rd_host_id,
-- 
2.48.1

