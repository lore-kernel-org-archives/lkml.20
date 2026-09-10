Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20691399361
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789071908; cv=none; b=Ejb9AH98fJH0uloykC9sFdZxG9NHKW0nHuyRwfiRmEcAVsNGli+UyGpjvc22UebpaO2gHD9hIu9ci5NMx/GoT6W7GcL1vv+bOjKySd4YBVD2peq+0F35p8bSPqnBDwMZQnfzrgV4FHMyqmYT7MtvciCUgzQxcLhflG5h9hmL+Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789071908; c=relaxed/simple;
	bh=crUU4hqfzWmg1FxOzOMfiI90weFHQvv57LQbmKwL7Yw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hrDOcVwPdNbmRJ0VPBiFa0YP15vpZH1Uh8gFqVzLXHVwBW0cgFhYwBVzPpZhRT9+InndvZYG8I/zhgOwisLIIjpTabRSsLhEypLQYmfXiTstHV534dfRxqCs6A+lA0yyB3Vq+UizpbHG3hkP4q6ULHXEdSZtQlnSZaXhFiwMxJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bAGwIyJj; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bAGwIyJj"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-52de50e77ffso2271451cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789071901; x=1789676701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5fAMAx/mtgGUhEgU04FWSZ/Setac6qTqsovVdgc29/U=;
        b=bAGwIyJjkgOB5FOga3HHp1f9N9HnhfFRWItViJJ9iNZRPj5Kbvva1lSdY9sMJFzucy
         VBenCSKY7AT4TIqCFIlTTJ+1h1vRM54aEA75LheqOp46E0F+pB+HyXfc6CE57rqfRqor
         SJHw1NgZRTbRYjslihFt2qwirGNErQmPbm6IWyzmFOEFydi/d4JwTLtZ3RE2uMKfOVqn
         bGOaiGFZVMLT3xxWVDGKljNWuvC3gTAVaz9TF3Uu2dDFjRs2BafV4BnSOhmeCMFbHZVE
         u8GCN6AvVdpChBxPKEUFLhl5zbs1EKvRGHtdxZ/HJVFbeBn0EnnMOHDj2OJC19xjvk4x
         1D7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789071901; x=1789676701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5fAMAx/mtgGUhEgU04FWSZ/Setac6qTqsovVdgc29/U=;
        b=Z+tTRRH6UjQBXSqrcQm6AnSIOf3tdJSJHydi9EM25usEa0dwOy0M4v+Szg4K2JhUhG
         EjZ9C6NpdWhUd74MjoUASQbWDGl9VszqZw9gfbOTS0NM+iHfFVLRvrslgV0XdeOTDBFp
         e3P/X8EKfcsQvUWrn5FokVezKQIFLU7iLR1b4oy7st5+sJCSJKA6iwxxd92QCRsNL8XN
         p/WwxEWL8K2dVkk35AF9z8YpODWLK3koS8e145IWfj1pv+R3hgprkh5Gaplwrf7gtC+L
         rgXDSU8nmDUCoL5EBdUPRcQFqYJbUQ2TOdUdQxsE35eVD4Q3dvHfl7fIHgMjuBzhNB/N
         aOwA==
X-Forwarded-Encrypted: i=1; AKwUvBxcbqwRLJKNWyZbTj+XruMfygbNDWBsKH1M0zbaVK9C3u1dv0XRpcLVrzeHAidleBGHv+efsVD6S/8pcJU=@vger.kernel.org
X-Gm-Message-State: AFuF++k9XX1ax+nPAEdQRtrN8fn10cxyZc56YTiG6OYh3ZvnCq+FfXOJ
	GUbG7/5d9UaUxG2ocPuM5ayVIykotBlK7SHLlqGxWed5rk+1gjHy8vVg
X-Gm-Gg: AYBFou00LnxemERvwkIlpILYD4dSRAZT1ENJU5/vz019NXKSCkN4TrWRRm+V/XKRS/4
	pQweMAqZl1YFohpgU7psfqQKWXozppJCVPD6b4p3+z3RPYHVcWLT77eZ0wVfRV7SRpHoCMK2bvS
	LUvY1hIbLEkOB0B0JqIX2hNljMYjfUyKwM+KF1pUocsrySapXsS2hTwoF8j7fAAidyg3Te1tPH0
	pmk9q1OqdRM2vVF2mu+7btHjYTs98F5RHexWbj2cDix//+V10qM1KT0cDDU3YSYG8mn9vKYxfGI
	9LRtQ3Z6eZ22fG3Uib4JqmRIT3IyPhSrUhdfQPOTNMATgyrcskshQZhnbSMS/rxsyZlqraq54Ea
	giVZ9mE69UN7zN6u/Cl0TCp5M1rCiyn6iIQSLTEsuEkxzJBbiI3vX/BE8+To44QYvoFX5dejVu/
	YGZDNbE4eMV8fgA6bhoXt5puIL4nzBUoPe/neUX3TfAAMu8n9shrN3jDO0nXwNo5mVeBuHNhGe7
	RJOMf9tudzRl7ElmUC+ku3ZyvQ/NOvsM4znbYkwlJwLZhkezbF31Fc6vCjxJvohHSpGbOW7hzeh
	4tlTkMh7SOacGrLc0qVJgsbS55nqlBAT7MAyje5voOuF8FEHnQ==
X-Received: by 2002:ac8:5a0f:0:b0:527:809c:f9cf with SMTP id d75a77b69052e-530c85979bcmr17636911cf.21.1789071896008;
        Thu, 10 Sep 2026 13:24:56 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca489107sm2035371cf.14.2026.09.10.13.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:24:55 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Zhang Wei <zw@zh-kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE DMA DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] dmaengine: fsldma: fix kernel-doc param names to match function signatures
Date: Thu, 10 Sep 2026 13:24:53 -0700
Message-ID: <20260910202453.47887-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix kernel-doc warnings where the documented parameter names
(@chan) no longer match the actual function signatures (@dchan),
and add the missing @cookie and @txstate parameters to
fsl_tx_status.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 v2: split up from series
 drivers/dma/fsldma.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 22d62d958abd..6ce0e5668dc2 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -681,7 +681,7 @@ static void fsldma_cleanup_descriptors(struct fsldma_chan *chan)
 
 /**
  * fsl_dma_alloc_chan_resources - Allocate resources for DMA channel.
- * @chan : Freescale DMA channel
+ * @dchan : Freescale DMA channel
  *
  * This function will create a dma pool for descriptor allocation.
  *
@@ -738,7 +738,7 @@ static void fsldma_free_desc_list_reverse(struct fsldma_chan *chan,
 
 /**
  * fsl_dma_free_chan_resources - Free all resources of the channel.
- * @chan : Freescale DMA channel
+ * @dchan : Freescale DMA channel
  */
 static void fsl_dma_free_chan_resources(struct dma_chan *dchan)
 {
@@ -873,7 +873,7 @@ static int fsl_dma_device_config(struct dma_chan *dchan,
 
 /**
  * fsl_dma_memcpy_issue_pending - Issue the DMA start command
- * @chan : Freescale DMA channel
+ * @dchan : Freescale DMA channel
  */
 static void fsl_dma_memcpy_issue_pending(struct dma_chan *dchan)
 {
@@ -886,7 +886,9 @@ static void fsl_dma_memcpy_issue_pending(struct dma_chan *dchan)
 
 /**
  * fsl_tx_status - Determine the DMA status
- * @chan : Freescale DMA channel
+ * @dchan : Freescale DMA channel
+ * @cookie : DMA transaction identifier
+ * @txstate : DMA transaction state
  */
 static enum dma_status fsl_tx_status(struct dma_chan *dchan,
 					dma_cookie_t cookie,
-- 
2.55.0

