Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A84637C936;
	Mon,  5 Oct 2026 07:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791187048; cv=none; b=iVWsy2I18pIJdQfJku+NTued+1FzshQIpcElZjEi0FtHG7muR7Cb5sqEk8UfGnYX1uqoirHXweq07/PlL4+5gYBMexU2ts7pEtmkrxvnBOpuI88ipPUDd6d9xyg16RIv0Xt4fbR4EX6C0qsD3LpameBxhdb0wkuGHOjlrvgMUng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791187048; c=relaxed/simple;
	bh=XJ43BI9VFUSRx8MVKu/7AuJD4tr7EI9+wQIfvS3p4JE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kKAOfOV7AZrH/VVESZx85DgN+3eT4FbFwynAPqboQDhzO8ViAlwwm3ZEm+m81ezsVpBR4gtEdoefyAAA+s90fYmU9mgn40OotOjmEzvutUKytuo4fc7Gzy7L+5juiVZpdvGeQ0Pv1hxHmKZx3ZL+6AYgj/eyMX9SvCt7Rex22ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I5T82I+G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I5T82I+G"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2BE9C2BCC7;
	Mon,  5 Oct 2026 07:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791187047;
	bh=XJ43BI9VFUSRx8MVKu/7AuJD4tr7EI9+wQIfvS3p4JE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=I5T82I+GpS372PbSUYsbfObuBgWffyvba6pum+T9rzXF7657IgFusQR2v2qaml9Pl
	 VyRXz5fnLyPnu+ZGXa+uFbhZr6C1ofaxq2JCddolF2tIECOA8uQQXKo8hwfncHipPS
	 kY+Qa+k+UQnJAFFSgehC30I6PTeBFYrXgKcpi4n+xNJYN62ByeWcZk9WR/av1hRqnU
	 mxfQewBLhWntNrxOh2mt/86B3GyyUtJFUQv+MiWSNTEx86bSRg8rFR1o4zDw/TugiC
	 npUgiYcmGaQ5FXjbPyX9tjcn/TmlXGdBiCPFBEHFTFkKHNkz8GjT8mD7cVZi3GrgQI
	 H1ZPd8u2s0gUw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA12CA5FF0;
	Mon,  5 Oct 2026 07:57:27 +0000 (UTC)
From: Pawel Laszczak via B4 Relay <devnull+pawell.cadence.com@kernel.org>
Subject: [PATCH v3 0/3] usb: Add support for eUSB2v2 1024-byte Bulk
 MaxPacketSize
Date: Mon, 05 Oct 2026 10:18:23 +0200
Message-Id: <20261005-eusb2v2-packet-size-v3-0-fde610a3c47a@cadence.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE9dw2oC/22NQQ6CMBQFr0K6tqYttIAr72Fc0M+vVCMQCo1Ku
 LstLIwJy0nem5mJw8GiI6dkJgN662zXBkgPCYGmam9IbR2YCCYUU6ykODktvKB9BQ8cqbMfpBl
 opYpMykxJEp79gMa+VuvlurGb9B1hjKq4aKwbu+G9Zj2Pu62Q83y34DllVOWgONc1A6nPUNXYA
 h6he5LY8OJnKYTat4hgKSUzvDRpgYb9W5Zl+QLyLe87EAEAAA==
X-Change-ID: 20260609-eusb2v2-packet-size-4cb668455465
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pawel Laszczak <pawell@cadence.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791188311; l=5323;
 i=pawell@cadence.com; h=from:subject:message-id;
 bh=XJ43BI9VFUSRx8MVKu/7AuJD4tr7EI9+wQIfvS3p4JE=;
 b=ggmN0eyLfU/Ud+FiOZJYPCcgjkuaINQnqs9BVCwnn3ePycjSTIx80pzlbRcqxuUfMztwtqNXx
 bwtwdfAKt5ICZ42TwYaoBrXHu2yewJ9kQSUp06IPLLRrx273Fop+MW6
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
 drivers/usb/cdns3/cdnsp-mem.c    |  9 +++--
 drivers/usb/common/debug.c       |  2 ++
 drivers/usb/core/hub.c           | 16 +++++++++
 drivers/usb/core/message.c       | 74 ++++++++++++++++++++++++++++++++++++++++
 drivers/usb/core/usb.h           |  2 ++
 drivers/usb/gadget/composite.c   | 28 +++++++++++----
 drivers/usb/host/xhci-mem.c      | 15 ++++++--
 drivers/usb/host/xhci.c          | 10 ++++++
 include/linux/usb.h              |  7 ++++
 include/linux/usb/gadget.h       |  4 +++
 13 files changed, 169 insertions(+), 12 deletions(-)
---
base-commit: 1d52b92ce8748624f84eca7eaea3ac31ed7b09a5
change-id: 20260609-eusb2v2-packet-size-4cb668455465

Best regards,
--  
Pawel Laszczak <pawell@cadence.com>


