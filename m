Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793278324;
	b=tLGlAhna0C47i8qtr2foW+H26s9n1nIFEXlh4G8v2XCBttQbU8Vt9jujYzWfZCntyVsO
	 XfRjQS5l34xeik8VnRpLuDbTckP49t6sxsdb/adrHILQH6A3zMSeGTFp/bH3CJn8JfRSO
	 CtfMEV4t0QC2fzlZfbS8K9ePFER3YOpFiL7mn8qczHrCLZFzlqYgRaPuE+LrKKAPQhGB8
	 fbsjfxAwCE82Y8aAD2R5ddhVcI9BOBsfQiMGD3jQKSNVGsH/xlcQdWcSukZqa/8sg2hck
	 HS+dIsF1XSmpJKyuIhImFuP7CkcMMlBCKe9M0ANb/D6r5AZdNweUS3tQx6+qw3V5Lrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793278324;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Iid3eWpVe8olQMkvpXTW8m9qOGkSJpcW1KaQejtRK1Y=;
	b=GDCg67qWIT/Z8CAkv9p/8ko4h67v+IB2+s1V4417mydLP7zpq9IfJCiR1s9Z3k0kHljG
	 ZtkIOPv+4exSGwzLlIIAUhBPQWZ8Hn5BaEw76m+Jxn5Trf23WPo6riOMEchiP+LbbtJWL
	 Dezn1OBODSk7/6UDNciTPUiVSbfodNFXM11yaLzekcHiAz9zBeZWgZg3x11bdmC/u+0I/
	 apyiVYzng+/4nOe+348tIdIDxiOylPAoenR/b8k8hQKLGtj/p1urpHjTHsjt0oYzzcUdD
	 JK0QlAq086KsvO0hmQwiGFRrr0+xsLvtxVTyxCwgzcuLWBVxyII+NJdFBLGR6x8lShA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IS8J38Eu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87ED0606A31A;
	Thu, 29 Oct 2026 12:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IS8J38Eu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC6A01F01825;
	Thu, 29 Oct 2026 12:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793278324;
	bh=Iid3eWpVe8olQMkvpXTW8m9qOGkSJpcW1KaQejtRK1Y=;
	h=From:To:Cc:Subject:Date;
	b=IS8J38EuHK3inR5WNoXkUqRieBG6uy85jRetqgdMxEnVwBvk8dONXaq2UW5HwB2rI
	 meRNHV3CmcRbii+uCmvEhqk28UdZs/URUOOf9niOzOrpmoU0OaycS9kFCtw1f11nSX
	 uT50qCMRLJyfOkjZtxWRDqIXYLjOu0BbKEVOgdL2SxSDmBmHOqJjN/RAg49P0Z1UFu
	 W8a22kipU+v1QfjsTFTdj/YBvbZk27ESBknMui5dYniY28Krmup6SyPFySTnPhjY8W
	 rRHJTkztfBKIUstMZqoOsoCDaBeR63CeDb/lOa2r7Je60uY7EFK9R0AT5Xjdt667I3
	 e5lXTnBQm/Orw==
From: Philipp Stanner <phasta@kernel.org>
To: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Paul Cercueil <paul@crapouillou.net>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Sam Day <me@samcday.com>,
	Michael Bommarito <michael.bommarito@gmail.com>,
	Gabriel Prostitis <prostitisgabriel@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] usb: gadget: f_fs: Remove deprecated dma_fence->ops
Date: Thu, 29 Oct 2026 13:51:44 +0100
Message-ID: <20261029125143.1744481-2-phasta@kernel.org>
X-Mailer: git-send-email 2.56.0
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

The dma_fence_ops function ops->release() has been deprecated because it
prevents drivers from unloading. f_fs's implementation merely frees the
fence. The dma_fence backend performs this deallocation automatically in
the correct manner if ops->release() is not implemented.

The backend simultaneously correctly frees struct ffs_dma_fence since
struct dma_fence is its base class.

Remove ops->release().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/usb/gadget/function/f_fs.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index c64a268e98a4..e8672b37e890 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1479,18 +1479,9 @@ static const char *ffs_dmabuf_get_timeline_name(struct dma_fence *fence)
 	return "";
 }
 
-static void ffs_dmabuf_fence_release(struct dma_fence *fence)
-{
-	struct ffs_dma_fence *dma_fence =
-		container_of(fence, struct ffs_dma_fence, base);
-
-	kfree(dma_fence);
-}
-
 static const struct dma_fence_ops ffs_dmabuf_fence_ops = {
 	.get_driver_name	= ffs_dmabuf_get_driver_name,
 	.get_timeline_name	= ffs_dmabuf_get_timeline_name,
-	.release		= ffs_dmabuf_fence_release,
 };
 
 static int ffs_dma_resv_lock(struct dma_buf *dmabuf, bool nonblock)
-- 
2.56.0

