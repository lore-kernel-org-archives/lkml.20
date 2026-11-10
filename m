Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297520;
	b=mxD4YuNuwu5FOukT+O2B+z/sRX2GcQPq25Er9G+jndkwcllXu8TGjdjbloaaTxdljl1e
	 HQ3QuIQOwvBOBRPcklHCrj0trQvpIQXHEVo8OISJ4klIP+/ZoUTy386hx/psENrFEJfYg
	 JeMdfBLD7H5inxyc4hKoTS1Ms8E0begjObPSQbk121kZDXJmgFxhblmSW/Fr6OMBSkHNy
	 +ljFHZeHqXDk47oGiAke2STiiYmcTNzx1EZFf5POpOaoOeqfuChsi5DLu0o8byP+SDHqM
	 6DBDBHtWRYXa8YAlWJ9KGlxVRVAelRU9EYpAObRBBrE6nQqTCmyr7EN5T2YBKxEPrsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297520;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EY0QXRPsyGQggfDsnk5pErX06fnxt3+UhfrEJXGmf4k=;
	b=qp61H7ExcvzNS4aQlt9CxvblW0RKoK2srZtbk9FHGxM5bfNSvPtdpJPIByvh8WnT7Uuo
	 sd83f+4mvWsKr72t/nVYYPwm3jcH4VEZjmCCYYodUYUS/cOUdGaWUo9nUkf0flltvAytW
	 zLOURXzz0kqG6BwS+M+DzkuJvQS2Sn0SP4bA5cBhGSdqbwiw8rLwb9MXmoyuBFOS3hE7I
	 DLZ+5wqTuIoTh9PQ45MS346a5R5sZakj2523P6S52NWzQgOgCU30zCi8KtA66zK7ghRho
	 nNUVoIqE975FR7o+FB2QIxzcrMgY38Mjc0tKJKaXQ08Oe5NzdwpbCYqkpYscM2GSB8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=MEDbKJ3F;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3987060A2606;
	Tue, 10 Nov 2026 07:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3987060A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=MEDbKJ3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=MEDbKJ3FnFTby0Uc25nrY8wAhsOyusCUJUi9/Z366B/1QX840YgsecTJ20LjypHiYLRYGxUPhMJ9m
	 eF7CWiIE8ppp3twncvlDpWe3YhZKSjfcthPB5UAYg6mnT9+9/t6d1S7zN+3DzB66r51WWiSXk4J/Nl
	 4C88mhXIEnC3dF/g=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26af2ceaea33-08807;
	Tue, 10 Nov 2026 15:58:38 +0800 (CST)
X-RM-TRANSID:2ee26af2ceaea33-08807
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af2cea2027-acdec;
	Tue, 10 Nov 2026 15:58:38 +0800 (CST)
X-RM-TRANSID:2ee76af2cea2027-acdec
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 19/22] usb: serial: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 07:58:22 +0000
Message-ID: <20261110075825.24946-20-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
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

No functional changes.

Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>
---
 drivers/usb/serial/cypress_m8.c | 2 +-
 drivers/usb/serial/f81534.c     | 8 ++++----
 drivers/usb/serial/mos7720.c    | 2 +-
 drivers/usb/serial/oti6858.c    | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/serial/cypress_m8.c b/drivers/usb/serial/cypress_m8.c
index 78fb1389b34c..bd9b68b691de 100644
--- a/drivers/usb/serial/cypress_m8.c
+++ b/drivers/usb/serial/cypress_m8.c
@@ -462,7 +462,7 @@ static int cypress_generic_port_probe(struct usb_serial_port *port)
 		return -ENOMEM;
 	}
 
-	/* Skip reset for FRWD device. It is a workaound:
+	/* Skip reset for FRWD device. It is a workaround:
 	   device hangs if it receives SET_CONFIGURE in Configured
 	   state. */
 	if (!is_frwd(serial->dev))
diff --git a/drivers/usb/serial/f81534.c b/drivers/usb/serial/f81534.c
index 0037767e4bbf..502c1c0260ec 100644
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
@@ -824,9 +824,9 @@ static bool f81534_check_port_hw_disabled(struct usb_serial *serial, int phy)
  * f81534_calc_num_ports() will run to final we marked as "oldest version"
  * for this IC.
  *
- * 2rd is designed to more generic to use any transceiver and this is our
+ * 2nd is designed to more generic to use any transceiver and this is our
  * mass production type. We'll save data in F81534_CUSTOM_ADDRESS_START
- * (0x2f00) with 9bytes. The 1st byte is a indicater. If the token is
+ * (0x2f00) with 9bytes. The 1st byte is a indicator. If the token is
  * F81534_CUSTOM_VALID_TOKEN(0xf0), the IC is 2nd gen type, the following
  * 4bytes save port mode (0:RS232/1:RS485 Invert/2:RS485), and the last
  * 4bytes save GPIO state(value from 0~7 to represent 3 GPIO output pin).
diff --git a/drivers/usb/serial/mos7720.c b/drivers/usb/serial/mos7720.c
index 104f43a8f4d8..312fa11cea95 100644
--- a/drivers/usb/serial/mos7720.c
+++ b/drivers/usb/serial/mos7720.c
@@ -1208,7 +1208,7 @@ static int set_higher_rates(struct moschip_port *mos7720_port,
 	/***********************************************
 	 *              Set for higher rates           *
 	 ***********************************************/
-	/* writing baud rate verbatum into uart clock field clearly not right */
+	/* writing baud rate verbatim into uart clock field clearly not right */
 	if (port_number == 0)
 		sp_reg = MOS7720_SP1_REG;
 	else
diff --git a/drivers/usb/serial/oti6858.c b/drivers/usb/serial/oti6858.c
index c6364e8ff71f..0e527fe56da0 100644
--- a/drivers/usb/serial/oti6858.c
+++ b/drivers/usb/serial/oti6858.c
@@ -13,7 +13,7 @@
  * Warning! You use this driver on your own risk! The only official
  * description of this device I have is datasheet from manufacturer,
  * and it doesn't contain almost any information needed to write a driver.
- * Almost all knowlegde used while writing this driver was gathered by:
+ * Almost all knowledge used while writing this driver was gathered by:
  *  - analyzing traffic between device and the M$ Windows 2000 driver,
  *  - trying different bit combinations and checking pin states
  *    with a voltmeter,
-- 
2.53.0



