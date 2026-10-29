Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793307610;
	b=ltviS/RC+7YJc/D45zMgmRxJsESFiiMA6qOrFoMh5qcU9rttTSExP74IIrkpEdBET+C9
	 EMmJ1rIOxu3MVFjVE9Q7bLsVKkyYQj+rDLGoczJAFuglf35uYJETgRZdUXtjAw83X4Yeh
	 D/mGw6eEdYNroBGu5mIDwKD8JtVyDFhYobIjMhgCmWy9+L5rdwdwE+EdU+Jf/IgaxLCC+
	 3gkE+dmsCPkjv66kB7mhqcxdrumr+k/m2LT4uJf8M3yKXswxADLc82hqjZsp5Qs65Juw+
	 Qk+m0e53BEED5Cr8SjBZQzT44R4Pf4hIkneIuf6EqWhlK7gnSzzcGUCP1LEMByG5Ezw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793307610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5tlCFNXv0zayC/VhrDsZ8YDvmdfJXzEoF9HPtNnow1Q=;
	b=JU7R/vCZzDBLTHqmB7nXuF0efFBWu+J5gdLMIuO6rZx7RzSu7uqwy6Jt5GuWq5Lmwi9D
	 vAjTu+/7kSlQExfL0lTmW28nLev77/FLS7eqrXtQ+cUfS1xml4Ighm9CtX9EKBH5JpprY
	 iiAlyWLsF6Fuixs5menGYSqf2B7Biw2/rHU0Kir/HL3mFP5rPFOz0A1cybqPorLL0tZ0T
	 C8iwxlxLT9vmRwJi4Piye2u+xK9q/fLnWDP3K9UqArhwh3A6InhXlIPO6Nx40rVd7qfgy
	 l6NkzyNiA329WYAj7j1CzI3ZisWHDLdVDO17Su603T1wHxtsHPpT24byCw8Y7IEvzoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmpxchg.org;
	spf=pass smtp.mailfrom=cmpxchg.org;
	dkim=pass header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=p0XaBIoJ;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5187C606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5187C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=p0XaBIoJ
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b118bea471so417217b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1793307608; x=1793912408; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5tlCFNXv0zayC/VhrDsZ8YDvmdfJXzEoF9HPtNnow1Q=;
        b=p0XaBIoJgumxchMukqmPnKaT7Zz3UR8NvD3FaSOutrUwX7/hNLhg2vO0sgDEPoRJek
         sNl7jI20C0zF7UfBiYV92sJX+g8iF7ujH9NYBtwiP0sXH8wm6CWUelF9u8sdwJ0crgIn
         zkxVJe4EYnxiFAYq4VNbb5DAsYwRv0RS1KPV8MYHF4Jn4Yqr7YytVkz1WJcF+a/BzWo8
         NX/5F136+mPCQ6t84Eq3QVoPSPAzu9Fzt5meRNowMnt7hn4ynG2wlh60nHL2i/z3DObP
         sPMzwv9mfFlF7Sno4MOxvgybwoQerV/MrGHi8CMNhbmMv4X5q5Jo4zxh+P5A0i6bIBIT
         jSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793307608; x=1793912408;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5tlCFNXv0zayC/VhrDsZ8YDvmdfJXzEoF9HPtNnow1Q=;
        b=FrBzbk1SUPzcYuXGPeUOJ0nP/9F20d1s1LKAHF6ub7B4QK+gw11L1oOVOLRYGMjRFv
         A0Q7BXwHbpGKHpplJMmhU82TA6iqNo6FqShnsM8XC6n8bx8vx4Pbi1kYIiI6xmDzmMZe
         jRPbX1ovyrI5DxjgO9uFfLbVKOcshsuP3SOXWH+h/AmqntpYTZ+ce/V6ZpMydINoy28+
         oiQ6AgK/W8LkDQsxiKLyfv+kJcKe6Ucut3Ai1cwfLyF5W5La/9AL0PePWlh+9cvjfw8Z
         GC2pkklmQctnp2mR3eFeBcJfHq574Gh0vSaMXFedX+PxqGCmpvvaVm5Le/JO33uKnOSk
         l5GQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9kmY/eB1pvmMtJ/tWDubrr6+R8BABmCxv7dxAdRWXRtgOY+fXhBWom4Bt8WvWxaVFed3ugFObmKo0FGw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnmk6i11Axc/LnDSsO/sOXT5qeZAnTwnudL2YwEe5Cfo42MsHT
	SXjiarwGs1zm/Ev5bQBzPVS7v+qQ2D4/7Yf3u7BlnzhF71ZM7mlnkA7Fb8Eh/5IGofQ=
X-Gm-Gg: AYBFou1Ih30vnUNVSExsVqp4RdJkjN8QdKgA5Cympx2HdS/3R679z3CEg2kNfATUi2g
	2g2Sc8691VvqU+ZE/5h08BgoYpj5Z/3uMBRUUm9uJvywtj/gb7QjNX6ZEbg8KtOemXgrcfBF71o
	UxPEVpIO/v78CSm7DeZvlhjPWLlvVP2+HSGMld2fU2R4VBcHRi+RbMA4JB+aYBo0GVH/9VlfXW/
	gnRuxsqyHaLW3eoqexNwSbySrE8kfbbjafQx0F346/XQuLZJGHX0RAZtrS1IM906qFLZOgwvLoe
	ZMheHN8QCkAvlbk/5b+pm131rnsXqICsEPO2a2ys2cHfdXddXW2Equ3QW/PdKyfJaSs3LOPShyx
	l9WHGJGU54LTj3dlRaDAJvJeghqLEo3PnuLPar+BTw5HjtfHnCU4yrhYAyQv5zN15U5pZD359v0
	s44++tLKIWsGN7f4KVI7Us0Yz7PjgqBOkPFQ7I2UnJ2eAe2KPgjR7uEsjj4URa+YKifww7itApa
	ZXncZiUPDDdFOpfYGSblW3/h+uNa9YdkMumZRnXQ6oyNkd5m5uGx8QgJX3R3slxA+cd03vg18ak
	Xdtx+JZZzywqaiY5jLXwZDzKlgvJ
X-Received: by 2002:a05:690c:6e84:b0:8b0:e207:34b4 with SMTP id 00721157ae682-8b2b66d04c6mr962737b3.18.1793307607821;
        Thu, 29 Oct 2026 14:00:07 -0700 (PDT)
Received: from localhost ([2605:8600:200:14e3:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b4b2b6d8sm1744327b3.29.2026.10.29.14.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:00:07 -0700 (PDT)
Date: Thu, 29 Oct 2026 17:00:03 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Yosry Ahmed <yosry@kernel.org>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Usama Arif <usamaarif642@gmail.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Chuanhua Han <hanchuanhua@oppo.com>,
	Mani Tofigh <mt4022@columbia.edu>, linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>,
	Josef Bacik <josef@toxicpanda.com>
Subject: Re: [PATCH 2/3] mm/swap: account synchronous swap reads as memory
 stall
Message-ID: <auOz00OGB_8dgniC@cmpxchg.org>
References: <20261030-swap-fixes-v1-0-73f73a59f2fc@tencent.com>
 <20261030-swap-fixes-v1-2-73f73a59f2fc@tencent.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030-swap-fixes-v1-2-73f73a59f2fc@tencent.com>

On Fri, Oct 30, 2026 at 02:31:42AM +0800, Kairui Song via B4 Relay wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> Swap-ins from SWP_SYNCHRONOUS_IO devices such as zram are no longer
> counted in PSI memory pressure or in the swapin and thrashing delays of
> delay accounting.  Refaults of the workingset from zram, the main input
> to userspace OOM handlers like lmkd and systemd-oomd on zram systems,
> become invisible in /proc/pressure/memory.
> 
> swap_read_folio() opens the accounting window with
> psi_memstall_enter() and delayacct_swapin_start() and, per its comment,
> means to count the submission time.  For synchronous devices the
> submission is the entire read: swap_bdev_submit_read() does
> submit_bio_wait() and completes the folio.  Since reads are batched in
> a swap_iocb, swap_read_folio() only queues the folio with
> swap_add_folio(), and the bio is submitted later by swap_read_submit()
> in the caller, e.g. swapin_sync(), after the window has been closed.
> By then the folio is uptodate and unlocked, so the fault does not wait
> on the folio lock either and the read time is not counted anywhere.
> 
> Found by code inspection; not reproduced.
> 
> Fix by submitting synchronous reads from within swap_read_folio(), as
> was done before the batching, rather than from the caller.  This gives
> up batching of readahead for synchronous devices, which do their I/O
> inline anyway, in exchange for keeping the accounting simple and in one
> place.
> 
> Fixes: dda8fb68b590 ("mm/swap: also use struct swap_iocb for block I/O")
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Kairui Song <kasong@tencent.com>

Hm, this isn't a complete fix to the problem described. IO throttling
happens at submission time, so there can be significant delays on
async devices too that are no longer tracked since the culprit change.

How about keeping the accounting window open across the batch? Opens
on first read, closes on submission. A batch with at least one
workingset folio is "contaminated" and the whole sequence and
submission becomes a stall. Would need to pull the !can_merge flush
out of the batch-add function to get the accounting window right but
that seems reasonable.

Something like this:

diff --git a/include/linux/swap_ops.h b/include/linux/swap_ops.h
index 57ac6c703f68..6e45c9204482 100644
--- a/include/linux/swap_ops.h
+++ b/include/linux/swap_ops.h
@@ -17,6 +17,10 @@ struct swap_iocb {
 struct swap_io_ctx {
 	struct swap_iocb	*sio;
 	struct swap_info_struct	*sis;
+	bool			in_batch;
+	bool			workingset;
+	bool			in_thrashing;
+	unsigned long		in_memstall;
 };
 
 /*
diff --git a/mm/page_io.c b/mm/page_io.c
index c6824fcd483e..22e5ac1d298f 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -197,6 +197,19 @@ static void swap_zeromap_folio_clear(struct folio *folio)
 	swap_cluster_unlock(ci);
 }
 
+static bool swap_can_merge(struct swap_io_ctx *ctx, struct folio *folio,
+		int rw)
+{
+	struct swap_info_struct *sis = __swap_entry_to_info(folio->swap);
+	struct bio_vec *last_bv = &ctx->sio->bvecs[ctx->sio->nr_bvecs - 1];
+	struct folio *prev_folio = bvec_folio(last_bv);
+	size_t prev_folio_size = folio_size(prev_folio);
+
+	if (ctx->sis != sis)
+		return false;
+	return sis->ops->can_merge(folio, prev_folio, prev_folio_size, rw);
+}
+
 /*
  * We may have stale swap cache pages in memory: notice
  * them here and get rid of the unnecessary final write.
@@ -218,6 +231,13 @@ int swap_writeout(struct swap_io_ctx *ctx, struct folio *folio)
 		goto out_unlock;
 	}
 
+	/*
+	 * Don't hold up a batch this folio can't join for the zero
+	 * check and possible compression. Submit it now.
+	 */
+	if (ctx->sio && !swap_can_merge(ctx, folio, WRITE))
+		swap_write_submit(ctx);
+
 	/*
 	 * Use the swap table zero mark to avoid doing IO for zero-filled
 	 * folios. The zero mark is protected by the cluster lock, which is
@@ -322,32 +342,15 @@ int sio_pool_init(void)
 	return 0;
 }
 
-static bool swap_can_merge(struct swap_io_ctx *ctx, struct folio *folio,
-		int rw)
-{
-	struct swap_info_struct *sis = __swap_entry_to_info(folio->swap);
-	struct bio_vec *last_bv = &ctx->sio->bvecs[ctx->sio->nr_bvecs - 1];
-	struct folio *prev_folio = bvec_folio(last_bv);
-	size_t prev_folio_size = folio_size(prev_folio);
-
-	if (ctx->sis != sis)
-		return false;
-	return sis->ops->can_merge(folio, prev_folio, prev_folio_size, rw);
-}
-
+/*
+ * Callers submit a pending batch that @folio can't join before adding
+ * it, see swap_writeout() and swap_read_folio().
+ */
 static void swap_add_folio(struct swap_io_ctx *ctx, struct folio *folio, int rw)
 {
 	struct swap_info_struct *sis = __swap_entry_to_info(folio->swap);
 	struct swap_iocb *sio = ctx->sio;
 
-	if (sio && !swap_can_merge(ctx, folio, rw)) {
-		if (rw == WRITE)
-			swap_write_submit(ctx);
-		else
-			swap_read_submit(ctx);
-		sio = ctx->sio;
-	}
-
 	if (!sio) {
 		ctx->sis = sis;
 		ctx->sio = sio = mempool_alloc(sio_pool, GFP_NOIO);
@@ -460,42 +463,45 @@ void swap_read_folio(struct swap_io_ctx *ctx, struct folio *folio)
 	struct swap_info_struct *sis = __swap_entry_to_info(folio->swap);
 	bool synchronous = sis->flags & SWP_SYNCHRONOUS_IO;
 	bool workingset = folio_test_workingset(folio);
-	unsigned long pflags;
-	bool in_thrashing;
 
 	VM_BUG_ON_FOLIO(!folio_test_swapcache(folio) && !synchronous, folio);
 	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
 	VM_BUG_ON_FOLIO(folio_test_uptodate(folio), folio);
 
+	/*
+	 * Don't hold up a batch this folio can't join for its lookup
+	 * and possible decompression. Submit it now.
+	 */
+	if (ctx->sio && !swap_can_merge(ctx, folio, READ))
+		swap_read_submit(ctx);
+
 	/*
 	 * Count submission time as memory stall and delay. When the device
 	 * is congested, or the submitting cgroup IO-throttled, submission
-	 * can be a significant part of overall IO time.
+	 * can be a significant part of overall IO time. Reads are batched
+	 * and submitted later, so the windows close in swap_read_submit().
 	 */
-	if (workingset) {
-		delayacct_thrashing_start(&in_thrashing);
-		psi_memstall_enter(&pflags);
+	if (!ctx->in_batch) {
+		delayacct_swapin_start();
+		ctx->in_batch = true;
+	}
+	if (workingset && !ctx->workingset) {
+		delayacct_thrashing_start(&ctx->in_thrashing);
+		psi_memstall_enter(&ctx->in_memstall);
+		ctx->workingset = true;
 	}
-	delayacct_swapin_start();
 
 	if (swap_read_folio_zeromap(folio)) {
 		folio_unlock(folio);
-		goto finish;
+		return;
 	}
 
 	if (zswap_load(folio) != -ENOENT)
-		goto finish;
+		return;
 
 	/* We have to read from slower devices. Increase zswap protection. */
 	zswap_folio_swapin(folio);
 	swap_add_folio(ctx, folio, READ);
-
-finish:
-	if (workingset) {
-		delayacct_thrashing_end(&in_thrashing);
-		psi_memstall_leave(&pflags);
-	}
-	delayacct_swapin_end();
 }
 
 static void swap_write_end(struct swap_iocb *sio, bool failed)
@@ -709,9 +715,19 @@ void swap_write_submit(struct swap_io_ctx *ctx)
 void swap_read_submit(struct swap_io_ctx *ctx)
 {
 	if (!ctx->sio)
-		return;
+		goto out;
 	count_vm_events(NRSWPIN, 1);
 	ctx->sis->ops->submit_read(ctx);
 	ctx->sio = NULL;
 	ctx->sis = NULL;
+out:
+	if (ctx->workingset) {
+		delayacct_thrashing_end(&ctx->in_thrashing);
+		psi_memstall_leave(&ctx->in_memstall);
+		ctx->workingset = false;
+	}
+	if (ctx->in_batch) {
+		delayacct_swapin_end();
+		ctx->in_batch = false;
+	}
 }
