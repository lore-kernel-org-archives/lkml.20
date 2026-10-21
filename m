Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576266;
	b=MXdEa+Dj4BXJxew56uua80xmSqWqKr20SB6T6g+hKoQviJDdbKPSNFJ+2lIlr6WV+qXO
	 /l7w82d9anjFgJKvrrbRdMHhJQvRFxSWVNpSMg+ZmnVs47YTw3a/8JXxHT23oePtiMzI/
	 4GaH4FweNHxRnruKwnQECWUnnFc8tXV5a6RPhliLBW1NgwWF9Q6XP3X06npSFXr6kHSFn
	 n5xW/RyPMVKt3NYviWbn6UGdj5DKEIs5vDod+zC1zfwO9UNXqqG42XwGIxIcGaAHxaVKz
	 ZORTPiA2o72miDHJ9Vfi6YfzSvfDTIiB84SCgp+bdpk74gDLMHfrsC/1WZffcIc3s8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576266;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:References:
	 Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=/1MjqpV3SUhKUEilWwfb6gwBOunZVhPIEX5B8H9DaFM=;
	b=MVxbP5rd+PdB2yVNOFWoiRJTpknVAo52sM0UkJVV8u1Z4Emy0CsnPAg1yjObxlHKntti
	 kzjDsSbWKuRZcKo1+M/v+0httAvnJIFPvSMFecWPLg7tbXiu33c3nbwJbkFquMeealire
	 gmzCbh7NSSRuDgmyOtd6cVgzsVumWMiqXzLTcB9uLgu7oRy0erXUrhWp+FmfZaWimtnx0
	 4xo+6FM+wkM2oRfCOdgZCKtMv9ncJBITmB+TRfiaNnMoGJIm9UOW94KNmfeqvdexkm+u7
	 HoISY4k9jAzy0d/ElRlTRfWhwHJeIs0XvLa09oSt++oq2JJdGIAbAOZVQvaJYl8ge3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UIBzK5DZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83FD606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UIBzK5DZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 942E61F000CD;
	Wed, 21 Oct 2026 09:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792576264;
	bh=/1MjqpV3SUhKUEilWwfb6gwBOunZVhPIEX5B8H9DaFM=;
	h=Date:From:To:Cc:Subject:References;
	b=UIBzK5DZg9kddKje7y1kvTxs+Hl4Cvug0okH6HKkSpfrhaOukRCKsqnWI24qRuH2c
	 X8i3Ng2lcE57nZIrGIfJFHU79C6DKr5lKSAJ9uUe5qeh+xmzJgd/0vtoDa6wBmJ6Ar
	 ST/XJbVu9PtBjtWpN5cyg1YJGOcby3rj9SHr7lLrNCwdgKukBoXiEO0/KElZtb8/51
	 f+JLJiTOITU3nd9kWY5fTq8topKUUQ3k47s/gT1MiLCPfIDktJQmzBGb8J85zPl6DQ
	 Tp1U1wMLaDCaU3TeeFe3Lq8GhmK5gd6Li+1H5sOl+BasbyEozivjM5kiacZmdOKOmJ
	 OKiVcIgwyWS8Q==
Date: Wed, 21 Oct 2026 11:51:01 +0200
From: Thomas Gleixner <tglx@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [GIT pull] irq/drivers for v7.4-rc1
References: <179257622431.804100.15107946105101279363.tglx@fw13>
Message-ID: <179257622554.804100.18080783403674327820.tglx@fw13>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Linus,

please pull the latest irq/drivers branch from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-drivers-2026=
-10-20

up to:  9376df349675: irqchip/al-fic: Support per-child affinity via interrup=
t redirection

Updates for interrupt chip drivers:

  - Remove the futile attempts to cleanup resources when the probing of the
    main interrupt chip fails for SiFIVE/PLIC devices. If that probe fails
    the system will stall immediately afterwards in the boot process
    without reaching a state where the error could be diagnosed. The lack
    of resource cleanup led to a frenzy of AI detected/assisted "fixes"
    which just make the code pretend to be correct for no value.

    Remove the existing half baked cleanup and immediately panic the
    machine when the probe fails. That's far more useful than letting it
    proceed and stall out a millisecond later with no information about the
    root cause.

  - A series of fixes for the ARM GIC-V3 driver addressing a potential
    double free, a bitmask overrun on 32-bit ARM and a OF node leak.

  - Automatically set the IRQ_DOMAIN_FLAG_DESTROY_GC when a interrupt
    domain is created that also allocates the generic interrupt chip during
    domain creation. That removes the requirement for manually setting the
    flag in the domain creation info structure when it contains a valid
    entry for allocating the generic interrupt chip. Remove the therefore
    redundant setters of IRQ_DOMAIN_FLAG_DESTROY_GC in the existing
    drivers.

  - Add support for Annapurna Labs FIC version 2 and 3 and implement
    affinity control for the demultiplexed interrupts by utilizing the
    recently merged interrupt redirection infrastructure.

  - Convert the ACPI device ID structures to named initializers

  - Consolidate the IPI related constants for RISC-V interrupt controllers

  - Add support for Qualcomm Purwa SoC interrupt chip and consolidate the
    workaround for the previous version in Hamoa SoCs.

  - The usual small fixes and improvements all over the place

Thanks,

	tglx

------------------>
Adrian Ng Ho Yin (1):
      irqchip/gic-v3: Add Altera SoCFPGA Agilex5 GIC600 DMA32 erratum workaro=
und

Andrew Davis (2):
      irqchip/pruss-intc: Use match data directly
      irqchip/pruss-intc: Use scoped lock guard and devm_mutex_init

Anirudha Sarangi (2):
      dt-bindings: interrupt-controller: Add Xilinx Versal NET SMMU CSR
      irqchip: Add Xilinx Versal NET SMMU CSR interrupt controller driver

Arnd Bergmann (1):
      irqchip/qcom-pdc: Fix linking against QCOM_SCM firmware

Au Dang (1):
      irqchip/renesas-rzv2h: Preserve TIEN state in rzv2h_tint_set_type()

Beno=C3=AEt Monin (3):
      irqchip/mips-gic: Fix unbalanced cm_core_lock in for_each_online_cpu_gi=
c()
      irqchip/mips-gic: Fix recursive acquisition of gic_lock in gic_set_affi=
nity()
      irqchip/mips-gic: Transfer interrupt mask state across clusters

Eliav Farber (9):
      irqchip/al-fic: Fix coding style issues
      irqchip/al-fic: Use %pe to print init error
      irqchip/al-fic: Use %pOF and raise init log level
      irqchip/al-fic: Keep the device_node instead of a cached name string
      irqchip/al-fic: Switch to shared parent interrupt
      dt-bindings: interrupt-controller: amazon,al-fic: Add mask selection
      irqchip/al-fic: Support error and fatal outputs and FIC v2
      irqchip/al-fic: Add support for FIC v3
      irqchip/al-fic: Support per-child affinity via interrupt redirection

Fuad Tabba (6):
      irqchip/gic-v3: Release the partition node in gic_irq_get_fwspec_info()
      irqchip/gic-v3-its: Don't clamp nvecs to zero when id_bits is 32
      irqchip/gic-v3-its: Clear vpt_page after freeing the pending table
      irqchip/gic-v3-its: Don't free a vPE table shared with another ITS
      irqchip/gic-v3-its: Don't free the tables of an enabled ITS
      irqchip/gic-v3: Don't register a redistributor that was never counted

GUO Ren (XuanTie) (5):
      riscv: smp: Move enum ipi_message_type to asm/smp.h
      riscv: sbi: Use IPI_MAX for SBI IPI muxing
      clocksource: clint: Use IPI_MAX for IPI muxing
      irqchip/aclint-sswi: Use IPI_MAX for IPI muxing
      irqchip/imsic: Use IPI_MAX instead of IMSIC_NR_IPI

Guangshuo Li (1):
      irqchip/imx-intmux: Fix runtime PM teardown on remove

Hemanth Selam (1):
      irqchip: Fix typos and repeated words in comments

Huacai Chen (1):
      irqchip/loongson-eiointc: Use pa_to_nid() rather than hard-code

Igor Velkov (1):
      irqchip/meson-gpio: Allow the GPIO interrupts to wake the system

Jiangshan Yi (1):
      irqchip/gic-v5: Install root IRQ handler last in gicv5_init_common()

Karl Mehltretter (3):
      irqchip/gic-v3-its: Don't WARN on LPI free allocation failure
      irqchip/atmel-aic[5]: Disable interrupts in the irq_pm_shutdown() callb=
acks
      irqchip/jcore-aic: Fix lost IPIs on SMP

Krzysztof Kozlowski (3):
      irqchip/qcom: Enable compile testing for QCOM_PDC and QCOM_MPM
      irqchip/qcom: Add defaults for desired SoC drivers
      arm64: defconfig: Drop redundant Qualcomm irqchip entries

Lorenzo Pieralisi (2):
      dt-bindings: interrupt-controller: gicv5: Relax IRS properties constrai=
nts
      irqchip/gic-v5: Fix standalone IRSes OF probe

Marc Zyngier (1):
      irqchip/gic: Simplify Maintenance Interrupt ACPI parsing

Maulik Shah (3):
      dt-bindings: interrupt-controller: qcom,pdc: Document Purwa PDC
      irqchip/qcom-pdc: Add purwa compatible for PDC secondary mode
      arm64: dts: qcom: purwa: Drop the Hamoa workaround for PDC

Nam Cao (1):
      irqchip/sifive-plic: Panic if initialization fails

Pawel Zalewski (1):
      irqchip: Use named initializers for acpi_device_id

Pengpeng Hou (4):
      irqchip/riscv-imsic: Use GENMASK for base address masks
      irqchip/mst-intc: Validate the DT interrupt range
      irqchip/sifive-plic: Avoid signed shift in interrupt enable mask
      irqchip/riscv-imsic: Reject overlapping group index fields

Prajwal N (1):
      irqchip/riscv-imsic: Expose the fwnode via the global config

Qingshuang Fu (3):
      irqdomain: Set IRQ_DOMAIN_FLAG_DESTROY_GC in __irq_domain_instantiate()
      irqchip/lan966x-oic: Drop redundant IRQ_DOMAIN_FLAG_DESTROY_GC
      soc/fsl/qe: qe_ports_ic: Drop redundant IRQ_DOMAIN_FLAG_DESTROY_GC

Triet Hoang (1):
      irqchip: st: Convert to DEFINE_SIMPLE_DEV_PM_OPS()

Vladimir Murzin (1):
      irqchip/gic-v3: Ensure change to DS is visible

Wentao Liang (1):
      irqchip/mchp-eic: Fix clock reference leak in mchp_eic_probe()

Zhu Ling (1):
      irqchip/gic: Fix UBSAN shift-out-of-bounds in GIC helpers


 Documentation/arch/arm64/silicon-errata.rst        |   3 +
 .../interrupt-controller/amazon,al-fic.yaml        |  16 +-
 .../bindings/interrupt-controller/arm,gic-v5.yaml  |   9 +-
 .../bindings/interrupt-controller/qcom,pdc.yaml    |   1 +
 .../xlnx,versal-net-smmu-csr.yaml                  |  75 ++++++
 MAINTAINERS                                        |  10 +
 arch/arm64/Kconfig                                 |   9 +
 arch/arm64/Kconfig.platforms                       |   1 +
 arch/arm64/boot/dts/qcom/purwa.dtsi                |   5 +
 arch/arm64/configs/defconfig                       |   2 -
 arch/riscv/include/asm/smp.h                       |  12 +
 arch/riscv/kernel/sbi-ipi.c                        |   4 +-
 arch/riscv/kernel/smp.c                            |  12 -
 drivers/clocksource/timer-clint.c                  |   4 +-
 drivers/irqchip/Kconfig                            |  16 +-
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-aclint-sswi.c                  |   4 +-
 drivers/irqchip/irq-al-fic.c                       | 255 +++++++++++++++----=
--
 drivers/irqchip/irq-atmel-aic.c                    |   2 +-
 drivers/irqchip/irq-atmel-aic5.c                   |   2 +-
 drivers/irqchip/irq-gic-common.c                   |   2 +-
 drivers/irqchip/irq-gic-v3-its.c                   |  25 +-
 drivers/irqchip/irq-gic-v3.c                       |  36 +--
 drivers/irqchip/irq-gic-v5-irs.c                   |   4 +
 drivers/irqchip/irq-gic-v5-iwb.c                   |   4 +-
 drivers/irqchip/irq-gic-v5.c                       |   9 +-
 drivers/irqchip/irq-gic.c                          |  12 +-
 drivers/irqchip/irq-imx-intmux.c                   |  15 +-
 drivers/irqchip/irq-jcore-aic.c                    |   4 +-
 drivers/irqchip/irq-lan966x-oic.c                  |   1 -
 drivers/irqchip/irq-loongson-eiointc.c             |   2 +-
 drivers/irqchip/irq-mbigen.c                       |   4 +-
 drivers/irqchip/irq-mchp-eic.c                     |   4 +-
 drivers/irqchip/irq-meson-gpio.c                   |   2 +-
 drivers/irqchip/irq-mips-gic.c                     |  59 +++--
 drivers/irqchip/irq-mst-intc.c                     |   3 +
 drivers/irqchip/irq-mtk-cirq.c                     |   2 +-
 drivers/irqchip/irq-pruss-intc.c                   |  38 ++-
 drivers/irqchip/irq-renesas-rzv2h.c                |   6 +-
 drivers/irqchip/irq-riscv-aplic-main.c             |   4 +-
 drivers/irqchip/irq-riscv-imsic-early.c            |   6 +-
 drivers/irqchip/irq-riscv-imsic-platform.c         |  18 +-
 drivers/irqchip/irq-riscv-imsic-state.c            |  23 +-
 drivers/irqchip/irq-riscv-imsic-state.h            |   4 -
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c            |   4 +-
 drivers/irqchip/irq-sifive-plic.c                  |  64 ++----
 drivers/irqchip/irq-sni-exiu.c                     |   4 +-
 drivers/irqchip/irq-st.c                           |   6 +-
 drivers/irqchip/irq-vic.c                          |   2 +-
 drivers/irqchip/irq-xilinx-smmu-csr.c              | 244 ++++++++++++++++++++
 drivers/irqchip/qcom-irq-combiner.c                |   2 +-
 drivers/irqchip/qcom-pdc.c                         |   3 +
 drivers/soc/fsl/qe/qe_ports_ic.c                   |   1 -
 include/linux/irqchip/riscv-imsic.h                |   3 +
 kernel/irq/irqdomain.c                             |   1 +
 55 files changed, 797 insertions(+), 267 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/xl=
nx,versal-net-smmu-csr.yaml
 create mode 100644 drivers/irqchip/irq-xilinx-smmu-csr.c

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch=
/arm64/silicon-errata.rst
index ac3248b9f2f3..25afa79266a4 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -53,6 +53,9 @@ stable kernels.
 | Allwinner      | A64/R18         | UNKNOWN1        | SUN50I_ERRATUM_UNKNOW=
N1     |
 +----------------+-----------------+-----------------+----------------------=
-------+
 +----------------+-----------------+-----------------+----------------------=
-------+
+| Altera         | SoCFPGA Agilex5 | 2.1.23          |ALTERA_ERRATUM_AGILEX5=
_2_1_23|
++----------------+-----------------+-----------------+----------------------=
-------+
++----------------+-----------------+-----------------+----------------------=
-------+
 | Ampere         | AmpereOne       | AC03_CPU_38     | AMPERE_ERRATUM_AC03_C=
PU_38  |
 +----------------+-----------------+-----------------+----------------------=
-------+
 | Ampere         | AmpereOne       | AC03_CPU_57     | N/A                  =
       |
diff --git a/Documentation/devicetree/bindings/interrupt-controller/amazon,al=
-fic.yaml b/Documentation/devicetree/bindings/interrupt-controller/amazon,al-=
fic.yaml
index 26bc05dee0bc..1ebf9a427f2f 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.ya=
ml
+++ b/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.ya=
ml
@@ -24,6 +24,19 @@ properties:
   interrupts:
     maxItems: 1
=20
+  amazon,al-fic-mask:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Selects which of the controller's severity outputs this group drives,
+      and thus which mask register the driver programs. A group has one cause
+      register and three severity outputs - info, error and fatal - each
+      gated by its own mask register. Each output is aggregated into a
+      separate interrupt tree, and a group belongs to exactly one of them.
+      The error and fatal outputs exist only on controller revisions that
+      implement them; earlier revisions provide the info output only.
+    enum: [info, error, fatal]
+    default: info
+
 required:
   - compatible
   - reg
@@ -39,8 +52,9 @@ examples:
=20
     interrupt-controller@fd8a8500 {
         compatible =3D "amazon,al-fic";
-        reg =3D <0xfd8a8500 0x1000>;
+        reg =3D <0xfd8a8500 0x40>;
         interrupt-controller;
         #interrupt-cells =3D <2>;
         interrupts =3D <GIC_SPI 0x0 IRQ_TYPE_LEVEL_HIGH>;
+        amazon,al-fic-mask =3D "error";
     };
diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v=
5.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.ya=
ml
index 86ca7f3ac281..b901e4288816 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
@@ -120,13 +120,14 @@ patternProperties:
=20
       cpus:
         description:
-          CPUs managed by the IRS.
+          CPUs managed by the IRS. Omit it if the IRS has no associated CPUs.
=20
       arm,iaffids:
         $ref: /schemas/types.yaml#/definitions/uint16-array
         description:
           Interrupt AFFinity ID (IAFFID) associated with the CPU whose
           CPU node phandle is at the same index in the cpus array.
+          Omit it if the IRS has no associated CPUs.
=20
     patternProperties:
       "^its@[0-9a-f]+$":
@@ -210,12 +211,14 @@ patternProperties:
           - reg
           - reg-names
=20
+    dependencies:
+      cpus: [ "arm,iaffids" ]
+      arm,iaffids: [ cpus ]
+
     required:
       - compatible
       - reg
       - reg-names
-      - cpus
-      - arm,iaffids
=20
 additionalProperties: false
=20
diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.=
yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d49a6..b3d19c86a240 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -58,6 +58,7 @@ properties:
           - qcom,sm8650-pdc
           - qcom,sm8750-pdc
           - qcom,x1e80100-pdc
+          - qcom,x1p42100-pdc
       - const: qcom,pdc
=20
   reg:
diff --git a/Documentation/devicetree/bindings/interrupt-controller/xlnx,vers=
al-net-smmu-csr.yaml b/Documentation/devicetree/bindings/interrupt-controller=
/xlnx,versal-net-smmu-csr.yaml
new file mode 100644
index 000000000000..38b63e51b732
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/xlnx,versal-net-=
smmu-csr.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/xlnx,versal-net-smmu=
-csr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx Versal NET SMMU CSR Interrupt Controller
+
+maintainers:
+  - Anirudha Sarangi <anirudha.sarangi@amd.com>
+  - Tushar Nimkar <tushar.nimkar@amd.com>
+
+description: |
+  The Versal NET platform includes a Xilinx-specific SMMU CSR (Control and
+  Status Register) block that acts as an intermediate interrupt controller
+  for ARM SMMUv3.
+
+  The block provides registers to enable, disable and clear the
+  standard SMMUv3 interrupt sources (EVENTQ, CMDQ_SYNC, GERROR and PRIQ)
+  before forwarding them to the parent interrupt controller,
+  typically a GIC.
+
+  The controller receives one parent interrupt and demultiplexes CSR
+  status bits into the following child interrupt identifiers
+    0 - EVENTQ
+    1 - CMDQ_SYNC
+    2 - GERROR (GLOBAL)
+    3 - PRIQ
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    const: xlnx,versal-net-smmu-csr
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 1
+    description: |
+     Single cell containing the child interrupt identifier
+      0 - EVENTQ
+      1 - CMDQ_SYNC
+      2 - GERROR (GLOBAL)
+      3 - PRIQ
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - "#interrupt-cells"
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    interrupt-controller@eca10000 {
+        compatible =3D "xlnx,versal-net-smmu-csr";
+        reg =3D <0xeca10000 0x1000>;
+        interrupt-controller;
+        #interrupt-cells =3D <1>;
+        interrupt-parent =3D <&gic>;
+        interrupts =3D <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..f6007e77445f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29913,6 +29913,16 @@ F:	Documentation/misc-devices/xilinx_sdfec.rst
 F:	drivers/misc/xilinx_sdfec.c
 F:	include/uapi/misc/xilinx_sdfec.h
=20
+XILINX SMMU CSR IRQ DRIVER
+M:	Anirudha Sarangi <anirudha.sarangi@amd.com>
+M:	Tushar Nimkar <tushar.nimkar@amd.com>
+L:	git@amd.com
+L:	linux-arm-kernel@lists.infradead.org
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/interrupt-controller/xlnx,versal-net-sm=
mu-csr.yaml
+F:	drivers/irqchip/irq-xilinx-smmu-csr.c
+
 XILINX TRNG DRIVER
 M:	Mounika Botcha <mounika.botcha@amd.com>
 M:	Harsh Jain <h.jain@amd.com>
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b5a51b0ef944..d25c77a15276 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1427,6 +1427,15 @@ config NVIDIA_OLYMPUS_1027_ERRATUM
=20
 	  If unsure, say Y.
=20
+config ALTERA_ERRATUM_AGILEX5_2_1_23
+	bool
+	help
+	  The Altera SoCFPGA Agilex5 GIC600 SoC integration has ACE-lite
+	  addressing limited to the first 32bit of physical address space,
+	  so the ITS cannot access memory above 4GB.
+
+	  Selected by ARCH_INTEL_SOCFPGA, as all Agilex5 devices are affected.
+
 config RENESAS_ERRATUM_GEN4GICITS1
 	bool "Renesas R-Car Gen4: GIC600 can not access physical addresses above 4 =
GiB"
 	default y
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index d2acfac73003..07127f7291db 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -361,6 +361,7 @@ config ARCH_SEATTLE
=20
 config ARCH_INTEL_SOCFPGA
 	bool "Intel's SoCFPGA ARMv8 Families"
+	select ALTERA_ERRATUM_AGILEX5_2_1_23
 	help
 	  This enables support for Intel's SoCFPGA ARMv8 families:
 	  Stratix 10 (ex. Altera), Stratix10 Software Virtual Platform,
diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/p=
urwa.dtsi
index c698e6cb2543..4348dd3d1dc5 100644
--- a/arch/arm64/boot/dts/qcom/purwa.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
@@ -224,6 +224,11 @@ &pcie6a_phy {
 	compatible =3D "qcom,x1p42100-qmp-gen4x4-pcie-phy";
 };
=20
+/* X1P42100 PDC is same as X1E80100, but without hardware register bug */
+&pdc {
+	compatible =3D "qcom,x1p42100-pdc", "qcom,pdc";
+};
+
 &qfprom {
 	gpu_speed_bin: gpu-speed-bin@119 {
 		reg =3D <0x119 0x2>;
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98..978e00891dca 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1743,8 +1743,6 @@ CONFIG_PWM_VISCONTI=3Dm
 CONFIG_PWM_XILINX=3Dm
 CONFIG_SL28CPLD_INTC=3Dy
 CONFIG_XILINX_INTC=3Dy
-CONFIG_QCOM_PDC=3Dy
-CONFIG_QCOM_MPM=3Dy
 CONFIG_TI_SCI_INTR_IRQCHIP=3Dy
 CONFIG_TI_SCI_INTA_IRQCHIP=3Dy
 CONFIG_RESET_GPIO=3Dm
diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index 0ecc67641b09..bed39fff1f8a 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -15,6 +15,18 @@
 struct seq_file;
 extern unsigned long boot_cpu_hartid;
=20
+enum ipi_message_type {
+	IPI_RESCHEDULE,
+	IPI_CALL_FUNC,
+	IPI_CPU_STOP,
+	IPI_CPU_CRASH_STOP,
+	IPI_IRQ_WORK,
+	IPI_TIMER,
+	IPI_CPU_BACKTRACE,
+	IPI_KGDB_ROUNDUP,
+	IPI_MAX
+};
+
 #ifdef CONFIG_SMP
=20
 #include <linux/jump_label.h>
diff --git a/arch/riscv/kernel/sbi-ipi.c b/arch/riscv/kernel/sbi-ipi.c
index 0cc5559c08d8..eeec178a9b95 100644
--- a/arch/riscv/kernel/sbi-ipi.c
+++ b/arch/riscv/kernel/sbi-ipi.c
@@ -57,7 +57,7 @@ void __init sbi_ipi_init(void)
 		return;
 	}
=20
-	virq =3D ipi_mux_create(BITS_PER_BYTE, sbi_send_ipi);
+	virq =3D ipi_mux_create(IPI_MAX, sbi_send_ipi);
 	if (virq <=3D 0) {
 		pr_err("unable to create muxed IPIs\n");
 		irq_dispose_mapping(sbi_ipi_virq);
@@ -75,7 +75,7 @@ void __init sbi_ipi_init(void)
 			  "irqchip/sbi-ipi:starting",
 			  sbi_ipi_starting_cpu, NULL);
=20
-	riscv_ipi_set_virq_range(virq, BITS_PER_BYTE);
+	riscv_ipi_set_virq_range(virq, IPI_MAX);
 	pr_info("providing IPIs using SBI IPI extension\n");
=20
 	/*
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index fa66f9c97d74..8930b62b15e7 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -28,18 +28,6 @@
 #include <asm/cacheflush.h>
 #include <asm/cpu_ops.h>
=20
-enum ipi_message_type {
-	IPI_RESCHEDULE,
-	IPI_CALL_FUNC,
-	IPI_CPU_STOP,
-	IPI_CPU_CRASH_STOP,
-	IPI_IRQ_WORK,
-	IPI_TIMER,
-	IPI_CPU_BACKTRACE,
-	IPI_KGDB_ROUNDUP,
-	IPI_MAX
-};
-
 static const char * const ipi_names[] =3D {
 	[IPI_RESCHEDULE]	=3D "Rescheduling interrupts",
 	[IPI_CALL_FUNC]		=3D "Function call interrupts",
diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-cl=
int.c
index 0bdd9d7ec545..e56eee7e3781 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -243,7 +243,7 @@ static int __init clint_timer_init_dt(struct device_node =
*np)
 	}
=20
 #ifdef CONFIG_SMP
-	rc =3D ipi_mux_create(BITS_PER_BYTE, clint_send_ipi);
+	rc =3D ipi_mux_create(IPI_MAX, clint_send_ipi);
 	if (rc <=3D 0) {
 		pr_err("unable to create muxed IPIs\n");
 		rc =3D (rc < 0) ? rc : -ENODEV;
@@ -251,7 +251,7 @@ static int __init clint_timer_init_dt(struct device_node =
*np)
 	}
=20
 	irq_set_chained_handler(clint_ipi_irq, clint_ipi_interrupt);
-	riscv_ipi_set_virq_range(rc, BITS_PER_BYTE);
+	riscv_ipi_set_virq_range(rc, IPI_MAX);
 	clint_clear_ipi();
 #endif
=20
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 20b77fbc51ee..136bab41f801 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -522,17 +522,19 @@ config GOLDFISH_PIC
=20
 config QCOM_PDC
 	tristate "Qualcomm PDC"
-	depends on ARCH_QCOM
+	depends on QCOM_SCM
 	select IRQ_DOMAIN_HIERARCHY
+	default ARCH_QCOM
 	help
 	  Power Domain Controller driver to manage and configure wakeup
 	  IRQs for Qualcomm Technologies Inc (QTI) mobile chips.
=20
 config QCOM_MPM
 	tristate "Qualcomm MPM"
-	depends on ARCH_QCOM
+	depends on ARCH_QCOM || COMPILE_TEST
 	depends on MAILBOX
 	select IRQ_DOMAIN_HIERARCHY
+	default ARCH_QCOM if ARM64
 	help
 	  MSM Power Manager driver to manage and configure wakeup
 	  IRQs for Qualcomm Technologies Inc (QTI) mobile chips.
@@ -840,4 +842,14 @@ config SUNPLUS_SP7021_INTC
 	  chained controller, routing all interrupt source in P-Chip to
 	  the primary controller on C-Chip.
=20
+config IRQCHIP_XILINX_SMMU_CSR
+	bool "Xilinx SMMU CSR Interrupt Driver"
+	depends on ARCH_ZYNQMP
+	select IRQ_DOMAIN
+	help
+	  This driver does the initial handling of SMMU interrupts before
+	  forwarding them to the ARM SMMU v3 driver.  It is intended for
+	  ZynqMP-class platforms where a vendor CSR block mediates SMMU
+	  interrupts.
+
 endmenu
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index ab33cccd8471..16a5fd126c9a 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -135,3 +135,4 @@ obj-$(CONFIG_APPLE_AIC)			+=3D irq-apple-aic.o
 obj-$(CONFIG_MCHP_EIC)			+=3D irq-mchp-eic.o
 obj-$(CONFIG_SOPHGO_SG2042_MSI)		+=3D irq-sg2042-msi.o
 obj-$(CONFIG_SUNPLUS_SP7021_INTC)	+=3D irq-sp7021-intc.o
+obj-$(CONFIG_IRQCHIP_XILINX_SMMU_CSR)	+=3D irq-xilinx-smmu-csr.o
diff --git a/drivers/irqchip/irq-aclint-sswi.c b/drivers/irqchip/irq-aclint-s=
swi.c
index ca06efd86fa1..5e010fc401f7 100644
--- a/drivers/irqchip/irq-aclint-sswi.c
+++ b/drivers/irqchip/irq-aclint-sswi.c
@@ -138,7 +138,7 @@ static int __init aclint_sswi_probe(struct fwnode_handle =
*fwnode)
 	}
=20
 	/* Register SSWI irq and handler */
-	virq =3D ipi_mux_create(BITS_PER_BYTE, aclint_sswi_ipi_send);
+	virq =3D ipi_mux_create(IPI_MAX, aclint_sswi_ipi_send);
 	if (virq <=3D 0) {
 		pr_err("unable to create muxed IPIs\n");
 		irq_dispose_mapping(sswi_ipi_virq);
@@ -152,7 +152,7 @@ static int __init aclint_sswi_probe(struct fwnode_handle =
*fwnode)
 			  aclint_sswi_starting_cpu,
 			  aclint_sswi_dying_cpu);
=20
-	riscv_ipi_set_virq_range(virq, BITS_PER_BYTE);
+	riscv_ipi_set_virq_range(virq, IPI_MAX);
=20
 	return 0;
 }
diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index d10ac9b63c99..e6068e0d0660 100644
--- a/drivers/irqchip/irq-al-fic.c
+++ b/drivers/irqchip/irq-al-fic.c
@@ -4,9 +4,9 @@
  */
=20
 #include <linux/bitfield.h>
+#include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
-#include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -16,11 +16,14 @@
 /* FIC Registers */
 #define AL_FIC_CAUSE		0x00
 #define AL_FIC_SET_CAUSE	0x08
-#define AL_FIC_MASK		0x10
+#define AL_FIC_INFO_MASK	0x10
 #define AL_FIC_CONTROL		0x28
+#define AL_FIC_ERROR_MASK	0x2c
+#define AL_FIC_FATAL_MASK	0x34
=20
 #define CONTROL_TRIGGER_RISING	BIT(3)
 #define CONTROL_MASK_MSI_X	BIT(5)
+#define CONTROL_VERSION_ID	GENMASK(29, 28)
=20
 #define NR_FIC_IRQS 32
=20
@@ -33,20 +36,51 @@ enum al_fic_state {
 	AL_FIC_CONFIGURED_RISING_EDGE,
 };
=20
+/*
+ * FIC hardware revision, as reported by the CONTROL register version field
+ * (CONTROL_VERSION_ID, bits 29-28). These are this driver's names for that
+ * field's encoding.
+ */
+enum al_fic_version {
+	AL_FIC_VERSION_V1,
+	AL_FIC_VERSION_V2,
+	AL_FIC_VERSION_V3,
+};
+
+enum al_fic_id {
+	AL_FIC_ID_INFO,
+	AL_FIC_ID_ERROR,
+	AL_FIC_ID_FATAL,
+	AL_FIC_ID_MAX,
+};
+
+/* Mask register offset for each interrupt group */
+static const unsigned int al_fic_mask_offset[AL_FIC_ID_MAX] =3D {
+	[AL_FIC_ID_INFO]  =3D AL_FIC_INFO_MASK,
+	[AL_FIC_ID_ERROR] =3D AL_FIC_ERROR_MASK,
+	[AL_FIC_ID_FATAL] =3D AL_FIC_FATAL_MASK,
+};
+
+/* amazon,al-fic-mask property value for each interrupt group */
+static const char * const al_fic_mask_name[AL_FIC_ID_MAX] =3D {
+	[AL_FIC_ID_INFO]  =3D "info",
+	[AL_FIC_ID_ERROR] =3D "error",
+	[AL_FIC_ID_FATAL] =3D "fatal",
+};
+
 struct al_fic {
-	void __iomem *base;
-	struct irq_domain *domain;
-	const char *name;
-	unsigned int parent_irq;
-	enum al_fic_state state;
+	void __iomem		*base;
+	struct irq_domain	*domain;
+	struct device_node	*node;
+	unsigned int		parent_irq;
+	enum al_fic_state	state;
 };
=20
-static void al_fic_set_trigger(struct al_fic *fic,
-			       struct irq_chip_generic *gc,
+static void al_fic_set_trigger(struct al_fic *fic, struct irq_chip_generic *=
gc,
 			       enum al_fic_state new_state)
 {
-	irq_flow_handler_t handler;
 	u32 control =3D readl_relaxed(fic->base + AL_FIC_CONTROL);
+	irq_flow_handler_t handler;
=20
 	if (new_state =3D=3D AL_FIC_CONFIGURED_LEVEL) {
 		handler =3D handle_level_irq;
@@ -89,30 +123,34 @@ static int al_fic_irq_set_type(struct irq_data *data, un=
signed int flow_type)
 	if (fic->state =3D=3D AL_FIC_UNCONFIGURED) {
 		al_fic_set_trigger(fic, gc, new_state);
 	} else if (fic->state !=3D new_state) {
-		pr_debug("fic %s state already configured to %d\n", fic->name, fic->state);
+		pr_debug("fic %pOF state already configured to %d\n", fic->node, fic->stat=
e);
 		return -EINVAL;
 	}
 	return 0;
 }
=20
-static void al_fic_irq_handler(struct irq_desc *desc)
+static irqreturn_t al_fic_irq_handler(int irq, void *data)
 {
-	struct al_fic *fic =3D irq_desc_get_handler_data(desc);
+	struct al_fic *fic =3D data;
 	struct irq_domain *domain =3D fic->domain;
-	struct irq_chip *irqchip =3D irq_desc_get_chip(desc);
 	struct irq_chip_generic *gc =3D irq_get_domain_generic_chip(domain, 0);
 	unsigned long pending;
 	u32 hwirq;
=20
-	chained_irq_enter(irqchip, desc);
-
 	pending =3D readl_relaxed(fic->base + AL_FIC_CAUSE);
 	pending &=3D ~gc->mask_cache;
=20
-	for_each_set_bit(hwirq, &pending, NR_FIC_IRQS)
-		generic_handle_domain_irq(domain, hwirq);
+	for_each_set_bit(hwirq, &pending, NR_FIC_IRQS) {
+		/*
+		 * Redirect a child whose affinity excludes this CPU to its
+		 * target CPU via irq_work. The ack moves to
+		 * al_fic_irq_pre_redirect(), because the whole flow handler is
+		 * deferred when that happens.
+		 */
+		generic_handle_demux_domain_irq(domain, hwirq);
+	}
=20
-	chained_irq_exit(irqchip, desc);
+	return pending ? IRQ_HANDLED : IRQ_NONE;
 }
=20
 static int al_fic_irq_retrigger(struct irq_data *data)
@@ -125,26 +163,53 @@ static int al_fic_irq_retrigger(struct irq_data *data)
 	return 1;
 }
=20
-static int al_fic_register(struct device_node *node,
-			   struct al_fic *fic)
+#ifdef CONFIG_SMP
+/* The ack happens in al_fic_irq_pre_redirect() on both paths instead. */
+static void al_fic_ack_noop(struct irq_data *data) { }
+
+/*
+ * Runs in the parent interrupt context on every dispatch, redirected or not.
+ * Clear the cause bit here: once the flow handler is deferred, the FIC keeps
+ * driving its output until the irq_work runs, and a level parent SPI re-fir=
es.
+ *
+ * A level configured group is masked too, because its cause bit re-latches
+ * while the input stays asserted; the deferred handle_level_irq() unmasks
+ * when the handler is done. An edge configured group is only acked, since
+ * handle_edge_irq() never unmasks unconditionally and the mask would stay.
+ */
+static void al_fic_irq_pre_redirect(struct irq_data *data)
+{
+	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(data);
+	struct al_fic *fic =3D gc->private;
+
+	if (fic->state =3D=3D AL_FIC_CONFIGURED_LEVEL)
+		irq_gc_mask_set_bit(data);
+
+	irq_gc_ack_clr_bit(data);
+}
+#endif /* CONFIG_SMP */
+
+static int al_fic_register(struct device_node *node, struct al_fic *fic, enu=
m al_fic_id fic_id)
 {
 	struct irq_chip_generic *gc;
 	int ret;
=20
-	fic->domain =3D irq_domain_create_linear(of_fwnode_handle(node),
-					    NR_FIC_IRQS,
-					    &irq_generic_chip_ops,
-					    fic);
+	fic->domain =3D irq_domain_create_linear(of_fwnode_handle(node), NR_FIC_IRQ=
S,
+					       &irq_generic_chip_ops, fic);
 	if (!fic->domain) {
 		pr_err("fail to add irq domain\n");
 		return -ENOMEM;
 	}
=20
-	ret =3D irq_alloc_domain_generic_chips(fic->domain,
-					     NR_FIC_IRQS,
-					     1, fic->name,
-					     handle_level_irq,
-					     0, 0, IRQ_GC_INIT_MASK_CACHE);
+	/*
+	 * Let irq_domain_remove() free the generic chips on either error path
+	 * below, instead of calling irq_domain_remove_generic_chips() by hand.
+	 */
+	fic->domain->flags |=3D IRQ_DOMAIN_FLAG_DESTROY_GC;
+
+	ret =3D irq_alloc_domain_generic_chips(fic->domain, NR_FIC_IRQS,
+					     1, of_node_full_name(fic->node), handle_level_irq,
+					     0, 0, 0);
 	if (ret) {
 		pr_err("fail to allocate generic chip (%d)\n", ret);
 		goto err_domain_remove;
@@ -152,47 +217,67 @@ static int al_fic_register(struct device_node *node,
=20
 	gc =3D irq_get_domain_generic_chip(fic->domain, 0);
 	gc->reg_base =3D fic->base;
-	gc->chip_types->regs.mask =3D AL_FIC_MASK;
+	gc->chip_types->regs.mask =3D al_fic_mask_offset[fic_id];
 	gc->chip_types->regs.ack =3D AL_FIC_CAUSE;
 	gc->chip_types->chip.irq_mask =3D irq_gc_mask_set_bit;
 	gc->chip_types->chip.irq_unmask =3D irq_gc_mask_clr_bit;
-	gc->chip_types->chip.irq_ack =3D irq_gc_ack_clr_bit;
 	gc->chip_types->chip.irq_set_type =3D al_fic_irq_set_type;
 	gc->chip_types->chip.irq_retrigger =3D al_fic_irq_retrigger;
+#ifdef CONFIG_SMP
+	/*
+	 * The FIC has no hardware affinity control, so give each child real
+	 * affinity by redirecting its handler to the target CPU.
+	 */
+	gc->chip_types->chip.irq_ack =3D al_fic_ack_noop;
+	gc->chip_types->chip.irq_pre_redirect =3D al_fic_irq_pre_redirect;
+	gc->chip_types->chip.irq_set_affinity =3D irq_chip_redirect_set_affinity;
+#else
+	gc->chip_types->chip.irq_ack =3D irq_gc_ack_clr_bit;
+#endif
 	gc->chip_types->chip.flags =3D IRQCHIP_SKIP_SET_WAKE;
 	gc->private =3D fic;
=20
-	irq_set_chained_handler_and_data(fic->parent_irq,
-					 al_fic_irq_handler,
-					 fic);
+	/*
+	 * Seed the mask cache with the value al_fic_wire_init() programmed,
+	 * rather than having the generic chip read the register back on the
+	 * first child mapping: that is later than the parent is requested, and
+	 * never happens at all for a group with no consumer in the devicetree.
+	 */
+	gc->mask_cache =3D ~0U;
+
+	ret =3D request_irq(fic->parent_irq, al_fic_irq_handler, IRQF_NO_THREAD | I=
RQF_SHARED,
+			  of_node_full_name(fic->node), fic);
+	if (ret) {
+		pr_err("fail to request irq (%d)\n", ret);
+		goto err_domain_remove;
+	}
+
 	return 0;
=20
 err_domain_remove:
 	irq_domain_remove(fic->domain);
-
 	return ret;
 }
=20
 /*
  * al_fic_wire_init() - initialize and configure fic in wire mode
- * @of_node: optional pointer to interrupt controller's device tree node.
+ * @node: pointer to the interrupt controller's device tree node
  * @base: mmio to fic register
- * @name: name of the fic
  * @parent_irq: interrupt of parent
+ * @fic_id: which of the controller's outputs (info, error or fatal) this
+ *          group drives
  *
- * This API will configure the fic hardware to to work in wire mode.
+ * This API will configure the fic hardware to work in wire mode.
  * In wire mode, fic hardware is generating a wire ("wired") interrupt.
  * Interrupt can be generated based on positive edge or level - configuratio=
n is
  * to be determined based on connected hardware to this fic.
  */
-static struct al_fic *al_fic_wire_init(struct device_node *node,
-				       void __iomem *base,
-				       const char *name,
-				       unsigned int parent_irq)
+static struct al_fic *al_fic_wire_init(struct device_node *node, void __iome=
m *base,
+				       unsigned int parent_irq, enum al_fic_id fic_id)
 {
+	u32 control, version_id;
 	struct al_fic *fic;
 	int ret;
-	u32 control =3D CONTROL_MASK_MSI_X;
=20
 	fic =3D kzalloc_obj(*fic);
 	if (!fic)
@@ -200,67 +285,110 @@ static struct al_fic *al_fic_wire_init(struct device_n=
ode *node,
=20
 	fic->base =3D base;
 	fic->parent_irq =3D parent_irq;
-	fic->name =3D name;
+	fic->node =3D of_node_get(node);
+
+	control =3D readl_relaxed(fic->base + AL_FIC_CONTROL);
+	version_id =3D FIELD_GET(CONTROL_VERSION_ID, control);
+	if (version_id =3D=3D AL_FIC_VERSION_V1 && fic_id !=3D AL_FIC_ID_INFO) {
+		pr_err("%pOF: amazon,al-fic-mask =3D \"%s\" not available on FIC v1\n",
+		       node, al_fic_mask_name[fic_id]);
+		ret =3D -EINVAL;
+		goto err_free;
+	}
=20
 	/* mask out all interrupts */
-	writel_relaxed(0xFFFFFFFF, fic->base + AL_FIC_MASK);
+	writel_relaxed(~0U, fic->base + AL_FIC_INFO_MASK);
+	if (version_id > AL_FIC_VERSION_V1) {
+		writel_relaxed(~0U, fic->base + AL_FIC_ERROR_MASK);
+		writel_relaxed(~0U, fic->base + AL_FIC_FATAL_MASK);
+	}
=20
 	/* clear any pending interrupt */
 	writel_relaxed(0, fic->base + AL_FIC_CAUSE);
=20
+	/* make sure the controller works in non msi_x mode */
+	control |=3D CONTROL_MASK_MSI_X;
 	writel_relaxed(control, fic->base + AL_FIC_CONTROL);
=20
-	ret =3D al_fic_register(node, fic);
+	ret =3D al_fic_register(node, fic, fic_id);
 	if (ret) {
 		pr_err("fail to register irqchip\n");
 		goto err_free;
 	}
=20
-	pr_debug("%s initialized successfully in Legacy mode (parent-irq=3D%u)\n",
-		 fic->name, parent_irq);
+	pr_info("%pOF initialized successfully (mask=3D%s parent-irq=3D%u)\n",
+		node, al_fic_mask_name[fic_id], parent_irq);
=20
 	return fic;
=20
 err_free:
+	of_node_put(fic->node);
 	kfree(fic);
 	return ERR_PTR(ret);
 }
=20
-static int __init al_fic_init_dt(struct device_node *node,
-				 struct device_node *parent)
+/*
+ * Parse the amazon,al-fic-mask property into an enum al_fic_id, selecting
+ * which of the controller's outputs this group drives. The property is
+ * optional; an absent property means the info output.
+ */
+static int al_fic_parse_mask(struct device_node *node, enum al_fic_id *fic_i=
d)
 {
+	const char *mask;
 	int ret;
-	void __iomem *base;
+
+	ret =3D of_property_read_string(node, "amazon,al-fic-mask", &mask);
+	if (ret =3D=3D -EINVAL) {
+		*fic_id =3D AL_FIC_ID_INFO;
+		return 0;
+	}
+	if (ret)
+		return ret;
+
+	ret =3D match_string(al_fic_mask_name, AL_FIC_ID_MAX, mask);
+	if (ret < 0)
+		return ret;
+
+	*fic_id =3D ret;
+	return 0;
+}
+
+static int __init al_fic_init_dt(struct device_node *node, struct device_nod=
e *parent)
+{
 	unsigned int parent_irq;
+	enum al_fic_id fic_id;
 	struct al_fic *fic;
+	void __iomem *base;
+	int ret;
=20
 	if (!parent) {
-		pr_err("%s: unsupported - device require a parent\n",
-		       node->name);
+		pr_err("%pOF: unsupported - device requires a parent\n", node);
 		return -EINVAL;
 	}
=20
+	ret =3D al_fic_parse_mask(node, &fic_id);
+	if (ret) {
+		pr_err("%pOF: invalid amazon,al-fic-mask\n", node);
+		return ret;
+	}
+
 	base =3D of_iomap(node, 0);
 	if (!base) {
-		pr_err("%s: fail to map memory\n", node->name);
+		pr_err("%pOF: fail to map memory\n", node);
 		return -ENOMEM;
 	}
=20
 	parent_irq =3D irq_of_parse_and_map(node, 0);
 	if (!parent_irq) {
-		pr_err("%s: fail to map irq\n", node->name);
+		pr_err("%pOF: fail to map irq\n", node);
 		ret =3D -EINVAL;
 		goto err_unmap;
 	}
=20
-	fic =3D al_fic_wire_init(node,
-			       base,
-			       node->name,
-			       parent_irq);
+	fic =3D al_fic_wire_init(node, base, parent_irq, fic_id);
+
 	if (IS_ERR(fic)) {
-		pr_err("%s: fail to initialize irqchip (%lu)\n",
-		       node->name,
-		       PTR_ERR(fic));
+		pr_err("%pOF: fail to initialize irqchip (%pe)\n", node, fic);
 		ret =3D PTR_ERR(fic);
 		goto err_irq_dispose;
 	}
@@ -271,7 +399,6 @@ static int __init al_fic_init_dt(struct device_node *node,
 	irq_dispose_mapping(parent_irq);
 err_unmap:
 	iounmap(base);
-
 	return ret;
 }
=20
diff --git a/drivers/irqchip/irq-atmel-aic.c b/drivers/irqchip/irq-atmel-aic.c
index 1dcc52760eca..4a7935e75e4d 100644
--- a/drivers/irqchip/irq-atmel-aic.c
+++ b/drivers/irqchip/irq-atmel-aic.c
@@ -123,7 +123,7 @@ static void aic_pm_shutdown(struct irq_data *d)
 {
 	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
=20
-	guard(raw_spinlock)(&gc->lock);
+	guard(raw_spinlock_irqsave)(&gc->lock);
 	irq_reg_writel(gc, 0xffffffff, AT91_AIC_IDCR);
 	irq_reg_writel(gc, 0xffffffff, AT91_AIC_ICCR);
 }
diff --git a/drivers/irqchip/irq-atmel-aic5.c b/drivers/irqchip/irq-atmel-aic=
5.c
index 1f14b401f71d..07a317ed06ef 100644
--- a/drivers/irqchip/irq-atmel-aic5.c
+++ b/drivers/irqchip/irq-atmel-aic5.c
@@ -217,7 +217,7 @@ static void aic5_pm_shutdown(struct irq_data *d)
 	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
 	int i;
=20
-	guard(raw_spinlock)(&bgc->lock);
+	guard(raw_spinlock_irqsave)(&bgc->lock);
 	for (i =3D 0; i < dgc->irqs_per_chip; i++) {
 		irq_reg_writel(bgc, i + gc->irq_base, AT91_AIC5_SSR);
 		irq_reg_writel(bgc, 1, AT91_AIC5_IDCR);
diff --git a/drivers/irqchip/irq-gic-common.c b/drivers/irqchip/irq-gic-commo=
n.c
index c776f9142610..8bd1eaa54295 100644
--- a/drivers/irqchip/irq-gic-common.c
+++ b/drivers/irqchip/irq-gic-common.c
@@ -48,7 +48,7 @@ void gic_enable_quirks(u32 iidr, const struct gic_quirk *qu=
irks,
 int gic_configure_irq(unsigned int irq, unsigned int type,
 		       void __iomem *base)
 {
-	u32 confmask =3D 0x2 << ((irq % 16) * 2);
+	u32 confmask =3D BIT(((irq % 16) * 2) + 1);
 	u32 confoff =3D (irq / 16) * 4;
 	u32 val, oldval;
 	int ret =3D 0;
diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-it=
s.c
index e9807af23537..282e4bafb084 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -87,6 +87,8 @@ struct its_baser {
 	u64		val;
 	u32		order;
 	u32		psz;
+	/* Inherited from a sibling ITS, not freed here */
+	bool		shared;
 };
=20
 struct its_device;
@@ -2248,7 +2250,8 @@ static unsigned long *its_lpi_alloc(int nr_irqs, u32 *b=
ase, int *nr_ids)
=20
 static void its_lpi_free(unsigned long *bitmap, u32 base, u32 nr_ids)
 {
-	WARN_ON(free_lpi_range(base, nr_ids));
+	if (free_lpi_range(base, nr_ids))
+		pr_err_ratelimited("ITS: failed to free LPI range %u:%u\n", base, nr_ids);
 	bitmap_free(bitmap);
 }
=20
@@ -2604,7 +2607,8 @@ static void its_free_tables(struct its_node *its)
=20
 	for (i =3D 0; i < GITS_BASER_NR_REGS; i++) {
 		if (its->tables[i].base) {
-			its_free_pages(its->tables[i].base, its->tables[i].order);
+			if (!its->tables[i].shared)
+				its_free_pages(its->tables[i].base, its->tables[i].order);
 			its->tables[i].base =3D NULL;
 		}
 	}
@@ -2703,6 +2707,7 @@ static int its_alloc_tables(struct its_node *its)
 				WARN_ON(i !=3D 2);
 				if ((sibling =3D find_sibling_its(its))) {
 					*baser =3D sibling->tables[2];
+					baser->shared =3D true;
 					its_write_baser(its, baser, baser->val);
 					continue;
 				}
@@ -3484,7 +3489,7 @@ static struct its_device *its_create_device(struct its_=
node *its, u32 dev_id,
 	 * Also honor the ITS's own EID limit.
 	 */
 	id_bits =3D FIELD_GET(GITS_TYPER_IDBITS, its->typer) + 1;
-	nvecs =3D min_t(unsigned int, nvecs, BIT(id_bits));
+	nvecs =3D min_t(u64, nvecs, BIT_ULL(id_bits));
 	nr_ites =3D max(2, nvecs);
 	sz =3D nr_ites * (FIELD_GET(GITS_TYPER_ITT_ENTRY_SIZE, its->typer) + 1);
 	sz =3D max(sz, ITS_ITT_ALIGN);
@@ -4599,6 +4604,7 @@ static void its_vpe_teardown(struct its_vpe *vpe)
 	its_vpe_db_proxy_unmap(vpe);
 	its_vpe_id_free(vpe->vpe_id);
 	its_free_pending_table(vpe->vpt_page);
+	vpe->vpt_page =3D NULL;
 }
=20
 static void its_vpe_irq_domain_free(struct irq_domain *domain,
@@ -4895,6 +4901,9 @@ static bool __maybe_unused its_enable_quirk_hip09_16210=
0801(void *data)
 }
=20
 static const char * const dma_32bit_impaired_platforms[] =3D {
+#ifdef CONFIG_ALTERA_ERRATUM_AGILEX5_2_1_23
+	"intel,socfpga-agilex5",
+#endif
 #ifdef CONFIG_RENESAS_ERRATUM_GEN4GICITS1
 	"renesas,r8a779f0",
 	"renesas,r8a779g0",
@@ -5328,16 +5337,18 @@ static int __init its_probe_one(struct its_node *its)
 	}
=20
 	gits_write_cwriter(0, its->base + GITS_CWRITER);
+
+	err =3D its_init_domain(its);
+	if (err)
+		goto out_free_collection;
+
+	/* Enable last: the unwind frees memory an enabled ITS may access */
 	ctlr =3D readl_relaxed(its->base + GITS_CTLR);
 	ctlr |=3D GITS_CTLR_ENABLE;
 	if (is_v4(its))
 		ctlr |=3D GITS_CTLR_ImDe;
 	writel_relaxed(ctlr, its->base + GITS_CTLR);
=20
-	err =3D its_init_domain(its);
-	if (err)
-		goto out_free_collection;
-
 	raw_spin_lock(&its_lock);
 	list_add(&its->entry, &its_nodes);
 	raw_spin_unlock(&its_lock);
diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 6e1fa5b247fc..94873646d46f 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -164,6 +164,7 @@ static inline bool gic_dist_security_disabled(void)
=20
 static bool cpus_have_security_disabled __ro_after_init;
 static bool cpus_have_group0 __ro_after_init;
+static void gic_dist_wait_for_rwp(void);
=20
 static void __init gic_prio_init(void)
 {
@@ -179,6 +180,7 @@ static void __init gic_prio_init(void)
 			val =3D readl_relaxed(gic_data.dist_base + GICD_CTLR);
 			val |=3D GICD_CTLR_DS;
 			writel_relaxed(val, gic_data.dist_base + GICD_CTLR);
+			gic_dist_wait_for_rwp();
=20
 			ds =3D gic_dist_security_disabled();
 			if (ds)
@@ -457,7 +459,7 @@ static int gic_peek_irq(struct irq_data *d, u32 offset)
 	u32 index, mask;
=20
 	offset =3D convert_offset_index(d, offset, &index);
-	mask =3D 1 << (index % 32);
+	mask =3D BIT(index % 32);
=20
 	if (gic_irq_in_rdist(d))
 		base =3D gic_data_rdist_sgi_base();
@@ -473,7 +475,7 @@ static void gic_poke_irq(struct irq_data *d, u32 offset)
 	u32 index, mask;
=20
 	offset =3D convert_offset_index(d, offset, &index);
-	mask =3D 1 << (index % 32);
+	mask =3D BIT(index % 32);
=20
 	if (gic_irq_in_rdist(d))
 		base =3D gic_data_rdist_sgi_base();
@@ -687,7 +689,7 @@ static void gic_eoimode1_eoi_irq(struct irq_data *d)
 {
 	/*
 	 * No need to deactivate an LPI, or an interrupt that
-	 * is is getting forwarded to a vcpu.
+	 * is getting forwarded to a vcpu.
 	 */
 	if (irqd_to_hwirq(d) >=3D 8192 || irqd_is_forwarded_to_vcpu(d))
 		return;
@@ -1728,8 +1730,6 @@ static int gic_irq_get_fwspec_info(struct irq_fwspec *f=
wspec, struct irq_fwspec_
=20
 	/* If the specifier provides an affinity, use it */
 	if (fwspec->param_count =3D=3D 4 && fwspec->param[3]) {
-		struct fwnode_handle *fw;
-
 		switch (fwspec->param[0]) {
 		case 1:			/* PPI */
 		case 3:			/* EPPI */
@@ -1738,7 +1738,10 @@ static int gic_irq_get_fwspec_info(struct irq_fwspec *=
fwspec, struct irq_fwspec_
 			return 0;
 		}
=20
-		fw =3D of_fwnode_handle(of_find_node_by_phandle(fwspec->param[3]));
+		struct device_node *np __free(device_node) =3D
+			of_find_node_by_phandle(fwspec->param[3]);
+		struct fwnode_handle *fw =3D of_fwnode_handle(np);
+
 		if (!fw)
 			return -ENOENT;
=20
@@ -2276,7 +2279,6 @@ static struct
 	bool single_redist;
 	int enabled_rdists;
 	u32 maint_irq;
-	int maint_irq_mode;
 	phys_addr_t vcpu_base;
 } acpi_data __initdata;
=20
@@ -2344,6 +2346,17 @@ gic_acpi_parse_madt_gicc(union acpi_subtable_headers *=
header,
 		return 0;
 	}
=20
+	/* Not counted by gic_acpi_match_gicc(), so there is no slot for it */
+	if (!gicc->gicr_base_address) {
+		int cpu =3D get_cpu_for_acpi_id(gicc->uid);
+
+		pr_warn(FW_BUG "GICC entry with ACPI UID %u has no GICR base address, CPU =
kept offline\n",
+			gicc->uid);
+		if (cpu >=3D 0)
+			cpumask_set_cpu(cpu, &broken_rdists);
+		return 0;
+	}
+
 	redist_base =3D ioremap(gicc->gicr_base_address, size);
 	if (!redist_base)
 		return -ENOMEM;
@@ -2454,21 +2467,19 @@ static int __init gic_acpi_parse_virt_madt_gicc(union=
 acpi_subtable_headers *hea
 {
 	struct acpi_madt_generic_interrupt *gicc =3D
 		(struct acpi_madt_generic_interrupt *)header;
-	int maint_irq_mode;
 	static int first_madt =3D true;
=20
 	if (!(gicc->flags &
 	      (ACPI_MADT_ENABLED | ACPI_MADT_GICC_ONLINE_CAPABLE)))
 		return 0;
=20
-	maint_irq_mode =3D (gicc->flags & ACPI_MADT_VGIC_IRQ_MODE) ?
-		ACPI_EDGE_SENSITIVE : ACPI_LEVEL_SENSITIVE;
+	if (gicc->flags & ACPI_MADT_VGIC_IRQ_MODE)
+		pr_warn_once(FW_BUG "MI wrongly advertised as Edge-triggered\n");
=20
 	if (first_madt) {
 		first_madt =3D false;
=20
 		acpi_data.maint_irq =3D gicc->vgic_interrupt;
-		acpi_data.maint_irq_mode =3D maint_irq_mode;
 		acpi_data.vcpu_base =3D gicc->gicv_base_address;
=20
 		return 0;
@@ -2478,7 +2489,6 @@ static int __init gic_acpi_parse_virt_madt_gicc(union a=
cpi_subtable_headers *hea
 	 * The maintenance interrupt and GICV should be the same for every CPU
 	 */
 	if ((acpi_data.maint_irq !=3D gicc->vgic_interrupt) ||
-	    (acpi_data.maint_irq_mode !=3D maint_irq_mode) ||
 	    (acpi_data.vcpu_base !=3D gicc->gicv_base_address))
 		return -EINVAL;
=20
@@ -2511,7 +2521,7 @@ static void __init gic_acpi_setup_kvm_info(void)
 	gic_v3_kvm_info.type =3D GIC_V3;
=20
 	irq =3D acpi_register_gsi(NULL, acpi_data.maint_irq,
-				acpi_data.maint_irq_mode,
+				ACPI_LEVEL_SENSITIVE,
 				ACPI_ACTIVE_HIGH);
 	if (irq <=3D 0)
 		return;
diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-ir=
s.c
index b3feb6340b59..53639e6f85bd 100644
--- a/drivers/irqchip/irq-gic-v5-irs.c
+++ b/drivers/irqchip/irq-gic-v5-irs.c
@@ -609,6 +609,10 @@ static int __init gicv5_irs_of_init_affinity(struct devi=
ce_node *node,
 	u16 iaffid_mask =3D GENMASK(iaffid_bits - 1, 0);
 	int ret, i, ncpus, niaffids;
=20
+	/* An IRS is architecturally allowed to have no cpus associated with it */
+	if (!of_property_present(node, "cpus") && !of_property_present(node, "arm,i=
affids"))
+		return 0;
+
 	ncpus =3D of_count_phandle_with_args(node, "cpus", NULL);
 	if (ncpus < 0)
 		return -EINVAL;
diff --git a/drivers/irqchip/irq-gic-v5-iwb.c b/drivers/irqchip/irq-gic-v5-iw=
b.c
index 442c20614dbe..34afa036c34d 100644
--- a/drivers/irqchip/irq-gic-v5-iwb.c
+++ b/drivers/irqchip/irq-gic-v5-iwb.c
@@ -282,8 +282,8 @@ MODULE_DEVICE_TABLE(of, gicv5_iwb_of_match);
=20
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id iwb_acpi_match[] =3D {
-	{ "ARMH0003", 0 },
-	{}
+	{ .id =3D "ARMH0003" },
+	{ }
 };
 #endif
=20
diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
index ac2d423b1723..c365f8150300 100644
--- a/drivers/irqchip/irq-gic-v5.c
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -1166,21 +1166,18 @@ static int __init gicv5_init_common(struct fwnode_han=
dle *parent_domain)
 	if (ret)
 		goto out_int;
=20
-	ret =3D set_handle_irq(gicv5_handle_irq);
+	ret =3D gicv5_irs_enable();
 	if (ret)
 		goto out_int;
=20
-	ret =3D gicv5_irs_enable();
-	if (ret)
-		goto out_handle;
+	if (set_handle_irq(gicv5_handle_irq))
+		panic("GICv5: unable to install root IRQ handler\n");
=20
 	gicv5_smp_init();
=20
 	gicv5_irs_its_probe();
 	return 0;
=20
-out_handle:
-	set_handle_irq(NULL);
 out_int:
 	gicv5_cpu_disable_interrupts();
 	gicv5_free_domains();
diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index f6bc29f515fb..a5ca04e9be64 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -178,14 +178,14 @@ static inline bool cascading_gic_irq(struct irq_data *d)
  */
 static void gic_poke_irq(struct irq_data *d, u32 offset)
 {
-	u32 mask =3D 1 << (irqd_to_hwirq(d) % 32);
+	u32 mask =3D BIT(irqd_to_hwirq(d) % 32);
=20
 	writel_relaxed(mask, gic_dist_base(d) + offset + (irqd_to_hwirq(d) / 32) * =
4);
 }
=20
 static int gic_peek_irq(struct irq_data *d, u32 offset)
 {
-	u32 mask =3D 1 << (irqd_to_hwirq(d) % 32);
+	u32 mask =3D BIT(irqd_to_hwirq(d) % 32);
=20
 	return !!(readl_relaxed(gic_dist_base(d) + offset + (irqd_to_hwirq(d) / 32)=
 * 4) & mask);
 }
@@ -1527,7 +1527,6 @@ static struct
 {
 	phys_addr_t cpu_phys_base;
 	u32 maint_irq;
-	int maint_irq_mode;
 	phys_addr_t vctrl_base;
 	phys_addr_t vcpu_base;
 } acpi_data __initdata;
@@ -1553,10 +1552,11 @@ gic_acpi_parse_madt_cpu(union acpi_subtable_headers *=
header,
 	if (cpu_base_assigned && gic_cpu_base !=3D acpi_data.cpu_phys_base)
 		return -EINVAL;
=20
+	if (processor->flags & ACPI_MADT_VGIC_IRQ_MODE)
+		pr_warn_once(FW_BUG "MI wrongly advertised as Edge-triggered\n");
+
 	acpi_data.cpu_phys_base =3D gic_cpu_base;
 	acpi_data.maint_irq =3D processor->vgic_interrupt;
-	acpi_data.maint_irq_mode =3D (processor->flags & ACPI_MADT_VGIC_IRQ_MODE) ?
-				    ACPI_EDGE_SENSITIVE : ACPI_LEVEL_SENSITIVE;
 	acpi_data.vctrl_base =3D processor->gich_base_address;
 	acpi_data.vcpu_base =3D processor->gicv_base_address;
=20
@@ -1616,7 +1616,7 @@ static void __init gic_acpi_setup_kvm_info(void)
 	vcpu_res->end =3D vcpu_res->start + ACPI_GICV2_VCPU_MEM_SIZE - 1;
=20
 	irq =3D acpi_register_gsi(NULL, acpi_data.maint_irq,
-				acpi_data.maint_irq_mode,
+				ACPI_LEVEL_SENSITIVE,
 				ACPI_ACTIVE_HIGH);
 	if (irq <=3D 0)
 		return;
diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-intmu=
x.c
index 47c2681d138a..de2a8f98f625 100644
--- a/drivers/irqchip/irq-imx-intmux.c
+++ b/drivers/irqchip/irq-imx-intmux.c
@@ -288,12 +288,16 @@ static int imx_intmux_probe(struct platform_device *pde=
v)
 static void imx_intmux_remove(struct platform_device *pdev)
 {
 	struct intmux_data *data =3D platform_get_drvdata(pdev);
-	int i;
+	int i, ret;
+
+	ret =3D pm_runtime_resume_and_get(&pdev->dev);
+	if (ret < 0)
+		dev_warn(&pdev->dev, "failed to resume device: %d\n", ret);
=20
 	for (i =3D 0; i < data->channum; i++) {
 		/* disable all interrupt sources of this channel */
-		writel_relaxed(0, data->regs + CHANIER(i));
-
+		if (ret >=3D 0)
+			writel_relaxed(0, data->regs + CHANIER(i));
 		irq_set_chained_handler_and_data(data->irqchip_data[i].irq,
 						 NULL, NULL);
=20
@@ -301,6 +305,11 @@ static void imx_intmux_remove(struct platform_device *pd=
ev)
 	}
=20
 	pm_runtime_disable(&pdev->dev);
+	if (ret >=3D 0) {
+		pm_runtime_put_noidle(&pdev->dev);
+		clk_disable_unprepare(data->ipg_clk);
+		pm_runtime_set_suspended(&pdev->dev);
+	}
 }
=20
 #ifdef CONFIG_PM
diff --git a/drivers/irqchip/irq-jcore-aic.c b/drivers/irqchip/irq-jcore-aic.c
index 94c05cf974be..b4fee02997ee 100644
--- a/drivers/irqchip/irq-jcore-aic.c
+++ b/drivers/irqchip/irq-jcore-aic.c
@@ -37,8 +37,10 @@ static struct irq_chip jcore_aic;
=20
 static void handle_jcore_irq(struct irq_desc *desc)
 {
-	if (irqd_is_per_cpu(irq_desc_get_irq_data(desc)))
+	if (irq_is_percpu_devid(irq_desc_get_irq(desc)))
 		handle_percpu_devid_irq(desc);
+	else if (irqd_is_per_cpu(irq_desc_get_irq_data(desc)))
+		handle_percpu_irq(desc);
 	else
 		handle_simple_irq(desc);
 }
diff --git a/drivers/irqchip/irq-lan966x-oic.c b/drivers/irqchip/irq-lan966x-=
oic.c
index 8af08d0e4182..5122f3f1b353 100644
--- a/drivers/irqchip/irq-lan966x-oic.c
+++ b/drivers/irqchip/irq-lan966x-oic.c
@@ -220,7 +220,6 @@ static int lan966x_oic_probe(struct platform_device *pdev)
 	};
 	struct irq_domain_info d_info =3D {
 		.fwnode		=3D of_fwnode_handle(pdev->dev.of_node),
-		.domain_flags	=3D IRQ_DOMAIN_FLAG_DESTROY_GC,
 		.size		=3D LAN966X_OIC_NR_IRQ,
 		.hwirq_max	=3D LAN966X_OIC_NR_IRQ,
 		.ops		=3D &irq_generic_chip_ops,
diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loo=
ngson-eiointc.c
index a9e8b481d31d..ba6e8480e383 100644
--- a/drivers/irqchip/irq-loongson-eiointc.c
+++ b/drivers/irqchip/irq-loongson-eiointc.c
@@ -454,7 +454,7 @@ static int __init pch_pic_parse_madt(union acpi_subtable_=
headers *header,
 					const unsigned long end)
 {
 	struct acpi_madt_bio_pic *pchpic_entry =3D (struct acpi_madt_bio_pic *)head=
er;
-	unsigned int node =3D (pchpic_entry->address >> 44) & 0xf;
+	unsigned int node =3D pa_to_nid(pchpic_entry->address) & 0xf;
 	struct irq_domain *parent =3D acpi_get_vec_parent(node, pch_group);
=20
 	if (parent)
diff --git a/drivers/irqchip/irq-mbigen.c b/drivers/irqchip/irq-mbigen.c
index 6f69f4e5dbac..3c54f2402aeb 100644
--- a/drivers/irqchip/irq-mbigen.c
+++ b/drivers/irqchip/irq-mbigen.c
@@ -259,8 +259,8 @@ static int mbigen_of_create_domain(struct platform_device=
 *pdev,
=20
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id mbigen_acpi_match[] =3D {
-	{ "HISI0152", 0 },
-	{}
+	{ .id =3D "HISI0152" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, mbigen_acpi_match);
=20
diff --git a/drivers/irqchip/irq-mchp-eic.c b/drivers/irqchip/irq-mchp-eic.c
index be007d325e67..5250e6baff63 100644
--- a/drivers/irqchip/irq-mchp-eic.c
+++ b/drivers/irqchip/irq-mchp-eic.c
@@ -233,7 +233,7 @@ static int mchp_eic_probe(struct platform_device *pdev, s=
truct device_node *pare
=20
 	ret =3D clk_prepare_enable(eic->clk);
 	if (ret)
-		goto unmap;
+		goto clk_put;
=20
 	for (i =3D 0; i < MCHP_EIC_NIRQ; i++) {
 		struct of_phandle_args irq;
@@ -270,6 +270,8 @@ static int mchp_eic_probe(struct platform_device *pdev, s=
truct device_node *pare
=20
 clk_unprepare:
 	clk_disable_unprepare(eic->clk);
+clk_put:
+	clk_put(eic->clk);
 unmap:
 	iounmap(eic->base);
 free:
diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpi=
o.c
index 91a9c337fe6d..e0329ef5e4a2 100644
--- a/drivers/irqchip/irq-meson-gpio.c
+++ b/drivers/irqchip/irq-meson-gpio.c
@@ -538,7 +538,7 @@ static struct irq_chip meson_gpio_irq_chip =3D {
 #ifdef CONFIG_SMP
 	.irq_set_affinity	=3D irq_chip_set_affinity_parent,
 #endif
-	.flags			=3D IRQCHIP_SET_TYPE_MASKED,
+	.flags			=3D IRQCHIP_SET_TYPE_MASKED | IRQCHIP_SKIP_SET_WAKE,
 };
=20
 static int meson_gpio_irq_domain_translate(struct irq_domain *domain,
diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 19a57c5e2b2e..be38989d8e73 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -70,6 +70,10 @@ static int __gic_with_next_online_cpu(int prev)
 {
 	unsigned int cpu;
=20
+	/* Release the redirect/other region lock to the previous CPU, if any. */
+	if (prev >=3D 0)
+		mips_cm_unlock_other();
+
 	/* Discover the next online CPU */
 	cpu =3D cpumask_next(prev, cpu_online_mask);
=20
@@ -77,23 +81,12 @@ static int __gic_with_next_online_cpu(int prev)
 	if (cpu >=3D nr_cpu_ids)
 		return cpu;
=20
-	/*
-	 * Move the access lock to the next CPU's GIC local register block.
-	 *
-	 * Set GIC_VL_OTHER. Since the caller holds gic_lock nothing can
-	 * clobber the written value.
-	 */
-	write_gic_vl_other(mips_cm_vp_id(cpu));
+	/* Lock access to redirect/other region to the next CPU */
+	mips_cm_lock_other_cpu(cpu, CM_GCR_Cx_OTHER_BLOCK_LOCAL);
=20
 	return cpu;
 }
=20
-static inline void gic_unlock_cluster(void)
-{
-	if (mips_cps_multicluster_cpus())
-		mips_cm_unlock_other();
-}
-
 /**
  * for_each_online_cpu_gic() - Iterate over online CPUs, access local regist=
ers
  * @cpu: An integer variable to hold the current CPU number
@@ -108,7 +101,6 @@ static inline void gic_unlock_cluster(void)
 	guard(raw_spinlock_irqsave)(gic_lock);		\
 	for ((cpu) =3D __gic_with_next_online_cpu(-1);	\
 	     (cpu) < nr_cpu_ids;			\
-	     gic_unlock_cluster(),			\
 	     (cpu) =3D __gic_with_next_online_cpu(cpu))
=20
 /**
@@ -305,14 +297,14 @@ static void gic_ack_irq(struct irq_data *d)
 	}
 }
=20
-static int gic_set_type(struct irq_data *d, unsigned int type)
+static int gic_set_type_locked(struct irq_data *d, unsigned int type)
 {
 	unsigned int irq, pol, trig, dual;
-	unsigned long flags;
+
+	lockdep_assert_held(&gic_lock);
=20
 	irq =3D GIC_HWIRQ_TO_SHARED(d->hwirq);
=20
-	raw_spin_lock_irqsave(&gic_lock, flags);
 	switch (type & IRQ_TYPE_SENSE_MASK) {
 	case IRQ_TYPE_EDGE_FALLING:
 		pol =3D GIC_POL_FALLING_EDGE;
@@ -359,11 +351,16 @@ static int gic_set_type(struct irq_data *d, unsigned in=
t type)
 	else
 		irq_set_chip_handler_name_locked(d, &gic_level_irq_controller,
 						 handle_level_irq, NULL);
-	raw_spin_unlock_irqrestore(&gic_lock, flags);
=20
 	return 0;
 }
=20
+static int gic_set_type(struct irq_data *d, unsigned int type)
+{
+	guard(raw_spinlock_irqsave)(&gic_lock);
+	return gic_set_type_locked(d, type);
+}
+
 #ifdef CONFIG_SMP
 static int gic_set_affinity(struct irq_data *d, const struct cpumask *cpumas=
k,
 			    bool force)
@@ -371,6 +368,7 @@ static int gic_set_affinity(struct irq_data *d, const str=
uct cpumask *cpumask,
 	unsigned int irq =3D GIC_HWIRQ_TO_SHARED(d->hwirq);
 	unsigned int cpu, cl, old_cpu, old_cl;
 	unsigned long flags;
+	bool enabled;
=20
 	/*
 	 * The GIC specifies that we can only route an interrupt to one VP(E),
@@ -392,15 +390,20 @@ static int gic_set_affinity(struct irq_data *d, const s=
truct cpumask *cpumask,
 	raw_spin_lock_irqsave(&gic_lock, flags);
=20
 	/*
-	 * If we're moving affinity between clusters, stop routing the
-	 * interrupt to any VP(E) in the old cluster.
+	 * If we're moving affinity between clusters, save the interrupt's
+	 * mask state, stop routing it to any VP(E) in the old cluster and
+	 * disable it there so it is no longer delivered.
 	 */
 	if (cl !=3D old_cl) {
 		if (gic_irq_lock_cluster(d)) {
+			enabled =3D read_gic_redir_mask(irq);
 			write_gic_redir_map_vp(irq, 0);
+			write_gic_redir_rmask(irq);
 			mips_cm_unlock_other();
 		} else {
+			enabled =3D read_gic_mask(irq);
 			write_gic_map_vp(irq, 0);
+			write_gic_rmask(irq);
 		}
 	}
=20
@@ -412,10 +415,20 @@ static int gic_set_affinity(struct irq_data *d, const s=
truct cpumask *cpumask,
=20
 	/*
 	 * If we're moving affinity between clusters, configure the interrupt
-	 * trigger type in the new cluster.
+	 * trigger type and, if it was enabled in the old cluster, enable it
+	 * in the new one.
 	 */
-	if (cl !=3D old_cl)
-		gic_set_type(d, irqd_get_trigger_type(d));
+	if (cl !=3D old_cl) {
+		gic_set_type_locked(d, irqd_get_trigger_type(d));
+		if (enabled) {
+			if (gic_irq_lock_cluster(d)) {
+				write_gic_redir_smask(irq);
+				mips_cm_unlock_other();
+			} else {
+				write_gic_smask(irq);
+			}
+		}
+	}
=20
 	/* Route the interrupt to its new VP(E) */
 	if (gic_irq_lock_cluster(d)) {
diff --git a/drivers/irqchip/irq-mst-intc.c b/drivers/irqchip/irq-mst-intc.c
index b5335f6fd6d6..1070de5de8cc 100644
--- a/drivers/irqchip/irq-mst-intc.c
+++ b/drivers/irqchip/irq-mst-intc.c
@@ -263,6 +263,9 @@ static int __init mst_intc_of_init(struct device_node *dn,
 	    of_property_read_u32_index(dn, "mstar,irqs-map-range", 1, &irq_end))
 		return -EINVAL;
=20
+	if (irq_end < irq_start || irq_end - irq_start >=3D MST_INTC_MAX_IRQS)
+		return -EINVAL;
+
 	cd =3D kzalloc_obj(*cd);
 	if (!cd)
 		return -ENOMEM;
diff --git a/drivers/irqchip/irq-mtk-cirq.c b/drivers/irqchip/irq-mtk-cirq.c
index 914d1d639fe3..d30c34ce0f56 100644
--- a/drivers/irqchip/irq-mtk-cirq.c
+++ b/drivers/irqchip/irq-mtk-cirq.c
@@ -247,7 +247,7 @@ static int mtk_cirq_suspend(void *data)
 		writel_relaxed(mask, reg);
 	}
=20
-	/* set edge_only mode, record edge-triggerd interrupts */
+	/* set edge_only mode, record edge-triggered interrupts */
 	/* enable cirq */
 	reg =3D mtk_cirq_reg(cirq_data, CIRQ_CONTROL);
 	value =3D readl_relaxed(reg);
diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss-int=
c.c
index 81078d56f38d..5a3e9e5bccbe 100644
--- a/drivers/irqchip/irq-pruss-intc.c
+++ b/drivers/irqchip/irq-pruss-intc.c
@@ -181,7 +181,7 @@ static void pruss_intc_map(struct pruss_intc *intc, unsig=
ned long hwirq)
 	u8 ch, host, reg_idx;
 	u32 val;
=20
-	mutex_lock(&intc->lock);
+	guard(mutex)(&intc->lock);
=20
 	intc->event_channel[hwirq].ref_count++;
=20
@@ -206,8 +206,6 @@ static void pruss_intc_map(struct pruss_intc *intc, unsig=
ned long hwirq)
=20
 	dev_dbg(dev, "mapped system_event =3D %lu channel =3D %d host =3D %d",
 		hwirq, ch, host);
-
-	mutex_unlock(&intc->lock);
 }
=20
 /**
@@ -224,7 +222,7 @@ static void pruss_intc_unmap(struct pruss_intc *intc, uns=
igned long hwirq)
 	u8 ch, host, reg_idx;
 	u32 val;
=20
-	mutex_lock(&intc->lock);
+	guard(mutex)(&intc->lock);
=20
 	ch =3D intc->event_channel[hwirq].value;
 	host =3D intc->channel_host[ch].value;
@@ -251,8 +249,6 @@ static void pruss_intc_unmap(struct pruss_intc *intc, uns=
igned long hwirq)
=20
 	dev_dbg(intc->dev, "unmapped system_event =3D %lu channel =3D %d host =3D %=
d\n",
 		hwirq, ch, host);
-
-	mutex_unlock(&intc->lock);
 }
=20
 static void pruss_intc_init(struct pruss_intc *intc)
@@ -376,17 +372,15 @@ static int pruss_intc_validate_mapping(struct pruss_int=
c *intc, int event,
 				       int channel, int host)
 {
 	struct device *dev =3D intc->dev;
-	int ret =3D 0;
=20
-	mutex_lock(&intc->lock);
+	guard(mutex)(&intc->lock);
=20
 	/* check if sysevent already assigned */
 	if (intc->event_channel[event].ref_count > 0 &&
 	    intc->event_channel[event].value !=3D channel) {
 		dev_err(dev, "event %d (req. ch %d) already assigned to channel %d\n",
 			event, channel, intc->event_channel[event].value);
-		ret =3D -EBUSY;
-		goto unlock;
+		return -EBUSY;
 	}
=20
 	/* check if channel already assigned */
@@ -394,16 +388,13 @@ static int pruss_intc_validate_mapping(struct pruss_int=
c *intc, int event,
 	    intc->channel_host[channel].value !=3D host) {
 		dev_err(dev, "channel %d (req. host %d) already assigned to host %d\n",
 			channel, host, intc->channel_host[channel].value);
-		ret =3D -EBUSY;
-		goto unlock;
+		return -EBUSY;
 	}
=20
 	intc->event_channel[event].value =3D channel;
 	intc->channel_host[channel].value =3D host;
=20
-unlock:
-	mutex_unlock(&intc->lock);
-	return ret;
+	return 0;
 }
=20
 static int
@@ -516,24 +507,21 @@ static const char * const irq_names[MAX_NUM_HOST_IRQS] =
=3D {
=20
 static int pruss_intc_probe(struct platform_device *pdev)
 {
-	const struct pruss_intc_match_data *data;
 	struct device *dev =3D &pdev->dev;
 	struct pruss_intc *intc;
 	struct pruss_host_irq_data *host_data;
 	int i, irq, ret;
 	u8 max_system_events, irqs_reserved =3D 0;
=20
-	data =3D of_device_get_match_data(dev);
-	if (!data)
-		return -ENODEV;
-
-	max_system_events =3D data->num_system_events;
-
 	intc =3D devm_kzalloc(dev, sizeof(*intc), GFP_KERNEL);
 	if (!intc)
 		return -ENOMEM;
=20
-	intc->soc_config =3D data;
+	intc->soc_config =3D of_device_get_match_data(dev);
+	if (!intc->soc_config)
+		return -ENODEV;
+	max_system_events =3D intc->soc_config->num_system_events;
+
 	intc->dev =3D dev;
 	platform_set_drvdata(pdev, intc);
=20
@@ -553,7 +541,9 @@ static int pruss_intc_probe(struct platform_device *pdev)
=20
 	pruss_intc_init(intc);
=20
-	mutex_init(&intc->lock);
+	ret =3D devm_mutex_init(dev, &intc->lock);
+	if (ret)
+		return ret;
=20
 	intc->domain =3D irq_domain_create_linear(dev_fwnode(dev), max_system_event=
s,
 						&pruss_intc_irq_domain_ops, intc);
diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesa=
s-rzv2h.c
index 1a4703a353e9..485c3eea7632 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -420,9 +420,9 @@ static void rzv2h_clear_tint_int(struct rzv2h_icu_priv *p=
riv, unsigned int hwirq
 static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
 {
 	u32 titsr, titsr_k, titsel_n, tien;
+	u32 titsr_cur, tssr_cur, tien_cur;
 	struct rzv2h_icu_priv *priv;
 	u32 tssr, tssr_k, tssel_n;
-	u32 titsr_cur, tssr_cur;
 	unsigned int hwirq;
 	u32 tint, sense;
 	int tint_nr;
@@ -477,6 +477,8 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsign=
ed int type)
 		if (tssr_cur =3D=3D tint && titsr_cur =3D=3D sense)
 			goto set_parent_type;
=20
+		tien_cur =3D tssr & tien;
+
 		tssr &=3D ~(ICU_TSSR_TSSEL_MASK(tssel_n, priv->info->field_width) | tien);
 		tssr |=3D ICU_TSSR_TSSEL_PREP(tint, tssel_n, priv->info->field_width);
=20
@@ -489,7 +491,7 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsign=
ed int type)
=20
 		rzv2h_clear_tint_int(priv, hwirq);
=20
-		writel_relaxed(tssr | tien, priv->base + priv->info->t_offs + ICU_TSSR(tss=
r_k));
+		writel_relaxed(tssr | tien_cur, priv->base + priv->info->t_offs + ICU_TSSR=
(tssr_k));
 	}
 set_parent_type:
 	return irq_chip_set_type_parent(d, IRQ_TYPE_LEVEL_HIGH);
diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-ris=
cv-aplic-main.c
index d9afb6ae98cf..1676d64e6e4a 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.c
+++ b/drivers/irqchip/irq-riscv-aplic-main.c
@@ -305,8 +305,8 @@ static void aplic_init_hw_irqs(struct aplic_priv *priv)
=20
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id aplic_acpi_match[] =3D {
-	{ "RSCV0002", 0 },
-	{}
+	{ .id =3D "RSCV0002" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, aplic_acpi_match);
=20
diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-ri=
scv-imsic-early.c
index 12efd241ce88..06726a062b75 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -67,15 +67,15 @@ static int __init imsic_ipi_domain_init(void)
 		return 0;
=20
 	/* Create IMSIC IPI multiplexing */
-	virq =3D ipi_mux_create(IMSIC_NR_IPI, imsic_ipi_send);
+	virq =3D ipi_mux_create(IPI_MAX, imsic_ipi_send);
 	if (virq <=3D 0)
 		return virq < 0 ? virq : -ENOMEM;
=20
 	/* Set vIRQ range */
-	riscv_ipi_set_virq_range(virq, IMSIC_NR_IPI);
+	riscv_ipi_set_virq_range(virq, IPI_MAX);
=20
 	/* Announce that IMSIC is providing IPIs */
-	pr_info("%pfwP: providing IPIs using interrupt %d\n", imsic->fwnode, IMSIC_=
IPI_ID);
+	pr_info("%pfwP: providing IPIs using interrupt %d\n", imsic->global.fwnode,=
 IMSIC_IPI_ID);
=20
 	return 0;
 }
diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq=
-riscv-imsic-platform.c
index 643c8e459611..95ff76e63a69 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -313,40 +313,40 @@ int imsic_irqdomain_init(void)
 	};
 	struct imsic_global_config *global;
=20
-	if (!imsic || !imsic->fwnode) {
+	if (!imsic || !imsic->global.fwnode) {
 		pr_err("early driver not probed\n");
 		return -ENODEV;
 	}
=20
 	if (imsic->base_domain) {
-		pr_err("%pfwP: irq domain already created\n", imsic->fwnode);
+		pr_err("%pfwP: irq domain already created\n", imsic->global.fwnode);
 		return -ENODEV;
 	}
=20
 	/* Create Base IRQ domain */
-	info.fwnode =3D imsic->fwnode,
+	info.fwnode =3D imsic->global.fwnode,
 	imsic->base_domain =3D msi_create_parent_irq_domain(&info, &imsic_msi_paren=
t_ops);
 	if (!imsic->base_domain) {
-		pr_err("%pfwP: failed to create IMSIC base domain\n", imsic->fwnode);
+		pr_err("%pfwP: failed to create IMSIC base domain\n", imsic->global.fwnode=
);
 		return -ENOMEM;
 	}
=20
 	global =3D &imsic->global;
 	pr_info("%pfwP:  hart-index-bits: %d,  guest-index-bits: %d\n",
-		imsic->fwnode, global->hart_index_bits, global->guest_index_bits);
+		imsic->global.fwnode, global->hart_index_bits, global->guest_index_bits);
 	pr_info("%pfwP: group-index-bits: %d, group-index-shift: %d\n",
-		imsic->fwnode, global->group_index_bits, global->group_index_shift);
+		imsic->global.fwnode, global->group_index_bits, global->group_index_shift);
 	pr_info("%pfwP: per-CPU IDs %d at base address %pa\n",
-		imsic->fwnode, global->nr_ids, &global->base_addr);
+		imsic->global.fwnode, global->nr_ids, &global->base_addr);
 	pr_info("%pfwP: total %d interrupts available\n",
-		imsic->fwnode, num_possible_cpus() * (global->nr_ids - 1));
+		imsic->global.fwnode, num_possible_cpus() * (global->nr_ids - 1));
=20
 	return 0;
 }
=20
 static int imsic_platform_probe_common(struct fwnode_handle *fwnode)
 {
-	if (imsic && imsic->fwnode !=3D fwnode) {
+	if (imsic && imsic->global.fwnode !=3D fwnode) {
 		pr_err("%pfwP: fwnode mismatch\n", fwnode);
 		return -ENODEV;
 	}
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-ri=
scv-imsic-state.c
index b8d1bbbf42f7..01620373b43a 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -7,6 +7,7 @@
 #define pr_fmt(fmt) "riscv-imsic: " fmt
 #include <linux/acpi.h>
 #include <linux/cpu.h>
+#include <linux/bits.h>
 #include <linux/bitmap.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
@@ -739,6 +740,14 @@ static int __init imsic_parse_fwnode(struct fwnode_handl=
e *fwnode,
 		return -EINVAL;
 	}
=20
+	/* Group index bits must not overlap guest and HART index bits. */
+	i =3D IMSIC_MMIO_PAGE_SHIFT + global->guest_index_bits +
+	    global->hart_index_bits;
+	if (global->group_index_bits && global->group_index_shift < i) {
+		pr_err("%pfwP: group index shift too small\n", fwnode);
+		return -EINVAL;
+	}
+
 	/* Sanity check group index shift */
 	i =3D global->group_index_bits + global->group_index_shift - 1;
 	if (i >=3D BITS_PER_LONG) {
@@ -769,9 +778,9 @@ static int __init imsic_parse_fwnode(struct fwnode_handle=
 *fwnode,
 		return -EINVAL;
 	}
 	global->base_addr =3D res.start;
-	global->base_addr &=3D ~(BIT(global->guest_index_bits +
-				   global->hart_index_bits +
-				   IMSIC_MMIO_PAGE_SHIFT) - 1);
+	global->base_addr &=3D ~GENMASK(global->guest_index_bits +
+				       global->hart_index_bits +
+				       IMSIC_MMIO_PAGE_SHIFT - 1, 0);
 	global->base_addr &=3D ~((BIT(global->group_index_bits) - 1) <<
 			       global->group_index_shift);
=20
@@ -813,9 +822,9 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode=
, void *opaque)
 	imsic =3D kzalloc_obj(*imsic);
 	if (!imsic)
 		return -ENOMEM;
-	imsic->fwnode =3D fwnode;
 	global =3D &imsic->global;
=20
+	global->fwnode =3D fwnode;
 	global->local =3D alloc_percpu(typeof(*global->local));
 	if (!global->local) {
 		rc =3D -ENOMEM;
@@ -850,9 +859,9 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode=
, void *opaque)
 		}
=20
 		base_addr =3D mmios[i].start;
-		base_addr &=3D ~(BIT(global->guest_index_bits +
-				   global->hart_index_bits +
-				   IMSIC_MMIO_PAGE_SHIFT) - 1);
+		base_addr &=3D ~GENMASK(global->guest_index_bits +
+				      global->hart_index_bits +
+				      IMSIC_MMIO_PAGE_SHIFT - 1, 0);
 		base_addr &=3D ~((BIT(global->group_index_bits) - 1) <<
 			       global->group_index_shift);
 		if (base_addr !=3D global->base_addr) {
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-ri=
scv-imsic-state.h
index c42ee180b305..189829b8673a 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -13,7 +13,6 @@
 #include <linux/timer.h>
=20
 #define IMSIC_IPI_ID				1
-#define IMSIC_NR_IPI				8
=20
 struct imsic_vector {
 	/* Fixed details of the vector */
@@ -44,9 +43,6 @@ struct imsic_local_priv {
 };
=20
 struct imsic_priv {
-	/* Device details */
-	struct fwnode_handle			*fwnode;
-
 	/* Global configuration common for all HARTs */
 	struct imsic_global_config		global;
=20
diff --git a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c b/drivers/irqchip/irq-ri=
scv-rpmi-sysmsi.c
index 612f3972f7af..bc80c38bb864 100644
--- a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
+++ b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
@@ -313,8 +313,8 @@ static const struct of_device_id rpmi_sysmsi_match[] =3D {
 };
=20
 static const struct acpi_device_id acpi_rpmi_sysmsi_match[] =3D {
-	{ "RSCV0006" },
-	{}
+	{ .id =3D "RSCV0006" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, acpi_rpmi_sysmsi_match);
=20
diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-p=
lic.c
index 5b0dac104814..55d94c49f083 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -108,7 +108,7 @@ static int plic_irq_set_type(struct irq_data *d, unsigned=
 int type);
 static void __plic_toggle(struct plic_handler *handler, int hwirq, int enabl=
e)
 {
 	u32 __iomem *base =3D handler->enable_base;
-	u32 hwirq_mask =3D 1 << (hwirq % 32);
+	u32 hwirq_mask =3D BIT(hwirq % 32);
 	int group =3D hwirq / 32;
 	u32 value;
=20
@@ -452,7 +452,7 @@ static irq_hw_number_t cp100_get_hwirq(struct plic_handle=
r *handler, void __iome
 		return 0;
=20
 	/*
-	 * Interrupts delievered to hardware still become pending, but only
+	 * Interrupts delivered to hardware still become pending, but only
 	 * interrupts that are both pending and enabled can be claimed.
 	 * Clearing the enable bit for all interrupts but the first pending
 	 * one avoids a hardware bug that occurs during read from the claim
@@ -538,8 +538,8 @@ static const struct of_device_id plic_match[] =3D {
 #ifdef CONFIG_ACPI
=20
 static const struct acpi_device_id plic_acpi_match[] =3D {
-	{ "RSCV0001", 0 },
-	{}
+	{ .id =3D "RSCV0001" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, plic_acpi_match);
=20
@@ -643,13 +643,11 @@ static int plic_probe(struct fwnode_handle *fwnode)
=20
 	error =3D plic_parse_nr_irqs_and_contexts(fwnode, &nr_irqs, &nr_contexts, &=
gsi_base, &id);
 	if (error)
-		goto fail_free_regs;
+		return error;
=20
 	priv =3D kzalloc_obj(*priv);
-	if (!priv) {
-		error =3D -ENOMEM;
-		goto fail_free_regs;
-	}
+	if (!priv)
+		return -ENOMEM;
=20
 	priv->fwnode =3D fwnode;
 	priv->plic_quirks =3D plic_quirks;
@@ -668,10 +666,8 @@ static int plic_probe(struct fwnode_handle *fwnode)
 	priv->acpi_plic_id =3D id;
=20
 	priv->prio_save =3D bitmap_zalloc(nr_irqs, GFP_KERNEL);
-	if (!priv->prio_save) {
-		error =3D -ENOMEM;
-		goto fail_free_priv;
-	}
+	if (!priv->prio_save)
+		return -ENOMEM;
=20
 	for (i =3D 0; i < nr_contexts; i++) {
 		error =3D plic_parse_context_parent(fwnode, i, &parent_hwirq, &cpu,
@@ -735,10 +731,8 @@ static int plic_probe(struct fwnode_handle *fwnode)
=20
 		handler->enable_save =3D kcalloc(priv->irq_groups, sizeof(*handler->enable=
_save),
 					       GFP_KERNEL);
-		if (!handler->enable_save) {
-			error =3D -ENOMEM;
-			goto fail_cleanup_contexts;
-		}
+		if (!handler->enable_save)
+			return -ENOMEM;
 done:
 		for_each_device_irq(hwirq, priv) {
 			plic_toggle(handler, hwirq, 0);
@@ -748,10 +742,8 @@ static int plic_probe(struct fwnode_handle *fwnode)
 	}
=20
 	priv->irqdomain =3D irq_domain_create_linear(fwnode, nr_irqs, &plic_irqdoma=
in_ops, priv);
-	if (WARN_ON(!priv->irqdomain)) {
-		error =3D -ENOMEM;
-		goto fail_cleanup_contexts;
-	}
+	if (!priv->irqdomain)
+		return -ENOMEM;
=20
 	/*
 	 * We can have multiple PLIC instances so setup global state
@@ -799,33 +791,13 @@ static int plic_probe(struct fwnode_handle *fwnode)
 	pr_info("%pfwP: mapped %d interrupts with %d handlers for %d contexts.\n",
 		fwnode, nr_irqs, nr_handlers, nr_contexts);
 	return 0;
-
-fail_cleanup_contexts:
-	for (i =3D 0; i < nr_contexts; i++) {
-		if (plic_parse_context_parent(fwnode, i, &parent_hwirq, &cpu, priv->acpi_p=
lic_id))
-			continue;
-		if (parent_hwirq !=3D RV_IRQ_EXT || cpu < 0)
-			continue;
-
-		handler =3D per_cpu_ptr(&plic_handlers, cpu);
-		handler->present =3D false;
-		handler->hart_base =3D NULL;
-		handler->enable_base =3D NULL;
-		kfree(handler->enable_save);
-		handler->enable_save =3D NULL;
-		handler->priv =3D NULL;
-	}
-	bitmap_free(priv->prio_save);
-fail_free_priv:
-	kfree(priv);
-fail_free_regs:
-	iounmap(regs);
-	return error;
 }
=20
 static int plic_platform_probe(struct platform_device *pdev)
 {
-	return plic_probe(pdev->dev.fwnode);
+	if (plic_probe(pdev->dev.fwnode))
+		panic("%pfwP: Failed to initialize\n", pdev->dev.fwnode);
+	return 0;
 }
=20
 static struct platform_driver plic_driver =3D {
@@ -842,7 +814,9 @@ builtin_platform_driver(plic_driver);
 static int __init plic_early_probe(struct device_node *node,
 				   struct device_node *parent)
 {
-	return plic_probe(&node->fwnode);
+	if (plic_probe(&node->fwnode))
+		panic("%pfwP: Failed to initialize\n", &node->fwnode);
+	return 0;
 }
=20
 IRQCHIP_DECLARE(riscv, "allwinner,sun20i-d1-plic", plic_early_probe);
diff --git a/drivers/irqchip/irq-sni-exiu.c b/drivers/irqchip/irq-sni-exiu.c
index bfd2adedf8f3..108d7f2e59c4 100644
--- a/drivers/irqchip/irq-sni-exiu.c
+++ b/drivers/irqchip/irq-sni-exiu.c
@@ -307,8 +307,8 @@ static int exiu_acpi_probe(struct platform_device *pdev)
 }
=20
 static const struct acpi_device_id exiu_acpi_ids[] =3D {
-	{ "SCX0008" },
-	{ /* sentinel */ }
+	{ .id =3D "SCX0008" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, exiu_acpi_ids);
=20
diff --git a/drivers/irqchip/irq-st.c b/drivers/irqchip/irq-st.c
index de71bb350d57..fef0521831aa 100644
--- a/drivers/irqchip/irq-st.c
+++ b/drivers/irqchip/irq-st.c
@@ -157,7 +157,7 @@ static int st_irq_syscfg_probe(struct platform_device *pd=
ev)
 	return st_irq_syscfg_enable(pdev);
 }
=20
-static int __maybe_unused st_irq_syscfg_resume(struct device *dev)
+static int st_irq_syscfg_resume(struct device *dev)
 {
 	struct st_irq_syscfg *ddata =3D dev_get_drvdata(dev);
=20
@@ -165,12 +165,12 @@ static int __maybe_unused st_irq_syscfg_resume(struct d=
evice *dev)
 				  ST_A9_IRQ_MASK, ddata->config);
 }
=20
-static SIMPLE_DEV_PM_OPS(st_irq_syscfg_pm_ops, NULL, st_irq_syscfg_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(st_irq_syscfg_pm_ops, NULL, st_irq_syscfg_re=
sume);
=20
 static struct platform_driver st_irq_syscfg_driver =3D {
 	.driver =3D {
 		.name =3D "st_irq_syscfg",
-		.pm =3D &st_irq_syscfg_pm_ops,
+		.pm =3D pm_sleep_ptr(&st_irq_syscfg_pm_ops),
 		.of_match_table =3D st_irq_syscfg_match,
 	},
 	.probe =3D st_irq_syscfg_probe,
diff --git a/drivers/irqchip/irq-vic.c b/drivers/irqchip/irq-vic.c
index e38104c5064e..607e3284f700 100644
--- a/drivers/irqchip/irq-vic.c
+++ b/drivers/irqchip/irq-vic.c
@@ -478,7 +478,7 @@ static void __init __vic_init(void __iomem *base, int par=
ent_irq, int irq_start,
 /**
  * vic_init() - initialise a vectored interrupt controller
  * @base: iomem base address
- * @irq_start: starting interrupt number, must be muliple of 32
+ * @irq_start: starting interrupt number, must be multiple of 32
  * @vic_sources: bitmask of interrupt sources to allow
  * @resume_sources: bitmask of interrupt sources to allow for resume
  */
diff --git a/drivers/irqchip/irq-xilinx-smmu-csr.c b/drivers/irqchip/irq-xili=
nx-smmu-csr.c
new file mode 100644
index 000000000000..9bb625598107
--- /dev/null
+++ b/drivers/irqchip/irq-xilinx-smmu-csr.c
@@ -0,0 +1,244 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Xilinx Versal Net SMMU CSR interrupt controller driver
+ *
+ * Copyright (C) 2026 Advanced Micro Devices, Inc.
+ *
+ * Vendor CSR block that gates the ARM SMMUv3 wired interrupts. Chains
+ * off the single GIC parent line and demultiplexes the CSR status into
+ * three children (eventq, gerror, priq), each enabled/acked
+ * via SMMU_CSR_IER/IDR/ISR that the ARM SMMUv3 driver requests individually.
+ */
+
+#include <linux/bitops.h>
+#include <linux/io.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+/* Interrupt types */
+#define SMMU_INTR_EVENT		BIT(0)
+#define SMMU_INTR_GLOBAL	BIT(2)
+#define SMMU_INTR_PRI		BIT(3)
+
+/* Mask for the SMMU interrupts this driver demultiplexes */
+#define SMMU_INTR_ALL		(SMMU_INTR_EVENT | SMMU_INTR_GLOBAL | SMMU_INTR_PRI)
+
+/* Every interrupt source the CSR block implements (incl. unsupported CMD_SY=
NC) */
+#define SMMU_INTR_HW_ALL	GENMASK(3, 0)
+
+#define SMMU_CSR_ISR		0x24	/* Interrupt Status (raw, W1C)   */
+#define SMMU_CSR_MASK		0x28	/* Interrupt Mask (RO): 1 =3D masked */
+#define SMMU_CSR_IER		0x2c	/* Interrupt Enable (W1 to unmask) */
+#define SMMU_CSR_IDR		0x30	/* Interrupt Disable (W1 to mask)  */
+
+/**
+ * struct xilinx_smmu_csr - SMMU CSR interrupt controller context
+ * @base:	MMIO base address of the CSR registers
+ * @domain:	Interrupt domain for the child interrupts
+ * @parent_irq:	parent (GIC) interrupt this block is chained to
+ * @lock:	protects the SMMU_CSR_IER/IDR/ISR read and writes
+ */
+struct xilinx_smmu_csr {
+	void __iomem		*base;
+	struct irq_domain	*domain;
+	int			parent_irq;
+	raw_spinlock_t		lock;
+};
+
+enum xilinx_smmu_csr_irq {
+	SMMU_CSR_IRQ_EVENTQ	=3D 0,
+	SMMU_CSR_IRQ_GERROR	=3D 2,
+	SMMU_CSR_IRQ_PRIQ	=3D 3,
+	SMMU_CSR_IRQ_NR,
+};
+
+static u32 xilinx_smmu_csr_hwirq_mask(irq_hw_number_t hwirq)
+{
+	if (hwirq >=3D SMMU_CSR_IRQ_NR)
+		return 0;
+
+	return BIT(hwirq) & SMMU_INTR_ALL;
+}
+
+static void xilinx_smmu_csr_irq_mask(struct irq_data *d)
+{
+	struct xilinx_smmu_csr *csr =3D irq_data_get_irq_chip_data(d);
+	u32 mask =3D xilinx_smmu_csr_hwirq_mask(d->hwirq);
+
+	if (!mask)
+		return;
+
+	guard(raw_spinlock)(&csr->lock);
+	writel(mask, csr->base + SMMU_CSR_IDR);
+}
+
+static void xilinx_smmu_csr_irq_unmask(struct irq_data *d)
+{
+	struct xilinx_smmu_csr *csr =3D irq_data_get_irq_chip_data(d);
+	u32 mask =3D xilinx_smmu_csr_hwirq_mask(d->hwirq);
+
+	if (!mask)
+		return;
+
+	guard(raw_spinlock)(&csr->lock);
+	writel(mask, csr->base + SMMU_CSR_IER);
+}
+
+static void xilinx_smmu_csr_irq_eoi(struct irq_data *d)
+{
+	struct xilinx_smmu_csr *csr =3D irq_data_get_irq_chip_data(d);
+	u32 mask =3D xilinx_smmu_csr_hwirq_mask(d->hwirq);
+
+	if (!mask)
+		return;
+
+	guard(raw_spinlock)(&csr->lock);
+	writel(mask, csr->base + SMMU_CSR_ISR);
+}
+
+static struct irq_chip xilinx_smmu_csr_chip =3D {
+	.name		=3D "xlnx-smmu-csr",
+	.irq_mask	=3D xilinx_smmu_csr_irq_mask,
+	.irq_unmask	=3D xilinx_smmu_csr_irq_unmask,
+	.irq_eoi	=3D xilinx_smmu_csr_irq_eoi,
+	/* Defer sticky ISR clear until the threaded SMMU handler drains it. */
+	.flags		=3D IRQCHIP_EOI_THREADED,
+};
+
+static void xilinx_smmu_csr_irq_handler(struct irq_desc *desc)
+{
+	struct xilinx_smmu_csr *csr =3D irq_desc_get_handler_data(desc);
+	struct irq_chip *chip =3D irq_desc_get_chip(desc);
+	u32 status, mask, active, pending, spurious;
+
+	chained_irq_enter(chip, desc);
+
+	/*
+	 * SMMU_CSR_ISR latches raw, pre-mask status, so gate it with the mask
+	 * register to only act on sources that are actually enabled.
+	 */
+	status =3D readl(csr->base + SMMU_CSR_ISR);
+	mask =3D readl(csr->base + SMMU_CSR_MASK);
+	active =3D status & ~mask;
+
+	/*
+	 * Defend against any enabled source this driver does not demultiplex
+	 * (e.g. CMD_SYNC). It would never be acked and would livelock the
+	 * parent line, so mask and clear it here.
+	 */
+	spurious =3D active & ~SMMU_INTR_ALL;
+	if (spurious) {
+		writel(spurious, csr->base + SMMU_CSR_IDR);
+		writel(spurious, csr->base + SMMU_CSR_ISR);
+	}
+
+	pending =3D active & SMMU_INTR_ALL;
+
+	while (pending) {
+		irq_hw_number_t hwirq =3D __ffs(pending);
+
+		if (generic_handle_domain_irq(csr->domain, hwirq)) {
+			/*
+			 * No mapped consumer: mask and clear so an unexpected
+			 * source cannot spin the parent line.
+			 */
+			writel(BIT(hwirq), csr->base + SMMU_CSR_IDR);
+			writel(BIT(hwirq), csr->base + SMMU_CSR_ISR);
+		}
+
+		pending &=3D ~BIT(hwirq);
+	}
+
+	chained_irq_exit(chip, desc);
+}
+
+static int xilinx_smmu_csr_domain_map(struct irq_domain *d, unsigned int vir=
q,
+				      irq_hw_number_t hwirq)
+{
+	struct xilinx_smmu_csr *csr =3D d->host_data;
+
+	if (!xilinx_smmu_csr_hwirq_mask(hwirq))
+		return -EINVAL;
+
+	irq_set_chip_and_handler(virq, &xilinx_smmu_csr_chip, handle_fasteoi_irq);
+	irq_set_chip_data(virq, csr);
+	irq_set_status_flags(virq, IRQ_LEVEL);
+
+	return 0;
+}
+
+static const struct irq_domain_ops xilinx_smmu_csr_domain_ops =3D {
+	.map	=3D xilinx_smmu_csr_domain_map,
+	.xlate	=3D irq_domain_xlate_onecell,
+};
+
+static int __init xilinx_smmu_csr_init(struct device_node *node, struct devi=
ce_node *parent)
+{
+	struct xilinx_smmu_csr *csr;
+	int ret;
+
+	if (WARN_ON_ONCE(!parent))
+		return -EINVAL;
+
+	if (irq_find_matching_fwnode(of_fwnode_handle(node), DOMAIN_BUS_ANY))
+		return -ENODEV;
+
+	csr =3D kzalloc(sizeof(*csr), GFP_KERNEL);
+	if (!csr)
+		return -ENOMEM;
+
+	raw_spin_lock_init(&csr->lock);
+
+	csr->base =3D of_iomap(node, 0);
+	if (!csr->base) {
+		ret =3D -ENOMEM;
+		goto free;
+	}
+
+	/*
+	 * Start from a known state: mask and clear *every* source the block
+	 * implements, including CMD_SYNC (bit 1) which this driver does not
+	 * service. The CSR ORs (status & ~mask) onto a single parent line, so
+	 * a source left unmasked and latched by a prior boot stage (firmware,
+	 * kexec) would assert the line forever with no one to ack it. Masking
+	 * the whole set here makes that impossible; the ARM SMMUv3 driver
+	 * unmasks the sources it needs via the child irq_unmask() callbacks.
+	 */
+	writel(SMMU_INTR_HW_ALL, csr->base + SMMU_CSR_IDR);
+	writel(SMMU_INTR_HW_ALL, csr->base + SMMU_CSR_ISR);
+
+	csr->domain =3D irq_domain_create_linear(of_fwnode_handle(node), SMMU_CSR_I=
RQ_NR,
+					       &xilinx_smmu_csr_domain_ops, csr);
+	if (!csr->domain) {
+		pr_err("%pOF: failed to create irq domain\n", node);
+		ret =3D -ENOMEM;
+		goto unmap;
+	}
+
+	csr->parent_irq =3D irq_of_parse_and_map(node, 0);
+	if (!csr->parent_irq) {
+		pr_err("%pOF: failed to map parent irq\n", node);
+		ret =3D -EINVAL;
+		goto remove_domain;
+	}
+
+	irq_set_chained_handler_and_data(csr->parent_irq, xilinx_smmu_csr_irq_handl=
er, csr);
+
+	pr_debug("%pOF: Xilinx SMMU CSR interrupt controller registered\n", node);
+
+	return 0;
+
+remove_domain:
+	irq_domain_remove(csr->domain);
+unmap:
+	iounmap(csr->base);
+free:
+	kfree(csr);
+	return ret;
+}
+
+IRQCHIP_DECLARE(xilinx_smmu_csr, "xlnx,versal-net-smmu-csr", xilinx_smmu_csr=
_init);
diff --git a/drivers/irqchip/qcom-irq-combiner.c b/drivers/irqchip/qcom-irq-c=
ombiner.c
index 09819007d08e..6d83e1e4a7ea 100644
--- a/drivers/irqchip/qcom-irq-combiner.c
+++ b/drivers/irqchip/qcom-irq-combiner.c
@@ -262,7 +262,7 @@ static int combiner_probe(struct platform_device *pdev)
 }
=20
 static const struct acpi_device_id qcom_irq_combiner_ids[] =3D {
-	{ "QCOM80B1", },
+	{ .id =3D "QCOM80B1" },
 	{ }
 };
=20
diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index ce6d80c7f17a..29025a212ece 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -715,7 +715,10 @@ static int qcom_pdc_probe(struct platform_device *pdev, =
struct device_node *pare
 		}
=20
 		pdc->x1e_quirk =3D true;
+	}
=20
+	if (of_device_is_compatible(node, "qcom,x1e80100-pdc") ||
+	    of_device_is_compatible(node, "qcom,x1p42100-pdc")) {
 		if (!qcom_scm_is_available())
 			return -EPROBE_DEFER;
=20
diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_ports_i=
c.c
index 7375f92f528b..fb3b92039547 100644
--- a/drivers/soc/fsl/qe/qe_ports_ic.c
+++ b/drivers/soc/fsl/qe/qe_ports_ic.c
@@ -140,7 +140,6 @@ static int qepic_probe(struct platform_device *pdev)
 	};
 	struct irq_domain_info d_info =3D {
 		.fwnode =3D of_fwnode_handle(pdev->dev.of_node),
-		.domain_flags =3D IRQ_DOMAIN_FLAG_DESTROY_GC,
 		.size =3D 32,
 		.hwirq_max =3D 32,
 		.ops =3D &irq_generic_chip_ops,
diff --git a/include/linux/irqchip/riscv-imsic.h b/include/linux/irqchip/risc=
v-imsic.h
index 61af3a5bea09..b7be1aad7774 100644
--- a/include/linux/irqchip/riscv-imsic.h
+++ b/include/linux/irqchip/riscv-imsic.h
@@ -46,6 +46,9 @@ struct imsic_local_config {
 };
=20
 struct imsic_global_config {
+	/* Device details */
+	struct fwnode_handle                    *fwnode;
+
 	/*
 	 * MSI Target Address Scheme
 	 *
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 57c819da30c2..4fdcb6df5306 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -344,6 +344,7 @@ static struct irq_domain *__irq_domain_instantiate(const =
struct irq_domain_info
 		err =3D irq_domain_alloc_generic_chips(domain, info->dgc_info);
 		if (err)
 			goto err_domain_free;
+		domain->flags |=3D IRQ_DOMAIN_FLAG_DESTROY_GC;
 	}
=20
 	if (info->init) {

