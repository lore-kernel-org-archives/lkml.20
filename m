Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B8F46AA6E
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791195294; cv=none; b=hN6PsL8X6bJqIEYJbJTKUQsx0qyamELMDh5vGWRc+CQFG0RVutfpRGBZramHscUAteMLTUlWpKB1hXqqjZVsnPpRBKEThTj5LD/hvj+w/ud6MmeYUvHVFWkVmI+isVHPh87LK28DTFsUNi4+lu9+d5UL2LaOL0exjDawrNiLmug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791195294; c=relaxed/simple;
	bh=SiCSaNH35Aalw7e03q0enXBs+RMPPX74VeGZyDKg77c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X6JqOnTyWlKC5rq4w6ReLGvp0Dc+oPRFdhD24YR3TcIqnV6HMCOG1/kiRq1YHWxgzoZ2pGOrHrBaYL1G0hE8jojhWT6CKCEeZI8Hb2q2pha0guQUA289ZUOwLCs4Drk4wDYmP8YHjmdGIIFSrlbQi4lIPGtsf6J2dnVdgry7MPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E8z4F4C5; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E8z4F4C5"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1594898f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 03:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791195290; x=1791800090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X6peHqRvKIr35uOnhSLA6otbHrMaTXR/Zz2Q8g3tXsk=;
        b=E8z4F4C5raHgkCPaxLGTVC0qnmkMTwYp83gmHKoYs+PTOp23wwEM4G2fGm/4p30ByQ
         /iJgvJdhLnnt3i/B1ouPcQBzN3golvYN8nLAl2xcFwHNzfGsUTxFLG+iRobqUKvUua/G
         /gfBhz6cCbO9vH94UHgHOXYr5aSueXkYQ1FZaZd7FKYIRYYK/GPbu44e5ye3uquiK239
         cLEXQ1GFoHzxbZpZC1Ikg+igmM1Z/kpCZvbafptHJTT87c79/y7coWOEHWjnTtQKq0GJ
         U3jEeuH9eJUq5t8xTnZXDiAp56K/ieFoeK0NcmXqNqbz2vfxTxH8/zN49DZ9ORjUeXHb
         ZihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791195290; x=1791800090;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X6peHqRvKIr35uOnhSLA6otbHrMaTXR/Zz2Q8g3tXsk=;
        b=J13CYD2wh+/uvyQ0BVFFJWYiPe3SSEUT2jrv60HKFRRhXJFQh6Y3ceguaAkVGVdUCE
         oRm996UyEFMhPrA2EhiSh/2eK46/WO0sTln/RyXon5HJyn19zWHkB1ZxSzT9l0GwG8lA
         UVO7kIV7qbDTkPK9cNNbCKbYuQbT500VeOnj+KzC7dPXTYMO/WOdJGkzMuoIPQLAhwML
         CctBt38WdrL0lK2eAjVDT2vbbljhqZRmL2nR60lqFfwLQXJ7LskoTOazTl9CsrpjaC9r
         kTuqP9LbrJwExYwn/e/0vpva1Fss/QCd4aRpmyhUXU5TmHnenaycsZAMOsvBPfEtiYU7
         QRXg==
X-Forwarded-Encrypted: i=1; AKwUvByCbdCfJT0QEAXaq6NSxtmHeEY0xjeHtaiNnj9eW3Au4tzJAuV4K/QEw8RcVFgHbGO3mluj9GdgJTkZtcM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKotIu73fUcw24i01qXVxM+uIZa3AHA36V37EdxZQGHW7mDzkdi
	a4+IW1GBwSIVP8P4rYFlaFz/VbjyvNSC4kRDujjF9uNz1fWYXmyZxmGInUr4nmDQ
X-Gm-Gg: AYBFou1WtKU11oFPVtSYAGrhwsQ3V7lL1a7sJS4bIDn4YpFkzAW6Sz0aGWV7U1snj8y
	++RCtJZQEEDJ3ngj8CAk/T+v7rRkQaUJjo6TDQoujYS9fmGJgY0YpkNWe7YS411m9LN9mYHhjaD
	9UzNfBOsZlQGzIT5FRbGPX4T9knTKBrth5tlnj5zTXT/VPYcbRMCOnba6V7U2CjZTwNs/dqKneN
	5ywNYC/tTWQ2Ub7PEk2Ef+f4Mux58LcTakP4H5SJbL2j2JMPXcMAcszaRGou1mxAFjfUjZ7OMbl
	14WKfjQeN16kKg7EA91zsY+vR9UdU9yTA84GrDQRE5qx0rhjDdsTXDRh/KcnghbkD7vIl4a9LzM
	IMhlP1zylGT5lmV3jEYZCWJVSDsDnNMQk+jjahLzUrXpt9IfihjyNHjS5uJgcJZuW8bk7AlqYHI
	89HTqZBINqLp1/CjKs5ZikFDeM6nOqoB9UcZwYbVwJycjvE//KdY/5Q19I0TvhVuUnuB+XjleXB
	GU2A+CouKC3iLTEUS1HidVVO+COivnBhUt8Xmd7oynAh04rcsLTh2ZXd6YleW60lr0n9JCuDS9q
	SsNMWrvuEaPTqmF+CI5qNlxCVg==
X-Received: by 2002:a05:6000:2482:b0:486:e707:42eb with SMTP id ffacd0b85a97d-48c47fdff0amr13692245f8f.33.1791195290122;
        Mon, 05 Oct 2026 03:14:50 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c62270746sm2478145f8f.7.2026.10.05.03.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:14:49 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	antti.laakso@linux.intel.com
Subject: Re: [PATCH v4 2/3] media: i2c: Add driver for OmniVision OV32C4
Date: Mon,  5 Oct 2026 12:14:46 +0200
Message-ID: <20261005101447.15264-1-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <asNsiKal6GgcqUSK@kekkonen.localdomain>
References: <20261005071010.7191-1-robertbozik@gmail.com> <20261005071010.7191-3-robertbozik@gmail.com> <asNsiKal6GgcqUSK@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Sakari,

Thank you for the review.

On Mon, Oct 05, 2026 at 12:23:20PM +0300, Sakari Ailus wrote:
> > +	{ 0x6ad0, 0x00 },
> > +	{ 0x6ad1, 0x75 },
> 
> Are there any gaps in this deluge of 0x0 and 0x75? If not, could you write
> it programmatically rather than using a huge array?

Two contiguous ranges, 0x6ad0-0x6bef and 0x6c00-0x707f, with one gap of
16 bytes between them; every even address holds 0x00 and the odd one
0x75, so it is 720 16-bit registers set to 0x0075. v5 writes them from a
loop and the table shrinks to 345 entries. I'll verify the stream and
the image after the change, since it alters the bus transactions.

> > +	ret = acpi_dev_get_resources(adev, &resources, ov32c4_i2c_res_cb, &ctx);
> 
> The presence of additional chips like VCM is very much dependent on the
> module, and I think we should have parsing of the I²C address outside the
> sensor driver.
> 
> One option could be to stuff it into the reg property in the ipu-bridge,
> that way it'd work the same way for the driver on both DT and ACPI. In the
> ipu-bridge, I'd use a static value and provide the reg property for this
> sensor only (based on _HID). i2c_new_ancillary_device() will only use OF so
> the driver will need to dig the address manually still.

Agreed, that is better. For v5 I'd give ipu-bridge a small table of
sensors whose second I2C address belongs to the sensor itself,
{ "OVTI32C4", 0x3e }; for a sensor in it the bridge adds reg = <main,
aon> to the sensor's software node and does not instantiate the VCM
from SSDB - so the no-VCM exception of patch 3 folds into the same
table. The driver reads reg with device_property_read_u32_array() on
both DT and ACPI and the _CRS walk goes away with its CONFIG_ACPI
guard. The property fits into the existing dev_properties slot that
lens-focus uses when there is a VCM, so no change to the header.

The rest will be in v5 as suggested - the register names, the RGB/IR
comments, the function name, the error label and the comments; the HTS
define was unused and goes too.

Thanks,
Robert
