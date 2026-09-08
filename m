Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E280526AA3;
	Tue,  8 Sep 2026 09:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861016; cv=none; b=mhQb4ZFrbauiTurp9sVRgW3pol7iXJ+74UYB0x5IaumHModhqv27Mi1fuD8LKUnoEE8I3V5wKqWTLNM7l0blg+0YLqVmPJ1urvtlEdkNfbVHBUdbMxKoQwpZ8wYiAm0uLZ0pM7NlvynxD8BylJrtFIZ5TBWRyVQ5O2UuqjvTmuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861016; c=relaxed/simple;
	bh=Di+zPYQrmx8YPR59j7x1NjBpZu1CpEk8kjenbyRJxG8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SRu4yqqbJUSe/us/b1Ayj5pkvmr7C26QakIafO+pEOZSKbSXscNJiltz/N6HCUA5SIv1Qvxs73RNh9ZPIEK8joZrTtA4FEgtKFAO8QwKokjMFBDIr4F/7kaZJDdvjiOsl4fD7jzxP0tHMP0AZyRNe+2K0IJJvzfaTkE2llwj398=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=VqmP1CVJ; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="VqmP1CVJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788860932;
	bh=ThDT4tVj+YPojmgqj2lbcYBtKEEAUeWWPDjR4MEplgU=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=VqmP1CVJhHOV5Zce0Aqt5WsKEEcy7mKqmOWGUzAx4QEeuRmU/MjK4LsexYNEzYoIF
	 BySZ7pW4p/ogSWfi3hrIcWasfYBU+Et6Y0XpFDDPyfr1Z6e4PppjyUzQfNdVuQyyeb
	 lAO1rNUpHecC5oIIgTUYKWv7OA3WFxDCo9UiNMAA=
X-QQ-mid: zesmtpgz5t1788860923t90e5fe56
X-QQ-Originating-IP: qSRbQhLZ1bovcmOa+a9gCuzdjVIHFFNrdZXd0PpfhGM=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 08 Sep 2026 17:48:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15635221017366424496
EX-QQ-RecipientCnt: 23
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Subject: [PATCH v2 0/9] Add SpacemiT K1 USB2.0 controllers support
Date: Tue, 08 Sep 2026 17:48:37 +0800
Message-Id: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPXZn2oC/32NwQ6CMBBEf4Xs2SV0FS2e/A/DAcpWNkohLRAM4
 d+tJF49vsnMmxUCe+EA12QFz7ME6V0EOiRg2so9GKWJDJTROdOKsD5hGCrDnYz4VDiFmrC4VI0
 1pI9NriEuB89Wlt16LyO3Esbev/eTWX3T/75ZYYaWtLFUcE5U317ipiX9FVPTd1Bu2/YBjlrKX
 r8AAAA=
X-Change-ID: 20260812-b4-spacemit-k1-usb2-97adfc283d58
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Ze Huang <huang.ze@linux.dev>, 
 Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Peter Chen <peter.chen@kernel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788860920; l=2304;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=Di+zPYQrmx8YPR59j7x1NjBpZu1CpEk8kjenbyRJxG8=;
 b=RD4yw5F0Pyp1Qj+JzsXRr6wgCoagoFelv/EpLdhpqhHNSdFXA+Jv68ADUaBHx4ZzsgTC79/HS
 JEBrKktHRY5AfsGXmUjUNADFx4eM8m5Ku1M02trwG6K2UywQ8ukhPc8
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: ONNzAaE3j5jCWVEMxszg/KhjL+fl4/m8t7hSIqyUQleacN9ECcdzr5Rd
	Qw4Rd8XDTpaOVWQ/c85sdrzvt3UcoyacVgpKCMKlNvmMQIt72KTDc9fVeeCt8lsBd7Pv7b1
	IPbTW8mcCSV8HRl06tjzz1Bd8iuRYzaOBL5yoUkEnhvqvVfZ0W1UUimkkDQsJFoMsSwuFtU
	ODK3rjToAPpzZmdzQ76TNjDxPDO8rAFdVkg+A80Tv4SpD6okC2ZseMohmsWssWmttHbWiRi
	vaSUZbFtd55agxr9y8nZiyih+pHA0FxvtqFmtXxJXFpAz+flZUXl+rg/xHsXN1mtMwldQ2h
	7Z/CSifOkRobaUdvwJ7B7ZjOay+pETnZnG5O0X0L08md3FWSdKOykTWaQ5GGLFlQnfX7ZD3
	6pvuARfoKcX1oVdKbYoIl/aApCkBGl1vbSNTMkSSeDxrTbMpVZ7D3jowI1Z34AW2ETa3nlA
	M5AvcboSwCTqcE1GCt8GlOHQ9h8w7E7aFgrik/CL1gsJzQcl6kui7UWxmGD/wqYE5c5/Hdv
	5Rxb9rLaFXNrIlgoawV7zluDOKy8qP5gO45xaZKQps1AB5j8nfbW1yJdGAP/Gdz4w0sTUXx
	yjFkOYPiXVYneAeKXHDqg6iSGHQQou4eKwxOQGCh0OTvwNQE6gNezrQp5acJcwE56yglHap
	MrO1QO//AtFB663s9kDyKhhf1HAy2jj1JM5W9PyDNBFPSKbSUGlxsHpRIrjGSH+aWVF29jL
	wJQsXjndCtJasOLhNtVNJvV0Z6E1eoFqDV/XFjp4C65BnOoxX5kei+/36ceuiJu4B+6syQX
	m5wHEAs3aamVgysBp2dS5HQjwrNMCOGWsY2vc2MEoWuiHqajfHmNwUn0hohYWkZi7TDQFk2
	qHm6pLbJx+o4j/XkkMLfYYSMeE5dkWGLhulmMGZBdVNYoKacnE2MnvoAVu0WwDIX7kpVx0g
	UdiGw4JiDBiZEuDVoXoRiWc9BF5e3t8Ah52n4yJKWbL+P/+n+hiN8EupfiJzSp0sm+PbrfZ
	1ZKYZWziiw1SH2lL5b9t320Lg9aPBJzB+kJoSNUERlsaPWQPryBt6aWdOUk+xmrnmQ3Ip1q
	+8iQpDTDkDNElpqhClBsR1+f2Yy4Y7t/K//lZf35tpuKN8/fvccoADmABKUSSzQDo/q+F6U
	f+D/EjP1EoJVBfoRwwPfnazRyaG7dAf4qW/6GVb/iYHS+pj5DQ+kS1yL17EocrvmyOgHPef
	s4/FHD2k=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

The SpacemiT K1 SoC has two USB2.0 controllers, one has Dual-Role
support, but the hardware has no internal OTG registers, the other is
Host only. These controllers are compatible with Chipidea USB2 driver
with some flags set and reset control support.

This series is based on 7.3-rc1 and has been tested on Banana Pi F3
development board.

A self-powered USB device/hub is needed to test the host function of the
dual-role controller on Banana Pi F3, a MINI-PCIe USB2.0 module (a
cellular module e.g.) is needed to test the host only controller.

Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
Changes in v2:
- rebase on 7.3-rc1 and collect tags
- reorder the usbphy and usb nodes in k1-bananapi-f3
- add constraint for spacemit,k1-usb2 in dt-binding
- add OrangePi RV2 device-tree change
- use devm_clk_get_optional_enabled() for driver according to sashiko's advice
- Link to v1: https://lore.kernel.org/r/20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com

---
Junzhong Pan (9):
      dt-bindings: usb: ci-hdrc-usb2: add spacemit,k1-usb2 compatible
      dt-bindings: usb: ci-hdrc-usb2: require clocks and resets for spacemit,k1-usb2
      usb: chipidea: usb2: use devm_clk_get_optional_enabled()
      usb: chipidea: usb2: add optional reset support
      usb: chipidea: usb2: add SpacemiT K1 support
      riscv: dts: spacemit: add USB2.0 controller nodes for K1
      riscv: dts: spacemit: enable USB2.0 controllers on BananaPi F3
      riscv: dts: spacemit: enable USB2.0 controllers on OrangePi RV2
      riscv: defconfig: enable ChipIdea USB controller support

 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml      | 15 ++++++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    | 16 +++++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts   | 28 +++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi               | 40 ++++++++++++++++++++++
 arch/riscv/configs/defconfig                       |  4 +++
 drivers/usb/chipidea/ci_hdrc_usb2.c                | 30 +++++++++-------
 6 files changed, 121 insertions(+), 12 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260812-b4-spacemit-k1-usb2-97adfc283d58

Best regards,
-- 
Junzhong Pan <panjunzhong@linux.spacemit.com>

