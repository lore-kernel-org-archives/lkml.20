Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794918138;
	b=Pd3C53nVNiRpBOaQ0Yi263J0AGX2BLEQao9uNkLawQob5tcBYpSvsEQut5XCuJfyOYuJ
	 RghZ6Iwdq4Pj/dKX4ddsb66kk7fu/cIGL75r0tEj4YmssZ48M57s1gmATZxnghQChBRvt
	 V4ZFCrsVuyS9Mz09Gow53VYz3zztZUnk8EPCcy6k0FLw/rCxzXZV0fhxyxwX6RGkQlp3/
	 eG19SBhStZpTFk8dXxItI60J5fEWZa2CCjC/ya0oqv6PeBaf4gwUC5O0wqFk04bQWw+ax
	 mRCBXOsO4NmYEbomiRgauj9CkPuetsqN6Gfqftbi/tFMTzYIDR613G1UXU19y5kp5Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794918138;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=EYOpW2xyp4wYDs/95GrYDxNW739hVA53XI7RSeqe3Ss=;
	b=pERwdcivKlOKAyeuYjfA2Ku+/TXv9F4qpUxuaUOH7b6hdZsBfw4fLOempxmg8ERxoz46
	 Q7ux9P6XtzC06hr1Dr/bDMtF0xVsioZBiM92laQGHwNjW0L4FdKjLDYtRrct7rkJbuFEb
	 cN5KNmnlul4zGf9mxpG8oXPjhl5PxF73Nq9K96TiZGANIVAbKd+jYkHsEgGCP9UPTSftb
	 rxqARSu+PlRmGHqg+ksoLo0YzgsPeK8Afc4aSd/ZnWLBa+DJdURPhRQKC9wmH31BUQ9ti
	 nw+u+uWhBTfrarfnDtJ8ewDEMxqLYLEhavwFX2AvQA1PIOP2xGt3Thl8sMdt3rj8Z9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ktwb49I3;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4E2606A31C;
	Tue, 17 Nov 2026 12:22:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA4E2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ktwb49I3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794918136;
	bh=tlK4X7iJfVxdWbikBhdNu8DWcD6//ek2zxb6rtNVeRM=;
	h=From:Date:Subject:To:Cc:From;
	b=ktwb49I38KXsD31YAQ5oqisSeLavEGHwgLnMRYO88DMuRMwl0NMgkJUnWLtnsmHfF
	 6pl79lmyQhXanj9yThuk3Nb1P9WnGdxcZcIFJBs+uSk8usohffQoUwwHGcgYl6K7Q5
	 QCgBlex+LTS14DQKdczCHopYymtGzJRIRF/QOEuYUVYIAEuG3U69oLm7HzTTaztS4j
	 XTLzM8yb6jZw2xA8GKkTPz8b3FpgmmdINnP/yNPGwhj/idGbB8/8rQDGp0laZdFJD2
	 /vDTHqdrgoyq3kwxwX7fNkNoO+teuS01bEGHq7OfUVyIgyCWe2J262/Zum5c6MPlQH
	 WnLFcZepAUmaA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 93EF917E0311;
	Tue, 17 Nov 2026 13:22:15 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 17 Nov 2026 13:22:07 +0100
Subject: [PATCH] arm64: dts: mediatek: mt8370: fix CPU map core ordering
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-mt8370-fix-cpu-map-core-order-v1-1-00c6c74c7629@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NywrDIBBFfyXMugOa0mjyKyULq9PWhY+OJgRC/
 r3SdHkul3N2KMSeCkzdDkyrLz7FBvLSgX2b+CL0rjH0oh+klApD1Vcl8Ok3tHnBYDLaxISJHTE
 KM97cSFpp0UNzZKb2/Pnv88lMn6Vl6jnCwxRqhhB8nbpIW8V/aoD5OL6djYh7oAAAAA==
X-Change-ID: 20261117-mt8370-fix-cpu-map-core-order-0a95d9e87802
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794918135; l=1923;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=tlK4X7iJfVxdWbikBhdNu8DWcD6//ek2zxb6rtNVeRM=;
 b=bL2y8Jmr77VlkoCdxT67HLHwyaSTFwIsIIP1lFZfF8tqFleRe+xGtbOjhaGfCjiP38Cl2l7nf
 JBlw9sT3KRmBPIZllUFFTEl347UC3xHH11osVMDc3LKoLUg8KE97bTu
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

In mt8370.dtsi, the child list for the cluster0 node of cpu-map is
overridden, to reflect that the MT8370 SoC, as being less powerful
variant of MT8188 and MT8390 SoCs, has less ARM Cortex-A55 cores
number than MT8188 and MT8390 (4 vs 6) but the same Cortex-A78 cores
number.

How the cluster0 node override is done makes the core child nodes to be
named in a non sequential way (core0 to core3, then core6 to core7).
First, it breaks the cpu-map child nodes naming convention in the
cpu-topology bindings. It also causes the arch_topology driver to skip
the A78 core nodes during its devicetree parsing, leading to at least
incorrect CPU capacity computation for them.

So, modify the override so the A78 cores are seen as core4 and core5
in the cluster0 node.

Fixes: 49b07ed22e37 ("arm64: dts: mediatek: add support for MT8370 SoC")
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
The patch has been tested on Mediatek Genio 510-EVK board, that
integrates a MT8379 SoC with a kernel based on linux-next tree
(tag: next-20261116)
---
 arch/arm64/boot/dts/mediatek/mt8370.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8370.dtsi b/arch/arm64/boot/dts/mediatek/mt8370.dtsi
index 7ac8b8d03494..3fa48f2e6a6a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8370.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8370.dtsi
@@ -16,8 +16,16 @@ cpus {
 
 		cpu-map {
 			cluster0 {
-				/delete-node/ core4;
-				/delete-node/ core5;
+				core4 {
+					cpu = <&cpu6>;
+				};
+
+				core5 {
+					cpu = <&cpu7>;
+				};
+
+				/delete-node/ core6;
+				/delete-node/ core7;
 			};
 		};
 	};

---
base-commit: 38c8be16846f10f3a710351357e4f4ace7254c8e
change-id: 20261117-mt8370-fix-cpu-map-core-order-0a95d9e87802

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

