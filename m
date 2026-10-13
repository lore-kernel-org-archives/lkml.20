Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDD13321C2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791867768; cv=none; b=EpOytzytY8X9PLmy/ZzFCiSB6NvMfFzTC53Af72ZYT8iF933lT8WsUsR2TUYnfzMKx4ki1U8/5SvF2gDKOetITYQaW0yB3xVPlEUMbreqOiIeN0g3JLob+by34ZDtzduifWpxMTahfHQ6M9qzBp+aeTquWq0hIwMjB+ICfKY8oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791867768; c=relaxed/simple;
	bh=h5+rSj/bCzh4KisRqwxzi0aZUIfxwQb53cIVUp+xnT0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=mgeMAEJqy8ihPj0c8Lm7B8rNIsU3HdZNSgTHff/Vn2YGkdRxwlhbfyhCGfxbXXU9JQRxlSDJshSrX37DeZXj1Y0ENzN9QlLn2JOuvKo75SiqJtVwt24Lt2oylxA4XlgVPKNOwl3uKKFDVS9iffE5VPVMNU8mwvt6rdLn9JeJWp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5zTJmR5; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5zTJmR5"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a75f960be3so22724501fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 22:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791867765; x=1792472565; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h5+rSj/bCzh4KisRqwxzi0aZUIfxwQb53cIVUp+xnT0=;
        b=l5zTJmR5XyNMAdfQFLDSzbYMpXKXrrL49qd0yOhMqwLKJgoiRGS50C2j6y2cmiTloN
         t9bpAJXYICgsLEt676nP6a0nSOip2V42AJ+uTt88o7VkehCoqKgjU9g0B1ppJFFC1SzY
         8g8j8E5AjgyamB9R32za0zFAowZvras8RVqRvWNx38GHNGIgwcEPzoYGIHmtKIz43/IC
         PP9BL33RO9DsNRIbA3KvnSaesEzozCYKIoMWGMiNozqSGLlwPR5tdFu4SeGIMBzlk5Te
         aloBVy9+74De/j4w9Wf8NwRwBfb93vobM8xqMbdNuZMz70mVniQKePGuzyXF7fwtfvn0
         BPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791867765; x=1792472565;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h5+rSj/bCzh4KisRqwxzi0aZUIfxwQb53cIVUp+xnT0=;
        b=AhDbF6Dihg8P64+0GjbjnnohEiK1fwu/rekp/c3RfEURDzpAhDNawXtQ/kbUKOv02z
         AqhawAoWb85c/v6ZkaHs9NtgYtS/HFJdq9ndmWBJRt++xQDpUgmpQAgQXUT+REBIzVNz
         GdhbUrxjvipoujfkVmso+jfwBPteI9RBnVP0niovNpjvNuXNxSA1MyYGppNjTBZgqaai
         tNrv86p797HvVPXnHynTg302zYNPZdCLqVoA1g/7Q4WbUS0LBL1/LvxUPe8xfWRvQi0r
         cfOQi5Tymha2nRJribYoUXcmrgRtJSe24Nxfg06k1KTju9SiMd+yxn1lfNIl1O27TUBZ
         eO4w==
X-Forwarded-Encrypted: i=1; AKwUvBx86PC8PelTjf9VvwAHctAjcA4Kno442gjYGgLY7J4vdT/1zpveCax4y3X98E38y/sorFFxUk1pPJgS/zA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3/YlpXit62YEjGo5BKIysWvKYldV+iWThsi4/lOspyjAvdPhS
	SxsVRyNvzNSMof3VlMw4PAmfcrske/RdERfVT6LZ7aqWdf1GZttzPXdy
X-Gm-Gg: AYBFou1DzBpNM1OHww1I8h0m4454iMp7nZspDJoyiLhtMeZ/t5mXkLFf0KdclSqmjpk
	fypSraRPoAheQkaI0AMXc1qJkYrMcaQ9Tp59gzg0+HAcY9Ud3HfzoExo/VVaZm7G7QobgmAaweR
	lyD9k/tY5xz2ImEsty0+xRRzXEzmkFhSdIeU1WVZoI2AFKanBfAo2HL2Q2p8cPkmCHQp6SIpvyO
	9L5wqqRJ+PqHfxZqaWP/3i7Y8SYnMc2Xb6lMgRkpj5YNNpl9iGouhv2JHrNLZxuXxM/RBvKcZe2
	8sCeMIBIIy+BON+MYsOI1xtQR4l5sVCaV4jiwOLPQczlX7whXmCvmrALRtaD5+FqFbD6tOsF0XX
	oYsVgbYlfqlucR97OPx69+3Svxmsifk1fA/C7pmkbCIlU/xyyNnYTCjCrn173pJM37INCTxkMPd
	mGwsTB8i73mmxTvJao3vQ4u45Wy/4V9mBm6o9VtHyTmUpF/BmY412EaKb1sXTxEpaFuOArQ9J7f
	KpdlwkZV5pgp7ZyCRCg80sNH6ZchQ==
X-Received: by 2002:a05:6512:3f20:b0:5b6:4ae:d87 with SMTP id 2adb3069b0e04-5bcde6c3cb1mr3982535e87.27.1791867764438;
        Mon, 12 Oct 2026 22:02:44 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde912a7sm3212589e87.18.2026.10.12.22.02.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Oct 2026 22:02:42 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.3\))
Subject: Re: [PATCH] drm/panfrost: reset the Amlogic GXM GPU on runtime resume
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <179184031154.1056803.12154076398577087527.b4-review@b4>
Date: Tue, 13 Oct 2026 09:02:27 +0400
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <6B9C57A7-8BE5-461B-B44B-EF91FC2D2D93@gmail.com>
References: <20260930125629.2691968-1-christianshewitt@gmail.com>
 <179184031154.1056803.12154076398577087527.b4-review@b4>
To: =?utf-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
X-Mailer: Apple Mail (2.3864.700.51.1.3)

> On 13 Oct 2026, at 1:25=E2=80=AFam, Adri=C3=A1n Larumbe =
<adrian.larumbe@collabora.com> wrote:
>=20
> On Wed, 30 Sep 2026 12:56:29 +0000, Christian Hewitt =
<christianshewitt@gmail.com> wrote:
>> After its first runtime suspend, every power-off of the Mali-T820 in
>> Amlogic GXM SoCs times out and floods the log with shader, tiler and =
L2
>> power transition timeouts. Following a soft reset the cores report =
not
>> ready but PWRTRANS never clears, however long the driver waits.
>=20
> Would you mind building the driver from the latest drm-misc-next and =
testing
> whether this is still the case? Today I merged a patch series with a =
fix
> for a long-standing bug that prevented the device from going into =
suspension
> because of mismanagement of the PM refcount. It might be that what you =
report
> as an issue triggered by power transitions is something altogether =
different.

I=E2=80=99d tested with the v12 iteration of your series in my =
amlogic-7.3.y [0] tree
before generating the patch I submitted. I=E2=80=99ve now tested with =
v15 (as merged)
and other recent panfrost patches you submitted (which v15 depends upon) =
and
with this patch reverted, and the timeout issue with T820 remains. I =
also saw
a splat that I wasn=E2=80=99t seeing with the v12 iteration [1].

[0] https://github.com/chewitt/linux/commits/amlogic-7.3.y
[1] https://paste.libreelec.tv/desertic-cataleya.log

After reinstating this patch on v15 + dependencies dmesg is clean again =
[2].

[2] https://paste.libreelec.tv/leptosomatic-cherlyn.log

>> The transitions complete normally when the GPU comes out of a =
hardware
>> reset, as it does at probe. Use runtime PM with reset and clock =
control
>=20
> panfrost_device_reset() is always called as part of the PM runtime =
resume
> operation, so I'm assuming what you mean here is that reset control is
> deasserted at runtime resume when the SoC supports it

I=E2=80=99m firmly at the hobbyist end of kernel contributors and I=E2=80=99=
m not able to
technically explain the patch Claude created. It=E2=80=99s entirely =
possible that it
pokes around in the right area of code but is not the correct fix, but I =
lack
the knowledge to dig further without explicit guidance. I can also give =
you
remote access to a Khadas VIM2 board if that would be easier or useful?

Christian

