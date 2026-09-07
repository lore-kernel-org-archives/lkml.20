Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15BC40A956
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 19:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788811169; cv=none; b=HqSPY6I3cIHWwjHBoeLNkAtdmIimHHvNeehI8KrX1GY+He2luhYfrVs7Lj4vdDZp91xhJ/ALSZ76ljxNISzTuf1LNGCeimO+J8lI8d2NregYgK1LAgMgQmTG7A+cZ2Asi87bmehECtFA5fX0MD/zfaPs4NaEzNSdUMDVXH2xGVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788811169; c=relaxed/simple;
	bh=wQRPeTV+5FiLTxMGarwCwCbNlevB4Kf7DjKdr9Oovgk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=drPeVreCkJ3pchbt0vx346K5juZfLYKMjJp5nIwmYw0DLsd7gdCsZiDVhpetr4Ohe/MSOR0PdMD+biFC8WF27HOHGiwjiV0Cx7owqgZFH6QxeBG162w45iNWJvMqsT4ivXHGnMFtrtLxiRyQ6EUIT/LLgWNGW02UvH+MmHXYEAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AI4xIdM0; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AI4xIdM0"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d91518a63fso27574355ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 12:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788811167; x=1789415967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ykn8R+5bxXefN33Ze9iKBwEjjXnMgUuxZmUBRl5EBxg=;
        b=AI4xIdM0j9JRxqwGvBwSj42T9yJfq2gGSTeC0GtNDmS9VWeUS+AottAkY7EnllV5Km
         p+fJuGHUWpzTnTmeusZExhgICJ5vI7agNyhxewXwBFQAbiUSXEDn0oXOcUdeZQlPpAHJ
         NGVDPHgR0J4DtrCzbCPA3S4coJdPAWyFYQlXgd2JVXCiv2oPfWHB720GXgOvy+kJXSwU
         IkO3AhJuZT8wr+qZAFcXn+gBbacGyVKs8vALoIid3aSGZB1CiIsNiP4Znflyu37Z1gk3
         7j5myQcJhPWoxxtk+yECs0tNVmtqeFYYT9zQu0x5y0kN1VFXYlANDBr6PaDKY0pIVkFo
         EwQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788811167; x=1789415967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ykn8R+5bxXefN33Ze9iKBwEjjXnMgUuxZmUBRl5EBxg=;
        b=YcSAL6B1eSRu2NyZtuwsl+cPevbMksxCANjKr06H3GiDNA2H3nONeCvT2aJ716SXht
         LHR4J82ViIK61Sm90lWwzqKhRVbudUlpfjkdCdQeo8+9Mu1XeZ9Cu9WjHiTkOLN61Bsm
         SqDE+5c/CnBR+bdXlLKoy0L7izyEuHImcWBfmEF+FtV+bCCfQubGIVQmxTc9JW4zsirw
         Yux9AsPh/tFwnexXcfHUAXtIz3VlQLMRO/8HjacdbNPq6a0Exzju95RD52YDjON9Vtzy
         Qb3ojhStsq0GImLxSkQQ6tsBxitnpifHX6x8WWcKdIplBK46xTBl7SOjaT1nh3gi7Xiv
         w7qw==
X-Forwarded-Encrypted: i=1; AKwUvBzS/LZCVYiARtVwSnOu1jARHC4n6sULb2njTowAQSaZs+dpAr+RF1G1rTieOevWCDxe/TR6E4H7YHyg5Qk=@vger.kernel.org
X-Gm-Message-State: AFuF++k1s4wU/aL4n6HyRWHe3agSIoj/wvTbJvFxQbtjOZ4j0BzHVn6e
	VLayzQlFOA3a+au2nKmGaB6UNoNEjaJCqjxz3KODA1vcMZ8MjiMTeGCEBh7rgQ==
X-Gm-Gg: AYBFou10zBviSjuZ10q3M9QZG1i4pJVcdKIxIK75KLHjN+JAqa8wBVDeW/gDtENU5Xq
	+CZrShNRJuMVoquxgKTS9dV+k7iYKpMqxmXNA3d6fWHwFQ+u6C9NFKfQnl9lD0/L1epfyAS+Oom
	0sdEbBtHYGAqZH0O7MQdgD+My72+bpBAQP8BuzsuC4rrKslzkOU02bBfQl3T9uY/urIkN+6b/HT
	f5O7xpu1Ua0yam0Brl5D+l4YKe0zr3blP2ILizmOalL/r1g1p96I/TZoBo+gyp1AQ+yBWEzuqrM
	HCt8TSeqE0tn5TxvxwWPMQtTevaqZ7jRkPOK7GNi7Pk1PY8bLHcJ3QW9gbiUc7rBix0pm/OfPHO
	RaZSydrMo//LH5Xasp8d+jkYkmkgb2EDkrU15fJmSITaxACTTlz0ms6ZvA+K9ejULTfZZLyqQvx
	LgSgL6//9gkE2pMIw3e93Y66GV6p8ilPbjT10z7oLfqz4a8NTURaGYPv7Ca7ouoZuRH5uE3fP5T
	Tll1O+nyVglIz7Wo/JEcqY1QkfBNmt40iqFmBQBLreDdOcj5DeygfcP5dr524bIGFI7pryrLX7P
	B7Uig3y5Sj6AuRtHXZpi4vgEonIXIEwZcRgFjA==
X-Received: by 2002:a17:90b:33c1:b0:398:9bd1:3214 with SMTP id 98e67ed59e1d1-39b262dfa81mr34312237a91.21.1788811167343;
        Mon, 07 Sep 2026 12:59:27 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b58187a9fsm3683932a91.3.2026.09.07.12.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 12:59:26 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] ARM: dts: BCM5301X: AC87U: specify switch
Date: Mon,  7 Sep 2026 12:59:24 -0700
Message-ID: <20260907195924.29510-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add labels to clarify which port is what.
    
Also set WAN MAC from nvram, which is offset by 1. Set in dts to avoid
having to handle this in userspace.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: reword.
 .../dts/broadcom/bcm4709-asus-rt-ac87u.dts    | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts b/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts
index 59400217f8c3..2fed02ebb1d7 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts
@@ -26,6 +26,9 @@ memory@0 {
 	};
 
 	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x180000>;
+
 		et1macaddr: et1macaddr {
 			#nvmem-cell-cells = <1>;
 		};
@@ -77,6 +80,43 @@ &usb3_phy {
 	status = "okay";
 };
 
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "wan";
+
+			nvmem-cells = <&et1macaddr 1>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@1 {
+			label = "lan1";
+		};
+
+		port@2 {
+			label = "lan2";
+		};
+
+		port@3 {
+			label = "lan3";
+		};
+
+		port@5 {
+			status = "disabled";
+		};
+
+		port@7 {
+			label = "cpu";
+		};
+
+		port@8 {
+			status = "disabled";
+		};
+	};
+};
+
 &nandcs {
 	partitions {
 		compatible = "fixed-partitions";
-- 
2.55.0

