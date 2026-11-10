Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794322375;
	b=FKz0nTKxfJd5lOWedwu2ZubppKgMznAfaGpUjwySIaK2IgkKaEkh242xM5b4wMyJ7hdw
	 kaFNNI0iU4vt5pf3q3TZlfZpD5VtkZS6mEpAf9QrULRVFW7gWxmdYoAH6Ig0cJrfJFtOx
	 3AoYlwE2IV62wC17t1y2JbVnN6UpW9TV4Pf9UuVPQQ2eHZ1ytESwAVNW0xvz4znVNJmKW
	 wXai7HzvKpAufawbsgwCNuWj7wEfDYbRT63SeS3Uth4tiapjsoB5CRxbXkLfzQuXOzVNM
	 mT7BMVENaYte5sd81RBdb5CF1ipajy/USsYUpnUqYcleajp6XpeZKklnD39MPZdStaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794322375;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BwatasSyxzcSR5rQ2WiN2NCOOtGU337FRGLRO/rHFE8=;
	b=N1if6EOp4CcmOzu5DTuwkdhIbshY3koAvUn0Fw+Al4osRvzQ75fyvmJuzVG+TgnbBxQs
	 yf3vskyXJqogwAPNe4IhY3bV6brgByVkN25Vsr/p0Oe6enSi3KoCMFLcQi0bVPRUAdHhl
	 ivYE5UKyloudPPe8mwZXvy2rmRw08+kSHUXMFS+hxBhrOXLrIr9WwocMrYeMoC9khBvqu
	 j6u841VEf10bLNpmOmX9rbNiRnpUl/jQQ4xN8fOzgZO+cdz+X4KRFrE/jezqajPT/5WyK
	 1sUC1Ws35ykS+JapLroaQtlbR7a88ZKf0X/iPyIsElS5ekEVH5tUoGpx4wLRNkDr79A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="LX1qXbg/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9025C606A323
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LX1qXbg/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2764F1F008A7;
	Tue, 10 Nov 2026 14:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794322375;
	bh=BwatasSyxzcSR5rQ2WiN2NCOOtGU337FRGLRO/rHFE8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LX1qXbg/O3SqIsVhXX5dPqCS13Wb9i92E6l1n17yBCB4OnnKsvUxOGHeu81PxeX7o
	 o9eck8S+w+0r5NELLlXM4xl7NZV8dRxCp6ToE00Tw5D+Z7Tui/RG4GWwu2JFsQFsJi
	 uxbQdEwE3QStUrUSmR6bKmEHkVfiMqG400XCA+HN4MOHgsqkF6inqyAQrHYqbxl8v9
	 pyqST8S0AxK1Q0GMPTycGbw8HLqOelVkDpZSS+JeCHLv7YU8w2YUcHPczuyTWknQZL
	 102gRAvIHoDGXCB3L+qju6iBqqo+ljQiWDMkM08229BdRSA4bVXnDoy5uAnuHsigSx
	 Kegoc9W2ZZabg==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.ams.internal (Postfix) with ESMTP id 663A11980047;
	Tue, 10 Nov 2026 09:52:50 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 10 Nov 2026 09:52:52 -0500
X-ME-Sender: <xms:wS_zak2W15IeFWn6kiyZTKk_0WwBxL9eKgrsBBFJORWUCTtbi7-08Q>
    <xme:wS_zavMM2PnWiv-kvgrNmh_7ZbXZrCvUZjOBqfMrGl5_tizfJQ5VrbbI9PHrD3z4m
    IEBWjWChULmn7DArkv60t8ZxFGiLMayYZZYDsbqkXHbzP3bozL9XrCo>
X-ME-Received: <xmr:wS_zaqszeiG2xVxpOI5pnM0D7M68peht3izRM5FN63Gqq2bMAt2oxnowDvE>
X-ME-Proxy-Cause: dmFkZTF+Cn+fSgda5ibRlg8z0HHd47AdQqgPs/uBN4NgEssRGADLpXszo7EdJ4hc6xz2Ef
    EUmaDyZaXcY+YL0D35VcXklWSGO8Ug1cC0CybUOo3mwF9pj0hl/2YQ82hQmzmrFF0mRvwv
    gl679KsfUxnSOavz6lY9EBi8U3CsSXr4Qnl0BS5Rjmt6ZpTTzNrlaWD4twI7L0h6db8KXe
    hL7mENu+NTXE/lgl7zKZ9G10X0CMpXoxVLVIFrzoEBolZB0xMHBwNm+EeoQ0TpWfQSdq79
    aWiko1YyVPAhQzDQdIdJfHn8x09SHcsYyBmY2iIQ7sfSmOyy2AqqhOBitTCqCwP/4fGaI0
    XAaUzKekg4g5tv+R3G/J8OgkJRg9K6kNgoFNH+6Oy5Q7CcgTDen2gesRc62jCx+fjrLQ3K
    2exx18ViYCt6lbV6J24anM3UtlAkUjkngmjn9FUZijG1U2klJLxsqPn/kUMOUAEGiFpYrj
    OmRQdmGlCGksTx5ePE0T6RF2aRHEPgskEVJZXZpTlDZPiTuaoAqQfRkg7/Bg14Z7++dpwB
    SbwlTGt4xiBzrauvN2gFWqvxlrwBjsEu+xnbV+fNgH9vS87ZH0+8a558EIaVVvFotxIcgc
    ipM7UkzR4MenaTa2sJ5cP+Rz55HMVinydGQ70cCSY6Q3tFL4HhSWy9nTppMw
X-ME-Proxy: <xmx:wS_zaiHhDIsmgyNP81PC0H1Q7IfNyS-g10JBq9zAvIUESBWt-MKB8w>
    <xmx:wS_zalQvRUnfbzsKrRN4lLJsJkcphv-zz0_tiCgtm4R_d7bHP_bY8Q>
    <xmx:wS_zamiS8IMRsBzbbfQ1rdhM9UuJzkM474EIMj--zuKpuwNHRR--2g>
    <xmx:wS_zapbsSVzo7a-eRELIHRz4o6nUtAzAPgYE_RcXz3jFzrJe0NQdaA>
    <xmx:wS_zanWB491OLGGbLJ0DXsP-bXV7GHeVBZEJMR_pyA8jGu0_H-ow4j2u>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Nov 2026 09:52:49 -0500 (EST)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Amit Shah <amit@kernel.org>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Zi Yan <ziy@nvidia.com>,
	Bernd Schubert <bschubert@ddn.com>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	virtualization@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 1/4] virtio_console: copy pipe buffers in splice_write()
Date: Tue, 10 Nov 2026 14:52:36 +0000
Message-ID: <20261110145241.536019-2-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261110145241.536019-1-kas@kernel.org>
References: <20261110145241.536019-1-kas@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pipe_to_sg() tries to steal the page of each pipe buffer and pass it to
the host as it is.  When the steal fails, it copies the data into a page
of its own.

Pages written into the pipe with write(), gifted user pages and page
cache pages can be stolen.  The ftrace ring buffer pages that
virtio-trace splices cannot, so that in-tree user always gets the copy.

Always copy.  The data that reaches the host does not change.

Preparation for removing ->try_steal() from pipe buffers.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 drivers/char/virtio_console.c | 39 +++++++++++++----------------------
 1 file changed, 14 insertions(+), 25 deletions(-)

diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
index 019bcae81af5..b1b1aaf43e07 100644
--- a/drivers/char/virtio_console.c
+++ b/drivers/char/virtio_console.c
@@ -891,45 +891,34 @@ static int pipe_to_sg(struct pipe_inode_info *pipe, struct pipe_buffer *buf,
 {
 	struct sg_list *sgl = sd->u.data;
 	unsigned int offset, len;
+	struct page *page;
+	char *src;
 
 	if (sgl->n == sgl->size)
 		return 0;
 
-	/* Try lock this page */
-	if (pipe_buf_try_steal(pipe, buf)) {
-		/* Get reference and unlock page for moving */
-		get_page(buf->page);
-		unlock_page(buf->page);
+	page = alloc_page(GFP_KERNEL);
+	if (!page)
+		return -ENOMEM;
 
-		len = min(buf->len, sd->len);
-		sg_set_page(&(sgl->sg[sgl->n]), buf->page, len, buf->offset);
-	} else {
-		/* Failback to copying a page */
-		struct page *page = alloc_page(GFP_KERNEL);
-		char *src;
+	offset = sd->pos & ~PAGE_MASK;
 
-		if (!page)
-			return -ENOMEM;
+	len = sd->len;
+	if (len + offset > PAGE_SIZE)
+		len = PAGE_SIZE - offset;
 
-		offset = sd->pos & ~PAGE_MASK;
+	src = kmap_local_page(buf->page);
+	memcpy(page_address(page) + offset, src + buf->offset, len);
+	kunmap_local(src);
 
-		len = sd->len;
-		if (len + offset > PAGE_SIZE)
-			len = PAGE_SIZE - offset;
-
-		src = kmap_local_page(buf->page);
-		memcpy(page_address(page) + offset, src + buf->offset, len);
-		kunmap_local(src);
-
-		sg_set_page(&(sgl->sg[sgl->n]), page, len, offset);
-	}
+	sg_set_page(&sgl->sg[sgl->n], page, len, offset);
 	sgl->n++;
 	sgl->len += len;
 
 	return len;
 }
 
-/* Faster zero-copy write by splicing */
+/* Write by splicing, copying the data from the pipe */
 static ssize_t port_fops_splice_write(struct pipe_inode_info *pipe,
 				      struct file *filp, loff_t *ppos,
 				      size_t len, unsigned int flags)
-- 
2.54.0

