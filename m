Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794682361;
	b=pAcHpbP/6RSabntCU7XxtyomdyNtnQ6a5zvg7U9fnLFEDLbEe1DnJIaNInfwuGEy0Oft
	 1FK2Xx47HgZglz9hylUoX6wEBjs2VUJBLRUlp77P0IKV1zcSJ6ddzSDK40jYPNz0LHpnt
	 xnUWxjeurDtGGj8+zjGPZ1AstoKCTTtOEHKbYWHr+UMSXDUggwkHu5nf+YX9mcf4dHcXC
	 yjXjfJJF2D8SMq2ZbMjAQl40zajGNpSaRwC5P9W8GlZJiX184gMCRKeXsGdiR8J30MXlO
	 tGrxZCxZ+Nl0P1193DHi8uZx6pccI1BDGQqUFO2c/Nwh7lGqYgI2TB/pPGqiYcN7r7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794682361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=zLZrkub1iNWGcsUrG6AoUeFQUZNpk/XAt3E+7j4A0WQ=;
	b=wL7VEV3hj/2hiKs/uH780dwMHgdCMjB65tG5or7AbWZOAq2HAt1h8B79i8WbhDmqT1WK
	 j2iQxCbmMD00IZOspR2XYJwNz+ZRY+I/7hrQcF1EeR0f3oiR+St7FkgZVHUMCAM9Fnw4K
	 qY6+qHXF+hle50JQsDDTRqlRxiy39hHfB4ouDt5uEepXnEAB7H5tryZIZn+ena5jankfs
	 rX58GjSj/nMVGwb4AMCbGpswr+TTnoxLCypI29BgWXq+RiwD56pjlvR2PaA+WocQ4NURy
	 Lf3ug6zVsGF7OFQhvY32CjS94eoePWc+2mCc2BKQXUcfSfngJlShyOKlpQyBnRPbrMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=arXtzPsQ;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD92606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AD92606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=arXtzPsQ
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a210470b49so17045255e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794682360; x=1795287160; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zLZrkub1iNWGcsUrG6AoUeFQUZNpk/XAt3E+7j4A0WQ=;
        b=arXtzPsQu1EPdBNkc+LZxUglq1R5SLX4eusig6pMw8mF+uodO9SP/GKWtCv5ee88ad
         qzLLCcncsbqzHbficciXETtEUoSXk0O3jDG734ziXNUUd5P0ir6y/+0vY0Nl4m1iiWWb
         1dfONHj65NKkeQp8SG7p60nJn+aIK7MovYXtz1yh+LYHkqEQaQmexlw0q27HKRB4M/VO
         JqfgKJ/BhA3rzkBzRm32PUe+whOxsvdHAakAnA82iaBOKwFzdE9xkAr/lL1pO2BYZygw
         ++FL9n5o5ZPEtM5bgyxvyLGDmdmkuVCDFQAzDXRJ2B4bv+9K5k4Ui1hPl/nMa+DItM8O
         06jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794682360; x=1795287160;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zLZrkub1iNWGcsUrG6AoUeFQUZNpk/XAt3E+7j4A0WQ=;
        b=1QEaxW7y73tIWx5yeXgpTBrulODVwedyNy3GfkC5/HCRyQJ2ihSIX9Zn+76yeE4tPK
         qWkQKFRRCuU+vPghbgEY6XXYn+MkNLucx+fGyQS0f4GxnJ3zv/QB+rH4lz/aMDikV5He
         ds+DOPdNl/iPBtmcpGphxte7/nX4Q1qfHyzlvhVsMBlef5TqbviU3X5YC2kvtMqKsOz2
         BiHYqZ43aFoluHuWV+47GdiixdZU2agSGsRGpwXg5qPkVmUXOPeS/Q5ScAucLw8ganEm
         A8MvU93EqdKSNewyxtn1+QgMmFdOi4XDxFdrXWuTBPJGCwtXY59nr7tdK6SvOoj9vk6X
         wcOQ==
X-Forwarded-Encrypted: i=1; AL+hErF3SuXXvQSYzysUPKbSWrW+9f07G87+yq64MxQYHhd4wPypxXH6f9sQgPOc+VPZB169jFOdYNeSm7yrfwY=@vger.kernel.org
X-Gm-Message-State: APuU4Z82pSLXNHufU6f+3+Piw6NdRahOON9OlM4i2rdNqQgkFHYxYtew
	zY5QDpZqWrIVtGFAmSsbLWRDmT8iN+MVyK2/rcuCqVZG3NQ1OvaAYZMV0iD0dMye6pJgJg==
X-Gm-Gg: AYBFou2uScYoNoc9lym3LhFDeTsmriPMEKe0+di7PceNRkseI+rD9SW0CeEdPj+9o55
	RNcAZgeDqFfhHU7rZQw2Wil+ZKA3y7xeYBJEPuPbHKjgXKgF6WrVmEum9WVlaY7T3bR9T7u7JdT
	EqvGG9pMh+iSPPkA628xvsvxojmdybAYKZPw+nABgIuVbbqBs+Z17zlrBBt62drpMh8+4dY1TLJ
	GONT+eMx794+fiGbzlJkyq+RJps3XcYxYG9aKbZtut5dQ6oL7y7VbhKVUt1Z0a6acNDm3NY9ICP
	JVbeAYd2sBKlcbc1kvfhaPyWlrwWHxrsLUEzpeE4YFZHsctCaR7QIp2Q71TMA/KRZCDqs/Th2Yi
	41j6IwPHsiwqXKPm20085+EdEC915t1186I1mk9ac4Oa+1WbMLhTYCOcgz2bCUfmSf+ToH9AWhI
	Kg+778xDL+/0OtTzGYjHN9SaXK1djZxpITLt/fFJlQ3OBmb9DA1JFczmU1cKXSDfEqtX55ozPMk
	bL5DqiWC1Y0Bnrg1hvd7ctSNW/Hj4p/TILC5DJHXglntssq+fcusRrrkK7TzXwHWMUOJmlPiybN
	lqG54KsVwaWdOg5RxjUsLu5l1VCvdZO7GdzNlj6YxpJD9zCwkz3MTWs=
X-Received: by 2002:a05:600c:a14:b0:4bb:6994:abe0 with SMTP id 5b1f17b1804b1-4bb6994b7eemr9745705e9.1.1794682359704;
        Sat, 14 Nov 2026 10:52:39 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae4414sm161858265e9.9.2026.11.14.10.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 10:52:39 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Russell King <linux@armlinux.org.uk>, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] watchdog: Add ARM TWD (MPCore private) watchdog driver
In-Reply-To: <db3a09f6-a560-4522-9954-8aa63eb2d5fb@roeck-us.net>
References: <20261114-arm-twd-wdt-v4-1-5a3104b36331@gmail.com>
 <db3a09f6-a560-4522-9954-8aa63eb2d5fb@roeck-us.net>
Date: Sat, 14 Nov 2026 21:52:32 +0300
Message-ID: <179468235262.1897695.7261271002700550095@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Guenter,

On Sat, Nov 14, 2026 at 07:56:12AM -0800, Guenter Roeck wrote:
> Watchdog drivers are supposed to watch the system as a whole, not on a
> per-CPU level. This patch goes way beyond the scope of a system watchdog
> driver. Per-CPU watchdogs are handled in kernel/watchdog.c. I do not think
> it is a good idea to overlay that with a second per-CPU watchdog mechanism.

Thanks, understood. Watching individual CPUs was not the intent: all the
watchdogs get the same timeout and are pinged together from the ioctl,
so the driver acts as one system watchdog. Going through every CPU only
follows from the registers being banked, and it is what made the driver
grow (hotplug state, CPU PM, the races Sashiko found).

The board needs one system watchdog and nothing per CPU: its boot loader
starts the watchdog of CPU0 only, and the SoC has no other watchdog.
Would a driver along these lines be acceptable?

- use the watchdog of CPU0 only: start, stop, ping and get_timeleft run
  there through smp_call_function_single();
- no CPU hotplug state: on 32-bit ARM CPU0 cannot be taken offline
  unless the platform allows it with cpu_can_disable(), and the driver
  would not probe if CPU0 is hotpluggable;
- the watchdogs of the other CPUs are not used, one found running at
  probe time is stopped;
- keep following clock rate changes and set the watchdog up again on
  resume;
- keep the restart handler.

Fil

