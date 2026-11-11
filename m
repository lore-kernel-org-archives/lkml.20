Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794366705;
	b=C/xWWq/7GuqVKoBFj6U46GsbaGcRUHQTenK6Rl04EGRojwZLFjIq945tjrvlQl09NUcu
	 Cz8bZS74RDRQQQWy6c7pTKr+rWOrPEWIJKfbOLIt7w0iHRNdn+ztD6zx7lqqDrXkCKuAE
	 jn3NtmXrfGdSD5/xBvNlaAYI++TdcemRi+Kq6q6ORaEYL+wvm8PcC8psdf035VrVlRaKp
	 hskjYoP9E6oAtH9/rixw0x27wrZtN7IUuv9LQr9d0shNjlcCKf0M/zxmBMQekKby3QerB
	 0v0xSxFBcAMvr905sKbEwi6yUBavMJ/50pS4lnBP0c1HHsvUI5emWImERVKtCqX4CNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794366705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=r+temhaowl0XJ/anU239LQ8gF9cvIIzxMmHoQ4oEdHg=;
	b=c9Xmm14r14UPwecHu4EUzH5Iw6rxAd8CcsjvRQCNif8HoGGhwtBwagL0EgHorlaMcmqI
	 wLGx/BbuIqhUVpJFj4Y/5wI8neWYcvk/M9+biEsczEMKbOVRRcZcnaWM4eNG07rBAusXn
	 SRMnXKXaGX3u52/DTTAmt7L5ZfUx5HOV1Ou8SO5z4M5Gvjnd5Qmp8YPf3C/Q4xNZQ85Ur
	 kIpSrrb8ej4GeDf1hLbsJm3I0Tmy9Eq3TdgLfMA/x9LgnwdWEw6dhs5nx5ZmRRitK5DM6
	 ll22UpRLn145XcWJ4HJvXQ8H1QAiiLzRWTTzgZIl0YC8vg/z6U4sAO/Ni88/hZ1a9hw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=murgatroid.com;
	spf=pass smtp.mailfrom=murgatroid.com;
	dkim=pass header.d=murgatroid.com header.i=@murgatroid.com header.a=rsa-sha256 header.s=google header.b=ahr0TwL5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68D8606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C68D8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=murgatroid.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=murgatroid.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=murgatroid.com header.i=@murgatroid.com header.a=rsa-sha256 header.s=google header.b=ahr0TwL5
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36dbde64409so5697634eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:11:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794366704; cv=none;
        d=google.com; s=arc-20260327;
        b=ak6MAKmp6gd6XeO8bH58ux5SN2uP+flVdWi8wTA7vrDzk1UO8t3HvKEsf7WjoBVRzV
         HYsqjbJ3LuVuUlj7i7OnFHMK2Aj3muMklyn9UMhm7rts/GS6Sw99VxB2VHLDbz3FW6ou
         R6deYC42bBaGeqjOpL7yexRitCaPDpeUe/0E08E452N282Itub/d3UCNN6zaUxvmrpBg
         8CruRSQitS4CPDE/YnE2dTCb0VdcARqgQdkglT5wB5g+ZnPVBqNREp4v7btaKSU2N2DP
         26c8g66zRUcFNRZfJWulLbFRDnRdu9oefRVfHyvAEfxY+HqfhX7+zYcT1qFxG9+guiOb
         lImA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r+temhaowl0XJ/anU239LQ8gF9cvIIzxMmHoQ4oEdHg=;
        fh=KjoSGLm1XUcR+56udiQJHlJDB01Nw3VHZg5o0T9LBno=;
        b=jHq0g4UKp7V4i93N7QZbWfl17zUJ9Y2dcKoKHP4ldepY2dtGXovMbeTJY8Zm87tGxO
         ENsKDuo3Vcdmnkezu8ymJqgpcPTnxp97CwPb1STzpL+PnaHbhIBQ/SEdpQ/CE9Ruh6yD
         6JbZXo2Z3ylfkQ9tiqLpGg+Fjz5XtMRWo9cPqcM3uE0w8qe8+Q7+RRpkipRdTr/FipHT
         YCMNKqQt0S2+L9yd9tyeEEndEEj6D53iN05LrBRW14YkbJVBsKCvHBfH8WH7wV2lAJ7h
         IpI1w+FbtJN0JIsmAMTFxnUcZ5xFKROLCx2q3/S0z/giAdHsKm19nRgSEZ/hScZ6q0su
         oAHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=murgatroid.com; s=google; t=1794366704; x=1794971504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r+temhaowl0XJ/anU239LQ8gF9cvIIzxMmHoQ4oEdHg=;
        b=ahr0TwL5sXnss274qbskTXY5FmMPs2iFVD9HrT9uVudzZC/sj3d3unabJNQluhywMS
         IvwccBvLRok01eX2qO82HTDDomSYhoyPMh4DVYh4JUEedevvW4Q7zJF2roHE4t6Oggb+
         27lTmfSdauf3vipbuS5bHQ30aln7L9wdI/2ml8wSBxrFMZ4e4jmTtlLd9UQsn7CjCPiZ
         cczTGkTBsnontIFnTY2gMoVLM//Iu+c9ehsJLjsSFQTi+3SLn6n2jQteNUXruqMrPmGg
         dM64JYzmtir8m3mD5NZpr6HrHxJ5/OO63w0zFiRg/p884P3aPhqo58cOA6hdMpDB87l4
         ex3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794366704; x=1794971504;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r+temhaowl0XJ/anU239LQ8gF9cvIIzxMmHoQ4oEdHg=;
        b=cNNsIFHENA0N2sleo4NSNP9GWRsQEPAyStV4MXcdCb/bV5G/BSNsYLznKFGU4/llwF
         0UNWBS288MJb1Ck2elgFqKX2jygOSA4zxTwvX49AOIuCMuenW6DJFqf3ykqPySVmird5
         i4TJZnm3sth0e10+/rXE0Zc7A/S5I8U7F9FgzDbHKjF6CBhz8Bjn/MqgC1Vi7n0oeqNK
         JPItLOo09f/0QpKPZWUJbSDl/Y/KD5iOlnf3tQKK2+3VbmjsMb3mo9qjFNoQ9lnxcNib
         xquWvNTVf1O30U+7W+un+8B5DG+5uSGFQQdnqOOZrzCrH+hcJIa3PC4BZoKQUvPrDxkK
         2jSA==
X-Forwarded-Encrypted: i=1; AL+hErFEDUeVQP6w9uegDwjRdnyP/zwZZzj4Z5TbNCOMnjlJPJFWgGJ0xW2Fx7j6mN1C1/YzwndTkgL42BZgKNA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CD/qsdk8Hscy8LKhsss8fRS7mup5UxTDLucEY6idDDL8S2LDR
	NiIDnVclNXaDwKii9+KvbpE2PPfnrcrGg2ZVL6wq3XwOBgtmhPgRS/RpydFkzZEHs0Iq2XDjWh5
	qwssSE+pqunj6woP1ANVGIxc0rVreDuuXp/OQuMwp
X-Gm-Gg: AYBFou1bdUQDddwc2L13oxqWN4ew3+chC0nz5u+gRJrBqwTHZ40jLoDsPkduRcMicrt
	kod2oMnl1WVo1kYUyKMF0Q18IzP+uPGSrvxq3YcO5OoWPN9kfG0qlrH+XCcZbDrdY18DUEw/N0q
	mwthmOTm50I00UrUZvOmO7KH0RrH9W+eijZOoIELbS69oWW7qGvdMU8zdPEpfY6kC1K4pMhu6O9
	nfqmD5gUXlxaPWt2OdxY8nL1PWAWLUQW0siiR1ErPmUHEoGkNvL7Y6YCRwWTr/6mzTWTcK7Kb0l
	UZZYMD7aBXrRDoftFRnVSoFPyKnlvroZy40w4+AXaGu45LB+clfFfGqmJEfav8Sd+lp02FXr4UB
	fiCGk1rum8Kq67agrI7z0rNObEwj27uJc48O9OjSh2S+CG/QE+mVFwy/vFoUOP1u6RcSaHWR85J
	G1ar66tiTaPSdldlAZAfSYHBRFRQRwZFDkYQu4ijc2JE+kpKR6HkqUxILD
X-Received: by 2002:a05:693c:42d1:b0:36e:c9e5:33aa with SMTP id
 5a478bee46e88-376854ba4b9mr1792132eec.13.1794366703578; Tue, 10 Nov 2026
 19:11:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019023420.83976-1-ch@murgatroid.com> <20261102215606.5e36a2a2@jic23-hlaptop>
 <20261111025336.051fbbcb@jic23-hlaptop>
In-Reply-To: <20261111025336.051fbbcb@jic23-hlaptop>
From: Christopher Hoover <ch@murgatroid.com>
Date: Tue, 10 Nov 2026 19:11:31 -0800
X-Gm-Features: AclHuK-SGhvKm-m3dPF7X4f2O9KsRDzR0B5VWRGLdjPvi8wmwehWFpB8zvORHv4
Message-ID: <CACw0PsZ43YAQUcPuP7ec6gjd03Srn5QYUWp74SMZ0gzPLUp71A@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] iio: hid-sensors: fix shared callbacks in
 temperature and humidity
To: Jonathan Cameron <jic23@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Lixu Zhang <lixu.zhang@intel.com>, 
	Joshua Crofts <joshua.crofts1@gmail.com>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>> Dropped patch 1, that should go via the hid tre

Do i need to do that ?    Sorry for the possibly dumb question -- I'm
well out of practice with the process.

-ch

On Tue, Nov 10, 2026 at 6:53=E2=80=AFPM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Mon, 2 Nov 2026 21:56:06 +0000
> Jonathan Cameron <jic23@kernel.org> wrote:
>
> > On Sun, 18 Oct 2026 19:34:17 -0700
> > Christopher Hoover <ch@murgatroid.com> wrote:
> >
> > > hid-sensor-temperature and hid-sensor-humidity share one static
> > > struct hid_sensor_hub_callbacks across instances and overwrite its pd=
ev
> > > on every probe. With two temperature sensors, reports for one go to
> > > the other's pdev; once that device is removed,
> > > temperature_capture_sample() dereferences NULL. I hit this on 7.0
> > > with two uhid-created sensors.
> > >
> > > Patches 2-3 make the callbacks per instance, as the other HID sensor
> > > drivers do. Patch 1 makes sensor_hub_remove_callback() take
> > > pdata->lock, as sensor_hub_raw_event() does, so a report racing an
> > > unbind cannot call through the freed callbacks.
> > Applied to the fixes-togreg branch of iio.git with the ordering tweaks =
Andy suggested.
>
> One day I'll remember some bits of this driver are in hid.
>
> Dropped patch 1, that should go via the hid tree.
>
> Sorry Jiri / Christopher.
>
> I only seem to notice I've done this whilst writing pull requests :(
>
> Jonathan
>
>
>
> >
> > Thanks,
> >
> > Jonathan
> > >
> > > Changes in v3:
> > > - Patches 2-3: set the callbacks with one compound literal (Jonathan)=
.
> > > - Kept Joshua's Reviewed-by on all three; patches 2-3 changed only in
> > >   style.
> > > - Rebased onto v7.3.
> > > - Sent as a new thread, not a reply to v2.
> > >
> > > Changes in v2:
> > > - New patch 1, for the use-after-free on unbind found by the Sashiko
> > >   review of v1.
> > >
> > > v2: https://lore.kernel.org/all/20261007184423.622445-1-ch@murgatroid=
.com/
> > >
> > > Christopher Hoover (3):
> > >   HID: hid-sensor-hub: Synchronize callback removal with raw events
> > >   iio: temperature: hid-sensor-temperature: Use per-instance callback=
s
> > >   iio: humidity: hid-sensor-humidity: Use per-instance callbacks
> > >
> > >  drivers/hid/hid-sensor-hub.c                     | 12 ++++++++++--
> > >  drivers/iio/humidity/hid-sensor-humidity.c       | 14 +++++++-------
> > >  drivers/iio/temperature/hid-sensor-temperature.c | 14 +++++++-------
> > >  3 files changed, 24 insertions(+), 16 deletions(-)
> > >
> > >
> > > base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
> >
> >
>
