Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794498486;
	b=RMpmchJd250z16KBE7MeEqKChGAmWuf3c095XeEmZ3r2/iaaAGphMh8Q4ZgppAtVzlAa
	 j/dXjNHlBM/B1+BsxSXZBpTXZoKpe4/qVbWUI1IymHeCMHLuqI5BCrJOn/oiyZM6/rMv8
	 R6Uq/fVHvvVWu1UOldW+TiIiZcqJ7JdZpxNgZFqHiKsjKWrTyaAfLnkqrTVLKNNIIAKcF
	 LoAtRpgCdwTvWSNBaGld4OWSLlBSqH/i3/YuOV4UbZbre+h7yVFPAtWTkqnAHniJX+kUo
	 fyBRKCYK3dGTsCIf1eVSPnYPch30Vo4hynubObxI1tLF/7xoMLvQq/tLatwVTtdi8Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498486;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:Subject:
	 Content-Type:Content-Transfer-Encoding;
	bh=/z66J+tn3EnGy4yKFdi8sAEEShlA02PQ1QPP8MQJUt4=;
	b=dLGMxt9N6zO5n1yvZqPYkYuscONRFJQRkjWrK279RpC7jQxU6N4w95+xt7JLRu5MYPM6
	 2PU0wQ898OoHkC7PsOJVBBp6lum3lNrnCaTkaRfXR47dEfxLsCMLyb+zA40P5S6gShlhz
	 IxFSuIrOQGTSQE4xQIKYT4blF0h2TDGjy4c6RDtTy1RhTvjfbFY5ITCWw0oLocdZjzwtO
	 uzdGzR9otbsQwLhdSif8rvKabL+X3BxGB+Y5vToq5k/DvSsl6FI6AJ0ar3lyksKGjgmf+
	 NW/zflFkdBEt4uqvWEAVAy1dNiYabWaZGM+jMb4Zfo1uM+sVZSiILS2PGSmZoYpW6OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=BGRs+4Ot;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b="lzl/DoDv";
	arc=none smtp.remote-ip=202.12.124.159
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C92D606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C92D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=BGRs+4Ot;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=lzl/DoDv
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7CE967A0124
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:48:04 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 12 Nov 2026 10:48:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1794498472; x=1794584872; bh=/z
	66J+tn3EnGy4yKFdi8sAEEShlA02PQ1QPP8MQJUt4=; b=BGRs+4OtxtppbPXyXk
	+zfn0SEmRc4CbZHF/2zZTDPSZM4w0czVKTFmEn5xbm3EG7kfOxtKujFUsxFSutd8
	pB0JfNyKZ1nExOZNro/04o091aNfUTkPu3D/lnD/gRRsLxmXg/goXaR1l8oonzye
	Q01RtmDh8GoQY8KukeiTnKfqjbMUBVEcfB/fDTXYBbbLKYGWxMx1LEMBddurXobz
	HzkZMek3A8UDOPca9Z7Q/yh3Y1JCIIE74sj3KEj928cbdl7rP5ah+R+UOyF32ijB
	QCTSOzhGTjAwxry00mfgHnIpOUppD51atJphvXnSNBnQ+pfJGv6OqXBVisRxfyAP
	uEAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1794498472; x=1794584872; bh=/z66J+tn3EnGy4yKFdi8sAEEShlA
	02PQ1QPP8MQJUt4=; b=lzl/DoDvZouB6SQp5urlokftdzZDlQSPpJSyCzHIYqEQ
	D9C0GXMD+DiIfh6LGGY2DeyvvydS7L/cyNqbakNP/E9mvsr1LOy55XVH9tOqzM98
	YSveQ4aZy9/iaX7hd+WOtgufO0BO32BXBOli3RDLeNxwoA9bjgcJ+J7pwISMnvgZ
	QTB9TOEy3H+NclALX8rcUDBJDyqRGa8G9Fw3L2MWdAt9XWkCTonWGg4XcaKeve0I
	FOlJZJ8ID5xN0/rGswPVI2yzykcNBAbTnQ0b6S9oFYzi1xpvhhlAhemSrdgVVd/n
	f/o0YRePJ96KcnsXzzJdhD7KNcES5s8MSbRlbfhsBw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794498472; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:ANss11EhuURa493WSJjIWqBkKbHemcbDnOUCBQycipCQp6P
	LrjWMnstInkjZl49ZRus6WDubo0GYgcQod6hvf/FCtre8Y+vMn2LbNgggWwD9iJw
	/0E7nFvGO8H/Xah12Orjc9fo3dBpKAA4C8UTf3sw5nzqasU+WJjJDRaSCUYHMXnO
	nrxbG+mr8mCEW6V11imGzkA7S2X9PYd0egb9uLSCILDzlmVXqSI/lAN8+WZQS/yb
	Oj2Wu4SGpRkv2kDTuZg6/KIuO6XBHG4amrTXkqW5GAm2vlUMmshgX6uR8u08y24K
	WWQHbnzanrHFLAL5xsg0q0QlI0ZUyKFKB0kWR4g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:/d+V6Nyw8reFbHNJLJinPv1F7pOTOy0ba2ilRwUDjdE=:HRqObXXh9ipIRQ8GS2MCGvD495RvUDctuxQQ3vmYdGA=;
X-ME-Sender: <xms:nd_1at10wV2B0bO0LIpo24rNtwkJrGhYzT7EXtUzanQvnAN4v1NSiA>
    <xme:nd_1au4jqPcP7BMED9uWhpd4D8iQOG-CzKhtFV7Xa_le6E-VVSxmhqFpPB4mFMAy0
    JYckCMh-XrKNVrKZd1jrHnTkqBcEP25zLDY49IIhxR3U2vijbn2jlrF>
X-ME-Proxy-Cause: dmFkZTFn0UwbKWuBiouyjk4aDZ9BrtML6xuklYV4APUxQOGE3wFCsEYTlpFQhW9CDRggMk
    kKya6hEEGcVBnesGreCBcY3m7SIBKOBBO+WEdB8MChqwhFtbsD90IQxp8xIf8bBOpp4m9F
    34jzExg841Nxsapnv0WAfVABHManrJuxq9kgo8VcFzOJ0DsJgpXO/VggViTJct7zhEFZLA
    E34wg9PIFLUR9gTGFomeYziYAV8RWGkL9NoydUCm5vI6yCSXHPyfeazV2FjUx8Ck5ZD7zb
    OO2LYBEIA2RK8/TUku1BrF8uGnpf4YrluUVXqi3N31rGu7sYHpSPMk9keVqHm7SXUCgjED
    fU5tFHgZh9lIjhyhJAVfGDBzbyePmmxK0YyFG1jqMxWc2uktMEVVml/BMBNps+5J32Gar6
    t3LE7z4KhEWOFgCcYckxh9/C/zpjXTGFHEvx08ME8NgpH9OpEtd3+Eo5u+gmQ3UjMnhurE
    mM+LUzU8lvNxLfI582zLfhe5QoCKnTAd1ADu4KxYH24khCjjCQvZeQfeXyBfyGp1aJl8Kv
    G4Wni/WzXlU1pyB84sVNRQrao5Qvk0GkvQeAvnp+Aj6gnH536Qh6ubSd8RE7oruCJQHana
    qTHPkoQDsuvWI9R0A/KQUkc4EjjjxtkfVrvnryXPYDNJnd3X51ug5WjuQ+7g
X-ME-Proxy: <xmx:od_1amRas_w00mEggs9jUBNTwjsjr0GtBCE7AMcv8tx70YZzj_aZYQ>
    <xmx:od_1aiN2jdFuEph5JLqey_vDfHGkTn78mQsGIZrpouWnycuSZHqgZg>
    <xmx:od_1ahVzsV2_buXLsRPV4w17HLOfgOw7lPYMDyK8GPGcACdwNuSSeQ>
    <xmx:od_1aqbrCB6IQexwqO_jIv36uZK_bO8iYiI6G5aB8w66U9bCH01CPQ>
    <xmx:qN_1alBXrtLnM_0D-d4Zi_LAQxbbFU3TDePiLIA9Ny95OB8wTBMn3WwR>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id A5A1632A009C; Thu, 12 Nov 2026 10:47:41 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: Ai0TAaHjllh7
Date: Thu, 12 Nov 2026 16:47:21 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: soc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Russell King" <rmk+kernel@armlinux.org.uk>,
 "Vladimir Zapolskiy" <vz@mleia.com>, "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "Andreas Kemnade" <andreas@kemnade.info>,
 "Kevin Hilman" <khilman@baylibre.com>, "Roger Quadros" <rogerq@kernel.org>,
 "Tony Lindgren" <tony@atomide.com>, "Andrew Lunn" <andrew@lunn.ch>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Daniel Mack" <daniel@zonque.org>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>
Message-Id: <7d052ff3-6d0a-47ff-a1cb-b7864ad2c248@app.fastmail.com>
Subject: [GIT PULL] soc: deprecated platform removal for 7.5
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The following changes since commit 7475ea8b58616b33c04afb976cf0fbaad9dd63fb:

  Linux 7.4-rc2 (2026-11-08 16:22:20 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/board-remove-for-7.5

for you to fetch changes up to 273a6e23f66433952300d1810b5274786e7e4a25:

  ARM: at91: remove samv7 support (2026-11-10 22:18:44 +0100)

----------------------------------------------------------------
soc: deprecated platform removal for 7.5

In the 7.3 kernel, I marked a number of platforms and features as
deprecated, with the plan to keep these around for the LTS kernel.
I originally submitted this for 7.4, but then retracted this because
it was unclear whether that would be the LTS kernel.

Cleaning out the deprecated platform code has turned into a larger effort
than I expected, currently standing at 300 patches, with a lot of them
still in need of being split up into smaller ones, see [2] for a current
snapshot.

The first series here removes just the bits in arch/arm/mach-*/, plus
the portions that directly depend on the removed Kconfig symbols where
these are trivial to remove.

The parts that are not included are those that remove architectural
features and device drivers that become unused after this series.
The RiscPC platform that was marked as deprecated is left in place
for the moment, as there was still some discussion about reviving
compiler support for it.

The LSI/Intel Axxia platform still has users trying to get it back
into work order and will not be removed as originally planned.

Link: [1] https://lore.kernel.org/all/20260701212353.2196041-1-arnd@kernel.org/
Link: [2] https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=board-remove-7.4
Link: https://lore.kernel.org/all/20260914140821.1805449-1-arnd@kernel.org/

----------------------------------------------------------------
Arnd Bergmann (13):
      ARM: remove sa1100 platform
      ARM: remove footbridge
      ARM: remove legacy pxa board files
      ARM: orion/dove/mv78xx0: remove all board files
      ARM: orion5x: fold plat-orion/pcie.c and hw_pci into pci.c
      ARM: omap2: remove omap24xx support
      ARM: imx: remove i.MX31 SoC support
      ARM: versatile: remove Integrator/CM1136JF-S option
      ARM: imx: remove nommu support
      ARM: lpc18xx: remove entire platform
      ARM: stm32: remove stm32f4/f7/h7 MCU support
      ARM: versatile: remove mps2 support
      ARM: at91: remove samv7 support

 Documentation/arch/arm/index.rst                   |    9 -
 Documentation/arch/arm/marvell.rst                 |   15 +-
 Documentation/arch/arm/microchip.rst               |   39 -
 Documentation/arch/arm/netwinder.rst               |   85 -
 Documentation/arch/arm/sa1100/assabet.rst          |  301 ----
 Documentation/arch/arm/sa1100/cerf.rst             |   35 -
 Documentation/arch/arm/sa1100/index.rst            |   13 -
 Documentation/arch/arm/sa1100/lart.rst             |   15 -
 Documentation/arch/arm/sa1100/serial_uart.rst      |   51 -
 Documentation/arch/arm/stm32/overview.rst          |    8 +-
 .../arch/arm/stm32/stm32f429-overview.rst          |   25 -
 .../arch/arm/stm32/stm32f746-overview.rst          |   32 -
 .../arch/arm/stm32/stm32f769-overview.rst          |   34 -
 .../arch/arm/stm32/stm32h743-overview.rst          |   33 -
 .../arch/arm/stm32/stm32h750-overview.rst          |   34 -
 .../devicetree/bindings/arm/atmel-at91.yaml        |   39 -
 MAINTAINERS                                        |   40 -
 arch/arm/Kconfig                                   |   61 +-
 arch/arm/Kconfig.debug                             |  104 +-
 arch/arm/Makefile                                  |   13 -
 arch/arm/boot/bootp/Makefile                       |    2 -
 arch/arm/boot/compressed/Makefile                  |    8 -
 arch/arm/boot/compressed/head-sa1100.S             |   45 -
 arch/arm/boot/compressed/head-sharpsl.S            |  151 --
 arch/arm/boot/compressed/head.S                    |    7 -
 arch/arm/boot/dts/arm/Makefile                     |    3 -
 arch/arm/boot/dts/arm/mps2-an385.dts               |   92 -
 arch/arm/boot/dts/arm/mps2-an399.dts               |   92 -
 arch/arm/boot/dts/arm/mps2.dtsi                    |  220 ---
 arch/arm/boot/dts/nxp/imx/Makefile                 |    5 -
 arch/arm/boot/dts/nxp/imx/imx31-bug.dts            |   22 -
 arch/arm/boot/dts/nxp/imx/imx31-lite.dts           |  178 --
 arch/arm/boot/dts/nxp/imx/imx31.dtsi               |  371 ----
 arch/arm/boot/dts/nxp/imx/imxrt1050-evk.dts        |   72 -
 arch/arm/boot/dts/nxp/imx/imxrt1050-pinfunc.h      |  993 -----------
 arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi           |  160 --
 arch/arm/boot/dts/nxp/imx/imxrt1170-pinfunc.h      | 1561 -----------------
 arch/arm/boot/dts/nxp/lpc/Makefile                 |    5 -
 arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi             |  543 ------
 arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dts         |  221 ---
 arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dts   |  485 ------
 arch/arm/boot/dts/nxp/lpc/lpc4350.dtsi             |   48 -
 .../arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dts |  624 -------
 arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts  |  621 -------
 arch/arm/boot/dts/nxp/lpc/lpc4357.dtsi             |   52 -
 arch/arm/boot/dts/nxp/vf/Makefile                  |    2 -
 arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dts       |   61 -
 arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dts        |   88 -
 arch/arm/boot/dts/nxp/vf/vf610m4.dtsi              |   61 -
 arch/arm/boot/dts/st/Makefile                      |   11 -
 arch/arm/boot/dts/st/stm32429i-eval.dts            |  349 ----
 arch/arm/boot/dts/st/stm32746g-eval.dts            |  236 ---
 arch/arm/boot/dts/st/stm32f4-pinctrl.dtsi          |  482 ------
 arch/arm/boot/dts/st/stm32f429-disco.dts           |  243 ---
 arch/arm/boot/dts/st/stm32f429-pinctrl.dtsi        |   91 -
 arch/arm/boot/dts/st/stm32f429.dtsi                |  800 ---------
 arch/arm/boot/dts/st/stm32f469-disco.dts           |  260 ---
 arch/arm/boot/dts/st/stm32f469-pinctrl.dtsi        |   92 -
 arch/arm/boot/dts/st/stm32f469.dtsi                |   18 -
 arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi          |  436 -----
 arch/arm/boot/dts/st/stm32f746-disco.dts           |  234 ---
 arch/arm/boot/dts/st/stm32f746-pinctrl.dtsi        |   55 -
 arch/arm/boot/dts/st/stm32f746.dtsi                |  727 --------
 .../boot/dts/st/stm32f769-disco-mb1166-reva09.dts  |   13 -
 arch/arm/boot/dts/st/stm32f769-disco.dts           |  243 ---
 arch/arm/boot/dts/st/stm32f769-pinctrl.dtsi        |   55 -
 arch/arm/boot/dts/st/stm32f769.dtsi                |   37 -
 arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi          |  301 ----
 arch/arm/boot/dts/st/stm32h743.dtsi                |  738 --------
 arch/arm/boot/dts/st/stm32h743i-disco.dts          |  145 --
 arch/arm/boot/dts/st/stm32h743i-eval.dts           |  185 --
 arch/arm/boot/dts/st/stm32h747i-disco.dts          |  149 --
 arch/arm/boot/dts/st/stm32h750.dtsi                |    6 -
 arch/arm/boot/dts/st/stm32h750i-art-pi.dts         |  229 ---
 arch/arm/boot/dts/ti/omap/Makefile                 |    6 -
 arch/arm/boot/dts/ti/omap/omap2.dtsi               |  338 ----
 arch/arm/boot/dts/ti/omap/omap2420-clocks.dtsi     |  267 ---
 arch/arm/boot/dts/ti/omap/omap2420-h4.dts          |   63 -
 arch/arm/boot/dts/ti/omap/omap2420-n800.dts        |    9 -
 arch/arm/boot/dts/ti/omap/omap2420-n810-wimax.dts  |    9 -
 arch/arm/boot/dts/ti/omap/omap2420-n810.dts        |   75 -
 .../arm/boot/dts/ti/omap/omap2420-n8x0-common.dtsi |  123 --
 arch/arm/boot/dts/ti/omap/omap2420.dtsi            |  262 ---
 arch/arm/boot/dts/ti/omap/omap2430-clocks.dtsi     |  341 ----
 arch/arm/boot/dts/ti/omap/omap2430-sdp.dts         |   70 -
 arch/arm/boot/dts/ti/omap/omap2430.dtsi            |  366 ----
 arch/arm/boot/dts/ti/omap/omap24xx-clocks.dtsi     | 1241 --------------
 arch/arm/common/Kconfig                            |   13 -
 arch/arm/common/Makefile                           |    4 -
 arch/arm/common/locomo.c                           |  886 ----------
 arch/arm/common/sa1111.c                           | 1413 ---------------
 arch/arm/common/scoop.c                            |  269 ---
 arch/arm/common/sharpsl_param.c                    |   63 -
 arch/arm/configs/am200epdkit_defconfig             |   91 -
 arch/arm/configs/assabet_defconfig                 |   57 -
 arch/arm/configs/collie_defconfig                  |   87 -
 arch/arm/configs/dove_defconfig                    |  134 --
 arch/arm/configs/footbridge_defconfig              |  114 --
 arch/arm/configs/h3600_defconfig                   |   63 -
 arch/arm/configs/imx_v6_v7_defconfig               |    1 -
 arch/arm/configs/imxrt_defconfig                   |   35 -
 arch/arm/configs/jornada720_defconfig              |   95 --
 arch/arm/configs/lpc18xx_defconfig                 |  158 --
 arch/arm/configs/mps2_defconfig                    |  102 --
 arch/arm/configs/mv78xx0_defconfig                 |  120 --
 arch/arm/configs/neponset_defconfig                |   88 -
 arch/arm/configs/netwinder_defconfig               |   88 -
 arch/arm/configs/omap2plus_defconfig               |    4 -
 arch/arm/configs/spitz_defconfig                   |  237 ---
 arch/arm/configs/stm32_defconfig                   |   80 -
 arch/arm/configs/vf610m4_defconfig                 |   39 -
 arch/arm/include/asm/cputype.h                     |    4 -
 arch/arm/include/asm/hardware/dec21285.h           |  138 --
 arch/arm/include/asm/hardware/locomo.h             |  217 ---
 arch/arm/include/asm/hardware/sa1111.h             |  442 -----
 arch/arm/include/asm/hardware/scoop.h              |   67 -
 arch/arm/include/asm/hardware/ssp.h                |   25 -
 arch/arm/include/asm/mach/pci.h                    |   86 -
 arch/arm/include/asm/mach/sharpsl_param.h          |   33 -
 arch/arm/include/asm/pci.h                         |    3 -
 arch/arm/include/debug/dc21285.S                   |   41 -
 arch/arm/include/debug/imx-uart.h                  |   10 -
 arch/arm/include/debug/sa1100.S                    |   67 -
 arch/arm/kernel/atags_parse.c                      |   18 -
 arch/arm/kernel/bios32.c                           |  254 ---
 arch/arm/kernel/head.S                             |   10 -
 arch/arm/mach-at91/Kconfig                         |   11 +-
 arch/arm/mach-at91/Makefile                        |    1 -
 arch/arm/mach-at91/samv7.c                         |   17 -
 arch/arm/mach-dove/Kconfig                         |   32 -
 arch/arm/mach-dove/Makefile                        |    7 -
 arch/arm/mach-dove/bridge-regs.h                   |   50 -
 arch/arm/mach-dove/cm-a510.c                       |   94 -
 arch/arm/mach-dove/common.c                        |  449 -----
 arch/arm/mach-dove/common.h                        |   46 -
 arch/arm/mach-dove/dove.h                          |  185 --
 arch/arm/mach-dove/irq.c                           |   81 -
 arch/arm/mach-dove/irqs.h                          |   89 -
 arch/arm/mach-dove/mpp.c                           |  159 --
 arch/arm/mach-dove/mpp.h                           |  197 ---
 arch/arm/mach-dove/pcie.c                          |  226 ---
 arch/arm/mach-dove/pm.h                            |   58 -
 arch/arm/mach-footbridge/Kconfig                   |   57 -
 arch/arm/mach-footbridge/Makefile                  |   18 -
 arch/arm/mach-footbridge/common.c                  |  280 ---
 arch/arm/mach-footbridge/common.h                  |   15 -
 arch/arm/mach-footbridge/dc21285-timer.c           |  136 --
 arch/arm/mach-footbridge/dc21285.c                 |  360 ----
 arch/arm/mach-footbridge/dma-isa.c                 |  230 ---
 arch/arm/mach-footbridge/ebsa285-pci.c             |   48 -
 arch/arm/mach-footbridge/ebsa285.c                 |  124 --
 arch/arm/mach-footbridge/include/mach/hardware.h   |   90 -
 arch/arm/mach-footbridge/include/mach/irqs.h       |   97 --
 arch/arm/mach-footbridge/include/mach/isa-dma.h    |   18 -
 arch/arm/mach-footbridge/include/mach/memory.h     |   26 -
 arch/arm/mach-footbridge/include/mach/uncompress.h |   34 -
 arch/arm/mach-footbridge/isa-irq.c                 |  177 --
 arch/arm/mach-footbridge/isa-rtc.c                 |   57 -
 arch/arm/mach-footbridge/isa-timer.c               |   36 -
 arch/arm/mach-footbridge/isa.c                     |   94 -
 arch/arm/mach-footbridge/netwinder-hw.c            |  772 ---------
 arch/arm/mach-footbridge/netwinder-pci.c           |   62 -
 arch/arm/mach-imx/Kconfig                          |   38 +-
 arch/arm/mach-imx/Makefile                         |    4 -
 arch/arm/mach-imx/common.h                         |    2 -
 arch/arm/mach-imx/cpu-imx31.c                      |   72 -
 arch/arm/mach-imx/mach-imx31.c                     |   18 -
 arch/arm/mach-imx/mach-imx7d-cm4.c                 |   18 -
 arch/arm/mach-imx/mach-imxrt.c                     |   19 -
 arch/arm/mach-imx/mach-vf610.c                     |    1 -
 arch/arm/mach-imx/mm-imx3.c                        |   44 -
 arch/arm/mach-lpc18xx/Makefile                     |    2 -
 arch/arm/mach-lpc18xx/board-dt.c                   |   19 -
 arch/arm/mach-mv78xx0/Kconfig                      |   27 -
 arch/arm/mach-mv78xx0/Makefile                     |    5 -
 arch/arm/mach-mv78xx0/bridge-regs.h                |   31 -
 arch/arm/mach-mv78xx0/buffalo-wxl-setup.c          |  183 --
 arch/arm/mach-mv78xx0/common.c                     |  444 -----
 arch/arm/mach-mv78xx0/common.h                     |   54 -
 arch/arm/mach-mv78xx0/irq.c                        |   69 -
 arch/arm/mach-mv78xx0/irqs.h                       |   87 -
 arch/arm/mach-mv78xx0/mpp.c                        |   34 -
 arch/arm/mach-mv78xx0/mpp.h                        |  337 ----
 arch/arm/mach-mv78xx0/mv78xx0.h                    |  134 --
 arch/arm/mach-mv78xx0/pcie.c                       |  280 ---
 arch/arm/mach-mvebu/Makefile                       |    2 -
 arch/arm/mach-omap2/Kconfig                        |   62 +-
 arch/arm/mach-omap2/Makefile                       |   63 +-
 arch/arm/mach-omap2/board-generic.c                |   34 -
 arch/arm/mach-omap2/board-n8x0.c                   |  512 ------
 arch/arm/mach-omap2/clkt2xxx_dpll.c                |   56 -
 arch/arm/mach-omap2/clkt2xxx_dpllcore.c            |  194 ---
 arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c       |  259 ---
 arch/arm/mach-omap2/clock.c                        |   12 +-
 arch/arm/mach-omap2/clock2xxx.h                    |   17 -
 arch/arm/mach-omap2/clockdomain.c                  |    4 +-
 arch/arm/mach-omap2/clockdomain.h                  |    5 -
 arch/arm/mach-omap2/clockdomains2420_data.c        |  154 --
 arch/arm/mach-omap2/clockdomains2430_data.c        |  181 --
 arch/arm/mach-omap2/clockdomains2xxx_3xxx_data.c   |   29 +-
 arch/arm/mach-omap2/cm-regbits-24xx.h              |   51 -
 arch/arm/mach-omap2/cm2xxx.c                       |  302 ----
 arch/arm/mach-omap2/cm2xxx.h                       |   60 -
 arch/arm/mach-omap2/cm_common.c                    |   12 -
 arch/arm/mach-omap2/common-board-devices.h         |   11 -
 arch/arm/mach-omap2/common.h                       |   12 -
 arch/arm/mach-omap2/control.h                      |   56 -
 arch/arm/mach-omap2/display.c                      |    4 +-
 arch/arm/mach-omap2/dma.c                          |   53 +-
 arch/arm/mach-omap2/fb.c                           |   14 +-
 arch/arm/mach-omap2/gpmc.h                         |   10 -
 arch/arm/mach-omap2/i2c.c                          |    2 +-
 arch/arm/mach-omap2/id.c                           |   87 +-
 arch/arm/mach-omap2/io.c                           |  140 +-
 arch/arm/mach-omap2/iomap.h                        |   46 -
 arch/arm/mach-omap2/l3_2xxx.h                      |   15 -
 arch/arm/mach-omap2/l4_2xxx.h                      |   19 -
 arch/arm/mach-omap2/mmc.h                          |   18 -
 arch/arm/mach-omap2/msdi.c                         |   75 -
 arch/arm/mach-omap2/omap2-restart.c                |   62 -
 arch/arm/mach-omap2/omap24xx.h                     |   73 -
 arch/arm/mach-omap2/omap_hwmod.c                   |   20 +-
 arch/arm/mach-omap2/omap_hwmod.h                   |    2 -
 arch/arm/mach-omap2/omap_hwmod_2420_data.c         |  402 -----
 arch/arm/mach-omap2/omap_hwmod_2430_data.c         |  606 -------
 .../mach-omap2/omap_hwmod_2xxx_interconnect_data.c |  256 ---
 arch/arm/mach-omap2/omap_hwmod_2xxx_ipblock_data.c |  668 --------
 arch/arm/mach-omap2/omap_hwmod_common_data.h       |   66 -
 arch/arm/mach-omap2/opp2420_data.c                 |  131 --
 arch/arm/mach-omap2/opp2430_data.c                 |  136 --
 arch/arm/mach-omap2/opp2xxx.h                      |  430 -----
 arch/arm/mach-omap2/pdata-quirks.c                 |   37 +-
 arch/arm/mach-omap2/pm.h                           |    5 -
 arch/arm/mach-omap2/powerdomain.h                  |    3 -
 arch/arm/mach-omap2/powerdomains2xxx_data.c        |  134 --
 arch/arm/mach-omap2/prcm-common.h                  |  147 --
 arch/arm/mach-omap2/prm-regbits-24xx.h             |   39 -
 arch/arm/mach-omap2/prm2xxx.c                      |  229 ---
 arch/arm/mach-omap2/prm2xxx.h                      |  128 --
 arch/arm/mach-omap2/prm2xxx_3xxx.c                 |    1 -
 arch/arm/mach-omap2/prm_common.c                   |   11 -
 arch/arm/mach-omap2/sdrc.h                         |   21 -
 arch/arm/mach-omap2/sdrc2xxx.c                     |  164 --
 arch/arm/mach-omap2/sleep24xx.S                    |   91 -
 arch/arm/mach-omap2/soc.h                          |   59 -
 arch/arm/mach-omap2/sram.c                         |  159 +-
 arch/arm/mach-omap2/sram.h                         |   32 -
 arch/arm/mach-omap2/sram242x.S                     |  317 ----
 arch/arm/mach-omap2/sram243x.S                     |  317 ----
 arch/arm/mach-omap2/usb-tusb6010.c                 |  217 ---
 arch/arm/mach-omap2/usb-tusb6010.h                 |   12 -
 arch/arm/mach-omap2/voltage.h                      |    1 -
 arch/arm/mach-omap2/voltagedomains2xxx_data.c      |   29 -
 arch/arm/mach-orion5x/Kconfig                      |   95 --
 arch/arm/mach-orion5x/Makefile                     |   13 +-
 arch/arm/mach-orion5x/board-d2net.c                |    2 -
 arch/arm/mach-orion5x/board-dt.c                   |    4 +-
 arch/arm/mach-orion5x/board-mss2.c                 |    1 -
 arch/arm/mach-orion5x/board-rd88f5182.c            |    1 -
 arch/arm/mach-orion5x/common.c                     |  238 +--
 arch/arm/mach-orion5x/common.h                     |   34 +-
 arch/arm/mach-orion5x/dns323-setup.c               |  757 --------
 arch/arm/mach-orion5x/irq.c                        |   51 -
 arch/arm/mach-orion5x/irqs.h                       |    9 -
 arch/arm/mach-orion5x/kurobox_pro-setup.c          |  407 -----
 arch/arm/mach-orion5x/mpp.c                        |   41 -
 arch/arm/mach-orion5x/mpp.h                        |  130 --
 arch/arm/mach-orion5x/mv2120-setup.c               |  256 ---
 arch/arm/mach-orion5x/net2big-setup.c              |  444 -----
 arch/arm/mach-orion5x/pci.c                        |  429 ++++-
 arch/arm/mach-orion5x/terastation_pro2-setup.c     |  366 ----
 arch/arm/mach-orion5x/ts209-setup.c                |  331 ----
 arch/arm/mach-orion5x/ts409-setup.c                |  329 ----
 arch/arm/mach-orion5x/ts78xx-fpga.h                |   42 -
 arch/arm/mach-orion5x/ts78xx-setup.c               |  574 -------
 arch/arm/mach-orion5x/tsx09-common.c               |  129 --
 arch/arm/mach-orion5x/tsx09-common.h               |   21 -
 arch/arm/mach-pxa/Kconfig                          |   89 -
 arch/arm/mach-pxa/Makefile                         |    8 -
 arch/arm/mach-pxa/am200epd.c                       |  395 -----
 arch/arm/mach-pxa/am300epd.c                       |  296 ----
 arch/arm/mach-pxa/devices.c                        |  705 --------
 arch/arm/mach-pxa/devices.h                        |   68 -
 arch/arm/mach-pxa/generic.h                        |    5 -
 arch/arm/mach-pxa/gumstix.c                        |  237 ---
 arch/arm/mach-pxa/gumstix.h                        |   89 -
 arch/arm/mach-pxa/pxa25x.c                         |   59 -
 arch/arm/mach-pxa/pxa27x.c                         |   77 -
 arch/arm/mach-pxa/pxa300.c                         |    1 -
 arch/arm/mach-pxa/pxa320.c                         |    1 -
 arch/arm/mach-pxa/pxa3xx.c                         |    6 -
 arch/arm/mach-pxa/sharpsl_pm.c                     |  941 ----------
 arch/arm/mach-pxa/sharpsl_pm.h                     |  108 --
 arch/arm/mach-pxa/spitz.c                          | 1174 -------------
 arch/arm/mach-pxa/spitz.h                          |  185 --
 arch/arm/mach-pxa/spitz_pm.c                       |  257 ---
 arch/arm/mach-sa1100/Kconfig                       |   92 -
 arch/arm/mach-sa1100/Makefile                      |   20 -
 arch/arm/mach-sa1100/assabet.c                     |  770 ---------
 arch/arm/mach-sa1100/clock.c                       |  145 --
 arch/arm/mach-sa1100/collie.c                      |  447 -----
 arch/arm/mach-sa1100/generic.c                     |  470 -----
 arch/arm/mach-sa1100/generic.h                     |   58 -
 arch/arm/mach-sa1100/h3600.c                       |  134 --
 arch/arm/mach-sa1100/h3xxx.c                       |  305 ----
 arch/arm/mach-sa1100/include/mach/SA-1100.h        | 1798 --------------------
 arch/arm/mach-sa1100/include/mach/assabet.h        |   99 --
 arch/arm/mach-sa1100/include/mach/bitfield.h       |  113 --
 arch/arm/mach-sa1100/include/mach/collie.h         |   94 -
 arch/arm/mach-sa1100/include/mach/generic.h        |    1 -
 arch/arm/mach-sa1100/include/mach/h3xxx.h          |   81 -
 arch/arm/mach-sa1100/include/mach/hardware.h       |   56 -
 arch/arm/mach-sa1100/include/mach/irqs.h           |  101 --
 arch/arm/mach-sa1100/include/mach/jornada720.h     |   28 -
 arch/arm/mach-sa1100/include/mach/memory.h         |   37 -
 arch/arm/mach-sa1100/include/mach/mtd-xip.h        |   23 -
 arch/arm/mach-sa1100/include/mach/neponset.h       |   31 -
 arch/arm/mach-sa1100/include/mach/reset.h          |   18 -
 arch/arm/mach-sa1100/include/mach/uncompress.h     |   52 -
 arch/arm/mach-sa1100/jornada720.c                  |  380 -----
 arch/arm/mach-sa1100/jornada720_ssp.c              |  202 ---
 arch/arm/mach-sa1100/neponset.c                    |  438 -----
 arch/arm/mach-sa1100/pm.c                          |  128 --
 arch/arm/mach-sa1100/sleep.S                       |  143 --
 arch/arm/mach-sa1100/ssp.c                         |  240 ---
 arch/arm/mach-stm32/Kconfig                        |   38 +-
 arch/arm/mach-stm32/board-dt.c                     |    7 -
 arch/arm/mach-versatile/Kconfig                    |   10 -
 arch/arm/mach-versatile/Makefile                   |    3 -
 arch/arm/mach-versatile/v2m-mps2.c                 |   17 -
 arch/arm/mm/Kconfig                                |    2 +-
 arch/arm/mm/init.c                                 |    5 -
 arch/arm/mm/ioremap.c                              |    1 -
 arch/arm/mm/mmu.c                                  |   16 -
 arch/arm/plat-orion/Makefile                       |    9 -
 arch/arm/plat-orion/common.c                       |  826 ---------
 arch/arm/plat-orion/gpio.c                         |  616 -------
 arch/arm/plat-orion/include/plat/addr-map.h        |   54 -
 arch/arm/plat-orion/include/plat/common.h          |  104 --
 arch/arm/plat-orion/include/plat/irq.h             |   15 -
 arch/arm/plat-orion/include/plat/mpp.h             |   34 -
 arch/arm/plat-orion/include/plat/orion-gpio.h      |   38 -
 arch/arm/plat-orion/include/plat/pcie.h            |   34 -
 arch/arm/plat-orion/include/plat/time.h            |   20 -
 arch/arm/plat-orion/irq.c                          |   39 -
 arch/arm/plat-orion/mpp.c                          |   82 -
 arch/arm/plat-orion/pcie.c                         |  288 ----
 arch/arm/plat-orion/time.c                         |  238 ---
 drivers/ata/Kconfig                                |    3 +-
 drivers/crypto/Kconfig                             |    2 +-
 drivers/i2c/busses/Kconfig                         |    2 +-
 drivers/media/platform/ti/omap/Kconfig             |    4 +-
 drivers/mmc/host/Kconfig                           |    2 +-
 drivers/mtd/nand/onenand/Kconfig                   |    4 +-
 drivers/pci/controller/Kconfig                     |    2 +-
 drivers/pci/controller/pci-mvebu.c                 |    5 -
 drivers/phy/marvell/Kconfig                        |    2 +-
 drivers/rtc/Kconfig                                |    8 +-
 drivers/rtc/rtc-sa1100.c                           |   17 +-
 drivers/soc/Makefile                               |    1 -
 drivers/soc/atmel/soc.c                            |   36 -
 drivers/soc/atmel/soc.h                            |   26 -
 drivers/thermal/Kconfig                            |    2 +-
 drivers/video/console/Kconfig                      |    6 +-
 drivers/video/console/dummycon.c                   |    6 -
 drivers/video/fbdev/cyber2000fb.c                  |   10 -
 drivers/video/fbdev/omap2/omapfb/Kconfig           |    2 +-
 drivers/watchdog/Kconfig                           |   14 +-
 include/linux/clk/ti.h                             |    8 -
 sound/soc/kirkwood/Kconfig                         |    2 +-
 370 files changed, 567 insertions(+), 54673 deletions(-)
 delete mode 100644 Documentation/arch/arm/netwinder.rst
 delete mode 100644 Documentation/arch/arm/sa1100/assabet.rst
 delete mode 100644 Documentation/arch/arm/sa1100/cerf.rst
 delete mode 100644 Documentation/arch/arm/sa1100/index.rst
 delete mode 100644 Documentation/arch/arm/sa1100/lart.rst
 delete mode 100644 Documentation/arch/arm/sa1100/serial_uart.rst
 delete mode 100644 Documentation/arch/arm/stm32/stm32f429-overview.rst
 delete mode 100644 Documentation/arch/arm/stm32/stm32f746-overview.rst
 delete mode 100644 Documentation/arch/arm/stm32/stm32f769-overview.rst
 delete mode 100644 Documentation/arch/arm/stm32/stm32h743-overview.rst
 delete mode 100644 Documentation/arch/arm/stm32/stm32h750-overview.rst
 delete mode 100644 arch/arm/boot/compressed/head-sa1100.S
 delete mode 100644 arch/arm/boot/compressed/head-sharpsl.S
 delete mode 100644 arch/arm/boot/dts/arm/mps2-an385.dts
 delete mode 100644 arch/arm/boot/dts/arm/mps2-an399.dts
 delete mode 100644 arch/arm/boot/dts/arm/mps2.dtsi
 delete mode 100644 arch/arm/boot/dts/nxp/imx/imx31-bug.dts
 delete mode 100644 arch/arm/boot/dts/nxp/imx/imx31-lite.dts
 delete mode 100644 arch/arm/boot/dts/nxp/imx/imx31.dtsi
 delete mode 100644 arch/arm/boot/dts/nxp/imx/imxrt1050-evk.dts
 delete mode 100644 arch/arm/boot/dts/nxp/imx/imxrt1050-pinfunc.h
 delete mode 100644 arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi
 delete mode 100644 arch/arm/boot/dts/nxp/imx/imxrt1170-pinfunc.h
 delete mode 100644 arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi
 delete mode 100644 arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dts
 delete mode 100644 arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dts
 delete mode 100644 arch/arm/boot/dts/nxp/lpc/lpc4350.dtsi
 delete mode 100644 arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dts
 delete mode 100644 arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts
 delete mode 100644 arch/arm/boot/dts/nxp/lpc/lpc4357.dtsi
 delete mode 100644 arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dts
 delete mode 100644 arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dts
 delete mode 100644 arch/arm/boot/dts/nxp/vf/vf610m4.dtsi
 delete mode 100644 arch/arm/boot/dts/st/stm32429i-eval.dts
 delete mode 100644 arch/arm/boot/dts/st/stm32746g-eval.dts
 delete mode 100644 arch/arm/boot/dts/st/stm32f4-pinctrl.dtsi
 delete mode 100644 arch/arm/boot/dts/st/stm32f429-disco.dts
 delete mode 100644 arch/arm/boot/dts/st/stm32f429-pinctrl.dtsi
 delete mode 100644 arch/arm/boot/dts/st/stm32f429.dtsi
 delete mode 100644 arch/arm/boot/dts/st/stm32f469-disco.dts
 delete mode 100644 arch/arm/boot/dts/st/stm32f469-pinctrl.dtsi
 delete mode 100644 arch/arm/boot/dts/st/stm32f469.dtsi
 delete mode 100644 arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi
 delete mode 100644 arch/arm/boot/dts/st/stm32f746-disco.dts
 delete mode 100644 arch/arm/boot/dts/st/stm32f746-pinctrl.dtsi
 delete mode 100644 arch/arm/boot/dts/st/stm32f746.dtsi
 delete mode 100644 arch/arm/boot/dts/st/stm32f769-disco-mb1166-reva09.dts
 delete mode 100644 arch/arm/boot/dts/st/stm32f769-disco.dts
 delete mode 100644 arch/arm/boot/dts/st/stm32f769-pinctrl.dtsi
 delete mode 100644 arch/arm/boot/dts/st/stm32f769.dtsi
 delete mode 100644 arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi
 delete mode 100644 arch/arm/boot/dts/st/stm32h743.dtsi
 delete mode 100644 arch/arm/boot/dts/st/stm32h743i-disco.dts
 delete mode 100644 arch/arm/boot/dts/st/stm32h743i-eval.dts
 delete mode 100644 arch/arm/boot/dts/st/stm32h747i-disco.dts
 delete mode 100644 arch/arm/boot/dts/st/stm32h750.dtsi
 delete mode 100644 arch/arm/boot/dts/st/stm32h750i-art-pi.dts
 delete mode 100644 arch/arm/boot/dts/ti/omap/omap2.dtsi
 delete mode 100644 arch/arm/boot/dts/ti/omap/omap2420-clocks.dtsi
 delete mode 100644 arch/arm/boot/dts/ti/omap/omap2420-h4.dts
 delete mode 100644 arch/arm/boot/dts/ti/omap/omap2420-n800.dts
 delete mode 100644 arch/arm/boot/dts/ti/omap/omap2420-n810-wimax.dts
 delete mode 100644 arch/arm/boot/dts/ti/omap/omap2420-n810.dts
 delete mode 100644 arch/arm/boot/dts/ti/omap/omap2420-n8x0-common.dtsi
 delete mode 100644 arch/arm/boot/dts/ti/omap/omap2420.dtsi
 delete mode 100644 arch/arm/boot/dts/ti/omap/omap2430-clocks.dtsi
 delete mode 100644 arch/arm/boot/dts/ti/omap/omap2430-sdp.dts
 delete mode 100644 arch/arm/boot/dts/ti/omap/omap2430.dtsi
 delete mode 100644 arch/arm/boot/dts/ti/omap/omap24xx-clocks.dtsi
 delete mode 100644 arch/arm/common/locomo.c
 delete mode 100644 arch/arm/common/sa1111.c
 delete mode 100644 arch/arm/common/scoop.c
 delete mode 100644 arch/arm/common/sharpsl_param.c
 delete mode 100644 arch/arm/configs/am200epdkit_defconfig
 delete mode 100644 arch/arm/configs/assabet_defconfig
 delete mode 100644 arch/arm/configs/collie_defconfig
 delete mode 100644 arch/arm/configs/dove_defconfig
 delete mode 100644 arch/arm/configs/footbridge_defconfig
 delete mode 100644 arch/arm/configs/h3600_defconfig
 delete mode 100644 arch/arm/configs/imxrt_defconfig
 delete mode 100644 arch/arm/configs/jornada720_defconfig
 delete mode 100644 arch/arm/configs/lpc18xx_defconfig
 delete mode 100644 arch/arm/configs/mps2_defconfig
 delete mode 100644 arch/arm/configs/mv78xx0_defconfig
 delete mode 100644 arch/arm/configs/neponset_defconfig
 delete mode 100644 arch/arm/configs/netwinder_defconfig
 delete mode 100644 arch/arm/configs/spitz_defconfig
 delete mode 100644 arch/arm/configs/stm32_defconfig
 delete mode 100644 arch/arm/configs/vf610m4_defconfig
 delete mode 100644 arch/arm/include/asm/hardware/dec21285.h
 delete mode 100644 arch/arm/include/asm/hardware/locomo.h
 delete mode 100644 arch/arm/include/asm/hardware/sa1111.h
 delete mode 100644 arch/arm/include/asm/hardware/scoop.h
 delete mode 100644 arch/arm/include/asm/hardware/ssp.h
 delete mode 100644 arch/arm/include/asm/mach/pci.h
 delete mode 100644 arch/arm/include/asm/mach/sharpsl_param.h
 delete mode 100644 arch/arm/include/debug/dc21285.S
 delete mode 100644 arch/arm/include/debug/sa1100.S
 delete mode 100644 arch/arm/mach-at91/samv7.c
 delete mode 100644 arch/arm/mach-dove/Kconfig
 delete mode 100644 arch/arm/mach-dove/Makefile
 delete mode 100644 arch/arm/mach-dove/bridge-regs.h
 delete mode 100644 arch/arm/mach-dove/cm-a510.c
 delete mode 100644 arch/arm/mach-dove/common.c
 delete mode 100644 arch/arm/mach-dove/common.h
 delete mode 100644 arch/arm/mach-dove/dove.h
 delete mode 100644 arch/arm/mach-dove/irq.c
 delete mode 100644 arch/arm/mach-dove/irqs.h
 delete mode 100644 arch/arm/mach-dove/mpp.c
 delete mode 100644 arch/arm/mach-dove/mpp.h
 delete mode 100644 arch/arm/mach-dove/pcie.c
 delete mode 100644 arch/arm/mach-dove/pm.h
 delete mode 100644 arch/arm/mach-footbridge/Kconfig
 delete mode 100644 arch/arm/mach-footbridge/Makefile
 delete mode 100644 arch/arm/mach-footbridge/common.c
 delete mode 100644 arch/arm/mach-footbridge/common.h
 delete mode 100644 arch/arm/mach-footbridge/dc21285-timer.c
 delete mode 100644 arch/arm/mach-footbridge/dc21285.c
 delete mode 100644 arch/arm/mach-footbridge/dma-isa.c
 delete mode 100644 arch/arm/mach-footbridge/ebsa285-pci.c
 delete mode 100644 arch/arm/mach-footbridge/ebsa285.c
 delete mode 100644 arch/arm/mach-footbridge/include/mach/hardware.h
 delete mode 100644 arch/arm/mach-footbridge/include/mach/irqs.h
 delete mode 100644 arch/arm/mach-footbridge/include/mach/isa-dma.h
 delete mode 100644 arch/arm/mach-footbridge/include/mach/memory.h
 delete mode 100644 arch/arm/mach-footbridge/include/mach/uncompress.h
 delete mode 100644 arch/arm/mach-footbridge/isa-irq.c
 delete mode 100644 arch/arm/mach-footbridge/isa-rtc.c
 delete mode 100644 arch/arm/mach-footbridge/isa-timer.c
 delete mode 100644 arch/arm/mach-footbridge/isa.c
 delete mode 100644 arch/arm/mach-footbridge/netwinder-hw.c
 delete mode 100644 arch/arm/mach-footbridge/netwinder-pci.c
 delete mode 100644 arch/arm/mach-imx/cpu-imx31.c
 delete mode 100644 arch/arm/mach-imx/mach-imx31.c
 delete mode 100644 arch/arm/mach-imx/mach-imx7d-cm4.c
 delete mode 100644 arch/arm/mach-imx/mach-imxrt.c
 delete mode 100644 arch/arm/mach-lpc18xx/Makefile
 delete mode 100644 arch/arm/mach-lpc18xx/board-dt.c
 delete mode 100644 arch/arm/mach-mv78xx0/Kconfig
 delete mode 100644 arch/arm/mach-mv78xx0/Makefile
 delete mode 100644 arch/arm/mach-mv78xx0/bridge-regs.h
 delete mode 100644 arch/arm/mach-mv78xx0/buffalo-wxl-setup.c
 delete mode 100644 arch/arm/mach-mv78xx0/common.c
 delete mode 100644 arch/arm/mach-mv78xx0/common.h
 delete mode 100644 arch/arm/mach-mv78xx0/irq.c
 delete mode 100644 arch/arm/mach-mv78xx0/irqs.h
 delete mode 100644 arch/arm/mach-mv78xx0/mpp.c
 delete mode 100644 arch/arm/mach-mv78xx0/mpp.h
 delete mode 100644 arch/arm/mach-mv78xx0/mv78xx0.h
 delete mode 100644 arch/arm/mach-mv78xx0/pcie.c
 delete mode 100644 arch/arm/mach-omap2/board-n8x0.c
 delete mode 100644 arch/arm/mach-omap2/clkt2xxx_dpll.c
 delete mode 100644 arch/arm/mach-omap2/clkt2xxx_dpllcore.c
 delete mode 100644 arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c
 delete mode 100644 arch/arm/mach-omap2/clock2xxx.h
 delete mode 100644 arch/arm/mach-omap2/clockdomains2420_data.c
 delete mode 100644 arch/arm/mach-omap2/clockdomains2430_data.c
 delete mode 100644 arch/arm/mach-omap2/cm-regbits-24xx.h
 delete mode 100644 arch/arm/mach-omap2/cm2xxx.c
 delete mode 100644 arch/arm/mach-omap2/cm2xxx.h
 delete mode 100644 arch/arm/mach-omap2/common-board-devices.h
 delete mode 100644 arch/arm/mach-omap2/gpmc.h
 delete mode 100644 arch/arm/mach-omap2/l3_2xxx.h
 delete mode 100644 arch/arm/mach-omap2/l4_2xxx.h
 delete mode 100644 arch/arm/mach-omap2/mmc.h
 delete mode 100644 arch/arm/mach-omap2/msdi.c
 delete mode 100644 arch/arm/mach-omap2/omap2-restart.c
 delete mode 100644 arch/arm/mach-omap2/omap24xx.h
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_2420_data.c
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_2430_data.c
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_2xxx_interconnect_data.c
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_2xxx_ipblock_data.c
 delete mode 100644 arch/arm/mach-omap2/opp2420_data.c
 delete mode 100644 arch/arm/mach-omap2/opp2430_data.c
 delete mode 100644 arch/arm/mach-omap2/opp2xxx.h
 delete mode 100644 arch/arm/mach-omap2/powerdomains2xxx_data.c
 delete mode 100644 arch/arm/mach-omap2/prm-regbits-24xx.h
 delete mode 100644 arch/arm/mach-omap2/prm2xxx.c
 delete mode 100644 arch/arm/mach-omap2/prm2xxx.h
 delete mode 100644 arch/arm/mach-omap2/sdrc2xxx.c
 delete mode 100644 arch/arm/mach-omap2/sleep24xx.S
 delete mode 100644 arch/arm/mach-omap2/sram242x.S
 delete mode 100644 arch/arm/mach-omap2/sram243x.S
 delete mode 100644 arch/arm/mach-omap2/usb-tusb6010.c
 delete mode 100644 arch/arm/mach-omap2/usb-tusb6010.h
 delete mode 100644 arch/arm/mach-omap2/voltagedomains2xxx_data.c
 delete mode 100644 arch/arm/mach-orion5x/dns323-setup.c
 delete mode 100644 arch/arm/mach-orion5x/irq.c
 delete mode 100644 arch/arm/mach-orion5x/kurobox_pro-setup.c
 delete mode 100644 arch/arm/mach-orion5x/mpp.c
 delete mode 100644 arch/arm/mach-orion5x/mpp.h
 delete mode 100644 arch/arm/mach-orion5x/mv2120-setup.c
 delete mode 100644 arch/arm/mach-orion5x/net2big-setup.c
 delete mode 100644 arch/arm/mach-orion5x/terastation_pro2-setup.c
 delete mode 100644 arch/arm/mach-orion5x/ts209-setup.c
 delete mode 100644 arch/arm/mach-orion5x/ts409-setup.c
 delete mode 100644 arch/arm/mach-orion5x/ts78xx-fpga.h
 delete mode 100644 arch/arm/mach-orion5x/ts78xx-setup.c
 delete mode 100644 arch/arm/mach-orion5x/tsx09-common.c
 delete mode 100644 arch/arm/mach-orion5x/tsx09-common.h
 delete mode 100644 arch/arm/mach-pxa/am200epd.c
 delete mode 100644 arch/arm/mach-pxa/am300epd.c
 delete mode 100644 arch/arm/mach-pxa/devices.h
 delete mode 100644 arch/arm/mach-pxa/gumstix.c
 delete mode 100644 arch/arm/mach-pxa/gumstix.h
 delete mode 100644 arch/arm/mach-pxa/sharpsl_pm.c
 delete mode 100644 arch/arm/mach-pxa/sharpsl_pm.h
 delete mode 100644 arch/arm/mach-pxa/spitz.c
 delete mode 100644 arch/arm/mach-pxa/spitz.h
 delete mode 100644 arch/arm/mach-pxa/spitz_pm.c
 delete mode 100644 arch/arm/mach-sa1100/Kconfig
 delete mode 100644 arch/arm/mach-sa1100/Makefile
 delete mode 100644 arch/arm/mach-sa1100/assabet.c
 delete mode 100644 arch/arm/mach-sa1100/clock.c
 delete mode 100644 arch/arm/mach-sa1100/collie.c
 delete mode 100644 arch/arm/mach-sa1100/generic.c
 delete mode 100644 arch/arm/mach-sa1100/generic.h
 delete mode 100644 arch/arm/mach-sa1100/h3600.c
 delete mode 100644 arch/arm/mach-sa1100/h3xxx.c
 delete mode 100644 arch/arm/mach-sa1100/include/mach/SA-1100.h
 delete mode 100644 arch/arm/mach-sa1100/include/mach/assabet.h
 delete mode 100644 arch/arm/mach-sa1100/include/mach/bitfield.h
 delete mode 100644 arch/arm/mach-sa1100/include/mach/collie.h
 delete mode 100644 arch/arm/mach-sa1100/include/mach/generic.h
 delete mode 100644 arch/arm/mach-sa1100/include/mach/h3xxx.h
 delete mode 100644 arch/arm/mach-sa1100/include/mach/hardware.h
 delete mode 100644 arch/arm/mach-sa1100/include/mach/irqs.h
 delete mode 100644 arch/arm/mach-sa1100/include/mach/jornada720.h
 delete mode 100644 arch/arm/mach-sa1100/include/mach/memory.h
 delete mode 100644 arch/arm/mach-sa1100/include/mach/mtd-xip.h
 delete mode 100644 arch/arm/mach-sa1100/include/mach/neponset.h
 delete mode 100644 arch/arm/mach-sa1100/include/mach/reset.h
 delete mode 100644 arch/arm/mach-sa1100/include/mach/uncompress.h
 delete mode 100644 arch/arm/mach-sa1100/jornada720.c
 delete mode 100644 arch/arm/mach-sa1100/jornada720_ssp.c
 delete mode 100644 arch/arm/mach-sa1100/neponset.c
 delete mode 100644 arch/arm/mach-sa1100/pm.c
 delete mode 100644 arch/arm/mach-sa1100/sleep.S
 delete mode 100644 arch/arm/mach-sa1100/ssp.c
 delete mode 100644 arch/arm/mach-versatile/v2m-mps2.c
 delete mode 100644 arch/arm/plat-orion/Makefile
 delete mode 100644 arch/arm/plat-orion/common.c
 delete mode 100644 arch/arm/plat-orion/gpio.c
 delete mode 100644 arch/arm/plat-orion/include/plat/addr-map.h
 delete mode 100644 arch/arm/plat-orion/include/plat/common.h
 delete mode 100644 arch/arm/plat-orion/include/plat/irq.h
 delete mode 100644 arch/arm/plat-orion/include/plat/mpp.h
 delete mode 100644 arch/arm/plat-orion/include/plat/orion-gpio.h
 delete mode 100644 arch/arm/plat-orion/include/plat/pcie.h
 delete mode 100644 arch/arm/plat-orion/include/plat/time.h
 delete mode 100644 arch/arm/plat-orion/irq.c
 delete mode 100644 arch/arm/plat-orion/mpp.c
 delete mode 100644 arch/arm/plat-orion/pcie.c
 delete mode 100644 arch/arm/plat-orion/time.c
