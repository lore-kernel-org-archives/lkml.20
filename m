Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890643;
	b=rvmrcdQg66ycXQRBrYoZ0YNGg+gmr5fldsDdEDNo2kSS5zP83oBFCIEwYo6L0B6x5PJt
	 KG4Tsp6mhqDH+fn5x4o/JbeWEu3sYYE5pw5qrRr91+gmP2Kq6/wHOZdDq+oE+cYCPJzm3
	 XfdzZlwdfacz5uypV8LQf4CUt2krpnyi47jVhPIEVPAFtu1jPjgkUFhW2yCtZ/Q8WJcvz
	 FzeFiOcVZeoNTZz9Ouo/WIVeVDkhUMMDYbxYn/L7ADSj0Fw66Wv5kNJTjCkmgJPAZPu3D
	 0vdGUlM5OrVSIkBesbxAc7RMS5ug+Twqu8XG9TBYJDCncfk//5Sr+fMslZL7jd8x86w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=LAh+fHBX5S66jM7YRVkD+ulSCs8XeJoMda5fYkmtiaE=;
	b=WP6B6ds64N6OIgBObk0icDCHdwo4yWZCLujAGOqtkGq340vA/aeyAzDTRiWOCBjonpDr
	 o/wZK1F4g9p2iryRc88AnsD/6X5EbNBf8Xpc/Kj1yqnUB4h8aKCNYu/u78fBpyBSzeWT2
	 RFhvO6nAwYyvGKPiHdqVcj8L8vnVNq8rA6cBO1nLsgaBULt3dXbaJ+W3djHvBDxAVoK6P
	 a4lSLICGdkCo75FdAr+QAP1p5zjgL3D+Kvyi39OdXbpP7oQbK2ZxuSqpvcjTsSvumzlyw
	 azgbAIKfOHZAd2uuIpKEMwmzrbvFXtgSJdr0wZ+HF0oEHDbYUCW5dRZdLqzzTU01riw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FFicVFFG;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F8E606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66F8E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FFicVFFG
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso5349793eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793890642; x=1794495442; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LAh+fHBX5S66jM7YRVkD+ulSCs8XeJoMda5fYkmtiaE=;
        b=FFicVFFG28O7DsFqcOvD49oFjNd+LS/7lAbf58ZGjBb/ARluIGEWnFD6Q2Y4X4frcq
         oYLDDZWVdImMpDkRCoTa+Obj4Oda/YGU5FfIyOd97AbrxpvgysKXTsFZfyNhN5/dTsWN
         bwsW70Zc8DDZh0BxIWQNyHuqk+3ihGVMCJ2AzXv+zzB7wHE2ir9g3VlcPAyYK4VNkOfo
         7zfMXGKq7ruZuazM2bjmZatE+7Ya5JoJCZtUJ1p7/9arTLOjUOqlE5qw5ZZROIcnHj9u
         XP+vba7vEW2rCDBgPYs65sFjmi3d+X6TW4yl/9VESaBUwFc1AGHWIXTXRTscx2OilQme
         7s3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890642; x=1794495442;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LAh+fHBX5S66jM7YRVkD+ulSCs8XeJoMda5fYkmtiaE=;
        b=B1KKlMIPewmiYsB8oufmb6TlgtBCla6YId9YPtdMkwtSJzV+0x5aEp2KEDC/xZ8Y8J
         WW67nfE80EuOGmIvymaNnmbXKl9U19pxG5l2gGDd+Xn6gl4znrRPVHX4dKXqH2bt3Lj3
         lRO+it6ukmjoikgI6LAwicU48lV7Hz4KKLpc9CG6eZGU3CA2ptgyMQaQIzTnWF2G7DmK
         BKFRmFO+bl6VvmtGj8gnDtvBjUz2fDPthT/IzzFr1Z5kczXtnj8t0t8//2EtUnCGEVwF
         6qFD47cZcrKEMeSvRRG7fEY9nXlxtgAsGxaHBpr8vyH5RXrUSTZP9/kNPqcoYGRYyToW
         lB1g==
X-Forwarded-Encrypted: i=1; AKwUvBxEILX30B1mXnHQef6hy+yKpImiycDOPdLdSsSXtR9tF4yrLnTY/9U6kWe9Hahk6Wi8IB6F4ucIcS32VDs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gcCD3IAysxiR7hZp+ZeBqHK4YrzkPTFRTPrJD+qfP38sQHIzY
	jVybe0hCvRI3vrA3y9LjlmPz/a64jkBjA5EiVb1fq/B7DlPQEO7oDfFM
X-Gm-Gg: AYBFou3yRCIED8+Xl5prSDB5p+YN2ekd3vnQfvzEsHQlRDpO9M3XJfd5iznJFVbbhxe
	d9NsE4XkDZuOHOqyf3XoSu1lf2cOJqI28EXLyENKdLJgxb+GOPzCgsOxxA0M2mm4qoAUxy7ox5g
	E6YsSl5/uXfkwhQEi2mPAyze549a7TGBBjx//jHp3jE0dwsxsJktQNiSEPAiGDiWvAn3mzmJD6R
	XKHgTgffci88Rg9GTNvr+W4zdPBo+ATmzyZk7uXYsw1ujbPH4OZIuFaL7A0gPOpGNfinVIjgbEZ
	oZd9lCLUdIbJ1UDsFcWj6AbjyN3lktuCFktRdySQ1Ra3m1UsEhVWnMAll9aKYX+XCFtPWw9J49l
	1DRiYWbZ78JKv++g4npKtyZXLeS+YDud+51DWmvi3sV14EmrfNJ7A8lhvykdAmFepHddNCSw431
	xOmjJWN2/G77bezKNtWo4RymYvj0BejoxGTWJo+7nMDUtwX0lMgOvVonI5tg8qC4JXgqQYafEqE
	RFSIXM6SosJv0zLuvZmKSHpdM7Bm1+QDXKzHFvgAfY97iKAYVw6Lf6dQoR2bXUcPUGJuMY6TATn
	Dnf4BSnB6hbYm9lhpcE+Kyb+3BrM0rxVnHWpfxQhtAmwm7Vu
X-Received: by 2002:a05:693c:6393:20b0:369:f291:49da with SMTP id 5a478bee46e88-36a4243f71emr28876543eec.40.1793890642366;
        Thu, 05 Nov 2026 06:57:22 -0800 (PST)
Received: from rigel (194-223-74-160.tpgi.com.au. [194.223.74.160])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b8eb3sm23369977eec.27.2026.11.05.06.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:57:21 -0800 (PST)
Date: Thu, 5 Nov 2026 22:57:11 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"Paul E. McKenney" <paulmck@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] gpio: cdev: fix waitqueue deadlock on chip deregistration
Message-ID: <20261105145711.GA92894@rigel>
References: <20261105-gpio-cdev-srcu-deadlock-v1-1-6047117030ec@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-gpio-cdev-srcu-deadlock-v1-1-6047117030ec@oss.qualcomm.com>

On Thu, Nov 05, 2026 at 03:47:59PM +0100, Bartosz Golaszewski wrote:
> The three calls to wait_event_interruptible_locked() sleep while holding
> gdev->srcu. In gpiochip_remove(), synchronize_srcu() runs before
> gcdev_unregister(). The latter fires the waitqueue wakeup events from
> the notifier callbacks, so a reader blocked on an empty FIFO never leaves
> its SRCU section and the removal will block forever in the former.
> 
> Since rcu_access_pointer() is a plain READ_ONCE(), we don't really need
> to take the SRCU read lock. We don't access the chip structure after
> checking it. Remove the lock and instead make the waitqueue aware of the
> possible chip deregistration. Keep the initial gdev->chip checks as
> removing them may change the error codes visible to user-space, for
> instance in cases of a non-blocking read on an empty fifo.
> 
> Ideally, we'd factor out the common code into a dedicated helper but
> there doesn't seem to exist a clean way of passing a kfifo as argument
> so let's open-code the three call sites.
> 
> Cc: stable@vger.kernel.org
> Fixes: d83cee3d2bb1 ("gpio: protect the pointer to gpio_chip in gpio_device with SRCU")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> I've had it on my TODO list for a while. I vaguely remember someone
> reporting it to me but can't find the reference anymore. Please feel
> free to add a Reported-by: and Closes:.
> 

Isn't this the same as patch 4/7 in Adrian's series[1]?

Cheers,
Kent.

[1] https://lore.kernel.org/linux-gpio/20261103-gpiolib-chip-removal-v5-4-aambrozewicz@nvidia.com/

