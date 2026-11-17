Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.243.244.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905359;
	b=Z9H2lGJBQxFS92Egw5MJhUNVKkRfv1KxLFNxPlc23a1vx0B8/ihRaUC3zDXfI2JH8sL0
	 /dTpQKsG77sTQ+MOBbx9LX9pIKn06zRIO6Mv+VV4l7px3NumoLcVLBIoHfkv2AHhF/FoH
	 nl+1ssqGnRW/kg49+A7iiZO1Xa+VfPj6Jn1GzFdS0rywHm85o4IQkVrqJ4svTwlJ2/ZKn
	 J5WHZNq6hCSwbbprO2JNjIfIuSufQvorKOgz+g5SMgU6s8FrfRdL8ryX+tw1Shce0SpHn
	 JohqM3YhNcnjP6XJFUMlp0CHWjfsY7qdaMH0DUjYwK51AJihirtXi9TOf4RaltWB57Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905359;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=zWyRURPu1OxrVx0wsF9VEbECiyatmSf1CoESfSh8E/k=;
	b=Zc/baG6lhJG8sJRJP1Xs+NtzDV5PQJD7l3um5Kol9tkDnJQLv6TWOEwThK8i6MUH+g4l
	 bPY9IFO/p1bZW95te6pmOuwGUotz3fRM6C5eyVqpsUKxJqwISjaoU2U07SzkH9nkwxKts
	 NS9kW/PCpP/tHWNC4xK57nZD83BSQAvaV0AEekM0nqo7fwa/lH7+s4ybgwbDeau65rTAK
	 EQpMBsQ3ntv3besSGeMt2+3C90ksA+QBocbjwCHCqPkx5GFmlBMguBX08ifryceA6eKdk
	 4X+2uySI64UqNPpF74MAkqWS5zc2PeBMLX+TSjYiXcYXCkmWS4mN4mWrFFtAPLpwICQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=fuuwmVdh;
	arc=none smtp.remote-ip=54.243.244.52
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FE5606A884;
	Tue, 17 Nov 2026 08:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40FE5606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=fuuwmVdh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794905338;
	bh=zWyRURPu1OxrVx0wsF9VEbECiyatmSf1CoESfSh8E/k=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=fuuwmVdhelGO1UBk6i9s39jpuo8MFOCQ4bCG3ZIwQMchyGnb3LcUlBlUpYA2OCxvb
	 Q+OLt0uXWDZFB30twXWCTWw+6zF2Ry2B8gtIgmOaSbC7ncp1BdCDnRrUh6ljYXJJdY
	 8hxeAGMijQEseo+v1y4FnVZH+3meugEp1zCdtarM=
X-QQ-mid: zesmtpsz2t1794905337t89f735b3
X-QQ-Originating-IP: R99N8wcVkiTH8aE42GHQGH77icoKGm0a84h5ayh/DHc=
Received: from = ( [183.48.247.191])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 16:48:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 195453335041648402
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v2 0/2] riscv: dts: spacemit: Add K3 CoM260 TQ support
Date: Tue, 17 Nov 2026 08:48:50 +0000
Message-Id: <20261117-k3-tq-dts-based-on-com260-v2-0-68b337bd8938@linux.spacemit.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Nyw6CMBQFf4V07SVtEQiu/A/Doo+rVKXFthAM4
 d8tsHc5yZwzCwnoDQZyyRbicTLBOJuAnzKiOmEfCEYnJpzyilFWwquA+AEdA0gRUIOzoFzPKwp
 FrUvdNILLRpK0Hzzezbx/39qDwyifqOJ2uBmdCdH57x6f2OYdHUb/dSYGFISgsq7ZWaCm17ex4
 5yHQSjsTcyTR9p1XX8R4ild3QAAAA==
X-Change-ID: 20261015-k3-tq-dts-based-on-com260-37d5d99a2b9b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2089;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=cKNI6p0a2FU5oVIDwqYsIH8y/2k6zgLXOKucQO4l7mY=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFl/RL7tV15x5p3kxRs7M1/zzyuLvRLnc0rVnSNEMiHJ0
 L21NntHRykLgxgXg6yYIkv3A55tBT5RtgUChb4wc1iZQIYwcHEKwETSBRl+Mv6c3C5UknuDvfT8
 uaLQJ+/PmCVPtVxzPqgh7P/es/aJ9xgZenaLx6bWKC9qWC74sd4w/1jXk+ITgitE9/FUsqwKtbH
 gAwA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NdC04oDZj+f2IKe70051Ci0qG8BpBvvmKMTPIcLphf+rKCAnRa8LGcV6
	2rfenz2kMIu8qYQqNs/Y5Lx8NTLqxKJqYrFCQOIrylCFYhi1Br2P89GjLP41VEuB3PyOeT0
	Zu+op8rk73g8slqjCSz4ohMoJ+Mb8Na6xJjzk7mqfXm0ex93CeYyq7mJh92V7OeZMNSg8oR
	FAo0qN69JBg/FPTNz4uWZZVYKav1m7RBDdxcq32s2B/FEZrCTG/5+e12A0wlo+Y9nOiHpKk
	J15NuyUDiIJhwrM8JcWX8d/pxtdfX+FMSbOoz+SkHKS0FP3tzjHkfVf0OCbjrVTmmiIR/uL
	S8akvAYhJxZmaGWvzHw6/nwODSpH09MazC42W/urFEGNtvfWZKraLyR2xCx/uFgqeieEY4W
	RC76mp6+GGNnSDnjq3BJV7qgkQk8poCZ5KXfCUird2I6RhReCqOSGF3VqX/tdRCQJ9TPh/X
	ts7czFfXYw7TOtplknTDWBuBR5JdG6/v+xJ9zc2+a+5qHBIOq79qLV+/yq6Q2Wa951ogMLg
	6feSs3h2bYvQ8wLWWRmRBCf+ecVyTtmJyPH2yko0sHiDTAH/lgb9WkGaukueeqf90NoEzWF
	0SYXu9bsLya3APxKY8tKqYySAegchq7OaCExn/xUle5/Nfc6Hv3eitP+845txW+2Ev+6Y2f
	hyEIssWhiUvTT4WrNzowFHa7kvbEt6ecPWIORwWKHfil7r/uiu9j4du21P5D67QHrQIlUxF
	L+awozUX+AKD8P6FcLb+zZ6X0cCmPNxOkheEXkMY2Din03aJ6CBRSbwGscBsEgfrZj6KZ+m
	uwmzR6VnQtfNBml8bGLnCwX/zWqCwzXc22JPyEqLHkzw1g/FAMnOeRm2JHC4vACEkOIkcHE
	8riNmPE77/y0Cx/dkcmQnp+thCJSDumSOUgZ5cJzR/Jvc5LFIO6WriDfG1zVh/LmQrHbqRk
	kn5Y/YcjItwYJnCXl0BRAUjwms82filJYHUi2B0zAwr26coD39H2pNPHUteyJ/IXmYR8cmB
	3kDfoIHL27Q5w+6oFbNZuXIEtZvr5YMJd9cOGfgifTUoK+gjje6bHq+2lz50B7TUM8H3jof
	gu3D6eYJ9uUocJC/ziN+B710t1ayWMO1Gant+ug0flUuRzGJjUIHrg3vyryZDJ5mFsYrvMm
	2oVULVvDfWaE3eI=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

This series adds device tree support for the K3 CoM260 TQ board, a
K3 CoM260 module on the TQ carrier board.

The board uses the CoM260 module description for the UART console,
Ethernet, module EEPROM and PMIC, and describes the carrier's Ethernet
PHY LEDs.

The TQ carrier board comes with one of two power schemes for the CPU
clusters. Both are the same hardware otherwise, and the system currently
relies on the bootloader to set up the power scheme, so a single
compatible and device tree cover both variants. Once the regulators are
supported, the power schemes can be described as overlays applied to
this device tree at build time.

---
Changes in v2:
- Rename the board to K3 CoM260 TQ, which covers both the TQ and the
  IFX TQ power schemes.
- Use a single compatible for both power schemes of the TQ carrier.
- Link to v1: https://patch.msgid.link/20261105-k3-tq-dts-based-on-com260-v1-0-aa0b7714aed0@linux.spacemit.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
To: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Guodong Xu <docular.xu@gmail.com>
To: Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: spacemit@lists.linux.dev
Cc: linux-kernel@vger.kernel.org

---
Troy Mitchell (2):
      dt-bindings: riscv: spacemit: Add K3 CoM260 TQ
      riscv: dts: spacemit: Add K3 CoM260 TQ support

 .../devicetree/bindings/riscv/spacemit.yaml        |  1 +
 arch/riscv/boot/dts/spacemit/Makefile              |  1 +
 arch/riscv/boot/dts/spacemit/k3-com260-tq.dts      | 44 ++++++++++++++++++++++
 3 files changed, 46 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261015-k3-tq-dts-based-on-com260-37d5d99a2b9b

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>

