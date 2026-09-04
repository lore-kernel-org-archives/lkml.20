Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680E83C1087
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788544706; cv=none; b=bpbi/KQZmAc32lxtKmBuMCoZRb892ZZm6hjK932uUNVJVU0Uj+SnCClgRjmmzupdbfq2f8UEAHfgjj250ahU09iUsqAzWxScimRfgJjcjRh1Hyi8+1WW6/adq3tAGm3Wsdk56hWChajeZXbImbhQBUO0l/PM9o2rnU92gK/rjMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788544706; c=relaxed/simple;
	bh=pI2JbNlZVZDDW8lq9rTAQZsCB4xQJ8Xq1HJSt+KCzQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9eHKb51m4VtJpNs/+FLeQb15E5b2cJLqnqAYR3Du2whjA0e0MGH4z1kGyo3pR5rVgVw3JYkcPkL6ZZbZwubZTAt/eoaDnCOEhJFsRmXdms7nTdV5iKvYgMuxlsY9UR++PSuo6Layi9YSmFYpF8ivGRvCqr22De91uQZL+Vp76I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DRIsqwKX; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DRIsqwKX"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d560775ca2so10203595ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 10:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788544705; x=1789149505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MCttvfM9DrOknQxq7vF2LggqSOtL8sYj8RJ3yUrgdFo=;
        b=DRIsqwKXSSXcGa8NS5QOSmMvrnu3Xq+WIufYsiXSgJZenyOJYF2upASyoEMaCEmiRm
         jjImEqt0hG2Sar3aqHKNRbRLJaswIGRp8BjlLaoeoBCS68ceCostm+2j02UviwNaS6y0
         OoxNTsryI2upQS3JFH0NcD3rLLZPgVuqk/YCF+D/TytGpMhifHDIUwNOaDKoz8UYSpm8
         Wti/Ex1GT98sHYvSxUfQqqGqtIZwRXisXQu+KADujtnji8A3aAMjNXS0lKtpmWTyrVfX
         UaOXF46guzORkoyYF8XdUHBVqtE9CYgjHffrJUx4A4fPIy9RRPWvVU3ah5taspUJDWNM
         GodA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788544705; x=1789149505;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MCttvfM9DrOknQxq7vF2LggqSOtL8sYj8RJ3yUrgdFo=;
        b=gQ944EPwXTSt+Z/Ff06kkuAjYNJFlX4ndVt3R5H5oPdsuwZ1OK74qW/K2Om2z6pMmL
         LNpIa+0Y+SxhXpXJItgBL+ou0fKQ+kmZssKSpqBb2dW0sBfgAgK3ElT420ZylJYXordF
         37QWm86u+DMGcUqNZYE02w5JfsX7skc/PWJK4uMUWtHP/1bxTcCbzu0Jre5LRSHrSJ4b
         q3XCXHcdpEMn2uzl04IJ12+5F97cxN1MtpoDWcjJgIK6i4tfHTPJxDvyiKptzUeQKPCS
         UzF08mRXtzi8PwkcTf+91iUeia/3ZfskVc2dOqforw6OHa5dVYd3u4WqT8AOEd7qB1Sf
         uFtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpBLNJaAuBEF5wvcD2sKXPd8C9GGXcvrk1/dcR88G2Wg73wBNUO2dKqR/2rlYRyY3N5fp7uRrMk/WQdjI=@vger.kernel.org
X-Gm-Message-State: AFuF++lZNGj5tgxl3wzo0yzj1FkdkBtWV/XXvT55qZAs0lwm4HS2K05j
	YnK6XORPT9QQ+06mpX+woyvCeckDxO77mHDVWFnAM0Tv+e3qhk7m1zki
X-Gm-Gg: AYBFou07nQAmZDoGKjbhBoV0p/3p+o1TwL3RjqxaSlhO8znVyTfmWEc6Y4q9LjmdM/y
	j+dQdYXKEgy+z78UucwVFoW8XJkKPWy3xVoTdpvJGibJKr6Hv/JSnP9VjhY4oNYc3jG/aOWwmlo
	SUfufJPVo7H+mPQGlG5iovIjamU1EzXJ7MbARRvIXme7Do9O/Lm9WThaZbl6RBQPlkEEa3Nx5Gk
	9YheRW0DtLXpiZwMNtj8JDGQnZjvwx7cN6KGNyTi7Dr+kbGdFqmfIkvsAt+SHPX+/s5jjy2y0am
	j4nZoZRGc80eG+wcK1MH7haCKsW7aNw75c3ByfMsm1uskX9Wx3guw6eKCMV54fni1DkXk73o46D
	ypypY+NePXd+UZCAlSv7X3DmEGwqo0e1m4HcFod2cPkmbPT04KaCy2vtp0Hwt8/f24mRszt/I9m
	3wZRul54Fv4jTaAxp+XUL379ibZ9+cEa7pFxFDB4fDUOx79rTUNByJTlrRfmCsXcSF2/+n6Wndg
	CGGNcfgPaylX4E=
X-Received: by 2002:a17:90a:ec8d:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-39b26101c08mr11024544a91.9.1788544702820;
        Fri, 04 Sep 2026 10:58:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bbf1feesm8215824eec.26.2026.09.04.10.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 10:58:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 4 Sep 2026 10:58:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Matthew Bettencourt <matthew.bettencourt@gmail.com>
Cc: Armin Wolf <W_Armin@gmx.de>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>
Subject: Re: [BUG] SPD5118 Intermittent MR11 Corruption During Suspend/Resume
Message-ID: <77e8caab-18b4-4953-8b66-887d5a7b31b1@roeck-us.net>
References: <a5d32ab5-f545-4e11-bf0b-88d3eaa68890@gmail.com>
 <474a37bb-0774-4710-8458-ea28d7c54c89@gmx.de>
 <c81e7caf-d3e4-4212-be9b-ec35d0a04086@gmail.com>
 <c096b0d7-90c2-4d91-9776-9f109679c309@gmx.de>
 <7ca2e621-e0a1-4eee-bcd1-2ded610f1beb@gmail.com>
 <cff09168-9a88-494d-bc82-d9a5e4de22a7@roeck-us.net>
 <e1a6a91d-d03e-4e7a-ba7b-9268284ce7e8@gmail.com>
 <5480c69c-8e98-443e-96d7-30e64e886373@roeck-us.net>
 <02dc7eb6-6d0d-4c0c-af10-b831d3f8ba06@gmx.de>
 <d1a590c7-f526-4e70-a255-fccfb199be39@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1a590c7-f526-4e70-a255-fccfb199be39@gmail.com>

Hi Matthew,

On Thu, Sep 03, 2026 at 07:24:12PM -0500, Matthew Bettencourt wrote:
> Hello Guenter,
> 
> >> - Do you have the latest BIOS installed on your system ?
> >>   Some statements online seem to suggest that the problem
> >>   _may_ be fixed with the latest BIOS on at least some
> >>   of the affected systems.
> 
> Yup as of Sept 3 2026 I am running the latest BIOS, 4.43. I think a new one
> is coming soonish as Asrock has started rolling out 4.50 on other x870
> motherboards
> 
> >> - Please boot the affected system with "usbcore.autosuspend=-1"
> >>   kernel command line parameter.
> >>   There are some claims online that this might resolve the problem.
> >>   I have no idea why that would be the case, but I guess it does
> >>   not hurt trying. Of course, if that _does_ work, we have yet another
> >>   mystery to solve.
> 
> I think we have another mystery to solve. I enabled "usbcore.autosuspend=-1"
> as a boot parameter and the errors have cleared up when I suspend/resume. I
> doubled checked this by removing "usbcore.autosuspend=-1" from my boot
> parameters and the errors came back.
> 

Outch. The mystery (or misery) deepens. So we kind of know that this has
something to do with ACPI _and_ with USB, such as ACPI accessing (or trying
to access) a device on the I2C bus when suspending (or trying to suspend)
a USB port / bus.

As Armin has pointed out, it isn't safe for the piix4 controller driver to
access the hardware when its memory space is reserved by ACPI, even if that
ACPI access turns out to be plain wrong. My ACPI / DSL knowledge isn't good
enough to figure out what exactly is happening, but even if we do that it
won't help: The PIIX4 driver must not load if its memory space is reserved
by ACPI, or it must access devices on the I2C bus through ACPI.

Thanks,
Guenter
