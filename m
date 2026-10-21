Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792564321;
	b=BiAipxRYdMsue5VnWbDyDaVtdKDeTBQFJIGHjh7ycjEO4hJvJfORYvrF+zK/9cCyxYDr
	 bX9jvZe4Wj6WQHFrLj+SigVh8NGbbCcvPjMstJCnopoC7psl8xngd0gLmCRn4f6S7stCC
	 u+iHJxlcgRDtcrrwg8WLZMbxMljvNJ4ua2nCu6pQAa0eY+pMhjOUGeARGnZwlx9Rmxv1o
	 AKfrPHJbhOtLkyqCFUN5nF14sOXcYRra+4pyzAG9oAo6Au5XbE+Kiv9MsJkh/+VhFWHGz
	 50LUT+gXdGqyz1gHbXHpjZte1rREQJ/BeKoMwu1sD1oqAruYsBEyl8S600TdU5KuLjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792564321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pBVO2WGNEDxlxaqbKxDIfwB41AhhM0dka0vUsjW37nQ=;
	b=pfw+2dkJUMRq7e1y/k6vxvRyXK3f7QamPP3FglbcK8tr9NwVn8LhfEz0rWhUk9EDraFn
	 U291/k9rW07Eufzf8i+ziiDvOs9vww/ie8OOi1iJXardX9AzePxZcMT+ZxlDh/eJMixgp
	 qjFNgxYOj/Y3LbWlgtlUEzLKGwBBElZNr/jRusiZxTTtBDdVtHSbF+v2P14V0kUX9TII8
	 m2SLSWijXz7RDnFcd/L+JhP9RU2CqwvhHFghkin+6jtTIrruoWrFOPDKmUySsV1YE9btk
	 vs1PeuC/ohj9xHUER9+Q340iWAWNq2HFgjF26+/L3oAOkSZbXlTJ4S1vBcrUE9Q4eng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NDb27SfH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F53606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:32:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33F53606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NDb27SfH
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3550c917fd3so444496eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:32:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792564320; cv=none;
        d=google.com; s=arc-20260327;
        b=MzMighuOffATBc8A1rUTYJBxbnz1zUCuoNyp4c+jMVtgXFNDpQGA4xTArHajjO+17k
         7B4TzfBkFjU2nubPuLY4Xb4XGTf2jpjE/NC3f4i7vkhvQ0n9jdLPOOWq1u50dA2WQYt0
         PhyOUNIXh8SccIKX8mykylsNmLLcZVUwlSwrN7yFeYpQMKunPPysYzOoXx/k6b3qd9Bs
         qthKzIVGNPY7vg3c+FdaQ+EI7wRS4xB14UOo8bG3TaM3ZbEJUBC1cAVzDWA0ho7YM0y+
         InWVopeerYh0Q36CsViLX2PJUClvJxs9TLzFfnpu+pNfmB3/s6AIMZCKyTvLD01tK4z2
         QnWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pBVO2WGNEDxlxaqbKxDIfwB41AhhM0dka0vUsjW37nQ=;
        fh=nbl8+LfBNBNBjTLe6iPJL/c65HprBJ1JtIiTYx7rqJE=;
        b=lRcpxUuOu1ETNY27IQrpAgTFZ0jB6megZydqgyfvD5nN0X0AGV7ybi41SZDsSB3mW6
         tk1fi8mQEf3BEmsPazWkGiPHfoy8Wg5jdfyBWBJcqCO17X7QGFYEeMH9NhXeGpELol3p
         qHTm6S8cXsDHPEaVXl8EYOudt8cNgLiF9KlvcrJbf20Mzg5vNwTr94lcKItCmk99J+0Y
         LD7EFYxSDtLz5eTovIcqUuj9EVpLOP4SE+4L0Q2hIDIIqsIobPvtgf+lzwbT5ZJ+daL8
         N2TEyuYnzYE99+aoexceJxbf5atykYFroEkCvnDxWrw7VK4DS/z2GHmIqxPEoJiZYP9A
         I2MA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792564320; x=1793169120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pBVO2WGNEDxlxaqbKxDIfwB41AhhM0dka0vUsjW37nQ=;
        b=NDb27SfH0BlRaZpuZ8mtyCao8o1bV0M0rFx69HpK3CeifH54l/f+vPHYCab4u0FKvz
         /TP7DdpyvoUAcGkCRde2el/wk/opkc7A1Rpl6aTc891wW1se96gBRqO+uentHKdIEcQ+
         iPOLVVXX3DRijj9QwnPZ7+SOmCnLyV56jaJDEUpn3zTOR1Pvr/6jJ8AzImmA7Db65JWT
         OSISPTr36QZxIczLfSM6Ui5Qx7+VK108R+mATAbj7Snmz1WB0Ln3cs0SHt0H18E4fxnV
         hox71g2lyrY/h6bAbNi/lxzon25ChAJDj+b7OFeO1LtNuKqq8CIqO9+/RAf+qLOCKlqp
         9JCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792564320; x=1793169120;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pBVO2WGNEDxlxaqbKxDIfwB41AhhM0dka0vUsjW37nQ=;
        b=m/f5kN/yuGaYjyC18SCoVvoRU9EbXWEnT+Fh54G7KgMSnKbveyc2hc/6AQlHV8mvnH
         DhuK/YXVz1/FgektdAMOakT6tS53sJrA5LfAHUO8WqW41kcl8pGHt2PSVuJ53NnUbI96
         tQ5M21/oK1aHyBTrWGRPONN5NRia+E3UORwt11AWUz8t0b6sSSM5Z5JE0r20e17706J5
         cLImFBIuFAdZTu2ghwD65UJqUhABpYguKMq6zhf2jaSBYliN51LaaxysojnUcNvBBtkD
         sWrVqtBgYdnkHvg16MwXuJm9/EP1FCX3iYU1ZZ24XFYSp8RePAUozYkH33uICYIT2Keb
         gO/w==
X-Forwarded-Encrypted: i=1; AKwUvBxKKB9ywP62TPdzEnMA2/BQOqmWwayfNsV5dc8FojkGxhAdnZ3TLHTb1elqNpAZTVHdsFikIE/BKNmL9go=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyXDI0cZw6GaA3ha5NYKKfFNnCnn6qM9oMXIZgwMk8SgbnXgK6
	k3B0FRk+av+ebymzfIsJewvJV7RvG5F6tnes5EizuGGJYyVS16K4tqwY/MDBridm2IyTFC6EYsH
	BH/Wj9r+fFEW/8AMHrvP1vlhrwc688Wc=
X-Gm-Gg: AYBFou2GHpVMae92G6htpwG3CpqqCG8HyQT7EhmPJl6az2BNcSlDcyyWR6gmdEXHn+p
	N/kCV9ENvfvY2MFzQrdcA8O00I1CgmCgPiwiV75V0aUvDxtgJ7CLS+jXyZPrd1w5Ic4E2VSknNy
	PZ54qOTg0tFj/CHG3Rvjd65ktCmDVqBbUeZ/uHJmCcLTYL/p9M2ZGIYxvVbcrvvHUvXpOKSZ1rd
	dxKoC7I6aW8l+vt00k9is/r5j6j86/tBD5sewFY0WDnCTHzFDVuw9WvxK43FH3oRpsAL1kK06dp
	HgoFMtJH50w9Bp5Zgh/N2cemf5WY7DZk9sVr/ebnvTAoSW+q9uwUy7bvobCR/6ML6w1Uxe34YmH
	RXFVvk/3obomF/xsXeaOBQAIpU9NipW6KsMH5hpNwA06EglkzBjWConH4pJs8luTZJs6mzA==
X-Received: by 2002:a05:7300:fb83:b0:359:8492:2107 with SMTP id
 5a478bee46e88-3674c43c286mr3040666eec.10.1792564320159; Tue, 20 Oct 2026
 23:32:00 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019100406.103687-1-clamor95@gmail.com>
In-Reply-To: <20261019100406.103687-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 21 Oct 2026 09:31:46 +0300
X-Gm-Features: AclHuK_QwW61N_9Foimi4NgaLY1jJdwADyBjJeIb9hmtc4k1Kv7HNMpLzSeTeY4
Message-ID: <CAPVz0n1z1s9aCLk1OzhuOq6V0p2SYM+cJFEBcSopHzB-fvcr=g@mail.gmail.com>
Subject: Re: [PATCH v12 0/7] mfd: Add support for Asus Transformer embedded controller
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Ion Agorria <ion@agorria.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Florian Krischer <florian.krischer@fkr.dev>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	mfd@lists.linux.dev, linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 19 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:0=
4 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Add support for embedded controller used in Asus Transformers for
> managing power and input functions.
>
> ---
> Changes in v2:
> - converted sysfs debug exports into debugfs
> - added kernel-doc comments for exposed functions
> - fixed minor typos and inconsistencies
>
> Changes in v3:
> - dropped DockRAM commits (both schema and driver)
> - integrated DockRAM functionality directly into the controller driver
> - EC schema moved to embedded controllers folder
> - removed all cell descriptions from the schema
> - removed all compatibles from the cell drivers
> - adjusted naming conventions to better align with the ASUS Transformers
> - defined EC variant sets to provide coverage for all known devices
>
> Changes in v4:
> - grouped known programming models of EC chronologically (both schema
>   and driver)
> - call debugfs init only if CONFIG_DEBUG_FS is enabled
>
> Changes in v5:
> - added asus,tf600t-ec-dock compatible to schema
> - rebased on top of v7.0
> - kzalloc > kzalloc_obj in keys and kbc
>
> Changes in v6:
> - removed asus_ec_handle_smi casting
> - asus_dockram_access_ctl > asus_ec_get_ctl in control_reg_*
> - fixed battery Kconfig description
>
> Changes in v7:
> - added status check of devm_kasprintf where missing
> - devm_asus_ec_register_notifier dropped, added .remove where it was used
> - removed cell_to_ec, asus_dockram_read, asus_dockram_write, asus_ec_* pu=
blic API
>   asus_ec_i2c_command, devm_asus_ec_register_notifier, asus_ec_read, asus=
_ec_write
> - renamed asusec_info > asusec_core
> - ec-kbc: added packed size check
>           ret > error
>           improved key remap logic
> - ec-keys: improve formatting and comments
>            ret > error
>            switched to dev_err_probe
> - ec-leds: reworked to register both leds via loop
> - ec-mfd: adjusted Kconfig description
>           fixed smbus operation sizes
>           fixed saving of EC fw model
>           adjusted IRQ flags
>           converted to use definer for set cell composition
>           added factory mode states enum and handling
>           defined some "magic" values
>           self > client, info > ec, ecreq > ecreq_gpio, priv > ddata
>           asus_ec_chip_data data > asus_ec_chip_info info
>           ec_data > ec_buf, ctl_data > ctl_buf
>           added and improved comments, added structure descriptions
>           asus_ec_magic_debug > asus_ec_susb_on_status
>           removed all dev_dbg and most of dev_info
>           pronts with model, fw behavior, factory and susb state preserve=
d
>           switched to MFD_CELL_* macros
>           removed debugfs
> - ec-battery: swithced to BIT macro
>               lock usage moved to asus_ec_battery_get_value
>               in asus_ec_battery_poll_work fixed possible rescheduling fa=
il
>               in asus_ec_battery_poll_work fixed missing not charging
> - ec-charger: POWER_SUPPLY_PROP_MODEL_NAME set as the first check
>
> Changes in v8:
> - added MODULE_ALIAS
> - renamed DOCKRAM_* to ASUSEC_*
> - ec-keys: input_handler moved into private structure
> - ec-leds: added brightness_get
> - ec-mdf:  fixed i2c_smbus_* return checks ()
>            improved model storing
> - ec-batt: added status check of devm_kasprintf
>
> Changes in v9:
> - fixed i2c_smbus_read_i2c_block_data return check
> - blocking_notifier_chain_register moved before serio registration
> - adjusted get_unaligned_le16 bounds check
> - unsigned long long > u64
> - iterator vars made scoped
> - removed "magic" values from ec-mfd
> - simplified logging, detect split into detect and init
> - improved error logs formatting
> - adjusted handler in media keys to connect strictly to dock keyboard
>
> Changes in v10:
> - ec-kbc: fixed possible out of buffer reads
> - ec-kbc: set notifier_call before blocking_notifier_chain_register
> - ec-keys: dropped input_unregister_device which should be handled by dev=
m_input_allocate_device
>
> Changes in v11:
> - applied changes from Florian Krischer (read_size parameterized and fix =
keyboard response framing)
> - ec-kbc: switch notifier and serio register calls
> - ec-keys: used WRITE_ONCE()/READ_ONCE() for priv->special_key_pressed
>
> Changes in v12:
> - removed unused includes
> - fixed kernel-doc warns
> - added check if dockram client and data are not NULL
> - replaced handler in media keys with Dmitry's implementation
> - calculate battery time props with unsigned value
> ---
>
> Micha=C5=82 Miros=C5=82aw (6):
>   mfd: Add driver for ASUS Transformer embedded controller
>   input: serio: Add driver for ASUS Transformer dock keyboard and
>     touchpad
>   input: keyboard: Add driver for ASUS Transformer dock multimedia keys
>   leds: Add driver for ASUS Transformer LEDs
>   power: supply: Add driver for ASUS Transformer battery
>   power: supply: Add charger driver for Asus Transformers
>
> Svyatoslav Ryhel (1):
>   dt-bindings: embedded-controller: document ASUS Transformer EC
>
>  .../asus,tf201-ec-pad.yaml                    | 119 ++++
>  drivers/input/keyboard/Kconfig                |  10 +
>  drivers/input/keyboard/Makefile               |   1 +
>  .../input/keyboard/asus-transformer-ec-keys.c | 212 +++++++
>  drivers/input/serio/Kconfig                   |  15 +
>  drivers/input/serio/Makefile                  |   1 +
>  drivers/input/serio/asus-transformer-ec-kbc.c | 264 ++++++++
>  drivers/leds/Kconfig                          |  11 +
>  drivers/leds/Makefile                         |   1 +
>  drivers/leds/leds-asus-transformer-ec.c       | 125 ++++
>  drivers/mfd/Kconfig                           |  16 +
>  drivers/mfd/Makefile                          |   1 +
>  drivers/mfd/asus-transformer-ec.c             | 569 ++++++++++++++++++
>  drivers/power/supply/Kconfig                  |  22 +
>  drivers/power/supply/Makefile                 |   2 +
>  .../supply/asus-transformer-ec-battery.c      | 289 +++++++++
>  .../supply/asus-transformer-ec-charger.c      | 208 +++++++
>  include/linux/mfd/asus-transformer-ec.h       | 100 +++
>  18 files changed, 1966 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/embedded-controller=
/asus,tf201-ec-pad.yaml
>  create mode 100644 drivers/input/keyboard/asus-transformer-ec-keys.c
>  create mode 100644 drivers/input/serio/asus-transformer-ec-kbc.c
>  create mode 100644 drivers/leds/leds-asus-transformer-ec.c
>  create mode 100644 drivers/mfd/asus-transformer-ec.c
>  create mode 100644 drivers/power/supply/asus-transformer-ec-battery.c
>  create mode 100644 drivers/power/supply/asus-transformer-ec-charger.c
>  create mode 100644 include/linux/mfd/asus-transformer-ec.h
>
> --
> 2.53.0
>

Hello Lee!

May you please pick this series? Dmitry Acked input commits. Regarding
adjustments to input patches, Dmitry is fine if I send them as
followup. Thank you!
