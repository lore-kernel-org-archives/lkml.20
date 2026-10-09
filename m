Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1EE4F5DEF
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 19:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791574668; cv=none; b=tXxROmdWctYarqf0Qi/C3LJmR9s8tJ0rGEiKFLZSxaUToixS7zCB/V43UOGG8UNLuVQfR7yOL97n8zgUj+woYZn3X5p99S3jZpfJUWHcvz8m2XZlreDxJSUy1epo5uFGL7aSLhSS7C74RLJbyoloRAFw+h65tSA9dv0uxm6mz7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791574668; c=relaxed/simple;
	bh=2vzC5G85WBo1venNMaQZoCZ2FhcSm38JjrxzMjDDMWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q2AaEhaqkQCHaQ3Oa7AmfezbCMJ50nMtxIhzzF9hddZ41kKKbu/Cm7/N//vwh3fFxrPHEAxUmbdDHxGKKZ2uuBtQYPayNlaSOafYExLvR6Q91bTbltqeupu5DpNnJwt8RKbY+jyi0choi7ROFOsfhYSOrDXoHPy/4tNYARPWAmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bf9kUCL4; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bf9kUCL4"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so1828705e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 12:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791574659; x=1792179459; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aFY2YO2cb3qpWj8CQZTY+PYX53TlszA01EImDQNtvOc=;
        b=Bf9kUCL4IHWHdjs/Nv3jSybcEFpqUR7IaJhxTKEPHbDKKMFwSjs0AppPNLoG7uU5d9
         ARnJuECAPp9Ob96HqZXWgQSIzpelMK+crsscu+T87kJQv15bWc/j8tPvuY6WH2MJBS2T
         ChVNrLVrsyyw9DJYvv1ZXA8ioDU3fJy5TRxOMPvkiwdhPVJLiPqnl3iPyAD2zlVklijW
         260z+9or9q4vTkYUUvvbyQqlpB203klCwq1F5fZLYIAetS1OYcTNOSZQDTeiLgUYOTTH
         R0kQU5TaXhBnvZIJxNlXwp5FAsCnYjCTwivLqXV/6q1lHdgcCXx8h4WU3ymMaNzb+pwL
         BuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791574659; x=1792179459;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aFY2YO2cb3qpWj8CQZTY+PYX53TlszA01EImDQNtvOc=;
        b=XTQsr0i8jLrKKK/aRfx2z5q6tL+Xl0PyYcnicRNbuc9nCB4lYNEfqHrYqn8G7cU7Mj
         xjyYCVW0ElC/bSykZoPwJVABZmmHqopbYFREV1bOJgAV2HAS/vrccJtQ7er4Shh+zOb2
         M1aNyc8QBmDPzgZzf/aHhC3tdu8GXwbFakHrGE6oIzDVjCl0IeGg49gaWETBx8A+CCmy
         reyRhGK8yGMy+/7v0fR+YykHvdBFpQj7C87sSiGBbFUp1424U673CAf86t9LU581gzTw
         jL4tPhrVehonTO92D6i+nKE3SED9UkQ6g9lQyMNwerCLA1OJL1z10UF9V6hOrpPD70ZD
         wrzw==
X-Forwarded-Encrypted: i=1; AKwUvBwi7rARSl+fBKhPeFqpIqu4cycAR4SLt/DSfGKRBVeEW1F15Kpqa27++ZjQNrstpWmNbNACqdwEYhMowK0=@vger.kernel.org
X-Gm-Message-State: AFuF++n+glq/ryjeiLjY56hNDK/LTSTWwRuFKMkEuaj5nSNac9+/jGd3
	gkYcUDFV8DDUb15ly5/WuAgLJC4wJEj89QpazR1XI98cvDFy8PCVL87o
X-Gm-Gg: AYBFou2ppMeRPg69+awq6fLZbTydML1R66xrhdzAlE6SjSuS8S4P26fnAMqYjmFwUDl
	FzzRO6ekZ7AcafkyJvbLcETmGYqtAmGEodJKGrXPzYB2N7aC+yn3lSvZCGDi1o1jhAUzJtoLtqa
	Fv6hT5kFMXmfdzF5Xn1V6fpSEajNcchutAjTn5vgOWB2y+TKi/sF4UXEKraG6f0oMyNSGCIhMxX
	JLNSHIZM+d0MUgv4x2q3oaL4JckzrLTDPVWF5CljHjE6F2U6f24FcqlldTMgwwQTyOyACY4Pdzz
	URpbtUPf+szZ3IUzaG4K7q3Cj5PNZqIQ+JFmg9n3yNdl6Zkkn7G6aX2HvBfff/+dR0SE9FlV28P
	uxRngxd3F0xRuPIKqO+Cb/lfrodrtkSMqprTZH0jIvYBQyaPMfKOX6cCCHIcefwWA2hVNqL5Wov
	pO1X9/ZXbYvqjBJrOyA34/NAFF+c82kyOoe05ZKUrntqJvV+U8cUcJpOZvwX17FdNcOrtx1X6ek
	jom3RZwFPTydCytvhV+3c3Ws1tq3lhB41eTIUXBRUMlHOd1nsDWREt0cMqvdH95jp6aoPDSU/e1
	1Q==
X-Received: by 2002:a05:600c:8209:b0:4a0:2375:dc1a with SMTP id 5b1f17b1804b1-4a18e4cb771mr58738485e9.21.1791574658789;
        Fri, 09 Oct 2026 12:37:38 -0700 (PDT)
Received: from shift.daheim (p200300d5ff07190050f496fffe46beef.dip0.t-ipconnect.de. [2003:d5:ff07:1900:50f4:96ff:fe46:beef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18ee9bd19sm52018135e9.1.2026.10.09.12.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 12:37:37 -0700 (PDT)
Received: from localhost ([127.0.0.1])
	by shift.daheim with esmtp (Exim 4.100.1)
	(envelope-from <chunkeey@gmail.com>)
	id 1xFGNH-00000001q0Z-2qwe;
	Fri, 09 Oct 2026 21:37:37 +0200
Message-ID: <5771235e-fa91-402a-b5d2-ebb153872c26@gmail.com>
Date: Fri, 9 Oct 2026 21:37:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] wifi: carl9170: revert broken devres conversions
 for input and hwrng
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Christian Lamparter <chunkeey@googlemail.com>, Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261008-carl9170-reverts-v2-0-3ecb12089797@gmail.com>
Content-Language: de-DE
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <20261008-carl9170-reverts-v2-0-3ecb12089797@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/8/26 11:39 AM, Dmitry Torokhov wrote:
> Commits 23de0fa0d2a0 ("carl9170: devres-ing hwrng_register usage") and
> 87ddb2fc29f1 ("carl9170: devres-ing input_allocate_device") converted
> the HWRNG and WPS button input device registrations in carl9170 to
> devres attached to the parent struct usb_device (&ar->udev->dev) and
> removed explicit unregistration from carl9170_unregister().
> 
> In carl9170_usb_disconnect(), the driver calls carl9170_unregister()
> followed immediately by carl9170_free(), which frees struct ar9170
> inside the interface .disconnect() callback before devres_release_all()
> runs. Furthermore, devres on &ar->udev->dev is not released on
> interface unbind or registration failure in carl9170_register().
> As a result, both the WPS input device (whose input->name and
> input->phys point into freed memory) and the embedded struct hwrng
> remain registered after struct ar9170 has been freed, leading to
> use-after-free bugs.

Ok, so you just reworded your patch? Sight...

looking at the WPS input


|        snprintf(ar->wps.name, sizeof(ar->wps.name), "%s WPS Button",
|                 wiphy_name(ar->hw->wiphy));
|
|        snprintf(ar->wps.phys, sizeof(ar->wps.phys),
|                 "ieee80211/%s/input0", wiphy_name(ar->hw->wiphy));
|
|        input->name = ar->wps.name;
|        input->phys = ar->wps.phys;
|        input->id.bustype = BUS_USB;
|        input->dev.parent = &ar->hw->wiphy->dev;
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

the input's dev.parent is set to ar->hw->wiphy->dev and not ar->udev->dev, right?
Does this do anything at all? If not, why? The wiphy gets shutdown by
ieee80211_unregister() and having the "freeing" stick around after the USB device
is gone should not hurt, right?

As for the hwrng, wouldn't it make sense to use the wiphy dev there as well?
So the whole reverting can be sidestepped by simply going with wiphy dev.

Cheers,
Christian
