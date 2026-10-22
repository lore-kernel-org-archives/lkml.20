Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656516;
	b=kQF3swqcnJw70My0U3U3/CbTyNgDZelAyOcvdbls/dJF+hpO7DVdy0ip/ggfzeBJWgB1
	 7P9I9bgWWVqSoGMv2huAgQW23uDcP6sBriTRnq7zA9gcdC9R6Hkyp+G+q+7Kmim6SPwL5
	 HKU674gqkBJZ11vByUCtQE/kuaVcCpwoBBveuqESt6oWGtJsM1AV2GtCubvvDSQQgNrlB
	 e/cYskwO/KeonbAACZByViZJfJVNka9QaLUyBg4PNATG057BpesNuDVXMNxNi01bBG44u
	 gVB8F194eUPxmzwil759cpL5dHCZCiTVrEJ+PuUJ2++PkpTc6U08ysqNqrYUZQ5S1Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656516;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type:
	 Content-Transfer-Encoding;
	bh=qCWsWZXzlIkVJ1bwg/ctXg0ZlNLI2VEgz60sAmLxP3s=;
	b=QLutbwotRw5mnVlIOmD2CGVyU0ANtCK2lzyp4qAHkC9nJDfKxvYNSPFw9yJDx3V93ZQc
	 eog6XhlB15Omn5ANSdoAk0BCtksayuO+0/6DzjNdVjjVLlUJ/w7WmdnzAoJplmBhVibih
	 +PgmIXBv1pOzUrHG8MMNBpIGwYq2MI3+K0/nC9NzieFBpsD4QWF6QadvVbI+h/8ADAxQC
	 4D31u28D4e6AjqrsBo1j0XJjjSY7jhLDpUjAkHP/tVTDIy5sTj3Pbg0VpqEF3z9BYZjNu
	 16zFWflvJFUGvposb4Ch7svZx4jcxbpV4b9gWtAv1H63FT5zNrE5bU0znvywvMU1Rdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=paitTs9q;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=AEhiFeJ3;
	arc=none smtp.remote-ip=103.168.172.146
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A77606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68A77606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=paitTs9q;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=AEhiFeJ3
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 7B81AEC010D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:08:34 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 22 Oct 2026 04:08:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1792656512; x=1792742912; bh=qC
	WsWZXzlIkVJ1bwg/ctXg0ZlNLI2VEgz60sAmLxP3s=; b=paitTs9qANsKZvIo99
	GI9ouujB8FAtVpC/h3GDMex8Da/32VmqexeW6krGkzwe5DwZ4CQunnlklSp39gqg
	eE3a7/KlVTXyop/R0h8QWqSjkOZpsm9vN5f0SMmaQgMtM6627f6mAX1Okljyy5eO
	PwYkgrcDLi5GKb+rY4/Aa4caX1VOWcSSbzZycpC4QkHBoMkdn1mRzCCS4Y4ugTjT
	YJTpIEhqMkUKJhIMjPOGi+nW5wK35XSCWPG3zfnqagVdX8RTBoMR0mnOvZauMcBB
	WB1ajM3bxY+BXTlT0SUxog5zbCyF7ifBQ1/7h70KI7c1Tlqcv0N9pKCt8J7MML4Y
	CxMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1792656512; x=1792742912; bh=qCWsWZXzlIkVJ1bwg/ctXg0ZlNLI
	2VEgz60sAmLxP3s=; b=AEhiFeJ3Ljdbt8HsMUcUNlitKocqLR2Vz8bjVGor3TEn
	patX7XSlMhaA74/KekMnUQ+gGzK4sxdgLYUQQQQHyzstD0quIzKgRaUGzrtdZfXk
	kFVkqlS2hc88Bc8Ezom/+N79nfsjby0FHUnzR5QBIzZ0GTkG3ZhELCiLGO+PEE7C
	BAALepJAfYFlj/tYdqcJgTS0qEE1G45BnuFDX+HHYsvqpeiQlQw76Ft4gYN2TGZa
	Bvc4wT+mX9D1nhtDEkFN+IghXcsT4iqyCLL3p/wto9kOMLlzUUWPwcAXtVu2nXQG
	njW3x7guhMgqjqOdel46ZMr7gP4iq8g3WgEe7SA9xQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792656512; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:VqZU9L9oCeeaKXPIh4wf63R4zZYkxJNWL3Tdbzxvw9KGCg7
	a+X/HWOrIk9dgYhTk+JFkUw2Mzb0B6xmR+bYet8JyJImlNyzfsyPIq2F/KnpRPSs
	5dSFi/v3YGpiAPYuDqxRdMGLcXVqTaBt9XBP8ZckH68F7/VSsK3966qeoZsfCtgA
	MpGdHC3k7Vptbn86V/OA9xDiIu88mVXKauGyPOJT57kyQ2NrLCKmFLYNV65duOkF
	wY+KwxHzQXXT4Az53x35+NNUmX1cRIAnhXUfUmKCjS+3cfSpJXyQOPuAekHNEfbG
	O01y1Jns/ckfyvWbcEUsCXGEb7BYjCVlqyaNloA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:VBLg5YZtKwSL01YbU5JCaXHeChAmfQl8LIVHi09UDdQ=:036vB2x/PkQq8v8OBqvh3qALNh9htmEL0DcMl4FNkfo=;
X-ME-Sender: <xms:fsTZamDCCiGL-CaDdP379PxqTvMCDsOd__52AE8awZrXQbWunXKPVw>
    <xme:fsTZarXWRQiA-eRPcc8A6dt2lNUwncgLSV0tWb0ShOr7WpNPwP8C-GeWRhGSZeL9o
    gWsogNb3-vXQqYT75r49T7GJu2DWCrqP1YJuJLXsDo01pflzQU65gWj>
X-ME-Proxy-Cause: dmFkZTFhNJk4VCqz6DYoNlXTSkJrnGFc5admzae8p8EL2R8LQluaUApHOMwtUK97WfxmCO
    cKgys9XYom4tF6WqSdustQCIWxgJrAetY0hGgGaIoXA7CKM42YJgfuv2EeF1UHPFKscL4m
    NEZefm4wPilajjgG/Cp4e1Np2mlHUIpmpwBgTRI5lkqXpqKIYoLkVam8vOlgKbLDhaY3JM
    96qEUHWp3A56ZjLLY36zQ8vNkLIkzBURD09BHMn3b+nO0ZEr8NO/HRXiB86a4OhVFFJLMI
    SlmwBTGv1HMMTJaQ5yW1KP1niP4TSjGyzYCzJbwn+CXQh8f8CuSYOSQ/tuvUgpuQWDUkfg
    l1DFpthnVh/KnRmO5qnZ5zlaWt1ehGUuDGrXadK40D+eR4MH5ECSL9S9OxEQvYbRhpbqxb
    2MPsZ/mS5NWrZG4X6+CHMwvStQQW8sINmLMAibhh2NN2Ab86jnTI0jGaDGrZp7OUCE7RkI
    lnDBKHpa22ls5xnZ2vp7xpf/0CIlzBeDnLKTs6JgMcLwS1fO7ydLEOPBRnWf71GTF80xWo
    o4S1UMft8Bx+S/YSIHVMjuVFudUbtvhSw7q8C0um6+lfl8We5o7V0soJRoMyi0Yp1ntfxo
    kE+THAbIZ8j5rL8hSgVZIqjMf3tSjp8BuD4FyO606jWHEPBCiQTOiDB+KpXQ
X-ME-Proxy: <xmx:f8TZavuMwy8djJw7D0dDBl1ysndNZpZHnrZVm2jNX9sb6CmY6Gdyug>
    <xmx:f8TZanVvfcMrQPE4M5DU4QNrRqh58thiCUy1Nu5yL6SdO9AojJiwqw>
    <xmx:f8TZarElesdIdwjKcYcn-VMwEZrDkFp0vl6KqGfh0gEe4QPipFtbJg>
    <xmx:f8TZap08rG8GBaM7JAy4lt8_PRxsjgrLPZRA4mzn2NVNJ9fT8R0coQ>
    <xmx:gMTZaoli7a0deJm3p66BEiXs2gOJoU_MjbjIXj-pWIv0mDx6VaEYXCXA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 02C6432A0097; Thu, 22 Oct 2026 04:08:30 -0400 (EDT)
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
Date: Thu, 22 Oct 2026 10:06:59 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <6c776ba1-f114-44c3-96ee-938dcd7ac82d@app.fastmail.com>
Subject: [GIT PULL 0/4] SoC updates for 7.4
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

At 1252 non-merge changesets, the 7.4 cycle is rather large for the SoC
tree, and most of that is arm64 devicetree updates, with smaller changes
for riscv, 32-bit arm and drivers than the last few times. In both
drivers and devicetree updates, Qualcomm has by far the most contributions
including two new SoCs and 22 of the 81 new boards, followed by NXP
with 19 new machines.
Other new SoCs include the Apple M4/A18pro and Google Tensor 5.

There are a couple of trivial conflicts between the soc/dt and
soc/drivers branch from a driver that ended up getting merged along
with the DT changes, and from defconfig changes in a previous bugfix
branch.

I had originally planned to include a larger update[1] for 32-bit Arm
to remove most of the remaining legacy board files that were recently
deprecated. As the idea was to still have them in the LTS kernel and
there was some confusion whether that would be 7.3 or 7.4, we ended
up deferring that branch to 7.5, and the associated drivers likely
won't be dropped until 7.6.

The contributions came from 309 individual developers, the most common
ones being the usual names:

     49 Marek Vasut
     43 Krzysztof Kozlowski
     40 Abel Vesa
     36 Krishna Chaitanya Chundru
     31 Thierry Reding
     29 Francesco Dolcini
     21 Lad Prabhakar
     21 Frank Li
     19 Svyatoslav Ryhel
     19 Judith Mendez
     18 Dario Binacchi
     17 Chancel Liu
     16 Janne Grunau
     15 Yureka Lilian
     15 Luca Weiss
     14 Mukesh Ojha
     13 Peng Fan
     12 Taniya Das
     12 Joachim Eastwood
     12 Geert Uytterhoeven
     12 Chuan Liu
     11 Linus Walleij
     11 Konrad Dybcio

The dirstat is:

   0.4% Documentation/devicetree/bindings/arm/
   0.7% Documentation/devicetree/bindings/clock/
   0.1% Documentation/devicetree/bindings/input/
   0.1% Documentation/devicetree/bindings/power/
   0.1% Documentation/devicetree/bindings/soc/starfive/
   0.1% Documentation/devicetree/bindings/soc/
   0.2% Documentation/devicetree/bindings/
   0.1% arch/arm/boot/dts/marvell/
   2.7% arch/arm/boot/dts/nvidia/
   2.1% arch/arm/boot/dts/nxp/imx/
   0.2% arch/arm/boot/dts/nxp/vf/
   0.1% arch/arm/boot/dts/qcom/
   0.1% arch/arm/boot/dts/renesas/
   0.8% arch/arm/boot/dts/st/
   0.1% arch/arm/boot/dts/ti/omap/
   0.1% arch/arm/boot/dts/
   0.1% arch/arm/mach-omap2/
   0.3% arch/arm/mach-s3c/
   0.5% arch/arm/
   0.1% arch/arm64/boot/dts/allwinner/
   0.1% arch/arm64/boot/dts/amlogic/
   3.1% arch/arm64/boot/dts/apple/
   0.2% arch/arm64/boot/dts/broadcom/
   0.2% arch/arm64/boot/dts/exynos/
  12.1% arch/arm64/boot/dts/freescale/
   0.3% arch/arm64/boot/dts/google/
   0.1% arch/arm64/boot/dts/marvell/
   0.1% arch/arm64/boot/dts/mediatek/
   1.0% arch/arm64/boot/dts/nuvoton/
   3.9% arch/arm64/boot/dts/nvidia/
  41.0% arch/arm64/boot/dts/qcom/
   5.8% arch/arm64/boot/dts/renesas/
   5.7% arch/arm64/boot/dts/rockchip/
   2.5% arch/arm64/boot/dts/st/
   0.3% arch/arm64/boot/dts/tesla/
   1.5% arch/arm64/boot/dts/ti/
   0.1% arch/arm64/configs/
   0.5% arch/riscv/boot/dts/spacemit/
   0.2% arch/riscv/boot/dts/starfive/
   0.2% arch/riscv/boot/dts/thead/
   0.1% arch/
   0.9% drivers/firmware/arm_scmi/transports/
   0.8% drivers/firmware/arm_scmi/
   0.2% drivers/firmware/qcom/
   0.1% drivers/firmware/xilinx/
   0.2% drivers/input/keyboard/
   0.5% drivers/memory/tegra/
   0.2% drivers/memory/
   1.2% drivers/soc/amlogic/
   0.1% drivers/soc/apple/
   0.1% drivers/soc/fsl/qe/
   0.2% drivers/soc/mediatek/
   0.7% drivers/soc/qcom/
   0.1% drivers/soc/renesas/
   0.1% drivers/soc/samsung/
   0.1% drivers/soc/starfive/socinfo/
   0.3% drivers/soc/tegra/fuse/
   0.1% drivers/soc/tegra/
   0.2% drivers/
   1.8% include/dt-bindings/clock/
   0.3% include/dt-bindings/reset/
   0.2% include/linux/
   0.1% include/
 1235 files changed, 95202 insertions(+), 11056 deletions(-)

       Arnd

[1] https://lore.kernel.org/lkml/2afd5f78-0174-4955-8c1b-be18aea3800b@app.fastmail.com/
