Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABE84A0909
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788357574; cv=none; b=hYZZBJ7r0Czn6YRNAfLM9VAXls2vGc+JAoQw9pFe6rDMQdto6yNvXwYchzeIhT+BwAM0t9pk6m4oR300r85hlL8IoP+cUz5DkBdnR9lR+kxQpVhBvzEYuhHlz8wtMserBkUS2fglqfUSi4nFQ0GAvnLgU3u416GN6cMD2DQmg5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788357574; c=relaxed/simple;
	bh=/9eZmU2D0hbNHb92ePV2OaMpbatPpO6xeRcbdoGIcR4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M6WT1/kJLwi5D2p96uehn63wqMBPsjJbTAFzxBGlxL07lpWLm5cGveqsNxJqWLna7sn6ZNBS3/zJtzXSJ7DBLGclhdt21Pv+ZmK46RV4K0o6lGNpZerHc6wf9jWfmOXYF/piOrnTW4gJtAHunR0liox+SZMc33MdLWnd68TZ6fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XnA6rvNU; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XnA6rvNU"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-39682983a0fso1387734a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788357572; x=1788962372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hrAS7URR96Vhxqaift3zBbsgPvJL26DLyKnxdnXVft4=;
        b=XnA6rvNUeg5GKgp5saQqJIwI/nqFJpjDlylEZM/agR/kSXe5e3c6bAVMt1Gvk7VCCf
         vqBr3XK+fIVZ87BXPBpvtxlKsdyPDqWLZLnJ3108EsAVM4z+sphU+MpLyWQDwz7ZiZTn
         GzE0CfBpO6a1kMheOlupfokE1Mi90LO7hUL0zm8jo+8MBi5GaOQDYzDbi3IjLCbT1PbL
         l4KMCI+uHc1qZAw7sIXEArNwsVgnAYG27s7ebDePdgiJbWs/GUCmNJLSkhSCT533fhl4
         yQa6dsRYkLvH71UcEr2dlq0gvvrc/c8fq1cuxQsueEU3aQAn1eD+6Ul01GcnOAfoxBzn
         Wj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788357572; x=1788962372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hrAS7URR96Vhxqaift3zBbsgPvJL26DLyKnxdnXVft4=;
        b=Zy3JFRdZLKB4O6PbSpddWmnvHV3XrVXnxWWxY2ab6D+tNGtKnaIont83AcakE3xsbD
         Jo/5EhXzNWXgiT8hWvR3dt2qEiDQDFpoFu20nvui7XDDD4N1d3wXbmmC6LxVbV1nvvEM
         zzjCa0hmoDwPT79MEBSCkt4EvCxcK6SLQ1A147k9UzCq6fbeYdGJOJZV7aM2RXcOXPxo
         M2PtMu2la2UzyvbBOPtRbebzt6LEsuAV/M3AgezYw/QUU61VTGTLVrP01jIvFx7QT/FE
         2qgwa2xO9P06g+6kXW9L20IWUVRGY/vRww3Z4ysDWRDMT3lkfXzmHLadhrGPJ+HZ+8pz
         FPFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwb1Z9dvz/heakeu6cZ1XLCj7TENLERpRrXtfsqXE55sQru0bi6Jc7wcIk1W9+J+BxuE761YhOEsQ3kyMs=@vger.kernel.org
X-Gm-Message-State: AFuF++njUePKtM1r4x8XfC0Y/NwPUvcZm1ZLDCDNEMnCaGMwpBJezVTi
	9PjWk7O8HOJ+3TCoWPHchLEs+AnsagT3fs2J7RcpBXCFNH4+/tFY6Fsk
X-Gm-Gg: AYBFou3ch9lbRtzyZ73nNbmN2LrTxGeDdeFa1XHQvsKgz8JjAGY0tCTvgnTJeeBw3rN
	U9brvsFUZk8F+z3K9NujHG5AZomWfSzBTcyb8n8dT2ssZ/39TomUn/STzI4nfoahXVwXxEXS+sY
	51dTSD/cCopM0w7GQPUU+eizPUCQttVH6+URkj0tMlWXEo+/FKwTDaNc2KJVvujbG+SIizho7B2
	6dLjLzUoVofvPX21XybaXWoMJmL3Qat9/165IpDkAQKYmvHCQfP7iW3+U73E+rf1LW6jij5o3hb
	dDz+pjEpONhd87qQF/7j12g6CFu8Fer0Hdkc+IAN7h2UCmfJxcke8KVbP8M4Ujld1agg2yxz2F4
	rWoF+eOpVS1/yjFmiE6lr2SvSOnIG/xj4F09+zhX0PC1jn6ctWf5YCoUi7WxAslHVLJDH1HKrDk
	7h22X28/8L1nmSeMesj/bcr1eQpTzWQS7pBQ7cKeF3mpIqJjuFsaldM+dxHWjWA+Kw4AkQGjreF
	eCEmiGTfIB46qvY9vcez8Sxy9UPWhvcTjpgi3WIPKETzovzw4FKj96sCcbQPrSRB71Ev9qsvkmZ
	i0WOplJSDxvjb12BNHj5t9pvaGpKWoIPWrZkq2mUOwo=
X-Received: by 2002:a17:90a:ec8c:b0:38e:5964:97a8 with SMTP id 98e67ed59e1d1-39aee04ace5mr8324115a91.16.1788357571759;
        Wed, 02 Sep 2026 06:59:31 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd21e9dsm12123595a91.4.2026.09.02.06.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:59:31 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Hung-Chun Tseng <alan.tseng.cs@gmail.com>
Subject: [PATCH v2] dma-buf: fix stale return value documentation for dma_buf_set_name()
Date: Wed,  2 Sep 2026 21:59:23 +0800
Message-ID: <20260902135923.3599022-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel-doc for dma_buf_set_name() still documents an -EBUSY return
for the case where the dma-buf is already attached to devices:

  Returns 0 on success. If the dma-buf buffer is already attached to
  devices, return -EBUSY.

That has not been true since commit e73c317efbf9 ("dma-buf: remove
restriction of IOCTL:DMA_BUF_SET_NAME"), which dropped the
dma_resv_lock() and the !list_empty(&dmabuf->attachments) check that
produced -EBUSY. That commit updated the description paragraph above,
but left the return value description behind.

The only failure the function can report now comes from strndup_user(),
propagated via PTR_ERR(); every other path returns 0. Document that
instead, using a Return: section so kernel-doc picks it up.

No functional change.

Fixes: e73c317efbf9 ("dma-buf: remove restriction of IOCTL:DMA_BUF_SET_NAME")
Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
---
Changes in v2:
 - Use a "Return:" section so kernel-doc actually parses the return
   value description; scripts/kernel-doc -none -Wall reported "No
   description found for return value of 'dma_buf_set_name'" before
   this change and is quiet after it.
 - Reference the commit that made the -EBUSY text stale, and add a
   Fixes: tag for it.
 - Resend to the dma-buf maintainers and dri-devel; v1 only reached
   linux-media, where it was marked "Not Applicable".

v1: https://lore.kernel.org/linux-media/20260730003153.4030818-1-alan.tseng.cs@gmail.com/

 drivers/dma-buf/dma-buf.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index d504c636dc..6ee3c254d7 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -413,9 +413,8 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
  * @buf:    [in]     A piece of userspace memory that contains the name of
  *                   the dma-buf.
  *
- * Returns 0 on success. If the dma-buf buffer is already attached to
- * devices, return -EBUSY.
- *
+ * Return: 0 on success, or a negative error code from strndup_user() on
+ * failure.
  */
 static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
 {
-- 
2.43.0

