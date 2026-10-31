Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793450373;
	b=vpTkcMjHnyWrCpNL19kWqCo9YSqtavHh8HH1tKoSFo17OBWQ7CGl2yrtHntpSkJcd93O
	 e1RIp6npd8udbxW1oMldXPUZ/zEE/t7qqt/2z38UzR/fMDxGuAC64KgZCES3VnNT8NA6o
	 QBi0g+ZeSFkxDN/gynWalPBU7TZKZtnckshcDhVr4RwzKcUhw1p+2R9Srx8ibs93vkmk4
	 jmMWM4etLdHFI3O+WiY3CBdUL2pHmLCzubjKhOp0c3JaT1Usqg7S1G4PQLakQd00Gb7bP
	 2QnviLyhsph/qyK87fOZL1aUk7Vx+xZfBaFd0uaq/tqZzsJyOKzNLa7Wglju38IleGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793450373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sU9FonDcj7pItReaQHsb8l5aj4324fAJTqMBMqrSuhE=;
	b=dRX/QgIw6AOUiqqQo7bl623uLV8E2Ckh5KnJWNBnAelkCML2B3R+iALX3hGNzJAI1G1i
	 D/EDHdvGjhdPAVTKEGpte9VdGAFSoNhCIVQs99RbV0ceHjsfftEtDd1VRTBDc2cwF7sqw
	 amQuDAyO7YJvTy8K22Or9RCVhLO1RATrW2wcVgNDoQQ4XLPZep6kw5Q5dlK1EzKbGx9eG
	 jDPWsbTpa0PBfF1bqih5edGbZC7JEgu4vc1ygpmLmUCGwgHBRaMj/4RLMDxdK1CfDbnl4
	 RIXdyX4twLs4k/UVl6OVtFY5CynVKnhczoh49fG/5keFsHHUT4+thqq8Bjn4lX+l6Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MMeYLSu8;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF2F606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 12:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCF2F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MMeYLSu8
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35829219da8so3139694eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793450372; x=1794055172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sU9FonDcj7pItReaQHsb8l5aj4324fAJTqMBMqrSuhE=;
        b=MMeYLSu8Hfxb4MMwRmB6e+af88Re5khoHp3/t2EUBiUGkWoq5iAZ1cjS/455NZJMYc
         IujJzHWomO3jTDNhqb6DoiExYizct5Q5FVUJmFS7XuCy2LxUc8jj0Oofyc0IHl+EntE/
         eUcP2z4Ax8+oIgGKpmcRfzMrD9dQdamJcuC3zrvef27BS8pSvZievFDvuWoZs0CqMcCq
         3vKRYyOQMEzwBfi2Zm0+f/C1csutboBvSRGc8Yte8xi/BQo0n10Jw6RwB6XCFvO+KJ09
         hZWMahyBeZ0zoMbqMmuxiabU6Q9VNG+7uRaQgI//VnxikZbVXNq/V6EAx1/ZV4NVzTzt
         LUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450372; x=1794055172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sU9FonDcj7pItReaQHsb8l5aj4324fAJTqMBMqrSuhE=;
        b=lddpa9NJdaSJPCI1ONuwNgdSv+WHuM/CmANt5M828w5uxsIGw8J+iXhLF5T/YqrP2u
         Qn95xaPk9xaGvqAX8SyXsK3CnQhO1NqQg6wDRVsYQy9zs/XNSpaxPl9sLWd0+6xrzLmq
         hzXwxtRnkVkga4w8PLqoQ+Z0GUlxlD/OEYIJUbnPGNg58wqEQutummJzQEMsMPs6tAUy
         foFf3gOknXpWbhcxzfleGacVDslD5llb7xXbDtzWDLqP8M/VJq5rqxLT6KmlsxYB9x8F
         TyORVVbVsqUrXEUK/Iu7+vExg7cJuHiMPa28jRu0CcEqTorcL9SX74V505mzjzMoFlwF
         rJKw==
X-Forwarded-Encrypted: i=1; AKwUvBxD4c4PFkoVPl9T8CYuHX4pwYZ5/MDyCn1M7R3QgmfnpWtpH/p8jq7Y/aOY5d/L2I1tXLRovDQFxqCgimo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEUgdO0USTeJJEdX60ldi2MbrbWiq4VSFs/qCmLaLagFIpQAl6
	IV9WKuK31OhlREQmHWALI1OSv1E1XTcCm8PgH5ZJdCvcHHOQzfYGzpSF
X-Gm-Gg: AYBFou3mA/tTCl15NYQe1e+rJ/O1PEivbVOHsTtGKNK+KIwu7E3Fq22+Q0QVHwqZfT3
	kysh0fr0gfFrVtkelx+sQuj5Kl7lT4La03IV3mXaCQ4viFKgfuxlFC35qUYSdhhMrjCSMQ3OWQo
	i7QKb7FFxRA2oWrYPXP2hko+X8yGwLIBzd4y2WjHnuO5AtrwpwERl3iDnchwkKdD4UJgEVtaHra
	UNR6Lb72qwf7hjVW2RL+vDGWCcs9Vfcv+BOG65IAbyW+0SG4dSijbbqADzei0gJovXl1e8rsli9
	LM7SfFPTcacERQR2huvsUjTi1VFrPBADaMJDbcvq9T2cekB0fYrZLkdQAliOhQPSo28cKBsFVoB
	MhYIAZmwwB1tVwPEza116YlpIB1EH7xBS2rwXtFkFVkt0tRKyccE0hM22ZIRKZIzSTmVaWMb7bV
	47NN9iPo+PKxBgGq0VBHsGp6aciMxUvpUBmbzd+c0rXscBkwmfvaYMn5mYkwBHut6Ma5b4OrgTh
	jzKOtHcMycPy9/CysWVvzCAD5nWep5yc0JGKKipZaJ76JrJU0JFHitc/tDFIil1QA+eqolhhHty
	9YkWH8b9JuzDHv4RZjt4+VIeZs0mjAPb7Ag/jSUGx0HAU/2bJu0oyxOYYKOgAtVYOg+lYyumhuy
	6uEqUuJGYhbvHVFksF9y7mfwjWUn+q6zEg9oEQ2rqQyDfkgdlAmsu1M18ewrE05dWvgUQQtG51R
	nKW33VpqB1bd9iDg==
X-Received: by 2002:a05:7022:294:20b0:1a9:4d51:8c33 with SMTP id a92af1059eb24-1ac5bda4837mr6575924c88.18.1793450371863;
        Sat, 31 Oct 2026 05:39:31 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854da78sm21566039c88.6.2026.10.31.05.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:39:31 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Samarth Narang <samarth.colleges@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	linux-serial@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] serial: tegra: don't advance the TX kfifo for a flushed transfer
Date: Sat, 31 Oct 2026 12:39:08 +0000
Message-Id: <20261031123911.3784690-3-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261031123911.3784690-1-samarth.colleges@gmail.com>
References: <20261031004733.3345841-1-samarth.colleges@gmail.com>
 <20261031123911.3784690-1-samarth.colleges@gmail.com>
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

tegra_uart_flush_buffer() terminates the TX DMA transfer after the
serial core has reset the transmit kfifo, but leaves tx_in_progress set.
A completion callback that was already running may have calculated its
byte count from tx_bytes_requested before acquiring the port lock,
allowing it to call uart_xmit_advance() on the reset kfifo after the
flush. This can advance the kfifo tail past its head, causing
kfifo_len() to wrap and the driver to transmit stale buffer contents.
The same race was fixed in qcom-geni by commit 452d6fa37ae9 ("serial:
qcom_geni: fix kfifo underflow when flush precedes DMA completion IRQ").

Clear tx_in_progress in the flush hook and have the completion callback
skip the kfifo update if the transfer has already been retired by either
the flush or tegra_uart_stop_tx(), which also advances the kfifo itself.

Fixes: e9ea096dd225 ("serial: tegra: add serial driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/tty/serial/serial-tegra.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/tty/serial/serial-tegra.c b/drivers/tty/serial/serial-tegra.c
index b0fc4ae3686f..8b712a9bc293 100644
--- a/drivers/tty/serial/serial-tegra.c
+++ b/drivers/tty/serial/serial-tegra.c
@@ -537,6 +537,11 @@ static void tegra_uart_tx_dma_complete(void *args)
 	count = tup->tx_bytes_requested - state.residue;
 	async_tx_ack(tup->tx_dma_desc);
 	uart_port_lock_irqsave(&tup->uport, &flags);
+	/* Already retired by stop_tx or flush_buffer */
+	if (tup->tx_in_progress != TEGRA_UART_TX_DMA) {
+		uart_port_unlock_irqrestore(&tup->uport, flags);
+		return;
+	}
 	uart_xmit_advance(&tup->uport, count);
 	tup->tx_in_progress = 0;
 	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
@@ -1276,6 +1281,9 @@ static void tegra_uart_flush_buffer(struct uart_port *u)
 	tup->tx_bytes = 0;
 	if (tup->tx_dma_chan)
 		dmaengine_terminate_all(tup->tx_dma_chan);
+	/* The kfifo has been reset: the completion must not advance it */
+	if (tup->tx_in_progress == TEGRA_UART_TX_DMA)
+		tup->tx_in_progress = 0;
 }
 
 static void tegra_uart_shutdown(struct uart_port *u)
-- 
2.34.1

