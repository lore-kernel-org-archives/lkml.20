Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA1C1A268
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789956024; cv=none; b=mHvENy98P6cwmr0x/tbn66dXIu3YhHYx/1/h7xvQDXOWOSgg7SlXxJoKY8OaAAOM54y0Lq09uqD6ZD0lrnNR8Iy9ey08/cVCOTpNXtJ+Zypi4lely1Yjo5jCdQ/C5FfYEH4eseY3JQBf/xvARbOJyyMk+4x6jN06igr4CyUebgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789956024; c=relaxed/simple;
	bh=7bjL12I2GurMoSCdoMKek+j2S+kiktqKSgZfILbAInQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qo9gSvfQ8RpgzkcbB7nxpHQAlkjq/imUSWLSgDNmUNKsgQqLlWaKSeVShnIJx/Aw4pMbm6EQ6RwOVsRMjdX/z4W0c1BokdMzhZiqUFPak5No5AXDIzM5Xs/LpBtU88SLMm1VsrpMmtGl3Yxg6d8FaX8TaNz0a12JRqwnHH9tXFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSTWNgeg; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSTWNgeg"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so11925755e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789956021; x=1790560821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r7TZP8BNLRLnhNjBcWJuFbaWGwNCp5mqjDlxAcW8kmE=;
        b=mSTWNgegfSxHbSpYGjEYBokPPS/NgH9BZU4e/Boh5OqE3N/DR0RgIs6eCO7MJYlU/u
         Pq6nTyjUSE4utwEfSML3ZEJ/wai1Q0Fhekt/DZcAiKHPen8CO6kLkVl416Pr55PKnMu2
         ox0hXc+qnAYOgybv0pIYfeC0LH6tC7WGT5HLinEzwdNfpPvGIFA1NiS9RtBYD9kGVQLL
         WFk6y29sYGNNei+i6lgS5tG5Y+yOU+8CUyYWNSMRkspZfptlX0s7uM51rJGibb2DXtAK
         pWE05Y/t/7anhTjwRZ37sCklNdc9x74T1mNFpGmcqCBJYVzj3qwsDacbCpqo9PWFyKg9
         yBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789956021; x=1790560821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r7TZP8BNLRLnhNjBcWJuFbaWGwNCp5mqjDlxAcW8kmE=;
        b=Wrx8UU5SCYlUnXcC4aBNxtw+JXauQaUIJgI4z0Rsu3QD5iRXV+27qXjn2zm94xhWsu
         tBnYqIygj5dAa7+kPtlWnav14nm4sHGceJqnXW1BgBR2o8FNmXmC+QirxbLO/65mgYRm
         k5D7tub9EX/aCWAICsP7YuqnulzQTJdwyiswtCm914lCvuRJcCNnDZSeJ6Mf8GBtGZxH
         m4ZoqAWXn+7lmAIggXfQrlk24CF2R/FJPjbLCaNM4qZgZ8x2u5JGFt4n3vYwlSRhdzlq
         O38YgqdizYIb35PHz7pjh3Q9r+SOo+GR8aOhJwgR41IxJwZWMGwIH9j1Li9YWBOJKnCO
         DidA==
X-Forwarded-Encrypted: i=1; AKwUvBybSnu22Rm5xFRUKVtbr8bli1ItMStByrdG2veywZ2HiKFd5McpMAvALlC7r4t9yN0JSb7yX0MmRezemYk=@vger.kernel.org
X-Gm-Message-State: AFuF++lIcwnuwE/SNsDRDnvbv2VgDy8UdrPPL2H2Zo4Zo87+9OTLde8V
	Jetqtb/0gRNF+D6tZM6fZ93+K1eHpwHBVww/0a/Mw0eUOuM77ZmL2x1k
X-Gm-Gg: AYBFou3fOaLsoZjkgiWKPNmeYFQj5hwjkR0HGGyjjmvQC47HhwI1QJvMKdX3zcydSP2
	q9y0ol9VdCgA1VWOF/y3vtazPqAIQjSWHqjzlBzrpPnokXYmf7ZNKLvce52gpL0OmXVx8pvKoHp
	uYy1h5TJ0pH73bSoian3KhDrRw0tjTQuQcE0RLP5VErjmKayHBHAwwp2Qp3kQDS4FkxP8xUf576
	lq/4E13MPmgwzGmZvsGaWBa45V3BqIqf+zvoEEX8kb0EGmwmfeMqmQnBFxX3mL2t2iJOSw+BhIN
	USAHf18qrPdljCOnD+2/loi18RTS5vvcbIzhBRaGTid/kYgljFzfxJA6iwj074hj2+6BL298mQR
	/dtPC+53E4RpxG8qzTUD/fC8ZcRlr7kpiPeQ+5gLica8FrLGPWn8O1F8dUz+EbpZGJPXnKOonBk
	iOh/JcTmW6BaxZOk6b8Nq0Jj6Z31oyzX9VmKDdf6l2hBepwsygwTfNQxoxB0x8S4/8TqZQYGOjO
	nPqOPW+zo7mNyDpgr+PQ6Eh33deIkMlJ9JYjRqIjbWzENeBlOOqPuo1r7akZsW74Y10vlgOV5zC
	WJr2W6W0vuP0zmAVLjNcGj/vuyz8BFLvdStfjFT+WdyvKKgeDOiB1y+fEyumSF6LuJeEh9ldmIN
	msmgEXREtaPcI
X-Received: by 2002:a05:600c:358a:b0:49c:fa20:cc08 with SMTP id 5b1f17b1804b1-49fc5741844mr142422905e9.31.1789956021522;
        Sun, 20 Sep 2026 19:00:21 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a8e9-c501-2c36-515f-49b6-c492.310.pool.telefonica.de. [2a02:3100:a8e9:c501:2c36:515f:49b6:c492])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd10273fsm193284995e9.7.2026.09.20.19.00.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 20 Sep 2026 19:00:21 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lian Wang <lianux.mm@gmail.com>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] mm/damon/core: keep the temporal tuner quota over an unmeasured PSI round
Date: Mon, 21 Sep 2026 04:00:12 +0200
Message-Id: <20260921020013.33105-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260921020013.33105-1-kmehltretter@gmail.com>
References: <20260921020013.33105-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit b73198a47ffe ("mm/damon/core: handle uninitialized
damos_quota_goal->last_psi_total") scores a PSI quota goal without a
previous sample as achieved. This leaves the consist tuner's input
unchanged, but the temporal tuner sets its quota to zero for an achieved
goal. A running scheme with a nonzero temporal quota therefore loses a
charge window after a quota-goal commit.

Use the effective quota to preserve the temporal tuner's previous
goal-achievement state during an unmeasured round, as SJ suggested [1].
Score the goal as achieved when the effective quota is zero and as not
achieved otherwise. A new scheme's initially zero quota stays zero, and
the consist tuner's behavior is unchanged.

Move the PSI current-value calculation and last_psi_total update into a
helper that takes the current PSI total. This lets a unit test cover the
unmeasured and measured rounds without depending on system memory
pressure.

Fixes: b73198a47ffe ("mm/damon/core: handle uninitialized damos_quota_goal->last_psi_total")
Cc: <stable@vger.kernel.org> # 7.1.x
Suggested-by: SJ Park <sj@kernel.org>
Link: https://lore.kernel.org/damon/20260916001311.101024-1-sj@kernel.org/ [1]
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
The commit being fixed is still in mm-unstable, so its hash may change.

 mm/damon/core.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index 2258b72da7a78..add1b7afb957a 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -2955,6 +2955,28 @@ static inline u64 damos_get_some_mem_psi_total(void)
 
 #endif	/* CONFIG_PSI */
 
+static void damos_set_psi_current_val(u64 now_psi_total,
+		struct damos_quota_goal *goal, struct damos *s)
+{
+	u64 last_psi_total = goal->last_psi_total;
+
+	goal->last_psi_total = now_psi_total;
+	if (last_psi_total != U64_MAX) {
+		goal->current_value = now_psi_total - last_psi_total;
+		return;
+	}
+	/* uninitialized last_psi_total; make no effect this round */
+	if (s->quota.goal_tuner == DAMOS_QUOTA_GOAL_TUNER_CONSIST) {
+		goal->current_value = goal->target_value;
+		return;
+	}
+	/* let temporal tuner show the same achievement as in the last round */
+	if (!s->quota.esz)
+		goal->current_value = goal->target_value;
+	else
+		goal->current_value = 0;
+}
+
 #ifdef CONFIG_NUMA
 static bool invalid_mem_node(int nid)
 {
@@ -3207,13 +3229,7 @@ static void damos_set_quota_goal_current_value(struct damon_ctx *c,
 		break;
 	case DAMOS_QUOTA_SOME_MEM_PSI_US:
 		now_psi_total = damos_get_some_mem_psi_total();
-		/* uninitialized last_psi_total; make no effect this round */
-		if (goal->last_psi_total == U64_MAX)
-			goal->current_value = goal->target_value;
-		else
-			goal->current_value = now_psi_total -
-				goal->last_psi_total;
-		goal->last_psi_total = now_psi_total;
+		damos_set_psi_current_val(now_psi_total, goal, s);
 		break;
 	case DAMOS_QUOTA_NODE_MEM_USED_BP:
 	case DAMOS_QUOTA_NODE_MEM_FREE_BP:
-- 
2.53.0

