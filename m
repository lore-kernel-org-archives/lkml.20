Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C20E2F7F01;
	Fri, 16 Oct 2026 01:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792112963; cv=none; b=KM0pkvnnbcHZztFlB0ZJPJ90M6YHGJMcjbNA/UO9Zb/SG56vO4LRusOfQHgxtrB6gZrY0E6cKxI7sbF55dxD2Wiz0oxUh2jA3wmZMkxUJlEFNdnV++mNHm6CBO9CIi5fxVqIN7HalLJgOcGb6VeKOFvgMoUd8UDB2ITjhtfQUcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792112963; c=relaxed/simple;
	bh=vcopr+G3k+uDgKVas2knjw3tkfxDmGDYdcA6sdXWG1M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qVLCM+Oi80JtCixA7jeFE870sACTb4ipI6ZQcy1ZqDr+5ifssabr3bkroOdM/MU2XD9RahldYVNL9QGbxnUF9ULvpxwCzbJi+CQj1BJqdshaG2tKdcaCZRCMAyS1mfsr6j2nWrJRQ8kV4LGKSl/XJiZOhXHs/nSf4IkrT9TKquc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hSAvrTx2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hSAvrTx2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86EB6C2BCC7;
	Fri, 16 Oct 2026 01:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792112962;
	bh=vcopr+G3k+uDgKVas2knjw3tkfxDmGDYdcA6sdXWG1M=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=hSAvrTx2smpqutIEcBUuveYuYraYcBBtOb+T3IK0QUrVgGL9UnCuREHnLnSiqsaLT
	 RCuSh0YwQF3/y/UzP08/XtFYW3OKDz5c0oaQE9Qmh2QhaIyCQxYkNnGmyUfakSgCwr
	 XuMrS632Gm7VgbAmuQq7TS/NxBSpXpbM/xPi+Nii8Vut0QCdLmk9Ktq9eRiZa8Dind
	 elSF80JGCu2CVPOoR6hoY68y2xlX4FT5XXIhnq+7ZvHS5iGVe5xTRZKShj4l58hfwD
	 5UxzttzBtAiJFjdmwA131yAlS72AEnuIqPbrOOhoeGEro5PlDpQldqRYPOge08j2Ej
	 /3qSZWvFBt+Dg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66317CCA463;
	Fri, 16 Oct 2026 01:09:22 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Thu, 15 Oct 2026 21:09:10 -0400
Subject: [PATCH] usb: ehci-pci: Set has_hostpc for TDI EHCI on Intel
 CE5300/CE2600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-ehci-ce5300-hostpc-v1-1-3cae67c11946@telaak.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/yXMMQ7CMAxA0atUnrHkBLVEXAUxgHEaMyRVXBBS1
 LsT6PiG/xuYVBWD89CgyltNS+5whwE43fIsqI9u8OQnR25ESazIMh6JMBVbF8Zw8p4jTZFDgB4
 uVaJ+/tPLdbe97k/h9XeCbfsCRRtuHXYAAAA=
X-Change-ID: 20261015-ehci-ce5300-hostpc-8722cf06fc88
To: Alan Stern <stern@rowland.harvard.edu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792112961; l=2246;
 i=joseph@telaak.dev; s=default; h=from:subject:message-id;
 bh=MA3sBZBaI9geeYWCu5v49SoTSv0TDX1tuSr6eM7FahM=;
 b=fpdQWoGI7TyjdWTypQW/rW/n23D22VPhLMHsUp9JQwCNva6L4LBlVglxCC353oRX/1lxWc9L9
 6IM9j6xfefwBVr1m40s6aw2q4IaMEs4qiRrotEt0MBTIV1KMFYubE4C
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=vbM2RxVf3De5c1pQhdR2zZNLas2GaS+BXNVRR5qg3hI=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/default with
 auth_id=1203
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev

From: Joseph Telaak <joseph@telaak.dev>

The TransDimension EHCI core in the Intel CE5300 and CE2600 SoCs
(192e:0101, revision >= 6) has the Moorestown-style register
extensions: host mode is selected in USBMODE_EX rather than USBMODE,
and the port speed is reported in HOSTPC.

Without has_hostpc, ehci_reset() never programs USBMODE_EX, so the
core stays in idle mode: USBMODE_EX reads back 0, USBCMD.RS never
sets and no device is ever reported as connected, even though the
probe itself succeeds. With it, USBMODE_EX reads back 0x23 and
devices enumerate.

Intel's CE5300 BSP applies the same quirk for device 0x0101,
revision >= 6.

Tested on a Control4 EA-3 (Intel Atom CE5310) with v7.3-rc6: a
full-speed CP2104 USB-UART bridge (10c4:ea60) and a high-speed USB
flash drive (0781:5575) enumerate with this change.

Assisted-by: LLM
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
Notes:
- CONFIG_USB_EHCI_ROOT_HUB_TT=y is still required, as for any TDI
  core; without it ehci_halt() times out (-110) on the idle core
  before this code runs.
- has_tdi_phy_lpm is left at 0 on this path, matching Intel's BSP.
- This is a device quirk rather than a regression fix, so there is
  no Fixes: tag; it may be suitable for stable if you think so.
---
 drivers/usb/host/ehci-pci.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/ehci-pci.c b/drivers/usb/host/ehci-pci.c
index bd3a635555..8c71c3de30 100644
--- a/drivers/usb/host/ehci-pci.c
+++ b/drivers/usb/host/ehci-pci.c
@@ -145,8 +145,16 @@ static int ehci_pci_setup(struct usb_hcd *hcd)
 			hcd->has_tt = 1;
 		break;
 	case PCI_VENDOR_ID_TDI:
-		if (pdev->device == PCI_DEVICE_ID_TDI_EHCI)
+		if (pdev->device == PCI_DEVICE_ID_TDI_EHCI) {
 			hcd->has_tt = 1;
+			/*
+			 * The TDI core in the Intel CE5300/CE2600 (rev >= 6)
+			 * selects host mode in USBMODE_EX and reports port
+			 * speed in HOSTPC, as on Moorestown.
+			 */
+			if (pdev->revision >= 0x6)
+				ehci->has_hostpc = 1;
+		}
 		break;
 	case PCI_VENDOR_ID_AMD:
 		/* AMD PLL quirk */

---
base-commit: bbf6b99a57b2479bf51c3c8ad0946f4b8c33ed69
change-id: 20261015-ehci-ce5300-hostpc-8722cf06fc88

Best regards,
--  
Joseph Telaak <joseph@telaak.dev>


