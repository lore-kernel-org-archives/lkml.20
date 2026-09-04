Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F0548380D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524304; cv=none; b=GMh2bzrA6348wxePiJb1A3vuHtOXUga45/1Dr2OMzMAwLAWO360T64vJzaY1qrDK+E62PHfRBRg6QRsW13gTz7667Uqb9tlGojIOeJxWkeiIYMA6smo/t/yDGR5Q7kAkaCr5l7AdG4Z6D4V2BRnT2m1oQa5qTE9tf6f9GBwSYKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524304; c=relaxed/simple;
	bh=piqEQhgfDDtxBSBwMJx4ZDLqf47GqIO4jLyZxunDmb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rSM91LcdiJMeA7HZO6cg3Dq0yWPWPRCDkSDQJ3oF2KPBD1tOOa28kCy6seMsQNcSGFTLvwd+JWvnINxtvReqJ2c+Q2Ykaw3CkIe0WoYKDFjQnvXJgMdZoJ/haB5zAEnIyZk7ULAx8c276r8vYYn5VdLlhDrnB9ipeXIet52eZxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q21Oo3TR; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q21Oo3TR"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6b1b233ca8dso451089eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524301; x=1789129101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9k6KseSninuzqjlPnzkJvDXYpnZK4Toykwwb3b+B2Rk=;
        b=Q21Oo3TRMJeqkEmXh4+8bYkeeOYg0rE6rBV2bgBLSoXIeIHxnOsPidjmT2dSTnphfk
         4JB4oXdei/esSGvy0eLnMd2XVmEksUcuEnxVtR+yhc6Tp59g/hOJGgs4POJjay5wOBgM
         dHrhxarbJyi6O43KDQpN0lCQrCJ4X2Ixmj0Vp9m7+/TT+O82+AfM4ZK5n0jzK4gQQbIh
         QVcFC9MNYn6aVmQQ9GyXMchB2abx+w3vqVjagx6/3has/+s+j6IkplI/QEIZqC27XJVs
         gXtnkaoua/snQIWb3466o3MBygNgQheasD/9mEYAFvMipphNfc/YYru+Y+NGFW5qmarz
         xpbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524301; x=1789129101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9k6KseSninuzqjlPnzkJvDXYpnZK4Toykwwb3b+B2Rk=;
        b=cccKLxzbKd8oRTKpiQW7Z7HUcMw8VO177f6rjI+9nnHrbu4W7NP52UcjQ13RiA4OZU
         4ktB5PHZQj6zERVH2jRJUVAOa6Jjf5eLg4Sg8GM1T+Akok5CjmR5tYx7zz4f1/lIMJRa
         w/rwilLJrReOiFIGR4ViVytn9TkqTKQeRGmERf9uzHwUx+l68y7v6X1W0JnqgfmGjksh
         +dJ5xcR0q0Oq8IQfwef7IGo+zhauCnpKeOKwAKLTYu0BE7gBCRY1+5aEfUqlDJ0yNa2I
         YbshQVvyiJM6BbEp5R2CQ2LnVVok792sOwRDT+kpdnpCxO1VFoN2GYKgZSB/W3Th3FXk
         F0xw==
X-Gm-Message-State: AFuF++l5OBKsxEM/boM55Vu4xmjGIAJtCHl6kRhMGBAbEUq0d7vL02WQ
	RPmLh91VTLCmxle9f9TEuDIFufAd/56HO4cDGPiDJ+uiLJcfJ6rtF+pZ
X-Gm-Gg: AYBFou3RZl0od42bA6h8N0AXBbaNm3FV5Oe7Nka+MAGBqBRF/Way21aTrZgNp8sjv3q
	gBsETvKG6xkrIb7oPwWfuGIArPXDoB11BRU35i0AdbHnH1OENwp7Nfua60vTkJH/s9q7XYUnyjQ
	6wR6VLsl6U0hlFFWh9BCoyK8ZltO+QCiU3Za7xdKKp75qC+dcoqjdVamE5sYwZ4GPs6mZyVwcbP
	uYkKyPPNoHf7URbMkHw2UEWfpRqvn6liGnKlnrMiQZH87tnkmS7HoOG/QxZjf4yZFXcBG8EkYnw
	LSBYgBAxyZXblAHkZy0VjGflSMIheA3kSDNt/eY1LqI7qM+iWs0LJblkSbe/Hs/zO3BWu5VRvtN
	nz1nC82Jl/VGVcy8YqlgGq+hX1OO7/gaD02yfw2m6rQws+XeI8emXAkZ+uEXVLc+YHPUIrnWwGH
	34Nznk1H3c/LC26bY5O6qJuNFQAdp3HQgOU35DN+XXIkPB9USZssrgvFpdNmFCGW93a2nqI58Nd
	Yfx72wB/794fN0=
X-Received: by 2002:a05:6820:1c87:b0:6a1:8192:4d89 with SMTP id 006d021491bc7-6b6fe2b1023mr3910091eaf.29.1788524300512;
        Fri, 04 Sep 2026 05:18:20 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885d29esm7181575eec.2.2026.09.04.05.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:18:20 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 1/2] usb: serial: fix typos in comments
Date: Fri,  4 Sep 2026 17:48:10 +0530
Message-ID: <20260904121813.26714-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904121813.26714-1-hemanth.selam@gmail.com>
References: <20260904121813.26714-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/usb/serial/f81534.c           | 4 ++--
 drivers/usb/serial/ftdi_sio_ids.h     | 2 +-
 drivers/usb/serial/keyspan_usa28msg.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/serial/f81534.c b/drivers/usb/serial/f81534.c
index 0037767e4bbf..f0ab72d99d5e 100644
--- a/drivers/usb/serial/f81534.c
+++ b/drivers/usb/serial/f81534.c
@@ -83,7 +83,7 @@
 #define F81534_TOKEN_MSR_CHANGE		0x04
 
 /*
- * We used interal SPI bus to access FLASH section. We must wait the SPI bus to
+ * We used internal SPI bus to access FLASH section. We must wait the SPI bus to
  * idle if we performed any command.
  *
  * SPI Bus status register: F81534_BUS_REG_STATUS
@@ -755,7 +755,7 @@ static int f81534_find_config_idx(struct usb_serial *serial, u8 *index)
  * The F81532/534 will not report serial port to USB serial subsystem when
  * H/W DCD/DSR/CTS/RI/RX pin connected to ground.
  *
- * To detect RX pin status, we'll enable MCR interal loopback, disable it and
+ * To detect RX pin status, we'll enable MCR internal loopback, disable it and
  * delayed for 60ms. It connected to ground If LSR register report UART_LSR_BI.
  */
 static bool f81534_check_port_hw_disabled(struct usb_serial *serial, int phy)
diff --git a/drivers/usb/serial/ftdi_sio_ids.h b/drivers/usb/serial/ftdi_sio_ids.h
index 9c83c17853c8..a3481f159d9a 100644
--- a/drivers/usb/serial/ftdi_sio_ids.h
+++ b/drivers/usb/serial/ftdi_sio_ids.h
@@ -770,7 +770,7 @@
  * Definitions for Icom Inc. devices
  */
 #define ICOM_VID		0x0C26 /* Icom vendor ID */
-/* Note: ID-1 is a communications tranceiver for HAM-radio operators */
+/* Note: ID-1 is a communications transceiver for HAM-radio operators */
 #define ICOM_ID_1_PID		0x0004 /* ID-1 USB to RS-232 */
 /* Note: OPC is an Optional cable to connect an Icom Tranceiver */
 #define ICOM_OPC_U_UC_PID	0x0018 /* OPC-478UC, OPC-1122U cloning cable */
diff --git a/drivers/usb/serial/keyspan_usa28msg.h b/drivers/usb/serial/keyspan_usa28msg.h
index a19f3fe5d98d..11003527da5c 100644
--- a/drivers/usb/serial/keyspan_usa28msg.h
+++ b/drivers/usb/serial/keyspan_usa28msg.h
@@ -61,7 +61,7 @@
 	with a total data length of 63.
 
 	USB IN (USA28 -> host, receive) messages contain data and parity
-	if parity is configred, thusly:
+	if parity is configured, thusly:
 	
 		DAT PAR DAT PAR DAT PAR ...
 
-- 
2.48.1

