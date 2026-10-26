Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.205.69.214
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039168;
	b=N+itAZ700IbAaaiWVjJe4dzvizrhL1aQcAEHBR6vXbBqohU9hUCju1jYPstrPVneH7Ar
	 MiUOr0bHKyheWYIDLx87j/kclOJ1FumhUy2yPZGnIRdjYXt6Sgxv+7G4SuxG+u+bxRJNy
	 z1a+4sgf+ZwViO4RCapCvUBVeG84HoHrlo3dlIRaAK6Z2w0168JdYB7gIHlLxILsxTALS
	 5kphjTTIS8Ojrjfg+LxVBnV+Nuo+tOjLUz9c9xk1AYq0HjPlMB0iq44vFauztJN57X+Zm
	 qz/WbBxA7iPL6lTMlqyH94MG7E22fPMdTubnBmWPmhW03OIHxnghIhvNNd3KQok3Gzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039168;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Message-ID:
	 In-Reply-To:References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Feedback-ID;
	bh=UeV/13Sh60z8s5fD4l3Y3G/Ey/zhI+5SuTw4o6o9VcY=;
	b=HhMWN8uAMI21CINPWvAHfAeqcSC4OB5m9adfWOyHXu9jsO/BnDA4gS8Si1TBSoECqNis
	 62w0kutyq+vTFZgUEkU1qk+NCyR4Q5YHCn6LK5H2J4Ozr6t4bKkwijjjNGq57REw/L2It
	 h7iDSTGo+RMAJeQIJySbHH5fkplF2N/1e+xoy+isX99oFQYuYT2PtxKQ86lAUj7bpRWyM
	 2Dr8Vg36aucSFs8kIMVOwFlFCMktdDf2IgavnLby5ZwwDGlzw/kgCOht3hNMITZ/aj2VI
	 BTjE6PiT4YomlAX3SCezPpnZEwV5K0Dh5ADplEUI4aDYbab/w92fUr46CgPoADBcPyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=se-rg.io;
	spf=pass smtp.mailfrom=se-rg.io;
	dkim=pass header.d=se-rg.io header.i=@se-rg.io header.a=rsa-sha256 header.s=s1 header.b=OsdPZ8s+;
	arc=none smtp.remote-ip=185.205.69.214
Received: from mail.w14.tutanota.de (mail.w14.tutanota.de [185.205.69.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBE3606A322
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFBE3606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=se-rg.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=se-rg.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=se-rg.io header.i=@se-rg.io header.a=rsa-sha256 header.s=s1 header.b=OsdPZ8s+
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w14.tutanota.de (Postfix) with ESMTP id 415C019CD5CF1
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:26:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1793039165;
	s=s1; d=se-rg.io;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
	bh=UeV/13Sh60z8s5fD4l3Y3G/Ey/zhI+5SuTw4o6o9VcY=;
	b=OsdPZ8s+nbtmcRD9MiFRWupfky+uXK/ErRii0O0bjlZGj1sAxDQbvIsRNGt1KhT8
	WPWm/NCjwM+/1Rg5WXVgJOvXrfqGUhdxqw+ID9fVc4riN4r1ian1PxAUejkFy/R9TqF
	xF4+9+zbAw5ZIQNqrdWlEj99cCksslhG6xgnIr6YgZYqJgiXE6EsBE3rSZl/V8MPiAj
	tlp0jdPJ0qV69oyRcXDKnJf7nxx/GDtwL+OyWaao3E82GnTPkEhUvNTQnhZmPbcmOnB
	yEoImZrazmAtcdGjLQeQRmr5kmn2JEIAdxHtu3EySR4jkLKgqNXCGxqCxyLMvq0et3S
	FC47stHTwQ==
Date: Mon, 26 Oct 2026 19:26:05 +0100 (CET)
From: =?UTF-8?Q?S=C3=A9rgio_Ferreira?= <ferreira@se-rg.io>
To: Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linux Arm Msm <linux-arm-msm@vger.kernel.org>,
	Devicetree <devicetree@vger.kernel.org>,
	Linux Kernel <linux-kernel@vger.kernel.org>,
	Georg Gottleuber <ggo@tuxedocomputers.com>,
	Ettore Chimenti <ek5.chimenti@gmail.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Srinivas Kandagatla <srini@kernel.org>
Message-ID: <P4tSXlD--F-9@se-rg.io>
In-Reply-To: <DMEXOUF2X7O6.3W5B9URS8YOEF@linaro.org>
References: <20261025-medion-sprchrgd-14-backlight-v2-1-bf2979485ec2@se-rg.io> <DMEXOUF2X7O6.3W5B9URS8YOEF@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-medion-sprchrgd-14-s1:
 Add PWM backlight
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Feedback-ID: 01dd4eab77738e167533efd0c87004e8ce63075c63aedba89d38f476a24ad9d3e63954156b6713ccd6066b668add86597103d79f81b23ab0d34049cd78faed2fc7:TurnOnPrivacy!:tutamail

Hi Ettore,

Oct 26, 2026, 18:08 by ettore.chimenti@linaro.org:

> Hi S=C3=A9rgio,
>
> On Sun Oct 25, 2026 at 8:51 AM CET, S=C3=A9rgio Ferreira via B4 Relay wro=
te:
>
>> From: S=C3=A9rgio Ferreira <>> ferreira@se-rg.io>> >
>>
>> The eDP panel (CSOT MNE007ZA3-2, IPS LCD) cannot have its brightness
>> set over eDP AUX. With no backlight phandle on the panel, panel-edp
>> falls back to the DP AUX backlight, which registers dp_aux_backlight
>> with a maximum brightness of 0, so brightness control has no effect.
>>
>> Brightness is driven by PWM instead. UEFI leaves PM8550 LPG channel 3
>> running and the PWM output configured on PM8550 GPIO 8, and drives
>> PMC8380_3 GPIO 4 high as the backlight enable:
>>
>> pm8550 gpio8 : out low func1 vin-0 no pull push-pull medium
>> pmc8380_3 gpio4 : out  high normal  vin-1 pull-down push-pull medium
>>
>> The panel configuration in the Windows ACPI tables confirmed this.
>> (PMIC-controlled PWM, PMIC 1, bank 3, 9-bit, 2 kHz).
>>
>> Describe this with a pwm-backlight node: enable pm8550_pwm, add pinctrl
>> states for the enable GPIO and for gpio8 func1, and attach the
>> backlight to the panel.
>>
>> Tested on a Medion SPRCHRGD 14 S1 (X1E78100): brightness control over
>> the full range, brightness keys, suspend/resume and restore after
>> reboot.
>>
>> Assisted-by: LLM
>> Signed-off-by: S=C3=A9rgio Ferreira <>> ferreira@se-rg.io>> >
>> ---
>>
>
> I tested this on a Medion SPRCHRGD 14 S1, but the controls are inverted.
> When increasing the backlight lightness it actually decreases it, and
> vice versa.
>
> ```
> % cat /sys/class/backlight/backlight/max_brightness
> 4095
>
> % echo 1 | sudo tee /sys/class/backlight/backlight/brightness
> 1 # BRIGHT
>
> % echo 2000 | sudo tee /sys/class/backlight/backlight/brightness
> 2000 # LESS BRIGHT
>
> % echo 4095 | sudo tee /sys/class/backlight/backlight/brightness
> 4095 # OFF
>
> % echo 0 | sudo tee /sys/class/backlight/backlight/brightness
> 0 # OFF
> ```
>
> Moreover, I see that from `/sys/kernel/debug/pwm` the period
> request differs from the actual:
>
> ```
> pwm-3   (backlight           ): requested
> requested configuration:  enabled, 498418/500000 ns, normal polarity
> # with brightness set at 4090:
> actual configuration:     enabled, 425834/425834 ns, normal polarity
> # with brightness set at 2:
> 0/425834 ns, normal polarity
> ```
>
> This probably causes the top 250 values to be all at the same
> brightness. Not a big deal probably.
>
> Do you have the same behavior? Can you send the EDID of your panel?
>
> Thanks,
> Ettore
>
thanks for testing.

No, i can not reproduce the value inversion. A brightness of 1 equals very =
dark while 4095 is maximum brightness. 0 is turning the screen off as expec=
ted.

Here is my edid:

```
edid-decode /sys/class/drm/card1-eDP-1/edid
edid-decode (hex):

00 ff ff ff ff ff ff 00 0e 77 31 14 00 00 00 00
00 21 01 04 b5 1e 13 78 03 2f 55 a6 54 4c 9b 24
0d 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 17 88 40 a0 b0 08 6e 70 30 20
36 00 2d bc 10 00 00 18 00 00 00 fd 00 1e 78 e6
e6 46 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43
53 4f 54 20 54 33 0a 20 20 20 20 20 00 00 00 fc
00 4d 4e 45 30 30 37 5a 41 33 2d 32 0a 20 01 fc

70 20 79 00 00 22 00 28 bf a1 0a 85 3f 0b 9f 00
2f 00 1f 00 07 07 6d 00 02 00 05 00 b3 40 04 05
3f 0b 9f 00 2f 00 1f 00 07 07 6d 00 02 00 05 00
81 00 07 e6 06 01 01 60 60 28 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 62 90

----------------

Block 0, Base EDID:
=C2=A0 EDID Structure Version & Revision: 1.4
=C2=A0 Vendor & Product Identification:
=C2=A0=C2=A0=C2=A0 Manufacturer: CSW
=C2=A0=C2=A0=C2=A0 Model: 5169
=C2=A0=C2=A0=C2=A0 Made in: 2023
=C2=A0 Basic Display Parameters & Features:
=C2=A0=C2=A0=C2=A0 Digital display
=C2=A0=C2=A0=C2=A0 Bits per primary color channel: 10
=C2=A0=C2=A0=C2=A0 DisplayPort interface
=C2=A0=C2=A0=C2=A0 Maximum image size: 30 cm x 19 cm
=C2=A0=C2=A0=C2=A0 Gamma: 2.20
=C2=A0=C2=A0=C2=A0 Supported color formats: RGB 4:4:4
=C2=A0=C2=A0=C2=A0 First detailed timing includes the native pixel format a=
nd preferred refresh rate
=C2=A0=C2=A0=C2=A0 Display supports continuous frequencies
=C2=A0 Color Characteristics:
=C2=A0=C2=A0=C2=A0 Red=C2=A0 : 0.6484, 0.3300
=C2=A0=C2=A0=C2=A0 Green: 0.2998, 0.6083
=C2=A0=C2=A0=C2=A0 Blue : 0.1416, 0.0517
=C2=A0=C2=A0=C2=A0 White: 0.3134, 0.3291
=C2=A0 Established Timings I & II: none
=C2=A0 Standard Timings: none
=C2=A0 Detailed Timing Descriptors:
=C2=A0=C2=A0=C2=A0 DTD 1:=C2=A0 2880x1800=C2=A0=C2=A0 60.001033 Hz=C2=A0 16=
:10=C2=A0=C2=A0 114.602 kHz=C2=A0=C2=A0=C2=A0 348.390000 MHz (301 mm x 188 =
mm)
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 Hfront=C2=A0=C2=A0 48 Hsync=C2=A0 32 Hback=C2=A0=C2=
=A0 80 Hpol N
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 Vfront=C2=A0=C2=A0=C2=A0 3 Vsync=C2=A0=C2=A0 6 Vback=
=C2=A0 101 Vpol N
=C2=A0=C2=A0=C2=A0 Display Range Limits:
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Monitor ranges (Range Limits Only): 30-120 H=
z V, 230-230 kHz H, max dotclock 700 MHz
=C2=A0=C2=A0=C2=A0 Alphanumeric Data String: 'CSOT T3'
=C2=A0=C2=A0=C2=A0 Display Product Name: 'MNE007ZA3-2'
=C2=A0 Extension blocks: 1
Checksum: 0xfc

----------------

Block 1, DisplayID Extension Block:
=C2=A0 Version: 2.0
=C2=A0 Extension Count: 0
=C2=A0 Display Product Primary Use Case: Same primary use case as the base =
section
=C2=A0 Video Timing Modes Type 7 - Detailed Timings Data Block:
=C2=A0=C2=A0=C2=A0 DTD:=C2=A0 2880x1800=C2=A0 120.000000 Hz=C2=A0 16:10=C2=
=A0=C2=A0 229.200 kHz=C2=A0=C2=A0=C2=A0 696.768000 MHz (aspect 16:10, no 3D=
 stereo, preferred)
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Hfront=C2=A0=C2=A0 48 Hsync=C2=A0 32 Hback=C2=A0=C2=A0 80 Hpol N
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Vfront=C2=A0=C2=A0=C2=A0 3 Vsync=C2=A0=C2=A0 6 Vback=C2=A0 101 Vp=
ol N
=C2=A0=C2=A0=C2=A0 DTD:=C2=A0 2880x1800=C2=A0=C2=A0 48.000138 Hz=C2=A0 16:1=
0=C2=A0=C2=A0=C2=A0 91.680 kHz=C2=A0=C2=A0=C2=A0 278.708000 MHz (aspect 16:=
10, no 3D stereo)
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Hfront=C2=A0=C2=A0 48 Hsync=C2=A0 32 Hback=C2=A0=C2=A0 80 Hpol N
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Vfront=C2=A0=C2=A0=C2=A0 3 Vsync=C2=A0=C2=A0 6 Vback=C2=A0 101 Vp=
ol N
=C2=A0 CTA-861 DisplayID Data Block:
=C2=A0 HDR Static Metadata Data Block:
=C2=A0=C2=A0=C2=A0 Electro optical transfer functions:
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Traditional gamma - SDR luminance range
=C2=A0=C2=A0=C2=A0 Supported static metadata descriptors:
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Static metadata type 1
=C2=A0=C2=A0=C2=A0 Desired content max luminance: 96 (400.000 cd/m^2)
=C2=A0=C2=A0=C2=A0 Desired content max frame-average luminance: 96 (400.000=
 cd/m^2)
=C2=A0=C2=A0=C2=A0 Desired content min luminance: 40 (0.098 cd/m^2)
=C2=A0 Checksum: 0x62
Checksum: 0x90
```

I can confirm the PWM period value mapping is a bit off for the top-end val=
ues, though I haven't noticed that in day-to-day use.

Best,
S=C3=A9rgio

