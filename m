Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793841346;
	b=Yw2ak7fJmERHKOYY1I4JoeeJXE2wS4Uwga22LVDh5yvV5wXqC7UT/kiE0gagoUSIKg71
	 P4Vf5CbYPnLhrofQGbwDjkNv24nIA/M0YHJCs49SGaI1eE2LKTFZfJ9F3MBS3yriNi2du
	 LP2yaJrisz27L++GkyNOIm7mW4ZcUFVOTpMjcOCS000Gay7d3ff7WzV7I5c49zaEzXTP/
	 d2EfpQzRJa6trA7CfVu0yL3IZiAHZ5q3J0vUDVVk67SUWcCcPbf+fBj4rLbTBDEHhkUYK
	 1LnpkE8N7qou1dfiFB99yx56wHA+vjHMBq+eMhyuh4znmG4Vn8Ss6G3yUSBFda5rlJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793841346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=hofK0JryGgKL/fZhmAQm61x9/fz9wA6S77HE9ruycGk=;
	b=3xMszj4ZtHYFp0n/5rpTSnFIVJGPp0gEIu+AKyi45X2FQf0g/J6QBoGmNMe8SFYA7R4o
	 cvzSg69VIr2WJ5Ck/srERUnBUEhVIULxWEKut5ar/5EJ6O6yKzpGAZNJyemVAjzNin+38
	 w7f4CVFT4ozMpJrDUwOuYW5xw7KZBBGfAB3fhxiScEzJep5ntNYoiesw5kZUyD7XSEAW2
	 /RWbbFxijKSu+YeEDUOUhnyWPUCXBcw7OalMK382mRFmqMiQ+8awUtC0MJ+7LMerXBIRQ
	 b8+vFKr2+mtDiRbIg3YTqlLSsWacrOMQfwyCG37FwFf/ZhMAZ+FfPaoOZHK9u/Ga65w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Thn65rFN;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E60606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 01:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99E60606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Thn65rFN
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1ae18eb9b69so1322974c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 17:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793841345; x=1794446145; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hofK0JryGgKL/fZhmAQm61x9/fz9wA6S77HE9ruycGk=;
        b=Thn65rFNnfU39wpnb0DfsmIXLStMu7RKnNYuvpHDRtU6JVvxnukMuvKSAidvGssVKL
         vIJvSfvTMC2u+i/HAu9oD7aLejbh/tHFVFxTqnoTPET+eLQnKWRIl0PKP8znLr7ROYDQ
         /qspSxKOMesAmRDz55csl0EIOM/lm5wKy/6vkF+TqAYoFdaaJcr6IySem886KFpGJNn9
         l231bzWscPyyudb8VHxifP33p8RfOQel86ck8oTQJTIaKqOmiYaKPiiOxOcmPnkz/NaT
         zP5YEH6dBftECPlZP0eXh9GHZriS/O5LNO4T/QxDjHXrDQvwip6q242mESeHQvJ86Hxq
         MiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793841345; x=1794446145;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hofK0JryGgKL/fZhmAQm61x9/fz9wA6S77HE9ruycGk=;
        b=BfMwyDRWUc0sayrpE1RVZsiIza8mZ0C1CJjXZbsV/mRTtK+CnsggyombPGc9rduWwS
         wWq2WgbmTOYnHqzNZkT+0KgEsInDZhxDwfLG+l0+Og5UW9M7LxuhKESqN3QiumWYTyVP
         6HLETzzmOgykHW//Rf1el7n77XcuoK9uR+KFMNt0t7cv2gxJv7wxYNeO7e/9/480pgqQ
         bkVBCl0Kcdzr3jdzuLiTxByCasGsBhw0qXD8tXG6Xbf571czgIQRExN7ND5U3m7Y17dk
         XJicu0mPqUgqRXI/1/hmWK+QG84YRJUpyiJxWuNxa8ovuC7K2X00tvxVvCgmOjJoeU4h
         zC1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwg8iKCgkc9axvwjLvkBUIyIIeVyvk49GV4aAQgdP69+ebgKte1zi8td4pThLDjwbcHc/J1oSn0UTJ5AiI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WHe9IQ9YGL4yktUJpjaP5e/ucWuAsYAb+EXUMTsK8Aog5JIX5
	Aoykyx+OUyq3GBotM+ediO573/zvcZoM/XEToR7jnZGQRORvZ0Dax9UG1y7BVQ==
X-Gm-Gg: AYBFou3Qb3bN7TWaVCRR7M9pc52Xaz6RAAhBwpLwV2S7iASOc1f/Or5AQ3XtV+p7Rcp
	l0cWt6dQ6FyOBflpKyciyDeiez6hgik8lUH5GIn8eEmgiucWoV2SuyV+ZOebXWuLe55eylMcEzA
	BzuFr+d22yD+Luj1kwlfJd/TA5hxRlidG3s7qVzhfNcaTfaRG2HzcKHbihCgQKWTDtuiyGr8xU3
	y7AJbT5GOUBcTXJoSPuz9VlA58DUvtPkNUfp/wxfcfRiMtRoh+xGlfGn6We8NL2mzjKzDbz23Cj
	XS3DS8Jdjnf4vKSzIGfHcF5WqsJPLpjWCYBe5ZTZb+aeI032+C5Bun5ZJXkn+8gcBs+JwX6UVRG
	6YOXreVYuTvyhtyJp2IvSxNM6Boef6mRmQI2Z8jR2t5iRabG7QOyGMA6Mg3fet7gt+0LE6X+1eR
	xN4VQEF5cMYets3YqZihJrcwjoy1cqaOTc38vvdzxQpKSWCQEv7UR29bVmyoeo7lMNjj1FkbZZP
	2RXGCjACpyjkQuvKQPvQkj0lDge0ZB9zfyH4FjEIuP2Ch/ww5muSArzNTMAIkw4ks45TpK8lsut
	ftp2fmYtPb3mpUDfhe9v/qMiWFPOiT4rYEQhFODCar+IXvZA4wLu/hPVQsUsn/haAdT43Q==
X-Received: by 2002:a05:7022:3c87:b0:1ad:4ef5:ffed with SMTP id a92af1059eb24-1aea05f4bcfmr18283181c88.38.1793841344539;
        Wed, 04 Nov 2026 17:15:44 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:c8f4:b7d9:252f:4483])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c283sm12146627c88.4.2026.11.04.17.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 17:15:43 -0800 (PST)
Date: Wed, 04 Nov 2026 17:15:42 -0800
Message-ID: <ad02069b0cdede7ae191e4a3df57f33a@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>,
	Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Arnd Bergmann <arnd@arndb.de>,
	mfd@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] mfd: wm831x: Support software nodes for DCDC regulators
In-Reply-To: <20261104181429.GE1650678@google.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com> <20261024-samsung-kp-v4-1-e21253295e68@gmail.com> <20261104181429.GE1650678@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Lee,

On Wed, Nov 04, 2026 at 06:14:29PM +0000, Lee Jones wrote:
> On Sat, 24 Oct 2026, Dmitry Torokhov wrote:
> > +static int wm831x_add_devices(struct wm831x *wm831x, int wm831x_num,
> > +			      const struct mfd_cell *cells, int num_cells)
> > +{
> > +	struct wm831x_pdata *pdata = &wm831x->pdata;
> > +	int i;
> > +
> > +	struct mfd_cell *local_cells __free(kfree) =
> > +		kmemdup_array(cells, num_cells, sizeof(*cells), GFP_KERNEL);
> > +	if (!local_cells)
> > +		return -ENOMEM;
> > +
> > +	for (i = 0; i < num_cells; i++) {
> > +		struct mfd_cell *cell = &local_cells[i];
> > +
> > +		if (strcmp(cell->name, "wm831x-buckv") == 0) {
> > +			int id = cell->id - 1;
> > +
> > +			if (id >= 0 && id < WM831X_MAX_DCDC)
> > +				cell->swnode = pdata->dcdc_swnodes[id];
> > +		}
> > +	}
>
> I can't begin to tell you how much I hate this.
>
> Why are we duplicating massive static const structs just to add a S/W
> node?  Is there no other way we can do this statically?

The software node itself is defined statically in the board file
(crag_dcdc1_swnode in arch/arm/mach-s3c/mach-crag6410.c in patch 2/4),
as it describes board-specific and PMIC-instance-specific wiring -
specifically the host SoC GPIO wired to the PMIC's DVS pin (GPK(0) on
Cragganmore 6410).

Because wm831x-core.c is a generic PMIC driver that can be instantiated
on different boards or even multiple times on the same board (for
example, Cragganmore 6410 has two WM831x PMIC instances, only one of
which has a DVS GPIO wired to DCDC1), the shared static mfd_cell arrays
in wm831x-core.c cannot point to a board's software node at compile
time.

Note that local_cells is annotated with __free(kfree), so the duplicate
array only lives for the duration of the mfd_add_devices() call (which
makes its own per-device copy of each mfd_cell anyway) and is freed
immediately before wm831x_add_devices() returns.

> Since pdata is being populated already, why not just pass that on to the
> consuming child device (the regulator)?

The regulator driver (wm831x_buckv_dvs_init() in
drivers/regulator/wm831x-dcdc.c) acquires the DVS GPIO using
devm_gpiod_get(&pdev->dev, "dvs", ...). When converting the board file
away from legacy gpiod_lookup_table to software nodes (to drop the
fragile MFD device name matching and fix the GPIO chip label lookup),
gpiolib resolves the "dvs-gpios" property against the consumer device's
fwnode (&pdev->dev), so the software node needs to be attached to the
wm831x-buckv platform device.

In v2 of this series I actually tried passing the software_node pointer
through wm831x_buckv_pdata and attaching it to &pdev->dev inside the
regulator driver's probe() [1]. However, attaching a software node to
an already-registered platform device inside probe() is awkward and
requires manual teardown in the child driver, whereas mfd-core already
has built-in support for cell->swnode in mfd_add_device() (attaching
the node via device_add_software_node() before platform_device_add(),
and cleaning it up via device_remove_software_node() on error or
removal). Populating cell->swnode lets mfd-core manage the software
node lifecycle cleanly and keeps the regulator driver untouched.

If you prefer not to kmemdup the full cell table, another option would
be to split the buckv cells out of the main wm831x cell arrays and
register them via a separate mfd_add_devices() call, though that seemed
more intrusive across wm8310/wm8311/wm8312/wm8320. Please let me know
what you would prefer here.

[1] https://lore.kernel.org/all/20260708-samsung-kp-v2-7-3c6ed4c9b3b6@gmail.com/

Thanks.

-- 
Dmitry
