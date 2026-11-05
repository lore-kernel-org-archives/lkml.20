Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911034;
	b=3TpIAj9FraZujpePUCVTdT/QK9IrmnqjtGjtFGhEvvrkK5cSxQUCzLxN4LvGHpC9lsmg
	 aKDEVpkCfzpEHlCsW+7nsTg7kuTmi8Wly7z9fcg2MvxSqxz1ZhISKH5z619StUzrxECW9
	 eblbuTFzbE1NQqFHNe3e11lbqw1CNCmEFu5/Sfbm/FhsF4WnNfQYo19eo0v9PAgoNRMzw
	 Xn6aTKr6Il0I+TsyGDOgvtSvD9fxxPwKNvUDJZ4r/RHGAGUynnh6JvqkuWJF9Q78Mo+3b
	 dICBh5vHstPkEAfA+zxVxCFFasRbaqP3DhLK+WAysEPYY548uswnNhizY308nuiL6pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OsK3MYz9w+yugO7b/K4HKpqaj9q9ojfCF04yLKl5NIw=;
	b=a3oyhKBt3+X7nEtaJr/ZMni8YVbrcBurlHHNgo3N68Zpt43pwt2gjv/0y1MGfNxfQjnn
	 MH+CbGaVdjyHZ6F1S0DiOoQKoti8hvy5nrbN6eK4LrnmH1Tl6u1Wqp15Qf8MSybRrQJJq
	 O6NO3MHM+vk5ld9ac46bLEAriN/se022RmOMi34MEOOpKSrBxJrHMIvxXbA0x/Oz9A6qU
	 hFXUaRtXHj6Qfkgh5X94FpThnSK+5BkMU3knMtqRrEITgsshMxseD0muk9xm6H6e7kZMs
	 Fi1b9TUkXT4850cQJPgL/IzBbHVXKNgUMi9mRWiBbiSTlZkbkas5wEl0zOWXsLGOd0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VLjqKX53;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985B560A3809
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 985B560A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VLjqKX53
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso13247066b.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911032; x=1794515832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OsK3MYz9w+yugO7b/K4HKpqaj9q9ojfCF04yLKl5NIw=;
        b=VLjqKX53wk2FlolXU992mYaqTGC6wNE6SL1bf8QJbpY98Tjjoj5etV6rIWnkHCHMyK
         DY9jMhCZSs8tIRoXqSTSTwTv0rUc2yc8AcipQ8x0oASHwAoSRKIzGQLyr2+TLrZK2AgJ
         CLEXbvJmPZReR+mKjeljGXlfzQvMxTmtqH/zJ9WnCtBs2NGntp1Asc47G3hqnluqi2Hd
         UIcMf5ucETFTStS87oIltmPeCcqyoeBw/mdnqckIq4nFhZGFEFR9YPVh1QyVtifGKEqz
         io3pyglCWXXduhH2emNal2Kp2pZZLk/XbvxQJ7eLZNogyWXLPPyCAhNIzJ/M307brPyu
         DsGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911032; x=1794515832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OsK3MYz9w+yugO7b/K4HKpqaj9q9ojfCF04yLKl5NIw=;
        b=m4cz1JM96QLslJFIVHEEHrap7oPLrLavp1Q7ntQSdqLtK3+x87bP67KyJ2aOqvsCYx
         V/OwxeMK2E+zyqVvxEE9ldKu675HX9UvVRI8CbPloT1VC5uTyG9pOz3MpewjZslKo7np
         Fh70tE/PuBiVUFrCAQPONsmX7twZX1Ytf1tCrd4KeZVwd2L3dth8toMWbYWlZkpFW5nh
         KcpLow1ByIHRVzs8/LzoaRZPC5Wxro9kiOfqa7jQAIbzSW5Cs9umQmyemDSSzWs/6n3/
         IKAwxNl5YrzfGtTACJ+uNvB080HLnYIFLQ01aJ+1irMC4UQQa4r0td271PTuIf9/6QJj
         ZcPg==
X-Forwarded-Encrypted: i=1; AKwUvByR/+SSb90pGf9vPeUccsQ4iju96W6EPqX5oKJg8K6LR/VtGNaRKd0k99bC1SBPTqc4hl9keWEcI0rUpNk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Uj1E3sEfdZMAiR+zlKlV9tGsYwuOF+9QlsfvS1XJqJeyBrmqj
	OCGpaNhaeDJ3GT2xQMCjmU6z119SfcRQz3vPlQWJeBXvaUUsHBQuEw/C
X-Gm-Gg: AYBFou3HdiOMGQrry+l7WFNWYN7oVhWtJm18NTstRx7b2eIlhuVOd1TMkMWa4YQ8Lt0
	1QtN8X4CK9g2iSz+YRD3KfwyDvCsv+5NrbcCx59N2KSP5No7u1AqfHh27r5UE0op61BeQClTIBY
	eMeJ5aKeN4wFh/ob46aDe8FuenNrnl/1J19nGfM4riMiJo0yKP4dleOphjCPtT0pCinbqjGvyrV
	PIC40LqDf6cfU5oA+S0Xc4YXyQO7kykC8fcqix6CiX/BfDlAZIzF+Y3U/cEdmAlIxakxe+PZWaD
	b94MsxgVxbfFdEoRM3xTZatD0jvzgiRzzyoq5rng/xmNrf6i9UEiTT/B/vvSoWQ4vHRZ1+UYkNW
	GPIqz9bBgSGKxcAzn6WDTXgfz/uFMKcKgEo6xrE55WcRMYmC2lu7NQfhtX9xLHbbkhwBFX+OqZK
	9g+e59SKSwYvcx2A7cWb3FoH2M73/59uM8+n0Fs+t2V9yONcqK4V9cTN9l5uzEU7TSIK7yUL8fx
	7yY2uYANFRqTQqCRjjobQGQjE/cbptUI4PY3KKskoo4i6uTwoZTZm7JLyuUhxg4B7A9Kw1wOGzo
	dhQbqVs/zZQrSluirG/RRq7m9vX/sDA3jjWwIJ/5Gphtw3lAzy73ggQ4Sd4H1uVk+pKf88Hx9Px
	iJcbewbyyhLEW6s4qcDNkNZIV4awqvRq+WSRqx6zshomgZBwAcc3F56Ahz0wxOura23cU52/29W
	l3FGyuIJCm2Y5KMCp9Tg6fG+PLEfin9Waso4pBDPRbxLZcE1jVOp8Kwypxf1+iNG9ixA==
X-Received: by 2002:a17:907:d30a:b0:c3e:cb50:b7c8 with SMTP id a640c23a62f3a-c4d353f3dbcmr54320266b.12.1793911031659;
        Thu, 05 Nov 2026 12:37:11 -0800 (PST)
Received: from mb-HP-ZBook-Power-16-inch-G11-Mobile-Workstation-PC.dynamic.ziggo.nl (2001-1c00-1106-0900-938c-4ed8-a3bb-093f.cable.dynamic.v6.ziggo.nl. [2001:1c00:1106:900:938c:4ed8:a3bb:93f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3569f518sm15429966b.56.2026.11.05.12.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:37:11 -0800 (PST)
From: Mario Behn <mario.behn@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	Mario Behn <mario.behn@gmail.com>
Subject: [PATCH] spi: cadence: recover the controller after a failed transfer
Date: Thu,  5 Nov 2026 21:37:03 +0100
Message-ID: <20261105203703.979067-1-mario.behn@gmail.com>
X-Mailer: git-send-email 2.53.0
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

When a transfer times out, the bytes it clocked in are still in the RX
FIFO: the interrupt that would have read them did not run in time, and
the host path never drains the FIFO between transfers (only the target
path does, in cdns_unprepare_transfer_hardware).  Every later transfer
then reads the stale bytes first and returns shifted data, and the
device behind the controller looks dead until the system is rebooted.

Seen on a Zynq-7010 with an AD9361 on spi0 under PREEMPT_RT: after one
"SPI transfer timed out" every register read returned 0xFF, the status
register showed RX FIFO not empty while the bus was idle, and a later
sample rate change failed with a calibration timeout.

Add a handle_err callback that masks the interrupts, drops the stale
bytes and brings the controller back to its initial state.  The next
message sets the clock mode, the clock rate and the chip select again
through the usual prepare_message, transfer_one and set_cs path.

Signed-off-by: Mario Behn <mario.behn@gmail.com>
---
 drivers/spi/spi-cadence.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/spi/spi-cadence.c b/drivers/spi/spi-cadence.c
index 50ef3a7871c2..474ce14a59b3 100644
--- a/drivers/spi/spi-cadence.c
+++ b/drivers/spi/spi-cadence.c
@@ -542,6 +542,30 @@ static int cdns_transfer_one(struct spi_controller *ctlr,
 	return transfer->len;
 }
 
+/**
+ * cdns_spi_handle_err - Recover the controller after a failed transfer
+ * @ctlr:	Pointer to the spi_controller structure
+ * @msg:	Pointer to the spi_message that failed
+ *
+ * A transfer that timed out leaves the bytes it clocked in sitting in the
+ * RX FIFO, because the interrupt that reads them did not run in time and
+ * the host path never drains the FIFO between transfers.  Every later
+ * transfer would then read those stale bytes first and return shifted
+ * data.  Mask the interrupts, drop the stale bytes and bring the
+ * controller back to its initial state; the next message sets the clock
+ * and the chip select again on its way through transfer_one.
+ */
+static void cdns_spi_handle_err(struct spi_controller *ctlr,
+				struct spi_message *msg)
+{
+	struct cdns_spi *xspi = spi_controller_get_devdata(ctlr);
+
+	cdns_spi_write(xspi, CDNS_SPI_IDR, CDNS_SPI_IXR_ALL);
+	xspi->tx_bytes = 0;
+	xspi->rx_bytes = 0;
+	cdns_spi_init_hw(xspi, spi_controller_is_target(ctlr));
+}
+
 /**
  * cdns_prepare_transfer_hardware - Prepares hardware for transfer.
  * @ctlr:	Pointer to the spi_controller structure which provides
@@ -727,6 +751,7 @@ static int cdns_spi_probe(struct platform_device *pdev)
 	ctlr->prepare_message = cdns_prepare_message;
 	ctlr->transfer_one = cdns_transfer_one;
 	ctlr->unprepare_transfer_hardware = cdns_unprepare_transfer_hardware;
+	ctlr->handle_err = cdns_spi_handle_err;
 	ctlr->mode_bits = SPI_CPOL | SPI_CPHA;
 	ctlr->bits_per_word_mask = SPI_BPW_MASK(8);
 	ctlr->flags = SPI_CONTROLLER_MUST_TX;
-- 
2.53.0

