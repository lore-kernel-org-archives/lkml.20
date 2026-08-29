Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A3C34D385;
	Sat, 29 Aug 2026 20:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788033856; cv=none; b=r0mpYgA7sRMxRHYSJJpeLyXotnBUEm/ZEpqouT5qu1ry4xU7JTnkJgJLLmv12Xpdqy5p5pSbBnn/ib0W+p2Oiu+MFMBLl9JzgP8fYplSsfAv+I6x5TH105oBAHI4zSUa4OEEjiLRBXmGoDgVjl+7WIQ/pFFFaoo6WoWPvJsDS+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788033856; c=relaxed/simple;
	bh=FYZUkiayk8FSKLRGUeQFizJ94OBzZE0rlrAlHtsWJJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K2zID/UQMWISWFR3UAXl4PduUnaXEFQmKUxkMzttysWX0k2N3LKkoxsOA8KuQC0NxkWXZ0Q+JTbPbTx1V8KuEzwQRPQijsw3MA97cnb4Q/7woe6n7iaf/iEH3Eh6oxRAiRchhfuHOKKEm8LYC7Op4JgRyRza2OBq9kchuRHH1cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DJl74Lyd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DJl74Lyd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBEAAC2BCF7;
	Sat, 29 Aug 2026 20:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788033855;
	bh=FYZUkiayk8FSKLRGUeQFizJ94OBzZE0rlrAlHtsWJJ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DJl74Lydp4TMFOgkuIBZNNUQxEYcqYHjNndbwthKHoRVHpsJbNP1iBn2Gzj8ED8pg
	 88MxN0BWbf9WKkNJh3/hlSBw0erbQZ9YXa+cB2zP78LImJ65X2ljzX5o7Nfn7cRIVd
	 xU70WcubDRkU040xF+xLtdqpoCRPH+ckZ9S7ES1UYDhOrWtjZIojMcc2lFNpoVIS/h
	 xRfbRznUXp8m+3I1JLgkfyjke+wgfN5Pd9CZAI8gLW07j9kWmxLlDXuLToobfVv56a
	 L4q7kp0MbeqyVAfV89lI/nZ8HMtY/Vl0QrIXxt8aaiaTjzNrljwvDPBcR+7ehyqcOf
	 AJGpo3WsiE75Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E37C61DD6;
	Sat, 29 Aug 2026 20:04:15 +0000 (UTC)
From: Matt Eaton via B4 Relay <devnull+linux.divinehawk.com@kernel.org>
Date: Sat, 29 Aug 2026 22:04:10 +0200
Subject: [PATCH v2 1/3] usb: xhci-plat: add xhci-no-soft-retry-quirk device
 property
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-xhci-no-soft-retry-v2-1-0efe22f1c2f8@divinehawk.com>
References: <20260829-xhci-no-soft-retry-v2-0-0efe22f1c2f8@divinehawk.com>
In-Reply-To: <20260829-xhci-no-soft-retry-v2-0-0efe22f1c2f8@divinehawk.com>
To: Mathias Nyman <mathias.nyman@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Matt Eaton <linux@divinehawk.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788033855; l=1705;
 i=linux@divinehawk.com; s=20260828; h=from:subject:message-id;
 bh=sndU+dSNuXWaAlu2q681N0vXtGCZqmqdL+gk7E3DkYk=;
 b=iB+7Y0HLPV/GYjwgVDDm98ttHlP+n3feG+H7hEhJkQyckhQz4E8J+ASxtS/m0VtTw+blvc8sO
 RR7qWGIqCtzBzJPs2N2qQoP9PiUlTgjYyhkxYPVpvYU2r2tfJ0Xb8gU
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

Add it as a device property, read in the same parent-walk block as
quirk-broken-port-ped and its neighbors. It's opt-in, so no existing
platform is affected. The following patches set it from the dwc3 core
on behalf of hardware known to need it, rather than from devicetree.

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


