Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602434;
	b=cOqmuBcQLObCfNONREtUmQXANyrB7VrGvg/COHCzqJeIfkZRk/E1d9H0KgncTVo+SSWs
	 s2CCBOes3E67eLZN7e1HFskofBpLvNeO16/SdZsn1oq6NJrfouv/eb7d8sPkQB9P4nNQ0
	 kIzBgKjwRpUBlqCaoxuMEo/DBk+7Xgt9GXmDHWHqnaoEsUPC6dAxXekV+12fKKNYboYxa
	 /hfMea54Mys3YctqlicICI1vsq4vGPPCkXD8n+jk6uI+7/PWxeN9RpKQIb+W8C4xLA7ia
	 vkfH3YFy6a9mfCYAyKQCjGRjDudGAaK+93pp4C1Kny8IPUqm4arNjS6tYy/4zMzPG5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602434;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YqOyLeJF1LZn52GyfM0b3GDfTRLm5jSkYKCfEBCotc0=;
	b=GFhrtTLG9dpiz6QUnNrCCR2Z2g0BIdQ0jaUW7U7lJZs6AsMJhLUFYkbtcGupMYm69avn
	 hC7GFN7WoQsXUz+lWkzJP51KkDzZaG6OONPrI7yJIGntCaHvHLOjkdJTwanjDQ9ahXI9B
	 oldj+BR9pDVMXaK6f0QB5GJ6Qpnjd1OQVlIJB1oiWLjwnnVLmpj4LLBYYTr7Sb6nzSRmP
	 z8+SbLw03NU0EYCdCBO3PqAbUWILlRd/iZyRWHk0SntYt9zTQLU305mQodJaF1cJQ/D8O
	 PeWCyXngCiHgviyNyFoQw7JpTNhu11npr0YthNl+GoXWlCLvwk/obFBZc7j43Kyljfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gompa.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D00606A885
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:40:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2D00606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-86103aaac12so2014028a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:40:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602433; x=1795207233;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YqOyLeJF1LZn52GyfM0b3GDfTRLm5jSkYKCfEBCotc0=;
        b=BxWZM4z79YPKgQHHNXCVqCL9vFiK8HK3VwI4c8UASwRaymKKwvDgVpB5oHZ6d6kPd3
         AkHAYbGZ1V/dXWLQwD3iiu9Gq3XZBnYhAqQFsV1S46/WfIkX/epZTAE6XEMOugDT0aWn
         49JKrWhXYxHdXgsVHHVkT6q2HD51WMWXjl2LQ2qphc49mCQsOW4ZYKqti/dEmIIB8qHM
         g926nur6dIUEoVX1L4GWy9QkCVVfQz+xTYckTlLa4+iMaeWg7x6y99DXB+YLn+6rDh2e
         s7ml7vLxQEoNV3N/RTmlmmhBG2VQRH1tRSn/ZQLv8XOrIoAQt4+atPaG4xWXOAENhiyQ
         i+5A==
X-Forwarded-Encrypted: i=1; AL+hErFIjRhYexFbK9sRT4HBGEB5wkHFJQfh7jGb7O7zwjr8IQBM9fzPL/7DWALrDL4tvsxh/owGrfcQXevNsTI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sVEa8jcbLBUv8beHb16g8sT2UwgBQ3rFQ520oPeDi11I6l3vQ
	hs+4BQEKe4xMAyji0QEImOb3gN+POlXvD+LeMEj+iZTnAU70zOdQg3Z2nknZdVBw
X-Gm-Gg: AYBFou1DfxUsLsT8wcsXcHlsC1z4PO9OxSKNAi63cdfXSj1IeHU6grfFGsBF171RLfE
	0rSm6lklHidg/tyU6exNvN7pT9nNuP+aX7sISO+7NqX/f7pOjCjgkjKN6SpwOTh+OZ4RxCqMwHx
	1ZA5imJihzbLJNuk4FHxXgKw6eGMMIXwit5JfJGFJuWNouhq4w+Irr3L9hQoovnL6P+cqs74SCt
	vA/2S9410lDt1OuMlQNxl2iGl3TLfNzB08MdadEnFieEqISUjU32tiKb7zkC4Y/dS67bjOd5TGK
	MPWPbGLYfPuLX4bM7b7D6Kze+/A4dmrHVWHY3Zp8FggE1qPCBAPLptEpvJ+RN1kta5h8dAluMW2
	rsLlXgOexB00ekOQDhVDYkJEA+ShHjdy4NSRtqkhkqTd2NTDHGNsLMy6vemsoUvGg07yNMfAjg2
	GD2IZ4T1uigVvAfErzGSN69H//XtvqF5L/mQ7rq85CwBKLy3S43tG56nK6M7U5FP7qi3OYyv2S5
	vPZGx6aQnUWa7+7nvdjGaLEt2JCJyvV+Z+/Ejnx/GqzIjIj1y3NPT7YvfY4YwBDuajfuEdMfend
	HZubxPDAzIyvAmzhZ+njqqnfO7uJBG8ZcnPcpZJqV/a1DTQvpeAcjadC9bE2mvbNFMWw3HuEWo6
	5Bz75/xLYXyoofsYDBmy50WgNUtTALara0tX6LSGkzSUVnhZXY96Xi8sm1sw3ssN1l2HLIqESBK
	tZ
X-Received: by 2002:a05:6808:6415:b0:4e7:f052:460c with SMTP id 5614622812f47-56e6582c8e2mr2077025b6e.23.1794602432718;
        Fri, 13 Nov 2026 12:40:32 -0800 (PST)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com. [209.85.210.43])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70d6572csm2979414b6e.15.2026.11.13.12.40.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 12:40:32 -0800 (PST)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-84e513877a3so2130403a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:40:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHycUKiO63zmnwQmLRoyFom+1UDc6JdsP7CSzjdK2+fGpotKNS6xUmSYjJVrKlF316eog9Ud5tKYeuBPBc=@vger.kernel.org
X-Received: by 2002:a05:6830:1cc2:b0:7f9:555:1df0 with SMTP id
 46e09a7af769-86289878845mr2035460a34.12.1794602431926; Fri, 13 Nov 2026
 12:40:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108-b4-apple-mtp-keyboard-v5-0-e2c97b82669a@gmail.com>
In-Reply-To: <20261108-b4-apple-mtp-keyboard-v5-0-e2c97b82669a@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 13 Nov 2026 15:39:55 -0500
X-Gmail-Original-Message-ID: <CAEg-Je9ffh8v9PKn-pRc7DLjD0h9oP64ZB_FR5B0K=YfctJx2w@mail.gmail.com>
X-Gm-Features: AclHuK99xhj_lrjZso--3IknqiDF9swsBuRbZJPQdiHng0qFnjGS4Y8OcMsuew0
Message-ID: <CAEg-Je9ffh8v9PKn-pRc7DLjD0h9oP64ZB_FR5B0K=YfctJx2w@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] Add support for Apple Silicon DockChannel internal keyboards
To: michael.reeves077@gmail.com
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-input@vger.kernel.org, 
	Yureka Lilian <yureka@cyberchaos.dev>, Hector Martin <marcan@marcan.st>, 
	Sasha Finkelstein <k@chaosmail.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 2:25=E2=80=AFAM Michael Reeves via B4 Relay
<devnull+michael.reeves077.gmail.com@kernel.org> wrote:
>
> This series introduces support for the internal keyboards on Apple
> Silicon M2 and M3 MacBook models.
>
> On these platforms, built-in input devices are managed by a dedicated
> coprocessor running an RTKit-based operating system. Communication
> between this coprocessor and the main processor is carried out over a
> low-latency hardware byte FIFO interface called DockChannel.
>
> To support this input path, the series introduces a few new components:
> - An apple-dockchannel mailbox driver to handle the low-level
>   byte-stream FIFO.
> - A DockChannel HID transport driver (apple-hid) that boots the
>   coprocessor using the RTKit framework and encapsulates the HID
>   protocol over the mailbox.
> - Minor additions to the apple-rtkit and hid-apple drivers to support
>   the TraceKit endpoint and integrate the keyboards into the existing
>   input-quirks framework.
> - Devicetree bindings and DTS updates to describe the nodes on M2 and
>   M3 laptops.
>
> The transport driver is based on an original out-of-tree implementation
> by Hector Martin, but it has been significantly rewritten for upstream
> inclusion to use the standard Linux mailbox framework and align better
> with upstream HID design patterns and reduce reliance on hacks.
>
> While the coprocessor manages both the keyboard and the trackpad, this
> series only enables keyboard support. The keyboard can be initialised
> without loading external firmware, whereas the trackpad requires
> firmware. Trackpad support will be submitted in a subsequent series
> once these base transport layers are established.
>
> Tested on: MacBook Air M3 (J613).
>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
>
> Changes in v5:
> - Link to v4: https://lore.kernel.org/all/20260925-apple-mtp-keyboard-fin=
al-v4-0-304c267518f4@gmail.com/
> - Drop ASC mailbox and DART binding patches which were picked up and are =
in apple-soc/dt-7.5
> - Simplify HID transport reg-names from coproc-asc/sram to asc/sram (sugg=
ested by Rob Herring).
> - Replace the empty STM child node with the 'apple,has-stm' boolean prope=
rty (suggested by Rob Herring).
> - Drop the keyboard child node and move 'hid-country-code' to the parent =
node (suggested by Rob Herring).
> - Simplify the transport driver to filter supported interfaces in C and d=
rop fwnode handling.
> - Collect Reviewed-by from Rob Herring on the DockChannel mailbox binding=
.
> - Rebase on v7.4-rc1
>
> Changes in v4:
> - Link to v3: https://lore.kernel.org/all/20260918-apple-mtp-keyboard-fin=
al-v3-0-e356464e454b@gmail.com/
> - Describe the DockChannel interrupt pair in DT (suggested by Yureka Lili=
an).
> - Serialize command transactions and finish STM setup before signalling r=
eady.
> - Keep IRQ flag reads and acknowledgements under the controller lock.
> - Clarify teardown synchronization and use the explicit-bounds HID API.
> - Preserve interface-start errors and allow waiting again for delayed rea=
diness.
> - Simplify FIFO writes, IRQ startup and compatible matching.
> - The command and IRQ changes address Sashiko feedback.
>
> Changes in v3:
> - Link to v2: https://lore.kernel.org/all/20260918-apple-mtp-keyboard-fin=
al-v2-0-a5c685e50b60@gmail.com/
> - Fix failed-probe cleanup and interface publication ordering.
> - Fix report lengths/types and reject replacement descriptors.
> - Terminate serial replies and encode checksums as little endian.
> - Honor HID_QUIRK_IGNORE_SPECIAL_DRIVER.
> - Clarify the DockChannel TX byte register layout.
> - All changes above address Sashiko feedback.
>
> Changes in v2:
> - Link to v1: https://lore.kernel.org/asahi/20260630-apple-mtp-keyboard-f=
inal-v1-0-506d936a1707@gmail.com/
> - Rebase onto latest upstream and add M3 Pro/Max device-tree support.
> - Use an optional STM node to decide whether to wait for device IDs
>   (suggested by Yureka Lilian).
> - Rename bindings to match the t8112 fallback (suggested by Conor Dooley)=
.
> - Fix FIFO MMIO write width (suggested by Yureka Lilian) and run mailbox
>   interrupt handling in the IRQ thread.
> - Remove the duplicate report fixup (suggested by Sasha Finkelstein)
>   and redundant HID dependency (suggested by Julian Braha).
> - Fix teardown and the missing HID stop callback; simplify interface look=
up.
>
> ---
> Michael Reeves (7):
>       dt-bindings: mailbox: apple: Add DockChannel mailbox
>       dt-bindings: input: apple: Add DockChannel HID transport
>       mailbox: apple: Add DockChannel FIFO controller
>       HID: apple: Add support for DockChannel HID keyboards
>       HID: apple: Add DockChannel HID transport driver
>       arm64: dts: apple: Add MTP DockChannel HID nodes
>       arm64: dts: apple: Enable DockChannel HID on M2 and M3 laptops
>
> Sasha Finkelstein (1):
>       soc: apple: rtkit: Add tracekit endpoint
>
>  .../input/apple,t8112-dockchannel-hid.yaml         |   92 ++
>  .../bindings/mailbox/apple,t8112-dockchannel.yaml  |   88 ++
>  MAINTAINERS                                        |    5 +
>  arch/arm64/boot/dts/apple/t602x-die0.dtsi          |   47 +
>  arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi     |   24 +
>  arch/arm64/boot/dts/apple/t6030.dtsi               |   47 +
>  arch/arm64/boot/dts/apple/t6031-die0.dtsi          |   47 +
>  arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi     |   19 +
>  arch/arm64/boot/dts/apple/t8112-j413.dts           |   19 +
>  arch/arm64/boot/dts/apple/t8112-j415.dts           |   19 +
>  arch/arm64/boot/dts/apple/t8112-j493.dts           |   21 +-
>  arch/arm64/boot/dts/apple/t8112.dtsi               |   47 +
>  arch/arm64/boot/dts/apple/t8122-j504.dts           |   22 +
>  arch/arm64/boot/dts/apple/t8122-j613.dts           |   22 +
>  arch/arm64/boot/dts/apple/t8122-j615.dts           |   22 +
>  arch/arm64/boot/dts/apple/t8122.dtsi               |   48 +
>  drivers/hid/Kconfig                                |    2 +
>  drivers/hid/Makefile                               |    2 +
>  drivers/hid/dockchannel/Kconfig                    |   14 +
>  drivers/hid/dockchannel/Makefile                   |    3 +
>  drivers/hid/dockchannel/apple-hid.c                | 1167 ++++++++++++++=
++++++
>  drivers/hid/hid-apple.c                            |  118 +-
>  drivers/mailbox/Kconfig                            |   12 +
>  drivers/mailbox/Makefile                           |    2 +
>  drivers/mailbox/apple-dockchannel.c                |  357 ++++++
>  drivers/soc/apple/rtkit.c                          |    2 +
>  include/linux/hid.h                                |    1 +
>  include/linux/mailbox/apple-dockchannel.h          |   29 +
>  28 files changed, 2251 insertions(+), 47 deletions(-)
> ---
> base-commit: 1d368e025d7c4fe63c8bf68ccb4bc3c9772ab75c
> change-id: 20261108-b4-apple-mtp-keyboard-94f1cf08ef11
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
