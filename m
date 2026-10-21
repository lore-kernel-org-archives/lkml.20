Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562624;
	b=dGKMmL9u9Al/hciKv8faNDs9/yS49FFZkSBsZbCwAlNGeZcKc8g9lsY6GYPBfBJ1bp0F
	 ptxxPYYdYGn2AmWSDrCMOkHk/05uA6epsA/rfcqQ3PUyvJrubCluwPugrsJE3xADuVS+K
	 4259u/ClMBUFhehDwxFF5PfTwK7UkVS3lZ9qr30wZkPNci2d0ROmWM7emo5mJMdR6JFaR
	 P4Nq9Is6Fv+TjSuNsNmxG1a4pD486IHW2njHdmddfT6OSs3fPuOLSygtr2oI3QT4m/uS6
	 L143zYiJHIvlBoPv17CNind7PtzogmnJmTdgEq6Crq2ZTl7ZFJtuntxw2SIh0NXSUzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+TsRxErWT6koYb6Xgo6QbB8vqh49N8f3WZDdlHz9iT8=;
	b=e2x6/Gth994x7ZO4Qbfu8Z1VZ0q1pP/Pd5AkMZCe0D5WXEMbSsuAGsk/+RjkWlqPWWlr
	 8PpyxgOlUnQ4J5/xnfB6oQgTvzdycg3HaygKJmwDM1Kp6TG7VEPqS3T4J1ZPN+YYW7TvA
	 i8Vf7P8GYf5omCRSvhsgyXSib4KwW/kW5RBQ9CX5zAU5qFQqTguFYVOdoD67h7BHIZlqt
	 M3SMY6Q84Hi0WmklkzMuchl7NqFPSBAeV/LZd/mnxwxhHGPjuiHrGfkx8wFdaZOYV6G4L
	 m0pbnMoE/PD93W/jiUuj5T+5Ps0q8VsFHq8kiuWu4n6ZCFF3bJ53sapoEylc5QrON3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NsPaKD2f;
	arc=none smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE0060A2620
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBE0060A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NsPaKD2f
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-679aeeddc6bso378489d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792562623; x=1793167423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+TsRxErWT6koYb6Xgo6QbB8vqh49N8f3WZDdlHz9iT8=;
        b=NsPaKD2fIf84Pt4WIbaiiZ1JbCcqSw/gidqj7LyzXn+G5xJ/6ye97icBsoIewABXlN
         bzoQhxfB+4qvA+XPI2BamI0J5lDZHqJNI7rQ1JBAbJ+ZC6APEhToIIXKHIaGGO9ggfcF
         2EcTcF8JH77So0rLNX19lRvlPA05qFrTNoURxcgUE+WpweFR52daI8q0EokVcJ9NtEac
         qZysdlhw9H2y3bs7ACAjb0gkfpl7BcNjeWtT/nJb1CS/CQb78FlXbaNDoUpbPn1M+fy7
         WtBfmZGC+u5baOyyqrW9R7cpsazBfaKu6A3iMmwkefSRyb1MEbS7KR9WS4P1hqvtCXoO
         9XVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562623; x=1793167423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+TsRxErWT6koYb6Xgo6QbB8vqh49N8f3WZDdlHz9iT8=;
        b=u8UuD0I9f2HDwZXa6aZlkXP6u9vd4ZsnswObkJJU23xgBiV3j9hvyIZMlxblOpQP+V
         ChGiGUDTvulgDIzBKm02YRclRTKDQnYb0/3GXk3RWm/LR8cSvr4HQmhRPfxI+dPnPGHJ
         TOV1BIS+faEM17VnmYwI/q9H/et0YeLlzQzwFbIM9Dtopg8ApLows2VNAUly99TkuHAD
         vmTqFT73GtrBQb67hA8nZiovJKm1drnqYQtdYqKoWbHrWTcOxGhAbm6PtVWU/GE0Y0K8
         Z1aS1+h/+IXZ//XqSuxkest7us2AHeWuYO8SMBFZmX+ObV6MCQeiYi8wXKLgDhy1u3ud
         AEpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzn27pWEo9P8BdxEaKGICFTsAQMgbJ1X61EcwR5kqK7UJUYFnYsDtRfcFcC5tANkvW45ZXUbke/J+lGFpE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNZp7HMwNGuOlhTE9DEDJuISEIhcNH5SosulmDz29JsE04Xydj
	tWMZECGEXD0yaBpdFPalYlhaekZyhkXZAOHWdfNkiw//l6GyKyqx7+GR
X-Gm-Gg: AYBFou07geyrkQzjT7/ffKy/QmFgiAcuB1jmdzRePJ5wG2/+f+46Z0Xalx0qOS/FDFO
	E4uAypUJ53gBoyxPBzIomJ15O6zBjirGYN37laRkBTH8RfoeIJbBBt1+jI4TcDxhh1h+u8v+hG5
	Z8QGRWg0C+3nKnSqe4j8N3g9XaFCOBAxuRvh4vWHrKPzpnWeFO4+rDzDs/6FVW0KGmH7H2RFTFF
	xTi7NBu+VaOs3TKuHf1LeNGfBlbYRKDQtw3uNirmybWkI3AmJEwRoMuyfufuHTbQsKgs7bOx3nw
	pgwnfIQRIraFqQYR6cdSl6nh4GiWNHtXjMF9vTKDaMLcUUiCY/bg0wa8iYbnEWLQuKFiYWFW8dV
	Ydl1KCsNCYxIhLduCI/7k3XrMQ9nVCOMFzUrSUYKdweyqC6S8EgYEgobdTGmJL1bJTbiix5Lw/J
	DfAsIWpEkseu8F4FLHBKbF8l5Z1gDH+64FGcwglHdDqAaScDCMc68oZlRH2zZMmFxjrB5chH4fm
	yK2C+pJy3zVPsirDoNdGCuPd6qpLrnjkSKSUYpATPNPwDoowVgApqRroq6OGfp02FIT20ezpa04
	ffJ2saPhBwz3EaSLekObCOUjMF+aJCSne9tuvFUsJo53yQf43aBMgd12OUsYhO0sl6HCBT9RSOv
	AjGVlBQ==
X-Received: by 2002:a05:690e:488d:10b0:679:8c5f:3fb6 with SMTP id 956f58d0204a3-67a0e0417acmr381635d50.9.1792562622988;
        Tue, 20 Oct 2026 23:03:42 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a0e496732sm619480d50.5.2026.10.20.23.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:03:41 -0700 (PDT)
From: Nhat Pham <nphamcs@gmail.com>
To: akpm@linux-foundation.org
Cc: chrisl@kernel.org,
	kasong@tencent.com,
	hannes@cmpxchg.org,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	yosry@kernel.org,
	david@kernel.org,
	muchun.song@linux.dev,
	shikemeng@huaweicloud.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	chengming.zhou@linux.dev,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	qi.zheng@linux.dev,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	riel@surriel.com,
	gourry@gourry.net,
	haowenchao22@gmail.com,
	corbet@lwn.net,
	hughd@google.com,
	baolin.wang@linux.alibaba.com,
	tj@kernel.org,
	mkoutny@suse.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	kunwu.chan@linux.dev,
	kernel-team@meta.com,
	nphamcs@gmail.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	cgroups@vger.kernel.org
Subject: [PATCH v6 05/12] mm, swap: enable THP swapin for vswap entries
Date: Tue, 20 Oct 2026 23:03:16 -0700
Message-ID: <20261021060323.553433-6-nphamcs@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021060323.553433-1-nphamcs@gmail.com>
References: <20261021060323.553433-1-nphamcs@gmail.com>
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

Swap a large anon folio back in as a unit when its vswap entries share a
contiguous run of physical swap slots on a synchronous IO device,
instead of always falling back to order-0 faults.

A zswap-backed or mixed-backing batch is still refused, and the fault
retries at a smaller order.

Signed-off-by: Nhat Pham <nphamcs@gmail.com>
---
 mm/memory.c     |  5 +++--
 mm/swap_state.c | 17 +++++++++++++----
 mm/zswap.c      |  6 +++++-
 3 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 9f651d247eef..430b83900ba8 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4885,9 +4885,10 @@ static unsigned long thp_swapin_suitable_orders(struct vm_fault *vmf)
 	 * lack handling for such cases, so fallback to swapping in order-0
 	 * folio.
 	 *
-	 * THP swapin for vswap is not supported yet either.
+	 * Vswap entries are checked later, under the cluster lock in
+	 * __swap_cache_add_check().
 	 */
-	if (is_vswap_entry(entry) || !zswap_never_enabled())
+	if (!is_vswap_entry(entry) && !zswap_never_enabled())
 		return 0;
 
 	/*
diff --git a/mm/swap_state.c b/mm/swap_state.c
index 3900975c675f..6c8e8f49e349 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -174,6 +174,9 @@ static int __swap_cache_add_check(struct swap_cluster_info *ci,
 	unsigned int ci_off, ci_end;
 	unsigned long old_tb;
 	bool is_zero;
+	struct swap_cluster_info_dynamic *ci_dyn;
+	enum vswap_backing_type type;
+	int ret;
 
 	lockdep_assert_held(&ci->lock);
 
@@ -202,11 +205,17 @@ static int __swap_cache_add_check(struct swap_cluster_info *ci,
 		return 0;
 
 	/*
-	 * Reject a vswap batch so __swap_cache_alloc_folio falls back to
-	 * order 0.
+	 * For a vswap entry batch, reject if the backing is not THP-amenable
+	 * (e.g. uniformly ZSWAP, or mixed). The order-fallback loop in
+	 * __swap_cache_alloc_folio will retry with a smaller order on -EBUSY.
 	 */
-	if (is_vswap_entry(targ_entry))
-		return -EBUSY;
+	if (is_vswap_entry(targ_entry)) {
+		ci_dyn = container_of(ci, struct swap_cluster_info_dynamic, ci);
+		ret = __vswap_check_backing(ci_dyn, round_down(ci_off, nr),
+					    nr, &type);
+		if (ret != nr || type == VSWAP_ZSWAP)
+			return -EBUSY;
+	}
 
 	is_zero = __swap_table_test_zero(ci, ci_off);
 	ci_off = round_down(ci_off, nr);
diff --git a/mm/zswap.c b/mm/zswap.c
index 24c4e7a73d56..1b91dba992ab 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1753,9 +1753,13 @@ int zswap_load(struct folio *folio)
 	 * range on the backing device, so scan the range rather than rejecting
 	 * it outright. The caller has pinned every slot, so zswap cannot start
 	 * a store or a writeback into the range while we look.
+	 *
+	 * A vswap batch is checked when the folio enters the swap cache, and
+	 * its backing cannot change after that.
 	 */
 	if (folio_test_large(folio)) {
-		if (WARN_ON_ONCE(zswap_is_present(swp,
+		if (WARN_ON_ONCE(!swap_is_vswap(si) &&
+				 zswap_is_present(swp,
 						  folio_nr_pages(folio)))) {
 			folio_unlock(folio);
 			return -EIO;
-- 
2.53.0-Meta

