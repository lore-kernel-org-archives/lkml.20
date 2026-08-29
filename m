Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C243C09E7;
	Sat, 29 Aug 2026 20:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788033856; cv=none; b=JmEw4UCiCCtFa5ZHGH33zI3es+8Q3XudvP0pwojW8OW1T9sVUjwn9XW6HfqTZKk2+/4AxQnelrG/JuKr7F2IVkoIf07zIJRd9p8vpRylGAe9C8ngnLM6PkockYEyZZNOP3/Iu5XMkWXw+NInn3TLlrj7yQeq7uIKi3BiYykw2b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788033856; c=relaxed/simple;
	bh=ZsVboOaElz1fshbAtApbyNEwQi9OTkk/MIHXqoY+l/w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=g6UVAyr6zrkBxnCCjY/wDZGSLehfBIdisDGpAZL19VMA60Gw33Lp8udw2eNwsf4n2l3BfL4CtteusAsA/cctsNoveWGFc8fPTW4hZnKW+yIRrVFaWPL3A69o46W964n4U7LtaPPGha3uP5fkF0mb1Tl3+q0o3tJ5fh7rSXSInM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WEVTs6x0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WEVTs6x0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ADC62C2BCB9;
	Sat, 29 Aug 2026 20:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788033855;
	bh=ZsVboOaElz1fshbAtApbyNEwQi9OTkk/MIHXqoY+l/w=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=WEVTs6x0oBPscuvfJ6y4nVLBIRunuYMJcMK8R/RPGYh3353NSngOihKyrMwkVYof9
	 gG6vMy6bAMGtZrjYFVLaAxQXpx/5gtjdBZWt6YlZJ4uqLF3luC8W5t43ArJaoZ7Hd7
	 YXhIoRPpXvYdXK+0dYV0SAGTU6ba60C6Sj24cb2z0AvNk/asHLaFktjyJOLG342H40
	 jHKCsAHJ04xln8WpiTKPJ2Li8G43Qoj+RilOOUgk/1cb4HbKU4/2SHeJ03y8IyCFrH
	 jHyQWdkOTHmLcxpwLeafcl/pH1upDQPApzgqIOoZ3RItgNKLi5kTqtoZE5ORgzDb6c
	 sKDxoKS4xnJNw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99946C61DDE;
	Sat, 29 Aug 2026 20:04:15 +0000 (UTC)
From: Matt Eaton via B4 Relay <devnull+linux.divinehawk.com@kernel.org>
Subject: [PATCH v2 0/3] usb: xhci: add xhci-no-soft-retry-quirk
Date: Sat, 29 Aug 2026 22:04:09 +0200
Message-Id: <20260829-xhci-no-soft-retry-v2-0-0efe22f1c2f8@divinehawk.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADk7k2oC/32NwQ6CMBAFf4X07JpSsYIn/8NwoO1iV2Nr2lohh
 H8X8O5xknnzJhYxEEZ2LiYWMFMk7xYQu4Jp27kbApmFmeBC8lrUMFhN4DxE3ycImMIIVddL3Ry
 MPhnBluErYE/DFr22P45vdUed1tJqWIrJh3F7zeXq/T3IJXBQjRayUkcpeXkxlMmh7T6PvfZP1
 s7z/AUq87jjywAAAA==
X-Change-ID: 20260828-xhci-no-soft-retry-4af6c93dc7d2
To: Mathias Nyman <mathias.nyman@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Matt Eaton <linux@divinehawk.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788033855; l=2142;
 i=linux@divinehawk.com; s=20260828; h=from:subject:message-id;
 bh=ZsVboOaElz1fshbAtApbyNEwQi9OTkk/MIHXqoY+l/w=;
 b=pJ9FzabRTijMqGGViWZE3UpnKnL2rty/NfNQ6n0yRb4LvaTCcZ1zQX4fU19Zvj9p/TnVWlV9s
 1a2gOXPpJ6mBWLfPEwKEMNCDXlnLZgMXDIDJvEFMYKdFZiedcdHX0tl
X-Developer-Key: i=linux@divinehawk.com; a=ed25519;
 pk=UG4KnKXGwxjTNdirUPh/nySblET4aRxWYWSMTQwzlMw=
X-Endpoint-Received: by B4 Relay for linux@divinehawk.com/20260828 with
 auth_id=982
X-Original-From: Matt Eaton <linux@divinehawk.com>
Reply-To: linux@divinehawk.com

The dwc3 instances on Qualcomm IPQ4019 mishandle xHCI 1.0 Soft Retry. A
Stop Endpoint command landing on a just-soft-retry-reset endpoint wedges
the command ring, and the stop-endpoint watchdog kills the host five
seconds later. Reproducible by unplugging a USB-tethered phone
mid-transfer; the port stays dead until the platform device is rebound.

XHCI_NO_SOFT_RETRY already exists for this class of defect but is only
reachable from xhci-pci, matched against two AMD Promontory PCI ids.

Patch 1 adds a device property so platform hosts can request it. Patch 2
carries it through the dwc3 core as a software property. Patch 3 sets it
from the qcom glue on the SoC compatible.

The match entry in patch 3 has no effect until the ipq4019 devicetree
moves to the qcom,snps-dwc3 glue, sent separately:
https://lore.kernel.org/r/20260829-ipq4019-dwc3-migration-v1-0-cc66b54ce21c@divinehawk.com

This series applies and builds independently of that.

Tested on a Ubiquiti UniFi Travel Router.

Signed-off-by: Matt Eaton <linux@divinehawk.com>
---
Changes in v2:
- Drop the dt-bindings patch; Krzysztof pointed out this is implied by
  compatible and shouldn't be a devicetree property.
- Set the quirk from the dwc3 core instead, via a new dwc3_properties
  field carried as match data in the qcom glue, per Thinh's review.
- Link to v1: https://lore.kernel.org/r/20260828-xhci-no-soft-retry-v1-0-b9c264b56601@divinehawk.com

---
Matt Eaton (3):
      usb: xhci-plat: add xhci-no-soft-retry-quirk device property
      usb: dwc3: add xhci_no_soft_retry software property
      usb: dwc3: qcom: set xhci_no_soft_retry for IPQ4019

 drivers/usb/dwc3/core.c      |  3 +++
 drivers/usb/dwc3/core.h      |  3 +++
 drivers/usb/dwc3/dwc3-qcom.c | 17 ++++++++++++++++-
 drivers/usb/dwc3/glue.h      |  3 +++
 drivers/usb/dwc3/host.c      |  5 ++++-
 drivers/usb/host/xhci-plat.c |  3 +++
 6 files changed, 32 insertions(+), 2 deletions(-)
---
base-commit: 45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
change-id: 20260828-xhci-no-soft-retry-4af6c93dc7d2

Best regards,
--  
Matt Eaton <linux@divinehawk.com>


