Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF5F51121D
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 18:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790965138; cv=none; b=kGNtmuT0syfgSTUoby1AdqMUIM5xmKoaPCkyaeMWOt5hNjCoXecUMVmjQg8dCU30MO2Xm4+OXEFzzVnzoN9AWQMNyv4rbv+Jm3OVITeZo3zMpuUjpXVD7Xm7Ca96mR48tbFN+8kjeSk+5qfucPQ44sy6LhNblVB3xSvKly6lIcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790965138; c=relaxed/simple;
	bh=xxjspIqmx+CpULEpM4hqjXrOZ9/SSoODxlcNQ+6Tp2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ov9+9KWBGvHn+ukNV8CPEVdXYXJlWqmSdspOkRRlYqKdBYi2zYOzUVHs0UC3zGaSgowdSkEZF2Bd2OgRGyd0U2ccJsyg/aHobLnHBuUwidCCDavHvqKFuXAVl1Pb5cFIfKbBzK4b+0+lk9pYqMqRHzUi3o5OF6KN9wfsyNrJlRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Xc4eG+pT; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Xc4eG+pT"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-939fc329d35so83724085a.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 11:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790965133; x=1791569933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SdYgs3CqbUtHm8RpvjRA9eQJchSjfk11RvrZH/hrmmc=;
        b=Xc4eG+pTRyNj0/77dvvO7G1GRgOtknJxhKpk0H1k7A6hIkji8ss6fvCbiv1/aujwK6
         ae6oAt5XgNfu5zugRJB8vLqzZ046/LDjGCGWWuwaHAAqtlowvs2qk8YUvUTMmtQ/RbuA
         GVy/WIKn7ykh35Wv/7zj77BtWKbLgOonbDkd/JmfzQkpgjK04tPZjLqimYNtUg/Jqq0S
         MjTMV0eJLPBFTXCtKdKVFR9l4xmzBHqM7b2v3MCULgIi5P0TEPrmo+/dThdFKmPGDVOM
         dVceqPkeFRMsP+6sRACTM+6Q8y/tEt5T1boUJcown3P2ixhPrTBi6FaUAASBZofcTpsE
         QUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790965133; x=1791569933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SdYgs3CqbUtHm8RpvjRA9eQJchSjfk11RvrZH/hrmmc=;
        b=VUCxmFcG+KfHR0Fn3DNN8/HT58kYIOdG/xe++JDJft//lmVFFkZ9vLkIcFgZP7pYRg
         7R8QJ5+mQ+k9oh/ZurbRR1Jmx3I00II58iNzEtZFgdW4ZcvWjKoX3xwxTMcpahcNnnkK
         kQJ0JXfxhe8jQXxc/L/hbUZZhaoPfs1+jMX9iVIWW+K2eZDPNOl5pjabW/SDWeX2wyiW
         QvK5uW1yFI2ocLLalShe/m8r56TEDOXJerBEKZDLE5g73PDfJ/sGQAi119/OXBw4VdDv
         lX67huIvXvJMlJL0wpBlYWU967nW3w0j0YtN/rjtGNP8B61+zaOp+mN7Ep5IWN7Dv+Qw
         GocA==
X-Forwarded-Encrypted: i=1; AKwUvBy+/S8SMQdIC9hhmH4PkA7MIvBxJqmLAAYozqKuf2Rpd5kREsFzHLZ9Uu4Gg/cSGPIBNyhLTBaMl30NfUw=@vger.kernel.org
X-Gm-Message-State: AFuF++nu8XN2VG5BlVKTv6lHY9C5fb86fiOU/ckyJ7xOPT5vBPCYFwz6
	YlHTsDPu4XO4Ixf3wSHKEZdsbkw6DUk2igsPKMukACDF86DhfktFw/1O02WglZ60OjU=
X-Gm-Gg: AYBFou248UB4y2sebLtfDkrQGkS1/5jfrNUOfp7Jb9GI+P/3mk+WFXQNxA3Umug5GH0
	GVlN0DXDqdP4otyN5CyoXajwBOybRc9F0n3urbgk6l2VV7MU1mYwGIcztCTTYGKMhZ2LwWHqdmq
	nF5pLYHuzq2rMgjy3+wgkAHx/+f7w5hOLX1ul67ei0BNr5TLHDvQvPc1VEfzB16i1DD55TkIPKa
	Vr6FSwCkjJ6V/5dvudU8kKZVzNBZFg0iB1mm2bPMUMEt51R4r56TpR4tToFV7cDO6vw1LwyyKGx
	fKkMp8hQL5G/b1/gO5q4FNtMm7B0jkNpkE9Pl8DmAvi+5Psx3B2I7Gu2NUcy9jrPe5MGOM1BRik
	FzZR0qNimWdKMdcabi0J3/NZoLidaIgEfEMzsuY+4Hg8OpG6bNeu+Yhs+l1w1uxt8EoCdc5aCW1
	2WwvExLijkyz/AssTmc7c/jIHu8j1tEAh2Et+Z527rHUKNDq8CzCpabbqWcBPwHJQMnOd6PFVSn
	iB0
X-Received: by 2002:a05:620a:290a:b0:93a:2e8:5aff with SMTP id af79cd13be357-93e50f8199dmr34926885a.21.1790965133295;
        Fri, 02 Oct 2026 11:18:53 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca280e59sm286107585a.35.2026.10.02.11.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 11:18:52 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	abelvesa@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Thompson <daniel@riscstar.com>
Subject: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: add endpoint buses
Date: Fri,  2 Oct 2026 13:18:48 -0500
Message-ID: <20261002181849.790275-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TC9564 SoC incorporates a PCIe switch, which is connected via
the second PCI segment (0001) on the RB3gen2 platform.  The third
downstream port of that switch (pcie@3,0) has an embedded PCIe
endpoint that implements two PCIe functions.  The SoC implements
other peripherals, and they will be accessed via PCI endpoint bus.

Record the PCI VID/PID compatible string for the embedded PCI functions
attached to the third downstream switch port.  Define the pci-ep-bus
sub-nodes for each, along with the #address-cells, #size-cells, and
ranges properties for both the endpoint and its pci-ep-bus node.

For PCI endpoint bus, a PCI function's ranges property will be updated
dynamically to incorporate the address ranges assigned to each BAR
during PCI enumeration.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---

			===== PLEASE NOTE =====

A version of this patch was previously included in this series:
  https://lore.kernel.org/lkml/20260918152659.413268-1-elder@riscstar.com/
The first two patches in that series are now in char-misc-next

This patch must go through the Qualcomm tree.  However for this to
function correctly, it depends on this code getting merged:
  https://lore.kernel.org/lkml/20260924222444.1351466-1-elder@riscstar.com/

I sent this message today to clear up any ambiguity about whether/when
this patch should be merged (probably not yet).

					-Alex

			=======================

 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 909039816a216..0e3bbdaf4661f 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -955,11 +955,35 @@ pcie@3,0 {
 			bus-range = <0x5 0xff>;
 
 			dev@0,0 {
+				compatible = "pci1179,0220";
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;	/* This will be updated dynamically */
+
+				pci-ep-bus@4 {
+					compatible = "simple-bus";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					/* Map 0x0-0x1fffff to BAR 4 */
+					ranges = <0x0  0x4 0x0 0x0  0x200000>;
+				};
 			};
 
 			dev@0,1 {
+				compatible = "pci1179,0220";
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;	/* This will be updated dynamically */
+
+				pci-ep-bus@4 {
+					compatible = "simple-bus";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					/* Map 0x0-0x1fffff to BAR 4 */
+					ranges = <0x0  0x4 0x0 0x0  0x200000>;
+				};
 			};
 		};
 	};

base-commit: 705529dab1fa872d8b53b09c95e1b03a95573376
-- 
2.53.0

