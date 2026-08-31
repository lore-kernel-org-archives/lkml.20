Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403D43264D9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788219419; cv=none; b=nP/0uPxFp2AngEnfXZDIgakTe4H8Im1toF2eh3Peu9me599h+xQ566LR9ECwyCYxoNqSynh7ghll1uqy+vxb0NQ+Od/dCRJUgLuI/opD2PwFjWENwWm8tOsQUIbeegQ/fBDCkRooC2RKRbexQEENvpVxJSSaznrXbwtrtbstovU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788219419; c=relaxed/simple;
	bh=jZKfWah1QV3QBd6lo8YFimNx0a/nzRWJ1Gz6msiBdiY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UubZJ+YDyUAAhmpfT1bLZHqiK+LS+r7TABVNiNFpWKRXmkFsHYL6JlSkndOR/L6a5EMA/+PUQv8RcAFeH2+pdBJeTny/So4Ef6oRrzARTHqEliCmLHV4LX9amg/kkxFCniZ21goVkRG46kLXRbXXwhvHXS0sQ0ZlNEftGmhumFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0EFwVDN; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0EFwVDN"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84e27035206so4043604b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788219415; x=1788824215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cRgJyzZMBo3Mlk+3YKkY9AJwPGn5QwuLyWn+ecHzZ5M=;
        b=K0EFwVDNKxherp1RvKc/x1igVz3hB+7hWiJglOnbJHMzuNr74TA2eu2ChhXF7U2oAr
         rER/U3ezgJB79SHHLbusQjbNtyCs5jglGhVBLPqvA51NzgBCL26kwzy5ajXtdlduz9GG
         cGZkqDkQrxkygP+zN37v0O+VZ5pr/LhRUZhZ9Ug2vb9/LdoqYMRxrMSZKCitEdAef5UJ
         Vjgj5YiOLSN+qa3ImX9//2GxoQ2ETw2Er17wrlIck78u55fmuKmKP2VmFGzSzdH43UPj
         ASpVvqtLa+nZI4D899mRaDD3oJPK1FU8JLPn6vjZpRau5x2RVTUrP6hBWVDIjOTIxrsB
         w1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788219415; x=1788824215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cRgJyzZMBo3Mlk+3YKkY9AJwPGn5QwuLyWn+ecHzZ5M=;
        b=NJfOm9qdS/SYDJoaycuEKEawNq+HXe/k1Do//0EzPtWp0RRRWQ578YJOVMPr72xCIi
         YVRto8TzthSb0/CUDgmzmDS1C83Yp2/vRgl0Wp8MMmoq9I+fTxSnIrcNhGy7nBvTHb17
         G0YbNnb1BXeVeGzic4m5rAh3Tg9eh9vQJHz5e/1mfmDhwGdF4dyDykHGxzlT3vUqPbIq
         xI/jFyliJnCYSqjmKR/z2jImtYj5i/xjuei4kWwWKx4jLtS0brqE7OjjJpBO91iD6aii
         MWOs0R+6imNvh0UGQj7b1w1u5ccdEyTXBAUqdRoVFogb88oECYhFDzCVuFb1jjF3P4cG
         23Ow==
X-Forwarded-Encrypted: i=1; AHgh+RoPWx+40otr96d2irepGSqD7sBbGroIlraPcG4cGNHYd/P27i7+tcm9kKY8sUwP/loRM/1HBqy42FEAgLY=@vger.kernel.org
X-Gm-Message-State: AFuF++ltHYpNLMKccMGu23TCSwZw5YJaNWiQokNuX6WZ7/PBLiaRpme1
	B+qVORZRkWNuBSMgCs15C1WiHQtONcDQkp66m5juPeXJHTj4YSFn5Ueq
X-Gm-Gg: AR+sD11rlkd0FSsLCXGo8Au8fF+ZAxuskbkkvk4e4r4hARMhPfOzcMcosRLcZFq2YNl
	U6BMGLeQkh9DYbIdQk+iCirLk7SPGTakgZ7ZdWNHuG1Hlthmf3byyseOfIwsCIUupRbh6n5LGiG
	kTsQH8+jUlHIcY2D74vsUyff86X2f6xK4qgcmDfprZsac5B4SG3KZUZZtpDU+8TE23kfGiVjYYU
	RlPa0xQqG4/9fHm6eqgwAmoVl29UflTmVi0LM3rOHAtGdVeyQ3MokMSag9I8wgFeh28VvkPCkzu
	3C1ld4In20EdVAfxzzci5X40wfv/i8aUDKSqgExCCy/Wtz7jp9s9JoWDOstEDPPApBhdpU9icFQ
	DyJ1HC7z4TidV1zvOefhEo9sGoWNR9ByRddzpDial+UU1XPSG+hcdDb+7OGnQAsawwOVK8NqcAP
	qK5GBZ8pR/1t3lrmyf3vXTpC1uAoQVitbnVdOHdwxBYgPPFFdvTQn6xun0wwuNKhqU9TXiaIq23
	R7N+mCU+whkQctEpJa4k7nJz/EqCZYlKQMGfIfDOfVIDGO05FVw8aHuXbhRIi5SBrK1pXJGiECc
	DMwbr+FzjuHSvY6YsLEaGWsXNy7AahXfQTp1joo=
X-Received: by 2002:a05:6a00:8007:b0:848:3f07:c5a2 with SMTP id d2e1a72fcca58-85b59689884mr6282519b3a.4.1788219415445;
        Mon, 31 Aug 2026 16:36:55 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85be8e5e634sm152963b3a.37.2026.08.31.16.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:36:54 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: helios4: drop unused phy0 pin group
Date: Mon, 31 Aug 2026 16:36:53 -0700
Message-ID: <20260831233653.14232-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The microsom_phy0_int_pins group muxes mpp18 to gpio, but nothing
references it: no PHY interrupt, GPIO user or consumer pins it in,
and the sibling ClearFog board does not define it either. It has
been dead config since the board file was first added, so drop it.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index ae03d42f92a0..e63b8b5e632d 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -284,10 +284,6 @@ pca0_pins: pca0-pins {
 					marvell,pins = "mpp23";
 					marvell,function = "gpio";
 				};
-				microsom_phy0_int_pins: microsom-phy0-int-pins {
-					marvell,pins = "mpp18";
-					marvell,function = "gpio";
-				};
 				helios_i2c1_pins: i2c1-pins {
 					marvell,pins = "mpp26", "mpp27";
 					marvell,function = "i2c1";
-- 
2.55.0

