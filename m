Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10494E06D8
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647201; cv=none; b=QGUNJCk0wDYWCnl3oLJ+RiSrXYb+hAB1pc7AG1JomffGy7TUKkHQp+4dLwdL9U/58An6WQJjcodWo6/9OZFKLce4RIMVz4sI5AVthEZXm8WNYHpTAZXBhr7o8ju2EsavzHmrWa14hDdG66if/0cyiqXTXvYEFXfoubJQ/xQ2kqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647201; c=relaxed/simple;
	bh=MeFrqAQYQIVbUicP9V8M34hZDEv+igpvOZgFQMA9wWk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SFK0dDXHAEJEj0lV3bo4/hGqLyBjk4HRgGWPBdjxKifWEHdlDJ4OabcFtIRdfLBuhxqgzb8QXj7u/3jq0CeQx1i6MEfOp1izyJoKo5Wl+i/48fnnrNn1maMdeUHMdULd5j4hADtQJ8FR4tohX0uwzImbJ5iMApBb1Fkgd8TFaPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hldM+NdY; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hldM+NdY"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843378fb37so395431f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789647189; x=1790251989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GuXqc4H5dE+MDL7nEDkrFd3PYvzEZhNj1KGCmYesUCs=;
        b=hldM+NdYBLI0o/EhICZGfzfijLBESqtB0wOlWYxnuDGTxVPwmkBpTpCXZp3zsCAlbW
         TDl/9Dg4ZyVn5bZVMtxx9n1d7HG7hy5GeAiOe/fW6uLcoYfWCFIZeMVFKf9TGsOFJQnP
         0GKfBaigFnwqg3Opb1o5YAwoaKbydsPniUJ6syVn8mvLFRG3kSPJbMh6rN//zrSHApMr
         ltf0qWQ+XWsy3QphoThzBnvKcLLNkutwOwNgYjUldXa5TprYYkXK3EcOwm0eibcUgjMZ
         iu1E2OObvcKj3K7VshB+Rof3+j/ATQQldBBPUi+KLOZEyZdusLK05qxZ2zg+P2uMl8/2
         3OVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647189; x=1790251989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GuXqc4H5dE+MDL7nEDkrFd3PYvzEZhNj1KGCmYesUCs=;
        b=VkSUVP/g4UPlMkCkoDyanVHOeuPdhxDK/4oLv0713tEzw7VRBwGuzZI+CC3u3U2nOE
         E8jze7nYkyqTdDoe2YFspHvwyOfWyVVCD0DfA0Qf/7nln4s4QJVHIZSZ1oqF2GaMAsmR
         28vrLq/LxiNrWWJ11srDbvtBM22jNXq0WPCp4Sd6n8ci+Ivd9iWP6jw0ADs9Eulij0ub
         swHAeMWUw4znziBstEYERC62fnmOpEapGCTSuptEGddbrqBBvsA54pgdCrIl4rk8CbIk
         a0VO9yuLJ5LH9fxjeM+r6hn/4O9Ruh++PVH7LdB09AJU6G3p1QYK7oGZCv8GxJ8y2FQY
         1Bxw==
X-Forwarded-Encrypted: i=1; AKwUvByzV5PD3eQCEecSqVokhaM76eMF7FcJjf2oiq/hqdlg3OrQDJuyYzEgp9bSQpqBlTbgZUVsOv7xC61v21E=@vger.kernel.org
X-Gm-Message-State: AFuF++nLi70e/EesiEMw898ShwufoHwx9y8EHAaHGKqIIG9fhzPtHXOT
	NdROkQxFZtHlvdEM/J32dpqVthmPwPbtQkZuW5NynFtuZtgu4movFFun
X-Gm-Gg: AYBFou1cGN+vw91a/iO6yDOEpkFahQ6Q7WhG7leI5qLyYpWeTex3GYL7gM6j/leR25m
	pkUmy2E3TSqxBRqJqNpz3wfzCGsHmmd0qpNL1MIBDxVTSem7VfhSJRSExoSiOxpkSme36kKKlNY
	Tz1rgXRujfTSdCSSJmjQ26l9CDGy7+9cFhykM/viI7I5DnaDuyp4zwwmtS1TjvyjYS+4bd32Jme
	n7ZhjFZHt6ncVrZs/H6NF/4IkQD3bZPcfieNwa+t9VhkvNbaJfJ70jrZYrUhn6vQxz62I80UbvZ
	p334cheDh+LgOAP3QkGI7yMEj8r1fKro0em8VdUpKyUxw9efCmIK0EfBwLiBwYdL45oXW4CQwbi
	zxoc1+f+MK46+oRWLGRj8dfKxlj/A61mySNDc0w8n+kMC3I9V3wMwuLyL+vtrFWFmWMjeqeH34I
	sVRXszax8zXuTNk23Owcs8Fl2Dzs33iliQebZ3rkT7hTzNfxZYmJYsSfrorjn/fdU4maiMTlVkA
	ZPLFcUYFZeKii+cAgNl8b4ON8rRSG9SeXk3uNCd
X-Received: by 2002:a05:600c:1986:b0:49c:fa20:cc04 with SMTP id 5b1f17b1804b1-49eb732e404mr79422515e9.27.1789647188967;
        Thu, 17 Sep 2026 05:13:08 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd204c1asm70146675e9.4.2026.09.17.05.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:13:08 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net] net: axienet: restart the TX queue after a DMA error reset
Date: Thu, 17 Sep 2026 15:13:06 +0300
Message-ID: <20260917121306.23499-1-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

axienet_dma_err_handler() resets the DMA engine, frees every TX
descriptor and sets lp->tx_bd_ci and lp->tx_bd_tail back to 0, but it
never restarts the transmit queue.

If the queue was stopped by axienet_start_xmit() because the ring was
full - __QUEUE_STATE_DRV_XOFF - it stays stopped.  The only
queue-state clearing the handler does is netdev_reset_queue(), which
touches __QUEUE_STATE_STACK_XOFF and does nothing at all when
CONFIG_BQL is disabled.  The remaining wake in axienet_tx_poll() is
reached only when axienet_free_tx_chain() returns a non-zero packet
count, which cannot happen after the handler has cleared the status
word of every descriptor, and the wake in axienet_start_xmit() cannot
run while the queue is stopped.

The transmit timestamp is not refreshed either, so on a kernel with a
TX timeout handler the watchdog condition stays true and the reset can
be retried indefinitely.  axienet_device_reset(), the driver's other
reset path, already calls netif_trans_update() for this reason.

Wake the queue and refresh the timestamp at the end of the handler.
The descriptor ring has just been reinitialised at that point, so it is
ready to accept transmits.

Fixes: 8a3b7a252dca ("drivers/net/ethernet/xilinx: added Xilinx AXI Ethernet driver")
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---
Compile-tested only; the board I found this on is not available to me
for about a month.  The BQL/STACK_XOFF case was exercised on hardware on
2026-08-26 and did recover, which is why the gap went unnoticed - see the
discussion on the TX timeout patch.  The DRV_XOFF case is reasoned from
the code, not measured.

axienet_dma_err_handler() also tears down the TX ring without excluding
axienet_start_xmit().  That is a separate pre-existing problem and needs
a separate patch; I would rather send it once I can test it.
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 782f903d318f..b6440c06f260 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -2778,6 +2778,15 @@ static void axienet_dma_err_handler(struct work_struct *work)
 	napi_enable(&lp->napi_rx);
 	napi_enable(&lp->napi_tx);
 	axienet_setoptions(ndev, lp->options);
+
+	/* The ring is empty again, so let the stack transmit.  The queue may
+	 * have been stopped by axienet_start_xmit(); netdev_reset_queue()
+	 * above clears only __QUEUE_STATE_STACK_XOFF, and nothing at all
+	 * without CONFIG_BQL.  Refresh the transmit timestamp first, or the
+	 * watchdog fires again on the next tick.
+	 */
+	netif_trans_update(ndev);
+	netif_wake_queue(ndev);
 }
 
 /**
-- 
2.47.0

