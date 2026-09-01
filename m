Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B84488762
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 17:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788283310; cv=none; b=O2gKnJ7GfGqRw2T7FQPdgJYkYg8MEuOpodTbmevdUQdv/vGE0KgjFRnC7oYirbAj4u497NV0BdJx9Or7D8oU74ViXKqxlrOEDjyKJ20G51Uuj+lBKD/yKNzzNsnvPO6Hij9JnlCXZOLfDsUyUscZfLay4ppMb/DFjwivTZ2N1+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788283310; c=relaxed/simple;
	bh=Bf3DldYJPkEl5wDXkPPwE+qQIpcMuluvTmCJXkBa3ZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FLqfkJiSx+e6/KWBHqsydA144qjEhZmTQnX7Enf2dgZjfdkFfygWCFXodMmTeeIjSD3xKK2/b3gFRtQ9EvNo59u2dmMnvb0wou/VOtcdY57lBcBpNVOsblKf7NDcrg+AfI/cgb8R7stxo/3xw4sTr+5D1gXFnAwOp6LGydXKgFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=w1PVg66y; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="w1PVg66y"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5218927884fso298701cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 10:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788283308; x=1788888108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oFhnWYzUZYC/wvAq/4Lo1J9s4tj77sgPBLg2juwGlsE=;
        b=w1PVg66yReSX5yg83+AUMHYBJbdEiIxIva72R+qUDOld7CwiDAxGrH92f3G6Fvu8Me
         oxkrUV0baAy+WiDw7UGF4dohAsK0xkHHoSgJHJYMuGIcfWyAt/68PlIAm/0PaIw+SLzq
         DJx4IK0MoQuGxT7Rkqde14G1XohjhJv0I1Zr80tVqFQsBfOWH1MobEtfr9MEfjIhOtsj
         rba9WpXdH3n7Yfxb4b0VgeuOUaOanASIde97c01veIypNlcp8y6uW0y83Q7G92ali9nJ
         qdaM6QRyW1dvIvtxUkoGG7nBIH4K3gPMd3pOMalIfHKcibmTc8IZaM4OK06e3v/iCbc7
         K6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788283308; x=1788888108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oFhnWYzUZYC/wvAq/4Lo1J9s4tj77sgPBLg2juwGlsE=;
        b=Rcf5ipDv2DH9mXGjEc0VygN2H4u7bOHY+lPTvwaL1a5ymYu2x1o680obCbzHwo4LdX
         G5z9THePoApfatFW7zAggMzvh4bwNpfaFAw0NoP+2i2lS2vbOPnQsvZQ54fMd88aXE1t
         bdrQLNV2OeF3q8v3pIn0UgmYRU4++enmEuEPfloNjSnOXVbwuUuhk5p0xJ+FQTdlWZ46
         1ky1OUuqO4NuSLzsosvjxnmruxBF+bWxpbYut/pNjyazee+0AGjCbbJMvkNs5lLVfY5A
         G2HdQchMeVJOH9Zppg9BhPuuE6/jXuoqyQVcHkwxfpRMH1gMXLnHHFZ3G+i94//mt1SZ
         dYlg==
X-Forwarded-Encrypted: i=1; AHgh+Rpgpq/lMyxfhOJUOYdMf6eLVTJgz+Px6EYW3xs9qO9FKp54CthUjs5Sq3BKoJLNLhkzmXr1x/xbVIqpkAc=@vger.kernel.org
X-Gm-Message-State: AFuF++mQgVgSzu2dYJCKRWm7fNbswqUsaPCcl4EIrIgmdu1fO3HQGF4z
	BGAHhIi4BpDcahhdg3MBmyc6i6hWgw/yPkgz7kLzgxxx+7adIiwyNjqGCAmMx87GB4k=
X-Gm-Gg: AR+sD10DOlcPpqsOetJLPfbdGBCllAKW0BU57G8jSbbDI5eV03h6VD57KyX83nOGso2
	tvMmJ8ZnldRZkDByL3O3zFIxg7DNWz8xNzpdpA1wB17dwuRmJ+RAcSQ4rpaD6psuIG1TLzdgqmi
	4sAj1obYyer3x/MooEiJ0R3OPxvAaWIjQPY9nHcnBo9Sq1/3OA/26dwBFUy6YN0UR2WzgzFuPmc
	okenwqaQliR+GYbytVy2f1OMyJX++lp3Lrq9V3aH7lZG1fZi92xJ3/y/f8ijhOuwpfBD3A2o4Oq
	8epuVaVwnT7Pfrys7yuVq3SEpplE0vXjbfDcMhOHZvxZI/zeateoeuF2P12GR0B0tyCsuAU9VDe
	srfJ3bR+TA8m6aihZoXRGcjxRCbY3R/zdIUDXA0BAjIzqtkJ7rSu/f7h+twr5QZTt+6p3178iuX
	FSGi9t9ZCh6KoZkcEGrdEKT+HIg6+cp0nnqAq8QANCx06CTEm3Yrz/baVOS1tBSlBoZQ==
X-Received: by 2002:a05:622a:2586:b0:51a:8bc9:2915 with SMTP id d75a77b69052e-52fb93d5098mr461094611cf.8.1788283267690;
        Tue, 01 Sep 2026 10:21:07 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530331d9cbcsm1423661cf.16.2026.09.01.10.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:21:07 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: qcom: qcs6490-thundercomm-minipc-g1iot: use dev for device nodes
Date: Tue,  1 Sep 2026 12:20:57 -0500
Message-ID: <20260901172058.1512508-6-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901172058.1512508-1-elder@riscstar.com>
References: <20260901172058.1512508-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent change caused the embedded PCIe endpoints on TC9564 SoCs to
be treated by the devicetree code as PCI buses, which is incorrect.

The Thundercomm AI Mini PC G1 IoT defines a TC956x SoC, which includes
a PCIe switch with one upstream port and two downstream (external)
ports, plus a third downstream port.  The third port has an embedded
PCIe endpoint with two functions, each providing access to a 10 Gbps
capable Ethernet interface.

The devicetree nodes representing these functions were previously
named "pci@" but were renamed in the interest of consistency in
commit e806c63ba51a7 ("arm64: dts: qcom: Rename pci@ nodes to pcie@").

Unfortunately, of_node_is_pcie() causes nodes named "pcie@" to be
treated as PCI bridges, which PCI endpoints are not.  The previous
name "pci" matched such nodes as "default-flags" bus type, defined
in the of_busses[] array.

Rename the PCIe endpoint nodes "pci@" so they are not mistaken for
bridge nodes by the devicetree parsing code.  This restores the
previous behavior, and allows them to be used for PCI endpoint bus.

Fixes: e806c63ba51a7 ("arm64: dts: qcom: Rename pci@ nodes to pcie@")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
index 31bafa2cf51db..183ac59ca7d49 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
@@ -790,7 +790,7 @@ pcie@3,0 {
 			ranges;
 			bus-range = <0x5 0xff>;
 
-			pcie@0,0 {
+			pci@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
@@ -798,7 +798,7 @@ pcie@0,0 {
 				ranges;
 			};
 
-			pcie@0,1 {
+			pci@0,1 {
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
-- 
2.53.0

