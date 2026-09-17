Received: from mail-ej2-f24.google.com (mail-ej2-f24.google.com [74.125.228.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6333A398911
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.152
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669999; cv=pass; b=Hs4f3uuLIGR0wAN1uGNGzIbAm8CYU+2vjYR397FhSpNJmFy/l/sV3IUgymKkt/i2nW27yOE8GNWVihBHVBeoop/3gRTMno6ILi6Me1ua1/QQmLFWaPZ1IDOXWuEyU8YqvCnREOYiVuq1amsaJC7AQkQvtpR/xI8enU5ARY7OZko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669999; c=relaxed/simple;
	bh=Z0mdvsxuTksnVj1s16xXhW0wn2tIEeKz/5P4yoMDNVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aDZvowZHSUWqI0TfNchQY1grlqOiXLM6cDUR73u5W96AyTRdp/yw1rCkPeEiywoVdbrKfhe/cwvf3uLUgcV5usQFuAC0HpMLgNxa5DhEP15cSfoX8vkkpS6ZxqE5vVA9bCqwgwiCI3W5gCQhX8OrDToxFW7XG2Ie9OzG6VWo2DU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTYPTVsz; arc=pass smtp.client-ip=74.125.228.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTYPTVsz"
Received: by mail-ej2-f24.google.com with SMTP id a640c23a62f3a-c29d33431c8so177040066b.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:33:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789669996; cv=none;
        d=google.com; s=arc-20260327;
        b=dXcu2pxKtlocf08vmTzOlvDzH1/Yo2IU1aocwJCb9bJYqMHzx+4/tQXejt7kf6b5Rc
         GdG8WD4ha/po09wK2qAvMuyYG6Th3q2Bk8PY9OlnR4fAbqOyrP5B9g/xcgGtuwBy+j5V
         V9cLH1jEJnjGe87s5+sIu7gTP4Em4pI1LnFRDrFXt5VczRsa59DZTV3VwHELH+7SRWMj
         UAVSgI29fNwSUKPZrstUQNcJoh08PwsbLy6XecDmU9Z+cIu/QHME6ZtzJFJm1Eod0oth
         PwntAm16AN+YtGKnGzOv1UCgDbhz3w+3nf8wP9Jgxv7a/eEqZ/xglusbDJNPgXiJmKpo
         wKBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RAtHZMv4Fp/A6jZu1D8NUV7UjBzzzb65ZEkPo8MNyj4=;
        fh=t1lN2nwM23WVsyX9i40gHtHT5hAaN9fqQdIo1DqOMZw=;
        b=LGz2U9+u/gj3EplH/fRLWWsggQIPzje8KZMrgqpLFreh3vlxjsw3lH/ELz0TbVyenh
         aMBOc0zJGIP5mLbCf2q7HdNB7zF25Op2zroROjp5/G2ETyOBI2sezY1zr2y44EqsXaDU
         R3zrU2lKIyOAC1f0ej9hRtpW3bEeHFCHnItsjhq0O/j5mMriXRU05F1DQARvCe3xJnid
         Pf261VsfDnNII5xLJ1Y/GsybKLAUAZ2aj6epP0I3Px+Tc3QYTOfeQ8rW+dMj64eLhgjp
         wmKZj8GuTfB+recZxCIdGVBL1UzqL8eE0OMyHGDI+mOzrh8WdDOQ2vV2/47ksjPw77Wx
         ZHVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789669996; x=1790274796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RAtHZMv4Fp/A6jZu1D8NUV7UjBzzzb65ZEkPo8MNyj4=;
        b=JTYPTVszXA2AZc6Jt9JMozcQtgSYsHJ0sGCQx97AgkHwxr+KMOf3jiEMkho2AeoSRe
         4tJzh6BQgEF71tORwpWtpRkGJyljP7b4heTnBwxi/V7I20hDYYgnRvmyQwlfRUQc2I2f
         C1cnXTPksOqhqQr8Qr2oyJWzlrZQcOjNxpsQn0CvHpBbtLASZIm6niZh0Vn2Hrxo4FOI
         icNm72jK6V9zeTAySVadL6hYksh6mB3rVeiL5tKe2Hr1PONuEvxn+mFe/x6Pmmu5EDHN
         LYKdzejurpXjMyflJXgLbZL+G28/DZvgFsLwugfq7rFieNCy5zcDQd4vuJpX1Agwdovk
         cgfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789669996; x=1790274796;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RAtHZMv4Fp/A6jZu1D8NUV7UjBzzzb65ZEkPo8MNyj4=;
        b=DH8jZN+z1XxMPlzG2puUi4cOxsUcQxuOXC7Cua+C/YcvckPU663bB6b+r3XZfqoKA9
         ctY9DFg9qOfsozZiSdst35BCDrWXq+b3il/sBP7tJImmyACdndzIBEzbgVqDcA5UKX7W
         v8X2UlPBjL9czkUB4O7eIXsKuRE/+ySbXfmKSKN63RvetBSJAntyS3lFHMgqXQuCCubH
         AA0ZlL0+X01gJA4T/AiziVK64J2HMJymOc5zp+lM5/5jzp+Y+kMz74DGOCyauQhZxu8h
         LG+s8DnVpWSIhAya5TrSVK1to834gzMfCbUYci3jR3jzdjYZG7LWuAvOcnj+O5+bx8mY
         qfwQ==
X-Forwarded-Encrypted: i=1; AKwUvByRJo7FQmXrj0NR2Xb27cwcEI09WvAdQAzrfQokoJRffYnssBmIvrRF0K/q1CM4MLbqy/XBVuo+kWUwWS8=@vger.kernel.org
X-Gm-Message-State: AFuF++l33vG/7L+R4CjYlrCJvXVscyAJfvQEZmukqZYHgDNwPXR5PHIM
	1jfJJzNP4MOOUMZ9bpLvUy5IRcBYvE/f/+E/jtU2wO+P738hw/hx1SFB4D/cuQYG47IrGIMd4sm
	WTWvYYig8gh4QOVjEnjJ4nXq94LW5YA==
X-Gm-Gg: AYBFou11P+uVV81AOhI3sPbko+pCeNOSBqEBBHaEqHlak0LXSrf9cMgZRC2beZnxJi7
	G3MI/E3LGrdO4v+vaeOU1LjyKWSXPaj3qEAqTtnMfj+cvV+cEylTBochwKVz7L9XrGx4Lw/G6sh
	cM1n4XXwXHICXt9OduoEDyFJQbPa74YhG0ijo4fi1ND5yIcRLFJAcbeHIGMNHj+XKOvp28STtJU
	xJxXDpGkMIKcSoPmk6ZnbFXW+LWpR4uwnxo6sElqJi1Idhemco8NsNvD4stEXnq9BaT+Am0ORWY
	f2cJGXMkufsmgJgL8p+RtbD06qHDjB6jAUx9PbWNKi8YuX3AJ0HYqgzHjtXUkLZ7CbTqi7qyTUq
	qK4EQAk7lrrH73pCuo5575plkNOwJCNMO1hophAZIzCMHS1M/GAqur95mPnkCUtGKQare
X-Received: by 2002:a17:906:9c84:b0:c25:8fdf:5d with SMTP id
 a640c23a62f3a-c2a15685169mr7747666b.13.1789669996402; Thu, 17 Sep 2026
 11:33:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGEsz8F1hk5UpR0tJ6LjnbTKTyfKAxu6E9=7TLM_ABgodF9TdQ@mail.gmail.com>
 <aqj-zOf7VhWlGqg3@ashevche-desk.local>
In-Reply-To: <aqj-zOf7VhWlGqg3@ashevche-desk.local>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Thu, 17 Sep 2026 14:33:04 -0400
X-Gm-Features: AcwNN1Uomklmj5nh7O87baQcN6DxKDiyYePx3EGmO-GgU6xPrW2O450usLTp77Y
Message-ID: <CAGEsz8EL-cWXTexpcBHF3=mYLnebwE7ESEJ59+p3VnGf02YLNw@mail.gmail.com>
Subject: Re: [PATCH v2] mfd: intel_soc_pmic_crc: Balance IRQ wake enable
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy@kernel.org>, Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Andy,

Thanks for the feedback. I=E2=80=99ll use non-devm wake handling and drop t=
he
shutdown changes in v3.

Best regards,
Myeonghun Pak

2026=EB=85=84 9=EC=9B=94 15=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 4:16, A=
ndy Shevchenko <andriy.shevchenko@intel.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> On Mon, Sep 14, 2026 at 03:18:51PM -0700, Myeonghun Pak wrote:
> > The INT33FD Crystal Cove driver enables the parent IRQ as a wake source
> > after registering its regmap IRQ chip.  When that succeeds, a later
> > mfd_add_devices() failure or driver removal leaves the wake enable
> > unbalanced.  Shutdown only disables IRQ handling, leaving IRQ wake enab=
led.
> >
> > Register a managed action only after enable_irq_wake() succeeds.  Since
> > the action is registered after the managed regmap IRQ chip, reverse dev=
res
> > order disables IRQ wake before tearing down the IRQ chip.  Keep warning=
 and
> > continuing when enable_irq_wake() itself fails.
>
> > Shutdown does not release managed resources, so explicitly release the
> > wake-disable action there if it was registered.  This also removes the
> > action, preventing a second disable during subsequent managed cleanup.
>
> Why? If it goes to shutdown, cleaning resources makes a little sense, no?
>
> > This is limited to the Bay Trail and Cherry Trail Crystal Cove PMIC
> > variants using the INT33FD ACPI ID.
> >
> > This issue was identified during our ongoing static-analysis research w=
hile
> > reviewing kernel code.
>
> ...
>
> > static void crystal_cove_shutdown(struct i2c_client *i2c)
> >  {
> >       struct intel_soc_pmic *pmic =3D i2c_get_clientdata(i2c);
> >
> > +     if (devm_is_action_added(&i2c->dev, crystal_cove_disable_irq_wake=
, pmic))
> > +             devm_release_action(&i2c->dev, crystal_cove_disable_irq_w=
ake, pmic);
>
> Is it legit to call devm at this point? When is .shutdown() called and wh=
at are
> the assumptions before and after for a certain device?
>
> >       disable_irq(pmic->irq);
>
> This looks a bit ugly. Can we start with no-devm? This will solve the abo=
ve
> question as well.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
