Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3671E457E7D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758428; cv=none; b=p9PHebb6KXy6ZUrGHmf8ZW+sQhIO4ERBUUMHg32WUI/2Tm9uXh0LDhm8gLoR2f41R8ISd+dh/OXLHeqs2gwZ/RZesRobAVWg3N6p6hwu+RlJilGC8uc41IqAOAYZelPOIlSeyUGJJJh5fO+AcM9PGmljiZp479jUVc5xO/E/f+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758428; c=relaxed/simple;
	bh=geA/iZB6wkEKrsiLYnp/cqZXPGVPPnjSglnChDxmN9A=;
	h=From:In-Reply-To:Content-Type:References:Date:Cc:To:MIME-Version:
	 Message-ID:Subject; b=IAbqwxHifrsTPH5xFF66D1OgDYRcZuUNZOq/U+8IFnDFw7utFZAkLgwXBhujQFUrUrScoEYTSh0kAKD8vMB/V6K8cIhPNNP6HvcByQK9X8vhDRXR1dYl3ZzHltamVe5+sIffHtou0lHYNQ1DVuOJn6Q26pWBx332N51pfPgbuSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xXlBawrS; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xXlBawrS"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 796281A107C;
	Wed, 30 Sep 2026 08:53:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 44E8B60749;
	Wed, 30 Sep 2026 08:53:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 32F0D10328E7B;
	Wed, 30 Sep 2026 10:53:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790758422; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6AWkXYD/MD09FFhnuG0xmwYrcKAW4aflAM4wC217Zdk=;
	b=xXlBawrSCHtRf7uBs/H3aHyT/IlWcoN+YdbdklTn+FtklaDDpr13vhlc2/7JWF0BbTRXaF
	WFP6P947sdxTV+Tdfhc6TGaPkQv2eRtZDNLiykVjAVA8wzVUNMXdpXm+W4IEQA3WDXy8CQ
	1qULBYf0iytwiWP+3C8/H3uDDj1zDixV+4giWK8wLfHN79qYv1ZI77bHUBNGHYVy824OIb
	bWXP7vbzUDRR3VRCvH4ydGcOGZ8UJGkpUFNv3mSCs8dPBePdvMGc9ircgVTK9FkOM9qixy
	jMa530GNhnA06ee70wwYI6c9b8P0ALvhWJ1hCc60PqFoo0BfJgo04rxfGeG1NA==
From: "Gregory Clement" <gregory.clement@bootlin.com>
In-Reply-To:  <AM6PR01MB56865DCADF2BF67FD3277158808B2@AM6PR01MB5686.eurprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset="utf-8"
References: <20260921-send-dt-v2-0-fb6b81002ad7@studio.unibo.it>  <AM6PR01MB56865DCADF2BF67FD3277158808B2@AM6PR01MB5686.eurprd01.prod.exchangelabs.com>
Date: Wed, 30 Sep 2026 10:53:38 +0200
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Andrew Lunn" <andrew@lunn.ch>, "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>, =?utf-8?q?devicetree=40vger=2Ekernel=2Eorg?= <devicetree@vger.kernel.org>, =?utf-8?q?linux-kernel=40vger=2Ekernel=2Eorg?= <linux-kernel@vger.kernel.org>, =?utf-8?q?linux-arm-kernel=40lists=2Einfradead=2Eorg?= <linux-arm-kernel@lists.infradead.org>, "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
To: =?utf-8?q?Nicol=C3=B2_Giuliani_-_nicolo=2Egiuliani6=40studio=2Eunibo=2Eit?= <nicolo.giuliani6@studio.unibo.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <43fd0a32-5436-4303-7d0d-2e3ca33772f7@bootlin.com>
Subject: =?utf-8?q?Re=3A?==?utf-8?q?_R=3A?= [PATCH v2 0/3] =?utf-8?q?arm64=3A?=
 =?utf-8?q?_dts=3A?==?utf-8?q?_marvell=3A?= Add Sophos XGS 107w NPU
User-Agent: SOGoMail 5.12.4
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None

On Wednesday, September 30, 2026 10:35 CEST, Nicol=C3=B2 Giuliani - nic=
olo.giuliani6@studio.unibo.it <nicolo.giuliani6@studio.unibo.it> wrote:

>=20
> Hi Gregory, Andrew, Sebastian,
Hello  Nicolo,

> This series has Acked-by from Krzysztof on 1/3 and 2/3, and Reviewed-=
by from Andrew on 3/3. Is there anything else needed before it can be a=
pplied, or should I wait for the next merge window?

I am working on the backlog today, either I will apply it or I will let=
 know if something is missing.

Gregory

>=20
> Thanks,
> Nicolo Giuliani
>=20
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> Da: Nicolo Giuliani via B4 Relay <devnull+nicolo.giuliani6.studio.uni=
bo.it@kernel.org>
> Inviato: luned=C3=AC 21 settembre 2026 02:26
> A: Rob Herring; Krzysztof Kozlowski; Conor Dooley; Andrew Lunn; Grego=
ry Clement; Sebastian Hesselbarth
> Cc: devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-a=
rm-kernel@lists.infradead.org; Nicol=C3=B2 Giuliani - nicolo.giuliani6@=
studio.unibo.it; Krzysztof Kozlowski
> Oggetto: [PATCH v2 0/3] arm64: dts: marvell: Add Sophos XGS 107w NPU
>=20
> The Sophos XGS 87/107 desktop firewalls pair an AMD x86 host with a
> separate network processing unit (NPU): a Marvell Armada CN9130 SoC w=
ith
> its own eMMC and SPI NOR flash. The NPU serves the eight RJ45 ports a=
nd
> the SFP cage through a Marvell 88E6193X switch on its MDIO bus, which=
 is
> connected to the SoC by a 10GBASE-R link, and reaches the x86 host ov=
er
> PCIe.
>=20
> This series adds the Sophos vendor prefix, the compatible string of t=
he
> NPU board and a device tree that describes the NPU as a standalone sy=
stem:
> UART console, eMMC, SPI NOR flash, the SFP cage and the switch with i=
ts
> ports. The port LEDs, the USB ports and the PCIe link to the x86 host=
 (the
> CN9130 acts as a PCIe endpoint towards it, which needs endpoint suppo=
rt
> that is not part of this series) are not described.
>=20
> Tested on an XGS 107w with Linux 6.18: boot from eMMC, eMMC and SPI N=
OR
> access, the mvpp2 link to the switch at 10 Gb/s, the 88E6193X probing=
 with
> its eight user ports, and 936 Mbit/s through a front port. The SFP ca=
ge
> is untested.
>=20
> dt=5Fbinding=5Fcheck passes for vendor-prefixes.yaml and armada-7k-8k=
.yaml,
> and CHECK=5FDTBS=3Dy on marvell/cn9130-sophos-xgs107w.dtb reports no =
warning
> specific to this board.
>=20
> Based on the mvebu/dt branch of the mvebu tree (008e9faade).
>=20
> Signed-off-by: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
> ---
> Changes in v2:
> - Patch 1: drop the second sentence of the commit message, add Acked-=
by
> - Patch 2: move the entry before the SolidRun ones and list only
>   marvell,cn9130 after the board compatible, as the other CN9130 boar=
ds do
> - Patch 3: use the compatible list of patch 2; pass the switch reset =
as
>   reset-gpios and drop the boot loader workaround; remove the LED
>   expander node and the SFP address comment
> - Link to v1: https://patch.msgid.link/20260919-send-dt-v1-0-365615a7=
4ef3@studio.unibo.it
>=20
> ---
> Nicolo Giuliani (3):
>       dt-bindings: vendor-prefixes: Add Sophos
>       dt-bindings: arm: marvell: Add Sophos XGS 107w NPU
>       arm64: dts: marvell: Add Sophos XGS 107w NPU board
>=20
>  .../bindings/arm/marvell/armada-7k-8k.yaml         |   7 +
>  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
>  arch/arm64/boot/dts/marvell/Makefile               |   1 +
>  .../boot/dts/marvell/cn9130-sophos-xgs107w.dts     | 188 +++++++++++=
++++++++++
>  4 files changed, 198 insertions(+)
> ---
> base-commit: 008e9faadef8c0aaa9b8a3ff05a2126e3c5b08b7
> change-id: 20260919-send-dt-6bbd08a470d2
>=20
> Best regards,
> --
> Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
>=20
>

