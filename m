Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833874;
	b=czCNZBY/sgLKM1FGdn7EhvqgISfSHdYNhhDOxaT73SWB3HHGC835LFo3Y4Pg5XewdgD1
	 pY/FbVbFLdVayWBTw9BmXnRSl4GcxW8AqzSeaGehHmGsloQdVKdoAMzLkj9ndO5KhYsSG
	 X+hyiIcxhB0EI2o4rcHxzsf6PLXOKs96eIG2ojl5peHegCG4lhyIiwbvwI5tAhrrXKuiC
	 bG7HrX6uOigqu3lVkps62xI7YUYKs2U5KMNpH07IJZVsF0IkfkOhNXhL8xs/mAL0RZjNp
	 0YxhvbhxugyZn9qqWySo+OcFbQx3iHxhLSggXTB+uzzr1q1bCUGJfMwLQMWcBNPcYpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833874;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=TsTyimfgSelk39crerZNvaF9T4v2I7XDePVLGlngt5g=;
	b=fNP32k8nu7gx6+SlcA0cvJ0TBL7A8p6kkz+bVds2JxutzYpA1rffkSpKdQGogeANo5lG
	 Qv0AQGDaa3Da0CZuWrSw90Vxdv+CUy70KONHGWIuPLY6e6AlFS6BtbnqGi9qKtwHnco/U
	 qwUK7PgJ9HFO0fGw77OHRMNXbaOgql4XgCaoFp6Z3jVaX4leFPNnYyZC+NE/9MFsp0yZn
	 Gb5n2Zjf5jpO2dYC0z4YTTbNFG9BlWIFlxmtO8rxR1CKz9amRL4Sb5KUsBXcYrc9XqydF
	 LvDsU1IaWsu2H6iANjJEgMMD6Nae38FCpca6FpCgghDAEAYsC8ekQ/1SoMFzpKyl8RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=coK6FDBj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6C4606A332
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=coK6FDBj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927181F000C4;
	Mon, 16 Nov 2026 12:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794833874;
	bh=TsTyimfgSelk39crerZNvaF9T4v2I7XDePVLGlngt5g=;
	h=From:To:Cc:Subject:Date;
	b=coK6FDBjSQCexsufKWa+V/+QvqGizRobkNju4/BIVo7zCXD9wskVZgYR7cN441tr9
	 qLG9xMnmLcNBqnEMBLW0ND8gAIjbFLFF3rWZ92rMgxHbyBCAdv9NVrMWF3eWTneukG
	 Ps4oFVIl2W1007SA32gpMyAcVEsn5XL0K0oYzaSPUAaydS2UvM34ghTvQq7aru8p3z
	 6iU/RjXau1DS7wFbjJv/s2o02MzEIOOzbRMoKe93fiEfETYwJ5IFfmZGWDDTFRaMRG
	 3heHXdqKLa1peWDnfn4EUnCt9n4uzKpXsVXF5CIxKlga6+2Lcv0rT2tEI6rwKzvyvO
	 Iil+nl87vvhXg==
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.ams.internal (Postfix) with ESMTP id EAF451980052;
	Mon, 16 Nov 2026 07:57:50 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Mon, 16 Nov 2026 07:57:52 -0500
X-ME-Sender: <xms:zv36amM3gxpSsAWlJWbHuTzdT8oEiqIOhgSGmPo_m7Bud-e-yhOkpw>
    <xme:zv36aop6q7Qg2aRrEO9Ug5P5TPYUs56mIiq8s4K1y6RfOVg2VdORtbQZeB55WqR-6
    REQrg6iVpHY7saWDy6bo6CMSebRMjzaDUiA0TF7EsV9HIwp_pKs-CPN>
X-ME-Received: <xmr:zv36al52ymfp09CI53Jno0AXyVG5zawQrpX4i0eL01UXXyHganDPxu_N74g>
X-ME-Proxy-Cause: dmFkZTFkPa8woIDg/X6mZIuxiJNygpeOlX0xHBonwxlWn2dHiWS7GTQb73NJEmZCvOEauV
    y9UXL8D8o+EGdIeCqdLvB2MWcS/z0ptvWxocqauR+x8cK7qpd/IkoPzSQJVwCwfviuE1vM
    tGwysxRFG5mg25AQnzozv2olC3W7wkbTK8L2XQmvBdDGsYW8DgrDV0m4Xt9NJQaLjuEFem
    V0zIBT3OUC5OQoRGiQ8/oAXMtsNbzgSo4XZA+sXwzFC8jlfLuLfsfVtAC2dSg3x0HWVa7G
    t3hyak3PfNiaJZPUohnKhuju5/58WFjO109ixBJLnMykluVXoQCssPFXiQdzqFTIF0kiqM
    LqnR4tTmbm0GfiAuHnHBrG4gOp3PNqcfZS05DQkBxBINUUj8nir8FE5M8ZE5cevoBoMyu9
    HsQrUkUunJSj/aFvgAkH/wPptQ74K1echw7UaANuVfXuiE5PH0tsEWE+X/OgIAbKPu7clJ
    guRpHSoS8Z0PZDFjUgW179otp9aNv60AJoAlulsQyR+9SyZ1N2cQbH859Zx6z+7z0fkiJA
    fuWHpFjjoqAFZfoXCzi/GBBrkCuS3/eohMoJs7jBtrL+gMGc/2+je5m5MOI5lR9kFs4xCf
    dbhrMT3DElNmanAGPhWg3jQIEO5nbj6D5+AntpRmEPVIal2GXDNRuGruUfcg
X-ME-Proxy: <xmx:zv36aoEhterZ2mOfS6SxgVCKHNjSoN2XvWukChqmOB6h6gSpJyrAgw>
    <xmx:zv36av2xj4tiLyCoxMM0SI6xacgR_GROqlMRy76H3YkdTjzwouvsTw>
    <xmx:zv36atpVcp-nEieFurpcvI9TdXahifzEICzHiLOPLBfVPBA5watyHA>
    <xmx:zv36akP9Q7D9LBZf_LhZUariZNWLE05mxsISposr0XKVNMJmBOrV1Q>
    <xmx:zv36anWHIfc17rLCcSeG8zc17voFZ8MsjQG3JaW5ui6ZA14uJMFpOLwf>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Nov 2026 07:57:49 -0500 (EST)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Mel Gorman <mgorman@techsingularity.net>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Dev Jain <dev.jain@arm.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH] mm/compaction: do not skip the free scanner's periodic lock drop
Date: Mon, 16 Nov 2026 12:57:45 +0000
Message-ID: <20261116125746.2897395-1-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
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

isolate_freepages_block() drops zone->lock, checks for a fatal signal
and calls cond_resched() at every pfn that is a multiple of
COMPACT_CLUSTER_MAX.

With a stride above one, the scan steps over a compound page, or over a
high-order free page it has just isolated, to a pfn that is not a
multiple of the stride.  From there it never reaches a multiple of
COMPACT_CLUSTER_MAX, so the rest of the pageblock is scanned without the
check, possibly with zone->lock held and interrupts off.

Count probes instead, and check every COMPACT_CLUSTER_MAX of them.

Fixes: 4fca9730c51d ("mm, compaction: sample pageblocks for free pages")
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/compaction.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/mm/compaction.c b/mm/compaction.c
index f1b2060eb201..4465c1551406 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -579,7 +579,7 @@ static unsigned long isolate_freepages_block(struct compact_control *cc,
 				unsigned int stride,
 				bool strict)
 {
-	int nr_scanned = 0, total_isolated = 0;
+	int nr_scanned = 0, nr_probes = 0, total_isolated = 0;
 	struct page *page;
 	unsigned long flags = 0;
 	bool locked = false;
@@ -599,13 +599,15 @@ static unsigned long isolate_freepages_block(struct compact_control *cc,
 		/*
 		 * Periodically drop the lock (if held) regardless of its
 		 * contention, to give chance to IRQs. Abort if fatal signal
-		 * pending.
+		 * pending. Count probes rather than pfns, as the scan does not
+		 * always land on a multiple of COMPACT_CLUSTER_MAX.
 		 */
-		if (!(blockpfn % COMPACT_CLUSTER_MAX)
-		    && compact_unlock_should_abort(&cc->zone->lock, flags,
-								&locked, cc))
+		if (!(nr_probes % COMPACT_CLUSTER_MAX) &&
+		    compact_unlock_should_abort(&cc->zone->lock, flags,
+						&locked, cc))
 			break;
 
+		nr_probes++;
 		nr_scanned++;
 
 		/*

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.54.0

