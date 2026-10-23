Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792770058;
	b=UKGY60Y8ng88ZZ5mklzaaBvp3nr1GN747DGApDpKa8mCHiLNag88YR/fHxIyYs37zcd9
	 NISL3AMNvwtm0pbPe2eO90uMG2q62qngbtgCb5L8XEEYAaCKFiyaWAU2Jn3g2genPmogm
	 WCBkyQup895h08zXID4s0QWRuzT9xqp+pZtajyAyDcugdRxTymX5YVauLxOe43jrUKuQ9
	 Jk0DC5S4fRGYCrH9SCzSFk/VGWy1mmVBJuez14O5ZI3lhvwXSZMO24VIEFMhHMfJDUjJ+
	 FkbXc80g8cP1XLq1BfIyqzrdqrmPZsKWyFxwGBdHQe7CZkcWKyJRztjf0HLljn7+t0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792770058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=o1wKXpk8uaU69f7z5em398pZg3Sc//6UJ87r/eL+V6g=;
	b=RndB1zSAToR4q5X/vi2cfH2A4nTkZ9lj4qifrn2+bErWOMw4RCz46dnTN1t9CbxfbmGw
	 wduQHogHmlriZygXdBJulEYws4jbZJmQtwwo/sWVaeyUCXRjYgxV8cBZ17K1tmLuoPe/I
	 +/Gd6Psh0C0XC2h81tWtdWEErRLqd0wBJD6F72Ib5flOktrCngnAHwNw5VtZJ44b6vCyV
	 9TsskBObLeO5jBwytYSWo2svvq+Be9TPAv6aE865K6XRF6fQLr+CrY7cQa6MZvxSZ3CKl
	 hzmeZNmJKB2T5YC3++sL5IX+Vbc8UbYNr4Nay9IHz4Bpyi4oRFDbp4QpgaCQgjHL/ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DAJ9Z8yE;
	arc=none smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486BF606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 486BF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DAJ9Z8yE
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-499f20c7054so591665fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792770057; x=1793374857; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o1wKXpk8uaU69f7z5em398pZg3Sc//6UJ87r/eL+V6g=;
        b=DAJ9Z8yEtaq0BPZ6unE64Trh3XDNZCSYilPyb3X4iAKNyWcJRRd4jOi0kTpAbdiJf8
         rM2C4u5iS1IUBNC62tP98vNNvakBq6qpiXXTKaHygQGJnQID9feSq4MQr4KCrZPYRd07
         4ck8s6H3X8SyoulVTL2hzltRMX0S03aA+H78SfP4hKkVTQsc7+4DgovqJ32IPmQYiKAZ
         U5Cgz8ovqSllQjjLTGBDCdpPNg2y6fYbsrff67RjK+dWI22hZhIGnFgrO8c/9W13PGzd
         9KkXnejOWBcyX3dpGAK5Hxc/NMHP9kd6xQzAtlb5Ex83jNwOMjAnrjmSA+5qNeRTlK/u
         Kd9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792770057; x=1793374857;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=o1wKXpk8uaU69f7z5em398pZg3Sc//6UJ87r/eL+V6g=;
        b=BL7gadAmuHJkuRSnrJUU53rlzlM+C7v9iboy6nJhV2PhSFz0lwrZMROAPG9T8+FIq3
         RusYn+gLHtECeTJjy/y0xdBXXtAinOXmkt/t1iBXrSIUyDaequ2zul8xm2G+8oiT2qzX
         j4kg99ZCbLMdSYpJUvOlLXw9dJ7d7X43Hip7VmsCnU3rNj+22SsnmLmpoVKyPO79czqO
         fZI1FMQPZv3IxEVYh6dYG4c4kbNOj3xYngVZaJSxovQaEblje8gCZw1dnSkQ51UbLDTT
         opBckarjX3t6EDXB46I3Y7OP/B1RFNHzWw58mpk3D+PVNhcYBq8vHOVCemZgyuml838a
         DaCA==
X-Gm-Message-State: AFq9FYI9en7xXl6phY0Oo4MkdftWutTjQnf/dN68qaKnJFitsNcpvtw+
	vM7sBkWqmctQkKs11UuAslGsPL+tYulatyr4IJrA8qyATH1RZP0jxn2D
X-Gm-Gg: AYBFou0cA8OC+dyqCTiv1VYeFzGDjynhuD2x6JbH0of4VSGtItiKCZZVOTo0PZhH4zA
	o853y0Qz8OgeNvM1N6r9Rz03OclRorQLeLJVjoHwh+0b6zn9RGVfS8zdCHyACOu/EqfdMB+ESr7
	6pWO+Fnka3PunujrqXkwoAX0+c264L1QWb91NyvDlkfSpb91GCKRnkwXziWS2/K1eM5CNjBKwy/
	X7+Rt4LKKB3xj8lcsn4vcfSDBgteyD04AgUULXfpcWFH+h9wTO+TExhB5BiAsS76gdP6yoHRXbk
	HjlNLB6NbP+yG6VmCfZCTLgkh6JdW15f61vvcbG9bNQ3kwLa+hi4hc379nH3LZQT8m6IJyXK/ZM
	4X0ZFWBygfVHmdj00FM2bLVEBXQfptuHgE97aKmdU6T/CzLF+Jy6Q5lfh+Pdp31Q5XUgzACnfEg
	18H47qhI/97ituw21zeEbGHFENFTWrfBht7SZpCSp8iyH1m6JJiVJYPAYjQfDi1W0wUW165jCNG
	pKKPmCcTwgtDWKuZhEqlc6mHknpzbCZo3sPN6ZzK72YljFpPJ1ezBAkU/TK1P/pwfSdA86fokx0
	DLIUt2VoGuAC64JJSRPVk9SmDXMukCHah6269DEgAagwHAiELHAaL9P7RQbkoSeZXoVAB1jMOQm
	iJClk2+tfmNoXdhw5/pCHchkVq7493F/jDjhwCArjrLQrytteeZVO6xly1FYIGHJeZ6D6zZX3Bo
	uw0RN2V5IwvX9PqX/kWiLb6KDP
X-Received: by 2002:a05:6870:252:b0:4a7:41a2:c208 with SMTP id 586e51a60fabf-4a821efc9e5mr1621601fac.8.1792770057105;
        Fri, 23 Oct 2026 08:40:57 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a838287e9csm351794fac.7.2026.10.23.08.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:40:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 09:40:50 -0600
Subject: [PATCH v2] serial: 8250: calculate TX length before preparing DMA
 flow control
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-submit-serial-8250-dma-tx-length-v1-v2-1-c3106ef4d2df@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WO2w6CMAyGX4Xs2iprIgevfA/DxRiVzcAwWyUQw
 ru74ROYthd/D1//TQTyloK4ZZvwNNtgJxcFnjKhjXI9ge2iFphjIXNECJ92tAzpTA1Q4TWHblT
 ACwzkejYwS2ifBZZYVhJrJSLp7elpl+PLo/npiHmR5oROG60KBK1XTpvUYl4vscDRwmlsbODJr
 4fLWSbMf4Zixqg0aV3VKq/rez8qO5z1NIpm3/cv81FP/gcBAAA=
X-Change-ID: 20261022-submit-serial-8250-dma-tx-length-v1-bf627278129a
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Raul E Rangel <rrangel@chromium.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The Renesas RZ/N1 preparation hook programs the UART DMA block size from
dma->tx_size. The generic TX path calls that hook before calculating the
length of the new transfer, so it programs zero on the first transfer and
the previous length on subsequent transfers.

Calculate the scatterlist length before calling the preparation hook so
the UART flow controller and DMA descriptor use the same transfer size.

Fixes: 1788cf6a91d9 ("tty: serial: switch from circ_buf to kfifo")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Correct the Fixes tag to the kfifo conversion, as pointed out by
  Miquel Raynal.
- Add Cc: stable@vger.kernel.org.
- Link to v1: https://patch.msgid.link/20261022-submit-serial-8250-dma-tx-length-v1-v1-1-18cecc89a099@gmail.com
---
 drivers/tty/serial/8250/8250_dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dma.c b/drivers/tty/serial/8250/8250_dma.c
index 1da605cc8601..2dc47adafec0 100644
--- a/drivers/tty/serial/8250/8250_dma.c
+++ b/drivers/tty/serial/8250/8250_dma.c
@@ -110,8 +110,6 @@ int serial8250_tx_dma(struct uart_8250_port *p)
 		return 0;
 	}
 
-	serial8250_do_prepare_tx_dma(p);
-
 	sg_init_table(sgl, ARRAY_SIZE(sgl));
 
 	ret = kfifo_dma_out_prepare_mapped(&tport->xmit_fifo, sgl, ARRAY_SIZE(sgl),
@@ -122,6 +120,8 @@ int serial8250_tx_dma(struct uart_8250_port *p)
 	for_each_sg(sgl, sg, ret, i)
 		dma->tx_size += sg_dma_len(sg);
 
+	serial8250_do_prepare_tx_dma(p);
+
 	desc = dmaengine_prep_slave_sg(dma->txchan, sgl, ret,
 				       DMA_MEM_TO_DEV,
 				       DMA_PREP_INTERRUPT | DMA_CTRL_ACK);

---
base-commit: 1184f87e2790e8af9be3116f608d2e86b4792d7d
change-id: 20261022-submit-serial-8250-dma-tx-length-v1-bf627278129a

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

