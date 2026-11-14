Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794662506;
	b=i+c3H3hiWKI5uzYGNqnxOa9o2tN+8Yic3JXSDvKHLC/9mP5nKdQgGXB2HQhUTN5WMmAx
	 tulTKMe/HmxwY27VeiSm2WWV2THFdKXg577t/7wE59Ig26SEHd74ovxLyhQb2xh583pF4
	 yn688tFkfKst/2xOgaqmQh3kSd05TBelwwrqPXXSjlfAs+gvNfIXDiwRw+t66F2vo1f9R
	 8gfUcqtc6xt5/Onhu26dQWsndGZKqJ7hVr6q70bt2Y8FKZJ9eROC18gDPhJqc33jFS/v3
	 jrBw//hdlRF3nC/63UxGqZCSUzPZJJ3wpcMux9+4lLGxIHV6yYrnyaiyOsj/QG7yrvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794662506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KmDx6U5+aB6NguJULNw+IbB2BgxvC/BPaH6qaeSGzC4=;
	b=rAQn2xx8cNzrJGBdRY3TjmEwcwOLkmGZyGSZ547CagkZ98evrcbVeMYRUcdzrvRmv+1B
	 3AhTKLLD88l1uJRoLFvN/WKUlA9auT4GwBF6amRzdKstLBt2MDewCjQ8w44vVhBJwBA3/
	 QXuMuFEUqbfm91bwDBcX2XUhTNBCz7x5EBNswMaoMhVL078MVAXl8zCBUQRwlrlJsgB1O
	 IRjaqhyn3SglDkYKvrtFtN+3vxXjrdWp7ZoqohXl4x4mnLWdaOfLJoj4Rz2hE8ipY1cfk
	 xrUndqm7qAsQGvTNeC/K8/6sE2YdVTRMqzIGs910IC2DqQXvpiQnR1FsAft+W0XadEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m4EUIhPS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C61606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9C61606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m4EUIhPS
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-677af43eed4so1822174d50.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:21:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794662505; cv=none;
        d=google.com; s=arc-20260327;
        b=jOgiC1450rr3cQtI4Z2FJ5PYzngRkEQfMnGERavEoqC7b3NRb/mEFln501F3RSbw/9
         VMANXeIt1SOwsvPBrF3vLWOXDhrifHuJEzX6V3mfGFyDiYOI7e5y9ID8nat8C8h7XHiy
         Olgpmanvsxgoi0klMcVDMTxYrdqxbJ53XquxGCz+Ct8XPz8GtdYUqmhIBc2F7qqHyLQY
         Qt7ubZIgguuDkjxc+k6KpdsgzgC5QTsUGQcZkIkgqOHC6mUYO4arDG8lXzAgQJEp5UmE
         bV9tcf5X5+9cHWfASpkS7THlAY1umzt/UrLdCWF1+2t7bN6aoTaGp5iH22+O97bOFWlE
         AsDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KmDx6U5+aB6NguJULNw+IbB2BgxvC/BPaH6qaeSGzC4=;
        fh=9nbqWymC6KVUhFPLmfmqQXf8Ga3oHKN+u/5+2HZwkMg=;
        b=iJElkqEOoqz6TYcRNV4lU84SFTMWpYI6/Hjc7XiGDj+iQTHDC8JZDEaV/5bPA+zP7k
         1ohNsdiFeFtaMoxdJatND0jfpUtgvRyLuMfZpxdK5xguaiqy3mVIK2y6UkYEX6Qm/QNG
         FUVO+sgNj7PS2sHFjmKoVQIFHYjrJ47sGceovqyHdbYeLduqq8c3mdqXi4BJSCewcgPd
         AwTTF72YTsIw6Dv9CissuzHAkV1xWaAh9cE19L/4SJ7gTGmDtRdIBLjQEvgov/bpVVN/
         NcvhbAShvDkIz2I/FYYFwJB9/dzuUojhp6PocnF5gXp4Hu77hNCu12sScRRQZ3GwI1Zt
         Sf2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794662505; x=1795267305; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KmDx6U5+aB6NguJULNw+IbB2BgxvC/BPaH6qaeSGzC4=;
        b=m4EUIhPS2F2RYXGhSEFd0i2Bo9rBJmWIAxqw4FYCpUAzuiqaQ7eIUmHumX9DN3sBJK
         p6qL12xxQTAkAeyGZpoqlCLYx1Bbo3cHkFCxoRg/BYg+gUgsjj9VkwohE7nrpO8LVWHs
         2nAzM+zgtMXlv6wSebZn6YM4RGO5/oeEZlbfwg408toadOJmPR1UgOBKEe+NHKEw1Jk0
         Dh1Sg0DgLyra1z1rzuPDZEqGQN+jE/UspHluIAqmu8QIuIpxt4It3M2Q36w2G9WYBaZh
         yHpDwjiQn8rTY5o/n0dX0t+5NihaTGkBq+sjStgRLxt1RWMkJqun/A3ttEvrj913IjfX
         1pwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794662505; x=1795267305;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KmDx6U5+aB6NguJULNw+IbB2BgxvC/BPaH6qaeSGzC4=;
        b=wQhBM47PRTIo/MkQ6ERb+miCTPTC0K+GFW2fPX3QVrGMseiNh0QptshLu6ZH269+xV
         jaO4xpDo6oUFB6cjXdHOSnGZA+F+k/W3hT/wC6rbTTiiRl1+GlxYxz2UVtQGJAKtlrZJ
         C5puTaJcZAhNUgozv6AjPyKr/9d+7g+ktpX7PQ+5zUhoKYk+5bJ3LQSEWBd5UhfP7SDa
         KeeGUoWNgVhpkFdMZc5vP4QBRL9fXE3vuZZCVgxLCM3O4w+16mMUnhQMRcd93jsmbaqX
         1WKsfRwOu5VHOiFPHvLi2TMMskqCGtWrqSmqcZiTnGFD8BagDgQJyUtbfSkL9Y/pKWYj
         SfrA==
X-Forwarded-Encrypted: i=1; AL+hErGQg1Lgnk1UrTUStg+zN4FzEhi1Fl5GAMXtN+YAOxgEsZU5R7hnXOzD/j8cqLqJJ5XHis9OgpLhuGZ1bLk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QFKnVObj5xAhA3AY9Zn8howg4ScjndONv2sKpVGy6THF1qe+i
	0eFCHKRdVazSj1yHCP9jIC3kTsGXxBkOtpdP3LMnZ9F5xt23a7mOB6xIbqmgAgAGRFpodOXgmPO
	b31qk4jmhaVQYFcnYORmXANvDCVadckQ=
X-Gm-Gg: AYBFou26/MaulMOAHRDkBHicgA1OLI6tA6CkpaDEzKbR4WyT3iu1HtFQv9cBNqGi6Bc
	0sL4BMS8Fuh+S8Lre980Cah+JgCkgf9w4i26+SV46WhmttX5QtzqlDMHPW0DzlDjED7m4yRPQIy
	XWT/J4v8YzWVCPZvO0OhCufDh6xBrH6C61Um4PUpHmvTiYOVAVP4OB44iieXnH8jLeCz9Df/Jrl
	Ou+m3KAx6wahNusPlEXRfu2UTtzZVVqlq6S/VyMp3WnUX8QVYmnuZM11mVCfcgXQ1aFZiU7NEOs
	D7dkBrgTpC2z4m67gXYa8zud4IwUK7aVDjmrjcul2TawDMl2XDzKn4AJBPTd0vFixZUkbDNsnYM
	Swpv+MSz3wll5QKeqAR0zpfLo00YkoNBLZAEAwQ==
X-Received: by 2002:a05:690e:4186:b0:679:9b73:bfaa with SMTP id
 956f58d0204a3-67d896a4118mr3259172d50.35.1794662504580; Sat, 14 Nov 2026
 05:21:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113034213.158390-1-prasanth.padarthi10@gmail.com>
 <20261113034213.158390-2-prasanth.padarthi10@gmail.com> <c6c39058-ebb2-433a-ab0e-5e35f5ccae24@9elements.com>
In-Reply-To: <c6c39058-ebb2-433a-ab0e-5e35f5ccae24@9elements.com>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Sat, 14 Nov 2026 18:51:33 +0530
X-Gm-Features: AclHuK-FBB5fFc4DfRzJ7P3nSgE9AFp8MWyKWEQCRTCQCeEWO5BzkBKMu-5J_dE
Message-ID: <CAMFFDGgowje2Vky0zXJ=2r+jmgp8WbsznPRE6ZNONBVoYx74tg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] nvmem: aspeed: Add read-only AST2600 OTP support
To: Tan Siewert <tan.siewert@9elements.com>
Cc: srini@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au, 
	ryan_chen@aspeedtech.com, billy_tsai@aspeedtech.com, neal_liu@aspeedtech.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tan,

Thank you for the review. I am preparing v2 with these MOdifications:
- Renamed the driver to nvmem-aspeed-otp.c; updated Kconfig, headers,
and attribution comments.
- Used GENMASK(2, 1) and read_poll_timeout() with an initial delay.
- Reused read_pair() for CONF0 and removed its redundant bounds check.
- Moved secure-prefix initialization into probe and registered an NVMEM kee=
pout.
- Simplified word copying using put_unaligned_le32() to preserve byte
order and support unaligned buffers.
- Added scoped mutex locking, devm_mutex_init(), and the probe cleanups.
- Added timeout error logging and clarified the SEC00 completion-flush read=
back.
- Prepared the NVMEM binding update as a separate patch.
I also tested the updated driver on the B650D4U, AST2600 A3, running
Linux 7.4-rc1, base commit 6628e7d4c. The test used the working board
DTB and OpenBMC initramfs, with temporary diagnostics enabled.

The provider registered successfully. A 12-byte read at offsets
8172=E2=80=938183, covering an odd starting word and a pair boundary,
completed successfully and matched the saved vendor-derived reference.

I have requested ASPEED clarification separately on double completion
polling, timeout recovery/value, mode-register initialization, and
SEC54 interpretation. These decisions remain pending; the current 100
ms timeout is an engineering choice.

I will finalize v2 after resolving those points and validating the
code without temporary diagnostics.

Thanks,
Prasanth Kumar Padarthi

On Fri, Nov 13, 2026 at 6:35=E2=80=AFPM Tan Siewert <tan.siewert@9elements.=
com> wrote:
>
> On 11/13/26 4:42 AM, Prasanth Kumar Padarthi wrote:
> > Expose permitted AST2600 OTP data through NVMEM using the existing SBC
> > node. Serialize controller transactions, bound completion polling and
> > reject reads into the configured secure prefix.
>
> This only repeats what the code does. Please explain *why*. Who uses the
> data and which cells?
>
> >
> > Adapt the read sequence from ASPEED's downstream driver, preserving its
> > attribution. Register the driver for ASPEED review and restrict raw OTP
> > access to root.
>
> If you mean the MAINTAINERS hunk, just say so.
>
> >
> > Link: https://github.com/AspeedTech-BMC/linux/blob/769f62b7baa84d699872=
3b0ea60280e380183553/drivers/soc/aspeed/ast2600-otp.c
>
> No DCO Sign-off (neither from you nor Neal). And given that you've used
> the downstream driver as base it'd be cool if you can keep Neal as
> Co-developed-by in (with Neal's agreement).
>
> > ---
> > Tested on ASRock Rack B650D4U, AST2600 A3, OpenBMC Linux 6.18.24:
>
> Please test against the base commit you've used (i.e. 7.4-rc3). Using a
> vendor / OpenBMC tree here is not useful at all.
>
> > - Repeated, paired and cross-pair reads matched.
> > - Four concurrent readers completed 40 matching reads.
> > - Bytes 8172..8183 matched a separate vendor-derived reader.
> > - Synthetic pre-MMIO timeout, failure latching and rebind recovery pass=
ed.
> > Host fault-injection tests passed all 42 polling-timeout cases.
> >
> >   MAINTAINERS                 |   1 +
> >   drivers/nvmem/Kconfig       |  12 ++
> >   drivers/nvmem/Makefile      |   1 +
> >   drivers/nvmem/ast2600-otp.c | 259 +++++++++++++++++++++++++++++++++++=
+
> >   4 files changed, 273 insertions(+)
> >   create mode 100644 drivers/nvmem/ast2600-otp.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 93abbb3..c92ea8e 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2813,6 +2813,7 @@ F:      Documentation/devicetree/bindings/arm/asp=
eed/
> >   F:  arch/arm/boot/dts/aspeed/
> >   F:  arch/arm/mach-aspeed/
> >   F:  arch/arm64/boot/dts/aspeed/
> > +F:   drivers/nvmem/ast2600-otp.c
> >   N:  aspeed
> >
> >   ARM/AXIADO ARCHITECTURE
> > diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> > index d2f5bb2..cdcd071 100644
> > --- a/drivers/nvmem/Kconfig
> > +++ b/drivers/nvmem/Kconfig
> > @@ -164,6 +164,18 @@ config NVMEM_APPLE_SPMI
> >         This driver can also be built as a module. If so, the module
> >         will be called apple-nvmem-spmi.
> >
> > +config NVMEM_ASPEED_AST2600_OTP
> > +     tristate "ASPEED AST2600 OTP support"
> > +     depends on ARCH_ASPEED || COMPILE_TEST
> > +     depends on HAS_IOMEM
> > +     help
> > +       Read-only access to the AST2600 OTP data region. The configured
> > +       secure prefix is not exposed. Fuse programming is not supported=
.
> > +       The controller reads paired 32-bit words through command regist=
ers.
>
> This is implementation-specific and doesn't help whether to enable the
> option. Drop.
>
> > +       Access to raw OTP data is restricted to root.
> > +
> > +       If built as a module, the module will be called ast2600-otp.
> > +
>
> "If unsure, select N"?
>
> >   config NVMEM_BCM_OCOTP
> >       tristate "Broadcom On-Chip OTP Controller support"
> >       depends on ARCH_BCM_IPROC || COMPILE_TEST
> > diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
> > index 5e70bad..9fac69d 100644
> > --- a/drivers/nvmem/Makefile
> > +++ b/drivers/nvmem/Makefile
> > @@ -23,6 +23,7 @@ obj-$(CONFIG_NVMEM_APPLE_EFUSES)    +=3D nvmem-apple-=
efuses.o
> >   nvmem-apple-efuses-y                        :=3D apple-efuses.o
> >   obj-$(CONFIG_NVMEM_APPLE_SPMI)              +=3D apple_nvmem_spmi.o
> >   apple_nvmem_spmi-y                  :=3D apple-spmi-nvmem.o
> > +obj-$(CONFIG_NVMEM_ASPEED_AST2600_OTP)       +=3D ast2600-otp.o
>
> Maybe call the file "nvmem-aspeed-otp" or so? Would be nice if we can
> extend the driver for AST2700 support later on.
>
> >   obj-$(CONFIG_NVMEM_BCM_OCOTP)               +=3D nvmem-bcm-ocotp.o
> >   nvmem-bcm-ocotp-y                   :=3D bcm-ocotp.o
> >   obj-$(CONFIG_NVMEM_BRCM_NVRAM)              +=3D nvmem_brcm_nvram.o
> > diff --git a/drivers/nvmem/ast2600-otp.c b/drivers/nvmem/ast2600-otp.c
> > new file mode 100644
> > index 0000000..94b1225
> > --- /dev/null
> > +++ b/drivers/nvmem/ast2600-otp.c
> > @@ -0,0 +1,259 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) ASPEED Technology Inc.
> > + *
> > + * ASPEED AST2600 OTP Controller driver
> > + * Read sequencing adapted from ASPEED's downstream ast2600-otp driver=
.
>
> This comment feels unnecessary. It's already been said in the commit
> description.
>
> > + */
> > +
> > +#include <linux/align.h>
>
> align could be removed if you use round_down() or word & ~1 maybe?
>
> > +#include <linux/bitfield.h>
> > +#include <linux/delay.h>
> > +#include <linux/io.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/nvmem-provider.h>
> > +#include <linux/of.h>
>
> You don't call any of_ functions. Replace with mod_devicetable.h.
>
> > +#include <linux/platform_device.h>
> > +#include <linux/slab.h>
>
> unused. devm_kzalloc comes through platform_device.h.
>
> > +#include <linux/string.h>
> > +
> > +#define AST2600_OTP_PROTECT_KEY              0x00
> > +#define AST2600_OTP_CMD                      0x04
> > +#define AST2600_OTP_ADDR             0x10
> > +#define AST2600_OTP_STATUS           0x14
>
> The SB Controller driver checks for the OTP_PROTECTED bit. What happens
> if OTP protection is enabled?
>
> > +#define AST2600_OTP_COMPARE_1                0x20
> > +#define AST2600_OTP_COMPARE_2                0x24
> > +
> > +#define AST2600_OTP_CMD_READ         0x23b1e361
> > +#define AST2600_OTP_CMD_WRITE_MODE   0x23b1e362
> > +#define AST2600_OTP_UNLOCK_KEY               0x349fe38a
> > +#define AST2600_OTP_STATUS_DONE              0x6
>
> Describe the bits here. Either two BIT() or GENMASK(2, 1).
>
> > +#define AST2600_OTP_TIMEOUT_US               100000
>
> Where does this come from?
>
> > +
> > +#define AST2600_OTP_DATA_WORDS               0x800
> > +#define AST2600_OTP_SIZE                     (AST2600_OTP_DATA_WORDS *=
 sizeof(u32))
> > +#define AST2600_OTP_CONF0_ADDR               0x800
> > +#define AST2600_OTP_CONF0_SEC_SIZE           GENMASK(21, 16)
> > +#define AST2600_OTP_SEC_SIZE_UNIT            (32 * sizeof(u32))
> > +
> > +struct ast2600_otp {
> > +     void __iomem *base;
> > +     /* Serialize the complete unlock, read and relock sequence. */
> > +     struct mutex lock;
> > +     bool failed;
> > +};
> > +
> > +static int ast2600_otp_wait_complete(struct ast2600_otp *otp)
> > +{
> > +     u32 status;
> > +     int i, ret;
> > +
> > +     /* Allow the command to start before sampling the idle flags. */
> > +     udelay(1);
>
> You could use read_poll_timeout too?
>
> > +
> > +     /* Match the downstream sequence: observe both idle flags twice. =
*/
> > +     for (i =3D 0; i < 2; i++) {
>
> This is not a valid reason. Do you really have to poll twice? Is this an
> erratum? If so, please cite it.
>
> > +             ret =3D readl_poll_timeout(otp->base + AST2600_OTP_STATUS=
,
> > +                                      status,
> > +                                      (status & AST2600_OTP_STATUS_DON=
E) =3D=3D
> > +                                      AST2600_OTP_STATUS_DONE,
> > +                                      1, AST2600_OTP_TIMEOUT_US);
> > +             if (ret) {
> > +                     /* Do not reuse a controller with an outstanding =
command. */
> > +                     otp->failed =3D true;
>
> That'd disable the device on a single timeout. Do we really have to do
> this, or would it be enough to retry on the next access? If you want to
> keep it, then a dev_err() would be good instead of failing it silently.
>
> > +                     return ret;
> > +             }
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int ast2600_otp_prepare_read(struct ast2600_otp *otp)
> > +{
> > +     static const u32 mode_addresses[] =3D { 0x3000, 0x5000, 0x1000 };
> > +     int i, ret;
> > +
> > +     ret =3D ast2600_otp_wait_complete(otp);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /*
> > +      * Restore the macro's default read mode, as in otp_soak(ctx, 0).
> > +      * These writes target volatile mode registers, not OTP fuse cell=
s.
> > +      * No fuse programming command or programming timing is used.
> > +      */
> > +     for (i =3D 0; i < ARRAY_SIZE(mode_addresses); i++) {
> > +             writel(mode_addresses[i], otp->base + AST2600_OTP_ADDR);
> > +             writel(0, otp->base + AST2600_OTP_COMPARE_1);
> > +             writel(AST2600_OTP_CMD_WRITE_MODE, otp->base + AST2600_OT=
P_CMD);
>
> Setting the OTP back to default doesn't need write mode if I understand
> the datasheet correctly.
>
> > +             ret =3D ast2600_otp_wait_complete(otp);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int ast2600_otp_read_pair(struct ast2600_otp *otp,
> > +                              unsigned int aligned_word,
> > +                              u32 *word0, u32 *word1)
> > +{
> > +     int ret;
> > +
> > +     /* The hardware reads two words starting at an even word index. *=
/
> > +     if ((aligned_word & 1) || aligned_word >=3D AST2600_OTP_DATA_WORD=
S)
> > +             return -EINVAL;
>
> You're already passing an aligned index everywhere which makes this code
> redundant. It also blocks the read for CONF0, so please drop this check
> and use read_pair() for CONF0 too.
>
> > +
> > +     writel(aligned_word, otp->base + AST2600_OTP_ADDR);
> > +
> > +     writel(AST2600_OTP_CMD_READ,
> > +            otp->base + AST2600_OTP_CMD);
> > +
> > +     ret =3D ast2600_otp_wait_complete(otp);
> > +     if (ret)
> > +             return ret;
> > +
> > +     *word0 =3D readl(otp->base + AST2600_OTP_COMPARE_1);
> > +     *word1 =3D readl(otp->base + AST2600_OTP_COMPARE_2);
> > +
> > +     return 0;
> > +}
> > +
> > +static int ast2600_otp_read(void *context, unsigned int offset,
> > +                         void *val, size_t bytes)
> > +{
> > +     struct ast2600_otp *otp =3D context;
> > +     u8 *buf =3D val;
> > +     unsigned int word_index;
> > +     unsigned int aligned_word;
> > +     unsigned int secure_size;
> > +     __le32 pair[2];
> > +     u32 conf0;
> > +     u32 word0, word1;
> > +     size_t chunk, skip;
> > +     int ret;
> > +
> > +     if (!bytes)
> > +             return -EINVAL;
>
> OTP could be empty too?
>
> > +
> > +     if (offset % sizeof(u32) || bytes % sizeof(u32))
> > +             return -EINVAL;
> > +
> > +     if (offset >=3D AST2600_OTP_SIZE ||
> > +         bytes > AST2600_OTP_SIZE - offset)
> > +             return -EINVAL;
> > +
> > +     mutex_lock(&otp->lock);
>
> guard(mutex)(&priv->lock); ? Requires <linux/cleanup.h>.
>
> > +
> > +     if (otp->failed) {
> > +             ret =3D -EIO;
> > +             goto out_unlock;
> > +     }
> > +
> > +     writel(AST2600_OTP_UNLOCK_KEY, otp->base + AST2600_OTP_PROTECT_KE=
Y);
> > +
> > +     ret =3D ast2600_otp_prepare_read(otp);
> > +     if (ret)
> > +             goto out_lock;
>
> The secure region size is fixed once programmed. Maybe read it once in
> probe instead of on every access? With nvmem_keepout, this would clean
> up the read path a bit.
>
> > +
> > +     /* Configuration word 0 describes the unreadable secure data pref=
ix. */
> > +     writel(AST2600_OTP_CONF0_ADDR, otp->base + AST2600_OTP_ADDR);
> > +     writel(AST2600_OTP_CMD_READ, otp->base + AST2600_OTP_CMD);
> > +     ret =3D ast2600_otp_wait_complete(otp);
> > +     if (ret)
> > +             goto out_lock;
> > +
> > +     conf0 =3D readl(otp->base + AST2600_OTP_COMPARE_1);
> > +     secure_size =3D FIELD_GET(AST2600_OTP_CONF0_SEC_SIZE, conf0) *
> > +                   AST2600_OTP_SEC_SIZE_UNIT;
>
> You can also keep out the secure region by using nvmem_keepout.
>
> > +     /* Conservatively deny the entire secure prefix, including its he=
ader. */
> > +     if (offset < secure_size) {
> > +             ret =3D -EACCES;
> > +             goto out_lock;
> > +     }
> > +
> > +     while (bytes) {
> > +             word_index =3D offset / sizeof(u32);
> > +             aligned_word =3D ALIGN_DOWN(word_index, 2);
> > +
> > +             ret =3D ast2600_otp_read_pair(otp, aligned_word,
> > +                                         &word0, &word1);
> > +             if (ret)
> > +                     goto out_lock;
> > +
> > +             pair[0] =3D cpu_to_le32(word0);
> > +             pair[1] =3D cpu_to_le32(word1);
> > +             skip =3D (word_index - aligned_word) * sizeof(u32);
> > +             chunk =3D min(bytes, sizeof(pair) - skip);
> > +
> > +             memcpy(buf, (u8 *)pair + skip, chunk);
> > +             buf +=3D chunk;
> > +             offset +=3D chunk;
> > +             bytes -=3D chunk;
>
> NVMEM already returns the data in the correct order if I see this right.
> You can store the readl() results directly into a u32*buf var. That'd
> make the pair/skip/chunk code and endianness conversion unnecessary.
>
> > +     }
> > +
> > +     ret =3D 0;
> > +
> > +out_lock:
> > +     writel(0, otp->base + AST2600_OTP_PROTECT_KEY);
> > +     /* Flush the protection write before another reader takes the mut=
ex. */
> > +     readl(otp->base + AST2600_OTP_PROTECT_KEY);
>
> for what are you reading the otp key register here?
>
> > +out_unlock:
> > +     mutex_unlock(&otp->lock);
> > +     return ret;
> > +}
> > +
> > +static int ast2600_otp_probe(struct platform_device *pdev)
> > +{
> > +     struct nvmem_config config =3D {};
> > +     struct nvmem_device *nvmem;
> > +     struct ast2600_otp *otp;
>
> Can we name this priv maybe?
>
> > +
> > +     otp =3D devm_kzalloc(&pdev->dev, sizeof(*otp), GFP_KERNEL);
>
> Maybe assign &pdev->dev as struct device * variable and use that one
> instead?
>
> > +     if (!otp)
> > +             return -ENOMEM;
> > +
> > +     otp->base =3D devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(otp->base))
> > +             return PTR_ERR(otp->base);
> > +
> > +     mutex_init(&otp->lock);
>
> devm_mutex_init?
>
> > +
> > +     config.dev =3D &pdev->dev;
>
> Same here with the var.
>
> > +     config.name =3D "ast2600-otp";
> > +     config.id =3D NVMEM_DEVID_AUTO;
> > +     config.owner =3D THIS_MODULE;
> > +     config.type =3D NVMEM_TYPE_OTP;
> > +     config.read_only =3D true;
> > +     config.root_only =3D true;
> > +     config.word_size =3D sizeof(u32);
> > +     config.stride =3D sizeof(u32);
> > +     config.size =3D AST2600_OTP_SIZE;
> > +     config.reg_read =3D ast2600_otp_read;
>
> These can already be set in the config struct before.
>
> > +     config.priv =3D otp;
> > +
> > +     nvmem =3D devm_nvmem_register(&pdev->dev, &config);
>
> And here.
>
> > +     return PTR_ERR_OR_ZERO(nvmem);
> > +}
> > +
> > +static const struct of_device_id ast2600_otp_of_match[] =3D {
> > +     { .compatible =3D "aspeed,ast2600-sbc" },
>
> The SB Controller driver has "additionalProperties: false" set and
> doesn't allow nvmem properties.
>
> Please add "$ref: /schemas/nvmem/nvmem.yaml#" and
> "unevaluatedProperties: false" as a separate patch.
>
> Tan
>
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, ast2600_otp_of_match);
> > +
> > +static struct platform_driver ast2600_otp_driver =3D {
> > +     .probe =3D ast2600_otp_probe,
> > +     .driver =3D {
> > +             .name =3D "ast2600-otp",
> > +             .of_match_table =3D ast2600_otp_of_match,
> > +     },
> > +};
> > +module_platform_driver(ast2600_otp_driver);
> > +
> > +MODULE_AUTHOR("Neal Liu <neal_liu@aspeedtech.com>");
> > +MODULE_AUTHOR("Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>=
");
> > +MODULE_DESCRIPTION("ASPEED AST2600 read-only OTP NVMEM driver");
> > +MODULE_LICENSE("GPL");
> > base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
>
