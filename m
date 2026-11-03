Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793669512;
	b=0mirSnULA2yN0n6203bDI08aVaoGY5MWxqKrV4NYpHHt/akvdE6KWO1eHwZQ9u8vef8H
	 mOYm+XsO99i/yLaWiEDK8NZVagpkv7EtU/OS7SeGxvBRR1b0hQe93oqsy0LaFkXJfDZt9
	 1CrjGwcpaCabaOEgzTZNxXXoGZes+C4dTAWT3Q06oVcXwL6GBJ27dbig05rj7+529s33w
	 7fWhAWOa36I4B9omRTgg1h1oo7FuA2WRZc3bOV8uhkVZxL1BIs/2SXiLxhK7XiCFvnIV/
	 4nZVBm3NuosorOV5o7TeSWh5Od19CdOQoaKNwJ1W9KHg7lzP+60ejhoHGtPEWMtbCzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793669512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pTjzHT3j3g4KPLqEKsNSbVg6rJdaH8AJl04Trccj3fE=;
	b=XK0o6qMhKNMBB7arG+F776Xg2bc2LCfO8r6Fajod780/uVIKhHfqR3FELW6VsW51zr1v
	 PPoT8gjROMvHPbvwPttIZmNPPdnA/nLW9HukdQHJd61iMitFgPNXDzviqZaci9uuEkI4u
	 5nmXKHoi5GzaWIA++/WLtZgyI0OFwzcOpN8RyCQCLVluvPJZK58CkiGA5VnD0C+YprBEA
	 2xFCpZZodkD1zqwn2zDw8eVasoUpF6tMCAegkQa+gx4VRuKb/f0z4RQUhcEN+NAbdLfh5
	 +144FUs9I4r8NdQjD6tiHVs/j/hLu3ES+Qwm6qiClZU5Okt1WFU1om4U+CQO3igIdoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kaMQqmgt;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77FD606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:31:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B77FD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kaMQqmgt
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so1872833a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793669511; x=1794274311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pTjzHT3j3g4KPLqEKsNSbVg6rJdaH8AJl04Trccj3fE=;
        b=kaMQqmgtQP3OdM7RkOm7AUAcD/Xyzs1ysyZZ1ee6c3FrfZr3DLOlj+OQnK0+CmorhE
         52Ueqi1IxhuE9cadYwqkkZ2/NxKv/N7sCRKaTriEXQ9P7D0JeUKFcQ63tCTJCCjdnFqm
         RdAGR9U5v7ADYwTlMpCJJqEX+AwKl8JgJAHpbu+kfq1VL4LtEFwDn/q1BKNM2F+LpFd9
         2CMsjc3LXb6zo0TojjRTzsrLD1A6UXM7tNYpWQyxAqHZQyNf9dbAVF6ETiTp1ZOADlCO
         yyRs/P8dmCmB2BhueWL4Klp5mEdtf78p0BDsPLK7YtG7aSGYcXI5I1DWvvdCgPMb0KvI
         KmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793669511; x=1794274311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pTjzHT3j3g4KPLqEKsNSbVg6rJdaH8AJl04Trccj3fE=;
        b=xgEQm0195BwyEqduYDAYFDZVgPiHB71TQNBlGOw79sFcJiWBFuvjvnZMl8QhOsuzWX
         LIl3G8SHm2ygd7YEysxHieuqIo2qHZn3gx3DAcw9CQn7Z3T3Ve+c+Yg19zUAHmvnXdgO
         a7ecVV9ts1jlc7FgVAkFhCgfUN/vECT1n4UdTjy4q5BYGRqN78w3Z3qh1x9XGUPt6agO
         oS3eNKO9FTJWIyEunFeVq3qpwlOWTPXlAc6si0DVTT0ua39NxRt5POVJe8ofoPF9Paxk
         tcxt1Fd65OHyMtr02n7l07FNfW08tVsnqzuSYGx7x1GzQy1XAngOsNFrN30EAgs07jZy
         pJzw==
X-Forwarded-Encrypted: i=1; AKwUvByHnv7kKJXrYozu36C37HcMr/29aODA2rX9oG1OrtCbRnv+3ZhgDUsd6QisIAMuDhXYi5dg5CAJCh0FO1k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BLjq8L4wmsC8Jxqc0h6ib8cVk83lyEbI/nKYSy5oXC8RXxJxF
	+znsmyNSV23dR8CoWCIRUlRRhVn+F8dab+8nx/oIjNTbvaEJmlJYtLkvkzvkDPuc
X-Gm-Gg: AYBFou3Yg2j6dra06zowqXPF+XlksUu6jW6AjJnRtb2D06c2AK9dxp+R9veltUxP/cL
	OHPIS3WIt/KAl4w9mAcVJKf51lXjQPUrG9uZ09UrVjsF2HxOz9kSO7t0LnNqNLYe1mMVb7NHnSH
	m4fboaEcIqX9KWPxTb8NaKh1Ozsz/EykwWKCBtZVdit7R1fjG4eHYbWlObMdbrs0y2gx5K/tF0t
	6ycn7oym8LYzX6tlaM6t8JC1NGFNJxTgQjPmynhlxhMiIjqVT9UyWU99SdfeJ/mkzbcpKezjT7q
	zNGl3hRaQF0xKMLbXcSuMhKilZuk/8IDzwBOftGQxkkIbZab+1/zKhZG0zfNdJrGZFkY/uC318q
	abOIlI+WS+KNUajYkzXNAZcZwBcaRSl3h6OJdbBw7JwmP0HEoWfq0tDvmHj1pKs5o9IzLoOgQnt
	ChCyYI44xuOaQ2n0JIW6vIbz9eRWrOnB+vKOvdaBT9+2ClWraRqX/YlEyTbP7Llm+vKiWkPLrsW
	P4Lm2WWo6nBbXK05BdC95gyD8iyRQZyliG/N7H13gwvkwtYrnKMhfdVcV4gjzhOYiiIRBwX303i
	ceaM23ZoFmv3idGzfUWMqoYf00s5NztPQHwdElTrMtBtAy6Imk/CG+bc/sOJjA+S0rruXo+nOHi
	3UO7if9Ja03JaoTJ0HzQCSVA=
X-Received: by 2002:a17:90b:4b12:b0:3a8:5fd6:cb6 with SMTP id 98e67ed59e1d1-3ae89173bedmr9332181a91.0.1793669510984;
        Mon, 02 Nov 2026 17:31:50 -0800 (PST)
Received: from kic-machine.localdomain (122-117-151-175.hinet-ip.hinet.net. [122.117.151.175])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9b0ec5sm1453886a91.16.2026.11.02.17.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 17:31:50 -0800 (PST)
From: Kuangyi Chiang <ki.chiang65@gmail.com>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ki.chiang65@gmail.com
Subject: [PATCH] xhci: Handle missing USB2 resume events on Etron hosts
Date: Tue,  3 Nov 2026 09:31:26 +0800
Message-Id: <20261103013126.3603-1-ki.chiang65@gmail.com>
X-Mailer: git-send-email 2.25.1
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

On Etron xHCs, a USB2 remote wakeup may also move other suspended
USB2 ports into the resume state without generating individual Port
Status Change Events.

The issue can be reproduced as follows:

1. Connect a USB2 hub to each downstream port of the Etron xHC.
2. Wait for all hubs, including the root hub, to autosuspend.
3. Connect a USB device, such as a mouse, to each USB2 hub in turn.
4. The last connected mouse does not work.

The affected USB2 ports may remain in the resume state, preventing
newly connected devices from enumerating. Reconnecting an affected
hub or mouse does not help. Reloading the xHCI driver restores
normal operation.

When handling a USB2 resume event on an Etron xHC, check the other
USB2 ports for the resume state and track them so the normal resume
handling can complete.

Before the patch, the root hub status bitmap reported only port 2
(evt 0004), leaving port 3 in the resume state.

[ 4621.396100] xhci_hcd 0000:01:00.0: Port change event, 3-2, id 2, portsc: 0x400fe3
[ 4621.396158] xhci_hcd 0000:01:00.0: port resume event for port 2
[ 4621.396164] xhci_hcd 0000:01:00.0: resume HS port 2
[ 4621.437164] hub 3-0:1.0: state 7 ports 4 chg 0000 evt 0004
[ 4621.569169] usb usb3-port2: resume, status 0

After the patch, the bitmap includes both ports (evt 000c), allowing
port 3 to complete resume through the normal resume handling.

[ 4824.829350] xhci_hcd 0000:01:00.0: Port change event, 3-2, id 2, portsc: 0x400fe3
[ 4824.829425] xhci_hcd 0000:01:00.0: port resume event for port 2
[ 4824.829431] xhci_hcd 0000:01:00.0: resume HS port 2
[ 4824.829439] xhci_hcd 0000:01:00.0: HS port 3 in resume without event, portsc: 0xfe3
[ 4824.870180] hub 3-0:1.0: state 7 ports 4 chg 0000 evt 000c
[ 4825.001183] usb usb3-port2: resume, status 0
[ 4825.027484] usb usb3-port3: resume, status 0

Tested on Etron EJ168 (1b6f:7023) and EJ188 (1b6f:7052).

Signed-off-by: Kuangyi Chiang <ki.chiang65@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index ec278a9..ec7ef89 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1997,6 +1997,39 @@ static void xhci_cavium_reset_phy_quirk(struct xhci_hcd *xhci)
 	} while (!(pll_lock_check & 0x1) && --retry_count);
 }
 
+/*
+ * Etron xHCs may resume other suspended USB2 ports without generating
+ * individual Port Status Change Events. Track those ports so the normal
+ * USB2 resume handling can finish.
+ */
+static void xhci_handle_etron_usb2_resume(struct xhci_hcd *xhci)
+{
+	struct xhci_hub *rhub = &xhci->usb2_rhub;
+	struct xhci_bus_state *bus_state = &rhub->bus_state;
+	struct xhci_port *port;
+	unsigned int i;
+	u32 portsc;
+
+	for (i = 0; i < rhub->num_ports; i++) {
+		if (test_bit(i, &bus_state->resuming_ports))
+			continue;
+
+		port = rhub->ports[i];
+		portsc = xhci_portsc_readl(port);
+		if ((portsc & PORT_RESET) || !(portsc & PORT_PE))
+			continue;
+
+		if ((portsc & PORT_PLS_MASK) == XDEV_RESUME) {
+			xhci_dbg(xhci, "HS port %d in resume without event, portsc: 0x%x\n",
+				 port->hw_portnum + 1, portsc);
+			port->resume_timestamp = jiffies +
+				msecs_to_jiffies(USB_RESUME_TIMEOUT);
+			set_bit(i, &bus_state->resuming_ports);
+			usb_hcd_start_port_resume(&rhub->hcd->self, i);
+		}
+	}
+}
+
 static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
 {
 	struct xhci_virt_device *vdev = NULL;
@@ -2103,6 +2136,8 @@ static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
 			mod_timer(&hcd->rh_timer,
 				  port->resume_timestamp);
 			usb_hcd_start_port_resume(&hcd->self, hcd_portnum);
+			if (xhci->quirks & XHCI_ETRON_HOST)
+				xhci_handle_etron_usb2_resume(xhci);
 			bogus_port_status = true;
 		}
 	}
-- 
2.25.1

