Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF84B56C64A;
	Tue,  8 Sep 2026 16:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884998; cv=pass; b=h7eAsyMi6ppNP3KOUdxQZ6DaiKrQ9CT4tH29dk3T/xjIpEGUapedRvJJla5GA5+EyhG8D6gxwkbd+fnaeoDvdaKtuqzZSz22c2Rxzv+il7lljZN8G0Wj+eiS4m0ax0tZAuX1c9T9gQy+MyS09lcKQJjmZf+iaj+7ThuyTiEjPnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884998; c=relaxed/simple;
	bh=n0RwmVYfL4xTZKBJL8mGbYS60sV/U2MaKAHBgZld1S0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XLvPDHm4whzD/2cOwL0Q+mBhulg4nXFppk42wf60TpwzeUA4LqXi6IPswNru0qZVCOfmDrGQNsMzIF+P64rIuhdu1S0/HEmf5eJ57eWY4i3LON774M1quEBg6l48QcPmja4OcyDPj8cawgde1mu3pyZ1X5AzWaRvfP58v6ctFfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=fRHK4dN7; arc=pass smtp.client-ip=165.173.182.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="fRHK4dN7"
ARC-Seal: i=1; a=rsa-sha256; t=1788884959; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hRcIu/kDve20s5QxX53vTX9xFddWSTmceSQVwzKQ1ODxTRfHOA3gmYG5Z4IniW5Y0yo/xBMDX1EQfLrlaIx2UsUvs/mNY+Qy0mbJjd+8dZ9y6jl2K/1cCoRUE//JhroiMpf5p5KRFFSS+r6qcVD1UxHuBcoG5ExqKGYjeFsR3D8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788884959; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=D8qxbwrZwATsoR3QHFGwMxcNbr4zYF2x2RxDDaZcC44=; 
	b=SEfRB2UgduhZLyT7c5jAYdvdQKRMILS6P4gDCWWrSTMDqpR7VJv6DrCQwyv9Me3R8Y5bAGq5hf/Yq+CThBv6VF3dOK3yUdGv8F1Teqa2mxMCd24gCqcM4wjcVh0gNu3byoJQULF0adWmlnwgHt1FA9F3oZWBgs7/b5aAGrBPjh4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788884959;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=D8qxbwrZwATsoR3QHFGwMxcNbr4zYF2x2RxDDaZcC44=;
	b=fRHK4dN7YIPk+hRAxc8+W8ScDuHeoFG58ePScaLgggQD4n2eG6+g+OIVia/0s0g6
	wTxg9CAQOaf/a8mAOoUA5VJZ4r1msG5WQcibEjFvRDEFDVUahKIRi/fLamGhoO6MzH1
	3KyBWtqfSsg9QrJWV0GCEQjlKy522niXf3gMG4R4=
Received: by mx.zohomail.com with SMTPS id 178888495744144.65748997996377;
	Tue, 8 Sep 2026 09:29:17 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH v2 0/6] spacemit: k3: Replace bad CLINT node with ACLINT
 nodes
Date: Wed, 09 Sep 2026 00:28:43 +0800
Message-Id: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBAAv0L2bA0tiMWT/zAcatnCKhTSVqIh/
 bsUrx4nmcys4NERerhkKzhcyNNkNxCHDHSvbIeM2o1B5KLKz6Jmz4IpPZANrC61qtvCSC4NbP7
 s0NB7b92aH/vX/YE6pEAyevJhcp99tvDk/esunOVMoZGy4mVbqNN1pm6cnBqOAXUPTYzxC89Mx
 ka4AAAA
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
 Conor Dooley <conor.dooley@microchip.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3822;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=n0RwmVYfL4xTZKBJL8mGbYS60sV/U2MaKAHBgZld1S0=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLIWmO+9w2V4MJcppifUcbfIbLHPLuLzrvbubJB1sv+78
 8k135MdHaUsDGJcDLJiiixc/uL/rHV4vh0RaL0PM4eVCWQIAxenAEykcTUjQxPb/WNShsanpFM/
 Jl6tUXOJjQgoFpc6IfhW83bciqlVOxkZFifIOOYJu1XlJq9sdP91f0uV/KuIS7Oc5LgU1SdXT37
 DDgA=
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

The ACLINT controllers are mapped to two physical memory regions:
secure (0xf1810000-0xf1820000) and non-secure (0xe0810000-0xe0820000),
with varying accessibility per controller and execution mode:

+---------+--------+------------------------+-----------------------+
| Offset  | Module | Secure Region          | Non-Secure Region     |
+---------+--------+------------------------+-----------------------+
| +0x0000 | MSWI   | 0xf1810000-0xf1813fff  | 0xe0810000-0xe0813fff |
|         |        | (M-mode only)          | (Inaccessible)        |
+---------+--------+------------------------+-----------------------+
| +0x4000 | MTIMER | 0xf1814000-0xf181bfff  | 0xe0814000-0xe081bfff |
|         |        | (M-mode only)          | (Inaccessible)        |
+---------+--------+------------------------+-----------------------+
| +0xc000 | SSWI   | 0xf181c000-0xf181ffff  | 0xe081c000-0xe081ffff |
|         |        | (M-mode only if efused)| (M/S-mode Accessible) |
+---------+--------+------------------------+-----------------------+

Taking these constraints into account, we choose the secure region
(0xf1810000-0xf181bfff) for the M-mode ACLINT components (MSWI and
MTIMER), and the non-secure region (0xe081c000-0xe081ffff) for the
S-mode SSWI component.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
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
      dt-bindings: timer: sifive,clint: Deprecate spacemit,k3-clint
      irqchip/aclint-sswi: Add support for SpacemiT K3
      riscv: dts: spacemit: k3: Replace incorrect CLINT node with ACLINT nodes

 .../thead,c900-aclint-mswi.yaml                    |  1 +
 .../thead,c900-aclint-sswi.yaml                    |  5 +--
 .../devicetree/bindings/timer/sifive,clint.yaml    |  5 ++-
 .../bindings/timer/thead,c900-aclint-mtimer.yaml   |  1 +
 arch/riscv/boot/dts/spacemit/k3.dtsi               | 37 ++++++++++++++++------
 drivers/irqchip/irq-aclint-sswi.c                  |  1 +
 6 files changed, 37 insertions(+), 13 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260729-k3-aclint-94ca9d3f818f

Best regards,
--  
Junhui Liu <junhui.liu@pigmoral.tech>

