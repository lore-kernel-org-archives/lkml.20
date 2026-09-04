Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B494211466
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 01:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788484707; cv=none; b=KpDMOBiBRqOyjtx8hUmHiwfsIHSLwrR4YOSjKwxHipHbv9m2A6pVTegh9j7b61zASASwoohr6pjF72/6W8NoBvNRWGo6uXT6WUHUKSUsv2cuqMpQlCX4s+77OY+A9ykmaXp9DBrEY6hFZ3nlXqXu2LxQrDY/m3EXoHGdqs7Dl4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788484707; c=relaxed/simple;
	bh=gYbVwSamD5AxEVCquK+e+L4qZKQ7NpCzRyjlH8wqBBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z3gglX4qNrTT7YT3R1q40bgPn40DckbUS7hpm3MvzD+g05NlQBbfLrWYNPuE226Ul2op+KbWHPyKJdHZ3laNmCqRdSg56Hmpd/I0TERE2fJia94gGTwpnaHvPHtE3dxQyvZnDxjeGQCY67eeEWgPBBq72ArBh8t33e7MVjVF6OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qNSA4oBk; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qNSA4oBk"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3965d3d9ab8so322952a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 18:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788484705; x=1789089505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ULiSgzHfmvT7NB3kNetHvVNjR8ABCL+iHYfHXbGS15U=;
        b=qNSA4oBkkT+z7ZyacpXcv0gp5hXmjwda9aLkDK7eRWo+DseCIcdqHuL/9J/L6EZ+4p
         do9RApq+Bhj3jQWCgwovCZaxU4ZZNf+G/snycs1G4gfCGc7aZ6IJ5/G3rvTmByz1R6rj
         WYaEZd/Uh7/PH/8t0VbzgAPtKu7LIlflXWK3kPbS9cNXQifT2Gfz8dn1O9ZOTWc179Oa
         yIWPCJ33+KAlxlSlA2slrLj4yII9+tcYwlijdhPxHQvhOPePVDiLLNuSSWS1quCbnx3V
         kkLZpmJsn5POvG3xZRN+ljhMP0iwqpCcVpnwy4TfWfRE+Ye0Jf6t8ZsCbFlzGaXcEUkz
         sFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788484705; x=1789089505;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ULiSgzHfmvT7NB3kNetHvVNjR8ABCL+iHYfHXbGS15U=;
        b=nZ5UGcVSADGKSGxkpjTVMQ76sc86JYWsr+/Dzc7H5YdcPTzmpDjNBwD+hkKishPsp7
         g2U23J+z3WeKdNhtMdr0DEbmPudyLzPaqk76DmK3coRDox4x6KDszPqXk25b1zLqC9mI
         f3fUpIqBXcfbFsVgddFtKZm5pZ1GDJYlRmQ7mJPNxkUzx0o67QFY3zo2QTbvLsWMX1RP
         FJGelCigJa0hs6Dc4IjEgo/SapciNdqhSvdnATNQys9ot0FEK0qFxkl1FQrleoLGx80+
         +lkdAoERiQWzKPwIhLLT/Iu7+nbzcL87hvaGBpdmuJUspeYq0BBdB4RbttWf0wMOQ6st
         l16g==
X-Forwarded-Encrypted: i=1; AKwUvBwf5KH+mVbNPUq97KRjuwXxdjr9X2wmo6dYSmjJ33sqeoE6jXv4SIMQuWSx47E69FHH8D+/gnEH6UtdY5o=@vger.kernel.org
X-Gm-Message-State: AFuF++kQtATLbSxTJatGMcouycgv3TyDLlOXe/GcBdIL12B6OTQc3uCV
	KXIipDM9M3cGZ1RJV9fRTJro8q/loOS0zH6c7+n5MRygWcHhCOoPQckv
X-Gm-Gg: AYBFou2hby2suP+Brk9WXWWqhCwgxykTEXvQQ4+xlvcGKMt8HFxJjO14uZTcefR8vkZ
	QMMZ6KkPtcDAuYWhAhT2dTr7MsIqbdL6DKIfLBAj6ipPTTWi3ij0dv+UN8E9SpNqhwK/YWrBi1s
	wUoqxW6HBd8ijwcXJZaJUJKj8yJqOlypjPvG3P6AyzzsRAps1ScUyb5oGaOSeWoxC7/ty4nwNCk
	WYGCGgGNWQSySUfKNeXKGWeTHB5ngNydxoosVFCyyhGWyhZP9iVmbmtJYsfyj3yWbqqQyyHy8DY
	46ysRAJIZrXG2W07Ksw4XnLGNeSmcYd4K/cZEIS4iBkWXjqtmcLasyuomKiNBoUGFV5uxVwPYxb
	h7lBHoWFoKbuTjfSoOVMlM0m+FzEHaLTGo0UrnyVZ4BDOL0jAmCMfMHdteoeS+tJAuyy8Kqwo+p
	64BHsPZgPGQZiTDAJO5pAmfW5OnTxFxz9lyHTJa2Wuf/5PgTVw3DhL0zndIB+M
X-Received: by 2002:a17:90b:1dc3:b0:398:d6f4:c61a with SMTP id 98e67ed59e1d1-39b26207ee4mr3987950a91.17.1788484705186;
        Thu, 03 Sep 2026 18:18:25 -0700 (PDT)
Received: from localhost ([115.70.157.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ca63b3sm7852282a91.11.2026.09.03.18.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 18:18:24 -0700 (PDT)
Date: Fri, 4 Sep 2026 11:18:17 +1000
From: Tsz Shan Chan <tsz.chan.dev@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Tsz Shan Chan <tchan@jacques.com.au>
Subject: Re: [PATCH v2] iio: light: apds9306: fix default sampling frequency
 definition
Message-ID: <apoYIkJGtnX8O0kN@fedora-1>
References: <20260903-apds9306-v2-1-e8673986ae56@jacques.com.au>
 <apkmS32q9UI-qQw1@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apkmS32q9UI-qQw1@ashevche-desk.local>

On Thu, Sep 03, 2026 at 10:48:27AM +0300, Andy Shevchenko wrote:
> On Thu, Sep 03, 2026 at 05:05:35PM +1000, Tsz Shan Chan wrote:
> > APDS9306_SAMP_FREQ_10HZ is defined as 0.
> > 
> > According to the datasheet (Broadcom AV02-4755EN,
> > https://docs.broadcom.com/doc/AV02-4755EN, page 11, ALS_MEAS_RATE),
> 
> Make it a tag
> 
> > bits[2:0] set the measurement rate:
> > - 000: 25ms  (40Hz)
> > - 001: 20ms  (20Hz)
> > - 010: 100ms (10Hz)
> > 
> > Change APDS9306_SAMP_FREQ_10HZ from 0 to 2 to write the correct value
> > for 10Hz.
> 
> Datasheet: $URL
> 
> > Fixes: 620d1e6c7a3f ("iio: light: Add support for APDS9306 Light Sensor")
> > Signed-off-by: Tsz Shan Chan <tchan@jacques.com.au>
> 
> With that being addressed,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

Will fix it in v3. Thanks
