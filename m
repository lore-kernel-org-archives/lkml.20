Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B174477E48;
	Tue,  1 Sep 2026 10:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788258558; cv=none; b=UYxf8Kkqo9FsBQUwyeuBiH2E11zz7b5EDWeyzgZ3/+vuPzzVBi4bZUeifhWVyN/RWYv0ong6b2JLcAPW69XS96vm7jPu+AkourMqrosD3EK9L3DccKwLnhCQWjOLEFg0t9jGNIHe2L7dkoOFYPifWjeOuNQk9SaTeR9d5wYUco0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788258558; c=relaxed/simple;
	bh=H8mZX7id9FvtDTJIogqkS54qI9UOB7o+m0z4PCa/pKY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rJj28NWQ8a1LuiSOHIuGEgnJpKFElb+g8FXUHcvBzaNgZ5RDBg2UgJ1It7CRuIBcnM9m85o8C6N/YGjstwxkJD5bDwZXr597QQ7sFoMNm5CkBcQBupeSFUyqiDnv4QUsAEyLTOJsLjcVHh43MMhNq1AdrkKkkPSVmBQZCSVRjfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=b31zg8Tq; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="b31zg8Tq"
Received: by chaosmail.tech (Postfix) id 313F41C8852;
	Tue, 01 Sep 2026 10:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1788258545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P/I2DTgQAxOgxPI9wEVMOM0VoFWJdzYjw+yI+ro0Jfo=;
	b=b31zg8TqI5YV+yz7n4qucxmGK8MIKQYzMifv6+PR/LjD49WDQLYWyha25qAgxFMaCbv9op
	rXbaUL+n/9RBBmL0ffupKRS91FEtTKn2zJ1jiZEFwy4P5DEDMJE5O58GldpjLG0hF4DK8W
	szicpUEK21fsgvYZwIUfyKev+aOfPug=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v9 0/6] spmi: apple: Additional commands and interrupt
 support.
Date: Tue, 01 Sep 2026 12:28:59 +0200
Message-Id: <20260901-t603x-spmi-v9-0-09e702e3b153@chaosmail.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23Qy07DMBAF0F+pvMbIbzus+A/Ewo8xMaJNFYeoq
 Mq/44QFNng50px7R3NHGeYEGT2d7miGNeU0XcowPJyQH+3lDXAKZUaMMEU0k3hRhN9wvp4T1kJ
 x4iJ1xBJUwHWGmG5H2Mvrz5w/3Tv4ZU/YN8aUl2n+OtpWuu91g1eKCQZq2RB9YIGb53LLlM82f
 Twu4Ee0p6+s9qbxrPgoOMhICUjDu57/ekN443nxnmoniQoDtbTrRe3b+8XhpaUsDFaHvpe1b++
 XxUvJvbSeRcp116vKU9V4tfdL64y2Vgjtul7Xvu3XxQcbwYECrfnQ9abyf/5vitfEBBEoAxLDP
 79t2zc6tWAfewIAAA==
X-Change-ID: 20260725-t603x-spmi-74630bf1b0a0
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788258545; l=2577;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=H8mZX7id9FvtDTJIogqkS54qI9UOB7o+m0z4PCa/pKY=;
 b=bJyo2vYcPBaQI5zv88nbTYSowC5dNA8b/kwBl3MmVlMfx07syGDedKa+CyK/kfesCQHDcwm5N
 +XXtNSh084qAj/9YJ3iTcIDjHB81kNez+hO8TSycPmTHTH5h7u6aKYN
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

