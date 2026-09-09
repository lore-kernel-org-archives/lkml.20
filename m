Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39B63D1CAC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788980268; cv=pass; b=V4Oh3HMSxCXd35kmWpIIKbJtgCp9Pc7bb82Cn4orTmA5aVCCwBj3YZ1bYuOC+O8I9JAz8nQAGcPLt7Y8IvqOnsXjcet23Ld6mxsNjrwA6rRYaAU8bBISOvlqCn56hXiLr24gcr77IgJhYYwq4QNu2mmGUi7l2zYTPjCDRN4x3eU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788980268; c=relaxed/simple;
	bh=WbeG64AorhHsTdCsQYdSDMzovN06CfdjHTIjqvGTqSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JtL/5JNP41xolGQklff6BSZ8GXOG18Z40IRaTun9OyiQVk7rpYVjJv5Z6WR3NzTRGtKZdKBB9DxlxxBUoUXxricVpUtJLibG0vCjM73iU13eCe0SbUdx0fB8GsnPjLkM8zqj3ZC8irxi3jNlZNp0zWSMpLnDE3KOeKOGQb0qb2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PDKyLBwQ; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDKyLBwQ"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so5235344a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:57:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788980265; cv=none;
        d=google.com; s=arc-20260327;
        b=arNjUkY9PYbkzpteqJulNUUJLFXbqhcRN2jEzLUjGUT92r0qVXiPOvI4Qt5kL/3yCr
         vuh/xVo3WGXmgkJWNDZ0rHufnMzJJbGy7o17j813QpxGtTMZKk+nzs7KgUmp8ysKjM2n
         z83PYPZ75VFGtLwULWGlmJZjOBHDuX83gH8hDnwAUYSP+NTgPLvrgB/4LGEft/d1A+mI
         vr1gCk65/lsKSi3EmsSSjVwYSkndkYUrzOu2aXz2phxkuXSUwaO2u4RWAEMNMn1qMBO/
         88Ejxk/ko3l4O66cA7e+MUp323IoDU8Cu+cRNq5Og12ySDuUE4DHpsoVUElsCd0Q+JVj
         iaPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/exTjUH+gs9Yy4hX5uQ5ycgwaqSVDjVmti5Tk/GIvvg=;
        fh=FnI0TE+zcIzbe+qOo6W9S46dP3RdQ1iNBSCAsDw7QyA=;
        b=p3b2ubli4BHmGsqmNZ4ecIYMNcASUpm3UCuctmzQl1+yqiF5f1QMOx8IJ1eYEb3dUL
         8MV8GI6xGHLdpeqa/F13wrOwctA/ZmNKvsmJS4w0HpyD16t1l03SI5Sa5Iy357hfuDk4
         hFze8cz8ho6doln6Qe1X2ajUFHDiGAJWa6Ac/+Ua9jpgkPkf9oGHi8z3yWvRPG0JsGWr
         yju6BLJXUry1y+qgOcf6975fYco1Z/fLvlhoicqRoWDUzMuhxGMv2dCqwtKxjkTvFklw
         RWkhVsmK3ys1j+WnkMIfRUdZGvOTFvS2aSDhAhx0T4KrCc2rQPxZbHntvxpxZSmIgYqt
         pcMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788980265; x=1789585065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/exTjUH+gs9Yy4hX5uQ5ycgwaqSVDjVmti5Tk/GIvvg=;
        b=PDKyLBwQ1Ltlto3n9u8zqpjedLyUi29J078n7QvqUySB/ud3zs4pyErTLxLRwYtcn8
         LEmOkc7QFrGamNJrFpZeMHJGPsmbB+K3g77bTiX1Oh/9rquJJerEhyzjzjYkxbgrsETt
         h61Ov8/2OFZ4CK5hKNoW2kvc2O7DeEdA+ap/kNfnPt8mM4mqmzdPu0MZa0Oyz2ebUgJX
         iFMZXpUyEBvFaxT7E7WEL6kwmOjcOKuygqtRECO42dzGKUmIiUfPFZOyWCxI1+05YSCw
         2oMHJeeypCfxCV0oeTneqqpg6Ln6TUg1p9mQmBvLifjzua4SLfQDa827c7u0/Mc0Iq1K
         +Caw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788980265; x=1789585065;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/exTjUH+gs9Yy4hX5uQ5ycgwaqSVDjVmti5Tk/GIvvg=;
        b=rbQbCS1WiWVvJl2adZ3OVNaiOjJNjOUGimOR+DdwkVTbYKN3zoOKHmJhqRcSRnEeEY
         BViwRcPnfIYIzttLijp4o0q/gfHmcMM347bTtPVai4xraQf1e4CmyM9b8ztltDdlyQ0e
         50SzJwfWd1+l/dXhEIHGTcVPTNWujPKzKtkLFIybAOy20GXpA1zDePZ7NAszDhlbnrka
         nd1QcoIFTKuYnvd6DP8VCvkf8D/+bNcsXmi8ztBNW1pdDqFj18COhf6cjiif1TXhTt2H
         okJ8nrDugW1wOnegb3QmVSvj+3tCNHOXbInlCUywwW7ciTR0BIt7C2u8koX9PEZs/tuQ
         wfww==
X-Forwarded-Encrypted: i=1; AKwUvBwWWYsAMitVtGNVmPLLdXzW3Y2srg1Qm8G4i4AfCygbz9QIRHJfQe770JEncEcIRgEgB+i75YO6apxl5V8=@vger.kernel.org
X-Gm-Message-State: AFuF++n73IXdTXiZM2QmTJ711yxgMkaKw/VOa9xzMYqP+YPaCxw6Dq6q
	ybTv1kZIzhW2CorEGGQZwARXVSyu8wqYqOXz0BrFvKst1FKFQwP7l7wNUk5B7cbT6n/E/rG2Zsv
	dqLP389FOayPukabncS+kp6cPv4iVu3w=
X-Gm-Gg: AYBFou3ut255mHllQn2TjZBOjqRI09rztbcMpoZu6JCxtBjor9kiP4u8lrGfflUo5r/
	SoeTStwYjL+9o4LkRGbV9NvWhjoqXPFC+sSG9JThAQOsVFjJg1HDpmeIgm4HHpx1DQ1SPgADqoG
	UTfGJ34nlBEYAP4MkanK3kSjbIOhtWI2h0JxjDtUScV+NZPRwhm07IENbAbugfpPTtbRr+I6QXS
	akZSHfha4QSb4FM5bmdA2aoxw4EvkleaBygTUe4P5T5mg9N4SpO81l/ZFbYGhrbJrHrCMIK9Igm
	tan/fdz/6gks/aTUIGpWQDKK79Z/GGT7sBciEdigYBm0W/AjTPMzKBoIJhxg6H6Gsv25PPEdpAE
	QGphvHBAuIJwd/KvZKdpzoBtb9+xVbzjMZ8Qf43AY
X-Received: by 2002:a17:90b:274c:b0:398:9be9:ab92 with SMTP id
 98e67ed59e1d1-39b2629b27fmr57161061a91.23.1788980264796; Wed, 09 Sep 2026
 11:57:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALMSewJPfQXRX5q4X3gJf=LT6m2FnusTM=DBiWsBqRFiyNP_Gw@mail.gmail.com>
 <CALMSewK17jG3MXTHv4Rj+tFVriw9+tqNuAMcX4KGQGy5NQP_MQ@mail.gmail.com> <c0fb5a98-436b-42a5-8e2d-2ffdc6e53e25@infradead.org>
In-Reply-To: <c0fb5a98-436b-42a5-8e2d-2ffdc6e53e25@infradead.org>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Thu, 10 Sep 2026 03:57:32 +0900
X-Gm-Features: AcwNN1UGFTJqKofzEk9iPH0HSBbnTV2M63ynTpBswdUwBjrcLA_4VXVSLlRRTGo
Message-ID: <CALMSewJ2oAVBicSTNbfKU42UEwg24w4L0QNmSx5tQ0v=y9vb9Q@mail.gmail.com>
Subject: Re: [PATCH v9 2/5] Documentation: iio: add Open Sensor Fusion driver overview
To: Randy Dunlap <rdunlap@infradead.org>
Cc: jic23@kernel.org, linux-iio@vger.kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, linux-kernel@vger.kernel.org, 
	joshua.crofts1@gmail.com, u.kleine-koenig@baylibre.com, julianbraha@gmail.com, 
	corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Randy,

> What email client did you use to send this patch?

I used a tool that sends through the Gmail API.

I'll check the received raw messages to investigate the line wrapping.

Thanks,

Jinseob


2026=EB=85=84 9=EC=9B=94 10=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 1:02, R=
andy Dunlap <rdunlap@infradead.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hi,
>
> On 9/9/26 8:05 AM, Jinseob Kim wrote:
> > Document the Linux IIO mapping for Open Sensor Fusion devices.
> >
> > The overview explains that sensor channels are discovered at runtime
> > from mandatory capability reports. It also documents that OSF0 is a
> > wire-format detail and that protocol_major and protocol_minor carry
> > protocol compatibility information.
> >
> > Assisted-by: LLM
> > Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
> > ---
> >  Documentation/iio/index.rst              |  1 +
> >  Documentation/iio/open-sensor-fusion.rst | 84 ++++++++++++++++++++++++
> >  MAINTAINERS                              |  1 +
> >  3 files changed, 86 insertions(+)
> >  create mode 100644 Documentation/iio/open-sensor-fusion.rst
> >
>
> What email client did you use to send this patch?
> It is wrapping (longer) lines for you, in a way that's not good.
> It causes malformed patches.
> You can see it below or at
> https://lore.kernel.org/linux-doc/CALMSewK17jG3MXTHv4Rj+tFVriw9+tqNuAMcX4=
KGQGy5NQP_MQ@mail.gmail.com/T/#u
>
>
> > diff --git a/Documentation/iio/open-sensor-fusion.rst
> > b/Documentation/iio/open-sensor-fusion.rst
> > new file mode 100644
> > index 000000000000..15d41202eb66
> > --- /dev/null
> > +++ b/Documentation/iio/open-sensor-fusion.rst
> > @@ -0,0 +1,84 @@
> > +.. SPDX-License-Identifier: GPL-2.0-only
> > +
> > +Open Sensor Fusion
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Open Sensor Fusion is a sensor aggregation hub interface. The Linux II=
O driver
> > +receives OSF protocol frames from an attached device and registers mat=
ching IIO
> > +devices for the sensor classes supported by the driver. The actual sen=
sor
> > +channels are discovered at runtime from mandatory OSF capability repor=
ts.
> > +
> > +This document is a driver-facing overview for the Linux IIO mapping. T=
he full
> > +wire protocol, firmware behavior, and hardware model details belong in=
 the Open
> > +Sensor Fusion project documentation.
> > +
> > +Device Model
> > +------------
> > +
> > +An OSF device sends binary frames from the device to the host.
> > Devices using the
>
> ^^^ Should be one line, not two.
>
> > +``opensensorfusion,osf`` compatible are expected to provide
> > +``CAPABILITY_REPORT`` messages so the host can discover which sensor
> > streams are
>
> Same.
>
> > +available. Device Tree describes the attached OSF sensor aggregation
> > hub; it does
>
> Same.
>
> > +not enumerate the individual sensors discovered at runtime.
> > +
> > +The currently supported Linux subset exposes:
> > +
> > +* accelerometer samples as ``IIO_ACCEL`` X/Y/Z channels,
> > +* gyroscope samples as ``IIO_ANGL_VEL`` X/Y/Z channels,
> > +* magnetometer samples as ``IIO_MAGN`` X/Y/Z channels, and
> > +* temperature samples as ``IIO_TEMP``.
> > +
> > +Protocol Scope
> > +---------------
> > +
> > +The driver supports OSF protocol major version 0 for the IIO receive p=
ath.
> > +The current wire magic is ``OSF0``; that string is a wire-format detai=
l and is
> > +not the Linux driver identity. Device Tree keeps the generic
> > +``opensensorfusion,osf`` compatible rather than naming a product such =
as OSF
> > +GREEN or a wire magic value.
> > +
> > +Protocol versioning is carried by the ``protocol_major`` and ``protoco=
l_minor``
> > +fields at fixed offsets in the OSF frame header. The driver currently
> > +supports ``protocol_major`` 0. ``protocol_minor`` changes within major=
 version
> > +0 are intended to remain backward-compatible within the fixed header l=
ayout.
> > +Incompatible wire-format changes require a new ``protocol_major``. A f=
uture
> > +device that cannot expose compatible version discovery through that fi=
xed
> > +header layout would need a different Device Tree compatible.
> > +
> > +The Linux driver handles device-to-host frames for:
> > +
> > +* ``SENSOR_SAMPLE`` buffered and direct-mode sample data,
> > +* ``CAPABILITY_REPORT`` based IIO device registration, and
> > +* ``DEVICE_STATUS`` cache updates.
> > +
> > +Vendor-private message types are ignored. Command transport, calibrati=
on
> > +control ABI, fusion output ABI, and runtime capability removal are out=
side the
> > +Linux IIO receive path.
> > +
> > +Timestamps
> > +----------
> > +
> > +OSF frames include a device-side ``timestamp_us`` field. Buffered IIO
> > samples use
>
> Same.
>
> > +an IIO timestamp captured on the host when samples are pushed to IIO b=
uffers.
> > +The driver does not correlate the device timestamp with the host IIO
> > +clock.
> > +
> > +Compatibility Notes
> > +-------------------
> > +
> > +This overview describes the implemented receive path, not a normative =
wire
> > +specification. A publicly versioned specification covering reserved fi=
elds,
> > +extensions and physical scale units remains needed for interoperabilit=
y review.
> > +
> > +The decoder requires the fixed header size and the exact payload lengt=
hs of
> > +known messages. It ignores unsupported protocol majors, unknown messag=
e types
> > +and frames with nonzero header reserved fields. Unsupported capability=
 entries
> > +are skipped individually; malformed known payloads are rejected. Appen=
ding data
> > +to an existing known message is therefore not a compatible extension f=
or this
> > +receiver.
> > +
> > +IIO scale is taken from the initial capability report and is not updat=
ed by
> > +sample frames. Devices must supply scales in the units required by eac=
h IIO
> > +channel type, including gauss for magnetometers. Historical OSF draft =
documents
> > +differ on reserved-field handling, trailing extensions and magnetomete=
r units;
> > +those drafts do not establish a canonical specification for this drive=
r.
>
> There is some help for various email clients in Documentation/process/ema=
il-clients.rst
> that may help you (or not).
>
> --
> ~Randy
>
