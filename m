Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55D736DA03
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932496; cv=none; b=t7PbZ1TkYalco6NFiIgSyUjxGLzPYD8uXv0h/PtuyL4m9TJDH5P5sx6o0aEt+rgPJLaI+rshxGQR8DmlukNAejQnq+cMans5lnE7w55QRd4Rpfr6NNJ7khE34JWiu0xuqjflyvpYoFXaRK6YhCigodNE5J87w5qCykol3/5BqgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932496; c=relaxed/simple;
	bh=/YUkk2oL8J2c9x2ZMrrT+zRp55kHgcpvY/KKF5ODoek=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=PKOgcG0Aj9WX6pMAOxP9PZV7Fix6xj9v0iFn0SGB59+ZgDriq4wmg86cMHSbNznT/GcJHsgxeE83P+Tb1PolSCnQFH9KjDsJIlLcqbBpn69Dk1+OybC4M3xaZ1c732elAKG2h9+JGhLUGuz78RETvZN4x3SQ7gv7y+TPJbaOsXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IPrYL6Ez; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IPrYL6Ez"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so847487f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787932493; x=1788537293; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9y4LFg6yvTjsxuVx9xI+CfaKWUbNOzH9RLH+rTwjQJw=;
        b=IPrYL6EzORo2pxUMQpc13b8RidVTTmcYCOMTty+ysPHc7pBS+zt8pmdY1vmSb/IZyS
         zDRszXD+JpUk80tR24tA04xebTeWv5blmf0X5l6cOkcr3VdbT5rdPYt1ob98hJQ0Zq5s
         WyLHEVy5W5aa12c2BGR9ooPqWyegFYnKCxpENo07x9f+l+B2JZWUjFesI0fOKPVxgQeo
         zNzm9pMOsn6E+pqrGF4yD/2kTwZ6O2XVgrsU71Bgs0QNRSHzmF105zeoHB7Z1YwZ+jGX
         Yg5uk9mM9d3XOeqQfvygIJddzMKAanSOd+yRqLA4AzP1BOA7ZKnQiNjCLJq/2MBmNKal
         lKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787932493; x=1788537293;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9y4LFg6yvTjsxuVx9xI+CfaKWUbNOzH9RLH+rTwjQJw=;
        b=HZVqrWtjasTDDL2VPPk0+19JL+GrKHrRvYSkvx2Oj76kE2NFVvTNTT7s+UETpRbZtS
         d9c3pPEuhqUcobdtE5c6eGB5IYpoEEyJNggKBd9+fZ5jt98ucdVHSqTdgcIl7LnFsoKe
         XMIiWBx7eopfWIRVpLIVq4+s25BcVYLXHskpP3RsmnS88m+8GgMylSH/ofCQWEhFCL2Q
         bdW3aixB17GP+so0kQHf5GjWlzTRjiL0Ov21MGzkD58JFJL/6qkkAHGMNBe34owJ8+jv
         LnGfdE9KqYdk5otDK5VY855C0IRTwTar4iQodyZLbZmsmEOQP7AkJ1b1ZW0JLQPchbhn
         yx5w==
X-Forwarded-Encrypted: i=1; AHgh+RoqLZzFR31N+6gogAeKlOcP9UkVtZzpN1gFfHhFoFqbsFW4oAhBI0/DAqYd3OzlvxGN+4Br6ByMmTRRHDo=@vger.kernel.org
X-Gm-Message-State: AFuF++mP921xkyMfX+FMoN7AevJOhyqmZZLHfiZVbbsi99sPr5Zi2RdZ
	EWRh/Ss+h2e8Y5SDwFFxWrH90kgTY04BOQT7I+QktcYoWstyg52Sz7apigr0YuNVLpA=
X-Gm-Gg: AR+sD13JFHS1N+SFGp2mbKwUegKsR3Heor0GA+uLJbOdcnRQpehVUAXyxmnAmvqyZfW
	/aN1P5DCloJ8H+ynHlqK+m+SAbPt74yMCq4KH6H1GBiIP0vVyAS8OhwEDvpi3FVTub0tV3rVTa2
	1Rvn8PXSOBtpEGDfW3StSn5UEbh/Ynz+Bng2oASIMxyP13XSDllZgP9AJJh3KSCm30TuvIkokee
	Jl6wLS+3s1ecGj6Rek7WZId/VJvDyMV+/mAnsf+GWfb7kwsHBMYI2QDw/694RXOenNzlIzHaWok
	hLBiRpqzBJ93S/SBKJmTq+FYkLsYreYRSPEE1HISY3nfODr6OE53cVFSVNImiQZWhede8Sxx/qk
	V7wdBA5jj5IKvdDCbXI+qdMOCjnAg4/eE7HnTp9pg4IQpss5wfr0KGUivm4hdZTrmiWFWXEWp9q
	4aZKxe0qOTOMSRY+2xwIS3I0LPlyo02Xm0t8DKjAIYltzcbb+VZC0OW/WdS2dR0Y123/ar106Zy
	NlTnenXhE67bhsVJEP1ijk5AU1q6V/S6P5lvQ+1os2yYgrf0XrBYpUCkZL0
X-Received: by 2002:a05:6000:2589:b0:47d:eedb:ee62 with SMTP id ffacd0b85a97d-482f79e0b63mr13842837f8f.14.1787932492661;
        Fri, 28 Aug 2026 08:54:52 -0700 (PDT)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7473298f8f.7.2026.08.28.08.54.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 08:54:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Aug 2026 16:54:51 +0100
Message-Id: <DL0P67CVWELH.1WDA9P8IZXKJH@linaro.org>
Cc: "Alexey Klimov" <alexey.klimov@linaro.org>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, <krzysztof.kozlowski@oss.qualcomm.com>,
 <alim.akhtar@samsung.com>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] Exynos850 GPU support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Peter Griffin" <peter.griffin@linaro.org>, "Thomas Turner"
 <tturner@lineageos.org>
X-Mailer: aerc 0.21.0
References: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM> <CAPLW+4kQTUX8QhKnAP7bg=iCw5hhNQZoW7cuOpTdvvAUpGaicg@mail.gmail.com> <135d48e7-58ac-48b8-8fa5-c2548e2f3ae9@lineageos.org> <DKZ3X5VUHJSK.1KSJR6K8FATGV@linaro.org> <5e8698db-974c-4f8b-8939-bcdf8a47743d@lineageos.org> <CADrjBPrhaQHyQX-+FEHYH5rCwh9_fMUVsV5fpvRkR-RF_9Erkg@mail.gmail.com>
In-Reply-To: <CADrjBPrhaQHyQX-+FEHYH5rCwh9_fMUVsV5fpvRkR-RF_9Erkg@mail.gmail.com>

On Fri Aug 28, 2026 at 10:35 AM BST, Peter Griffin wrote:
> Hi Thomas, Alexey, Sam
>
> On Wed, 26 Aug 2026 at 20:44, Thomas Turner <tturner@lineageos.org> wrote=
:
>>
>> On 26/08/2026 20:02, Alexey Klimov wrote:
>> > On Tue Aug 25, 2026 at 10:05 PM BST, Thomas Turner wrote:
>> >> Hi Sam and Alexey,
>> >>
>> >> On 19/08/2026 20:51, Sam Protsenko wrote:
>> >>> Can you please tell us a bit about how you tested this patch, and on
>> >>> which board? As DPU is not currently enabled on Exynos850 SoC, I'm n=
ot
>> >>> sure how exactly GPU can be useful. If you have a use case or a
>> >>> testing procedure we can run on the E850-96 board, please share.
>> >>>
>> >>
>> >> Sam, Alexey could you please test GPU on the E850-96 board by followi=
ng
>> >> these instructions:
>> >>
>> >> 1) Apply this patch series locally
>> >> 2) Change status=3D"disabled"; to status=3D"okay";
>> >> 3) Make sure these configs are enabled:
>> >> CONFIG_DRM_SIMPLEDRM=3Dy
>> >> CONFIG_DRM_PANFROST=3Dy
>> >> 4) In terms of regulators we set up a basic mali regulator via our
>> >> secondary bootloader [1] and configured with this dts setup [2], NOTE
>> >> you may be able to get away with a dummy regulator so try that first.
>> >> If not I am sure you can replicate something simple with u-boot PMIC.
>> >> 5) Boot a GUI, I saw Debian was used for the bring-up, that should wo=
rk
>> >> 6) Run the following command:
>> >> $ dmesg | grep "panfrost"
>> >> 7) Compare that to the output at [3]
>> >
>> > Your email subject still seems to be null.
>> >
>> > [   15.206193] panfrost 11500000.gpu: clock rate =3D 377000000
>> > [   15.206322] panfrost 11500000.gpu: error -ENODEV: _opp_set_regulato=
rs: no regulator (mali) found
>> > [   15.206513] panfrost 11500000.gpu: supply mali not found, using dum=
my regulator
>> > [   15.206840] panfrost 11500000.gpu: mali-g52 id 0x7212 major 0x0 min=
or 0x0 status 0x0
>> > [   15.213137] panfrost 11500000.gpu: features: 00000000,00000df7, iss=
ues: 00000000,00000400
>> > [   15.221271] panfrost 11500000.gpu: Features: L2:0x07100206 Shader:0=
x00000000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
>> > [   15.233080] panfrost 11500000.gpu: shader_present=3D0x1 l2_present=
=3D0x1
>> > [   15.240488] panfrost 11500000.gpu: [drm] Using Transparent Hugepage
>> > [   15.250497] [drm] Initialized panfrost 1.6.0 for 11500000.gpu on mi=
nor 0
>>
>> You seemed to have missed out step (4) of my instructions, if you set-up
>> regulators correctly this error will disappear.
>>
>> > [root@e850usb ~]# uname -a
>> > Linux e850usb 7.2.0-next-20260825-00009-g647b48e80572-dirty #8 SMP PRE=
EMPT Wed Aug 26 17:05:45 BST 2026 aarch64 GNU/Linux
>> >
>> > I have different DRM_SIMPLEDRM options and related  enabled but nothin=
g
>> > pops up via HDMI (at least I tried simple xorg-server things).
>> > Is it possible that your bootloader initilises some framebuffer and in=
serts
>> > it into DTB that passed to kernel? Or you have some other pieces in
>> > kernel/dt that implement missing functionality?
>>
>> Our bootloader does intialise a framebuffer, and we have a node in our d=
evice
>> tree which makes it usable. Not sure how exactly the e850-96 device sets
>> things up but you can take a look at our fork if you want, [1].
>>
>> > Here it seems there are no outputs:
>> > [root@e850usb ~]# ls -al /dev/fb*
>> > ls: cannot access '/dev/fb*': No such file or directory
>> >
>> > and there no simle framebuffer or related logs. "DPU is not currently
>> > enabled on Exynos850 SoC" looks like the reason.
>>
>> hm, I am pretty sure our bootloader configures DPU for us so that might =
be
>> why it works for us and not for you.

Yes, exactly, and see below too please.

> @Alexey - I think the LK bootloader leaves DPU framebuffer updates off
> to ensure a seamless handover from the bootsplash to the full DRM
> driver. We have the following DPU poke in gs101 (which if I recall
> correctly we got the inspiration for this from uniloader)
> https://gitlab.com/LinaroLtd/googlelt/meta-bsp-google-gs/-/commit/4057117=
e4bc6e08fbb6ff281cbfef8782a68ec0a
>
> So for the E850 board, you likely need to do something similar, either
> in LK or like the above poke. If UniLoader is already doing this for
> the e850 SoC then hopefully you can check there to see the address of
> the register etc. That should then able you to have simple-framebuffer
> enabled.

Am not an expert in grapics but from all observations I see, that even
if bootloader (say LK) sets up DECON/DPU and ley them stream DSI,
then we are still missing support for Lonthium MIPI/DSI-to-HDMI bridge
to output anything via HDMI on Winlink E850-96 board.
There is high-speed connector though.

For smartphones with simple panels with DSI interface all that actually
could work if bootloader takes care about initial set up (exactly what is
done in referenced repos of uniLoader AFAICS).

BR,
Alexey

