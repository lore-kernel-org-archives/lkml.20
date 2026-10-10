Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7684519BE;
	Sat, 10 Oct 2026 09:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791625430; cv=none; b=ce8FIHYI4fCmf7MuFgNWGF12SBj6BTOB7i766Pr8jxtjQ5ZDY0aHNrf8tk/maOKALa6VvOYijzeMN0vyCU/LL3xGrfBdn12ka3lq5y7xBkABmEZEFbJ90qx9uNH4YLbBeWa2OA4zdrrJ84WOllX8EkqxAuYecExAt0JoYK21cZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791625430; c=relaxed/simple;
	bh=/PD6alR7DUWYk4t2a+kPIYDcsnEnHTrN8iihdKX/W4c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ed9bCFa9tSa6yBKwfQN7pbzGfy34oca8VSSJIJop/yEFI1OwYkapFcjoyhUJyrd5v8HJNMHjkUHjHC87O5Pe2ZGHWho9DXWOC4a2acDDYo1+LWnN9sdxU8n0x/ayi6wAX0BhYBLqRLNvvuxi3zpicA6swlK4+8TEtKGIwgY9Y30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=eaMQ5fIl; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="eaMQ5fIl"
Received: by chaosmail.tech (Postfix) id C27A41CBD7C;
	Sat, 10 Oct 2026 09:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1791625085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NXFSX1tYzI/FTd2hCg5Erv2WCZYus2tVWPl2LBEfLNU=;
	b=eaMQ5fIlUhNHn1vQKIqZhwSpbTws7dN39Z2CrB8qHNDhOxnFwOPWX2Eiur5fLBO553IKyx
	+Y0BKxvPpdGaBR9nB8zAHpIGD8cFQCtB7LVRlzWr5rfLhmOCVUvY79W0mUpNJdzo9Kfovf
	pO5eE1kh+Drw6AfoArXIPnO9ipBVQic=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH RESEND v7 0/3] usb: typec: tipd: Add sn201202x (ACE3)
 support
Date: Sat, 10 Oct 2026 11:37:54 +0200
Message-Id: <20261010-tipd-ace3-v7-0-317218a96c01@chaosmail.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>, 
 Alyssa Milburn <amilburn@zall.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791625084; l=2924;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=/PD6alR7DUWYk4t2a+kPIYDcsnEnHTrN8iihdKX/W4c=;
 b=znqKSXBLYU/J6o6zvMgMp8zxd8SuNRmjlx/QYH7+4TbYZWH9APeHkzC6MBblNstWHqnn3bnHL
 JE4xaii85d0DmRkN0uKaW9s4vvLfLu/TXwe7fGZnExEO7ab//k8NbYD
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

Add support for sn201202x (a.k.a ACE3), an Apple-specific tps6598x
variant that wraps the tps6598x core register set with a SPMI based
regmap-like protocol, first appearing in Apple M3 devices. This series
first makes the core parts bus-agnostic, and then adds the new SPMI
interface as a custom regmap implementation.

To simplify the merge strategy, the device tree entries will be sent
in a future patch series.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Changes in v7:
- Rebase on usb-testing
- Link to v6: https://patch.msgid.link/20260826-tipd-ace3-v6-0-e919f39a93a2@chaosmail.tech

Changes in v6:
- Fix rebase issues
- Link to v5: https://patch.msgid.link/20260821-tipd-ace3-v5-0-3244ed3bdc3f@chaosmail.tech

Changes in v5:
- Rebase on usb-next
- Link to v4: https://patch.msgid.link/20260806-tipd-ace3-v4-0-79855b150914@chaosmail.tech

Changes in v4:
- Unexport variant data
- One more debugfs-safety fix
- Link to v3: https://patch.msgid.link/20260801-tipd-ace3-v3-0-8332f2eca4fc@chaosmail.tech

Changes in v3:
- Restore accidentally deleted static
- Fix building with tracepoints
- Sleep the device on failed probe
- Link to v2: https://patch.msgid.link/20260727-tipd-ace3-v2-0-1345957bd635@chaosmail.tech

Changes in v2:
- Use a -core module instead of building everything twice
- Fix completion handling
- Make regmaps debugfs-safe
- Link to v1: https://patch.msgid.link/20260725-tipd-ace3-v1-0-73202d36138a@chaosmail.tech

---
Alyssa Milburn (1):
      usb: typec: tipd: Factor out i2c specifics

Sasha Finkelstein (2):
      dt-bindings: usb: tps6598x: Add sn201202x/ACE3
      usb: typec: tipd: Add sn201202x support

 Documentation/devicetree/bindings/usb/apple,sn201202x.yaml |  78 +++++++++++++++++++++++++++++++
 MAINTAINERS                                                |   2 +
 drivers/usb/typec/Makefile                                 |   1 +
 drivers/usb/typec/tipd/Kconfig                             |  20 +++++++-
 drivers/usb/typec/tipd/Makefile                            |  14 ++++--
 drivers/usb/typec/tipd/core.c                              | 247 +++++++++++++++++++++++--------------------------------------------------------------------------
 drivers/usb/typec/tipd/i2c.c                               | 107 ++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/typec/tipd/spmi.c                              | 300 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/typec/tipd/tps6598x.h                          | 132 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 9 files changed, 705 insertions(+), 196 deletions(-)
---
base-commit: bbed88f72dbbb960080282de3b90ca0933fa6226
change-id: 20260725-tipd-ace3-090bf570ef59

Best regards,
--
Sasha Finkelstein <k@chaosmail.tech>
-- 
Sasha Finkelstein <k@chaosmail.tech>

