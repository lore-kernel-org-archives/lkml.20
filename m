Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793723149;
	b=LlWx7QP00i2Emg0+FpFoSdtRQKPtdXfkz9vdNfFSOO+QD9Kd/h/GhYVD4tmyOKTJdDmT
	 PM05aTXGlYDhg0IXlEBeVw+jVogI4+b30y6dL0733ym1BbQZEmaZDcMfZDgBaNH/QxOfW
	 YALQQLprbp78r+9faoUUwEqkg2WATGmvqe7noiFJwEjTQwLJAI3FVXITdzvYampVFt2ym
	 N66kjvKEj6Ra2uqGuDCUte0K+HkadcPhOToEZbbBnH5sZ4yYZyCDhnajDk5UJlU6j3+Bv
	 rsuqrPIGCXLby9bGAE872hRVEZh90/e3Qd9vRXiZjF3ENOx3A0aH7vobSUq9FEWr/vw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723149;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=YhFPGq66AAtaFmboYz1uYaKBpqYr/PH8XApnUGdT9oo=;
	b=CAofpyJj3p6Fv1lhX5MM3HSv4Nx3Tx1103aTNarUcVkj4/jwjNlMEO7KDYCMOHfb55X9
	 zkDniHRPuYs76n34X0vMmbcFHGXPN8edFfZp0G/kvQdR8pNbkXHu1qa7ZlNgVi0GMPlRY
	 6QfNPbLrFXq4qU7gWmA614/rg0kPwqPo6vG0TojsrlAiXYJdOZFptEiiaegIMww+md96E
	 e2ggIdyPcXo/ef19a3ZOaR5z+zRflIT6R5ygscHVXURh/0TDmVY96N2ej1JQTlNnk6Mn6
	 uGBUp/INDBUnIOVjXoPH3q4A+1XMDg57u1MecARVMM7D4E73UA8qDHhgdqkM3TqxXDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U51x1HrB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D7A606A333
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U51x1HrB
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793723149;
	b=o/T50ihoqdq46aEHWLu4U44W9dvkikdXUWeHHfjBpNLtzXCZ6PXPU5Hn3B5CKuZLuZXd
	 eq9TqfbYEHEllj1xjhx4BZ2J2lnEiIZE/98gsSYxLMSLxudA3MRxZ3ISHCrD28ri56Xw0
	 okW+aDxx5C5EsJv2N3Ne0n72saPVnOFiuH03zxKQ9WqkwlKUjpJN+SCPCUroxDfuloHCH
	 VcLl51VohmGcQjEmAQMzjmHLM9SXM/6w8XN9CBVpTPXpq32gbR7RtCGKTX0D8ZGezuUHE
	 Y9cE1Z4OsiXwa7ygpQB+EIsZIViqKb+QNEgmslreETHNJFt0TJ4iS/ojd9tP+dSC0mw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793723149;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=YhFPGq66AAtaFmboYz1uYaKBpqYr/PH8XApnUGdT9oo=;
	b=SR00+1i4LcnTkCFR5NR13u5g5uC5/EE7sAPd0dKtjZ0Dbibge2FYeggCuRbBg39Y5Xev
	 EHo2S/TbhYi2y3d/ePEnhCDRzsKGRnSPeuaax0W1c886RCsMPoUZ7PuqHF9yTeXK83msk
	 j2T9hjveUnHh6p2nvuvQcVQ7VdSleaGvy6qs8Ow9TuByR+y5heJHKO60OabOFaW/FSr3X
	 4ke/UhE+19RQmmlM/3thFtVPZ7ZXNQpP8A2Sho3Yt43W/fgobUTvnzlvRrdjNin8i+a4c
	 kI2uMl1bFEkSXKvCIab10hvZTc9QiEy8It2J5LNWJ5nCszpqOWAmWipIIfYo3iR1q4w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C6C651F00919;
	Tue,  3 Nov 2026 16:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793723149;
	bh=YhFPGq66AAtaFmboYz1uYaKBpqYr/PH8XApnUGdT9oo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=U51x1HrBbAvBU4FXVebjW5zRlZhklRZH5wj9qSxQhFxFs3sGcxl8zmuEWuqGU9X9u
	 18bfvrkU6tPb340mJzaLR5USdchWYaxrsYsegJk+Q8JZMMPE1p79sRMygtRFRYB3QJ
	 2rGskxmVZau/BglEVbJXw4hheAaJVJd2FjmUX1sVkWyt/FiZYr9NRxF8sXj70KZdZ0
	 kmlzV7kHErtclAhnCRTMjAqJ1XNIc2doGB3xN24Rd+3hcwILYShBw+vcor7pRDmb7t
	 m+Lpouh+0gDbeqAPyN+gjs5nIHfAc6pyzBbKN+ysH/0R1R5Ju0KawQZRdBlWZSNM6E
	 r09E9URk7DKiw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 35D4846A1F;
	Tue,  3 Nov 2026 16:25:47 +0000 (UTC)
From: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>
Date: Wed, 04 Nov 2026 00:25:45 +0800
Subject: [PATCH v4 1/3] mm, swap: only allow swapped-out slots into the
 swap cache
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
Message-Id: <20261104-swap-hibernation-slots-v4-1-0ba9393609e1@tencent.com>
References: <20261104-swap-hibernation-slots-v4-0-0ba9393609e1@tencent.com>
In-Reply-To: <20261104-swap-hibernation-slots-v4-0-0ba9393609e1@tencent.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
 Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
 Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
 Jianyue Wu <wujianyue000@gmail.com>, Youngjun Park <youngjun.park@lge.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, 
 Kairui Song <ryncsn@gmail.com>, linux-kernel@vger.kernel.org, 
 Kairui Song <kasong@tencent.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793723146; l=3324;
 i=kasong@tencent.com; s=kasong-sign-tencent; h=from:subject:message-id;
 bh=DSg4zPkZqnOQvGhK9sG11r29/KrXHPQLe9s8Rr3DHeY=;
 b=11vQE85hIvbe97NqWxRwvbKHZLTqYj7++y3AJG7mDwZH12EvUhPH1qnjISuktefyl8en6VaMR
 jh9fyvGQjrxBGIJUcby06JaCEM3YOc/F9b/KUBNKe9Fh1hR/a8I/AfT
X-Developer-Key: i=kasong@tencent.com; a=ed25519;
 pk=kCdoBuwrYph+KrkJnrr7Sm1pwwhGDdZKcKrqiK8Y1mI=
X-Endpoint-Received: by B4 Relay for kasong@tencent.com/kasong-sign-tencent
 with auth_id=562
X-Original-From: Kairui Song <kasong@tencent.com>
Reply-To: kasong@tencent.com

From: Youngjun Park <youngjun.park@lge.com>

__swap_cache_add_check() turns away folio entries and slots with no count
and lets everything else in.  That is safe only when the caller owns the
slot.  Cluster readahead owns nothing, it walks a raw page_cluster sized
window of offsets around the faulting entry, so it can land on any slot.

A bad slot gets in.  The check reads the count with __swp_tb_get_count(),
which shifts the count bits out without looking at the type, and
SWP_TB_BAD has all of them set, so the slot reads as SWP_TB_COUNT_MAX.
Readahead then allocates a folio and reads the offset off the device for a
slot nothing will ever swap in, and the folio entry that replaces it drops
the bad marker.

Readahead used to be guarded by swap_entry_swapped(), which goes through
swp_tb_get_count() and gets -EINVAL for a bad slot.  That call went away
when the swap cache checks moved into __swap_cache_add_check(), and the
raw accessor there does not do the same type test.

Require a shadow entry instead.  A slot dropped from the swap cache always
gets one, empty if there is no workingset value.  The type test runs first,
so the count is only read off a countable entry, and the check as a whole
runs before the folio allocation in __swap_cache_alloc().

The large folio walk in the same function does the same raw reads.  A bad
slot cannot be in its range, but the range is not pinned, so a slot freed
and then taken by hibernation still trips the countable assertion there.
Give the walk the same shadow test, the folio check folds into it.

Reproduced with a badpages list written into the swap header by hand.
Readahead took over four bad slots before this patch and none after.  It
needs a crafted header, so a normal setup will not hit it.

Fixes: e1e6750df3b4 ("mm, swap: add support for stable large allocation in swap cache directly")
Acked-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Youngjun Park <youngjun.park@lge.com>
Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/swap_state.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/mm/swap_state.c b/mm/swap_state.c
index d9e36c505398..da65d75ceead 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -191,9 +191,14 @@ static int __swap_cache_add_check(struct swap_cluster_info *ci,
 	old_tb = __swap_table_get(ci, ci_off);
 	if (swp_tb_is_folio(old_tb))
 		return -EEXIST;
-	if (!__swp_tb_get_count(old_tb))
+	/*
+	 * Only a swapped-out slot may be brought into the swap cache.
+	 * Cluster readahead walks raw offset ranges, so it can land on
+	 * slots that are free, bad, or owned by hibernation.
+	 */
+	if (!swp_tb_is_shadow(old_tb) || !__swp_tb_get_count(old_tb))
 		return -ENOENT;
-	if (shadowp && swp_tb_is_shadow(old_tb))
+	if (shadowp)
 		*shadowp = swp_tb_to_shadow(old_tb);
 	if (memcg_id)
 		*memcg_id = __swap_cgroup_get(ci, ci_off);
@@ -206,7 +211,7 @@ static int __swap_cache_add_check(struct swap_cluster_info *ci,
 	ci_end = ci_off + nr;
 	do {
 		old_tb = __swap_table_get(ci, ci_off);
-		if (unlikely(swp_tb_is_folio(old_tb) ||
+		if (unlikely(!swp_tb_is_shadow(old_tb) ||
 			     !__swp_tb_get_count(old_tb) ||
 			     is_zero != __swap_table_test_zero(ci, ci_off) ||
 			     (memcg_id && *memcg_id != __swap_cgroup_get(ci, ci_off))))

-- 
2.56.0


