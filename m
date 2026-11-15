Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794710649;
	b=0RvX2uqbCMr1Z86XH65heZxXL7g82vonaFeX6RJ4sBtPT13OZPsScAAqQ5tZE0uIhSAE
	 fd3/ayoKBXZGoit4XmgDTTsM1c4KrNK/eKv/Hipu45rH07Pp6/hh9NwPGBPkGntiABlFx
	 xLFTu3PVAuiU4CnqKPkoj5SzqjKRO8b52j+sic0cZIE1IKPwNeZK8M2d3iEaXEbcwXYJ4
	 WOGgbygvlFGqRRouvPq8q+xKgzqRin+kh+kGFwuDDidTXrLdwCe/4zGNo1FzCjA5y0VDr
	 HZV1n9yDcD9OHzAy2eEhWwtciY8Y60HFoccDkV55LVJNTj72seafpM/hprlGYBBM1rA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794710649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WImIugUvsCB3dULRzrcWqUtpzfjQNdC7aiK6me5zFHM=;
	b=swzWBqot/FSs2scQUccnhDIawb9elVb6Aeb7BLtm7LVdtX+FRsHoO3SocfDQ6ykZyWif
	 yfzMjv0K/jjT3UJT8GgPv2TddpeTJl+k9dtV3M5xNqdLA5gphIAM84b9e3OqQPkL/33Nz
	 QTGGLSh5mBXPaz+fszZwtidm8J7cjPUIUgWlo6HlFnNjlGfRFKdTESQmNojyfmO0wqeq3
	 ZPhhT7U3MNK3aYowRKP81idjT1ZRWQ2HmKUY7TzUCJHNLvwfg7PJOVkL3MHM/nj0TDxKT
	 OZwNLXqHmD0qOG9sSyPfMBC753lsZYxC1uS40GU6fPebworia0UZsEdFrhrZbkpBbUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RJnm5XLx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B73606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58B73606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RJnm5XLx
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3adfcafaabbso25613931fa.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:44:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794710647; cv=none;
        d=google.com; s=arc-20260327;
        b=O2MWMUeMkYpcu2katVDVS2nsGTm1h85t3b+0uBqVy3Bfv2gv7OTeZD4vEMiBNAYBsA
         TUZ53s87g7VXSYtnhUbdoE/MXv5wiihLuy+SNm5XAKDt2DnDKkIvJhNSjPFWbzC6IjkW
         OFrIecXQpHQx1BoMEmAU2WxRNWXtY0ri0B7s9IRpaIrA4n1pE5eT54YlYQNoPP3psf5B
         mfH/xBk6CT7QH6jpw1oEZJdLucj3mA+iBX2cqL6C7lo+Xi5Hn3lu4tRrCXmOL+sbeWNC
         qEgANk9DgG1K++ZoSIoWpBfVtCxTjS0Ic6NBUuKHjPnSSSYmCMXIkkbmMDmvCgN4Bevl
         TpqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WImIugUvsCB3dULRzrcWqUtpzfjQNdC7aiK6me5zFHM=;
        fh=cdrMP7rwr3LYwTBVcVHQxHs8uNhFEuhBePL1zPjFWKs=;
        b=RI0kzoCX6dvXuG0oOo5HktllfC77DWMBTzWI7B4QKh2/2nk6i9klFRaRHp1HXyYtLz
         Fyca7wdvcchKyL2JJ74ddUv6Pq6W++x/3r0SK/raiqfHgVVb5rZEVg80QGgdUUsQ42qV
         kO6GrL1h4MgDsWaO27qjnETOAwfIUqGR7hb5/P+MDB1BcJ3KmadAkr7L5yKcPtNw+gQK
         kNkB40pMHcnwEvF4t7aevT1A4QSs4da7p68z6vJYEvSKzE4PJo1LcbtfegChEbNtCnIk
         Cvte6X1+wbZ414yqJwON2qvSLEibdssWRscdBj4FQeBQFFOvnR6vGIkuwHYUkzVIGl9D
         2NQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794710647; x=1795315447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WImIugUvsCB3dULRzrcWqUtpzfjQNdC7aiK6me5zFHM=;
        b=RJnm5XLxoNK866TvF2CkdY9AW+tb0cJ1wYfWzlZZh4X3OnWmWeykxS1NvAKwM8nW4T
         R0GTMYqQAqdx2m+VPUhijNqDi8cWar7oJaJKzJJHy3fk2ZhupkgqBuEO2Dm1/9fLTVli
         B4TTFx8z1iautbvXT5v2AYyLPiC1D5IFu0cThMCSZq2yjUxVximJ9/eQK3h4Y8PNalZJ
         T0bhpinyLP3mCG8jD9SPRJAwIQG6O46nBkuNR5hDYOKD8kgPQNHFOx2jEmOVhY8xIlii
         X65pjY/kWAjU8ccru4oBjZFJoMbyWVKnyH3W5/nrAP0JqE/t4MtEabZ0HgYpG0dll8c1
         OYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794710647; x=1795315447;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WImIugUvsCB3dULRzrcWqUtpzfjQNdC7aiK6me5zFHM=;
        b=d4QEwnn54ZMdbADxgFqZU7yS3OOLCc10+RKrYlQPj7dWq2voXvj7/XCVupgth/pm3X
         YLW1XKHOVPxeEzEgswt04g6n378UpYYsR+fXaHkGI1o4WDXZAg8Hbu/i9soums9t8cBW
         MhQUjAps3IkpTyp2+vDZC9jGMZBkd+XcHiI1hgE8uEgULzHqyTB11W2PiFmD/umNYVby
         hBlgiZ0lXxvn5kEANTPE7Llexd3XrZ8BMT+Ef5OyK+vamBwnH7LlcWVAJl3QQlK6wzkr
         eMzWFUmfnVfDhxpXP98bbw01dnGKyEzy147df4vF4ylCQCPFpeeEnonY7zSj97uXP2sS
         1dfg==
X-Forwarded-Encrypted: i=1; AL+hErGSkA+HwlODCvuSc5AFzssCRPm9YO54p0z8CV24p90juTTJ6ZOpiwXfFcLxD+ex56XP4XujuWDcVxmjwsA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xz1axiggoF+tvdaqHDLTHnV/7MUbIukfuFiX52OqezM3YKdtR
	q8Egaltm4d5dEUZb63BJrMFMBc96FJF0tWlK0awaku2V3BSuziIHYd5cyj94G9OW92yKTzFb4RF
	DOT0Pf2LDRmxWrxy7uztq0o68JwHQYow=
X-Gm-Gg: AYBFou3UbrVHB1/Iw4xvlKsuzukF6JT6iKjb1N9HGv30/UsYObVUyqkJFCU1HFqW3CV
	SoN0/OeREaRRsfiY+8VpT7DCQTEgiwlUN+C/93G5msmYXO/dxniBrU8C4fuDJ9g92VPBpHUKzSa
	voPHTQJzRR5cm042U9b5ATLnP3gC4r7MmFcZCc0+rqf/b5yH968qJZFZ13oyQNeluj+YfxtJJMr
	Ee7Qq2bz03p7l7IqVY3/obLYEFt0+Hb5Vay6Pd17MMBjXdD91ctBpBUGEHXNsTGglJ3YeFGm3rP
	+25bRT9auKc1bBtNWorz0nHtxCzzw64ar9ja6U1k2DV48pvPFrd/oTUtUHTv1MzkxRgYd6G+SL3
	2GjfuyCkG5Bb7QpOED8TlqgAsnytxUeLA3deJrYQuL+Qe4rYyENwGlKF2oftcYaseYdIcJoqHPH
	9E4P5+9BRkNcniVx1iaaFj
X-Received: by 2002:a2e:bc90:0:b0:3aa:ee7a:5466 with SMTP id
 38308e7fff4ca-3ae2b4f52f0mr22163651fa.16.1794710647252; Sat, 14 Nov 2026
 18:44:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
 <20261114-marvel-env-v1-1-890328e4b7e5@gmail.com> <4d69d3e9-9e05-485d-87e2-428616cd5d9d@roeck-us.net>
In-Reply-To: <4d69d3e9-9e05-485d-87e2-428616cd5d9d@roeck-us.net>
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 14 Nov 2026 21:43:55 -0500
X-Gm-Features: AclHuK-rDAmxPKOpteTkagDnbYP3PTwmOyt-Q5uXcex0poBTc5yw5ifEj6zGwJs
Message-ID: <CAEdQ38E=+Yb2hJs3L1KHgR1Kbe796NDD2z=n=7YytQ+uiJJWEg@mail.gmail.com>
Subject: Re: [PATCH 1/7] alpha: marvel: report environmental events without VERBOSE_MCHECK
To: Guenter Roeck <linux@roeck-us.net>
Cc: Richard Henderson <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 6:01=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 11/14/26 09:39, Matt Turner wrote:
> > The service processors report temperature, fan, voltage and power suppl=
y
> > alarms as system event (0x680) logout frames. The frame is already
> > classified as reportable, but without CONFIG_VERBOSE_MCHECK only the
> > header line reaches the log, which does not say which sensor or what
> > happened. Print the subpackets unconditionally.
> >
> > Assisted-by: Claude:claude-opus-5-5
>
> For all patches: This is obsolete. Please base your patches on the latest
> kernel and ask the agent to follow AGENTS.md.

Sorry about that. The series is on v7.4-rc1, which already has the
removal, so the trailer was my mistake rather than a stale base. In v2
I've dropped it from every patch and mentioned the tool use in the
cover letter instead.
