Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFB847607D;
	Mon, 14 Sep 2026 13:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394166; cv=none; b=hBZU1mCmF60bVX3L7ecxoWgdVtbxf0q8EB0pjfICTcuX1uYRS3bs5hPU0B8FrVBaTh7wwJ/27swntf5JwGC+XfE4/zf8ii11ZakQCXk5eGsP9om4L+JWbd8dzGcv/Rw9gWF1SncjNh1jvri0JmK42LNy3MLGmfbazZCrQqZAuTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394166; c=relaxed/simple;
	bh=7jdC3mCJGK7YRFcCsKAD6aSk41abImKWxLkjzGiWz94=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LznA9rSFaY6S36G5cyffueIe0lF3amoAk3XpgUWyU3R1fRooCNCylwlEYhYqw6XU5i6b797PEjwVNzf3pG42gEGOPJdYjJYXcamGEePxemOQQvi4UpQBaACa1Iz+XGBocgNXy1sIOjjZZSvULsVzx9nGIaK5+MfwyOIVI6ilShA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2KgjLPD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2KgjLPD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49005C2BCF5;
	Mon, 14 Sep 2026 13:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789394166;
	bh=7jdC3mCJGK7YRFcCsKAD6aSk41abImKWxLkjzGiWz94=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=X2KgjLPDCsA29u5Af3+q2uSKJCHh/m2xLdcq26CykTIoPCpw0rnt8o8DKnzT4Xxso
	 AIAmw8HoD0ULLk/o1X4/XAP+T7BOQz1PKdBYQZNCh8znuoSFMe/EGIhia5wAZWz4uL
	 IN5tHHG5WYc+OgK24doBlb7sYfQcsQpds5ZQ1ftJhmamfcgzPESoLXmpjq46B9N9jM
	 i1kfdynlLhy6EeWg1C1HcJA051huQxtjGCPm1MZCqKQLebwu0Hhkuv7fTs0UBUdnFW
	 6O8xRNKo3fAQB4tZQUq3A9H6gzbsbq2m+/BFxI5OLVW317CaFV77k7/9krkmxAnwQH
	 6+XeFSwp+UlXw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20160C88E72;
	Mon, 14 Sep 2026 13:56:06 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Subject: [PATCH 0/9] Add support for MIPS P8700
Date: Mon, 14 Sep 2026 15:55:48 +0200
Message-Id: <20260914-p8700-dts-v1-0-3267f14ebce1@htecgroup.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOT8p2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyNT3QILcwMD3ZSSYl0TQ3MLizQDQxMjI3MloPqCotS0zAqwWdGxtbU
 ArSw/rlsAAAA=
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
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789394164; l=2896;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=7jdC3mCJGK7YRFcCsKAD6aSk41abImKWxLkjzGiWz94=;
 b=JintBkARbvNpCNvweqJQ9m3O2JfZ4/J9g7l7JFkD4+5cf3PJBYhzD3FJUkGivq7FLh4XCzn7E
 aQvuaItwt8TDrNWbQul4ZoM2A8kT1kEbyMTrMYl5/UrDy30R/Fhxb3f
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
intentionally does not reflect this fact.

GlobalFoundries has acquired MIPS [2] and the vendor prefix
for all MIPS RISC-V hardware has been updated to reflect that fact.

All my series so far have used the dts the current one was based on,
with mostly cosmetic changes. Nevertheless, I tested this series
both on QEMU and a Boston board configured with a single P8700 CPU,
after applying the necessary U-Boot and OpenSBI changes
to match the 'compatible' strings. We are planning to upstream these
as well.

Links:
[1] https://mips.com/wp-content/uploads/2025/11/P8700-F_Programmers_Reference_Manual-TM.pdf
[2] https://gf.com/news-and-events/news/globalfoundries-completes-acquisition-of-mips/

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
Aleksa Paunovic (9):
      dt-bindings: vendor-prefixes: Add GlobalFoundries, Inc.
      dt-bindings: riscv: cpus: add gf,mips-p8700
      dt-bindings: riscv: Add MIPS Boston board compatible
      dt-bindings: interrupt-controller: Add MIPS P8700 APLIC
      dt-bindings: interrupt-controller: Add MIPS P8700 ACLINT MSWI
      dt-bindings: timer: Add MIPS P8700 ACLINT MTIMER
      dt-bindings: interrupt-controller: thead,c900-aclint-sswi: Add MIPS P8700 gf compatible
      riscv: dts: gf: Initial support for the P8700 Boston board
      riscv: defconfig: Enable GF SoCs

 .../bindings/interrupt-controller/riscv,aplic.yaml |   1 +
 .../thead,c900-aclint-mswi.yaml                    |  34 +++
 .../thead,c900-aclint-sswi.yaml                    |   3 +
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   1 +
 Documentation/devicetree/bindings/riscv/gf.yaml    |  27 +++
 .../bindings/timer/thead,c900-aclint-mtimer.yaml   |  43 +++-
 .../devicetree/bindings/vendor-prefixes.yaml       |   4 +-
 arch/riscv/Kconfig.socs                            |   6 +
 arch/riscv/boot/dts/Makefile                       |   1 +
 arch/riscv/boot/dts/gf/Makefile                    |   2 +
 arch/riscv/boot/dts/gf/p8700-boston.dts            | 135 ++++++++++++
 arch/riscv/boot/dts/gf/p8700.dtsi                  | 241 +++++++++++++++++++++
 arch/riscv/configs/defconfig                       |   1 +
 13 files changed, 494 insertions(+), 5 deletions(-)
---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260325-p8700-dts-41788f014227

Best regards,
-- 
Aleksa Paunovic <aleksa.paunovic@htecgroup.com>


