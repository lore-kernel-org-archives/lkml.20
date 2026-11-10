Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794349079;
	b=TegovRSnl8lWhVKCgO1JlrTLFENWofXuNJnK/zsxIUjNIDlb2wLy3JFcir4AVxYu+y0O
	 MwHRqCh2sqsP7mHlJw2VaAWKJUGMXE/rm8D/yaZdsjQceNdDGqh4XxIZYwxIxtYlAGoMm
	 Dqs9E340msMpIADsCZhG4HiE892lZfWnE5CYyJ1o9wC2TDqFRRGDRYwnGSHhJEuWPnO1W
	 wm4/30D9ktRYY5llo4Cv7nqcwbDHdoTzj8vWprhh60yP4TEpvlHOP7atw1HpWOj9hh+Jq
	 M8z7rSyqY9IU6t9Ych7/vx/MTfKPdIf2N13Bu6aI3LPYyUabewKPzNlD/h42/KbFYDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794349079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=02i7i9cjkQ0l1xG/vxLusXLi8Q7kHJn+CyNuXJvACWg=;
	b=W2eKiwVv3jWvd5hhkHTk3wkILP7oo8OOygMKh48wsaHDOiCbsvjE8b+nEMzBuj0ReP49
	 naIIh1XI9ErpP0d181KORohACySeCGzZDbYI9vu8TKj1sxXACvpQ49oT3ZWxrlarfyUBY
	 Zx0Xs1w6veDx8tr57kvmnC8DYwYC3BHAkkuEvcXMt/lL+OtL/8i7WykEFXy8hsK5SvjKl
	 QhfrOk3xpIPY3NTtbqXfK7FJOviJACstLjYaUv4salnKVf62/TMjS6cfGCtM3b7bBwegW
	 K5JNNK5jRH7sF7qyIJ/2y7JL5D+qb0NSa5lwXfxm31/o+V5Hi3of9uQtkg57XAuvcsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BxQyaK2M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA215606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA215606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BxQyaK2M
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c1479a959aso1685692e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:17:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794349077; cv=none;
        d=google.com; s=arc-20260327;
        b=oITx1NmAmbvUfg/I9BJ6QBkMyVi09ktgh+nKpdiErdhIM/kt28g3/pVbhHZzjmtyw6
         k3SzzCJtBVy6knyABXlf5xPSRzy/tlGE9JMfiO6I03qndswheZ5Nwyl+9fC/TYAXWEWw
         jsk6nzfQpA42JjeNSmHyMNQyV0Rzby5ywPP4jBHEf2sh78yF2Ffl/kIRtFOF41xjpJRo
         8wL28h0gUl1OZiCqcjQV/djXxWlS9sZVgRQCr4WyHU8L8OKU8RSdmPjCOJxS/ccK5ZQF
         doiuj92fgNSg74if6vHFjDoC7uTX2Y0e1AcPn8GA8uPrtlxrZRC1oGqIB1YIxgdxalGs
         /BXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=02i7i9cjkQ0l1xG/vxLusXLi8Q7kHJn+CyNuXJvACWg=;
        fh=eXB3jCXx9p7t2POMDb1m6imR67Fyxn/q474eEKpA/xM=;
        b=SY9DCOMQr3lBgkTJAIOZx4xuh+0nbb3XTi5XK6wngmTPa6FnYSG4GCpue9t+d+btbL
         zC/Nqiu+DaCJ83K0SH3yCg3m3Hzi0MGv56ZbyOY+8HFDOhrH6a+PW/xy/wTbYTKs3JcE
         //5IjZekBsDsIk9QrI6W0iZ4HbcuqqKa40NTzjGXoUZgiD/eujUnKH97bpyOoQUvlIDJ
         67sDvU5Y0vIu/Ujapmorj5POMM0PNKO8at2GQW7yE43cSc2RV4vOaeKS/NIiRX+jCsSP
         qmrLc4WXLc0e3JuSvXzgJeE27YaJ8zvcGmAd7M+b9nDHxxJO4XF7O+S7vazo+Jmw8Kw4
         Us0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794349077; x=1794953877; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=02i7i9cjkQ0l1xG/vxLusXLi8Q7kHJn+CyNuXJvACWg=;
        b=BxQyaK2Mn9tSTU/9hvBNh8ybXPMYM/ojoJdIu7M9FAU0h49Xskx1/DXCjezzpXjAN4
         3vKKe/1u+VfKueAsurkA8xktjffOOOm2QrDoT4D7KkByVAmg0D4ybvlY/zht5qvOp0FS
         e4qAPbfhno2O3bXcFgZf4sIrJMSpQRENWpA4Ddj2qbPypyqKGBKPuIOFrb3fsazp3cfL
         ZvNm5QSOWnv6wCmx3/HDP19D/rTRI4Kh7pWjRU+/llRDvIUo+SWjmVFRWfZzBAblTnot
         1Wpfo3aoL6AbvRIEPlISIbb66b37C3mABIIZFTnPpxcO/H2wx4wCFHaprz59m1c/9yh8
         lg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794349077; x=1794953877;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=02i7i9cjkQ0l1xG/vxLusXLi8Q7kHJn+CyNuXJvACWg=;
        b=PBLNirgeY5HkFud306c4JjFwXpWiC4e+ESrEgcjAWYiyVHFYynNAjhq9FOWpAdNEyP
         6g5s9EcG5DR8L0GwPCw4i5Vxt+deUptIrbZXDLVuWtScGxYHCz2uVd+xJfamiXLbAH+v
         iWd/aRANvHS88GG40HGLWxo7GqLidDPHCg2lP/NXicZxbCGJz0uJ/+koYdGb8Y+ei5lS
         C5VLIq1lTI22TSn6leNPhrlLLJgGm1N3XCmLMiPd6uyG2O8gKaWSalUNjSdrwt5XYb7p
         cKhMxQJGsQmU1lAiGXErF86bNOTq7Mkdtj055qh9W2KJq3pFOOG7qHdT4OrkP85NhW9M
         9Slg==
X-Forwarded-Encrypted: i=1; AL+hErGgDvYSbStcWJZdiDUZjiLrWki6pbhD8nWarTEbQ81+Re9Ut8qNzXPgq2xw/NLcjfE3Mgy6YSd+6MjvpYQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+76QBH2GEu9qEAF6rEJwaadkajQ/KOeRFYDD0e9lVaGTLlV0+n
	3q8ZEBNlWd4VLDv+EtOv9f00WJN92+U5dg0W14OnYd7pvQu2OqemaGHnWjGfDc0r8wr8ZNuL3Ub
	wKn4KLuP2daCh4ZdA0WV6ejD4OB4ZtUWldKl7Nns=
X-Gm-Gg: AYBFou3Tx0ZRF6DNIxVA0V3J2O/WPDgmmJAA5bBBB0Plv+g5YPs7VGgBMG8o3ZYxbnc
	Khb4+ByOu9ohU/3WrAO+TrVAsQJgcDF+XSZoeVjSwitjbJBnHqR/SyNfvHOGdOeKS174RRvhtKe
	9VVkhn3lMQZDYVBNzLVNitrb7MC9dzmMmPPa0GymdjxrG9qv3xZyrfejmvAHZ5yfyGcl04vxAji
	CYwjjCtFiAYFydbwRKkSYnN0K3pCRVpZinL1ujHyEYMuVYUVBQuP0rbCqMYcDP0DR3DXwAPVBNV
	+yU9RpiBwoQBU22Ekcav466I8OaKB6FewjDWB1rndXY3mZmWtKwWZMXRE3EUY92mZEbP0SZhrHs
	rOSo06R4B5s5J552q5MyIhZXSapnHz7NIzjg=
X-Received: by 2002:a05:6512:2c90:b0:5bf:ce24:2d20 with SMTP id
 2adb3069b0e04-5c15d6440e1mr116175e87.22.1794349076909; Tue, 10 Nov 2026
 14:17:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-adux1020-measure-fixes-v1-0-fe1ba63f28bc@gmail.com>
 <20261109-adux1020-measure-fixes-v1-1-fe1ba63f28bc@gmail.com>
 <avJcESOPo2nGq5wy@ashevche-desk.local> <CAJsKa+6JDCVLtWsfQ0gJzX185ywWiYA_FwbV52q=N7vzgRYDVA@mail.gmail.com>
 <avLvJK2SmQ5Gs9Xm@ashevche-desk.local>
In-Reply-To: <avLvJK2SmQ5Gs9Xm@ashevche-desk.local>
From: Raffaele Tranfaglia <raffaele.tranfaglia@gmail.com>
Date: Tue, 10 Nov 2026 22:17:44 +0000
X-Gm-Features: AclHuK_k9yIHYnPHS7nM8ZUoKth7wyFrromnKbRWlr2kRkXXPeI5VuvjQxGoL9A
Message-ID: <CAJsKa+6UT2cu3HBrjif_NZ+ZUZM-UaUcKmfhptUAa-cwbJ+VzA@mail.gmail.com>
Subject: Re: [PATCH 1/2] iio: light: adux1020: fix interrupt clear value on
 SMBus-only adapters
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux@analog.com, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Nov 2026 at 10:17, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> Can you give a Kunit test case? Because regmap specifies the val_bits == 16.
> See also [3].

I read your analysis in [3] and I agree with it for the bus it
describes. regmap has two write paths though, selected in
__regmap_init() by what the bus provides [4]:

- a bus with raw .write/.read (regmap_i2c, used when the adapter has
  I2C_FUNC_I2C) goes through _regmap_bus_raw_write(), which uses
  format_val, so regmap_format_16_be() drops everything above 16 bits,
  as you describe;

- a bus with only .reg_write/.reg_read (regmap_smbus_word_swapped, used
  when the adapter only has I2C_FUNC_SMBUS_WORD_DATA) skips the format
  initialization and goes through _regmap_bus_reg_write() [5], which
  passes val to bus->reg_write() unmodified.
  regmap_smbus_word_write_swapped() then returns -EINVAL for
  val > 0xffff [6].

i2c-stub is SMBus only, so adux1020 takes the second path there.

The existing regmap KUnit buses match these two paths (regmap-ram is
reg_write only, regmap-raw-ram is formatted), so I added a test case for
each, writing 0xffffff0f to a regmap with val_bits = 16 and expecting
0xff0f on the bus:

    # raw_write_wider_than_val_bits: pass:10 fail:0 skip:0 total:10
    ok 37 raw_write_wider_than_val_bits

    # write_wider_than_val_bits: EXPECTATION FAILED at
drivers/base/regmap/regmap-kunit.c:342
    Expected 0xff0f == data->vals[param->from_reg], but
        0xff0f == 65295 (0xff0f)
        data->vals[param->from_reg] == 4294967055 (0xffffff0f)
    # write_wider_than_val_bits: pass:0 fail:10 skip:0 total:10
    not ok 2 write_wider_than_val_bits

I can send the test to Mark as an RFC, to ask whether regmap_write()
should mask the value to val_bits for reg_write buses, or reject it
consistently.

[4] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/base/regmap/regmap.c?h=v7.4-rc1#n963
[5] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/base/regmap/regmap.c?h=v7.4-rc1#n2153
[6] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/base/regmap/regmap-i2c.c?h=v7.4-rc1#n127

> > However, even if regmap changed, the driver would still be passing a
> > 32-bit value for a 16-bit register.
>
> Is it a problem?

Today it is on SMBus-only adapters, as above. If regmap ends up masking
the value, patch 1 could still be used as the fix for stable releases
since, from my understanding, small self-contained fixes are preferred
for backporting.

Best regards,
Raffaele
