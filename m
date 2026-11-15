Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794707020;
	b=cF4M319XoiOsDJ0HRF6gL8vVMWVe0ZFBrHSJwBIyp+tFe4I1YbrF59gRHHLu0sGhxqGY
	 VZ66b09XFmMPCay91TUKxZGFokfS5cVrjcWPBZ0l0sQoT9bnkoqo76Goi+ECqEy0H9atu
	 J9uYZpOU/biIXD5Vn9lFVQo1NTwLs6leaLAnNfk8HnpHEwG9D8azcuoeJLeiuLlQ53oeZ
	 ffjtftAD3y+tNqTomQ9PG63wuVxxT0fQrRZJb4t1nn9WKDtmNSDSZ/aGSt/xKZUr0fsq1
	 gqnl2gtnzzveREUIlaAWxgeQH+QNARTzYST/dtLwTQakhf/umeR6RobA/vcDuuPEajA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794707020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=hoZlbj0wt0HdAew9G0yycAAEwE1YWzSFVGwCqXFJujM=;
	b=fmbnZDmZTKve3UkOC8fYo2TpmrTP1OF2Ftyzylr4PP4C2ZONPuMv3UP1UjCeqPQpB71r
	 gX1U6LaS7yXQe5IdrjYVOuU1HjwrTKOWJNmOCPuvhZTvlB4uER3P0VlYyx5SmpJ0EjoM9
	 CEAEyotV5TqNK0YUL+Ob6mOd+dzu1P+6o43dp9talpHwnioJTD75RvwSnn7XEeTsGkqov
	 AYvVmXejbn8AA59EV9DaFuegYqQ/O7S8Bcj0dzsTgakoxx9Nn5MTcbUdm2hdOjgmCqU/x
	 H+bwz8k/UabdvB2oeTaczGR72tnjRu1hJ0jk9670LjdnT89vV5aHUBZJBF+oDVbyA1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ut8JYdZv;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B25606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32B25606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ut8JYdZv
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so2524703c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794707019; x=1795311819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hoZlbj0wt0HdAew9G0yycAAEwE1YWzSFVGwCqXFJujM=;
        b=Ut8JYdZvzP/nP9e4URUURnTz+n548KKW2eO1J/xalV7MEVuGJPADViFg9lLcIGeO79
         zEr9/mINW8SPP2a2hfJysswou0imFVVvkkj9rCyTDcC14GR6MRPnSAhrPgHnLP0GsuyU
         UTYVG7P1adIX4ERViTJOrlngvCGjsspawdIWPNJccDR5enzjN9b+drie2lDjlVa65kuu
         PKmXvH4wQSB3YehRdEjDuelHTO8CutNg5zOIeRayCVx8X3vVMdB6oO5Qz2ESzNZNQiFz
         gkK5bVan4tkGNfWa7A7Cwe5cX7NcriEJGHTTM7wBALz5E+IQ0HhhTo37wQxE4xKFkVYd
         se5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794707019; x=1795311819;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hoZlbj0wt0HdAew9G0yycAAEwE1YWzSFVGwCqXFJujM=;
        b=VyjfOFqT5l77Az/Fr/Zwx2+OMAxrpQeTM2rsiFJP8cz6/t7/IjdEQOCHgrMgVRL3DP
         fBAo47dDSr4KCavoTdnQvoQU7SA3K8sYVsAPDolePTJPxc7tfBRtccpatMXXRl+8arqs
         D65hKFHWuuq2blzWVGwBX6H4+9E6+K2xdHW2otNfJj73aaUzgYtvlYVmeWR5AcGoC2z2
         1dP7UvZyKlsDC4A8cMRzMh2DI4D9KBxYprlsnWEV+wjmiHwKBFgtemXYOLCgtfK0N0x5
         eT4ogfkJGNGZrUadByOg0rwiaoXFi4Ym2qKEyOOUUdLzvX+Eol8jFD7wC6H9iqTUbZ/v
         uH/g==
X-Forwarded-Encrypted: i=1; AL+hErETqtQLVshrTmubwppwAKzXKOb8ZhTdeEboCu3sb6+e53lHosWbaZCmgUFBN0MhkXfR00K8TluqXTnlOZg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rlFUgCMc1/arN2kzDJbQyappzsDzKpTUapcYf2lpPsCBZ9LWy
	iJYT31LcR/Y5QqS9ntGyxozCoE4RxiFauMcXIX3kRQ5aHUerdGcfZaL5
X-Gm-Gg: AYBFou2PbW5iYPCdQ2y1qWZ+cuyEfrVvMi7tel8vDVvCUITGdG6OgYYgSmhBec0oaxN
	M4r3JW0gLQLlwtWbIZyHg/nXZVzEwkmycBoE1XagmrzTGGFFJE0s4BsOkL/mBRpfiedLHjsJZiL
	XpDJf7Yo4/YuDyoRudGQfZGxmdvT1STM4zcYba0DkmgvVQrYGqXD18hbriNcKxAmsEyuANPgkb1
	b9DIRWgYquPnDkhcA18rCTjhIYwUk3x3/nRH0gfkIvJIw46ev1Yd4BWqS8JpiUgvAVM/kbQrhDM
	+J3OYlqVzOy/hhVkjkZuhhpIlD6h+DCLCFbXT2qtfr8K7qrbUNMkuTHW1m/G6QpdXipz9LQUORo
	uX3re6TqXbAyKJGfC0TgeciPUy4a6/OhEYalB6caPhZzqrDbBxlcXmzzZsHZb2cptBGsH3j+M0T
	aQtvlrRgMgF8GajV8PSORJPIi4OqBUiXIW0ENShGtNJaKniqr9LcO74RHXxDYwK5Sniuqs/BUKW
	lEL3xBiYuvJftoHVARbBEYskRTsJ7Bhf99U/zIKwveDKQWhJQwHKuwJtEv9VwDGO6O0+9Ot5oaF
	XF70qf2O6DOe6rmAdFgL5chSF0AUUHSywDzq1Bn+ZZ2ectzkoXXey7alLZa3z42RbOl9i2jOse7
	Fgb5HkZok6WgeVfiIgC1NhPcdQpJ30nsvEE5BPHd/XpsRKudDie7iNIFwuhmD1kA1rjAx/IQmMZ
	kModd8zVZORvqx5REo+zn0JiaFna2nmYbFY/Qd7/j50A==
X-Received: by 2002:a05:7023:c006:b0:1b3:a87d:a6b6 with SMTP id a92af1059eb24-1b503163eaemr6040022c88.42.1794707019087;
        Sat, 14 Nov 2026 17:43:39 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d8f5sm29990799c88.3.2026.11.14.17.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 17:43:38 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Gwendal Grignou <gwendal@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] iio: proximity: sx9310/sx9360: reject out-of-range hardware gain values
Date: Sun, 15 Nov 2026 07:13:32 +0530
Message-ID: <20261115014333.120063-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <avXeSbAEGhkMjMJa@ashevche-desk.local>
References: <20261111164041.341776-1-kapoorarnav43@gmail.com> <avXeSbAEGhkMjMJa@ashevche-desk.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, Nov 12, 2026 at 05:42:01PM +0200, Andy Shevchenko wrote:
> Now it looks better.
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

Thanks, Andy.

Jonathan, a related question while this thread has the right people
on it: the Semtech SX9xxx proximity drivers (sx9310, sx9324, sx9360,
sx9500 and sx_common) have no MAINTAINERS entry, so get_maintainer.pl
only finds the IIO maintainers and reviewers for them.

I've been working through bugs in these drivers for the last few weeks
and would like to keep doing that. Would you be OK with a patch that
adds a "SEMTECH SX9XXX PROXIMITY SENSOR DRIVERS" entry with me as R:,
or M: if you'd prefer the drivers to have a maintainer?
Gwendal, as the author of most of this code, you'd be very welcome on
the entry too, if you want to be listed.

I don't have the hardware, so anything that needs a real device would
still need someone who has one.

Thanks,
Arnav
