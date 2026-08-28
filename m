Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13A644CAE6;
	Fri, 28 Aug 2026 12:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920685; cv=none; b=ZLpI8nxoG5TCYo52m1PBSZFFfhwL039V/rtNDehU6CBvWlUIK6fRJBC/8d8BM6ZMxSICs4gGJZVINst57o89lZU4YLTHSgS9BcmOqOArOR5hIRzcCj2FnZ9R4UxqMuL7M6QpL3YKQnYHuQCyMvGZIY14jwUaxaHfunPrLYe1zho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920685; c=relaxed/simple;
	bh=zT+ccwsVbDtmhy4mHNgwYuK8CPx9UNRBC8oZGrS4HfM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OAGiDJsJQUH0Lx7fq49L2Spw0pu2Zq341J3p8ETGLoEQdaNY0iHmFjV+EPhDKLXwMtPwZx0PGjggrco/ItvD+gShogY1BOh0bsO2QiQaLOMFZG8dC6yhRYGvMrQqXciDRrVyGomUTSJ2IasYutFjw3N0SHWJNy8000OVC+AaWSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FBiYH2sJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FBiYH2sJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F15FDC2BCC7;
	Fri, 28 Aug 2026 12:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787920682;
	bh=zT+ccwsVbDtmhy4mHNgwYuK8CPx9UNRBC8oZGrS4HfM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=FBiYH2sJGx6+6E+NUgT0rFxDv36zc2WDUOVaG5lV+t57dtW8VvO6j4XLR2/RiYO8m
	 MXxaKiynh7fu+c8EMqzp9wGgYAAbWrTY3iTFXnE7a4eBymzHkJ4xkwl4/cuAbwIOMy
	 0JK4H7rUgwjNr3leFvbZ/iSIzhDLEr59rGIfHGV9VMOP41leNY0Nvb/xinR7C8SGJ2
	 1gRo7BrSV3+BUswFK8oYolsRKmMMklb7qpY6arKN9d4xH3WeFxkkmzPBg6QHPw+ZAV
	 9GTy0B5/NesyyyPHOYOKaosjTkRMtoEXMt//YqwwqT/BWzRM0Mkxw7sehA0fsLC8kx
	 tUPdULp5W+Bsw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEFDBC61DBD;
	Fri, 28 Aug 2026 12:38:01 +0000 (UTC)
From: Matt Eaton via B4 Relay <devnull+linux.divinehawk.com@kernel.org>
Subject: [PATCH 0/2] usb: xhci: add xhci-no-soft-retry-quirk
Date: Fri, 28 Aug 2026 14:37:54 +0200
Message-Id: <20260828-xhci-no-soft-retry-v1-0-b9c264b56601@divinehawk.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACKBkWoC/yXMwQ6CMAyA4VchPdsEpwH0VYwH6Dooh82000AI7
 +6U43f4/w2MVdjgXm2g/BGTFAvOpwpo6uPIKL4YXO2aunMdLhMJxoSWQkblrCte+9DQ7eKp9Q5
 K+FIOsvynj+dhew8zU/6dYN+/xQH0bHYAAAA=
X-Change-ID: 20260828-xhci-no-soft-retry-4af6c93dc7d2
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Matt Eaton <linux@divinehawk.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787920681; l=1395;
 i=linux@divinehawk.com; s=20260828; h=from:subject:message-id;
 bh=zT+ccwsVbDtmhy4mHNgwYuK8CPx9UNRBC8oZGrS4HfM=;
 b=Gia0aSsr++SsY5Pr7hEjjZEnaNMwgsU1wIyG7TA4uR/9knq0iYiuHDVPzlTXWMTFIqvZFnDkr
 TyjBMHoIEwBC6RUXZJN+UXWPiNo8r4vRWPuP3rFtltfnFolE5XGQcD1
X-Developer-Key: i=linux@divinehawk.com; a=ed25519;
 pk=UG4KnKXGwxjTNdirUPh/nySblET4aRxWYWSMTQwzlMw=
X-Endpoint-Received: by B4 Relay for linux@divinehawk.com/20260828 with
 auth_id=982
X-Original-From: Matt Eaton <linux@divinehawk.com>
Reply-To: linux@divinehawk.com

This series adds an opt-in device property so platform xHCI hosts can
request the XHCI_NO_SOFT_RETRY quirk, currently only reachable from
xhci-pci matched against two AMD Promontory PCI ids.

Motivating case: the Synopsys DWC3 xHCI instances on Qualcomm IPQ4019
mishandle xHCI 1.0 Soft Retry. A Stop Endpoint command landing on a
just-soft-retry-reset endpoint wedges the command ring; the
stop-endpoint watchdog then kills the host five seconds later. Setting
the property falls back to the pre-Soft-Retry recovery path (full
endpoint reset), which the vendor's 4.4 kernel uses unconditionally
and which is well tolerated on this hardware.

Patch 1 documents the property. Patch 2 wires it into xhci-plat.c.

The devicetree change enabling this on IPQ4019 is being sent
separately to linux-arm-msm, since this series only adds the
mechanism.

Signed-off-by: Matt Eaton <linux@divinehawk.com>
---
Matt Eaton (2):
      dt-bindings: usb: xhci: add xhci-no-soft-retry-quirk
      usb: xhci-plat: add xhci-no-soft-retry-quirk device property

 Documentation/devicetree/bindings/usb/usb-xhci.yaml | 4 ++++
 drivers/usb/host/xhci-plat.c                        | 3 +++
 2 files changed, 7 insertions(+)
---
base-commit: 45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
change-id: 20260828-xhci-no-soft-retry-4af6c93dc7d2

Best regards,
--  
Matt Eaton <linux@divinehawk.com>


