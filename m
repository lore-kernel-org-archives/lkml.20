Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919188;
	b=WD1Wly1PblzC9td8bbvJkcDSi2q/ULh7z5YKPs6kYNMEwo0EM9QhfAwjg/L46iG/0sUn
	 IlwOkeOuXA4SZkrowhHXlO6iVyaX6YPS9iPcJ7hMPDeIuMZI4oELKQ8Y8/y2ilAslgE12
	 mGcn/71mHfqUrf/LD43D+kFPlmSc8KM1O7XKXl032wDV/0/xVDmbu5YGgo9Nx8lf4VZom
	 IFuc0EnqQhtqlcZp7Seew7OlZCS9OTDvhkQb84wyAS+2QAN6sUnC3cNTJxm1ogN6Bb3sJ
	 Li+0urSFI0cXth1LtsbxQJgTTSd0EliQB5yv4qFXcEdj01YX/wnjo8mfDe3gcOtVDdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919188;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=FS+EihS5oMWVSmj9NW9KnSqRNWrO4SL+ZQGc/pMQ5vE=;
	b=FUAofuROuRFkvJZUiqQHJfrFThHem/MlogqhrxYOcPgeDM8h72whsy4yL/igK6PisfPu
	 B4cxYvtmnhy19YsyMvo6mgfjvIS5U2fWK3eTZMnKodzCSvHX+t/v5cTK/M6GwhEJPKbve
	 WYxKqDx1s4IL8GN61ikN+CyezPNh/D/0N+5+0OHcc6OIhklHMs+CvqBJdAWDR27Sx4/Jd
	 zotGULCXcamqJZhKZkndH1pEtxZXg2sifJ2TRJ9uslGtkkfTVl0n4/3acsSRbVO568Hdb
	 8mIKklHGTJsp15eUFJm/lcmvvjpDBMdUj3CPIOoNoCtgmJn8Z9pjCrFeDMbDI2aKmkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=IerAi1aa;
	arc=none smtp.remote-ip=54.254.200.128
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DAA606A31C;
	Tue, 17 Nov 2026 12:39:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96DAA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=IerAi1aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794919131;
	bh=FS+EihS5oMWVSmj9NW9KnSqRNWrO4SL+ZQGc/pMQ5vE=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=IerAi1aaJJ2RKSoRSkoWIDbHKO1e7ijhidYhqGpL1aPWx0j7VvarPDrrWtpaRMhmo
	 UrO40ovFT+Tlr7+53mBBOgmsz6oWDJ7oBr3E6YEbPNfVIP4k28IVknG6ik/ozxc/3/
	 iGwVObOjYbfZMvp2HWAqzlC3bwIpVt/16twhc7n8=
X-QQ-mid: zesmtpsz6t1794919129ta284ade7
X-QQ-Originating-IP: p3/539OhKh9+bQjjuJIrZ9dd41hjblu/Bwz6rSK74Tg=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 20:38:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16629148470618131347
EX-QQ-RecipientCnt: 22
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Subject: [PATCH v5 0/9] Add SpacemiT K1 USB2.0 controllers support
Date: Tue, 17 Nov 2026 20:38:42 +0800
Message-Id: <20261117-b4-spacemit-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com>
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
X-B4-Tracking: v=1; b=H4sIANJK/GoC/33NzW7CMAzA8VdBOS/IcRIac+I90A5p4oyI0aIGK
 ibUd1+KtI9D4fi37J/vovCQuYjt6i4GHnPJfVfDvq1EOPjug2WOtQUCbsAplK2R5ewDn/JFHpW
 8lhYlNT6mgE5H60S9PA+c8u2h7t9rH3K59MPX48mo5ulrb1QSZEIXEhJbxHb3mbvrbf2zuA79S
 czwiH8YgVvGcMag0QZT8mDVU0z/w7BZxnTFAjdA1tEGND3FzC+mAGgZMxXDSI6tRhPJL2LTNH0
 DbC4WOaYBAAA=
X-Change-ID: 20260812-b4-spacemit-k1-usb2-97adfc283d58
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Ze Huang <huang.ze@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794919127; l=3040;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=E55E0nnm+Grkoyc8TNb+aUvmcwj7oA3qlcosKlhHWJI=;
 b=kDKBWBOqAVGp5dMZMRKINevvRO8lPjXA3IIjwf4SqmbJXPTYGTCl/559ykoj2lEHi9czu1hxY
 dcqSoFI/UC1BiO9f4ZqbuaDpQpZ+vHD0nnZTL3HpcT9uGsh/CsJ97Az
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: MgEbn4EBW630GD1qABmjaKgk/1xw8nV+BIMT2mN0axLVf7gsNjaJp7vj
	x2ECLBAgJpzbbctgA/JvsvK9pLiv7NN6HzQoWl262ChU2teag6apwSH4xFPIQhL6cOe3JMv
	wgh28hOkrVRlZ76GrPnqgOe5ySrxLoQubaneQay5fSDa2Kv5Q2x7HWj25biFZbUvpJeUqvi
	kmQiNm1JNJTOyCbpvrYfQJFM3flH630JVcKUEHqA1nbhy99lmxhOI5uF+xXBo1PjskyuGIV
	wEBwD/tD6av/az2EE5Ux1M45AN2Y31zMxE8pAP8ZUwfPCOsc/qCYLtVywlWl7tITXSCYrRn
	8ORcbcGy6PMSS05KjsQlevf6/jmFTXYhuFqn39TZ0c5SpZZNS7R0S2ETzD+sgAZKeUxjboy
	1RtnJB9oFb/F6BoO8r/L271O83sRMxKhPFnaDGUM1x5//rrs4a3SpCRQHeSm8Uye6BwnlRP
	3uJyJF9T+3Z5HzS7AxcKXaFWbYkx7ihccbqflKYUrHJs03Yy6eNXyxKeViGDOi9yhO3zu4W
	Fd+NOa0OFVpzf7ntR5iZs84w+qNyoeLtqz5DWCB7pMqMqYWbsvGGOVZytQeNsqnJD7LBgQK
	gG0hU6tUOzbcW7cfPvnDbaS2NH8W0oJVLVwqI8mSaWWJtcg6+1loRiuge+6z5z6wLIjHkOi
	htqEn6q7Tuej590PgqOmH23jJxD0L9FR7Pjhl5E9Aa3sPmi4PvMlTOSJfIYeGDhHa/2tl0s
	wjBlc74tAkEhPMKm+m9giSBheofInot0CPhOofxVV3EM4FQXWTYsyjyH3QzWwwiVXocA9a2
	ZfVU14ugg82NOmvSIAtV0XcsQMJWHE6NGdwDXKGUVZZnRz/mRdW6zenHoHWdV2X0rRKG9/g
	LFlaOtR5Z8gOODnAeq59hngQ/j5x+Dl1Enb00WwRrxN1gQTtQpK/V7O1cqPC1Ewqxpbf8vD
	M9l438QKpPO72Nd6EFgU3CTMdT/fbg2+kC3INxrWL+gmzVdHMdHbueqktsAmKIPUy3b0vxR
	Hp75oWjJgEN74zSc+ZeI3SbST0udv05Eo6xENits49sRx+DqRbxC0mdpyylzI3ZhLw2pedg
	7VBT7sU7KSszWCwbd2bzwpttEj76+TTrxzUfHrZIOme2BPHp0OuJBsATzAKASqSSD1HO8hK
	II0GWaz0TN7KEPh5NBiOv4qDnR21bk8lXg5GXsyINJUVTbo=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

The SpacemiT K1 SoC has two USB2.0 controllers, one has Dual-Role
support, but the hardware has no internal OTG registers, the other is
Host only. These controllers are compatible with Chipidea USB2 driver
with some flags set and reset control support.

This series is based on 7.4-rc1 and has been tested on Banana Pi F3
development board.

A self-powered USB device/hub is needed to test the host function of the
dual-role controller on Banana Pi F3, a MINI-PCIe USB2.0 module (a
cellular module e.g.) is needed to test the host only controller.

---
Changes in v5:
- rebase on 7.4-rc1
- drop the ci_hdrc_usb2_priv struct as sashiko suggested
- Link to v4: https://lore.kernel.org/r/20261009-b4-spacemit-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com

Changes in v4:
- drop irrelevant Tested-by tags collected by b4
- collect Reviewd-by from Yixun
- Link to v3: https://lore.kernel.org/r/20260927-b4-spacemit-k1-usb2-v3-0-ce7095896039@linux.spacemit.com

Changes in v3:
- collect tags
- merge the two dt-binding commits
- use local variables when acquiring devm managed clock/reset
- drop manual clk_disable_unprepare() from the remove path
- enable related drivers as modules in defconfig
- Link to v2: https://lore.kernel.org/r/20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com

Changes in v2:
- rebase on 7.3-rc1 and collect tags
- reorder the usbphy and usb nodes in k1-bananapi-f3
- add constraint for spacemit,k1-usb2 in dt-binding
- add OrangePi RV2 device-tree change
- use devm_clk_get_optional_enabled() for driver according to sashiko's advice
- Link to v1: https://lore.kernel.org/r/20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com

Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>

---
Junzhong Pan (9):
      dt-bindings: usb: ci-hdrc-usb2: add spacemit,k1-usb2 compatible
      usb: chipidea: usb2: use devm_clk_get_optional_enabled()
      usb: chipidea: usb2: drop the ci_hdrc_usb2_priv wrapper struct
      usb: chipidea: usb2: add optional reset support
      usb: chipidea: usb2: add SpacemiT K1 support
      riscv: dts: spacemit: add USB2.0 controller nodes for K1
      riscv: dts: spacemit: enable USB2.0 controllers on BananaPi F3
      riscv: dts: spacemit: enable USB2.0 controllers on OrangePi RV2
      riscv: defconfig: enable ChipIdea USB controller support

 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml      | 15 ++++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    | 16 ++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts   | 28 ++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi               | 40 +++++++++++++++
 arch/riscv/configs/defconfig                       |  4 ++
 drivers/usb/chipidea/ci_hdrc_usb2.c                | 59 ++++++++++------------
 6 files changed, 131 insertions(+), 31 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260812-b4-spacemit-k1-usb2-97adfc283d58

Best regards,
-- 
Junzhong Pan <panjunzhong@linux.spacemit.com>

