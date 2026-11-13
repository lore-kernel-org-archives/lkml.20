Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.19.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580133;
	b=PZWR4qxb4MLRIUQ93YQ3swMYzfHRnQUC69aQl2FkDdoxzdUh4UaOGfygmxxGq2deNhtF
	 KjrCXMwhWs2bVacp5bl1yOIAkc/kKgWbcX7aenoz4h8fUj9xUshjZgnfUC0Eh8gvewnoH
	 jwHrzB1xhqSSnXxxaLMXVnzTcRNW/iOnrGS4FAKc4U06GUzdz1ez82zklpWkLNYPZ/Aa2
	 3/7fLhJYDMSfe2EPrzY0XNqUI84ZwLSsCH7+HFmh/MNo59v/R0KV8pSbeqtprJfA1jTPO
	 EQxmTFzZgsLan/Fo1P5j3P1/dQymE/1mmXZHPV1Utn7kJuqk0xshDFd0rjBIZSL24wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580133;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=KVOhFnVSIjiwAUMAbkEs0GHK6ofJp+pdmSiQPnM4C78=;
	b=0ySWqCW6tNdPp2VhFM143sudcnyGG6iaA/ckbolzUWeE9upknDNY5aX+1vkHLM5NN7no
	 9pix7jVoybvCxtfohO4+HtQr1zcmVwNl5OARkHmquIpu9N+4SRRxwHVgppy9goLAzY1Dd
	 T5nB4DdtlzpgT+d/MF6hV4Z+JOCaVgQVxKshXEpcGCI8wV5R29L0j0Tr1Pu+zZYR37tOX
	 Y+y6V9XKMO9/wQQK3yojIsffk6oXuTNBDulIVKsOguW765dI43trgCkExDCH92k63q8sB
	 wHN+klcS+0Sr5SIWfSTLU+i/WMn4KLJqKMDgtMew28ib9bbGPGAO6/uJ7Vluf9k47oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=YDA9dFFI;
	arc=none smtp.remote-ip=54.207.19.206
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D38606A880;
	Fri, 13 Nov 2026 14:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51D38606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=YDA9dFFI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794580103;
	bh=KVOhFnVSIjiwAUMAbkEs0GHK6ofJp+pdmSiQPnM4C78=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=YDA9dFFIZg38SkTq5NdhHwywiWiPTCWzmisEEe64aEpVmWDYLUJfjIzQQwp63fR4l
	 lyz8sIRUZZDPSGLtrVZBDzCv/Hr1mQ/+nX7wOZI+gHQuJxZgYe5+PfLdA1n8UqNBtB
	 +hZvCRpL8uJRIkHEG381f3pjrCKXBIJsjH8CfK30=
X-QQ-mid: esmtpsz19t1794580102t15960a9d
X-QQ-Originating-IP: OtwkmhLQeijisZqg4dvnATw60VR6lZzoDHJEgwUjh0E=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 13 Nov 2026 22:28:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15320170590210169424
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v2 0/2] spacemit: k3: Add support for BS01DCMA RV2768
Date: Fri, 13 Nov 2026 14:28:16 +0000
Message-Id: <20261113-k3-bs01dcma-v2-0-3f0de4a3e1ca@linux.spacemit.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Nyw6CMBBFf8V0bUk71hJd+R+GRRkGGZVHOkAwh
 H8XcOvyJOeeOyuhyCTqephVpJGF22YFOB4UVqF5kOZiZQUGvLXG6ddJ52JsgXXQzqclgUfnAdW
 66CKVPO21e/ZjGfInYb8lNqNi6dv42e9Gu3n/y6PVRqcXZ+AMLiUXbm9uhimRLiDV3CfY1ipbl
 uULBOlUk8EAAAA=
X-Change-ID: 20261104-k3-bs01dcma-467fe26c462c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2151;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=Ap6mS1rojI6psEsTajnDhc0jWrETz/FHGoNHQBeYgdc=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnf5Zp0rs2bteVLyskUj78Ml5XnJ57SfVWhzHhm7V4l6
 /WFP/mudZSyMIhxMciKKbJ0P+DZVuATZVsgUOgLM4eVCWQIAxenAEzEbSbDHx4Xq4eHXtq/sFe/
 FDjd7XXMFVuHXTkfdkVruTy1PLXBw42R4fGJE7tiUv4p37/5P92Zle+spvKj+RGeGn1RExs4bNI
 seAA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OD5PxjFcFKR0LHOttync45ufTKPoY+TESSo9JEdkS/U6twF6SpGJRkAR
	Gssl6vDFQohywsrHPLQFcXhEyq1AaSEt8K719rtL0breBxLcz/6WVohGSmH8ZOlPVYEdPGC
	kzm76FqcMlZRDr56wagGwIsCZALw83iDG+JEhFkfhKu2QbZBFf6QKG+QXuMAmb5L5BpA4lI
	dERWuSQa4Z/1eKavmycK7laFDFF9IOU8YKoSz9cpCIk0dtHhzfcbnKHG8WSzHHmETvBefUA
	pzU9dsMjYm6m2JAJVR/6lmr7upPHN4hiVkRchzIwdA5B27oFx8BmCMiT29E/dLDFcjizqvE
	MgiJ7vPx6NH+WvESPlVoP1uTbc1blIeIaPRB34SPHd97I9h2TUr30GvYY9J5/eCuVNEwe3o
	QIrc8R0/A3CKhil3qzQKwMzNf8HtzG7z7kKYhHzhVE1+0fQ9gGhscQM/gh11gtZDMw0JGrG
	d3SEtJj89q0YKOJ6Kcbsnf6MX9F1kVzq+QuZ4eSF8fgEp3wwXRbO3pbOqE3fGL/NJ3QULex
	VzpYTIz78IfmOxc8t7gMO2VtV/CeoAUU0FV7pvNh2AWlK8oKdFdlVKliEy3n3TVhAzfwudt
	pTF7Bx4Tndtxykjh97v1/W+kn79wR41F1iWJKVsloDLiY+Ot1xEQnMdbryY/hrOgNyfkmKR
	8efCtjk6AKTv1vvSXHegzZibU+9y+8bbz015cEdJrerusd8dspL9Xvbmj3dmPq32cVT57Oc
	+p2qsJT2UAknRNEggbdrm5elK58KrG+gEA8uHbPDjF88Dmy/n1ghjMtqakQhYsbGcOZi9KO
	/zkRdWzKFTZAYp5nxlTgHLhqIXUwrybH3PESCFCyKQzlIbehgzi7zkH67IYo3xWvpT+kzgK
	4kmz4t7lQFBwZP50n18XbRIN7F0o60XwB2GHe1bmEUnjAUbLX4o1CeTfhjfwYONvcOOl2Hd
	abbNi/CyV4cpNCPLPMKlowZs7tT+5Hh/rOA5wdEswuOd05l0tGGWU57vTDPVJp5TH824ovz
	YgRwotVV4Dc5PH4jgpSSXCxCxvmgjicJnCnvWhOoujKNyooQpnFNQjT4kBIV9tIIC8v9If0
	bjLTRI7WlPhMWM5oliuNZY=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

This patch series adds initial support for the SpacemiT K3 BS01DCMA
module in the SpacemiT Cluster Server RV2768. BS01DCMA carries two
independent K3 nodes; each has a K3 SoC, 16 GiB of LPDDR5 memory, a P1
PMIC, an EEPROM and QSPI NOR flash. The RV2768 carrier only connects
the modules to PCIe network cards.

Enable support for the serial console, EEPROM, PMIC and QSPI NOR flash.

---
Changes in v2:
- Split into a k3-bs01dcma.dtsi for the module and a
  k3-bs01dcma-rv2768.dts for the RV2768 carrier (Emil)
- Add the spacemit,k3-bs01dcma-rv2768 compatible, with
  spacemit,k3-bs01dcma as the module fallback
- Describe BS01DCMA as a module instead of a board
- End the uboot partition at 0x700000 and add a read-only var
  partition for the EDK2 variable store (Sarah)
- Add vcc-supply for the NOR flash (ALDO2, PMIC_VCC1V8_QSPI)
- Link to v1: https://patch.msgid.link/20261104-k3-bs01dcma-v1-0-794025247e4a@linux.spacemit.com

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
      dt-bindings: riscv: spacemit: Add K3 BS01DCMA RV2768
      riscv: dts: spacemit: Add K3 BS01DCMA RV2768 support

 .../devicetree/bindings/riscv/spacemit.yaml        |   5 +
 arch/riscv/boot/dts/spacemit/Makefile              |   1 +
 .../riscv/boot/dts/spacemit/k3-bs01dcma-rv2768.dts |  19 ++
 arch/riscv/boot/dts/spacemit/k3-bs01dcma.dtsi      | 264 +++++++++++++++++++++
 4 files changed, 289 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261104-k3-bs01dcma-467fe26c462c

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>

