Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377422;
	b=jAcKavgMxzIml1iIeVwD0mCMc1jKLG0Nbskqhy8vdUcq3/F4IQglzrZODFqMjPyJImx6
	 qWEWt+p4x39X2vgHO+FYi0Dve1d0a+quD8dbGNxUfsd+XYbL5PlDQFKyyKoFQvLfuohih
	 OPTIxTfpKDktJChBE0AIrXiy2spWimxnz8+keuZwr+YKT+HAYpY1/3MLnsi56qxEhaTbo
	 r9vvSpFoVcKRRn0yhnb5IDclYeYhEE+EggolXMdCWBGmujXEhTFMjUJgBu+Po3P1bl3qq
	 v7sNarJJRfSEfPuXSdYxJmhvrffIaXtMIhbUO2s9eO2DabCRr47qNsBDjKHxiZObw+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=b0GnmpO+AJdyxic7fk9eFb7rmK6rtUcv8tGjcAKiwQE=;
	b=vlW2199IMaYucdvvQw7N+FztR2P0fNs8nYLhuLBbFw7rPCF1JZYqMhVW3nc0vBk+xiD9
	 4XOE6RGxSZNYvJBC/7V6lKCuhHImvtUm9y0IUNNJH1y9+o+BQ8eaHfyEfArJhnjCHT1Hs
	 GeMDhtIbwU6UF5IPI1do5v50Rip0Z4IIk0axeqNhCRfM7RCKUW4bpK0CPP76ZmQjrGdd2
	 f1AS+diybJdaH7NBoaU/Sz1y/8O/ouBHBoNdbeMCdoT6CwOA6cvrjIIvryvrZteYtJwCY
	 TSb7Ju0vlYMmlWj9k1Vr8MFwpCAFMeAN+1jC9o80i5G78EmwehCKrfUNuMFInkdjlwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XgtcXKLi;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D861606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D861606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XgtcXKLi
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso180579eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377420; x=1793982220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b0GnmpO+AJdyxic7fk9eFb7rmK6rtUcv8tGjcAKiwQE=;
        b=XgtcXKLiYXTxAo/HVRXwkkZT78K7n9ohemQOapb2bgfWp8C/QQTdYer3Bn0wIid+Ou
         jT+jJKgjRVvpgSxdRG4taV4LQnW7782zo/q25AjIO8Wx2NM25rmq9V6UiGXO+WigDq1L
         +uG4lMoY2UiE9GOXGcw4dWEcAuAuNOAEiMf9USmABC6nL4VZ0f4HubTTSeWVr3q4fYBg
         2lkR4YyCurNn6xZc9gaS//SJudwCNPHRpH5jqInUrfp4ouOhzMhtOduJ1osAhDdqfUgs
         kJq6MgjZSqZxXaOsuV8lgByYsjCNRmn0C1WGdUaXhp8nYXe4vL2E1unB3yUmbzOH1lWs
         RXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377420; x=1793982220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b0GnmpO+AJdyxic7fk9eFb7rmK6rtUcv8tGjcAKiwQE=;
        b=oDQgXSD0rL8WsF2ULKklASa/t+N3rTzfD7BkvAV4W9ZFWnu9GXJTBV3cG3Ec+FrUz8
         97A7AzvIoOSP87/jogKMjrPtoFb0tkG8Cm0CncTdz6fk+XSkqzcpiLADdzW8SVd3H1ml
         28xsl6PbUX2Yq7Gmfese/hfTaqdjEaRxObKfLhQkboJ+gvifF3lVCk/J+yQDgxnL1aOA
         wYQ3JJ4fLVbLyi0P8H3xGo63u7i7IJCUgaiYn1eYZkviVMtn+MfoZKxbCyyZ8JaozrXM
         xyxf9rqdjiqWY/zm+wp9jo8fubR2DTTs/Gy7QeNKfsnAgabm5jg2Xz3eBcplC+HSShSg
         3eZw==
X-Forwarded-Encrypted: i=1; AKwUvBzlkyzdQIfcBD0epMcOvYJm8+JqvRTkCRkqVw5Oe2IzENxhtiQyJGeHmdRIL8Ipxb8bAV0WQNHmQ8VHttU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0pbXbiLQ+RNydQYCirJEaw0yEfg8HNS1G3MNGcTpQWTy2cpmT
	gjSvp2zVaDUJIJWUAYv/fWc5hNupTPEUg4MgbNlrtWnvAu0XcmMZCK3LPLSK3L7UXMo=
X-Gm-Gg: AYBFou2CR8gf/iM0MkMA89EnO3LM3t88zQ5RTK57Go7pAoD1T9u9HqY0JPVmOYT2tZ7
	pVdibNKmbKNiPjJQLDxp6cjgB6qMGz3pfA/zDhHKwLEaeIBIxPFESRXI9gEMdNZQk4gljg8bnk1
	TX7CpcJszMdaaB50GFig/8nF0gQiFm68LsA1SV89mlJrROpPjjK6JFT6jQBmyNatPvGHtTRxvYx
	d9tWf6KEAdynUN2Vx+Tn8YpDQBlkvZA1mcB84WMsc3Zu3jZcvWJcVXMqX5G9blhf++mxz3ZWzdV
	1qcbbqfGikJ2K90eNiCOrbNGeRqE0c6l5InLHsXrdF40ITeV5ytXby48VulMk84C2P4cYH1CN46
	ruXe/kzxEX9uiBQjRz54NscZh7+PbRO54GXHexHDj+wPf5G2HJ0QdLc9+sg1F9hp77y+okEfCLq
	JjYkX0gXwpjvCI8LPuZyQkp5Gy0WXoLQ4cbNup+OP7GpdFF0xuO5M6YnsLAkCSlxYT5v8GQvZMR
	mXBI8SkOE3trZMHgruENbPuzsJ60vIfYoeIWDD4+Q7NxejpkoSpUnQQ5GbSnQaoB07j22kfl1jL
	VnfTvi9W8s+GUQcyrg7lWf+hssM6gW4OC7JjnSP82IT+b5IdFmuOsGbzCjF/ALlCpr+2tLsFEyr
	QIkUkCVlDcFUlLVFFHvhDWFjI6Pq2gaboi2ldb9vkQZgVJzyljNV/xDqIhP/G3QuuceFILP8ePi
	wzP2DJc0m0LuImZw==
X-Received: by 2002:a05:701b:4281:20b0:158:1ed2:cb58 with SMTP id a92af1059eb24-1ac5e6f5362mr3896872c88.39.1793377420369;
        Fri, 30 Oct 2026 09:23:40 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1d4dsm7689041c88.3.2026.10.30.09.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:23:39 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH] tty: serial: samsung: use dmaengine_terminate_sync() in release_dma
Date: Fri, 30 Oct 2026 16:23:34 +0000
Message-Id: <20261030162334.3000737-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
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

s3c24xx_serial_release_dma() stops the RX and TX DMA channels using the
deprecated dmaengine_terminate_all() before unmapping their buffers and
freeing the RX buffer. Since this does not guarantee that DMA transfers
or their completion callbacks have finished, the controller may continue
accessing memory after it has been unmapped or returned to the
allocator, particularly when the port is shut down while RX DMA is
active.

Replace dmaengine_terminate_all() with dmaengine_terminate_sync() to
ensure that outstanding DMA activity is terminated before the buffers
are released. Both callers of s3c24xx_serial_release_dma() run in
process context, where synchronous termination is permitted.

Fixes: 62c37eedb74c ("serial: samsung: add dma reqest/release functions")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
This issue was identified by a research static analyzer for DMA
lifecycle ordering and has not been validated on hardware. The patch has
only been compile-tested on arm64 with W=1.

On Exynos systems, the UART uses PL330, which does not implement a
device_synchronize callback, so this change follows the DMAengine API
contract without independently establishing that all hardware activity
has stopped. The PL330 termination behavior is being raised separately
with the DMAengine maintainers.

Two related questions outside the scope of this patch:

- s3c24xx_serial_rx_dma_complete() unconditionally re-arms RX DMA,
  potentially racing with release_dma() and submitting another
  descriptor after termination. Should shutdown prevent further
  submissions before terminating the channel?
- s3c24xx_serial_stop_rx() calls dmaengine_pause(dma->tx_chan) before
  checking the RX channel's residue. Should this instead use
  dma->rx_chan?

 drivers/tty/serial/samsung_tty.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 640f85e2d..4eeef149b 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -1145,7 +1145,7 @@ static void s3c24xx_serial_release_dma(struct s3c24xx_uart_port *p)
 	struct s3c24xx_uart_dma	*dma = p->dma;
 
 	if (dma->rx_chan) {
-		dmaengine_terminate_all(dma->rx_chan);
+		dmaengine_terminate_sync(dma->rx_chan);
 		dma_unmap_single(dmaengine_get_dma_device(dma->rx_chan), dma->rx_addr,
 				 dma->rx_size, DMA_FROM_DEVICE);
 		kfree(dma->rx_buf);
@@ -1154,7 +1154,7 @@ static void s3c24xx_serial_release_dma(struct s3c24xx_uart_port *p)
 	}
 
 	if (dma->tx_chan) {
-		dmaengine_terminate_all(dma->tx_chan);
+		dmaengine_terminate_sync(dma->tx_chan);
 		dma_unmap_single(dmaengine_get_dma_device(dma->tx_chan), dma->tx_addr,
 				 UART_XMIT_SIZE, DMA_TO_DEVICE);
 		dma_release_channel(dma->tx_chan);

base-commit: 83f32c773255720a661aa45d83e36278135f23f5
