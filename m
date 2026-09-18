Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44ABD4D795B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789729198; cv=pass; b=Lm5qGp/IsOQvhLm5RyfdD7yymH3KSeLgYT5Jzf0rbvKCV6BZHKMP1P+uQ/FoB2xYOV6gLZ+8uZPf62hqGB0+XYvKkl3TIwi2mMtS8PKEXbM8bwbx7FBNmmwn/TcoKh9UFpD7yG3LeaXJ1J2Sn32hdJw0EkrK+4usy1223XX2t0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789729198; c=relaxed/simple;
	bh=alnnkH7WGWsawf5VvQl+bx2GHauHyQlXLyt5VyewApc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JhaU3Ac3UZmbGAyEKJvTh0r5WR0G1pQfTd0s/iGDdwWDBQlk8+S4bxD9TMetrHKkMW42wqXhxaA+T9GUTR7TPGEwFfk7zphxBFtpzAZO/Haw3yjajC6m1Y3QgkatnTGASzq0DBFlyyaVwBvdgzI4cQ2jviiJ36ZkrF8EnJapoPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=Qvsbxy37; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="Qvsbxy37"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d440939e3so4098707b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:59:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789729195; cv=none;
        d=google.com; s=arc-20260327;
        b=mHLC36GWtQnqlfroKwX1h95COk/o369iZMWaGIy8YVwMjhfu/aLb/PNPTmuL20D0mt
         kMAIXR19c3W9++dWdGM9bVme2P4/bRzF0Q4yGFwC7nfpefQns2Jmc4VVHRiHYUvyGRGp
         bohgR0ZA4Z8UUmaJUl5Sw5dBsgDRuZo//SxUn3O8uHmOPX/Tkew/WjrVtsMeevBAo6Xl
         pvfA0ucFHtnDuiA40FVHLHSy4o+Lor8eyL6iC7xEvGSuw38xyNzb1W8Nv5ReI3KqXS/W
         DH1Q0fldO6Ln8kONMWN197iyFGujfHfzURvXUZ6IoCSGV16gDEnwr6ptvj3ZyM4TNLJU
         HauA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4osDPipEl90WA23ocY12H8xUxvylL6hv1TVnP5ao8T8=;
        fh=AWy97+azq1zz7jjMf2Fyfocxg7W+4AN558uLEaIjD/s=;
        b=C9D30SQkF4XZvqCfoMBOibAGd6Ce9O8IadrZoNdUcw/ikXhbMK9Zi/DZUVWDpfuO3a
         A/iBR/eQD4hXtfrVtxyxLj0I8g4jly5jIO3yQ5Qbvvlbw/VuNffZ18sHnCTbBponxHUX
         8TR98lKUti5hbyMqF0iOvUpMrNS27XZ1eN+fEvVfXJ1xpgMwp/p154A8FDxCgzkN+fzI
         9Qw83MNHW2CJcda2rJhPDdJnullXwLvSbqHAlDiu/8WV8hTyXtMLKyb3chGZH3TuT6xB
         Pr/q3h0We+rJzTRXe4awoolpX9E+vZgQibl1UlnTClhIX6NlZ655a9WL3goIRC9NtYBZ
         lwcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1789729195; x=1790333995; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4osDPipEl90WA23ocY12H8xUxvylL6hv1TVnP5ao8T8=;
        b=Qvsbxy37H//xJ31u4JoC+be2ELkT9Z6JgjPObo7Z0QsgAau1q7aG1DoVjXD/w2c1et
         o5Zbb5Ho1xS9+tgRi2AN7Tv/N0WbyWcHyTgTnl1fDO5VdenHaWs7BvmINjQbVsfWXl6d
         /zQB/VheRW2o1FJ9YONo25kyuWI4JX2leHzge6L/ofZtgavGKd62pwhS6v2Jh37am7Sq
         zUNLDxYJ9YpbCID+CC+g1lGGZgPu8A6HpLnkpoGnqw5nJehJfkF6YXjNE6Zzxu+ZqE8X
         274kw/ICBAwzw9hjGG4XWS8GYN6PAE6iKAyI3I677ttC1C3V3dqQEnjru40l2jZu7ZEV
         gYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789729195; x=1790333995;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4osDPipEl90WA23ocY12H8xUxvylL6hv1TVnP5ao8T8=;
        b=fiiMkMLUxIDp53euXeKTN6n28r/xgrRhQqQNHdB2n08YIbNb6q3cPVvj+V8+yp0orb
         dPDxzYAQiGL/326M3cb75eajmUotZw6Fl97EWU/nxfd8Pdjk7tdcCE+cjwVzr2IPNPKn
         h51QRSKYbb04UK3uzJage7ePMOJlwFiq8l3f6yTYh6EYYHV2ajoCBZrVrUFINOg25Pkw
         Un40hwOfjaiME0R0/XsqljzKCUbjP/IMQlAsiJTssd840H8Cl9xtjLdoDzFVkujInkJh
         m/LcTZnccmU1qmh91u0VW2lh4+wFpYd/XiPlnnfnoZcsWgrtOZmLkSvfL2f2nuV3vgLz
         wSSA==
X-Forwarded-Encrypted: i=1; AKwUvByD2DfxmK/UaYfaNUam3ucBlcPhTuRCwdPzERp6xcfUSMTjSeFV+6YaGaAQxWTXbPY5KAw1+T4RlpkyGuc=@vger.kernel.org
X-Gm-Message-State: AFuF++l6LXELGOsMF7KKvZQzLbygc+72A1ibuIi1MmA7YFPv0dFRPbUL
	49CExDpbIp7JanmBLxKdBfBW4t6ucFD/e/m82e8zS1F/cc7XBEvsZvLGRIOdPcENGGbt+jMxEb8
	foiY85uyEJI1hrbnJ7VieOqjvU6e9MjuiCztUZh5efw==
X-Gm-Gg: AYBFou2NuQA5ORfGLMtu6VnYQFG4pAoe/YS6a48w0AcBAHDgvyUN0EIMLzgwzajJexy
	Liyf9tyJtwfb4fZV2a26X8uQIYzeYAHG2e0LsV4fSgUXvxo+5p+tXD/x4YrgPFUmhOse6XbPXew
	QT8dq6d6a5riWp0Bz8IdmRTkuAZqKYK1tWuQ6V0W2E63VoLPJn1/6mwoX2+tFKYcfGo6V/jISSp
	IiuS2bdYlSu1J4MIKfth3yfll4ENTwer6t0Ytm11/R6Tl97CfOpZSJhl7W0R4zw1n9gbjeLVgAO
	YdVDAtdXy9NxQlXClZPAS0bDPRsAFRp00l7sucXRaBzaQYyZIMf5xvHTCD+3SkFE/UyxjNQHM9m
	tJ/tuvlEL/KsNzA==
X-Received: by 2002:a05:690c:e0ce:20b0:873:5bb2:6c19 with SMTP id
 00721157ae682-89736b3f7a7mr4725497b3.67.1789729194857; Fri, 18 Sep 2026
 03:59:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918031326.68542-1-karl@asseily.com> <20260918031326.68542-4-karl@asseily.com>
 <321e417b-55cf-4667-9c52-cbf3548561e6@sirena.org.uk>
In-Reply-To: <321e417b-55cf-4667-9c52-cbf3548561e6@sirena.org.uk>
From: Karl Asseily <karl@asseily.com>
Date: Fri, 18 Sep 2026 13:59:43 +0300
X-Gm-Features: AcwNN1VW_L9A_m2ilmQ9K0WM9ssAzHQHLSHz7CCRbfwgDzOxl-iZROlyG5jgDeI
Message-ID: <CA+gvwbrep8j5R5c2o+oMAK9NF=K7EcXFswNCfaVnmfnsBd4v9A@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] ASoC: es9039q2m: add ESS Technology ES9039Q2M
 codec driver
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +out:
> > + regmap_update_bits(priv->regmap, ES9039_PROG_RAM_CTRL,
> > +   ES9039_PROG_COEFF_WE, 0);
> > + kfree(buf);
> > + if (ret)
> > + return ret;
>
> How does this work with suspend and resume if the device is powered down
> in suspend?  It looks like this is doing some windowing stuff and needs
> a specific write sequence.

You are right, and it is broken as posted.

The coefficient RAM is write-only: PROG_COEFF_OUT is documented as a
readback register but returns the last coefficient written rather than the
addressed one, as the commit message describes.  So regmap cannot cache it
and nothing else in the system holds a copy.  On a board that keeps the
part powered through suspend nothing is lost, but where the supplies go
away the RAM comes back undefined while regcache_sync() restores the
filter selection from the cache - so selecting the programmable filter
would point the interpolator at whatever the RAM powered up holding.

For v4 the driver keeps a shadow of the last upload in its private struct,
the upload loop is split into a helper, and resume calls that helper again
after regcache_sync() for any stage that was ever written.  Stages never
uploaded keep the part's own defaults.

You are right about the sequence too.  It is address, data, raise
PROG_COEFF_WE, lower it, once per coefficient - a per-coefficient strobe
rather than a gate held open across the upload.  Splitting the helper out
exposed a second problem I had missed: both FIR controls drive the same
address, data and strobe registers and nothing serialised them, so two
concurrent uploads could interleave into each other's RAM.  The mutex that
orders an upload against resume closes that as well.

For completeness: an automated review on this thread raised the same
suspend question a few hours before your mail, so the fix above was
already written and building by the time it arrived.

I will hold v4 until your review is finished rather than resending
piecemeal.

Thanks,
Karl
