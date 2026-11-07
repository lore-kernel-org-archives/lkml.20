Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.81.229.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794083800;
	b=PkR9qt5KR9E1iyC9Fust24A/K/Wsu0XvFcSoQ7OLMXkdmxcday77N3g1fmUlHxX+9xnO
	 F6CpWzXyJlA99gVXFdRLGNpXuJrsWaMpYNtzkkdX7dQEKKb5xXm+3v9lm2x0j42XQRv8m
	 OtN3apsymmn1Sf6zjBzuDvPGNr2e+TNumg7PdaGfLYeonL8r/IrACqFPTW7H/2VJZYTlc
	 fnNqHxTA5wxg/tJReVMr7AVJoT382rlJLCkqAENQ/BhLWOFw2Y+JNBAHVPlU5i63d6l9R
	 gRcsIKsJKJVBYgKbrXloEoePKfaj/RJw6occKrArGmCTi8Tu8l3MW4foctRT0ahPckw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794083800;
	h=DMARC-Filter:Received:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=r398tx10WrCtcSUjo84Tq+kxAlN0I4nplPTtKINWzFY=;
	b=KqrE0qCzFNexNYaCQbyqng3GFRozmdjvQypf5+0d7YcjNgNw5wtqq3G8zZWF3gDI2pon
	 o6dZ1Q1E2Gs4DSGCBJmpbSLHrDYpor767AQiPGZ7sk9O1wugmKFC2Z/3u8XnKP+CfS+TP
	 CUlwwY0tFdTjcvtMrCRnSR9bR/hVpIiDbQ8mCd0prcDLLfgRpwult330AnjmmklX+cO+V
	 o7DQklN3jMKeaso1Kx8xNcbtw1LZhz+vW4SE6pOAW84Cnb8UjIi1aKLG6bTXOc4hwqVs8
	 pnF2tXBNPmvv1LsPU2LdjIQ3apmIDGxlYlw6RENhBPCXQq7nnClGBvILovuQQq6694Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chaosmail.tech;
	spf=pass smtp.mailfrom=chaosmail.tech;
	dkim=pass header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=pOsXGO82;
	arc=none smtp.remote-ip=77.81.229.115
Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4567C606A32C;
	Sat,  7 Nov 2026 20:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4567C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=pOsXGO82
Received: by chaosmail.tech (Postfix) id 9069E1C8E49;
	Sat, 07 Nov 2026 20:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1794083790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r398tx10WrCtcSUjo84Tq+kxAlN0I4nplPTtKINWzFY=;
	b=pOsXGO825d88dEM3x1B6Gep8E6WEPl2n3Z+KYYgxkGmd5eREcfaeILZzNqE0uce93QsQp/
	P0H6ggAiLqfM9JFBmGX6sIPwqKa9hqmC/6tV6vs+iQBJppaPFDo1jryTku2jIorL9fcOdD
	3YeMyEHgkSyIqhj4ZK/I9Nhng6R5zFw=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v11 0/6] spmi: apple: Additional commands and interrupt
 support.
Date: Sat, 07 Nov 2026 21:36:22 +0100
Message-Id: <20261107-t603x-spmi-v11-0-322490215f58@chaosmail.tech>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/23SyU7DMBAG4FepciZoxrt74j0QBy9jakQXJSEqq
 vruOEWicfFxrPn+Gdm+dCMNmcZuu7l0A815zMdDKRCfNl3YucM79TmWg44BU6CZ7CcF/NyPp33
 utVAcfEIPDroCTgOlfL6lvb791uOX/6AwLQlLxy6P03H4vo2bcelrBs/YQ0/omE0hssjNS9nlO
 O5d/nyeKOy6JX1ma28qz4pPgpNMCCQNb3p+9wZ45XnxAbWXoKJFh00v1r7eX9y8dMiidTq2vVz
 7en9ZvJQ8SBdYQq6bXq08qsqrZb503mjnhNC+6fXa1/N18dEl8qRIa26b3qz8w/2b4jWYKCIyg
 hSb3t69Bay8LR4saWDEPcr2+yH8BSA8BCAsPyAZlEGpoHn6l3C9Xn8AHbI+XP4CAAA=
X-Change-ID: 20260725-t603x-spmi-74630bf1b0a0
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, 
 Conor Dooley <conor.dooley@microchip.com>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794083789; l=2745;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=J8UJXr2R5t6eKVLYlZWimSCzQm+/CBY8f4kpeADoPpM=;
 b=asjcwNEIBLbbvIFYEr4+1mqk4YhMHNz7G86UUN6UlVi8U7LRuIBildbrNO3i/5ojOWWgFUXzY
 cfSUWi6fY3YAogpyw9264tuP7rSDRGL01pzrFfUOZQbHx89AQofK34P
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
Changes in v11:
- Rebase on 6.4
- Link to v10: https://patch.msgid.link/20261001-t603x-spmi-v10-0-ff815c66c73f@chaosmail.tech

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

 .../devicetree/bindings/spmi/apple,spmi.yaml       |  29 ++
 drivers/spmi/Kconfig                               |   3 +-
 drivers/spmi/spmi-apple-controller.c               | 389 +++++++++++++++++++--
 3 files changed, 389 insertions(+), 32 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260725-t603x-spmi-74630bf1b0a0

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>

