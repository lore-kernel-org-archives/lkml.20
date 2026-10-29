Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=116.202.128.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793291092;
	b=5enOmjLo1YpxTcjPAE3npWNBrB3nuxzXx1soKNvSs1HdnXFlLUgwwPqlib08QPHUKHpL
	 jyLTPMJpeY2YcKJ4MvCxDW4klBBDxIAC/ebTBfxwsLsGTN8tl9amdE8il7/P4vAa+jOtv
	 5cbk7vK1Nedi0JMbdQzubrbA2e0T0wU4bFtbKtZ+u8+wZNFr/0X46T4StanG8DrFBkfbK
	 pVbbdtxwp8ea4kI1xUErApwg/qbndrIUgBR50EtnFlp1FGMKzcZuTdS0pk/Pz/lHr3Bi5
	 RYzPxlx9pPlo4s9RlD3vo5Zzb9CF5Qcs0LnazZUL6EZPApiDyN7I7RMU/qeeQ7U39OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793291092;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=qeMIukEMn4FWMnKM91p7ATwhTaOx7je9JpTEA3stbbg=;
	b=Ty3+NJWZZ8kcmIwFKjrYU9zmJzWbT6/8JZrDn+x5HjB8OVsMe1MY0Fx7uR1wT1JeBKqb
	 sAd8RRgp1Kbsn7IEb/oFWHm5UogB6HA0JcbaYq1rsksl1ExQO6Gu+yfX8hlkBZWh4rYls
	 DEWS3FSJ/ywtmQ7MBQRz7TIWfU3NhbTmdrfW3KHlUYI9X1kCpaoDwncrrN36A1QsD+C/s
	 z09XrQDIxuBDJGzNZANhKLkfydSFor50/mo/I0KFkKUhaAdopz0M+zShGcL5dC0ZU9qQB
	 YT6DYvjJ9I0cn/6wwz85Q/Cll51ohROM/vtMti0C16HoU5Tg6kf8b4otALd06+2M0pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=freeshell.de;
	spf=pass smtp.mailfrom=freeshell.de;
	dkim=pass header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=gOsvNgaE;
	arc=none smtp.remote-ip=116.202.128.144
Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5281606A31A;
	Thu, 29 Oct 2026 16:24:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5281606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=gOsvNgaE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1793291047;
	bh=qeMIukEMn4FWMnKM91p7ATwhTaOx7je9JpTEA3stbbg=;
	h=From:To:Cc:Subject:Date:From;
	b=gOsvNgaEhQZCmkU6U8zhjxrvOVrfi0dbGJuVLsW4/OSPkYeBKVPRmBy5uXK8+aBeg
	 iGS6TI9ZNxu8z0P5/re0TBaOM6Apla2tz1Bvd4gCj3iVhSszESotS2LkP5aIOy/lgc
	 uoKbYJB2+vDcmewom6l9WHrm51pY/dPeyzg3qucifbIBh/e5ZaqsrrwMIIXiYF+vPo
	 2X2A40r1aLDoty3CP4Ql6RGKrC9j3DgVAtwZPw0Ip6YvosE7aU3g9K3uTfyZDXLac8
	 6JQulH/CwtpH07Y7EzN1+hDE8s/DFWhQgl8nAyEMpx7+HfOe5NKiRfqOIiF5ooZ1Or
	 aKNshhq1HWUbA==
Received: from hay.lan (unknown [IPv6:2605:59ca:364f:d400:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 2DB58B220761;
	Thu, 29 Oct 2026 17:24:04 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Guodong Xu <docular.xu@gmail.com>
Cc: E Shattow <e@freeshell.de>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: spacemit: k3: enable status of mimsic and maplic to okay
Date: Thu, 29 Oct 2026 09:23:35 -0700
Message-ID: <20261029162343.1896134-1-e@freeshell.de>
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

Change the "reserved" status of mimsic and maplic to "okay". There is
an mainline OpenSBI user of this and setting status okay resolves the
stall of Linux when probing peripherals at boot.

Fixes: 56f37e391a62 ("riscv: dts: spacemit: add initial support for K3 SoC")
Signed-off-by: E Shattow <e@freeshell.de>

---

Follows a discussion changing the status at U-Boot mailing list:
https://lore.kernel.org/u-boot/20261028184526.1887640-2-e@freeshell.de/

Moving the discussion to LKML as there are differences of opinion on
whether this should be changed in Linux or let remain to downstream
users changing this in firmware that requires it. The change is
trivial to carry downstream in mainline U-Boot.
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index a5fb72e23dcf..4b3362b64e26 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -1452,7 +1452,7 @@ mimsic: interrupt-controller@f1000000 {
 			msi-controller;
 			riscv,hart-index-bits = <4>;
 			riscv,num-ids = <511>;
-			status = "reserved";
+			status = "okay";
 		};
 
 		maplic: interrupt-controller@f1800000 {
@@ -1464,7 +1464,7 @@ maplic: interrupt-controller@f1800000 {
 			riscv,children = <&saplic>;
 			riscv,delegation = <&saplic 1 512>;
 			riscv,num-sources = <512>;
-			status = "reserved";
+			status = "okay";
 		};
 
 		aclint_mswi: interrupt-controller@f1810000 {

base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
-- 
2.53.0

