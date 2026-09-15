Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B704028E2
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789441849; cv=none; b=nRCUO0eax0fzTjLuTkctqCcDcX59e8oGpDpLGKEnz24FKpFH7ftgCozWvWLF4NUJNA4f7xGUQPRXWg/dgW8RqKd2rkZfRB7ozIE/FmY8wyq3ipnmNalZ5VTOjZBSxULx21IREtYj7QHXGBxlleRmrdqbq/LDbsXl+c/P+uUTazc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789441849; c=relaxed/simple;
	bh=Tqm8mGXvI2nKoUm+9pLtaJ+uyO5KFGl5Yiy7z7wtnBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FLAEVnOANhnj/z3i0vNVhkCEKMrdbFBnoJCV6/N45rI1n69EaNYMPzNaBQYMtxXXaTRK3MACzvz8Yf5cl+E2y3oIvZyd5FiUjw1OGsSskxV+2U/zJ23XcoPF3ODwfFHW6M6X5vvOfOMVVUVUK/RXOtqDiFOfS9kAQQUa4uxrqsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=tGa9frY1; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="tGa9frY1"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-530e5b2cab9so17135351cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789441846; x=1790046646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSNWHoyvKJfGdDxylfGmEXIoCFeqbapyGd1fgWyygV0=;
        b=tGa9frY1CyWiXP3Ve/Nl+X1cwDGI7vW6LYKcX9kUlCsoo4gg68RRZ+F/+XxLR/DHYF
         CkLjUkEygXTmYTxln3LzeYTwCKvxP4X+yVSwkM5F8Kf2vw5Igc0TKGUuqNo6Q1Gdj1pW
         SA7LVU441bJ+u3ZGtlQ+M1R+maw50Lnt54uTtBVAZFKaTjKjqJ0ztKK6MgzGD4E3LUGm
         I/Bwc5AW1Y+kwEra3LdsxTfeQjiz53Bo4o6RsnortHXK5t8YA07Xw6rOHse9DpGtmxHw
         R1UhP4r3Xa/+9fAChpR3zLNO72vFy6RMHcJ7RBy2mc+1MoMbfJlKmZCdMCmTyJ99bO/H
         SEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789441846; x=1790046646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xSNWHoyvKJfGdDxylfGmEXIoCFeqbapyGd1fgWyygV0=;
        b=XnBvzKuMwt+HF6jE104AFG+sOjE6opwL8eb13rMdJgG4NOaHAYn+Zczjy41WMI605o
         7zY3fjLektKR7Y+3Vo6DYeh4zwCnr4aAMSh701Kxa96Na4zEHT3nN28KE5jpS7EYZeKk
         A3NPzTHuGm7LeJjgUnpObve5z5RdoWiS1CaB2OPWwK5GWLyxcsDzK+mMNX4VM5BovEkO
         2aHOcsAmDSAp9S+eJB3NXr/iA4uhKE8PojBBJgtxTmwjBmjPEYjRk/9xun9P+eImlndk
         6DhNT3iHJtkyPe1ovB72WIsvWnzasAsRsftpxmqG3YRU25Tll6ceHafG1VqEkpnkCWD6
         EzRA==
X-Forwarded-Encrypted: i=1; AKwUvBzqcPvOyulo9kibKG5DcpP64746OrDjA08D3au9JG4dMhwuY6fSfAp0OTim/sponxPvTAQZhacEJbMrg+Q=@vger.kernel.org
X-Gm-Message-State: AFuF++ksflqbYrhK6JXIVjUZwvONBHUmDGVVeEHNFKMGFyVbFTYNDkd4
	cgcyH60593gKiFblxZ+f71LQoN6IlguWmZNTy+8rKORfs5DuH5RF97yzQd6RfnSTh872BB/YbmZ
	w9tchOb8=
X-Gm-Gg: AYBFou2GFS5GfSHoIdd5qxKGyh4fnv38D/lt6M4LmMs1vdpOtCX349Jow+eXLDEu4xL
	kEjYh28iiJvTrutLaVByOEutSKuvLLQClX+Gxs3VMljnmFxr9a/Ox5dTY/AXk/wEcR2W7+bCPzD
	sR2saCbOWskQCPUMis5ChYHzz2iotMhg67SIvykQ/oWp4e1w1HxJNQ7m+GdQX0cg5dzKwDul4m4
	bxkE9cVKlgRC+VHZyNRJ0Wjgw9/Dw5yDTn/DAe6erLWJL8GsXdy6gZS3lAbJSXP9tiR5Vl+pRTC
	9+D3jc0AsnjKOMBdWBvgePFmHE4IbofI2PCuTRAjFIB0sVy1DRoaGWx22AEDhT9U/KQrikxA2Um
	ZWiyA+FOIqsjUwVhvLanqa0jj0oH3hNBav9ImqnqQmwtfoAsyQjXCynA+ihQN9aZE3WAfuWtEg5
	ViemVqUOeLz6FXrqYobQ5JcaJOLZZqMdAVRn9NCoVE9mAekihySzeNBwD4gdHBji1mYK9TOabpX
	wo=
X-Received: by 2002:a05:622a:1919:b0:530:efea:7a55 with SMTP id d75a77b69052e-5310cef6b70mr77015881cf.4.1789441846176;
        Mon, 14 Sep 2026 20:10:46 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ce4ec298sm118563841cf.16.2026.09.14.20.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 20:10:45 -0700 (PDT)
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
Subject: [PATCH v2 3/3] arm64: dts: qcom: qcs6490-rb3gen2: add endpoint buses
Date: Mon, 14 Sep 2026 22:10:37 -0500
Message-ID: <20260915031038.1087264-4-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915031038.1087264-1-elder@riscstar.com>
References: <20260915031038.1087264-1-elder@riscstar.com>
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
v2: - Added this patch to the series

 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 30 ++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 3bb5fca8e2b13..59fbb0444d9b7 100644
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
+				ranges = <0x0 0x0 0x0  0x83050000 0x0 0x0 0x0 0x4000>,
+					 <0x2 0x0 0x0  0x83050000 0x0 0x0 0x0 0x80000>,
+					 <0x4 0x0 0x0  0x83050000 0x0 0x0 0x0 0x200000>;
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
+				ranges = <0x0 0x0 0x0  0x83050100 0x0 0x0 0x0 0x4000>,
+					 <0x2 0x0 0x0  0x83050100 0x0 0x0 0x0 0x80000>,
+					 <0x4 0x0 0x0  0x83050100 0x0 0x0 0x0 0x200000>;
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

