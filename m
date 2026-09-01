Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B8C3AB286
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 17:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788283266; cv=none; b=iqGqk3ebF9OfVMe+UB+AG7shY173FYxLhRhOcrTtO3/koasEQ3StO+TAJsvCRosVZETbCxd+GjVJrhyR2u5CnAX26bfbQFFKZQZMAHd8PO5ubmCUsK48HHyDaL8KZC8/c9Bp0au80OCxrlmnmDxa8N8lr19VGPa+7IfsRYaPChQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788283266; c=relaxed/simple;
	bh=ZQZ1l5fYm5WuqOkU5KgBnUMdFxCFcIY2eQfRbuZVmis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iCMQqFkWokcDqg+GCh7OgxS9GH10eu36mFESMuvAsx6KDW5Ms8RlMgJRfkd6cd497vWfmH7W5/ku096M/tmEP3f02PmebM8XrMCcqZ+wXdUM2Udh1YJGPXVD0iPAwWwVfXGoN4H/ionLE7x8xDOS2YlszM/CWZ+RZ1dMx4cmDJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=0Vc2V+eU; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="0Vc2V+eU"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5300bdf61d9so139451cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 10:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788283263; x=1788888063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uv2BJxLvaZZpFr8An2zfM95tRAb7/Mj4O3Urh0xixiw=;
        b=0Vc2V+eUC9r7b8AcTlg0ogxQpAf/XF4GU5tIF4024uTSWNM997dEZS+EgpGgRDbU2+
         mujZr7SfIX5cQKWNjCsBkNN3P75naIZsNlggTrR34XYTFXqHjgfizKL2xQFZDvbVF+Vy
         UYVfg76+a+UK2UytIioxjuwcMRBymeeQVzAbm/t2+kLW8WVnM1ECmQSHlLIaMxlFt2DX
         hG9BgCWoHnGIRMm0FapQkuN4g6Nvy5B/ZEi4PhY31dUQUJEY7PQqYTRNzmMON7K3DXaq
         0yLHHy1YeXe5+1fS0uOw6tTPxJaINtRPMteUKmroi1LHXFUkZdTQV80HM1O23acvwoCn
         Vtww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788283263; x=1788888063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uv2BJxLvaZZpFr8An2zfM95tRAb7/Mj4O3Urh0xixiw=;
        b=AbL4hyJfcLPT0xS8CivFUFPLErF9+Le/l/xN2cL5C0R81mED47Sk7wvXrz5268UytL
         Zvs69H/P5NOxkd7245DIJBsu/pNQy4RBmXBVsKBJVRZ6acL4MeLhbiX+Bfl+Qdf79j3C
         Q9I/45TB0wFdcdsgpj0ypmP+D8L8s9n2/V0iJX4OfwsPpBGGWgp4UA0IU6oPRIo6KdZY
         6mFHdFO4IBji/DHARVLfB7Th9lFEaiRnQolnhALUpKv5l7Q12BqNbUwAIA7UzAwuyDsr
         IHW4H7SIKcnztmtXSJrauSCBwypJCOgPCZieG1nl6tKZRL50ShDieUiwXvhMda2t3VWD
         Qy3g==
X-Forwarded-Encrypted: i=1; AHgh+RqjbnjnoD+HG8ER1wkc2W2jqlQpaJBU9ndvwzrk83tGTP7MKQ/3DZyMHW2RBMyshOKqeCG+xHH4sjjgSRM=@vger.kernel.org
X-Gm-Message-State: AFuF++nwjmtFqwBLKMxPC8AdYkMKKdcg0JM+d5Ovj6r/1XFo257S79F0
	sDyWAcRcOxTyiA4FExpJZGkwJyH/fao+pCeQjgf9+MgEJhHMkEn54z83LP0xKBjfqdU=
X-Gm-Gg: AR+sD12hVwnPer3u/Xd1uAXbRkhK/znVtWuRQ/sd4mj7Nobigv7Bb27sWKrGhJrbPNS
	7jN7DUTc0jmdfFl4LOnnXS5m2X1Yf5VEsP4ItgW6THQ+CjTZn5yg1xjHIUv1l7Ug1HGgZm96BkT
	9BqFHJXYgyjqCaICn9KLLtIYGTEuOmFeTkpNRj6EzwpnDYIrIpB8ETdESKMjq4pN4hRA4VAatJN
	1+EGgwYxPpqeIoM1cBKxOiSVYMHTQBI0OBKYsok0vJMU2vAudz+Fv1oAciuLPOaRwzo4Fe1ZEJr
	83VzZrT+woj9JFuZkn6mHBcNzTHJpzmFkr5622jO/JpwGd+kIyhXcZjFeDLkNZImBDCly/x0Xj2
	Mc/4TRNc8S3os5StU8ZMCLjc5741/tEX7d6hIP8oRpsOTjHkalMB49bO7zUvYg3df3G6jGLVCoq
	FemlcAcoySn5wOt3mZy8ZQzByu0cAD+B/ktO9IAq2l/Z1sQPUP1lMQqVaXdtf6SthycQ==
X-Received: by 2002:a05:622a:116:b0:530:d3a:26d9 with SMTP id d75a77b69052e-5300d3a40d6mr195978991cf.29.1788283263394;
        Tue, 01 Sep 2026 10:21:03 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530331d9cbcsm1423661cf.16.2026.09.01.10.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:21:03 -0700 (PDT)
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
Subject: [PATCH 1/5] arm64: dts: qcom: qcs6490-rb3gen2: use pci for device nodes
Date: Tue,  1 Sep 2026 12:20:53 -0500
Message-ID: <20260901172058.1512508-2-elder@riscstar.com>
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

An RB3gen2 system has an "interposer board" that contains a TC9564
SoC.  The TC9564 includes a PCIe switch with one upstream port and
two downstream (external) ports, plus a third downstream port.  The
third port has an embedded PCIe endpoint with two functions, each
providing access to a 10 Gbps capable Ethernet interface.

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
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index a13315bf0fb07..99a985a177a61 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -954,7 +954,7 @@ pcie@3,0 {
 			ranges;
 			bus-range = <0x5 0xff>;
 
-			pcie@0,0 {
+			pci@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
@@ -962,7 +962,7 @@ pcie@0,0 {
 				ranges;
 			};
 
-			pcie@0,1 {
+			pci@0,1 {
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
-- 
2.53.0

