Received: from trabant.uid0.hu (trabant.uid0.hu [81.0.124.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B46125C818;
	Fri, 18 Sep 2026 20:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.0.124.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789764270; cv=none; b=q4XzByPo+HIvknSybe4o4RgezsGmEtN4kWAqp48fWUdUoJPfqY/vlIMpiETTC4AFSZzS6rz+hn0LI92x5zLCT+aI9hXVJqotmXzXusarUQx46OWuCRHrrLsWJhgYsQNmJNthsPtzbKM3asCmPchak1QFYGyshGVJrYOjWZtnI54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789764270; c=relaxed/simple;
	bh=qcHN1YhfgPNwCPQSAn0AD2zljjK7VKbGA8FJJgZDqGg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NOVYdS/47MDlrSb8mGlqJcgLhsBGZrKtAfwfMd1s9+4302my97jFwDvMYpHEMETCpKFX8O6iCmuI5Q7fig2BROaJz5fby9tLXIogYQr0FsN0MITeoIxrj4+62i6bFAGEiImOZxpTA6XomOH2dS8B8VrLu41FhBFdQR7TturO5Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uid0.hu; spf=none smtp.mailfrom=trabant.uid0.hu; arc=none smtp.client-ip=81.0.124.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uid0.hu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=trabant.uid0.hu
Received: from wigyori by trabant.uid0.hu with local (Exim 4.94.2 #2 (Debian))
	id 1x7ehW-0000EC-54
	from <wigyori@trabant.uid0.hu>; Fri, 18 Sep 2026 21:56:50 +0200
From: Zoltan HERPAI <wigyori@uid0.hu>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	kernel@pengutronix.de
Cc: wigyori@uid0.hu,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: add support for Olimex i.MX8MP-SOM-EVB kit
Date: Fri, 18 Sep 2026 21:55:57 +0200
Message-Id: <20260918195559.130443-1-wigyori@uid0.hu>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Zoltan HERPAI <wigyori@trabant.uid0.hu>

This series adds support for the Olimex i.MX8MP-SOM-EVB kit, consisting of a carrier
board and a SoM.

Patch 1/2 documents the respective bindings,
Patch 2/2 adds the SoM dtsi and the carrier board dts.

Zoltan HERPAI (2):
  dt-bindings: arm64: fsl: add Olimex i.MX8MP boards
  arm64: dts: imx8mp: add Olimex i.MX8MP-SOM-EVB kit

 .../devicetree/bindings/arm/fsl.yaml          |   7 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mp-olimex-som-evb.dts   | 168 +++++
 .../boot/dts/freescale/imx8mp-olimex-som.dtsi | 578 ++++++++++++++++++
 4 files changed, 754 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-olimex-som-evb.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-olimex-som.dtsi

-- 
2.30.2

