Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69090535FD4;
	Tue, 22 Sep 2026 10:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073403; cv=none; b=RxQ+H3DmW3T9fSfCXQQ1m0gcMOd7AmM1PWigJNAqf8/DQEUsBjq2/zseEM0zTPDgVzW0sg2C913gQ6IzO66CAAZEsyVMi+aK8lKPj6kf+qsBSmLdJJQzsknZdhYG7fAbxPh3CLpYU9QBZkfzQP3PYeosMHiRmVWYc0b+6MZkIxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073403; c=relaxed/simple;
	bh=XebCtYDXuoeTQItvr9tTkpbN8O4ztzoOG5eWaY6dSNg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FpwekzujF2tzg0Pf8zOimDxmK39pMFzEpctGezexXQQhr6eZ4lQreCy3brYbz5wkQ1s6C4ilFDllRjeyh7jQAsjFawZBaKys8i7hF174BU3ivj3VmtEyJm++lKLp4149T5cxBGSQ4Mrwp4SH4rhgoOcNHkUxtI9g4KYdB04etoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l9HbV/Fd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l9HbV/Fd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD4D3C2BCF7;
	Tue, 22 Sep 2026 10:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790073402;
	bh=XebCtYDXuoeTQItvr9tTkpbN8O4ztzoOG5eWaY6dSNg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=l9HbV/FdpfDd0ukKdohkenppwHzDv/Fm1WJBdgaSFjAZgYA55bZOdiAUnDMTdwidY
	 f8sDiC5qf52Hf9szCSs8uuzM32RkBxEMCjA5CmrVSufKRgSAmV1cdicNVQtUwFAByP
	 EPJaSzEVybDTgt47KFEojtmwmKKfcj8WLkALuoRC+K6eDmoIrRPrypS8GmZfrT47nD
	 giMtFYo32abjvmDtNWQESj2emfMhKgbDvYc/2MkruLRdl48z6FqtwVaQj9d52E0Q8s
	 qDhBMk4cG2xDAGhvAtFaoGkeV7nHq+b0omv2yjfpj3bkPM+NmNKmVg5dvaeeQ5sWsu
	 1/66glpcarzoA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F81C98302;
	Tue, 22 Sep 2026 10:36:42 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH v2 0/3] usb: mtu3: add mt6595 support
Date: Tue, 22 Sep 2026 13:36:39 +0300
Message-Id: <20260922-6595-mtu3-v2-0-71203a362b36@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02NSwqDMBQAryJv3ZQkxu+q9yguYnytr1QjSZQW8
 e41lkKXA8PMCh4doYc6WcHhQp7suIM8JWB6Pd6RUbczSC5zXgnF8qzK2BDmlJWyTbkqUQnUsPu
 Twxu9jta1+bKf2weaEAPR6MkH697HbBHR+3WLv+4iGGdatrowMuVdXl4mZ4MdB03Ps7EDNNu2f
 QD9ZHESuQAAAA==
X-Change-ID: 20260914-6595-mtu3-82b3048e41ea
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790073400; l=1822;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=XebCtYDXuoeTQItvr9tTkpbN8O4ztzoOG5eWaY6dSNg=;
 b=PVlzxA/nJQVDJMcS5/bXyZczb92MQbRfoA5S715QQ1oDDBYHcsuMEjsJ+VCAJFykdYysL9sP3
 F2x3PmMEdL3CoRinaUzEAqY2tym6VYl1ePfylSede39esbDYAeVtfXc
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

This patch series adds mt6595 SoC support to the mtu3 driver.

Unlike the mt8173 and newer controllers, the 6595 uses older IP revision
that can handle only one FIFO slot. Without this series, the current
driver implementation results in 2 to 4 lost bytes on USB transfers.

In mediatek sources, mt6595 is sometimes called 6795. Most of their
clocks/pins are also compatible. It's not clear if 6795 has the same
issue or simply lacks T-PHY patch. Other (rare) mobile SoCs with mtu3,
like mt6757 or 6771, don't need this series.

Another thing worth mentioning, this series is not enough for the USB on
6595. The other T-PHY patch is required to get the link up. This issue
has been observed on some 65xx and most 67xx SoCs. Though this is a
subject for the separate discussion.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
Changes in v2:
- Reword patch 2 commit title
- single_slot -> fifo_single_slot naming
- Drop redundant platform data check
- Link to v1: https://patch.msgid.link/20260917-6595-mtu3-v1-0-a2ba7c230d68@protonmail.com

---
Roman Vivchar (3):
      dt-bindings: usb: mtu3: add mt6595
      usb: mtu3: add SoC platform data for FIFO quirk handling
      usb: mtu3: add mt6595 support

 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml |  1 +
 drivers/usb/mtu3/mtu3.h                                  |  9 +++++++++
 drivers/usb/mtu3/mtu3_core.c                             |  3 +++
 drivers/usb/mtu3/mtu3_gadget.c                           |  8 ++++++--
 drivers/usb/mtu3/mtu3_plat.c                             | 13 +++++++++++--
 5 files changed, 30 insertions(+), 4 deletions(-)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260914-6595-mtu3-82b3048e41ea

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>


