Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70A849EC4C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436569; cv=pass; b=Hftt4XrVl+mjUeN1XONAW8tekiJdme5bW5NfE6DKtKqG8UizBs/MGhEiZgKYehC2uczu2YAxT5jxpl1H+n6kkUxciiurFMBLNQjgddONhxLr+brSevCJ/FgrZiZ+67wpNyI8q2f08mLjpQoOiGRmlGj0Kq5CrjKm52y89VfEDTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436569; c=relaxed/simple;
	bh=Z8f1lYw8YSAp0NXR2PLP/QCz31/oSQWmPuMnoePqCp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H0BtFGyyipJK+Z0DMI+G/wAcc4f+R1DaTqF316POoPMt8nI92lFG2AkbXnEbBkDMW/IIYKrXsqhNbxe/Lp5vU62XgPP89gLKGRtDhgzCZJ41O9S3/wEdrko5Z/QmPt50yHtWaDMCa3aOH1rVZmn+3r0YXiTVbhOEi6bCWxlNc9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=fsxi3i+y; arc=pass smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="fsxi3i+y"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7f4f824de5dso1071633a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 04:56:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788436560; cv=none;
        d=google.com; s=arc-20260327;
        b=BK5wo2Cthh+FG9NllNTCphut65uT5j/fdhjrLHcfRC6CLfJFxp6bzSxQTir7DwUtgk
         f7vgqfjTCKU8ptTui9Rygrky5Lz1T8ztrgHPuQ8FW4qirwaJESvFMkgfhSohWwMzWERq
         J/ZkBCCD7ke8eF5VB0IDntk7PchBRFe+u51U8M0wJTqikGypMEY0ITVaylCkFC4FXrai
         PS9XFn86WMgsg5HxAmL4jtmQRhfdEgTICvg1y1hf1fjCDR+yuJpJHN3PUmNxRxkkE7Ql
         7+pz8hXeh5p0l4tdqA9zUUh4WmIclmqbMn7YY910Dl8El4l3avp8Y0MgnpbET6wTWfvJ
         FwMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NYEZxpw9sUDkB/b/BTLw+VA6simRyFgSBVC6L/2gbWM=;
        fh=RsXhgMJBdf/+dZHDle/jsksC+HIFSr0tmdOwDpDlFds=;
        b=VxKjh2JCq9/1n5djUGsLsGCgkQInVkCoc47vh1t/r3AKP1wK3OLm38KulWRD3+Ko10
         Lu1ExeAjlY+sSrVGANJZUQCjkb2RuRT3luegFn9JBAV+q/wuF2zf8boMI/bIS8wiIEjx
         DtMTRUefYh1uPTNgh/GhxmjyjgTnEilB+Of3RF/1jAzdnBqebLR5RtBB4Z/DKjUVOhJV
         50273J7a9NDAMxA7ID3sbPuEK92GySXRls0ikP7oDEa4Kq3GiV0r8eXXjBoMXwXI01Mx
         /fECkl2uPE+p+uutwoIDqbdTwdn60MyRpWhX+0pGvOPu3HYeQVQ6jp3ZFJKfXCBaNbBZ
         ySMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1788436560; x=1789041360; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NYEZxpw9sUDkB/b/BTLw+VA6simRyFgSBVC6L/2gbWM=;
        b=fsxi3i+yRr8FqwlIYmPiWBdxUTj4t2vpm6S8d8hSrVNvbyHQp+I3hqYPFxmCADmnhs
         ugGS+bbYfkhQBuUFzEx37prG1cZkB0pdWZXDy0gNrHXSwaFuDAeNYKDG+WIpmvP4POwH
         6QdeKASr7HWYWaS/wa/8y73UqfFy88Bbksb5MMBAv8UOTb4FWhCryOBW58yk7hu/zyFY
         f4kvYM47eeZ0FVyUTc/2I8HqeDcBkP8ErBcfGn1HFxdZSTAhsnWlQUQ9wDuT9ImVG4iH
         eGLHNqb573NOh1mnb1xhDd1u5B7anXc/hn6xu4o1oanwi9jamTNOib/mnt7TYToiuUuD
         Bwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436560; x=1789041360;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NYEZxpw9sUDkB/b/BTLw+VA6simRyFgSBVC6L/2gbWM=;
        b=isVcrNInWtng6bKsJbxbwfwh5gqN3omGDoKWviPZWaA0QlBIrrsj1BIuS0Km3FMc6q
         LFS5ELs8urt+PudniBD1nfX1mCADCi/2OXjg/Y5pq5h6e8Aceog5GtaDOlJM6XZpr3kn
         2FXLQJkyUvIZzMH4xO/nuhkq7D53W4at9JnLjQOwB3I+ZERo0Q65RYzvoeEUPAWVy83e
         5hyYOJXpryEs84olo4K1O3QCI6+6g5ZswYJw0jqJqOjkSqxQWwo3bOIr//CwgMzbkdvm
         LikJP33Vi+9MDQw3sV9gA+b1z9jln1PYSg1D9uk/P1xARmm/XT4fa5PCuomuct/4nDT+
         uq3A==
X-Forwarded-Encrypted: i=1; AKwUvBzNfc5aSxVuMptcxjreErxOOm8GmtCrZxFK5FfiXmvzOUWTnR9sxRJRlwV7Z6CCb9z5unav5iqCGKiessI=@vger.kernel.org
X-Gm-Message-State: AFuF++ndjQmLogxZPyMbPLKxp8BZjQdyE/XFUWvJ5BvsBof8IeduaWxl
	GfP9RCN5SBzx1vZSODksP1x5mt3hS/cIZ/FJhukXGtEgMt8dgVVKtT/WUL7p8meCok7FhotASMs
	rx44KxKWFnjgIY7jpTombdS6MGXlBwMDx9CGxHj5EqQ==
X-Gm-Gg: AYBFou0SKBro82ZLNp/aREEpqz0wddsV6xGM8cNkaotrhTWJmmjahMJKwX1jtshFZwO
	FNcUC1TR4uo6BGVKoF3akRBohqlQnHyFlcTEj/DKWiNN00OwYQ1huINNi4jExApODy8tsQkaWOT
	GWeOMT+VdqpAHQ+5jdURjJnRwa6D+QwhVPrQs+h9edtpWSVCttgTVfEPyaBThRCRLxXx5xCYVu6
	S3HbU2epJNwDrd4sB3P8HzaQqI/D3Vp/FI3n864HQUp7D7yWGs9vtR1C4xMfH5knf+fWHRm6ar4
	+hHeJzLAW9HBNGKp93SlJPLEdjJWpWIjdDxvZuq2371o5Z0EWVzIFe0r4K0S16Fo1BF1f+AhEpk
	oF3KASALH/1/JtUBlLRuzTpp3OBKmMlJq7cP6WJhp+2ehJkaw6sl/MB9OEXF/pa6KVGf2wPTiqw
	==
X-Received: by 2002:a05:6830:258b:b0:7e9:cce4:803b with SMTP id
 46e09a7af769-7f78002427fmr11346560a34.8.1788436560160; Thu, 03 Sep 2026
 04:56:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805-media-starvis2-v1-0-91e8e4eae44f@raspberrypi.com> <178840879109.11722.9212352209191978851@freya>
In-Reply-To: <178840879109.11722.9212352209191978851@freya>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 3 Sep 2026 12:55:42 +0100
X-Gm-Features: AcwNN1ViaJDjIjQDa7Vs5xoi2HJS3rOgswfXSy4lZ1VLn3-O0UxK2SzpXn8uyrM
Message-ID: <CAPY8ntChzSsnbXcNi6rPhzWsrS-uL_odbVZoSpj0byFQnhYOZQ@mail.gmail.com>
Subject: Re: [PATCH RFC 0/4] Update imx678 to act as a common Sony Starvis 2 driver.
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jai

Thanks for looking at the series.

On Thu, 3 Sept 2026 at 05:13, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
>
> Hi Dave,
>
> Thank you, I'm glad this turned out quite clean :-)
>
> Quoting Dave Stevenson (2026-08-05 21:39:15)
> > The IMX678 (8MPix) driver has been accepted.
> >
> > Whilst preparing a patchset for IMX662 (1080p), I observed such
> > commonality between the two that it seemed sensible to attempt
> > a common driver rather than submitting a separate IMX662 series
> > again.
> >
> > On checking my box of sensors, I found I had an IMX675 (5MPix) as
> > well, so that has been incorporated.
> >
> > This set proposes a common driver that is working with all 3 of
> > those sensors.
> > It's sent as an RFC to gather confirmation that the resulting driver
> > structure is acceptable as implied by [1].
> >
>
> Overall structure looks good to me, I was able to stream with the Soho
> IMX662 module I have.
>
> > If it is viewed as acceptable then there is still a modest amount
> > of tidying up required:
> > - DT binding updates for the extra compatibles.
> > - Rename the common functions so that the model references are
> >   only on the model specific parts.
> > - Add the Sony init sequence for IMX662.
>
> I added most of the registers I could see were different from the default
> values:
> https://github.com/jailuthra/linux/commit/9ecb2d905581e9cf7ca61aa45c3b440fe7042307

I just hadn't had the time to analyse the Sony docs when I sent the
first stab. I've now done so from their magic spreadsheet, so
hopefully our values match.

I've now got docs for all of them from Sony, so will check through them.
And I've just been told IMX832 (new 2MPix) also matches this scheme,
so that'll be another variant.

If you're on board with this, I'll do a wholesale replacement of
imx678 with starvis2 in common defines, function names, and the file
to starvis2.c as a first patch?

  Dave

> Thanks,
>     Jai
>
> > - Check the init sequence for IMX675 (I'm waiting on a datasheet).
> > - Update the 2 lane mode handling of HMAX. IMX662 can achieve the
> >   same maximum framerate in 2 lane mode with a link freq of 594MHz
> >   or greater, and I suspect others can do so too.
> > - Hopefully add IMX585 (8MPix) to the supported list, and Jai has
> >   mentioned IMX676 (12MPix) as well.
> >
> > I wanted to confirm that there aren't any major objections before
> > doing those cleanups though.
> >
> > For anyone testing on a Pi, I've thrown a branch at [2] which includes
> > overlays for each. I've tested with modules from Soho Enterprises,
> > but there seem to be a few different vendors around.
> >
> > [1] https://lore.kernel.org/linux-media/20260312150437.1091195-1-eagle.alexander923@gmail.com/T/#md6a186b4abd05fb035d020ce0bc562455ef5bed1
> > [2] https://github.com/6by9/linux/tree/rpi-7.2.y-starvis
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> > Dave Stevenson (4):
> >       media: i2c: imx678: Always program the sensor in window mode
> >       media: i2c: imx678: Parameterise the configuration to allow for other models
> >       media: i2c: imx678: Add imx662 support to the driver
> >       media: i2c: imx678: Add imx675 support to the driver
> >
> >  drivers/media/i2c/imx678.c | 451 +++++++++++++++++++++++++++++++++++++++------
> >  1 file changed, 393 insertions(+), 58 deletions(-)
> > ---
> > base-commit: 31152f5b0f8719f92063b8c6196cd5e34106c73d
> > change-id: 20260804-media-starvis2-65a5bc405b74
> >
> > Best regards,
> > --
> > Dave Stevenson <dave.stevenson@raspberrypi.com>
> >
