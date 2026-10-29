Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793313000;
	b=3JAoMG3/hJaRAwaQ/rVVZ6C8+RHKeIcYDIiGSbquvvAkHkjyBFlT7l1eFoojd9jOk4gp
	 NUHc1i3giewh9avzfRFIkTbwVlA5Lig9eTcNdglGPBx4G997PhU+dvp/Kxw1laGN1wXaU
	 Tn/U247H0azp2CmimVoUCxfUK05LNrthZ/Gdm7I1eez3nDVo4+c9p62LqhO3XFbp327Fx
	 lMGASwOdBkKYCbPNiKXzd6nB1/MfSUTrc3IeJFJIE0MMxhNY+UPW3QU0gHru93ikG4i4E
	 TTaLsk3YgkN+Nrvkv//qa8Qu5LEmmQVXBzAD4xoXyICN250n9cqnqbaZMN/7y55ch1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793313000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=yCAhvvfFaIXRbwj4Slp/VrdUH7ygbm1KTvnKrDnSH20=;
	b=x6RqcAwWSoMmAItS96rBj9y1kZKANrlj5+kUy8fsx94HKUMmW9elUAOjXu9EIYuuJX9X
	 A8TXuz3vPuPn0d2JsoCGyWowbeY5mgXxmfKFjW+9LI7LmY9MNU0KFRKsNJwyvCrojslA6
	 Aktt0iMVaWcSHL/F4luB7qQ6V5AvF/yG/Fddf1k4NvnpBPH82UGZGTD5eFIP4VrWABLnt
	 aDoDylfiuLxWGFzjHvVaMSQCpoM3hoRxZ2lNut0Kz+rem7qF/SxM+ILaO2l9CeSJpw3NH
	 lpwPHPFKc614L5q2yLOoVavvj86HSfAAnvXQXqVEiakBXnynXTQcNdUC+/7kHd8u1ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OxM1ucKg;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286F0606A33B
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 286F0606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OxM1ucKg
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-8253bc5a613so141744a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793312991; x=1793917791; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yCAhvvfFaIXRbwj4Slp/VrdUH7ygbm1KTvnKrDnSH20=;
        b=OxM1ucKgDXPG7sbLLGQmeUDyCJPtiza8J60dj2KfoAsXC3e3up735bPPc1uDnxeyVD
         vnK0PXPZ23856N0bPn0moU8dFPy7NvnEWibSy5TDuHuKxK1dPvDU8yHZcrnEj8E6gr9w
         t4NfyO9fsJO87rUfwicAk6gwAKS6fwpFXQW3qMrOMge+RR66yqlU5A7nalACnHKK9+fp
         0gY0n5gu5jFtkVMNbGVH28o/p13o7LjspXvqKnaM9SQEXZvDmwLZs7RpjAIw5T+5Sx/0
         PY9ypdK3uPJMkon9AMnoC4/YZGeKIQqK213YEyHJtmQ1yFHZ7iuSeobHbDddpU21jJgv
         rF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793312991; x=1793917791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yCAhvvfFaIXRbwj4Slp/VrdUH7ygbm1KTvnKrDnSH20=;
        b=FagznYG06GP635/dWyLKAYmJNjHgR5H0Tfj5XIj40i3aGGfWHSJCmq5WsmBxVkaWhR
         3YVfne8m2j28i6sREnK6MIrTdo39DCNf8ZBVRvY9B6MhcBg16y1Qh3HtSiWqUPDJll6d
         mGP2msqXMKJuUleH/G3WRhQZZFTNJDpLmy2pUguhNEGe7Nzlc9QJZmKc2RtFy17olIzV
         C+MUCGQ6LNpy3fwdHpmmmfD2dKmVEMGa5ucVhqB5W23vwbiZatXtWuaPFfu5hnVSTDgY
         6HjfO5l8BpqI1tBxc4LKP8Px6Zx7ly0L/j7oTWFtvoLxvAVtMDdkpR/ZdWq0T0fCFCnb
         1JqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGVUHf5h9Kv11o0ZMkWvuNbUYpAIE3ARA4JHJtgWttyORsDm7M4XkekSqV7HIC9Tt0ajft4NZGfkAWqKE=@vger.kernel.org
X-Gm-Message-State: AFq9FYISrKkvYWOhyIedkqu9gylN23Op5MyAes07UkuyAkfGaZqh5RaZ
	+NZl3hm8qfuTnsC9BhB4RAfjmCh4zr42kCj4L7IvtqyfE8IfsxLLNBpL
X-Gm-Gg: AYBFou3swbTlHWQRdkvLHdT0D9mJJ6SZxdrspZvEtiBu67KuOc6Ckmrs5FPscV6d814
	ShpW7e82OX1GRVFNNIVPIOkwulFN+r4x/0U9n5jiShBY4f7zLNpdLsbZIbm2e5wUuQ25rDiz8gX
	04CSswA7TCHURvlT2qnoL/SKxU9HmqGA73C76LrnQQzk7g8oAd9BjTg+Ku7oIYwxJ4gtECLUE0f
	wX2psntkYp87ElSV3CdrRt3zcwjbScwwZU6quN96KB5v/hn59FS7bFLg0KqlTfdi2DzElhe/6zA
	BYGsxzyXk4ogbpakoN7S6LXIb747Mypm3b2iamF8yaqmSH1nWX1m6sGaqetBBCJ02RJYkx27nbQ
	MmJmNq4+djw+vwLj/Wh0eJrb3EXQYkVkHgU0gC03lDwmD/MjbRshDuMiPxLLaP6v7Iw694cQF7Z
	qe/72GjCeP0+w8QQrVINFBNK1atnU1eBlXZM0e3W94LnhfwgdGCMmVdKeS9lMzFAwVBPuULbhoG
	SVazabJW//VsAw7obWq/UbBwTKcjTPOg+VJbeJlRn+1IB6IDHh9AJ+eTxHNzDpVthOV9e8cGUKi
	mznbGvDLWh2l3eKaTE+XLZU9FdDAJshW8vCYR2rqbX7vp/Byq2PnLI6BfBiTFjU45EuIzkBNuPs
	H7qikGttPQgRKuAWuqdpvI+PynK7HsFoRROzR/yGBqLs2YIKnRMUw00z6wv1s3RyvxZSidcswr1
	Es5wDvtwXN7OZybwpfNsT0XJIvdyCLbqt2E8YKZPv5krZUgEJegx/Br4YvKcRiOFUz1hAt2s6by
	g==
X-Received: by 2002:a05:6808:3189:b0:55b:f88d:6ed4 with SMTP id 5614622812f47-5640dc19ccbmr440937b6e.22.1793312991208;
        Thu, 29 Oct 2026 15:29:51 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fc49880sm236130b6e.2.2026.10.29.15.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:29:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 16:29:37 -0600
Subject: [PATCH v4 3/7] dmaengine: dw: complete cookies before releasing
 the channel lock
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
Message-Id: <20261029-submit-dw-dma-synchronize-v1-v4-3-fea447d9f285@gmail.com>
References: <20261029-submit-dw-dma-synchronize-v1-v4-0-fea447d9f285@gmail.com>
In-Reply-To: <20261029-submit-dw-dma-synchronize-v1-v4-0-fea447d9f285@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Dan Williams <djbw@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

Completion detaches a descriptor from the active list under the channel
lock, but updates its cookie later when freeing it. Termination can take
the lock in between and complete newer descriptors. Completing the older
cookie afterwards moves completed_cookie backwards and makes an already
terminated transfer appear outstanding again.

Complete cookies while detaching descriptors in the completion, error
recovery and termination paths. Keep the active-before-queued ordering
when terminating so completed_cookie advances in submission order.
Descriptor freeing and client notification no longer update cookies.

Fixes: 3bfb1d20b547 ("dmaengine: Driver for the Synopsys DesignWare DMA controller")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 51c5460b4670..1f7afcd01565 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -236,18 +236,17 @@ static void dwc_dostart_first_queued(struct dw_dma_chan *dwc)
 /*----------------------------------------------------------------------*/
 
 static void
-dwc_descriptor_complete(struct dw_dma_chan *dwc, struct dw_desc *desc,
-		bool callback_required)
+dwc_descriptor_free(struct dw_dma_chan *dwc, struct dw_desc *desc,
+		    bool callback_required)
 {
 	struct dma_async_tx_descriptor	*txd = &desc->txd;
 	struct dw_desc			*child;
 	unsigned long			flags;
 	struct dmaengine_desc_callback	cb;
 
-	dev_vdbg(chan2dev(&dwc->chan), "descriptor %u complete\n", txd->cookie);
+	dev_vdbg(chan2dev(&dwc->chan), "freeing descriptor %p\n", desc);
 
 	spin_lock_irqsave(&dwc->lock, flags);
-	dma_cookie_complete(txd);
 	if (callback_required)
 		dmaengine_desc_get_callback(txd, &cb);
 	else
@@ -334,12 +333,14 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 
 		/* Detach the completed transfer before starting queued work. */
 		list_splice_init(&dwc->active_list, &list);
+		list_for_each_entry(desc, &list, desc_node)
+			dma_cookie_complete(&desc->txd);
 		dwc_dostart_first_queued(dwc);
 		spin_unlock_irqrestore(&dwc->lock, flags);
 
 		list_for_each_entry_safe(desc, _desc, &list, desc_node) {
 			list_del_init(&desc->desc_node);
-			dwc_descriptor_complete(dwc, desc, true);
+			dwc_descriptor_free(dwc, desc, true);
 		}
 		return;
 	}
@@ -441,10 +442,11 @@ static void dwc_handle_error(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	list_for_each_entry(child, &bad_desc->tx_list, desc_node)
 		dwc_dump_lli(dwc, child);
 
+	/* Pretend the descriptor completed successfully */
+	dma_cookie_complete(&bad_desc->txd);
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
-	/* Pretend the descriptor completed successfully */
-	dwc_descriptor_complete(dwc, bad_desc, true);
+	dwc_descriptor_free(dwc, bad_desc, true);
 	return;
 
 unlock:
@@ -945,12 +947,16 @@ static int dwc_terminate_all(struct dma_chan *chan)
 	/* active_list entries will end up before queued entries */
 	list_splice_init(&dwc->queue, &list);
 	list_splice_init(&dwc->active_list, &list);
+	list_for_each_entry(desc, &list, desc_node)
+		dma_cookie_complete(&desc->txd);
 
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
 	/* Flush all pending and queued descriptors */
-	list_for_each_entry_safe(desc, _desc, &list, desc_node)
-		dwc_descriptor_complete(dwc, desc, false);
+	list_for_each_entry_safe(desc, _desc, &list, desc_node) {
+		list_del_init(&desc->desc_node);
+		dwc_descriptor_free(dwc, desc, false);
+	}
 
 	return 0;
 }

-- 
2.53.0

