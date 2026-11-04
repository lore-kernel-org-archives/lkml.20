Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787815;
	b=veRLgcf9XQHqsfZoMdj6dP2/kyfJN5SvXOVRgUcb4L9R4xECnCW3yp3ucEbvyRZAsI8c
	 rNOqt/rSP2Mf08xKTC+rMoO0gZgy8sCjcpyrKI9xl0dqkC953HXCn28vFwnro+odnIrem
	 Pe/csAT0Xs1DnAK1BMc6qoLDDGvXKOOiPaMvmMUxQVr/llZXqyZ2wEzad6Uc7JxBfEXHZ
	 ntAWlBwkyPwTMS4wt+8FO/KO5MT2LXjdYzVu/2R5kCxziNEx8DfilvalaXwx7I0v9Ziop
	 4MyIKnjdjf8yqMv1F5LuqdLmJoqD3CJMoojEOPkhVK9vy6seRsuIvYspHLIMhJvkIwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6V1X+zEwxVrSk2M8OWKn6u4m5FeW67/2ByAIN+CIG8E=;
	b=TDJ8zQjwb42fJdrCTYkPe9f0y1d9MEiSdRJywG6Wj1ZgUD0pxgrQCpLGCc1Fdme+DZAU
	 0MlVGum/KpBaCmHojw2pfok83NWx2hZqnCFmxWLa/e+dJS3iNt71Ao1XIgzQ6ra5EujYK
	 znSYH0fNGThBwJLjoVpd7HqaJlmpBgqxSwNblXT2k+hRVVofCMNdZp7AFkB3Bv8oFYrfJ
	 6cvmAXv18ubtl1XnIuuT2PN30zuJfF/iQRbYYU3PjY1F72I5FnvJ+ZScqub3Jc808by5T
	 Pf79Q3O/P0ML8aJtP5w8pdQOXNZ3SZjb/7qm9MadpjH/HrYcYpxeGAzuMlMc3PQEUUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asu.edu;
	spf=pass smtp.mailfrom=asu.edu;
	dkim=pass header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=ovQpCv1Y;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B41606D80C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:23:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83B41606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=ovQpCv1Y
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b1ce85287aso480914c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1793787815; x=1794392615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6V1X+zEwxVrSk2M8OWKn6u4m5FeW67/2ByAIN+CIG8E=;
        b=ovQpCv1Yd3F3Ez7FT7UDGlpuRK0xtieYSxdVD96HrhGiS6qRLcyx2Bhta1ndcosQGc
         b2054tLon11X4O+mTtNkQ/PgBpVe7Sd9RZkLi1Zuru5W4dQLoTvY9jc21B7pRt01A+7/
         Yvu6UkwehbDi/t5dOQ2wNxbcj5KIkUltMhFVeFPFXEV+zkVnOH6JAr3cjDj3fUe/oPy3
         ClVs+lW5pMJr5NGAncfXd9eqVFcARYZO8TWGHv2XAAKl6yFhEAQ2pbb/9e2mIBxNjmpP
         xBzZLfGcSCYM8A04icbRYdIVxdDPWqlMrgCZu4jW+SMd01lnXtPFt9GuMRCORNNoANDL
         NX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793787815; x=1794392615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6V1X+zEwxVrSk2M8OWKn6u4m5FeW67/2ByAIN+CIG8E=;
        b=W3SpCGvePgEyHyvyR7wr8sanJ3a4KjjloNoVUgDnnXzt91npemV03fFYAcKAF+8oTw
         wetwFeL4dIbqJ/JRUx4TugSWtoVR+YZhOzxicb0VrNRopDGmPsCNbYgMnqTO4QhRwyAd
         LvVSR/KYQ9S4RtlE/q1Y8KdL3+yn5sAhvFfO3Fp9KyFI27jenINx2Vq09hTwlJjGVrTt
         +O8r0Na/jVXk2wi5wQtWCMbVCLucK9nBzunKJMYn4bbDrOHfWbcP7VwL4+rfFiHQXdzZ
         0k5uZ4nshq+2eb/UqIrDfZZ9lGgDsd2aVNdAvdp1BHyPsL8kP5GpsuhoZzqWZsvdtSm6
         t9iA==
X-Forwarded-Encrypted: i=1; AKwUvBxr2ChWzjTj6cgT2YSDv2hRfRxzgpBtGtdk5J+wCOvo5q9eY6BIUtPFXlmPKXiAsg5VOQv75FvcZ13xSQU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KATpGu72uIiTRRij+qMctDVO7H536NdDVjZql2iUA86+xVZ1H
	SVei8T1VlPnfoNKxU5mRYtj5VZVkftFn/fIhCy/FDv9eS6gXFm0McqOcqbOwR8vNYw==
X-Gm-Gg: AYBFou2/fI3Ty+h+XlqeimIyxc/28hnoTSkIUJH4ujAEYDGCCGVCnGCDSa1zpSkhl3S
	gKXp6rtagfb+b7CZ0sIyohQSY753O7jDb5IycFi5ZEpvp+nAhpnQgdjEusjBnOpLogGEm+qMIwi
	dE6Sdd0lx1YdpQuKPn4gB6nvh455KoADBul8fGVri+gLzzH6PfxTfz35xcKeY+qzj+ZG+wao2Ya
	fMai9sgO1XntLmOqur1SHYuK1ufl891nZvPJYIGB0ktPqK5yArn1hlEr1HrDncGxZrFj74IPyGx
	Z/2au2nwjTvInBVKZDgih0dTOzFgmCe6G+fav72yyGmNGpMwZI0ofrv6eCtVA3xlMfYldzk5SH8
	hLVD8jdeWyUeh60akKS7+4iIYqmaBruYAq01g3FvB+yaG1nizENe09rzIKso/Xm/EeTMp9yXhl9
	21R4PwamHxwtCuu+xeeRrSdwAdJ48johfZv4DE+rOgma3g7BQzeOjW83zlciwmcugecJ1sikWKG
	aV8ObfG9ZJUnCeZIwOpxsAdIGMTYp3ylqmYBEpc1N4pRZHQNcPe5pHcsN/anvMovfVwTOQLbAHB
	OsdAOE89epFUN5iPL2LIj0UNw6hFEowWNo4kNECAR+U=
X-Received: by 2002:a05:701b:424a:20b0:148:302e:1bed with SMTP id a92af1059eb24-1ac5e8df484mr21795931c88.38.1793787814624;
        Wed, 04 Nov 2026 02:23:34 -0800 (PST)
Received: from localhost.localdomain ([2600:8800:1e00:25f0:ff01:97fc:f9e5:d7e1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm5749086eec.9.2026.11.04.02.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:23:34 -0800 (PST)
From: Siddharth Mishra <smish149@asu.edu>
To: dsterba@suse.com
Cc: wqu@suse.com,
	boris@bur.io,
	josef@toxicpanda.com,
	fdmanana@suse.com,
	mason@kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Mishra <smish149@asu.edu>
Subject: [PATCH 4/5] btrfs-progs: check: count non-skinny tree blocks in simple quotas
Date: Wed,  4 Nov 2026 03:23:22 -0700
Message-ID: <20261104102323.4090290-5-smish149@asu.edu>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104102323.4090290-1-smish149@asu.edu>
References: <20261104102323.4090290-1-smish149@asu.edu>
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

[BUG]
On a filesystem without skinny-metadata, mkfs with simple quotas writes
a qgroup that does not count the tree block of the fs tree:

  $ mkfs.btrfs -O squota,^skinny-metadata $dev
  $ btrfs inspect-internal dump-tree -t quota $dev
	item 1 key (0 QGROUP_INFO 0/5) itemoff 16203 itemsize 40
		generation 11
		referenced 0 referenced_compressed 0
		^^^^^^^^^^^^
		exclusive 0 exclusive_compressed 0

The kernel then warns about a squota underflow when the block is freed,
and "btrfs check" reports no error, because it uses the same code.

[CAUSE]
simple_quota_account_extent() treats an extent as a tree block only if
its key is METADATA_ITEM. Without skinny-metadata a tree block is an
EXTENT_ITEM with the TREE_BLOCK flag, so it is handled like data: its
first inline ref is a TREE_BLOCK_REF, not an owner ref, and the block is
not counted. mkfs fills the qgroups with the same code.

[FIX]
Also treat an extent item with the TREE_BLOCK flag as a tree block, and
take its owner from the tree block header.

Fixes: 5bd97022f384 ("btrfs-progs: check: add support for squota")
Signed-off-by: Siddharth Mishra <smish149@asu.edu>
---
 check/qgroup-verify.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/check/qgroup-verify.c b/check/qgroup-verify.c
index b58ef366..d6681653 100644
--- a/check/qgroup-verify.c
+++ b/check/qgroup-verify.c
@@ -1046,8 +1046,9 @@ static int simple_quota_account_extent(struct btrfs_fs_info *info,
 	if (generation < counts.enable_gen)
 		return 0;
 
-	type = btrfs_extent_inline_ref_type(leaf, iref);
-	if (!meta_item) {
+	if (!meta_item &&
+	    !(btrfs_extent_flags(leaf, ei) & BTRFS_EXTENT_FLAG_TREE_BLOCK)) {
+		type = btrfs_extent_inline_ref_type(leaf, iref);
 		if (type == BTRFS_EXTENT_OWNER_REF_KEY) {
 			struct btrfs_extent_owner_ref *oref;
 
-- 
2.54.0

