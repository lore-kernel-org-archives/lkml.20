Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794537134;
	b=SfhqeAkcG8/L/HjLkEQpWC/8D0YbAWta8Ykd1UWMm4rgj5O4iloCDYZN4Wv7r1phNzzh
	 aznlUZSWXrQZ82zTGGloDPyxl7KauLoHyHG5nEIlfodTLjNCVqSiKnb046y+DPuu6FARl
	 nW9vlI6EdMOwZEX8aeFjjCvBP7Csy9ctfV2YKawrsaJt6m/kpsncCKW5wOD2rAo1R7VLZ
	 SDV/xDThfyYKQARiR2pRcltOGxQyhNaOuqKvLSJOjUAQhkYGZ6dlPob06HBt8Xo1MNLEy
	 lL3IUXznN2qrbpJZipUnXUu2xNTSl60sUn/nTXJ9wERdfLpDumAPEMIIblo7RV+45AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794537134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nMxjreD4y0QHP2JtQOEuC4CITCprzlNYUq02BXC432Y=;
	b=5MucDDkX1vzeCnvRDWJ9Fh20sAXHGo11FamMEFXId6IGijq+/jkIU3/NeqAsXO8sE8tk
	 fYqKQuVTBNtPHEB5vo/wiEwJzOChiJchRhh9g9Zjr8gdI/ex7hF4ZvCryWf0BL2KfJhCg
	 vN6SgkUPG4nuKmSum8PuUX63WsLd3CQ7SRqKXoB/x/6CKyKE57uf4Khywgg68VoyTRK1i
	 whqS1Gm00KnkTelRs4MZ1pGC4sBEtxOiUSAUjHHNzUEWDIc9Bbr/OSq7Vks5w17gAAH4T
	 PMULqSyxjRZjXYjrUDULu7IY1vnLRYk0Hrkztc7yPB5fDRvVUa00nEQ+88GpecnlbGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DQSmCCcc;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141BC606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 141BC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DQSmCCcc
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-53665358476so6983221cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794537133; x=1795141933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nMxjreD4y0QHP2JtQOEuC4CITCprzlNYUq02BXC432Y=;
        b=DQSmCCccdQsvdy4LlhA006kwZsscR2/AayWLlrfMg7U9lze5G65+enI0z5OeSse0fg
         RhZtSFqw5dFA2lehOde5nj8hoaNDggCRv6c5BlSnQaz9Mju4hKltu8x1bAibr/hnKisi
         PqqiMKtNIi33p91oEFKipTEfBw6DLE7A0M7z9qI2vTMv+baBZbRmitvcSr6fqFddlkkY
         NAc8FfyPv/RBgDGv+ekeUIS84XYo2RnSH8zACu14NYAx+369PZEjS3UryJ9tJJujsNzo
         4H6COnJUaW5bn5x/zL9wPoWwA4Onvf61upAm6wfGHx1j820LHaQZz6Uzp0E2gOD8Cjsz
         DqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794537133; x=1795141933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nMxjreD4y0QHP2JtQOEuC4CITCprzlNYUq02BXC432Y=;
        b=kptAKVihmJxRSQ1K9OddeGt/fprmB3TC23f/MUXqPIyAp7ZOR2nqTYBxTt23Bb3twF
         /HpzdVLK11ivD0lWrlXKXpjL6nSNtylzhaP2z5VV2BDbWiGu3D7x8upCOTFg8zw3mEaw
         9RDCIQRE0xcAC+P+bK2AjaExJX73D1R8rQmlyL/Ia55x5qM9c3vdwtUmEJhc6HcFmZ7P
         9Qh6V2R4zZ0ghmGc7V80manRAkucsykuxmlg+rYiMXhbUsdd8oUtUiGrubobO2/7rOgo
         6qp8NtzU4IhOtvhFqT+Us7oa502DDm+kIUthAjjKUcHsQwqv4CSdpUcw/Jf7naFE/9lM
         Xhyg==
X-Forwarded-Encrypted: i=1; AL+hErG9qBnB7wccMyaHVZajkJCwdfoaqSmCm27jnR9HRqFHwsR3iV2NlwLnLK8PRQQ/TPc2ioL/Pn+JS/oQr2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nhnlL7SQuFOWsZlIfeyl6jDjCZTGOsVDwauu20U5+4GZlFreK
	iiQlklFSQyx4Ykp/xEFJHuSeFzd4VBb9OaVjT/Cgdj3BxZW4S2HjaoM=
X-Gm-Gg: AYBFou00viP04MN54F7yI/zDTm9Ga1UDAQHdTbiHD0Cxzuh3V1sTW4zxJ4/xfr6uhNB
	O2hzLhjFm7LoicsTKdj5gAlkvkSIBHZv8JPGPhpSjQroGDu3a29gkGLC2NBahVNKPHaVAe6PVvg
	9kCIVtchFN18opdxxsxG83xrhMuSwp7Kl/sk5OGg1huFSOaPVZBKKZidRQKTGvLXn1dHmIKNryL
	AlNQYKox3KlsDxGuHA1p7AD9PQvkoyWbuTIrudfhtRjvovPqISsW4QHRtN5rgTe8Jmu2RMKTI7S
	bUS/FwOkMF/d9PB982UR2rKdKgmV6eIe4OYeF17Wp8o9YmpshMxh3aYtaB40RIheyecMqGb6q4G
	D7PYKbLQFtvenRKxwGq3owXlcpaGsSf7g+8Eu1xNhsjjcEq280X6JMYIWkZ8lHX/8BAK/qAZiYZ
	CWXqXMNvTMfUPuTHYZ7+0tj5KXwt89fpgvpEAbUV0/eoZQ3veoCBQZGhJtFGukzTTbJ2T15vhsx
	nTx7b6eYrfu8JibUFHxHAzTDQKHXNzCmnRuTnHBw3pjqhj9X5eb1gOs5EOOBg80SMsVVK95s2jE
	gZymrTfBPw/jtT6Ci2K0V8ZvMKLN
X-Received: by 2002:a05:622a:180b:b0:535:87c3:79e5 with SMTP id d75a77b69052e-55ac7568907mr20793741cf.39.1794537133164;
        Thu, 12 Nov 2026 18:32:13 -0800 (PST)
Received: from Ixchel.lan ([70.49.63.180])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23dbf30dsm9688926d6.44.2026.11.12.18.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:32:12 -0800 (PST)
From: Vlad Banea <montrealtango@gmail.com>
To: Yixun Lan <dlan@kernel.org>
Cc: troy.mitchell@linux.spacemit.com,
	wangruikang@iscas.ac.cn,
	guodong.xu@oss.qualcomm.com,
	jyc0019@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: dts: spacemit: k1: give each PCIe port its own DMA window
Date: Thu, 12 Nov 2026 21:31:58 -0500
Message-ID: <20261113023158.2872492-1-montrealtango@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On K1 a PCIe master only sees DDR: bus addresses 0-2 GB map to CPU
0-2 GB and bus 2-16 GB to CPU 4-18 GB. A root port does not forward
upstream an inbound access that falls inside its own memory window, so
dma-ranges must skip each port's own outbound window; the other ports'
windows reach memory.

The shared pcie-bus skips all three windows, bus 0x8000_0000-0xb7ff_ffff,
which leaves CPU addresses 0x1_0000_0000-0x1_37ff_ffff unreachable from
every port. Give each port its own bus that skips only its own window.
On boards with more than 2 GB of RAM, each port can then reach another
512-640 MB without SWIOTLB bouncing.

Signed-off-by: Vlad Banea <montrealtango@gmail.com>
---

Notes:
    Changes in v2:
    - describe the K1 PCIe address map instead of citing the vendor DT (Troy)
    - "more than 2 GB" instead of 4 GB (Troy)
    - drop the RFC tag
    - RFC: https://lore.kernel.org/all/20261112015148.3911178-1-montrealtango@gmail.com/
    
    Tested on an OrangePi R2S (8 GB, RTL8125B on pcie1 and pcie2): SWIOTLB
    use under load went from up to 87 slots to none.

 arch/riscv/boot/dts/spacemit/k1.dtsi | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 3fabfd34114b..949843bb7789 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -1152,13 +1152,14 @@ eth1: ethernet@cac81000 {
 			};
 		};
 
-		pcie-bus {
+		pcie0-bus {
 			compatible = "simple-bus";
 			ranges;
 			#address-cells = <2>;
 			#size-cells = <2>;
+			/* skips pcie0's own window, bus 0x8000_0000-0x8fff_ffff */
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
-				     <0x0 0xb8000000 0x1 0x38000000 0x3 0x48000000>;
+				     <0x0 0x90000000 0x1 0x10000000 0x3 0x70000000>;
 
 			pcie0: pcie@ca000000 {
 				device_type = "pci";
@@ -1203,6 +1204,17 @@ pcie0_port: pcie@0 {
 					ranges;
 				};
 			};
+		};
+
+		pcie1-bus {
+			compatible = "simple-bus";
+			ranges;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			/* skips pcie1's own window, bus 0x9000_0000-0x9fff_ffff */
+			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
+				     <0x0 0x80000000 0x1 0x00000000 0x0 0x10000000>,
+				     <0x0 0xa0000000 0x1 0x20000000 0x3 0x60000000>;
 
 			pcie1: pcie@ca400000 {
 				device_type = "pci";
@@ -1247,6 +1259,17 @@ pcie1_port: pcie@0 {
 					ranges;
 				};
 			};
+		};
+
+		pcie2-bus {
+			compatible = "simple-bus";
+			ranges;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			/* skips pcie2's own window, bus 0xa000_0000-0xb7ff_ffff */
+			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
+				     <0x0 0x80000000 0x1 0x00000000 0x0 0x20000000>,
+				     <0x0 0xb8000000 0x1 0x38000000 0x3 0x48000000>;
 
 			pcie2: pcie@ca800000 {
 				device_type = "pci";

base-commit: d05c6236496071916e19012cda7149465f15e66e
-- 
2.53.0

