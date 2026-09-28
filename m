Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8F4547046
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618733; cv=pass; b=V5d93UBE8anfPXguRMNHGkDVoCMlpZXx9w4DPE7ORLgYZsy01n8VRa1ewsDYWAc5T86vhEKcch79WjMQI8dThQD+0RansmaA6O8DMpJru6G6Jb9r3vZh5EQEIokWO0VZXv8yQxjp7skoIzd0UpxBFf+4gkZVidBBwP/ZxsQAtyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618733; c=relaxed/simple;
	bh=MLEfxMlJUEEyVrOmaPHoWm7+PeLEG9uOICpbSXB1A1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D8j5iPMztt3kTHS0nW4jlv8+lBhugfgiAqDVmyhu4FOdELAoQe9TRE9IY0E1wTnpO+oV+sU2S0Tut2R9tKHNidvHPKKgXr8ndaqeiZvfmEvwXy95TxT/aRXG/QVdhczzJY3fU14mPGqzEfUd6XgFyT5OHQRvBdzf6bPETbv+OD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AhMu2oZr; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AhMu2oZr"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2af9270c53so310525966b.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:05:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790618730; cv=none;
        d=google.com; s=arc-20260327;
        b=ELTdnN7gIbc++AEHMNrfsn/03JpMMaBJ9D8wZiWIBxETtvr8jcZ9Mvxep2AwyKKlGX
         pqnfbsb2Ol0LPbOLzGQo7oL5xCGhr1TMPx24GUZMac5A5TXVMFEIcx23aF3sEyvwlmv5
         oIakVeZD+zZFXdeFemcAByXoxbKZOmBfZVYHDO0KZpgc/pmSWt2sdkOeWo1YGgozJLbU
         Akp2XYh599ClxanPkR0PQasxDJPek6lhV+i8WbH+PfY+2IuopjxRqBJvRwiuQQDQsK0n
         5QNCPJIiTzI2nVSpcFOjw9lNCnODSuE2E83r5eMeVCJUrOQFPl03udoZj219towLy4E9
         MOPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e4jjh+EWYyOIN/12qAGS9jATZa1y64YX2UmnmnShxQM=;
        fh=U3pvug3b7Ew5o7m78WYRNXwawZXsIXr7Bc3UBpAj/KI=;
        b=m1SLlOA/wpXRqxZrBFuMNl8esnF6zJK2UWMpJxw7RFFtFhmR9XqE01RJKaxn29IVNd
         tUS6pG7gKuOelfMQVUiBx7uxMcItvC/Oz+lEZMzw+cgkRTMY/POWJ6JCgTrPI0WY1a05
         yTM5neP5n339DH8DBhLJNEMiiTkOSgDHnuJ61qkX/T2EdBM6Bu2W9tAiXggA5VdVHq5n
         6+X1jbVBsif5mN399Jo/q3Fr0l/DCQxrEa94G4KxEl+5naaanvLUpD1Tl7VxYqHfeJ7X
         xt06tqZU/QdKnyU8QMlQiV6pw+jlHZ+WJx9ZOneO4Hyhoji+ScMp/SmBzuDfY5AMepMa
         K8tg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790618730; x=1791223530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e4jjh+EWYyOIN/12qAGS9jATZa1y64YX2UmnmnShxQM=;
        b=AhMu2oZrIOOJ1JGrpB70C9bHZLvV9/XUcuTCqFjDoIWELFz9+owuGd/E5p1YUE+DEO
         aurx44hoUTAqNjc93jKOVaSMVaA/8SxPGOGpIH1SpE2Qf9ssZqVeICQRDTC411Wc2Ebs
         vE4z3Jzl7TbfO29dt2k5pAJKWzNQnWuoWwopCyzB4uDOfqcAqUPJ17NNAR+n+8dQxten
         SGmN//UZr7mzrbQ6Cu9ijA63xsbTTdWN+4hY+lJhwO3NI6f9wEjzMkA1qEzSZVy/ucVZ
         2meQ4q3MTJDGxtR9/IB3/zWihAnrhz5HCNPGUta0NTyT4rzRVQy0tzxE/tiKamrrotAW
         5nlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618730; x=1791223530;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e4jjh+EWYyOIN/12qAGS9jATZa1y64YX2UmnmnShxQM=;
        b=SOTw8jATqsGQDFE4U0ATz8z28rYeGP27Ba/9ZVvRxbFJ+2Ixia4Nf66T1CPBZvkIPW
         pc+hUljfox/+k0mHO5Dq5bxXpg7xMnqdWI+xWoPmPbOIHfHpYD6pVHnNNTtVcY5SCvSp
         6OfaaSF8cncBpb0urhYiJF1qGrwDPrm/IaHUe0d3wpc36ptywbUCcEuUnhgVDyofRg61
         OhiqHks0nC1Uf2U6dlObskJ6oa9IgslGfIDcbEXpOEplZw38NcX9G1YtTVrviC7sazd6
         laELZ1ScVXLvKCkiQP8LHzpbGT7QJylxKQHIjbrY3mk/UfvU+toMBnea0jRDn6LlrE+d
         5K1g==
X-Forwarded-Encrypted: i=1; AKwUvBzBPIaZSvPaZDoQCYXM/NIi9PdiXAM+tPsjJOJheG7UupO26HYrj+0UqX6uztKatUyN+CCTjq7ISL8SzFQ=@vger.kernel.org
X-Gm-Message-State: AFuF++npeckuuoMekmRkLzkcJbqHEWvVw8So9smJUPMkY1x6JWUlKCrz
	kaPO4uDb8USlq6eNL/poDh2KPNavx/eHy3mlvlvVyNMOOmBRKwB2gTRA4wsJJsZV+Vk8TIEY7a5
	BjO0AHjItBAnGTyVDDb9qH+5h3pVmqCk=
X-Gm-Gg: AYBFou2BsoZ2jBCI0Qb63R6A212ZapaC35wc91ajj93SdEg9ZKpV01E7KgM5QfQic0x
	25S9AjzWo9IFom6tm1n//klsjKj6BKSYLcOkuXrq3+7xwXw/HDMQryfeEeZnsH2QlDScVWu/GX8
	ToyqRjlpPny//eoMO1YbYx0Pbo773EFVsM5kUKMhBkQU7DZtv/Mwxp+hKBNWj7oFrY5SrhUFwpX
	WfAlRuFR0W9Kbh891PtxCCwO+PofblNAMIAMViMUXsQVUwk9LGTbrLNz6oDucK1WatyPvEK1qwa
	SGrxNSbDpECwi0bbG9aEB5TBMp0KrG3QNa73PCNFHx3BfJnwjliehscJy2qWMojNtZG5i1GRXnB
	mfZTzLOmpTFWFwQ52NDP8rIejpoqLiCwKv7lDr50zw7mCBTncUpDxwkzl4VwgaJ4uYEFAV4BTF1
	iGOjz8xD6i5IwAibTKAlBmuIeoqb0/vBj5YB9pXFz3
X-Received: by 2002:a17:906:c14a:b0:c2d:bae5:27e0 with SMTP id
 a640c23a62f3a-c2dbae52bcamr568996066b.18.1790618730238; Mon, 28 Sep 2026
 11:05:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928175049.86941-1-jwuerz@gmail.com> <20260928175049.86941-3-jwuerz@gmail.com>
In-Reply-To: <20260928175049.86941-3-jwuerz@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 28 Sep 2026 21:04:54 +0300
X-Gm-Features: AclHuK8_tyw0h9eVQdPiLqhB0QjkWh6KyV3q4_8dXfkNeUGqubfrfMkXQGjY6qM
Message-ID: <CAHp75VfB+cmqWfk-8vuR+1MtF13Z6SJ+-KLovM9kYm=eVnVpZA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] iio: imu: st_lsm6dsx: Add ACPI ID SMOCF05 for LSM6DS3TR-C
To: Jared Wuerzburger <jwuerz@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Samuel Dionne-Riel <samuel@dionne-riel.com>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 8:52=E2=80=AFPM Jared Wuerzburger <jwuerz@gmail.com=
> wrote:
>
> From: Samuel Dionne-Riel <samuel@dionne-riel.com>
>
> The Minisforum V3 and V3 SE tablets declare their ST LSM6DS3TR-C IMU in
> the DSDT with the hardware ID SMOCF05 instead of SMO8B30, so the driver
> never binds and the accelerometer and gyroscope are missing. The
> Windows driver (version 1.0.4.3) binds the LSM6DS3TR-C to both IDs.


> Relevant part of the DSDT, identical on both models:
>
>   Scope (_SB.I2CD) { Device (STS) {
>     Name (_HID, EisaId ("SMOCF05"))
>     Name (_CID, EisaId ("SMOCF05"))
>     _CRS: I2cSerialBusV2 (0x006A, ..., "\\_SB.I2CD")  vendor data "SLA0"
>           I2cSerialBusV2 (0x006A, ..., "\\_SB.I2CD")  vendor data "SLG0"
>           GpioInt (Edge, ActiveHigh, ..., "\\_SB.GPIO") { 9 }  "SLA0"
>     Method (SLA0): "-1 0 0", "0 -1 0", "0 0 -1"
>     Method (SLG0): "1 0 0", "0 1 0", "0 0 1"
>   } }

Drop this paragraph completely, that's what the cover letter already
carried out.

> Both I2C resources describe the same address; the I2C core uses the
> first one.
>
> The vendor-specific SLA0/SLG0 methods are not parsed, because SLA0 is
> not usable as a mount matrix as it is. Its X and Y signs are right, but
> it also negates Z. It follows the Windows sensor convention, which
> reports Z =3D -1g with the screen facing up, while iio-sensor-proxy uses
> the same X and Y signs but expects Z =3D +1g in that posture. Applied as
> a mount matrix, SLA0 gives correct screen rotation, but iio-sensor-proxy
> reports the tilt inverted. The actual mounting is a plain 180 degree
> rotation about Z (-1 0 0; 0 -1 0; 0 0 1), with which orientation and
> tilt are both right. As for SMOCF00, the matrix is therefore provided
> by the systemd hwdb instead.
>
> Tested on:
>  - V3 SE (Ryzen 7 7735U, BIOS 1.03) with this change.
>  - V3 (Ryzen 7 8840U, BIOS 1.06), kernel 7.2.7, with this change and
>    the stock firmware tables. The driver binds to i2c-SMOCF05:00, the
>    WHO_AM_I check passes (0x6a), and both lsm6ds3tr-c_accel and
>    lsm6ds3tr-c_gyro are registered. Screen auto-rotation and tilt work
>    with iio-sensor-proxy and the matrix above (checked with the device
>    renamed to SMO8B30 via a DSDT override, i.e. the same
>    ST_LSM6DS3TRC_ID driver data).
>
> Closes: https://github.com/mudkipme/awesome-minisforum-v3/issues/2
> Signed-off-by: Samuel Dionne-Riel <samuel@dionne-riel.com>
> [Jared Wuerzburger: rewrote

> the changelog with the DSDT excerpt,

This will be dropped :-)

> test  results and mount matrix rationale,

> converted the entry to C99  initializers,

Not sure if it's important enough to be mentioned, but up to you as
it's indeed what was done with the change.

> dropped the mount matrix patch]
> Assisted-by: LLM
> Signed-off-by: Jared Wuerzburger <jwuerz@gmail.com>
> ---
>
> Notes:
>     Jonathan, when applying, could you add a Link: to this series? The
>     cover letter has the full DSDT excerpt, too long for the changelog.

...or even use `b4 shazam -M ...`

So, with the DSDT excerpt dropped from the commit message (and the
respective update in the tag block) feel free to add

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

--
With Best Regards,
Andy Shevchenko
