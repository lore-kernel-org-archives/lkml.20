Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705572;
	b=WVFlBYndwPIYL4vwbcwQVc25CL+nyGeMNzHPrKt9c/nXKvKGu0zTnYAcaXop1bZzHHtl
	 X0gcosi5FNoKdTWGiz64PM8AxFj1HurTIjyRv87AzwhGhiE4FAjafDEQe3emVjSRBgTL9
	 +IGxFx0S2T3OcBdaVY6cSG8rBYgFUZz9ajuhHGZayA/DcB7NMgnub7CcX45ew6UZDhUaG
	 jIYXNMHaJUia+J9F3KZdo41m6AatrDcOafxD1XSnTR4+eTmWf0HjwJ9k79WwkxMxgFwD8
	 V6Adf3cE8/VUUPf2I4TRz4NSPypM5mCdKI6jwrRzs9jdXMVKBfFijBfXpZSKRvcwYsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705572;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=zkIY764UuQQv/krUXxJi9ZSTyaSSPK0zmO7edHBGUf8=;
	b=vDdu03f4wt+MFBvtGESULdTr78tjx6kmm/KdlQqX/ZI+oG0mYD6At0vzthrzI+reurxw
	 VDgX2yobHOHpo171dg5fAiMwMrEtwI4obvD1HCof70AUQjIuuIKdgyXx9Ll+FAsoen3so
	 xeXZovGD01HY3LJwbxXuunkW6hSnS9FoQtycAVILaI5jkWyQ9EbhOjLDmmupixJZQbKpE
	 +NdlSNiRJrEocpBDUYEUwPtWwFEZGpe2nuCfm1Fs8c2FhxThvSirzoaJ3/MCdrXNS7GOr
	 Hx5e/wKxGZ7s5mEtxsYBHibKiMM/tW1wlHUtnDjxzB4bEzyTvid/JZTjI/ss4RKHMQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=aYzbJrDb;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 752E0606A330;
	Tue,  3 Nov 2026 11:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 752E0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=aYzbJrDb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=aYzbJrDbeP/7tWdxMtcgSSwEmNgpxtzQOdod7HkyQTJqQm7k0/rVAhtJkCUkEj4NlxtHLqxuPtW9c
	 fnHDvM8syOzQaHV+iJxisUeDMFuSlM8d+hnY+rzWqfgq//vPtkFIsMTmzl/BQqSUXyvgFLnVAP0XLu
	 UvNcctGqZC7YOQZ4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76ae9c655251-95671;
	Tue, 03 Nov 2026 19:32:38 +0800 (CST)
X-RM-TRANSID:2ee76ae9c655251-95671
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from dsh.local (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76ae9c654b7c-f8a46;
	Tue, 03 Nov 2026 19:32:38 +0800 (CST)
X-RM-TRANSID:2ee76ae9c654b7c-f8a46
From: Yuehong Wu <wuyuehong@cmss.chinamobile.com>
To: kraxel@redhat.com, vivek.kasireddy@intel.com, dri-devel@lists.freedesktop.org
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, phasta@kernel.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dma-buf/udmabuf: do not warn on huge user-controlled allocations
Date: Tue, 03 Nov 2026 19:32:37 +0800
Message-ID: <20261103-udmabuf-nowarn-1-yuehongwu@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: git-send-email 2.43.0

Since commit 44e9eb5a7621 ("dma-buf/udmabuf: Disable the size limit by
default") size_limit_mb defaults to INT_MAX, so a user can ask for a
buffer of up to 2 PB.  pgcnt is taken from that request and
init_udmabuf() allocates an array of that many pointers before the memfd
is even looked at.

For a request above 1 TB the array is larger than INT_MAX bytes, so
kvmalloc() hits

	WARN_ON_ONCE(!(flags & __GFP_NOWARN))

in __kvmalloc_node_noprof(), returns NULL, and udmabuf_create() turns
that into -ENOMEM.  The warning is reachable from userspace through
/dev/udmabuf, and with panic_on_warn=1 a bogus ioctl turns into a kernel
panic.

The size is user-controlled and the allocation failure is handled
already, so pass __GFP_NOWARN for the page array, the pinned folio array
and the per-item folio array, matching how other subsystems handle
user-controlled sizes.

Fixes: 44e9eb5a7621 ("dma-buf/udmabuf: Disable the size limit by default")
Signed-off-by: Yuehong Wu <wuyuehong@cmss.chinamobile.com>
---
 drivers/dma-buf/udmabuf.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index df6dd00..47e130e 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -190,11 +190,17 @@ static void unpin_all_folios(struct udmabuf *ubuf)
 
 static __always_inline int init_udmabuf(struct udmabuf *ubuf, pgoff_t pgcnt)
 {
-	ubuf->pages = kvmalloc_objs(*ubuf->pages, pgcnt);
+	/*
+	 * pgcnt comes from a user supplied size, so do not warn when
+	 * kvmalloc() refuses an impossibly large array.
+	 */
+	ubuf->pages = kvmalloc_objs(*ubuf->pages, pgcnt,
+				    GFP_KERNEL | __GFP_NOWARN);
 	if (!ubuf->pages)
 		return -ENOMEM;
 
-	ubuf->pinned_folios = kvmalloc_objs(*ubuf->pinned_folios, pgcnt);
+	ubuf->pinned_folios = kvmalloc_objs(*ubuf->pinned_folios, pgcnt,
+					    GFP_KERNEL | __GFP_NOWARN);
 	if (!ubuf->pinned_folios)
 		return -ENOMEM;
 
@@ -387,7 +393,8 @@ static long udmabuf_create(struct miscdevice *device,
 	if (ret)
 		goto err;
 
-	folios = kvmalloc_objs(*folios, max_nr_folios);
+	folios = kvmalloc_objs(*folios, max_nr_folios,
+			       GFP_KERNEL | __GFP_NOWARN);
 	if (!folios) {
 		ret = -ENOMEM;
 		goto err;
-- 
2.43.0



