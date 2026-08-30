Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFAC1F8755
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 07:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788076098; cv=none; b=kyu9sV1SQK9JlD2m62EZlQxQG8mSUD1+9LNxTx95Q9+C5tLMNqS+vKVG9k9Uh8TkCfi8rPkVO44Ok56Xkk/UywgwpMBa0WJeO4E7nLA+H2RXB20tUvQpocj5x3cb54CVMTnTBUPmJWk37Ukm7FHyQxX4PXmhCanWzh9ve9xMJIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788076098; c=relaxed/simple;
	bh=gZdA2234LT7avgLTCBppkWFXFTaiu7u/S8+j8oYkCxo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q+T3l6XNT9j/ZIOJACkCruYYGz8x0i0KcToMTTIc2UDtvqGU0LHxwGpqfXcSREVj6QH1pE6MJ3R8E/pfJJkhud5hVriCvU+VkHUxG125gP2YEx4qJrPhVdoM1bW+GzcDaxw4NE4ZQ92aigK/pRiQuYQSXpdHwH7FLQf+MyCZf+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zuz9PyXX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zuz9PyXX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FB531F00ACA;
	Sun, 30 Aug 2026 07:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788076096;
	bh=ZDX3fFvUV30DfDlbIstSg54b9CSxecAVNcamfzhjDpc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Zuz9PyXXns1bfaGYR4gnsnrxBWaqJ2cC2WXfTQgmLJc4cO8fXpb7QJjDQGAxLBweW
	 njwG435meYvdRMmFjpASihIDRb48QGdry5/qkaq2Bpim1xqKDzu8ooUUuChsnpepSP
	 vwwc+zKhQKjIpM6/A6egaO7hrri8bIIpI25tyjU+LNBYikCYM/LcMQ8l5NyZLdhcU9
	 vdGjSE/yZUQxVqKSKjyWrw7g1+SUglzOKT/WSg7/xZtlZTiuOvVQhG77nEky66RL01
	 NO0eHmrDCvn816QISofFodN4Czd051W+EhaiJHQdBF7SgUCHsDXasr9K2WYziDqI5+
	 JsK2PWt2PH0Tw==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Sun, 30 Aug 2026 10:48:00 +0300
Subject: [PATCH 3/4] misc: ibmvmc: replace get_zeroed_page() with kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-char-misc-v1-3-05e2ce44f291@kernel.org>
References: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
In-Reply-To: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Brad Warrum <bwarrum@linux.ibm.com>, 
 Eli Billauer <eli.billauer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Michal Simek <michal.simek@amd.com>, Ritu Agarwal <rituagar@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
 Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org
X-Mailer: b4 0.17-dev

ibmvmc_init_crq_queue() allocates the CRQ message queue that is shared
with the hypervisor. The queue is mapped for DMA and registered with the
hypervisor by its DMA address.

This buffer can be allocated with kmalloc() as there's nothing special
about it to go directly to the page allocator.

kmalloc() provides a better API that does not require ugly casts and
kfree() does not need to know the size of the freed object.

Performance difference between kmalloc() and __get_free_pages() is not
measurable as both allocators take an object/page from a per-CPU list for
fast path allocations.

For the slow path the performance is anyway determined by the amount of
reclaim involved rather than by what allocator is used.

Replace use of get_zeroed_page() with kzalloc() and free_page() with
kfree().

Link: https://lore.kernel.org/all/635405e4-9423-4a25-a6e7-e03c8ea0bcbe@redhat.com
Assisted-by: copilot:claude-opus
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 drivers/misc/ibmvmc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/ibmvmc.c b/drivers/misc/ibmvmc.c
index da82b1edb7c9..7d503ebd9f3c 100644
--- a/drivers/misc/ibmvmc.c
+++ b/drivers/misc/ibmvmc.c
@@ -154,7 +154,7 @@ static void ibmvmc_release_crq_queue(struct crq_server_adapter *adapter)
 	dma_unmap_single(adapter->dev,
 			 queue->msg_token,
 			 queue->size * sizeof(*queue->msgs), DMA_BIDIRECTIONAL);
-	free_page((unsigned long)queue->msgs);
+	kfree(queue->msgs);
 }
 
 /**
@@ -2130,7 +2130,7 @@ static int ibmvmc_init_crq_queue(struct crq_server_adapter *adapter)
 	int rc = 0;
 	int retrc = 0;
 
-	queue->msgs = (struct ibmvmc_crq_msg *)get_zeroed_page(GFP_KERNEL);
+	queue->msgs = kzalloc(PAGE_SIZE, GFP_KERNEL);
 
 	if (!queue->msgs)
 		goto malloc_failed;
@@ -2192,7 +2192,7 @@ static int ibmvmc_init_crq_queue(struct crq_server_adapter *adapter)
 			 queue->msg_token,
 			 queue->size * sizeof(*queue->msgs), DMA_BIDIRECTIONAL);
 map_failed:
-	free_page((unsigned long)queue->msgs);
+	kfree(queue->msgs);
 malloc_failed:
 	return -ENOMEM;
 }

-- 
2.53.0

