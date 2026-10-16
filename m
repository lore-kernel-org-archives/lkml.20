Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC5D48DB54
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792176485; cv=none; b=G7krIj+dUBW7JhkGlxai5sjoTbyJ4wBUqxfZGuB8HaOSEnDxLUeARNkTyKwXg8utBTpFfawcMv0u6SiCbir/eGEpdeWZiFnxVMWTfhFEfdJ3OkTYmiWttVrA64TDWhH/3kj6sfDzEpxxuyL7GnzX2e8YZG7V5zjaH4wMDHEj4pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792176485; c=relaxed/simple;
	bh=/mlGGUmh4imtXySY7AXdz4KuC8XMU5x8T9TuD7xZIic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MG1DLVJiuFlLXR7QpjR5BeD/KEMvw+6UMJ1XdywNx0k6Q11mJUIfuGy8PiPUOfurIctHC6zCe3UI3YFc0j+cUf/mMRUKjZtPMGPZ6VIz3rQrJMbX2qHVUNjTNEyemKJsmbCdNqi3Y01U8qUaddWvA3WuuBnt0n+y1nCCJSddorg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=U/cDlfZZ; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="U/cDlfZZ"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35aa0cf7c40so207081eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1792176481; x=1792781281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7HjfQVA5Ug4OqWpNl1Z5zod/bI4WrApAYRfZdU17cg=;
        b=U/cDlfZZcXsv84cy5ctJHrDSAaBCJFigmr7NBBo+tmYyo5xtvW3VMSAS4CHNjYawVm
         kDWZKPsqkyXXwgAd9WDxr7PhB/zsymSp+gIwWIqEB6IpJ4UVy9p4YASucP6/ieTYACm5
         nMH4zxt5lKtbU86Ea4FYREhu7193K/VSpASkbpmLOIX+RnyLFgUkaaQ+IwLJuhUcK2gW
         dPqmRIyvp4zClnN3Jbn3W2NY9oHa9J0HNmjZlFLN+TjAkaRXnLRek2YVfAxPRpj1CRZg
         pvMzcJE0BrmnSprOiWzsZjLK1d9XwGV3ed1lcMXIQpbaNpbU9TGI8ByFNXaOkcenNy7e
         gPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792176481; x=1792781281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s7HjfQVA5Ug4OqWpNl1Z5zod/bI4WrApAYRfZdU17cg=;
        b=Y2jLnzlQvpa88bmx+7/DIfH+j6+vM08EsZrd3TamxzylCCGMZpKmWEFIhYP6R+s+xV
         BisaSVAAavsTyyiKPg2rLYRxm7vCvJsPkNxYlWHThaI+r3iEcY0UGVw5ESUCeR7spHZB
         RA0JEgGfAgWWOBDXpFeoWmrIl2U8XzBR2pNIfyn00n5aH/BIYw/rZ5Gu3ICO++3vZeev
         /MJ95ps77vADy28/jTxQZBPUksSwepZNkd0Y+HXQ9S5lql5pVHWPLd5g5O7POVGuz9SE
         iJXr5Ul78ny9Sh0WKYc0H+tfOXTJmspmxprAHhSQQ8SJmN4biuyHO4GzO3h8V8ilyPSp
         Nh0w==
X-Forwarded-Encrypted: i=1; AKwUvBz1+lw9GKwgP6amsWnHf6uHNWggU2NwrsuuBmo2rWRVN2Q+P61nCBIyqfS00iH4sf/245J19G08Pcty2HM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZ9CuErrW/qhuI2267YN0RxLaI9fgs1fNku+CBOuVPyLQtzpxl
	Sjf44/cO363bwdAEORFtlQJTog9X0hv9orrpNDdPt6gjqtR4w05UNhDjaAquzZYZwb4=
X-Gm-Gg: AYBFou325F9Y/4CmfKYlfvoimlOab58tRBhIRXPPIyXt8ppJ/truE5ZMWvMmMwoUrh8
	b2yjsWmnIwcCny/9hkpNRlCNTfEAuc5fF4mi6E+b3sPg2RubDTtvrtOGFDNiqP+k5TDV2zenUI/
	AA8/9BL2Z/Qp9VOuTjIHtHlUznf2N1A7Lozu6/zXJjco6Vxvac0yIwBjao1jSOX82jxWHbKtzdw
	httwv6P0e340GZpPdPh7kBN9cHzKbI6gcWLHmWiP0VCfuqqIsKnn0Wox/9WljIQCy8M1Xj+J96C
	sxeLY+iLVfH+rUm09vt+D8EWapnZtJS3SuEy2yRuuYcb318mItzEnZXIUsFXpGppVHenePlO783
	/dryG26AflOLjSAjp+eZyKrl16TttL5tO7FekEAmyi0igtM/+8HHGMBj4fkDWuSaI5A5grWiAuH
	Wgn2vZQF3viFZsY0iqVcLrxwSVgBLIYcc8nbqJ9cAJ7Gl9uqk7QaCzANTD7TEHXzO22skI44Zhl
	IlktegKvOzzRFWOY56vvYfD7csfB9i32xDI6jnfGP8oXUfdR1xR2hgWddMDdZ4YHX0Gqqc=
X-Received: by 2002:a05:7301:380a:b0:35a:ca1e:4d82 with SMTP id 5a478bee46e88-361a1c50083mr999407eec.20.1792176480952;
        Fri, 16 Oct 2026 11:48:00 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:85ee:eb9a:5637:424d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082784ec8sm8004502eec.22.2026.10.16.11.47.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Oct 2026 11:48:00 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: axboe@kernel.dk,
	kbusch@kernel.org,
	kch@nvidia.com,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6.6.y 2/2] blk-mq: reinsert cached request to the list
Date: Fri, 16 Oct 2026 14:47:53 -0400
Message-ID: <20261016184753.27189-3-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016184753.27189-1-artem@trailofbits.com>
References: <20261016184753.27189-1-artem@trailofbits.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Keith Busch <kbusch@kernel.org>

[ Upstream commit b051bb6bf0a231117036aa607cadf55be8e63910 ]

A previous commit removed an optimization out of caution for a scenario
that turns out not to be real: all the "queue_exit" goto's are safe to
reinsert the request into the cached_rq's plug list as they are either
from a non-blocking path, or a successful merge that already holds the
queue reference. This optimization is most needed for small sequential
workloads that successfully merge into larger requests.

Fixes: dc278e9bf2b9 ("blk-mq: pop cached request if it is usable")
Suggested-by: Ming Lei <tom.leiming@gmail.com>
Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
Link: https://patch.msgid.link/20260526153531.2365935-1-kbusch@meta.com
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Assisted-by: LLM
[ Backport to 6.6.y: Reinsert with rq_list_add() on each of the three
  target preparation or merge exits; the target has a single cached_rq
  list and no shared queue_exit label. ]
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi,

Please consider this backport of the corrective follow-up for
CVE-2026-64017 to 6.6.y.

The backport reinserts the cached request at each of the three older
preparation or merge exits. See the bracketed backport note above.

The complete fix is already present in 6.12.y, 6.18.y and 7.2.y.

Build-tested as part of a cumulative 6.6.y series on x86_64
(allmodconfig, CONFIG_WERROR=y).

Thanks,
Artem Dinaburg

 block/blk-mq.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index 1ad77737b27d3233489b4d9f690c9e6ab77d2130..e3fb9222c5ee00c1fa2105e1194d5f9eba831092 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -3024,16 +3024,16 @@ void blk_mq_submit_bio(struct bio *bio)
 		if (unlikely(bio_may_exceed_limits(bio, &q->limits))) {
 			bio = __bio_split_to_limits(bio, &q->limits, &nr_segs);
 			if (!bio) {
-				blk_mq_free_request(rq);
+				rq_list_add(&plug->cached_rq, rq);
 				return;
 			}
 		}
 		if (!bio_integrity_prep(bio)) {
-			blk_mq_free_request(rq);
+			rq_list_add(&plug->cached_rq, rq);
 			return;
 		}
 		if (blk_mq_attempt_bio_merge(q, bio, nr_segs)) {
-			blk_mq_free_request(rq);
+			rq_list_add(&plug->cached_rq, rq);
 			return;
 		}
 		rq_qos_throttle(rq->q, bio);
