Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113099;
	b=fB1237gc+BL+vgzkBXjgv5lfvKvy/BHKm6OTNBKBvXRHmfcw20QagcnwyLtmpUEm1Lhb
	 2howIVd7X+XC82Eq/Ab1+FSJNW0e4kXWdT1JHO5/4ArEObOkVxr5GGhH44ksia1ZgJ589
	 i8mwXZe3UCHfXuxvPVrUNNji9PdB+CIX8SSHggJnfplhEaMLuhS0rH4oDg9aQh55aEgQR
	 P6+I35l20KQuYd/BjDLlU0xilC/MMs/KJ3EHTpji4RqPKwzaR2e/yAS6fpgw7xtwwaCdQ
	 HLSgfMXmNIy/KG/p548k0F6aMHCvNApcg7aJq7+5HSUj5JfjhuTnRRiB0TAUrZVcIlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113099;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=jssIQSspXl/EY+WWYyJGDJCNesre96XU3AFGRVe0xqg=;
	b=X0RXvc1SELYAG/IglD8CdVh0OcKMyPZ6NLRPovUaiEw2KPaJ7PvplcviFnBVwaAKZ94Y
	 LTD9oibrBMWPoqrX3BFgJpY1QR28Q0VClFZdD6beOTB1hMi7ycbDGxM6VakdwSehUpHK0
	 hkptuiO3I/JBZkrtOIU75EupyjCPnzYpHBRFGFL9Lpoi/J5mH5EG/lGIsoOIrQSx1tdAc
	 aM3kwTrTfzXlwDlJbSDx3k6KZgRCr+/Z7TeCQ+AnbTHansvuWiGidlQODfNva/GOWk5EW
	 +ZQW8pOBLCea9o7UzhasLLpZjxBpz2+mblHq7qUJNclqUWCE5octk6DIMn24EDSNnUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=bgyWYo23;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E9860A3816;
	Tue, 27 Oct 2026 14:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=bgyWYo23
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5159E1F031E1;
	Tue, 27 Oct 2026 14:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793113098;
	bh=jssIQSspXl/EY+WWYyJGDJCNesre96XU3AFGRVe0xqg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bgyWYo23Th1DkYs1G5vnj7Za06l6JxiOupAPJ9+e9Pde1MuIZq480zTrj1by0L047
	 EbOI/E2vJ4fl6J+HFz7vgxzSHvzU9yzRQlC1qc4TlwVjSkcOaieM92UqRKvGyZjcfm
	 zy6OFYwfsqJhHW7rZ+CmqFtyAgisyj5QpLbV+IZU=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 15:57:49 +0100
Subject: [PATCH 09/19] usb: gadget: f_fs: let the request keep its fence
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
Message-Id: <20261027-llm-usb-v1-9-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
In-Reply-To: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Josef Bacik <josef@toxicpanda.com>, stable <stable@kernel.org>, 
 Neill Kapron <nkapron@google.com>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=2853;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=vsgauJWhaHh8ZCX8USw/Fzefhi8HwPoT+bjTiQ7KUfI=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPdr97P704SC22S7Z94gyrlEWTU1UnrxSbXKxVy35Ec
 OvnWJk/HbEsDIJMDLJiiixftvEc3V9xSNHL0PY0zBxWJpAhDFycAjCR6QYM8zMFl9zY6sO01KZu
 1fSA6GutDmbdaQzzDKKeKhy7HLt7yTztL9P/LZ83WXHlFwA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

ffs_dmabuf_transfer() stores a plain pointer to the fence in the context
of the USB request, and since the fix for the fence leak it drops the
initial reference right after dma_resv_add_fence(). The only reference
left is the one of the reservation object.

That one does not last until the fence is signalled. dma_resv_add_fence()
replaces and puts a fence as soon as a later fence of the same context
and the same usage is added. All the fences of an attachment share a
context, and a transfer on an IN endpoint only waits for the writers,
not for the read fence of the transfer before it. So the second
FUNCTIONFS_DMABUF_TRANSFER of a buffer which is still queued frees the
fence of the first. When the first request completes,
ffs_dmabuf_signal_done() signals a fence in freed memory and queues the
work item in it.

The leak came from the reference which ffs_dmabuf_signal_done() takes
and ffs_dmabuf_cleanup() drops: with it nobody dropped the initial one.
Do not take it, and leave the initial reference to the request until the
cleanup.

Fixes: baa6b6068a3f ("usb: gadget: f_fs: Fix DMA fence leak")
Cc: stable <stable@kernel.org>
Cc: Neill Kapron <nkapron@google.com>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/gadget/function/f_fs.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index c64a268e98a4..26f511794d6f 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1447,13 +1447,12 @@ static void ffs_dmabuf_signal_done(struct ffs_dma_fence *dma_fence, int ret)
 	struct dma_fence *fence = &dma_fence->base;
 	bool cookie = dma_fence_begin_signalling();
 
-	dma_fence_get(fence);
 	fence->error = ret;
 	dma_fence_signal(fence);
 	dma_fence_end_signalling(cookie);
 
 	/*
-	 * The fence will be unref'd in ffs_dmabuf_cleanup.
+	 * The reference of the request will be dropped in ffs_dmabuf_cleanup.
 	 * It can't be done here, as the unref functions might try to lock
 	 * the resv object, which would deadlock.
 	 */
@@ -1737,8 +1736,13 @@ static int ffs_dmabuf_transfer(struct file *file,
 
 	resv_dir = epfile->in ? DMA_RESV_USAGE_READ : DMA_RESV_USAGE_WRITE;
 
+	/*
+	 * The reservation object takes a reference of its own, and drops it as
+	 * soon as a later fence of this attachment takes the place of this
+	 * one. The initial reference stays with the request, which points to
+	 * the fence until ffs_dmabuf_cleanup() has run.
+	 */
 	dma_resv_add_fence(dmabuf->resv, &fence->base, resv_dir);
-	dma_fence_put(&fence->base);
 	dma_resv_unlock(dmabuf->resv);
 
 	/* Now that the dma_fence is in place, queue the transfer. */

-- 
2.56.0

