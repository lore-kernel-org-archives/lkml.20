Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4055347AF65
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831822; cv=none; b=SvGZ09CmDaiZ/axa3STiFE42hv2jJRCTJnKrYod9e/VlPfvtuJp9WXzGECtRUxKn2fqvH0y8xzRZIddrHAqynSr5PMtWXSoLpkqj6GL23lbuNHmMAiPwgkHs3QiSZ2Ew3XGgQvCAP/IOlUbR5krKxt0LgqP+aHyTPbreFD4j+xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831822; c=relaxed/simple;
	bh=L17dqbhgW6LPjm2Hzvm6ye+y2jC+lXQqy3P67yV3gUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fszb8TXbt475hIEuW11voZp2mDkrTgA7cz5YNCG6KseP+wL+bRPTY59H1xmVSZoxTPcLcyVFspU35i+3qBnPNcW31sONs7Ldx6lq1fgAC+sjEynMidhKrpaxQQe2WyGU1cnXEGXb3ED53a59xCtIbcyw/iFKqLrlls6xp5IIzww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJ4w+6U+; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJ4w+6U+"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3514e7cbbbaso5547728eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791831817; x=1792436617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H5aK4FPgpgiV4UbCfqX+FC+2NP/WgnHYWZmGMbzi9uU=;
        b=DJ4w+6U+9gqociNDkVWRH1GOKJjqGg4rQFff4uqFWYlyZfJlypIcWvpdOjjYumCx5n
         IsJddveYO5CwCz/c4aBS2IS9ttH/tUhBrz5LmU8HiygxfrhDXOh9D2ec82VXHI9E5xoc
         PY5bBYnLLcRkbzjqmg/1KmgnAhMSZTfB+CqCslrYFzsQ8aGJ7/hPKzGMDCvT/QoYym7n
         mObmU70XEC1DTq5UFrtQr418/8EDM460bKBNhGTGXzNPt69tNMIYK7rcb6hwK6MGhgeU
         R8gaZVh87y1pnBqY3wDRwHh8tjBbDFRgq2Su0WV1HAsyda6vekxoVO9JzN+N3q5noI74
         MFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791831817; x=1792436617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H5aK4FPgpgiV4UbCfqX+FC+2NP/WgnHYWZmGMbzi9uU=;
        b=S4HMAZL1TUtSYvEUirrNMjmDLIgxV6p7uFIzVQP5KYqsbQTlEIVXXXsi/9qj38WYMZ
         ybetYXhcY+FsQTKiuO+iXkSCKeHh1QYzLxGgWO12+aTLPaAjVklVMmIDHTjCq4h5fVJg
         Q6JhTNnooouj7ik0oypz+G/Y/BFmnDqwcK2JzjTLcurjTYOIAjcPSPDUp+xif9/Hd+hf
         kgs6DOKpzPnRKruGuTVDNpxiIx+9dm3CgBGaTbjn+J2MEKPdznJ4voKD5pSyvcaccqwM
         gGZcfDaKiyZ0I22PRgWr4Q/u1tBfHDvrQMMlKcD+2HZP436WrJSpG4RYh5YhUD8Vo2Aq
         4ODA==
X-Forwarded-Encrypted: i=1; AKwUvBzTw39OuzCs9ApLkW/8aPXTOl+WaB/6o0owDGPA75VTQ1yfC2iITDkKSQC8bkJYs0xZsCnuiIexkv35LJM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgK0tjCDKwrRUG20uvedzLpbDq16QwjQVJu1pGzCIKoAXUOhtI
	lDPiBsawUHTm3XXVqZKAEM23s4gw96KByVR15vUlfdobqxwsv/J5F5iz
X-Gm-Gg: AYBFou2DcCTfIqVHddvSd/09qXZcBcbm3yQNweBuIq4PGLAZmudJe7+CJQaLHqJl9nl
	8aKkT/FCVLXvm2cKOkm1ogsExTcO2Ah1hfQ5QYaOCW3nF7osQi7lqK6EQerJdngOZC2oDj19ibA
	LO7kTgA2PTcYCByI4ujSzegIa38JK2N1S+eFznxUZTU7hJzZIygulV0vDE9kAT1CloWoINmx074
	BiIz6mwxaLO7b9r3bWelP5EtVDBgDck29w78jmCfQMN2sYuonKAmgJdsjV9FKovwD8VRsjPmR0V
	QrbWFFeUXSAvy7tYj6CNnjM9gi0SyxcEspdIDzeOldc3TaB0KCPj7GoFIofKcjMq6s2t37FchzL
	T0JIt+qHnn/IsIK8P6ok/KIDGjxrKfO33Wu0Ln2c03FRrc3rm9E+2vijdM6WudW9xasa4D96ZNb
	1Po6GruFGBjK8C2Ieatkurdt8/U8t/brPtKrPBaRQNt5qkC6yz82IujbaVEfrd3/RC159OY7YE/
	6YLGk7wMk16+qouJKCbWaTXCQsdzrZbVzTM/PQ=
X-Received: by 2002:a05:7300:de49:b0:35b:b3fa:40f7 with SMTP id 5a478bee46e88-35bb3fa4218mr1657633eec.38.1791831816982;
        Mon, 12 Oct 2026 12:03:36 -0700 (PDT)
Received: from localhost.localdomain ([136.126.251.209])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb6a279sm35501602eec.30.2026.10.12.12.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 12:03:36 -0700 (PDT)
From: Henry Zhang <henryzhang62@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Henry Zhang <henryzhang62@gmail.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/vc4: dsi: Recover from a timed-out transfer
Date: Mon, 12 Oct 2026 12:02:43 -0700
Message-ID: <20261012190249.3167-3-henryzhang62@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012190249.3167-1-henryzhang62@gmail.com>
References: <20261012190249.3167-1-henryzhang62@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a transfer times out, vc4_dsi_host_transfer() disables the
command, resets the FIFOs and returns -ETIMEDOUT. That is not always
enough: after an LP receive timeout during a read (the peripheral did
not complete the bus turnaround), every following transfer times out
as well, with no interrupt and STAT reading back 0. Only a modeset,
which goes through post_disable/pre_enable, brings the block back.

Reset the DSI block and its analog front end after a timeout and
restore the configuration programmed in pre_enable, so that DSI keeps
working without a modeset. The timed-out message is not resent, as it
may already have been executed by the peripheral; the error is
returned and the caller decides whether to retry.

This does not prevent the timeouts themselves. With video running,
vc4 does not keep commands within vertical blanking, and transfers can
still time out, sometimes several in a row after a reset. That is a
separate issue.

Tested on a Raspberry Pi 4 (DSI1, 2 lanes, video mode at 120 Hz) with
a panel driver that retries failed reads up to 8 times. Without this
change, the first timed-out transfer left DSI unusable until the
display was switched off and on. With it, 499 of 500 reads with video
running (77 transfers timed out, 71 of them writes, all followed by
working transfers) and 1000 of 1000 reads with video stopped returned
the expected data.

Signed-off-by: Henry Zhang <henryzhang62@gmail.com>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 92 +++++++++++++++++++++++++++++++++--
 1 file changed, 89 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index c092a1a..3783ff3 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1171,10 +1171,9 @@ static int vc4_dsi_bridge_attach(struct drm_bridge *bridge,
 				 &dsi->bridge, flags);
 }
 
-static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
-				     const struct mipi_dsi_msg *msg)
+static ssize_t vc4_dsi_transfer(struct vc4_dsi *dsi,
+				const struct mipi_dsi_msg *msg)
 {
-	struct vc4_dsi *dsi = host_to_dsi(host);
 	struct drm_device *drm = dsi->bridge.dev;
 	struct mipi_dsi_packet packet;
 	u32 pkth = 0, pktc = 0;
@@ -1359,6 +1358,93 @@ reset_fifo_and_return:
 	return ret;
 }
 
+/*
+ * Reset the DSI block and its analog front end, then restore the
+ * configuration done in pre_enable. Resetting the FIFOs alone does not
+ * clear the state the block can be left in after a transfer timed out
+ * (e.g. on an LP receive timeout): every following transfer then times
+ * out as well, until the next modeset.
+ */
+static void vc4_dsi_reset_and_restore(struct vc4_dsi *dsi)
+{
+	u32 ctrl = DSI_PORT_READ(CTRL);
+	u32 afec0 = DSI_PORT_READ(PHY_AFEC0);
+	u32 afec1 = DSI_PORT_READ(PHY_AFEC1);
+	u32 disp0 = DSI_PORT_READ(DISP0_CTRL) & ~DSI_DISP0_ENABLE;
+	u32 disp1 = DSI_PORT_READ(DISP1_CTRL);
+	u32 hstx_to = DSI_PORT_READ(HSTX_TO_CNT);
+	u32 lprx_to = DSI_PORT_READ(LPRX_TO_CNT);
+	u32 ta_to = DSI_PORT_READ(TA_TO_CNT);
+	u32 pr_to = DSI_PORT_READ(PR_TO_CNT);
+	u32 phyc = DSI_PORT_READ(PHYC);
+	u32 clt0 = DSI_PORT_READ(HS_CLT0);
+	u32 clt1 = DSI_PORT_READ(HS_CLT1);
+	u32 clt2 = DSI_PORT_READ(HS_CLT2);
+	u32 dlt3 = DSI_PORT_READ(HS_DLT3);
+	u32 dlt4 = DSI_PORT_READ(HS_DLT4);
+	u32 dlt5 = DSI_PORT_READ(HS_DLT5);
+	u32 dlt6 = DSI_PORT_READ(HS_DLT6);
+	u32 dlt7 = DSI_PORT_READ(HS_DLT7);
+
+	DSI_PORT_WRITE(DISP0_CTRL, disp0);
+	DSI_PORT_WRITE(TXPKT1C, 0);
+	DSI_PORT_WRITE(CTRL, DSI_CTRL_SOFT_RESET_CFG |
+		       DSI_PORT_BIT(CTRL_RESET_FIFOS));
+	DSI_PORT_WRITE(PHY_AFEC0, afec0 | DSI_PORT_BIT(PHY_AFEC0_RESET));
+	/* AFEC reset hold time */
+	mdelay(1);
+
+	DSI_PORT_WRITE(CTRL, ctrl & ~DSI_CTRL_CAL_BYTE);
+	DSI_PORT_WRITE(HSTX_TO_CNT, hstx_to);
+	DSI_PORT_WRITE(LPRX_TO_CNT, lprx_to);
+	DSI_PORT_WRITE(TA_TO_CNT, ta_to);
+	DSI_PORT_WRITE(PR_TO_CNT, pr_to);
+	DSI_PORT_WRITE(PHYC, phyc);
+	DSI_PORT_WRITE(HS_CLT0, clt0);
+	DSI_PORT_WRITE(HS_CLT1, clt1);
+	DSI_PORT_WRITE(HS_CLT2, clt2);
+	DSI_PORT_WRITE(HS_DLT3, dlt3);
+	DSI_PORT_WRITE(HS_DLT4, dlt4);
+	DSI_PORT_WRITE(HS_DLT5, dlt5);
+	DSI_PORT_WRITE(HS_DLT6, dlt6);
+	DSI_PORT_WRITE(HS_DLT7, dlt7);
+	DSI_PORT_WRITE(PHY_AFEC1, afec1);
+	DSI_PORT_WRITE(CTRL, ctrl);
+	DSI_PORT_WRITE(DISP1_CTRL, disp1);
+	DSI_PORT_WRITE(DISP0_CTRL, disp0);
+	DSI_PORT_WRITE(PHY_AFEC0, afec0 & ~DSI_PORT_BIT(PHY_AFEC0_RESET));
+
+	DSI_PORT_WRITE(STAT, DSI_PORT_READ(STAT));
+	DSI_PORT_WRITE(INT_STAT, DSI_PORT_READ(INT_STAT));
+	DSI_PORT_WRITE(INT_EN, DSI_PORT_BIT(INTERRUPTS_ALWAYS_ENABLED));
+}
+
+static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
+				     const struct mipi_dsi_msg *msg)
+{
+	struct vc4_dsi *dsi = host_to_dsi(host);
+	u32 disp0_ctrl;
+	ssize_t ret;
+
+	ret = vc4_dsi_transfer(dsi, msg);
+	if (ret != -ETIMEDOUT)
+		return ret;
+
+	/*
+	 * Leave the block usable for the next transfer. The message is not
+	 * resent: it may already have reached the peripheral, and only the
+	 * caller knows whether it is safe to repeat.
+	 */
+	disp0_ctrl = DSI_PORT_READ(DISP0_CTRL);
+	dev_warn(&dsi->pdev->dev,
+		 "transfer timed out (stat 0x%08x), resetting DSI\n",
+		 DSI_PORT_READ(STAT));
+	vc4_dsi_reset_and_restore(dsi);
+	DSI_PORT_WRITE(DISP0_CTRL, disp0_ctrl);
+
+	return ret;
+}
+
 static const struct component_ops vc4_dsi_ops;
 static int vc4_dsi_host_attach(struct mipi_dsi_host *host,
 			       struct mipi_dsi_device *device)
-- 
2.47.3

