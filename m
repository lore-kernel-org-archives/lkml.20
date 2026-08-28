Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71223B38B7
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787909760; cv=pass; b=WjCrw+GFRGe1lCXFiARGeJyNloy5tj8ifSX335ldGDsYbmD6IGOw7thcMq18tYSCpTugddio+e1qb4SCkDHQlmplyubgyVGvQVFYIvE9ws+Q7pU1aK386DV5LSZQh8Y2yanUllJuN7FkkrjN14Hw6luoNooz4+LNpw4xrvQtZOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787909760; c=relaxed/simple;
	bh=op/7X2g33Wg5cOt/DZ/YOuYArMzVztGV0ScGuTiCS2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tIfzCrzhjNornEjCS+hxF/vEvUn5GHs+g1cPkJMzsbqZ8AiMCGpAQoGqIQ0vszAf3QbErHv0IS3MvylMFJBEb83CfpHw2DleAfhYtlteDX7A85Fs/pv+Tb5ZzxwvGbTS91Kd8VTGzAlBVg6B0fJhH/ngCcccI+yD0n8mqrFV1BY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vZxUgplX; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vZxUgplX"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso936570a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:35:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787909748; cv=none;
        d=google.com; s=arc-20260327;
        b=awdbiKI5jhNGtnzF+v3IqPclwFd1CG5pPIGM2qC0hGAkTs2dhaJ4ARq8zaLS+i5Xy7
         qF+UyK5RdzXnL2vVeOXFHjyHsorrFb722v7Ygej8SrfPmHMI+kfOZvGoWmFJqg251hc0
         iTyEz2BKTP+v+ih7V1/YOoweLldn7pufHqoTPppVDvFz+kiqpmNqTax+5GfuRS+mv3MP
         synB/2w0neyUYqqOUGDZQs0PfP5vU07ylGY6iI6G6Q4qXNCMiOyf8pMTH+qsTgBBHMJb
         3nT/mA+YMX/I9qbyo7smfKJggdsBKDcK7Kz7LwUe82PNwz9RWxpbpSCh8oo9JanEYukh
         IzhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=M4mRPyxUwh4SLKG3nAkInA2mLQaoHKjEcd3Lko4Y3NE=;
        fh=tLAfMQ30L23RUd4V03WGexMVbQcdOUqL5XmxsjCH9/A=;
        b=AZn7zA6jGo4wuZGgqDlII4c2AbsCz2SSN3iUIYbBmjirpZvFl9dznIhlmkvoodv+Vh
         i1AWgR0wBSfoSJWQ4UZViNN1wwyRmb7nE3vFVvUwz6vTbqiadR9ZLq14rKq0PnZiHOkI
         y8x++mvOE+eDYJgD+/gTMV3lUq7NLGO0FqKEzTK5sjjfkxlkWPcd3ANc1Nfxj7W0/3Bh
         GvQZs8XZOMujdTEvZkA/r5DfajIQ+qKb+sonFRf2xfxiqaZ9JkpuKmK2ES9ECWTFa7Ee
         qscdZNgK1hFgsqj+KkKBL37s5vGYbug/ED3HfPuWxnr1gORWV72Nu5MplRfdWspFU+hx
         TQOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787909748; x=1788514548; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4mRPyxUwh4SLKG3nAkInA2mLQaoHKjEcd3Lko4Y3NE=;
        b=vZxUgplXuNqyOSSqGHTld1AzsEuwVH3K32aLdJbdooxphxF6gU8a84W4wm3+/ypTZf
         1PaT0FQ49qrxO20nCkss2xCGca1KoX/AM/ytCS284NcJQ6voiouwnZUGs+1R9gNIoqkO
         GBL6wAdVWlXe8zR6wi4MwYvRuIR2Q+Yc68wPxTNy9myTnTzKdXb3uF9LKtBK4yz2NPMO
         59Ps36+TEdFhUZQnXRaQT3gAlRiMr0yj6Vr5JTRG46DL2y2lYPHcmMOO82Xp89FL32f3
         aU8WTBGULujvu5L5bVsi0QpsTwMiOSEKqmrcZW1ueZjq2JNM0jmKLpIAeObs+j3zbKsC
         f13w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787909748; x=1788514548;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M4mRPyxUwh4SLKG3nAkInA2mLQaoHKjEcd3Lko4Y3NE=;
        b=p/hulh/vN680B8YOK3aa5HO9qduCzigPVqdmTo9PSGfkBKikw2cVcbsgF1FHg0Ho5c
         i4fC6zKOyYRj28s1KHdVwzQVnaiPclnFOMpmAPqTIdL+0YfXIUH/PXL3M0cuz7O2p7U1
         Lb4Uuy8pZqd/dKeeSCWrGsPfVw1Jtb6R3t850kRxMLYbh2Oly3rZ4U6Vs1Fo24t6EmzL
         c30w32IU8y39t00EVldH7JtvfSwLj4SuVpuD9aJ7PP2Fzb7iOruLutHO/eTOeFM4sCvc
         QQ1uRbnjpe34hhJ4yDXOQZOEHAVNV/8wkoUP7UGrM31vtLleq24EuCditJZGiFBm95jc
         cYLQ==
X-Forwarded-Encrypted: i=1; AHgh+RoEMqYQnS2LwYvEoomYwCFWzkvsxpZdzZ1XARIGGPa0ADYY0Y9mKnqAPqCsdXrvMJKV8I4WBiB4p7yniZs=@vger.kernel.org
X-Gm-Message-State: AFuF++leSZIFqRwdop+bN0LqHipuFn+zfWE6V1ERU40JUrGTRwhGmYYV
	w8kKGiPIbO4VWMxjhIftu2RGcFA5hCPGKm3YSXyAihrVnvPluVHkvJWLDfP0S0FU9h2iHCi/gs4
	05Nkvv/rw4sc2iy0p9kurcv1biBfh+v05oDpQnXnTXg==
X-Gm-Gg: AR+sD13tBxdICGXVzmfXhYjf8FPq4ua6cj8VExB21h9mt8evCr9gW1uSru4FvnV780I
	AJFymm8TbzfwU8Pl2WmPp+RShFX2KAFBYoPwpgPE5EcsoWKv47c6wYfqb54ZJraEo+EhOsWJc3T
	h5CGCdslHN4BJia4DhVAWy1A+guwF8PXYOD3EMis5JuX6bJBfADt/WheYwSMPxUJt6/OdjM1EYo
	E0ecZq7q71hjUwjFyC0VswgqPM0H12GiDuNRjMHp3IKNxphI09tXFg6c2gFV8qrxxf6zGV1MfDC
	S0iNjInXKUz0S5txRSDgbW8pNsYTv3WPIeY1n7N3tFMowukKD/cpbZiYxXSZchhh2sv6ts6n6jz
	SebE=
X-Received: by 2002:a05:6402:3807:b0:6a5:f528:ff48 with SMTP id
 4fb4d7f45d1cf-6a60d35736cmr3469549a12.5.1787909747586; Fri, 28 Aug 2026
 02:35:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
 <CAPLW+4kQTUX8QhKnAP7bg=iCw5hhNQZoW7cuOpTdvvAUpGaicg@mail.gmail.com>
 <135d48e7-58ac-48b8-8fa5-c2548e2f3ae9@lineageos.org> <DKZ3X5VUHJSK.1KSJR6K8FATGV@linaro.org>
 <5e8698db-974c-4f8b-8939-bcdf8a47743d@lineageos.org>
In-Reply-To: <5e8698db-974c-4f8b-8939-bcdf8a47743d@lineageos.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 28 Aug 2026 10:35:36 +0100
X-Gm-Features: AcwNN1WeoYWQnW4gSKiWJkUeMJcl_oJic8RHhz9v0tzgpLotvnyYe_l98Rtu_To
Message-ID: <CADrjBPrhaQHyQX-+FEHYH5rCwh9_fMUVsV5fpvRkR-RF_9Erkg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Exynos850 GPU support
To: Thomas Turner <tturner@lineageos.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, krzysztof.kozlowski@oss.qualcomm.com, 
	alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thomas, Alexey, Sam

On Wed, 26 Aug 2026 at 20:44, Thomas Turner <tturner@lineageos.org> wrote:
>
> On 26/08/2026 20:02, Alexey Klimov wrote:
> > On Tue Aug 25, 2026 at 10:05 PM BST, Thomas Turner wrote:
> >> Hi Sam and Alexey,
> >>
> >> On 19/08/2026 20:51, Sam Protsenko wrote:
> >>> Can you please tell us a bit about how you tested this patch, and on
> >>> which board? As DPU is not currently enabled on Exynos850 SoC, I'm not
> >>> sure how exactly GPU can be useful. If you have a use case or a
> >>> testing procedure we can run on the E850-96 board, please share.
> >>>
> >>
> >> Sam, Alexey could you please test GPU on the E850-96 board by following
> >> these instructions:
> >>
> >> 1) Apply this patch series locally
> >> 2) Change status="disabled"; to status="okay";
> >> 3) Make sure these configs are enabled:
> >> CONFIG_DRM_SIMPLEDRM=y
> >> CONFIG_DRM_PANFROST=y
> >> 4) In terms of regulators we set up a basic mali regulator via our
> >> secondary bootloader [1] and configured with this dts setup [2], NOTE
> >> you may be able to get away with a dummy regulator so try that first.
> >> If not I am sure you can replicate something simple with u-boot PMIC.
> >> 5) Boot a GUI, I saw Debian was used for the bring-up, that should work
> >> 6) Run the following command:
> >> $ dmesg | grep "panfrost"
> >> 7) Compare that to the output at [3]
> >
> > Your email subject still seems to be null.
> >
> > [   15.206193] panfrost 11500000.gpu: clock rate = 377000000
> > [   15.206322] panfrost 11500000.gpu: error -ENODEV: _opp_set_regulators: no regulator (mali) found
> > [   15.206513] panfrost 11500000.gpu: supply mali not found, using dummy regulator
> > [   15.206840] panfrost 11500000.gpu: mali-g52 id 0x7212 major 0x0 minor 0x0 status 0x0
> > [   15.213137] panfrost 11500000.gpu: features: 00000000,00000df7, issues: 00000000,00000400
> > [   15.221271] panfrost 11500000.gpu: Features: L2:0x07100206 Shader:0x00000000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> > [   15.233080] panfrost 11500000.gpu: shader_present=0x1 l2_present=0x1
> > [   15.240488] panfrost 11500000.gpu: [drm] Using Transparent Hugepage
> > [   15.250497] [drm] Initialized panfrost 1.6.0 for 11500000.gpu on minor 0
>
> You seemed to have missed out step (4) of my instructions, if you set-up
> regulators correctly this error will disappear.
>
> > [root@e850usb ~]# uname -a
> > Linux e850usb 7.2.0-next-20260825-00009-g647b48e80572-dirty #8 SMP PREEMPT Wed Aug 26 17:05:45 BST 2026 aarch64 GNU/Linux
> >
> > I have different DRM_SIMPLEDRM options and related  enabled but nothing
> > pops up via HDMI (at least I tried simple xorg-server things).
> > Is it possible that your bootloader initilises some framebuffer and inserts
> > it into DTB that passed to kernel? Or you have some other pieces in
> > kernel/dt that implement missing functionality?
>
> Our bootloader does intialise a framebuffer, and we have a node in our device
> tree which makes it usable. Not sure how exactly the e850-96 device sets
> things up but you can take a look at our fork if you want, [1].
>
> > Here it seems there are no outputs:
> > [root@e850usb ~]# ls -al /dev/fb*
> > ls: cannot access '/dev/fb*': No such file or directory
> >
> > and there no simle framebuffer or related logs. "DPU is not currently
> > enabled on Exynos850 SoC" looks like the reason.
>
> hm, I am pretty sure our bootloader configures DPU for us so that might be
> why it works for us and not for you.

@Alexey - I think the LK bootloader leaves DPU framebuffer updates off
to ensure a seamless handover from the bootsplash to the full DRM
driver. We have the following DPU poke in gs101 (which if I recall
correctly we got the inspiration for this from uniloader)
https://gitlab.com/LinaroLtd/googlelt/meta-bsp-google-gs/-/commit/4057117e4bc6e08fbb6ff281cbfef8782a68ec0a

So for the E850 board, you likely need to do something similar, either
in LK or like the above poke. If UniLoader is already doing this for
the e850 SoC then hopefully you can check there to see the address of
the register etc. That should then able you to have simple-framebuffer
enabled.

>
> > Panfrost itself seems to be alive though:
> >
> > [root@e850usb ~]# eglinfo -B
> > GBM platform:
> > EGL API version: 1.5
> > EGL vendor string: Mesa Project
> > EGL version string: 1.5
> > EGL client APIs: OpenGL OpenGL_ES
> > OpenGL core profile vendor: Mesa
> > OpenGL core profile renderer: Mali-G52 MC1 (Panfrost)
> > OpenGL core profile version: 3.1 Mesa 26.2.1-arch1.1
> > OpenGL core profile shading language version: 1.40
> > OpenGL compatibility profile vendor: Mesa
> > OpenGL compatibility profile renderer: Mali-G52 MC1 (Panfrost)
> > OpenGL compatibility profile version: 3.1 Mesa 26.2.1-arch1.1
> > OpenGL compatibility profile shading language version: 1.40
> > OpenGL ES profile vendor: Mesa
> > OpenGL ES profile renderer: Mali-G52 MC1 (Panfrost)
> > OpenGL ES profile version: OpenGL ES 3.1 Mesa 26.2.1-arch1.1
> > OpenGL ES profile shading language version: OpenGL ES GLSL ES 3.10

That's really cool!

Peter.
