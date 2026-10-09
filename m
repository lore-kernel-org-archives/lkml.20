Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8438A4432F5;
	Fri,  9 Oct 2026 06:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791527280; cv=none; b=pa1AV/9XwLzpwrVhnEpqvr7gGvP3lqi0oEMxy1IL4wE0D7ewLX4pg7uj81LgRUAyDB+41tftjYpOXHT4R/FmOArWQY21tNhaT8MZCkj29d11eDHNYIWA+cJ2pq8fynWWjNG0xmnBU4ncF6O0XK9dq8tLLwRMr7+e8K8n5mFi/ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791527280; c=relaxed/simple;
	bh=wm1wVxPs6ozarqaUGPqt/QxufwyXMTm53MB1gRg+nJs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=h0WL1QroFjHwp3kw8gV2PbfyS6EZpXuu1zLezk7kjfIacaBr2PVMvabZYlYeV5CXa6SqEZ9sMj6NVo0VKP9WHJqL8j9xRsQf6OEZIhsW4SCiF2tKbc0NxldH+r5EQzL7LGWA+sVL/XrTGP1yLKEgPj+NrDy9NNTl10sXGCJqXVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t9nwiSF3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t9nwiSF3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10230C2BCF4;
	Fri,  9 Oct 2026 06:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791527280;
	bh=wm1wVxPs6ozarqaUGPqt/QxufwyXMTm53MB1gRg+nJs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=t9nwiSF3koiLna0GUqLW06jvHuUMAMlNeOxlME8v1k6mvUwmPDhtPWmuDClMjfTpg
	 1SwIe2+cZPvk3EW/4uwgX8sTHvjp8yzWFOuYcbnk2Qlm7lEurWwVxZb+JXaKRjhux7
	 iWARvUrWQD2Y4+cdXNz57BUXAaJRHPkg10/xkLkM7XltnN51TGwiMmiodXyq7aV+Jc
	 kZoeD+jWh1z4h7MThRxmonxb75pCNNhvQpp4D6Iiv4CdxELXq5JwniICbqnS7Wgz51
	 o98a1qi1i/ikib3hN+12Oxn3poYYOipoQAx6b+6zM7UsmuWjEucdcT0Bf8UHkkTuT/
	 jYZOhDUK4vJyw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0C83CA6012;
	Fri,  9 Oct 2026 06:27:59 +0000 (UTC)
From: Pawel Laszczak via B4 Relay <devnull+pawell.cadence.com@kernel.org>
Subject: [PATCH v4 0/3] usb: Add support for eUSB2v2 1024-byte Bulk
 MaxPacketSize
Date: Fri, 09 Oct 2026 08:49:10 +0200
Message-Id: <20261009-eusb2v2-packet-size-v4-0-a505ee17b460@cadence.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGaOyGoC/23NwW6DMBAE0F+JfI6rtbEN9NT/qHqwl3XiRAGEi
 ZU04t9rQGoUheNIM28eLNIQKLLP3YMNlEIMXZuD2u8YHm17IB6anJkEacBAzekanUyS9xbPNPI
 YfokrdMZUSmtlNMvLfiAfbov6/bPmeHUnwnGm5sYxxLEb7sttEnNvfShFufmQBAduSjRCuAZQu
 y+0DbVIH9hd2PyR5FOppNlWZFZqDV7UvqjIw7tS/CsCQG8rRVZ8Q7lhC1SlfVWmafoDMwLCvVY
 BAAA=
X-Change-ID: 20260609-eusb2v2-packet-size-4cb668455465
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pawel Laszczak <pawell@cadence.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791528555; l=6074;
 i=pawell@cadence.com; h=from:subject:message-id;
 bh=wm1wVxPs6ozarqaUGPqt/QxufwyXMTm53MB1gRg+nJs=;
 b=T8a4LPIcFWFYriDxJqsziYzERyrNpFjGB0vF3Lix2Es6Q8ZryvpD3nWS/0uKO/ipkd6BJZU20
 scbdfpJgxx5Ckvz+jcg7P0z8EH7JrlIyh85BSVqFvw6wsBm7BwTwdiM
X-Developer-Key: i=pawell@cadence.com; a=ed25519;
 pk=EUPBvLO9CDg7j6defeDl2iqi+z5Ivqu4Z46aiqe7dYc=
X-Endpoint-Received: by B4 Relay for pawell@cadence.com/default with
 auth_id=707
X-Original-From: Pawel Laszczak <pawell@cadence.com>
Reply-To: pawell@cadence.com

The Embedded USB2 (eUSB2) v2 specification (bcdUSB 0x0230) introduces a
mechanism that allows High-Speed Bulk endpoints to support a maximum
packet size (MPS) of 1024 bytes, expanding it from the traditional
512-byte limit defined in the standard USB 2.0 specification.
This capability is highly beneficial for Mass Storage Class (MSC)
devices, significantly improving overall throughput.

Per the eUSB2v2 specification, a peripheral device will revert its
internal Bulk MPS back to 512 bytes after major bus events, including a
bus reset, disconnect, or deconfiguration. To establish and maintain
the 1024-byte mode, the host controller must explicitly issue
a device-recipient SET_FEATURE request called
USB_DEVICE_BULK_MAX_PACKET_UPDATE. This must occur after the device enters
the ADDRESSED state, but strictly before it transitions to the CONFIGURED
state.

This patch series implements the required infrastructure on both the host
and gadget sides, and enables it for the Cadence (cdnsp) controller.

Structure of the series:
- Patch 1: Introduces host-side core support in usb_set_configuration() to
  detect eUSB2v2 devices and issue the SET_FEATURE update request prior to
  activating the device configuration. Adds eusb2v2_mps_active flag to
  struct usb_device to track negotiation state. Extends hub.c to re-issue
  SET_FEATURE after bus reset in usb_reset_and_verify_device(); on failure
  triggers re-enumeration to prevent driver from operating with
  inconsistent MPS state. Also updates xHCI endpoint initialization
  to allow 1024-byte packets for High-Speed Bulk endpoints when HCC2_E2V2C
  is present.

- Patch 2: Extends the USB Gadget Composite framework to advertise bcdUSB
  0x0230 when eUSB2v2 is supported, intercept the incoming feature
  request, and dynamically update the wMaxPacketSize fields across all
  High-Speed Bulk descriptors before configuration is completed.
  
- Patch 3: Implements peripheral-specific handling in the Cadence (cdnsp)
  driver, reading HCCPARAMS2 to discover the hardware capability and
  adapting cdnsp_endpoint_init() boundaries to allow for the larger
  packet size.

Testing:
The flow has been validated using the Cadence eUSB2v2 Host and Device
controllers, ensuring seamless transition to 1024-byte mode during early
enumeration stages and successful verification under USB-IF Compliance
Verification (CV) tooling.

Signed-off-by: Pawel Laszczak <pawell@cadence.com>
---
Changes in v4:
- [Patch 1/3] Removed redundant code and simplified conditions based on
  community feedback:
  - Eliminated duplicate error logging in eusb_update_max_packet().
  - Cleaned up control flow in eusb_update_max_packet() by dropping the
    redundant `has_bulk` variable.
  - Made eusb_update_max_packet() return -EOPNOTSUPP, which simplified
    the active flag assignment in usb_set_configuration().
  - Moved eusb2v2_mps_active flag management entirely inside 
    eusb_update_max_packet().
  - Dropped a redundant defensive USB_SPEED_HIGH check in xhci_usb_endpoint_maxp().
- [Patch 2/3] and [Patch 3/3] No changes.
- Link to v3: https://patch.msgid.link/20261005-eusb2v2-packet-size-v3-0-fde610a3c47a@cadence.com

Changes in v3:
- message.c: Add check for bulk endpoint existence before sending
  BULK_MAX_PACKET_UPDATE. This avoids sending the request to devices that
  only use isochronous endpoints, as they do not support it.
- host & gadget: Do not overwrite ep->desc.wMaxPacketSize to 1024.
  According to eUSB2v2 spec section 5.2, the endpoint descriptor must
  always report 512 bytes regardless of the current operating mode.
- host: Rely on the eusb2v2_mps_active flag in xhci_usb_endpoint_maxp()
  to dynamically return 1024 for HS bulk endpoints when the 1KB mode
  is active.
- gadget: Introduce gadget->eusb2v2_mps_active flag to let the composite
  framework report 512 bytes while the UDC dynamically sets 1KB max packet
  size in hardware.
- Link to v2: https://patch.msgid.link/20260826-eusb2v2-packet-size-v2-0-950f19f38ef0@cadence.com

Changes in v2:
- Removed config.c change: per eUSB2v2 spec section 5.2, conformant devices
  always report wMaxPacketSize=512 in their descriptor regardless of operating
  mode, so the warning suppression was unnecessary.
- eusb_update_max_packet(): changed from void to int; added error propagation
  and eusb2v2_mps_active state tracking.
- Added hub.c handling to restore 1KB mode after bus reset, with re-enumeration
  on failure (addresses Oliver Neukum's review comments).
- xhci-mem.c: simplified HS bulk clamp logic.
- xhci.c: moved is_eusb2v2 assignment into xhci_hcd_init_usb2_data().
- composite.c: stall CLEAR_FEATURE(BULK_MAX_PACKET_UPDATE) as it is not
  defined by the eUSB2v2 spec.
- cdnsp-mem.c: simplified HS bulk clamp logic, consistent with xhci-mem.c.
- Link to v1: https://patch.msgid.link/20260717-eusb2v2-packet-size-v1-0-67c611bd0c5b@cadence.com

---
Pawel Laszczak (3):
      usb: xhci: Add support for eUSB2v2 1024-byte bulk packet size
      usb: gadget: composite: Support eUSB2v2 bulk MPS update
      usb: cdns3: cdnsp: Enable eUSB2v2 1KB bulk packet capability

 drivers/usb/cdns3/cdnsp-ep0.c    |  2 ++
 drivers/usb/cdns3/cdnsp-gadget.c |  4 +++
 drivers/usb/cdns3/cdnsp-gadget.h |  8 +++++
 drivers/usb/cdns3/cdnsp-mem.c    |  9 ++++--
 drivers/usb/common/debug.c       |  2 ++
 drivers/usb/core/hub.c           | 16 ++++++++++
 drivers/usb/core/message.c       | 67 ++++++++++++++++++++++++++++++++++++++++
 drivers/usb/core/usb.h           |  2 ++
 drivers/usb/gadget/composite.c   | 28 ++++++++++++-----
 drivers/usb/host/xhci-mem.c      | 15 +++++++--
 drivers/usb/host/xhci.c          |  9 ++++++
 include/linux/usb.h              |  7 +++++
 include/linux/usb/gadget.h       |  4 +++
 13 files changed, 161 insertions(+), 12 deletions(-)
---
base-commit: 1d52b92ce8748624f84eca7eaea3ac31ed7b09a5
change-id: 20260609-eusb2v2-packet-size-4cb668455465

Best regards,
--  
Pawel Laszczak <pawell@cadence.com>


