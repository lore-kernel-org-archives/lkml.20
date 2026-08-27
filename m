Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3605B392C46
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787863197; cv=none; b=sbdbY1RsZWU0WLXDBcJtx9fvAvKIPwj2K8UNU2lR2kdKUjYgLclC6nFgsr2eaNPsxX/0tnztaEtMqZb6CJmU6IV4ANKVHDqBREOeBn9HvwxlStH/La99KqcFHDl7guPLyVdeL7n98LNHO9fDDzFgWMsHkXqE1oD4N+8vEP7iF/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787863197; c=relaxed/simple;
	bh=/vNPwhkmLtCiGk6PhShTSyEnp/kNV/OOoJOfRAtZ5IY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mDun693pjjPPALrHa7ZJmAG4twQuVhHPJ5OHTF+Zu8V0g2f3Nb5VIbPYe75AEjwLUZyhklBkWtkI0HMCE/FHcJXWMnq6gtpa41nQMUAn/WMRU12hGQm6C7g65S1fUMbJFCvXPRO6ThYe2oIzCwlmMAvwcAEbW5d3uWSSX5fBdhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dLizQTPv; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dLizQTPv"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-480001972b8so144245f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787863187; x=1788467987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/vNPwhkmLtCiGk6PhShTSyEnp/kNV/OOoJOfRAtZ5IY=;
        b=dLizQTPvZ4KhTWe+uxt4RgwP8RN7sKAbOihi7TyB5EVQFRpGcri5kkS/JFzumEbXCQ
         NIQgXVaI4zW/KrV84TfGs2af1THBt+YXG8aA43WyFlnzPveVbd30q3HpERflxo2GpcdT
         KQIK/I0ePYbTJos5HW7zvfK/BOk0g6vpjS3bapI+szQpkcPrHSG0cOFco2t6V4naWQKn
         ZngIITy3SmGws0le4nHJKwGbmkWHCOSggT7BYD4p/o9YdA+coQj3UI55iIiQcsNpyhSW
         SWq6D+kYLvA+MpMRE9a28F9F4UgMcVIsE7p+dZYjuZlBINqGCy+Ms6j7T2/o6YkHDZNY
         ZItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787863187; x=1788467987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/vNPwhkmLtCiGk6PhShTSyEnp/kNV/OOoJOfRAtZ5IY=;
        b=DDjXyyiOGbvy6C+Y7FNmr5ryCftOuc+9bWHthNeagSX8mQ5deatjHULUaVhtj7BucW
         S5T6+9YU//HCU6wbFxlXVawXUIyxOObTwiKFBVeSiwMnq8pm1czba60QOD66rg5za5a9
         nuL4U6eQIoOLy7l8Fm+ZgPQ4bPYkIDhNp/jObY2sqMaWLloLdmAbD3+pXHbTciSdZvon
         fL8cxgNKTUqFYCIhhuGW3zo9exCNWHrk2ZmWDqAG3KaX5y/7nP758I9waqSmmKPcfeOj
         BouIwlPsorO/P44g7lDM2iTjQ60RRZIBbMO+MBuFTzq7zZzOa8UARguwTSxL38WlkZyh
         xZuQ==
X-Forwarded-Encrypted: i=1; AHgh+RpEm6xUl8mUq5BJAfdrCBHXMgEZWgkMG7jbMT7RBoFXbpNwChPpUrZBjpqcifPkVyoReYKgSICVwNsnP/4=@vger.kernel.org
X-Gm-Message-State: AFuF++ni+T26vhOXZgNs/eIzebX2gg4MyLwo/TpYoEHwm8W2vki+nuix
	WE2X/abpQz2afuK8NoeB4vMCdEznDZs9nedsnGNg3w9AMI5jBIk9ZR9aeYyt/Gv6
X-Gm-Gg: AR+sD11dju/k0MtcRm42/8GZ2BaULEcB8ciMixNlkRk8A7kdblmE2+tZCtkFtuDg1Xm
	55Li9t1w36QkQjOBWEeudRFo6O/bZDtN6vveoIoDtWnhq0zI//MMTCxwkhL2xvO/eZCrz/ktkEf
	EQT/gmPjTY39knJiMV0KV7t6f4DpW3tpAtGRqzzOI/nLTa5fO2/WuhT7rk79Xt6uwNMzNcQe5C2
	VJ2xJZQjedKj47o/njIqbNrJ0Y9GtccK9VyYdBExz1OLDWGQCjhu89WPsMdXxbdN3eDGs5b9Caw
	9pxLIy0IuPc+0Xw2N77lKVoBxqogsQRdBNkLxYS/eCMoIlg9ntop7TQLt6RBtSDfU5sNwZf0UTe
	IKDlszEARVkenpS2QVPNGVm9QJu/Wxtz7ANiiJXTGcgKq+2+qTkxsc8tOuFjL8+k75jPuJZWZRc
	u5sw/9iY2ibRQNIQUw0XQitsTjmD8tmWezAveWgiaIpHxuwfOJ1FBmtOIqHm0=
X-Received: by 2002:a05:6000:24c6:b0:47f:4919:d5b2 with SMTP id ffacd0b85a97d-482f79870bemr1673162f8f.1.1787863186967;
        Thu, 27 Aug 2026 13:39:46 -0700 (PDT)
Received: from m2.. ([37.142.156.156])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-482e28dc10asm12012065f8f.19.2026.08.27.13.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 13:39:46 -0700 (PDT)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: linusw@kernel.org
Cc: jikos@kernel.org,
	bentiss@kernel.org,
	brgl@kernel.org,
	germain.hebert@ca.abb.com,
	rio@r26.me,
	brunoceg1@gmail.com,
	contact@christina-quast.de,
	linux-input@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/13] HID: ft260: add GPIO support on top of UART
Date: Thu, 27 Aug 2026 23:39:33 +0300
Message-ID: <20260827203933.16726-1-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAD++jLm3ZK-=AYCVJHMt=x3_G26CsXZhOVj4E7na1e9JK0busg@mail.gmail.com>
References: <CAD++jLm3ZK-=AYCVJHMt=x3_G26CsXZhOVj4E7na1e9JK0busg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 25 Aug 2026 at 09:44 +0200, Linus Walleij wrote:
> It seems this patch title should just be
> "HID: ft260: add GPIO support"
> the "on top of UART" part seems to be more about
> which order you did the patches and that is about
> development process, not technical content, we don't
> put that into Subject.

Will drop that from the subject in v2.

> You probably want:
>
> #include <linus/bits.h>

<linux/bits.h>. I'll switch the pin constants to #define + BIT()
and the group masks to #defines.

> So 6 GPIOs is "max" and then there are extended GPIOs and then there is
> a new max which is 8?
>
> #define FT260_BASE_GPIOS 6
> #define FT260_EXTENDED_GPIOS 8

Agreed, the names are misleading. FT260_GPIO_MAX and
FT260_GPIO_EX_MAX are counts of the two GPIO groups the chip
exposes, not bit indices: 6 pins named GPIO0-5 and 8 named
GPIOA-H. v2 will use FT260_BASE_GPIOS and FT260_EXTENDED_GPIOS.

One distinction worth making, since it explains the bit numbers
you suggested. The GPIO report (0xB0) carries the two groups
in separate bytes: GPIO0-5 values and directions in bits 0-5 of
one byte pair, GPIOA-H values and directions in bits 0-7 of the
next pair. So in the report GPIOA is bit 0.

The FT260_GPIO_* masks are not report bits. They are the
gpiochip offset space, where the two groups are concatenated
into one 14-line chip: GPIO0-5 at offsets 0-5, GPIOA-H at
offsets 6-13. There GPIOA is BIT(6) and GPIOB is BIT(7), so
I'll write them as explicit BIT() with the group named:

#define FT260_GPIO_EXT_A BIT(6)
#define FT260_GPIO_EXT_B BIT(7)

> What about just:
>
> #define FT260_GPIO_MASK GENMASK(FT260_GPIO_TOTAL, 0)

Yes, that mask is over the 14 gpiochip offsets, and GENMASK is
clearer than the shift. It needs to stop at the top offset:

#define FT260_GPIO_MASK GENMASK(FT260_GPIO_TOTAL - 1, 0)

which is the 0x3fff the current expression produces.
GENMASK(FT260_GPIO_TOTAL, 0) would add bit 14.

> Is this *really* an enum? I feel an enum should be something like
> consecutive or sparse integer ranges.
> What about just using #define for those.
>
> Use #defines for all of this as well.

Will do.

> So instead of creating your own cache of all registers,
> have you considered just using regmap for this?
> Regmap is essentially a register cache.

There is no register space for regmap to model. 0xB0
is one 4-byte feature report, a value byte and a direction byte
per GPIO group, reached with hid_hw_raw_request(). The mux that
decides which of those bits are GPIO at all is in a different
report, 0xA1, with an unrelated layout.

> This looks like names you could have already assigned
> in the UART patch and then the diff would be less noisy.

v2 will put the UART_ infix in the serial patch, as in my
other mail.

> Linux has bitmap manipulation functions in
> <linus/bitmap.h>, use these instead of reinventing the wheel.

gpio_en is "GPIO enabled": a mask of which of the 14 lines are
muxed to GPIO at all, derived from chip_mode and uart_mode, not
pin state. The setters only OR and mask it, and the only readers
test one line before touching the pin. That is a u16 flag word,
and the bitmap helpers work on unsigned long arrays, so I'd keep
the u16 and use BIT(offset) in those tests instead of 1 << offset.
I can convert it to DECLARE_BITMAP() if you prefer.

Thanks,
Michael
