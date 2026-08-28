Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECDA2848BE;
	Fri, 28 Aug 2026 08:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787907556; cv=none; b=KjBKpJkvcDp2eYUolZh3F4oYZY3lbVsUlg8/0Wn7/xfmGLACTMcD3YTY1LgBBz6pWsMdpHZ3abC+/+CrDi6I04/RutcHSYSt0GAAeruhqgo3UAlsJh04qySTk8QsQCc7f1ytN4ML4OT1GPSbrSpfElGskeScYtr7LQVqCWWjiik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787907556; c=relaxed/simple;
	bh=3FcjtBrL6C9EXjSvryJDqqOUMP7I1lLyaJGaaimzYBM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=r/hH/CF7DoWkK3egOuBvJr+y+oYcRDC1U7X+s5CRXWcmqAdLH7qi8cfCHhRn1bvCU6UNFT9+8/NcY6yqz75aTU/TL9dcOYz3c+nHovd2cAdCH4y7M4XftwwiG94xftmYEotjENlWbPS9FkJQ3+488lwJP2iEpt/zZm18xW7waIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=BbKUidfd; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="BbKUidfd"
Received: by chaosmail.tech (Postfix) id 884C11CC004;
	Fri, 28 Aug 2026 08:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1787907545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LPH78/nl0UGaXJAWMwJNr6oKRS5gOJvd6kyg53tBHws=;
	b=BbKUidfdVKRZwqbrBT1h2DANsZWL67h5Rb9/5rXLKWseI3IiWNfx4f0uXIonEmO/Fa6/ZF
	Q8MJ8WC9BWj/pjNzHRYGEQByqH4ocAyODTOgi25Hzd8XModw17pCWuak4wL6HOoTWZINIq
	e8JH0MEgIXSD5x/BO/hsxbKcigGVWs0=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v8 0/6] spmi: apple: Additional commands and interrupt
 support.
Date: Fri, 28 Aug 2026 10:58:56 +0200
Message-Id: <20260828-t603x-spmi-v8-0-708d4d12e0fd@chaosmail.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23OTU7DMBAF4KtUXmPkfyddcQ/EYmyPiRFtqjhER
 VXujhMWxMLLJ8333jxIxilhJufTg0y4pJzGawnd04n4Aa7vSFMomQgmDLNC09kweaf5dknUKiO
 Zi9wxYKSA24Qx3fey17ffnL/cB/p5a9guhpTncfre1xa+3TWLF04ZRQ6ijz6IILuX8suYL5A+n
 2f0A9naF3H0XeVF8VFJ1JEz1J1sevnnOyYrL4v33DrNTOg58KZXR1//r3avgYvQgw1tr4++/l8
 Xr7X0GryIXNqmNwfPTeXNtq/BdRZAKeua3h59vW+LDxDRoUFrZf/Pr+v6A2TwEms7AgAA
X-Change-ID: 20260725-t603x-spmi-74630bf1b0a0
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787907544; l=2441;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=3FcjtBrL6C9EXjSvryJDqqOUMP7I1lLyaJGaaimzYBM=;
 b=lMlJqxnqzkuPiQorwvPU+n0oFYt28OlmN8PsIRdM+JjjA0E/ouDL2Xvdh/nIKV+dLcYH1eJS5
 VYMGSz4uEJNAHsj2C5uBxq7ChaeE6YuRjBB6aNNc5LMxWFwzWmVOttz
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

 Documentation/devicetree/bindings/spmi/apple,spmi.yaml |  31 ++++++++++
 drivers/spmi/Kconfig                                   |   3 +-
 drivers/spmi/spmi-apple-controller.c                   | 389 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------
 3 files changed, 391 insertions(+), 32 deletions(-)
---
base-commit: 0f23d56f17fdfc7db69d51f64c8b91bbab947aa9
change-id: 20260725-t603x-spmi-74630bf1b0a0

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>

