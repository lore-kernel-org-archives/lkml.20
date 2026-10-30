Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334573;
	b=g6WtnZd6wyDX2e3LzPUat+EKC9BaDy3WKXid611IpWu3YJ/K+qcyTpGOQsz0dBfCHXK4
	 WYk7GXTpq99kto/tdt0gITU9SPXI8cIh5DJloDSOlTgqKUSEG3zBfGuyZtFwn6mBd/gGp
	 bey++efolE4usVT9/BRQPgucqz2o+MoygOtEKIWQ9/793NfoZ4bVjKHdjtELTAC/I8Yyu
	 nzjtg7r6r1kcpcPz97GQBCtSxm8c9SwUqUlF5Vz8pDsrMMmDM6qUEB0hSnONteF+yAf9u
	 Tn3nOHnk6XI9fOcfDW5zqwMb5KeBGMXJDVuDdrdfiVaCLL9asSFHA97IkvIOMAc9ioQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tN9CKb1zjGPoBG8E6tp5fkfqBwx6I1Gzk/q0OBzU968=;
	b=lUGkwPc2esv1f0LEzmZk1+OS24TsMX7mjEM4S9GouI8j6rrVru5FYkk6D4SMxuCrKVpH
	 Gx0irij7kkkgmqlAiLzpWB5cmHeGy6P0GV2nu6i8TDVY1/iQtETmgopd8VMBq2B2c+8I8
	 ZJq0eVDkrV90RmKv7rBIIGFFY9UNfSnujCEeBosmIL/MvOc29flRWpn80Dsh0ZjpXowIZ
	 0NnGpctiHIdLT/lXwLwtAysY9CjfPyMpLcxDMlj1wLxzL+J8pBVBFKBf89x2fZzBk1gmX
	 0rm1UWTkonjxejxypnW0CZCy+r3pNUdHlmXNL7PTTgYosYucB21KIqft/JhMFEzGX/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=aHKmx8SX;
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D81606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23D81606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=aHKmx8SX
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91c79f306e9so3828886d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1793334572; x=1793939372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tN9CKb1zjGPoBG8E6tp5fkfqBwx6I1Gzk/q0OBzU968=;
        b=aHKmx8SXQV0DVgG4fMxLGmWqxc6pdvIhTosicXvDwZ8RVa+kQbLMvle+v9HtxdkAuy
         7/AbuKcLB6W/VSBkdi7pspd/jyIZnVAyygIjPgveqWp1CWhMCq4wsh1mAl1I9WEi4MSH
         pr8Q1WkHLsGM0me3DMV0NfoT/3inCzhgdCdlEfTpTK3NYRLJQPyltjmzNEOtWv6YyanU
         CrmAI9eQ7aHs7e9O6ghtMQ/g3noeTxSj4IQjiCRxIP8PmiWNC8faCnAJ1Yy4HfKTCjXy
         6168MGYMrkg/Q6LMTDnOe3Vazg4ZdT9mWyCPShHIURPfiEh67qwk/bCcjpU9ciK6W5RD
         dtgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334572; x=1793939372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tN9CKb1zjGPoBG8E6tp5fkfqBwx6I1Gzk/q0OBzU968=;
        b=q2iV2tMktNJt51SbpWB4SqD9LJ/ItESaRbDQqnrYtY3+3/iTMk4vV/iEe8Zg/1w+UW
         JPaCuM1a5+vNFQurZAk/eu9MIf4cb7yFR2m/iEQ/KI5SXwvz9jaOGsaIfxsCuvy9YsOK
         Ih40sThnVE1QIELtlEwIWFAQ6lKRFBTEODcc1rkCqCAtyzJ8YmkdLuuA9B3A/nzvhont
         geHB2lAyxGlhnH9KmwqJQWEG8k/g+GLyfYO+4VUq2O2zTN7ZMaYDFTG8x+jTgFV4JMU7
         kuZWa/qinFESGV7fyd2uNOtIpkef70kWNrY4407rxzJ+E3xSyQjj0cE+vQNjTcotIXNr
         m/+g==
X-Forwarded-Encrypted: i=1; AKwUvBwSQHYKcmD3D8ZP+VVGYkgAJqkVYXWp6KTnTTR55zXrkEBYEzu5VXSStVWt1om9FgCMg5oIvziDmExzq3M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8c3L2pNp0QPphiJ5uUmYwZlqkO8gIY2W0CA3kRdPMrO8om7Jk
	tvMGQ84hZZLvsUoQ+ZT/uPg3O2hh5IMOAEFcsoiPd+MkZXMV5+Mh/uNxct1ZtP9Gkg==
X-Gm-Gg: AYBFou2qPrBpxxn24D+KRhcj/mlK+i31gxgp6ikvpXZY1j93MQZm3fkUuCEVA5fiZu8
	RNIopt7+2pd4cDJUJ32hE/e4q6gNbFtiROa4kAhFYVICXbU4wsOvU43t1sXLizv/1EkfqfnpguH
	YjE9HIKuWCaU7jV4M3W0UxX9XCTp9Nrccz5GsncLiMsZ5pGV4NQbiFxl8ZM5TQY9epyOaB9dS5C
	7taX+l3mFtREyTnxbfFajKHu9vble9O9aMfNPzfJtjpiYtUqEdosooXHPbIhgVp5bnOedgaQrnS
	rApsu97IlSyyfn4Lw9WD6kimTRqkhXKYm1lpVdjFsl0p+Yzc1SnxLJJwPa0f2q13+8ETD5HtswX
	gBG6kqS3J1Qkskmspm9TdyNYtH5xjWqdSIej/Pz2aFxXnimXUzXue98iteKid9/hjxFKtPz2o7o
	vsScKv/WuGfJ3OiVzK/uwIpwq4yh+ahlQKX8sHo17MZs/Xt6pzV6xR640nWpC7wnyY0WA2rSEv/
	bmSQWXHvFad57je3BNMJxiWCw2+11o8IKbgK5HXIpmdC9J7cT4Hvjkx6xVaXVOp3AQt5CsSu+fJ
	apFm/4Tv3FEEaDlVKJmgD3rLaHmdqibCTpF5SpwQUUo9JZjyORDs
X-Received: by 2002:a05:6214:524a:b0:91b:82a6:d2f2 with SMTP id 6a1803df08f44-91ca4adcf10mr14769366d6.11.1793334561851;
        Thu, 29 Oct 2026 21:29:21 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca7f254a1sm5058166d6.7.2026.10.29.21.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:29:21 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: slava@dubeyko.com
Cc: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] hfs: remove the dead grow path from hfs_file_truncate()
Date: Fri, 30 Oct 2026 00:29:03 -0400
Message-ID: <20261030042903.4160506-3-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030042903.4160506-1-hengyul@cs.unc.edu>
References: <20261030042903.4160506-1-hengyul@cs.unc.edu>
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

hfs_file_truncate() grows the file through hfs_write_begin() when
i_size is larger than phys_size. That case no longer happens.

phys_size is set to i_size when the inode is read. After that, i_size
only grows through hfs_write_begin(), which grows phys_size first, or
through a direct write that ends within phys_size.
"hfs: report errors when extending files with setattr" made
hfs_inode_setattr() extend files with generic_cont_expand_simple(),
and "hfs: fall back to buffered I/O for direct writes past phys_size"
made direct writes past phys_size go through hfs_write_begin() too.

This patch removes the grow path, and warns and returns if i_size is
ever larger than phys_size.

Suggested-by: Viacheslav Dubeyko <slava@dubeyko.com>
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
 fs/hfs/extent.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/fs/hfs/extent.c b/fs/hfs/extent.c
index 26357086517f..8d04b7c0911e 100644
--- a/fs/hfs/extent.c
+++ b/fs/hfs/extent.c
@@ -491,23 +491,9 @@ void hfs_file_truncate(struct inode *inode)
 	hfs_dbg("ino %llu, phys_size %llu -> i_size %llu\n",
 		inode->i_ino, (long long)HFS_I(inode)->phys_size,
 		inode->i_size);
-	if (inode->i_size > HFS_I(inode)->phys_size) {
-		struct address_space *mapping = inode->i_mapping;
-		void *fsdata = NULL;
-		struct folio *folio;
-
-		/* XXX: Can use generic_cont_expand? */
-		size = inode->i_size - 1;
-		res = hfs_write_begin(NULL, mapping, size + 1, 0, &folio,
-				&fsdata);
-		if (!res) {
-			res = generic_write_end(NULL, mapping, size + 1, 0, 0,
-					folio, fsdata);
-		}
-		if (res)
-			inode->i_size = HFS_I(inode)->phys_size;
+	if (WARN_ON_ONCE(inode->i_size > HFS_I(inode)->phys_size))
 		return;
-	} else if (inode->i_size == HFS_I(inode)->phys_size)
+	if (inode->i_size == HFS_I(inode)->phys_size)
 		return;
 	size = inode->i_size + HFS_SB(sb)->alloc_blksz - 1;
 	blk_cnt = size / HFS_SB(sb)->alloc_blksz;
-- 
2.53.0

