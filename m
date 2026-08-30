Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D538A38D
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 07:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788076095; cv=none; b=QZd6zQOyAfXD2c4u2VG1RS7vOd8RPA2IEQwwPpBJJqS4Zkp1S05OJJ6ZnCQhJP/1y1nhxLH7D5tQiR6wzlxu5F+n583W1zR9NANxqpWqSKr/ciPgqofpSrk5sdkU47iP6wuSuU2QIgPdlbROYJfA6sInA/xoGXxp3voFE0m1Flk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788076095; c=relaxed/simple;
	bh=xeKC46JA18zF+XZGGwo7YQ6FJiuDoI5c95XVvRXSHms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g6tqny2PwnHoGCLcjazJISAa3vrW/uWU9FaMGhe89kZZ53qUOZfkJvMdzu3DT0Ow/wh4iMl5fHK60Icnabelm4koV2kI46xL+lRVTH2OOIiOP6WWWDFwKTQpRMczLsxxkWodwLdB57cRhXhf/0JIy3ymcXBruJVtnf2LcnIkG5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MITK9vI0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MITK9vI0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F1FF1F00A3D;
	Sun, 30 Aug 2026 07:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788076092;
	bh=38jl+dsC2EM5o3wlTYxKA9vi8q2Wl79pFO6QzTnvIhE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MITK9vI0TqCwtGzG/5NMmeWpLrvyxDEIRP5gcuykrnjJ8pC3e+zwNDgzgR7zvRtLU
	 KIzQKgJMT9sNr5suPtvvhbWU/cROpvKy18evTNfnEXuj1IZyDAqWfI4lgUkIp0DZha
	 ciw9wYDeDuB2aHMYJUyfKdodFjmUGsXMvoQQ6UFn1UIGvnuSh0429/xcIJLYDiSMeE
	 VlLLt/omlbjjYeDJc6JWI8dSpj7U6b/541bhnYGQGVYvMSzU6VT7VvnrjrNKct2d+m
	 /GEswHY8ZS366BC6EBjVsqmNvbQ0/G81R4uGCcBP0y0kVpcd9ISRxxu4KKOgC/ZbP4
	 aLDP1Kl/ay2AQ==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Sun, 30 Aug 2026 10:47:59 +0300
Subject: [PATCH 2/4] char: xillybus: replace __get_free_pages() with
 kmalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-char-misc-v1-2-05e2ce44f291@kernel.org>
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

fifo_init() allocates the buffers backing the software FIFO and
endpoint_alloc() allocates the transfer buffers of a USB endpoint.

These buffers can be allocated with kmalloc() as there's nothing special
about them to go directly to the page allocator.

kmalloc() provides a better API that does not require ugly casts and
kfree() does not need to know the size of the freed object.

Performance difference between kmalloc() and __get_free_pages() is not
measurable as both allocators take an object/page from a per-CPU list for
fast path allocations.

For the slow path the performance is anyway determined by the amount of
reclaim involved rather than by what allocator is used.

Since kmalloc() does not need the allocation order, ask it for the buffer
sizes the driver already tracks and drop the now unused order fields. For
a FIFO smaller than a page this also stops rounding the allocation up to
PAGE_SIZE.

Replace use of __get_free_pages() with kmalloc() and free_pages() with
kfree().

Link: https://lore.kernel.org/all/635405e4-9423-4a25-a6e7-e03c8ea0bcbe@redhat.com
Assisted-by: copilot:claude-opus
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 drivers/char/xillybus/xillyusb.c | 25 +++++++------------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/char/xillybus/xillyusb.c b/drivers/char/xillybus/xillyusb.c
index 34e7ad3bcab3..193e2a5b599e 100644
--- a/drivers/char/xillybus/xillyusb.c
+++ b/drivers/char/xillybus/xillyusb.c
@@ -71,7 +71,6 @@ struct xillyfifo {
 	unsigned int bufsize; /* In bytes, always a power of 2 */
 	unsigned int bufnum;
 	unsigned int size; /* Lazy: Equals bufsize * bufnum */
-	unsigned int buf_order;
 
 	int fill; /* Number of bytes in the FIFO */
 	spinlock_t lock;
@@ -95,7 +94,6 @@ struct xillyusb_endpoint {
 	struct list_head filled_buffers;
 	spinlock_t buffers_lock; /* protect these two lists */
 
-	unsigned int order;
 	unsigned int buffer_size;
 
 	unsigned int fill_mask;
@@ -370,7 +368,6 @@ static int fifo_init(struct xillyfifo *fifo,
 		     unsigned int log2_size)
 {
 	unsigned int log2_bufnum;
-	unsigned int buf_order;
 	int i;
 
 	unsigned int log2_fifo_buf_size;
@@ -380,18 +377,14 @@ static int fifo_init(struct xillyfifo *fifo,
 
 	if (log2_size > log2_fifo_buf_size) {
 		log2_bufnum = log2_size - log2_fifo_buf_size;
-		buf_order = fifo_buf_order;
 		fifo->bufsize = 1 << log2_fifo_buf_size;
 	} else {
 		log2_bufnum = 0;
-		buf_order = (log2_size > PAGE_SHIFT) ?
-			log2_size - PAGE_SHIFT : 0;
 		fifo->bufsize = 1 << log2_size;
 	}
 
 	fifo->bufnum = 1 << log2_bufnum;
 	fifo->size = fifo->bufnum * fifo->bufsize;
-	fifo->buf_order = buf_order;
 
 	fifo->mem = kmalloc_array(fifo->bufnum, sizeof(void *), GFP_KERNEL);
 
@@ -399,8 +392,7 @@ static int fifo_init(struct xillyfifo *fifo,
 		return -ENOMEM;
 
 	for (i = 0; i < fifo->bufnum; i++) {
-		fifo->mem[i] = (void *)
-			__get_free_pages(GFP_KERNEL, buf_order);
+		fifo->mem[i] = kmalloc(fifo->bufsize, GFP_KERNEL);
 
 		if (!fifo->mem[i])
 			goto memfail;
@@ -417,7 +409,7 @@ static int fifo_init(struct xillyfifo *fifo,
 
 memfail:
 	for (i--; i >= 0; i--)
-		free_pages((unsigned long)fifo->mem[i], buf_order);
+		kfree(fifo->mem[i]);
 
 	kfree(fifo->mem);
 	fifo->mem = NULL;
@@ -438,7 +430,7 @@ static void fifo_mem_release(struct xillyfifo *fifo)
 		return;
 
 	for (i = 0; i < fifo->bufnum; i++)
-		free_pages((unsigned long)fifo->mem[i], fifo->buf_order);
+		kfree(fifo->mem[i]);
 
 	kfree(fifo->mem);
 }
@@ -477,7 +469,7 @@ static void endpoint_dealloc(struct xillyusb_endpoint *ep)
 		struct xillybuffer *xb =
 			list_entry(this, struct xillybuffer, entry);
 
-		free_pages((unsigned long)xb->buf, ep->order);
+		kfree(xb->buf);
 		kfree(xb);
 	}
 
@@ -509,8 +501,7 @@ static struct xillyusb_endpoint
 	init_usb_anchor(&ep->anchor);
 	INIT_WORK(&ep->workitem, work);
 
-	ep->order = order;
-	ep->buffer_size =  1 << (PAGE_SHIFT + order);
+	ep->buffer_size = 1 << (PAGE_SHIFT + order);
 	ep->outstanding_urbs = 0;
 	ep->drained = true;
 	ep->wake_on_drain = false;
@@ -520,7 +511,6 @@ static struct xillyusb_endpoint
 
 	for (i = 0; i < bufnum; i++) {
 		struct xillybuffer *xb;
-		unsigned long addr;
 
 		xb = kzalloc_obj(*xb);
 
@@ -529,15 +519,14 @@ static struct xillyusb_endpoint
 			return NULL;
 		}
 
-		addr = __get_free_pages(GFP_KERNEL, order);
+		xb->buf = kmalloc(ep->buffer_size, GFP_KERNEL);
 
-		if (!addr) {
+		if (!xb->buf) {
 			kfree(xb);
 			endpoint_dealloc(ep);
 			return NULL;
 		}
 
-		xb->buf = (void *)addr;
 		xb->ep = ep;
 		list_add_tail(&xb->entry, &ep->buffers);
 	}

-- 
2.53.0

