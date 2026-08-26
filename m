Received: from sender5-op-o10.zoho.com (sender5-op-o10.zoho.com [165.173.182.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAD84195D0;
	Wed, 26 Aug 2026 12:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747947; cv=pass; b=rz816DpNfekuC5Lv8U1LlOW9pPdfu2s0lMNcVqlEhyJ09Gt5L1zLu4wK9V2lnvGsjY3MoCyAgCIYD8PRvfYUCXwp5vDnhmMwr+dZXVS7HzIB5qiQx4f4dvWauHTPFzq7qnLUFGTtBFHm7xGl/bflT7uX3rmGhsSg3ypMsEemhKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747947; c=relaxed/simple;
	bh=WAH/IWGJ1P1pHZ1uMs3WmkE2EyoCsZulgPXwqmlgzJw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pUCU9y6peHZ/jITXnGp7mRFuxHLa4dc1ywjUjlRVPaZZpREMhdscJIncK1WnHSKxKGpQeHEie1yNjeKVw20by/f1T8AcHE+Ii2LAmjIJ45kH2qQoA4ahxkDSmEJmzrItE+6fEe9FKZi26athj/P1EUaiBCQ2KMFr/LBE1i40eb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=julien.massot@collabora.com header.b=d73NUhrz; arc=pass smtp.client-ip=165.173.182.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=julien.massot@collabora.com header.b="d73NUhrz"
ARC-Seal: i=1; a=rsa-sha256; t=1787747926; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RKvlhSQ0LEetCMqCvqo0SnBumedX4ssqi6ualadSdzsINo9iryzBkWjvIdfguRl5wOdg1rM15NSJdV+91k9MzfsvFoem2a1kRfZmNISjgV5kdaE/2sTmZyTBSUKJfo4WFGhW8DpWUKDRtqh/TQwvE573WbFngMctej/zCmJSaDo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787747926; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4VNRIRwrupYIAqU3PUGZ+qcZDEH/zxwlIYina8BYFxE=; 
	b=KVFYRYL8lmngSAAG5km0IHXZH8crWnuA1xv3B2kKSfgyVRRL3tqTJXNQZO7nPKLiVoF05FAjQqRH9f+TweAV7Fe+ztT9yvl74+iLbGCN7SzLCieI8haAmXjaEriJyjLgWgiY08B5uaAUMdTxJBHDutsiC9DzuEj6vdqL1AHcyRI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=julien.massot@collabora.com;
	dmarc=pass header.from=<julien.massot@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787747926;
	s=zohomail; d=collabora.com; i=julien.massot@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=4VNRIRwrupYIAqU3PUGZ+qcZDEH/zxwlIYina8BYFxE=;
	b=d73NUhrzD184xtUmtWi2woq+BFJ96RXrYl7/5sliGkmb1j3l4UodVG8BMtYFBS3l
	o2Q5sUdeZISsW4B2n10seqVfkQiGzdas9AVIWwPOHNijsAK0p1yYvNMxQiFY1x0TFP/
	S9eMWCFY23ITlPqBnLaMkDENSfT9S5/b0n5pefMw=
Received: by mx.zohomail.com with SMTPS id 1787747923990903.3768202978625;
	Wed, 26 Aug 2026 05:38:43 -0700 (PDT)
From: Julien Massot <julien.massot@collabora.com>
Subject: [PATCH 0/2] phy: mediatek: xsphy: add eUSB2 repeater support for
 USB2 ports
Date: Wed, 26 Aug 2026 14:38:34 +0200
Message-Id: <20260826-mtk-usb2-repeater-usb2-v1-0-e8e48e2fd6d8@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMzQpAQBSG4VvRWZtiypBbkcWM+XCSn84gJfduY
 vks3vemAGEEqpObBCcHXpeIPE2oG+0yQLGPJp1pk1XaqHmf1BGcVoINdof8Kn3hrDe271BRjDd
 Bz9c3btrneQGf/QQvaAAAAA==
X-Change-ID: 20260826-mtk-usb2-repeater-usb2-7d5bad6afce8
To: kernel@collabora.com, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.3
X-ZohoMailClient: External

Some USB2 PHY ports are connected to an external eUSB2 repeater chip
that sits between the PHY and the USB connector. To support such
configurations, this series adds an optional phys property to the
MediaTek xsphy port sub-node and integrates the repeater into the USB2
PHY init, exit and mode handling.

The binding follows the same pattern as the Synopsys eUSB2 PHY, which
already uses a phys property at the sub-node level to reference an
external repeater. The driver change similarly manages the repeater PHY
alongside the MediaTek USB2 PHY.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
Julien Massot (2):
      dt-bindings: phy: mediatek,xsphy: add optional repeater phys property
      phy: mediatek: xsphy: add optional repeater support for USB2 ports

 .../devicetree/bindings/phy/mediatek,xsphy.yaml    |  5 +++++
 drivers/phy/mediatek/phy-mtk-xsphy.c               | 26 ++++++++++++++++++++--
 2 files changed, 29 insertions(+), 2 deletions(-)
---
base-commit: 917df6be58562d024374b4076e6e7618876a0c4a
change-id: 20260826-mtk-usb2-repeater-usb2-7d5bad6afce8

Best regards,
-- 
Julien Massot <julien.massot@collabora.com>

