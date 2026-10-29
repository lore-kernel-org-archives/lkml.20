Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793298768;
	b=cqK+RdNUTp/0wtCW+Pu6J5R7Dr1ovOQpzVqnU2+8OUL7wggtVqpSvOxCEThmQ9TRdjb9
	 WbBvlByj+ZZhB2iF+Hlg7UlRr9i0teaiSiL/Oq7XmQCrF/6EkHBCeXemsJQd9hPE+RbWk
	 vVX/X5ovAc92WYuvu/lokJpGTKCVbizmxJ32imD1jpxAcP6LK9r8K2pMlliF8hJU3pEhm
	 duNmVnaV1GNJA2GwHv8HxiGotPhUuKfB5DzbeIfgoKIgWaQbOIMAyHNJYYPKVJYNcLIPu
	 6HhEzoP66ncNIls57qDrIpEqhYAZlNPWGQnKnVyi9BuIVfzbv5ZsCwW43LXQW+AAyJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793298768;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=fTW5L2TMn8pd/2NUrVoQf+CiJ7CtM3uYVCZgZ5kfQPM=;
	b=mNBxSb9CWlrC9Qx3zW+0jMiE1pmbO+QqYK5wvpObOFiQs01TIMS4JN7iKUOiTLufNgym
	 OkbJ+9obOyG30WCU0zM2amoLZu5NY101v08sFTu9Zsb7ooaZ03EKx/bGWtkayEizFjSL0
	 PT3uRYubQtky4uai2lHU3MRl0j6yJW62YXJeK98IozG8yFJyC98tZmiFHcxyi8lMWosd+
	 bA0Q6dhUiUbc+t8f1qB3G1ca5UrtWHUwUqvQLjZTQQJa67cha3DOa6rgUPumIn8yS5GDP
	 BV9MXwLHjYWj71CigBsTDNMO+ydxfZBLEm3wRppx52L9LEQEutiHDlYSmtPr2fYMiPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JIdg0hQl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C24606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JIdg0hQl
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793298768;
	b=VCS+WX98sWbLDXjnowB3xwvbvg7BTJ2AYKGx7EJyfMuM3+Zq2HDAfVc8TmU6KCQ/TnQB
	 nqvuvExkfBUbW+sOh8gquC3asgid8w8ohzWzrzcVjYgpO2P5sDw0mz8K+5dZAfHfZhtl2
	 AuwzqNUtNTrtqwrNNn9t5pPINAe7+rtz52hXM8pREi/pQMQITUZPBVrEcw261F/2dIBS0
	 SBUJR6YkNM+Q29NGRddMlhjRmVAWe3wTa8jYRwSLW74zQUCjArgfqQpReWzQjmPL9YjNN
	 5Yxq4Lb1W4el4OYOby17CL2WAt7zWiauhU4epGZbY8OC6+hhzZa1v0fepZecpyED5tA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793298768;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=fTW5L2TMn8pd/2NUrVoQf+CiJ7CtM3uYVCZgZ5kfQPM=;
	b=zY5n2EvZ5AGk6TXqrBfYAqHlZkwWR2s3QfR2rqo4k60Ea0LM4PjAToQNI+2wkuUKG9Fb
	 F+7LksaFUi+GqgLhAJrA9rj+rUwXD72AwgpPFg4PYfV7ptaA3kiEkRe0xejyG8O3Kl279
	 1hHul4Gc/Ets1agFHgn0Iuqd1udCwcAnzZbb7YTllLVF/pPZ2aawL/JsaKuvqxaOgJ66L
	 QIJUOOeriEWhqZ+Z/z3Fh/wLTUJYh0tbMSvpjRWB9YBRs6WUZkBL9Az1tR1z4vaPfgWtt
	 axyETSbgbNirr410rcahd3LOl4GQwRSaijth7dfb+4cEYPtjXzSdkyxuhZleZjsWnmQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A18E61F01825;
	Thu, 29 Oct 2026 18:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793298768;
	bh=fTW5L2TMn8pd/2NUrVoQf+CiJ7CtM3uYVCZgZ5kfQPM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=JIdg0hQlOG9cDOLPeuvIUE4lGI2HJmiiwe9ThDjzRREsD+XV58FFKUvamsAM6A61e
	 vEce/IzKBgrIiUXLxdgAAsIoxUkwVUPhmCNvaWQ53l+6aaWc6/9mMStV9+LmK5rKs5
	 ru6y5FCyl2bbRZg0jZY7l8iiIJeAaXBrJ6sQ0QTzAok9TjSkVqL4LdwsgBfbrlyW9Z
	 nRnBE4fAFts4i4dwU3OhT/gTAHalQb+mtH7+gsvLG5RsBFYpedEQ0xICKzzsqzWq4+
	 Dyw1yfjAMn/vz1S6tpXSOEvv0zyEhIerBDPlWKBdTUCBoQNJoz9sxxJTmFJrzGdQGd
	 eFJuq4PgfQvLg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1A4274595C;
	Thu, 29 Oct 2026 18:32:47 +0000 (UTC)
From: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>
Date: Fri, 30 Oct 2026 02:31:42 +0800
Subject: [PATCH 2/3] mm/swap: account synchronous swap reads as memory
 stall
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
Message-Id: <20261030-swap-fixes-v1-2-73f73a59f2fc@tencent.com>
References: <20261030-swap-fixes-v1-0-73f73a59f2fc@tencent.com>
In-Reply-To: <20261030-swap-fixes-v1-0-73f73a59f2fc@tencent.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
 Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
 Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
 Youngjun Park <youngjun.park@lge.com>, Yosry Ahmed <yosry@kernel.org>, 
 Chengming Zhou <chengming.zhou@linux.dev>, 
 Usama Arif <usamaarif642@gmail.com>, David Hildenbrand <david@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Chuanhua Han <hanchuanhua@oppo.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 Mani Tofigh <mt4022@columbia.edu>, linux-kernel@vger.kernel.org, 
 Kairui Song <kasong@tencent.com>, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793298765; l=2231;
 i=kasong@tencent.com; s=kasong-sign-tencent; h=from:subject:message-id;
 bh=ETwDBqVe4SkLyOogHeVFo/cI0MLTr36Is6NOTSa3Wuc=;
 b=14e1RWmqqdS/oQ2hw2zRrMhcmuGgjIHInGUQZIpDIR/X+sjKFVpIO6DQLFbuQBcvUDrWFqXSW
 8OcAisTUl37AxasJwEbugtMClEcwe9Gl2by7v6I+nasCvAb37CiLrlT
X-Developer-Key: i=kasong@tencent.com; a=ed25519;
 pk=kCdoBuwrYph+KrkJnrr7Sm1pwwhGDdZKcKrqiK8Y1mI=
X-Endpoint-Received: by B4 Relay for kasong@tencent.com/kasong-sign-tencent
 with auth_id=562
X-Original-From: Kairui Song <kasong@tencent.com>
Reply-To: kasong@tencent.com

From: Josef Bacik <josef@toxicpanda.com>

Swap-ins from SWP_SYNCHRONOUS_IO devices such as zram are no longer
counted in PSI memory pressure or in the swapin and thrashing delays of
delay accounting.  Refaults of the workingset from zram, the main input
to userspace OOM handlers like lmkd and systemd-oomd on zram systems,
become invisible in /proc/pressure/memory.

swap_read_folio() opens the accounting window with
psi_memstall_enter() and delayacct_swapin_start() and, per its comment,
means to count the submission time.  For synchronous devices the
submission is the entire read: swap_bdev_submit_read() does
submit_bio_wait() and completes the folio.  Since reads are batched in
a swap_iocb, swap_read_folio() only queues the folio with
swap_add_folio(), and the bio is submitted later by swap_read_submit()
in the caller, e.g. swapin_sync(), after the window has been closed.
By then the folio is uptodate and unlocked, so the fault does not wait
on the folio lock either and the read time is not counted anywhere.

Found by code inspection; not reproduced.

Fix by submitting synchronous reads from within swap_read_folio(), as
was done before the batching, rather than from the caller.  This gives
up batching of readahead for synchronous devices, which do their I/O
inline anyway, in exchange for keeping the accounting simple and in one
place.

Fixes: dda8fb68b590 ("mm/swap: also use struct swap_iocb for block I/O")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/page_io.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/mm/page_io.c b/mm/page_io.c
index 65681eed9c80..83ed0246ebfc 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -500,6 +500,13 @@ void swap_read_folio(struct swap_io_ctx *ctx, struct folio *folio)
 	zswap_folio_swapin(folio);
 	swap_add_folio(ctx, folio, READ);
 
+	/*
+	 * Synchronous devices do the whole read at submission time, submit
+	 * it here so that it is accounted as memory stall and delay.
+	 */
+	if (synchronous)
+		swap_read_submit(ctx);
+
 finish:
 	if (workingset) {
 		delayacct_thrashing_end(&in_thrashing);

-- 
2.56.0


