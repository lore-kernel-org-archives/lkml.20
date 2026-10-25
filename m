Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792907577;
	b=XBvW/kqV8L1zSVNncksoYmiOLRik0Zfy3dRiCWdBkaD0Diavpvsp0pmKpMg2t4M2GedI
	 FSGGmV5Gy3aeiqxTnjgV6wjlYQjaiLfgc7hpMXdrPC48AjXJYYvjiJqjxyhkXtc6vaBJt
	 weEEUvctaPcMA7rGEF7a1ZVN5uYn5L/fW7fRHyEiEtNSNtCL4nJ8I1VWnMBu73Buj2o3n
	 alZ4lt1ShzJV/m+r9mnBoEabqWCeG56dvpdJX64E6HvSMVNzODJpRHN8d9d3qWi8TDwIa
	 mZI9Rz1kNwokC7Qp/wfanKSav6qIF8eNXbDrfC54AjHFp9GwlJvcToOEbRv0MbZ+1sg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792907577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:From:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=4rTPGcAaNq6kazh+6sK1ZLKNoqk8Ps4YF4dR/5hZ7P0=;
	b=YCq5OK9B3T/nDn2YUucHHO/I6ccbpi4ccp7aBBMKAKkrlnaIcV/VbquZyKbhQK7wH0aR
	 7cvDWHyo59PS4itneHQ09zzQ2t3dobH/Cxtei71tTIXyOAyBYL4/tc6ISXlWjlnhx66pE
	 4jgZVw+IETG7vk8d6ctfp0ugdhqTi7Ki8Q6yjF9cjwD6TsPyAwKqWh2Uy4BymBOLAQopY
	 14RESNZeh44G4y4MKmJpNeDp7W/nkd/JVu8AyLafi3tTrXZ1FYkqMF0xZGoPw4lvsuh1D
	 HWIPyusiin0SUq6G9t62YxojsMxssF2Vu+tz3uT0vV2S/3oeTZvZc5jVXPY4jmjMCxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="B/8LQAMh";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B989D60A2604
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 05:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B989D60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=B/8LQAMh
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-98ff53fb739so1305020241.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 22:52:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792907576; cv=none;
        d=google.com; s=arc-20260327;
        b=KysrQPSEYMRgW5HKs6OwPVCtSAS6Jazcb10dFhsNnMP5MpR095AzDjDSooJ5683SgO
         cIlBpdEO+jb7jgZoqAqbPefXKdaak3dNxNPHPpasoPuimyhS08xH9qpm2Rny94iwP5RT
         QZEOcAYkCCFXDolvoPlj06fXsiKFRVE2f3sgJvJPknCC2EK5U4//2gphByeg+waoPhj+
         1VQcajJAw3FhncyEBuFuXkpD6g6GBKUKnjT1n1cEBgt42OfHXg3oRSdc9qePxENBcN9z
         pu8TV8nbOBDVAnhnLHIoIymqQ5gC0thPHyOtE8EVp57a12QClbZcDmwAFEQNkOpVZQ8W
         pmrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=4rTPGcAaNq6kazh+6sK1ZLKNoqk8Ps4YF4dR/5hZ7P0=;
        fh=Wb2MBBwErYPxtzJJxYKK5OgEj8J/xZ6YfZkDKmpmEFc=;
        b=cbw1zw3hubhkNcUfY1lu9y3Rg4Magd5NxlyZr6+TJH0QNyEi4S6bg3XDLsyQYgrSL2
         Xiap7LjVi8Q1vPaQiT+/44B94EvRMPpgfGOsEy5zW9L/1rV2yoYJ4mERKQkgjO6rqmS8
         s34WDhmCz4gQNmnLa0mcqqXzuapxUC5cImYvfryQYdxYPQ6tGaA9E4lYBM6dxfGvk0v6
         vnajscZMfyocKtgItn36u/UlUmyZyNwOv8wqNpn+u6W9kInf2Sn/eWKc6aRRX69wbq8J
         R+zKZajlk7OLp/X8yd4QCW1xme69Gc5bSnkOyELOZ66gwMXCzrmJ9WIXv2HcuNYgxt8w
         HYqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792907576; x=1793512376; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4rTPGcAaNq6kazh+6sK1ZLKNoqk8Ps4YF4dR/5hZ7P0=;
        b=B/8LQAMhw/nNihjwcvbGlGYQK6KF+IWGos9cPCJLbYNLDRTab1lhAWpjp8Uk+AlLLG
         pCdy0hUqgMuux6eS3j3BJadlFlgNCvSX1zoTU4RGvkJtr5SPLOWo5hs91o8G7ASeoY7M
         Vb2ARlgoyRpGdfdg8DM6Gs3a8JNLwUyjtD6HVc8y801f8eYbNL5NADZzqatbgVTLi6Or
         tGhnXPbCPDYUEbq0g3VOpR4ATvOquqlkp87cl55qpA3eRFWpQVv6lGBViKuPoti57af+
         4yXtBC9j/xPdHhmC4NGh2VPcVGvYwF5D9Mj+E1AaQPHBwsepdDASFyDQcDDxMDVv/uZM
         4MGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792907576; x=1793512376;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4rTPGcAaNq6kazh+6sK1ZLKNoqk8Ps4YF4dR/5hZ7P0=;
        b=jbKLnI7Kofp9iq22bV7nXGirulFsqR3iMpNXZD11uuCCmO9uIj2IZ4fit+SHFKtBsw
         lf2Hz2Wn4hmsJj9FzH07TWZ3BaZJi+S7CgmzApfDHSioF7UUmbCYHBxe1+9xulgR0snz
         p50sD4Co1/GtmR2DYqDwlCuM5A713hd4ZYRUKayzzpyk3ydecvz/bajke0wJAGURWo0U
         G5WrWcaaF5rURANZ+466ib1aC7vdHgB9Bp8xNJe/ZXm6UcZ4JTRSVY3ebm0v3C/VsJ8l
         Fy8+tQAcBQH8q+iGzJHpzf6tx7/TepDiVhO/czFP2iwxRkkKiA63jpiORrO6pQg9/0wC
         cVZw==
X-Forwarded-Encrypted: i=1; AKwUvBxMkHlKuHhCLaKb+JwlMKFiXGINVInCzcPVMGrAGvdvORTqb+2wtomFAW2rMqaQZ1+gX4xp5HblqZUGtQo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLe1MQY0FQuTt+ArtaRp3j25d8D7ni6zkiENz33Z01xg5Wr0Fpn
	V0z9qvkKhr5oAbeGHzM1hv3WmEVB6/6IzChBLQX4Z2wEd6QMEah6hs9PyUmgTVK9KIePICz69uH
	4TZ0O4fvK/ZmChAFwQj19BXQ6PUGVruk=
X-Gm-Gg: AYBFou3WbUaqQ0oyUb2eYCV921oiFRTjq3gRNh6F6OlhPxALbQQEmwtNPCNOpeu47xv
	L5KRN4uX1tC58D8i8ksKezMwuBEEa+Cx6nwTZiYDz95vBQt6oFbtv0nfFuD9rROfaB5UuEka7a5
	QW3gGtWh1m5rYCqRYpGA4iy2wQc5UcmIfIttJSTIlM4JkCLXaFYeCOWRf2myLvED4NenPRVr/aS
	jYDh/4VE2YXmzGUYTDB1dxUCV9+OQOzORPUhz8vU3xLXTSO+SLbIwNR/uP1dPpDgCDYXCslgNNc
	1bhCKP2UF29kI1QqSqlF9QF8ojbcJLHGR3/IoYEvRe79nAcTo0TKcaVBbO08sPu0EGN0WI8ojY7
	ScB7C5lXkQHXvg59i8R/KEfy8oDFRcrSx1aA=
X-Received: by 2002:a05:6102:50a5:b0:7cb:288a:b678 with SMTP id
 ada2fe7eead31-7ce5cd65bc3mr1049568137.19.1792907575694; Sat, 24 Oct 2026
 22:52:55 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 24 Oct 2026 22:52:55 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 24 Oct 2026 22:40:10 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: berringtoni36@gmail.com
In-Reply-To: <20261024034931.5d954108@jic23-hlaptop>
References: <20261018-adxl345-event-state-v3-1@gmail.com> <20261019-adxl345-event-v4-1@gmail.com>
 <20261024034931.5d954108@jic23-hlaptop>
Date: Sat, 24 Oct 2026 22:52:55 -0700
X-Gm-Features: AclHuK_Q4KiCOyF_uPPIzJpNKQf2tZ1364Q-CZyBBIUJeS5cafrfa8v9x-hGR54
Message-ID: <CAF2O-sO_Ce35L_7KddzHCywoxZ-ng4AeRLPfEBnMJJR9KAPZXQ@mail.gmail.com>
Subject: Re: [PATCH v4] iio: accel: adxl345: separate event state from query errors
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, linux@analog.com, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lothar Rubusch <l.rubusch@gmail.com>, Joshua Crofts <joshua.crofts1@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Jonathan,

Thank you for applying both ADXL345 fixes. Noted on the threading:
I'll send each future revision as a new email thread.

Best regards,
Wenqiang

On Sat, 24 Oct 2026 03:49:31 +0100, Jonathan Cameron <jic23@kernel.org> wrote:
> On Mon, 19 Oct 2026 21:05:20 +0800
> Wenqiang Zhao via B4 Relay <devnull+berringtoni36.gmail.com@kernel.org> wrote:
>
> > From: Wenqiang Zhao <berringtoni36@gmail.com>
> >
> > The activity/inactivity query helpers return either a boolean result or a
> > negative regmap error. adxl345_read_mag_config() converts the latter to 1
> > with !!, reporting a failed read as an enabled event. The disable path
> > also turns a coupling query error into a successful write.
> >
> > Return query status separately from the boolean result by passing bool
> > output parameters to both helpers. Rename them from is_* to get_* and
> > update the event read, disable and link-bit callers to check the status
> > before using the result. Preserve the successful coupling-mismatch
> > no-op when disabling an event.
> >
> > Fixes: 66a1af6d8a63 ("iio: accel: adxl345: add activity event feature")
> > Fixes: 31f7679bb69a ("iio: accel: adxl345: add coupling detection for activity/inactivity")
> > Assisted-by: LLM
> > Signed-off-by: Wenqiang Zhao <berringtoni36@gmail.com>
> For future patches, please don't reply to an existing thread with a new version.
> It can cause trouble for tooling and generally makes them harder to spot.
> New email thread for each version.
>
> This seems fine to me, so applied. I'm not rushing this one in though
> as it doesn't feel very urgent so applied to the testing branch of iio.git.
>
> Thanks,
>
> Jonathan
