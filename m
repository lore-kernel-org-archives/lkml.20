Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7623451CC;
	Sun,  6 Sep 2026 20:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.39.247.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788725755; cv=none; b=ePOBSttS73K6iyzMP4ihqMFWD/bDbB9KzOIExjqURjCMre45lYGD57oVHrCi+M3i5kRx+X++8YVAMfZgwIST2Cek5LPdeQX2NCUtBkTKIcR5X2cSIolYaHbqOKJ7V1TtL5jbsY2h7dxtq5NoGi47Bw6JIciIrnqLQJGXMULy/04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788725755; c=relaxed/simple;
	bh=evQvQKxTfBO32mWnk7w0e8v8dzvMwyx0OZc1iWlZ54E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NMg0d/X+zSj7MpRRDPcrRiz5gKyVLNdig6JYcUCUV0zmFCvC5n4q1kAEdJWQbLYbgPc1pCq2aJf0/wef02I+s4Kb81Jp53GffMo4iHAMxPXy6epcUyYBuTeHhMbjAOgGqG5AZUeKtfYGGxNMBWE2dteXOcbQVHdr14/x7AODsOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev; spf=pass smtp.mailfrom=cyberchaos.dev; dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b=fD3ba7N2; arc=none smtp.client-ip=195.39.247.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b="fD3ba7N2"
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1788725745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/GbIwS69Z+7EmfwRnslAiweTO6LWu4/b5K4KmWKEcGk=;
	b=fD3ba7N2rfFxisDxO0mPhyFUZiCVuiw/kLXpRuVxj6fsS8ZgLrItrERf2cCYfcQcg6wZTr
	PTlI+9hliSfvoJnaGLWLNXTwNjJi1aGDB+7Tq6fBl9WrlgFQ/nhnJ/7onSxCZpiKujxtFu
	lTfR2xwfz3jCkrTY+fVBsVZR2+xMu58=
Subject: [PATCH v2 0/2] nvme: apple: add t8132 (M4) ANS2 NVMe support
Date: Sun, 06 Sep 2026 22:15:28 +0200
Message-Id: <20260906-apple-nvme-t8132-v2-0-ac0328590823@cyberchaos.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WPyw6CMBBFf4XM2iG0VQRW/odhUcogNfKwLY2E8
 O8WcOvyJOfeubOAJaPJQhEtYMhrq4c+AD9FoFrZPwh1HRh4wtMkYwzlOL4Ie98RuowJjoKJPK/
 TJmNSQoiNhhr92Svv5cF2qp6k3NbzMwy9p3DLHRpU0hKqoeu0KyJ/jQUaxWBLt9q6wcz7Ps92+
 f8UzzDBLL1UJDiduRI3NVdkwiODjWvyUK7r+gVsUeG08wAAAA==
X-Change-ID: 20260811-apple-nvme-t8132-31399d6f81aa
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Keith Busch <kbusch@kernel.org>, 
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-nvme@lists.infradead.org, Yureka Lilian <yureka@cyberchaos.dev>

This patch series adds dt-bindings and driver support for ANS2 NVMe on
the Apple t8132 (M4) SoC.

This variant requires the IO queues to be registered using additional
MMIO writes. Otherwise it is largerly the same as the ANS2 NVMe variants
present on Apple M1-M3 SoCs.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
Changes in v2:
- Reverted the separate_nvmmu_base part, since reg[9] from the Apple
  device tree works for both nvme and nvmmu regs.
- Differentiate the meaning of mmio_nvme+0x1210 between t8103 and t8132
  resolves an ANS crash caused by the IO completion queue size mismatching
  between our data structures (64) and the ANS (65).
- Link to v1: https://patch.msgid.link/20260811-apple-nvme-t8132-v1-0-865be32e42c3@cyberchaos.dev

To: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>
To: Neal Gompa <neal@gompa.dev>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Keith Busch <kbusch@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-nvme@lists.infradead.org
models: On t8132 this now sets the IO queue sizes and is 0-based. This

---
Yureka Lilian (2):
      dt-bindings: nvme: Add apple,t8132-nvme-ans2 compatible
      nvme: apple: add t8132 (M4) ANS2 NVMe support

 .../devicetree/bindings/nvme/apple,nvme-ans.yaml   |  1 +
 drivers/nvme/host/apple.c                          | 39 +++++++++++++++++++---
 2 files changed, 36 insertions(+), 4 deletions(-)
---
base-commit: e5e04726cdd043e309677071ab1b65a4b18f422b
change-id: 20260811-apple-nvme-t8132-31399d6f81aa

Best regards,
--  
Yureka Lilian <yureka@cyberchaos.dev>

