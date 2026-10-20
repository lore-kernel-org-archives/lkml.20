Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792473573;
	b=2kt96Ox3tKcvz7aQUQc7GBojT0KX91o1cI3m3xbgDREOl4+LeVcvrGpWnoMtXi/4kXXM
	 9FZkPD5ev5LualdohAVtVRDBs4w1vafh6uBO3B9uLnu9cmfhKOJb8vR8+WwsFMPPY4tLF
	 4tGIBCAF1AU360ziFS4puiVM7TuTY9oTg6Red4FcfK07IHeGCu40aWsYYJ66oFdE3KeyP
	 wj4KVx1Xt+dPS1gQQt5jIL6YgsVKMXriWQNrvhtZLMvGyC/z/TK9yoiJRy0NMK+iqfFq9
	 W1YEPiDwVdA9QIEkUBg9ENgc/0UaVv8xQ83JfqWAJ4n9omwMkFE6w9j88lL8NkRPxGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792473573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WiwuSh+FB4wlU3qM122kTHIbF58w/uDaDwSp2c2z4b8=;
	b=odAZ3zmLqwoI2flR2KwgdYJiSrA8oCjBtsBSkGbReu0E/IIBIjEcZ+ZHcDOdHsDENsWE
	 y9uyztDPvhemu2bIlEW8uGjIW227BxYlBqS8bruOCWWySvtx+a8tFQEGgUjY+Df+Rs3Ge
	 8YhEgIqu9tKUjyvEYCnOTEFZCeQSghKCaxfxgFNmBN/FxaD8TgZqM1uKFERIG6utc3ohj
	 x6AxED3/Zd5eFZM6caKRuteNKNYTyB39/3KTJMb45+sXuV7KyPHjr20XY6ckMzrKrmktE
	 /2wMQix7hNOpvYoL83+F/Bjryk8IS3HwPfBgfqqljlIGOyM2S/HQG2qkLwDWaCFc3wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BlmUULdJ;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74034606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:19:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74034606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BlmUULdJ
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e977109392so12974745ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792473573; x=1793078373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WiwuSh+FB4wlU3qM122kTHIbF58w/uDaDwSp2c2z4b8=;
        b=BlmUULdJDtjKoJrEy8yAl3GreePE+o+r052NwAx8OHhqdzSv+OPzw/a8/ZsqaYvDLo
         F4NIR/R3OH7fjK20x4vZpDatoTxUBbt+XpRYubWrKMTG45tAwqwMipIS5tHVzETdPHih
         CqaQo3p/zIKLd2qmENh4rZlUapJeedpnS8hp5rDMHyc3o2ztD3IanpKR6W0AqOlC9oRe
         M6lMUsGl+aOcS+YoSwYHiY0GzbtOFQ5P+h8ESYzLbvU5GqzJMAdJMA1x4sCliRmYQtiR
         z7gpvI36Q8tDTBzIlTPaSSQ85+fArfpAXjRsSd2GrqkIHoGAoNigK9euCz08Xbv02m1S
         pJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792473573; x=1793078373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WiwuSh+FB4wlU3qM122kTHIbF58w/uDaDwSp2c2z4b8=;
        b=TohDJwxur4rTGGLNSnXLDqwrWI8HqXHckjGqVxB3a9W20aAFLYoJOV2VI2+To04mOl
         tjNmxT8DhU6fGjsSkmzGh3xZe0DdOb7WtXtQS54VnwS1lpm/nxJhQlkUKGH9pIUScwmk
         YbFGUNzUkc0r+TQSP0KvgjvluM8UeV5bpogHNkHZ24chnrW//51lZKStrjBSVqY5+Kuw
         oXBKGNJHA3Xabdnd2Yzo+w9xD9UIFqnR87qdElJeuEZWndmFbpae97jbODNy2dGis2cb
         HMAlg/3B5NBdCA+KV2AImNxFUB1PhDMZHcZgKMQcj3BiW0EGuOe0wnuXgmq1Ml+mXF9V
         tRVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTJlbKPZ9jh1bdCeNFe/7gVwPpH/MjYY2y8Sd5i7i5idgKXsWKSwF0tsyHqpq5/t0pgvwDkA7zzMfPrrs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvSj08RZUNoDWu/PRx323LGOV89E0fSWWt1LZzWWGiEIHGemL3
	+GSaEQnZLxPwXKQcO0GDtmbOB6LlPynTnxqdWtBJL2qbZzRhsb4pRzBHKkKZN5Rc
X-Gm-Gg: AYBFou3qUFzA92gQRVeXiV7ukfRUcLm23bID0QWmOoVh0yubSB7xZjIAzpnEhGYIvcI
	oScAFHDsr/7Jvsz2t0lwoXyWcCM/raMMkeJY03drcVsHvVzgmFObP2kMsNTLyj4TUj2oBo5iW5w
	g/b7lYHmByXOwyR+SzVhyBetCZ1rSF8gatRXhC4ibDT83Z0n+/CNPwiZSVnpikiIc9lrsgo32ht
	x7mGZcCweNclMcegD5DB+8+I8HVB0hMJ1ioYzbYnuM2w09gB92L/SgBkH1G/2q8i907DZgcMh7a
	pEdmH7K1UV/z7wunMmwCtsEXKbO9lTVDmS3SeSRcm4H/F2z0696H+BOPE0WBOzsDlFN30ocGK9/
	N6xi6FAwk2P15oQkz5a9ipVYtVVQxa2ROqKN8EJnfJyDRleAAC5a0yb9mrzmdoa1CUr63DRGWku
	kWHQxDAFrfIOg28qv8dWSfof61HIliVcZ2cx6IKmgCOk5kbuaGPYFRUuPv8ZBSJwKuoSiUhJrT3
	1J/9mOejmWlWEPY/JWGs8+6qVberu5ysY2AZsKvLomkcT4UvU1Az8BIkPRKhiy8lmhoxVwbGtMq
	/S1c97pg6k9JbrgwqMR/+1iERWDT1b6LUKHdmB0ZDTqtywJdYnaiz8dmkcDKpXV0iRA/+myrp8Z
	wOcsNNpc90CvyUqJ4irbor3dKmGVKMQ==
X-Received: by 2002:a17:903:2c8b:b0:2e9:5c55:c46a with SMTP id d9443c01a7336-2e9a6834a18mr82663075ad.7.1792473572624;
        Mon, 19 Oct 2026 22:19:32 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea145af6c5sm8940965ad.2.2026.10.19.22.19.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 22:19:32 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yu Zhang <yuz08559@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: gadget: f_fs: check ffs->gadget in the DMABUF detach/find paths
Date: Tue, 20 Oct 2026 15:19:25 +1000
Message-ID: <20261020051925.92294-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
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

ffs_dmabuf_detach() and ffs_dmabuf_find_attachment() dereference
ffs->gadget->dev.parent as their very first statement, without checking
that ffs->gadget is non-NULL:

	static int ffs_dmabuf_detach(struct file *file, int fd)
	{
		...
		struct device *dev = ffs->gadget->dev.parent;

ffs->gadget is only set between functionfs_bind() and
functionfs_unbind() (UDC bind/unbind). The epfile ioctls, however, are
gated only on ffs->state == FFS_ACTIVE, which userspace reaches by
writing the descriptors and strings and which is independent of the
gadget lifetime: an FFS instance is FFS_ACTIVE before it has ever been
bound to a UDC, and stays FFS_ACTIVE after unbind. So
FUNCTIONFS_DMABUF_DETACH (and the DMABUF transfer path, through
ffs_dmabuf_find_attachment()) can be issued while ffs->gadget is NULL,
dereferencing NULL:

	BUG: kernel NULL pointer dereference, address: 00000000000000b0
	RIP: 0010:ffs_epfile_ioctl+0x402/0x1700
	 __x64_sys_ioctl+0x120/0x170
	 do_syscall_64+0xf9/0x540

Reproduced by mounting functionfs, writing a descriptor+string blob so
the state becomes FFS_ACTIVE without ever binding a UDC, then issuing
FUNCTIONFS_DMABUF_DETACH on an endpoint file.

ffs_dmabuf_attach() already guards this with
"if (!gadget || !gadget->sg_supported) return -EPERM". Do the same in
ffs_dmabuf_detach() and ffs_dmabuf_find_attachment() (the latter also
covers ffs_dmabuf_transfer()): snapshot ffs->gadget, return -EPERM if it
is NULL, and use the snapshot.

Fixes: 7b07a2a7ca02 ("usb: gadget: functionfs: Add DMABUF import interface")
Cc: stable@vger.kernel.org
Signed-off-by: Yu Zhang <yuz08559@gmail.com>
---
 drivers/usb/gadget/function/f_fs.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 44218be..0976db7 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1473,9 +1473,15 @@ static int ffs_dma_resv_lock(struct dma_buf *dmabuf, bool nonblock)
 static struct dma_buf_attachment *
 ffs_dmabuf_find_attachment(struct ffs_epfile *epfile, struct dma_buf *dmabuf)
 {
-	struct device *dev = epfile->ffs->gadget->dev.parent;
+	struct usb_gadget *gadget = epfile->ffs->gadget;
 	struct dma_buf_attachment *attach = NULL;
 	struct ffs_dmabuf_priv *priv;
+	struct device *dev;
+
+	if (!gadget)
+		return ERR_PTR(-EPERM);
+
+	dev = gadget->dev.parent;
 
 	mutex_lock(&epfile->dmabufs_mutex);
 
@@ -1570,11 +1576,17 @@ static int ffs_dmabuf_detach(struct file *file, int fd)
 {
 	struct ffs_epfile *epfile = file->private_data;
 	struct ffs_data *ffs = epfile->ffs;
-	struct device *dev = ffs->gadget->dev.parent;
+	struct usb_gadget *gadget = ffs->gadget;
 	struct ffs_dmabuf_priv *priv, *tmp;
 	struct dma_buf *dmabuf;
+	struct device *dev;
 	int ret = -EPERM;
 
+	if (!gadget)
+		return -EPERM;
+
+	dev = gadget->dev.parent;
+
 	dmabuf = dma_buf_get(fd);
 	if (IS_ERR(dmabuf))
 		return PTR_ERR(dmabuf);
-- 
2.43.0

