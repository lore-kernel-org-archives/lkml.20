Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793722705;
	b=0JFmfuxycjycUHsRswoYRsg8k8I4TpGdmdA4DAqKrvM3MBIP+3ekPg3M1qmRK4L9Y4b4
	 hV7IlbAv2qbvwdLsxuWZ3p9/vnfZyWRa1n08tcPrWXq9wCj2/caa6ohE8O1GzmY23MKOi
	 odX+2uhpQm4WDBT7uo1ZAj3je9DlAe6s/At1Zchq6hwymdSHE3S31XiLScG9vYlmonbeJ
	 if5vLjDlD2wYoPaSjuSrgeHB9lS9GnxWj2hs8jy6kDrfVqnIACs1jvkEPc6YsPrUiAzuw
	 q4HSdu0TmqMvL92l289EBLgQM2pmzSteBYL7MUPEZ9NWSHE0Xz1cCOYbRprcDkUL6pQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722705;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=baDKtCJ9t+d8m3jVmL4//Dt0e3tyXADcCTg7kZjMSAM=;
	b=0ZcpW9QCopCJDcsAxnD7K/TDrTU67+/Leo/RsCqm2hcoup2UVaKCe35Pd6izXH/ELFfD
	 tgAj/tLFfoi4hU6DpcGqGLdKE/OxlMFo8ZFAAOkgAI1FtdhHsDlCw85waOfHhvmzIRT+Z
	 uMdJbOq3s1tpXd6wPBiCShTKozRF+y6aAWCH+dOiP4SI8h0BP3/oJKx3JXlf53AieFhU6
	 zQ4XM3LxwKyp1n8eLCfSIeZbxpijnPgQbXvGIvVHhkexQ6Q+MD9mVp1eTdAjyn1fKhCFv
	 fiVjhiOXLP7k2s+NBDExbrbRemEjl/cdXag/4blh2FnRw2lQAY6YcLnYG3Kvrr8Gl6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eqDXnEfg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5E9606D80E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eqDXnEfg
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793722704;
	b=GZqf7tUAI87DxyTV9plNbnG2EV4NLJD+InRnsqb1MAiOWuNqMcAWkGK8i1yOPNwObbU2
	 az1FRZP2HdsC71IAllN7uU/ADqoyE70GDP/ZsxCf5r4Ns/blTlF54226cP6od7Ric79aS
	 Nr30ry/+nq5bjmgfG6bufMggzSGevW2vVgAkzymMq77EjmTGBG7YIfYCfDiavLnzQzErH
	 4ORLFeDi1rnGnq4ePyUb0b9lcoi5wq+pY89oxeJgf4yM8WBYaVYcCDhFJVKK9xxqMCrf6
	 7mp5Ddm/AMcXvb/EekL2jjQZWnGT84rJIQL8UmcvHN7+Qut9LfZbeHj0Cx+4dF0SFvA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793722704;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=baDKtCJ9t+d8m3jVmL4//Dt0e3tyXADcCTg7kZjMSAM=;
	b=nfer8XsDnU1UGO9dtMFsVpQahH2Iloibaj2OrgUmL+JLaIgIYkP6GlxQSwrsaVy4OjEx
	 k23fS7EbgYrwd0meoA/t5Lm4uI+JlnXQlW8zZGX/VVQ8t4KOsa9P2iNUDa8L3gmL+oWk0
	 PtUM3u8/6bjHXFOJ76NIz25jDbixOzFRdgwtaUrVBLz+IyRDn1rll2RrxmScPxiNkeEsU
	 GlxYKK7ZNYWeGG9hwn6PhSupE6m6nwHT99c28c6Ec7MWPr1wv31d5wW7EPJdLWffmwxM0
	 rP2Z9uFq15zRzN3E+6vEEQSIYYKIunBKTBvlVYKzrZJdf8IUEeyS8cwRIbY5O8SXf0g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F1EED1F00A02;
	Tue,  3 Nov 2026 16:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793722704;
	bh=baDKtCJ9t+d8m3jVmL4//Dt0e3tyXADcCTg7kZjMSAM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=eqDXnEfgPvmo4U8gvGC+06k2HbXaFns7KOXb19VXARJLA/lKs8ZJqjKFMeVDQx0AN
	 kIoP3xJZNZd30aGog2qQA9gO7OzbG6lDbjK7s/69WRFh46YU2KhWxI1yzNKo6lyzbj
	 EnQRHmLQ7EbqX5qmGwcIbJGnhQDTcdMbmWNU1qI/2OcWD+Mi4DxkDdXMIdVGYqTq5F
	 /W9OjbYM2d/R0r9Cntt1WdgsFbmrdfOZMayyv9uby/35zCcgg4vM/UAIF3ICv1jtyw
	 w8nUV3g9xUPqa3DrCtBbx13l/BtXXRHfuIo0rIAKdW5bd3ucbnpikDRPi4ayRMYEIV
	 cuMDUVNYhNPxw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7806F46A13;
	Tue,  3 Nov 2026 16:18:23 +0000 (UTC)
From: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>
Date: Wed, 04 Nov 2026 00:18:16 +0800
Subject: [PATCH v2 3/4] mm/swap: account synchronous swap reads as memory
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
Message-Id: <20261104-swap-fixes-v2-3-204be064be5b@tencent.com>
References: <20261104-swap-fixes-v2-0-204be064be5b@tencent.com>
In-Reply-To: <20261104-swap-fixes-v2-0-204be064be5b@tencent.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
 Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
 Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
 Usama Arif <usamaarif642@gmail.com>, 
 Chengming Zhou <chengming.zhou@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
 Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Chuanhua Han <hanchuanhua@oppo.com>, Mani Tofigh <mt4022@columbia.edu>, 
 NeilBrown <neil@brown.name>, Christoph Hellwig <hch@lst.de>, 
 linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793722701; l=2186;
 i=kasong@tencent.com; s=kasong-sign-tencent; h=from:subject:message-id;
 bh=EXepoBL+1i8g0ScofxnsUXgOf1Zeyb2RF1ZMuEP4wQQ=;
 b=II4HH3rBWCxgpZOng9GIJ+6uCPttS6S4t02mNweB0XFK5UOl5u1wHuIEznK3U23AF84mthrvq
 X9BtcDxwI0TDydFmucET7Q1DfJg4CsVZ6F7uwkwvGmEHFmGZWwKX9BB
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


