Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DCD1FFC59
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789689830; cv=none; b=jtDsonsVvFtAm2kmKPXf4NQgZQ2gANxvV3bpfpB12oIUZZ+qAtIjPi9vYcLExCMa6tp3Sx+svIGt1Y+vCtHE8QnLn4nkxkvIPeSHo9tdS+gz4VjSJeWMCCG5mOXcasL2HXNg9oyErhvQy2BZ9XEO2EAsKn2nY6X2EZqV9WiOMA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789689830; c=relaxed/simple;
	bh=iHDjNdeaDR579Nwpkk3+whgnsGtESijmLANuqkn0JpI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AxYVa30IDHSQWqQC5969FutsVb7ilJiDgQKthRfo/5LP44r22Yf35SV7OEFK/UaZIQfhSXMtGcUYeOJvWJ6SMXfW56lIps0dzcCWc4ZxzJnAnjMakrIDpFzaoyoHnjFsmlcjaU+aOhDVZPWZx+yiTA4Tjes6ovNR0H1xFUzWRho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fKYHFmwc; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fKYHFmwc"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85a4329731cso145987b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789689829; x=1790294629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=td02wgcSN8vD5tWjUceqoIvDsiVukV9sMBkDmGCezcQ=;
        b=fKYHFmwc91HHcinpQ0Eedv9TCgF2k/YL5O5R4t7rMoCzsmBqxbIHL80KDEQoJpqA7z
         OjKxBsEskNS1wUihPOWAj5Im4TDL454crg5J3XKWzZL14ZOKdRqCu1ftQwEuqwj5zADi
         2nRORfv8oqznHYtcmrt3po1n0acilPZBJ5UkSAYXHyZj6c6Na7yNrlzaNY/yqR42uV3I
         X+b4iJXUgjBbkMTrv5on0WrgyTOpDAjoYekbVpFrGhGRO5v0SGyXGLcpVwT+bZ6TrD87
         3wjaVrtZRdyseKXaRkr7CLDxO+oHwQQx4bfUAJ4VfNc4+5vXdEL6DDT14ayAtSxAEt2b
         zQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789689829; x=1790294629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=td02wgcSN8vD5tWjUceqoIvDsiVukV9sMBkDmGCezcQ=;
        b=I20nxsrsKXItdhM9AabWdbyjSDerq1Nu9hdoc5Q4gHEUWQIjw8qOeEiAb8/Ct9Cs12
         eFscjJ3+dVMc5me1uBcjFmEYi98FKgTHYwCEljEN67zPFn8tE1Y2I7Qau1NbNU7KhOjz
         jAl1tcm7qGPzq/bUNZPoIJsJ7k/h3vb6BRUToXOCWH5AvPZ4P050Ea6Znp8qP98AlI5j
         li5Vbr4icQ8TCl0f0mOnyBsBh4vzKbFNXUgRT/Gwx+DU+q98ddzg5RpFY/5nAJgGela1
         kFb+INEe6OAadtnyD9xE3ppw2+RhspVNMFN051q+a2ZMEgBgpNn3RO3e0B4WW/8QoVal
         dKwg==
X-Forwarded-Encrypted: i=1; AKwUvBzCnHwwmqDUwGAS9UiR+3C6gccTmDF09pGK7x+iknZFMsH9J6Jqiww/tFAxEz+Jav3D36MkBi+39BxgasQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nalESE2+Mpw5pkgAEOTK87dYb3VgoLqFxGdMGumjPzCoM+zXki
	tAQIIGDsH742vqOTFarLgONiGC1B0qtEdggzTzeXvVSyvnWjBO2IgyPl
X-Gm-Gg: AYBFou1JGopzyDxOpoUgGQaT6oszmLRF9mhaVH06s6+yHb5Cg6mu5k/aJCm1kbSdNFp
	IBjAO+ySXfGkqHMD3grdtQRGsfDGfTNZk+GZFzDiFSYpkRH1QChtGXQGEJZladyqoEw6XuwYP0E
	gAfIDOvP3xJVsgs93kHiSMduqKkZwbTT3D8ZC8dnW77ItFlnkqgbm1AMwE6jNyu04aVLU2XXuWx
	uHT1/H5IbHqEbzOi0MXz0+34YZ0pLWkb5k18E2FXHMJg0FiR5VLLxCLMghD2qgI0v675rs3gZsa
	O7FfIsoRinzn9QafYsxsKuuCkn7NALGpne+iYpF2wI/aqfehKQKgUgqUfRoiUvW4IhqC/DOvL5q
	6rDxM6RFYVoRIRfyI1AWVVmcGSkAKLDwKNXZ7rzZukBfHG+zDCGVloRR90y5A5jPRORx308U0hZ
	+HvkI8fgxTyuVA5KjmPrpjL+jlEcRR4QH9Yl6dUbvKUosKWqLZgyeaBmAW7lD6ue+mUV2DFtg+m
	taJTa02dRSxG8Ndof3tdweXVRBbN+Nc7Fz35EETMOKklq7130lKswfy6bfnW4XlT1G0UZOi+517
	oTVJSCXF4dUWcpfz27fWpYRU+bm5y/f+TcW54/AqSrgKH1Bh
X-Received: by 2002:a05:6a21:6b05:b0:3c3:a20f:f729 with SMTP id adf61e73a8af0-3dd8c3fb695mr1418708637.7.1789689828812;
        Thu, 17 Sep 2026 17:03:48 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50ab53890sm3928483a12.11.2026.09.17.17.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 17:03:47 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Dan Williams <djbw@kernel.org>,
	Maciej Sosnowski <maciej.sosnowski@intel.com>,
	Nicolas Pitre <nico@marvell.com>,
	Lennert Buytenhek <buytenh@marvell.com>,
	Saeed Bishara <saeed@marvell.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv3] dmaengine: mv_xor: order descriptor writes before engine access
Date: Thu, 17 Sep 2026 17:03:45 -0700
Message-ID: <20260918000345.150852-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The descriptor pool is allocated with dma_alloc_wc(), so descriptor
writes sit in the CPU write buffers and only reach the engine when the
buffers are flushed.  The engine can fetch a descriptor as soon as it
is pointed at one, so those writes must be ordered against the MMIO
registers and the descriptor links that hand ownership over.

mv_chan_set_next_descriptor() programs the next-descriptor register
with writel() instead of writel_relaxed(); the barrier inside writel()
drains prior descriptor writes before the MMIO store that points the
engine at them.

The chain-append path in mv_xor_tx_submit() needs two more barriers.
A dma_wmb() before mv_desc_set_next_desc() orders the stores that
initialize sw_desc->hw_desc in the prep functions before the store
that links the descriptor into the chain; otherwise a running engine
could follow the new link and read a half-written descriptor.  The
existing mb() after it orders the link store before the busy-status
and current-descriptor register reads, which the relaxed readl path
would otherwise bypass while the link write is still in the write
buffer, letting the CPU restart a channel the engine has already raced
past the tail of.

Fixes: ff7b04796d98 ("dmaengine: DMA engine driver for Marvell XOR engine")
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: add back dma_wmb
 v2: split off from main patch
 drivers/dma/mv_xor.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
index da8eea8789ae..c46ee95fe01a 100644
--- a/drivers/dma/mv_xor.c
+++ b/drivers/dma/mv_xor.c
@@ -103,7 +103,11 @@ static u32 mv_chan_get_current_desc(struct mv_xor_chan *chan)
 static void mv_chan_set_next_descriptor(struct mv_xor_chan *chan,
 					u32 next_desc_addr)
 {
-	writel_relaxed(next_desc_addr, XOR_NEXT_DESC(chan));
+	/*
+	 * writel drains descriptor writes to DRAM before the engine
+	 * is pointed at them
+	 */
+	writel(next_desc_addr, XOR_NEXT_DESC(chan));
 }
 
 static void mv_chan_unmask_interrupts(struct mv_xor_chan *chan)
@@ -407,9 +411,18 @@ mv_xor_tx_submit(struct dma_async_tx_descriptor *tx)
 		dev_dbg(mv_chan_to_devp(mv_chan), "Append to last desc %pa\n",
 			&old_chain_tail->async_tx.phys);
 
+		/* commit the new descriptor before chaining it in */
+		dma_wmb();
+
 		/* fix up the hardware chain */
 		mv_desc_set_next_desc(old_chain_tail, sw_desc->async_tx.phys);
 
+		/*
+		 * make the new link visible to the engine before we read
+		 * the channel state, the device may fetch it at any point
+		 */
+		mb();
+
 		/* if the channel is not busy */
 		if (!mv_chan_is_busy(mv_chan)) {
 			u32 current_desc = mv_chan_get_current_desc(mv_chan);
-- 
2.55.0

