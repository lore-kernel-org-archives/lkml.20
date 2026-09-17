Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F683BE15F;
	Thu, 17 Sep 2026 07:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789630387; cv=none; b=BIm4R3nnUA6pmJLZ3OAK2Nutue69IUn1vNviZ5vuVKaEakQwAwx6pLJXbuMa/uVU7hoPbidSqFqKcd3ddOM/up2PBObyyUHMBPsidC2k+GuC+5fPbg87mnS44i89i8NpE2wcJgGNDjck0Zqd585ijWoRj8MVGJcUXAGZ9RdzUd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789630387; c=relaxed/simple;
	bh=kCGe432I3vUAjPVT/CDhk2BJ7I2g/1ANQbFVz8sSuQE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=j/7tkifsDrLJ5VR5zCOjwcfXsi7OqLydGAsJHCJuFTteaMsGuI3wVvdUKyOFUGp7n8MTEviGWpmJTPVenoTF/8+HT/HzojINHTBCv7l2ei5SycaXzMvxFBUd7jSElDbvfCvfHIPucZaNu+YZB3kwkHGpA6mjWuqRlmXDpuIZQ1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e9RG6W39; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e9RG6W39"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 869E8C2BCB3;
	Thu, 17 Sep 2026 07:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789630386;
	bh=kCGe432I3vUAjPVT/CDhk2BJ7I2g/1ANQbFVz8sSuQE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=e9RG6W39F/ChoDywq3OlS4M/+tGfgwJ5ykgfkA/r+2hJRVF1K3RJCrXBWfqSTdGkm
	 +WGFNg5NZD6kHi1WcKtDBLcH6RHv0CWWXqVoMs4Tbudebw8iGvFSqTc4EdQCwekPzd
	 TMxnNQFkdlnqYj0H+Sz67aJwLJM+fjuljS9DtgWcZ4DbOJJ40O+qrEYWrJENseTTY2
	 TBWEEXSLfNnX7BaSD3rwckX9YeGciOq0hIZAtzSP/6BvuVOnYgraXNlRXOlcZHJyN4
	 5J6F6IYZGtAg1boDIhZl9iYriuIALtCwgTlnC6zWAzYfdX4JB/zO1UB5y8RcsPgkHu
	 n/+vE+PTJ4X5g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC1FC88E72;
	Thu, 17 Sep 2026 07:33:06 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH 0/3] usb: mtu3: add mt6595 support
Date: Thu, 17 Sep 2026 10:32:05 +0300
Message-Id: <20260917-6595-mtu3-v1-0-a2ba7c230d68@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqAIBBA4avErBPULLSrRIusqSboB60IpLtnt
 fzg8QJ4dIQeyiSAw5M8rUuESBNox2YZkFEXDZLLghuhWJGbnM37kTEtbcaVRiWwgdhvDnu6vld
 V//aHnbDd3wHc9wMhjh8EbQAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789630384; l=1576;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=kCGe432I3vUAjPVT/CDhk2BJ7I2g/1ANQbFVz8sSuQE=;
 b=SK94WZQmS3o4qVCAnmSDclmJHkwsENMKm+EEpEt8QvpZSjti1zoCWDWIKMJF+GPynY+AcVlH/
 cPyiI0kR0qtDzf2zOIYRjweNjn6v0N8q4QyKjzYCLiFgBSTiY8Tp6P0
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
Roman Vivchar (3):
      dt-bindings: usb: mtu3: add mt6595
      usb: mtu3: introduce platform data
      usb: mtu3: add mt6595 support

 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml |  1 +
 drivers/usb/mtu3/mtu3.h                                  |  9 +++++++++
 drivers/usb/mtu3/mtu3_core.c                             |  5 +++++
 drivers/usb/mtu3/mtu3_gadget.c                           |  8 ++++++--
 drivers/usb/mtu3/mtu3_plat.c                             | 13 +++++++++++--
 5 files changed, 32 insertions(+), 4 deletions(-)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260914-6595-mtu3-82b3048e41ea

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>


