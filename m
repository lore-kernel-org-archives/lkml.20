Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEFA3A7189
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 12:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788611462; cv=none; b=hSBjbyCn6wLrChIJjR961JP35NOWi/A0Fl3x28MNqocoCHzuICGrZQhaJp5GzvcYHx5zBKSCx7sSTmZFhQPlVO7CumwmnJV/0ku/Br1osHdA4hI//jwzYKh66robYKCdtuMzBU6Cl+oP24CZiA9IyV1u8FxkPApGa7MSvawZgXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788611462; c=relaxed/simple;
	bh=rA6wc+qPLzb7owMI5RwYkotdeWFBpZWgHvWsnw7zvxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G4K8KzOVveO8XIWp64ZHKjnldB6c22D0DYOr7Eux2/703+4vrmlvvbg2PMGqsvM1bZXKdV9MNPW0Y8NAWQCxt9Ycxe7pM/V0it9gn2vvcgsCIMBwK2Z/X4+RUBY/BViC3NIcwtjMymrByFrr+2bRxZxYUoibVQrs02Sz2ra38EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihlzsDgJ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihlzsDgJ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-485850cbac3so1231098f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 05:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788611455; x=1789216255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nF28nbshD2BPWEClB77TT3QHqkwal9Tdd0g3hy+SqKw=;
        b=ihlzsDgJ2kyj6zRF3yq43aIsojEhv/cPPQxsXbFb9kP+XMb/KFT5xlitgQqOkym/ck
         B4fHDO2m/Qw2XLYqABMXr+kVSEPm+wE2mLuunWEzFqEPWeAKTx2yC0qVGUXK71SQJ6Wj
         jq4IqOOhe4ExQJF8kf59FDKd3elxPObjBbBSOYQReYXeHxyhGkJYlgu8f7MFUTiH6IYV
         Lx4AgSmjpyxKI3uzuxWxWc1XwQ5fdJEOqIjDXNEQMw/kN3QdR+YTCI0VPlAQl4wOE9lE
         OwIITY8FYHiZ6OgN90UASGt/VU7kYTMb4YdS+E4K4SD28jWwsdx8VfUSa1avQ8/qpdZV
         K7Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788611455; x=1789216255;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nF28nbshD2BPWEClB77TT3QHqkwal9Tdd0g3hy+SqKw=;
        b=PJik/LAiiDQRgh8z9T1ho1KyyqMOPjat7PxA4/+290Ge6qZWORQRo8NnB4/X3VrJZk
         xDNeEXnU6UZ9qDEq1P2/5iw3fqb7BNQe+EgOVS4agHJOthJ2r1YjbX8VlrAOppLg/45f
         SUOuEfTaGWOuNSbrx3/4JWqkBa19sixNpzdVm1fWefcSXGRQlCTujBhiOdjinN0iwk3T
         1ZDAjZdHGE0layTzCRfZf1CpX2jviKmZOYYPN4CjAHnN2iPgytAaXPTzTHRr6iTdpxEp
         +wT79EQPODjmjKFnWrU6WsxPTlCNDRi0ShqQXDaWNvWL7HaAERIA/DX6tBF0jjLc6JVZ
         Rw8g==
X-Forwarded-Encrypted: i=1; AKwUvBwG8JPZ3Ufl7LmEbVyuNsN4gK7EZ9ulWe3QAaKlBkDBMHJEZik01Pxb/JsCusUibv7F4Mr6TgxAbEgvoq0=@vger.kernel.org
X-Gm-Message-State: AFuF++kzB54dKeOYwLFGtylSs4IdmVx5wDBvH/ZaKmPe+W5YxQyh35Yp
	8DOWXNqa9CSkdXC6g+iWPe+Gq06Z4iZVDajOdT0+KdRyuME59noW3tju
X-Gm-Gg: AYBFou1YAyL+XVAKkoGLsP7NPqxb10OpLl/XRpS5fQK4vX0giZOat0XBc05cHmsKgeo
	mw5uTEHF9cxUPCyi9Fb3Q32ttW/NhYpnEj/SNtENwkp5mqrr50R0NuBoIf/xVLbXEBsMbWDn2XQ
	/pl72qSdv/1m6M1rB8S7lnhXb0L7wufqtQjH4XCMgLB59ALWTPX+TkewUrYVj4YPsASJFPx9yso
	Yj6SpNOm0iJU/Dx0iv22n4jrKdbjRVcLJCcVmPJukJ3uJHBpSpKl81QwE8zkOgy+yIKMbB20OoH
	bYlaiUDohtMSxq2yKL0IN26R2wORhIKwLGmYvvu5bTup52B3EVUN1CjRcHjFv4FpFFkgwYPXPh0
	TDRZULSsH4yMIlwBkQSTL9HLbN4JLHk7KHjQM6ofvbRBRSET+IwWTEb2p/02hATfEPTsyH8dY4J
	EZZEDSUIOL1KeASvMOjFHPjIUJtXBoDvLqazvg7n0d/p+auZIkcy7/KXfDApU2iLREHVRET20Fk
	rz7+aVWYbWnGRLf/ITmiwyMzDWqgqL/74C7aRi7lWwBK4RoYmYQ/Wbm
X-Received: by 2002:a05:600c:1d08:b0:49b:96a0:5c00 with SMTP id 5b1f17b1804b1-49cf825168cmr134783585e9.13.1788611455009;
        Sat, 05 Sep 2026 05:30:55 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885be01bsm12862413f8f.31.2026.09.05.05.30.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2026 05:30:54 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <1a21d17b-686a-4efe-9d47-fb8a9e826b39@gmail.com>
Date: Sat, 5 Sep 2026 13:30:50 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] uart-routing: Add common UART routing framework
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Oskar Senft <osk@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 Jani Nikula <jani.nikula@intel.com>, Vitaly Lubart <lubvital@gmail.com>,
 Hanjun Guo <guohanjun@huawei.com>, Andrew Morton
 <akpm@linux-foundation.org>, Alexander Usyskin
 <alexander.usyskin@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Breno Leitao <leitao@debian.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 James Morse <james.morse@arm.com>, Paolo Abeni <pabeni@redhat.com>,
 Stephen Hemminger <stephen@networkplumber.org>,
 Dave Penkler <dpenkler@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Dan Williams <djbw@kernel.org>,
 Mukesh Rathor <mrathor@linux.microsoft.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Alexandra Winter <wintera@linux.ibm.com>,
 Karthikeyan KS <karthiproffesional@gmail.com>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org
References: <20260905102901.126035-1-changhuang.liang@starfivetech.com>
 <20260905102901.126035-2-changhuang.liang@starfivetech.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260905102901.126035-2-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/5/26 11:28, Changhuang Liang wrote:
> Several SoCs contain a serial crossbar, usually called UART routing,
> that lets the RX line of any on-chip UART controller or physical serial
> port be fed from any other endpoint. The Aspeed AST2400/2500/2600 and
> the StarFive JHB100 both have one, and both expose it through the same
> user space interface: one sysfs file per endpoint, listing the routing
> targets with the current one in square brackets.
> 
> The two drivers implementing that interface duplicate the whole sysfs
> plumbing and only really differ in the description of their register
> layout, so factor the common part out into a framework.
> 
> An SoC driver now only describes each mux with a
> struct uart_routing_selector - register offset, bit position, field mask
> and the array of routing target names indexed by the raw field value -
> gathers them in an attribute group and hands the group and a regmap to
> devm_uart_routing_register(). The framework validates the description,
> creates the files and implements the show()/store() handlers.
> 
> The framework keeps its state in a devres node rather than in the device
> drvdata, so drivers stay free to use dev_set_drvdata() for their own
> purposes, and the sysfs files are removed by devres, so drivers do not
> need a remove() callback for them.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  Documentation/driver-api/index.rst        |   1 +
>  Documentation/driver-api/uart-routing.rst | 145 ++++++++++++++++
>  MAINTAINERS                               |   7 +
>  drivers/Kconfig                           |   2 +
>  drivers/Makefile                          |   1 +
>  drivers/uart-routing/Kconfig              |  16 ++
>  drivers/uart-routing/Makefile             |   2 +
>  drivers/uart-routing/uart-routing.c       | 200 ++++++++++++++++++++++
>  drivers/uart-routing/uart-routing.h       |  84 +++++++++
>  9 files changed, 458 insertions(+)
>  create mode 100644 Documentation/driver-api/uart-routing.rst
>  create mode 100644 drivers/uart-routing/Kconfig
>  create mode 100644 drivers/uart-routing/Makefile
>  create mode 100644 drivers/uart-routing/uart-routing.c
>  create mode 100644 drivers/uart-routing/uart-routing.h
> 
> diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
> index 6601a258690f..2a0f375cd206 100644
> --- a/Documentation/driver-api/index.rst
> +++ b/Documentation/driver-api/index.rst
> @@ -146,6 +146,7 @@ Subsystem-specific APIs
>     tee
>     thermal/index
>     tty/index
> +   uart-routing
>     wbrf
>     wmi
>     xilinx/index
> diff --git a/Documentation/driver-api/uart-routing.rst b/Documentation/driver-api/uart-routing.rst
> new file mode 100644
> index 000000000000..67bb84958977
> --- /dev/null
> +++ b/Documentation/driver-api/uart-routing.rst
> @@ -0,0 +1,145 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +======================
> +UART routing framework
> +======================
> +
> +:Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> +
> +Overview
> +========
> +
> +Several SoCs contain a serial crossbar, usually called *UART routing*, that
> +sits between the on-chip UART controllers and the physical serial ports
> +exposed on the package pins. The crossbar lets the RX line of any endpoint be
> +fed from any other endpoint, which makes it possible to, for example, snoop
> +the traffic of a host serial console, or to loop two on-chip UARTs back into
> +each other without any external wiring.
> +
> +Two endpoint families are involved:
> +
> +``uartN``
> +	the RX line of the on-chip UART controller number N.
> +
> +``ioN``
> +	the RX line of the physical serial port number N.
> +
> +The crossbar is programmed through bit fields, one per endpoint, spread over
> +one or more registers. The value written into a field picks the endpoint the
> +RX line is connected to; the meaning of a given value differs from field to
> +field and from SoC to SoC.
> +
> +The framework in ``drivers/uart-routing/`` takes a static description of those
> +fields and turns it into a set of sysfs files, one per endpoint, so that SoC
> +drivers only have to describe their hardware.
> +
> +User space interface
> +====================
> +
> +Every endpoint gets one read/write file in the device directory of the
> +platform driver, named after the endpoint. Reading the file lists all the
> +routing targets the endpoint can be connected to, with the current one
> +enclosed in square brackets::
> +
> +	# cat /sys/bus/platform/drivers/aspeed-uart-routing/*.uart_routing/uart1
> +	[io1] io2 io3 io4 uart2 uart3 uart4 io6
> +
> +Writing one of the listed names to the file changes the routing::
> +
> +	# echo uart2 > /sys/bus/platform/drivers/aspeed-uart-routing/*.uart_routing/uart1
> +
> +Writing a name that is not part of the list fails with ``-EINVAL``.
> +
> +The list is not necessarily the same for every file: it is ordered by the raw
> +value programmed into the hardware, so the first entry is the target selected
> +when the field reads back as 0. Some SoCs define fields that are wider than
> +the number of documented targets. When such a field holds a value with no
> +name attached, the read appends ``[unknown(N)]`` to the list instead of
> +bracketing one of the names.
> +
> +Fields whose name is ``reserved`` are placeholders for values the hardware
> +does not implement. They are listed so that the position of the following
> +names stays correct, and writing ``reserved`` programs a value that has no
> +defined behaviour, so do not do that.
> +
> +The exact set of files of a given SoC, together with the routing targets each
> +of them accepts, is described in the corresponding
> +``Documentation/ABI/testing/sysfs-driver-*-uart-routing`` file.
> +
> +Writing a driver
> +================
> +
> +An SoC driver describes each mux with a ``struct uart_routing_selector``,
> +defined with the ``UART_ROUTING_SELECTOR()`` helper::
> +
> +	static const char *const foo_uart1_options[] = {
> +		"io1", "io2", "io3", "io4", "uart2", "uart3", NULL,
> +	};
> +	UART_ROUTING_SELECTOR(foo_uart1_sel, uart1, FOO_MUX_REG, 16, 0x7,
> +			      foo_uart1_options);
> +
> +The arguments are, in order, the name of the variable to define, the name of
> +the sysfs file, the offset of the register holding the field, the position of
> +the least significant bit of the field, the field mask and the array of
> +routing targets.
> +
> +The mask is given in field coordinates, that is, it is *not* shifted by the
> +bit position: a three bit field is always described as ``0x7``, whatever its
> +position in the register is.
> +
> +The array of routing targets is indexed by the raw field value, so
> +``options[n]`` is the name of the target selected when the field holds n. It
> +has to be NULL terminated, and it may be shared between several selectors
> +that happen to have the same target order.
> +
> +The selectors are then gathered in an attribute group::
> +
> +	static struct attribute *foo_uart_routing_attrs[] = {
> +		UART_ROUTING_SELECTOR_ATTR(foo_uart1_sel),
> +		/* ... */
> +		NULL,
> +	};
> +
> +	static const struct attribute_group foo_uart_routing_attr_group = {
> +		.attrs = foo_uart_routing_attrs,
> +	};
> +
> +and handed over, along with a regmap covering the selector registers, in
> +probe()::
> +
> +	static int foo_uart_routing_probe(struct platform_device *pdev)
> +	{
> +		struct device *dev = &pdev->dev;
> +		struct regmap *regmap;
> +
> +		regmap = /* ... */;
> +
> +		return devm_uart_routing_register(dev, regmap,
> +						  &foo_uart_routing_attr_group);
> +	}
> +
> +The framework validates the description at registration time and rejects
> +selectors whose target list cannot fit in the field, or whose field does not
> +fit in a 32 bit register.
> +
> +The sysfs files are created and removed by devres, so a driver does not need
> +a remove() callback for them. The framework keeps its own state in a devres
> +node rather than in the device drvdata, so drivers are free to use
> +``dev_set_drvdata()`` for their own purposes.
> +
> +Locking
> +=======
> +
> +The framework does not serialise accesses itself. The read-modify-write of a
> +selector field is done with ``regmap_update_bits()``, so concurrent writes to
> +two endpoints sharing a register are made safe by the regmap lock. Reading a
> +file always reports the current hardware state, which may have been changed
> +by another writer in between.
> +
> +API reference
> +=============
> +
> +.. kernel-doc:: drivers/uart-routing/uart-routing.h
> +
> +.. kernel-doc:: drivers/uart-routing/uart-routing.c
> +   :export:
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 90919c672d4d..b7fa722755c6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27818,6 +27818,13 @@ F:	drivers/misc/uacce/
>  F:	include/linux/uacce.h
>  F:	include/uapi/misc/uacce/
>  
> +UART ROUTING FRAMEWORK
> +M:	Changhuang Liang <changhuang.liang@starfivetech.com>
> +L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
> +S:	Maintained
> +F:	Documentation/driver-api/uart-routing.rst
> +F:	drivers/uart-routing/
> +
>  UBI FILE SYSTEM (UBIFS)
>  M:	Richard Weinberger <richard@nod.at>
>  R:	Zhihao Cheng <chengzhihao1@huawei.com>
> diff --git a/drivers/Kconfig b/drivers/Kconfig
> index f2bed2ddeb66..cb2b5c3b22b0 100644
> --- a/drivers/Kconfig
> +++ b/drivers/Kconfig
> @@ -251,6 +251,8 @@ source "drivers/hte/Kconfig"
>  
>  source "drivers/cdx/Kconfig"
>  
> +source "drivers/uart-routing/Kconfig"
> +
>  source "drivers/resctrl/Kconfig"
>  
>  endmenu
> diff --git a/drivers/Makefile b/drivers/Makefile
> index 0841ea851847..fe4b11419496 100644
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@ -195,6 +195,7 @@ obj-$(CONFIG_DRM_ACCEL)		+= accel/
>  obj-$(CONFIG_CDX_BUS)		+= cdx/
>  obj-$(CONFIG_DPLL)		+= dpll/
>  obj-y				+= resctrl/
> +obj-$(CONFIG_UART_ROUTING)	+= uart-routing/
>  
>  obj-$(CONFIG_DIBS)		+= dibs/
>  obj-$(CONFIG_S390)		+= s390/
> diff --git a/drivers/uart-routing/Kconfig b/drivers/uart-routing/Kconfig
> new file mode 100644
> index 000000000000..a0c45a7bba47
> --- /dev/null
> +++ b/drivers/uart-routing/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +menu "UART routing drivers"
> +

Configuring the kernel can be an annoying process, and on platforms that
can't use these options, this menu just appears empty, further
complicating menuconfig...

Maybe it makes sense to add a dependency to the menu like this?
'depends on ARCH_ASPEED || ARCH_STARFIVE || COMPILE_TEST'

- Julian Braha

