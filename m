Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793027403;
	b=SWFp5BJtf2h9nRER1MthMBl9I/wM/TvjqX38kdOyX1skHUmABN5QchsTbGbsQe2bZvPQ
	 3++B0W086PmivjGZo5XPGvwbbYk7pGx9M0daGr2Jy6+Ifl8DrT+xjrevGQS1wXNULApuY
	 sDZC4gk7qj75OSVNFudphecu/oN1EyLFVuF5EHxqbdUuLBaHhlYIvsYnSkAZLC7vbTjWA
	 2ouHZsStwIn+NE4M++n5n/ctCr34XgdEEIJaDuFmr6frMmJhR2s1yimMTbUQ4D13i8iGy
	 Vc9t40RNMa/QORITiim+fSbIJGXPWPO0Bj6UEeu12VJBDTtNn4yCjwbBV/0FF/HgYHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027403;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Mailer:X-Mutt-Fcc;
	bh=hdqkyE3cMmVjZdiqL7neZ4CIjAaefrQUqkPMqmDXm1o=;
	b=okalcBjtJWs38JJfAe28QxnP4QOWLZ0TXnV6fX3xOIuPV50/YGRYmlBPbwWk2kTP48s0
	 WGWHXhJeP2nWdc55tnr42SRQwbEPa1NkesvKHBmABtqWKCzI0ZjwYhzg3YM2HgrRzB1rS
	 N4YjOfylBeoKi9YUsHo3SwCm+C6q+LygsVKl7sFewXoCpYbYnlKcj+koa2MYiGDBLpoUK
	 YlyMDEYXMA//mwVHHIE8pNdyfStgTjjTpszEO3yPftwvi+CzwXBa2lEx3gDuvmTpTFwjN
	 wocOcnXppPsIAHawPJLBoXxJ0c9SKjsgwbbEqF8OTUm58rMBMpnOO6MwbsmP8X6Pxxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JC4gY4O3;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=BIKMN0vg;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A16606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69A16606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JC4gY4O3;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=BIKMN0vg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793027402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hdqkyE3cMmVjZdiqL7neZ4CIjAaefrQUqkPMqmDXm1o=;
	b=JC4gY4O3Fm57IeFYUYuGqLs5NkVFkPz8bM3ZVdPNXXdkYuwhgE/ARKEdjmUF2awr+iuqHw
	A/navDOFvsCZ9O0WlpcROPnCp4hPwjFReaRrBX1g4iOejj2evXaquO3BF0pmpyPWhizy6s
	nK/RP407mI1Z3MhdqeooY0EPICRDh9o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-KvqznNhsNB6Zn2e2QVayuA-1; Mon, 26 Oct 2026 11:10:01 -0400
X-MC-Unique: KvqznNhsNB6Zn2e2QVayuA-1
X-Mimecast-MFC-AGG-ID: KvqznNhsNB6Zn2e2QVayuA_1793027400
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48b02d63407so2199793f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793027400; x=1793632200; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hdqkyE3cMmVjZdiqL7neZ4CIjAaefrQUqkPMqmDXm1o=;
        b=BIKMN0vg84YPLcQuhfP5e4Dv8j4OxM2dlfQ9Vv5MWHot/pUcmrl1nfWzG6LjZ/Yv3t
         fZLYOFtzb/9JC57qVLAjWQ1GFwQzGrzfplGrvKKOtNvOiFPpbc+7AHxxaRH37E+c+Bpb
         /z9/70g6Zs7BFgJqaXhmYpo+8nrfyEyRFB/fzX3rydT52PUM/Ib2Q9+pnc6PdtmvlBCN
         0yVxXwNA27t/997ChGXSYFBOLW11cIItJ3FvqBjznTo4aWsG9NB/g5upPURVRuDK2ga4
         oHI4IbO6DRvfVk6UHwW+vVe4esg6EjeUgkP1RLlgct3hy8dDul7AZ4GGO6AufJKfVqo4
         Uj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793027400; x=1793632200;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hdqkyE3cMmVjZdiqL7neZ4CIjAaefrQUqkPMqmDXm1o=;
        b=1cZ7ZBeJWRaXjnO7qcMVBtnZumQ0OfpKn/psz7sl+7QNqRyebvDGMPF2Q+bKG2xThz
         5zsYv3G4Yf9UTPqIMRAsF2toEPfc51h9aPIGuQEzUjGPIMquMMUoZ1AgAGh5loMXiJj9
         ByRbdlCDDqAwFj4t+TCqt+WJ3XTgmO78N4/as/Ow2mJo3hX/DP/Jl4AC6IyhoRp/w/Gs
         mF92PAwOuGk8tXFTBz+G5lxlESDUlEsmt0a+iGT1P0xNy83HrgcuDgQEahq9+ORW16JB
         DjBYN9ssolf1ulipVBbjzCr+xuA700q5nMmrGJR/7CdCERojLzsdfqH7qSOuexUvi8QC
         dBgw==
X-Gm-Message-State: AFq9FYK0evlwNbHG5W8D91zKhOAteLZVhiSU5dFrnlQSbm6+KRN0/kXe
	N7ZtkF4A8X67DAVJKD3Ps+V0EKlyyRBi9jKj5E3hw43+zHJBuDzBifL/I5ghmVszIFEh7KvW2a1
	Iv0XYv+8TMIr2VCotxjnt6ArUFBqkSyitdvwJj9oGV1hz8z2aKTN6k7nfrrJZcgf2fA2lh3wEOQ
	LWmm2kXasK+12Psp4pribmXs4pseWrFGzVSmPJV0NkwMw=
X-Gm-Gg: AYBFou2eKy/5AXtKT+IHJrUqAlr1K/xXJyKhiWzpSSSm9UZlqslg4FklmlxRGSXPqpA
	FQ5UW3n7cWsaLSaqeVatvItHwnDMHgrtu5jfclhOtysDemhgLZst690rP77dko5yX4JM2u3vGvS
	pH6WgrZExJj1pCT44fXlD6Fn2s9aLOfcfQfnie4vOb9FCqm/ZWQklFvRW//ddHHYUeokDxWLFIK
	QN/FOWuJ0vI2wGWEtwW97XouIsZOk77ECkyVmcYyfeMPmoFvU2Skx0rJrAsdZB/x6GZqhVVlUD8
	Wv9jWNVM8H2hsKl7gun1YxVtPlZDV4R49K8YVLiAuu2Dfnz3bsg9O9n6qj0JZqgnIs0=
X-Received: by 2002:a5d:5405:0:b0:48a:f0cd:8712 with SMTP id ffacd0b85a97d-48e3eba30c9mr9661379f8f.50.1793027399532;
        Mon, 26 Oct 2026 08:09:59 -0700 (PDT)
X-Received: by 2002:a5d:5405:0:b0:48a:f0cd:8712 with SMTP id ffacd0b85a97d-48e3eba30c9mr9661300f8f.50.1793027398857;
        Mon, 26 Oct 2026 08:09:58 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb902sm17773862f8f.24.2026.10.26.08.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 08:09:58 -0700 (PDT)
Date: Mon, 26 Oct 2026 11:09:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	virtualization@lists.linux.dev, Ruben Hakobyan <hruben@meta.com>,
	David Hildenbrand <david@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Subject: [PATCH 2/2] virtio_balloon: submit reported pages as individual
 buffers
Message-ID: <6668d51dbda117d05d2eddd47db6ad69baab8b0c.1793026707.git.mst@redhat.com>
References: <ad6a530f49c4a0e182112a73789e31b5e91f3bb7.1793026707.git.mst@redhat.com>
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
In-Reply-To: <ad6a530f49c4a0e182112a73789e31b5e91f3bb7.1793026707.git.mst@redhat.com>
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent

The virtio_balloon driver reports a scatter-gather list of free pages
to the VMM so it may discard unused pages.

For an arm64 kernel with 64 KiB pages, the default reporting and
allocation orders allow entries ranging from 2 MiB to 512 MiB. If the
report contains a sufficient number of large entries, we will end up
with a descriptor chain that represents over 4 GiB of memory. This
violates virtio spec, which says:
	Drivers MUST NOT add a descriptor chain longer than $2^{32}$ bytes in total;

Specifically, submitting $2^{32}$ or more breaks Rust-VMM.

Submit each reported page as a separate virtqueue buffer instead of one
buffer with an sg list of all pages.  This also avoids indirect
descriptor allocation (kmalloc in the reporting path).

To avoid multiple buffers causing interrupt storms, keep callbacks
disabled while we wait for an event.

Note: if the virtqueue is broken, wait_event on
virtqueue_get_buf hangs.  This is a pre-existing issue:
the old single-buffer code had the same hang.

Reported-by: Ruben Hakobyan <hruben@meta.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

Lightly tested. Ruben, could you pls help test?

 drivers/virtio/virtio_balloon.c | 48 ++++++++++++++++++++++++---------
 1 file changed, 35 insertions(+), 13 deletions(-)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index f6c2dff33f8a..363519fa890d 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -202,25 +202,47 @@ static int virtballoon_free_page_report(struct page_reporting_dev_info *pr_dev_i
 	struct virtio_balloon *vb =
 		container_of(pr_dev_info, struct virtio_balloon, pr_dev_info);
 	struct virtqueue *vq = vb->reporting_vq;
-	unsigned int unused, err;
+	unsigned int i, err = 0;
 
 	/* We should always be able to add these buffers to an empty queue. */
-	err = virtqueue_add_inbuf(vq, sg, nents, vb, GFP_NOWAIT);
+	for (i = 0; i < nents; i++) {
+		struct scatterlist one;
 
-	/*
-	 * In the extremely unlikely case that something has occurred and we
-	 * are able to trigger an error we will simply display a warning
-	 * and exit without actually processing the pages.
-	 */
-	if (WARN_ON_ONCE(err))
-		return err;
+		sg_init_table(&one, 1);
+		sg_set_page(&one, sg_page(&sg[i]), sg[i].length,
+			    sg[i].offset);
+		err = virtqueue_add_inbuf(vq, &one, 1, &sg[i], GFP_NOWAIT);
 
-	virtqueue_kick(vq);
+		/*
+		 * In the extremely unlikely case that something has occurred
+		 * and we are able to trigger an error we will simply display
+		 * a warning and exit without actually processing the pages.
+		 */
+		if (WARN_ON_ONCE(err)) {
+			nents = i;
+			break;
+		}
+	}
 
-	/* When host has read buffer, this completes via balloon_ack */
-	wait_event(vb->acked, virtqueue_get_buf(vq, &unused));
+	if (nents) {
+		virtqueue_kick(vq);
 
-	return 0;
+		/* When host has read buffer, this completes via balloon_ack.
+		 * We report pages as individual buffers, so arm the callback
+		 * to only interrupt once all the queued buffers have been
+		 * used: otherwise we would get one interrupt per page.
+		 */
+		for (i = 0; i < nents; i++) {
+			unsigned int unused;
+
+			virtqueue_enable_cb_delayed_max(vq);
+			wait_event(vb->acked,
+				   virtqueue_get_buf(vq, &unused));
+			virtqueue_disable_cb(vq);
+		}
+	}
+
+	return err;
 }
 
 static void set_page_pfns(struct virtio_balloon *vb,
-- 
MST

