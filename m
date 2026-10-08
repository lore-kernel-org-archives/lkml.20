Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2613E6DC3
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791446161; cv=none; b=YPjvjIjToOIk0ID0iG+QwHZVQ7lFFSm5z3uF/Dw7bPDzOGiWHUVKthTfEeH1asVdT/WmLOxuUzxzmT0N9zrXTT6js64EUcaprm+m6UvcxMg8VESJWI54OEwF4C+ESdmNoZP0dmtbwy4NEDpZTbP7dTSGfqjvAUU1nvfs6hrH7Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791446161; c=relaxed/simple;
	bh=1eLsAsBcb3/SU5wMEmlWmiLY4M5auQ2xVNRdqlqUs4c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f4J9/q3W+/9oYnOLVyqvpVV9K/yEUp/L5iil/VIDMsKFXqQEYqfvuff1Ody3Umc5deGfCIiOLjNOHGBz8KjS7WqlQD+bsyLB0RxzH+n0sJliseogjj7KRznCogwnpds5AGK46X3bUs4GwPNHb1v2Z+yKnacUlBndPimHw8lhEvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPhLKAKL; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPhLKAKL"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c02782159so1711731f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 00:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791446158; x=1792050958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RqJ80RZLGvdSDJWSa/30QB3K8CJAPo6KFuj937ftJzU=;
        b=PPhLKAKLe3Xj3jWLUOoBBNGiy5nU11Mdq8tEOP1WIqNd6b97t8C+0nqokWqG9J2cR2
         KParJi47v2JiNiCIh0v7u5ANu5urcvf5ZsBEBWKjAeOu2zRcIE4mNfdSdZu2uQUXRCQh
         1RWNVNHf36C7BhA781Ua1+oce37wOirjhHrtx1sItMEuPzLa6EI0neX+DO9L7ZPbW6xg
         BEj1zHerprEsF7mmOplUPasj817BHcBCeZ5sdlS3nMfdkNVqiJfJij9Px+SVohyig0k0
         cgo2EPgilaS0Vv5alzeroYb0VoojSzPeuXAlIMKJ18EvRZKsDfgvDWeZEHDWJcN0S3r5
         +jmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791446158; x=1792050958;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RqJ80RZLGvdSDJWSa/30QB3K8CJAPo6KFuj937ftJzU=;
        b=xx7CEwJX7qq9LoqZ6CuoqhbGvNLCkEV70bWHKCcVwnvL/teo51oeurBUVjApeKN1Lu
         Hv/k9Pf0/BChhB9JtPAOKpDSwZxKw9JKB45W3j2WpSL6qIyPSAJgt0yDStAuQso+9YPH
         39lN5e+tZ7MQjUIsT0ybGqR8YFWgrGWBjAQ+L5ibHf5Dm8aXDPtXxJbHJ9B9X05w5Ge0
         NzM0aUXycDIb48U/eq7xRgYV08b0cM7of3Lu463NRaOAflWKlJS0Dm9UE0DY4ft3SL7Z
         vPr+juinLq6197lGjabW3550wvHZChig+ol5DLh/eyie6+6so1Cy8A5DucI4wI2/ElYp
         BVaA==
X-Forwarded-Encrypted: i=1; AKwUvBxAT89kaAO0EvuSf5dMA9O6Xdvs3J5EjHqNhctYBUcQuWeRGvi9ukYyWRMdtZ+gUzmZcK7LeZzieJoqxyU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJp66iWWC5tMmcOOD6bhCSMmTMM97tKyppnoDWZ/QMSBgO4UPvu
	n+mTJVP/QQ5I1ugRGsSODQFTn28pUYgPqW56oLvEqv7uVv2nd0KsQ0iX
X-Gm-Gg: AYBFou0E3KPR6FWSyIg2XKZ5VPpu2NvVcOh++j/ak3XX8kGOND+gdcnt/sHv+jiFyjY
	8h//fmmYPtyDVgN9Mno23+b3xaXmtMsJgiboYrU1Ate1vJHdpimfwoeAeYs6gXPQOjX4150GNEz
	ILAi8MUeUsb02iJ/lBDEWcRhit6UDA3gTpnOB9QLu0vkHXA6T9TvpFERVd6TNP2SkAAlUfN14v8
	p1lkzhuEv50rZprUgIWKreCi7vm6Xwv3iHLM9OE5yJjn4jlbR5/IR4OqaRRu9ScGW6TgkcoZV12
	x77NoNGwWRGBfd+uiuW2MxxkeNUC5HRUo+UGu92mT6iBLOvZHhqMH2VGgyyrE2mkF4lN8GTLIio
	4elkUV0jNcREcCTRD+PWiUNdc9HUIBL4kP//7hcyeWP5zLbEWB/g+I/ha0TkaytKSpznniOTCal
	+xsJWgsFIUj5Yv+1Kxfo9SUiNiyxGVgl8klioLXrp1DfMINx3bWuRwTKi8FbODpJae7yFLlAohu
	pTiMBk3/48347uQvST2yHuR31heWARspbM/3x1fYknb+Cgj6w36lD7NBerOGnvh8cIOAdKjAZoO
	B02YIRAJXKHkAQOjNxg0WKzDr5BvJPMcRHo6qedHFaMOTl/140hwnzYoXrTXuVXtTFO/o79HqPX
	PHRo7F9CqtVCkJ6bFNk1rOSl+XOw0rP695BOEMXC2FArxccsisH3fkZnvNfHhnNLDdpVwoiGULl
	BIydH1tA==
X-Received: by 2002:adf:ed4c:0:b0:487:1662:cf4c with SMTP id ffacd0b85a97d-48c72707d0fmr7555934f8f.7.1791446158003;
        Thu, 08 Oct 2026 00:55:58 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d31767sm10344398f8f.51.2026.10.08.00.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:55:57 -0700 (PDT)
Date: Thu, 8 Oct 2026 09:55:57 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Christopher Hoover <ch@murgatroid.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>, David Lechner
 <dlechner@baylibre.com>, nuno.sa@analog.com, Andy Shevchenko
 <andy@kernel.org>, linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] iio: hid-sensors: fix shared callbacks in
 temperature and humidity
Message-ID: <20261008095557.0000617a@gmail.com>
In-Reply-To: <20261007184423.622445-1-ch@murgatroid.com>
References: <20261007072329.27806-1-ch@murgatroid.com>
	<20261007184423.622445-1-ch@murgatroid.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  7 Oct 2026 11:44:20 -0700
Christopher Hoover <ch@murgatroid.com> wrote:

> hid-sensor-temperature and hid-sensor-humidity share one static
> struct hid_sensor_hub_callbacks across instances and overwrite its pdev
> on every probe.  With two temperature sensors, reports for one go to
> the other's pdev; once that device is removed,
> temperature_capture_sample() dereferences NULL.  I hit this on 7.0
> with two uhid-created sensors.
> 
> Patches 2-3 make the callbacks per instance, as the other HID sensor
> drivers do.  Patch 1 makes sensor_hub_remove_callback() take
> pdata->lock, as sensor_hub_raw_event() does, so a report racing an
> unbind cannot call through the freed callbacks.
> 
> Changes in v2:
> - New patch 1, for the use-after-free on unbind found by the Sashiko
>   review of v1.
> 
> Christopher Hoover (3):
>   HID: hid-sensor-hub: Synchronize callback removal with raw events
>   iio: temperature: hid-sensor-temperature: Use per-instance callbacks
>   iio: humidity: hid-sensor-humidity: Use per-instance callbacks
> 
>  drivers/hid/hid-sensor-hub.c                     | 12 ++++++++++--
>  drivers/iio/humidity/hid-sensor-humidity.c       | 12 +++++-------
>  drivers/iio/temperature/hid-sensor-temperature.c | 12 +++++-------
>  3 files changed, 20 insertions(+), 16 deletions(-)
> 
> 
> base-commit: 9ee8306121495d2a25aa5d1bfd519f2748786b83

Also for future reference, please don't send a new version as a
reply to the previous version, it breaks tooling :(

-- 
Kind regards,
Joshua Crofts
