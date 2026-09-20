Received: from v511.v5ed9ac7d.euw1.send.eu.mailgun.net (v511.v5ed9ac7d.euw1.send.eu.mailgun.net [141.193.32.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0D944684F
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.193.32.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789912408; cv=none; b=eTXrMZOAeNQZ3eCYi02S5rO2Hcg1KmkBGDn4nD+3tjRalPOuUHuyEsV1sUaVzxNc7wA/FmgzO7znizZIzxNOJA6FTyBhtLLtD1iVaAW4Z5mvA4FSkf8GJGS0RoPkYChe7YTkm0q6lH9bW8y8N2o9Np7CuYqVWASaJefQRWcDdxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789912408; c=relaxed/simple;
	bh=OkXPpOSSXY0FXOzDjAh9QlD/ry9K1Ip04/+5M4CeGUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WzDivo2cBtjcm2YmWib6b7OKvat7KE2RSFLDJ8x4eOxP/ysTBXx5MtBBuE0VerkXNbVBMFQS3fCrhDtfSpoSsVg6fLKjH1UJwNcI3q+uoPCpkwmg1uNeLUjIMBRDkAXHAFTSsaIDbejeX5MshIbBcAOzWOYdHgrgkU9z1aqa/uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=plajta.eu; spf=pass smtp.mailfrom=plajta.eu; dkim=pass (2048-bit key) header.d=plajta.eu header.i=@plajta.eu header.b=qozxdo15; arc=none smtp.client-ip=141.193.32.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=plajta.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plajta.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plajta.eu header.i=@plajta.eu header.b="qozxdo15"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=plajta.eu; q=dns/txt; s=s1; t=1789912401; x=1789919601;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Subject: Cc: To: To: From: From: Sender: Sender;
 bh=+RBK0WTbSCNGeEF3NaooYJdGJAeK6PcHmlL0cOsfNeI=;
 b=qozxdo15ZXLFrNm8zSPalgwjsXudheyeQuh9n+GHDSNgTsUbONYB1GwyV5Kgto/GRO212/gM8tOtACKzuzLiNP95knvca9xqIswja1NzIKQl+rD46OHD+zGRLXDeA55M/FDhQDpmkf3XTq4wV1ECLnpjXD1Do8VovXHC7kHLlCJxrQRaF/uwzdz2E0qVbf8S+ml31BD4Fdnw1cR527jCwo+ICoqQcArjlWLfJr6XkUlsBQ4kOxdj4I8M1bB1afNv9npL8vdw999rnpuMQZTuQanAEoLZDyiuYxKy/tnJoul7kvmJmdA2A0uwK+kCIVBp7OTyHhgG5iZ1Ywqg4r50uA==
X-Mailgun-Sid: WyI1ZWFlNCIsImxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmciLCJhOTI0YiJd
Received: from tensor.lan (ip-86-49-238-222.bb.vodafone.cz [86.49.238.222]) by
 62dde763711f91b09babc141eb112fb8433c3bdf14f6a1f222f9cb9a27a17a83 with SMTP id
 6aafe5513fa6daf3e872dfee (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Sun, 20 Sep 2026 13:53:21 GMT
X-Mailgun-Sending-Ip: 141.193.32.11
Sender: andrijsalivon@plajta.eu
From: Andrii Salivon <andrijsalivon@plajta.eu>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrii Salivon <andrijsalivon@plajta.eu>
Subject: [PATCH 0/2] Add support for Amazon Kindle 4 (Yoshi)
Date: Sun, 20 Sep 2026 15:53:12 +0200
Message-ID: <20260920135314.3191171-1-andrijsalivon@plajta.eu>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds the device tree binding and initial board support
for the i.MX50 based Amazon Kindle 4.

Andrii Salivon (2):
  dt-bindings: arm: fsl: add Amazon Kindle 4 (Yoshi)
  ARM: dts: imx50: add support for Amazon Kindle 4 (Yoshi)

 .../devicetree/bindings/arm/fsl.yaml          |  1 +
 arch/arm/boot/dts/nxp/imx/Makefile            |  3 +-
 .../boot/dts/nxp/imx/imx50-amazon-yoshi.dts   | 60 +++++++++++++++++++
 3 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx50-amazon-yoshi.dts

-- 
2.55.0
