Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794470588;
	b=qqyokdzTltJKSqMzTPqLXMznH5NCW6XGnNlSTnZ6SbK3Eo7Tj9q3nDJhvQHqyJtKI4mK
	 Kbgqmsb0Og2VpyeaGaEpaTp+6HFLm3tiXxU556oWIWBDOysPLxRrjP40n5leizM5ahuFv
	 t3hE4N+fzJ0a77iQ7l6Z6wPciwJ/oD1wi7/3Cwj5gEdGnDgzysQhJ+36eOZf4OFQ5/Wm8
	 0M2QpcAeBDnW1c/gLqFhO9sYo6KRto2EasAlTS3d4KrMjYrLPa+LiuZNd5FrSK+q7U+Zw
	 MVb2pvmG5ZpCvFze6zhNF8lWJe3rMjTDo2gwJv94jSwEzwN1bTM+sII7L84Dk/pW/Bg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vg5Ht+MKDWTS/SngbatC7TH8UxuMGp7fVzqLJKIBOgI=;
	b=bHtOVMlfryrpN5tuyBM+97iQMB92t/oyu5DKwtYdIsQBaebL+UN/NplJ6NAJiXP9y4zB
	 N4Z1LsBEfM6zEDnv3qRiAXwJGXvMbOjqSLYzng6dfoxp3PAMiKs7MvgAkv8WUVkdB/Jsx
	 amtZjPqoV+DZUFIjFyJ/TZfy0yS+VDSdgyCuhUtvKhvffZNjMs/BRtkMOpCZtdfc17gzs
	 Q11tYfyFwBKaTlyNpoByKRG0t8iqFSM3KZXdc4Y76nnnsR7XKgjkBvpfxSAPgzv9yqZFy
	 9vRXsWTUsbDoof0BnTJmw6x9PBWyNPZUsai2hUYR17WHueQnz01S97GYSUqd9UCGxxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i1fHBNyM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90560606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:03:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90560606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i1fHBNyM
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c0ea47f5b8so153834e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:03:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794470587; cv=none;
        d=google.com; s=arc-20260327;
        b=alBOQdxrkud87KYd8o4rA+pXGM5NyBSSEfcPB7fhHu4n1g1n/q/o/aNkCbDGrKhvqH
         MQZmad5aBSk3UxQAEFtU17ZUxj6gAYhhw6K4w8qPtlYHtlYZySzlUVRca6aG4FxZt3DS
         R2Pv3E57hUPI/qSxNZCxNI0we2kJSErepElPhjnGTMEZaY94FK5HRhPe3fNhj911MiUF
         lA6eF9cI5AdiUSuzGxzr8UBGAzxPuyVGHLRRemVV7taW3SH9bJUMZNE/MST0eIUWZDey
         PuA/CP65lD8HEnJSu95OWJaZVhXp2/mfOU0YhWD+WNGxcU3OCzd0nvu21mRyxMrrqXkz
         scZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vg5Ht+MKDWTS/SngbatC7TH8UxuMGp7fVzqLJKIBOgI=;
        fh=Knm3a2K5J6QwhaCUIaGTXDr7EoFbwsYfQ7ynEAO+F/0=;
        b=ooEetVqGeMMlqrc8ROXgMZMoPAAXD9RPFZR0eTqRG59Hozl9zmawPijEXv85xjE10t
         TbK1gJEJJFiKUEWdgX9YAiFYnOEXpu2E1Rqo1sblJ61jnUA34irXcw8A4yXArNgL2AvH
         brcUK59sdvR3zbWzr8zB4oJBCVLmrgj+xyOdswpQEHe6HHP7vmCnqeh2Y1g+ZzdM1Oz3
         Mr+UC5NyRjMadZh/QnQS7Zjy/UPJ2blrGUAbUnzg0oZ/D5tPZlw/eXsaJ54pH0EDab+l
         J0LRJiOn2fRIibIW95yjmK6bt2ymum8RGbPUayiUYYOTgmiouxk+IchE7X8R4lDY9LS7
         KRPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794470587; x=1795075387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vg5Ht+MKDWTS/SngbatC7TH8UxuMGp7fVzqLJKIBOgI=;
        b=i1fHBNyMwHeFsIC++MN53coC7qM3nebIEqBImwIlUrqxlHYgMYg7YkZvynV7vsQ9Vs
         tKihkMXh5tPa5ZZUFwWgg+psnR89c3fZSNg203PdNXxEvt3QypnGbnKdwK6d6VJorBua
         eFHvd6RVtIZdxu0f/sIkijjKImlwqoUjUeUpEc1/8fXQJq8kDwReC1RvSv5asDqV2eXb
         9q6z4VM9Jtca9NzyUEPXjrjauR1lHpKpnZGu8QZgIcSkxaIQfb4JE5WBADIV50cvy5gJ
         Kn1sbLQosOCZGyM1iXgsx2WATY9AXSI2qw1q8iUPLlinGsP61rUTs2rwKJIQ101Fo/dT
         FCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794470587; x=1795075387;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vg5Ht+MKDWTS/SngbatC7TH8UxuMGp7fVzqLJKIBOgI=;
        b=FAMpQgj6/LuxsKSRQ2YZSe2MRaSndlCBuGKj7d8sCgO3FkFx7PtRTYjTroVwe2LCfh
         PaxpJ3JjTpMCDm5M5pXq/Y7VsoKLN3En4KoOEVAkK6a2QBvNrq5toewQw/BU0QhnSHC5
         2zahD3BHV9oZPW/McDrV/Ag4ZG+96/uEqJCRpyG1JeDgkNU17ctDTNvokksf50Hsl8rm
         Oog3fRtoLCs5VU1rX4ADcU/EUmLG2PUtAwUydEhf5ppGQfdlwxmdXjHS4+/0HQRQajN5
         zhfmhV6Nhmx2hH2YCL0CUdFDBOEEdZiWL33JRewkvUOzW57xOl3+tX5BxYvVnsO9oO0y
         5lpQ==
X-Forwarded-Encrypted: i=1; AL+hErGmIdbUWmO2g6ypFnXWIwxrHbja0EBUzR2zoGfWMFX9Y6UXRHdenp5ccRHWGgK+7pMNGApYH/tEPFWzguA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AhcvtMm2ims8Kbg40tKGGGtTVbH2t13UJZIy8deP0cvvkayNl
	3C+hTc7SKrQ06itrab3nB8RbRz3OAnc2pXfo9D9MxpFzZw8XFVnRDubA6u8fTPfPEQxBrplX/YO
	i9n23sS4Id4iEHHuYLFsTYsVgSMoiOSw=
X-Gm-Gg: AYBFou34acnYSgXZxV1OoISdDFCjsLRfMxZCZJXxvDaBVHdLpCguXZsRlZByubrAK0C
	zOMiH1JEAeHBinQQm6lgaEVoqn1tECq3G2NedaO5Ue8WWJO9ua1NdaZjt+7vWr3DBWwyVRTuODH
	Q/BL1DCq9QWG3+oiFpEOnQoP2kM9qc/c80sjc2bY7o2mxdhCmumbzjKKjzQgmmmCrHXm27USFBi
	poLn1hSKYNkA+m625IU5Z27/Ohp8fnUPauIqWhuHIQdoilP5S/RJ+Ut8W2r89GWBapBxqCwdTM8
	Zt5imUOq6Na/IWJGlSBGjNTz9RmClvw6BkXMwAzgFUe6vgQDiCDpw1/gx3xin3dccrhd+Nt4M8s
	4dwTXkzhpkVxOQjyYdo2aHfDqVeyCq0/8aPqNYDRzS4/kZsqGFoFSoa1YwrYxkTpd6PZ6JMc=
X-Received: by 2002:ac2:51cc:0:b0:5c1:5488:f57d with SMTP id
 2adb3069b0e04-5c15d632082mr1648903e87.4.1794470585944; Thu, 12 Nov 2026
 00:03:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-i2c-slave-eeprom-of-match-v1-1-8f762bf06205@gmail.com> <avQ8z7jFK3T4uZ_1@shikoro>
In-Reply-To: <avQ8z7jFK3T4uZ_1@shikoro>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 12 Nov 2026 00:02:53 -0800
X-Gm-Features: AclHuK-jjur6lWiQKOO6c8Eho1dOCCFd80BnO5zfnEwPN1oz16TOLteZYqIO2Jg
Message-ID: <CAEy9hNWPYM5koXgXdzTNwyPYAnaxAGYoNX_sAo+CL8KXRmCEQA@mail.gmail.com>
Subject: Re: [PATCH] i2c: slave-eeprom: Add an OF match table for module autoload
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, u.kleine-koenig@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Wed, Nov 11, 2026 at 11:00:51AM +0100, Wolfram Sang wrote:
> > The slave backends have no DT binding (they are debug devices, as
> > Documentation/i2c/slave-testunit-backend.rst says)
>
> So, why are you adding them then?

Fair question, and that note was badly worded. Only the testunit
document calls itself a debug device without official bindings. The
eeprom backend simulates an EEPROM, and I should not have lumped the
two together.

The patch does not add a new way to instantiate the backend. Creating
it from DT already works: the i2c core names the client after the
compatible (without any vendor prefix), so "slave-24c02" matches the
i2c_device_id table, and reg =3D <(0x64 | I2C_OWN_SLAVE_ADDRESS)> sets
I2C_CLIENT_SLAVE. The backend also reads a "firmware-name" device
property to preload data, which slave-eeprom-backend.rst describes as
"DT or ACPI only". With the backend built in, such a node binds today.

What is missing is module autoload. A client with an of_node announces
only an of: modalias (of:N...Cslave-24c02), and the module has only
i2c: aliases, so udev never loads it and the client stays unbound with
nothing in the log (since af503716ac14, "i2c: core: report OF style
module alias for devices registered via OF"). For the nodes that bind
today the OF table changes nothing; it only adds the of: aliases. (It
also lets a node match that lists one of the names as a fallback
compatible. v1 gets that case wrong: such a client has no i2c id and
probe dereferences NULL. That is fixed for v2.)

My use case: on an Orange Pi Zero2 (H616), a DT overlay puts a
slave-24c02 on TWI3 so that the board shows up as an EEPROM to another
host. I found this because the client stayed unbound after boot. To be
clear, target mode for the H616 controller (i2c-mv64xxx) is a local
patch, not mainline, but the autoload problem is the same for any
target-capable controller with the backend built as a module.

I have since found Bj=C3=B6rn Ard=C3=B6's 2021 patch for the same problem
(https://lore.kernel.org/r/20210504135209.4757-1-bjorn.ardo@axis.com),
where you asked for a YAML file. Is that still the condition? If so, I
can add a binding for the names the driver already accepts (as ipmb-dev
has one) together with a v2 that has Uwe's include fix and the probe
fix. If you prefer that this backend stays instantiated via new_device
or built in, I'll drop the patch.

Best regards,
Arun

On Wed, Nov 11, 2026 at 2:00=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > The slave backends have no DT binding (they are debug devices, as
> > Documentation/i2c/slave-testunit-backend.rst says)
>
> So, why are you adding them then?
>
