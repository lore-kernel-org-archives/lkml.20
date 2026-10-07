Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00EB36A341
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 18:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791399040; cv=pass; b=u374BlxFaPYCcCxPUNSWttvDH5GrYQ9p1HycQuCpkhbbmtj8tAcizYAFA0mhgjOixwfx/BHuoi/64s060EdvEit0hdF8/Rdp/tjOgjBCaJ+gzhoJ8GymFhCBFAD3h9OHKRO67xo54wiNvwWl31nJn/HJpHCPKs6OhwQ6dn41rMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791399040; c=relaxed/simple;
	bh=PO6v3wiPZFZUp/INJifTEu7rAN9EOhpbkOKEaySEigU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HlwAGpPMKhAaafNia2iWjkgLvKOO9inCP0ceuxEW3ICAfa8+J8yPKFAPgBW8Er9uPmIgLJMR5rt0ls9jYa4aD81LGltesDyu1Zoqzlq9CYcrjgHppYewThrqMrYxY28/YEJ1v3tUIqhtwkaBpjXEMn+SiXOdHfBnIPapww9aSCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZqknt+/; arc=pass smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZqknt+/"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-917866225aaso25660026d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:50:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791399037; cv=none;
        d=google.com; s=arc-20260327;
        b=EaXQUoLXwO0d2VHC9lc1prcVuxBtHZpOBhywph8hBMruoqJQZ0R1W0Foq+hcUwzTMa
         MWmr7hqf+yRii1iqmQcDR27/DRE2vA8Cjb1Se9vLm9EF07RCSz6Cs4Yz70qIXhm3urhI
         QwauaUooXWcNposxMsgs/DYxKmJC6EKWLBJvDgseLWRxXmuJO6V5VbkBsyh3xu3W7er1
         LijjjyHGeBZccszK2bIsfZwS7RC78ejlS82tCeql4VODLg4fRj2ujZ/VYbT5Z7ICJYyS
         gX+x60mt5U800i6xc99jqcaPbYPZ6O9a1atdpH8v0y3NZ3XNbA/2t3IRK8YCEzlsNyZl
         UD4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QW5vhw24jEehiCTzVEUwopgSTMRMxvbXRCa6Nvmg4NU=;
        fh=sj4R+zyKA6sD9NAIvikLZiaAxyJ+zpYeKW20rdtclGA=;
        b=dht+6/xlw/ENoLsq0ZxysdS1PXvI9KdnYutfJRF643W39xmXn3vIvdrA6ivL9an9P4
         PmjYspOsyldhGpFSUWF17foTwo9h2bs/EVtYqAbjroMLSfbdBy+vw4LceuIJEVNZ2MGW
         mJGfAv4xvvzidK5AGwhTsdgkYcPboSrFncm3LPzoMZkboFduPxloDUiQR3VF3lczikKI
         ptPegTWkXC/lPv1xj0n3NSI/XcAUlnnTZ8SkZL7yelNosQjuT73HawqM8i1CCL3EDWrf
         9LvLU4lmBMxl5f4a+Ez0LXbjvztJU2D988u51EFiZPzqeBtoaC3DwT3c0VtvZIUqJ1aD
         YwJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791399037; x=1792003837; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QW5vhw24jEehiCTzVEUwopgSTMRMxvbXRCa6Nvmg4NU=;
        b=jZqknt+/pePsuH+D7LeehkdBvp+C7a6BEtciD4inTNfWG90aGuaChqqCZuy6BYU/du
         uM9hStpCwfE4w+U8rwztEbwRuclgaTzxcQY3xhvDaWl+CsU+SuCLsmuT+PpSpU8EJW6v
         grTWCmtDoPGUdUQwewR3dL3Bcd855ubZoQTNJ+pmLeBRXq3wtdr3wA6ZIPAzwbMgZTeW
         fl6zfpYWa0cRzLZqzoQ/0f7vkIA8gdyz8z91B8026ouM0UreNTY5rvZ4Nh217NF1xNoH
         e1skYhqIaWjLdt+1NjaSkpQ5yBmCQRcfZS+MYL2dxRyhRrU8H5cu0EcbZANDRmZG9OvP
         phRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791399037; x=1792003837;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QW5vhw24jEehiCTzVEUwopgSTMRMxvbXRCa6Nvmg4NU=;
        b=b4/awNaVGcy1E5iyAxYN7m8rt2/cuvdHgyKN0YcBvASCMqJGNIbqz/K2fI2QBih7j2
         vxRt1xflyfU/LPKGH5YRE/fcAmnCrpAZKHOuUv58zof7lCgloOFWX6H1hUosV7IVtudW
         NTewvzJPRKd2J2gGG+B5rfcBx900/j4IXV7lA8+3g/qFQlppfvQnVMbev+Gj+M6wxOF/
         SY8MvGZLqRS686ohSV3N+a3P5biVPxtf7OV1ZT+rBqpPc5+QLJZnvla15Tz8f3cqWryD
         gzdof2dgvsUjgjPQVB6873dN3Ub71c20ScU4j5PM5E1JkDEExbdCthq29L5GoPhkqEqw
         Yocg==
X-Forwarded-Encrypted: i=1; AKwUvBwTK6OhmA+MoULK79JPtgqxrDA7WIuWJEkk2IdtQ7H3HzGkmNcTZVYdq2Qn2tzn2F70mfWov/kOWLbSSbQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpa0neVMYa/LVEy1LfxWM7/X+NPZTE/GBDVQRaxdvm8V2INn3x
	PgqVYU54yoIRq9QF1Fy9ExcKsdkO1Ppc931owZgTGHDDXbl47GDAaCGE8bIlw2rBeTfwsEaF00X
	0NVoKNeP+BQDT0PTFlU+SbAbsLnHkwI+Z3C1LKpw=
X-Gm-Gg: AYBFou1Lip3ztoUSa9FZIm0rHRn4Cx8GaGmJZvtjSYSLs3lMzPOtBXE9j6rlsL6uaju
	1U/dyAh6sBwg9vO+4jsGgZrrB4yZ+79hm/H21P01aVOKRrJw1LUmdZugPL9DbjAFEY/gwewV7Lp
	ZTPojgrcZWEEpRCEYD/vnMF/AQ4Ew/Gss7b8zCqpve2mk77Wm82hXbhUh5q+8jBj8itwCyfZFTz
	t0Aw9HqbP06vcOHq9oInjnf2qUIaC2r6jPe4jAGH4aTO3Qj1AKJLayypRtKT0XL+lGWnRyXZdK5
	7tby5ul81xg03v9KO6AIUUIF/W4BkjAbdGzag9nvOamn8pUjYFhppNCk6f6QyZ8KJPYrAF7ALkY
	yNjKZa9yRXsA=
X-Received: by 2002:a05:6214:3908:b0:914:385f:3c2f with SMTP id
 6a1803df08f44-919977d4691mr63991396d6.23.1791399037346; Wed, 07 Oct 2026
 11:50:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007122837.2995-1-ansuelsmth@gmail.com> <e8ef6959a0cb7093cfe4933da99fdfb5567f5354.camel@perches.com>
 <6ac678df.04a8e9ff.23fe56.b815@mx.google.com> <a098c4e66a4cabd61b8a7c933db7f21ad5648d5b.camel@perches.com>
 <6ac6876f.31081df4.3ada42.ff1e@mx.google.com> <3e05a868415881335dec29a5d73f7994393f7409.camel@perches.com>
 <6ac6900c.57ea3510.27c6b6.f79d@mx.google.com> <4e3b6c53200cbd5acdcc2ed4410bcf27df247474.camel@perches.com>
In-Reply-To: <4e3b6c53200cbd5acdcc2ed4410bcf27df247474.camel@perches.com>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Wed, 7 Oct 2026 20:50:25 +0200
X-Gm-Features: AclHuK-hQit3R1woxaUWzS2gOk_dEjVrRteuuCfqK3ubCQQ7J4KAoDUs_jymSls
Message-ID: <CA+_ehUwnFRmwzHt5NKuk-boVjCA9xbpiOprPpj6cR+4cTSnOVA@mail.gmail.com>
Subject: Re: [PATCH v2] checkpatch: report warning with files ending with
 blank lines
To: Joe Perches <joe@perches.com>
Cc: Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno mer 7 ott 2026 alle ore 20:48 Joe Perches <joe@perches.com>
ha scritto:
>
> On Wed, 2026-10-07 at 20:31 +0200, Christian Marangi wrote:
>
> > > > It's to catch situation like this. Example for entire new file or adding
> > > > stuff at the end of a file, where a new line is introduced.
> > > >
> > > > git am will complain about this.
> > >
> > > It seems there's something odd about the patch content
> > > as there aren't any context lines after the addition.
> > >
> > > How was it generated ?
> >
> > It was just an example, it's not the full patch. Just the last patch.
>
> Send more correct examples.

Here... the DT file adds a whitespace at the end of file. With this
patch checkpatch
correctly report the problem.

From 530fb038855d8e64023a3fd14ebd0396bbfc780a Mon Sep 17 00:00:00 2001
From: Christian Marangi <ansuelsmth@gmail.com>
Date: Fri, 7 Feb 2025 13:25:28 +0100
Subject: [PATCH v12 1/3] dt-bindings: phy: Add documentation for Airoha AN7581
 USB PHY

Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
for the USB controller.

Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
always supported. The USB 3.0 mode is optional and depends on the Serdes
mode currently configured on the system for the relevant USB port.

To correctly calibrate, the USB 2.0 port require correct value in
"airoha,usb2-monitor-clk-sel" property. Both the 2 USB 2.0 port permit
selecting one of the 4 monitor clock for calibration (internal clock not
exposed to the system) but each port have only one of the 4 actually
connected in HW hence the correct value needs to be specified in DT
based on board and the physical port. Normally it's monitor clock 1 for
USB1 and monitor clock 2 for USB2.

To correctly setup the Serdes mode attached to the USB 3.0 mode, a phys
property is required with the phandle pointing to the correct Serdes port
provided by the SCU node. Providing the phys property is optional if USB
3.0 is not used.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/phy/airoha,an7581-usb-phy.yaml   | 62 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 68 insertions(+)
 create mode 100644
Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
new file mode 100644
index 000000000000..f42e3d49a61f
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/airoha,an7581-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7581 SoC USB PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  The Airoha AN7581 SoC USB PHY describes the USB PHY for the USB controller.
+
+  Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
+  always supported. The USB 3.0 mode is optional and depends on the Serdes
+  mode currently configured on the system for the relevant USB port.
+
+properties:
+  compatible:
+    const: airoha,an7581-usb-phy
+
+  reg:
+    maxItems: 1
+
+  airoha,usb2-monitor-clk-sel:
+    description: Describe what oscillator across the available 4
+      should be selected for USB 2.0 Slew Rate calibration.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+
+  phys:
+    items:
+      - description: phandle to Serdes PHY. Optional if USB 3.0 is not used.
+
+  '#phy-cells':
+    description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
+      as defined in dt-bindings/phy/phy.h.
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - airoha,usb2-monitor-clk-sel
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/airoha,scu-ssr.h>
+
+    phy@1fac0000 {
+        compatible = "airoha,an7581-usb-phy";
+        reg = <0x1fac0000 0x10000>;
+
+        airoha,usb2-monitor-clk-sel = <1>;
+        phys = <&scu AIROHA_SCU_SERDES_USB1>;
+
+        #phy-cells = <1>;
+    };
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 70a11f2ff61d..0b9946c532af 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -785,6 +785,12 @@ S: Maintained
 F: Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml
 F: drivers/spi/spi-airoha-snfi.c

+AIROHA USB PHY DRIVER
+M: Christian Marangi <ansuelsmth@gmail.com>
+L: linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S: Maintained
+F: Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
+
 AIRSPY MEDIA DRIVER
 L: linux-media@vger.kernel.org
 S: Orphan
-- 
2.55.0
