Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659067;
	b=JiA3RLJWpILAoBwE8wgJLFCpu4dsEQfPldIkcTW8kV0Uvm2zbOgSu5udeaaxNQJr24mg
	 eAFvZ/qJxu91vQ+Mv3/3OBzkaAwdEXD97lpli6Y8riMeSUcm+utf8LxkvF59Msljt2cgU
	 l8jKQSHv3ZGXNj0WXvxfWM/L4Zvm/JRBjS53BhIF9tBVw2GyIGCbYC0bBAkH7txtj2KBb
	 bFK3Ae/D+J1gd/hc+NNhXYGamb0k8oIXcHY916UxgkKKkPlV0YpSb1WNHv2RFIL0k8MAP
	 Ly5n6Hgy8O95MdzPXu5gjqCetUhmbFYoG389et+21LqPgwuuShCWvODhlYNuMJGdVHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659067;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=1O40GCup6HzaOAZ4OVxNc28a0mG3E5YYQb+ztSbBa3M=;
	b=Vb1TyaeBatrTGnsaOknAe+jms6sktoi0cXnycpnnGWbxyKK5zJ2NluoVJ7UPkNG2FL5r
	 zKljSBg6G83qniM4kA4Lksu2MxQyKKEI9Jpyk0dBVvjtrfkkcuNRkHlaQTl7M8/b/fyfG
	 rWztygEjV8+wQospxeC8ioJhi4mHH6ONVuHKLiHDK7lA4vMU/PQNYXc5m0zVXj8CFK5xo
	 O+gOg2ObEGed2pTSPFaE2hhQgNDSRGmwhdN/6q3Z6BPpFUU+/v+fBwzIo7bBIyMwuI+53
	 fjHwdwNc5/q/jAcVOe5tRTWxOC2yeznPxKv5Q9Xq1vrGnetqkhCFJo66/hoMgYy1qcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=PzoUFO41;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b="ckSaFE2/";
	arc=none smtp.remote-ip=103.168.172.146
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD323606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD323606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=PzoUFO41;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ckSaFE2/
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id DCD50EC0221
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:51:04 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 22 Oct 2026 04:51:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792659062;
	 x=1792745462; bh=1O40GCup6HzaOAZ4OVxNc28a0mG3E5YYQb+ztSbBa3M=; b=
	PzoUFO417jTIF6L4PtEDc5MNXJI7PTjSelz1z6JHzC3vxFtO2dc8tn0gbdjxpJqF
	QHoblNarLJ8FTARg4kJanklwGay9EMJeyBi9UW9Gm6/AFZz3IH/gf0tAWKboxZOR
	BWgzcm5PjJ9rM+AQV7XK+epJMV+KddpPkRygyBmyfTB9L49fATyu/jB1mEfVmt2H
	+OrBiAnYyk0gYvRnKrQ1wMEi2qDj1J+0huUnUcmoPFRPnzh2tEAdBsZmetUSUQs/
	C8L5c288Ah+aE13e3P70urAYjgrzQaGHtOzghVexLe6dYNvZ7DEOFHfnaPdFaFSq
	HsRJ6ndwdgdL30eCtIwckQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792659062; x=
	1792745462; bh=1O40GCup6HzaOAZ4OVxNc28a0mG3E5YYQb+ztSbBa3M=; b=c
	kSaFE2/V5RzfNRpeDD4yibLHXGMSfWapuWTYKiMr7pVVMc5tQ/jx2TSXIOyeeBBb
	DPuuf4W7tkOTJOhsnYDaKg3k5UYfgYsWpun9aJ/A/l+Ch+CrXXC30tsyaigc2zYq
	v8ubpkk0z2S6jKCWWoXSWmypa1b/WEoupaTNeuHoaprvbl0b3g6eMyit+HOAsTSn
	tf4ZrOGjMsY0XcXeX2+c+7pTwLp3eqDofw+UP/3YyDvf4szIzGxP2Dc9VoEdzPBD
	n2A99yfRrw5KdQNEBj+dC6zp6QaFjMWgW90T9zshhKfFFV5wD486q7NmA5vAz9dh
	xvuXV+DfurEGrGIcaJ9PQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792659062; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:P9TQ21DOD5pAEiqMYWTOm0nwLmSFBmh4MDiM/bq2PFOKLQO
	Y1minbORlwzWIAXAYsPVrf8KdRCOnRpLTYxCJOjH8xz85UpbgO6yp+two6hfN516
	0Gogp42qYIC8wMFreDb5ZKofe/3qIlRjx82gfegvsrHfA3qzUaPhq2jgm9KVlkDy
	uUT3IvtkW56CReJtPHAXJlQM/htHpPRElVgg305OAGGLJy0lhjnlg8MZqRX5JHEQ
	WC2z/RUcFVqaI1fYK+F4DHGxQ1h4ieNz8kcU/St+j4C0Mk5qgmTA6KUaUzdQKnuT
	MhyOk3R9xsPxaFx2QV8wu8JA8YkANFDS8PRMUdQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:3Grq4s7RLgrxiCRbBmd+J1StRYwIUsKZL9qP66DZv2U=:VaG/KeOkND8zSL2OPyogdS6liQT8OS7MH1dDmMlujF4=;
X-ME-Sender: <xms:c87ZarXMte-kWnKKAmNWXhlESGmCXb7ZWwNrS0Fchz2aVYzNVOWn-Q>
    <xme:c87Zauaave7ow7tw_hFFLB2aZBHw-27GMcOl-L0uYJ_1_N7SZsICbymvQ_71ZYJqV
    5iEZsxdeGj8BodVYeGEfQiUqa3XFqgXGzHXhDTdGlC-_C4iZvlwXXYM>
X-ME-Proxy-Cause: dmFkZTGPY073YGt+iWztIx1mCyHl4hb9Cx7FGiezTLT/JBYFQUOGJcZqg5l6swM37SFEC4
    mdvJBSQAmf2AxKneQHB6+9Y1FXUbLOmapBpUW52h6E4T8HslnY+IjqHcSW9YRo8wqOxKQg
    gDKB0T/2qtKhxFbgqs1lI+GLnS2iOvFJv/9J9cReHrtP+V4UqHWh2FOVKVHL4TiFNRIAHL
    AWKohzFigHQ9VjRNV0APoYYJJ85/zx44qcuZdrbmLciFefGidxGKwYQQNCaWBBGt2u53+B
    fE0huUjbTP0bLRGEhepatBecIEU76shX12jBlVux0qFamNc/B5qH4iOCOPg0wG/m9NxXQd
    7S2A7l8fUglnW6jKXyRBz2kqzC7ThSxtyGA/ypu0ZQhEEWrYbki11SvEjc5CpLV8V+wsMJ
    LtUgYM82PJP8FnXWZUk8r9iaxQxVlUTzIjvAzVCmEE2DGhJ06Rg2U4BvfBJeaTZ8i2yg+V
    dXZyXTg3NhQk0tx4agI1swxoHDdV4hEaeGTyuIdeqsloP6GQoW9hbal8QywbB8IvST1RX6
    wtLCVo7Dhuuw7k6jWLeOuIBmSPcyTLeUGP6OEDOQwW15g7shOEm5cbuSEVmHUGDlvMNhXK
    JGzsMoQr5mS5J9pgl0ks7FXCHB1b1Ss0ktwVkhYpyBOxbhZE/w4KB62v5OHA
X-ME-Proxy: <xmx:dc7ZatBlc1OL2NK8usqz9AJUlJw52tjeDIcC7auYHpuVx4N3cpPLRQ>
    <xmx:dc7ZaiYgiIz7UuJbx80nQWR1FpFEM0uXoGyUvC6yhsRIbTgLmezDgw>
    <xmx:dc7Zag5n8lynTERWthx1IlxzUP6kbdCgPFeCnbPM584_Rcw0oSyxgQ>
    <xmx:dc7ZajafVQZtFFAO5ez7LYXAJyP1u7cSCuVnAgTKjyUOiijlcmnO4g>
    <xmx:ds7ZaopoqLn4B-mmCDRPRVrImdCpXsaT9iK8mS7OwlGyAaOoOQGybJs3>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id E59C132A0098; Thu, 22 Oct 2026 04:50:59 -0400 (EDT)
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
Date: Thu, 22 Oct 2026 10:50:39 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <417575f9-464e-4966-b051-5ecb122bcb10@app.fastmail.com>
In-Reply-To: <6c776ba1-f114-44c3-96ee-938dcd7ac82d@app.fastmail.com>
References: <6c776ba1-f114-44c3-96ee-938dcd7ac82d@app.fastmail.com>
Subject: [GIT PULL 1/4] soc: devicetree updates for 7.4 
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b=
935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-d=
t-7.4

for you to fetch changes up to 15644868ad522eac914d368fd08c340051f1076c:

  Merge tag 'tegra-for-7.4-arm64-dt' of git://git.kernel.org/pub/scm/lin=
ux/kernel/git/tegra/linux into soc/dt (2026-10-16 18:47:58 +0200)

----------------------------------------------------------------
soc: devicetree updates for 7.4

This is a rather large update of over 1000 non-merge commits touching
devicetree files and bindings.

A few notable SoC were added this time:

 - Apple M4 and A18 Pro are used in laptops, these follow the M3 model
   added in 7.2.

 - Google Laguna (aka Tensor G5) is used last year's Pixel phone
   generation. Unlike the earlier Tensor chips, this is not based
   on Samsung's Exynos family design but starts a new chip family.

 - Qualcomm's Hawi and Nord SoCs are two powerful chips using the
   custom Oryon cores. Product names and applications are so far
   not known, which means that Qualcomm is doing something right
   by upstreaming kernel support early.

The ST stm32mp23xc/stm32mp25xc SoC support was previously removed because
there were no users upstream, but they are back now that boards have
shown up. Renesas RZ/G2M v3.0 (R8A774A3) is just a minor variation of
the already supported SoC.

In total, there are 81 new dts files for individual boards, and they are
all over the place. Only one riscv based machine is added, the Milk-V
Meles SBC using the T-Head th1520 chip. For 32-bit Arm, we have 13 new
boards. About half are industrial embedded boards using NXP i.MX6/7
chips, the rest are older products: two Amazon tablets, two Motorola
phones and two SoM boards.

Everything else is 64-bit Arm:

 - many industrial embedded boards using NXP layerscape, NXP i.MX8/9,
   Qualcomm Hamoa, ST stm32mp2, Rockchip rk35xx, and Renesas RZ/G2
   SoCs

 - Laptops and tablets using Apple M4, Qualcomm Snapdragon X2,
   Snapdragon X1 Elite and Allwinner A133 chips

 - Valve Steam Frame VR headset using Snapdragon 8 Gen 3

 - Seven handheld game consoles using Qualcomm Dragonwing qcs8550

 - Mobile phones using Google Tensor G5, Samsung Exynos 850,
   and various Qualcomm Snapdragon chips

Aside from the new stuff, there is still a lot going on for existing
socs and boards, including GPU hardware support on MediaTek MT8173
based laptops. Most patches actually add features this time, as the
compile-time diagnostic changes are slowing down.

----------------------------------------------------------------
Aaron Kling (8):
      arm64: tegra: Enable DMA Support on Tegra194 QSPI
      dt-bindings: vendor-prefixes: Add Chip Wealth Technology
      dt-bindings: arm: qcom: Add AYN QCS8550 Devices
      dt-bindings: vendor-prefixes: Add Retroid Pocket
      dt-bindings: arm: qcom: Add Retroid Pocket QCS8550 Devices
      arm64: dts: qcom: qcs8550: Add Retroid Pocket 6
      arm64: dts: qcom: qcs8550: Add Retroid Pocket Nova
      dt-bindings: soc: tegra: pmc: Document Tegra210B01

Aastha Pandey (1):
      arm64: dts: qcom: shikra: Add GPU cooling

Abel Vesa (38):
      arm64: dts: qcom: glymur-crd: Mark the EC reset gpio as reserved
      arm64: dts: qcom: eliza: Add GPU SMMU node
      arm64: dts: qcom: eliza: Describe the CDSP remoteproc
      arm64: dts: qcom: eliza-mtp: Enable CDSP remoteproc
      arm64: dts: qcom: eliza-cqs-som: Enable CDSP remoteproc
      arm64: dts: qcom: eliza-evk: Add power and volume keys
      arm64: dts: qcom: eliza-mtp: Add support for SD card
      arm64: dts: qcom: eliza-cqs-som: Enable Adreno A722 GPU
      arm64: dts: qcom: eliza: Connect USB3 PHY pipe clock to GCC
      arm64: dts: qcom: x1-crd: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e001de-devkit: Mark the EC reset gpio as reser=
ved
      arm64: dts: qcom: x1e78100-t14s: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e80100-dell-xps13-9345: Mark the EC reset gpio=
 as reserved
      arm64: dts: qcom: honor-magicbook-art-14: Mark the EC reset gpio a=
s reserved
      arm64: dts: qcom: x1e80100-yoga-slim7x: Mark the EC reset gpio as =
reserved
      arm64: dts: qcom: medion-sprchrgd-14-s1: Mark the EC reset gpio as=
 reserved
      arm64: dts: qcom: x1e80100-qcp: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1-asus-vivobook-s15: Mark the EC reset gpio as =
reserved
      arm64: dts: qcom: x1-asus-zenbook-a14: Mark the EC reset gpio as r=
eserved
      arm64: dts: qcom: x1-dell-thena: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1-hp-omnibook-x14: Mark the EC reset gpio as re=
served
      arm64: dts: qcom: x1p42100-thinkbook-16: Mark the EC reset gpio as=
 reserved
      arm64: dts: qcom: sm8150: Use SM8150_CX for the SDHC power domain
      arm64: dts: qcom: kaanapali: Add GCC CX power domain
      arm64: dts: qcom: monaco: Add GCC CX power domain
      arm64: dts: qcom: sar2130p: Add GCC CX power domain
      arm64: dts: qcom: sdm670: Add GCC CX power domain
      arm64: dts: qcom: sdx75: Add GCC CX power domain
      arm64: dts: qcom: sm4450: Add GCC CX power domain
      arm64: dts: qcom: sm6350: Add GCC CX power domain
      arm64: dts: qcom: sm8150: Add GCC CX power domain
      arm64: dts: qcom: sm8250: Add GCC CX power domain
      arm64: dts: qcom: sm8350: Add GCC CX power domain
      arm64: dts: qcom: sm8450: Add GCC CX power domain
      arm64: dts: qcom: sm8550: Add GCC CX power domain
      arm64: dts: qcom: sm8650: Add GCC CX power domain
      arm64: dts: qcom: sm8750: Add GCC CX power domain
      arm64: dts: qcom: talos: Add GCC CX power domain

Abhishek Thomas Varghese (1):
      arm64: dts: qcom: talos: Add RPi Touch Display 2 5-inch overlay

Adam Skladowski (7):
      dt-bindings: vendor-prefixes: Add LeEco
      dt-bindings: arm: qcom: Document Motorola Moto One
      dt-bindings: arm: qcom: Document LeEco Le2
      dt-bindings: arm: qcom: Document Xiaomi Redmi 9T
      arm64: dts: qcom: msm8953: Add Motorola One
      arm64: dts: qcom: msm8976: Add LeEco Le2
      arm64: dts: qcom: sm6115: Add Xiaomi Redmi 9T

Adam Wermuth (1):
      arm64: dts: rockchip: Add PWM fan to Radxa ROCK 3B

Aditya Sherawat (2):
      arm64: dts: qcom: shikra: Add A704 GPU support
      arm64: dts: qcom: shikra-evk: Enable A704 GPU

Ahmad Fatoum (3):
      ARM: dts: stm32: lxa-mc1: change stdout-path baud rate from 9600 t=
o 115200
      ARM: dts: stm32: lxa-tac: change stdout-path baud rate from 9600 t=
o 115200
      ARM: dts: stm32: fairytux2: change stdout-path baud rate from 9600=
 to 115200

Akashdeep Kaur (1):
      arm64: dts: ti: k3-pinctrl: Add virtual GPIO select mux macros

Akhil P Oommen (3):
      arm64: dts: qcom: Add GPU support for Kaanapali
      arm64: dts: qcom: kaanapali-mtp: Enable GPU
      arm64: dts: qcom: kaanapali-qrd: Enable GPU

Alain Volmat (9):
      ARM: dts: stm32: add LTDC / DCMIPP access controller for STM32MP135
      ARM: dts: stm32: Use DMA FIFO mode for all spi in stm32mp151
      ARM: dts: stm32: Add disabled spi4 and spi5 in stm32mp15xx-dkx
      arm64: dts: st: add imx335/csi/dcmipp nodes on stm32mp257f-dk
      arm64: dts: st: ensure IMX335 is enabled on stm32mp257f-ev1
      arm64: dts: st: use video-interfaces media bus type in stm32mp257f=
-ev1
      arm64: dts: st: add imx335/csi/dcmipp nodes on stm32mp235f-dk
      arm64: dts: st: add dcmi node on stm32mp25x
      arm64: dts: st: add dcmi node on stm32mp23x

Aleksander Jan Bajkowski (1):
      arm64: dts: allwinner: h5: OrangePi PC2: add ethernet LEDs

Alex Elder (6):
      arm64: dts: qcom: qcs6490-rb3gen2: clean up PCI function nodes
      arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: clean up P=
CI function nodes
      arm64: dts: qcom: lemans-evk-ifp-mezzanine: clean up PCI function =
nodes
      arm64: dts: qcom: monaco-evk-ifp-mezzanine: clean up PCI function =
nodes
      arm64: dts: qcom: qcs6490-thundercomm-minipc-g1iot: clean up PCI f=
unction nodes
      arm64: dts: qcom: qcs8550-rb5gen2: clean up PCI function nodes

Alexander Stein (3):
      ARM: dts: mba6ulx: Add Ethernet PHY interrupt support
      ARM: dts: mba6ulx: Add USB hub node
      arm64: dts: imx95-tqma9596sa: Add thermal zones

Alexandre Belloni (30):
      Merge tag 'stm32-dt-for-v7.4-1' of git://git.kernel.org/pub/scm/li=
nux/kernel/git/atorgue/stm32 into soc/dt
      Merge tag 'imx-dt-7.4' of https://git.kernel.org/pub/scm/linux/ker=
nel/git/frank.li/linux into soc/dt
      Merge tag 'imx-dt64-7.4' of https://git.kernel.org/pub/scm/linux/k=
ernel/git/frank.li/linux into soc/dt
      Merge tag 'mvebu-dt64-7.4-1' of git://git.kernel.org/pub/scm/linux=
/kernel/git/gclement/mvebu into soc/dt
      Merge tag 'v7.4-rockchip-dts64-2' of https://git.kernel.org/pub/sc=
m/linux/kernel/git/mmind/linux-rockchip into soc/dt
      Merge tag 'google-lga-7.4' of https://git.kernel.org/pub/scm/linux=
/kernel/git/krzk/linux into soc/dt
      Merge tag 'samsung-dt64-7.4' of https://git.kernel.org/pub/scm/lin=
ux/kernel/git/krzk/linux into soc/dt
      Merge tag 'samsung-dt-7.4' of https://git.kernel.org/pub/scm/linux=
/kernel/git/krzk/linux into soc/dt
      Merge tag 'dt64-cleanup-7.4' of https://git.kernel.org/pub/scm/lin=
ux/kernel/git/krzk/linux-dt into soc/dt
      Merge tag 'dt-cleanup-7.4' of https://git.kernel.org/pub/scm/linux=
/kernel/git/krzk/linux-dt into soc/dt
      Merge tag 'renesas-dts-for-v7.4-tag2' of git://git.kernel.org/pub/=
scm/linux/kernel/git/geert/renesas-devel into soc/dt
      Merge tag 'apple-soc-dt-7.4' of https://git.kernel.org/pub/scm/lin=
ux/kernel/git/sven/linux into soc/dt
      Merge tag 'arm-soc/for-7.4/devicetree-arm64' of https://github.com=
/Broadcom/stblinux into soc/dt
      Merge tag 'tegra-for-7.4-dt-bindings' of git://git.kernel.org/pub/=
scm/linux/kernel/git/tegra/linux into soc/dt
      Merge tag 'ti-k3-dt-for-v7.4' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/ti/linux into soc/dt
      Merge tag 'ti-keystone-dt-for-v7.4' of https://git.kernel.org/pub/=
scm/linux/kernel/git/ti/linux into soc/dt
      Merge tag 'ux500-dts-for-7.4-2' of git://git.kernel.org/pub/scm/li=
nux/kernel/git/linusw/linux-nomadik into soc/dt
      Merge tag 'amlogic-arm64-dt-for-v7.4' of https://git.kernel.org/pu=
b/scm/linux/kernel/git/amlogic/linux into soc/dt
      Merge tag 'sunxi-dt-for-7.4' of https://git.kernel.org/pub/scm/lin=
ux/kernel/git/sunxi/linux into soc/dt
      Merge tag 'nuvoton-arm64-7.4-devicetree-0' of https://git.kernel.o=
rg/pub/scm/linux/kernel/git/bmc/linux into soc/dt
      Merge tag 'microchip-dt64-7.4' of https://git.kernel.org/pub/scm/l=
inux/kernel/git/at91/linux into soc/dt
      Merge tag 'mvebu-dt-7.4-2' of git://git.kernel.org/pub/scm/linux/k=
ernel/git/gclement/mvebu into soc/dt
      Merge tag 'v7.4-rockchip-dts64-3' of https://git.kernel.org/pub/sc=
m/linux/kernel/git/mmind/linux-rockchip into soc/dt
      Merge tag 'zynqmp-dt-for-7.4' of https://github.com/Xilinx/linux-x=
lnx into soc/dt
      Merge tag 'qcom-arm32-for-7.4' of https://git.kernel.org/pub/scm/l=
inux/kernel/git/qcom/linux into soc/dt
      Merge tag 'qcom-arm64-for-7.4-2' of https://git.kernel.org/pub/scm=
/linux/kernel/git/qcom/linux into soc/dt
      Merge tag 'thead-dt-for-v7.4' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/fustini/linux into soc/dt
      Merge tag 'spacemit-dt-for-7.4-1' of https://git.kernel.org/pub/sc=
m/linux/kernel/git/spacemit/linux into soc/dt
      Merge tag 'riscv-sophgo-dt-for-v7.4' of https://github.com/sophgo/=
linux into soc/dt
      Merge tag 'riscv-dt-for-v7.4' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/conor/linux into soc/dt

Alexandre Hamamdjian (3):
      dt-bindings: arm: qcom: document the Ayaneo Pocket DS
      arm64: dts: qcom: sm8550: add UART11 node
      arm64: dts: qcom: qcs8550-ayaneo-pocket-ds: add the lower DSI panel

Alexey Charkov (1):
      arm64: dts: rockchip: Set gpioN aliases on RK3576

Alexey Klimov (2):
      arm64: dts: exynos850: Add ap2apm mailbox
      arm64: dts: exynos850: Add acpm SRAM node

Amelie Delaunay (5):
      arm64: dts: st: reorder ommanager node in stm32mp257f-ev1.dts
      ARM: dts: stm32: reorder cs_cti_trace node in stm32mp135f-dk.dts
      ARM: dts: stm32: reorder cs_cti_trace node in stm32mp15xx-dkx.dtsi
      ARM: dts: stm32: reorder cs_cti_trace node in stm32mp157c-ev1.dts
      ARM: dts: stm32: reorder mdma1 node in stm32mp15*-scmi.dts

Amin Gattout (6):
      arm64: dts: rockchip: correct rk3576 SDGMAC GRF reg size
      dt-bindings: soc: rockchip: add rk3576 csidphy grf syscon
      arm64: dts: rockchip: add csi dphy nodes to rk3576
      arm64: dts: rockchip: add mipi csi-2 receiver nodes to rk3576
      arm64: dts: rockchip: add vicap node to rk3576
      arm64: dts: rockchip: add radxa camera 4k on rock 4d

Amit Sunil Dhamne (1):
      arm64: dts: exynos: gs101-pixel-common: add supply and regulator p=
roperties

Anandu Krishnan E (1):
      arm64: dts: qcom: shikra: Remove cdsp compute-cb@9

Andre Heider (1):
      riscv: dts: spacemit: k1-musepi-pro: add cpu scaling

Andre Przywara (3):
      dt-bindings: vendor-prefixes: Add vendor prefix for Teclast
      dt-bindings: arm: sunxi: Add two Teclast tablets
      arm64: dts: allwinner: A133: add basic support for Teclast P80 tab=
let

Andrea Pesaresi (1):
      arm64: dts: mediatek: mt7986: correct timer frequency

Andrei Lalaev (2):
      riscv: dts: sophgo: cv1800b-milkv-duo: drop reserved memory node
      riscv: dts: sophgo: sg2002-milkv-duo256m: drop reserved memory node

Andrii Salivon (2):
      dt-bindings: arm: fsl: add Amazon Kindle 4 (Yoshi)
      ARM: dts: imx50: add support for Amazon Kindle 4 (Yoshi)

Andr=C3=A9 Apitzsch (2):
      arm64: dts: qcom: msm8939: Add venus node
      arm64: dts: qcom: msm8939-longcheer-l9100: Enable venus node

Antoine Gouby (2):
      dt-bindings: arm: fsl: Add Toradex OSM iMX95
      arm64: dts: freescale: Add Toradex OSM iMX95

Antony Kurniawan Soemardi (6):
      ARM: dts: qcom: msm8960: add RPM clock controller and fix USB cloc=
ks
      ARM: dts: qcom: msm8960: add SCM
      ARM: dts: qcom: msm8960: add SMEM & hwlock
      ARM: dts: qcom: msm8960: add SMSM & SPS
      ARM: dts: qcom: msm8960: add Riva
      ARM: dts: qcom: msm8960: huashan: enable Wi-Fi and Bluetooth

Anurag Pateriya (3):
      dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index
      arm64: dts: qcom: nord: Add PMU node
      arm64: dts: qcom: nord: Add LLCC node

Anvesh Jain P (1):
      dt-bindings: embedded-controller: qcom,hamoa-crd-ec: Add Purwa IOT=
 EVK

Arnd Bergmann (3):
      arm64: dts: qcom: shikra: fix sdhc interrupts property
      Merge tag 'tegra-for-7.4-arm-dt' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/tegra/linux into soc/dt
      Merge tag 'tegra-for-7.4-arm64-dt' of git://git.kernel.org/pub/scm=
/linux/kernel/git/tegra/linux into soc/dt

Aurelien Jarno (4):
      riscv: dts: spacemit: k3: move USB3 phy to board level
      riscv: dts: spacemit: k3: add USB3 B and C controllers for Pico-IT=
X board
      riscv: dts: spacemit: k3: add rfkill node for Bluetooth on Pico-IT=
X board
      riscv: dts: spacemit: k3: add rfkill node for WLAN on the K3 Pico-=
ITX board

Ayman Chaudhry (6):
      dt-bindings: power: renesas,rcar-sysc: Document vendor-prefixed he=
ader paths
      dt-bindings: power: Add r8a774a3 SYSC power domain definitions
      dt-bindings: clock: Add r8a774a3 CPG Core Clock definitions
      arm64: dts: renesas: Add initial SoC DTSI for RZ/G2M v3.0
      arm64: dts: renesas: Add HiHope RZ/G2M v3.0 SoC main board support
      arm64: dts: renesas: Add HiHope RZ/G2M v3.0 SoC sub board support

Bhargav Joshi (7):
      ARM: dts: ti: am57xx-idk-common: Remove unused ext-clk-src property
      ARM: dts: ti: am335x-shc: Remove unused ti,no-init property
      ARM: dts: omap: dra7: add da830 fallback to am3352 rtc compatible =
string
      ARM: dts: ti: keystone: k2l: Rename ti,davinci-spi-num-cs to num-cs
      ARM: dts: ti: keystone: Align devctrl child node names with dtsche=
ma
      ARM: dts: ti: keystone: k2g: Add required #phy-cells to usb-nop-xc=
eiv nodes
      ARM: dts: ti: keystone: k2g: Move usb-phy nodes out of simple-bus

Bibek Kumar Patro (1):
      arm64: dts: qcom: shikra: Add Adreno SMMU node

Biju Das (8):
      arm64: dts: renesas: r9a08g046: Add Mali-G31 GPU node
      arm64: dts: renesas: rzg3l-smarc-som: Enable Mali-G31
      arm64: dts: renesas: r9a08g045: Move max-frequency to SoC dtsi
      arm64: dts: renesas: r9a08g046: Add FCPVD node
      arm64: dts: renesas: r9a08g046: Add VSPD node
      arm64: dts: renesas: r9a08g046: Add DU and DSI nodes
      arm64: dts: renesas: r9a08g046: Add LVDS node
      arm64: dts: renesas: r9a08g046: Add PCIe support

Bjorn Andersson (10):
      Merge branch '20260806-eliza-mm-cc-v9-v10-1-6ba52dd14343@oss.qualc=
omm.com' into HEAD
      arm64: dts: qcom: hamoa-pmics: Mark pmk8550_vadc thermal sensor pr=
ovider
      arm64: dts: qcom: hamoa-crd: Add thermal control
      dt-bindings: arm: qcom: Add Asus Zenbook A14 (UX3407NA)
      arm64: dts: qcom: glymur: Add Asus Zenbook A14 (UX3407NA)
      Merge branch '20260730-gpucc-hawi-v2-1-7bf618ab8a34@oss.qualcomm.c=
om' into HEAD
      Merge branch '20260915-camcc-hawi-v3-1-5b57f45477f1@oss.qualcomm.c=
om' into HEAD
      Merge branch '20260801-nord_videocc_camcc-v2-1-674d7718e41f@oss.qu=
alcomm.com' into HEAD
      Merge branch '20260811-ipq9650_icc-v2-1-55b8efbd62c6@oss.qualcomm.=
com' into arm64-for-7.4
      Merge branch '20260922-maili_camcc-v4-1-87704b664dde@oss.qualcomm.=
com' into arm64-for-7.4

Brandon Brnich (4):
      arm64: dts: ti: k3-j721s2-main: Add mmio-sram node to main_navss
      arm64: dts: ti: k3-j721s2-main: Assign SRAM to VPU node
      arm64: dts: ti: k3-am62a-main: Assign SRAM to VPU node
      arm64: dts: ti: k3-am62p-j722s-common-main: Assign SRAM to VPU node

Brian Norris (1):
      arm64: dts: mediatek: Add #{address,size}-cells to Chromium-based =
/firmware

Chancel Liu (17):
      arm64: dts: imx91_93_common: Add clock and sound-dai-cells propert=
ies for MQS
      arm64: dts: imx91-11x11-evk: Add board muxes to select between PDM=
 and MQS1
      arm64: dts: imx91-11x11-evk: Add MQS1 pinmux, clocks and mark conf=
licting devices
      arm64: dts: imx93-11x11-evk: Add board muxes to select between PDM=
 and MQS1
      arm64: dts: imx93-11x11-evk: Add MQS1 pinmux, clocks and mark conf=
licting devices
      arm64: dts: imx93-14x14-evk: Add board muxes to select between Fle=
xCAN1 and MQS1
      arm64: dts: imx93-14x14-evk: Add MQS1 pinmux, clocks and mark conf=
licting devices
      arm64: dts: imx94: Add clock and sound-dai-cells properties for MQ=
S1
      arm64: dts: imx943-evk: Add board muxes to select between CAN1/PDM=
 and MQS1/MIC
      arm64: dts: imx943-evk: Add MQS1 pinmux, clocks and mark conflicti=
ng devices
      arm64: dts: imx95: Add clock and sound-dai-cells properties for MQ=
S1
      arm64: dts: imx95-15x15-evk: Add board muxes to select between PDM=
 and MQS1
      arm64: dts: imx95-15x15-evk: Add MQS1 pinmux, clocks and mark conf=
licting devices
      arm64: dts: imx952: Add AONMIX MQS device node
      arm64: dts: imx952-evk: Add board muxes to select between CAN1/PDM
      arm64: dts: imx952-evk: Add MQS1 pinmux, clocks and mark conflicti=
ng devices
      arm64: dts: fsl: Add DT overlay to build MQS1 sound cards on i.MX9=
 platforms

Charlie Garner (2):
      arm64: dts: qcom: x1e80100-dell-inspiron-14-plus-7441: add PWM bac=
klight
      arm64: dts: qcom: x1e80100-dell-inspiron-14-plus-7441: fix touchsc=
reen i2c address

Chen-Yu Tsai (4):
      arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
      arm64: dts: mediatek: mt8173: Add GPU device nodes
      arm64: dts: allwinner: sun50i-h6: Add missing SRAM region for vide=
o engine
      arm64: dts: allwinner: sun50i-h6: Add missing IOMMU for video engi=
ne

Chen-Yu Yeh (2):
      riscv: dts: sophgo: add Milk-V Duo 256M ethernet support overlay
      riscv: dts: sophgo: cv180x: Fix internal ephy node name

Chris Morgan (1):
      arm64: dts: rockchip: Correct Device Orientation on Gameforce Ace

Christophe Roullier (1):
      arm64: dts: st: Add I/O sync to eth1 pinctrl in stm32mp25-pinctrl.=
dtsi

Chuan Liu (6):
      arm64: dts: amlogic: a5: Add clk-measure controller node
      arm64: dts: amlogic: a4: Add clk-measure controller node
      arm64: dts: amlogic: s7: Add clk-measure controller node
      arm64: dts: amlogic: s7d: Add clk-measure controller node
      arm64: dts: amlogic: s6: Add clk-measure controller node
      arm64: dts: amlogic: a9: Add clk-measure controller node

Chukun Pan (10):
      riscv: dts: spacemit: sort nodes on OrangePi RV2
      riscv: dts: spacemit: enable onboard eeprom for OrangePi
      dt-bindings: arm: rockchip: Add MangoPi M28K
      arm64: dts: rockchip: Add MangoPi M28K
      riscv: dts: spacemit: set ETH MAC from eeprom for OrangePi
      arm64: dts: rockchip: fix adc button voltage on Radxa E52C
      arm64: dts: rockchip: enable NPU on Radxa E52C
      arm64: dts: rockchip: remove FRL GPIO for 100ASK DshanPi A1
      dt-bindings: arm: rockchip: Add Radxa E54C
      arm64: dts: rockchip: Add Radxa E54C

Claudiu Beznea (1):
      arm64: dts: renesas: rzg3s-smarc-som: Enable I3C

Cl=C3=A9ment Le Goffic (3):
      ARM: dts: stm32: add sram[123] nodes on stm32mp131
      ARM: dts: stm32: add sram pool to spi4 for DMA-MDMA chaining on MP=
15 DK
      ARM: dts: stm32: add sram pool to spi5 for DMA-MDMA chaining on MP=
13 DK

Conor Dooley (1):
      MAINTAINERS: update RISC-V Microchip maintainers

Cosmin Tanislav (2):
      arm64: dts: renesas: r9a09g077: Wire up DMA support for ADC
      arm64: dts: renesas: r9a09g087: Wire up DMA support for ADC

Cunhao Lu (3):
      arm64: dts: rockchip: add CAN-FD nodes for RK3588
      dt-bindings: arm: rockchip: Add LubanCat 5IO board
      arm64: dts: rockchip: Add LubanCat 5IO board

C=C3=A9dric Bellegarde (1):
      arm64: dts: qcom: sdm845-oneplus-common: Configure MBHC thresholds

Dale Whinham (2):
      arm64: dts: qcom: x1-denali: Add audio playback over DisplayPort
      arm64: dts: qcom: x1-denali: Add volume up/down GPIO keys

Daniel Drake (1):
      arm64: dts: broadcom: bcm2712: Add GPU IOMMU and IOMMU cache nodes

Daniel J Blueman (2):
      dt-bindings: embedded-controller: qcom,hamoa-crd-ec: add Lenovo Yo=
ga Slim 7x
      arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add Embedded Contro=
ller node

Danila Tikhonov (1):
      arm64: dts: qcom: sm7325-nothing-spacewar: Add ath11k calibration-=
variant

Dario Binacchi (18):
      dt-bindings: arm: stm32: support Engicam MicroGEA-STM32MP257D-RMM =
board
      arm64: dts: st: add power-domains to sdmmc1 on stm32mp231
      arm64: dts: st: add power-domains to sdmmc1 on stm32mp251
      arm64: dts: st: add SDMMC2 support on stm32mp25
      arm64: dts: st: add CAN1 support on stm32mp25
      arm64: dts: st: add i2c1 pins for stm32mp25
      arm64: dts: st: add ltdc pins for stm32mp25
      arm64: dts: st: add can1 pins for stm32mp25
      arm64: dts: st: add pwm2/pwm4 pins for stm32mp25
      arm64: dts: st: add sai1 pins for stm32mp25
      arm64: dts: st: add sdmmc2 pins for stm32mp25
      arm64: dts: st: add spi1 pins for stm32mp25
      arm64: dts: st: add usart1 pins for stm32mp25
      arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM
      arm64: dts: st: support Engicam MicroGEA-STM32MP257D-RMM board
      arm64: defconfig: enable configs for Engicam MicroGEA-STM32MP257D-=
RMM
      arm64: dts: st: move Engicam MicroGEA-STM32MP257D-RMM display to a=
n overlay
      arm64: dts: st: add Engicam MicroGEA-STM32MP257D-RMM LVDS display =
overlay

David Heidelberg (6):
      arm64: dts: qcom: sdm845-google: Set i2c3 frequency to 400 kHz
      arm64: dts: qcom: sdm845-google: Improve NFC pins description
      arm64: dts: qcom: sdm845-oneplus: Move touchscreen y-axis to the r=
ight place
      arm64: dts: qcom: sdm845-oneplus: Define touchscreen in the detail
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Extend the xbl_mem regi=
on
      arm64: dts: qcom: sdm845-xiaomi-polaris: Extend the xbl_mem region

Deepti Jaggi (2):
      arm64: dts: qcom: Add device tree for Nord GearVM variant
      arm64: dts: qcom: Add device tree for Nord Ride board

Dennis Gilmore (1):
      arm64: dts: rockchip: Use GPIO function for PCIe reset on Orange P=
i 5 Pro

Detlev Casanova (5):
      arm64: dts: rockchip: Rename rk3328 HDMI audio card
      arm64: dts: rockchip: Rename rk3399 HDMI audio card
      arm64: dts: rockchip: Rename rk3566 and rk3568 HDMI audio cards
      arm64: dts: rockchip: Rename rk3576 HDMI audio card
      arm64: dts: rockchip: Rename rk3588 HDMI audio cards

Diederik de Haas (8):
      arm64: dts: rockchip: Remove unneeded vcc_3v3_pcie20 on NanoPC-T6
      arm64: dts: rockchip: Fix PCIe 2 pinctrl names and sorting on Nano=
PC-T6
      arm64: dts: rockchip: Fix hym8563 pinctrl name and sorting on Nano=
PC-T6
      arm64: dts: rockchip: Don't pull up rtc int pin on NanoPC-T6
      arm64: dts: rockchip: Sort usb nodes on NanoPC-T6
      arm64: dts: rockchip: Improve sound config on NanoPC-T6
      arm64: dts: rockchip: Drop duplicate USB nodes on NanoPC-T6 LTS
      arm64: dts: rockchip: Add supplies for es8316 on RockPro64

Diogo Ivo (1):
      arm64: tegra: Move Tegra210 AHUB audio ports/endpoints to SoC DTSI

Dmitry Baryshkov (1):
      ARM: dts: qcom: msm8974: add MDSS reset

Dongfang Zhao (1):
      dt-bindings: clock: qcom: Add Hawi GPU clock controllers

Douglas Anderson (2):
      arm64: dts: google: Add dts directory for Google-designed silicon
      arm64: dts: google: Add initial dts for frankel/blazer/mustang

Drew Fustini (1):
      MAINTAINERS: Move RISC-V T-Head SoC tree to kernel.org

Eberhard Stoll (1):
      ARM: dts: imx6ul-kontron-bl-common: Replace UART3 with DIP switch =
GPIOs

Eduard Bostina (3):
      dt-bindings: input: Convert TI Keypad Controller to DT schema
      ARM: dts: ti: omap: Disable keypad and enable it on the boards tha=
t use it
      ARM: dts: ti: omap: Fix Palmas RTC node names

Erikas Bitovtas (2):
      dt-bindings: arm: qcom: Document Samsung Galaxy A52/A72
      arm64: dts: qcom: msm8939-asus-z00t: add Venus

Fabrice Gasnier (3):
      ARM: dts: stm32: fix vdda supply for onboard hub on stm32mp15 DK b=
oards
      ARM: dts: stm32: fix vdda supply for onboard hub on stm32mp157c-ev1
      ARM: dts: stm32: fix vdda supply for onboard hub on stm32mp135f-dk

Francesco Dolcini (28):
      ARM: dts: imx7d-colibri-emmc: Add Toradex Capacitive Touch Display=
 7" Parallel
      ARM: dts: imx7d-colibri-emmc: Add Toradex Capacitive Touch Display=
 7" Parallel with Touch Adapter
      ARM: dts: imx7d-colibri-emmc: Add Toradex Resistive Touch Display =
7" Parallel
      arm64: dts: ti: k3-am62-verdin: Set MMC clock pins as OUTPUT
      ARM: dts: imx7d-colibri-emmc: Add VGA overlay
      arm64: dts: ti: k3-am62p5-verdin: build zinnia dtbs
      arm64: dts: ti: k3-am62-verdin: add SODIMM_84 gpio-line-name
      arm64: dts: ti: k3-am69-aquila: fix AQUILA_B73 gpio-line-names typo
      arm64: dts: ti: k3-am62-verdin: fix main_gpio0/main_gpio1 line nam=
es size
      arm64: dts: freescale: imx8mm-verdin-ivy: fix DIGI_1/DIGI_2 gpio-l=
ine-names
      arm64: dts: freescale: imx8mp-verdin-ivy: fix DIGI_1/DIGI_2 gpio-l=
ine-names
      arm64: dts: freescale: imx95-aquila: fix gpio-line-names padding
      arm64: dts: freescale: imx8mp-toradex-smarc: fix SMARC_SLEEP# gpio=
-line-names typo
      arm64: dts: freescale: imx8mp-verdin-yavia: fix external GPIOs
      arm64: dts: freescale: imx95-toradex-smarc: enable Wi-Fi SD interf=
ace
      ARM: dts: imx7-colibri-iris-v2: drop no-op delete-property
      arm64: dts: ti: k3-am62-verdin-ivy: Fix main_gpio0/main_gpio1 line=
 names size
      arm64: dts: ti: k3-am62-verdin-zinnia: Fix main_gpio0/main_gpio1 l=
ine names size
      dt-bindings: arm: fsl: Add Lino iMX91/iMX93
      dt-bindings: arm: fsl: Add Toradex OSM iMX91/iMX93
      arm64: dts: freescale: Add Lino iMX93
      arm64: dts: freescale: imx93-lino: Add dahlia
      arm64: dts: freescale: Add Lino iMX91
      arm64: dts: freescale: Add Toradex OSM iMX93
      arm64: dts: freescale: Add Toradex OSM iMX91
      arm64: dts: freescale: imx8mm-verdin: add gpio-line-name for CTRL_=
SLEEP_MOCI#
      ARM: dts: imx6ull-colibri: Set LCDIF bus width
      ARM: dts: imx7-colibri: Set LCDIF bus width

Frank Li (21):
      arm64: dts: imx8qm-ss-conn: add usbotg3 iommu information
      arm64: dts: imx8qm-ss-conn: Add HSIC usb@5b0e0000 node
      dt-bindings: display: bridge: ldb: allow a single reg for fsl,imx6=
sx-ldb
      dt-bindings: soc: imx-iomuxc-gpr: allow bridge@18 as child node
      dt-bindings: display: lcdif: Allow display0 child node for i.MX6UL
      ARM: dts: imx6ul-tx6ul: rename disp0 to display0
      ARM: dts: imx51-zii-rdu1: rename node name i2c-gpio to i2c-0
      ARM: dts: imx6qdl-emcon: Remove unrecognized disable-gpio PCIe pro=
perty
      ARM: dts: imx7d-nitrogen7: drop unsupported wakeup-gpios from tsc2=
004
      ARM: dts: imx7d-meerkat96: disable lcdif node
      ARM: dts: imx50-kobo-aura: convert sd2_vmmc to regulator-fixed
      ARM: dts: imx6dl-b125v2: add touchscreen-size-x/y to exc80h60 node
      ARM: dts: imx6sll: remove unused node csi@20e8000
      ARM: dts: imx6ul-14x14-evk: remove reduntant bus-type under csi no=
de
      ARM: dts: imx53: drop fallback compatible "dlg,da9052"
      arm64: dts: imx8qm-ss-conn: add #phy-cells for usbphynop2
      arm64: dts: imx8qm-ss-conn: update usbphynop2's power-domain to IM=
X_SC_R_USB_1_PHY
      arm64: dts: imx8mn-solidsense-n8-compact: drop undocumented adi,le=
d-polarity
      dt-bindings: mfd: st,stmpe: add deprecated properties
      dt-bindings: mfd: st,stmpe: let interrupt property optional
      ARM: dts: imx: remove undocument properties of st,stmpe*

Frank Wunderlich (2):
      arm64: dts: mediatek: mt7988a-bpi-r4pro: add names for i2c-to-gpio=
 chip
      arm64: dts: mediatek: mt7988a-bpi-r4pro: label gpio-hogs

Franz Schnyder (4):
      arm64: dts: apalis-imx8: Add USB HSIC support
      arm64: dts: freescale: imx95-toradex-smarc: Add ENETC port 2 in SG=
MII mode
      arm64: dts: freescale: imx95-aquila: Add ENETC port 2 in SGMII mode
      arm64: dts: freescale: imx95-aquila: Enable I2C_3_DSI1 on Clover b=
oard

Frieder Schrempf (2):
      arm64: dts: imx93-kontron: Adjust GPIO4_IO29 usage
      arm64: dts: imx8mm-kontron: Describe the ethernet PHY LEDs

GUO Ren (XuanTie) (1):
      riscv: dts: spacemit: k3: fix IMSIC num-guest-ids

Gaurav Kohli (4):
      arm64: dts: qcom: eliza: Add GPU cooling
      arm64: dts: qcom: kaanapali: Add GPU cooling
      arm64: dts: qcom: purwa-iot-evk: Update TSENS thermal zone
      arm64: dts: qcom: sm8750: Add GPU cooling

Geert Uytterhoeven (9):
      arm64: dts: renesas: r8a78000: Add CPG node
      arm64: dts: renesas: r8a78000: Add MDLC nodes
      arm64: dts: renesas: r9a09g047e57-smarc: Update CAN transceivers
      arm64: dts: renesas: white-hawk: Add second mini-DP output support
      Merge tag 'renesas-r8a774a3-dt-binding-defs-tag1' into renesas-dts=
-for-v7.4
      Merge branch 'dt' of git://git.kernel.org/pub/scm/linux/kernel/git=
/ulfh/linux-pm into renesas-dts-for-v7.4
      dt-bindings: clock: renesas,r8a78000-cpg: Add MSIOF clocks
      Merge tag 'renesas-r8a78000-dt-binding-defs-tag3' into renesas-dts=
-for-v7.4
      arm64: dts: renesas: r8a78000: Add MSIOF nodes

Gopikrishna Garmidi (4):
      dt-bindings: arm: qcom: Add Glymur QCB
      dt-bindings: embedded-controller: Add Glymur QCB EC
      dt-bindings: arm: qcom: Document Kalambo SoC and board
      arm64: dts: qcom: Add Glymur QCB

Greg Ociepka (2):
      arm64: dts: qcom: glymur: Add missing USB clock, power and bandwid=
th votes
      arm64: dts: qcom: glymur: Mark USB controllers dma-coherent

Gregor Herburger (4):
      dt-bindings: arm: bcm2835: Add 2712-d0 Stepping
      arm64: dts: broadcom: bcm2712-d-rpi-5-b: add compatible
      arm64: dts: broadcom: rp1: add spi controller
      arm64: dts: broadcom: bcm2712-rpi-5-b: add spi0 interface

Guodong Xu (1):
      MAINTAINERS: add entry for SpacemiT reset controller driver

Haibo Chen (1):
      arm64: dts: imx95-15x15-frdm: fix duplicated can-phy node names

Hal Feng (1):
      riscv: dts: starfive: Correct pwm nodes

Han Gao (5):
      dt-bindings: riscv: thead: add Milk-V Meles
      riscv: dts: thead: add Milk-V Meles
      riscv: dts: thead: enable AP6256 Wi-Fi on Milk-V Meles
      riscv: dts: thead: enable HDMI on Milk-V Meles
      riscv: dts: sophgo: Limit SG2042 SPI NOR to 12.5 MHz

Hangfan Li (1):
      riscv: dts: sophgo: Enable SPI NOR on SRD3-10

Hardeep Sharma (2):
      dt-bindings: power: rpmpd: Document Kuno RPMh power domains
      dt-bindings: arm: qcom: Document Kuno IDP board

Heiko Stuebner (3):
      arm64: dts: rockchip: Enable CAN controller on RK3588-Tiger-Haikou
      dt-bindings: arm: rockchip: add RK3588 DP carrier from Theobroma S=
ystems
      arm64: dts: rockchip: add RK3588 DP carrier from Theobroma Systems

Hongcheng Zhang (1):
      arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add PCIe w=
ake GPIO

Hongyang Zhao (2):
      arm64: dts: qcom: qcs6490-rubikpi3: Add 3.3 V output supply
      arm64: dts: qcom: qcs6490-rubikpi3: Add IMX219 camera overlays

Icenowy Zheng (6):
      arm64: dts: qcom: sc8280xp-crd: set GPI DMA channels
      arm64: dts: qcom: sc8280xp-huawei-gaokun3: set GPI DMA channels
      arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s: set GPI DMA chann=
els
      arm64: dts: qcom: sc8280xp-microsoft-arcata: set GPI DMA channels
      arm64: dts: qcom: sc8280xp-microsoft-blackrock: set GPI DMA channe=
ls
      arm64: dts: qcom: sc8280xp: remove GPI DMA channel masks

Igor Belwon (2):
      arm64: dts: mediatek: mt6878-pinfunc: Fix pinctrl header path
      arm64: dts: mediatek: mt6893-pinfunc: Fix pinctrl header path

Igor Velkov (4):
      arm64: dts: amlogic: meson-sm1-odroid-hc4: mux the SPI NOR HOLD# a=
nd WP# pins
      arm64: dts: amlogic: meson-sm1-odroid-hc4: run the SPI NOR at 40 M=
Hz
      arm64: dts: rockchip: Add buttons to Kobol Helios64
      arm64: dts: rockchip: Add the fan tachometers to Kobol Helios64

Imran Shaik (1):
      arm64: dts: qcom: shikra: Add support for AudioCoreCC and AudioCor=
eCSR nodes

Jagadeesh Kona (2):
      dt-bindings: clock: qcom: Add Maili Graphics Clock Controllers
      dt-bindings: clock: qcom: Add Maili camera clock controllers

James Morris (1):
      riscv: dts: spacemit: k3-com260: keep dldo4 enabled

Jan Paszkowski (1):
      arm64: dts: qcom: sm8350-sony-xperia-sagami: enable UFS

Janne Grunau (16):
      arm64: dts: apple: Fix style issues for t600x multi die .dtsi
      arm64: dts: apple: Fix style issues for t602x multi die .dtsi
      arm64: dts: apple: Fix style issues for t6031 multi die .dtsi
      arm64: dts: apple: t603x: Fix all blank line dt-check-style issues
      arm64: dts: apple: t8122: Fix blank line related dt-check-style is=
sues
      arm64: dts: apple: t603x: Fix child-name-order dt-check-style issu=
es
      arm64: dts: apple: t8122: Fix child-name-order dt-check-style issu=
es
      arm64: dts: apple: t8122: Fix child-address-order dt-check-style i=
ssues
      arm64: dts: apple: t6031: Fix continuation alignment
      arm64: dts: apple: t8122: Fix continuation alignment
      arm64: dts: apple: t6030: Fix most property-order dt-check-style i=
ssues
      arm64: dts: apple: t603[12]: Fix most property-order dt-check-styl=
e issues
      arm64: dts: apple: t8122: Fix most property-order dt-check-style i=
ssues
      arm64: dts: apple: t6032-j575d: Remove unused "framebuffer0" label
      arm64: dts: apple: t603x: Break overly long lines
      arm64: dts: apple: t8122: Break overly long lines

Jared McArthur (2):
      arm64: dts: ti: k3-j722s-evm: Switch audio codec clock from audio_=
refclk1 to external clock
      arm64: dts: ti: k3-j784s4-j742s2-evm-common: Set ACSPCIe refclk to=
 MAIN_PLL2_HSDIV4 for pcie1

Jason Pettit (2):
      dt-bindings: arm: qcom: Add HP EliteBook X G2q 14 AI
      arm64: dts: qcom: Add HP EliteBook X G2q 14 AI

Jayesh Choudhary (1):
      arm64: dts: ti: Add audio overlay for k3-j721s2-evm

Jennifer Berringer (3):
      riscv: dts: spacemit: set console baud rate on OrangePi RV2
      riscv: dts: spacemit: k3-com260-ifx: Add USB nodes
      riscv: dts: spacemit: k3-com260-ifx: Add rfkill nodes

Jens Glathe (2):
      arm64: dts: qcom: sc8280xp-x13s: Enable HBR3 on external DPs
      arm64: dts: qcom: sc8280xp-x13s: Add DP0/DP1 audio playback support

Jernej Skrabec (1):
      arm64: dts: allwinner: sun50i-h616: Add video engine

Jiaxing Hu (1):
      arm64: dts: rockchip: fix an error and a typo in the CM5-IO comment

Jie Gan (1):
      arm64: dts: qcom: shikra: Add coresight nodes

Jie Zhang (3):
      arm64: dts: qcom: sm8750: Add GPU and GMU nodes
      arm64: dts: qcom: sm8750-mtp: Enable Adreno 830 GPU
      arm64: dts: qcom: sm8750-qrd: Enable Adreno 830 GPU

Jingyi Wang (1):
      arm64: dts: qcom: kaanapali: Add QFPROM node

Jishnu Prakash (4):
      arm64: dts: qcom: pm4125: Add VADC and temp alarm nodes
      arm64: dts: qcom: pm8005: Add temp alarm node
      arm64: dts: qcom: shikra-cqs/cqm: Add PMIC thermal support for Shi=
kra CQ2390M SoM platform
      arm64: dts: qcom: shikra-cqs/cqm: Add PMIC thermal support for Shi=
kra IQ2390S SoM platform

Joachim Eastwood (12):
      arm64: dts: rockchip: fix missing sdmmc cd pinctrl on rk3588s-nano=
pi-r6
      arm64: dts: rockchip: fix missing pcie rst pinctrl on rk3588s-nano=
pi-r6
      arm64: dts: rockchip: remove pull up on rtc int pin on rk3588s-nan=
opi-r6
      arm64: dts: rockchip: add pcie2x1l2 clkreq on rk3588s-nanopi-r6
      arm64: dts: rockchip: remove always-on and boot-on from vdd_npu_s0=
 reg on rk3588s-nanopi-r6
      arm64: dts: rockchip: remove useless vcc_3v3_pcie20 from rk3588s-n=
anopi-r6
      arm64: dts: rockchip: add gmac1 phy-supply to rk3588s-nanopi-r6
      arm64: dts: rockchip: remove bogus vcc5v0_usb regulator from rk358=
8s-nanopi-r6
      arm64: dts: rockchip: add comment about gmac phy-mode to rk3588s-n=
anopi-r6
      arm64: dts: rockchip: refactor rk3588s-nanopi-r6 to support M6 boa=
rds
      dt-bindings: arm: rockchip: add FriendlyElec NanoPi M6
      arm64: dts: rockchip: add support for NanoPi M6 board

Jon Hunter (1):
      arm64: tegra: Add the USB Type-C controller for IGX Orin

Jonatan Hazell (1):
      riscv: dts: spacemit: orangepi-r2s: Add cpu scaling for K1 SoC

Joseph Guo (6):
      arm64: dts: imx93-11x11-frdm: factor out common parts into dtsi
      dt-bindings: arm: fsl: Add i.MX93 Wireless FRDM board
      arm64: dts: imx93: Add i.MX93 Wireless FRDM board support
      dt-bindings: arm: fsl: add i.MX952 FRDM board
      arm64: dts: freescale: add i.MX952 FRDM Board support device tree
      arm64: dts: imx95-15x15-frdm: add boot phase properties

Joshua Yeong (1):
      dt-bindings: power: Add RPMI device power service

Josua Mayer (9):
      dt-bindings: soc: renesas: Add various SolidRun RZ/G2 based boards
      arm64: dts: renesas: Add support for solidrun rzg2l som and hb-iio=
t evb
      arm64: dts: renesas: Add support for solidrun rzv2l som and hb-iio=
t evb
      arm64: dts: renesas: Add support for solidrun rzg2lc som and hb-ii=
ot evb
      arm64: dts: renesas: rzg2l(c)/rzv2l hb-iiot: Add dsi panel dt over=
lay
      arm64: dts: renesas: Add support for solidrun hb-ripple with rzg2l=
 som
      arm64: dts: renesas: Add support for solidrun hb-ripple with rzv2l=
 som
      arm64: dts: renesas: Add support for solidrun hb-ripple with rzg2l=
c som
      arm64: dts: renesas: Add support for solidrun rzg2ul som on hb-rip=
ple

Joy Zou (3):
      arm64: dts: imx8mq-evk: add regulator-off-in-suspend for VGEN1/VGE=
N6
      arm64: dts: imx91-evk/qsb: add rtc1 alias for external PCF2131 RTC
      arm64: dts: imx93-evk/qsb: add rtc1 alias for external PCF2131 RTC

Judith Mendez (19):
      arm64: dts: ti: k3-am62a-mcu: Fix watchdog comment
      arm64: dts: ti: k3-am62p-j722s-mcu: Fix watchdog comment
      arm64: dts: ti: k3-am625-sk-common: Add non-removable flag for eMMC
      arm64: dts: ti: k3-am654-base-board: Add power-off delay for prope=
r MMC power cycle
      arm64: dts: ti: k3-am62a: Fix MMC0_CLK register address
      arm64: dts: ti: k3-am62l-evm: Remove unnecessary internal pullups =
for MMC0
      arm64: dts: ti: k3-am62a7-sk: Set eMMC clock pin as OUTPUT
      arm64: dts: ti: k3-am62a7-sk: Set SD clock pin as OUTPUT
      arm64: dts: ti: k3-am62a-phycore-som: Set eMMC clock pin as OUTPUT
      arm64: dts: ti: k3-am62-lp-sk: Set eMMC clock pins as OUTPUT
      arm64: dts: ti: k3-am62-pocketbeagle2: Set SD clock pin as OUTPUT
      arm64: dts: ti: k3-am625-beagleplay: Set MMC clock pins as OUTPUT
      arm64: dts: ti: k3-am62x-sk-common: Set SD clock pin as OUTPUT
      arm64: dts: ti: k3-am625-sk-common: Set eMMC clock pin as OUTPUT
      arm64: dts: ti: k3-am62-phycore-som: Set eMMC clock pin as OUTPUT
      arm64: dts: ti: k3-am625-tqma62xx: Set MMC clock pins as OUTPUT
      arm64: dts: ti: k3-am625-var-som-symphony: Set SD clock pins as OU=
TPUT
      arm64: dts: ti: k3-am625-var-som: Set MMC clock pins as OUTPUT
      arm64: dts: ti: k3-am62x-phyboard-lyra: Set SD clock pin as OUTPUT

Junhui Liu (7):
      riscv: dts: spacemit: k3: Drop guest properties from M-level IMSIC
      dt-bindings: timer: thead,c900-aclint-mtimer: Add SpacemiT K3
      dt-bindings: interrupt-controller: thead,c900-aclint-mswi: Add Spa=
cemiT K3
      dt-bindings: interrupt-controller: thead,c900-aclint-sswi: Add Spa=
cemiT K3
      dt-bindings: timer: sifive,clint: Remove spacemit,k3-clint
      irqchip/aclint-sswi: Add support for SpacemiT K3
      riscv: dts: spacemit: k3: Replace incorrect CLINT node with ACLINT=
 nodes

Justin Yeh (1):
      arm64: dts: mediatek: mt8188-geralt: Enlarge SCP core0 memory regi=
on

Kamal Wadhwa (1):
      arm64: dts: qcom: glymur-crd: Update VREG l2b_e0 and l9b_e0 voltag=
e for SD-card

KancyJoe (1):
      arm64: dts: qcom: sm8650-ayaneo-pocket-s2: add display nodes

Kathiravan Thirumoorthy (7):
      arm64: dts: qcom: ipq5424: Add the IMEM node
      arm64: dts: qcom: ipq5424: add support to get watchdog bootstatus =
from IMEM
      arm64: dts: qcom: ipq9574: Wire up USB3 PHY PIPE clock to GCC
      dt-bindings: interconnect: Add Qualcomm IPQ9650 support
      arm64: dts: qcom: ipq9650: add interconnect-cells to GCC node
      arm64: dts: qcom: ipq9650: add the PCIe support
      arm64: dts: qcom: ipq9650-rdp488: enable PCIe support

Khalid Faisal Ansari (1):
      arm64: dts: qcom: shikra: enable ST33 TPM

Khushal Chitturi (1):
      ARM: dts: gemini: Rename power controller node to poweroff

Koichiro Den (1):
      arm64: dts: renesas: r8a779f0: Set UFS lane count

Konrad Dybcio (8):
      arm64: dts: qcom: agatti: Flatten the USB node
      arm64: dts: qcom: sm8750: Add GPU clock & IOMMU nodes
      arm64: dts: qcom: glymur-asus-zenbook-a16: Fix up the mic sample r=
ate
      arm64: dts: qcom: x1e80100-medion-sprchrgd-14-s1: Drop NOP override
      dt-bindings: arm: qcom: Add Lenovo Yoga Slim 7x Gen11
      arm64: dts: qcom: glymur: Add Lenovo Yoga Slim 7x Gen11
      arm64: dts: qcom: hamoa: Extend QMPPHY description for USB4
      arm64: dts: qcom: glymur-asus-zenbook-a16: Remove RTC-through-EFIv=
ars

Kory Maincent (TI.com) (1):
      ARM: dts: am335x-bonegreen-eco: Enable 1GHz OPP by increasing vdd_=
mpu voltage

Krishna Chaitanya Chundru (36):
      arm64: dts: qcom: eliza: Add PCIe PHY and controller nodes
      arm64: dts: qcom: eliza-evk: Add PCIe0 with M.2 E key connector
      arm64: dts: qcom: eliza-evk: Add PCIe1 with TC9563 PCIe switch
      arm64: dts: qcom: msm8996: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: sdm845: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: sc8180x: Fix PCIe WAKE# GPIO polarity
      ARM: dts: qcom: sdx55: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: sm8150: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: sm8250: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: sm8350: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: sm8450: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: sm8550: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: sm8650: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: sm8750: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: kaanapali: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: sar2130p: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: monaco: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: lemans: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: talos: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: sa8540p-ride: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: kodiak: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: qcs6490-vicharak-axon-mini: Move PCIe phy and GP=
IOs to root port node
      arm64: dts: qcom: msm8998: Move PCIe phy and GPIOs to root port no=
de
      arm64: dts: qcom: qcs404: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sar2130p: Move PCIe phy and GPIOs to root port n=
ode
      arm64: dts: qcom: sc8180x: Move PCIe phy and GPIOs to root port no=
de
      arm64: dts: qcom: sdm845: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sm8150: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sm8250: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sm8350: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sm8450: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: talos: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sm8650: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: msm8996: Move PCIe phy and GPIOs to root port no=
de
      arm64: dts: qcom: lemans: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sm8550: Move PCIe phy and GPIOs to root port node

Krishna Kurapati (3):
      arm64: dts: qcom: shikra: Add support for usb nodes
      arm64: dts: qcom: shikra: Enable USB controllers on CQM, CQS, and =
EVKs
      arm64: dts: qcom: shikra-cqs/cqm: Add Type-C support on primary co=
ntroller

Krzysztof Kozlowski (50):
      ARM: dts: xilinx: Replace spaces indentation with tabs
      ARM: dts: marvell: Replace spaces indentation with tabs
      arm64: dts: amlogic: Replace spaces indentation with tabs
      ARM: dts: allwinner: sun7i-a20: Replace spaces indentation with ta=
bs
      arm64: dts: freescale: Correct white-space style
      ARM: dts: nxp: Correct white-space style
      arm64: dts: qcom: sdm845-oneplus: Drop redundant status=3Dokay
      ARM: dts: ti: omap: Correct white-space style
      ARM: dts: ti: omap: Replace spaces indentation with tabs
      arm64: dts: imx8mq: Replace spaces indentation with tabs
      ARM: dts: nxp: imx: Replace spaces indentation with tabs
      ARM: dts: ti: keystone: Correct white-space style
      arm64: dts: mediatek: mt8173: Replace spaces indentation with tabs
      ARM: dts: renesas: Correct white-space style
      arm64: dts: renesas: Correct white-space style
      arm64: dts: renesas: Use hyphens in node names
      arm64: dts: fsd: Fix indentation of CPU nodes
      arm64: dts: fsd: evb: Correct node order
      arm64: dts: fsd: Move idle states out of CPUs node
      arm64: dts: fsd: Re-order nodes to match coding style
      arm64: dts: fsd: Re-order properties to match coding style
      arm64: dts: exynos: axis: Re-order nodes to match coding style
      arm64: dts: exynos: axis: Re-order properties to match coding style
      arm64: dts: exynos: gs101: Re-order properties to match coding sty=
le
      arm64: dts: exynos: gs101: Re-order nodes to match coding style
      arm64: dts: exynos2200-g0s: Drop chosen address/size cells
      arm64: dts: exynos2200-g0s: Re-order properties to match coding st=
yle
      arm64: dts: exynos2200: Drop redundant blank lines
      arm64: dts: exynos7870: Re-order properties to match coding style
      arm64: dts: imx95: Drop unsupported opp-hz-real in OPP tables
      arm64: dts: exynos5433: Re-order nodes to match coding style
      arm64: dts: exynos5433: Re-order properties to match coding style
      ARM: dts: actions: owl-s500: Replace spaces indentation with tabs
      ARM: dts: vexpress-v2p-ca5s: Replace spaces indentation with tabs
      ARM: dts: aspeed: Replace spaces indentation with tabs
      arm64: dts: actions: Replace spaces indentation with tabs
      arm64: dts: cavium: thunder-88xx: Replace spaces indentation with =
tabs
      arm64: dts: qcom: Correct white-space style
      arm64: dts: qcom: Replace spaces indentation with tabs
      arm64: dts: qcom: Correct inconsistent indentation
      Merge tag 'renesas-dts-for-v7.4-tag1' of https://git.kernel.org/pu=
b/scm/linux/kernel/git/geert/renesas-devel into soc/dt
      Merge tag 'v7.4-rockchip-dts64-1' of ssh://gitolite.kernel.org/pub=
/scm/linux/kernel/git/mmind/linux-rockchip into soc/dt
      Merge tag 'qcom-arm64-for-7.4' of ssh://gitolite.kernel.org/pub/sc=
m/linux/kernel/git/qcom/linux into soc/dt
      Merge tag 'mtk-dts64-for-v7.4' of ssh://gitolite.kernel.org/pub/sc=
m/linux/kernel/git/mediatek/linux into soc/dt
      Merge tag 'mtk-dts32-for-v7.4' of ssh://gitolite.kernel.org/pub/sc=
m/linux/kernel/git/mediatek/linux into soc/dt
      Merge tag 'juno-updates-7.4' of https://git.kernel.org/pub/scm/lin=
ux/kernel/git/sudeep.holla/linux into soc/dt
      arm64: tegra: Replace spaces indentation with tabs
      Merge tag 'ux500-dts-for-7.4' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/linusw/linux-nomadik into soc/dt
      Merge tag 'gemini-dts-for-7.4' of https://git.kernel.org/pub/scm/l=
inux/kernel/git/linusw/linux-integrator into soc/dt
      Merge tag 'omap-for-v7.4/dt-signed' of https://git.kernel.org/pub/=
scm/linux/kernel/git/khilman/linux-omap into soc/dt

Kuldeep Singh (1):
      arm64: dts: qcom: shikra: Add ICE, TRNG and QCE nodes

Lad Prabhakar (14):
      arm64: dts: renesas: r9a09g077: Add VSPD and FCPVD nodes
      arm64: dts: renesas: r9a09g077: Add DU node
      arm64: dts: renesas: r9a09g087: Add VSPD and FCPVD nodes
      arm64: dts: renesas: r9a09g087: Add DU node
      arm64: dts: renesas: r9a09g077: Adjust CPG register region sizes
      arm64: dts: renesas: r9a09g087: Adjust CPG register region sizes
      arm64: dts: renesas: rzt2h-n2h-evk: Use consistent switch notation
      arm64: dts: renesas: Add LCDC overlays for RZ/T2H and RZ/N2H EVKs
      arm64: dts: renesas: r9a09g077: Add RTC node
      arm64: dts: renesas: r9a09g087: Add RTC node
      arm64: dts: renesas: rzt2h-n2h-evk: Enable RTC support
      arm64: dts: renesas: rzt2h-n2h-evk: Mark XSPI1 boot partitions rea=
d-only
      arm64: dts: renesas: r9a09g077: Drop unwired ADC interrupts
      arm64: dts: renesas: r9a09g087: Drop unwired ADC interrupts

Laurent Pinchart (7):
      ARM: dts: ti: omap3-n950: Replace clock-frequency in camera sensor=
 node
      ARM: dts: ti: omap3-n9: Replace clock-frequency in camera sensor n=
ode
      ARM: dts: ti: omap3-n900: Replace clock-frequency in camera sensor=
 node
      ARM: dts: samsung: exynos4210-i9100: Replace clock-frequency in ca=
mera sensor node
      ARM: dts: samsung: exynos4412-midas: Replace clock-frequency in ca=
mera sensor node
      ARM: dts: nxp: imx6qdl-pico: Replace clock-frequency in camera sen=
sor node
      ARM: dts: nxp: imx6qdl-wandboard: Replace clock-frequency in camer=
a sensor node

Laurentiu Mihalcea (2):
      dt-bindings: arm: fsl: add MR-NAVQ95 board
      arm64: dts: freescale: add MR-NAVQ95 basic board support

Le Qi (1):
      arm64: dts: qcom: purwa-evk: add DP0/DP1 audio playback support

Leonardo Costa (1):
      arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to LVDS adapter wi=
th the 10.1" V2 display

Linus Walleij (11):
      ARM: dts: ux500: Make panel regulators have unique names
      ARM: dts: ux500: Harmonize GPIO key names
      ARM: dts: ux500: Add the Imagis ISA to Janice DTS
      ARM: dts: ux500: Add the Imagis ISA to Gavini DTS
      ARM: dts: ux500: Add new AB8500/AB8505 regulators
      ARM: dts: ux500: Fix up regulator assignments
      ARM: dts: ux500: Add sound DAI provider cells
      ARM: dts: ux500: Convert HREF audio to audio-graph-card2
      ARM: dts: ux500: Add Samsung phone audio graphs
      ARM: dts: gemini: Use a level-high interrupt for TVE200
      ARM: dts: ux500: Use AB8505 charger compatible

Liu Ying (3):
      arm64: dts: imx91: Override dpi_bridge's compatible string
      arm64: dts: imx91: Assign media_{axi,apb}_root clock parents/rates
      arm64: dts: imx91-9x9-qsb: Add tianma,tm050rdh03 panel

Loic Poulain (4):
      arm64: dts: qcom: monaco-arduino-monza: Add sleep button
      arm64: dts: qcom: monaco-arduino-monza: Add GPIO line names
      arm64: dts: qcom: monaco-arduino-monza: microcontroller LEDs
      arm64: dts: qcom: monaco-arduino-monza: Rework fan cooling map

Luca Weiss (14):
      dt-bindings: net: wireless: ath11k: Document WCN6755 WiFi
      arm64: dts: qcom: kodiak: Sort pinctrl subnodes by pins
      arm64: dts: qcom: kodiak: Add camera mclk pinctrl definitions
      arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine: Use common pin=
ctrl
      arm64: dts: qcom: sm7225-fairphone-fp4: Disable PMK8350 PON
      dt-bindings: bluetooth: qcom,wcn6750-bt: Document WCN6755 Bluetooth
      arm64: dts: qcom: milos: Split up uart11 pinctrl
      arm64: dts: qcom: milos: Add WCN6755 WiFi node
      arm64: dts: qcom: milos-fairphone-fp6: Enable Bluetooth
      arm64: dts: qcom: milos-fairphone-fp6: Enable WiFi
      arm64: dts: qcom: milos: Add CPU-to-DDR BWMON support
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add parent supply for reg=
ulators
      arm64: dts: qcom: sm6350: Add CAMSS node
      arm64: dts: qcom: milos: add CPU OPP table with DDR & L3 bandwidths

Lucas Tanure (1):
      arm64: dts: amlogic: t7: add the pipeline clock to the MMC control=
lers

Luo Jie (3):
      arm64: dts: qcom: ipq5018: Add pinctrl for MDIO bus
      arm64: dts: qcom: ipq5018: Enable mdio0 for SoC-integrated EPHY
      arm64: dts: qcom: ipq5018-rdp432-c2: Enable mdio1 and add QCA8081 =
PHY

Manikanta Maddireddy (2):
      arm64: tegra: Use iommus for PCIe endpoint controllers
      arm64: tegra: Add PCIe wake GPIO for Jetson Orin NX/Nano

Marek Vasut (49):
      arm64: dts: imx8mp: Add DT label to SPBA5 bus
      arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data Modul i.MX8M Mi=
ni and Plus eDM SBC
      arm64: dts: imx8mm: imx8mp: Add legacy board DTOs for Data Modul i=
.MX8M Mini and Plus eDM SBC
      arm64: dts: imx8mm: imx8mp: Add HDMI DTOs for Data Modul i.MX8M Mi=
ni and Plus eDM SBC
      arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data Modul i.MX8M Mini=
 and Plus eDM SBC
      arm64: dts: imx8mm: imx8mp: Add FIO1 DTOs for Data Modul i.MX8M Mi=
ni and Plus eDM SBC
      arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs for Data Modul i.M=
X8M Mini and Plus eDM SBC
      arm64: dts: imx8mn: Expand EEPROM description on ifm VHIP4 EvalBoa=
rd
      arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard configuration EEPROM l=
ayout DTOs
      dt-bindings: arm: stm32: Sort the document
      ARM: dts: stm32: Drop bias-disable from STM32MP15xx DHCOM SoM sdmm=
c1_b4_pins_a
      arm64: dts: renesas: sparrow-hawk: Always enable edge connector I2=
C busses
      ARM: dts: renesas: gr-peach: Specify ethernet PHY reset timings
      ARM: dts: renesas: armadillo800eva: Specify ethernet PHY reset tim=
ings
      ARM: dts: renesas: lager: Specify ethernet PHY reset timings
      ARM: dts: renesas: stout: Specify ethernet PHY reset timings
      ARM: dts: renesas: koelsch: Specify ethernet PHY reset timings
      ARM: dts: renesas: porter: Specify ethernet PHY reset timings
      ARM: dts: renesas: gose: Specify ethernet PHY reset timings
      ARM: dts: renesas: alt: Specify ethernet PHY reset timings
      ARM: dts: renesas: silk: Specify ethernet PHY reset timings
      ARM: dts: renesas: sk-rzg1m: Specify ethernet PHY reset timings
      ARM: dts: renesas: sk-rzg1e: Specify ethernet PHY reset timings
      arm64: dts: renesas: cat875: Specify ethernet PHY reset timings
      arm64: dts: renesas: hihope-rzg2-ex: Specify ethernet PHY reset ti=
mings
      arm64: dts: renesas: beacon: Specify ethernet PHY reset timings
      arm64: dts: renesas: r8a779g0: Add GICv3 ITS and update PCIe nodes
      arm64: dts: renesas: r8a779h0: Add GICv3 ITS and update PCIe node
      arm64: dts: renesas: r8a779g0: Add DSC
      arm64: dts: renesas: sparrow-hawk: Enable DisplayPort by adding DSC
      arm64: dts: renesas: sparrow-hawk: Align MSIOF1 PFC node name with=
 label
      arm64: dts: renesas: sparrow-hawk: Add overlay for WaveShare 2CH C=
ANFD HAT
      arm64: dts: imx8mm: imx8mp: Update EEPROM with nWP GPIO, label and=
 layout
      arm64: dts: renesas: r8a779f0: Add GICv3 ITS and update PCIe nodes
      arm64: dts: renesas: ironhide: Align inline ECC carveout sizes wit=
h bootloader settings
      dt-bindings: arm: stm32: Document STM32MP23xx/STM32MP25xx DHCOS So=
M and Breakout Board and DHSBC
      arm64: dts: st: Fix SDMMC1 indent on stm32mp231
      arm64: dts: st: Fix SDMMC1 indent on stm32mp251
      arm64: dts: st: Add SDMMC2 and SDMMC3 nodes on stm32mp231
      arm64: dts: st: Add SDMMC3 nodes on stm32mp251 and update SDMMC2 m=
ax freq
      arm64: dts: st: Add OMM node on stm32mp231
      arm64: dts: renesas: r8a779f0: Add PCIe Application/Local register=
 reset
      arm64: dts: renesas: r8a779g0: Add PCIe Application/Local register=
 reset
      arm64: dts: renesas: r8a779h0: Add PCIe Application/Local register=
 reset
      arm64: dts: st: Add pinmux nodes for DH electronics STM32MP23xx/ST=
M32MP25xx DHCOS SoM and Breakout Board
      arm64: dts: st: Add support for DH electronics STM32MP23xx/STM32MP=
25xx DHCOS SoM and Breakout Board and DHSBC
      MAINTAINERS: Add DH electronics DHCOS SoM entry and fix email addr=
ess
      dt-bindings: arm: stm32: Document st,stm32mp23/25-syscfg subnodes =
and cells
      soc: st: Add STM32MP2 SYSCFG driver

Markus Niebel (1):
      arm64: dts: imx95-tqma9596sa-mb-smarc-2.dts: improve SD reset pulse

Markus Schneider-Pargmann (TI) (9):
      arm64: dts: ti: k3-am62a-phycore-som: Fix wkup R5F memory region s=
ize
      arm64: dts: ti: k3-am62d2-evm: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62a7-sk: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62p-verdin: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62p5-sk: Fix wkup R5F memory region size
      arm64: dts: ti: var-som-am62p: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62a: Split r5f memory region
      arm64: dts: ti: k3-am62p: Split r5f memory region
      arm64: dts: ti: k3-am62*: Add wkup R5F nodes to pre-ram bootphase

Martino Dell'Ambrogio (2):
      arm64: dts: mediatek: mt7986a-bananapi-bpi-r3: add ramoops region
      arm64: dts: mediatek: mt7988a-bananapi-bpi-r4: add ramoops region

Mateusz Nowicki (7):
      arm64: dts: st: fix arm,smc-id of the SMC watchdog on stm32mp2
      arm64: dts: st: add sdmmc2 pins_b for stm32mp25
      arm64: dts: st: enable eMMC on stm32mp257f-dk
      arm64: dts: st: add digital temperature sensor on stm32mp251
      arm64: defconfig: enable Moortec MR75203 PVT controller
      arm64: dts: st: fix sai3b unit address on stm32mp251
      arm64: dts: st: fix sai3b unit address on stm32mp231

Maud Spierings (2):
      arm64: dts: imx93-11x11-frdm-common: fix the rtc aliases
      arm64: dts: imx93-11x11-frdm: add missing vcc-supply

Md Sadre Alam (3):
      arm64: dts: qcom: ipq9574-rdp-common: Enable quad SPI mode for SPI=
-NAND
      arm64: dts: qcom: ipq5424-rdp466: Enable quad SPI mode for SPI-NAND
      arm64: dts: qcom: ipq5332-rdp-common: Enable quad SPI mode for SPI=
-NAND

Mehmet Fide (6):
      ARM: dts: vf500: describe the Cortex-A5 L1 caches
      ARM: dts: vf610: describe the L2 cache geometry
      ARM: dts: vf-colibri: apply the EXT_IO pin group
      ARM: dts: vf-colibri: name the SODIMM gpio lines
      dt-bindings: arm: fsl: add the Colibri VF50 and VF61 on Iris
      ARM: dts: vf: add Iris carrier board support for Colibri VF50 and =
VF61

Michael Walle (1):
      arm64: dts: ti: am62p/j722s: Add GPU node

Mikko Perttunen (1):
      ARM: tegra: Add core supply for Tegra114 boards

Mizuno Miotsuki (2):
      dt-bindings: arm: rockchip: Add DFRobot UNIHIKER M10 V1.2
      arm64: dts: rockchip: Add DFRobot UNIHIKER M10 V1.2

Mohd Ayaan Anwar (4):
      arm64: dts: qcom: lemans-evk: fix SerDes PHY regulator supplies
      arm64: dts: qcom: lemans-ride-common: fix SerDes PHY regulator sup=
plies
      arm64: dts: qcom: monaco-evk: fix SerDes PHY regulator supplies
      arm64: dts: qcom: qcs8300-ride: fix SerDes PHY regulator supplies

Monish Chunara (5):
      dt-bindings: mmc: sdhci-msm: Document the Glymur compatible
      arm64: dts: qcom: glymur: Add SD Card support
      arm64: dts: qcom: glymur-crd: Enable SD card
      arm64: dts: qcom: shikra: Add SD Card support
      arm64: dts: qcom: shikra-evk: Enable SD card

Moteen Shah (1):
      dt-bindings: ti: Update audio-refclk binding and j721e system cont=
roller

Mukesh Ojha (8):
      dt-bindings: arm: cpus: Add Oryon PartNum 3 CPU compatibles
      arm64: dts: qcom: hawi: Add header file for IPCC physical client I=
Ds
      arm64: dts: qcom: Introduce Hawi SoC
      arm64: dts: qcom: hawi: Add base MTP board
      arm64: dts: qcom: hawi: Sort IPCC client IDs
      arm64: dts: qcom: hawi: Fix PCIe IOMMU maps
      arm64: dts: qcom: hawi: Enable SoCCP by default
      arm64: dts: qcom: hawi: Trivial fix

Muzaffer Kadir (2):
      dt-bindings: vendor-prefixes: Add General Mobile
      dt-bindings: arm: qcom: Document MSM8952 SoC binding

Nathan Morrisson (2):
      dt-bindings: arm: ti: Add bindings for PHYTEC AM67x based hardware
      arm64: dts: ti: Add support for the phyCORE-AM67x

Neeraj Soni (2):
      arm64: dts: qcom: kodiak: enable inline crypto engine for SDHC
      arm64: dts: qcom: monaco: enable inline crypto engine for SDHC

Neil Armstrong (3):
      arm64: dts: qcom: sm8650-ayaneo-pocket-s2: switch sound card to ay=
aneo,pocket-s2-sndcard
      dt-bindings: arm: qcom: document the Valve Deckard headset
      arm64: dts: qcom: sm8650: Add initial Valve Deckard devicetree

Nicolo Giuliani (3):
      dt-bindings: vendor-prefixes: Add Sophos
      dt-bindings: arm: marvell: Add Sophos XGS 107w NPU
      arm64: dts: marvell: Add Sophos XGS 107w NPU board

Nihal Kumar Gupta (5):
      arm64: dts: qcom: shikra: Add CAMSS node for Shikra
      arm64: dts: qcom: shikra: Add CCI definitions for Shikra
      arm64: dts: qcom: shikra: Add mclks pin configuration for Shikra
      arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera: Add DT overlay=
 for Shikra
      arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add DT overlay for=
 Shikra

Nora Schiffer (2):
      ARM: dts: imx7-tqma7: correctly specify PMIC voltage constraints
      ARM: dts: imx7-tqma7: sort I2C device nodes by address

Oleg Keri (1):
      arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the camera privac=
y switch

Oleksii Onchul (2):
      dt-bindings: arm: qcom: Add Xiaomi 11 Lite 5G NE
      arm64: dts: qcom: sm7325: Add Xiaomi 11 Lite 5G NE

Oualid Derouiche (6):
      arm64: dts: imx93-kontron: Make USB-C connector "device-only"
      arm64: dts: imx8mm-kontron: Add GPIO labels and comments
      arm64: dts: imx8mm-kontron: Add SPI EERAM on BL device
      arm64: dts: imx8mp-kontron: Fix LVDS clock frequency for DL device
      ARM: dts: imx6ul-kontron-bl-common: Add GPIO labels
      ARM: dts: imx6ul-kontron-bl-common: Fix USB OTG1 ID pin configurat=
ion

Ovidiu Panait (5):
      arm64: dts: renesas: r9a09g057: Switch GBETH TX queue scheduling t=
o WRR
      arm64: dts: renesas: r9a09g056: Switch GBETH TX queue scheduling t=
o WRR
      arm64: dts: renesas: r9a09g047: Switch GBETH TX queue scheduling t=
o WRR
      arm64: dts: renesas: r9a09g077: Switch GBETH TX queue scheduling t=
o WRR
      arm64: dts: renesas: r9a09g087: Switch GBETH TX queue scheduling t=
o WRR

Pablo Correa G=C3=B3mez (3):
      arm64: dts: qcom: sdm670: add default uart pinctrl nodes
      arm64: dts: qcom: sdm670: add debug uart soc node
      arm64: dts: qcom: sdm670-google-common: enable debug uart

Patrice Chotard (1):
      ARM: dts: stm32: Remove User-PA13 button on stm32mp135f-dk

Paul Cercueil (1):
      ARM: dts: samsung: exynos4210-*: Fix Bluetooth nodes

Paul Sajna (1):
      arm64: dts: qcom: sdm845-lg: fix sdcard pinctrl nodes

Pavan Kumar (1):
      arm64: dts: qcom: qcm6490-idp: Add IPA node

Peng Fan (12):
      arm64: dts: imx8dxl-evk: fix reserved memory node names for remote=
proc
      arm64: dts: imx8qm-mek: fix reserved memory node names for remotep=
roc
      arm64: dts: imx8qm-mek: fix dsp reserved memory node names for rem=
oteproc
      arm64: dts: imx8qxp-mek: fix reserved memory node names for remote=
proc
      arm64: dts: imx8qxp-mek: fix dsp reserved memory node names for re=
moteproc
      arm64: dts: imx8ulp-evk: fix reserved memory node names for remote=
proc
      arm64: dts: imx93-11x11-frdm: fix reserved memory node names for r=
emoteproc
      arm64: dts: imx93-14x14-evk: fix reserved memory node names for re=
moteproc
      arm64: dts: imx93-9x9-qsb: fix reserved memory node names for remo=
teproc
      arm64: dts: imx8dxl-sr-som: fix reserved memory node names for rem=
oteproc
      arm64: dts: imx93-11x11-evk: fix reserved memory node names for re=
moteproc
      arm64: dts: imx95-15x15-frdm: fix reserved memory node names for r=
emoteproc

Peter Griffin (3):
      dt-bindings: arm: google: Add dt bindings for frankel/blazer/musta=
ng
      arm64: defconfig: enable Tensor G5 SoC family
      arm64: dts: google: lga: fixup #size-cells DT warning

Peter Robinson (5):
      arm64: dts: broadcom: bcm2712: adjust display status
      arm64: dts: broadcom: bcm2712: add arm PMU
      arm64: dts: broadcom: bcm2712: Add thermal monitor
      arm64: dts: broadcom: bcm2712: Add USB OTG port
      arm64: dts: rockchip: Add missing audio codec supplies to Pinebook=
 Pro

Pierre Gondois (3):
      arm64: dts: fvp: Add cpu-map property
      arm64: dts: fvp: Add EL2 Generic watchdog
      arm64: dts: fvp: Add additional PCIe memory region

Prathamesh Shete (1):
      arm64: tegra: Add Tegra264 SDMMC1 device tree node

Primoz Fiser (3):
      arm64: dts: imx8mp-phyboard-pollux-peb-av-10: Fix SAI master assig=
nment
      arm64: dts: imx8mp-phyboard-pollux: add PEB-WLBT-07 expansion board
      ARM: dts: imx6dl-phytec-mira: Add phyBOARD-Mira-i.MX6DL with eMMC

Puranam V G Tejaswi (2):
      arm64: dts: qcom: eliza: Add GPU nodes
      arm64: dts: qcom: eliza-mtp: Enable Adreno A722 GPU

Qiang Yu (6):
      arm64: dts: qcom: glymur: Add PCIe3 PHY and PCIe3a controller nodes
      arm64: dts: qcom: glymur-crd: Add PHY supplies for pcie3_phy
      arm64: dts: qcom: mahua: Replace pcie3a/pcie3_phy with dedicated p=
cie3b_phy
      arm64: dts: qcom: mahua-crd: Add PHY supplies for pcie3b_phy
      arm64: dts: qcom: hamoa: Drop unused #reset-cells from TCSR node
      arm64: dts: qcom: hamoa/purwa: Add QREF regulator supplies

Qingqing Zhou (1):
      arm64: dts: qcom: kaanapali: add the GPU SMMU node

Quentin Schulz (2):
      arm64: dts: rockchip: enable CAN0 on RK3588 Jaguar
      arm64: dts: rockchip: support CAN1-CAN2-UART4 adapter for RK3588 J=
aguar

Raviteja Laggyshetty (1):
      arm64: dts: qcom: x1e80100: Add clocks for QoS configuration

Reza Kurniawan (3):
      arm64: dts: qcom: msm8917-xiaomi-riva: Enable debug UART console
      arm64: dts: qcom: msm8917-xiaomi-riva: Add GPIO haptic vibrator
      arm64: dts: qcom: msm8917-xiaomi-riva: Add notification LED support

Richard Acayan (1):
      arm64: dts: qcom: sdm670-google: Add NFC support

Richard Zhu (3):
      arm64: dts: imx95: Avoid 32-bit PCIe window System RAM overlap
      arm64: dts: imx94: Avoid 32-bit PCIe window System RAM overlap
      arm64: dts: imx943: Avoid 32-bit PCIe window System RAM overlap

Rob Herring (Arm) (1):
      arm64: dts: freescale: Drop undocumented "hardware" root node prop=
erties

Robert Marko (2):
      arm64: dts: qcom: ipq9574: add reset to SDHC
      arm64: dts: microchip: ev23x71a: enable QSPI

Robin Snyders (1):
      arm64: dts: qcom: sm8150: describe download mode register

Roger Quadros (1):
      ARM: dts: ti: Add device tree nodes for PRU-ICSS1 instance on AM57=
1x

Ronak Raheja (1):
      dt-bindings: usb: qcom,snps-dwc3: Add Hawi compatible

Ronald Claveau (2):
      arm64: dts: amlogic: t7: Add i2c controller node
      arm64: dts: amlogic: t7: khadas-vim4: Add i2c MCU fan node

Rosen Penev (9):
      ARM: dts: helios4: fix lm75 supply name
      ARM: dts: armada-385-clearfog-gtr: fix vmmc property name
      ARM: dts: marvell: add missing SDHCI clock-names
      ARM: dts: armada-395-gp: drop unsupported SDHCI clock-frequency
      ARM: dts: armada-388-helios4: fix vmmc property name
      ARM: dts: helios4: fix vbus-supply for USB2 PHY
      ARM: dts: helios4: fix spi1 location
      ARM: dts: helios4: use national,lm75 compatible
      ARM: dts: helios4: add #phy-cells to USB nop phys

Rudi Heitbaum (1):
      arm64: dts: rockchip: add i2c2 scl timing to rk3399pro-vmarc-som

Sachin Gupta (2):
      arm64: dts: qcom: lemans-pmics: Enable PMIC MBG thermal monitor
      arm64: dts: qcom: monaco-pmics: Enable PMIC MBG thermal monitor

Shawn Guo (8):
      arm64: dts: qcom: Drop deprecated qcom,bus-id from SPMI nodes
      arm64: dts: qcom: Drop redundant qcom-rpmpd.h includes
      arm64: dts: qcom: Add device tree for Nord SoC series
      arm64: dts: qcom: Add device tree for Nord Embedded variant
      dt-bindings: arm: qcom: Document Nord reference boards
      arm64: dts: qcom: Add device tree for Nord RRD board
      arm64: dts: qcom: kodiak: Use hyphen in rpmhpd OPP node names
      arm64: dts: qcom: lemans: Use hyphen in rpmhpd OPP node names

Shawn Lin (4):
      arm64: dts: rockchip: Remove broken-cd on Rock 5 ITX SDIO
      arm64: dts: rockchip: Remove cap-mmc-highspeed from SD-only slots
      arm64: dts: rockchip: add pcie30phy data-lanes on rk3588 coolpi-cm=
5-evb
      arm64: dts: rockchip: fix M.2 E-key reset pinctrl on rk3588 rock-5=
-itx

Sherry Sun (3):
      arm64: dts: imx95-19x19-evk: Describe the PCIe M.2 Key E connector
      arm64: dts: imx943-evk: Describe the PCIe M.2 Key E connector
      arm64: dts: imx95-15x15-frdm: Move PCIe PERST# and vpcie supply to=
 Root Port node

Shujath Mohd (1):
      arm64: dts: qcom: sdm845-sony-xperia-tama: Fix Bluetooth UART pinc=
trl

Siddharth Vadapalli (4):
      arm64: dts: ti: k3-am62a7-sk: Add ethernet alias
      arm64: dts: ti: k3-j7200-common-proc-board: Add ethernet alias
      arm64: dts: ti: k3-j721s2-common-proc-board: Add ethernet alias
      arm64: dts: ti: k3-j722s-evm: Add ethernet alias

Sneh Mankad (1):
      arm64: dts: qcom: shikra: Update rpm-stats compatible to SoC speci=
fic

Sreeshankar K (3):
      dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
      dt-bindings: arm: cpus: Document Kryo 475 CPUs
      dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM=
7250

Srinivas Kandagatla (2):
      dt-bindings: arm: qcom: add Lenovo ThinkPad T14s Gen 7 (Mahua)
      arm64: dts: qcom: Add Lenovo ThinkPad T14s Gen 7

Stanimir Varbanov (1):
      arm64: dts: broadcom: rpi-5: Add RP1 PWM node

Stefano Radaelli (7):
      dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
      ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
      ARM: dts: imx7d: add Variscite MX7CustomBoard support
      arm64: dts: imx95-var-dart-sonata: correct UART8 header pins
      arm64: dts: imx8mm-var-dart: configure SAI3 synchronous RX mode
      arm64: dts: imx8mm-var-dart: add TPM support
      arm64: dts: imx8mm-var-dart: increase PHY reset deassert delay

Sven Peter (6):
      arm64: dts: apple: t602x: Fix cpus node indentation
      arm64: dts: apple: t6030: Fix cpus node indentation
      arm64: dts: apple: t6032: Fix cpus node indentation
      Merge patch series "Initial Apple Silicon M4 device trees and dt-b=
indings"
      Merge patch series "dt-check-style strict fixes for Apple M3, M3 P=
ro/Max/Ultra"
      Merge patch series "Initial Apple Silicon A18 Pro device trees and=
 dt-bindings"

Svyatoslav Ryhel (19):
      dt-bindings: arm: tegra: Add Motorola Artix 4G and Droid X2
      ARM: tegra: tf701t: Configure CPU DFLL clock node
      ARM: tegra: tf701t: Add core-supply to PMC node
      ARM: tegra: tf701t: Add MC and EMC timing nodes
      ARM: tegra: tf701t: Remove pin_ prefix from PMIC pinmux
      ARM: tegra: tf701t: Add thermal zones for nct1008 sensor
      ARM: tegra: tf701t: Tune MMC devices
      ARM: tegra: tf701t: Fix BCM43341 WiFi/BT chip configuration
      ARM: tegra: tf701t: Complete power sensor node
      ARM: tegra: tf701t: Configure UART-B line used for GPS
      ARM: tegra: tf701t: Add chosen node
      ARM: tegra: Add device-tree for Motorola Atrix 4G and Droid X2
      ARM: tegra: lg-x3: Adjust WiFi node
      ARM: tegra: lg-x3: Remove pinctrl-* properties duplication
      ARM: tegra: lg-x3: Lower supported suspend mode
      ARM: tegra: lg-x3: Add light sensor node
      ARM: tegra: lg-x3: Add flash LEDs controller node
      ARM: tegra: lg-x3: Add haptic engine node
      ARM: tegra: lg-x3: Add backlight LED controller node

Taniya Das (11):
      dt-bindings: clock: qcom,milos-camcc: Add missing power-domains su=
pport
      dt-bindings: clock: qcom,milos-videocc: Add missing power-domains =
support
      dt-bindings: clock: qcom: Add video clock controller on Qualcomm E=
liza SoC
      dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
      dt-bindings: clock: qcom: Add support for CAMCC for Eliza
      arm64: dts: qcom: milos: Add power-domains for camcc and videocc
      arm64: dts: qcom: eliza: Add support for MM clock controllers
      dt-bindings: clock: qcom: Add GCC video axi reset clocks for Nord
      dt-bindings: clock: qcom: Add video clock controller on Nord SoC
      dt-bindings: clock: qcom: Add support for Camera Clock Controller =
for Nord
      arm64: dts: qcom: nord: Add more clock controller nodes

Teguh Sobirin (5):
      arm64: dts: qcom: Add AYN QCS8550 Common
      arm64: dts: qcom: Add AYN Odin 2 Mini
      arm64: dts: qcom: Add AYN Odin 2 Portal
      arm64: dts: qcom: Add AYN Thor
      arm64: dts: qcom: qcs8550: add basic devicetree for Ayaneo Pocket =
DS gaming console

Thierry Reding (30):
      arm64: tegra: Add PWM controllers on Tegra264
      arm64: tegra: Add PWM fan on Jetson AGX Thor DevKit
      arm64: tegra: Reorder reg and reg-names to match bindings
      arm64: tegra: Add PCIe root ports on Tegra264
      dt-bindings: memory: tegra: Fix Tegra132 compatible string
      arm64: tegra: Clean up AHUB on Tegra132
      arm64: tegra: Adjust AHUB range on Tegra210
      arm64: tegra: Clean up AHUB on Tegra186
      arm64: tegra: Clean up AHUB on Tegra194
      arm64: tegra: Clean up AHUB on Tegra234
      arm64: tegra: Clean up AHUB on Tegra264
      arm64: tegra: Clean up some whitespace issues on Tegra264
      arm64: tegra: Fix up cooling map names on Tegra194
      arm64: tegra: Fix up cooling map names on Tegra186
      arm64: tegra: Fix up cooling map names on Tegra210
      arm64: tegra: Use consistent key code for force-recovery button
      arm64: tegra: Enable GPIO keys on Jetson AGX Thor
      arm64: tegra: Add thermal zones for Tegra264
      arm64: tegra: Add cooling device on Jetson AGX Thor DevKit
      arm64: tegra: Enable built-in RTC on Jetson AGX Thor
      dt-bindings: fuse: Document compatible string for Tegra264 FUSE
      arm64: tegra: Add FUSE block on Tegra264
      arm64: tegra: Add missing *-cells properties for I2C controllers
      arm64: tegra: Add I2C aliases for Tegra264
      arm64: tegra: Add NVIDIA Jetson AGX Thor module EEPROM
      arm64: tegra: Add NVIDIA Jetson AGX Thor system EEPROM
      arm64: tegra: Add thermal sensor for Jetson AGX Thor
      Merge branch 'for-7.4/dt-bindings' into for-7.4/dt-bindings
      ARM: tegra: Clean up AHUB on Tegra124
      arm64: tegra: Add Tegra132 specific compatible for AHUB

Thomas Turner (4):
      dt-bindings: gpu: arm,mali-bifrost: add exynos850-mali compatible
      arm64: dts: exynos: Add GPU/Mali Bifrost node to Exynos850
      dt-bindings: arm: samsung: Add compatible for Samsung Galaxy A21s =
(SM-A217F)
      arm64: dts: exynos: Add initial support for Samsung Galaxy A21s (S=
M-A217F)

Tomer Maimon (4):
      arm64: dts: nuvoton: npcm845: Split APB address ranges
      arm64: dts: nuvoton: npcm845: Add peripheral nodes
      arm64: dts: nuvoton: npcm845-evb: Fix DTS coding style
      arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes

Tommaso Merciai (4):
      arm64: dts: renesas: r9a09g047e57-smarc: Set I2C1 clock frequency =
to 1 MHz
      arm64: dts: renesas: r9a08g046: Add USB2.0 placeholder nodes
      arm64: dts: renesas: r9a09g047: Add USB2.0 support
      arm64: dts: renesas: r9a09g047e57-smarc: Enable USB2.0 support

Troy Mitchell (4):
      MAINTAINERS: Add Troy Mitchell as a SpacemiT SoC reviewer
      riscv: dts: spacemit: Add K3 I2C6 pinctrl state
      riscv: dts: spacemit: Add CTF2301 on K3 CoM260
      riscv: dts: spacemit: k3: add i2s0-i2s5 nodes

Umang Chheda (3):
      dt-bindings: arm: qcom: Add monaco-ac-evk support
      arm64: dts: qcom: monaco: Add monaco-ac EVK board
      arm64: dts: qcom: monaco-ac-evk: Add IFP mezzanine

Valentin Caron (1):
      ARM: dts: stm32: add pins for spi4 and spi5 in stm32mp15-pinctrl

Viken Dadhaniya (2):
      arm64: dts: qcom: talos-evk-som: Add firmware-name to QUPv3 nodes
      arm64: dts: qcom: qcs6490-rb3gen2: Increase MCP2518FD SPI frequenc=
y to 17MHz

Vinayak Katoch (1):
      arm64: dts: qcom: agatti: Add memory-region for audio PD

Vincent Jardin (4):
      dt-bindings: vendor-prefixes: add Free Mobile
      dt-bindings: arm: fsl: add Free Mobile Nodebox v3 CPU Module
      arm64: dts: freescale: add Nodebox v3 CPU Module
      arm64: dts: lx2160a: set #pinctrl-cells on the pinmux node

Vincent Legoll (1):
      riscv: dts: spacemit: orangepi-rv2: Add cpu scaling for K1 SoC

Vivek Aknurwar (1):
      dt-bindings: clock: qcom: Add Hawi CAMCC compatible strings

Waqar Hameed (1):
      arm64: dts: exynos: Add missing space in compatible

Wei Deng (6):
      arm64: dts: qcom: hamoa: Add graph port/endpoint anchors to pcie4_=
port0 and uart14
      arm64: dts: qcom: hamoa: Add compatible to the PCIe Root Port
      arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe M.2 Key E conne=
ctor
      arm64: dts: qcom: purwa-iot-evk: Describe the PCIe M.2 Key E conne=
ctor
      arm64: dts: qcom: monaco: Add compatible to the PCIe Root Port
      arm64: dts: qcom: monaco-evk: Describe the PCIe M.2 Key E connector

William Bright (2):
      arm64: dts: qcom: qcs8550: Add IMDT QCS8550 SoM
      arm64: dts: qcom: qcs8550: Add IMDT QCS8550 SBC

Wolfram Sang (6):
      ARM: dts: renesas: lager: Specify correct connector for i2cexio0 b=
us
      ARM: dts: renesas: lager: Use inclusive wording
      ARM: dts: renesas: r9a06g032-rzn1d400: Don't enable gpiochips whic=
h are always on
      ARM: dts: renesas: r9a06g032: Don't set status to the default value
      ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable GPIOs on CN12
      arm64: dts: renesas: r8a78000: Add I2C nodes

Xilin Wu (2):
      arm64: dts: qcom: sc8280xp: Add more thermal zones
      arm64: dts: qcom: sc8280xp: Mark FastRPC context banks as dma-cohe=
rent

Xin Liu (3):
      arm64: dts: qcom: purwa-iot-evk: use on-board crystal for PS8830 r=
etimers
      arm64: dts: qcom: hamoa-iot-evk: use on-board crystal for PS8830 r=
etimers
      arm64: dts: qcom: hamoa-iot-evk: switch typec0 to PS8830 retimer

Xueyao An (1):
      arm64: dts: qcom: shikra: Unreserve GPIOs 14-17 blocking SPI5 acce=
ss

Yaozhong Li (3):
      arm64: dts: rockchip: fix analog headphone output on rk3399-firefly
      arm64: dts: rockchip: disable unused i2s0 on rk3399-firefly
      arm64: dts: rockchip: enable HDMI audio on rk3399-firefly

Yixun Lan (1):
      Merge branch 'spacemit-misc-for-next' into spacemit-for-next

Youngwon Son (1):
      arm64: dts: rockchip: Enable the NPU on ODROID-M2

Yuanjie Yang (2):
      dt-bindings: arm: qcom: Add Advantech SOM-DB5830
      arm64: dts: qcom: hamoa: Add Advantech SOM-DB5830

Yunus Bas (2):
      ARM: dts: imx6dl: Add a label to cpu1 node
      ARM: dts: imx6qdl: phycore-som: Add custom volt/freq table

Yureka Lilian (15):
      dt-bindings: arm: cpus: Add Apple M4 CPU core compatibles
      dt-bindings: interrupt-controller: apple,aic2: Add apple,t8132 com=
patible
      dt-bindings: arm: apple: apple,pmgr: Add t8132 compatible
      dt-bindings: power: apple,pmgr-pwrstate: Add t8132 compatible
      dt-bindings: pinctrl: apple,pinctrl: Add t8132 compatible
      dt-bindings: i2c: apple,i2c: Add t8132 compatible
      dt-bindings: pwm: apple,s5l-fpwm: Add t8132 compatible
      dt-bindings: arm: apple: Add M4 based devices
      arm64: dts: apple: Add minimal t8132 (M4) device trees
      dt-bindings: arm: cpus: Add Apple A18 Pro CPU core compatibles
      dt-bindings: arm: apple: apple,pmgr: Add t8140 compatible
      dt-bindings: arm: power: apple,pmgr-pwrstate: Add t8140 compatible
      dt-bindings: interrupt-controller: apple,aic2: Add t8140 compatible
      dt-bindings: arm: apple: Add A18 Pro based devices
      arm64: dts: apple: Add minimal MacBook Neo device tree

Zakariya Hadrami (3):
      dt-bindings: arm: mediatek: Add MT8127 Amazon ford
      ARM: dts: mediatek: mt8127: Add watchdog support
      ARM: dts: mediatek: Add basic support for Amazon ford board

=E5=AE=89=E5=AE=B9 (3):
      dt-bindings: arm: rockchip: Add FriendlyElec NanoPi R28S
      arm64: dts: rockchip: Split out the common NanoPi RK3528 parts
      arm64: dts: rockchip: Add devicetree for the FriendlyElec NanoPi R=
28S

 Documentation/devicetree/bindings/arm/apple.yaml   |   32 +
 .../devicetree/bindings/arm/apple/apple,pmgr.yaml  |    2 +
 .../devicetree/bindings/arm/bcm/bcm2835.yaml       |    6 +
 Documentation/devicetree/bindings/arm/cpus.yaml    |    8 +
 Documentation/devicetree/bindings/arm/fsl.yaml     |   70 +-
 Documentation/devicetree/bindings/arm/google.yaml  |   48 +-
 .../bindings/arm/marvell/armada-7k-8k.yaml         |    7 +
 .../devicetree/bindings/arm/mediatek.yaml          |    1 +
 .../devicetree/bindings/arm/qcom-soc.yaml          |    4 +-
 Documentation/devicetree/bindings/arm/qcom.yaml    |   60 +
 .../devicetree/bindings/arm/rockchip.yaml          |   44 +-
 .../bindings/arm/samsung/samsung-boards.yaml       |    1 +
 .../bindings/arm/stm32/st,stm32-syscon.yaml        |   30 +-
 .../devicetree/bindings/arm/stm32/stm32.yaml       |   39 +-
 Documentation/devicetree/bindings/arm/sunxi.yaml   |   10 +
 Documentation/devicetree/bindings/arm/tegra.yaml   |    6 +
 Documentation/devicetree/bindings/arm/ti/k3.yaml   |    7 +
 .../devicetree/bindings/clock/qcom,hawi-gpucc.yaml |   80 +
 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    |   23 +-
 .../bindings/clock/qcom,milos-camcc.yaml           |   39 +-
 .../bindings/clock/qcom,milos-videocc.yaml         |   29 +-
 .../bindings/clock/qcom,sm8450-camcc.yaml          |   47 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 .../bindings/clock/qcom,sm8450-videocc.yaml        |    2 +
 .../bindings/clock/ti,am62-audio-refclk.yaml       |    8 +-
 .../bindings/display/bridge/fsl,ldb.yaml           |   23 +-
 .../devicetree/bindings/display/fsl,lcdif.yaml     |    1 +
 .../embedded-controller/qcom,hamoa-crd-ec.yaml     |    3 +
 .../bindings/fuse/nvidia,tegra20-fuse.yaml         |    1 +
 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  |    1 +
 .../devicetree/bindings/i2c/apple,i2c.yaml         |    1 +
 .../devicetree/bindings/input/omap-keypad.txt      |   28 -
 .../devicetree/bindings/input/ti,omap4-keypad.yaml |   63 +
 .../bindings/interrupt-controller/apple,aic2.yaml  |    2 +
 .../thead,c900-aclint-mswi.yaml                    |    1 +
 .../thead,c900-aclint-sswi.yaml                    |    5 +-
 .../memory-controllers/nvidia,tegra124-emc.yaml    |   10 +-
 .../memory-controllers/nvidia,tegra124-mc.yaml     |    1 +
 .../devicetree/bindings/mfd/st,stmpe.yaml          |   25 +-
 .../devicetree/bindings/mmc/qcom,sdhci-msm.yaml    |    1 +
 .../bindings/net/bluetooth/qcom,wcn6750-bt.yaml    |   10 +-
 .../bindings/net/wireless/qcom,ath11k.yaml         |   16 +-
 .../devicetree/bindings/pinctrl/apple,pinctrl.yaml |    1 +
 .../bindings/power/apple,pmgr-pwrstate.yaml        |    2 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |    2 +
 .../bindings/power/renesas,rcar-sysc.yaml          |    7 +-
 .../bindings/power/riscv,rpmi-device-power.yaml    |   65 +
 .../power/riscv,rpmi-mpxy-device-power.yaml        |   65 +
 .../devicetree/bindings/pwm/apple,s5l-fpwm.yaml    |    1 +
 Documentation/devicetree/bindings/riscv/thead.yaml |    6 +-
 .../bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml       |   62 +
 .../devicetree/bindings/soc/renesas/renesas.yaml   |   37 +
 .../devicetree/bindings/soc/rockchip/grf.yaml      |    1 +
 .../bindings/soc/tegra/nvidia,tegra20-pmc.yaml     |    5 +-
 .../soc/ti/ti,j721e-system-controller.yaml         |    6 +-
 .../devicetree/bindings/timer/sifive,clint.yaml    |    1 -
 .../bindings/timer/thead,c900-aclint-mtimer.yaml   |    1 +
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    |    3 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   14 +
 MAINTAINERS                                        |   18 +-
 arch/arm/boot/dts/actions/owl-s500.dtsi            |   12 +-
 arch/arm/boot/dts/allwinner/sun7i-a20.dtsi         |    2 +-
 arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts        |    2 +-
 .../boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dts |    2 +-
 .../dts/aspeed/aspeed-bmc-supermicro-x11spi.dts    |    2 +-
 arch/arm/boot/dts/gemini/gemini.dtsi               |    4 +-
 .../boot/dts/marvell/armada-385-clearfog-gtr.dtsi  |    2 +-
 arch/arm/boot/dts/marvell/armada-388-helios4.dts   |   27 +-
 arch/arm/boot/dts/marvell/armada-38x.dtsi          |    1 +
 arch/arm/boot/dts/marvell/armada-395-gp.dts        |    1 -
 arch/arm/boot/dts/marvell/armada-39x.dtsi          |    1 +
 arch/arm/boot/dts/marvell/dove.dtsi                |   22 +-
 arch/arm/boot/dts/marvell/kirkwood-6282.dtsi       |   15 +-
 .../dts/marvell/kirkwood-guruplug-server-plus.dts  |    4 +-
 arch/arm/boot/dts/marvell/kirkwood-lsxl.dtsi       |    4 +-
 arch/arm/boot/dts/marvell/kirkwood-synology.dtsi   |   12 +-
 .../arm/boot/dts/marvell/orion5x-rd88f5182-nas.dts |    2 +-
 arch/arm/boot/dts/mediatek/Makefile                |    1 +
 arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dts  |   54 +
 arch/arm/boot/dts/mediatek/mt8127.dtsi             |    7 +
 arch/arm/boot/dts/nvidia/Makefile                  |    2 +
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts  |  885 ++-
 arch/arm/boot/dts/nvidia/tegra114-dalmore.dts      |    4 +-
 arch/arm/boot/dts/nvidia/tegra114-roth.dts         |    4 +-
 arch/arm/boot/dts/nvidia/tegra114-tn7.dts          |    4 +-
 arch/arm/boot/dts/nvidia/tegra124.dtsi             |   16 +-
 .../boot/dts/nvidia/tegra20-motorola-daytona.dts   |  107 +
 arch/arm/boot/dts/nvidia/tegra20-motorola-mot.dtsi | 1194 ++++
 .../boot/dts/nvidia/tegra20-motorola-olympus.dts   |  108 +
 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts       |    5 +-
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts       |    5 +-
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi        |  106 +-
 arch/arm/boot/dts/nxp/imx/Makefile                 |   51 +
 arch/arm/boot/dts/nxp/imx/e60k02.dtsi              |    8 +-
 arch/arm/boot/dts/nxp/imx/e70k02.dtsi              |    8 +-
 arch/arm/boot/dts/nxp/imx/imx50-amazon-yoshi.dts   |   59 +
 arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts      |    7 +-
 arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts       |    2 +-
 arch/arm/boot/dts/nxp/imx/imx53-m53.dtsi           |    3 -
 arch/arm/boot/dts/nxp/imx/imx53-qsb.dts            |    2 +-
 .../arm/boot/dts/nxp/imx/imx53-voipac-dmm-668.dtsi |    2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-b125pv2.dts       |    2 +
 arch/arm/boot/dts/nxp/imx/imx6dl-b125v2.dts        |    2 +
 arch/arm/boot/dts/nxp/imx/imx6dl-mamoj.dts         |    2 +-
 .../dts/nxp/imx/imx6dl-phytec-mira-rdk-emmc.dts    |   75 +
 .../dts/nxp/imx/imx6dl-phytec-mira-rdk-nand.dts    |    2 +-
 .../dts/nxp/imx/imx6dl-phytec-phycore-som.dtsi     |   23 +
 arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts        |    2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts        |    2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts        |    2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl.dtsi              |    2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-bosch-acc.dts      |    4 +-
 arch/arm/boot/dts/nxp/imx/imx6q-novena.dts         |    3 -
 .../dts/nxp/imx/imx6q-phytec-mira-rdk-emmc.dts     |    2 +-
 .../dts/nxp/imx/imx6q-phytec-mira-rdk-nand.dts     |    2 +-
 .../boot/dts/nxp/imx/imx6q-phytec-phycore-som.dtsi |   75 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi      |    3 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi     |    3 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi       |    1 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi      |   20 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi        |    4 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi    |    2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi   |    4 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi    |   10 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi             |   10 +-
 arch/arm/boot/dts/nxp/imx/imx6sl-kobo-aura2.dts    |    8 +-
 .../boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts    |    8 +-
 arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts          |    2 +-
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi             |   11 -
 arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi    |    1 -
 .../boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi |   38 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi        |    2 +-
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi     |    1 +
 .../arm/boot/dts/nxp/imx/imx7-colibri-iris-v2.dtsi |    1 -
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi        |    1 +
 arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi          |   52 +-
 ...nel-cap-touch-7inch-parallel-touch-adapter.dtso |   58 +
 ...olibri-emmc-panel-cap-touch-7inch-parallel.dtso |   43 +
 ...olibri-emmc-panel-res-touch-7inch-parallel.dtso |   32 +
 .../boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso   |   59 +
 arch/arm/boot/dts/nxp/imx/imx7d-meerkat96.dts      |    2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-nitrogen7.dts      |    1 -
 .../nxp/imx/imx7d-var-som-emmc-mx7customboard.dts  |   23 +
 .../imx7d-var-som-emmc-wm8731-mx7customboard.dts   |   23 +
 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi  |   56 +
 .../dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi  |  358 +
 .../nxp/imx/imx7d-var-som-nand-mx7customboard.dts  |   23 +
 .../imx7d-var-som-nand-wm8731-mx7customboard.dts   |   23 +
 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand.dtsi  |   73 +
 .../imx/imx7d-var-som-v2-emmc-mx7customboard.dts   |   24 +
 .../imx/imx7d-var-som-v2-nand-mx7customboard.dts   |   24 +
 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2.dtsi    |   66 +
 .../arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi |  102 +
 .../arm/boot/dts/nxp/imx/imx7d-var-som-wm8904.dtsi |  118 +
 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi       |  533 ++
 arch/arm/boot/dts/nxp/imx/imx7s-warp.dts           |    2 +-
 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi             |   36 +-
 arch/arm/boot/dts/nxp/ls/ls1021a.dtsi              |   10 +-
 arch/arm/boot/dts/nxp/vf/Makefile                  |    2 +
 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi      |  126 +
 arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi           |   56 +
 arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts    |   14 +
 arch/arm/boot/dts/nxp/vf/vf500.dtsi                |    6 +
 arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts    |   14 +
 arch/arm/boot/dts/nxp/vf/vf610.dtsi                |    3 +
 .../boot/dts/qcom/qcom-msm8960-sony-huashan.dts    |   15 +
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           |  169 +-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |    3 +
 arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts          |    2 +-
 arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts    |    2 +
 .../boot/dts/renesas/r8a7740-armadillo800eva.dts   |    2 +
 arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts     |    2 +
 arch/arm/boot/dts/renesas/r8a7743.dtsi             |    6 +-
 arch/arm/boot/dts/renesas/r8a7744.dtsi             |    6 +-
 arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts     |    2 +
 arch/arm/boot/dts/renesas/r8a7745.dtsi             |    6 +-
 arch/arm/boot/dts/renesas/r8a77470.dtsi            |    6 +-
 arch/arm/boot/dts/renesas/r8a7790-lager.dts        |   28 +-
 arch/arm/boot/dts/renesas/r8a7790-stout.dts        |    4 +-
 arch/arm/boot/dts/renesas/r8a7790.dtsi             |    4 +-
 arch/arm/boot/dts/renesas/r8a7791-koelsch.dts      |    2 +
 arch/arm/boot/dts/renesas/r8a7791-porter.dts       |    2 +
 arch/arm/boot/dts/renesas/r8a7791.dtsi             |    4 +-
 arch/arm/boot/dts/renesas/r8a7792.dtsi             |    4 +-
 arch/arm/boot/dts/renesas/r8a7793-gose.dts         |    2 +
 arch/arm/boot/dts/renesas/r8a7793.dtsi             |    4 +-
 arch/arm/boot/dts/renesas/r8a7794-alt.dts          |    2 +
 arch/arm/boot/dts/renesas/r8a7794-silk.dts         |    2 +
 arch/arm/boot/dts/renesas/r8a7794.dtsi             |    4 +-
 .../arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts |    1 -
 .../arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts |   14 +-
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |    2 -
 arch/arm/boot/dts/samsung/exynos4210-i9100.dts     |    9 +-
 arch/arm/boot/dts/samsung/exynos4210-trats.dts     |    5 +
 .../boot/dts/samsung/exynos4210-universal_c210.dts |    5 +
 arch/arm/boot/dts/samsung/exynos4412-midas.dtsi    |    5 +-
 arch/arm/boot/dts/st/ste-ab8500.dtsi               |   35 +-
 arch/arm/boot/dts/st/ste-ab8505.dtsi               |   52 +-
 arch/arm/boot/dts/st/ste-dbx5x0.dtsi               |    9 +-
 arch/arm/boot/dts/st/ste-href-ab8500.dtsi          |  104 +
 arch/arm/boot/dts/st/ste-href-ab8505.dtsi          |  118 +-
 arch/arm/boot/dts/st/ste-href-stuib.dtsi           |    8 +-
 arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi   |   14 +-
 arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi   |   10 +-
 arch/arm/boot/dts/st/ste-href.dtsi                 |    2 +-
 arch/arm/boot/dts/st/ste-snowball.dts              |   10 +-
 .../boot/dts/st/ste-ux500-samsung-codina-tmo.dts   |    1 +
 arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts  |   25 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts  |   61 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts  |   11 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts  |   59 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts    |    5 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts  |    5 +-
 arch/arm/boot/dts/st/ste-ux500-samsung.dtsi        |   77 +
 arch/arm/boot/dts/st/stm32mp131.dtsi               |   24 +
 arch/arm/boot/dts/st/stm32mp135.dtsi               |   42 +-
 arch/arm/boot/dts/st/stm32mp135f-dk.dts            |   28 +-
 arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi        |   34 +
 arch/arm/boot/dts/st/stm32mp151.dtsi               |   20 +-
 .../arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi |    2 +-
 arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts      |    8 +-
 arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts      |    8 +-
 arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts      |    8 +-
 arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts      |    8 +-
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts           |    7 +-
 arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dts       |    2 +-
 arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi     |    1 +
 arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi      |    2 +-
 arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi    |    2 +
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi          |   33 +-
 arch/arm/boot/dts/ti/keystone/keystone-k2e.dtsi    |    2 +-
 arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi    |   28 +-
 arch/arm/boot/dts/ti/keystone/keystone-k2hk.dtsi   |   16 +-
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi    |   16 +-
 arch/arm/boot/dts/ti/keystone/keystone.dtsi        |    4 +-
 .../boot/dts/ti/omap/am335x-boneblack-hdmi.dtsi    |    2 +-
 arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts |    2 +-
 arch/arm/boot/dts/ti/omap/am335x-shc.dts           |    4 -
 arch/arm/boot/dts/ti/omap/am437x-l4.dtsi           |    2 +-
 arch/arm/boot/dts/ti/omap/am57-pruss.dtsi          |   11 +
 arch/arm/boot/dts/ti/omap/am571x-idk.dts           |   65 +-
 arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts  |    2 +-
 .../boot/dts/ti/omap/am57xx-beagle-x15-common.dtsi |    2 +-
 arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi   |    3 +-
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi             |    2 +-
 .../boot/dts/ti/omap/motorola-mapphone-common.dtsi |    8 +-
 .../dts/ti/omap/motorola-mapphone-mz607-mz617.dtsi |    2 +
 arch/arm/boot/dts/ti/omap/omap3-igep.dtsi          |    2 +-
 arch/arm/boot/dts/ti/omap/omap3-n9.dts             |    5 +-
 arch/arm/boot/dts/ti/omap/omap3-n900.dts           |    3 +-
 arch/arm/boot/dts/ti/omap/omap3-n950.dts           |    5 +-
 arch/arm/boot/dts/ti/omap/omap3-tao3530.dtsi       |    8 +-
 .../boot/dts/ti/omap/omap4-droid-bionic-xt875.dts  |    2 +
 arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dts   |    2 +
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts  |    2 +
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi            |    1 +
 .../dts/ti/omap/omap4-samsung-espresso-common.dtsi |    6 +-
 arch/arm/boot/dts/ti/omap/omap4-sdp.dts            |    2 +
 arch/arm/boot/dts/ti/omap/omap4.dtsi               |    6 +-
 arch/arm/boot/dts/ti/omap/omap5-l4.dtsi            |    1 +
 arch/arm/boot/dts/ti/omap/omap5.dtsi               |    2 +-
 arch/arm/boot/dts/xilinx/zynq-7000.dtsi            |    8 +-
 arch/arm/boot/dts/xilinx/zynq-parallella.dts       |    4 +-
 arch/arm64/Kconfig.platforms                       |    8 +
 arch/arm64/boot/dts/Makefile                       |    1 +
 arch/arm64/boot/dts/actions/s700.dtsi              |    6 +-
 arch/arm64/boot/dts/actions/s900.dtsi              |    6 +-
 arch/arm64/boot/dts/allwinner/Makefile             |    1 +
 .../boot/dts/allwinner/sun50i-a133-teclast-p80.dts |  205 +
 .../boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts  |   22 +
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi       |    4 +-
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |   12 +
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |    5 +
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |    5 +
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi        |    5 +
 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        |    5 +
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        |    5 +
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       |    5 +
 .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  |   13 +
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        |   25 +-
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |    9 +
 .../dts/amlogic/meson-g12b-odroid-go-ultra.dts     |    2 +-
 .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts      |    2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |    2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |    2 +-
 .../boot/dts/amlogic/meson-sm1-odroid-hc4.dts      |    4 +-
 arch/arm64/boot/dts/apple/Makefile                 |    7 +
 arch/arm64/boot/dts/apple/t6001.dtsi               |   11 +-
 arch/arm64/boot/dts/apple/t6002.dtsi               |   18 +-
 arch/arm64/boot/dts/apple/t600x-die0.dtsi          |    3 +-
 arch/arm64/boot/dts/apple/t600x-dieX.dtsi          |    2 +
 arch/arm64/boot/dts/apple/t600x-nvme.dtsi          |    2 +
 arch/arm64/boot/dts/apple/t6021.dtsi               |   10 +-
 arch/arm64/boot/dts/apple/t6022.dtsi               |   18 +-
 arch/arm64/boot/dts/apple/t602x-common.dtsi        |    2 +-
 arch/arm64/boot/dts/apple/t602x-die0.dtsi          |    2 +
 arch/arm64/boot/dts/apple/t602x-dieX.dtsi          |    2 +
 arch/arm64/boot/dts/apple/t602x-nvme.dtsi          |    2 +
 arch/arm64/boot/dts/apple/t6030-pmgr.dtsi          |    1 -
 arch/arm64/boot/dts/apple/t6030.dtsi               |  277 +-
 arch/arm64/boot/dts/apple/t6031-base.dtsi          |  191 +-
 arch/arm64/boot/dts/apple/t6031-die0.dtsi          |   63 +-
 arch/arm64/boot/dts/apple/t6031-dieX.dtsi          |   92 +-
 arch/arm64/boot/dts/apple/t6031-gpio-pins.dtsi     |   18 +-
 arch/arm64/boot/dts/apple/t6031-pmgr.dtsi          |    6 +
 arch/arm64/boot/dts/apple/t6031.dtsi               |   16 +-
 arch/arm64/boot/dts/apple/t6032-j575d.dts          |   10 +-
 arch/arm64/boot/dts/apple/t6032.dtsi               |  193 +-
 arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi     |   15 +-
 arch/arm64/boot/dts/apple/t8122-j504.dts           |   10 +-
 arch/arm64/boot/dts/apple/t8122-j613.dts           |    9 +-
 arch/arm64/boot/dts/apple/t8122-j615.dts           |    9 +-
 arch/arm64/boot/dts/apple/t8122-jxxx.dtsi          |    5 +-
 arch/arm64/boot/dts/apple/t8122-pmgr.dtsi          |    1 -
 arch/arm64/boot/dts/apple/t8122.dtsi               |  254 +-
 arch/arm64/boot/dts/apple/t8132-j604.dts           |   35 +
 arch/arm64/boot/dts/apple/t8132-j623.dts           |   18 +
 arch/arm64/boot/dts/apple/t8132-j624.dts           |   18 +
 arch/arm64/boot/dts/apple/t8132-j713.dts           |   35 +
 arch/arm64/boot/dts/apple/t8132-j715.dts           |   35 +
 arch/arm64/boot/dts/apple/t8132-j773g.dts          |   25 +
 arch/arm64/boot/dts/apple/t8132-jxxx.dtsi          |   48 +
 arch/arm64/boot/dts/apple/t8132-pmgr.dtsi          | 1130 ++++
 arch/arm64/boot/dts/apple/t8132.dtsi               |  467 ++
 arch/arm64/boot/dts/apple/t8140-j700.dts           |   54 +
 arch/arm64/boot/dts/apple/t8140-pmgr.dtsi          |  777 +++
 arch/arm64/boot/dts/apple/t8140.dtsi               |  207 +
 arch/arm64/boot/dts/arm/fvp-base-revc.dts          |   42 +-
 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts |    5 +
 .../boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |   41 +
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts   |   34 +
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          |   91 +
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi       |  128 +
 arch/arm64/boot/dts/cavium/thunder-88xx.dtsi       |    6 +-
 arch/arm64/boot/dts/exynos/Makefile                |    1 +
 arch/arm64/boot/dts/exynos/axis/artpec8.dtsi       |   36 +-
 arch/arm64/boot/dts/exynos/axis/artpec9.dtsi       |   36 +-
 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts      |    8 +-
 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi |    2 -
 arch/arm64/boot/dts/exynos/exynos2200.dtsi         |    1 -
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     |   91 +-
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         |  108 +-
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts |   39 +-
 arch/arm64/boot/dts/exynos/exynos7870-j5y17lte.dts |   34 +-
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |   34 +-
 arch/arm64/boot/dts/exynos/exynos7870-j7xelte.dts  |   35 +-
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |   39 +-
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         |  108 +-
 arch/arm64/boot/dts/exynos/exynos850-a217f.dts     |  200 +
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |   29 +-
 arch/arm64/boot/dts/exynos/exynos8855-smdk.dts     |    2 +-
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     |    2 +-
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi |   51 +-
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |   96 +-
 arch/arm64/boot/dts/freescale/Makefile             |  267 +-
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |    2 +-
 .../arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts |   34 +
 .../boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi      |  330 +
 arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi      |    1 +
 .../arm64/boot/dts/freescale/imx8-apalis-eval.dtsi |    6 +-
 .../boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi |    6 +-
 .../boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi |    6 +-
 .../arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi |   16 +-
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts      |   14 +-
 arch/arm64/boot/dts/freescale/imx8dxl-sr-som.dtsi  |   14 +-
 .../dts/freescale/imx8mm-beacon-baseboard.dtsi     |    2 +-
 .../imx8mm-data-modul-edm-sbc-overlay-cm4.dtso     |   56 +
 ...odul-edm-sbc-overlay-edm-mod-imx8mm-common.dtsi |   59 +
 ...-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi |   99 +
 ...-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso |   79 +
 ...-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtsi |   69 +
 ...-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso |   59 +
 ...-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtsi |   94 +
 ...-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso |   17 +
 ...edm-sbc-overlay-edm-mod-imx8mm-lvds-common.dtsi |  118 +
 ...l-edm-sbc-overlay-edm-mod-imx8mm-lvds-dual.dtsi |   32 +
 ...sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtsi |   12 +
 ...sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso |    7 +
 ...bc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtsi |   12 +
 ...bc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso |    7 +
 ...bc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtsi |   12 +
 ...bc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso |    7 +
 ...bc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtsi |   12 +
 ...bc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso |    7 +
 ...sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtsi |   12 +
 ...sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtso |    7 +
 ...c-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtsi |   12 +
 ...c-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso |    7 +
 ...verlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtsi |   12 +
 ...verlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso |    7 +
 ...edm-sbc-overlay-edm-mod-imx8mm-lvds-single.dtsi |   20 +
 ...-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi |   22 +
 ...odul-edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtso |   18 +
 ...imx8mm-data-modul-edm-sbc-overlay-lvds-3v3.dtsi |   19 +
 ...imx8mm-data-modul-edm-sbc-overlay-lvds-5v0.dtsi |   19 +
 ...mx8mm-data-modul-edm-sbc-overlay-lvds-dual.dtsi |   29 +
 ...data-modul-edm-sbc-overlay-lvds-g070y2-l01.dtsi |   31 +
 ...ata-modul-edm-sbc-overlay-lvds-g101ice-l01.dtsi |   31 +
 ...ata-modul-edm-sbc-overlay-lvds-g121xce-l01.dtsi |   31 +
 ...ata-modul-edm-sbc-overlay-lvds-g156hce-l01.dtsi |   31 +
 ...data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi |   30 +
 ...ta-modul-edm-sbc-overlay-lvds-mi0700a2t-30.dtsi |   31 +
 ...modul-edm-sbc-overlay-lvds-mi1010z1t-1cp11.dtsi |   31 +
 ...8mm-data-modul-edm-sbc-overlay-lvds-single.dtsi |   13 +
 .../dts/freescale/imx8mm-data-modul-edm-sbc.dts    |   64 +-
 .../arm64/boot/dts/freescale/imx8mm-kontron-bl.dts |  107 +-
 .../imx8mm-tx8m-1610-moduline-iv-306-d.dts         |    1 -
 .../imx8mm-tx8m-1610-moduline-mini-111.dts         |    1 -
 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi |   21 +-
 .../boot/dts/freescale/imx8mm-verdin-ivy.dtsi      |    4 +-
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   |    2 +-
 .../dts/freescale/imx8mn-solidsense-n8-compact.dts |    2 -
 .../freescale/imx8mn-vhip4-evalboard-common.dtsi   |    3 +-
 .../dts/freescale/imx8mn-vhip4-evalboard-v1.dts    |    8 +
 .../dts/freescale/imx8mn-vhip4-evalboard-v2.dts    |   28 +-
 .../imx8mn-vhip4-overlay-eeprom-1000.dtso          |  103 +
 .../imx8mn-vhip4-overlay-eeprom-1100.dtso          |  103 +
 .../imx8mn-vhip4-overlay-eeprom-2000.dtso          |  107 +
 .../imx8mp-data-modul-edm-sbc-overlay-cm7.dtso     |   57 +
 ...-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso |   67 +
 ...-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso |   46 +
 ...-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso |   17 +
 ...sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso |    7 +
 ...bc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso |    7 +
 ...bc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso |    7 +
 ...bc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso |    7 +
 ...sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtso |   11 +
 ...c-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso |    7 +
 ...verlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso |    7 +
 ...-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi |   35 +
 ...sbc-overlay-edm-sbc-imx8mp-lvds-g070y2-l01.dtso |   24 +
 ...bc-overlay-edm-sbc-imx8mp-lvds-g101ice-l01.dtso |   24 +
 ...bc-overlay-edm-sbc-imx8mp-lvds-g121xce-l01.dtso |   24 +
 ...bc-overlay-edm-sbc-imx8mp-lvds-g156hce-l01.dtso |   32 +
 ...sbc-overlay-edm-sbc-imx8mp-lvds-g215hvn011.dtso |   36 +
 ...c-overlay-edm-sbc-imx8mp-lvds-mi0700a2t-30.dtso |   24 +
 ...verlay-edm-sbc-imx8mp-lvds-mi1010z1t-1cp11.dtso |   24 +
 ...edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtso |   41 +
 ...edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtso |   14 +
 ...-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi |   79 +
 ...odul-edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtso |   97 +
 ...odul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtso |   69 +
 .../dts/freescale/imx8mp-data-modul-edm-sbc.dts    |  176 +-
 .../dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dts  |    2 +-
 .../boot/dts/freescale/imx8mp-icore-mx8mp.dtsi     |    2 +-
 .../boot/dts/freescale/imx8mp-kontron-dl.dtso      |   11 +
 .../imx8mp-phyboard-pollux-peb-av-10.dtsi          |    5 +-
 .../imx8mp-phyboard-pollux-peb-wlbt-07.dtso        |   76 +
 .../boot/dts/freescale/imx8mp-toradex-smarc.dtsi   |    2 +-
 ...8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33.dtso |    2 +-
 ...8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33.dtso |    2 +-
 .../imx8mp-tx8p-ml81-moduline-display-106.dts      |    1 -
 .../boot/dts/freescale/imx8mp-verdin-ivy.dtsi      |    4 +-
 .../boot/dts/freescale/imx8mp-verdin-yavia.dtsi    |    7 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |    2 +-
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts       |    6 +
 .../boot/dts/freescale/imx8mq-librem5-devkit.dts   |    4 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  |    4 +-
 arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts  |    2 +-
 .../arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi |   16 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |  168 +-
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       |   32 +-
 arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi  |   39 +
 .../boot/dts/freescale/imx8qm-var-som-symphony.dts |    2 +-
 arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi  |    6 +-
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |   20 +-
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts      |    4 +-
 arch/arm64/boot/dts/freescale/imx9-mqs.dtso        |   57 +
 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts  |   55 +-
 .../boot/dts/freescale/imx91-11x11-frdm-s.dts      |    2 -
 arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts |    2 -
 .../freescale/imx91-9x9-qsb-tianma-tm050rdh03.dtso |  104 +
 arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts    |   52 +
 .../dts/freescale/imx91-lino-verdin-dahlia.dts     |   24 +
 .../boot/dts/freescale/imx91-lino-verdin-dev.dts   |   24 +
 arch/arm64/boot/dts/freescale/imx91-lino.dtsi      |  305 +
 .../boot/dts/freescale/imx91-toradex-osm-dev.dts   |   22 +
 .../boot/dts/freescale/imx91-toradex-osm.dtsi      |  303 +
 arch/arm64/boot/dts/freescale/imx91.dtsi           |   11 +
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi |    6 +
 .../boot/dts/freescale/imx93-11x11-evk-common.dtsi |    5 +-
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts  |   54 +-
 .../dts/freescale/imx93-11x11-frdm-common.dtsi     |  681 ++
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts |  682 +-
 arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts  |   59 +-
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts    |    7 +-
 .../dts/freescale/imx93-imx91-lino-common.dtsi     |  536 ++
 .../freescale/imx93-imx91-lino-verdin-common.dtsi  |  175 +
 .../imx93-imx91-lino-verdin-dahlia-common.dtsi     |  198 +
 .../imx93-imx91-lino-verdin-dev-common.dtsi        |  216 +
 .../freescale/imx93-imx91-toradex-osm-common.dtsi  |  526 ++
 .../imx93-imx91-toradex-osm-dev-common.dtsi        |  324 +
 .../boot/dts/freescale/imx93-kontron-bl-osm-s.dts  |    6 +-
 .../boot/dts/freescale/imx93-kontron-osm-s.dtsi    |   32 +-
 .../dts/freescale/imx93-lino-verdin-dahlia.dts     |   24 +
 .../boot/dts/freescale/imx93-lino-verdin-dev.dts   |   24 +
 arch/arm64/boot/dts/freescale/imx93-lino.dtsi      |  359 +
 .../boot/dts/freescale/imx93-toradex-osm-dev.dts   |   22 +
 .../boot/dts/freescale/imx93-toradex-osm.dtsi      |  357 +
 arch/arm64/boot/dts/freescale/imx93w-frdm.dts      |   23 +
 arch/arm64/boot/dts/freescale/imx94.dtsi           |    5 +-
 .../boot/dts/freescale/imx943-evk-sdwifi.dtso      |   25 +
 arch/arm64/boot/dts/freescale/imx943-evk.dts       |  138 +-
 arch/arm64/boot/dts/freescale/imx943.dtsi          |    2 +-
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts  |   48 +-
 arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts |   38 +-
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts  |   55 +-
 .../boot/dts/freescale/imx95-19x19-frdm-pro.dts    |    2 -
 .../boot/dts/freescale/imx95-aquila-clover.dts     |   23 +
 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts |   18 +
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi    |   15 +-
 arch/arm64/boot/dts/freescale/imx95-navq.dts       |  228 +
 .../boot/dts/freescale/imx95-toradex-osm-dev.dts   |  404 ++
 .../boot/dts/freescale/imx95-toradex-osm.dtsi      | 1032 +++
 .../boot/dts/freescale/imx95-toradex-smarc-dev.dts |    8 +
 .../boot/dts/freescale/imx95-toradex-smarc.dtsi    |    8 +
 .../dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts  |    2 +
 .../arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi |   75 +
 .../boot/dts/freescale/imx95-var-dart-sonata.dts   |    2 +-
 arch/arm64/boot/dts/freescale/imx95.dtsi           |   18 +-
 arch/arm64/boot/dts/freescale/imx952-evk.dts       |   77 +-
 arch/arm64/boot/dts/freescale/imx952-frdm.dts      |    9 +
 arch/arm64/boot/dts/freescale/imx952-frdm.dtsi     |  726 +++
 arch/arm64/boot/dts/freescale/imx952.dtsi          |   19 +-
 arch/arm64/boot/dts/freescale/s32g2.dtsi           |    2 +-
 arch/arm64/boot/dts/freescale/s32g3.dtsi           |    2 +-
 arch/arm64/boot/dts/google/Makefile                |    6 +
 arch/arm64/boot/dts/google/lga-blazer.dts          |   15 +
 arch/arm64/boot/dts/google/lga-frankel.dts         |   15 +
 arch/arm64/boot/dts/google/lga-mustang.dts         |   15 +
 arch/arm64/boot/dts/google/lga-pixel-common.dtsi   |   22 +
 arch/arm64/boot/dts/google/lga.dtsi                |  411 ++
 arch/arm64/boot/dts/marvell/Makefile               |    1 +
 .../boot/dts/marvell/cn9130-sophos-xgs107w.dts     |  188 +
 arch/arm64/boot/dts/mediatek/mt6878-pinfunc.h      |    2 +-
 arch/arm64/boot/dts/mediatek/mt6893-pinfunc.h      |    2 +-
 .../boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts  |   13 +
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi          |    1 +
 .../mediatek/mt7988a-bananapi-bpi-r4-pro-cn13.dtso |    1 +
 .../mediatek/mt7988a-bananapi-bpi-r4-pro-cn14.dtso |    1 +
 .../mediatek/mt7988a-bananapi-bpi-r4-pro-cn15.dtso |    1 +
 .../mediatek/mt7988a-bananapi-bpi-r4-pro-cn18.dtso |    1 +
 .../dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi  |   18 +
 .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi |   13 +
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi       |    5 +
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           |   35 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |    5 +
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi   |    5 +
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi    |    7 +-
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi   |    5 +
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi    |    5 +
 arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts |   13 +
 .../boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi   |  700 +-
 .../arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts |  439 +-
 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi   |    7 +
 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |   22 +-
 .../dts/nvidia/tegra186-p3509-0000+p3636-0001.dts  |    8 +-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |   76 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |    8 +-
 .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi |    8 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |  113 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 1120 ----
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 1011 +--
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           | 1128 +++-
 .../boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi |    9 +-
 .../dts/nvidia/tegra234-p3740-0002+p3701-0008.dts  |   45 +-
 .../boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi |   12 +-
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           |   86 +-
 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi     |   57 +
 .../boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi |  106 +
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           |  796 ++-
 .../boot/dts/nvidia/thermal/nvidia,tegra264-bpmp.h |   20 +
 arch/arm64/boot/dts/qcom/Makefile                  |   50 +
 arch/arm64/boot/dts/qcom/agatti.dtsi               |   89 +-
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi       |   15 +-
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi        |   15 +
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi            |  243 +
 arch/arm64/boot/dts/qcom/eliza-mtp.dts             |   34 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                |  774 ++-
 .../dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts  | 1140 ++++
 .../dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts  |    3 +-
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |    8 +
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           |   36 +-
 .../boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts    |  940 +++
 .../boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts    | 1221 ++++
 arch/arm64/boot/dts/qcom/glymur-qcb.dts            |  699 ++
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  496 +-
 .../boot/dts/qcom/hamoa-advantech-som-6820.dtsi    |   54 +
 .../boot/dts/qcom/hamoa-advantech-som-db5830.dts   |  119 +
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |  261 +-
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi        |   21 +
 .../qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts  |   21 +
 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi          |    1 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |   44 +-
 arch/arm64/boot/dts/qcom/hawi-ipcc.h               |   61 +
 arch/arm64/boot/dts/qcom/hawi-mtp.dts              |  997 +++
 arch/arm64/boot/dts/qcom/hawi.dtsi                 | 6844 +++++++++++++=
+++++++
 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts     |   10 +
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              |   21 +-
 arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi   |    2 +
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts        |    2 +
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              |   16 +
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi   |    2 +
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |    3 +-
 arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts        |  119 +
 arch/arm64/boot/dts/qcom/ipq9650.dtsi              |  666 +-
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |   10 +-
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts         |    8 +
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  472 +-
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |  984 +--
 arch/arm64/boot/dts/qcom/lemans-el2.dtso           |    4 +-
 .../boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso    |   15 +-
 arch/arm64/boot/dts/qcom/lemans-evk.dts            |   16 +-
 arch/arm64/boot/dts/qcom/lemans-pmics.dtsi         |  116 +
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi   |   21 +-
 arch/arm64/boot/dts/qcom/lemans.dtsi               |   24 +-
 arch/arm64/boot/dts/qcom/mahua-crd.dts             |    5 +
 .../qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 1272 ++++
 arch/arm64/boot/dts/qcom/mahua.dtsi                |   89 +
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   |  191 +
 arch/arm64/boot/dts/qcom/milos.dtsi                |  479 +-
 arch/arm64/boot/dts/qcom/monaco-ac-evk.dts         |  938 +++
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts  |  201 +-
 .../boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso    |   12 +-
 arch/arm64/boot/dts/qcom/monaco-evk.dts            |   69 +-
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi         |   62 +
 arch/arm64/boot/dts/qcom/monaco.dtsi               |   16 +-
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts   |   35 +
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts     |    8 +
 .../boot/dts/qcom/msm8939-longcheer-l9100.dts      |    8 +
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |   26 +
 arch/arm64/boot/dts/qcom/msm8953-motorola-deen.dts |  440 ++
 arch/arm64/boot/dts/qcom/msm8976-leeco-s2.dts      |  442 ++
 arch/arm64/boot/dts/qcom/msm8976.dtsi              |    2 +-
 .../boot/dts/qcom/msm8996-oneplus-common.dtsi      |    5 +-
 .../boot/dts/qcom/msm8996-sony-xperia-tone.dtsi    |    7 +-
 .../arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi |    6 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |   45 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |    6 +-
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi        | 1928 ++++++
 arch/arm64/boot/dts/qcom/nord-gearvm.dtsi          | 2848 ++++++++
 arch/arm64/boot/dts/qcom/nord-ride.dts             |  254 +
 arch/arm64/boot/dts/qcom/nord-rrd.dts              |  424 ++
 arch/arm64/boot/dts/qcom/nord.dtsi                 | 4650 +++++++++++++
 arch/arm64/boot/dts/qcom/pm4125.dtsi               |  104 +
 arch/arm64/boot/dts/qcom/pm8005.dtsi               |   35 +
 arch/arm64/boot/dts/qcom/pmh0104-hawi.dtsi         |  103 +
 arch/arm64/boot/dts/qcom/pmi8996.dtsi              |   12 +-
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts         |  206 +-
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi        |   21 +
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |   54 +
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |    6 +
 .../boot/dts/qcom/qcm6490-particle-tachyon.dts     |    3 +-
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi           |    6 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |    7 +-
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |    5 +-
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     |    4 +-
 .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso |   30 +-
 .../dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso |   13 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   24 +-
 .../dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts  |   16 +-
 .../qcs6490-thundercomm-rubikpi3-cam1-imx219.dtso  |  115 +
 .../qcs6490-thundercomm-rubikpi3-cam2-imx219.dtso  |  115 +
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts |   25 +-
 .../boot/dts/qcom/qcs6490-vicharak-axon-mini.dts   |   16 +-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |    8 +-
 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi       |   16 +-
 .../boot/dts/qcom/qcs8550-ayaneo-pocket-ds.dts     | 1742 +++++
 .../arm64/boot/dts/qcom/qcs8550-ayntec-common.dtsi | 1819 ++++++
 .../boot/dts/qcom/qcs8550-ayntec-odin2mini.dts     |   44 +
 .../boot/dts/qcom/qcs8550-ayntec-odin2portal.dts   |   99 +
 arch/arm64/boot/dts/qcom/qcs8550-ayntec-thor.dts   |  250 +
 arch/arm64/boot/dts/qcom/qcs8550-imdt-sbc.dts      |  401 ++
 arch/arm64/boot/dts/qcom/qcs8550-imdt-som.dtsi     |  315 +
 arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts       |   24 +-
 .../boot/dts/qcom/qcs8550-retroidpocket-nova.dts   |  116 +
 .../boot/dts/qcom/qcs8550-retroidpocket-rp6.dts    |  120 +
 arch/arm64/boot/dts/qcom/qdu1000.dtsi              |    6 +-
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts          |    4 +-
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts     |    6 +-
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             |   14 +-
 .../boot/dts/qcom/sc7180-trogdor-homestar.dtsi     |    2 +-
 .../qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dts |    2 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts      |    4 +-
 .../boot/dts/qcom/sc7180-trogdor-pompom-r1.dts     |    4 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts     |    4 +-
 .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts |    7 +-
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts        |    7 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |   24 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |    3 +
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts      |   13 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   37 +
 .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    |    5 +-
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts |    3 +
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  690 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |   16 +-
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi |   50 +-
 arch/arm64/boot/dts/qcom/sdm670.dtsi               |  272 +
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |   13 +-
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi |   36 +-
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi     |   13 +-
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |   12 +-
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |    7 +-
 .../boot/dts/qcom/sdm845-oneplus-enchilada.dts     |    5 +
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts |    1 +
 .../boot/dts/qcom/sdm845-sony-xperia-tama.dtsi     |    2 +
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   |    6 +
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts |    6 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   20 +-
 arch/arm64/boot/dts/qcom/sdx75.dtsi                |    3 +-
 .../dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso |   72 +
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        |   56 +
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi       |  162 +-
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        |   52 +
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi           |   41 +
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     |   72 +
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts        |   32 +
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi       |  116 +-
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 2142 +++++-
 arch/arm64/boot/dts/qcom/sm4450.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/sm6115-xiaomi-lemon.dts   |  497 ++
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |  234 +
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |    4 +
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts      |    2 +
 arch/arm64/boot/dts/qcom/sm7325-xiaomi-lisa.dts    | 1108 ++++
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |   26 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |   50 +-
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |   18 +-
 .../boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi   |   17 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |   16 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |   26 +-
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts            |   28 +-
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts            |   16 +-
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            |   20 +-
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts    |    7 +-
 .../dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts    |    8 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |   65 +-
 .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      |  243 +-
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            |   22 +-
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts            |   16 +-
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |   14 +-
 arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts  | 1288 ++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |   20 +-
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts            |   10 +-
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts            |    8 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  409 +-
 .../boot/dts/qcom/talos-evk-rpi-display-2-5in.dtso |   88 +
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi        |    9 +-
 arch/arm64/boot/dts/qcom/talos-evk.dts             |    2 +-
 arch/arm64/boot/dts/qcom/talos.dtsi                |   13 +-
 arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi |   22 +
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi  |   22 +
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               |   22 +
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi        |   24 +-
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi   |   22 +
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi  |   89 +-
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts       |   24 +-
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |   22 +
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts          |  119 +
 .../qcom/x1e80100-dell-inspiron-14-plus-7441.dts   |   31 +-
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     |   22 +
 .../dts/qcom/x1e80100-honor-magicbook-art-14.dts   |   24 +-
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |   44 +
 .../dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts    |   26 +-
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  |   21 +
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          |   22 +
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts |   22 +
 .../boot/dts/qcom/x1p42100-microsoft-sp12in.dts    |   21 +
 arch/arm64/boot/dts/renesas/Makefile               |   85 +-
 .../dts/renesas/aistarvision-mipi-adapter-2.1.dtsi |    2 +-
 .../boot/dts/renesas/beacon-renesom-baseboard.dtsi |    6 +-
 .../arm64/boot/dts/renesas/beacon-renesom-som.dtsi |   12 +-
 arch/arm64/boot/dts/renesas/cat875.dtsi            |    2 +
 arch/arm64/boot/dts/renesas/condor-common.dtsi     |    2 +-
 arch/arm64/boot/dts/renesas/draak.dtsi             |    2 +-
 arch/arm64/boot/dts/renesas/ebisu.dtsi             |    6 +-
 arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi  |    8 +-
 arch/arm64/boot/dts/renesas/hihope-common.dtsi     |    4 +-
 arch/arm64/boot/dts/renesas/hihope-rev2.dtsi       |    8 +-
 arch/arm64/boot/dts/renesas/hihope-rev4.dtsi       |    4 +-
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi    |    6 +-
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |   14 +-
 .../boot/dts/renesas/r8a774a3-hihope-rzg2m-ex.dts  |   14 +
 .../boot/dts/renesas/r8a774a3-hihope-rzg2m.dts     |   49 +
 arch/arm64/boot/dts/renesas/r8a774a3.dtsi          |  302 +
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |   12 +-
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts    |    4 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |   12 +-
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi          |   14 +-
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |   14 +-
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |   14 +-
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |   14 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |   12 +-
 .../renesas/r8a77970-eagle-function-expansion.dtso |    2 +-
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts     |    2 +-
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts     |    2 +-
 arch/arm64/boot/dts/renesas/r8a77970.dtsi          |    2 +-
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts     |    2 +-
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |    4 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |   10 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |    6 +-
 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi      |    2 +-
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts    |    4 +-
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |    2 +-
 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi      |    2 +-
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          |   53 +-
 arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts      |    2 +-
 .../arm64/boot/dts/renesas/r8a779g0-white-hawk.dts |   94 +
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          |   85 +-
 .../renesas/r8a779g3-sparrow-hawk-fan-argon40.dtso |    1 -
 .../r8a779g3-sparrow-hawk-ws-2ch-canfd.dtso        |  135 +
 .../boot/dts/renesas/r8a779g3-sparrow-hawk.dts     |   19 +-
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi          |   34 +-
 arch/arm64/boot/dts/renesas/r8a779md-geist.dts     |   12 +-
 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts  |   12 +-
 arch/arm64/boot/dts/renesas/r8a78000.dtsi          |  516 +-
 .../renesas/r9a07g043u12-hummingboard-ripple.dts   |   89 +
 .../dts/renesas/r9a07g044c2-hummingboard-iiot.dts  |   20 +
 .../renesas/r9a07g044c2-hummingboard-ripple.dts    |   93 +
 .../dts/renesas/r9a07g044l2-hummingboard-iiot.dts  |   16 +
 .../renesas/r9a07g044l2-hummingboard-ripple.dts    |   18 +
 .../arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts |    2 +-
 .../dts/renesas/r9a07g054l2-hummingboard-iiot.dts  |   16 +
 .../renesas/r9a07g054l2-hummingboard-ripple.dts    |   18 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi         |    5 +-
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         |  335 +-
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts |   36 +
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi         |    4 +-
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         |  136 +-
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts |   58 +-
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi         |   12 +-
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         |   12 +-
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    |    6 +-
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi         |  116 +-
 .../dts/renesas/r9a09g077m44-evk-cn15-lcdc.dtso    |   53 +
 .../boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts    |   18 +-
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi         |  116 +-
 .../dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso    |   63 +
 .../boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts    |   32 +-
 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi    |   38 +-
 .../renesas/rzg2l-hummingboard-iiot-common.dtsi    |  560 ++
 .../renesas/rzg2l-hummingboard-iiot-microsd.dtso   |   26 +
 ...hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso |   79 +
 .../renesas/rzg2l-hummingboard-iiot-rs485-a.dtso   |   17 +
 .../renesas/rzg2l-hummingboard-iiot-rs485-b.dtso   |   17 +
 .../boot/dts/renesas/rzg2l-hummingboard-iiot.dtsi  |   49 +
 .../renesas/rzg2l-hummingboard-pulse-common.dtsi   |  116 +
 .../rzg2l-hummingboard-pulse-micro-hdmi.dtsi       |   79 +
 .../dts/renesas/rzg2l-hummingboard-ripple.dtsi     |  122 +
 .../boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi  |   16 +-
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi   |   20 +-
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi       |    2 +-
 arch/arm64/boot/dts/renesas/rzg2l-sr-som-emmc.dtso |   44 +
 arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi      |  473 ++
 .../renesas/rzg2lc-hummingboard-pulse-leds.dtso    |   48 +
 .../boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi |   16 +-
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi  |   20 +-
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi      |    2 +-
 arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi     |  436 ++
 .../renesas/rzg2ul-hummingboard-pulse-leds.dtso    |   48 +
 .../boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi |   16 +-
 arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi  |   20 +-
 arch/arm64/boot/dts/renesas/rzg2ul-sr-som.dtsi     |  418 ++
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi   |   25 +
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi   |   25 +-
 arch/arm64/boot/dts/renesas/rzg3s-smarc-switches.h |    4 +
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi       |    1 -
 .../boot/dts/renesas/rzt2h-n2h-evk-common.dtsi     |    7 +
 .../boot/dts/renesas/rzt2h-n2h-evk-du-adv7513.dtsi |   72 +
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |   14 +-
 arch/arm64/boot/dts/renesas/salvator-xs.dtsi       |    2 +-
 .../ulcb-kf-audio-graph-card2-mix+split.dtsi       |   18 +-
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi           |    2 +-
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |    8 +-
 .../boot/dts/renesas/white-hawk-cpu-common.dtsi    |    6 +-
 arch/arm64/boot/dts/rockchip/Makefile              |   17 +
 .../boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts |  248 +
 arch/arm64/boot/dts/rockchip/rk3328.dtsi           |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi      |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts    |    1 -
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts    |   36 +-
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts    |   82 +
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      |    4 +
 .../boot/dts/rockchip/rk3399-rockpro64-v2.dts      |    4 +
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts  |    4 +
 .../boot/dts/rockchip/rk3399pro-vmarc-som.dtsi     |    2 +
 .../boot/dts/rockchip/rk3528-mangopi-m28k.dts      |  412 ++
 .../arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts |  160 +
 .../boot/dts/rockchip/rk3528-nanopi-zero2.dts      |  290 +-
 arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi    |  291 +
 arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts   |    1 -
 arch/arm64/boot/dts/rockchip/rk3566-base.dtsi      |    4 +
 arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dts |    1 -
 .../boot/dts/rockchip/rk3568-fastrhino-r66s.dts    |    1 -
 arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dts |    1 -
 .../arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtsi |    1 -
 arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts    |   51 +
 arch/arm64/boot/dts/rockchip/rk3568.dtsi           |    4 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      |    1 -
 .../boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts |    9 -
 .../dts/rockchip/rk3576-anbernic-rg-vita-pro.dts   |    2 -
 .../boot/dts/rockchip/rk3576-armsom-cm5-io.dts     |    5 +-
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      |    1 -
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts   |    1 -
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts  |    1 -
 .../arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts |    1 -
 arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts     |    1 -
 .../dts/rockchip/rk3576-rock-4d-radxa-cam4k.dtso   |  105 +
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts    |    1 -
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  179 +-
 arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts |   38 +-
 arch/arm64/boot/dts/rockchip/rk3582-radxa-e54c.dts | 1172 ++++
 .../boot/dts/rockchip/rk3588-armsom-sige7.dts      |    1 -
 arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts  |    1 -
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   41 +-
 .../boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts    |    1 +
 .../arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi |    1 -
 .../boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtsi |    1 -
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi     |    2 +-
 .../rockchip/rk3588-jaguar-can1-can2-uart4.dtso    |   26 +
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     |   16 +
 .../boot/dts/rockchip/rk3588-lubancat-5-btb.dtsi   |  534 ++
 .../boot/dts/rockchip/rk3588-lubancat-5io.dts      | 1031 +++
 .../boot/dts/rockchip/rk3588-nanopc-t6-lts.dts     |   17 -
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi |  166 +-
 arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dts   |    1 -
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts |    4 +-
 .../boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi   |    1 -
 .../rockchip/rk3588-tiger-displayport-carrier.dts  |  110 +
 .../boot/dts/rockchip/rk3588-tiger-haikou.dts      |    4 +
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi     |    5 +
 .../boot/dts/rockchip/rk3588-vicharak-axon.dts     |    1 -
 .../boot/dts/rockchip/rk3588-vicharak-vaaman2.dts  |    1 -
 .../boot/dts/rockchip/rk3588-youyeetoo-yy3588.dts  |    1 -
 arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts |    1 -
 arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts  |    1 -
 .../boot/dts/rockchip/rk3588s-gameforce-ace.dts    |    8 +-
 .../boot/dts/rockchip/rk3588s-indiedroid-nova.dts  |    1 -
 .../arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts |    1 -
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi |  142 +
 .../boot/dts/rockchip/rk3588s-nanopi-m6v1.dts      |   57 +
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi |  792 +--
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi   |  797 +++
 arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts |   36 +-
 .../boot/dts/rockchip/rk3588s-orangepi-5-pro.dts   |   14 +-
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts   |    1 -
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts   |    1 -
 arch/arm64/boot/dts/st/Makefile                    |   23 +
 arch/arm64/boot/dts/st/stm32mp231.dtsi             |  105 +-
 arch/arm64/boot/dts/st/stm32mp235f-dk.dts          |   75 +
 arch/arm64/boot/dts/st/stm32mp23xc.dtsi            |    7 +
 arch/arm64/boot/dts/st/stm32mp23xx-dhcos-bb.dts    |   15 +
 arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi  |   51 +
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi      |  925 ++-
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |   67 +-
 arch/arm64/boot/dts/st/stm32mp253.dtsi             |   16 +
 ...stm32mp255c-dhcos-dhsbc-overlay-imx219-x10.dtso |  111 +
 arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc.dts |  213 +
 .../boot/dts/st/stm32mp257-engicam-microgea.dtsi   |   63 +
 ...microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso |   67 +
 ...cam-microgea-rmm-overlay-rk050hr345-ct106a.dtso |   68 +
 .../dts/st/stm32mp257d-engicam-microgea-rmm.dts    |  275 +
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts          |   93 +
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |  101 +-
 arch/arm64/boot/dts/st/stm32mp25xc.dtsi            |    7 +
 arch/arm64/boot/dts/st/stm32mp25xx-dhcos-bb.dts    |   15 +
 arch/arm64/boot/dts/st/stm32mp25xx-dhcos-som.dtsi  |   51 +
 arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi  |  456 ++
 arch/arm64/boot/dts/tesla/fsd-evb.dts              |   10 +-
 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi         |    6 +-
 arch/arm64/boot/dts/tesla/fsd.dtsi                 | 1224 ++--
 arch/arm64/boot/dts/ti/Makefile                    |   12 +
 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts           |    2 +-
 arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi    |    2 +-
 arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts   |    2 +-
 arch/arm64/boot/dts/ti/k3-am62-verdin-ivy.dtsi     |   41 +-
 arch/arm64/boot/dts/ti/k3-am62-verdin-zinnia.dtsi  |   41 +-
 arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi         |   49 +-
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts     |    6 +-
 arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi     |    3 +-
 .../boot/dts/ti/k3-am625-tqma62xx-mba62xx.dts      |    4 +-
 arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi      |    2 +-
 .../boot/dts/ti/k3-am625-var-som-symphony.dts      |    2 +-
 arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi       |    4 +-
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi          |    1 +
 arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi           |    2 +-
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi   |   31 +-
 .../boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi      |   11 +-
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts            |   35 +-
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts           |   32 +-
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts           |    4 +-
 .../boot/dts/ti/k3-am62p-j722s-common-main.dtsi    |   12 +
 .../boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi     |    2 +-
 .../boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi      |   11 +-
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi        |   29 +-
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts            |   29 +-
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi      |   29 +-
 arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi |    2 +-
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi     |    2 +-
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts     |    1 +
 arch/arm64/boot/dts/ti/k3-am67-phycore-som.dtsi    |  324 +
 .../arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dts |  431 ++
 ...uila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso |  161 +
 arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi         |    2 +-
 .../boot/dts/ti/k3-j7200-common-proc-board.dts     |    1 +
 .../boot/dts/ti/k3-j721s2-common-proc-board.dts    |    1 +
 arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso    |  157 +
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi         |   18 +
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts            |   26 +-
 .../boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi   |    2 +
 arch/arm64/boot/dts/ti/k3-pinctrl.h                |   10 +
 arch/arm64/configs/defconfig                       |    6 +
 arch/riscv/boot/dts/sophgo/Makefile                |    3 +
 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts   |   11 -
 arch/riscv/boot/dts/sophgo/cv180x.dtsi             |    2 +-
 .../boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso  |   17 +
 .../riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts |   11 -
 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts       |    4 +-
 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts       |    2 +-
 .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts |    4 +-
 .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts      |   24 +
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts     |   35 +-
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts   |   69 +-
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts   |  132 +-
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts     |   77 +
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi        |   18 +
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts       |   38 +
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi       |   11 +
 arch/riscv/boot/dts/spacemit/k3.dtsi               |  229 +-
 arch/riscv/boot/dts/starfive/jh7100-common.dtsi    |   28 +-
 arch/riscv/boot/dts/starfive/jh7100.dtsi           |   67 +-
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi    |   27 +-
 arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts |    6 +-
 .../boot/dts/starfive/jh7110-milkv-marscm.dtsi     |    6 +-
 .../boot/dts/starfive/jh7110-pine64-star64.dts     |    6 +-
 .../jh7110-starfive-visionfive-2-lite.dtsi         |    6 +-
 .../dts/starfive/jh7110-starfive-visionfive-2.dtsi |    6 +-
 arch/riscv/boot/dts/starfive/jh7110.dtsi           |   67 +-
 arch/riscv/boot/dts/thead/Makefile                 |    1 +
 arch/riscv/boot/dts/thead/th1520-milkv-meles.dts   |  346 +
 drivers/irqchip/irq-aclint-sswi.c                  |    1 +
 drivers/soc/Kconfig                                |    1 +
 drivers/soc/Makefile                               |    1 +
 drivers/soc/st/Kconfig                             |   12 +
 drivers/soc/st/Makefile                            |    1 +
 drivers/soc/st/stm32mp2-syscfg.c                   |   33 +
 include/dt-bindings/arm/qcom,ids.h                 |    1 +
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 +
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   51 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 include/dt-bindings/clock/qcom,hawi-camcc.h        |  165 +
 include/dt-bindings/clock/qcom,hawi-gpucc.h        |   47 +
 include/dt-bindings/clock/qcom,nord-camcc.h        |  167 +
 include/dt-bindings/clock/qcom,nord-nwgcc.h        |    3 +
 .../dt-bindings/clock/renesas,r8a774a3-cpg-mssr.h  |   59 +
 include/dt-bindings/clock/renesas,r8a78000-cpg.h   |    2 +
 include/dt-bindings/interconnect/qcom,ipq9650.h    |   28 +
 include/dt-bindings/power/qcom,rpmhpd.h            |    1 +
 include/dt-bindings/power/renesas,r8a774a3-sysc.h  |   30 +
 1061 files changed, 88861 insertions(+), 9390 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,hawi-gp=
ucc.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/omap-keypad.=
txt
 create mode 100644 Documentation/devicetree/bindings/input/ti,omap4-key=
pad.yaml
 create mode 100644 Documentation/devicetree/bindings/power/riscv,rpmi-d=
evice-power.yaml
 create mode 100644 Documentation/devicetree/bindings/power/riscv,rpmi-m=
pxy-device-power.yaml
 create mode 100644 arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dts
 create mode 100644 arch/arm/boot/dts/nvidia/tegra20-motorola-daytona.dts
 create mode 100644 arch/arm/boot/dts/nvidia/tegra20-motorola-mot.dtsi
 create mode 100644 arch/arm/boot/dts/nvidia/tegra20-motorola-olympus.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx50-amazon-yoshi.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-emm=
c.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-phytec-phycore-som.=
dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-phytec-phycore-som.d=
tsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-c=
ap-touch-7inch-parallel-touch-adapter.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-c=
ap-touch-7inch-parallel.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-r=
es-touch-7inch-parallel.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-mx7cust=
omboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-wm8731-=
mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboa=
rd.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-mx7cust=
omboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-wm8731-=
mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-emmc-mx7c=
ustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-nand-mx7c=
ustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8904.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts
 create mode 100644 arch/arm/boot/dts/st/ste-ux500-samsung.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-teclast-p8=
0.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8132-j604.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8132-j623.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8132-j624.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8132-j713.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8132-j715.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8132-j773g.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8132-jxxx.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8132-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8132.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8140-j700.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8140-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8140.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850-a217f.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-cm4.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-fio1.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-fio1.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-hdmi.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-hdmi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-lvds-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-lvds-dual.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-lvds-single.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-lvds.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-edm-sbc-imx8mm-rev900.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-lvds-3v3.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-lvds-5v0.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-lvds-dual.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-lvds-g070y2-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-lvds-g101ice-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-lvds-g121xce-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-lvds-g156hce-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-lvds-g215hvn011.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-lvds-mi0700a2t-30.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-lvds-mi1010z1t-1cp11.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-=
sbc-overlay-lvds-single.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-e=
eprom-1000.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-e=
eprom-1100.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-e=
eprom-2000.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-=
sbc-overlay-cm7.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-fio1.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-hdmi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-=
sbc-overlay-edm-mod-imx8mm-lvds.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-=
sbc-overlay-edm-sbc-imx8mp-lvds-g070y2-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-=
sbc-overlay-edm-sbc-imx8mp-lvds-g101ice-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-=
sbc-overlay-edm-sbc-imx8mp-lvds-g121xce-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-=
sbc-overlay-edm-sbc-imx8mp-lvds-g156hce-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-=
sbc-overlay-edm-sbc-imx8mp-lvds-g215hvn011.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-=
sbc-overlay-edm-sbc-imx8mp-lvds-mi0700a2t-30.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-=
sbc-overlay-edm-sbc-imx8mp-lvds-mi1010z1t-1cp11.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-=
sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-=
sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-=
sbc-overlay-edm-sbc-imx8mp-lvds.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-=
sbc-overlay-edm-sbc-imx8mp-rev900.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-=
sbc-overlay-edm-sbc-imx8mp-rev902.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux=
-peb-wlbt-07.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx9-mqs.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-9x9-qsb-tianma-t=
m050rdh03.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-lino-verdin-dahl=
ia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-lino-verdin-dev.=
dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-lino.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-toradex-osm-dev.=
dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-toradex-osm.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-commo=
n.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-lino-commo=
n.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-lino-verdi=
n-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-lino-verdi=
n-dahlia-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-lino-verdi=
n-dev-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-toradex-os=
m-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-toradex-os=
m-dev-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-lino-verdin-dahl=
ia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-lino-verdin-dev.=
dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-lino.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-toradex-osm-dev.=
dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-toradex-osm.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93w-frdm.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-navq.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.=
dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx952-frdm.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
 create mode 100644 arch/arm64/boot/dts/google/Makefile
 create mode 100644 arch/arm64/boot/dts/google/lga-blazer.dts
 create mode 100644 arch/arm64/boot/dts/google/lga-frankel.dts
 create mode 100644 arch/arm64/boot/dts/google/lga-mustang.dts
 create mode 100644 arch/arm64/boot/dts/google/lga-pixel-common.dtsi
 create mode 100644 arch/arm64/boot/dts/google/lga.dtsi
 create mode 100644 arch/arm64/boot/dts/marvell/cn9130-sophos-xgs107w.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/thermal/nvidia,tegra264-b=
pmp.h
 create mode 100644 arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3=
407na.dts
 create mode 100644 arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.d=
ts
 create mode 100644 arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.d=
ts
 create mode 100644 arch/arm64/boot/dts/qcom/glymur-qcb.dts
 create mode 100644 arch/arm64/boot/dts/qcom/hamoa-advantech-som-6820.dt=
si
 create mode 100644 arch/arm64/boot/dts/qcom/hamoa-advantech-som-db5830.=
dts
 create mode 100644 arch/arm64/boot/dts/qcom/hawi-ipcc.h
 create mode 100644 arch/arm64/boot/dts/qcom/hawi-mtp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/hawi.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-=
gen7-lcd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8953-motorola-deen.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8976-leeco-s2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/nord-embedded.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord-gearvm.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/nord-rrd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/nord.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmh0104-hawi.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi=
3-cam1-imx219.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi=
3-cam2-imx219.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocket-ds.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8550-ayntec-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8550-ayntec-odin2mini.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8550-ayntec-odin2portal.=
dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8550-ayntec-thor.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8550-imdt-sbc.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8550-imdt-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.=
dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-rp6.d=
ts
 create mode 100644 arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-c=
amera.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camer=
a.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115-xiaomi-lemon.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm7325-xiaomi-lisa.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-rpi-display-2-5in=
.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774a3-hihope-rzg2m-ex=
.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774a3-hihope-rzg2m.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774a3.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws=
-2ch-canfd.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g043u12-hummingboar=
d-ripple.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard=
-iiot.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard=
-ripple.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard=
-iiot.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard=
-ripple.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard=
-iiot.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard=
-ripple.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44-evk-cn15-lc=
dc.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lc=
dc.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-=
common.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-=
microsd.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-=
panel-dsi-WJ70N3TYJHMNG0.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-=
rs485-a.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-=
rs485-b.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot.=
dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-hummingboard-pulse=
-common.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-hummingboard-pulse=
-micro-hdmi.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-hummingboard-rippl=
e.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-sr-som-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2lc-hummingboard-puls=
e-leds.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2ul-hummingboard-puls=
e-leds.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2ul-sr-som.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-du-adv7513=
.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.=
2.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-mangopi-m28k.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-ca=
m4k.dtso
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3582-radxa-e54c.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-jaguar-can1-can2=
-uart4.dtso
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-lubancat-5-btb.d=
tsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-lubancat-5io.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-tiger-displaypor=
t-carrier.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6v1.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp23xc.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp23xx-dhcos-bb.dts
 create mode 100644 arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc-overl=
ay-imx219-x10.dtso
 create mode 100644 arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc.dts
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.d=
tsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-=
rmm-overlay-am-1280800w8tzqw-t00h.dtso
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-=
rmm-overlay-rk050hr345-ct106a.dtso
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-=
rmm.dts
 create mode 100644 arch/arm64/boot/dts/st/stm32mp25xc.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp25xx-dhcos-bb.dts
 create mode 100644 arch/arm64/boot/dts/st/stm32mp25xx-dhcos-som.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am67-phycore-som.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-v2=
-panel-cap-touch-10inch.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.=
dtso
 create mode 100644 arch/riscv/boot/dts/thead/th1520-milkv-meles.dts
 create mode 100644 drivers/soc/st/Kconfig
 create mode 100644 drivers/soc/st/Makefile
 create mode 100644 drivers/soc/st/stm32mp2-syscfg.c
 create mode 100644 include/dt-bindings/clock/qcom,eliza-cambistmclkcc.h
 create mode 100644 include/dt-bindings/clock/qcom,eliza-camcc.h
 create mode 100644 include/dt-bindings/clock/qcom,eliza-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,eliza-videocc.h
 create mode 100644 include/dt-bindings/clock/qcom,hawi-camcc.h
 create mode 100644 include/dt-bindings/clock/qcom,hawi-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,nord-camcc.h
 create mode 100644 include/dt-bindings/clock/renesas,r8a774a3-cpg-mssr.h
 create mode 100644 include/dt-bindings/interconnect/qcom,ipq9650.h
 create mode 100644 include/dt-bindings/power/renesas,r8a774a3-sysc.h
