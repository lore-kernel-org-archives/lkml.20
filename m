Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438482DF126
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 07:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788076102; cv=none; b=cJOx1tqnRXt2z9a1Y46ifGsn45z4XK6YIK9/vQMHykyxiHkQv2qPaOcAFeWuabFVE6SHdUTVj9quPO6UB3eYxOP0Y7pSpyuMSjzp8tRiWVV/OUp1KJp0ZlJyCWqMsz5Ow5Dl9ayOPr3TTTDL3JX/tq5f5S9U73BFRCSD9rNz/HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788076102; c=relaxed/simple;
	bh=n+5ocaPGXB4h/fEG7Ow84+igxwd3GP3acqNKMVgGa5s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HUpv1TEft5dz7l7l92ZdC061K+C/ZjCZ+iu48NZ9/aBMpjaTbdJyxjT4MQUiJf+MySqejAwdN4CWcATnbyyrPi9MGTvFMTXBLDs3gS2TVEXy9ubeuO2aKmuWIzPDpMUlLhn92wIpNeGaIxrJJyuzBDlPOqkWvPUFmkqB67nH7Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j4ktx4jy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j4ktx4jy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FE301F000E9;
	Sun, 30 Aug 2026 07:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788076100;
	bh=XPiSY9Bg2IUmtzWz3D0CJ/RjIxKOrrK01Vto+HJVySQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=j4ktx4jyXz/KrmL0BMXIAcnNMVGRcpncozoVazBsVEq0DQ1QMoznmPt00il0SqMro
	 arr9cHkcyoymqcJ7BKnbvNLt/5eB9ELfo9e1chMcnXFryp65iza5Vr36r/p7nGHSUd
	 E1W/jtNNZ/nDz3QsyrEGQkBzP3ex3xlnQeNx4MoAQ+bVpj1m+WnjY8aeTQ4VwF705C
	 b/zq9GLiTWwMg+cW5bKsBjq409aTTR2X0/KHXY2j/rMvJ1g9dKJbnJtfzGB1f+77c2
	 PMBlzPeOA/s/3CQAtDVgX9FJpYyLHYQqzq5DVfe2ALOw7yBY7XaFnzqkmYro7l04Gv
	 kWPhAqASy764g==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Sun, 30 Aug 2026 10:48:01 +0300
Subject: [PATCH 4/4] platform: goldfish: pipe: replace __get_free_page()
 with kmalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-char-misc-v1-4-05e2ce44f291@kernel.org>
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

goldfish_pipe_open() allocates the per-pipe command buffer and
goldfish_pipe_device_init() allocates the buffers the device shares with
the host. Both are passed to the host as physical addresses and must be
physically contiguous, which kmalloc() guarantees.

These buffers can be allocated with kmalloc() as there's nothing special
about them to go directly to the page allocator.

kmalloc() provides a better API that does not require ugly casts and
kfree() does not need to know the size of the freed object.

Performance difference between kmalloc() and __get_free_pages() is not
measurable as both allocators take an object/page from a per-CPU list for
fast path allocations.

For the slow path the performance is anyway determined by the amount of
reclaim involved rather than by what allocator is used.

While on it, size both allocations after the structures they hold instead
of always taking a full page.

Replace use of __get_free_page() with kmalloc() and free_page() with
kfree().

Link: https://lore.kernel.org/all/635405e4-9423-4a25-a6e7-e03c8ea0bcbe@redhat.com
Assisted-by: copilot:claude-opus
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 drivers/platform/goldfish/goldfish_pipe.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/goldfish/goldfish_pipe.c b/drivers/platform/goldfish/goldfish_pipe.c
index fa241ca8feb0..3f34db896ece 100644
--- a/drivers/platform/goldfish/goldfish_pipe.c
+++ b/drivers/platform/goldfish/goldfish_pipe.c
@@ -708,12 +708,11 @@ static int goldfish_pipe_open(struct inode *inode, struct file *file)
 	init_waitqueue_head(&pipe->wake_queue);
 
 	/*
-	 * Command buffer needs to be allocated on its own page to make sure
-	 * it is physically contiguous in host's address space.
+	 * The command buffer is passed to the host as a physical address, so
+	 * it must be physically contiguous, which kmalloc() guarantees.
 	 */
 	BUILD_BUG_ON(sizeof(struct goldfish_pipe_command) > PAGE_SIZE);
-	pipe->command_buffer =
-		(struct goldfish_pipe_command *)__get_free_page(GFP_KERNEL);
+	pipe->command_buffer = kmalloc_obj(*pipe->command_buffer);
 	if (!pipe->command_buffer) {
 		status = -ENOMEM;
 		goto err_pipe;
@@ -749,7 +748,7 @@ static int goldfish_pipe_open(struct inode *inode, struct file *file)
 	dev->pipes[id] = NULL;
 err_id_locked:
 	spin_unlock_irqrestore(&dev->lock, flags);
-	free_page((unsigned long)pipe->command_buffer);
+	kfree(pipe->command_buffer);
 err_pipe:
 	kfree(pipe);
 	return status;
@@ -770,7 +769,7 @@ static int goldfish_pipe_release(struct inode *inode, struct file *filp)
 	spin_unlock_irqrestore(&dev->lock, flags);
 
 	filp->private_data = NULL;
-	free_page((unsigned long)pipe->command_buffer);
+	kfree(pipe->command_buffer);
 	kfree(pipe);
 	return 0;
 }
@@ -833,13 +832,12 @@ static int goldfish_pipe_device_init(struct platform_device *pdev,
 
 	/*
 	 * We're going to pass two buffers, open_command_params and
-	 * signalled_pipe_buffers, to the host. This means each of those buffers
-	 * needs to be contained in a single physical page. The easiest choice
-	 * is to just allocate a page and place the buffers in it.
+	 * signalled_pipe_buffers, to the host as physical addresses. This means
+	 * each of those buffers needs to be physically contiguous, which
+	 * kmalloc() guarantees.
 	 */
 	BUILD_BUG_ON(sizeof(struct goldfish_pipe_dev_buffers) > PAGE_SIZE);
-	dev->buffers = (struct goldfish_pipe_dev_buffers *)
-		__get_free_page(GFP_KERNEL);
+	dev->buffers = kmalloc_obj(*dev->buffers);
 	if (!dev->buffers) {
 		kfree(dev->pipes);
 		misc_deregister(&dev->miscdev);
@@ -867,7 +865,7 @@ static void goldfish_pipe_device_deinit(struct platform_device *pdev,
 {
 	misc_deregister(&dev->miscdev);
 	kfree(dev->pipes);
-	free_page((unsigned long)dev->buffers);
+	kfree(dev->buffers);
 }
 
 static int goldfish_pipe_probe(struct platform_device *pdev)

-- 
2.53.0

