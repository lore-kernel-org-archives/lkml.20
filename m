Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69373383987;
	Mon, 19 Oct 2026 11:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410490; cv=none; b=TIeHVUDt3tzlGZYsdy71sA0e4VDlOmBI/er+kAe/5riD2kh8wtMYqBNRICu4gR7ZF4gZxACbZ/rUm8b1GfFW3H8FNYRFzZusH7lvhhYzqxe31/5l6vOZHEB7QUb5vd5JVyIBnmNPPCrI6BBzwQ0HD7CCCqwcf6Y0rwJZT1Dlqdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410490; c=relaxed/simple;
	bh=j9DTdzuMHp6o2ymNuO91s3arRm/GC2Fm9oPBrZ35KvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DJ4wSpa4aLJhfAO3cMr4krUB6MGetltG76o+VGBNfVhWDfKQop6zbkAB6e3uxnX5fyUqTQj/3zHjQpJnAJPSDOeou1t0YR8AJ7Wy+4g+fDkurUj4VfOwmMiHJ/dZkIVf0OR4ZKcXkmVjilND10R299MmrxBpy+vebt1P8BIuj3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CR1MaVtJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CR1MaVtJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD6B1F000C4;
	Mon, 19 Oct 2026 11:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792410489;
	bh=XhZkuF2eR/i1Yi28UvjfvoNq7TSSm4cB7UNJ+LdTcQw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CR1MaVtJ167CuSeKTS3I+2mULrZaj89GmcgdNXb8XNt5hq0auJzKE7aEFP4ExUGPs
	 BMwQOR+PTXgkxgGvdJPpy3Eo2ls+RW968PNMJxrioZCYB43t1+31uQm3sHxyzySVsf
	 +bkwi1QoSdYnZ2u5MmA/+SUQDvvjd1dMA13iEjyQOcamcK1YV83zJXLLl1X3fzXu5s
	 NjY+hD9vKAlygm4LqcR0GC0ngTP8dQDMwiNF7D9oW2sNYU+ST0u9jIUYDRAE1UuYlv
	 IGmVdEkc2u3OtS9YdoxEvMAIKRZ6jBDkxYE2uU740B9Jjih0vbkkdZeHCcZpnlv4RC
	 04N/fTnvCXVOQ==
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Carlos Maiolino <cem@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Re: linux-next: manual merge of the fs-next tree with the mm tree
Date: Mon, 19 Oct 2026 07:48:05 -0400
Message-ID: <20261019114806.1298980-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <f7d2fe6f-558a-4bf6-bf17-00f3842b923a@sirena.org.uk>
References: <arUS5b85ed6L01qc@sirena.org.uk> <arZn0IB-L3hnNniw@cronus.toxiclabs.cc> <f9ddfd24-ee1b-47d9-a906-299421247b1d@sirena.org.uk> <araNBVKW6MXR97P1@cronus.toxiclabs.cc> <20260925141448.57220a7d3f76b92d8f1cb130@linux-foundation.org> <99ec7529-0733-4d04-a30c-d9a2b299182f@huawei.com> <f7d2fe6f-558a-4bf6-bf17-00f3842b923a@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 28, 2026 at 01:48:14PM +0100, Mark Brown wrote:
> There is a fixup in -next already which is hopefully OK, I don't recall
> it being especially bad so probably Linus would be OK with resolving it.

Hi Mark,

The fixup in -next takes the mm side of xfs_btree_split_worker()
verbatim, which puts xfs_trans_set_context()/xfs_trans_clear_context()
back and drops

23f91a51425e ("xfs: fix NOFS state corruption in btree split worker")

next-20261016 still has it this way.

The two changes are independent:

2e6a6ca06fec ("xfs: remove dead kswapd flag inheritance from btree split worker")

removes the pflags handling, and the xfs fix replaces the transaction
context calls with a local memalloc_nofs_save()/memalloc_nofs_restore().
The resolution should keep both. The delta against next-20261016 is
below.

Neither tree conflicts with v7.3 here on its own, so whichever of the mm
and xfs pull requests goes second will hit this. Andrew, Carlos, could
that pull request point Linus at this resolution rather than the one
earlier in this thread?

This is the resolution llminus generates:

diff --git a/fs/xfs/libxfs/xfs_btree.c b/fs/xfs/libxfs/xfs_btree.c
index 6738d9d1511bc..2434c54a35708 100644
--- a/fs/xfs/libxfs/xfs_btree.c
+++ b/fs/xfs/libxfs/xfs_btree.c
@@ -3007,12 +3007,18 @@ xfs_btree_split_worker(
 {
 	struct xfs_btree_split_args	*args = container_of(work,
 						struct xfs_btree_split_args, work);
-	xfs_trans_set_context(args->cur->bc_tp);
+	unsigned int		nofs_flags;
+
+	/*
+	 * Don't use xfs_trans_set_context() here: it would overwrite the
+	 * caller's saved NOFS state in tp->t_pflags. Use a local scope.
+	 */
+	nofs_flags = memalloc_nofs_save();
 
 	args->result = __xfs_btree_split(args->cur, args->level, args->ptrp,
 					 args->key, args->curp, args->stat);
 
-	xfs_trans_clear_context(args->cur->bc_tp);
+	memalloc_nofs_restore(nofs_flags);
 
 	/*
 	 * Do not access args after complete() has run here. We don't own args

-- 
Thanks,
Sasha
