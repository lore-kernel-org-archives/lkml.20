Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792685844;
	b=Z83T1XSamzLgKXgHFqgvC4nqIfLNgCpzgEmUGgNbWPSH2PmCx1uToKAlQNSlw1x99k31
	 /4n5NKqgzI5CtAeEFhYRCasTx7sHZO3eiOukPQ0j8h3kOQA1otDbUOAhlRzBAUvyvAPaG
	 kjIrmDcbhZt45cOD5p9TGGO3gKrzeUuFY/XludBTA83aMC9LcYGHCRR24i2RWA/ugc7bn
	 yMeYZToX51ho71OB44uzeBG1jJhXtTNqrs1qs5XAXoYJJkfLl16oa5/lpUQ06fpDBQ0Qy
	 Qfuc2GZfzefupM8t2asM+NCy2wbdrLjxuZKBwa/shKjHJ5eHi72SkoCWZv3pwNYlMQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792685844;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=MN0UiazmxeHW7SqU7RVeg38ZMCu0rsCgqZRvdUxxdfo=;
	b=DtnITSqhMgauns4oIMSHSclIhCpLhyV4heRIZEYMIINky2IFj0SsjZDc712NYrWsS6ku
	 ryWhytJ0XOmN7qmrq6IYKYmRb15sLvZkGuM4gOOgaU0iv9RA6J3FddREAAP3L800x6rBq
	 BSAoJmyOWZ98UynXezRdiMGHgNvSddGuM4tJOB2B88UOj7DHWoMpb4VJZxSYp+eKuddae
	 wloouH6tj1ukkG/99lQwsHB24pY6tz8gG6ne68on0fPN4HQEQo6ZiSnaoC7uCpIW2ul6z
	 JnVuDagKi0GcvoA8mrAe/yFkNyUYKRl9BgTeIErGVhuypf+Xhz5dUrRxP9MWV3tkEeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=krTZQ7DU;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1954606A31A;
	Thu, 22 Oct 2026 16:17:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1954606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=krTZQ7DU
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id EFFF61FB4F;
	Thu, 22 Oct 2026 18:17:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1792685839;
	bh=MN0UiazmxeHW7SqU7RVeg38ZMCu0rsCgqZRvdUxxdfo=; h=From:To:Subject;
	b=krTZQ7DUtT0stj2dVB8QD+m2a5CLYrzcVr3zk9IutgFqpT2z9HhO95gbkV5KbZj/D
	 kkdJ9I9S5VCm8+cU3n5VeJZ6x8Sjr1mrPh02zmpDAVMpKmgcy77wZe1sHXESQSIioW
	 fX8xRnTF6wzkUn3xAC+moTMEfTBJUm0NM+frmKHJBVoO+ZHHci2Q9/FqDgNB+7Rask
	 AGYsiCo5ZnDFMZb3MpMqialws5eykADppY4iC+ut/R+sfBl86YLgzqIfArTdgpvxsZ
	 ZxNexj5KK8OMYx+O+TjLabCCl4sfIexEFrdryMztsmQBM/nmT9uN2JrUVy1E4i7SFW
	 DiMYxNU+eUCPg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: colibri-imx8x-aster: Enable I2C bus
Date: Thu, 22 Oct 2026 18:17:06 +0200
Message-ID: <20261022161708.690702-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The Colibri standard I2C bus (SODIMM 194/196) is available on the Aster
carrier board on the 40-pin extension header X20, the Arduino UNO header
X18 and the capacitive touch connector X3, with pull-ups on the carrier.

Enable the bus to allow userspace access to I2C devices connected
through this interface.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8x-colibri-aster.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri-aster.dtsi b/arch/arm64/boot/dts/freescale/imx8x-colibri-aster.dtsi
index f7bbb2153ae0..11b1d45e5dfd 100644
--- a/arch/arm64/boot/dts/freescale/imx8x-colibri-aster.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri-aster.dtsi
@@ -26,6 +26,11 @@ &fec1 {
 	status = "okay";
 };
 
+/* Colibri I2C */
+&i2c1 {
+	status = "okay";
+};
+
 &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog0>;
-- 
2.47.3

