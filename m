Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF863C13E9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169755; cv=none; b=QYDs5oLasPipxK90TnqyClflUAII/cYsLy4X+G0QHW5kXlz85g7+4O9KgEgR/1tHzNwZKqFuYK1ae0eQHDRO5AGxwBG2xXkGYPRraJIq+A8DLqibK+p2I7KUYxEbIHCgbXT/6h8loGFqmBSoxpRCx5z8wEUuJURAaHXS93qXzcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169755; c=relaxed/simple;
	bh=kZf0X9HPQj+XYjW69KdZB8/4j89/EUTv9woWOLKu5No=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l7sHcf9DLPhhIfKeQsewclo490lI9eqr/l6YCGzyiVvLC18W8YAMQnwGaZbA+u8G66ABGhyNeS2vsvHlWLl0OJ1fHEVXSfGQBLyObHCItznnsSHSwJSsJolObv2sSBspEeNLJG65Uz1xSruGgyUXCQZS345ex3rHqDYLk2xuxA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DBSxfPQM; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DBSxfPQM"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so3143951a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788169754; x=1788774554; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tgHFIRmhsqAJHJCUFWnm6qnOb1lTD89+RXYjFUi9avs=;
        b=DBSxfPQMNgRNucSgd+8ml93Tj2FYmty2oVwDjhcWxizomdHnVCyzipg0HR1FARUUm7
         0zy6aINrDSdN4RDCuKCkLCqpZnPFTQsF42AfHoqzHQQvCsUVHa6GSuWzcj6YNDRARfvw
         XZdqy4iflTyqMD/loZatpqX6pA6mhnsmutFlleQT66akku36UAOEEnIjTce5O5drSHUk
         wR0AHP6ebsL3UsW06qN6JmSWZfiAj42Vo/rOYLvAfWtbCH0Mea91OrhstJxMN7/bcwss
         rWmNVjvSolcMPyOnl2UMFtCoTVv2e5KBJDuT1gjFD9tnPN0Cd32RNnsY8I5P5DwQUevG
         GNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788169754; x=1788774554;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tgHFIRmhsqAJHJCUFWnm6qnOb1lTD89+RXYjFUi9avs=;
        b=CvcWWdyDoco/Jgy25Y12ZXzlSgvPADtNcRe3u2sVB6jjcK6ONG4vOBJKLQOHFxkrqF
         nzA0Ha98IAFSqyUKiiiSxcoDsOwty8usu8aVL3u8I2ustDnBH7mZ39yfcrSHc2JgXeLI
         7uPjIO5YnAD9c8PVDrd3I4L9nbsTq29z2bQF0S76B+u3/8KbjdLvnU1UYZKKjN60Mc7n
         CuEdiNShUMaKTmj3Ceukyv2fviSnwcAA2WI1KoWXPoiEHdTSHi/W6LiW9LmfOTBF24M/
         043c5ngXgjBQhz1cv8nU9la2qZQ3RnyPOH4jext1xBW4zoZmofJ0482TIgFJoHiGi9nz
         ATCg==
X-Forwarded-Encrypted: i=1; AKwUvBwJjniskylSUxcKP5Xbi2vmYf0OD9Py21Y9UE3zOvlrRveD08+KuXk5/+LGg1AwOkIiI9UaBuGnxhBP8YE=@vger.kernel.org
X-Gm-Message-State: AFuF++nnAWZRWbocJ+AHaG/MCmQpGYKwJQOf2898RP1vwkb1ZIy29+os
	eqzLi/mG+mfdzwIc3+7hdPuzeZ2WPIEXqwfpCKXMhnI2xRijIgxzS1JR
X-Gm-Gg: AYBFou1YoN4W6yAC1Y5Ov8wEFm7viZdrN+4tqnoqJipU5QAxcUf1+YgdC0im1M3fUNX
	3N+Dv4L4CT/UdKcwPUzmBk1SN1xQspHoR9FXO6Lt+EJdveG0dG4omlWNza87JneBQCmMd/qRxZP
	oGO4LZ6Ka5+4W5W/lTi6Pf8LeA6aD+lwtL6hYbNDXbF6uCB0H7lfjY9vAJlZctLfVCVGC4d/pse
	Ey+j4VxKDHQzEps8gnzi5fvG7J4evP5GpsFUTFYgDI0MmllQDQPx3dvP7wMtgkxgTvhq5Bmlk5c
	2VbpCEE4i9ropn7RcK+WPLDx7jF1isD4Op7YrSG7w9pqGC6KrSDF40VEEiiZ4yJVTRRojkDsALI
	HFws6HjJI4bejj0pRPKJJDOKar86XxJzGOglSAwD2Mih47DuXLaOpYeW7BD+vAZ8FgV+6Fyl443
	9GtP+Jpq8Pk1Sl/7dtocD5kHjqQ2FxbfanbzWvf/MKsyo6h67WOgo1zGHG+q8=
X-Received: by 2002:a17:90b:1a8a:b0:398:9bd1:3211 with SMTP id 98e67ed59e1d1-3989bd135cbmr22863004a91.18.1788169753993;
        Mon, 31 Aug 2026 02:49:13 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-398fae7a197sm2074315a91.17.2026.08.31.02.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:49:13 -0700 (PDT)
Date: Mon, 31 Aug 2026 17:48:56 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/3] phy: core: Add common helper for get phy phandle by
 index
Message-ID: <apVN6N1wVYDyeW5R@inochi.infowork>
References: <20260831025319.94886-1-inochiama@gmail.com>
 <20260831025506.95548-1-inochiama@gmail.com>
 <20260831025506.95548-2-inochiama@gmail.com>
 <apVF0kdgA1f_MdgB@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apVF0kdgA1f_MdgB@ashevche-desk.local>

On Mon, Aug 31, 2026 at 12:13:54PM +0300, Andy Shevchenko wrote:
> On Mon, Aug 31, 2026 at 10:55:04AM +0800, Inochi Amaoto wrote:
> > Several phy helper use index to get phy phandle of a device node,
> > add a common function for the future reuse.
> 
> ...
> 
> > +/**
> > + * of_phy_get_by_index() - lookup and obtain a reference to a phy using a
> > + * device_node by index.
> > + * @np: device_node for which to get the phy
> > + * @index: index of the phy from device's point of view
> 
> > + * Returns the phy driver, after getting a refcount to it; or
> > + * -ENODEV if there is no such phy. The caller is responsible for
> > + * calling of_phy_put() to release that count.
> 
> Use proper syntax for Return: section, with the above kernel-doc will warn.
> 

Thanks, I just copy the wrony syntax. I will fix them in all the patches.

Regards,
Inochi

> > + */
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy
