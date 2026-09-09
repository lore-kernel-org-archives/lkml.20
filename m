Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A929443E06E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788953861; cv=none; b=jMJFo8Lx8yeDyGayt7iEYLbTBvxc3smaSV4XizlERj6FytmiPO9a+lEWyKacCDQkzv/xu/nhutyfTr9a+U06MlQM0eAsymAlOXCb9TAJxQyDm1oRJkLqo7hBssJYzyNxNpPZoeFV6bjJI+8IMWflRBXktTsZGoVqK5qc5s9hGsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788953861; c=relaxed/simple;
	bh=JuQnapAhvZp0CN8+GfiQfqnFpJHWTmpa2IFU3aLBqpI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nasTWhCGz64WM0LA3ANtwONbXfXN8D7RO/dLj7rOlFdg4E/4z+XNnzOnmEnk8bNjsDJN9ohnjtCbPiEYE9onTz602iQV394pkp3ha+/mvUSOVuE8dUXoCmXvdYLw0/L2DwEOosbC2aRn+b5piA0bgGIgMszT2ahknwJMbNcdL/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PKGEG8JI; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKGEG8JI"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so4243691f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788953858; x=1789558658; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yzaOs9HiYT+48ZefYVd1sW8HRaJIRxb+CV+smGN/KOA=;
        b=PKGEG8JILrEBCoJrLKLmzj69hCVRk2KE51SObef8swMHZNljThXmMxC8Hk8Q1rFZN3
         V+eFGttMP9l9p4NPEdctsKW4hZmvj65XKywqJftiqQswsyt67PRYqG4jOTDF4+VvHVxB
         /aBd1L0pdD+2uzWcXCl+UOgT2YrAmTN6U5U1yGSyCZI+dA8LEGiLq2JrQWrub+8O9D3N
         XURkQi4iCykkYRBrpXmZ8dhFueGMod/2iyRgLh6Z8mb7QXKl6fD+SSLQ4UFntixRSmp5
         AmCV4oopXD09C4ZQETuAbD9fSzBTlFt+yt4rR8F9HLcYFtJ/ZmhzQMPDtti3RIcx38L7
         uEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788953858; x=1789558658;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yzaOs9HiYT+48ZefYVd1sW8HRaJIRxb+CV+smGN/KOA=;
        b=ASlwsDVSlLPVFVnSTzDV73f2esQ1tjqNDweK4TaUdTk+MtnBGOc3qR4nYmEddlsxov
         3/zSiXB0HXv7csuj3tEOLJP+a7T3KLkoDFvh+f1X79gBPLHqeUwRG5ON3gBi0bKuqOaN
         HUUOXbYlHxHKMQf3+hsQN9VFOB5+5fIyrQiXr9L1xfzZjkmF/BGtRSaQVC724mKJoAiU
         57ORiwowd3NWWiUfgL+nNZgoRI3O0A3KitSSzSRBZoiZhKCREQynBHJvVTaCbOwqbwMd
         rJS2KhsinNOVsK3BFMnTIF0bnyNqCgy6kRyGQN+NBXYA7Ic+LmqWf+jNWDvEoTQc4ndR
         ko4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwW5eL/BZA8UtXQ0c55ex5BgZ2dyrk55SG34da/njMWD7blp2QM7Xn362VNlU85bHLYTJg1jkw9Dv4OJAY=@vger.kernel.org
X-Gm-Message-State: AFuF++nZ7mpdgsaVOIBprNfnhPTQyvUz/fRBBaZuLJnCQ6n1i10vEapQ
	pUEkU+1yiH5XGdga0JwYyR20IannAynvAeA2WydUEn+dtuiAknjJ6VXV
X-Gm-Gg: AYBFou27gvdc12MAS9RbdI/TpWpwcOj2MRJ4zSFoWxsEjzt0bBAdPLOhzbRXoji784s
	Cszf5s/yYBEvGuo3/IjviB1+SwE7FCtovGNywAtPB3z3T9LHO4V2kKcX8ynHOe+3oMEDGn8g8Zg
	X5mbheUJ6qGAqPv92mRB4VtsPHqOZkS4SXtqRSacZA5/Q66dirIr/MnyPqGIXww0NZoEOkSop+L
	QgIC51coqTnwiaLZ9UOGAbWQK4zbr36XoM3wfFDusF0IY1ABCjUeybEGpuQ+s4Ggs69H9d5hmV7
	+vrV0G0vmplgXPKiS2vqr8pbHtlyqmXVYme106oO50ihyQ0aRIfD11g0g19P+02Aw9JZn7Zs/jl
	hhglP8CZ/Q0+yxgnu37zJqlovRgjepWwShlA4X4D9YrR/JfQUHIA9l85S9B974v9F2i9GnGaH0g
	5Bo/jNUfK0Ycvx9pvvuy/Xlmc0/CF8jyGZqs4GTimE6Np6QaSdPzivTg+vxH0TPeY5Nxt5a8++Y
	7NQcgEZOP7ryi9kUKXOjDLnvsaEKFC03OhScgI5kh/KDsqzGiu2mtEboFVJfDMxiaYHyBnwz48Z
	1luF1ON1l9GXkAqgKC5EyuHJHx1PjCt9LvcussbiBnXDTCnTvAL3+ydXxknXV4+iTn6cjsC8JTU
	jci4wFfq9aMnVWzASP63UAqNIxVfDIwQ5RsFPwWU0CqKxLZNem9dsJohYWsZ5LFM8KGcya7CMf3
	HRKXUaPEUy/GJv6j4=
X-Received: by 2002:a05:6000:644:b0:484:416f:9f0f with SMTP id ffacd0b85a97d-485870872d9mr38224650f8f.2.1788953857608;
        Wed, 09 Sep 2026 04:37:37 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858dd90e1fsm46092542f8f.28.2026.09.09.04.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:37:37 -0700 (PDT)
Date: Wed, 9 Sep 2026 13:37:35 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Kim Seer Paller <kimseer.paller@analog.com>
Cc: Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, "David
 Lechner" <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, <linux-iio@vger.kernel.org>,
 <linux@analog.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] iio: dac: ad3530r: add support for AD3536R
Message-ID: <20260909133735.000032f9@gmail.com>
In-Reply-To: <20260909-iio-ad3536r-upstream-v1-2-16ab930dcee3@analog.com>
References: <20260909-iio-ad3536r-upstream-v1-0-16ab930dcee3@analog.com>
	<20260909-iio-ad3536r-upstream-v1-2-16ab930dcee3@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 9 Sep 2026 14:19:10 +0800
Kim Seer Paller <kimseer.paller@analog.com> wrote:

> The AD3536R is the 12-bit variant of the AD3532R, a 16-channel buffered
> voltage output DAC with an on-chip 2.5V reference and an identical
> register map. Add a chip_info entry for it and the corresponding SPI and
> OF device ID table entries.
> 
> Signed-off-by: Kim Seer Paller <kimseer.paller@analog.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
