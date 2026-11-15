Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794743763;
	b=khqpTBkQT8Bu1XBOvp3EFNa+/uK+se6eu9rUxkASt2vJ8nM+k2K5aaTa6LO7BTKyFZQD
	 3a16FI2XYZ6IWIKPl+pjWuITDYK63vpZ1E8sdKmUq8IwiaK/RvlEbDZOE2lWauMZG79gz
	 y7ePfgajug8SeCNfvFdgT5h9seXs9bGKgJOrbQEXEmmd/sZHpNhrvwnkQZdK0lYMaLEDi
	 +6ji6f5dpR3VS4ygTv9DGVDOBVsUdECbLt9lg7x77RXBvJHWFSMb1pzgc9x+kjC47IETk
	 skTP210h9k65b4d+TFniNf+yDGbAzxVH4sw+83rbuOibwRi3+M2SO8q2tHe+v41w9fw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=DcZj323bZhr2RPb3W8Nx/e4hADQ8eqTgk8RkWPbabR4=;
	b=ptIdsUlC/u2tzkeN8oWDTAYCCrWEx/08M1kYiSXRr2iLUYc7ZRlxM7GebEzm76XNSKhZ
	 QVZAIlicOKzi4LJk0Y/Vp5HdJQFK2qdPNDLEZi9xD0d4Bh9ErdKqV/csMfHvPeFEu83Q2
	 9ix1yPq0DMlw+z9EH1T6eF2DPRm0GKCBQ/v3D2NEJoIpt9DVTQuE6bbFUH9Z9qxwDjQRx
	 8oQsemQsX2bxyKcZTVhEI9DBs5jids5qSpoy4vtrZjbkbZzCl13brmcSf6oYG0SCd0rPq
	 HRlyF0IFKHAiXTbntdIoFkJACfhS11NyecRkNTr3ClX4aVwRuZBKbvj0KRSz0mDWo/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y9Q+sl4U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDA0606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 11:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFDA0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y9Q+sl4U
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c50dd1e2f11so1751466b.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 03:56:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794743761; cv=none;
        d=google.com; s=arc-20260327;
        b=TMQWCJniqAqRdXYeIww55jyBzHlU/1IhSRgq4sLILfJ12pVLlWW+lgQP+zaRG1C1zc
         msN2OGM9s49fGAlpqqZ9TskQ6wVRBZHdYU4s/pGAtg97qch2K3MD4TMGbOjmIUDMdKPG
         AVRByWmdDGQnJ6e2TbBwph9rmZblswgc4VACYx5rD7clrz4T5ip321xMqVX11r50gB6P
         rTc3b9Yt/ZJSAmQbwtj4TamBqZsUb5lLhZ6l1FVF7Ai/S3DnuaV6g0O6xTPMTZraZlZo
         f6GWqbBJ5qFEWVYeTurro09+M3mCnUhDqrQwMHXInca7CJ0NZp0/mRphE0mhsMdx+ucZ
         Og3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=DcZj323bZhr2RPb3W8Nx/e4hADQ8eqTgk8RkWPbabR4=;
        fh=KFHHQFHtVRi0SAFwiUVgR2okel5vHDuEunlEtBFa6h4=;
        b=ciHeLhwQ2k9YU0f8EYIOzySFxS5o5/RVoS8bn95wk2B46hH49o4p5tIIFkW9gNjZxp
         6l9QEOd2/OAeXbYUW2AZfTTRXvpuwNJvjZqJwlprbW4/HrYHzvvd/uDEJpotqVc/pVef
         KrzIO2UyuAGsF0o9bCqg9XIQd/Fc7N00TA2CAoO+5KabIk3GBau8v2qjcWC3q9mXN9JH
         StMkb8mZ4vAJsuDc2MjrSCOQcZdXZSRqEHmZit+y65OG1YwybkYfwz2CMo032jeWw6aL
         ujwVmlUHmXxeYL5QoCSO+IH9Sc0PWxvxuKueqSrd57oQ0uG56UboqXOUTP76aOahoSBd
         kHrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794743761; x=1795348561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DcZj323bZhr2RPb3W8Nx/e4hADQ8eqTgk8RkWPbabR4=;
        b=y9Q+sl4UDdP1dZ+RGdjjMnFg1HIgE9Gjk8kPMowSI1RTz8naQMREXIHKlXV9N8aX2q
         eZhrPrcocLRcLN9WYCTOsQ1HOddvv/LB0Z8bttXyZMAi3uS2IjYD6TEAIt8wG2lKW5Hx
         i7wVarSD8JGN1r9thN+JGyAxfZdG/vHHwwJF6A0CtDX5KTKsbagnBtJlxHla/RwbBAHa
         mx6JPXQ9a5gOLBs1EDW5IBC9JvVtWd+7qEDdjdrpNe8OmkhzDSbZn0gsce2/wK9yKHTJ
         vSAAjPwnT5qWMFwSMwEsVSMuUhhvtzlj4QCT/+oP3kA64IjTouyy/VsJ7uLwwEH6P7wQ
         qC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794743761; x=1795348561;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DcZj323bZhr2RPb3W8Nx/e4hADQ8eqTgk8RkWPbabR4=;
        b=pQEG8ZU20SCho83sddIwygFpRHwpqnQ/PfxHMnMC87DV+L3DsQEykzzWMDehWTTlbW
         HPxA1n52pPpRiteWTVbKXUv5Xzu18n1eSDaGBZyG0jlFH+cl63baPeF4a1bjA95lAonN
         rPfnHbPm4cg1VytvKGI6Tqs1xnF63+9eKj1jYfF8NfJpl/7wFb8I/IxwctjxvoHQdQrm
         pcozrpxV6PYff89dBZ0CVvVni+67YY79QxZ2OfUOpfikYzTkLWc9Cvgjn/2u4KQDDPhm
         jAwxpJ0KHf0LA/1xM95Dhq0eWIV74I+U7q0VvivfOyce0AUP5urJenxwK2Ru3Jzo9Ryl
         OOpA==
X-Forwarded-Encrypted: i=1; AL+hErFEDxc6/yCKSV+mkS3mslQepkYFHzQVJ4F7DwebunnsLSSJyXshaLKhbGFjGhXcTqjQmfvyzuj5V98aE1w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ysmn7ETWz5xUX1pPT1Xz0PAcJllGAcKHidwujfMf6UxIEHw6R
	W4EBvh/mbKVd4FceopjSZgyFVsnHPtZ4089JjWu0J5Tc6pr0P08/NX1E+UqjONrZWDxR+PHwP5c
	uQPt1FajNlgN392PlnSzEsfGnxarl9n0=
X-Gm-Gg: AYBFou2TbM8QmTcrrNVJA41DJ3O104dLl0sFlt6aYXRd75h7Mk0ne0Du3vr8+FVpdyK
	B9ep7UEaqqSV76rmmnq8NnNFA1CrInNH7Prumfjk7gQTH2H5EscJqqJ3jOExsJQJtkbJKTAfh3R
	mLpVkXer9Tm2pzgiHcuCFs3+HaHaoNsBpBbmekw02IRa+R77W9dekmmcMJGNoX47tbJt03cCCoz
	Crh4IMgKQfM10nHJKFPbYYXl9eSOkhwivK14NlZ6hp83w5hxRq7L8cQNmf+gWa1U5oHcaoLy4ez
	JGQZVDqWo+eMsRt7Q+e7+OG+B20znGTfQgZINljBQEQ7NSzfAJuFJ8LKYZZ/yz96d5TadX5p9rC
	iUURI4RvBTPZjcL1ivnjkKnCIoTGdl7VygrjyRd4=
X-Received: by 2002:a17:907:60d3:b0:c46:d493:501a with SMTP id
 a640c23a62f3a-c50963427abmr712093866b.22.1794743761122; Sun, 15 Nov 2026
 03:56:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: skyedryv <skyedryv@gmail.com>
Date: Sun, 15 Nov 2026 19:55:49 +0800
X-Gm-Features: AclHuK_8g57vUNNcN8WCMoxcQIvtE3ah3lY4yYDivjNSAjpdIXdf2fRwg08yWIQ
Message-ID: <CA+Bqb3R2ZCrZZr6pUqLmw3qXMSA13Ft3nYqCx7jv+5PDEuH0uw@mail.gmail.com>
Subject: Re: [PATCH v4] platform/x86: asus-wmi: fix camera key LED on Zenbook S14
To: i@rong.moe, jose.guilherme.cr.bh@gmail.com, git@turtledev.nz
Cc: denis.benato@linux.dev, hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	linux-kernel@vger.kernel.org, luke@ljones.dev, 
	platform-driver-x86@vger.kernel.org, corentin.chary@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rong, Zane, Jos=C3=A9,

On Wed, 2026-10-21 at 20:34 +0800, Rong Zhang wrote:
> Still, could you confirm whether pressing the camera key during s2idle
> toggles the camera state without emitting a WMI event or not? If so, a
> resync should be performed on resume.

Data from another model: Zenbook S14 UX5406AA (Panther Lake), BIOS
UX5406AA.310. I applied v4 to the asus-wmi in CachyOS's 7.3.4 kernel
(cachyos-7.3.4-1) and loaded it in place of the stock module.

On this machine, pressing the camera key during s2idle does toggle the
camera, and the WMI event isn't lost, so v4's event-driven resync covers
it. I tried it twice:

  - Stock asus-wmi, with a userspace logger on KEY_CAMERA: the press did
    not wake the machine. On resume, KEY_CAMERA (WMI 0x85) arrived
    within about a second of "PM: suspend exit", and the camera was
    disabled.
  - v4: the camera was enabled and the LED off before suspend. The press
    during s2idle lit the LED straight away (it seems to have woken the
    machine this time), and after resume asus::camera read 1, matching
    the camera state. No userspace resync was involved: a CAMERA_LED_NEG
    read a second after resume returned the "LED on" value, so the LED
    was already correct by then.

With v4, the rest also behaves as described:

  - asus::camera is registered (max_brightness 1). CAMERA_LED
    (0x00060079) is absent here, as on the UX5406SA
  - the LED matches the camera state at load
  - on camera key presses, the LED, brightness and brightness_hw_changed
    follow the camera (1 =3D disabled), and video goes black and comes
    back
  - KEY_CAMERA still reaches userspace (WMI code 0x85)

Cold boot: on this model the firmware re-enables the camera across a
full power-off. With the camera disabled (LED lit) before shutting
down, it came back enabled (UVC privacy 0, video working), with the
camera and mic-mute LEDs both dark, which is correct. So the "dark LED
with the camera disabled after cold boot" case doesn't occur here. Not
tested: anything on a model that has both device IDs.

Tested-by: Sky Dy <skyedryv@gmail.com>

I worked through this with help from an AI assistant (Claude); the
observations and logs are from my own laptop.

Thanks,
Sky Dy
