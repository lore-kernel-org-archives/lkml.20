Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364953DD847;
	Tue,  6 Oct 2026 10:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791281650; cv=none; b=I5V+XSAI7Ik3HUgqTgHApO4V3eBbhLrbtXD43mQxGsrxyMOirlnYf0P/sBmXw8lEYXReAVJrI9RI7iFkYVcN1mqPzU8n/KFQ9j3ejcdBT0QdkwdtN7nv7+elBo6SdKqjvyjQ3ZOUy13/NAnh6RWZvapdOrF5vdoS3czTN1gWhdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791281650; c=relaxed/simple;
	bh=yTvrC4MeqwfkwAzuTb0LRj5KU6peCV3xDJhCJSLOJkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i/pQJ9hr8elMT8c60ganPM3ppVApCu1kMNOBjy0jLJEJVsIS9J/kLU2/KDzG0tIcnqst0mfS5Ljk4tzH9aDLavPAaF26jaFtSC2LdnWJX5qxea9TBh1Qng4sHNDCQvKWYldeaZDSBDkaWvm2pmUwT3/9vos/0glSiTiN3qIhGVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Rgkt32MF; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Rgkt32MF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=/MKRL/nN+GnLIL3zzwMXRu+DOLGuzft8SFSZnZqTRA8=; b=Rgkt32MFona3yOqeYiq4UlK3ms
	XxAzvieLCpDSCcosPUId9noBDM1+GROWMAAP7YNEnlW3pcgK4l2ahv5PnzAX/XFaEpG8Ja2IU4IDx
	Tuw1OzMuWUJnz0Sp0AcmAaPd/ubBQWFoYjnI2XjNeVum23nj7fOcki8VSAkwgwpwi5OldimqGkI0D
	3tXtKQHRzruoVe4iQ8rGXwggSbFO/g7C5yKeVI7J1I1AqKOs0fhRqASk/CAJlw97UYL4PqcuCF3En
	I2kGWR2upk0S4Wy7rnEZWseGcz7xsTcaI9KmuMxthiGXT5i4jI6SAhZnXFsYo9WzJ4on98hVDhRdH
	pAFis36w==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xE2BQ-000Eyk-18;
	Tue, 06 Oct 2026 12:14:04 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xE2As-000Bni-1D;
	Tue, 06 Oct 2026 12:14:03 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] arm64: dts: imx91-tqma9131-mba93xxca: remove pullup from CAN pins
Date: Tue,  6 Oct 2026 12:13:46 +0200
Message-ID: <20261006101358.2189639-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006101358.2189639-1-alexander.stein@ew.tq-group.com>
References: <20261006101358.2189639-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28145/Tue Oct  6 08:26:12 2026)

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

Board has external PU, so internal PU are not needed.

Fixes: 4d0d3a3d1993 ("arm64: dts: add devicetree for TQMa91xx on MBa93xxCA")

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../dts/freescale/imx91-tqma9131-mba93xxca.dts   | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-tqma9131-mba93xxca.dts b/arch/arm64/boot/dts/freescale/imx91-tqma9131-mba93xxca.dts
index 3fb5bb71b6225..4a98cb0789c97 100644
--- a/arch/arm64/boot/dts/freescale/imx91-tqma9131-mba93xxca.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-tqma9131-mba93xxca.dts
@@ -715,19 +715,19 @@ MX91_PAD_CCM_CLKO2__GPIO3_IO27			0x1000
 
 	pinctrl_flexcan1: flexcan1grp {
 		fsl,pins = <
-			/* HYS | PU | FSEL_0 | DSE no drive */
-			MX91_PAD_PDM_BIT_STREAM0__CAN1_RX		0x1200
-			/* PU | FSEL_3 | DSE X4 */
-			MX91_PAD_PDM_CLK__CAN1_TX			0x039e
+			/* HYS |FSEL_0 | DSE no drive */
+			MX91_PAD_PDM_BIT_STREAM0__CAN1_RX		0x1000
+			/* FSEL_3 | DSE X4 */
+			MX91_PAD_PDM_CLK__CAN1_TX			0x019e
 		>;
 	};
 
 	pinctrl_flexcan2: flexcan2grp {
 		fsl,pins = <
-			/* HYS | PU | FSEL_0 | DSE no drive */
-			MX91_PAD_GPIO_IO27__CAN2_RX			0x1200
-			/* PU | FSEL_3 | DSE X4 */
-			MX91_PAD_GPIO_IO25__CAN2_TX			0x039e
+			/* HYS | FSEL_0 | DSE no drive */
+			MX91_PAD_GPIO_IO27__CAN2_RX			0x1000
+			/* FSEL_3 | DSE X4 */
+			MX91_PAD_GPIO_IO25__CAN2_TX			0x019e
 		>;
 	};
 
-- 
2.55.0

