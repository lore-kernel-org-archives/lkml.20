Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793086344;
	b=Ypy15r2aiaTu54PHxJKVLBwj/fAeP7l3hm7Z4mjxXUu0S3fIc8gBME6fpYcvoTJLOrwZ
	 nViINOIAsdNyrxPCOe/ZEfrIfv16u7q80zs0qK3dAMyIk0HAe7epT3kGgPRAvfPznIkzF
	 matdj3RWl0cmWVhOPYqy8vWV97q+BHkcCB6pQCmCz19vTmBrJ1mz5O5U7bzhdK56APWZ2
	 6aqcvO/ihFbcgFeHY/9czMj6NoJVFztzFFAFNrofWAVyZ3Z43HU3xmWb3QgAczL1lCP6G
	 qqw5vxqrswmTMwGS1l5LFcmiANyn/6ZULX76Wj+c02dQaAalhpetWjSqhB/1UUHhIEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PlM8k58acyW5zFw4kquAsGUaXk88HzstxAu1xKTj+EE=;
	b=uEnVYAq2jmGjcmqVB7WNTM7o8bZnVoPTtcvDYAOJ6XMsoLnhkx5xeIpHygJ/tdBCa6Gf
	 NiCpUoDNyj1CHGvGEQhT8DjnNv5mu90w3uz87T2vvCHIp5b++evCzWOaaI4/G+vQEcEvU
	 7gdTwfNj1CJuGMjiaOiPFjrlJsHglEwjKU5YC5DHlKIP2VvPkj7p0M/+sKi/KiQPasT/7
	 hH57dknTwiGc+5g/8SmsJAZINlPisZ/FO/GeawwuSHzHrOb/9qv8knF+IBdQRruHu2hWp
	 wh7DZ1KX0oaGAjBNbc/zTyOEmVFPAOKFT3xnOEH1QEHs2G+JqaZvtE411Km2rUAoYiQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YL8BP8wy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1F0606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE1F0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YL8BP8wy
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e9eb579c0eso21682985ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:32:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793086343; cv=none;
        d=google.com; s=arc-20260327;
        b=i3tYONOa1e9jDbTTHPaZdx1clXXWVjYuBrkGaYdXOxKRXJOmsjyq33WZrQqxOxpoOc
         y91AamYcjJXgkN0YV4KhYr/AKJxAWXBAWaWM6Dk40kdZ0wTvXkWm1jEc33ER0ue6/PNK
         Y/eA87xBzczTE4V77Rc0wPN9E/oy+oRtycvNIn920ThYFTv15A/SN8WD9dXs04Bwzxqi
         M/Jg1zbn5fyC+LK+Ke5UyKt/ioytIDWwvElopWBLfoXF4UY1CKnUAYdJlnRDDkpZHPor
         mwZH5EovAh8fnFAwya8EFoWJ0CxvEDBWTYk2tnAXY+GUwNMOogUlthn4VBX2uhdXqcdc
         1Zaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PlM8k58acyW5zFw4kquAsGUaXk88HzstxAu1xKTj+EE=;
        fh=NoRUVrdAtNn0rgZBTFE/9rwMW5CoTCM8GkNaMd59mUk=;
        b=MkVHRD+519XwOvvU8LFHArVLxyKgWNKMooMvVd3oIQ+X4TeK5wVjMXXJXOPp5+UZ2g
         rUL9VDuK7ertILUhp3nWV+cviJelIDKGb7OvWZn0T+8RThEZ72PHv1JLqtKosYU1T2oo
         9LEIMJpeszAoof6JSEYT4PYJd5X1v5D0SyXMXlMj1yljxpT7jEHjKEpkIhFyAIxapfme
         q58lxQoKnviV3IlUVkMzH32ng5mgrNuyCnm6TfLpCDTpy877rkUzYe9jS0+MRpsmJWZ3
         f9Rp5A+12T6APUUwP5muh4W9ANqLuSRWgo4OpauczkVSv4P2O0meDgw0uJBv3ezeQvgv
         mdUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793086343; x=1793691143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PlM8k58acyW5zFw4kquAsGUaXk88HzstxAu1xKTj+EE=;
        b=YL8BP8wyexK/8SFCO6OfsU0UaXLGTHRdaSjVBfthdxT1em3vn+LU1OwRwHpjjKSe85
         xbIdgiqC24a71dwg6nLRJ7AevpIiXtaYPBBBdaBeMo6O3nDYhQbxz1T3IpcSrbMhz1aD
         TT/dNLYNXzXVACoviOpQfR7Iu8F63ueoQLTIDvqkLM7qMSpfMiWi/xBwCbBKZry0pY7r
         epkz7daeoH6cBlCntkg02KdZJI06KQEb4XOjHfUVbPMkO+PNv//rpRqVQkIkD23g0qEE
         ORrDS6JnsryHSsbuv7pubZi/pecDF1pFQB5PyYuagf2LBpPEZDaiYFzNzQiJzfHTEHAb
         WpFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793086343; x=1793691143;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PlM8k58acyW5zFw4kquAsGUaXk88HzstxAu1xKTj+EE=;
        b=nCfCL3gN1jE/ulvf8zTpOlAk2cuCfxgr9kqxpZiDjOwXb2ZKcAj9ZNKfU5mjpcG2by
         pejugwm0THXPybXAq4tunybW/mqE+RDqxseg71+nWGQ5UQ0cOpJPOsojcPuPsFmwiskL
         F2KQEe61x9WcNJEAwIRBWyfsWnzRzMgpGM1vcTas1oZJpoFGrs8pgmfEVl+8lWf5M8AX
         +0NpssNBUzUP9C1APEpdh7e5noD+REk9QV4SopZXob0xIwnDy0/r/dc6lkB1DQX638zw
         LDfHKM/P4h8aRrBeHJ3NH+VpJD2Ma6ouihqoE45d8nF8hKv6jAwizIMrk7RjjEK54qzr
         2l9w==
X-Forwarded-Encrypted: i=1; AKwUvByu1gJhojmmiuuaori/z/s9yzozzH1sWteRdlxZBP5tJm9EMpbxiO3UQ0c14AjNMmem8Bln1y34Sx/tufk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRwmc0GkVFB2G4PnuFdKIEFEdaRRIqefod5Y6v7SLobYvcOs5q
	vbm7LHwhWc+Jebxsb17FR/2KVQyvaTwVVpcy4y2VeNCSoKBzZ4Sccu9iKVsnV45VlWiW1j7n84c
	EkqzkGpuINdp2YY2tTCILG7Zj6MWchrY=
X-Gm-Gg: AYBFou3SQmFItg5BJEvLuJdZc/QCKacNLYP24WFjF87wcRp1bZPMtrH5WGefNPooX1i
	2NvT/aPG7T7NO8jH7zk7fZ1YooT41yVVvryY8S5bTcvxJaDd4IKnFq1dc2Sg9nnqFqyzTUixIjm
	zQ2qYPGsA3YwBblGC6/6ikPLgI0lxFTtLZeABps24n7zPKx9PVA762y3zDzEuw+qQ7KxLksbygJ
	30TQl8gQBvlvn2oBKTEJ6815EvIykzKv46naGP1gdofO/yhyV3LZyPoIyaRTEJGsWPhYF/WN5KT
	y8fJgwh3HJAahZpa8dQCQIXo9VCZm2Bjz/tDKz4KORat5ItiFdSgUFIyWSy11Az9//joLN6Okyy
	YnpUMJQLxy8+7U2VG3XEWC5W6tz63fGoqvg1ktKI1m81e6ds4mtVs
X-Received: by 2002:a17:902:cf12:b0:2e9:66c4:1713 with SMTP id
 d9443c01a7336-2ea9c917ba4mr66194015ad.58.1793086343005; Tue, 27 Oct 2026
 00:32:23 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026003918.155321-1-pmazzini@gmail.com> <20261026003918.155321-6-pmazzini@gmail.com>
 <f68279bc-20f1-41a9-ba5c-92b974785cd8@roeck-us.net> <20261027002635.6b831c0b@kemnade.info>
In-Reply-To: <20261027002635.6b831c0b@kemnade.info>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Tue, 27 Oct 2026 07:32:14 +0000
X-Gm-Features: AclHuK8Ysr_hMD-q4J-bxGC_qjlgkxL35TncLn6mKe9lS8sJrvJ37KNEcPQTV5s
Message-ID: <CAAxh=jsKe95EsKnTypXtfTxGhYCMO1E7U=hWb3y6DBpgoiOVUw@mail.gmail.com>
Subject: Re: [PATCH 5/7] regulator: sy7636a: report the temperature
To: Andreas Kemnade <andreas@kemnade.info>, Guenter Roeck <linux@roeck-us.net>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>, 
	Alistair Francis <alistair@alistair23.me>, linux-hwmon@vger.kernel.org, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter, Andreas,

On Mon, Oct 26, 2026 at 07:35:24AM -0700, Guenter Roeck wrote:
> This is going the wrong way. The correct solution would be to convert
> the hwmon driver to an auxiliary driver.

Understood. In v2 the hwmon driver stays in drivers/hwmon and becomes an
auxiliary driver of the regulator, which binds the I2C device directly.

On Tue, 27 Oct 2026 00:26:35 +0100, Andreas Kemnade wrote:
> But it introduces another race condition.
> The temperature might be read too early.
> 1ms delay should suffice.
>
> The  SY7636A_OPERATION_MODE_CRL_ONOFF flag might be reset before
> reading the temperature. If that register does not reset to zero
> but just keeps the temperature last read, then we have no problem.

Good points. For v2 I read power good (0x07) and the temperature (0x08)
in one I2C transfer, and return -ENODATA unless power good is set, so no
locking is needed.

Thanks,
Pablo

On Mon, Oct 26, 2026 at 11:26=E2=80=AFPM Andreas Kemnade <andreas@kemnade.i=
nfo> wrote:
>
> On Mon, 26 Oct 2026 07:35:24 -0700
> Guenter Roeck <linux@roeck-us.net> wrote:
>
> > On Mon, Oct 26, 2026 at 12:39:16AM +0000, Pablo Mazzini wrote:
> > > The separate hwmon cell enables VCOM at probe. Report the temperature
> > > from here, as the TPS65185 and FP9931 drivers do, and under the chip
> > > name as they do: read it while the rails are on and return -ENODATA
> > > otherwise. Boards that need the rails on mark VCOM always-on. Drop th=
e
> > > hwmon driver.
> >
> > This is going the wrong way. The correct solution would be to convert
> > the hwmon driver to an auxiliary driver. I am not going to approve
> > this patch. I am not giving an official NACK (yet).
> >
>
> First we need the problem defined, then the solution, and then we can
> talk about what is the correct solution. The commit message does not
> name a problem.
>
> So what we have:
> one bit to turn on a bunch of things,
> after one time to sample (< 1ms), fresh values are provided on the ADC
> register periodically.
> after some more time (max. 50ms), several voltage outputs are ready.
> Powering on those things is expensive, so you would not use this as an
> ordinary temperature sensor.
>
> The problems I see in the sensor driver this patch might want to solve:
> - problems if the regulator driver is registered earlier.
> - not having powered on the regulator all the time (that is described
>   in the cover letter)
>
> The way the patch handles it does not require any structural change,
> availabitily of the regmap is given. So it would be a separate cleanup
> patch.
>
> But it introduces another race condition.
> The temperature might be read too early.
> 1ms delay should suffice.
>
> The  SY7636A_OPERATION_MODE_CRL_ONOFF flag might be reset before
> reading the temperature. If that register does not reset to zero
> but just keeps the temperature last read, then we have no problem.
>
> If not, there needs to be some synchronisation between the regulator
> part and the sensor part, probably a mutex saved in a common structure.
> And in that case, structural change of the drivers is needed which
> I see the following possibilities:
>
> a) non-simple mfd driver
> b) aux device as a child of the regulator driver.
> c) regulator driver containing everything.
>
> No strong personal opinion here.
>
> Regards,
> Andreas
>
