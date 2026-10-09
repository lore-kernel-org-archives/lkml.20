Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B76476CE0;
	Fri,  9 Oct 2026 07:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531101; cv=none; b=VHtysf4P+qXiE5rqS71JzPeBMWfMzEEQiwxbH7sFQizw2CiReAqDJXV8eViihOHV71Dmir9vrMn7UpIuzE4RTVPP5GDgqg49tpkgIpCpV4MiMYXjXMcf8FdQwU/iUfYVIVSjin/Bkwez1VweHkF9VmbfLg2M9CxYQkbs70uJY8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531101; c=relaxed/simple;
	bh=6Jfr91p36XEdudosY8V8RV6TeMPpMSLgpDV5nkQ7yKc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c5ST9AKkJ/lPyO8mPD+uLG2gv+P6w9dANVyjuFEI45/fkTfLkBcXYqHm+RJniR/EIeCn9wpOkGB+4eWvCRooqKlDEWSs3rmopq86XSouirsxi7Y0PIbOXLPjDxSsInsswiwnawaSwQpzFMbGeNyPwBM+3MYVNnDJXd/dgxAKl3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=r2FFGgv7; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="r2FFGgv7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1791531029;
	bh=4HQPXe9IGKWY9C9j03f5HIPh0/Eu6f8vVKG/6YBzIeY=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=r2FFGgv7dyT4APeRbiPdybevyalPXL2mC7A71YRelQ9z9zpu4Mq0KTxfYHSX5ukq5
	 mBuwWkFTc4mXPqQkf7XMZBMUNDilUHkX4SPg9OtJnBD8yWn6Ne2aRfim7nOMTK+xst
	 RnR1L8ukO5G9Cmk4pMQ/jeS1plRydI/RR8wo5CV8=
X-QQ-mid: esmtpgz13t1791531027t120ad431
X-QQ-Originating-IP: A9iDTD7SnyzPn9VV9x4LQxY5lUpdgHEm+4aV+1vG1EU=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 15:30:24 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17512283885974107760
EX-QQ-RecipientCnt: 22
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Subject: [PATCH v4 0/8] Add SpacemiT K1 USB2.0 controllers support
Date: Fri, 09 Oct 2026 15:30:23 +0800
Message-Id: <20261009-b4-spacemit-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA+YyGoC/33N0Q6CIBSA4VdxXIeDgwp01Xu0LhAhWaUO1Nmc7
 x66tbqwLv+zc74zo2C8MwEdkxl5M7rg2iZGdkiQrlVzNdhVsREQKIiggMsMh05p83A9vlE8hBK
 w5KqyGgSrcoHiZeeNddOmni+xaxf61j+3JyNdp/+9kWKCLQhtQZocoDzdXTNM6Xsx1e0DrfAIH
 0wSsY/BihHOMrBWkZz+xNgXBnwfYxHThhOZC1kQJnexZVle8rWyU1kBAAA=
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
 spacemit@lists.linux.dev, Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Ze Huang <huang.ze@linux.dev>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791531025; l=2392;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=6Jfr91p36XEdudosY8V8RV6TeMPpMSLgpDV5nkQ7yKc=;
 b=T96vuZbqaxkR/jBJqRD0Ps+F80k8+BiEYu7mT9tbyUDMUVQzO2K/s+nUj/3VeuCJ9TWcHL6M0
 kXokql/4KHpApdVAjo93eV1Itsip0a9sH+WgIGkbg61T4czGBCgFZz6
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: ON8Om7ykNadU8oJ2XoaYZKYNvDRwmmbEwuAJuLn004ODG1cVPtu+L2vm
	z9PuYm+nKgT+vme3aorrljE6Fwwv4kgyItUgaJLK414KJMnH3Q7rmBG9PX2EDjp7nPgTTWU
	S8CW+viFARxDCrthtJAs9Fv0a51QaZP2sqg0Wpzv3IvgNO71RLk33y0GLxEu/W+H/jqiufg
	oqcLT+rHdtYx1viTUeXNF78TVc7RgPCCXai66z93Hu9B7CXIoCc+fsTF3BWrcmswkjW1KZ0
	0YfTGPok/bzbWHfPm1R8a8TPCr+yBxLgaZvcak/Pv63zWqkDUsFisMeJWtNO7MJsUQplsr4
	axhaZvZd2OaH72mphYD048Vk4wSIs9rxdhmVd8pfL22enUpwYBREff7IaMv48B3tg3sIW36
	RhUpqklXvVl+JWNea0HKjRi2vA18ncn3oDDFPaktaFYSzDKA/EajA6RTjMkl/CObdOJwNHd
	AEUUVbDsgRkCsX6o0Nh/tkY/yVDA+9cKp+ch3iI7l0ekaVHH5Xg5CC7E5MwP0jRLBxBQSl6
	ajkipAy0FUbnfI8rHTl3a7QgL2/ItGGXnQtMndtJBQn1iFcEvlqpEnPKQaXGv/QE+yciPz0
	PeP/ifp/yixYuyUsZuuAMGyh3gkC4WQiQdQ3Y6J51hNvQ4E2fissy/uhGJp6PMVxF7es8jZ
	RK/LpNfpNcdmMzM7Nyub6gzWJ+9TAXsfjVpV4F0Tpq32objDe3iAgNRSe2wEXzT2X07+Ys7
	QjJsp/AQJCyYjQ5i5+ItJcXsgGQQaHxqtfMuv345+NEPWr5SH5oZTIKIxPfzA2uTeIGprLC
	bEQel5zSef3qGxi0ufR41/Kp5hHUXN5PtSrVK0NtqCXvNaXtyg/gha6WtO8D1+z49bW2M4c
	1qPj36FDgC42gEPhCnficdNbisrPF9IRHc63o3xo8Gdicv66hNTwKj4soUZ8PL2lh2BQqsE
	hQwLQeipIf7aJrFp8S78TTYXzfUZ8b7haUhqLhfMp3zwldzbF6Zyt2KqHSWd9AWDa1GxMRv
	BBBsZmm1cHUmSJBf6saRWf5J7Mg3Cm1XgixsoPopW0AYTZjaXht9egWM9+koKPNwT/VB74t
	iwhHQiLB4cyp9eVUppQGbpbXRAjy7APz06ifImTQ3Z3RVjBBvmG8RcKnvsjd7s0LJ9njXMi
	Pcb99RXM9MKU+WS4GRTvRRaSW5QwDTTQ0ddJ/lzyN8Cca/q3JYL7yhazOSvQ6LOvKRIGmuS
	UMdBPgWqxnvnttMSrQA==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
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

---
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

Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>

---
Junzhong Pan (8):
      dt-bindings: usb: ci-hdrc-usb2: add spacemit,k1-usb2 compatible
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
 drivers/usb/chipidea/ci_hdrc_usb2.c                | 35 +++++++++++--------
 6 files changed, 123 insertions(+), 15 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260812-b4-spacemit-k1-usb2-97adfc283d58

Best regards,
-- 
Junzhong Pan <panjunzhong@linux.spacemit.com>

