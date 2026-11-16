Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794830132;
	b=BY6kNmLExaJ44luCoq8euNn1syN/ie/0Cckn92T40D0xyw7RFEko0IiIXmHi8oYGi9Yd
	 I+lqhCZJRzjnnlSri+F7lswpEq8RqC47Q7/wcCvBsph0PoBbOuZuy3SzKL0fQ14G24mUe
	 Ctqsy5h8s0AWW95Bdo45rliSwsOzAnFWCn0xaAT5shwLBWCkF04ODwPbaMQ1NVd8nh4wU
	 n0na59KWGKNBvtO3GMNia8cEU3N27obJJYt/c/H6F88C2A1nGioiyQBhLt/ZjE81X/oDk
	 AZP/N4yUfFrPVzQCH43kb79np1wnk+JCI+JeIOdKGVaDluzqtuwZ1xkMcnKpnoX39NQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830132;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=gwk+QqSeixXld1qAJw3dEIcBSVOs7JfyvqvGfbY1mxM=;
	b=ZpO7y4cVBLqPsQhKo9rf+PZTnOw2gegKY5d/XrleL79q5kuzykJZwqmwMXjzNN/k218+
	 S/x9eJmas1VBRlN9g/3yWw2m+O0ee+zMwyGBKnOslq+jFXPHuphGHuHXLPORmNTisThTO
	 AKqjnEvTVP6hjh8f6JYlYUXXcfdjrEdsH+N6v02wL0dhzaT9LxPURzbPEY2P86yp4egSt
	 9stGSqR5lYmLKgbuWPlFWJjRIs9Gbw+ffWtorL6f+1tTu1/TchJLuU4paLidK7jOKzQCd
	 NWSKWO9OGgViLUFejxBwCGaDa+ovlLgFR8E2CWKy0WlReyM4L9P70nP4+TkZdk6xJPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DgqSeIMM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729A3606A32A;
	Mon, 16 Nov 2026 11:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DgqSeIMM
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794830132;
	b=qNyo02aZiip6AjEGp0KGlBSdWE0NV+PNafc8lpsAZKkjkutBWrZT5gT0t8bakdJCDi2b
	 WJasRTXdhmgPM4hz3q3gxgBb2VaZI7Y1rp0/4fHnlyvQJmZBvzSND7tOHu+rNX6T2v2uh
	 nmY1DgurQ1RNCvb67Js2+i6nPwFb78CIeV8SnllVm7wBCFFEmKOOYh44M1WkCGG2RCwM0
	 hRGpRLPKDA6VLMBn1zGVH5+Swl/U92ZeP+SB6dimj1K1moLV0loQy0xb8Zt4BwBbsquh6
	 In/UC8htDnX/VLXOXlwYYS1IFcpK1cVH/Ru0GQN00JfobwEbq3YUmlIOdFSLufpYy9w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794830132;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=gwk+QqSeixXld1qAJw3dEIcBSVOs7JfyvqvGfbY1mxM=;
	b=ydoGIgcW8wQqw1zlsrzu989qpiQ5/7X0lM2+EvkL/tQnigiSsE7hzfV0ehSDx+y35Smt
	 8Uezu0Yrwz6EleR2UQWAK7SRu2g6PWq9ZchglqMl1i0F5rG1BC4rF9I6JkFbtBu/DX4NR
	 xVmwBCcRCeif59KMX2i0IvIubZ8sC4NRg6daPK4hafaPvv3QP76Gc/uZv3TNntTJaJjHA
	 l30ZOpU2iu97VlgtbxzCjFFuTrvOOb9x4C2wGMOelcK7kQZvyUFghL+80DQ63fwQtU7h8
	 A0L6x/2DJugZ1g8n2BSPehN0DUMf2d23rLqaSxLR0aOzqtynQ2oOKpugtRp1CHyk6rg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 309651F000C4;
	Mon, 16 Nov 2026 11:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794830132;
	bh=gwk+QqSeixXld1qAJw3dEIcBSVOs7JfyvqvGfbY1mxM=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=DgqSeIMM/t2P9O93Z1AW0W8T5KolXk6Y2qxpuiy7rdemJrTrgcoHK5BZx33R1mAZP
	 F78Kjg4oroEG+C4Anhl8T4WCT9Qb3mKwQPNi8uZadWbkqPcR7vK/UbBmP8yWL66Oeq
	 3IuEPmDH+xbtYVrAUDcH1qp7yWBnzYDU1unz4x6FS/NNZGl0HydYwYO1oCc3uvYZIx
	 jfD2qgtjs0dMd4V9A3RsO+7yqiDs8etaVCUwNicMjHV5d7f5xfZqe6sVN1N10Ihaj2
	 ge6USQxDdG3zyHtaG79WQtPAvDfzMGZwc/r/iwE3ql3VGfADrfaCaGqbGnu5Eu9tRj
	 leV5g5fayMmwA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8A8F44A44E;
	Mon, 16 Nov 2026 11:55:30 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Subject: [PATCH v3 0/8] Add support for MIPS P8700
Date: Mon, 16 Nov 2026 12:55:07 +0100
Message-Id: <20261116-p8700-dts-v3-0-ec5d4b7de39f@htecgroup.com>
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
X-B4-Tracking: v=1; b=H4sIABvv+moC/12MwQ6CMBAFf8X0bE13Wyh48j+MByxb6EFKWmw0h
 H+3YGKIx3l5MzOLFBxFdj7MLFBy0fkhgzwemOmboSPu2swMBZZCYsHHSgvB2ylyBbqqrACFqFn
 +j4Gse22t6y1z7+Lkw3tLJ1jXb6UGtask4IJLLLUFRXdDcOknMl3wz/Fk/IOtpYQ/G0DIvY2r3
 ZiiVbVFI/W/vSzLB+So4GbkAAAA
X-Change-ID: 20260325-p8700-dts-41788f014227
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Inochi Amaoto <inochiama@outlook.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Joel Stanley <joel@jms.id.au>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794830124; l=4421;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=yMBQcqxirYNOfYKfWqY+jYqV6O5S2DvCDStxOPByMsY=;
 b=OeNR91oEA6s0OsEjqaqT3C97DuJtiNR6SitaKopZW7aSx5Pt7hqmHDrIoSpwDYrlg/Rqn/S0V
 kym7xGkGOj1DxGsPtFmALtUblcWSI3IcmrwuVxTyVoLnOzj5quOMgpv
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com

The MIPS P8700 is a multi-core RISC-V microprocessor system, supporting
both single-cluster and multi-cluster configurations. [1]
This series adds full description of the platform,
including the Boston FPGA board configured with a P8700 bitfile.

The P8700 cores support the RV64GCZba_Zbb (G = IMAFD) Standard ISA,
with a caveat: the A extension is only partially supported, and all ZAAMO
extension instructions are emulated on the SBI level. The device tree
intentionally does not reflect this fact. Vladimir Kondratiev's series
improves performance by directly substituting AMO instructions with LR/SC. [4]
The two patchsets do not depend on one another.

The board itself is the same board as 'img,boston', configured with a different
bitfile [3]. The Boston board has been supported since commit 6e62a888029b
("MIPS: generic: Support MIPS Boston development boards") (thanks to Maciej for finding the ref).

I tested this series both on QEMU and a Boston board
configured with a single P8700 CPU,
after applying the necessary U-Boot changes.
We are planning on upstreaming these as well.

Following the discussion in [2], I decided to drop the 'gf' prefix for all compatibles
and to rework the aclint-mtimer binding.

Links:
[1] https://mips.com/wp-content/uploads/2025/11/P8700-F_Programmers_Reference_Manual-TM.pdf
[2] https://lore.kernel.org/linux-riscv/20261109051050.105623-5-joel@jms.id.au/
[3] https://training.mips.com/cps_mips/Examples/MD00901_Boot-MIPS_Example_Boot_Code_for_MIPS_Cores.pdf
[4] https://lore.kernel.org/all/20261026-lrsc-only-v3-0-ec29c8190fb1@mobileye.com/

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
Changes in v3:
- Drop the 'gf' vendor prefix patch. The prefix isn't used anywhere.
- Replace 'gf,mips-p8700-*' compatibles with 'mips,p8700-*'
  to match those already present in OpenSBI.
  Other compatibles are also renamed for consistency.
  Match the directory structure and binding names,
  by replacing 'gf' with 'mips' everywhere.
- Add a MAINTAINERS entry.
- Change the `aclint-mtimer` binding, reversing the decision made in v2
  and putting 'mtime' first when both 'mtime' and 'mtimecmp' are present.
- Link to v2: https://lore.kernel.org/r/20261103-p8700-dts-v2-0-3ac5d49f2c37@htecgroup.com

Changes in v2:
- Patch 1: Replace "MIPS Technology" with "MIPS Technologies".
- Patch 3: Name the FPGA used and add the versioned bitfile compatible.
- Patch 5: Drop hart indexes from MSWI.
- Patch 6: Swap mtimecmp and mtime, require reg-names both for mtime and mtimecmp on P8700.
- Original patch 7: Dropped.
- Patch 7 (previously 8): Remove additional harts that are not
  present in the bitfile I have. Reflect changes made in patches 3, 5 and 6.
  Remove riscv,cbom-block-size. Drop undocumented compatibles. Other minor changes.
- Link to v1: https://lore.kernel.org/r/20260914-p8700-dts-v1-0-3267f14ebce1@htecgroup.com

---
Aleksa Paunovic (8):
      dt-bindings: riscv: cpus: add mips,p8700
      dt-bindings: riscv: Add MIPS Boston board compatible
      dt-bindings: interrupt-controller: Add MIPS P8700 APLIC
      dt-bindings: interrupt-controller: Add MIPS P8700 ACLINT MSWI
      dt-bindings: timer: Add MIPS P8700 ACLINT MTIMER
      riscv: dts: mips: Initial support for the P8700 Boston board
      MAINTAINERS: Add entry for MIPS RISC-V SoC support
      riscv: defconfig: Enable MIPS SoCs

 .../bindings/interrupt-controller/riscv,aplic.yaml |   1 +
 .../thead,c900-aclint-mswi.yaml                    |  11 ++
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   1 +
 Documentation/devicetree/bindings/riscv/mips.yaml  |  33 +++++
 .../bindings/timer/thead,c900-aclint-mtimer.yaml   |  37 ++++++
 MAINTAINERS                                        |   7 ++
 arch/riscv/Kconfig.socs                            |   6 +
 arch/riscv/boot/dts/Makefile                       |   1 +
 arch/riscv/boot/dts/mips/Makefile                  |   2 +
 arch/riscv/boot/dts/mips/p8700-boston.dts          | 135 +++++++++++++++++++++
 arch/riscv/boot/dts/mips/p8700.dtsi                |  82 +++++++++++++
 arch/riscv/configs/defconfig                       |   1 +
 12 files changed, 317 insertions(+)
---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260325-p8700-dts-41788f014227

Best regards,
-- 
Aleksa Paunovic <aleksa.paunovic@htecgroup.com>


