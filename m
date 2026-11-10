Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285919;
	b=LS23VxcWS32Qx2EXebNPp+T2qF5cC6vvUm7ESbblz/eSH3fI9yu43Ue/gwarf/rHSQu/
	 +9q2W5yaSPtMnk9SY1/os2AtOU7fmqat4zkYqC55Q1Ti+CVXctjadQGwLB8DropUjC9MA
	 ismr3vtbimxuvIPlJuBcMWDoZ2hRBQqNh2RdL6QxeC6snII/zbpaj0dQ8lcg4txOfBa4+
	 ir4pIfqOIeablOezYcELBEZEpBEnvN4XlS0M7lHlpnqbb9oAFZyjsrxA948ErxCEKBaNn
	 hhoFgw6Yr7UsK6MYJk8y8li/nA49ddY9K0kMQj0GxVJyWXRNRAw8M1vEf4l8M6jGzxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4tUkPqh7M9OUjiwIhkhOdeSBfACxoiXile/BDFh7nFQ=;
	b=zhCeqwkb6+ZFBjLKZD67iN+cRD2VbAfzP99VXbNqmkQSU1M3HYNL5E5/OBQJZa+uDqh6
	 TUTp5nF9luc4aYjCKiEqhploFNkCFpFkTByQzUffsmdgIGofZ/bLN6XF5mdi9a6KfwMz4
	 MVpgnu4B94f3GtS33az//7UfrkR9E4Yp3rPyASy1/i3rAxuEKsZuG/YvzMKc2HyZGj0Cd
	 abLdCQWiv/z0W3uRVAIgiJsYwjDHDajZ8UCmFD7diT9f1rVFzTNWie5BrFgg/cXm8hj/N
	 69ke4QjvWcsrSZYdmPzFDdfskpvq9/ptyzHXswlRecT+Epq2Ub4EMhnZSB4ASpEYLbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yqBXmhMY;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CADC606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:45:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CADC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yqBXmhMY
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6d290b10a35so636736eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794285918; x=1794890718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4tUkPqh7M9OUjiwIhkhOdeSBfACxoiXile/BDFh7nFQ=;
        b=yqBXmhMYPBOK3exAqlDiiBCr64Uj9OAXfncsQtZQgSfrPNJuNwK5pxAxgFLtoemd0t
         lEm2zWsN9y3WE9BdYQnTkPI5CrBG4+aUyctuLz2ycqF8nkpV52uV/Dqxn3m6C+pZFcTX
         awaeVaWN+fTFC1Pkfnxp6ShcnFn+ibHX49kmdMA7iKiVvg95cFnnQYs+v/HbqReL4UAO
         vAfFQk/bVib/DobCme4GbS0qvYpjHglAzB8taUDptfzwhr9Fch0JNU2P8AzPwySu8HLW
         iUv9pGYjeFnVp5dWIewDNCUSZ7RBrBFDBKSnM+QlaNDjg3U/bKWgIDtT0ShQVQKMIcKQ
         mHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285918; x=1794890718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4tUkPqh7M9OUjiwIhkhOdeSBfACxoiXile/BDFh7nFQ=;
        b=tWWGc9nN6N/VsMyEqHCgPJIuAYJm/LnYhGxYfeAeIC2LdBYrJq8S6SG+5Q0IN5Pz/Q
         PZFxz8x04M/zp/bo1+T8xzGETxEO+ZeWo2kPpJhuWDQ7QyD9IRdmSolSjlWo151oLjfk
         KmpIOHGtPasYRojVYpufTORc6d2PnwL5YbfkWMmrdirbHgRCuCGDHfCEzk30I3zUx+1f
         wBuzMu3hQvqSRNVKXdPrZnwvuycW2YFrmBUOYrvqTMfuZuHkd23cyTgYgGAUiZyUIWyg
         oycLQHjOHQEu2HgJIz8k/iLlWMoVJZV9pwVMwJGoVxHyeQYh9vHDHmkpKzefpIZ0Hn7y
         L/eA==
X-Forwarded-Encrypted: i=1; AL+hErHQ15QuI1PslBLFoZ+WPFetiponex98Gl8jdd9ueaYEUYNFYr7ejpDU9ziXPP7BAwzna0U5T8yiS+JG/b8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iEa7xWQ+EKopVDbLcVXX4UvlMtwd8vmnbsm9BUSDgFB0kvhSy
	5wtAEzdUNg7kQ/G3C80+KQj1ahCaX57xWYaYk5kFz3jEgPCuo9YrONhBEhvNQisV
X-Gm-Gg: AYBFou28DSTZcUHdpwGfSjantd6GxEzn9Rxcn7YHx5sImgGGU6mkoVNdp7ezT1spUFS
	Ai9uePJjJVGMHNXqOakm3nFq8eBAlJWFM6xOcKOplpZpfzU0WxcaBVNJqpsqvXk9rJjINE9rg8o
	uLtTQwhAZq35xs6E1v0uDfBh9LOC6+BDEpX0gd9QAn75Ao6pP0XFRyHzDz2eQ9+6LkGVQyL+YzB
	XPKdzSVK474V1KnRCYO4TojAa4NSA+nUatjKLofgfdQwazKhzevFsxnmBFsOluorc5fzaiQlJZ3
	sbFwFynKPsHHev8Z17Ml17wgp0T7DLcg0HlQ8XmM6xt7Bdm92AAsrZW3X3bUALnL0aLUurK92Ta
	yaDBEauKnZihTktskembmjTpRFVErZ0N5c/bs22iU8Z77/AF65Nu2LkVYYCr5neTSQPKHo3VTo9
	6JRo5TDBLo6SEWWXgkRESNfE2kNk2i27nrWd6LxcedFVc5t+cbalp2dYde5YnWqB92UJns7kpdJ
	c5PUIEJdJPerAtyhljBNnLFuGgPdKvzu0T1lVvaGA4jtNHzw8ceA2YIwC8pcKHTVkSmChGPua+m
	M4p9nFQdcSLSm6Qi0Y7uWqLDqbwNDIv1Y09I5cW1S3ImvynDOBIJvEhq2sB96EyBW3w/ordSQha
	1wpGNbA==
X-Received: by 2002:a05:6820:c453:10b0:6ca:8e07:15 with SMTP id 006d021491bc7-718a197a67cmr482559eaf.7.1794285918159;
        Mon, 09 Nov 2026 20:45:18 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae23095c5csm876306fac.16.2026.11.09.20.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:45:17 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: [PATCH v3 0/3] arm64: dts: allwinner: add A733/Cubie A7S support
Date: Mon,  9 Nov 2026 23:45:15 -0500
Message-ID: <cover.1794227241.git.enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
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

This series adds the initial Allwinner A733 and Radxa Cubie A7S device
trees, enabling UART0, the AXP318W PMIC and the 3.3 V microSD path.

Base: v7.4-rc1 (6628e7d4c6b25c8d18f1345e3a20d21829aae7e4).
Previous posting (v2):
https://lore.kernel.org/r/20261031020640-263f7b05-a7s-dt-v2-0@gmail.com

Changes in v3:
- Defer SMHC3/mmc3 until it has a tested user; omit binding, node and pins.
- Rebase on v7.4-rc1 and list public schema prerequisites.

Dependencies, in application order:
[1] A733 CCU v6:
https://lore.kernel.org/r/20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech
[2] AXP318W PMIC v8:
https://lore.kernel.org/r/20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com
[3] Pinctrl IRQ-bank v3:
https://lore.kernel.org/r/20261025142412.112216-1-pmazzini@gmail.com
[4] A733 8250_dw v2, patches 2-4:
https://lore.kernel.org/r/cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com
[5] Firmware clocks (separate from CCU v6):
https://lore.kernel.org/r/20261031020640-263f7b05-a7s-clock@gmail.com
[6] Pinctrl voltage-mode fix v3:
https://lore.kernel.org/r/20261109-a733-pinctrl-v3@gmail.com

DTB/schema checks need only [1] 1/8, [2] 3/5, [3] 2/3 and [4] 3/4,
applied in that order before this series. Runtime needs the full CCU,
PMIC and IRQ-bank series, [4] patches 2-4, and [5]-[6]. The clock helpers
listed in v2 are already in v7.4-rc1.

Validation: arm/sunxi.yaml schema check, W=2 CHECK_DTBS=y DTB build
and clean git-am reader test passed. The November 4 DT v2 RAM boot
exercised UART0, PMIC and MMC0 reads on Cubie A7S with vendor firmware
and pinctrl v2; v3 removes a disabled controller and unused pin group.

Untested: boot with pinctrl v3, card writes, hotplug, 1.8 V switching,
other UART/I2C and storage instances, RTC alarms, EL2/ITS/MSI, and
physical BLDO2 voltage.

Enzo Adriano (3):
  dt-bindings: arm: sunxi: document Radxa Cubie A7S
  arm64: dts: allwinner: add A733 SoC description
  arm64: dts: allwinner: add Radxa Cubie A7S board

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun60i-a733-cubie-a7s.dts   | 284 +++++++++
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 601 ++++++++++++++++++
 4 files changed, 891 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
