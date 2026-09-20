Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EEA3EF670;
	Sun, 20 Sep 2026 10:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789898872; cv=none; b=Z2v8Mjfky6iV9OgyIlg/RZEGiuenBtZA4Sc2nxy6o6BS4GroUuswE8zRPaevN3iuZ3A8utrCyWe/C7clVg+R2xbrgUv8p5KNh0cxA6Net4tSEk+uk0i1i1QlWgXo9Mvir7wdkmADK0uvywKZIadVoWSGUYV81Q0l8vAAvMhh1ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789898872; c=relaxed/simple;
	bh=moqRVd1ISyWKp43B2L46v/RxAoVRhJPrc/Ukx5C5ujc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hZBbEA8xLQqCs7I3hMO3nTsmS+wiy2342ETYk08KwjA5+hzihbA8DVHQvR73DzmoF7tOdUMKKS/b/puOXYPtlmFO4aj8/JWq47SCO8GZlfJfh0CB00mRHG1BsNmWgYagp/xtQ7CnPEwkn10U7uVFI+neNiEAHIUgxk8pj3fT/2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realsil.com.cn; spf=pass smtp.mailfrom=realsil.com.cn; dkim=pass (2048-bit key) header.d=realsil.com.cn header.i=@realsil.com.cn header.b=JLtLJPoF; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realsil.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realsil.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realsil.com.cn header.i=@realsil.com.cn header.b="JLtLJPoF"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68KA6NGb81619077, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsil.com.cn;
	s=dkim; t=1789898783;
	bh=083nYyWU7EF9vQoxB6Xuy+lqNgfZK71CJI9FUajjX7M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=JLtLJPoFndxIwWTeoyvpaPL6/qaLgdV8aKmWG2/fzUIVYBV9n2x21g2gYjcZ0u9LI
	 rufFHigz84oquydkr02OyTyFPsaMHK89K7Fx1uP6SDb11wjZN+1/rfv8Zyy424Uy2h
	 ASc1E8XclIVOELxO7WsRaHkByxlOt0bq1uqdhufq9mpJTkzu+72QFUrE3uRHWIqmri
	 1xqoHZuUkFfI78eZCnEq9vChgXeu/eo7X8nAuoXommUBDFpEaaNy0sjTw7HcerncQn
	 FRSUseIkJMzKk0jSu75lZm+0Fp4bJChsjaSMW8wTS5kdZTvXk/HeY5idpP0AGebL/d
	 M6YJTCOtntkrQ==
Received: from RS-EX-MBS2.realsil.com.cn ([172.29.17.102])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 68KA6NGb81619077
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 20 Sep 2026 18:06:23 +0800
Received: from localhost (172.29.57.213) by RS-EX-MBS2.realsil.com.cn
 (172.29.17.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Sun, 20 Sep
 2026 18:06:23 +0800
From: <zain_zhou@realsil.com.cn>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones
	<lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Vikash Bansal <vikash.bansal@nxp.com>, Aman Kumar
 Pandey <aman.kumarpandey@nxp.com>, Lakshay Piplani <lakshay.piplani@nxp.com>
CC: <devicetree@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <mfd@lists.linux.dev>, Wei Wang
	<wei_wang@realsil.com.cn>, Yin Zhou <zain_zhou@realsil.com.cn>
Subject: [RFC PATCH 0/4] Add support for Realtek RTS490x I3C hub
Date: Sun, 20 Sep 2026 18:04:57 +0800
Message-ID: <20260920100501.4091351-1-zain_zhou@realsil.com.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: RS-EX-MBS1.realsil.com.cn (172.29.17.101) To
 RS-EX-MBS2.realsil.com.cn (172.29.17.102)

From: Yin Zhou <zain_zhou@realsil.com.cn>

Hi all,

This series adds support for the Realtek RTS490x family of I3C hubs.
The devices provide four or eight downstream target ports, which can be
configured as I3C buses or SMBus controller/target interfaces. They also
provide four programmable LDO outputs for the controller and target-port
power domains.

This RFC is based on the NXP P3H2x4x generic I3C hub framework series v17:

  [PATCH v17 0/8] Add support for NXP P3H2x4x I3C hub driver

The NXP dependency series is not included below and must be applied first.
It applies on top of current Linux mainline; the base commit used to build
and test this RFC is:

  940de590b839f71d6dc846160534bf202401b8b7

The dependency status and the final generic-hub API shape are an explicit
part of this RFC. If the generic framework is revised, this series will be
rebased accordingly. NXP's later v19 series will be evaluated for a future
revision of this RTS490x series and is not being used as the basis for this
RFC v1.

Patch overview:

  1. dt-bindings: i3c: Add Realtek RTS490x I3C hub support
     Add the RTS490x device-tree binding and register the binding with
     MAINTAINERS.

  2. mfd: Add driver for Realtek RTS490x I3C hub
     Add the I3C-only MFD parent, shared regmap, manufacturer matching,
     variant detection, protected-register lock, and child devices.

  3. regulator: rts490x: Add driver for on-die regulators
     Expose the four programmable LDOs through the regulator framework.
     Only regulator nodes explicitly present and enabled in DT are
     registered; omitted LDOs retain their existing hardware state.

  4. i3c: hub: Add Realtek RTS490x I3C hub support
     Add downstream I3C ports through the generic I3C hub framework and
     SMBus ports through Linux I2C adapters. SMBus controller completion
     and target receive handling use the hub self-IBI.

The first RFC intentionally has a limited scope:

  - The hub must be connected to the host through I3C.
  - GPIO and GPIO IRQ support are deferred to a follow-up series.
  - SMBus controller and target paths use IBI; polling fallback is not
    included.
  - Legacy I2C device discovery behind I3C-mode ports follows the existing
    behavior of the generic I3C master framework and has not been
    specifically validated on this hardware in this RFC.

Testing:

  - checkpatch.pl --strict, 0 errors/0 warnings across the series
  - dt_binding_check for the RTS490x binding
  - Cross-build validated for the MFD, regulator, and hub composite objects
  - git diff --check across the series
  - I3C and SMBus downstream ports have been functionally verified on
    target hardware.

Regards,
Yin Zhou

Yin Zhou (4):
  dt-bindings: i3c: Add Realtek RTS490x I3C hub support
  mfd: Add driver for Realtek RTS490x I3C hub
  regulator: rts490x: Add driver for on-die regulators
  i3c: hub: Add Realtek RTS490x I3C hub support

 .../bindings/i3c/realtek,rts490x.yaml         | 266 ++++++
 MAINTAINERS                                   |  11 +
 drivers/i3c/hub/Kconfig                       |  11 +
 drivers/i3c/hub/Makefile                      |   3 +
 drivers/i3c/hub/rts490x-i3c-hub-core.c        | 444 +++++++++
 drivers/i3c/hub/rts490x-i3c-hub-i3c.c         | 150 ++++
 drivers/i3c/hub/rts490x-i3c-hub-smbus.c       | 839 ++++++++++++++++++
 drivers/i3c/hub/rts490x-i3c-hub.h             | 150 ++++
 drivers/mfd/Kconfig                           |  11 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/rts490x-core.c                    | 131 +++
 drivers/regulator/Kconfig                     |   9 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/rts490x-regulator.c         | 284 ++++++
 include/linux/mfd/rts490x.h                   |  53 ++
 15 files changed, 2364 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/realtek,rts490x.yaml
 create mode 100644 drivers/i3c/hub/rts490x-i3c-hub-core.c
 create mode 100644 drivers/i3c/hub/rts490x-i3c-hub-i3c.c
 create mode 100644 drivers/i3c/hub/rts490x-i3c-hub-smbus.c
 create mode 100644 drivers/i3c/hub/rts490x-i3c-hub.h
 create mode 100644 drivers/mfd/rts490x-core.c
 create mode 100644 drivers/regulator/rts490x-regulator.c
 create mode 100644 include/linux/mfd/rts490x.h

-- 
2.34.1

