Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385B63CA48E;
	Sun, 20 Sep 2026 02:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789872844; cv=none; b=iswdLc+jD3AKGRpzl5gAD5vDOQJEwmhLeL+mSIvH0fvd1NWNkB3AX7o3JrLX0ZKh/r5LZWpI7cja3IABD6Yy9pFDLwYW/oXXxXqyI62Xy766ZMchhItTyvYm4zoZK+R7U53Bjl1n5JIjS+GDz8jjl8bdt+8X59ocblyuBicYIVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789872844; c=relaxed/simple;
	bh=7/wP9idmsIxXSX+rLssS9DgiayKK9+qmRtUy6p20ibs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VARmddnrgxg2zD4p2l0s2JlScpb0hRJRTFqOMFcD+HsVPRAXP6GFNNrvY+EwRlo0ZMmiP52d9j18rYvhDxs479SHEMxeHziREPofgqA+tguqH873hVmr0Og2bRFvSs40QhU+xSlBz5zRm/6KT/b6VtkU7PzH9o46BxTWwPExOzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=LxsfPYes; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="LxsfPYes"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Fl
	g5l96rhevWd27bO83oEPMEFu7hlyEi/bD9P2X/eQE=; b=LxsfPYesP5veeSFgpw
	i/vj8Zhm7W30DapVvsxaNrQu+LyFhdmiAKR0XE0YHt01Re7qKTfW6wOAC4D4YRLB
	GfC8r5EAZqXeyGXkU31k/TFK+xUVntbVdHA4UlNq1hWC/xH0DSJpkU98zOvt0IG5
	sl5IJoTs7giFb6jk6nXP89mg4=
Received: from debian.lenovo.com (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD33aGZSq9qsaQrBg--.118S4;
	Sun, 20 Sep 2026 10:53:23 +0800 (CST)
From: Kean Ren <rh_king@163.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alan Stern <stern@rowland.harvard.edu>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Kuen-Han Tsai <khtsai@google.com>,
	Kees Cook <kees@kernel.org>,
	Nikhil Solanke <nikhilsolanke5@gmail.com>,
	Thorsten Blum <blum@kernel.org>,
	Kean Ren <rh_king@163.com>
Subject: [PATCH 2/2] xhci: fix ASM3242 port speed report for Gen 2x2 links after cold boot
Date: Sun, 20 Sep 2026 10:52:43 +0800
Message-ID: <20260920025308.2358862-3-rh_king@163.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920025308.2358862-1-rh_king@163.com>
References: <20260920025308.2358862-1-rh_king@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD33aGZSq9qsaQrBg--.118S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxXFyktFWDGw1fZryfXr45trb_yoWruF1Dpa
	y3JF4UGr4DtFs3Ww15WF1DJ3Z5Aan3GrWUtry7CayjkFWUt345GFyjkrZxAr9rX39xA34Y
	qF18G39xGFWDJFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zEUDJiUUUUU=
X-CM-SenderInfo: 5ukbyxlqj6il2tof0z/xtbC+wNB72qvSqPj7gAA33

The ASMedia ASM3242 (1b21:3242) reports the SuperSpeed speed ID (4) in
PORTSC[13:10], together with two active lanes, for a link that is
actually running at Gen 2x2 after a cold boot.
xhci_get_ext_port_status() copies that ID into dwExtPortStatus, so the
USB core matches SSID 4 (whose LP is SuperSpeed, not SuperSpeedPlus),
returns USB_SSP_GEN_UNKNOWN and falls back to USB_SPEED_SUPER:

  $ lsusb -t
      |__ Port 001: Dev 002, If 0, Class=Mass Storage, Driver=uas, 5000M/x2
  $ cat /sys/bus/usb/devices/2-1/speed
  5000

while the link really runs at 20 Gbps:

  GetPortStatus(HUB_EXT_PORT_STATUS) -> dwExtPortStatus = 0x00001144
      (RX/TX speed id 4, RX/TX lanes 2)     after a cold boot
  GetPortStatus(HUB_EXT_PORT_STATUS) -> dwExtPortStatus = 0x00001177
      (RX/TX speed id 7, RX/TX lanes 2)     after an S3 resume

  O_DIRECT throughput, cross-checked with /proc/diskstats:
      1.49 - 1.60 GB/s (11.9 - 12.8 Gbps)  in the "5000M" state
      1.63 - 1.83 GB/s (13.0 - 14.7 Gbps)  in the "20000M" state

Both exceed the physical ceiling of a 10 Gbps link (~1.25 GB/s), so the
link is Gen 2x2 in both states and only the controller's report is
wrong.  Only an S3 suspend/resume makes the controller report speed ID
7; a device re-plug, a port disable/enable, an xhci_hcd unbind/bind, a
PCI function reset and a PCI remove+rescan all leave the wrong value in
place.

Add XHCI_ASM3242_SPEED_QUIRK and, when it is set, report the Gen 2x2
speed ID when the controller reports SuperSpeed with two active lanes.

Reported-by: Kean Ren <rh_king@163.com>
Link: https://lore.kernel.org/linux-usb/<your-report-message-id>/
Signed-off-by: Kean Ren <rh_king@163.com>
---
 drivers/usb/host/xhci-hub.c | 17 +++++++++++++++--
 drivers/usb/host/xhci-pci.c |  4 ++++
 drivers/usb/host/xhci.h     |  1 +
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 470bafe1802b..ef2b35b31492 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1001,13 +1001,26 @@ static int xhci_handle_usb2_port_link_resume(struct xhci_port *port,
 	return 0;
 }
 
-static u32 xhci_get_ext_port_status(u32 portsc, u32 port_li)
+static u32 xhci_get_ext_port_status(struct xhci_hcd *xhci, u32 portsc,
+				    u32 port_li)
 {
 	u32 ext_stat = 0;
 	int speed_id;
 
 	/* only support rx and tx lane counts of 1 in usb3.1 spec */
 	speed_id = DEV_PORT_SPEED(portsc);
+
+	/*
+	 * The ASM3242 reports the SuperSpeed speed ID (4) together with two
+	 * active lanes for a link that is actually running at Gen 2x2 after a
+	 * cold boot.  Reporting that ID makes the USB core fall back to
+	 * USB_SPEED_SUPER (5000 Mbps) although the link runs at 20 Gbps, so
+	 * report the Gen 2x2 speed ID (7) instead.
+	 */
+	if ((xhci->quirks & XHCI_ASM3242_SPEED_QUIRK) && speed_id == 4 &&
+	    PORT_RX_LANES(port_li) && PORT_TX_LANES(port_li))
+		speed_id = 7;
+
 	ext_stat |= speed_id;		/* bits 3:0, RX speed id */
 	ext_stat |= speed_id << 4;	/* bits 7:4, TX speed id */
 
@@ -1265,7 +1278,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				break;
 			}
 			port_li = readl(&port->port_reg->portli);
-			status = xhci_get_ext_port_status(portsc, port_li);
+			status = xhci_get_ext_port_status(xhci, portsc, port_li);
 			put_unaligned_le32(status, &buf[4]);
 		}
 		break;
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index a8889081ae82..6219151d9eb0 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -471,6 +471,10 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	     pdev->device == PCI_DEVICE_ID_ASMEDIA_3242_XHCI))
 		xhci->quirks |= XHCI_NO_64BIT_SUPPORT;
 
+	if (pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
+	    pdev->device == PCI_DEVICE_ID_ASMEDIA_3242_XHCI)
+		xhci->quirks |= XHCI_ASM3242_SPEED_QUIRK;
+
 	if (pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
 		pdev->device == PCI_DEVICE_ID_ASMEDIA_1042A_XHCI)
 		xhci->quirks |= XHCI_ASMEDIA_MODIFY_FLOWCONTROL;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index c7bfa7f028d3..77fab2f29693 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1647,6 +1647,7 @@ struct xhci_hcd {
 #define XHCI_CDNS_SCTX_QUIRK	BIT_ULL(48)
 #define XHCI_ETRON_HOST	BIT_ULL(49)
 #define XHCI_LIMIT_ENDPOINT_INTERVAL_9 BIT_ULL(50)
+#define XHCI_ASM3242_SPEED_QUIRK	BIT_ULL(51)
 
 	unsigned int		num_active_eps;
 	unsigned int		limit_active_eps;

