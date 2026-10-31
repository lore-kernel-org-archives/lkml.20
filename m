Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.79.80
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793442944;
	b=sARsy9tMut99YmghlcH2JHkHDbH9vAC+IyMAb3C8G1mMNozZ87jhGhTMdUjAezugxN+K
	 i5RZiHweFD9oBvoOkGyixeiUwAvDsIpmtj3Xo7JHxv7392ficZe+Nj92gvDrmvo6+SgeX
	 pliOmL6JDXvBDY1GM6CefPguYkxR7koOiNFiIAdiQOXotySL4zmWxb2H8Fnh5Gja++K+g
	 5OrUHcY9wD2R8X8bcnuSLE/UIQ6hIhliy/i4yNViSy1irglLOMutm6HmHioX0i4cPAjQU
	 T8XFLL39qnBhaopRPT9V+LHN3Sbyp3KekLzq+Ks0GIBd8YITPBvLpi1qZCzltBVrzHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793442944;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Info-Out:X-JNJ;
	bh=mMQ5rkZkdm3KfZdw1UPbqupcNAtLUin9ixCalXTmBXY=;
	b=O8nTkaD7n3THmpSOnN7LN4JMvnDvsep3aTfy5NVw7DmkGc8qrJq+Tda7TWukrZaz43Cm
	 CrPIbSpfrwVIfB+sF6Vu8sJ/bqZguPTsuMh9u3vCTTqJyAs5/Ka+BCkX/sSOSux3IFIDk
	 IScsDJEhkaKftj/3UWTAk+0WG8tf8jxWFDtdP01rlFkPNt6gljLJFeTIjVJfh7vjqsYlV
	 WhjOAzAoLzThBs5TYnx7QI8eecKr65DFprDO1pu24dmndsZ36f7iG+TlUGdiHejGltPAN
	 HdbuNQ97lnqFD6LAwjSzofGk5zdJZ2iqDMm2WLSgS1wJdoaZAChKYP/W02JV36b5dPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=B9nsVoQ0;
	arc=none smtp.remote-ip=57.103.79.80
Received: from outbound.st.icloud.com (st-2005l-snip4-7.eps.apple.com [57.103.79.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274DA606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 274DA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=B9nsVoQ0
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-7 (Postfix) with ESMTPS id DC24C1800293;
	Sat, 31 Oct 2026 10:35:39 +0000 (UTC)
X-ICL-RepId: 01a19187-839b-746f-9289-dbbc02d94298
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQtJCkMGXwFeCEADQwZbC1BcHA4XXhtCFUsVXANcDkswUBtfAkIPHBNWFRMLU1ZbE1UXRgkZCF0dGQpQUAZcEhhcFFxQWB5GElYNXQkZGEZeUBtfAkIPHBNWFRMdQxkPKwhKBEMHRQJeCyUTCVNWWxNVF0YJGQhdHRkVWgkKVwBAC04CXQRaHxJYDFAFGh9eEhQeXxhEAx8GD1UAQAZSAkUKQQteDg5XE3kMVgNUDlwEFxtcAAlLRglJHQ4EVAddBV0=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1793442943; x=1824978943; bh=mMQ5rkZkdm3KfZdw1UPbqupcNAtLUin9ixCalXTmBXY=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=B9nsVoQ0steZIfz2Y32E7nJV5NP+B0C4+MxUDKTrgfqaSguYupUKcdr/e3wBxmp2PptFZ5PoRY9jKrHaYOHoprM7/LNM9oYk2duGmDNwfAv09TpSLRiisGmUzjROkBFN9m8WpzVOhOziSLcVElPbgeeJKPdGzHoLFfIfdPe4zCzrGWcEYL5mVAqZBMQlerUl5Epu+aXXsz2xfxg47jSMMWrFcvBqgzXN7kbtnauRIBxwY9L/aAWbQNN/lTxlrhooDkwUDuRa59LabRcVmmOP9ZaSeT/NTGECHM5KLbGTcD4srViArIJhX0O5OpdyjyNc9/aom75VBJ9MCah4O7kpEA==
Received: from [192.168.5.15] (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-7 (Postfix) with ESMTPSA id 85E55180028E;
	Sat, 31 Oct 2026 10:35:31 +0000 (UTC)
From: Zhang Peng <zippermonkey@icloud.com>
Date: Sat, 31 Oct 2026 18:35:10 +0800
Subject: [PATCH v6 3/5] mm/vmscan: extract folio pageout from
 shrink_folio_list()
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
Message-Id: <20261031-batch-tlb-flush-v6-3-190539839eec@tencent.com>
References: <20261031-batch-tlb-flush-v6-0-190539839eec@tencent.com>
In-Reply-To: <20261031-batch-tlb-flush-v6-0-190539839eec@tencent.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, 
 Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
 Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Zhang Peng <bruzzhang@tencent.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA0MiBTYWx0ZWRfXwymSmREJcCGd
 BI7OVdonGcOuDP4kYgO4RwOOnYI1awVALgpvnyrm7up6S2D5K2VfXCbFe1gLiOStKioX62t6LvF
 z8T97cimM1FGeGr7w1n3zxvGw1BE9l23/C3cZAzC2qr4CcuSt2FKoolNF9WpSG79d+xUihxCeKh
 edi16D0P3+6GEffN9kqyZ+jpYfNoY1N5KxP0moO41EYuJM8NjvWPEsMsm4/XEFYbreyNchouLZ9
 fVY1zi7GrykRO5KAbdm8KNTPxtQuxoBRHtLbHMXbnfbvRTfo7d2QYdYgQyZHr1sLjg5Oh7Vpv08
 TJX/OBtZyRD8h7ZrLHwcsAAFRan8F/xTW7sVM6r/dkSWceKo5g4Izumn90D3AE=
X-Proofpoint-ORIG-GUID: 01U2c3acoAQQN9Ai1jAI3Tcwx-5X8OWZ
X-Proofpoint-GUID: 01U2c3acoAQQN9Ai1jAI3Tcwx-5X8OWZ
X-Authority-Info-Out: v=2.4 cv=TZqbdBQh c=1 sm=1 tr=0 ts=6ae5c47d
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=x7bEGLp0ZPQA:10 a=YE32fvk_ji8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=GvQkQWPkAAAA:8 a=qi0cjtEbl7ftujh0onEA:9 a=QEXdDO2ut3YA:10
X-JNJ: AAAAAAAB1R38cbLzfbycO7rQxnl1oTH2o+pk4SqoDVkWFXZAHpOKBDVR96BRKfvrnDvrgq
 7xyT5cayYESLv8Za1L9HUQoopxZdFd/fYI9P+ID+IACqm52q4u+xcg4Sm4du3OB8/jopP/
 eK2MksS042VXHc047wdx8KuUp/39VBHXxLDaLXjsQXhx0hQipW9MVlzBl2ZalAUAeCMHT8
 j2xkYyqH7yD4myLxs5W7w+fU4jlgjpO4B17NkckZsp9lc1jtzfuHhDFbrhly0mqLmF3rMk
 4P8YwNVVMADwrBtCMGbIElWW9dcJGXgG66IoBagi73CZ3OaGrw0sE6tKY1gsGx7xTHLZfA
 T9nzZdgSEwML4nr1mMQivChpWAxNOSMQj+5pxH5ucdGgRBAkT+SHz3Lxs87qUNrnscSjFj
 /iCsu8T2pobhTJ429S5rlqgyXOBZIQxOqJoR/uYcz4JxQBiVEG4RMde3IqKpw5eY4VC3cH
 rMswfE8XSJvU1UUq/A1Sz/rYDYPto2lr6ijsL/7bQH5kOEvddnFl46w6gtxAJ/PIXzM12+
 +SUDO8yh0qTgsschCPIrYrj831PxaUVRC7YebVSXKAyBZ4vT5LLoeAY8ba3ElH8wSwsZqL
 prGO4e958cwXhLGAZnGOJ1SLR6bG2x/AZyP/uhCOulkiN8iOGF6mxRHpfw9b2BVqH047OG
 F/ToIOM/e3IhnlsgWP0TO5wli9cCZAX9V8eugELlIoQqvrGDrRtiIteBxwHZtoECtiPfnr
 cBFNwyR+7F7c+0aCISGPF5q+m6x5GRdBdFz52s823u7Q9/qqrDt5oS2RgxqNnj8gqT06XV
 NVHoK0lZgGbi8M3pk7WdPUaCF4Gl1cGKXIqeY1MIujqMROodxy23LFH+lSeeSdOLYS1QzB
 tJDXoRFVsYnBrqiMk6IR4NBZUIVv7+UwllLW5WElJGxmp5784ThTQ=

From: Zhang Peng <bruzzhang@tencent.com>

shrink_folio_list() contains a self-contained pageout() dispatch state
machine. Extract it into folio_try_pageout() so it can be reused by the
batched pageout path.

Return an explicit pageout result instead of a boolean. This keeps the
important distinction between activating and merely keeping a folio
visible to the caller, and also records whether a kept folio remains
locked after pageout().

The clean and synchronous-write cases return FOLIO_PAGEOUT_RECLAIM: the
folio is still locked there, and shrink_folio_list() then runs its
single folio_try_reclaim_free() call, so the reclaim-free step keeps
exactly one caller.

The PAGE_ACTIVATE arm no longer normalises nr_pages to 1 after a split:
folio_activate_locked() derives the count from folio_nr_pages() itself,
which is equal by construction once the folio is order-0.  Note this
makes the patch depend on patch 1; applying it alone would over-account
nr_activate for a split shmem folio.

No functional change.

Signed-off-by: Zhang Peng <bruzzhang@tencent.com>
---
 mm/vmscan.c | 105 ++++++++++++++++++++++++++++++++++++++----------------------
 1 file changed, 66 insertions(+), 39 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 9ac125f2e317..36e3f0829f08 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -1277,8 +1277,65 @@ static enum folio_reclaim_result folio_try_reclaim_free(struct folio *folio,
 	return FOLIO_RECLAIM_DONE;
 }
 
+enum folio_pageout_result {
+	FOLIO_PAGEOUT_KEEP_LOCKED,
+	FOLIO_PAGEOUT_KEEP_UNLOCKED,
+	FOLIO_PAGEOUT_ACTIVATE,
+	FOLIO_PAGEOUT_RECLAIM,	/* folio is locked, hand it to folio_try_reclaim_free() */
+};
+
+/*
+ * Called with the folio locked. All results leave it locked except
+ * KEEP_UNLOCKED. The caller retains ownership in every case; RECLAIM
+ * only allows a subsequent reclaim attempt, it does not free the folio.
+ */
+static enum folio_pageout_result folio_try_pageout(struct folio *folio,
+		struct scan_control *sc, struct swap_io_ctx *ctx,
+		struct list_head *folio_list)
+{
+	struct address_space * const mapping = folio_mapping(folio);
+	const unsigned int nr_pages = folio_nr_pages(folio);
+
+	switch (pageout(ctx, mapping, folio, folio_list)) {
+	case PAGE_ACTIVATE:
+		/*
+		 * If shmem folio is split when writeback to swap, the
+		 * tail pages will make their own pass through this
+		 * function and be accounted then.  There is no need to
+		 * clamp nr_pages here: folio_activate_locked() derives
+		 * the count from folio_nr_pages() itself.
+		 */
+		if (nr_pages > 1 && !folio_test_large(folio))
+			sc->nr_scanned -= (nr_pages - 1);
+		return FOLIO_PAGEOUT_ACTIVATE;
+	case PAGE_KEEP:
+		return FOLIO_PAGEOUT_KEEP_LOCKED;
+	case PAGE_SUCCESS:
+		if (nr_pages > 1 && !folio_test_large(folio))
+			sc->nr_scanned -= (nr_pages - 1);
+
+		if (folio_test_writeback(folio))
+			return FOLIO_PAGEOUT_KEEP_UNLOCKED;
+		if (folio_test_dirty(folio))
+			return FOLIO_PAGEOUT_KEEP_UNLOCKED;
+
+		/*
+		 * A synchronous write - probably a ramdisk.  Go ahead
+		 * and try to reclaim the folio.
+		 */
+		if (!folio_trylock(folio))
+			return FOLIO_PAGEOUT_KEEP_UNLOCKED;
+		if (folio_test_dirty(folio) || folio_test_writeback(folio))
+			return FOLIO_PAGEOUT_KEEP_LOCKED;
+		fallthrough;
+	case PAGE_CLEAN:
+		return FOLIO_PAGEOUT_RECLAIM;
+	}
+	unreachable();
+}
+
 /*
- * shrink_folio_list() returns the number of reclaimed pages
+ * Reclaimed folios are counted in the return value.
  */
 static unsigned int shrink_folio_list(struct list_head *folio_list,
 		struct pglist_data *pgdat, struct scan_control *sc,
@@ -1596,7 +1653,6 @@ static unsigned int shrink_folio_list(struct list_head *folio_list,
 		if (folio_maybe_dma_pinned(folio))
 			goto activate_locked;
 
-		mapping = folio_mapping(folio);
 		if (folio_test_dirty(folio)) {
 			if (folio_is_file_lru(folio)) {
 				/*
@@ -1617,50 +1673,21 @@ static unsigned int shrink_folio_list(struct list_head *folio_list,
 				goto keep_locked;
 			if (!sc->may_writepage)
 				goto keep_locked;
-
 			/*
 			 * Folio is dirty. Flush the TLB if a writable entry
 			 * potentially exists to avoid CPU writes after I/O
 			 * starts and then write it out here.
 			 */
 			try_to_unmap_flush_dirty();
-			switch (pageout(&ctx, mapping, folio, folio_list)) {
-			case PAGE_KEEP:
-				goto keep_locked;
-			case PAGE_ACTIVATE:
-				/*
-				 * If shmem folio is split when writeback to swap,
-				 * the tail pages will make their own pass through
-				 * this function and be accounted then.
-				 */
-				if (nr_pages > 1 && !folio_test_large(folio)) {
-					sc->nr_scanned -= (nr_pages - 1);
-					nr_pages = 1;
-				}
+			switch (folio_try_pageout(folio, sc, &ctx, folio_list)) {
+			case FOLIO_PAGEOUT_ACTIVATE:
 				goto activate_locked;
-			case PAGE_SUCCESS:
-				if (nr_pages > 1 && !folio_test_large(folio)) {
-					sc->nr_scanned -= (nr_pages - 1);
-					nr_pages = 1;
-				}
-				if (folio_test_writeback(folio))
-					goto keep;
-				if (folio_test_dirty(folio))
-					goto keep;
-
-				/*
-				 * A synchronous write - probably a ramdisk.  Go
-				 * ahead and try to reclaim the folio.
-				 */
-				if (!folio_trylock(folio))
-					goto keep;
-				if (folio_test_dirty(folio) ||
-				    folio_test_writeback(folio))
-					goto keep_locked;
-				mapping = folio_mapping(folio);
-				fallthrough;
-			case PAGE_CLEAN:
-				; /* try to free the folio below */
+			case FOLIO_PAGEOUT_KEEP_LOCKED:
+				goto keep_locked;
+			case FOLIO_PAGEOUT_KEEP_UNLOCKED:
+				goto keep;
+			case FOLIO_PAGEOUT_RECLAIM:
+				break;	/* folio is locked; try to free it below */
 			}
 		}
 

-- 
2.56.0

