Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4906E4A2635
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 20:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788293995; cv=none; b=ge0cGFf9h7bU3AhcYov0BkBIZ+3TKiCxrtUfIMF7HMRRHofmIdiNpdt20mAvfY6jsNaOhmJ9gHYnPR92+YUhMhY/n48QkCuPiY2fnxsy0w1VrxKkqrzZpOHeHGIwZLxyi2pKRfQi1nf6VPWY6pR484ZRb00pLroTa/lz7E3svqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788293995; c=relaxed/simple;
	bh=WSeYMLAfGJsQo/kFya8KFlsHCnbXQZ+Iyc4prnMClpE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VrHks1kN1OIuE+84+aXy9DnzQtedbleDm7vqBM+/K1ceaL/Hhk2LGG8afBRILe/+EXYe4YealOyLalkUlxBZcQfS6DUe9ZpGsw7Ym+nOUuQ2Mx9oPP+P9+uSaDq3Ko+kTP05pHvtdM4GncdbVV0h7SV+BbefUlpXVXgrEGNmWvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dIpDNots; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dIpDNots"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84e27035206so228012b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788293993; x=1788898793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0PiVP95ao7yXW/OZhxmQ9Mbj44WmjmsyxLnkqleNrz8=;
        b=dIpDNotsGUEFuHsw6xOm3Wamdfj2GeSE4JvUKfyCeRZKm7CKsUeOmsE9bul3OXyWDs
         2l1C3BVc7+6MM2zak5WDGE+dzTjvxn/jPr++PY8begyY8fqzE3Mp3Tsx4VjEWFTJnh4+
         4TkJoMdFV9gp5J6jBMgubhazYCMlIo/D2Y/yD6fhqgrNyglaCT+fxSlY2NfueItWosYu
         gZhb6iQ1o7tT47zwtD2dEq2lYuopspfj1wmsTLE/OfiHyVZCCaq/du0oegpAwqod3YfL
         yCl3nnYIfJVeH/NwK8rxShumhpRMY31TTcTvGRlcH2QZcW1sP+CBbuNoAWNiXNZngotz
         5YSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788293993; x=1788898793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0PiVP95ao7yXW/OZhxmQ9Mbj44WmjmsyxLnkqleNrz8=;
        b=sHetETi7cnfDzCf6u9Sc2oUCTzgNqGf0K/o0gQP4Ox7FuTZeo3Vpa0eiXPw1ma6uKw
         ZVztsf2yPnD4uhp1zlENRoANo/G1oViyVIzafcZUHdxTGKRSfLJshCGTKOjaWgytHxOt
         FcIEE51zVAFwHvm52iSZtJOYQOYVLPwCy8zae5a0Di2c3aP456RZTQ7O1iKZnwowHPvp
         PxBoj5Ls2whh4QSECLRFo7rB1RtT6w2yUnLGH0HtmnRUBhae62RbuSA4pDc0FBUV9sZM
         yzs4Un2BPmkWJBLG3VKSURs/XgAPerT/g90fhQrtLog+hWvJN7YHmQuxNZDhvZZueVr9
         q7tg==
X-Forwarded-Encrypted: i=1; AHgh+RpYfNARc1RfZ6ysB7RMCbs65nB94j0AArSI7xIX+SfOl5CeWUiGonM+MtMQX2zGieBtC7oecUy3esr8+88=@vger.kernel.org
X-Gm-Message-State: AFuF++nisPwhKHOgksTQJKKTS29YR/57y9b6zse/oNm8Rhw62gwrc+Hr
	a2MvbzncLyuxDyBmgXZ5HUNf+Yw6iaMaUe3TO7lX2CyNitUrslWt961v
X-Gm-Gg: AR+sD13JpkzDViONOLwZvrBPcTn9pOC62fvDFS7D/fr5y/Ko6GRjyN2MnC5nzscor7d
	NcU5HdmgEeEfb0vJa2tT7CBZBIbPQWlR+BgD/emo/mpSXQ4L1pqQy4C9GHU7EM0HLKP3J6xZWfn
	bDIWOav5BBxP6OfDbXK0vvyth2Dinmha3RSsweg96ksUVqDUxEOpiueBFFmDnm96WxvpYCzzHi4
	hoxUTVUNA682P/wowaqfzk6m5lt5UAqAUKFKRriL1PWph1yH0CcxEhVy2Aq5IM97CkqxiBuRIwG
	SIPH8ZFZCrRBC9Cv9/dx8V2WXpZuiROZtT6aO7PkmffcH9AeYYzgjgfoh0EVneIyg2zxhj2dezT
	5pAtVpj4gQHOSgDlkxErrS2neIGS72WyqQ/+MRY2d9e0fM47Z0ZSPT0L2Wgy/G59JLnhJerM0a+
	Gc0Pr9Vkff8FcD6UnJcG5JP9J/LbGoZoprGLmaX+o4vMwxP1dYf6ul5l5adNqeqTOBylFGadzLG
	C5tawfWk9NrqlPqciPpb/1C5qlQKcF7u6K5fEFwZZ0ZpTGwjxF6/mmEYxYZ1WD6b6uC14Y5N/qk
	QEsNYOui+MNVA67Q924Qr7tQOreJhgbpuaoMg0/AUyw=
X-Received: by 2002:a05:6a00:a25c:b0:855:1590:ba2b with SMTP id d2e1a72fcca58-85ed1d076bamr647630b3a.5.1788293993438;
        Tue, 01 Sep 2026 13:19:53 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc003aee2sm331139b3a.30.2026.09.01.13.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 13:19:53 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: sumit.semwal@linaro.org,
	christian.koenig@amd.com
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Hung-Chun Tseng <alan.tseng.cs@gmail.com>
Subject: [PATCH v2] dma-buf: fix stale return value documentation for dma_buf_set_name()
Date: Wed,  2 Sep 2026 04:19:49 +0800
Message-ID: <20260901201950.3503739-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel-doc for dma_buf_set_name() still promises that the function
returns -EBUSY when the dma-buf is already attached to devices:

  Returns 0 on success. If the dma-buf buffer is already attached to
  devices, return -EBUSY.

That has not been true since commit e73c317efbf9 ("dma-buf: remove
restriction of IOCTL:DMA_BUF_SET_NAME"), which dropped the
dma_resv_lock() and the !list_empty(&dmabuf->attachments) check that
produced -EBUSY. That commit rewrote the first paragraph of the comment
to match, but left the return value description behind.

The only failure the function can report now comes from strndup_user(),
which is propagated via PTR_ERR(); every other path returns 0. Describe
that instead, using a Return: section so kernel-doc picks it up:
scripts/kernel-doc -none -Wall drivers/dma-buf/dma-buf.c reports "No
description found for return value of 'dma_buf_set_name'" before this
change and is quiet after it.

No functional change.

Fixes: e73c317efbf9 ("dma-buf: remove restriction of IOCTL:DMA_BUF_SET_NAME")
Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
---
v1 was sent on 2026-07-29 and did not get any review comments.

v1 -> v2:
 - Use a "Return:" section instead of a plain "Returns ..." sentence, so
   kernel-doc actually parses the description (fixes a -Wall warning).
 - Add a Fixes: tag pointing at the commit that removed the -EBUSY path.
 - Widen the Cc list to the dma-buf maintainers, linux-media and
   dri-devel; v1 only went to LKML, which is most likely why it was
   missed.

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

