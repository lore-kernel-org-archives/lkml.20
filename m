Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778713E1D05;
	Fri,  2 Oct 2026 08:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790928873; cv=none; b=L6NoJ9koKiMpzAmaVCpK9jtXLJ5KrzcFrcaRzJ0+xfwCY52d4eTxDNgpmohc7+uA3+sBIwfowU9BJoYmWrXdGkm2Q7p8dBK4PRwmv04h3lnyHi0Wz7+kaf2/4E8To5Elkhb8sNdkjN5PhmAkdTV4j0EeekIhZ5m4l8I4+gS45Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790928873; c=relaxed/simple;
	bh=IQ6JUk1LZYIOlimVDjbDZoE/6ipxmaztgVh0QLrrNsw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E4vkgAD8o8HZIUZc5FleRh6SjxtInEjjuwNkGFOWrSnKCjnBurh7ccyCZ8DndBKiQXJDxFQpbpEObzf2j8L7ve/z02bclv9egpOWoYUT0MVu7dfQZU0Q6EuqJ00Vv7uxJeW7UupUJxmfUDuP/6qGHlxI3yMOs9d1n2vcuOUSDYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=KZ+0VgjI; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="KZ+0VgjI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=TilJGsSaVbNKEutDOXvAU0tIsDvjIQ7ttnA5DEprCHc=; b=KZ+0VgjIfZaEr6UBx+lRQq4NxR
	drdZf9OQ5sHAR95pzm7kwxXYsLDBmN2e5lLKgE/wBACx4i5LOVRU8zagJAYg2T7J6INuZ0dtILNvW
	wbwBIFvXmEDLmeXx2mQph85jPLcGby4BMDR1C595oeP038JZeGjFlXMb96YkFGW5sjfsD0Ry75vHd
	00iRNZs3APIg7D7HiOcMWOliMNOEM46UZcv8EFYM7o/s1dqzPc4RNRzoRa/hXu/nf4Drq1tuSC8uh
	IX5qXdtZ3XJn3J4pY92eVGKldykUJgiv7weuL7NK6eAyXljqbaZPeZyzNSyo2Rl8esSdMLAslbC2P
	XRj9jvrQ==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xCYPO-0003Ms-0e;
	Fri, 02 Oct 2026 10:14:22 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xCYPN-000FgI-2i;
	Fri, 02 Oct 2026 10:14:21 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 0/8] Display support for TQMa6UL[L]x
Date: Fri,  2 Oct 2026 10:14:01 +0200
Message-ID: <20261002081417.2092471-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28141/Fri Oct  2 08:26:12 2026)

Hello everyone,

with the integration of custom bitwidth on DPI output in commit aafd4205a75de
("drm: mxsfb: Add optional DPI output bus-width configuration") the display
support for TQMa6UL[L]x on MBa6ULx can be added.
The mainboard uses a slightly different hardware connection which needs
customization.
Both LVDS and parallel display support is added resuing the DT overlays
for all the variants.

Thanks and best regards
Alexander

Alexander Stein (8):
  ARM: dts: imx6ul: Add LVDS DT overlay for TQMa6ULx
  ARM: dts: imx6ul: Add LVDS DT overlay for TQMa6ULxL
  ARM: dts: imx6ull: Add LVDS DT overlay for TQMa6ULLx
  ARM: dts: imx6ull: Add LVDS DT overlay for TQMa6ULLxL
  ARM: dts: imx6ul: Add parallel display DT overlay for TQMa6ULx
  ARM: dts: imx6ul: Add parallel display DT overlay for TQMa6ULxL
  ARM: dts: imx6ull: Add parallel display DT overlay for TQMa6ULLx
  ARM: dts: imx6ull: Add parallel display DT overlay for TQMa6ULLxL

 arch/arm/boot/dts/nxp/imx/Makefile            | 26 +++++++
 .../imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtso  | 53 ++++++++++++++
 .../imx6ul-tqma6ul2-mba6ulx-cdtech-fc21.dtso  | 53 ++++++++++++++
 ...6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtso | 69 +++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi        | 64 +++++++++++++++++
 5 files changed, 265 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2-mba6ulx-cdtech-fc21.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtso

-- 
2.55.0

