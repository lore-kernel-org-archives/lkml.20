Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838E53002C8;
	Thu,  3 Sep 2026 04:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788408800; cv=none; b=o4VBykbCshbdzZvDQ2BzUko7rShMRpTyoEHHkj/t8ZNwhMyHx6XLIp6ed2eWGpGZ422eSFR9zGcQ4+MRr6AKbYY1lmqlEBG+214MMIwr9CcEsQIyLUK85Xwlen7FhAY4NEdrPShnzF9UmRmjW8DP22FGeolEzqI+0U+ZzTx3jN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788408800; c=relaxed/simple;
	bh=SDprNhI/r65+uR1nZmoJF8bmVlueAUfOcGQnEgKEflA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=RnaizmJoaIC9oSLfkhQsZbFmA4rPoq+3EopT5mJLc6sPE74wT6tE3erkW+97/VifyWyORUsdQ5mTaulUT0+Dyv1kjQigpPg3OqA1UsEdLtUJr784rMXFpg5R2idhzRPr6ps+RE2E+MQmV6ch1O9MQ8ZqdHs2CppsjGnaKTOyTXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CrzMHdYS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CrzMHdYS"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:42c8:e78d:2576:d7c8:5aa9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 332C6C36;
	Thu,  3 Sep 2026 06:11:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788408704;
	bh=SDprNhI/r65+uR1nZmoJF8bmVlueAUfOcGQnEgKEflA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=CrzMHdYSw9RNNHMAdN5WPOrVZy6CcemGP+3ZnUj7Y/gNkf4yn7qOSr0TypOQ63OwV
	 jUcBWQmA9d/ULn4jjGvkJiBwCmjPwQqtSw86H+b8BJZBwv8M3Gm6XHnKGgtQ+7uxQJ
	 qV1jd83k3+qICpedk4RWySfW1iyLov/VjAJ22ZZk=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260805-media-starvis2-v1-0-91e8e4eae44f@raspberrypi.com>
References: <20260805-media-starvis2-v1-0-91e8e4eae44f@raspberrypi.com>
Subject: Re: [PATCH RFC 0/4] Update imx678 to act as a common Sony Starvis 2 driver.
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Thu, 03 Sep 2026 09:43:11 +0530
Message-ID: <178840879109.11722.9212352209191978851@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Dave,

Thank you, I'm glad this turned out quite clean :-)

Quoting Dave Stevenson (2026-08-05 21:39:15)
> The IMX678 (8MPix) driver has been accepted.
>=20
> Whilst preparing a patchset for IMX662 (1080p), I observed such
> commonality between the two that it seemed sensible to attempt
> a common driver rather than submitting a separate IMX662 series
> again.
>=20
> On checking my box of sensors, I found I had an IMX675 (5MPix) as
> well, so that has been incorporated.
>=20
> This set proposes a common driver that is working with all 3 of
> those sensors.
> It's sent as an RFC to gather confirmation that the resulting driver
> structure is acceptable as implied by [1].
>=20

Overall structure looks good to me, I was able to stream with the Soho
IMX662 module I have.

> If it is viewed as acceptable then there is still a modest amount
> of tidying up required:
> - DT binding updates for the extra compatibles.
> - Rename the common functions so that the model references are
>   only on the model specific parts.
> - Add the Sony init sequence for IMX662.

I added most of the registers I could see were different from the default
values:
https://github.com/jailuthra/linux/commit/9ecb2d905581e9cf7ca61aa45c3b440fe=
7042307

Thanks,
    Jai

> - Check the init sequence for IMX675 (I'm waiting on a datasheet).
> - Update the 2 lane mode handling of HMAX. IMX662 can achieve the
>   same maximum framerate in 2 lane mode with a link freq of 594MHz
>   or greater, and I suspect others can do so too.
> - Hopefully add IMX585 (8MPix) to the supported list, and Jai has
>   mentioned IMX676 (12MPix) as well.
>=20
> I wanted to confirm that there aren't any major objections before
> doing those cleanups though.
>=20
> For anyone testing on a Pi, I've thrown a branch at [2] which includes
> overlays for each. I've tested with modules from Soho Enterprises,
> but there seem to be a few different vendors around.
>=20
> [1] https://lore.kernel.org/linux-media/20260312150437.1091195-1-eagle.al=
exander923@gmail.com/T/#md6a186b4abd05fb035d020ce0bc562455ef5bed1
> [2] https://github.com/6by9/linux/tree/rpi-7.2.y-starvis
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
> Dave Stevenson (4):
>       media: i2c: imx678: Always program the sensor in window mode
>       media: i2c: imx678: Parameterise the configuration to allow for oth=
er models
>       media: i2c: imx678: Add imx662 support to the driver
>       media: i2c: imx678: Add imx675 support to the driver
>=20
>  drivers/media/i2c/imx678.c | 451 +++++++++++++++++++++++++++++++++++++++=
------
>  1 file changed, 393 insertions(+), 58 deletions(-)
> ---
> base-commit: 31152f5b0f8719f92063b8c6196cd5e34106c73d
> change-id: 20260804-media-starvis2-65a5bc405b74
>=20
> Best regards,
> --=20
> Dave Stevenson <dave.stevenson@raspberrypi.com>
>
