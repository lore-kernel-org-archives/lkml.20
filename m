Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAF9517BB6
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789749303; cv=none; b=avg+JXV8OTm1/8K9yZn1vqEzt8AQSZ4oWuDDiht3uHtGzQ5WlyvOA+D9Dxw0mAyQqgDXWaob+g/gWP4EYtla9uN8cmHeVJ/qPxHZ3gzMlmz/U3RlTie49G4MpOnZupRqm0YgtEImUx+Q+gRYnXBZq8baCNeN+iuUs4JGGpWHnVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789749303; c=relaxed/simple;
	bh=v/DCBt0xJd8L6NUDQAFMY5940qJd6efWTNe1uMs+j9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=FCq6E2xXQk5MFbdvC3g1fJZ0Bagckgwdec2rnD9Y6xv8AwDy75Nyi4ZF2PW4kp5oiABc4FEgirt4XM85DvhXOHGk6gFoBXkemMNG9YfPS1KqlmIE/FxVCSPfl6Tqe1XjnmrHDeXFyOkcT8nYgVdKUt0O18uN8z/9fNZYZpYDDaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aHA52z+S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aHA52z+S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A14891F00898;
	Fri, 18 Sep 2026 16:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789749301;
	bh=m09ebYKn1lSLhUp2MxWN15CMX1SNCzhrYM9zCXuJyOQ=;
	h=From:Date:Subject:References:In-Reply-To:To;
	b=aHA52z+Si2AXUZr8Qi6/m8zhny9+Jiuro9jIf7og39Wb7b+Q2YCPDu7s82D+opw2w
	 ACHOIVWCmQu6WnXWtxxGwYQ7kDFvUnH6JKq46ABFrJLCRDqGL4gIGzGfWSzBGABRkv
	 ZIHUWXzSx1jTh1iMqCLIgQ2G8uj/irxwdHb2u6f/+bEk3gWhYwont1y5xnmwLwFbxU
	 R84LFGqVGRwhaL1/4Idb11/+187MMsan/fIdj5Rh+tIagE2pG7+D3tk5bPPWsm6pH8
	 wjtLsgU0WZ09RonMdL0aeWDQEbt+6XYzo7JICgCx5OiagnUTBgCcffplqxedivpv87
	 FWVwtHq6SqyQw==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Fri, 18 Sep 2026 18:34:26 +0200
Subject: [PATCH 3/3] MAINTAINERS: make Gregory a co-maintainer of MEMORY
 MANAGEMENT - NUMA PLACEMENT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-maintainers-mempolicy-v1-3-9a94cac6d135@kernel.org>
References: <20260918-maintainers-mempolicy-v1-0-9a94cac6d135@kernel.org>
In-Reply-To: <20260918-maintainers-mempolicy-v1-0-9a94cac6d135@kernel.org>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
 Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>, Gregory Price <gourry@gourry.net>, 
 Rakie Kim <rakie.kim@sk.com>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=870; i=david@kernel.org;
 h=from:subject:message-id; bh=v/DCBt0xJd8L6NUDQAFMY5940qJd6efWTNe1uMs+j9k=;
 b=owGbwMvMwCF2/OVpCdfQ3ZWMp9WSGLLWZqg4x9wVVpkzN+rAtemtRWlesi/1Xs+68HNnV0FtJ
 6OutnpaRykLgxgHg6yYIktQ8H2Dly/X1Va78THDzGFlAhnCwMUpABP5OI+R4VRInLjHpsNrdV9w
 c9uc3LRn9fJulXfPD2c017Z12D5nusnIMGNRb76ayhRbLYu6dQl++VxRU2ddum4nnD39eovo5K2
 buAE=
X-Developer-Key: i=david@kernel.org; a=openpgp;
 fpr=1BD9CAAD735C4C3A460DFCCA4DDE10F700FF835A

Gregory is extremely familiar with NUMA placement handling and volunteer
to help co-maintain the numa placement bits. So add him as a
co-maintainer.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 344875eefd175..2b99a593436d2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17298,10 +17298,10 @@ F:	mm/numa_memblks.c
 MEMORY MANAGEMENT - NUMA PLACEMENT
 M:	Andrew Morton <akpm@linux-foundation.org>
 M:	David Hildenbrand <david@kernel.org>
+M:	Gregory Price <gourry@gourry.net>
 R:	Zi Yan <ziy@nvidia.com>
 R:	Joshua Hahn <joshua.hahnjy@gmail.com>
 R:	Rakie Kim <rakie.kim@sk.com>
-R:	Gregory Price <gourry@gourry.net>
 R:	Ying Huang <ying.huang@linux.alibaba.com>
 L:	linux-mm@kvack.org
 S:	Maintained

-- 
2.43.0

