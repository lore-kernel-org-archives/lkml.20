Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC91D4E0213
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657405; cv=none; b=fsM1xxTkD6m6sob4qx8PKQDf7Y/PhSyJTj1oTnsbTaSth7iaPZsknO9nMpfQKdJHxQgcvsSGF9haY84P8a78EKW/ndKYH3kDnfQHmuql8Wn5kWtK9OU26kYYSzcv0CktXLca1ARoWbQtZVQpRwbN6HMCftmYIQUJESekJheCQ0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657405; c=relaxed/simple;
	bh=v8TIQr+q1avK5K0cxXPV+I4INTDPrErrKq17EaY7bGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kLyIg1rg/ARRPodRDBw4ZYtS2vw6CpWuR3l0V2YlDc7774KTqgCmqzp8mZO1tCotSeHMh7ppX/mk4zXAgt8nCIJPLP/WnNSUcyBbKAmD2jzW6MZV8dUkEKSmoduec3gq7N5WmblZ4+Os156jwROmWDL63jUsoV1sCwOM7o7ZjxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FlwCsd7M; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FlwCsd7M"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b74d0133e0so861376e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789657397; x=1790262197; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AvQ95HVkZu+0oz5n/XboAcTGYSXdTRCXA3Bat1fmPR8=;
        b=FlwCsd7M5C0BEFxTJFsWbRmx655fiLCSqVkpyrjQWKsjEIYQJOGOXa0SVLQKsTWoAG
         PYlsO3IkMzfOXYm0GnxpUhzr7zXDlwRtp9Ngt1oK92rVzFGaz6EE5CsL3e7i7xq5xvam
         QVSSpyGm6otxbUB7e4V/bDTjQH9Mvk5i8mwOWr3fMyz7kmFiYGjRhVnwrkvolsvPCrDH
         anwWz2B/qpJWhKd+0gF7uUpqZPn2jUdPLvUI+Qz0Zst7VYOB4Dh1xZnBtE5peJiaOD1Q
         Wswq49FuzRKpGrncQoF4WK1xB0ggyC2aWyQjFa6TJ/bKsxOnWwwsnZQnJm7Q/I4+dsGX
         P0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657397; x=1790262197;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AvQ95HVkZu+0oz5n/XboAcTGYSXdTRCXA3Bat1fmPR8=;
        b=NRfJ9Js7Dhe/PD3VLWH5dHQI1yGnXHRYBDxQAKHajQfcI5xhCj/UDm2uIfzxrTE2Ej
         Z9Y9rI32q+ceBWTQc8hfrHb0wmOkwcsN21RjrZDLI2KW7kshsXMSuNhwPL4oe08L13on
         uTdbe53DMy+59rCvgDHMB3OCQ9qvKCZ0yn3KDCxiBy6j3OxBbygimTW8k7UQDp8yiH1q
         nTyAeUoH/T0GiLngcolLc3vWJVa3gbunMV+oTTB/A+QpxuTTg8RBMyVF7jXX3UCrBIeV
         ptIooEzoLPehcYXaLohrVS3tsKHRmsCZepaHdSD+oBswEPKdfNPtr38tXDux66zck+hm
         ludg==
X-Forwarded-Encrypted: i=1; AKwUvByqpdl4EJAmD79DSDqKdYYSq0VAzkRj2rLDTfFezl7RBS4Q6u0dDh8m6aUpnW2tsMsJjq7lXXsdyt3+vf8=@vger.kernel.org
X-Gm-Message-State: AFuF++mLP/SvnuV2RAmmDEZdJab9/+zmU/A9/JJLbo1449RPLJXflzrb
	u4+J1ultYF40hC5uaymAlbGNnhgzzWYQm+pESoLi4+btDEABnKNm5XF8PBjQthFZ
X-Gm-Gg: AYBFou29f/apOEQ0MTyrJDyKU3PueNHigHnHjT+Y28KU5loOI2I0fdTnETucWnSHplJ
	jNoawpzubbj5RqW7RiK27V9hABE9PDB515DqngS68Rta0nZG3s8Hlh4lpn8C5GANWn6l3R5VU/4
	ZREU0VPOZ/5EhWwcjEZR0LEnTJOG4DtLZ6Lh8W7JyqOsJjl5A8cUiJtgA+bcX4E6yTYTQLZzIRR
	Xh1gfjb/SNLzpnwnMXEDizJqkexJx7B9Wc9ZNJXSqK9OK+CMQyJQmzhvP2H0h78HNRogRz3Ursr
	6AvmEpif1UQ0QnL7QjlfnFR0rKVsaehl928DRwgWZeF85yOYNWoSJfTHXTtsP0BUBznR9y2Abgm
	kmneBywWpOVc2CGy6QpYPZ2TGuDATAFQM3Pmxd++LG2ptXClfgmyJoUOaEvzkIO4d5SAZ6TT6Ka
	tubHntznSd6Rc45CcSgA05StNPe+Ec5yf2CfpH8aza3m4FBAGH2n11Kotz7iDX0Z5sr7UxYzNjd
	CJx1ixQW+cGIS3jcg==
X-Received: by 2002:ac2:51ca:0:b0:5b6:1a7c:aa1c with SMTP id 2adb3069b0e04-5b8b664e438mr2177419e87.52.1789657397222;
        Thu, 17 Sep 2026 08:03:17 -0700 (PDT)
Received: from rigel (194-223-74-160.tpgi.com.au. [194.223.74.160])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57897dfsm1951402e87.3.2026.09.17.08.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:03:16 -0700 (PDT)
Date: Thu, 17 Sep 2026 23:03:06 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] gpio: cdev: fix kernel stack leak to user-space in error
 path
Message-ID: <20260917150306.GA131235@rigel>
References: <20260917-gpio-cdev-stack-leak-fixes-v1-1-2bb52879e49c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-gpio-cdev-stack-leak-fixes-v1-1-2bb52879e49c@oss.qualcomm.com>

On Thu, Sep 17, 2026 at 04:39:05PM +0200, Bartosz Golaszewski wrote:
> If we fail to acquire the GPIO chip guard in gpio_desc_to_lineinfo(), we
> return immediately before zeroing the info struct we'll end up passing
> to the user-space later in lineinfo_get_v1(). This may leak the kernel
> stack contents. Move the memset() before trying to acquire the SRCU read
> lock.
> 
> Fixes: d83cee3d2bb1 ("gpio: protect the pointer to gpio_chip in gpio_device with SRCU")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260912123529.7951-1-tzungbi%40kernel.org?part=3
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Kent Gibson <warthog618@gmail.com>

Cheers,
Kent.
