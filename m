Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793058815;
	b=AIMl4cJr6gcF7kt17rKGXtCi2kDdZDiLyP8Y/iLUAOJoJvOgXscQ8x4Umz2sKij9HbWg
	 /KDCkEU2SHhRX1yh1/x1SThrlrS9eHWPG6zqax/EEUySG5mhzm6zqiUiIdHlZ2nJjmQeq
	 eC5EwsnCiIpv9fTP4/t7UR4VQg/2OYRjAmTlruClg7xkWw3l9EXnO/5YI0AxK72FwiCyx
	 qRPodOAh7XSksWpp4O5RrxthOreRoRm2EVLLPJyFFaOzdGDAP44z6MyoZR/GQM3lo5xUL
	 8rdW3VyAs6oDObbMQtL4niRrsJhPbnHxGH0RRkGOwMjwfB4OLf7DwlqVJwQwLwDOJtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793058815;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Mailer:X-Mutt-Fcc;
	bh=aHUF1M+fidDDJ3+WmYV9zM0U4gJMDdswMRaltUWboIo=;
	b=nBmyAiYWZrFjWTqMJ/3At3tIn0eTR3swACbBpAs2+ebXG49PJKlS2DqoBw+kGvtJEAgQ
	 67SInm7si2aQUvDfPp+BsNavHHQfghAA5kWru9LZGQrTKADHDLmvHdBcVjI3Gbvft6Ayr
	 QQkY4m4TtRgpQJ+js1ZAONiKDfnre5MD6a602mYXa/rdeEwgb+8hWdCM6+y+pxWnTGAa4
	 xoRsgA4bkRPmo/z0zFIyT6x8QtVDUafJPRIwqKoBPMNxmx8PH+h6IiUJHEca2aJMSYbq/
	 lEW/mB4fJf+E9l6v/ySBk2IGmTCqpaSleUo7L45At+itzBO6pUOqtX1vTTbDkp8gcPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ce+9A87Z;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=N3u2ucHc;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB52606A322
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BB52606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ce+9A87Z;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=N3u2ucHc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793058814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aHUF1M+fidDDJ3+WmYV9zM0U4gJMDdswMRaltUWboIo=;
	b=Ce+9A87ZQec/LAkZ5NPrEhW1s2uSS8PMaK/pIH8wsF8HaRcQY1gfx0gZnc6hGWbZTfWZz+
	+1sHDVajYpaM430o3I2qnEtF90Meji/Nl39t/KQW1o9Gxc+U1M4X7B5CnwbRy5DYFQNfeD
	SJIYuPttO3ncalWJaFy+C5wNU3QtZCY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-Ge9YScP4PzOvudI7PWJPsA-1; Mon, 26 Oct 2026 19:53:32 -0400
X-MC-Unique: Ge9YScP4PzOvudI7PWJPsA-1
X-Mimecast-MFC-AGG-ID: Ge9YScP4PzOvudI7PWJPsA_1793058812
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a2065a2ef9so34159835e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793058812; x=1793663612; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aHUF1M+fidDDJ3+WmYV9zM0U4gJMDdswMRaltUWboIo=;
        b=N3u2ucHc0Te0LX55NFyt+YHyWPfRKVrzyAsfq4ZsPI9xn2Lg0q5oYDTFf53XXxaf+h
         f8455UkCunKenH0o77asYgzCWRfO7zfmZXpZM4h5oghfDT/Ff4NZSNE7376MBeuFHY1d
         W2nqMOhVpq6QhWEOLnMXcfNqdMpckG6Xpc9+2XuwE/tfGmKdoOjcGTxZ7ZkW/t7iVnLd
         rew/KcQUue16bAvyPcgxmx3KCwoJMF4+2DUwfaFy7NZ8PSmlZfTQcWghEF5XQAJAoLLX
         AW0dVxHrDrDuToGJlNpbSbUKZK4TRXUH/eJxgt8YmhQpwgVZDPW/pUZt7trj0pHwr1DP
         8+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793058812; x=1793663612;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aHUF1M+fidDDJ3+WmYV9zM0U4gJMDdswMRaltUWboIo=;
        b=BumFWxt2M6E0ammSuuVzPlijW1RQte/mv47jsCTkc5o17sgvAqnDb8xBMNv90h3D4c
         wqhxf4agn+SqX7io1PeuzKyEPLuMTbvO0zQmTo2VKpFk79iXxyoNJZMwhCmvAJznpXsZ
         rrzVQV+auWebmhWf3tsWZ/3F8XJjWUQ89eirbljgAd5FP6i9fUJGw6PVeTJybSaQCPNM
         DAa8Gnh43ZSJOqLUb2yTDcV9Z6ontIJG8y0qw4xhFYYGM0Aoj2GnSrUH+RN5u+cNZTTg
         yZr4105AeWv2T6+QNDYJ6+PbJnRA0qqRpRZcqKc5XIg/qsMB03JEBgDTWwK4GXSPm/jp
         CwBQ==
X-Gm-Message-State: AFq9FYLB9DErPyL9kk8z1aC43VRtDD0u36y+faR2nTRckEd1+U0IUEsE
	TiLLx64i+gGqnroGgVSIKw7SHfj3B6xKXNbof6FWEdEugTp8M3m0NvOycBFhWVZIYWDzXIMtEoN
	IpNwaAW4y9PijUEdZQ6u/q4Ba4zdFAMjJYQq5kENOh6Mm30nPE++I6pY8ltnXYQN4tP3UXik59+
	xRNWObYY6COu1OjUBxgU6VgoUQ5gy9fzuK2gpCzS4Fxtw=
X-Gm-Gg: AYBFou3G0HCXiRIM1zViSEXDarSFeZrz121iVDofjK5Md+qHAwdSxFJLbdho8ShYXo0
	ibx+S9bM3MGU4/Vc2FjbpaVrPmc+3XZHpe8Lv1X4xpn5nEg+8cNGsBkEmXWxMZSEDVlUaKSDVy7
	a49TAjwofzK8qYd5Cxw3NJm6S5tdPlZEh3QS2TgsGidtJOZfd/5NcsWjb84eQuIc5cwWOvth40h
	I4grg5KDd+1sdM8WpXM5GK4+2nbC9tH/diUmA686aqCDXRXN+BBWmAHbQextLKxMkhL0a6fNeAH
	E4Rww0HjwN9VMyG8rCB8H2sqe2QJA812mIV2Y7/nxWj4AQdNmCNGaw9kcUt9Ab6RK34=
X-Received: by 2002:a05:600c:3114:b0:4a3:5a55:f454 with SMTP id 5b1f17b1804b1-4a35acc772dmr152484485e9.19.1793058811565;
        Mon, 26 Oct 2026 16:53:31 -0700 (PDT)
X-Received: by 2002:a05:600c:3114:b0:4a3:5a55:f454 with SMTP id 5b1f17b1804b1-4a35acc772dmr152484055e9.19.1793058811049;
        Mon, 26 Oct 2026 16:53:31 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a58a0e2sm280919645e9.13.2026.10.26.16.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 16:53:29 -0700 (PDT)
Date: Mon, 26 Oct 2026 19:53:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	virtualization@lists.linux.dev, Ruben Hakobyan <hruben@meta.com>,
	Alexander Duyck <alexander.h.duyck@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 2/2] virtio_balloon: submit reported pages as individual
 buffers
Message-ID: <02257263433b001cd0a55a52486857df81dd4246.1793057483.git.mst@redhat.com>
References: <32e21059adb6cb1fd08c3f4426a313c77cf450ec.1793057483.git.mst@redhat.com>
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
In-Reply-To: <32e21059adb6cb1fd08c3f4426a313c77cf450ec.1793057483.git.mst@redhat.com>
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

TODO: as an alternative, keep using virtqueue_enable_cb_delayed
but add buffers after there's space in the ring.

Note: if the virtqueue is broken, wait_event on
virtqueue_get_buf hangs.  This is a pre-existing issue:
the old single-buffer code had the same hang.

Reported-by: Ruben Hakobyan <hruben@meta.com>
Cc: Ruben Hakobyan <hruben@meta.com>
Fixes: b0c504f15471 ("virtio-balloon: add support for providing free page reports to host")
Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

Notes (changelog):
    changes since v1:
        keep callbacks disabled while draining: get_buf re-arms the used
        event for the next buffer, reintroducing an interrupt per page.
        Disable the reporting vq callbacks at probe, and only arm the
        delayed callback to wait.

 drivers/virtio/virtio_balloon.c | 59 +++++++++++++++++++++++++--------
 1 file changed, 45 insertions(+), 14 deletions(-)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index f6c2dff33f8a..b88b463488e0 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -202,25 +202,53 @@ static int virtballoon_free_page_report(struct page_reporting_dev_info *pr_dev_i
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
+		unsigned int unused;
 
-	return 0;
+		virtqueue_kick(vq);
+
+		/* When host has read buffer, this completes via balloon_ack. */
+		i = 0;
+		wait_event(vb->acked, ({
+			for (;;) {
+				virtqueue_disable_cb(vq);
+				while (virtqueue_get_buf(vq, &unused))
+					i++;
+
+				/* Stop waiting if device used all that we added. */
+				if (i >= nents)
+					break;
+
+				if (virtqueue_enable_cb_delayed_max(vq))
+					break;
+			}
+			i >= nents;
+		}));
+	}
+
+	return err;
 }
 
 static void set_page_pfns(struct virtio_balloon *vb,
@@ -635,8 +663,11 @@ static int init_vqs(struct virtio_balloon *vb)
 	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT))
 		vb->free_page_vq = vqs[VIRTIO_BALLOON_VQ_FREE_PAGE];
 
-	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_REPORTING))
+	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_REPORTING)) {
 		vb->reporting_vq = vqs[VIRTIO_BALLOON_VQ_REPORTING];
+		/* We re-enable callbacks after add, when we want them. */
+		virtqueue_disable_cb(vb->reporting_vq);
+	}
 
 	return 0;
 }
-- 
MST

