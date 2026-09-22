Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE673A383A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063136; cv=pass; b=gxoX27ExlQdxJHo6SeaxNvX1aQ6/WS1obOpnpEgRLgY1x5vECRYo4Ig3xbxe0FgeXUkGBGpLClk4tS73DEkSjaZ+3kqoriPwMkyB+xIr1flraQGy88/Rsr2PX+zgE2yquycF00d0oRG6OIHgn5Mo3Pbt4DZTGTujTq8l3zxm+u4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063136; c=relaxed/simple;
	bh=vwk3YHzhVRubUb6LXpTknkCoqeslrv42vzJiu5ebNn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ooj11lS4Dnn68WKagMWeD8T3puFSpvnzjJ4hcvVEBpS7oEbX+3Jp5zLxsTgTKF7AtUouyviUYRrjRc2VOCeM7CxCrbU3A/dpFJGyf9hqBaVX33tn1Zao+RLSSGVgfQ2JFpr38IJUlesNj0l4jvXdVeIkvd3RI4hpJG+ujipwyts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hNg6zioy; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hNg6zioy"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66f7a9afe43so3160284d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:45:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790063127; cv=none;
        d=google.com; s=arc-20260327;
        b=Nazs9u26iLhcP7fIzWjfA+By16+BGbIb0KEMCkOEMv0/YIKkoiKwRsVcGP+WoYz9u4
         zgHlS83Z5BU+MJywlK7F1d3Q4N6ez2GYDHuagp4MiRNUyYV4xLzMeICClfSZ/NZZvjoF
         wLYHZlnSCT/CUdaiqLxNBWys70qgXS5mpKfUOZj7YD1kBVnS16UsI131LXnk5uwMykGg
         Zj6XEfsE+VUp+CXfDGpX6NFnfriBtQEhopRMU3Tg+2clxCyEXwCVk7rz8U+oCHs49/9Z
         amIN9K55Z1nZ5Ae/RSEhMTTlVlKPDNKWFvRKngcOCCO2h3DIEZnV4lUnIz6Lyn+4vHGx
         6b3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=H+UYLFM6FSgyZSccr2Im7M4AUKvCegECPqck3iL9VdA=;
        fh=rQANSFMLLWsS8B4fjakmBN0pRestrSmwW872fwwXf1U=;
        b=YcMisJiCM7z4J1e+3CmT5eXvDSYGogGefyE9AcYiAL4Bj25GKBnvIHmR22nJhAJ4Ha
         q3EsuKbAlRDxjM9rijrYMFBqY4kHS/Dfk1OFTl6o2GihPv5uy+wIAmi9khkgjiT8JM2S
         5XDqA8IAAjy2QWQnNPJzQPl6ntHtOW+i4ek7HUXho1lPAZ9CXn0U/doe/Dyixk/xMhFT
         i001uZBUQtP4i9jfrVZs911e2hLXvRijFDtAV2KotsRAlabdfUXHIU5uyX8/FdlTfQYx
         IybIIcRXLn0Y6sgL5fLz5vaF1tL9vSYrNehMcOpd97NZYFjL9R64FL6+cJ1i6p5SYaDA
         vlaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790063127; x=1790667927; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H+UYLFM6FSgyZSccr2Im7M4AUKvCegECPqck3iL9VdA=;
        b=hNg6zioyPkj3Vxo6UL4pmtbNqUQn/ScNQyw72P3LgDdRR8KZwwVyW9UoRfULYdcO8K
         Hdxa7466v0D3DLvtELMdXcPbNOobkoYIarzfkp2zA6FdRpjfZm1nCYMbM8ZvHzeUbh+0
         9b0h/H4dDBIjSr6nrw9bnfkNbsJ9kkH2MxVfMW3hm+HC+X3WCRel6i2q6ReK2CHlNAYG
         DP3Dw1zD6p5rJBrKehWRwfGWJPDG79sojIvw1aez+dkkDzdfYWFzAiU6mjhGT3avWJ0P
         9VDEPOkzh1/HnqlSqMax9NIoxl5NSC8O7tejwQNZt4yYe4jW0zB/P6djsh0x/u4jmzUv
         lPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790063127; x=1790667927;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H+UYLFM6FSgyZSccr2Im7M4AUKvCegECPqck3iL9VdA=;
        b=KJhAQtAc/0ZrD9KODXRHP4aIorR6pGcbFgWSQC9EoO5wLI4Xj08jBOIl+Zd7xpE3At
         M62p/AWbdBinWXsDedPVJVlA5t9g/Sad4e64JFGT069THLl87O6Ozpw5AOzTSM9VCrPc
         YzBiIUuv+yo5bAEB7AMuFc0CwjCsrxUUgh0yfnprDCqlU/ORbM1DfHWN1I3+3TgVAfT7
         r+eDNxWh35JY9u/mTA9ceW3edgVfO2L6fJyBB9thMq3PPQ70UhlG4Ue7vRoorrGiNY16
         TrlhNC0QtQ8kNMfqTn/vg9b8Fd00Y2OUs1+D10BBBEHlbcKbsCpx65hwO1wGP9uo8Iil
         9C6g==
X-Forwarded-Encrypted: i=1; AKwUvBw5Q8H8QBzUFwBiHSFsT1Q1X2dByN7DARY6Bo6Uo8O+TdcVm6KBO/EPHm0dAb8TVUgCBDcQ1TruR/ULMqo=@vger.kernel.org
X-Gm-Message-State: AFuF++nAwYBcPmP2Xuj56gprnM18QR1qUIufR+GvrVarHgj7N1wPyXOA
	CH8/QVVa9kLwHmzvbOBCGlsdpXotiK8M8bTRSMYsAVk7oPhhM8S0hwWY5XnS9kUPmN9B4tSFUh6
	vojlPkXvcWLNdoxD9Opp55mo6mBnMDqY=
X-Gm-Gg: AYBFou22jR0ryulFMmID1nbhY5FpCa41ni3Hqn/YOIhAgtAjGQWqrTad3ZL1S3n0k9A
	/WAT9va5j3C52ep4EAicj92fJCP5dVnd2dL2fpfRjh1Z9Mef6t71xShNQk88RzoqYAB1dBbYtA5
	5jqblncxp0Tl+YJR5JcPBimCBLIUWskKVJB0zdsoLEL1rHvsdJaTSkSvoClg/leN+dvbT9owYpe
	GqFs8iYllGuntzrSnhRRTnUJHwOPw4+npLkn2yrLnobOFaQyDgeQXO85LdZtf9amRn5KiQ3huE1
	akJM+dgpPcXFo4ABIplX7rDZ13O6QVeH5/JuZl/H4C+c3IIoJy8izAvo0w==
X-Received: by 2002:a05:690e:4504:10b0:66b:14e5:d226 with SMTP id
 956f58d0204a3-6717fcca387mr2794016d50.34.1790063127085; Tue, 22 Sep 2026
 00:45:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915090457.2342778-1-lgs201920130244@gmail.com>
 <CAPY8ntA2h_ChCWJbAmCVygYiviTdsd9TA2LcVh5ffto__LgZAg@mail.gmail.com> <aqz4fLrtW3f7OoYk@kekkonen.localdomain>
In-Reply-To: <aqz4fLrtW3f7OoYk@kekkonen.localdomain>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 15:45:13 +0800
X-Gm-Features: AcwNN1WbgY-jD334r7w3_JXPxi1yr4UDfUsx_etRp47_SqH8gSMFaJ8SCAMR3JA
Message-ID: <CANUHTR9_XR7Q1CJQwKHd6dZRLaJdRNpHxYbUVXkJj_iM7ywoeA@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: ov5647: fix power cleanup on remove
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dave, Sakari,

Thanks for the clarification.

On Fri, 18 Sept 2026 at 16:45, Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Dave,
>
> On Thu, Sep 17, 2026 at 02:27:30PM +0100, Dave Stevenson wrote:
> > Hi Guangshuo
> >
> > On Tue, 15 Sept 2026 at 10:05, Guangshuo Li <lgs201920130244@gmail.com> wrote:
> > >
> > > ov5647_remove() disables runtime PM without powering off the sensor if
> > > it is still runtime active or updating the runtime PM state to
> > > suspended.
> > >
> > > pm_runtime_disable() prevents further runtime PM callbacks and waits for
> > > pending operations, but it does not force the runtime suspend callback
> > > to run. If the sensor is active when the driver is removed, the external
> > > clock and regulators can remain enabled and the power-down GPIO can
> > > remain deasserted.
> > >
> > > After disabling runtime PM, call ov5647_power_off() if the device is not
> > > already runtime suspended, and then mark the runtime PM state as
> > > suspended. Checking the runtime status avoids disabling the hardware
> > > resources a second time when runtime PM has already powered off the
> > > sensor.
> > >
> > > This issue was found by manual code inspection.
> > >
> > > Fixes: 089b7c70f0d8 ("media: ov5647: Use pm_runtime infrastructure")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > > ---
> > >  drivers/media/i2c/ov5647.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> > > index 3facf92b3841..d42d009772ac 100644
> > > --- a/drivers/media/i2c/ov5647.c
> > > +++ b/drivers/media/i2c/ov5647.c
> > > @@ -1271,6 +1271,9 @@ static void ov5647_remove(struct i2c_client *client)
> > >         v4l2_ctrl_handler_free(&sensor->ctrls);
> > >         v4l2_device_unregister_subdev(sd);
> > >         pm_runtime_disable(&client->dev);
> > > +       if (!pm_runtime_status_suspended(&client->dev))
> > > +               ov5647_power_off(&client->dev);
> > > +       pm_runtime_set_suspended(&client->dev);
> >
> > I was unsure whether pm_runtime_set_suspended can be unconditional or
> > should be in the if clause. There are numerous drivers doing each.
> >
> > As it happens, Sakari's just answered that in [1] that it should be
> > conditional, so I'd take that as gospel. It looks like he's given a
> > similar answer on your ov2740 patch.
>
> Runtime PM is a bit mystical in some places. pm_runtime_set_suspended()
> appears to be setting the device's Runtime PM state disabled as it name
> implies, but it may also e.g. increment dev->power.disable_depth. I'm not
> fully certain if this is by design or not.
>
> --
> Sakari Ailus

Would this be the right way to change it?

-       if (!pm_runtime_status_suspended(&client->dev))
+       if (!pm_runtime_status_suspended(&client->dev)) {
                ov5647_power_off(&client->dev);
-       pm_runtime_set_suspended(&client->dev);
+               pm_runtime_set_suspended(&client->dev);
+       }

If so, I can send a v2 with this change.

Thanks,
Guangshuo
