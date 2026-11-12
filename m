Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471307;
	b=up5ctef9/E6UulltFr7T0rcBWpf+lYavXx6SffSMi2H+U6RrT4qumgWvXJ7PwIh3NzcB
	 ITao8RhLcrUgh19+VCrWSyca6xgYDDHO3S/dnY0isVfyrnawoUKkNBwLI1XoT1/22SfK+
	 cNBwbHMwP1wKqPz7k5lxkacj9hwNP4Ece6UegdbHm79PTgol4nuQyJLCFV5i7ICazFSmv
	 hINqG7///44NT42WC4XQ7QnR1KzcqRJfUXqD1Mv8cSvcLrjjR/xIDvZ3RcQW8dvcqFk+v
	 0HcOsimYtX/Ver9Pz28GIySDEpaORrRYXqAa7h0G19tPDA1o3UVeYOFsDlatZZ92tew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471307;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=5LrhcM08sLorKQVpwZjpNM1KLr7mAptthBEY0BzD/1w=;
	b=0xDi9jv+jyAqOWKHl1//kAlrzfPzHnU/5KLlIZmB5eo7agcclXTZ2lJ4BsNrxqwAmlLF
	 UwznNyK1FNH09yFXxhD5ynQO3ep5W9EdLG8plIImt+l30ZwoxlDs9GQuojtO0pdJLBV37
	 P1awU3wUU56s9u4ZHxV77+xZhnshVMET9MvjaVT2s+n2T/zdY5jbJkb2BvIEg1Gk+/3Fe
	 7ozL6j/+lZ/JaBd70/xGWHoy8p1OMAnbZSuv1O7d3q0YwIR/0h3iBWcY+9GGGiiwigQtd
	 WBnEKHjTTsjHsYwp1K5oeHJt+kPnmLolfyhvAuWegBLz3srmGy4XLr6XMV+bKXoIOZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kN5Riccv;
	arc=none smtp.remote-ip=91.218.175.36
Received: from mta0.migadu.com (out-36.mta0.migadu.com [91.218.175.36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF57606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DF57606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kN5Riccv
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=h4GvArQMrEiTRwfEHf4rZ5pF+aKj8NBbvpgZjU0P818=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794471304; v=1; x=1795076104;
 b=kN5RiccvttyQa8sBP/UNxvNsXewbaL8IL8SaGD3jUHt5YkfE9KChXdqo/XkmWK+33HyX2O6L
 iSSpCk2T/MuzWWWNVOxCyJStnQbe9pJ4rWcw2N3BSylh1ubnHs0PpFjUWat/ciYPr0YD7w5HbCt
 6D/UezCfNSvnhTvc6TO62nO0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id bf7d0b889862177b;
	Thu, 12 Nov 2026 08:15:03 +0000
X-Mizu-Trace-ID: bf7d0b889862177b
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Subject: [PATCH v3 0/2] irqchip/riscv-aplic: Use trigger specific flow
 handlers in MSI mode
Date: Thu, 12 Nov 2026 08:14:41 +0000
Message-Id: <20261112-aplic-affinity-fix-v3-0-943d25cfbfad@linux.dev>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NMQ6DMAxFr1JlriuHAIVOvUfVIQmmuEKACEQgx
 N1L6MLA+Kzv9xbhqGdy4nFZRE+eHbfNBup6EbbSzYeAi41FhFGKOeagu5ot6LLkhocZSp4gQx0
 bhaZARWJ77Hrazrv09f6zG82X7BBMYVGxG9p+3qteht0ekBLjs4CXIIESldninlKSqmfNzTjdC
 vIiBHx0UEg8VUSAkFoZK5OZmDJ7VKzr+gPrNSPzCQEAAA==
X-Change-ID: 20260909-aplic-affinity-fix-80a4b30bd03e
To: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1642;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=h4GvArQMrEiTRwfEHf4rZ5pF+aKj8NBbvpgZjU0P818=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlfSxs/BR22lmAruvCvSXB7t6/YlkVKESsbXl5+fIYry
 eeCyKwDHaUsDGJcDLJiiizdD3i2FfhE2RYIFPrCzGFlAhnCwMUpABN5ysrwV1AtZskZ5zdOM0R1
 ssOaJI9pPxY5ezSmJkDiFe85NvZ7/IwMr3l+/5mwYkHTeoYJH20lJyae6YtIsf/ENFHHZ97EtX+
 TWQE=
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
Changes in v3:
- Add Suggested-by: Thomas Gleixner to patch 1
- Add braces around the multi-line if/else branches
- Link to v2: https://patch.msgid.link/20261110-aplic-affinity-fix-v2-0-6c143b8b4e8c@linux.dev

Changes in v2:
- Use handle_edge_irq() for edge-triggered sources instead of calling
  the parent ack from the EOI callback
- Use handle_fasteoi_ack_irq() for level-triggered sources
- Split into two patches
- Link to v1: https://patch.msgid.link/20261104-aplic-affinity-fix-v1-1-e538cd76e563@linux.dev

---
Troy Mitchell (2):
      irqchip/riscv-aplic: Use handle_edge_irq() for edge-triggered MSI sources
      irqchip/riscv-aplic: Apply pending affinity changes for level MSI sources

 drivers/irqchip/Kconfig               |  1 +
 drivers/irqchip/irq-riscv-aplic-msi.c | 20 +++++++++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260909-aplic-affinity-fix-80a4b30bd03e

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.dev>

