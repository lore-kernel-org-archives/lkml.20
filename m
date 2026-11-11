Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402124;
	b=wi0RekqBaZGdiCq4tozT4D9IkmmjbpBhLoaWI8Dy0qKwL7YxJBVqvrpIrMPGDMZipUcj
	 SvtcNRu3jM260bd7V+Sbpml/Ue2j2EHahAPUtUTx3rshm0T0JJnqjiYtlVeEGTjGxMCJr
	 sDXe92+2I5G8IXwO1SDreWfbyby+LcZSQiwDtukFadost+H6I1wC5k4X3c9OE4PWHbfvG
	 i27hMzl0nRfCEI/taahU2d5vrBIluxAswpt/NEuUXWkq0Z7t/f79O+k0TqF4XJ8JM9tVY
	 uqO8h1X1J8j2Fxp+E97TT3bi2QGybByr2sgXtI1YBfaAVBsmMsWwcVGRcPFuKpw0YXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=w2/+xHZKQ2U7spoWRX9s3/PlBR0bd8B1wNdFaiAbagI=;
	b=Z/Qy8L/3MoLEyDoe6go1OH6W681WC4TJwEOVnkMgkc1mWlYeE6fRg5Z9sW80JjVh9YNu
	 sF5+tnaoNzk+p3gRrWaScqj2CIQnOxYULO5NHBrL7MNh2jjqz4U7DfxOXWHYfBqWWLe7f
	 DfBT/6+GGxKomGzQvrBm9g3bfJDUYlFDxZIhf6QV5HgV71JJ+8wiYsJwDGerh9uE0/r64
	 Cgi229b/94K+y3pGaFJ982DRjVnCSVk5Bs8yX+L17fAVoMhiXiaixxWj1w03/xyzsnzto
	 6Ohfm2sHOpAQ3jfobpe+Y0ZrnTCiChK96RkGxctDxYT8g2K81f1YMRRzV55taD9u7tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HvZBZsK7;
	arc=none smtp.remote-ip=74.125.229.138
Received: from mail-dl2-f10.google.com (mail-dl2-f10.google.com [74.125.229.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3659E606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3659E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HvZBZsK7
Received: by mail-dl2-f10.google.com with SMTP id a92af1059eb24-143601f9f98so806723c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794402123; x=1795006923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w2/+xHZKQ2U7spoWRX9s3/PlBR0bd8B1wNdFaiAbagI=;
        b=HvZBZsK7tYvSumdzHkEQb7rSL9q5eY4Hda3xEbtuRJenmpkNB0i+OcZ2Nf8cTbbXKM
         P+YIMusWBQrxjebN+a+q03WLFO4jkF7MAIlxBBxr62Yth1ABBEZQ+1h6lCWIrKSRAQzw
         wzsp5iqL/G0DSX5Jtx55GrYYW1RC91+ns/WwXqfwNIz14a/dDqH7YUoSHQW+rf7FmE2C
         zWiVbdfg9xNAXLgZnMPisZ5hPJj2YPzf897YTf29mJ046Ye8+gYQL9x/xbzjuidhZ4ff
         n5ufoC0qFsLjkk23MPg2bshtTcHxWcVat8ty+IJLRWA0sQNN0lr4SxanfIpaNODwyppA
         QCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402123; x=1795006923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w2/+xHZKQ2U7spoWRX9s3/PlBR0bd8B1wNdFaiAbagI=;
        b=ZE5sLZ0ej3HjDVS2VX5qg6WdguGqdIbHOb4bPrNQFV8B/3l5sEiqxVUUBRWJN45Rjz
         KHPNh2nIcEF7n9tpL7YwgdjmYZqICCRp5hc4EwyAsURQb4MagBTRu+JxH3Z6+uXF9aQW
         zP4D0ZMLDcS2XDq5eoocRaLGPP584tfjLggy5sSUESPbFKHcvqPZhwb9QTn0R5Z01F+D
         I9Hx67M4baDZWV18kqivr+dk1zHAVac5ygh6FTJVjryCGuVglSFKIoX08lns5wk8PSj/
         zxcunTRj8iMdIAbUaJ7DrH3/x8kSeVSO7HPsKzcnZjDvsM5IyLtvwAMjd40nVdNflfPD
         Y9vQ==
X-Forwarded-Encrypted: i=1; AL+hErGxt2yuu+1KbcVzifSaNCith/4pEB6b2nx1bSpIS0I4qjXXW4U1BZ/Y2A/IpJfKJtz4CS8ZzvmmWDUaOFk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HA5uBC1GK/9D8ZzBKj+aOqA2Q1BOZ81RNTFOkjPRM+daXkVyB
	umuaYIvjBHo4b5Qan0zY90/7/q51v2MCapRlbJgxobVRDf8pPrwFSHYn
X-Gm-Gg: AYBFou3ZtsWEy8pJ6A5npGDtG6itani1WQ2EqUyx+0iBLmRRd+Gb895Eyfo7WAseJUs
	CAtZzHBz5rr7Ftek35EZ0zP1612PeOuBsZISXEgrsRagkX9vW7YDRSpZy2QfZGZVdiHRd0HyBec
	Fgfgc+LRb5swqVnFDH08qoWb3BT+iag02YOMJjnp4R/1tE4r9JlHq+yTHjviP90c19SRKbFvtAs
	TiJWgI35C3VhKHuwIK1RORRRr5H5S9TmDyA/wMu1yp26C/tKzc06S0rYU7sjeN7DkjBbT3h0k0L
	CEnHNPry5KN3A/XEt9wyRm7/mgnVYNAJRhmtP7YWGkIGk97b6hxM6dERMSaSbme4cf47MkX23Ek
	XnQEOcr0Yy8acXlBhoFKdACCjpR3G87NRcCAqFNqkBnEzetYCm5JiT+4NAyL87TKfuWfN75jIWW
	RSJDdZ/Eoz6JBcsMZgW3W83LZo0RedSoo+j2htzwO22mlwdBXpEcrAssx9R33OipviGIB5I3tOl
	a2OuBuS7n1EtAa6L/q14JLGdbKxvwFYAYTpJnpFuHj0rJS1pvNf6dGRbYcnZkhUQ5ws0ud+fuO7
	/9m5rcSwEMxKxRhEulpazrWjGG2hm1MNc41jBNpJvHPOZzkatCXd7wiFuFeA+KfO+maxja3y+sX
	waikaF4+dcqUc1f99zxCM3Ws5CjtUKsUg/0lnqw==
X-Received: by 2002:a05:701b:450b:20b0:1b3:ba92:145a with SMTP id a92af1059eb24-1b3c0303655mr2388509c88.19.1794402122900;
        Wed, 11 Nov 2026 05:02:02 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11150sm21696634c88.5.2026.11.11.05.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:02:02 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: muchun.song@linux.dev
Cc: osalvador@suse.de,
	david@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jm5905938@gmail.com,
	dennylin0707@gmail.com
Subject: [PATCH v2] hugetlbfs: report inode limits without a memory subpool
Date: Wed, 11 Nov 2026 13:01:45 +0000
Message-ID: <20261111130145.96534-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A hugetlbfs mount can limit inodes with nr_inodes independently of size
or min_size. hugetlbfs_statfs() only fills f_files and f_ffree when a
memory subpool exists, so an inode-only limit is enforced but its inode
counts are reported as zero.

For example, a fresh mount with nr_inodes=4 reports zero total and free
inodes instead of 4 and 3. This hides the inode limit from tools such
as df -i, even when creating another file fails with ENOSPC.

Report the inode counters when an inode limit is configured,
independently of the memory subpool. Preserve the existing zero and -1
results for unlimited inode counts.

Fixes: 74a8a65c5261 ("[PATCH] Fix hugetlbfs_statfs() reporting of block limits")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
Reviewed-by: Aveline Noir <jm5905938@gmail.com>
Tested-by: Aveline Noir <jm5905938@gmail.com>
---
Changes in v2:
- Add Aveline Noir's Reviewed-by and Tested-by.

v1: https://lore.kernel.org/r/20261101122653.53982-1-dennylin0707@gmail.com

 fs/hugetlbfs/inode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 01c4d6f44ebe..e94ee8e17004 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -1113,6 +1113,8 @@ static int hugetlbfs_statfs(struct dentry *dentry, struct kstatfs *buf)
 				- sbinfo->spool->used_hpages;
 			buf->f_bavail = buf->f_bfree = free_pages;
 			spin_unlock_irq(&sbinfo->spool->lock);
+		}
+		if (sbinfo->spool || sbinfo->max_inodes >= 0) {
 			buf->f_files = sbinfo->max_inodes;
 			buf->f_ffree = sbinfo->free_inodes;
 		}
-- 
2.43.0

