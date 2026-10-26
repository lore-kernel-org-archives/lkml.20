Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793047678;
	b=Z2tbVCc/BZl8QMbiaRAwJmGkI4qGbs6W+EuopXeshuh6Z1MsuBCDC7Hb9Gg6VlVSwgEz
	 2DRh6XTHb2Uymq/moWeAGfZvv6Azfi5Ms6J0mfWC5oeuV4yjVbP+YSYuy5I048qyIVc66
	 wmrea+SzsFV8LGis6hP2SlMZ5RJr+nkIZQQE4WnD9Sivveoo1DQ/OMoxDLvJpaYdN4Jt5
	 v/1jaeOm4vUX/phwVoFX56EJi9WUCO25AKrTLDiu6fFpBMtP+YZYM0StCsbUWQRRTYxF2
	 1fQTs32MAqRkheEFwlsNZ5oFulD8WMsKuz0nk5LDYkzNEXnO8S6JBk+5vLfdgSyp0cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793047678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=SBmctSjaoLLILJHNPpPv1PuNvPvq0whtOyZw1gjKndI=;
	b=su0j2swKwK1zHwvVrxIcz9ibtOiphAUkwRRa61iybyGaDalBrt1y8wEDJ6UmJzbjmBSX
	 d0ED+ed5pv3iAE0Pc+K7exddL3pIpcrWSW2j0VSywt6RUP8Wm36STB4FUgJbfPVIPRLNm
	 0LksBtJmYTuH/xInut60k+ONUqWLA3DHeWMBTdi0GNhsG5HLOFilJpKkqNVx+Lux/FyRn
	 BXwoTIScJCwLkpv55CPswQUO7OWCHMlUv/VDYBOjA6MsokV9wZtksu+81HPfD3JTY08to
	 gr+z8fAgB83H4WaHessjjWzX1msamjcRa6TZnyCif7/9Dx2ZVwAo6HP7cdFvWzRUDTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=irCKRdav;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAF8606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BAF8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=irCKRdav
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15ea896ddc8so5960416c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793047677; x=1793652477; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SBmctSjaoLLILJHNPpPv1PuNvPvq0whtOyZw1gjKndI=;
        b=irCKRdavJ1ic6tR9vsqNpCYqnE/IzH8mECl28f7EEWDTHhJizVrT9hOcsCXrlL6zhx
         NSTeoZXboKZF99CJNcnVHZdKUUSk5kEkbSSU5w1xeKbhNKltgulw2WPFtfizm714ls6y
         aSNJB9P8YNNi8xWqwQiUgEtWrDwZaXsZUHUpfMb0ZY8lDKo230xFmBsilpkMBNegfQP+
         SexeY5JCZOe+PHxJAJ5H9eePOWUKl5K/iewGcknIEklYTQHUg6UXLnMLfi0fxIqeoLXg
         f10hQdO7YPYUiHFezZ0LvK3EPCqgGJ1sN8RaFCl8Roj9LVQbseKNdPAK564zXvqY3N6l
         ftKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793047677; x=1793652477;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SBmctSjaoLLILJHNPpPv1PuNvPvq0whtOyZw1gjKndI=;
        b=RHY5n/IlPueBrnwlJkl0xI6QuHVuVTvVmChuNbWeqqZ0VwbXXvwoPC5QEMenxOaV5X
         SMsumpsRivxl/q5H070H6dpgCLFJHbEjOtCzsJI8xzfxLaZwUPIPz7c2kfflz4uZGY7D
         8FtN/tLMncMiPPnW3TqXnkf6j0OtPOjyjf0ycjLdpbZQhOQRkZeg5emVzGjoSEMYo9OE
         KanTURBMoqg4hc+HBlAnDavRg+pMdo+ZK9GeXz+R1Q8024vq8EHRb7UPv8wvUk8AWmXi
         Nl0uxET05ldHa8DIxI63VLb2vPhFUpDrz807/IjpPXrTAv+lqz44KnAOFJ3khWC0Tpc1
         rARA==
X-Forwarded-Encrypted: i=1; AKwUvBxZ3EJESzYUgUXm3ocwdllvIBpDk+D8TO9pYkAmYoUsQC2/ureLiOEUQHuZ/QZeNsXqxaRlIk17fEveoaY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXrHEtOynPLcZ71WbBlTxV3AmuE5GFk+5cf1OKfW/bShh1XwQR
	lnQCqptyBp06yHB2wJ4E5ibQF0yYWog1MA/3y2WYoqQmqedYL6+L1aCw
X-Gm-Gg: AYBFou2+tocHrlF3qpiiIcl16UzgHRfVdSJ2ICbD5TbEC63fwxcpr0+oj1x68xmvWDi
	KIXsWazeQ1PAGQ1YUt/pmVawmbNwOmgCg6GYoaUUB36VKDH7zWOFOnWVo6ymJuPwXbtYkkWwnsG
	+/c+Zpxl5h1XeFBNJkRFp3jW9kOmYwJvMDn26TkgmYKBlG49J2JoLzBFHQgvQuNfzARiGGuiZS0
	nCnGvvpo4507kPrkv9hjV1s6hUWPSRGtA6zFxEAmdx7Pu+1bONGUYwsA/0RHCZjXSUM6tRcS0vi
	OczhIIU5i+GURHow11Ptbuc8EYfQUOOSusrARvrUEDA3z2/4kS2kXeR8IimwUKzWRM/0cQLS4g7
	fTFS0cCl15C/r84rYNkq6HDd2K1zYwGZKWz2ld74gsX7HaDNYQwYhMRaAo7jAtB/MBpZnmTgG8H
	MN+t01nL1/gPHDDx8FdVXnxMPsR6kzUepUGOSBRifUyxQVLCbHCBo9+3FIprbrUA9AWdpAoRPvb
	URslAGP8cZQo/XLFZm4qNJ/zi9Ehqm9VA5BxBPZjq9bp8E/ibqw7DSv6Kdkgh1wSKt6Ow==
X-Received: by 2002:a05:7022:5f09:b0:15e:6541:3099 with SMTP id a92af1059eb24-19933e10e21mr12324517c88.7.1793047677064;
        Mon, 26 Oct 2026 13:47:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2eefbsm27586280c88.7.2026.10.26.13.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:47:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 13:47:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vas Zayarskiy <contact@vasily.cc>
Cc: Aleksa Savic <savicaleksa83@gmail.com>, Jack Doan <me@jackdoan.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5 1/5] hwmon: (aquacomputer_d5next) Avoid truncating
 scaled sensor readings
Message-ID: <494625fc-168a-42b4-9591-cbf5fb2e981e@roeck-us.net>
References: <20260927191316.4137752-1-contact@vasily.cc>
 <20260927191316.4137752-2-contact@vasily.cc>
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
In-Reply-To: <20260927191316.4137752-2-contact@vasily.cc>

On Sun, Sep 27, 2026 at 10:13:12PM +0300, Vas Zayarskiy wrote:
> High Flow Next power is reported in watts. Multiplying the 16-bit value
> by one million can overflow both the signed intermediate and the u32
> cache. Store power in long, perform the conversion in u64, and clamp to
> LONG_MAX. The other existing power conversions fit in a signed 32-bit
> value. Return -ENODATA for unavailable power instead of exposing the
> stored error as a reading.
> 
> The power cache is updated by HID reports without the hwmon read mutex.
> Read it once with READ_ONCE() and use that snapshot for both the
> availability check and the returned value. Mark the corresponding
> updates with WRITE_ONCE() so that the shared accesses are explicit.
> 
> Widen the shared current cache to u32. The Aquastream XT conversion to
> milliamperes can exceed 65535 mA; clamp its negative conversion results
> to zero before assigning to the unsigned cache. This also permits devices
> with scaled aggregate currents to store milliamperes directly.
> 
> Assisted-by: LLM sparse
> Signed-off-by: Vas Zayarskiy <contact@vasily.cc>

Applied.

Thanks,
Guenter
