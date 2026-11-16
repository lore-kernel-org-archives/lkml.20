Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=71.18.227.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813837;
	b=fs0uCdURg8TYL+AIRGf9+jUDZVeay++eQzNGSHoSAmUKOjbh3im53xot/egTijLeNLMb
	 DNqVRWSDB/oYmK6vYQM/RvMrAwPOInpcrPeFF00TkarHvGUU/TbxWmuCzfCL2IYXx2WFI
	 E7bWcTlgb6V0ocurj1+ENntWJABK6UR1vhrQEH+Iu30qIAq/79fkKSN1328jxNG/UDzoA
	 bGjOPv4wB/8a/Eku1zIKaJHXIqBDgBIYoLtVoTpKye/r4RSUu6oF6uNawNWIg0lZVxZoS
	 LZe6JvZAvfFVYSnyLTgyPEO8X2hki5oTDcrINJFSOYUZm/ki6JAwJwO6yEKVEe5nh9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813837;
	h=DMARC-Filter:DKIM-Signature:Message-Id:X-Lms-Return-Path:To:Cc:From:
	 Subject:Date:Mime-Version:X-Original-From:Received:Content-Type:
	 Content-Transfer-Encoding;
	bh=ROYrK381p27dvJFAOgNa/krOl71oQtj1ox7sTaYSwVs=;
	b=KMbUL6stEfX56d7ut4njlByihy9Ca4o6DCb3IzEXP66eDqUfCfYb6zI3808RowOjGauD
	 1vgbEz3tLxn98X3OnZd1sbS+4vt+RGj/m40NYmxJW3s4YGhmx2x4bTBWdQPzoTVZAU68S
	 2qJk/vCLYrAwYLRqLgErulC8sx2RpjDpdo9Wzmgq+bp4PY/f9NSf19r7BFJ0/u/GAbyzz
	 V174akmAH4LukfELIFoFV54saO3G4bf1XissIJfi5AuS+B43OZm9I5PiI/gI1Mys03d1A
	 pN2CJBKFoEQAv+ffRC3dKYd8jv17oO9cq5/ReqsAetcwZhpugXSZrI8/HO5SCgtx5gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bedmex.com;
	spf=none smtp.mailfrom=bedmex.com;
	dkim=pass header.d=bedmex-com.20200927.dkim.feishu.cn header.i=@bedmex-com.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=IA5bIaoI;
	arc=none smtp.remote-ip=71.18.227.4
Received: from sg-2-4.ptr.blmpb.com (sg-2-4.ptr.blmpb.com [71.18.227.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED62B606A338
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED62B606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bedmex.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bedmex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bedmex-com.20200927.dkim.feishu.cn header.i=@bedmex-com.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=IA5bIaoI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=bedmex-com.20200927.dkim.feishu.cn; t=1794813823;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=ROYrK381p27dvJFAOgNa/krOl71oQtj1ox7sTaYSwVs=;
 b=IA5bIaoIu6wk4gCyIG5mttRnt1kNysQBsGj0kgtlWRodVjxSdpo6es+xVlRy0WXJ00jh2O
 WRe0MnT/XC4AFJDVdgjkSVkMc1c2+ZroSnCvfZGy07THksebzoikeeriuVbxg1/PB98ZoS
 CCm55+ny6O18aeCb951tpdHlJaAInuuCSwHemT9fVXL8WhDsUhKVN8LSh31g7Xneem8MfU
 zvIiQR2y69aJv7WZMnhwBSq6EsmeF7UNg0TpH9sJ9pOyfUhUICOJ2mLAGDXX0AE9JjKVth
 YMiC1iUtvdqqRMvVzZwZWN/bTaySlwuoxXvfPRKR0NFfTEo728TeSmo0bO+Vsw==
Message-Id: <179481380235.4.7388336477392853157@bedmex.com>
X-Lms-Return-Path: <lba+26afaaf7d+7d1dcc+vger.kernel.org+yanli.yang@bedmex.com>
To: <linux-wireless@vger.kernel.org>
Cc: "Johannes Berg" <johannes@sipsolutions.net>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, "Zhirun Liu" <zhirunliu@aicsemi.com>, 
	"Dijia Xu" <dijiaxu@aicsemi.com>, "Chunqiu Liu" <chunqiuliu@aicsemi.com>, 
	"Liheng Wei" <liheng.wei@bedmex.com>, <yanli.yang@bedmex.com>
From: "Yanli Yang" <yanli.yang@bedmex.com>
Subject: [PATCH wireless-next v5 0/4] wifi: aic: Add AIC8800D80 and D80N SDIO FullMAC driver
Date: Mon, 16 Nov 2026 15:23:22 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Original-From: Yanli Yang <yanli.yang@bedmex.com>
Received: from [127.0.1.1] ([36.141.79.164]) by smtp.feishu.cn with ESMTPS; Mon, 16 Nov 2026 15:23:40 +0800
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This series adds an SDIO FullMAC Wi-Fi driver for AIC8800D80 U02 and
AIC8800D80N devices, with an initial station-mode configuration using
cfg80211/nl80211 on the 2.4 GHz and 5 GHz bands.

This is the first non-RFC revision, following RFC v1 through v4. It
reworks the driver into a single aic8800_fdrv module, adds D80N support
and documents the SDIO device tree binding. Firmware boot, transport and
network-interface lifecycle are managed within the same driver.

The series is organized as follows:

  1. register the vendor prefix and document the SDIO Wi-Fi binding;
  2. add firmware definitions, command/event handling, SDIO transport
     and D80/D80N chip-specific initialization;
  3. add cfg80211 operations, TX/RX paths and driver build configuration;
  4. connect the complete driver to the wireless build and MAINTAINERS.

Parent build integration is last so that intermediate source states are
not selectable through the wireless Kconfig.

Changes since RFC v4:

  - merge the BSP and FullMAC implementation into one module; remove
    aic8800_bsp/ and its private cross-module exported interface;
  - consolidate driver sources under aic8800_fdrv/ and rename
    the FullMAC rwnx_* source files and core driver symbols to aicwf_*;
  - add D80N chip operations, SDIO IDs and U02/U02C firmware boot paths;
  - remove the private generic-netlink family and private-command
    implementation retained in RFC v4;
  - remove the bundled regulatory database and rwnx_settings.ini parser;
    use cfg80211 channel restrictions and transmit-power limits when
    configuring firmware;
  - remove module-parameter entry points and use internal configuration
    defaults and standard cfg80211 operations;
  - replace Makefile-generated CONFIG_* definitions with Kconfig symbols
    and internal resource-limit definitions;
  - load firmware through the standard firmware loader under aic/ and
    declare the required filenames with MODULE_FIRMWARE();
  - add the shared D80/D80N device tree binding and vendor prefix; and
  - rebase and repartition the series for the current source layout.

Because the BSP layer has been removed and the source layout and patch
boundaries have changed, RFC v4 patches do not map one-to-one to this
revision. This is a new-driver series against wireless-next; the changes
above describe its evolution from the earlier submissions.

Scope:

  - the selectable baseline is SDIO station mode on D80 U02 and D80N;
  - AP, P2P, monitor and mesh modes are not enabled by this configuration;
    some associated source and disabled branches remain;
  - optional per-device TX-buffer and TX-queue preallocation remain;
  - the binding documents optional out-of-band wake lines; this revision
    uses the SDIO interrupt path and does not consume those optional
    wake-line properties; and
  - firmware binaries and user configuration files are not part of this
    kernel series. The driver requests them from aic/aic8800d80/ and
    aic/aic8800d80n/ in the firmware search path.

Validation of the current source:

  - Both AIC8800D80 and AIC8800D80N passed probe and firmware boot,
    module unload/reload, active/passive scanning on 2.4 and 5 GHz, open,
    WPA2-PSK and WPA3-SAE station connections, disconnect/reconnect,
    IPv4/IPv6 connectivity, suspend/resume and rfkill tests.
  - TCP and UDP TX/RX throughput testing was completed on both chips.
    Reported TCP TX/RX rates were 196/210 Mbit/s on 2.4 GHz and
    375/445 Mbit/s on 5 GHz; UDP TX/RX rates were 218/225 Mbit/s and
    422/511 Mbit/s, respectively.
  - Both chips passed 10 hours of sustained traffic testing. No kernel
    crashes, warnings, lockdep reports or firmware crashes were observed
    during testing.
  - GCC module builds, sparse and coccicheck checks passed, with no new
    compiler or sparse warnings reported.
  - 32-bit, allmodconfig warning-check and Clang builds succeeded in a
    newly created container.

AP mode and smatch were not run.

Previous submissions:

  RFC v4: https://lore.kernel.org/r/cover.1787991457.git.yanli.yang@bedmex.com
  RFC v3: https://lore.kernel.org/r/cover.1787903339.git.yanli.yang@bedmex.com
  RFC v2: https://lore.kernel.org/r/cover.1784724170.git.yanli.yang@bedmex.com
  RFC v1: https://lore.kernel.org/r/cover.1784544076.git.yanli.yang@bedmex.com

Tool assistance: OpenAI Codex assisted with the cover letter, commit
descriptions and patch-series preparation.

Zhirun Liu (4):
  dt-bindings: net: wireless: Add AIC8800D80 SDIO Wi-Fi
  wifi: aic: Add firmware protocol and SDIO chip support
  wifi: aic: Add the AIC8800D80 and D80N FullMAC driver
  wifi: aic: Integrate the AIC8800 SDIO driver

 .../net/wireless/aicsemi,aic8800d80-fmac.yaml |   78 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 MAINTAINERS                                   |   10 +
 drivers/net/wireless/Kconfig                  |    1 +
 drivers/net/wireless/Makefile                 |    1 +
 drivers/net/wireless/aic/Kconfig              |   16 +
 drivers/net/wireless/aic/Makefile             |    3 +
 drivers/net/wireless/aic/aic8800_fdrv/Kconfig |   90 +
 .../net/wireless/aic/aic8800_fdrv/Makefile    |   36 +
 .../net/wireless/aic/aic8800_fdrv/aic_bus.h   |   99 +
 .../wireless/aic/aic8800_fdrv/aicwf_bfmer.c   |   93 +
 .../wireless/aic/aic8800_fdrv/aicwf_bfmer.h   |  100 +
 .../aic/aic8800_fdrv/aicwf_chip_8800d80.c     |   96 +
 .../aic/aic8800_fdrv/aicwf_chip_8800d80n.c    |   74 +
 .../aic/aic8800_fdrv/aicwf_chip_ops.c         |  197 +
 .../aic/aic8800_fdrv/aicwf_chip_ops.h         |  116 +
 .../wireless/aic/aic8800_fdrv/aicwf_cmds.c    |  629 ++
 .../wireless/aic/aic8800_fdrv/aicwf_cmds.h    |  122 +
 .../aic/aic8800_fdrv/aicwf_compat_8800d80.c   |  281 +
 .../aic/aic8800_fdrv/aicwf_compat_8800d80.h   |   17 +
 .../aic/aic8800_fdrv/aicwf_compat_8800d80n.c  |  402 ++
 .../aic/aic8800_fdrv/aicwf_compat_8800d80n.h  |   17 +
 .../wireless/aic/aic8800_fdrv/aicwf_config.h  |   33 +
 .../wireless/aic/aic8800_fdrv/aicwf_defs.h    |  657 +++
 .../wireless/aic/aic8800_fdrv/aicwf_events.h  |  938 +++
 .../wireless/aic/aic8800_fdrv/aicwf_main.c    | 5114 +++++++++++++++++
 .../wireless/aic/aic8800_fdrv/aicwf_main.h    |   22 +
 .../wireless/aic/aic8800_fdrv/aicwf_mesh.c    |   33 +
 .../wireless/aic/aic8800_fdrv/aicwf_mesh.h    |   39 +
 .../aic/aic8800_fdrv/aicwf_mod_params.c       |  644 +++
 .../aic/aic8800_fdrv/aicwf_mod_params.h       |   59 +
 .../wireless/aic/aic8800_fdrv/aicwf_msg_rx.c  | 1412 +++++
 .../wireless/aic/aic8800_fdrv/aicwf_msg_rx.h  |   12 +
 .../wireless/aic/aic8800_fdrv/aicwf_msg_tx.c  | 2499 ++++++++
 .../wireless/aic/aic8800_fdrv/aicwf_msg_tx.h  |  201 +
 .../aic/aic8800_fdrv/aicwf_mu_group.c         |  653 +++
 .../aic/aic8800_fdrv/aicwf_mu_group.h         |  163 +
 .../aic/aic8800_fdrv/aicwf_platform.c         | 1507 +++++
 .../aic/aic8800_fdrv/aicwf_platform.h         |   91 +
 .../wireless/aic/aic8800_fdrv/aicwf_radar.c   | 1969 +++++++
 .../wireless/aic/aic8800_fdrv/aicwf_radar.h   |  289 +
 .../aic/aic8800_fdrv/aicwf_resv_mem.c         |  106 +
 .../aic/aic8800_fdrv/aicwf_resv_mem.h         |   54 +
 .../net/wireless/aic/aic8800_fdrv/aicwf_rx.c  | 2434 ++++++++
 .../net/wireless/aic/aic8800_fdrv/aicwf_rx.h  |  363 ++
 .../aic/aic8800_fdrv/aicwf_rx_prealloc.c      |   99 +
 .../aic/aic8800_fdrv/aicwf_rx_prealloc.h      |   39 +
 .../wireless/aic/aic8800_fdrv/aicwf_sdio.c    | 2439 ++++++++
 .../wireless/aic/aic8800_fdrv/aicwf_sdio.h    |  280 +
 .../wireless/aic/aic8800_fdrv/aicwf_strs.c    |  267 +
 .../wireless/aic/aic8800_fdrv/aicwf_strs.h    |   31 +
 .../net/wireless/aic/aic8800_fdrv/aicwf_tx.c  | 1469 +++++
 .../net/wireless/aic/aic8800_fdrv/aicwf_tx.h  |  165 +
 .../net/wireless/aic/aic8800_fdrv/aicwf_txq.c | 1368 +++++
 .../net/wireless/aic/aic8800_fdrv/aicwf_txq.h |  353 ++
 .../aic/aic8800_fdrv/aicwf_txq_prealloc.c     |   55 +
 .../aic/aic8800_fdrv/aicwf_txq_prealloc.h     |   31 +
 .../wireless/aic/aic8800_fdrv/aicwf_txrxif.c  |  666 +++
 .../wireless/aic/aic8800_fdrv/aicwf_txrxif.h  |  161 +
 .../wireless/aic/aic8800_fdrv/aicwf_utils.c   |   32 +
 .../wireless/aic/aic8800_fdrv/aicwf_utils.h   |   61 +
 .../net/wireless/aic/aic8800_fdrv/hal_desc.h  |  359 ++
 .../wireless/aic/aic8800_fdrv/ipc_shared.h    |  767 +++
 .../net/wireless/aic/aic8800_fdrv/lmac_mac.h  |  437 ++
 .../net/wireless/aic/aic8800_fdrv/lmac_msg.h  | 3092 ++++++++++
 .../wireless/aic/aic8800_fdrv/lmac_types.h    |   21 +
 .../net/wireless/aic/aic8800_fdrv/sdio_host.c |  136 +
 .../net/wireless/aic/aic8800_fdrv/sdio_host.h |   43 +
 68 files changed, 34143 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/aicsemi,aic8800d80-fmac.yaml
 create mode 100644 drivers/net/wireless/aic/Kconfig
 create mode 100644 drivers/net/wireless/aic/Makefile
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/Kconfig
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/Makefile
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aic_bus.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_bfmer.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_bfmer.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_chip_8800d80.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_chip_8800d80n.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_chip_ops.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_chip_ops.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_cmds.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_cmds.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_compat_8800d80.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_compat_8800d80.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_compat_8800d80n.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_compat_8800d80n.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_config.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_defs.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_events.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_main.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_main.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_mesh.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_mesh.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_mod_params.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_mod_params.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_msg_rx.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_msg_rx.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_msg_tx.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_msg_tx.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_mu_group.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_mu_group.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_platform.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_platform.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_radar.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_radar.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_resv_mem.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_resv_mem.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_rx.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_rx.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_rx_prealloc.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_rx_prealloc.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_sdio.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_sdio.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_strs.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_strs.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_tx.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_tx.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_txq.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_txq.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_txq_prealloc.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_txq_prealloc.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_txrxif.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_txrxif.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_utils.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_utils.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/hal_desc.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/ipc_shared.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/lmac_mac.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/lmac_msg.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/lmac_types.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/sdio_host.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/sdio_host.h


base-commit: b8e5b0ae8ff47240366d38e5d12c65f878724316
