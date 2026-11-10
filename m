Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292894;
	b=AXFK507e9xXRvM/8GB9Ycm3+4apyOW3Woz9O3gvbmBfOz+dKbWTANRzFFCWw6JchYYYa
	 /7ctM+wcQAW1u6Zz5wRGo1JVbvBmzwvbcVtsL8M4W1vg1pglLG6KCP3RA4/ZqJpZ2InNE
	 9/5jG9PtuiY6hdT78a/csxOGArJuTvMKCeTeHN+TVpzvjiXhcXs02RkHXPtXHXl+WMP2V
	 sHXxI/KXumbo/7eOh7JgIAInearQD4OMlSXwnP8MkxBqbYidQyT7JaO9c/fUQsxspjwSQ
	 8EOud8JVNyny4P62PZBI7V6Jr7BtlMUj/UnrNrE+Il3Z19PH6Ch6WGyRaG80zakrDwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292894;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FBbFVOrNpBv1xR64tTFIaP52jLYu79YH/28NmRnr0wg=;
	b=ictKlCZMT+be63e3LBDe1D70DwwkxCFB3Io/9nUF6Md+3b54la+NhJv8gEy6dsgFr9Bp
	 sUU9n6xkhqlEXiAZmy72/fflxxsv4As4x7L3bjjPX4ASWjoTAfkU41olCvLSNIWJcw/Sr
	 eabDRUDe8aTpTNRsaT4GuYNuKBI/ZvbtM9J6VkSEv5DbFTmJZBLypOWAj4G0xsgHjIst/
	 95m47yY1ZIXqpB2vLPHrJQj6eT32Yis93gBCEihdzrAI3tLGOMBV0nhaYmGMV/csoZziC
	 ggrytCDcmYU/9c5+XAjSKi4plSM7XD46+9OviA9RflBTAhqeFgIhCW8SXdaKoUuj5JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=fFm8R4Sj;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6D460A3811;
	Tue, 10 Nov 2026 06:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC6D460A3811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=fFm8R4Sj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=fFm8R4Sj4Ka5YAqdXwfyGZ4kW6XFgd81/wmccYZ5IWX5Cyetn2f/vs5PA3mptb/wZ5HK4V7fkADDs
	 TnjiAo1Eh52ksQMU3pXLncsiSX+j2aP0OVsTKCaYHHhN+eDBkR+CrExnIEK5gD+LAHfLyRJdUYIBXb
	 halXSENyds8nrupE=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46af2bc8d844-6b65a;
	Tue, 10 Nov 2026 14:41:19 +0800 (CST)
X-RM-TRANSID:2ee46af2bc8d844-6b65a
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af2bc812f6-aa126;
	Tue, 10 Nov 2026 14:41:18 +0800 (CST)
X-RM-TRANSID:2eea6af2bc812f6-aa126
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 19/22] usb: serial: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 06:41:02 +0000
Message-ID: <20261110064105.20335-20-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
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
 drivers/usb/serial/ftdi_sio.h   | 2 +-
 drivers/usb/serial/mos7720.c    | 2 +-
 drivers/usb/serial/oti6858.c    | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

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
diff --git a/drivers/usb/serial/ftdi_sio.h b/drivers/usb/serial/ftdi_sio.h
index 55ea61264f91..b053e038bda4 100644
--- a/drivers/usb/serial/ftdi_sio.h
+++ b/drivers/usb/serial/ftdi_sio.h
@@ -15,7 +15,7 @@
  * USB on the other.
  *
  * Thanx to FTDI (http://www.ftdichip.com) for so kindly providing details
- * of the protocol required to talk to the device and ongoing assistence
+ * of the protocol required to talk to the device and ongoing assistance
  * during development.
  *
  * Bill Ryder - bryder@sgi.com formerly of Silicon Graphics, Inc.- wrote the
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



