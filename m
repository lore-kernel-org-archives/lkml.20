Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C5C47C0E2
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131345; cv=none; b=B23oeVcExP90ntFJ8gPTpZODdnE6NlEdGb0RKGnEf7fnbK4YuVSGCCxY2P9HsoWXDtfE43RQC2MBaf5MSPhv/CM0jfgdQwqKenlkds1lmqd2uPmFsu8SDEPC28/5BhcLRJQE8w4xrDo9fZKWqL8Po6Y6YeOdVQs0jNckC+wOHjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131345; c=relaxed/simple;
	bh=q5hfUmnX5cI2moI5VNKfCuehyKZytH+0Gd0A3JKIhQ8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uzKQ8U9ZayMpfDNniPM1l6YaqBkYc8cLB8bnatfVfrqtyXHDLLEMkiv6hPlCibf0kI9i2hsfSnajSiA30FzLpSz/2H2JjFyf5BFWI3IjoLP1am6SQFmv4s4RVLQgzhSYRnzaGl91aMSDP/HFWN28o00ZkOWS32RfimIDKy4wrtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=l712AHn6; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="l712AHn6"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351832so442207f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789131328; x=1789736128; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V+ZHt1Hv90ZffrGNuf1k0Rp2yL5IB44JRHsPcN8IeA0=;
        b=l712AHn6ZQlA87zJAL+6vDSvIafCY05BuvIWVrZgNDNMfnK48n9G4OYqhQyzlEW8h9
         eM2PqI1DyXWsSSWBy+BmmEc8JOXmfvM5nqD++IJJXwoybolslwIfs7OhWpT9kPziAQv/
         SsrL2lsOvfB91snEpGIqxPVI21eRRHTfovvY2piaD/O4risdWR2ksl6HUAucATPyZmYL
         8GznCPHvTYeeYlqD+r6W2y2a3CMrDmdqSuRPv863IErlEEwGuxtunmiYnxUJ6RlIPIBD
         R1YY8fGJLDOM4ai+7+kWl+M5U1JFISKTQaKpbIBJdCm75Ky2X6XzK8Ivn5cJ5wIPf7g2
         Gu+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789131328; x=1789736128;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V+ZHt1Hv90ZffrGNuf1k0Rp2yL5IB44JRHsPcN8IeA0=;
        b=Iz35KVDafOTPxXkYMlrNBOgl0h0ertFUgUtbgz9pLkwmC5fWXqSZB346vD8UigVc+c
         fOi+xlCGcEW/6g2UfcTXDG993wptBXB78XWB9aQWKFcjGIJXJC65oN7NwVA3dd7lU5wS
         GaOTHr/EOOgTLYho4ay1DUWEmv6I66sKUhk855Yhsdy0MtYsf/MskhO334ujZeYevIUQ
         FwfzC/6C10wQ1VCtHcAuh1ehA8DojJ53w4q/V1a8IoC8fA1a3fL9Bvyc9MLra52wflqy
         KT5n36gzwGdyPtK/zBIzT2G/TLCGyNaawIxRsxWwzljbFwUjLcSPX3ZvBqUJyjb1B1jL
         bNHA==
X-Forwarded-Encrypted: i=1; AKwUvByN1fxyCBa+j/rGJ+/3FKjdHRemlW+kadiA7cIf7zZPK20YT6Nb+TZ51iWvtlRiF+4UYAF3NwSrYGgyFKU=@vger.kernel.org
X-Gm-Message-State: AFuF++mTD/31docGScCgxcv6Q1l6IqgWYUJOuvfKxVLoiyz15pM/ROLm
	B15oG/THQWoC1cqCQvuhhp1nRl5yT+RQ26svhDQTUq4pKNWZh2IIbjTWD64Xm9r8PBk=
X-Gm-Gg: AYBFou09kOihEC32tleO8j1ZhFwpwpezx2WKYTSdaNyHLJV/N5hHQt/AMcu9n/4R55G
	/4HVB1vy7qMcCWYS0kWKegOO9+Qe8BVzIo7CrMPrIOqntuexYD+RohU3Ra3rT9PMQzAg/QKzuqS
	4hjc5A7Qfakn2qQkF5LfkbG8i2O6M9G5tjOGUo0oKG7/2RbI15hbLO7Cw3DxkEmX9TqlOgPfVD3
	brZKztncYcnTxLjgpmdHYjKBkCsxSfst1icOEKZSYcLJXjjqV6nbBfN4UcB9BeEGFCEmeK8qf6B
	kZtuTt9VrxaYjSAxLDzpDo4EYvbXgMQKMleo/n2aDvVjtOBailDzrU2nC5UYHr5xGTPaJwqJZHt
	cAYpSK0UqIuE340njRngtrKy3wrffYOEsNLZ9NrZyztuxB2SLBNd49bLSRGAxyzu4YkZRo0gFsh
	YdZC2gU8smBtDUuyrnH8Vt9K7NMItFa4Wa9n5Re61xDzLAcGui0ZiKkHwdnx1qeDP2Vkrf0uHeX
	FWbzVM0BySeay4zeG8=
X-Received: by 2002:a05:600c:3ba9:b0:49c:fa21:e73e with SMTP id 5b1f17b1804b1-49e619c0558mr56438145e9.20.1789131327727;
        Fri, 11 Sep 2026 05:55:27 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a34cacsm41600045e9.0.2026.09.11.05.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 05:55:27 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Long Zhao via B4 Relay
 <devnull+longzhao.ambarella.com@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: Long Zhao <longzhao@ambarella.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Ilpo =?utf-8?Q?J=C3=A4rvi?=
 =?utf-8?Q?nen?=
 <ilpo.jarvinen@linux.intel.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao
 <zl020895@163.com>, Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 00/13] Ambarella CV75 SoC minimal bring-up
In-Reply-To: <46d21889-6b52-4c09-8f77-7c08dba93777@kernel.org>
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com>
 <1jwlt1ld6c.fsf@starbuckisacylon.baylibre.com>
 <46d21889-6b52-4c09-8f77-7c08dba93777@kernel.org>
Date: Fri, 11 Sep 2026 14:55:25 +0200
Message-ID: <1jld986j7m.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On ven. 04 sept. 2026 at 08:56, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 04/09/2026 08:54, Jerome Brunet wrote:
>> On ven. 04 sept. 2026 at 14:38, Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org> wrote:
>>>
>>>  .../devicetree/bindings/arm/ambarella.yaml         |  24 +
>>>  .../bindings/clock/ambarella,cv75-rct.yaml         |  64 ++
>>>  .../devicetree/bindings/gpio/pl061-gpio.yaml       |  32 +-
>>>  Documentation/devicetree/bindings/mfd/syscon.yaml  |   1 +
>>>  .../bindings/pinctrl/ambarella,cv75-pinctrl.yaml   | 239 +++++++
>>>  .../bindings/serial/snps-dw-apb-uart.yaml          |   1 +
>>>  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
>>>  MAINTAINERS                                        |  14 +
>>>  arch/arm64/Kconfig.platforms                       |   6 +
>>>  arch/arm64/boot/dts/Makefile                       |   1 +
>>>  arch/arm64/boot/dts/ambarella/Makefile             |   3 +
>>>  arch/arm64/boot/dts/ambarella/cv75-evk.dts         |  30 +
>>>  arch/arm64/boot/dts/ambarella/cv75.dtsi            | 177 +++++
>>>  arch/arm64/configs/defconfig                       |   1 +
>>>  drivers/clk/Kconfig                                |   1 +
>>>  drivers/clk/Makefile                               |   1 +
>>>  drivers/clk/ambarella/Kconfig                      |  13 +
>>>  drivers/clk/ambarella/Makefile                     |   6 +
>>>  drivers/clk/ambarella/ccu-cv75.c                   | 296 ++++++++
>>>  drivers/clk/ambarella/ccu_common.c                 |  60 ++
>>>  drivers/clk/ambarella/ccu_common.h                 |  25 +
>>>  drivers/clk/ambarella/ccu_mux_div.c                | 234 +++++++
>>>  drivers/clk/ambarella/ccu_mux_div.h                |  35 +
>>>  drivers/clk/ambarella/ccu_pll.c                    | 421 ++++++++++++
>>>  drivers/clk/ambarella/ccu_pll.h                    |  70 ++
>>>  drivers/gpio/Kconfig                               |   2 +
>>>  drivers/gpio/gpio-pl061.c                          | 342 +++++----
>>>  drivers/gpio/gpio-regmap.c                         |  24 +-
>>>  drivers/pinctrl/Kconfig                            |  15 +
>>>  drivers/pinctrl/Makefile                           |   2 +
>>>  drivers/pinctrl/pinctrl-ambarella-cv75.c           | 561 +++++++++++++++
>>>  drivers/pinctrl/pinctrl-ambarella.c                | 761 +++++++++++++++++++++
>>>  drivers/pinctrl/pinctrl-ambarella.h                |  50 ++
>>>  drivers/tty/serial/8250/8250_dw.c                  |  34 +
>>>  include/dt-bindings/clock/ambarella,cv75-rct.h     |  15 +
>>>  include/linux/amba/bus.h                           |   1 +
>>>  include/linux/gpio/regmap.h                        |  13 +
>>>  37 files changed, 3439 insertions(+), 138 deletions(-)
>> 
>> That is a lot of stuff mixed into a single series that could easily split
>
> Well, not easily, because each split patchset would rely on non-existing
> CONFIG which could trigger warnings.
>
> Contributors follow here the correct and documented process of new SoC
> platform, I don't get why now only this patchset has to be split...

Are you referring to this or something else ?

"""
one patchset containing new arch/foo/Kconfig entry, DTS files, MAINTAINERS file entry and *optionally initial drivers* with their Devicetree bindings
"""

No problem with that, I was merely trying to say that mixing 4 or 5 trees
in a single patchset is pushing it a little and it does not solve the
dependency problem you've mentioned, it just move it.

>
>
> Best regards,
> Krzysztof

-- 
Jerome
