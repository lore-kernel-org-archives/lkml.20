Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.191
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312401;
	b=3+AhMJ++KL2/++3IaMXsbb4TVRREDrs2qvUWx3cZxquw06Jue+nAt9RwYoWyDWECO7hf
	 /snlWjQeXrp11b243fSQuqCbzq7Am8Wjy6ymgPucXu7zuV7SrPmhQetSCQ3gBBkDMEJBU
	 BxgMnHLGVdy3qeWE0CJeJwI6bo/f8xro0ushElVmt3QSV/80EV0UVHnpL3gFzbl+/tlCq
	 nj4ZrZpNl6OsPSF5a1bNU+LC1nyaDB1+OHDuhhZx/8V725lBRnIOWoO9hiqoQ6i/I3nCD
	 Ac7v96CgvVeK1BjbaRgMv8U+SFgvVrgqjblGF6l6XNwQRz5YkUItAU9X2jPGyUem/Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312401;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=4tMvkTg56XFFo5bfryoisU9sdgB7j8EbHPGsfihNjNg=;
	b=DF2M1JuSN2Kb0LJkBrljPH5+MgAitL2j/jT83eQC1icKNlK/E1PtkLZe4/xM4192fJMt
	 YtesXtwZq54hlsvqBAI6mP9V0Tg6WHqpIuM0KzCdvReh1FeLiYALTp2eIhoT6BBJ5hmTC
	 kkEgD1JHBGPUmBTy3pil79Yhoqi+0NdJnIFbANQMA9cc925nR3as++B+yWYHAAh9bxCrn
	 d4kYoxuNPFEl1tnWoIG70M5m1ybuUelFUyrqZuDDi2hRl//Z+TblZvJUXfvxH/PdrAVYh
	 zOK7qkUPzrhZ2qsDLIDFnH0r3AtM8s58p3r6IR7pzLUIr5KMS6aUknnOeJ5A9ShOX2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WkBWW6mI;
	arc=none smtp.remote-ip=95.215.58.191
Received: from mta1.migadu.com (out-191.mta1.migadu.com [95.215.58.191])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C458606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:06:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C458606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WkBWW6mI
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zq6T5FEiS/ooPwkdYAcpw4I0eAME7DtKjoHVyZoL4Dw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794312397; v=1; x=1794917197;
 b=WkBWW6mIvo3sbw4OZbi9wfE9APdcOJ3h+mokN82+D13u/meX8gKwTlJotKXe8f5Xcaj0xK2P
 J4NRVbXW4pNFnTCJ/RQFvpBGib0xRAIdgvOJeNvuiBQq7zUziEq7rhrdY+WThaxxdG0osfP5jh0
 kAMEgogEq8egTEdGqlMUgahQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 4570ccddd39c8d0b;
	Tue, 10 Nov 2026 12:06:37 +0000
X-Mizu-Trace-ID: 4570ccddd39c8d0b
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Subject: [PATCH v2 0/2] irqchip/riscv-aplic: Use trigger specific flow
 handlers in MSI mode
Date: Tue, 10 Nov 2026 12:06:28 +0000
Message-Id: <20261110-aplic-affinity-fix-v2-0-6c143b8b4e8c@linux.dev>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6DIBREr2L+ujQgatVV79G4QPjW3xg0oERjv
 HvRbrt8k5l5O3h0hB7qZAeHgTyNNkJ6S0D3yr6RkYkMKU8LXvGKqWkgzVTXkaV5Yx2trOQqayV
 vDZcIcTg5jPF1+mp+7Jf2g3o+n85GT34e3XZZgzh7l0AInv0TBMEEw1yW2jwKzAv5HMgu691gg
 OY4ji8Nck1RxgAAAA==
X-Change-ID: 20260909-aplic-affinity-fix-80a4b30bd03e
To: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>
Cc: Anup Patel <apatel@ventanamicro.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1846;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=zq6T5FEiS/ooPwkdYAcpw4I0eAME7DtKjoHVyZoL4Dw=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFmfOY5fYdw65e9kjZ7/a1z8NxsmVd4vXzx72ctHogJPb
 vH4CMwQ6ChlYRDjYpAVU2TpfsCzrcAnyrZAoNAXZg4rE8gQBi5OAZgIz3mG/34R7aIH+3Nfrt09
 nUNfM1KRZWrB6zx3v/uCLdK7fnV11zMyLE79rSb25s3p7XPM/CZ2aP1UkNHPKSju/+D4vGalwLc
 WBgA=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1

In MSI mode the APLIC handles all sources with handle_fasteoi_irq().
For edge-triggered sources this loses an interrupt which arrives on
the new CPU while the previous one is still being handled after an
affinity change. The fasteoi flow also never calls irq_ack(), where
IMSIC applies an affinity change deferred while a previous vector move
was in flight. Such a change stays pending, and later affinity changes
of the interrupt only update the pending mask.

Use handle_edge_irq() for edge-triggered sources and
handle_fasteoi_ack_irq() for level-triggered sources.

---
Changes in v2:
- Use handle_edge_irq() for edge-triggered sources instead of calling
  the parent ack from the EOI callback
- Use handle_fasteoi_ack_irq() for level-triggered sources
- Split into two patches
- Link to v1: https://patch.msgid.link/20261104-aplic-affinity-fix-v1-1-e538cd76e563@linux.dev

To: Anup Patel <anup@brainfault.org>
To: Thomas Gleixner <tglx@kernel.org>
To: Radu Rendec <radu@rendec.net>
To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
To: Björn Töpel <bjorn@rivosinc.com>
Cc: Anup Patel <apatel@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Troy Mitchell (2):
      irqchip/riscv-aplic: Use handle_edge_irq() for edge-triggered MSI sources
      irqchip/riscv-aplic: Apply pending affinity changes for level MSI sources

 drivers/irqchip/Kconfig               |  1 +
 drivers/irqchip/irq-riscv-aplic-msi.c | 19 ++++++++++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260909-aplic-affinity-fix-80a4b30bd03e

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.dev>

