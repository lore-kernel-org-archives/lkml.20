Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117319;
	b=4EHBvt0su0z0TvmRZdEMef+uN4qo6W26oxPjfIaSMzmeXUXIB9Iy3VRFfrkAhiUIcmdL
	 NPhNtgMmLaEPagHF7WgyrCHD+e2zrku9lvbwGKcQ35k+bbDhIkzpBzeRttRCR0OgFENTD
	 C1ybnAU1iLTUoXsBpDXaVmsU+kOjUorjKS2+RIU8NIthfzKakH51OUjRzrwcn8BAogvK0
	 Y6dkrOCw2dIVv5TI4wrak+tk14TOaCaPFpPCA+4zQkBJh/eTNeA5BQwdyzgV8WHr2Hw6K
	 eDcNIcNQZxpMiJgsF2EHWvvUPaH6ABSwxojlgMLF8qMT2DYYAQJanpwRyhK+0bWhVvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QVxxN3pOPGXBhWxV8G2yXfM8qxwN8twHCdwdAriEeWA=;
	b=TDRh3xoOb0DmnxYShgfjrBswJ2U1IBJv+wS5tAtybiFsosESZQBrdx5mdEAsizHRMqRq
	 ESIoEpOr5b0II/aZRh1HyzjKPIJ01N+JzPVckHrQySRSwHWCbERrMF9+b6RJQ3TCRz9BL
	 qlZ09sUfXZS8Oo17+TCJubTnFWCz4RkbqKfdl8F0dUDZjJAyp/uEQ2DthQEQR59ghi65P
	 3w78cutkmw76iyHX0VmWt3LgbGZCy5C9zDeFTJSDIzElJAl5cuDUj1ZcdCxklpyiepFvu
	 qqer5HnnLbx0WA0ce85y8r/kwdRqnwuFXkiQ20vSlOEapcA9WAEjzrAlQd+T2aFYv5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kb13883k;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D443606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:08:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D443606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kb13883k
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso53031a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793117318; x=1793722118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QVxxN3pOPGXBhWxV8G2yXfM8qxwN8twHCdwdAriEeWA=;
        b=Kb13883kzz3b/nlA3jPmO5F6TOoJ5sdAI4+Kyz6oWaIqdtlI0SrZ4rrLzyXSRoUbDY
         yZyvnTXKWlsC6W+vH2tBgqzCsMOFe4uJZmMzdyZ2T2nub7IO4QNSnMMYyhTR0M+hNStO
         bclFP5R7bqxrimOPOG1Qi8NwPigJtx/52D2Hx4xPz1f8DfV0/JldW85ESFz5Y9bXxeQy
         Xyh3GBKr3s+N7LaD+G1UQfD3AuFW+nPeSEaNevzKME1srpC2yl5RKkxByTvB6Seee90z
         jSeqC+uTxrfKXycCMgVGJjI2B9OA+Ve7LB3ENZie49gBzGcpfgN1r+r2v9JsqpuMYKgd
         g/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793117318; x=1793722118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QVxxN3pOPGXBhWxV8G2yXfM8qxwN8twHCdwdAriEeWA=;
        b=NFvjLTOhyGcIlYnlexMNYwuKiK7NCh1ZYbwXR315CdyhoUjRJeeEsgClG7e5+XX2Bz
         MevGupimndStoRadiTh59qo5IzGjEcDOBsLgCg0Bqn4+I4dxD1VtXiB2msAq/uEuKRao
         0GCTK2WxdrRzJvc782sEqrtwzDk15ZmX7dZRfYicxYLnnEYX+acAdxd6iXXOKq/oIBxU
         DqNZ1nsqRzzygUQNjWd06UliHofqDdLH5Dp3SHMNMiO1/AOkFhTbGyKPlrwcPvcFktXY
         7B5N7PHlYG9geyMxPPRjwwROwvQYYBl6fPSr4Oh1BIlc6vBPuYKIn/vK+OeqeoPRZV93
         aduA==
X-Gm-Message-State: AFq9FYJGNcXEMAYwKPiYvKbMJdw1PcAzErf98vxX1bHrhx1AaeYwY+Yk
	SZgRlN9NQwifn8svCVpei1+Jr6Ty/zlVhdUUc9Q+DELg2l8HDBdlVwBD
X-Gm-Gg: AYBFou2DU1QEP1oX3sVtzgdPc3Z+IKBIrSJ9wnYMan3gE9hHySl5duB6/Kiu7hx5+w8
	nPN0KMwR2uoKTQJstw7MruP+dmJ9nxSxKrucII4jSVG+oixRpugKpPqlici1d2SEhRK/QSgR+Gw
	ItANQ2+MDFR+KHzUU8HXw7oWebPNGaMqb/juBeCUabKDlCqXsdHTR9mab0+8k6pu4HZ3+3Vavmi
	6mq0/7u6PRcqeV1Cljky2fgaYm7zRjfEF5n1N/YQNYGon5Ghwpa4jFhJ6EKCnTe/qp7YvARN7XU
	oguvftKtUtXtrwc2h7eU3lOJX6xH6TcfMpINH5v5Gm33EYHFHxcaOm/+hG1dGdK8K5Ag92ZYGEw
	G6v2e0JLc6jXzYHyL70QMqIBme1UDjrkLTCjuCc+L1dVnSAgjGj9Rz8TBAvdsd5rf299baI0G3/
	L6JTp24wMzB3Iys2iC57uacJSgzsqhQBjT3CUy2YQs1vjsYi7aj/EbSfss8SOknbLLJpqYQZLHh
	qKPlroNUhymIOaW0ahNnXaQdKd6KxTQAQJR59V3qEBHLk0XYfVdhjKnMoY1oIxJZKIoPb2gwbxG
	l/gGsYnreT/oUB4JQNWPHUTjJD7j7QsIYcX5o00D
X-Received: by 2002:a17:90b:4fd0:b0:3a0:cbe2:9e0c with SMTP id 98e67ed59e1d1-3adeb10f4b9mr8694182a91.63.1793117318387;
        Tue, 27 Oct 2026 09:08:38 -0700 (PDT)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebaddd45sm8500624a91.2.2026.10.27.09.08.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 09:08:38 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	chrisl@kernel.org,
	nphamcs@gmail.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	shikemeng@huaweicloud.com,
	kasong@tencent.com,
	linjh22s@gmail.com,
	kunwu.chan@linux.dev,
	kees@kernel.org,
	gustavoars@kernel.org,
	tglx@kernel.org,
	linux-hardening@vger.kernel.org
Subject: [RFC PATCH v3 09/18] mm/swap: avoid direct reclaim when populating swap cluster metadata
Date: Wed, 28 Oct 2026 00:08:12 +0800
Message-ID: <3dcf416531542280b8b01b2bc6bde6f1d094f105.1793106426.git.lianux.mm@gmail.com>
In-Reply-To: <cover.1793106426.git.lianux.mm@gmail.com>
References: <cover.1793106426.git.lianux.mm@gmail.com>
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

Swap cluster population is entered from swap allocation and may itself
need memory for slot metadata. Its fallback drops the device and cluster
locks before allocating with GFP_KERNEL, which can reenter swap
allocation through direct reclaim.

Make this allocation boundary explicitly non-reclaiming so callers can
retain outer synchronization without a recursive swap allocation.
Clear __GFP_DIRECT_RECLAIM from the fallback request while retaining
__GFP_HIGH and __GFP_NOMEMALLOC. The retry can still wake kswapd, but
fails without direct reclaim when memory is unavailable.

This can make metadata allocation fail earlier under memory pressure.
Keep the existing isolated-cluster rollback and restrict this request
without adding a task-wide PF_MEMALLOC scope.

Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 mm/swapfile.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 2035513d3c61..68bed5023299 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -545,13 +545,14 @@ static void swap_cluster_assert_empty(struct swap_cluster_info *ci,
 }
 
 /*
- * Allocate swap table for one cluster. Attempt an atomic allocation first,
- * then fallback to sleeping allocation.
+ * Allocate swap table for one cluster. Attempt allocation under the locks
+ * first, then retry with the locks dropped without entering direct reclaim.
  */
 static struct swap_cluster_info *
 swap_cluster_populate(struct swap_info_struct *si,
 			 struct swap_cluster_info *ci)
 {
+	gfp_t gfp;
 	int ret;
 
 	/*
@@ -569,9 +570,11 @@ swap_cluster_populate(struct swap_info_struct *si,
 		return ci;
 
 	/*
-	 * Try a sleep allocation. Each isolated free cluster may cause
-	 * a sleep allocation, but there is a limited number of them, so
-	 * the potential recursive allocation is limited.
+	 * Drop the device and cluster locks before retrying. Metadata allocation
+	 * must not recurse into swap allocation through direct reclaim: callers
+	 * can retain outer synchronization across cluster population. Restrict
+	 * this request instead of granting the task PF_MEMALLOC, which could
+	 * give allocator hooks and failure cleanup reserve access.
 	 */
 	spin_unlock(&ci->lock);
 	if (si->flags & SWP_SOLIDSTATE)
@@ -579,8 +582,9 @@ swap_cluster_populate(struct swap_info_struct *si,
 	else
 		spin_unlock(&si->global_cluster->lock);
 
-	ret = swap_cluster_alloc_table(ci, __GFP_HIGH | __GFP_NOMEMALLOC |
-					   GFP_KERNEL);
+	gfp = (GFP_KERNEL | __GFP_HIGH | __GFP_NOMEMALLOC) &
+		~__GFP_DIRECT_RECLAIM;
+	ret = swap_cluster_alloc_table(ci, gfp);
 
 	/*
 	 * Back to atomic context. We might have migrated to a new CPU with a
@@ -3095,9 +3099,8 @@ unlock:
 	del_from_avail_list(si, true);
 
 	/*
-	 * The swap allocator doesn't take swapon_rwsem. Looping through every
-	 * cluster lock after clearing SWP_WRITEOK ensures that allocators see
-	 * the updated flag and that no allocation remains in flight.
+	 * Drain cluster-lock users after clearing SWP_WRITEOK, so swapoff
+	 * does not race with operations that started before the transition.
 	 */
 	for (offset = 0; offset < end; offset += SWAPFILE_CLUSTER) {
 		ci = swap_cluster_lock(si, offset);
