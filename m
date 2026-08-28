Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFFA44CAF9;
	Fri, 28 Aug 2026 12:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920685; cv=none; b=Aat0Hf9iq9qpB9CTeLWyRV5+nSMSnmA35+6w9e4MKkTE5Vm0UEGgZLF/ANuy/xavxSxLtNKNE73W/rTymL3lKiRM7zaqxBxCM+D5LypwJ/beSHtUlvZ3vj7KcIYgJ2OG9UB7SadZe/WVTZbnXI9ABW6vs9TOP9WnHIcAvJt4TfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920685; c=relaxed/simple;
	bh=7pQpTq5IN5nNQXVBYSrc2iT7EUm4FhFeefaSgd6m7LI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O4hHAyy/IAMfWh7cHkAuIvlcgU9S8LZzJ+O+99s7BYI5pOlj1grG87zjiUYZneCtjWoyqXlq9qzWac3h6JCe5HhDJqXZVY7AFz6tFMTlZ27wNxq20X4uagAroQvI5b3kp5UTkGrS941njAuWGwgUo10Zu8dfimRrdYG5CaEakxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VWObOXTs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VWObOXTs"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1DD24C2BCF6;
	Fri, 28 Aug 2026 12:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787920682;
	bh=7pQpTq5IN5nNQXVBYSrc2iT7EUm4FhFeefaSgd6m7LI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VWObOXTsS0S/lxYVq/WQaeek0sFtgI7wOlsNoWrpeF348/qABHLNbMuUDmNn47GDY
	 jpSueXCmY1wAWNsrMgWcds05IY+tJxn1NxV9GPr9V3vjWbh1t2DlhqYFgPrQWwgCEE
	 mFN2gzKHUIlvWvykKVufIN9zIKkbKj0p832pCEQ+MhriV+ctCJSzyJieV6KDrRRR9D
	 nQANTATWL4LUh91dSqJz6OaTMowgdqEvHoSaFptEN3UTO/qrBE8mtXCQlxyxTcvRCe
	 v11J6WB0ztIB2GGOYkAGTcy5cQ3AOQVeQK7Urw9h6JbkVKW53wI7ob06Xn/3ZSjjDT
	 3bI2awAlIL+aA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C861C61DB9;
	Fri, 28 Aug 2026 12:38:02 +0000 (UTC)
From: Matt Eaton via B4 Relay <devnull+linux.divinehawk.com@kernel.org>
Date: Fri, 28 Aug 2026 14:37:56 +0200
Subject: [PATCH 2/2] usb: xhci-plat: add xhci-no-soft-retry-quirk device
 property
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-xhci-no-soft-retry-v1-2-b9c264b56601@divinehawk.com>
References: <20260828-xhci-no-soft-retry-v1-0-b9c264b56601@divinehawk.com>
In-Reply-To: <20260828-xhci-no-soft-retry-v1-0-b9c264b56601@divinehawk.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Matt Eaton <linux@divinehawk.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787920681; l=1564;
 i=linux@divinehawk.com; s=20260828; h=from:subject:message-id;
 bh=hre3DhXtEdMtBActPCAC6ChtUOOZ9DzGbOAgxtv43Gk=;
 b=XAbaNZQo5priU8H5STolVWtvAB0wfYM/0PrITDc5tHB9fDkQ4+lyydfBmcHBIOMcyT9qf2EkL
 raRHLj6xlj3DLGYY5Or4LjFYOureX42HUbMEc7/Yqx3RBz6V+id0N1G
X-Developer-Key: i=linux@divinehawk.com; a=ed25519;
 pk=UG4KnKXGwxjTNdirUPh/nySblET4aRxWYWSMTQwzlMw=
X-Endpoint-Received: by B4 Relay for linux@divinehawk.com/20260828 with
 auth_id=982
X-Original-From: Matt Eaton <linux@divinehawk.com>
Reply-To: linux@divinehawk.com

From: Matt Eaton <linux@divinehawk.com>

XHCI_NO_SOFT_RETRY exists for hosts that can't perform xHCI 1.0 Soft Retry
correctly, but it's only reachable from xhci-pci, matched against two AMD
Promontory PCI ids. Platform hosts have no way to ask for it.

Add it as a device property, the same way as quirk-broken-port-ped and its
neighbors. It's opt-in, so no existing platform is affected.

Needed for the Synopsys DWC3 on a Qualcomm IPQ4019, whose command ring
wedges when a Stop Endpoint command lands on a just-soft-retry-reset
endpoint -- exactly what unplugging a device mid-transfer triggers:

xhci-hcd xhci-hcd.1.auto: xHCI host not responding to stop endpoint command
xhci-hcd xhci-hcd.1.auto: xHCI host controller not responding, assume dead
xhci-hcd xhci-hcd.1.auto: HC died; cleaning up

Signed-off-by: Matt Eaton <linux@divinehawk.com>
---
 drivers/usb/host/xhci-plat.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 6fd595f81a30..22057493f935 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -265,6 +265,9 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 		if (device_property_read_bool(tmpdev, "quirk-broken-port-ped"))
 			xhci->quirks |= XHCI_BROKEN_PORT_PED;
 
+		if (device_property_read_bool(tmpdev, "xhci-no-soft-retry-quirk"))
+			xhci->quirks |= XHCI_NO_SOFT_RETRY;
+
 		if (device_property_read_bool(tmpdev, "xhci-sg-trb-cache-size-quirk"))
 			xhci->quirks |= XHCI_SG_TRB_CACHE_SIZE_QUIRK;
 

-- 
2.43.0


