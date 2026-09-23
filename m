Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EF152842E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 18:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188838; cv=none; b=fL7o+UagktPNr7+RhdmCxmgPgGoow/AETBls7NgJAtRS4FHxFZ98poJVTfO4p57TjBBBSp676Yyr2UoWwSSEF367ZhTGC/FF44fd7QDecBuvvzhHfQ5r0A5uzE8L/CX62xyo4GHejU6rFXAg4RhV1Jzwl02bzShhNqybh7eRLU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188838; c=relaxed/simple;
	bh=LjI2SsSWKQZX7ULnYkf78v7gp2sgIgsQTM6Mv73WTwc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MVb312LNk5Su7TB7W6YdYc8iGWiukh5N/dJUflRVgyfzsVI1iSEi49PLR49D8CfAMz+GkJBiGVSjAlKBFfqkTr/kqCsVktjtuSLBax3GLUciBTBQ9eUNmrxkskt7dgmMXe4P6PKVPOW5ENq6X5Qar0m1ubU+p3xbZg0Dz6WW79Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KXbJh+/d; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KXbJh+/d"
Received: by mail-pz2-f43.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2dso624134a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790188830; x=1790793630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3gc3lVJFpeHvTVPTQlhw9bRs3DHSZ5NaiLqgYc9qgEg=;
        b=KXbJh+/dP+H/DVta2SZjpyc6dT+zKM0g2loVnfAddOHhWjdLlHCqhNc++/Q/682VBz
         iaNnQALzrBBhWhSUBLQ0LC6N1/489yvOCWRz4bVrbjYzrfjZDGIbZ92Q4oQctw9ncOZZ
         V9HsxJ17HQ2BqKZ9AvrlI9MNz9s/FjX2lU5yEot4BZ41S++7joy2Ll6qWQRavgjhZ0bn
         cBj4FALxgDPm4RCCdiucgK01PZ1/q8yB5qADIQT3KIm2Kop1cLJpUvyODk8f/m1ODn4+
         3rryejjNb0oRd5QnhX2rhlaSHTRut8O1JdMuTyACKFyMSIliuESIYpxLl0FRuGQTu+Jf
         dlqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790188830; x=1790793630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gc3lVJFpeHvTVPTQlhw9bRs3DHSZ5NaiLqgYc9qgEg=;
        b=CG5oG0wWtjJ79Nof9HCsDZlJtzmgPb+TY1qRBZ4/o+iNdsWpd7kgSc7Hh06yAIo7oh
         RssesXVxzNp4PS1IPydtBISFBQoKlUItwNd6/C72fOkiwO/q6jXZLFQBQTashBwcTB3k
         jZFDzZflgf/zDEXEDHi0nfLO+6pvQ+a/wf0vVBmB7ddZ44dfbF1Y1VC7UQ9l5KMgaxv8
         SYAe6ZI97iHXLg+ljdFmZJyfE6CJstb+aget7g5VcklxT0nmKw77BY2T0HTP4rwHNIHN
         uIIoL3vlxqvO3gK3MJtfT5XWBjEij5ZaSW6HRAhFWdl96wxnFRJlgOynZ4hyCY848+j3
         kLXw==
X-Forwarded-Encrypted: i=1; AKwUvBwuu8txgKM5j/aDArBpUx4dwRQksF5cExJnAEU2MYjq95+7A6SRzh6/NM32jxhMy6Y2alvYrk0XI2aLO9A=@vger.kernel.org
X-Gm-Message-State: AFuF++nc53m+P0Pt+zJwOnBAp2ncZ4Xk0HizDsG+sdLIsWy569+Cu/is
	BXahA1GJZBOJi6Ig31LbXd/F1xFR1n4v4u78atbMVn7qgIRxa/ME1aCC
X-Gm-Gg: AYBFou0G+4UE77L1H+o20mOt2R0bJ2YY3hdPEWIcid3+UyvwQTtt3phKW45ihkJr8V5
	tpJZcGFbRY7xd7sqmn7kr1cERTjKNerUUUNl/EU2hvH8JqG9eY3M2LyCQqxArn97QU2bIndxfFo
	yIdMb1RHyvY66V9Tk2HuJMDvrt/BtBRbZHzbFHEZgb4j/iKacnvDn1NC7MFaxu/X7xCs8kvjMEB
	yT1GhCrTPztbKKNqAJoBllzpHW8/2Tlb/9w4xwK+CUEAhJcUhWCWCOCN5Hv4APiI0efRgRTYuGs
	DJLG6UdWaEDBv1RgIFVuuaKu0FYpP7zwO5dARblqZio/5rRimoOjw5AbPrzCTjr8mKhq/Uxtord
	9PMS/JH8ogB5LT0tZZByoJcLwiJGwwxhQXaNgrP6MgvN+CJGzNkWTb2QcRsIg9cKfkXgOOU6hrB
	Q0LOI0UtjjTeLukcQ/vMLK471srmbq/NrLM9k29VTwlaQUAOaGNTHgskMbgUC4o3dYODbpoSle7
	Yu/qLrwrzm/8Icl06n4oew9W3MHHe4EjS3xh50Ix7cjjE8O00bRaI1NIOzcEJKW5LE4ugDvvsDo
	LSJlKdBUrqZ4uYeZCxegWX5VsHvHmSSRlo7hGTZQXS4TIbbl
X-Received: by 2002:a05:6a20:6f07:b0:3cc:8f53:26c0 with SMTP id adf61e73a8af0-3de0e73d922mr85921637.17.1790188830372;
        Wed, 23 Sep 2026 11:40:30 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3b82aasm1644341a12.9.2026.09.23.11.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 11:40:29 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] powerpc: dts: turris1x: use qca8337 internal PHYs
Date: Wed, 23 Sep 2026 11:40:28 -0700
Message-ID: <20260923184028.13830-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The QCA8337 switch has a managed internal MDIO bus for its built-in
PHYs.  Declare the five PHYs in an mdio subnode of the switch and
link the LAN ports to them with phy-mode = "internal" and
phy-handle, so each switch port is connected to the correct internal
PHY instead of relying on the implicit legacy port-to-PHY mapping.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/powerpc/boot/dts/turris1x.dts | 35 ++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/powerpc/boot/dts/turris1x.dts b/arch/powerpc/boot/dts/turris1x.dts
index d0b7c62b8c6e..58c9e7b34e50 100644
--- a/arch/powerpc/boot/dts/turris1x.dts
+++ b/arch/powerpc/boot/dts/turris1x.dts
@@ -174,26 +174,36 @@ fixed-link {
 					port@1 {
 						reg = <1>;
 						label = "lan5";
+						phy-mode = "internal";
+						phy-handle = <&phy_port1>;
 					};
 
 					port@2 {
 						reg = <2>;
 						label = "lan4";
+						phy-mode = "internal";
+						phy-handle = <&phy_port2>;
 					};
 
 					port@3 {
 						reg = <3>;
 						label = "lan3";
+						phy-mode = "internal";
+						phy-handle = <&phy_port3>;
 					};
 
 					port@4 {
 						reg = <4>;
 						label = "lan2";
+						phy-mode = "internal";
+						phy-handle = <&phy_port4>;
 					};
 
 					port@5 {
 						reg = <5>;
 						label = "lan1";
+						phy-mode = "internal";
+						phy-handle = <&phy_port5>;
 					};
 
 					port@6 {
@@ -208,6 +218,31 @@ fixed-link {
 						};
 					};
 				};
+
+				mdio {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					phy_port1: ethernet-phy@0 {
+						reg = <0>;
+					};
+
+					phy_port2: ethernet-phy@1 {
+						reg = <1>;
+					};
+
+					phy_port3: ethernet-phy@2 {
+						reg = <2>;
+					};
+
+					phy_port4: ethernet-phy@3 {
+						reg = <3>;
+					};
+
+					phy_port5: ethernet-phy@4 {
+						reg = <4>;
+					};
+				};
 			};
 		};
 
-- 
2.55.0

