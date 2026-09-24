Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF164A5EC8
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266469; cv=none; b=HDIzLWND7UvUtaVPpoKyZAs3EIk6GJdF3SPRXI0cgly775JbhwvHx4JRV7dY1EVnlAS/r1z50DUvEHXpC7BSiML6TTcz8wDpBccj1WNgCDT8RRppf0OHNnGsYe9XpGhMMSpbzzHNsALE/ol4takoIROLbEwmz97tu/p6kJQYxGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266469; c=relaxed/simple;
	bh=4KycQmv/y3uSOW6bbpMEKLY5l9Z72oT4ziHVMe1/+K4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TW5KAvflT1WheKQG+DFVDi/4cdYbyT2uv2BQntCw+E44MiauN/pSUNcEfkI0BpW+mIP8t4fKF6No/Ip4igX6Cp8TVXMHcZyZOlZDIgW6gylGyEs3CCOSSwAnnbEvWSVDU1M8H/K5AWIZx6BxY1wWc+pnUTq8pKCKjikKiVxTe20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CQ8Rx6XA; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CQ8Rx6XA"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2db1ca069c8so12165895ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790266467; x=1790871267; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4N81IHB88R7EO6e16xVo7GeqgBSbrBSWBWPmQpiEIqw=;
        b=CQ8Rx6XA3AYjsUUT1t6pOx67T9ImQwenLU/JvI/0SzINPaXhDowjNe+Q2corE7Q8Kk
         nauYf5iuUny0EMmTVb0IaDJwOMJC9WiCxQ+IXII5De1Mb6TS8hsBmnWJuJoBTAkjJKV9
         4leE8jDf/FOwKkp7rxhwh/YlgPWFMKNHRK9I1b716fpinWOFX1IQYb8eavKEsOJ9SeZQ
         21Yuw4dbwsdIqbSEOA9f8H9o0gzV76eMCwmR4t12e0PGkaRGjFyjAaZGSFUht9hp9Kh9
         dFdaxPf3QcBDjkXcnRTB5V/qy7hxaT7WpF54LwjoWNW4yO0k+qn8vv4AXa2k7C3yENlY
         LQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790266467; x=1790871267;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4N81IHB88R7EO6e16xVo7GeqgBSbrBSWBWPmQpiEIqw=;
        b=fGLKQwCKHbX4AGHShyOKMZX7Y0JAV9kPelsyYGhKPxBr5+Q2o1XuEzO/HGZmCbo7nv
         g4D/ZrzQ1vJ2hrPH2jBZQrmeqhdCiLXopeqMMImNhNAvRAM6Cd0FdYLczTr0xDP/ZwlI
         Aqju+Brm4lARhad9EGQUaSX8eA4nCtaMvQjs9Dz8rZivxjHlKCD1bpm8nWQFeozCQNw9
         cG/a96Ak4DH0bQA9KlD+bXurbudq9Jpi1oqm4XoFcriPRx2odb1kWrDeRGwMouYnvF3L
         lTKWu5OwFjhKmcJgkrqjuIwNjeQWPFdty16Vv253RZdPHqSIzB6gmFDF6ESK8cK4/Fwv
         fHDw==
X-Forwarded-Encrypted: i=1; AKwUvBweIboRKso2jzoe3uQgQ5m/jj/kuDwXEYSNjirz+zvoq/B72zZ8a4/MdWufTA6Y0TZZF5pD1t+dKlcMGUI=@vger.kernel.org
X-Gm-Message-State: AFuF++lIb0cY2Re4Uxyg8aLrYEqXDlYC6+9b3u5cwTUNT81PiKB5AVpe
	6c1lbeRPjqDSqHttFrL+27IpP00cElaK19/1F69AVh9LDYQh3RzkbM+p
X-Gm-Gg: AYBFou1Rb/QoSSPzzKfqqzZF7c7tQXQxXVmEafP4i9WeMmOCI/huGUVYA4vCOPlG5co
	M5z7WMcHtcilrIO8JUjkzRVc7VzwI0qtx78FX+D3c9vMmSOvEzrkz9rErbIGmLI5fZj0px4ghUQ
	ZSIHfF8+/LhFxRontemUBWAqF0h/M4pVZI7Kr78MFAhcujg+WiRkuP3ogMxUxV4UgRHdkQWTTrd
	YPMJVhokXCqONRgO5p/HsAGVp1Q+gxfW1qJZPSo2kT8DVQpEAIgLe/I8YBjqO8sFctGH0GgBxic
	T9ZvRWbl0VTAMRXfeNHInFQergY2uJ6woQ1XHR9WCnHVPZxlTU+mwbOhqxUyNctOdp4hNMIjQJL
	7B9DAKcTjx890Z7n6xVktjJ70lzzlqiFAG48z7/I3WHoR3TQ1EYg8wgkTDSWNBy66CzvM7x7e1q
	SqWoLV7QBl+sl02agtB2rhuH4lEZYd0rbfTVeWtMi78Z5DnADQEgcIe3tPAzECG7yEoL7IbyUGE
	pgN/V01+pck
X-Received: by 2002:a17:903:2341:b0:2dd:c053:c20a with SMTP id d9443c01a7336-2df7dc19ecfmr25831085ad.38.1790266466910;
        Thu, 24 Sep 2026 09:14:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5d7a48sm30509205ad.48.2026.09.24.09.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:14:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 24 Sep 2026 09:14:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jiale Yao <yaojiale02@163.com>
Cc: Aleksa Savic <savicaleksa83@gmail.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: (gigabyte_waterforce) reject short input reports
Message-ID: <bfd9924a-fe78-4575-8e9d-2cc649413e47@roeck-us.net>
References: <20260924151133.1233860-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924151133.1233860-1-yaojiale02@163.com>

On Thu, Sep 24, 2026 at 11:11:32PM +0800, Jiale Yao wrote:
> The HID driver raw_event callback runs before HID core validates the
> received report length.  waterforce_raw_event() reads the command bytes
> and then accesses fixed offsets for firmware or status data without any
> length checks.  A truncated report can therefore cause out-of-bounds reads
> and update hwmon state with data beyond the received report.
> 
> Require both command bytes before identifying a report, then check the
> minimum length needed by the firmware and status paths before accessing
> their payloads.  Commit 47669bec44fe ("HID: asus: refactor the two
> workqueues and init sequence") added equivalent raw-event length
> validation to hid-asus.

Oh, and the reference to the other commit is pointless.

Guenter
