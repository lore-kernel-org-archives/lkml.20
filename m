Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23E63403F5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 03:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788319793; cv=none; b=uBHdZX/rfWL2HvUYKQLNA9STxcGTyCe5T7/64mvNAyKpIla6ytR7p+WfgyLmtnF4cu6fnBlbdyZR4ZQN4mU984PAwPHCldZF7WhCqcDL2XaAlzYt7YQosYDFEy6Tyeyfcc3NwegQnC2Ndxh6DQWavDPonY+3mxVfkm9bXdD9msU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788319793; c=relaxed/simple;
	bh=Lht9vEQqB/Fmoa+XWhe3Q4RkS7MTEfMin0qo5+ocxBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sOa9rPRZ7U+q0Q46I0BtP72qlheLG+22oDLAalDfsDW1UoS5HBlhn/5eyG9GDPtVSIE2/bKkhLv/4zyK6sHera0L8Lpmtm20lDEf7g6F1i7OH3I8Op69MZeBWsAYNUref1KiChcjJ8zuRc08T6UC5dhm2pFnlG9LijSfG83GfEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qyk0b5J+; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qyk0b5J+"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d71ae3455aso8491155ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 20:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788319788; x=1788924588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1ZdTa+YPG5R8JD3WrAQzRV0ImB3xHixQQQtd7zdN10=;
        b=Qyk0b5J+UwYync67VZuSuN1+YqLigQvCOUYPsfG7iDZcSG/E7u819tmxdQ/3gCvjEY
         Uv4EXRXlMNa/A92q7MT1BjOaqqyq2DvN3oV6m+vuwPEQDM1xSEv6k+a0FTH0iITemnu4
         i/tKLc/xcKEjLzqiOW9gzqhXQDI0di5jeOzeqdUeaV3MOQspd/XC9QiRdJgfNDL3KKSY
         YF7HIyeUMxWxq5U5jGQ5ITPkpYSpywHguXqCyvdnetG6Uf84BJR+VF4hY1p49MrTH5GV
         4QmVC7dxNYz0K2s9OUHeZr4fmKkYmW+7J8ExAPP9JSG0GTVbU01K6+vmeRq++cz0me4x
         mnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788319788; x=1788924588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U1ZdTa+YPG5R8JD3WrAQzRV0ImB3xHixQQQtd7zdN10=;
        b=pdjwdIzQqlGy+GC7qp2poG3xy/n0BQFZxc0Onu5Wc01CxNov0+Hv1Tu1GgMwhhilXb
         SuJhJD2h/yc2JxNgw6f450QMjELUnpINpxh5z3UZQNr+yw2/1VZesGokFS1B+HzsX8i5
         2HRcRwWcB5yM2V9yIQr120Beob0EZEhWFsqbl4+FhDjjspvyBkaym+JXzSM+cP91G/Ix
         9Slf7mcwnZSX5RpAHncVrisdO4q0CnjQZ8lIawbsjCNOwFBxdosNB9uwjzod4L3Rf3uB
         rZFxdnH1VQPTvleeA2qlQFYj4SA3y1BOzwX7EhJdFYArYfBI54+dut/OIspnMZCJ9H7j
         e11Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq1fJbpINaALyy7Y9lpPYeOgZzhUDzVCEyz747g2Z8eSNxMChimI1lSBaPoVSucyQNEbXIvR4RYbR8jTCc=@vger.kernel.org
X-Gm-Message-State: AFuF++lz0Ao50g00I3XG8jkz/U3wkYRVX28Lijllv7yAszyqPhUMiIvF
	MADfG6fPcDgzmvfmlAzWxOGz4y4Lr22+PmbbkVZehRbY/zJS4Fn2c237
X-Gm-Gg: AYBFou0QUbTTgHzAfV8/DewUCpvIUtho/WG6z+ioh5piK8T93STWuRhyN3sIsz4zzYV
	cMOQT1luoLBTC8zvgrC8mtXLOX/58n1Dra2tsCZ2Gfb1IWJX71TEOSrxKRqPsHk2uZew1+YzqdT
	iMnoZW9hfprgnrnhY4FYg8IVd6AqbAT22zgJoY9zvNI8rHkBF8EEjJa6pSh5zkd79CkrPHq/I83
	HhwT5o9bbbjNrlg4GcQh4XdnFmHABHFfn5s0rtDyhrQjGkOybtrs8vPl550RuFoylt2wAmeOas9
	LVqW8Yu8xZ/a9FO18PMn/dJJhDqa3T2tHK86igBPUYRe1p7q+MBdb4NxRIDi3Cl/Rvg/GzZCzF4
	CAG4Jdu487pFIvMs7rCWqDfNfs/16jZu6n5QtwwLSkkLwCT1KUM4PK/iApdDAcpl9wKt2lZ7ww8
	KYsR8aJhJhhx8NNUsKXba7xzqHIm2UYJbS4aJpDcj5
X-Received: by 2002:a17:902:d482:b0:2d9:1dee:43db with SMTP id d9443c01a7336-2daec7368famr25186725ad.15.1788319788333;
        Tue, 01 Sep 2026 20:29:48 -0700 (PDT)
Received: from devobuntu.lan ([2600:6c5c:6b00:316::23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07baa594sm3099307eec.22.2026.09.01.20.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 20:29:47 -0700 (PDT)
From: Matt Vollrath <tactii@gmail.com>
To: intel-wired-lan@lists.osuosl.org
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matt Vollrath <tactii@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH iwl-net 2/3] e1000e: fix ps_pages DMA map error sentinel
Date: Tue,  1 Sep 2026 23:29:12 -0400
Message-ID: <20260902032913.661570-3-tactii@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902032913.661570-1-tactii@gmail.com>
References: <20260902032913.661570-1-tactii@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While allocating packet-split buffer pages, a failed DMA mapping would
leave DMA_MAPPING_ERROR in the ps_page->dma field.

This would have two consequences:
* The next attempt to allocate that buffer would write DMA_MAPPING_ERROR
  to h/w if all pages are allocated. If the h/w uses that buffer and is
  handling a frame large enough to touch the affected page, it would
  cause a DMA fault and be dropped. The driver would then call
  dma_unmap_page() on DMA_MAPPING_ERROR and unknowingly send the
  uninitialized page up the stack as part of the frame payload.
* On ring teardown, dma_unmap_page() would be called on
  DMA_MAPPING_ERROR.

This condition is only reachable when MTU > 1500 and PAGE_SIZE <= 16K.

Fix this by setting ps_page->dma = 0 upon mapping failure and separately
testing ->page and ->dma during allocation and teardown.

The rewrite of the ps_pages section of e1000_clean_rx_ring was necessary
to recognize the case of a mapped page without a valid DMA mapping. It
also fixes a separate bug which would potentially leak pages on ring
teardown. The cleaner stops cleaning pages when h/w reported that it did
not write to a page in the sequence, leaving the following pages
allocated and mapped. The teardown would then break early and leak the
unused mapped pages. If the ring is re-allocated with similar
configuration, it would reclaim those lost pages. This would only affect
configurations with rx_ps_pages >= 2 (MTU > PAGE_SIZE) and the same
condition of MTU > 1500 and PAGE_SIZE <= 16K.

Signed-off-by: Matt Vollrath <tactii@gmail.com>
Assisted-by: Claude:claude-5-fable
Fixes: bc7f75fa9788 ("[E1000E]: New pci-express e1000 driver (currently for ICH9 devices only)")
Cc: stable@vger.kernel.org
---
 drivers/net/ethernet/intel/e1000e/netdev.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/intel/e1000e/netdev.c b/drivers/net/ethernet/intel/e1000e/netdev.c
index 26f45ee8c7e7..063fc8cd2673 100644
--- a/drivers/net/ethernet/intel/e1000e/netdev.c
+++ b/drivers/net/ethernet/intel/e1000e/netdev.c
@@ -759,12 +759,15 @@ static void e1000_alloc_rx_buffers_ps(struct e1000_ring *rx_ring,
 					adapter->alloc_rx_buff_failed++;
 					goto no_buffers;
 				}
+			}
+			if (!ps_page->dma) {
 				ps_page->dma = dma_map_page(&pdev->dev,
 							    ps_page->page,
 							    0, PAGE_SIZE,
 							    DMA_FROM_DEVICE);
 				if (dma_mapping_error(&pdev->dev,
 						      ps_page->dma)) {
+					ps_page->dma = 0;
 					dev_err(&adapter->pdev->dev,
 						"Rx DMA page map failed\n");
 					adapter->rx_dma_failed++;
@@ -1722,13 +1725,15 @@ static void e1000_clean_rx_ring(struct e1000_ring *rx_ring)
 
 		for (j = 0; j < PS_PAGE_BUFFERS; j++) {
 			ps_page = &buffer_info->ps_pages[j];
-			if (!ps_page->page)
-				break;
-			dma_unmap_page(&pdev->dev, ps_page->dma, PAGE_SIZE,
-				       DMA_FROM_DEVICE);
-			ps_page->dma = 0;
-			put_page(ps_page->page);
-			ps_page->page = NULL;
+			if (ps_page->dma) {
+				dma_unmap_page(&pdev->dev, ps_page->dma,
+					       PAGE_SIZE, DMA_FROM_DEVICE);
+				ps_page->dma = 0;
+			}
+			if (ps_page->page) {
+				put_page(ps_page->page);
+				ps_page->page = NULL;
+			}
 		}
 	}
 
-- 
2.43.0

