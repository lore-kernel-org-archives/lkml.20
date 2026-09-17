Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE34A502D6A;
	Thu, 17 Sep 2026 16:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789662654; cv=pass; b=kS8h/HnNsZNI7ZGwmeDGwXPJ/AIu5hHfaxM/M8od6RPmMKJ3H/0nS2PwNk6MSO/6pUP6VZxVQRMs4HCy2Ze0Rpxvp/HFKejdEnuDfYEhiahzgflqLgZ7LLuCz6xungyiizbgMA4kZd2wVAIw+1+3r9KmnGEQ8G5ketwbStq5kWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789662654; c=relaxed/simple;
	bh=gv83lzPH/UASiArxljeWMd10mEFfxrk/uqeeiNEdhqk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=raVog+LWHOrcQrPeB6XEEbk1NfhCh+9Ro8Xm1HaTyrfGvtVnvFeu8eWGlC+PMMgvmlAooJVFC+jnPeRbwK3hoFts7RYs3qBS/CbkuCF+B4pl1CkFQNvD7cItRN29lHo3uKgJYaoe6V47YyezBgbuYaiyD+yEvOCqbyF0akf56tc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=UjeJhHtu; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="UjeJhHtu"
ARC-Seal: i=1; a=rsa-sha256; t=1789662622; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QdK3lySSkHvOh+Irr5hdBuwBB+STL9GNdtMEy/IW06mZ1HFt2R2E3lUVIfaLZnR8jLLET59wERXYM6i88x9hMcQXx/raV1YajCSuNnPl5ntOM7ayLOfFMLO21sqg+/qafIHaKKLIs2+RAoYdmxisd/YjBIyWZNzJoNn/XhHcdM8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789662622; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=E2GkpMw+FYHy3VZ0eQhxmXfdLjU5pCd1Kr/tYxquyh8=; 
	b=iBoj5TiUiPoZQ+pbc8qJ+qa5ZFXsANVASwc0vTVK7fZmugha8xOAKVd0XJpbEO6W4BC+8HgLXn5gtAPiQd1kAd9mT7jmmk3v+H0DQ8XujQArmKq4gXa8uV9wbWUZ/aLqrgbHOLWOZRP6mV3e9Ou9f0k9uQW+43agaiM5HqpvIgc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789662622;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=E2GkpMw+FYHy3VZ0eQhxmXfdLjU5pCd1Kr/tYxquyh8=;
	b=UjeJhHtuGFc7VL1u4Qa7yGmbJNh5QsDDJ8sBtWOHa+XuOddmixgiS6F71adeTG+H
	hFg7qIQEehiAO2PBr9/cTPXPf7gY5Y0MyqQCMQ8WGAr6s3BU0pRhZFw1/kwggh/CL4n
	LoMaBe3W/NgZYpc3xpFBoS9rpmMiAT9j+lmjkyhU=
Received: by smtp.zohomail.com with SMTPS id 1789662621373924.8262476048936;
	Thu, 17 Sep 2026 09:30:21 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH v3 0/6] spacemit: k3: Replace bad CLINT node with ACLINT
 nodes
Date: Fri, 18 Sep 2026 00:29:32 +0800
Message-Id: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Nyw6CMBQFf4V0bQ1tebSu/A/jopRbuIpAWiQaw
 r/b4sJoXE5yZs5CPDgETw7JQhzM6HHoA4hdQkyr+wYo1oEJT3mRllzRq6DadNhPVGVGq1pYyaQ
 lYT86sPjYWqfzm/29uoCZYiAuWvTT4J7b2czi7l93ZjSlGqyUBctqofPjiM1tcLrbT2BaEtsz/
 9gq/bJ5sEslGOSVkYWuf+11XV/bYDHk9gAAAA==
X-Change-ID: 20260729-k3-aclint-94ca9d3f818f
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Inochi Amaoto <inochiama@outlook.com>, Radu Rendec <radu@rendec.net>, 
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
 Guodong Xu <docular.xu@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Conor Dooley <conor.dooley@microchip.com>, Bo Gan <ganboing@gmail.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4567;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=gv83lzPH/UASiArxljeWMd10mEFfxrk/uqeeiNEdhqk=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLLWiNYt3XdmXr6WaJzD3PtiFjIS6TdKtG8utTtkFywnt
 uld3oPKjlIWBjEuBlkxRRYuf/F/1jo8344ItN6HmcPKBDKEgYtTACbC/J2RYWuAYNLF3t1xG/4K
 FS5bZDzd4vnPNRUMNq0eDyR6/vd0JDEyzJu4L+3zlO1/fGcJ3ZmTL6HJnXVqnfSWR+99twdsYZk
 XxgUA
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External

When testing OpenSBI with the upstream Device Tree, the CLINT controller
failed to function properly with the irqchip.riscv_imsic_noipi boot
parameter:

  Platform IPI Device         : aclint-mswi
  Platform Timer Device       : aclint-mtimer @ 24000000Hz
  
  Domain0 Region03            : 0x00000000e081c000-0x00000000e081ffff M: (I,R,W) S/U: ()
  
  [    0.091014] smp: Bringing up secondary CPUs ...
  [   10.104917] CPU1 failed to report alive state
  [   20.118689] CPU2 failed to report alive state
  [   30.132288] CPU3 failed to report alive state
  [   40.145953] CPU4 failed to report alive state
  [   50.159604] CPU5 failed to report alive state
  [   60.173212] CPU6 failed to report alive state
  [   70.186981] CPU7 failed to report alive state
  [   70.191411] smp: Brought up 1 node, 1 CPU

Through exploring and testing, I discovered that the K3 actually
provides all three complete ACLINT components, and subsequent
confirmation with the vendor yielded the following information:

The ACLINT register space is mapped at two base addresses: a secure
window at 0xf1810000 and a non-secure window at 0xe0810000. The
secure window exposes all three components, while the non-secure
window only exposes SSWI; the MSWI and MTIMER offsets are reserved
there:

+---------+--------+-----------------------+-----------------------+
| Offset  | Module | Secure Window         | Non-Secure Window     |
+---------+--------+-----------------------+-----------------------+
| +0x0000 | MSWI   | 0xf1810000-0xf1813fff | 0xe0810000-0xe0813fff |
|         |        |                       | (Reserved)            |
+---------+--------+-----------------------+-----------------------+
| +0x4000 | MTIMER | 0xf1814000-0xf181bfff | 0xe0814000-0xe081bfff |
|         |        |                       | (Reserved)            |
+---------+--------+-----------------------+-----------------------+
| +0xc000 | SSWI   | 0xf181c000-0xf181ffff | 0xe081c000-0xe081ffff |
+---------+--------+-----------------------+-----------------------+

MSWI and MTIMER reside in the secure ACLINT space, which is only
accessible through the secure window; their offsets in the non-secure
window are reserved. SSWI resides in the non-secure ACLINT space,
which is aliased in both windows. However, depending on the eFuse
configuration, the whole non-secure window can be inaccessible, while
the secure window remains available.

Taking these constraints into account, we use the secure window
(0xf1810000-0xf181ffff) consistently for all three ACLINT components,
as it is accessible regardless of the eFuse configuration. OpenSBI
protects the MSWI and MTIMER ranges from Supervisor-mode access via PMP,
leaving the SSWI range available to S-mode.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
Changes in v3:
- Correct the accessibility description of secure and non-secure windows
- Drop spacemit,k3-clint from sifive,clint.yaml entirely
- Move SSWI to its secure-window alias
- Link to v2: https://patch.msgid.link/20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech

Changes in v2:
- Drop the generic riscv,aclint-* fallback compatibles and use only
  SpacemiT K3-specific compatibles.
- Match spacemit,k3-aclint-sswi directly in the SSWI driver.
- Squash the ACLINT MSWI and MTIMER DT additions into the patch that
  replaces the incorrect CLINT node.
- Link to v1: https://patch.msgid.link/20260729-k3-aclint-v1-0-aef88614d3a5@pigmoral.tech

---
Junhui Liu (6):
      dt-bindings: timer: thead,c900-aclint-mtimer: Add SpacemiT K3
      dt-bindings: interrupt-controller: thead,c900-aclint-mswi: Add SpacemiT K3
      dt-bindings: interrupt-controller: thead,c900-aclint-sswi: Add SpacemiT K3
      dt-bindings: timer: sifive,clint: Remove spacemit,k3-clint
      irqchip/aclint-sswi: Add support for SpacemiT K3
      riscv: dts: spacemit: k3: Replace incorrect CLINT node with ACLINT nodes

 .../thead,c900-aclint-mswi.yaml                    |  1 +
 .../thead,c900-aclint-sswi.yaml                    |  5 ++-
 .../devicetree/bindings/timer/sifive,clint.yaml    |  1 -
 .../bindings/timer/thead,c900-aclint-mtimer.yaml   |  1 +
 arch/riscv/boot/dts/spacemit/k3.dtsi               | 43 +++++++++++++++-------
 drivers/irqchip/irq-aclint-sswi.c                  |  1 +
 6 files changed, 36 insertions(+), 16 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260729-k3-aclint-94ca9d3f818f

Best regards,
--  
Junhui Liu <junhui.liu@pigmoral.tech>

