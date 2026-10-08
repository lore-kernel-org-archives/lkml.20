Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D833C10AC
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791446103; cv=none; b=tkXQVttR9r0BijGYiM1bajod0NbGpAkEiwm2qdsaZbgb/7OA41BjKQAcNvN5y1S9DChihHVwyT6c8YGVSi20SwALOO6nILWbo2KC1k5Y8mxKM6T7vOTX5lQs7fBXP131nFdLJ9OuklrrIIPTggI1++sam470RpgBxGw0FpC0ufM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791446103; c=relaxed/simple;
	bh=0sdnIgsW/7O1yxiEVd1NMidwd+7MWbZHjpGHHLdtTqA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ei1aT7mwDBYdk8bexVboB1szP6Ow00nMiJWVq3tTifEkW/7TgOCKiXaGfcoFSr3/waDxf84gpL/wAhunn6vDPSJ0LaJMryNh1GzGhPkZ3RkJDUiJNPvOMIv7mpyO3buX2V8jymOsQnoFvpBDUKc0mF2QUeNkHAkU3mN3yaxMOqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rU7WxcG9; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rU7WxcG9"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a168355946so24437075e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 00:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791446100; x=1792050900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ee/nOmTXlnTKv+9t3QjlgWh7DWnVNJTswfF5DULCt7Y=;
        b=rU7WxcG9FQ0WfjIRwN1QBSLd274UzEmREVCwG86VNZzOQmO8RPn9nEwshv1ingB29r
         0PYo8nHouyZqKjpxwUniaw0Q1frLN44A4iCnB0GSPmqUU26Y9g1p4V388xwZZ5lKNxlM
         +28usrukC8nX4XDcLGN5p9H040pWwYFazZyi7R7pRVeRsKyTvFQk+bG3wbgw6rHoEBgr
         V8+EfHtLjTzet6Hlf2iricUGa+06RiMPap1ksxPcMF4kYjE8+YLf6PbcXEyBFsK9E0Hu
         Lb9X8JuE1DJgofXm1V1jcyouRR7iHGnMEjox1ekaezJRPn1vcS0dnwfLAKS36t7C5Jzj
         6ThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791446100; x=1792050900;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ee/nOmTXlnTKv+9t3QjlgWh7DWnVNJTswfF5DULCt7Y=;
        b=uwNy4+ujA5hLHHCkqyZWJBDfYVuN/taupHZTOuk2RP83FPpkuiwcWSgdp31pvLSHQZ
         /t3OCeLUY1b7lSAVzHVhMHjZE0Dh2Z5dkCUDo7JqyysxWSylXOGhjulxSMtsaMWWJW0P
         S3dsvp5gGLWsr9eqSRZ1Db/7MHN3W8Mf4LJ5esXm6jGtzZgcnucSAv3awDKjUCg2WYVA
         cQVXGNFnh7E8xfpD4Zlm4wN9AQ8KyzRQ3a9XtnoyHcqIDXcYZd7ejtLQoMoLQEGi5rdH
         1DO/5smxae6vxkTQnFXKzuTBV5jWqbiDile3zA0mJ2gq6o/+yBLooaJAsKi22T+SKu+I
         O79g==
X-Forwarded-Encrypted: i=1; AKwUvBweKTG0lapzkADcjeLJMM2qQtM+6ojQ3AznkcxiuExUF2/wbPN0Ak1vwRzD4yWk2DPncAvVdN41zJygdUY=@vger.kernel.org
X-Gm-Message-State: AFuF++lYzLlWeK3WPzErafrdf4sf+cQX2rNrYyeT38WbZOeX+v9v8WUz
	btSqKgZ3Dlgz9MiwUqbNl13Q/HXndKY4SgYUqiFsAYr7SE/sh7NioanG
X-Gm-Gg: AYBFou22c5X0TkNYQE50nBYd3ZH4hcPo/ETPxdE54ZEDWHlu3ez79AT2LZJ8SFMmuVh
	5im53iQTkDLp2LCSnsHiGBUYoiDbqoosUEW3A9dDXoVrUflZwTN0lYZnuZ/bS7Szmv7bjodDdvF
	6PIY4wR/SG9ou2E/OqW1P3kWAxg2pc1sxwqaWACjWCloH0z6Gmpti1KkT20V5RKZxb3J9G2Z2hq
	FLf9r2EB8nkUI3n2ongTg/oY5bms39x2wi283m4mkTRRmxSIerjeHrTBZ9B6uFmS/1AFeyE3/Nd
	qqlEPdeTSzVRT8Qnsog8Kv6W/GV8UVa/4QaCMlvW70RSCz95r9+26OXDhIV1ALXagREPk/ZEZkE
	44FmfFXL0ppAhtc3jiG9umBhjXly4HLtOF4pxM2FhUXg0mnkH4IynyNTeNPh0jA6U/SL0i5G+ic
	Q8v+Iwlf+Vp2uyFQtXiAGQ15tMy/ZPq5U8iL4XDf2siLYkvdgS1PmuPbteqZSPMFdySJJllU1sT
	rPBYmAh2kmAYTwwE0oSjWMyXG73f9PZ0vPhcVWxsCcqiwN35du0JbPkNj/posz8NSIIsfhFFZDm
	Yr7yL3b34uwqOyyRt4TpmbKzetgdhR951JiJX/PmN2W9efShOqsscuvAxKnYIZBtxO5MwXfFST3
	6BNn65wqNRg2I5NxGVcZ9643wSE8OlM1J3xkCxM7aJ0JJ3yQh7ZaNSEVPJeDpPL3LI2M1Ct5Mx0
	T5rvvw
X-Received: by 2002:a05:600c:4594:b0:4a0:1cfd:321 with SMTP id 5b1f17b1804b1-4a180313bbcmr78950685e9.12.1791446100084;
        Thu, 08 Oct 2026 00:55:00 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1245bsm9635929f8f.26.2026.10.08.00.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:54:59 -0700 (PDT)
Date: Thu, 8 Oct 2026 09:54:59 +0200
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
Message-ID: <20261008095459.000023f9@gmail.com>
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

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
