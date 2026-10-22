Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659119;
	b=WaVorXFjFyIh5YLM+qbayEQBotRpYHwHoIeYUYRgwWXZCPd+6g0UkLNx+KKt/NGjRk2U
	 ue/D7hlP6jbOVgCxh6ZjW9p6Na8LTLMKeLmcTsWR+kwrZlzIuqlpo0DAnJBTdZUcVbm3d
	 pwxtpoC1p2grT2aOT+a+kQo0reqBkkm5vtMpg8XrxBDRvfG19v36PGc50LGZph6izcP+I
	 6t0fktHa5PDdlAV7MvJ8tgT+KbyOES2w0OoLOh6GZ424DCukIkI7qW9WOeVi/DgEqfr/8
	 dEHm3iQ1RllpSkkaMPRTrXYO97/zTvrZiPfjxKBB+SN2KZbbtMtva/2DcR362xz81Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659119;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=yi9bwMj/Bg5iUbl1upejF7d4qb7S/jRxUBn8iCfC2T0=;
	b=pJBEX4n3l8eGSzmJZFAigZe0TYffECAKG2G4vDxj6MpPzExjhwW0wtpwlMQN+EdWtt5q
	 N1TCUrVAXd5aUDqNPEjXzapkdjIoYMhfGr6Zok8JSaFLnDCxVQJjw4eKK1YZ9m7YhOFmA
	 izh9K4j808r/cvOqOSIU2QP73ZSO8GvxjBRnjldrc8kqSgFrgVTUueuFlXK61QSHrKbMR
	 NjK08dSXnWmGxsPj3NIjFFZ0Tq9wK/thlPgZ+cXRBkK4m0tUZsfjPFKQlO6awwJX5D48k
	 EI1+xo3WSgvqppil9AOoxbKaqQJkYH6+JuZqx2aOLf/5tpRPhlC24mRwDVmiiErt4kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=gPtatqlW;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=MUug875I;
	arc=none smtp.remote-ip=103.168.172.154
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B72606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:51:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1B72606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=gPtatqlW;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=MUug875I
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 28D2F14001E4
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:51:58 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 22 Oct 2026 04:51:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792659116;
	 x=1792745516; bh=yi9bwMj/Bg5iUbl1upejF7d4qb7S/jRxUBn8iCfC2T0=; b=
	gPtatqlWADNNZqO3FSrjTyHY5f4IvJAkTR+fd4/SNUHCz1yvcCVzehqLexJiKSH8
	xc7tn1o/DxyPp6Hw8pEQ13HVNwsaPcGfgzKZb2Q7wFHWjdI9H+N/gPM23pLzj0p3
	Sc3Cs/mp8NWS29VxZTNWIBaiPJZqoiMiERJ3BpkVGrPLfpv/68F29Z7eDg5ex559
	TTEdLn+bFrBieFMDDNErGr0EgDMMLaud15ukST894ECgQ+rUkXOLFG+Y4Vwd1V5k
	ZfwlNkaSklYyIScEtIByufZLbs5H/Joy4K8Cw9FvVpiC7Gm7zu5CpKMWq2B3yEim
	Aa9FSyFBviqKGksijP3NMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792659116; x=
	1792745516; bh=yi9bwMj/Bg5iUbl1upejF7d4qb7S/jRxUBn8iCfC2T0=; b=M
	Uug875Imk6X6gC/sFk+Vg2Lv9MgC32RB/Gwy3nkQ+EMOrC9vUVb9lnPJogB+upUM
	Gt4dvu4pwLxqqr8GKclDWoTxvRAigXEdiO/8DNVRe/z+4tyHEFtNsj+VYbn7fvdf
	2hCm9ffkLDiEsZ6OZNytcb9d5nX1yC0mYFMufsZwyLuaPiufSXtZT+pb+/kNFMFo
	MEk/EcC2LXGDazJi6D205VN229rNd4RnWusa2mWQMnxo/KAEkBWZkvtirEBhEO9G
	Bd1Rs84Sp07Two7uHF3xSVhL20cXpkEFByP1bGtpzn3ewyvlkuzpsO/VkU/HfkeU
	hd2NUtqsFNbob3Y57SS/w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792659116; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:gncWgM957XlMz571BQykJAieYyhWTbMXxfavinRXOfSkEVg
	9XXxngAs5TXfYctyYGfDPZ5CES/Yd7WnCyr31dencj02r2SKkD1O1TVDfoHir4vt
	j7OtsjJMtLYVTT6Hfdfhv63ha3KZSITQzPWgUt84MTsNe0xxESfTXHc5YWzAKotT
	EmS4yvCHDCufDGUOyjSzb6/pjF2Htotoc6L83xSFVtTDHkTRP8n+OFfq4/XLQeoh
	oi/ZR9epgaL2bX9lPnKdz/O28Cte3VdTo5YP9+PDrIoOcASIZYR4sLt03JjLZpYz
	5AwsIgNXFsFN7ntJMDpbcjPiK/zpSAbxwLl3m+A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:hJLe/o5Cm89msHGSTgZxWGePXnOvK29b8i8nimz77tM=:c39obsCHj2CWRNil6Ix0ttX1oO849/ExAR/v5FF4zxc=;
X-ME-Sender: <xms:qc7ZalZIirUNRjpGRs2yqyptweJvgXTkgMvdOsZUT6QTVQ5cP-ZpLA>
    <xme:qc7ZanPktKeG57NKTtn_EhA384mvegjhNYUg6qwqlMfbbfOZ9ooyqXUQoc1eNMrwE
    cCyY3pVjEI3H5l5IaDqPyTq4tRhhSnzbFDC3-iwkFuNdz24g20Xjlqt>
X-ME-Proxy-Cause: dmFkZTFOxNlQk2g8vfTSfjkCoDSztqKiTSFS+4IHKDRb1aWLkBuSpasYOSTjMIJWCN89X/
    IxdampDz6Hsd+drRCsucP3q55URdbzu2RjKhxEL/JaxB27mSV5c2Ykn77b/FLkiB76ILBG
    zMqyp69qgUyDFst+1gWpMqZaznqi4vsAcvHPgi6ohbGtlXpu8CCi6IIQB9gEW6cYR1t8hF
    XyEGHALM+q2OXhJpWPyi/HTq7W0qxislQfSuYdTbRdDx6l3u8/m4Q/zj2nmtE6Q8i1FJyU
    9l2mE4nRt3Opb2KmSJdE5urHusp44cmkoZvctvIw7RK/b2dBzakwcA5VYZYxPi35R1LDWD
    6gPntHKD9Pz/aXtZRe+l2qouUNxkFewP7nOYV5W20LW+NG7CKI90SByGh+vr5x8IrZZGmM
    LcsIoKknRmTPtmu8tOBKk4Nmk5IZqAun5iv0dmnqMGWMZhRiO5Dr31bZs8CAG6Jo5Vzev8
    dZaye+r66OBPsoICjbHVllx4tknb5H2IDT9HZ2vrLNHST9Qt/RzlpNsY7aVbLkposkHYsH
    DEJGomkpqpPE1tetXdZC2tjMoM8/U/f9ut9mDWv5FVhr5+opPVH2hef0XROxmf7zNg2HWU
    U4bVtxHml9WcsySTdYwv1sflpNSJD6dIp7MPXB+rJWJd84VVBXl78i2FKb9w
X-ME-Proxy: <xmx:q87ZavFFOxsWPu4lcaqy7LbZcJUP53m1Ux53dD1OOc7X04NUqZb4pw>
    <xmx:q87ZajM0bGz4WU3hsXmrNPLycs-p7eDd3f3hxvtxrXDDJGF9-NZ6GQ>
    <xmx:q87ZapeeDl3MGiYAdhIsbLUIr9_K006IaGNxn3Zh_7GzTA6Md6GyWQ>
    <xmx:q87ZaotaimwvW5rodGLDRWkQ6EqrX7-_ICwwbaX9oGVp98M70AiM-g>
    <xmx:rM7Zaqcmy_m05J_eIXLd12jpUy2ksfxdYGtWy7e0KgEk1nV3hBu_oLt8>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id A0EA832A0097; Thu, 22 Oct 2026 04:51:53 -0400 (EDT)
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
Date: Thu, 22 Oct 2026 10:51:33 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <f13c8cce-0c6e-44a1-96de-2c834d61900b@app.fastmail.com>
In-Reply-To: <6c776ba1-f114-44c3-96ee-938dcd7ac82d@app.fastmail.com>
References: <6c776ba1-f114-44c3-96ee-938dcd7ac82d@app.fastmail.com>
Subject: [GIT PULL 2/4] soc: driver updates for 7.4
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b=
935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-d=
rivers-7.4

for you to fetch changes up to 0045cd6b8ab2319e9d8de46e5e329cdc35ce6d05:

  platform: cznic: turris-omnia-mcu: stop button emulation producers (20=
26-10-16 18:45:02 +0200)

----------------------------------------------------------------
soc: driver updates for 7.4

There are lots of minor updates for driver subsystems managed through
the soc tree (turris-omnia platform, cache driver, tee drivers, arm-cci,
bus, memory) as well as soc vendor specific drivers (starfive, xilinx,
microchip, nxp, amlogic, imx, renesas, samsung, ti, nvidia).

The more notable changes are:

 - Larger updates for Qualcomm SoCs including support for SM8950 (Maili)
   SM8975 (Hawi), Glymur, Shikra, and IPQ5424

 - Added SoC support for Exynos5515, Tegra264, Tegra410, R8A774A3,
   and MT8167 in existing drivers

 - Arm SCMI firmware driver support for ACPI PCC transport and module
   autoloading of protocol specific drivers

 - Apple crash log support for CrgA embedded controller

----------------------------------------------------------------
Aaron Kling (2):
      soc/tegra: fuse: Support revision B01
      soc/tegra: fuse: speedo-tegra210: Support revision B01

Abel Vesa (2):
      soc: qcom: pmic_glink: Fix device access from worker during suspend
      MAINTAINERS: add Abel as reviewer for linux-arm-msm

Aiden Isik (2):
      dt-bindings: hwinfo: samsung,exynos-chipid: Add Exynos5515 compati=
ble
      soc: samsung: exynos-chipid: Add Exynos5515 SoC support

Alexandre Hamamdjian (1):
      soc/tegra: pmc: Add Tegra210B01 support

Alexey Klimov (2):
      dt-bindings: sram: Document samsung,exynos850-acpm-sram
      soc: samsung: exynos-pmu: fix error paths in cpuhotplug/idle state=
s setup

Andrew Davis (1):
      tee: move tee_ioctl_shm_register_data to above IOCTL definition

Antony Kurniawan Soemardi (1):
      dt-bindings: mfd: syscon: add qcom,msm8960-sps-sic

Anurag Pateriya (2):
      dt-bindings: cache: qcom,llcc: Add Nord compatible
      soc: qcom: llcc: Add LLCC configuration for Nord

Arnd Bergmann (19):
      Merge tag 'qcom-drivers-fixes-for-7.3' of https://git.kernel.org/p=
ub/scm/linux/kernel/git/qcom/linux into soc/drivers
      Merge tag 'qcom-drivers-for-7.4-2' of https://git.kernel.org/pub/s=
cm/linux/kernel/git/qcom/linux into soc/drivers
      Merge tag 'qcom-drivers-for-7.4-3' of https://git.kernel.org/pub/s=
cm/linux/kernel/git/qcom/linux into soc/drivers
      Merge tag 'imx-drivers-7.4' of https://git.kernel.org/pub/scm/linu=
x/kernel/git/frank.li/linux into soc/drivers
      Merge tag 'renesas-drivers-for-v7.4-tag2' of git://git.kernel.org/=
pub/scm/linux/kernel/git/geert/renesas-devel into soc/drivers
      Merge tag 'apple-soc-drivers-7.4' of https://git.kernel.org/pub/sc=
m/linux/kernel/git/sven/linux into soc/drivers
      Merge tag 'samsung-drivers-7.4' of https://git.kernel.org/pub/scm/=
linux/kernel/git/krzk/linux into soc/drivers
      Merge tag 'memory-controller-drv-7.4' of https://git.kernel.org/pu=
b/scm/linux/kernel/git/krzk/linux-mem-ctrl into soc/drivers
      Merge tag 'ti-driver-soc-for-v7.4' of https://git.kernel.org/pub/s=
cm/linux/kernel/git/ti/linux into soc/drivers
      Merge tag 'amlogic-drivers-for-v7.4' of https://git.kernel.org/pub=
/scm/linux/kernel/git/amlogic/linux into soc/drivers
      Merge tag 'tegra-for-7.4-soc' of git://git.kernel.org/pub/scm/linu=
x/kernel/git/tegra/linux into soc/drivers
      Merge tag 'tee-for-v7.4' of git://git.kernel.org/pub/scm/linux/ker=
nel/git/jenswi/linux-tee into soc/drivers
      Merge tag 'qcomtee-for-v7.4' of git://git.kernel.org/pub/scm/linux=
/kernel/git/jenswi/linux-tee into soc/drivers
      Merge tag 'at91-soc-7.4' of https://git.kernel.org/pub/scm/linux/k=
ernel/git/at91/linux into soc/drivers
      Merge tag 'soc_fsl-7.4-1' of https://git.kernel.org/pub/scm/linux/=
kernel/git/chleroy/linux into soc/drivers
      Merge tag 'zynqmp-soc-for-7.4' of https://github.com/Xilinx/linux-=
xlnx into soc/drivers
      Merge tag 'riscv-firmware-for-v7.4' of https://git.kernel.org/pub/=
scm/linux/kernel/git/conor/linux into soc/drivers
      Merge tag 'riscv-soc-drivers-for-v7.4' of https://git.kernel.org/p=
ub/scm/linux/kernel/git/conor/linux into soc/drivers
      Merge tag 'cache-for-v7.4' of https://git.kernel.org/pub/scm/linux=
/kernel/git/conor/linux into soc/drivers

Ayman Chaudhry (3):
      soc: renesas: Identify RZ/G2M v3.0 SoC
      soc: renesas: rcar-rst: Add support for RZ/G2M v3.0
      soc: renesas: Enable SYSC driver for r8a774a3

Bartosz Golaszewski (2):
      soc: fsl: qe: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
      arm64: enable HAVE_SHARED_GPIOS for all ARM64 platforms

Ben Dooks (2):
      soc: qcom: smsm: fix __iomem annotations
      soc: qcom: smp2p: fix __iomem annotation on entry->value pointer

Bence Csokas (1):
      cache: Make cpu_cache_invalidate_memregion() error out if there ar=
e no handlers

Biju Das (2):
      soc: renesas: rz-sysc: Register auxiliary device for PWRRDY power =
sequencer
      soc: renesas: Kconfig: Select POWER_SEQUENCING_RENESAS_PWRRDY for =
R9A08G046

Bill Wendling (1):
      bus: fsl-mc: Annotate fsl_mc_io.portal_virt_addr with __counted_by=
_ptr

Bjorn Andersson (2):
      firmware: arm_scmi: Add SCMI device table alias support
      firmware: qcom: scm: Allow QSEECOM on Asus Zenbook A14 (UX3407NA)

Changhuang Liang (9):
      dt-bindings: clock: Add StarFive JHB100 System-0 clock and reset g=
enerator
      dt-bindings: clock: Add StarFive JHB100 System-1 clock and reset g=
enerator
      dt-bindings: clock: Add StarFive JHB100 System-2 clock and reset g=
enerator
      dt-bindings: clock: Add StarFive JHB100 Peripheral-0 clock and res=
et generator
      dt-bindings: clock: Add StarFive JHB100 Peripheral-1 clock and res=
et generator
      dt-bindings: clock: Add StarFive JHB100 Peripheral-2 clock and res=
et generator
      dt-bindings: clock: Add StarFive JHB100 Peripheral-3 clock and res=
et generator
      dt-bindings: soc: starfive: Add StarFive JHB100 syscon modules
      soc: starfive: Add socinfo driver for JHB100 SoC

Christophe Leroy (CS GROUP) (1):
      soc: fsl: qe: Fix sparse warnings in GPIO

Chuan Liu (6):
      dt-bindings: soc: amlogic: Reordering compatible of clk-measure
      dt-bindings: soc: amlogic: Add clk-measure compatible to support m=
ore SoCs
      soc: amlogic: clk-measure: Support more measurement channels
      soc: amlogic: clk-measure: Align compatible entries with DT bindin=
gs
      soc: amlogic: clk-measure: Add support for more SoCs
      soc: amlogic: clk-measure: Optimize CLK_MSR_ID to reduce memory us=
age

Cristian Marussi (1):
      include: trace: Use string helpers in msg_dump trace events

Dan Carpenter (1):
      soc: qcom: smem: Fix signedness bug in smem_dram_parse()

Diego Fernando Mancera Gomez (1):
      memory: stm32_omm: fix child clock leak on set_amcr() error path

Fenglin Wu (1):
      dt-bindings: spmi: glymur-spmi-pmic-arb: Add compatible for Qualco=
mm Maili SoC

Geert Uytterhoeven (5):
      soc: renesas: Expand MFIS acronym in RCAR_MFIS help description
      firmware: arm_scmi: Merge scmi_reset_proto_ops.name_get() and .lat=
ency_get()
      soc: atmel: Convert to of_machine_device_match()
      soc/tegra: pmc: Make sure clk_init_data is fully initialized
      firmware: QCOM interfaces should depend on ARCH_QCOM

Gopikrishna Garmidi (4):
      soc: qcom: smem: fix 32-bit overflow in DDR frequency calculation
      firmware: qcom: scm: Allow QSEECOM on the Glymur QCB
      firmware: qcom: scm: Allow QSEECOM on Kalambo CRD
      soc: qcom: ubwc: Add Kalambo UBWC config

Gourav Kumar (1):
      soc: qcom: ubwcg: Add Nord UBWC config

Guangshuo Li (1):
      soc: mpfs: use kref cleanup on probe failure

Hans de Goede (1):
      firmware: arm_scmi: Always create devices for standard protocols

Hardeep Sharma (2):
      dt-bindings: firmware: qcom,scm: Document SCM on Kuno SoC
      soc: qcom: geni-se: allow selection on 32-bit ARM Qualcomm SoCs

Hemanth Selam (6):
      firmware: arm_scmi: Fix typo "upto" in comment
      firmware: ti_sci: Fix typo "upto" in comments
      bus: fsl-mc: fix repeated word 'for' in comment
      soc: ti: knav_qmss: Fix typos in comments
      firmware: qcom: fix typo "uninterruptable" in comment
      soc: qcom: fix typo "upto" in comment

Hongyan Xu (1):
      soc: qcom: apr: clean up failed service registrations

Hrushiraj Gandhi (1):
      firmware: microchip: use kzalloc_objs() instead of kzalloc() with =
multiply

Jaidev Shastri (1):
      soc: samsung: exynos-pmu: order pmu_base_addr before the pmu_conte=
xt gate

James Calligeros (1):
      arm64: Kconfig: Select HAVE_SHARED_GPIOS for Apple Silicon

Jason Pettit (1):
      firmware: qcom: scm: Allow QSEECOM on HP EliteBook X G2q 14 AI

Jiawen Liu (1):
      memory: exynos5422-dmc: handle clock enable failures

Jie Gan (1):
      dt-bindings: arm: add CTCU device for shikra

Jingyi Wang (2):
      dt-bindings: arm: qcom,ids: Add SoC ID for SM8950
      soc: qcom: socinfo: Add SM8950 SoC ID

Jon Hunter (1):
      soc/tegra: fuse: Add Tegra264 support

Justin Chen (2):
      memory: brcmstb_dpfe: Fix out-of-bounds access due to DCPU offset
      memory: brcmstb_dpfe: Bounds check DCPU-supplied MSG_ARG_COUNT

Justin Yeh (1):
      soc: mediatek: mtk-regulator-coupler: Add support for MT8189

Karl Mehltretter (2):
      soc: ti: k3-ringacc: Correct ring API kernel-doc
      soc: ti: k3-ringacc: Fix DMA ring initialization kernel-doc

Kartik Rajput (1):
      soc/tegra: pmc: Add PMC support for Tegra410

Kathiravan Thirumoorthy (2):
      soc: qcom: llcc: Update the SCT table for IPQ5424
      dt-bindings: sram: describe the IPQ5424 IMEM as mmio-sram

Kees Cook (1):
      memory: emif: Remove const from min_tck allocation type

Ketan Patil (3):
      memory: tegra: Use named defines for Tegra264 MC apertures
      memory: tegra: Parameterise Tegra264 MCF slice bound
      memory: tegra: Refactor Tegra264 mc-err code

Konrad Dybcio (3):
      soc: qcom: smem: support Glymur DRAM info
      firmware: qcom: scm: Allow QSEECOM on Yoga Slim 7x Gen11
      soc: qcom: pmic_glink: Avoid losing early rpmsg probe

Krzysztof Kozlowski (3):
      Merge tag 'renesas-drivers-for-v7.4-tag1' of https://git.kernel.or=
g/pub/scm/linux/kernel/git/geert/renesas-devel into soc/drivers
      Merge tag 'mtk-soc-for-v7.4' of ssh://gitolite.kernel.org/pub/scm/=
linux/kernel/git/mediatek/linux into soc/drivers
      Merge tag 'scmi-updates-7.4' of https://git.kernel.org/pub/scm/lin=
ux/kernel/git/sudeep.holla/linux into soc/drivers

Lad Prabhakar (7):
      memory: renesas-rpc-if: Mark XSPI_CDD1BUF0 as volatile
      memory: renesas-rpc-if: Move static bridge configurations out of d=
irmap hot paths
      memory: renesas-rpc-if: Consolidate XSPI_CDTBUF0 updates in write =
path
      memory: renesas-rpc-if: Consolidate XSPI_CDTBUF0 updates in read p=
ath
      memory: renesas-rpc-if: Consolidate command setup register program=
ming
      memory: renesas-rpc-if: Use runtime PM autosuspend after transfers
      soc: renesas: Kconfig: Enable ICU support for RZ/G3E and RZ/V2N

Linkai Gong (1):
      firmware: imx: dsp: fix mailbox channel leak on kasprintf failure

Linmao Li (1):
      soc: qcom: smem: Fix byte order in v3 14-frequency parser

Luca Leonardo Scorcia (1):
      soc: mediatek: mt8167-mmsys: add routes for all display paths

Luca Weiss (1):
      dt-bindings: interconnect: qcom-bwmon: Add Milos cpu-bwmon compati=
ble

Manikanta Maddireddy (1):
      soc/tegra: pmc: Add PCIe wake event for Tegra234

Maulik Shah (3):
      soc: qcom: rpmh-internal: fix kernel-doc issues in rpmh-internal.h
      soc: qcom: rpmh: fix kernel-doc issues in rpmh.c
      soc: qcom: rpmh-rsc: fix kernel-doc issues in rpmh-rsc.c

Michal Simek (1):
      firmware: xilinx: ufs: move PHY/SRAM ready polling into the firmwa=
re backend

Miles Krause (1):
      memory: emif: fix device_node reference leak on np_ddr

Mohammad Rafi Shaik (1):
      ASoC: dt-bindings: qcom,apr: Add modem_apps GLINK channel for shik=
ra

Mukesh Ojha (6):
      firmware: qcom: scm: Use devm_of_reserved_mem_device_init()
      dt-bindings: arm: qcom,ids: Add SoC ID for SM8975
      soc: qcom: socinfo: Add SM8975 SoC ID
      firmware: qcom: tzmem: Use DO_ONCE_SLEEPABLE() in qcom_tzmem_enabl=
e()
      firmware: qcom_scm: handle empty PAS resource table
      firmware: qcom_scm: align PAS resource table retry

Muzaffer Kadir (2):
      dt-bindings: firmware: qcom,scm: Document MSM8952 SCM
      soc: qcom: ubwc: Add UBWC config for MSM8952

Myeonghun Pak (3):
      soc: fsl: dpio: Fix cleanup on IRQ registration failure
      soc: fsl: dpio: Free the IRQ before releasing the I/O object
      platform: cznic: turris-omnia-mcu: stop button emulation producers

Neil Armstrong (1):
      soc: qcom: geni-se: provide PROG_RAM_DEPTH for I2C HUB Serial Engi=
nes

Nick Chan (2):
      soc: apple: rtkit-crashlog: rename 'Crg8' section from regs to aar=
ch64
      soc: apple: rtkit-crashlog: Add support for AArch32 state 'CrgA' s=
ection

Pan Chuang (2):
      soc: qcom: Remove redundant dev_err()
      cache: sifive_ccache: Remove redundant dev_err_probe()

Pawel Zalewski (The Capable Hub) (1):
      cache: hisi_soc_hha: use named initializers for acpi_device_id

Peng Fan (1):
      soc: qcom: use assign_bit() where applicable

Pengpeng Hou (1):
      memory: brcmstb_dpfe: validate firmware section sizes

Ridham Khurana (1):
      platform: cznic: turris-omnia-mcu: Add missing MODULE_DEVICE_TABLE=
()

Roland Dreier (3):
      firmware: arm_scmi: Protect xfer->async_done with xfer->lock
      firmware: arm_scmi: Don't reuse raw xfers with async_done still ar=
med
      firmware: arm_scmi: Fix error path leak in scmi_raw_message_send()

Sasha Levin (1):
      firmware: qcom: scm: Hide QCOM_SCM instead of depending on ARCH_QC=
OM

Siddharth Karanam (1):
      firmware: ti_sci: replace kcalloc with kzalloc for buffer pointer =
allocation

Sneh Mankad (2):
      dt-bindings: soc: qcom: stats: Add compatible for Shikra
      soc: qcom: stats: Add stats compatible and config for Shikra

Somesh Dey (1):
      soc: qcom: geni-se: Drop unused icc_ddr parameter from geni_icc_ge=
t()

Sreeshankar K (2):
      dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
      soc: qcom: socinfo: Add SM7250 SoC ID

Srinivas Kandagatla (1):
      firmware: qcom: scm: Allow QSEECOM on ThinkPad T14s Gen 7

Sudeep Holla (11):
      firmware: arm_ffa: Tear down driver during shutdown
      Merge branches 'for-next/ffa/fixes' and 'for-next/scmi/fixes' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux
      firmware: arm_scmi: Set generated device fwnode with platform help=
ers
      firmware: arm_scmi: Extend transport driver macro to support ACPI
      firmware: arm_scmi: Convert OF-only paths to generic fwnode in SCM=
I core
      firmware: arm_scmi: Fall back to ACPI HID when "compatible" is abs=
ent
      firmware: arm_scmi: Pass protocol ID to transport chan_available()
      firmware: arm_scmi: Refactor protocol device creation logic
      firmware: arm_scmi: Add ACPI PCC transport
      firmware: arm_scmi: Initialise known ACPI protocol devices and cha=
nnels
      firmware: arm_scmi: Validate PCC shared memory signature

Sumit Garg (1):
      firmware: qcom_scm: Remove SCM PAS wrappers

Taniya Das (1):
      dt-bindings: mailbox: qcom: Document Maili CPUCP mailbox controller

Tanmay Shah (1):
      firmware: xilinx: support RPU boot from DDR

Thierry Reding (1):
      soc/tegra: cbb: Fix loggger -> logger typo

Thomas Huth (2):
      memory: emif: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi =
headers
      ARM: at91: Replace __ASSEMBLY__ with __ASSEMBLER__

Uwe Kleine-K=C3=B6nig (The Capable Hub) (2):
      soc: qcom: apr: Drop unused apr_device_id
      tee: qcomtee: Drop unused assignment of platform_device_id driver =
data

Viken Dadhaniya (4):
      soc: qcom: geni-se: Fix endian conversion for serial_protocol comp=
arison
      soc: qcom: geni-se: Widen fw_size to u32 to prevent wrap-around
      soc: qcom: geni-se: Fix fw_end computed before round-up; propagate=
 size to caller
      soc: qcom: geni-se: Fix write to read-only firmware buffer

Vincent Jardin (3):
      bus: fsl-mc: set dma_mask for the DPRC devices
      bus: fsl-mc: register the object drivers after misc_class exists
      bus: fsl-mc: drop the fwnode links of the dpmacs nodes

Vitalii Skorkin (1):
      firmware: qcom: tzmem: disable SHM bridge for SM7125 platform

Wangao Wang (2):
      soc: qcom: ubwc: Add configuration for Hawi
      soc: qcom: ubwc: Add configuration for Maili

Wentao Liang (1):
      soc: fsl: cpm1: tsa: Fix clock leak in tsa_of_parse_tdms()

Wolfram Sang (2):
      soc: renesas: rcar-mfis: Convert spinlock to raw_spinlock
      soc: renesas: rcar-mfis: Add hwspinlock support

Xixin Liu (5):
      firmware: arm_scpi: fix device_node leak in scpi_dev_domain_id
      firmware: arm_scpi: reject DVFS OPP count above MAX_DVFS_OPPS
      clk: scpi: bound-check DVFS index in scpi_dvfs_recalc_rate
      clk: scpi: register scpi-cpufreq once and clear on failure
      clk: scpi: use PLATFORM_DEVID_NONE for scpi-cpufreq

Yibo Tan (1):
      soc: qcom: pmic_pdcharger_ulog: prevent work requeue during remove

Yuho Choi (3):
      soc/tegra: flowctrl: Release OF node reference on error
      bus: arm-cci: Drop CPU node reference in cci_ace_init_ports()
      bus: arm-cci: Drop cci-control-port node reference in __cci_ace_ge=
t_port()

Zhengnan Chen (2):
      dt-bindings: memory-controllers: mtk-smi: Add support for mt8189
      memory: mtk-smi: Add MT8189 support

bui duc phuc (1):
      soc: qcom: llcc-qcom: Handle errors from optional IRQ lookup

 .../bindings/arm/qcom,coresight-ctcu.yaml          |   1 +
 .../devicetree/bindings/cache/qcom,llcc.yaml       |  55 +-
 .../bindings/clock/starfive,jhb100-per0crg.yaml    |  70 ++
 .../bindings/clock/starfive,jhb100-per1crg.yaml    |  70 ++
 .../bindings/clock/starfive,jhb100-per2crg.yaml    |  76 ++
 .../bindings/clock/starfive,jhb100-per3crg.yaml    |  76 ++
 .../bindings/clock/starfive,jhb100-sys0crg.yaml    |  63 ++
 .../bindings/clock/starfive,jhb100-sys1crg.yaml    |  71 ++
 .../bindings/clock/starfive,jhb100-sys2crg.yaml    |  64 ++
 .../devicetree/bindings/firmware/qcom,scm.yaml     |   4 +
 .../bindings/hwinfo/samsung,exynos-chipid.yaml     |   1 +
 .../bindings/interconnect/qcom,msm8998-bwmon.yaml  |   1 +
 .../bindings/mailbox/qcom,cpucp-mbox.yaml          |   1 +
 .../memory-controllers/mediatek,smi-common.yaml    |  21 +-
 .../memory-controllers/mediatek,smi-larb.yaml      |   3 +
 Documentation/devicetree/bindings/mfd/syscon.yaml  |   1 +
 .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  |  16 +-
 .../devicetree/bindings/soc/qcom/qcom,apr.yaml     |   4 +-
 .../devicetree/bindings/soc/qcom/qcom-stats.yaml   |  25 +-
 .../soc/starfive/starfive,jhb100-syscon.yaml       | 115 +++
 .../bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml   |   1 +
 .../devicetree/bindings/sram/qcom,imem.yaml        |   1 -
 Documentation/devicetree/bindings/sram/sram.yaml   |   3 +
 MAINTAINERS                                        |   2 +
 arch/arm/mach-at91/pm.h                            |   2 +-
 arch/arm64/Kconfig                                 |   1 +
 arch/arm64/Kconfig.platforms                       |   1 -
 drivers/bus/arm-cci.c                              |   6 +-
 drivers/bus/fsl-mc/fsl-mc-bus.c                    |  64 +-
 drivers/bus/fsl-mc/fsl-mc-msi.c                    |   2 +-
 drivers/cache/hisi_soc_hha.c                       |   2 +-
 drivers/cache/sifive_ccache.c                      |   2 +-
 drivers/clk/clk-scpi.c                             |  11 +-
 drivers/firmware/arm_ffa/driver.c                  |   1 +
 drivers/firmware/arm_scmi/bus.c                    | 109 ++-
 drivers/firmware/arm_scmi/common.h                 |  61 +-
 drivers/firmware/arm_scmi/driver.c                 | 262 ++++--
 drivers/firmware/arm_scmi/protocols.h              |   9 +-
 drivers/firmware/arm_scmi/raw_mode.c               |  30 +-
 drivers/firmware/arm_scmi/reset.c                  |  36 +-
 drivers/firmware/arm_scmi/transports/Kconfig       |  12 +
 drivers/firmware/arm_scmi/transports/Makefile      |   2 +
 drivers/firmware/arm_scmi/transports/mailbox.c     |   7 +-
 drivers/firmware/arm_scmi/transports/optee.c       |   7 +-
 drivers/firmware/arm_scmi/transports/pcc.c         | 875 ++++++++++++++=
+++++
 drivers/firmware/arm_scmi/transports/smc.c         |  10 +-
 drivers/firmware/arm_scmi/transports/virtio.c      |   3 +-
 drivers/firmware/arm_scpi.c                        |   9 +-
 drivers/firmware/imx/imx-dsp.c                     |   6 +-
 drivers/firmware/microchip/mpfs-auto-update.c      |   4 +-
 drivers/firmware/qcom/Kconfig                      |   5 +-
 drivers/firmware/qcom/qcom_scm-legacy.c            |   2 +-
 drivers/firmware/qcom/qcom_scm.c                   | 187 ++---
 drivers/firmware/qcom/qcom_tzmem.c                 |   3 +-
 drivers/firmware/ti_sci.c                          |   6 +-
 drivers/firmware/xilinx/zynqmp-ufs.c               |  70 +-
 drivers/firmware/xilinx/zynqmp.c                   |  44 +-
 drivers/memory/brcmstb_dpfe.c                      |  41 +-
 drivers/memory/emif.c                              |   6 +-
 drivers/memory/emif.h                              |   4 +-
 drivers/memory/mtk-smi.c                           |  45 +
 drivers/memory/renesas-rpc-if.c                    |  87 +-
 drivers/memory/samsung/exynos5422-dmc.c            |  11 +-
 drivers/memory/stm32_omm.c                         |   2 +
 drivers/memory/tegra/tegra264.c                    | 376 ++++++---
 drivers/platform/cznic/turris-omnia-mcu-base.c     |   1 +
 drivers/platform/cznic/turris-omnia-mcu-gpio.c     |  31 +-
 drivers/soc/Kconfig                                |   1 +
 drivers/soc/Makefile                               |   1 +
 drivers/soc/amlogic/meson-clk-measure.c            | 927 ++++++++++++++=
++++++-
 drivers/soc/apple/rtkit-crashlog.c                 | 139 ++-
 drivers/soc/atmel/soc.c                            |   4 +-
 drivers/soc/fsl/dpio/dpio-driver.c                 |   9 +-
 drivers/soc/fsl/qe/gpio.c                          |  67 +-
 drivers/soc/fsl/qe/tsa.c                           |  16 +-
 drivers/soc/mediatek/mt8167-mmsys.h                | 183 +++-
 drivers/soc/mediatek/mtk-regulator-coupler.c       |   1 +
 drivers/soc/microchip/mpfs-sys-controller.c        |   7 +-
 drivers/soc/qcom/Kconfig                           |   1 -
 drivers/soc/qcom/apr.c                             |  69 +-
 drivers/soc/qcom/llcc-qcom.c                       | 199 ++++-
 drivers/soc/qcom/pmic_glink.c                      |   3 +-
 drivers/soc/qcom/pmic_glink_altmode.c              |   4 +-
 drivers/soc/qcom/pmic_pdcharger_ulog.c             |   2 +-
 drivers/soc/qcom/qcom-geni-se.c                    |  65 +-
 drivers/soc/qcom/qcom_aoss.c                       |   4 +-
 drivers/soc/qcom/qcom_stats.c                      |   9 +
 drivers/soc/qcom/rpmh-internal.h                   |  16 +-
 drivers/soc/qcom/rpmh-rsc.c                        |   4 +-
 drivers/soc/qcom/rpmh.c                            |  40 +-
 drivers/soc/qcom/smem_dramc.c                      |  81 +-
 drivers/soc/qcom/smp2p.c                           |  22 +-
 drivers/soc/qcom/smsm.c                            |  36 +-
 drivers/soc/qcom/socinfo.c                         |   3 +
 drivers/soc/qcom/ubwc_config.c                     |  12 +
 drivers/soc/renesas/Kconfig                        |  22 +-
 drivers/soc/renesas/r9a08g046-sysc.c               |   1 +
 drivers/soc/renesas/rcar-mfis.c                    |  62 +-
 drivers/soc/renesas/rcar-rst.c                     |   1 +
 drivers/soc/renesas/renesas-soc.c                  |   3 +
 drivers/soc/renesas/rz-sysc.c                      |   5 +
 drivers/soc/renesas/rz-sysc.h                      |   2 +
 drivers/soc/samsung/exynos-chipid.c                |   1 +
 drivers/soc/samsung/exynos-pmu.c                   |  84 +-
 drivers/soc/starfive/Kconfig                       |   6 +
 drivers/soc/starfive/Makefile                      |   2 +
 drivers/soc/starfive/socinfo/Kconfig               |  13 +
 drivers/soc/starfive/socinfo/Makefile              |   2 +
 drivers/soc/starfive/socinfo/jhb100-socinfo.c      | 105 +++
 drivers/soc/tegra/cbb/tegra194-cbb.c               |   2 +-
 drivers/soc/tegra/flowctrl.c                       |   7 +-
 drivers/soc/tegra/fuse/fuse-tegra.c                |  12 +-
 drivers/soc/tegra/fuse/fuse-tegra30.c              | 168 +++-
 drivers/soc/tegra/fuse/fuse.h                      |   7 +-
 drivers/soc/tegra/fuse/speedo-tegra210.c           |  22 +-
 drivers/soc/tegra/fuse/tegra-apbmisc.c             |  51 +-
 drivers/soc/tegra/pmc.c                            | 165 +++-
 drivers/soc/ti/knav_qmss_queue.c                   |   4 +-
 drivers/ufs/host/ufs-amd-versal2.c                 |  46 +-
 drivers/usb/host/fhci-hcd.c                        |   2 +-
 include/dt-bindings/arm/qcom,ids.h                 |   3 +
 include/dt-bindings/clock/starfive,jhb100-crg.h    | 554 ++++++++++++
 include/dt-bindings/reset/starfive,jhb100-crg.h    | 189 +++++
 include/linux/device-id/apr.h                      |  21 -
 include/linux/device-id/scmi.h                     |  17 +
 include/linux/firmware/qcom/qcom_scm.h             |  29 -
 include/linux/firmware/xlnx-zynqmp-ufs.h           |   8 +-
 include/linux/firmware/xlnx-zynqmp.h               |   5 -
 include/linux/fsl/mc.h                             |   2 +-
 include/linux/mod_devicetable.h                    |   1 -
 include/linux/scmi_protocol.h                      |  20 +-
 include/linux/soc/qcom/apr.h                       |   4 +-
 include/linux/soc/qcom/geni-se.h                   |   2 +-
 include/linux/soc/qcom/llcc-qcom.h                 |   6 +
 include/linux/soc/qcom/ubwc.h                      |   3 +
 include/linux/soc/ti/k3-ringacc.h                  |  31 +-
 include/soc/fsl/qe/qe.h                            |   6 +-
 include/soc/tegra/fuse.h                           |   1 +
 include/trace/events/scmi.h                        |   8 +-
 include/uapi/linux/tee.h                           |  40 +-
 lib/cache_maint.c                                  |   4 +-
 scripts/mod/devicetable-offsets.c                  |   5 +
 scripts/mod/file2alias.c                           |  12 +
 143 files changed, 5841 insertions(+), 1050 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb=
100-per0crg.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb=
100-per1crg.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb=
100-per2crg.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb=
100-per3crg.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb=
100-sys0crg.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb=
100-sys1crg.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb=
100-sys2crg.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/starfive/starf=
ive,jhb100-syscon.yaml
 create mode 100644 drivers/firmware/arm_scmi/transports/pcc.c
 create mode 100644 drivers/soc/starfive/Kconfig
 create mode 100644 drivers/soc/starfive/Makefile
 create mode 100644 drivers/soc/starfive/socinfo/Kconfig
 create mode 100644 drivers/soc/starfive/socinfo/Makefile
 create mode 100644 drivers/soc/starfive/socinfo/jhb100-socinfo.c
 create mode 100644 include/dt-bindings/clock/starfive,jhb100-crg.h
 create mode 100644 include/dt-bindings/reset/starfive,jhb100-crg.h
 delete mode 100644 include/linux/device-id/apr.h
 create mode 100644 include/linux/device-id/scmi.h
