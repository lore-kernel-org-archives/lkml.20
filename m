Received: from mail-qv2-f14.google.com (mail-qv2-f14.google.com [74.125.230.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0770C4BD7A6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 18:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789495817; cv=none; b=rzWBvJlkwYZ5YmIdRScJ4JBGCrLepYlZ1CrpqhUv+QbKYxSCT5dYQNzvSQf2hu0x4wJ4DXo3U49PTpk8oHU+rOq6EcrkfEAw01J5rxk4aaJ9Ro115shd1I20S7tEr2svHli/qbWtOwKeUpNPwfm/pvwLJHRuMU2xKQcm2SS5LXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789495817; c=relaxed/simple;
	bh=tdYpvWgSjy9pb8wMZZMf3uOm14EnHaub2C79rnVIBoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EL5sZbSrdm6w3yPF28yn2Iwgkwwjf3kLbjr9IyILfX+jeU6sb9vBAHlXCLV5RqkoDkRMjevqe8QVKPf1YrSBKLFmFbpktVuskAyhkPDKWXFMup3bqPHQcdrnczF/Kq/4/B4s51Nh5bgIBkOVmtBubX77Z92qhON/sRlVvcaX6ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=pLeoUaZH; arc=none smtp.client-ip=74.125.230.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="pLeoUaZH"
Received: by mail-qv2-f14.google.com with SMTP id 6a1803df08f44-90cdfcbe20aso611006d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789495811; x=1790100611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wVBxclk9QgEAlFYkz8nlTTQ0570gfN7zk+u3PBMIQfU=;
        b=pLeoUaZHFwXqKvQfAvxW6w9XjTgMcZZpwUT6JOWOlLr4BimjldmpjhIjG7SJUDIwiP
         RCFaiMbzUeQZYwKEJGd8UINUw604HAYfqiZ4Wr2jOsYfVaLSlZ7zFfwj7INAIXco+Dll
         Erwyk5bdKKN1AxUDGprq6T9lGOVfIt/ulBbDQ1c/HXqeMbRM6F00CpfoX5TpjLsphKRt
         QTSxCT3eISuZ6qTuWrAPEFwrAuXwUZvTnHSFE0NqfzO3uNpt5v/rNpnu5yZE3hxlTDPf
         vQi7vsFDZe+NUT0XFE+2sF8awdNjgvA2Mh1APc1BuaHSlhDlnbPKwnkBSDKWGMKAPDvX
         BAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789495811; x=1790100611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wVBxclk9QgEAlFYkz8nlTTQ0570gfN7zk+u3PBMIQfU=;
        b=HPKp4zNyLk5Agjbl9dCvq6aSH3MpbhjxA+F+DJ4StDnJ4cD3ncTYrNqgad7YH8HSjI
         pTQU7LX0FMPFPyEyj5oSsFwGzElJ5Z1OAKyINEBtL4z0qfpBKJ03dpnj0u66PdcyVv7v
         wpeFbrdMPH7xqrhDxnJLqnkzVQKKLiGFGIAuGbk10cWi64mHhwzX5285DA/KypIA5OHl
         y1xJf8LHllsKH0yWhR75AgHOp2udyBWtDVWIghN21Q6MxHS0L0IGzsD/klUWeS8kQKc/
         aOGMTCY34IINH8+DeJXIH+kYOonGyXiwl+lm2GxKJaDv9a2AwOFC7uGi/ghmeOWFIXws
         2pmQ==
X-Forwarded-Encrypted: i=1; AKwUvByKmFYLIHgkbJY5Mqwtzv1tgekTOjndXouzKvZR9kanMho6SOPeomSHWsk6N+CEUZ6wtU3XvuZyeyWsqSQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kRmYOuwXfYNMYB3J3K3zFveSFw1scRQa64oaQEW9QkzkYChrBS
	bnkN0ecmdhFsh0TCoUhDlNq5FuuRR4iWImfVG8y9Vo53z+lJaIkYT2/wcDEMH4nvcHE=
X-Gm-Gg: AYBFou0V8vJFX8wKpZZDybb4L5WKsygtdJzM6PYbYn8OF41lPlBaeaXIbC15cEtnqOl
	xkKFtiGPdKSzPiI+kebCmqnsZXgAHWBxhY4+GbB6Ex5IUnJJV2ImSRCIXJDVjZ9q/qUhl2D08Pz
	es1mi2tDSAn7YLUpl8s93y1OtyXd7Hd9riUQxT57omCQnJuoIZB4pU9DWGMI1zBBbqTvi2PyqHN
	44Wgu+TRM8YkwKD6l5KYFZok2kD5xQFEHj3CxEBap/OuMvxdmuHdGQ76lcV8Lln6W2uu7dNsklz
	iKsWeRofLdCOkJYjQp274Gs2zLChVEgAhiiK1EyhbXNPm/xSI70zJT62aQD8UiYzcfdRi2XU5Jd
	e+/yMuHifYMVL5afzBHQpiPCKXba2+6nEXL8h68VNxsd59fhWCDz7JzF1ENxDRk8uE2qjaQxgWp
	RVAusC+dXWQIExION/tIfc7kGompeCfoTXdkHemvTklsXVHe25yTre0OyRXJx7WEgiLwzOJkaV8
	GU=
X-Received: by 2002:a05:620a:640b:b0:939:e735:c50e with SMTP id af79cd13be357-93a297c8d0fmr1256082585a.13.1789495811337;
        Tue, 15 Sep 2026 11:10:11 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b7824f72fsm14648485a.28.2026.09.15.11.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 11:10:11 -0700 (PDT)
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
	mohdayaa@qti.qualcomm.com,
	lbiancon@qti.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: dts: qcom: qcs6490-rb3gen2: add endpoint buses
Date: Tue, 15 Sep 2026 13:10:02 -0500
Message-ID: <20260915181003.1633543-4-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915181003.1633543-1-elder@riscstar.com>
References: <20260915181003.1633543-1-elder@riscstar.com>
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
v3: - Updated ranges property "parent" addresses so they're unique

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

