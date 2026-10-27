Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793096804;
	b=O71y2/ufuxHWoJvFoTSRLAQ2fbMMJ+YmN1B4HqCp7ph6foMsWR+A8UJe2XUSVqfh+I/0
	 xkDmxA/aADaY+UNsyN3KR6AyCGutX8IIh8rWNBhAZnOALPtT6GOH5gJBk1afGq6MqrVFZ
	 vBSklIpCIl4uFLdJVAtbM0wTSmK/Coh8w+zMicbu+aKIAvrQjAAwhMyzhs6nE9X4dsXyg
	 7ojH+xWIqxKaE7ZYzKc3B+G6NqntPUYUhUqD1Hx1vP0NtC2XbluKZNZQanNGc315p7iED
	 NUqyVsJJZCkwQ6AtoeCmxwX7nl44rJviAQzajOj1Zd3x9arexmDQuJaqf3p7yHzwX0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096804;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:From:
	 To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=kf/5mGeviQ9IqvCDXNAwVOBtGQf0/RjNBw7LcnbKbJc=;
	b=DgNLahKyaaY2LNEnT69T63VJdSC036TJe3nVKSGk4QtSeectVAg/87zRKtD0Quv0uLDO
	 RyEGuTWHry7AD6r7pJxoC0vLudc2dkDcFUNPG0eD6i7D8k98GTMqsNy4V2Xy6andfvTS2
	 zPq71xIRM0yBappvIFaaCcQ28pZqpUG8kH8juV+PTqs8ab3mc+Sotqjdx8n4of8u8o58z
	 BXEMzuqcGhgzVg5JmToYhVF+70B1VhavmcBA2hCEM+cPvWeS5MsE75HbhG7KGRjD8VCVo
	 319bYnfrcSIkNQduKzBKl6tpkvmczGf+VGQiI6C8rrcFa3TmXxv4ZQea+eWkNVQiDRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5D7606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F5D7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso9129605e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793096803; x=1793701603;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kf/5mGeviQ9IqvCDXNAwVOBtGQf0/RjNBw7LcnbKbJc=;
        b=eyd0xsbqCJdxmy8nkXIVwV3ZQ/MwNIpGla9XUv0RV6aQ2jqBNHlc3jjKNgJu2Grw+6
         KQcgIrlUDnu3P0okIDPyVnZigW/OPfvwEX0XOrlSf6b3WlN0R6P/qZ2KoacM9DgVry/E
         E13XGuKYrUcPiBrhurkKXlGZeK0fsJDmo9W0T9KLcGxxBkfTfaJ/vlgAYpqDSY9GC02o
         ql6n+p5DGETM9fIvHpRZNVlT8m3RVGoUfNTH5IjynW40wDLs1i1ZDC8hxXG4LUCW3FD9
         SvY4VpNtfMYKVW+fsnWWKqBoyW34UqPdsbZBmIdf9IGmIRn1QN2FWZH9o5C5QPsuCDQs
         M7jQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBMVlkrMTv1FBm4+aAsZUROGZM6M/y3N6kds44dY4F24YeN/FNg5c9+G4RHMZ/C6Bxe6XkSzkmP+gLXsk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIXFpgTwx4Efyb1SXZRvHV4P09jyAPqQqOy5X/Fojv4729UvBs
	l32BE3YCJQJcpi8NU/1/GCV5sQat20WRgFD1IHLUp+hPItdYhQ16vtgvFAuJllaSkA==
X-Gm-Gg: AYBFou0HFwJQH1RXbhti13Zna2JLtvrejhOiknNiSUG3KBlPUEJIWfFM4HFKAbKgu9D
	gyhVzH0ebhgIyAiMm8kmZPmJXtpzwTOcyiBGpyb9jgEI6OYczwDMfXTFO1XM15MW9RZ+mazD8d0
	y4HPnqFXtvZ0E8g5rHgbCuNQWevyKPMrHcOKJ67auR2cVy/WJF/PbQDu+KxO4G6sJq3Ec7OI7Wc
	8LE2nMW5BtUqabH4mB9UMqy5gEBqoLndCFKnYMsR1k8rZ9DuwVG1LJrQ2RiOdpYNhNt3eEd6kMP
	1NkeGfXqr5fFZ7rv185b6D9Cz8japnWn253FEAmmul6T0nv7Kp96mjEIcjDVBU725fS04f8DEjN
	dllKZ03dVi14VkNmgQwD12wFoP+t5XMrZPiaA2e3YvyAzAvZqstwsBaEVaTaJdiBqK4W4QMofCs
	c+QUh09i/XgPMEYMJ8K10t/bgSOuIqSFYRzJ90poyvEcMYqWOJZGn7Cj/k8Tup1sbpyeaB6BHgW
	nmi5i4TRJ9hIT62zjRWoJiSzBGtZ8X17gR4K9H1n3VQwwMF2HUoMw6Ysf4TJmEEkx3XKvAyFfHU
	a0mp3sHGpuxzWns7gOv3dMMQyOCiMvcdI7Q2W9k=
X-Received: by 2002:a05:600c:3e86:b0:4a2:cbe:bebc with SMTP id 5b1f17b1804b1-4a35aca5f94mr176916205e9.23.1793096802498;
        Tue, 27 Oct 2026 03:26:42 -0700 (PDT)
Received: from [127.0.1.1] (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359f3e00asm444137735e9.0.2026.10.27.03.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:26:42 -0700 (PDT)
Message-ID: <6ae07c62.e52dcaf0.293af3.e647@mx.google.com>
Date: Tue, 27 Oct 2026 03:26:42 -0700 (PDT)
From: D. Manresa <dmanresa@gmail.com>
To: antoine.pichot@gmail.com, linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, mchehab@kernel.org, djrscally@gmail.com,
 dan.scally@ideasonboard.com, hansg@kernel.org,
 andriy.shevchenko@linux.intel.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] media: i2c: ov7251: fixes and infrared strobe for
 Surface Book 2
In-Reply-To: <20261026111032.88355-1-antoine.pichot@gmail.com>
References: <20261026111032.88355-1-antoine.pichot@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Antoine,

I ran the series on a Surface Pro 7+ (IPU6 Tiger Lake, 8086:9a19), the
front-facing OV7251 at i2c 3-0060, on a 6.19-based kernel. Patches 2 to 6
all do what they say here, so:

Tested-by: D. Manresa <dmanresa@gmail.com> # Surface Pro 7+, IPU6 (8086:9a19)=
; patches 2-6 only

I have deliberately scoped that tag. 1/7 is a regression on this machine
and I have replied separately on that patch; please do not read the tag as
covering it. 7/7 is keyed on DMI_PRODUCT_SKU "Surface_Book_1832" and this
machine reports "Surface_Pro_7+_1960", so I did not build or test it.

What each one did here:

2/7: reproduced the bug and the fix. Unpatched, --set-subdev-fps is
accepted and reads back, but the VTS register stays at 1724 and the sensor
keeps delivering 30 fps. With the patch:

    requested   vblank   VTS reg   measured
    90 fps      92       572       90.45 fps
    60 fps      380      860       60.16 fps
    30 fps      1244     1724      30.01 fps

3/7: v4l2-compliance on the subdev goes from

    fail: subscribe event for control 'User Controls' failed
    Total: 44, Succeeded: 43, Failed: 1

to 44 of 44 with no failures.

4/7: camera_orientation reads Front and camera_sensor_rotation 0, both
read-only, consistent with the _PLD here.

5/7: no functional change observed. With the new control off, the
registers read exactly what the mode tables used to write: 0x3005 =3D 0x00,
0x3b81 =3D 0xa5, span 26.

6/7: works, and the register behaviour matches your description exactly.
The control appears as strobe_output_enable and defaults to 0. Read back
over i2c mid-stream:

    off:  0x3005 =3D 0x00   0x3b81 =3D 0xa5   span 26
    on:   0x3005 =3D 0x08   0x3b81 =3D 0xaa   span clamp(exposure, 52,
                                               min(45% of VTS, 776))

Both clamp limits are exact over a 12-point exposure sweep from 1 to 1704
at VTS 1724, and the duty rule holds as VTS varies: 1724 -> 776, 1280 ->
576, 880 -> 396, 680 -> 306, 572 -> 258. That last one reproduces the 258
at 90 fps from your cover letter.

For the illuminator itself I did not trust anything but the sensor: one
568-frame capture, strobe toggled 0/1/0/1/0 inside the single stream,
exposure 776, VTS 1724, gain 16, same scene, zero CSI-2 errors, per-frame
mean of the Y10 data:

    strobe 0:  n=3D252  mean 517.58  std 0.25   |even-odd| 0.00-0.01
    strobe 1:  n=3D169  mean 546.27  std 28.81  |even-odd| 57.61
               lit frames 575.4   unlit frames 517.6

With the strobe off there is no per-frame structure at all; with it on the
frames split into two populations 57.6 counts apart, alternating, and the
unlit frames inside an ON segment match the strobe-off level to within 0.3
counts. That is the illuminator firing on alternate frames and nothing
else. The effect is only +5.5% overall because the scene had a lot of
ambient daylight IR; every number above is a within-capture comparison, as
absolute levels drifted between separate captures.

Two notes that might save someone else time.

6/7 does not build on a tree without V4L2_CID_FLASH_STROBE_OE:

  ov7251.c:1688:44: error: 'V4L2_CID_FLASH_STROBE_OE' undeclared

That CID is not added by this series -- it comes from 5be4154f6255
("media: v4l: ctrls: add a control for enabling strobe output"), which
landed after v6.19. Since 6/7 uses v4l2_ctrl_new_std() it needs the
v4l2-ctrls-defs.c entries too, not just the uapi define, or the control is
never created. Worth a word in the cover letter for anyone testing on a
stable tree.

And on this hardware the series supersedes the out-of-tree Surface
driver's ir_led module parameter, which drives the same two registers.
Measured on the shipped module while streaming, that parameter lights
every frame with the mode table's 26-line pulse, about 0.7% duty at its
production VTS of 3448, and never updates the span. 6/7 is strictly better
behaved. They cannot coexist, since 5/7 removes those writes from the mode
tables, so ir_led would have to go when this lands. That is our problem,
not yours.

What I did not test: 7/7, the 60 and 90 fps modes photometrically,
v4l2-compliance streaming, and whether the pulse follows the exposure in
time -- I verified the programmed span, not the pulse position. The
photometric capture was taken with 1/7 reverted, since with it the link
here is too unstable to capture reliably; the register-level strobe
behaviour was re-verified identically with 1 to 6 exactly as posted.

I also had to rebase onto v6.19 to build at all, because mainline's
ov7251.c uses pad-op signatures this kernel does not have; the unpatched
file fails the same way, so that is unrelated to your series. Patches 1 to
6 applied to v6.19 with line offsets of at most one and no fuzz.

D. Manresa

(Written with AI assistance, directed and reviewed by me.)
