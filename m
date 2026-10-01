Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCBF47B432;
	Thu,  1 Oct 2026 20:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790886931; cv=none; b=iiryoxIjTbSVi859LxsTIpGsGZeSKa/L1uLRtT0aBOryHOzq5X7Sy4owYfUni6ePIuLbJL60MY+1Oc4TWa7Ca3LyoTBT3Kjp1+t71R2V7qNR/qCgA6726HHqo1os7CcMiyMvYOVzLSyXdJgvVqeEda67psANEh2jRP5lxTk+G7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790886931; c=relaxed/simple;
	bh=s/CySsdC5G6TeidNg99K1zBN/eh7iI0dzxg8QUI8iao=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dFFXC7e9LUe7/hrjMmq5IRZGhKJ/J2pL1MMZ2eKulIxM6RsJObMYbLlbEPAjyfdMXR5R0yZeL8m8GezEaKvhRHYfAfGwO6ng/4BbIXhMWGax2EnqN13lIKZ7sQVT6nEOB0Q5LsAEc0oSRv/F1SAVzoM32gIMkQuU00YhRC1uKNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=RtS44OAb; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="RtS44OAb"
Received: by chaosmail.tech (Postfix) id 3FC061C885F;
	Thu, 01 Oct 2026 20:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1790886421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1WGqm1vuYzHEBlHp/h/pCaC3YP6K1f63I3x2yNkSZ08=;
	b=RtS44OAbyQAwJoMGywm/ryiDWf7YFcdG4mEQAyEYfNj+jqSvZmhUP0jYVIUGQ4aZmQvsuV
	2xEZq32IFwDu5/VK9P3FoV5quwANCF8x5DtBYltvA5J7Axlrw0bznYaERMbQZPYr0iZseA
	diwj/wYBPieQV9g4GpYwWOUBnRjUEAE=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v10 0/6] spmi: apple: Additional commands and interrupt
 support.
Date: Thu, 01 Oct 2026 22:26:55 +0200
Message-Id: <20261001-t603x-spmi-v10-0-ff815c66c73f@chaosmail.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23RS04DMQwG4KtUs2aQnXdYcQ/EIg+HBkFbTYZRU
 dW7kymLTiBLR/5+W85lKDRlKsPT7jJMtOSSj4daIDzshrB3hzcac6wPAwOmQDM5zgr4eSynzzx
 qoTj4hB4cDBWcJkr5fEt7ef2ty5d/pzCvCWvHPpf5OH3fxi249nWDFxxhJHTMphBZ5Oa57nIsn
 y5/PM4U9sOavrCtN41n1SfBSSYEkoZ3Pb97A7zxvPqA2ktQ0aLDrhdb3+4vbl46ZNE6Hftebn2
 7v6xeSh6kCywh112vNh5V49U6XzpvtHNCaN/1euvb+br66BJ5UqQ1t11vNv7P/U31GkwUERlBi
 l1v794CNt5WD5Y0MOIe5f//u16vP7yIe0G8AgAA
X-Change-ID: 20260725-t603x-spmi-74630bf1b0a0
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, 
 Conor Dooley <conor.dooley@microchip.com>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790886421; l=2735;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=s/CySsdC5G6TeidNg99K1zBN/eh7iI0dzxg8QUI8iao=;
 b=XnOueGpokl4+aoo+aeeh7eR9DVzAVy33ChysJ30ovSlgrXfbDmRmRbVUhpP1x69+uMOeHRbp6
 w48tnIqnFVvDfA+uH2z0F/7qESasPm8NrXD6wjZ1eXlQxac2ZpAZoFg
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

The SPMI bus has grown additional responsibilities in the M3
generation, making the current driver insufficient. Add M3 comatibles,
support for slave-sent interrupts, FIFO interrupts, power management
commands, parity validation, and fix locking.

To simplify the merge strategy, the device tree entries will be sent
in a future patch series.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Changes in v10:
- Just collecting tags, effectively a resend
- Link to v9: https://patch.msgid.link/20260901-t603x-spmi-v9-0-09e702e3b153@chaosmail.tech

Changes in v9:
- more dt-binding fixes
- Link to v8: https://patch.msgid.link/20260828-t603x-spmi-v8-0-708d4d12e0fd@chaosmail.tech

Changes in v8:
- dt-binding style fixes per review
- Link to v7: https://patch.msgid.link/20260818-t603x-spmi-v7-0-dafebe6e7739@chaosmail.tech

Changes in v7:
- Require interrupt support on M3+
- Link to v6: https://patch.msgid.link/20260816-t603x-spmi-v6-0-c5ab87aa447b@chaosmail.tech

Changes in v6:
- Fix interrupt controller teardown
- Link to v5: https://patch.msgid.link/20260808-t603x-spmi-v5-0-553c5ac2f137@chaosmail.tech

Changes in v5:
- Style fixes per review
- Fix fifo flush
- Link to v4: https://patch.msgid.link/20260805-t603x-spmi-v4-0-c15a12d9a7d1@chaosmail.tech

Changes in v4:
- Re-do error recovery.
- Fix an address calculation mistake
- Link to v3: https://patch.msgid.link/20260803-t603x-spmi-v3-0-c17b506d91a1@chaosmail.tech

Changes in v3:
- Rework interrupt support
- Address review comments
- Link to v2: https://patch.msgid.link/20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech

Changes in v2:
- Change locking to non-interruptible
- Reorder irq ack
- Clarify dt binding
- Some data type cleanups
- Link to v1: https://patch.msgid.link/20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech

---
Alba Mendez (5):
      spmi: apple: Validate FIFO state
      spmi: apple: check transaction status
      spmi: apple: Implement remaining commands
      spmi: apple: lock around FIFOs
      spmi: apple: Add interrupt functionality

Sasha Finkelstein (1):
      dt-bindings: spmi: apple,spmi: Add t603x and t8122

 Documentation/devicetree/bindings/spmi/apple,spmi.yaml |  29 ++++++++++
 drivers/spmi/Kconfig                                   |   3 +-
 drivers/spmi/spmi-apple-controller.c                   | 389 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------
 3 files changed, 389 insertions(+), 32 deletions(-)
---
base-commit: 0f23d56f17fdfc7db69d51f64c8b91bbab947aa9
change-id: 20260725-t603x-spmi-74630bf1b0a0

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>

