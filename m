Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505275;
	b=d3JLQyi0e0grYKkBwpuHD5odIxW8q83iMO/tJV9whaukQ/l3RsxyowOGX+PMk1oXD4T+
	 qIXwg0uH73TrWRNqGlb+M5k9UlNYXgfdIhc32kgVa3UnrV+d8LiYdy/yyhOtU/8RoCVU1
	 VYhP7JfbJYSlsQRYMB36Th4AqtXD9MxmknRys6cf5fyYHrRp9XJPAOHT6KUxlasLmlQfD
	 9a+dbQNS69u5eJ0e6y5F7x4cReNz2S0ZfPdrVwFMsZ8r7EGtAQloCSz0Mj+27bIOJ4bDk
	 9071mwc+DkLam3svy9YGehE7NWdZbnxjkJPC0NaA33zhKstuIqiwf5GGWndO8k7TcHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IHU3kr6H4ebRnMajlQ45rUZRzGT3LcsJKitPjmSl92U=;
	b=DFZZdG21VTjRrvMsYPe0GLXffsDmsMc61GD3+HHIVhHe102W/ACvXPOircqQW85Txj2f
	 B6mC/i3JW3Cdhl1y8lCyHycss5ViYvv15y8L9ekzcgLL0s9VfAp5kGc5d2EQkqkLxNSQ0
	 /A6v1DHrg7JlEfIQJBeiq09Ba88aSp2fer4VcLouQA7ZtckoRi5okz4xtt7kdNd77oBo6
	 iztuEl3nFH0SVuqW7rDQQNMB43DUtKOYSKwg0PYgMQm0+fcG4R6mlsUEJn0699MuEs29z
	 pI/5E42mVymHqQbWiaOPnXQETdm5qG4GMO9EHWIX94BSEY89FzS9zpiWiSxZc5tWpGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gnd0VxFh;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A3D606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:07:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6A3D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gnd0VxFh
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd6969473a3so35147a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792505274; x=1793110074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IHU3kr6H4ebRnMajlQ45rUZRzGT3LcsJKitPjmSl92U=;
        b=gnd0VxFhaEiVHqKR6cYe64yfq4qesQy426F6HEdRyq20V4WOvYgxDm585r8Z6sRNgW
         LiSaX8+ot3gmLvWssMmo6AXkao1OCC3Eh9y/ZYSo4FmhybDYOC4M/U4zL0CMvP/h2I0U
         HS+Z5W+RrQLHWMkZu5Q8Wovm0Rq7A83b/fR5afrYJQn03DXCfTw6AQu+FjHufvcxborG
         Eqyq/G5Avo6Uq6cglysqTdsNkbwllcESDWf0druCZK175Pj48LwQN342WkWsn0hLeIkj
         X4z/CS1FoNTzf5izj/XjZZYlwk9DhVACjn0dt+uLcdVwGkM4dqfX3qmnEpcQiYoleL7g
         /FiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505274; x=1793110074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IHU3kr6H4ebRnMajlQ45rUZRzGT3LcsJKitPjmSl92U=;
        b=J6IHwJkKeQj8cZ2kYd2yRkn8g6Onw3C/b9O393NLlfDT4jlVZBrLE7fRwugOc+YNfn
         5zp/NP3jtKa5UX7tG394GHSJIaYmpAHpsKI/CScTwqKW/VGWTUxJ63eOjwJdyRPUZ5Pc
         A/3gu9oudvyfekp4tRdTQfa3wygFWz3i/jSWrc3Ay3RxC0bIEeNPXK+EyXtqYiir2tQF
         o/82nQRD8E+RxTWksuEKL8BdoeHGLRc2peNtkhHy/kB/fk1QWUyejnI994uJvW+jvpbq
         wsg3W+qDpoci8TpPrTb67mC8frU3Y8kmQ/9LmYuk5jH9k7vrSHqvLd3v8jMq4g9cA7BT
         LTzA==
X-Forwarded-Encrypted: i=1; AKwUvBzrIOHkjw1vLLMhHecHm549JGMLxGKz8S1xMUkeiW+Av2XO/8+bHBMM0dNQ3ITZUX7JK5L/kGVmubZnlAk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjSTNSY8rOkoJDITlineqmnw4H+zf1FQlpQhwpIZ8RODnsBXsR
	zUzoLsXcm1tB4TjmelPZhwrQ2KUPPCYuVEHLsPMh9xhnczyZyyaKZaaX
X-Gm-Gg: AYBFou3YajFTqbZaFmRMwLckDiCcbcxcrViPYfwoQWQK3RMDaIb/9LP01Q6B09zvC8A
	OXxXy4BsSSZvMQgI70hhzn6Y1e1OAH93nqMJXY/TTSPpcp6UgmED0BylumPI8dcDcMLd42RPKU7
	m717KIdMJ11vMP7mtM5G3XrNKIwpZe5nhYYuAXUrLUOJ54OD4CWao5oZh543sbbDlzH1w/K5Hnw
	D2xD/NYYNmlWG4FeXCMlObmKtz58XZvx2yokbD1cLlNzNUvzLZPGg/H4AvO7GCUK2WfwZksMOET
	N0CwnNoolLRlOLWPnB36gUeI3qHLkUALyKONT5XPsU26myH71f/hLGITTe40lhWLAgIs0895Een
	9QRwVCQbv0drcnvT7IKaW6kmRoFHYW0uWmAUXU6t/Lis/Kgx04ew6EDlN3NLclWuujjwWsiXxCN
	m5Ar8vIhvFProrZuNRIBPXJw22g5I1M8PKAbYL3doRzaPxUflO3PN4NcMV6HQxHM0sXjIffACm2
	V7ehBMZjp84NdAs6g==
X-Received: by 2002:a17:902:e84f:b0:2e9:4175:306b with SMTP id d9443c01a7336-2e9a6832e3cmr148561805ad.1.1792505273849;
        Tue, 20 Oct 2026 07:07:53 -0700 (PDT)
Received: from LSSP.an0.nb ([2001:da8:7001:22:4372:4888:28d9:3e09])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea145b7805sm13430075ad.8.2026.10.20.07.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:07:53 -0700 (PDT)
From: Guanxin Li <bruceli20040604@gmail.com>
To: Aubin Constans <aubin.constans@microchip.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guanxin Li <bruceli20040604@gmail.com>
Subject: [PATCH] mmc: atmel-mci: fix PDC bounce buffer use-after-free
Date: Tue, 20 Oct 2026 22:07:43 +0800
Message-ID: <20261020140743.2765011-1-bruceli20040604@gmail.com>
X-Mailer: git-send-email 2.43.0
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

atmci_remove() currently frees the coherent PDC buffer immediately
after pm_runtime_get_sync(), before the controller and its interrupt
handler have been quiesced.

A pending RXBUFF or TXBUFE interrupt can enter atmci_interrupt() after
the buffer has been freed. For a completed receive transfer,
atmci_pdc_complete() accesses host->buffer while copying received data
to the request scatterlist. When data remains, the interrupt handler
can instead call atmci_pdc_set_both_buf(), which may program
host->buf_phys_addr back into the PDC and make the PDC access a freed
coherent allocation.

The buffer must also remain valid while atmci_cleanup_slot() calls
mmc_remove_host(), since an in-flight request may complete during host
removal and take the same interrupt paths.

Move dma_free_coherent() after the controller is disabled, the timer
and IRQ handler are synchronized, and bh_work is canceled. Keep the
remaining teardown order unchanged so that in-flight requests can
finish before the buffer is released.

Signed-off-by: Guanxin Li <bruceli20040604@gmail.com>
---
 drivers/mmc/host/atmel-mci.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
index 8f4df250a77a..7f1a5864da96 100644
--- a/drivers/mmc/host/atmel-mci.c
+++ b/drivers/mmc/host/atmel-mci.c
@@ -2592,9 +2592,6 @@ static void atmci_remove(struct platform_device *pdev)
 
 	pm_runtime_get_sync(dev);
 
-	if (host->buffer)
-		dma_free_coherent(dev, host->buf_size, host->buffer, host->buf_phys_addr);
-
 	for (i = 0; i < ATMCI_MAX_NR_SLOTS; i++) {
 		if (host->slot[i])
 			atmci_cleanup_slot(host->slot[i], i);
@@ -2612,6 +2609,9 @@ static void atmci_remove(struct platform_device *pdev)
 
 	cancel_work_sync(&host->bh_work);
 
+	if (host->buffer)
+		dma_free_coherent(dev, host->buf_size, host->buffer, host->buf_phys_addr);
+
 	clk_disable_unprepare(host->mck);
 
 	pm_runtime_disable(dev);
-- 
2.43.0

