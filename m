Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=71.18.227.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794081025;
	b=MVmg39eTUtg5GQldD0vPJ1m2SuSlI4p3TR/Ntm+7E0Cu8aPuPxijfzRIoZ3Em7YfkJiU
	 XbZ7sFZ4SsF8e1CKAYzEErvHCMStBb+3J09oxuSxYOvSy2VWf5zDNxvBy+OGTdeQG6Rpn
	 rKeUcQ6yWnh4COfUNyx69VL9IYhE8nf2DKokMAAUpZCB7MC7aLwGk57/CCZZ7Ma2H7wVi
	 +PJqgK3HSP9iNXfbcqn7QZzSqev4/kDd3TbQ20jASswaeuKhvYQMYkRfUbo26VBvZo8FO
	 Quk1DzOHvAB06ArggZN71ocrTK2JBwjdC835vB672uL8ECm1HVb4PwRZ5Jn80pS7oBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794081025;
	h=DMARC-Filter:DKIM-Signature:Cc:Content-Type:X-Mailer:From:Message-Id:
	 References:Subject:Date:In-Reply-To:Received:X-Original-From:To:
	 Mime-Version:X-Lms-Return-Path:Content-Transfer-Encoding;
	bh=rlLgG5I3OPDKe+s2G/vyZAlDqa0Clnytt8kFvaBbu38=;
	b=LMuGaaMfj4URfKgEJta4EtFyS1TrJtICpfUCQCdeo9IlKEqB5o+Kj9JJLvKbIJbh5obR
	 Rdr/Ff6aCJnvvslW/VYdY6DiU1iEWtZ1bK35lZmTi06P2r/IrRC/HRt2gWJSG0nJAnK+X
	 xRIya8wI0aGdY+gHdJMJJgDSonQwcgvKgTW5zTmxAdix+nLi1WWs/798PjRy8nBS2Af/R
	 aCVY62fKL5RSIArBxXloppmdM8wPBk1vRXzzBI87zhEDvZS/Wr3hFrh73w/7POK1S5x1i
	 l6Yph5WZuM/BrxaSvA3gEUYwpylTe1NNVxbZ4vr4Nm5yMuMAMkJA7f3NXBjPC8M23BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cherr.cc;
	spf=pass smtp.mailfrom=cherr.cc;
	dkim=pass header.d=cherr.cc header.i=@cherr.cc header.a=rsa-sha256 header.s=feishu2604220257 header.b=UD8oXflt;
	arc=none smtp.remote-ip=71.18.227.3
Received: from sg-2-3.ptr.blmpb.com (sg-2-3.ptr.blmpb.com [71.18.227.3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49A9606A32F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 19:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D49A9606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cherr.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherr.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cherr.cc header.i=@cherr.cc header.a=rsa-sha256 header.s=feishu2604220257 header.b=UD8oXflt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604220257; d=cherr.cc; t=1794081012; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=rlLgG5I3OPDKe+s2G/vyZAlDqa0Clnytt8kFvaBbu38=;
 b=UD8oXfltWgNb54C0XxVzSRRvDjkZKpEjt4xHyHCiwENX6poD49ME1YP6yhGSb70BreyzWo
 mSR3IpLTQD6lmTjo/ZsablwyKvUcj1nMFrL7PZ6B8A23IRNHbrM3JxMhGG6onisqXFCW0q
 VCQVpshQzUVzLXytiAnGw0vv7CmD1gsH/Tlm4igVqLuowuApqaiMGf5bXQchts9f7sm482
 JP5SiV14u+odYd8ZyntmQQSUmW7Xt9tCDhJHQZhb2K0KcwlZwkEZ9W+MVvpl/Di/Z4FTO3
 KXvrNXx+/7ZwRg94itJMz5phb/5K4VGpjIAdEcnWZJeN2IyjrD/25uuQTkDW9g==
Cc: <linux-xfs@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	"Shengzhuo Wei" <me@cherr.cc>, <stable@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
X-Mailer: b4 0.16.0
From: "Shengzhuo Wei" <me@cherr.cc>
Message-Id: <20261108-twin-20261106-fs-xfs-da-node-v1-1-0d4bd47938ba@cherr.cc>
References: <20261108-twin-20261106-fs-xfs-da-node-v1-0-0d4bd47938ba@cherr.cc>
Subject: [PATCH 1/3] xfs: bound node entries on path shifts
Date: Sun, 08 Nov 2026 03:49:58 +0800
In-Reply-To: <20261108-twin-20261106-fs-xfs-da-node-v1-0-0d4bd47938ba@cherr.cc>
Received: from [127.0.1.1] ([111.40.58.155]) by smtp.feishu.cn with ESMTPS; Sun, 08 Nov 2026 03:50:10 +0800
X-Original-From: Shengzhuo Wei <me@cherr.cc>
To: "Carlos Maiolino" <cem@kernel.org>, "Long Li" <leo.lilong@huawei.com>, 
	"Darrick J. Wong" <djwong@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26aef80f2+e78aa1+vger.kernel.org+me@cherr.cc>
Content-Transfer-Encoding: 7bit

The da-node verifier uses the larger of the directory and attribute
geometry limits, so an attribute node can pass verification with more
entries than its buffer holds.  xfs_da3_path_shift() can load such a node
without passing through the lookup path's geometry check, then index
btree[] beyond the buffer.

Bound the count against args->geo->node_ents before indexing the entries
and report filesystem corruption if it exceeds that limit.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Shengzhuo Wei <me@cherr.cc>
---
 fs/xfs/libxfs/xfs_da_btree.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/xfs/libxfs/xfs_da_btree.c b/fs/xfs/libxfs/xfs_da_btree.c
index faf88488265c..88788ece69c6 100644
--- a/fs/xfs/libxfs/xfs_da_btree.c
+++ b/fs/xfs/libxfs/xfs_da_btree.c
@@ -2242,6 +2242,11 @@ xfs_da3_path_shift(
 			xfs_da3_node_hdr_from_disk(dp->i_mount, &nodehdr,
 						   bp->b_addr);
 			btree = nodehdr.btree;
+			if (nodehdr.count > args->geo->node_ents) {
+				xfs_buf_mark_corrupt(blk->bp);
+				xfs_da_mark_sick(args);
+				return -EFSCORRUPTED;
+			}
 			blk->hashval = be32_to_cpu(btree[nodehdr.count - 1].hashval);
 			if (forward)
 				blk->index = 0;

-- 
2.47.3
