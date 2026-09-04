Received: from mail.jetone.com.tw (mail.arestech.com.tw [210.61.96.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562B13CAE7F;
	Fri,  4 Sep 2026 08:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.96.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508870; cv=none; b=UqfJ2OrC87m9lMSjYPw2heXknr02XCzq+z0kp8fnVk2YYivJSTRM8jdO/z3N/43zLJqE/bWHFMkMo774pgMja9gTCsmepsS1IwV4jrC5N/wnTOhqf6zrMH36FW5NZbu/OJlMg654lB8Fot0rlwNdlURflZM/aWBFi7FRWnTQJEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508870; c=relaxed/simple;
	bh=dBVFzNkm7C/8meYf7vsNJU9XTGhVurtsIEQb9dBqdBE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VpjO/SvJobxKXwP8DQ0FQxcSdOGgqHi3RV3cPwQEOVPIcoakH0Z14iw8ZFAs0TpPJqarTvoLZe8zjxWAKpVTHwB6kTXYjGI2jDBmFY6KT9f5Pt1YcHU/T/lkrpme+4xmFAW4DdlPWLBPKNAi0abU8r1A2cjf3AU5yiFT5cd483A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jetone.com.tw; spf=pass smtp.mailfrom=jetone.com.tw; arc=none smtp.client-ip=210.61.96.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jetone.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jetone.com.tw
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68480wi763293343, This message is accepted by code: ctloc85258
Received: from mail.jetone.local ([192.168.0.53])
	by mail.jetone.com.tw (8.15.2/3.29/5.94) with ESMTP id 68480wi763293343;
	Fri, 4 Sep 2026 16:00:58 +0800
Received: from ian-lin-DREAMBOOK-PRO-14V.jetone.local (192.168.0.137) by
 VM-EX2019.JETONE.LOCAL (192.168.0.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Fri, 4 Sep 2026 16:00:58 +0800
From: Ian Lin <ian.lin@jetone.com.tw>
To: Johan Hovold <johan@kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Ian Lin
	<ian.lin@jetone.com.tw>
Subject: [PATCH] USB: serial: option: add Compal EXC-T1 support
Date: Fri, 4 Sep 2026 16:00:46 +0800
Message-ID: <20260904080046.56772-1-ian.lin@jetone.com.tw>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VM-EX2019.JETONE.LOCAL (192.168.0.53) To
 VM-EX2019.JETONE.LOCAL (192.168.0.53)

The Compal EXC-T1 is a Qualcomm MDM9207-based LTE modem which reports
"EXC-x1" as its USB product string. It exposes diagnostic, modem, AT,
and NMEA ports as vendor-specific interfaces with subclass 0x10 and
protocols 0x01 through 0x04.

Add exact interface matches for these four ports, leaving the ff/ff/ff
interface unbound.

Relevant output from usb-devices:

T:  Bus=03 Lev=02 Prnt=03 Port=03 Cnt=01 Dev#=  6 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=04b7 ProdID=4d22 Rev=03.18
S:  Manufacturer=CEI
S:  Product=EXC-x1
C:  #Ifs= 6 Cfg#= 1 Atr=a0 MxPwr=500mA
I:  If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=10 Prot=01 Driver=option
I:  If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=10 Prot=02 Driver=option
I:  If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=10 Prot=03 Driver=option
I:  If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=10 Prot=04 Driver=option
I:  If#= 4 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
I:  If#= 5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=10 Prot=05 Driver=qmi_wwan

Tested on a Compal EXC-T1 modem using an Ubuntu kernel build. The four
serial interfaces bound to option and exposed ttyUSB3 through ttyUSB6.

Assisted-by: Codex:GPT-5
Signed-off-by: Ian Lin <ian.lin@jetone.com.tw>
---
 drivers/usb/serial/option.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 03c3785a1..a42c37450 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -2433,6 +2433,10 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = RSVD(5) },
 	{ USB_DEVICE_INTERFACE_CLASS(0x0489, 0xe167, 0xff),                     /* Foxconn T99W640 MBIM */
 	  .driver_info = RSVD(3) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x04b7, 0x4d22, 0xff, 0x10, 0x01) },	/* Compal EXC-T1 */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x04b7, 0x4d22, 0xff, 0x10, 0x02) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x04b7, 0x4d22, 0xff, 0x10, 0x03) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x04b7, 0x4d22, 0xff, 0x10, 0x04) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x04b7, 0x8217, 0xff, 0xff, 0x30) },	/* Compal EXM-G1x */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x04b7, 0x8217, 0xff, 0xff, 0x40) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x04b7, 0x8217, 0xff, 0xff, 0x60) },

base-commit: 7f11480cda081de78a05d8c97073df66326b50b3
-- 
2.43.0

