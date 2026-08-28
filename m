Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972EF299929
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 19:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787945483; cv=none; b=rRamp3h/P8Oe8nspypnBxhKjs/5EbXEdltquQPS3RmKmDEpH/0Y3fvkiq8zx18ZFwGqFU41XpiK6SqDKEyQlRHIOJCHwwH/V5f6v2erwQSjtNnFmtZWDZMc8t3p8asdnjkNuSHom8N+GEJshjvQKqUBf7nyKekskzlV7V0SECD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787945483; c=relaxed/simple;
	bh=zvhMgF3sBGyWoxcliuQzMGlGAhHyjr7oIgNIMxF3u74=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=csCBHKD8W0dIR9mPVrlMLPIb+eWovuzDz2o90ReVQdeYiRQYtZerGuhWSd5kBYaokBJw2GPFwxrJEkjXL5gmNuQ1mzhU9wowRhppSMkF5y1Y4jfq87garGRNjmbJ+Auv1nphuBa24dYpeBsCo2y/1pw1g63qe53M/3FX0KMRVnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=TMiV08qB; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="TMiV08qB"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51c0c45c580so9395511cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1787945479; x=1788550279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nMnYqxHda9Omu8fyzZqn9y6ZJM5HBD/zXzNZf075neA=;
        b=TMiV08qBXEgA+TZEA0oLOp1AJv8mYu7aG9y9jdfTjBhRbed2c1CE2TLsOzrryFprQD
         IXKR5k2ZpfWXtNMhMRS1jXMOiL8RafI2ZX0R6ET6eInVJWbCYCcvXI0sDBY3fsfUh5CD
         23b+iRMYWZC6piajOPBzEpMiyZ3I1n+DGD0tTCF0i04Wi7pF95Uvj0BkaONegFArgFZV
         Iqo7AB7GEyYcgMTOAIcPX+DL95IYQhGNjiqZP3aQdmW+jhEjKYcE8ir+BqdL2QDXI6Ek
         k9hoRMEM+oySQShLQHFgYn17AaLbtPCo2L7vj5msat8VW4EIk4gZUYbdkYZCCAmHmQVc
         u3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945479; x=1788550279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nMnYqxHda9Omu8fyzZqn9y6ZJM5HBD/zXzNZf075neA=;
        b=Yd2MS1cK/mfBjmXk2jCvDyLTD58Dw8RbZUvKv8CECvD8BqPyVtkwQ9cnPvkoU9JJkP
         KUnlqAE7ixdXwbx57QmXqwr12LJagyDH4vgvRW5PZW/PWSnd7db4XgYNgGOZ5Pxdyy6o
         wrCU0b6J4K3pOWaLAuvHJbl91WRPHYLR6iZtru1VZ14YBE+WQwsXjLmLYybQE+y7dlDz
         I67pF5PfiVo78KrT2PE3M1O+3WGRNt+r6/BlauVp8a87yk//y8tYt/Afnyebww4fahXq
         2YavbTgyTPDutZAJgnphh3rquqsE/yyAqSO7M/B7pr8kEe1GlrnTFuAbj8lrOvwU++9+
         hFNw==
X-Gm-Message-State: AFuF++nHp490LBjHV7ObrrwBaOjzu9YmUc5epmRtwBKflKisQ9nlvJc0
	gtiLZb4cUGzq3eQHEDTUJVyVl9ACJwCjaWAAqpJRTLVapoXxD9yT70O5hJorqPmxe3c=
X-Gm-Gg: AR+sD11rvz+EyLA7dQfzrJOuN2muYgA1D7uwC0KXNTHWuprmkXwRR0GWkoiVgChUVb7
	9eN24bR7BelbaLKyKpX6VOZPSQs/3OTi1arHFG7VH9lph4GFofLx3n5/wUHo5eg3En2+N113Jd9
	86UKynL202Mg3mFK2cAWlv7zHdlI/wr7OCG/JUGCExvwM6Y4dKD47W6WEz/z7QELv7FsEHBjTA3
	GMV6Yd/bJrE6+ASOVmcg/E7Zi6IPgCP2iXymIe2n07bFiko1/CkdVg4EarufeHq44Ucx5NxUzM9
	4Dheot0Jrd3KTnLr5OT8aGu4KXkKGbngvZ7md/onQeady0kLrD2NKlOTNzGdloabrVJmOMoXrSK
	Fxy08vc/7n6YGnvmYsfo2pDs5xLOihzGmsSrqewI3SWR493JZe/jmQ3SjbHchYlc++6kEyE2+hs
	sTMC8Z4e8NOr8Yq+p+d3zO059/sOiXB2MmFQJ/FzkJQyh7q1ODd7zegMukE9JNTyL91px7x/khu
	UOOPRgUpkL98WULJ1YCqbq7EfzYnk6osCOi4TwNbAzrTlEG6w==
X-Received: by 2002:a05:622a:394:b0:52d:8854:3e61 with SMTP id d75a77b69052e-52fb94b8f4fmr119108521cf.22.1787945479239;
        Fri, 28 Aug 2026 12:31:19 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52fbe5824f3sm19048831cf.10.2026.08.28.12.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:31:18 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	urezki@gmail.com,
	chenwandun@huawei.com,
	Chelsy Ratnawat <chelsyratnawat2001@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mm/mempolicy: take a cpuset cookie for the interleave node count
Date: Fri, 28 Aug 2026 15:31:11 -0400
Message-ID: <20260828193111.1023497-1-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

alloc_pages_bulk_interleave() counts pol->nodes without a cpuset cookie:

	nodes = nodes_weight(pol->nodes);
	nr_pages_per_node = nr_pages / nodes;

nodemask_t spans several words once MAX_NUMNODES exceeds BITS_PER_LONG, so
a concurrent cpuset rebind can tear that read and yield an empty mask even
though neither version of it was empty.  The call then allocates nothing
and returns 0.

Some compilers will hoist the loop entry test above the division,
because nr_pages_per_node is dead when the loop does not run.

	682e:	call	...		<- nodes_weight()
	6838:	test	%eax,%eax
	683a:	jle	692d		<- nodes <= 0 skips the loop
	684a:	div	%rcx

So in most deployments, this div/0 is unreachable - but nothing in the
source guarantees that, it's just not easily exercised.

Take the cookie around the count and bail if the mask really is empty.
Only the count needs it, interleave_nodes() takes the cookie itself so
so a torn read there is already retried.

A rebind landing mid-loop can still leave the count disagreeing with the
mask, so the loop may revisit a node or skip one - but a rebind where
nodes change causes migration, so a handful of misplaced pages isn't
catastrophic in any sense.

Measured on a 72 node VM (NODES_SHIFT=10) with a cgroup v2 cpuset flipping
cpuset.mems between a word 0 and a word 1 node set, and the two word read
artificially widened: 330 zero counts in 130414 calls without the cookie,
and 401 retries with it.

Reported-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Link: https://lore.kernel.org/all/20250907160829.91628-1-chelsyratnawat2001@gmail.com/
Fixes: c00b6b961099 ("mm/vmalloc: introduce alloc_pages_bulk_array_mempolicy to accelerate memory allocation")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/mempolicy.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 79053ece02cd..060a0eb26917 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -2592,6 +2592,7 @@ static unsigned long alloc_pages_bulk_interleave(gfp_t gfp,
 		struct mempolicy *pol, unsigned long nr_pages,
 		struct page **page_array)
 {
+	unsigned int cpuset_mems_cookie;
 	int nodes;
 	unsigned long nr_pages_per_node;
 	int delta;
@@ -2599,7 +2600,16 @@ static unsigned long alloc_pages_bulk_interleave(gfp_t gfp,
 	unsigned long nr_allocated;
 	unsigned long total_allocated = 0;
 
-	nodes = nodes_weight(pol->nodes);
+	/* count the nodes, retry if a rebind happened during the read */
+	do {
+		cpuset_mems_cookie = read_mems_allowed_begin();
+		nodes = nodes_weight(pol->nodes);
+	} while (read_mems_allowed_retry(cpuset_mems_cookie));
+
+	/* if the nodemask has become invalid, we cannot do anything */
+	if (!nodes)
+		return 0;
+
 	nr_pages_per_node = nr_pages / nodes;
 	delta = nr_pages - nodes * nr_pages_per_node;
 
-- 
2.55.0

