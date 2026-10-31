Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793407663;
	b=XhTRTjZP8Zp4qLRd4PW0+1ZHgFml1Vd2rJCAu3UJy276UJcHoxcJ7PeG4hXR7R+nnZ7s
	 u0xpZf4Mra90RVtDQFrvZKlJUeKusJ3XeKpjNi6jW6lPgG4uU/fAX32bRD7kTqsDLuGNS
	 S7sv+roV457Z3b9zTKyx6h/wcMBq+qCx0pRzyjOfIxvnIaGJzKET5Bg4RyWO1vZsKBM5c
	 4qVV/8vwRnBwlg1guULyY+ts+inF9UG+tRGqBguVo2dQ/QUyR6uu/xzGyU8tDNG2FJAZv
	 DxJqJofstEk0Lv9CiT8xSsCI8tQRdo+9JbHYhxR44iwlbxJPv5hTPsFkzw/ZqDrmxRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793407663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=268LSzP9pfFwdbgVDxMqdS0o6I6QpSICZ5YPTlGbOXk=;
	b=iYH4POrhodvZTD7laKsG7DoYqUqjXXF0vei+0HgQpatjg7bt5m/IZJ4/vozy3/sKMp0e
	 oZQh2f6BY+K/XpBv8uvWhiK4mEbiqXk04bY0HGd/agj0rXlqhBsQ6F/t36MaDj9iFFnAY
	 ZosQ+tFQSmjDEMSSeaB2mfaL+2d7Of+EcjA5TMOD3e0etECZQmiJTsToUmeA8Sb3IC9aF
	 fiXljjAXIH2HT6pCqXwhbfzCU8wC2+YD8INwfdFefA4SpFytsuFaYtUlM/nHV0JB9sESD
	 2d/Rzr7U1UWsdA3Tn053XseH/UBHSXzcTzDqEPGQMFWMzJvj6lBC6mIpojOfyqvXKPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IJRDK+mR;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A652606A320
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A652606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IJRDK+mR
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-353804b591eso2014633eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793407662; x=1794012462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=268LSzP9pfFwdbgVDxMqdS0o6I6QpSICZ5YPTlGbOXk=;
        b=IJRDK+mRMeVNqm4z8zkrrkm0GNNjwiXPX2+viPyOK8zgiaefP8s19h7cOcU2VEcWoU
         PqS1XRCbjdYh8/g0znLNQU0essI/+qfLqU2xlyBU4DHp3tNzHFcvrLS2+rOiIVaJCWem
         kEaYuHo6CAuPnj+kPUfjxxsg/uCUZVeAq6n1gCrgRG2swHABFX5Ao65TGHmfT1wmdlg8
         x1WzbkGgr50xX0yR2P3DEtnPnCv35Knv63DNLVKWeUKLGcj6G31LaDCsMW5PoGfP+lrS
         6/DtObogIU9qrRnwiZhPWD0X3MwiZ+ZazfKSBeAVBoGiXe3giW9oRw/gjKDHqMDTKgir
         udqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793407662; x=1794012462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=268LSzP9pfFwdbgVDxMqdS0o6I6QpSICZ5YPTlGbOXk=;
        b=CRSZMtlMcwo4Drf1hNXCaEmQg/WLqWxk9IBPBgMje2667IrzxofB6JDcodok4g+3iE
         iXKtZ2JyFHnYnAhkqWLsfsIFdY/LJPFaerw7dIGVnYOPc1ShaRyXeEmnAFs+kuFQB2xy
         ZzA4mrNFGQMhAeczqvI6ufdgVH09IRcjqp3M8QInLLssaqQrOJb9ld9nH7Kzc0tmIDIn
         z6JkwHXGsZoOnKpOoeKEn2IlZwburzuwG4HHqUclxxOGXMmNmuTWoWYYrp2VrBmTxS7g
         vi4kwXY2/gOU9U18uYDoE2dB1QUDuU/X9mMrGqS97R4bjUy+3GJX6PsSGUkJ8WFsVbOr
         rVWA==
X-Forwarded-Encrypted: i=1; AKwUvBxozmqyLNUZnM2VoaJOOAcsKDQAAJ7lCSbVYTR7AzwCHUulcZbe+WNTHYXPrF8K8YopkDPi7uGq5bIvwog=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+hYJ8C4MZyWaKkF1vP1TD1JOrsRJRnbcT/fEl9HajZkBTJ9oU
	ezv8/bAkgMIW89PFbgbYEYnqB0LnlG7LcctGzB4jc4U2FA+8+ArJ61vd
X-Gm-Gg: AYBFou0D0H2Ria3mLnQQKo4BRE/x0787Dp+rFRSltGmLyUX1P16qP6W/0sd2bHdRRtj
	YdHZ5dIhss/9PVh5uK+JabJHIr3zM67Zh+AFwc1ua2HPrdrPu/Yt41V1F1brTScloj2U4XiMMQ6
	ytTTATu/PZNLEr1B8qwvi5xj+ak7Z5xx0MULuvzjX1CJ31AaDAKIDZ/6HepHXUdJTkZqemMndsr
	FyT8xAolfS6ixJ+Gr48Cc1DY87syKH5Zm5eyLWCxNlUYNDB4RTjmkaCrd5KGL8Yj9s0vJKM4RKA
	pG+VuA71dHF+1fP6gXkuaGFbd4bO94mzUUHdYHAPPBXE4WI3aIHOCw8Tz4hzqHS7pLAAWD5+2e5
	PpnpupbQLs6mDOMdwoL2L0P/6Kmfugv/NGo4Egem+0OAsLV6QrF3ZVZREhRNa5ysiipN/H2kofi
	+NlzBv3RQ9uOafBLtP8wsOcGw/5vrXcryTCpd4Fh1NEYGZOhNBNhyrHTmkhz6f+bsQ6tp1UJlMq
	ELqdJfabu5y4Y58hSCQxD14fW6JecGZyaYPEhjRpe2r9NoXqlO66PyTD+iC1L1wTkQe62NcjF91
	X602lwyJig1qnFJuLYX03avxpeCJAsM4BN7IqPFzLWYyvpU2+iPK8werQZa0hhhcA1V9/BBTliS
	QHGLxP6zryPYdZ47r1G/CA1qHoQmRo6S1tVR1z1sA60j1hL3HywM5pgxpvIw//tD4lcikwgrkex
	H3LZFLMxIpcrm2icw=
X-Received: by 2002:a05:7301:e105:b0:36a:15cb:30bf with SMTP id 5a478bee46e88-36a42345851mr5374853eec.13.1793407661421;
        Fri, 30 Oct 2026 17:47:41 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm12703100eec.26.2026.10.30.17.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:47:41 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Samarth Narang <samarth.colleges@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-serial@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] serial: TX kfifo underflow when TCOFLUSH races with TX DMA (samsung, sprd, msm, pch_uart, tegra)
Date: Sat, 31 Oct 2026 00:47:33 +0000
Message-Id: <20261031004733.3345841-1-samarth.colleges@gmail.com>
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

Hi,

The TX FIFO underflow previously fixed in 8250 by 9e512eaaf8f4 ("serial:
8250: Fix fifo underflow on flush") and in qcom-geni by 452d6fa37ae9,
7ea38c49e717, and e3c04834ae1a appears to affect five other serial
drivers. The line numbers below refer to mainline at 83f32c773255.

uart_flush_buffer() resets the transmit kfifo under the port lock before
calling the driver's flush_buffer() callback. If a TX DMA transfer is
still active and the driver does not account for it during the flush,
its completion callback may subsequently call uart_xmit_advance() using
the byte count from the old transfer. This can advance kfifo->out past
kfifo->in, causing kfifo_len() to wrap and the driver to transmit stale
buffer contents. As shown in the 8250 fix, a subsequent close can then
wait in tty_wait_until_sent() until it times out. The issue may arise
when a large write is followed by TCFLSH(TCOFLUSH), or when the port is
closed while TX DMA is active.

Four drivers have no flush_buffer() callback and therefore do not stop
or account for outstanding TX DMA when the kfifo is reset:

1. samsung_tty: Neither s3c64xx_serial_ops (line 1679) nor
   apple_s5l_serial_ops (line 1700) implements flush_buffer(), while
   s3c24xx_serial_tx_dma_complete() advances the kfifo by
   tx_bytes_requested - residue (line 342) without checking whether a
   flush occurred.

2. sprd_serial: serial_sprd_ops (line 944) has no flush_buffer()
   callback, and sprd_complete_tx_dma() advances the kfifo by
   tx_dma.trans_len (line 276).

3. msm_serial: msm_uart_pops (line 1547) does not implement
   flush_buffer(), while msm_complete_tx_dma() advances by
   sg_dma_len(&dma->tx_sg) - residue (line 482). Its check for an
   already stopped transfer relies on tx_sg, which is not cleared by a
   flush.

4. pch_uart: pch_uart_ops (line 1518) has no flush_buffer() callback,
   and pch_dma_tx_complete() advances the kfifo using each scatterlist
   entry's sg_dma_len() (line 756) without holding the port lock.

The fifth driver, serial-tegra, implements tegra_uart_flush_buffer()
(lines 1272-1279), but only clears tx_bytes and calls
dmaengine_terminate_all(). Its completion callback calculates the
transferred byte count from tx_bytes_requested - residue (line 537)
before acquiring the port lock and advances the kfifo afterward (line
540), while tx_bytes_requested is left unchanged by the flush. Although
terminated descriptors do not invoke their callbacks, a completion
already running when the flush occurs, particularly one waiting to
acquire the port lock held by uart_flush_buffer(), may still advance the
reset kfifo. This is the same race addressed by 452d6fa37ae9.

The existing 8250 and qcom-geni fixes provide possible approaches, with
the former clearing the outstanding DMA byte count under the port lock
and the latter marking completions as stale during a flush. As discussed
in 7ea38c49e717, comparing the completion count against kfifo_len()
alone is insufficient.

These findings came from a research static analyzer that checks whether
uart_ops implementations using TX DMA provide flush handling that
accounts for outstanding transfers, followed by manual inspection of the
reported paths. None has been reproduced on hardware. The same analysis
found flush handling in the 8250 core, atmel, fsl_lpuart, imx, sh-sci,
and qcom-geni, while amba-pl011 is not affected because it advances the
kfifo when preparing a transfer rather than on completion.

I would be happy to prepare separate patches for the affected drivers if
the maintainers agree with the analysis.

Thanks,
Samarth
