Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792975932;
	b=LioiPx/Gsdbj0jEAddnTV92WDykktO1xye09lqm0lellDYxja1uwqUILYZciR4fI80Jq
	 +q2nTUTh2pfU2W89gDgmM3KJClzhBZvuAU6b5eC78qKcqTVK3WxWetSgrnVsX1q2nB7/u
	 OrVub61mF+H3xBQ5iXPvKnwKY5tN9TgjMWNcpRfoZpr/ZyRymxeTDJo1zA+qlDF0GMFzd
	 bmdXjkQwCRS69Bj3AZ02XtiNTXB0ZQvD66isZngNla6eEeoknJqx7e3MmGFtV5CU+3rzp
	 h/+Twe7ePfREIo+TdVcSKt0x7IoI0GsRBl9wcpQQfKOd56DMU5uuzF34BHIWLAKnNww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792975932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=nxcPZJlNCnH66CCsQiTw+tT9KwwfqSrDOMhHONAfHsw=;
	b=xWTFsVo31oMr/A1YloXam8QIWJ9Q4sROYJSvIhmMRYeISfIYiskFd97PjVeKSsfPvl6O
	 /CVWxR1lb03//TNJops0h/bwnklInQk9P0mMDKt4mYhZszJrDXn6vyreVzQFNMWEsJR11
	 zjw05bweoD5ZbEHN5bwzaxh+OGIds6YMGMhEnrjOEw3ETSBFMr0hk4hIBJSbWgDUg3mG7
	 KjxH6leVW1LfcJ4qsbDsb9ap4fknzcTgubWqVQMxRqDWWK7q2CjwVZx6TxKEnlJ1EA+ss
	 K+9N2+xTSj6rlHHNfz2sCmJ3V+b45LxqttPgVyQXGgJ3tcqgqVA0RgU5SNvFNa0OlrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JLiv98s4;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172A0606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:52:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 172A0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JLiv98s4
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3aded3c6103so551359a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792975931; x=1793580731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nxcPZJlNCnH66CCsQiTw+tT9KwwfqSrDOMhHONAfHsw=;
        b=JLiv98s4YqkSGy/YAMVSYMlJ0woAIxWscas4fo700f/9Eqxx1lo+B+3hfO4/C7sgzX
         l7M/i2tyVbmDXrvILQZnQCI58XAW8xqPoYgJrpK76iUit53dWE14YO7GgqmOkiCfIOGU
         HKPw9MPL/xgwUYF5eeHYtbYlBiOvaw37KD7TdzUUEWCjdMLFHv9Z807DxXOH4LWXgg2w
         iQdbY9j8WLfNRw3v/bYtsf5EVyR45hvOMwQwiFm9SZewfG+sXpYQ7Ar8ZpBtz/2ujMJ7
         kSwWqYq880fyih+xvFpJ2xBwG7AcbahJ6fCX5hRO4G4oGb3qMTXTVbrQqeSo6WvoTPyk
         /61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792975931; x=1793580731;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nxcPZJlNCnH66CCsQiTw+tT9KwwfqSrDOMhHONAfHsw=;
        b=r0mHO1IufJOCDV9EO50ZBGiWPDVMWqrZJsmcmi/7Zt3haHVbzdy/cuhFBHhEIPteGG
         ghxkky4JjNX8lemPE0bZeEpDWhUh64d1u1lwujx5hOka0A+TDSk+7AVe5vhPnw9cTas8
         UJQ9I7MCraec26M+UCaGnbTjZHlg/umkvsosa1/n9QIOZYHFTZNh4AGRByZS56uwJScg
         MFzfdUVWTK3gorp1ttkC8JHNe2xL/MqJpkkxc+fzTD6tExy+9qQFU0Y+Kcrp5lVZzaLG
         O8XE/mSVdRgOt41bZpLLajQSC4F5MXA3FbZtrxdD4KFqTNUVItNTIWBkimEO58Wd59gt
         8TSQ==
X-Forwarded-Encrypted: i=1; AKwUvBznVDCUGPHsrumvM+BQmtBg1ZSi+b8bKBhaEhT13Zo6oHMPgimTJsqJ2pJljtKpyGg+Qi8YY+CSp3sRpgU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7VhYQ2PRWoXKcS9PDtlcPzKSFb5QL2XFhrGJxrE3G3nG1ewVg
	99D9h5hNuqIqAdON+XL0hvzKwDT+ky9MJBHE2KM0/AwYudxMw0PDo9uVf3O4Fg==
X-Gm-Gg: AYBFou1MoP9IhtMPwbrtf4XL4W3tbJ1k6/sSKua30MDvg4Iya3u4vSxZxzUxwyjVPiV
	um+mAEZC4xy9JSU62ceFhNtiyhzKErPl03MCB/e8wMz3mr3ocIwFoSST7qs2FbYnQKJ2AwX+s8m
	TVB4XVw27QZugF5wCZugP/DR2fkUAqlhiWaTFUVIWIMKOWokbAYSV+MaJBTzeSQN/+NEx00m1p2
	dmM8+jRPJxR880sN4D9qqQaNqpaZWXIFc1eloTAKuf6x2wVd14mmLzH1Aj5ykJHOGyd3uvSQnoU
	1DMdn8f8sAZjTUREkmhXt12tCGbyjyWY/Z988/ShrDnK7NB2NmehuEtFWXMCqm2s2ELFAmX9IZ0
	RNsija0bmYGOzUZiCpIokeEVcvU0dGzIEIXIgakfC+2OXZ/PmCtellIPMK5Wryise2C5cGFCocr
	V4kSLElQT/7V1Q96FfOI3XNkt6UVCqWLuM9/EIw5rWFl9EipTnLAv/64f/uy/NBBJNAfuwppOxP
	0a9/b5v762+VZs5OxQRmEUMjPT7EBAw3krUgkljvyeAa8ZNo0Dz0wF5arpLUpBVjmCEww==
X-Received: by 2002:a17:90b:17c1:b0:3ac:4e18:238c with SMTP id 98e67ed59e1d1-3adeb130496mr4206632a91.49.1792975931364;
        Sun, 25 Oct 2026 17:52:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebacc885sm6130747a91.5.2026.10.25.17.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:52:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:52:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jason Luo <jasonluomath@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/ucd9000) Add monitor types 5, 6, and 7 for
 UCD90320
Message-ID: <7dbadfc0-cfc6-44be-ab80-65a39f64c9b2@roeck-us.net>
References: <20260926220522.GA63217@DESKTOP-F7UNNQO.localdomain>
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
In-Reply-To: <20260926220522.GA63217@DESKTOP-F7UNNQO.localdomain>

On Sat, Sep 26, 2026 at 06:05:22PM -0400, Jason Luo wrote:
> The TI UCD90320 power sequencer defines additional monitor types:
> - 5: Input voltage
> - 6: Voltage with AVS
> - 7: Input voltage with AVS
> 
> Because ucd9000_probe() only checks for monitor types 1-4,
> voltage rails configured with types 5-7 are ignored, and thus
> are never registered with PMBus.
> 
> Add handling for monitor types 5, 6, and 7 to allow these
> voltage rails on UCD90320 to be detected and registered.
> 
> Refer to section 10.6 in the documentation below.
> 
> Link: https://www.ti.com/lit/ug/slvuaw9c/slvuaw9c.pdf
> Link: https://www.ti.com/lit/ug/slvu352g/slvu352g.pdf
> Signed-off-by: Jason Luo <jasonluomath@gmail.com>

Applied.

Thanks,
Guenter
