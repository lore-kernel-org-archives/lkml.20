Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4222250276F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745234; cv=none; b=Tzz2R6VC2c4nN52SBNv77hmFjzReqphb3XQanXJ2f9kFm0EYUCFvqiixEnCgIihemgiaQCuynGKrYw/7HEhgBE6vJ8XKGMcQtrote1EU3v/BMAu/bBiOrAaIFvjAhO7pe5dK2rPzWoNGn1p2Zio2yH7sxVQTQTI/fTsGs1hdUOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745234; c=relaxed/simple;
	bh=Yrg8axLPLWORg699bra798c8gsnBqtweBph1kEWPw3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KPDW6B2yUZQPTzmIuVDI9KCsHKYkU/Z8zgY71dNEXq5fDnri08wTWoECbPOdYNPpTA6y7vdJsqrdq19S8i2HQvxk38qalDbeYvienuFSkAaPcdfdvUfFrzFHEnQOevZqL/+95m17BfhIHbmC2sfUsxtPtb+WTJShmEHY6p5siKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=RS+Df+lP; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="RS+Df+lP"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-5329fc7e0bcso9918751cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789745228; x=1790350028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TOeSHivgGtBKP6OSBvHEzAeHzrnxsuhi0YKgz/54Wow=;
        b=RS+Df+lPU0Bch51mpyx2zIXy1mn308spz/kJd19Z3NzjbJs/ig8NhFZHaNN6C0p51c
         ky+XAYBIab87qUWlDoSudil7ChLeFbmpr/J5UZXXJMIrYW2HFOaXLDZK6vY89yIeZpvn
         lu8Yx/7YYsDzu9/ixJMhdG4dfea6njc8JQGY72MBWupNmxWQ1b2FaEOqnE07yR2EFRMa
         YwizgoVt6FpYq+/KcSvSmt9aBtE2JZA1yu5Zay/Nkt4wEfTRJhG9wq4cIxhopjdWHjtk
         YIptxyQcaNiqeZNKhzh2/4g7DrhbvnVaSHJjF0IJXMtHGNw5p7Tl/Q5y/hR2HpkLX8lX
         3p5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789745228; x=1790350028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TOeSHivgGtBKP6OSBvHEzAeHzrnxsuhi0YKgz/54Wow=;
        b=xy0qBe0cZzF8nzI7OI8CHM++g23yaYOu4YRj0hr9VxpLV+tqhJR1QaQXno3IS8yWHc
         nEJg+JJi53Lhq8isEW/0ryiWLyHz2lfwhm5zRJDu1F9+a0y01XH9Nki7CmCCH/RtdKqz
         D9a0WgPzPC5LfRx5UMJCdvn20+QfwXpWQuQDhd/hAZfq/ANvV3u2HME220mB2MiJvXn/
         To2+nvCp8HL+v9yA2j8/wjs2cHRDa0jDF5T1IHGPnCIIsGScSRz15ocC6vm2Z3nqlA+S
         lO8F+yfl0pRsGLMiFIWHxSd6bPZJAFxec5mEWLRDIbIiA382UxBiQmHNyCHxocyKrZw2
         JFYw==
X-Forwarded-Encrypted: i=1; AKwUvBznu7yPUUElYDMBIYZ2kD0rPDXv1czDsZ+yEnTMvq7iCDwXtycy9QQaIZkflBWu/CM/nnkNaCuAEqYIYwM=@vger.kernel.org
X-Gm-Message-State: AFuF++lgFqr0xRQHmtuZAWmc4xcouA4+2zjRNOK17Fmmgy+QAq2A9l18
	J2fLpOpwRUB0XDFTOiYBzXR2/oJMZBpp3JJVK49ZtjwgRgc1Fxgq08K/L5LqMvv+wKo=
X-Gm-Gg: AYBFou04k2jLnBxgLMkV+Pm3+XN1Yj5nESkFXgsd0yedAEK0UqFBldp9zRJ0bmaQpw9
	zEzKAh9Oa1k2teYC6SG9aDwfA10UMc2/7e0uq2t7ez6IvAFDk8qw4IdOQOtnaaTaFis5JTzAjcs
	5K+1e8CNSBIjdxduPDzHnYWfZf6VNgT6Cy13xepzWyp6FKJw6gSN5EelmJNcEmbp1v2nac0YHDD
	porPqOTmDwWmRrt8V9cnxaWkOogrsHlXGB7Q1FMfMtjUhp2dAakTiiFNksVIXtcnioYRvT2+fXg
	YyzxrqnBtRMifVUKwRSiK8gqgBgk1MuapcZ/K9SHfpqHKR7l3kkOhBUIiydghtiexPq8KrG6BTl
	YS19KUV26jAISuDtuNeAPw27hJOcdwLHuSCUWBA8EYYc6SdZhHc700el/474hdVbfn2gfOWbwli
	QVcs8qcZ6Oeul/JrefM5/NtjAphuezHstoC8ACN1z67HMFVlVqI5UPUXIckg4KMsJm3rqLBv7KN
	zbh
X-Received: by 2002:a05:622a:30a:b0:532:84d3:ac7 with SMTP id d75a77b69052e-5329e47ff64mr49202771cf.41.1789745227649;
        Fri, 18 Sep 2026 08:27:07 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91257f326d8sm15099766d6.6.2026.09.18.08.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 08:27:07 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	bhelgaas@google.com,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] arm64: dts: qcom: qcs6490-rb3gen2: add endpoint buses
Date: Fri, 18 Sep 2026 10:26:58 -0500
Message-ID: <20260918152659.413268-4-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918152659.413268-1-elder@riscstar.com>
References: <20260918152659.413268-1-elder@riscstar.com>
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
endpoint that implements two PCIe functions.

The SoC implements other peripherals, and they will be accessed via
PCI endpoint bus.  Define the devicetree nodes representing these
buses, including the mapping of each BAR's address range to its
local address space.

The endpoint's ranges property must be defined, but it will be
updated dynamically to include all BARs.  As a result of this update,
the parent address portion of each range will reflect the specific
address assigned to the BAR.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 30 ++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 3bb5fca8e2b13..5b7f5292a8864 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -955,11 +955,41 @@ pcie@3,0 {
 			bus-range = <0x5 0xff>;
 
 			dev@0,0 {
+				compatible = "pci1179,0220";
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				/* Ranges will be updated dynamically */
+				ranges = <0x0 0x0 0x0  0x83050000 0x0 0x0  0x0 0x4000>,
+					 <0x2 0x0 0x0  0x83050000 0x0 0x4000  0x0 0x80000>,
+					 <0x4 0x0 0x0  0x83050000 0x0 0x84000  0x0 0x200000>;
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
+				/* Ranges will be updated dynamically */
+				ranges = <0x0 0x0 0x0  0x83050100 0x0 0x0  0x0 0x4000>,
+					 <0x2 0x0 0x0  0x83050100 0x0 0x4000  0x0 0x80000>,
+					 <0x4 0x0 0x0  0x83050100 0x0 0x84000  0x0 0x200000>;
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
-- 
2.53.0

