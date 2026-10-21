Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583289;
	b=KeLNSE3rggtMCZ70n40l9MtEKuClMtoS1ajBK+9QIbUyNEIMj9/lGJWnyhawu7DQcU4I
	 jEBqz0KnF2ULXsQQt8hSsT7VyT2uiaKHRPfRJkRBw5Nz6P3z1FaxzuuEUCIxe3hP/tEeN
	 MwYm1zLCvECoUfC2c6oFhuvxJskKcIuc+o/BLIviMXd0fOCE5Atwi9u8PUwLLDXBFvIdJ
	 DXElmgO0dACNzAr1EN5ZbF5gtvwDVHSncibdd5WI0RDi21vcxbEU/ArqAJAf4iH01r+PD
	 UE/kgEIFM0VnnYeDvIpJakUJDjazk2Uo3e9HhNkO0fAtJETi69TdjGnVTI1JjXRgTew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583289;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=v5h8ao2sl0gSDsVo7bAD/bZpeGjj83T87XQIb40RcPU=;
	b=NZKlUlTepZl9GrMJonK2xkcvNx0WBrNtV53TgJQ3vkgPrl1y7rcUSNGOyeRKAzkPTOb6
	 EYCeZR2L64dhNhYRB5MuOZtL/fPFa6VAZ9KEmqibxPYlIVHewv5e4a9pm1NeVQ67fqLgB
	 vXcqmBW7N+riUTsR/giq4LrQABK5q2xb1LZaO/A+IwubdXxXmta6DH6jqdb1NIeQX/iEQ
	 ZA/xOJMeuiaaG73yAIvui06TUZva8wY5AZmdIUOuEC0hOJJ6DwPFoI50B/wBHSNo6yyTc
	 xTPfUtblVUam4S4dGFHM+C4gd7bbYShjRZtzhmaJlyHJ7wWVPdMkoCFqz9Pk4V6QiKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VAQEqFAq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF5960A2621
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VAQEqFAq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DA461F000C6;
	Wed, 21 Oct 2026 11:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792583289;
	bh=v5h8ao2sl0gSDsVo7bAD/bZpeGjj83T87XQIb40RcPU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VAQEqFAqztqAv3qcxYHFlzZ1jnwzQHztkQm2Ku6wB0q3Zn6zx9WSz/DftIPSC4uQW
	 UQEGhZzE8CTFEjNhoxKw6waO8eavv3OLCCMKLx1GMsRQ9ICbb+Mox0wzsrZ1867sBL
	 aruuh8VMrFgTIUoyxKK4IXRW4dLn158hDVknl84KDCH0v2DbNKnSO/snpqe1npTURl
	 GRaxsmZQIx2WoRZi/tK+3tf9KSujh1BQnvJPcZk4NjeHAeE5TaNft5yEaxTDGnru43
	 KMZoUuUMx6pEJeQlPxds41+IXvnl0aoR1n+LeH4ZuyqzqPYAlaVVAINqpFtQKt6k6I
	 FLmCIoTGX4RiQ==
From: "Harry Yoo (Meta)" <harry@kernel.org>
Date: Wed, 21 Oct 2026 12:46:53 +0100
Subject: [PATCH slab/for-next 12/14] hostfs: specify SLAB_MAY_ACCOUNT for
 inode cache
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-memalloc-prof-dont-waste-slabobj-ext-metadata-v1-12-096800aa3330@kernel.org>
References: <20261021-memalloc-prof-dont-waste-slabobj-ext-metadata-v1-0-096800aa3330@kernel.org>
In-Reply-To: <20261021-memalloc-prof-dont-waste-slabobj-ext-metadata-v1-0-096800aa3330@kernel.org>
To: Vlastimil Babka <vbabka@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
 Shakeel Butt <shakeel.butt@linux.dev>, 
 Roman Gushchin <roman.gushchin@linux.dev>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
 David Rientjes <rientjes@google.com>, Muchun Song <muchun.song@linux.dev>, 
 Hao Ge <hao.ge@linux.dev>, Pedro Falcato <pfalcato@suse.de>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 "Harry Yoo (Meta)" <harry@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, linux-um@lists.infradead.org
X-Mailer: b4 0.16.0

hostfs inodes are allocated with GFP_KERNEL_ACCOUNT. Specify
SLAB_MAY_ACCOUNT when the object may be charged to a memcg.
__GFP_ACCOUNT without SLAB_MAY_ACCOUNT will not be allowed.

Path: lookup -> hostfs_iget() -> hostfs_alloc_inode()
  -> alloc_inode_sb(sb, hostfs_inode_cache, GFP_KERNEL_ACCOUNT)

Assisted-by: LLM
Cc: Richard Weinberger <richard@nod.at>
Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-um@lists.infradead.org
Signed-off-by: Harry Yoo (Meta) <harry@kernel.org>
---
 fs/hostfs/hostfs_kern.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/hostfs/hostfs_kern.c b/fs/hostfs/hostfs_kern.c
index 7add056d47d8..2d55f53569ca 100644
--- a/fs/hostfs/hostfs_kern.c
+++ b/fs/hostfs/hostfs_kern.c
@@ -1078,7 +1078,7 @@ MODULE_ALIAS_FS("hostfs");
 
 static int __init init_hostfs(void)
 {
-	hostfs_inode_cache = KMEM_CACHE(hostfs_inode_info, 0);
+	hostfs_inode_cache = KMEM_CACHE(hostfs_inode_info, SLAB_MAY_ACCOUNT);
 	if (!hostfs_inode_cache)
 		return -ENOMEM;
 	return register_filesystem(&hostfs_type);

-- 
2.54.0

