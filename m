Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275D03A9DAE
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723127; cv=none; b=GtO9QhgZauYLOUWxQXlWfwvHnZE3vIVYBi0ihpF0p4xNLKMPspWRa3gm3XxPNwqm8XjkalJHw0gKLGx+czgCMQfWHREUhKp+85kyndOkJGjTD1gsYoSUr+FFtI/bZfgY6iJLXAHI7t1JKTMes2YCzWnjwf80lgld1+xtkIEl9zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723127; c=relaxed/simple;
	bh=ROvZb4xUz6DU189xV6s7Pm/YrJwcTfi3qs6DKqPM7Kw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=r4w/AzUUQPwlOUe3Cvhmkx/VIXgbxD/N154MCaIFXyfTB8ShqMi1JsUrV7TZMAcOymKeUABx6fh+bh/wLf5F8W6SbToeYVGnnpKk12SvatXpij2yvJLjTe0K/c3cIzA8r2Hro5Xz2Os2S7ZOFb+R/itNDD8+b2IgmHxv0xighsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=am/CWk9v; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="am/CWk9v"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so6871275e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789723121; x=1790327921; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F++R57QYuDvzUJty6cC3PAkfnW/2M4IN8xpJOMy5r64=;
        b=am/CWk9vgu/RWIQGICQo0SOL14q3dsN+imB65I3WyZSt7f80uEZryGqbuZdbwZ/614
         27PGrg94HpFy41S+nmEEBEfYH8RtouIrT8vYeq9owAWN7fP9R5RprL0UErxi6FkMFg2m
         twPJmEYnvYGTYaD1K1KfFMiisZbnUHA3cgVR7z5NkD5xQS8zMPpa+kprAsW2AoeLAtlP
         CVWPZAUea94DRj2cXFRGpv/6WzpRXBU/9iXvPWhFVBiVH8s8Mj/sq5lY0Qnm0P/bMSCr
         Kmv0cT+KICoEbuEarRBlhY5uD1crJOQshaJ52qAdHLdBIps8a8ci4A2648vn9IiSz3Iu
         Wggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723121; x=1790327921;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F++R57QYuDvzUJty6cC3PAkfnW/2M4IN8xpJOMy5r64=;
        b=h5/RKFbBPZjKaDQHf9pq0BXdk+gTRKJwde1JLDUaTom+DkPg9P5RwoAwyMtiXYpOVZ
         c8HATG5g6WKM1VW/zxn5vxEce16ypvqzbjYxvEWtBvrg/iNxoRprRe/Je+6J2CUGXwlY
         2WusWbO/Qrh3QjAsNKONoI1p6v9a7FhWjW4J3ejDQYbk0SAeE6Y7YPeZI1yPB2iS/ZmY
         nrTSeJVk7AUif8mgnjdIxYIUY2W2GnGUX6tsM7o6a9TG7a7jKv6Hw/xY6qkYaDFUUIs4
         Rt8gu9aj/C27NOaO9IIZbj6iwNRaYbq3HZm2AfAqDwEZFt4S/jdpCuvlips1zKM2BX8D
         arRA==
X-Forwarded-Encrypted: i=1; AKwUvBy0NQP7RaK97+TEh4c3rUJtTBJXgm3WzO9qyVUXYSxtDhlN/Zp3HM3wI5nnGW9aNg0Odlo89rPcUptAQDc=@vger.kernel.org
X-Gm-Message-State: AFuF++nZUIIk8UobgCLx1qqK1YjJlADwOE85/k+lcKwUY//I2QSIcmxV
	8LSClFVZtpFCrHLkFsEaJ6QPfzm1mBoX3DH4GXzK60VEyZuwfCmtVEiOzvItRQzVvro=
X-Gm-Gg: AYBFou2aqyB4sXVVF8Kau9yIh/SiSFH2anz4FJxqqzdItSShT1goQx3+BIPWFG84Kt2
	BFJofpWswrRGdX745s6IIGnLWORAtG+/7reRQ+eyY4Ubed6CQ3IZoAM0PCU2m3om2BA3AzWeHkU
	lICdsAclyssBewxLK06VoeUwaEfT5Rsgn6lKejVzOyAkPdAiIqBMQ8lhpvUqJWy4g52w5k+esC3
	GPmaa/m0JYMR7T5DznLeNs2Q7CvuSajQG7x64n7T9JYLys8d5FwfV7JeD2O/MX9QxsoXQTZEwUk
	0TgwzWM1KorDWQVgd1+FETE/hJF3yOBWqCEhg6U6tVOIhY8mpARPO4VJLZRHty+6rY0XDE2/Olk
	fu7sUsMm7zzJCDqiSqWSgJL9cgP+pscwUm4f923xjsg+Kn0LU/++FgYxFkmATYHpnX3/Ykobk9t
	6I86owDeXyyInKSQZFmHjLy5jM0i3Q/wNgyvoFpy4HFNsLQbAkosfRH/nHFsusbFA+0/o=
X-Received: by 2002:a05:600c:358c:b0:499:be2d:c290 with SMTP id 5b1f17b1804b1-49fc56b4ebemr26777785e9.9.1789723120709;
        Fri, 18 Sep 2026 02:18:40 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:7a95:1dd3:2926:35eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd22dbf2sm135573225e9.10.2026.09.18.02.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:18:40 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Subject: [PATCH v9 0/9] arm64: dts: ti: Split wkup R5F memory region for
 IO+DDR resume
Date: Fri, 18 Sep 2026 11:17:44 +0200
Message-Id: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALgBrWoC/4XSzW7DIAwH8FepOI8JDMGw095j2oHPFWltKhJFq
 6q8+0h3SDUhevz78LONuZEplhwn8na4kRKXPOXxXIN5ORB/tOevSHOomQADxYAzOo+X7Kk9KbA
 0jyEUGma6KMoNZcEicmCaByQVuJSY8s8d//is+ZineSzXe6+Fb9U/VjDRYxdOGeWQIoJzkgV4d
 /b6nV2Jr348kU1e4EHj0NWgagK9Qx+jV4NuaOJR011NVM1LLlF4B8KLhiZ3TYLparJqyQMGZT0
 Owje0YdcU411t2DbVg7IMhE2p9W7qUevPprYrKJucNZhcZA0Ndw2fzIZViyY47bjSwG1D07tmn
 vwQXTWU9ZospBCt+qet6/oLR+n0OekCAAA=
X-Change-ID: 20260210-topic-am62a-ioddr-dt-v6-19-0da7712081d7
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Judith Mendez <jm@ti.com>, Daniel Schultz <d.schultz@phytec.de>, 
 Andrew Davis <afd@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Beleswar Padhi <b-padhi@ti.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>, 
 Stefano Radaelli <stefano.r@variscite.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6355; i=msp@baylibre.com;
 h=from:subject:message-id; bh=ROvZb4xUz6DU189xV6s7Pm/YrJwcTfi3qs6DKqPM7Kw=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqy1jHtXaHV75GfFrZnotvVfZt4xx7/ClZ/+blHfsMwgg
 0GFYeGZjlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZhIoAkjw97vYl3ZCv1C97V+
 ifHsviRpozP1YOYyX535h98ZZz7I3sTwP+7BKznNUz3sHYufxoae0w7TcTi316z0cI3x0r32ywJ
 msQAA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Hi,

Split the firmware memory region in more specific parts so it is better
described where which information is stored. Specifically the LPM metadata
region is important as bootloader software like U-Boot has to know where
that data is to be able to read that data and resume from RAM.

The bindings are already applied. The remaining patches use the new
layout for the platforms that are capable to support IO+DDR. For IO+DDR
the new layout is necessary as it defines the location of the LPM
metadata.

Additionally the two important devicetree nodes for resuming from IO+DDR
have the bootph-pre-ram flag added as this data needs to be read before
the RAM is in use.

The changes in this series were suggested as part of the IO+DDR u-boot series:
  https://lore.kernel.org/r/814c211f-a9eb-4311-bb84-165b1a69755f@ti.com

Note that concerns about uboot fixup of memory region fixups were
discussed here:
  https://lore.kernel.org/r/DJD1Y3G9S1SP.2GHOZ5X4RYJFA@baylibre.com

Best
Markus

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
Changes in v9:
- Fix scripts/dtc/dt-check-style issues
- Link to v8: https://patch.msgid.link/20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com

Changes in v8:
- Rebase to v7.3-rc1
- Increase the AM62A wkup R5F memory region to end at 0x9e700000 to
  also fit the edgeai DM firmware as requested by Paresh
- Move the memory region definitions back into the base board dts files
  of all AM62A and AM62P boards
- Added bootph-pre-ram to the memory regions are merged into the
  bootph-pre-ram at the end of the series
- Link to v7: https://lore.kernel.org/r/20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com

Changes in v7:
- Rebase to v7.1-rc1
- Fix commit messages
- Link to v6: https://lore.kernel.org/r/20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com

Changes in v6:
- Added fixes for the length of the wkup_r5fss0_core0_memory_region.
  Thanks Francesco for pointing that out. am62a firmware is shorter than
  am62p firmware. I calculated both and fixed all devicetrees using
  them. All patches have different Fixes tags so I kept them separate.
- Fixed the length of the split memory layout as well.
- Removed the double definition of memory regions for the var-som board.
- Link to v5: https://lore.kernel.org/r/20260601-topic-am62a-ioddr-dt-v6-19-v5-0-3856a023aff2@baylibre.com

Changes in v5:
- Move all changes into k3-am62a/p-ti-ipc-firmware.dtsi
- Dropped the patch that adds bootph-pre-ram to k3-am62a stuff as it is
  already present in k3-am62d2-evm.dts and got moved into the
  firmware.dtsi file which covers am62a as well then.
- Link to v4: https://lore.kernel.org/r/20260429-topic-am62a-ioddr-dt-v6-19-v4-0-fc27d6ac753c@baylibre.com

Changes in v4:
- Rebased to v7.1-rc1
- Dropped all already applied patches that are the bindings and the
  initial introduction of memory-region-names
- Link to v3: https://lore.kernel.org/r/20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com

Changes in v3:
- Squash the enforcement of the memory-region-names requirement in the
  patch adding the memory-region-names, as suggested.
- Link to v2: https://lore.kernel.org/r/20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com

Changes in v2:
- Make memory-region-names required if memory-region is present
- Fixup memory-region and memory-region-names conditions. Require either
  2 or 6 regions for memory-region and memory-region-names
- Reword and restructure the binding documentation for memory-region and
  memory-region-names
- Add memory-region-names to all uses of memory-region
- Link to v1: https://lore.kernel.org/r/20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com

To: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
To: Tero Kristo <kristo@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
To: Bill Wendling <morbo@google.com>
To: Justin Stitt <justinstitt@google.com>
To: Andrew Davis <afd@ti.com>
To: Judith Mendez <jm@ti.com>
To: Daniel Schultz <d.schultz@phytec.de>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Bryan Brattlof <bb@ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
To: Devarsh Thakkar <devarsht@ti.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
To: Beleswar Padhi <b-padhi@ti.com>
To: Francesco Dolcini <francesco.dolcini@toradex.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev
Cc: Hari Nagalla <hnagalla@ti.com>

---
Markus Schneider-Pargmann (TI) (9):
      arm64: dts: ti: k3-am62a-phycore-som: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62d2-evm: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62a7-sk: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62p-verdin: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62p5-sk: Fix wkup R5F memory region size
      arm64: dts: ti: var-som-am62p: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62a: Split r5f memory region
      arm64: dts: ti: k3-am62p: Split r5f memory region
      arm64: dts: ti: Add wkup R5F nodes to pre-ram bootphase

 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi   | 29 ++++++++++++++++++--
 .../boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi      | 11 ++++++--
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts            | 29 ++++++++++++++++++--
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts           | 32 ++++++++++++++++++----
 .../boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi      | 11 ++++++--
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi        | 29 ++++++++++++++++++--
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts            | 29 ++++++++++++++++++--
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi      | 29 ++++++++++++++++++--
 8 files changed, 179 insertions(+), 20 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260210-topic-am62a-ioddr-dt-v6-19-0da7712081d7

Best regards,
--  
Markus Schneider-Pargmann (TI) <msp@baylibre.com>

