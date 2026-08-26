Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788AA3D0BED
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 19:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787770992; cv=none; b=YoKLnnGEESldG6X3NkPb4UVyfBdXQbBFKDviALpyorL7sr+6ieFwnW0B2Czy803s0bcIZv+YjoPKrXfjtnEOb9wKgsS13R84dx1oSfAYp1E6bbmCCazviNeG8iu89q6EixtZWi68H6r4NS0haZHmP8LvWng5U//07Q5mdEglC9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787770992; c=relaxed/simple;
	bh=wvM8aRvWPmKDto0w4PK3ahRPwdGDE0+KecxUUFw61Bw=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=AexW4kJSjakw1E4ye/2ohEuN3mjr8bIQe1geI0U4AtBDo25sZ7rMdf6EQr+FGmdYYXHQRiiyfdZaD997KX4RmgsZfcTjsL403u740duRxPRnpk6tAD6Pthu1qzVd+ev7oWa/uoq0Z7igLtjlG72HnQuYhmdqDh9V3a4w4RQ6348=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GEkvImgz; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GEkvImgz"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f96c5b722so657355f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787770983; x=1788375783; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T2Ai0YOriuHS1IQ7CT4b8R/035xHTVcwVEKbUv9HN3g=;
        b=GEkvImgz1qvD7hqOUYhghwCsVtHsDlpxC2xmH7NBZyqzb0H5n8H2i8Uz66He7NNAe9
         wZS0rRb2oBZuL4ANoEtBmcIxIVA90gFzq7aJrTp9DmFauDIhKhy5E/WaQ/Xl7pmfDGil
         YOPHjGo+5Zz3aTPdwk0C54E0Zkm6uzUeXNCix5tEoyft7jH3CBAsPb3+HCLZEoJj+2An
         LcyVzKIy4DE0D0D7gBsE4/qBt6fy6rmUpJ/Kr0fLjNaTUyut4BIv+je4Rs9snk4VKL+E
         OgxAXHuTbG6UTuWAIq91IwoEEjJA3RW6uUVorPgYq91chYx9Crahd0fUvsaMmYDDTdBO
         Kxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787770983; x=1788375783;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T2Ai0YOriuHS1IQ7CT4b8R/035xHTVcwVEKbUv9HN3g=;
        b=J3O7oR1XFyaFlomB9vmGW+MhE8lbxm9tOlwhz9L0aQ6R1ZCu6aRCtjCakH69k7C6tU
         aUbsxV1iOeX0Bp/KybIRzqJHW/iiKZ+nb2699DTPA6h2f/PkQbMR+nSrdBxsz+NQuRls
         NChHBCadLMC9K32dy/fr7qbPhKaVYV8/MWnla7OGxbiq/yQqq/6ArID7YqpuG9gb2gVW
         xzJtETeLb1C3OxOVExYENdy4eI02wIApCcFZcAG9qaSPJh/bx+GAVZ0BNUycFCrGxUsg
         qLndExDmbsv0xNnA/MvIgzY7Rbzla9l483FMTqdyW+MGQQHzzI2c73HjiK2Mw/kqKbe2
         On8w==
X-Forwarded-Encrypted: i=1; AHgh+RqNoM/dHMm5cZujx2dFWtaMMWK9UMUf/KyEwykEm/FsOIHjKJMUF7FFx13E1rtWRGwtZsVqk5eebky4GD0=@vger.kernel.org
X-Gm-Message-State: AFuF++nkxt4FLimmqV686qjM/KwGP948sCaxuFpdzAUxcuZegAazcyhK
	gxNs8FtpQnu7j74J/jW3sN+hrHhMGDP1yI9qEmMYx3NKBoXAj6QIv8ivFkO/3VDlX2Q=
X-Gm-Gg: AR+sD10ja9k/8HHvzP686/aHV1TTbPiddhJmasJL91gciZAiCbcU5UazHf6LPVlN4hf
	IoroHHSA61XWTLOA3xwLt/QEPujfszwoaDwPPv7til2//qfQoeiUYsXpQOd12vqMjy0EPL/Oaai
	VTIFRkN1rFOkbcytn+MhRTkwephf6rIvHUFLZmUtV4utIf4o56MP7miAtrqVv8m04ANxAVXeieV
	F7hhV0VkQJE082cCtuv82EvRh4ZkuYTh2WPsl5BmdSNSqy7Aoyso82owlXYtI0aB7h5ewk22b+O
	l1ZGN7fRgTgDJI4vNiycBERbOqD92qOpR96Z+cRGYlwoStfxQd0W6NeQRyr7bZMfWVl6N09iWno
	oAN0oAlTn5Qx9/GYzTmtliZJAFW7lVdhnkmoq6z3Hy37C8jZmj613CFvaIXLc3uHA8SZ8Zxy+X7
	QQ/0VdGfIU9i1dpA5+1X4eDQxjSXK96vix7PVqAX48/IAuwtjTj78DcaJmBjW+qD4pGLT1EKP+5
	Oi+xBrooTWCFpxiedoyca+Z5nr462a5TxYRiQ0lnB+GGosZi9Rl4mwwTT5x
X-Received: by 2002:a05:600c:190e:b0:499:a277:e8c8 with SMTP id 5b1f17b1804b1-499dc725b50mr82901585e9.13.1787770983326;
        Wed, 26 Aug 2026 12:03:03 -0700 (PDT)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab4dasm3669437f8f.15.2026.08.26.12.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 12:03:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Aug 2026 20:02:59 +0100
Message-Id: <DKZ3X5VUHJSK.1KSJR6K8FATGV@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Thomas Turner" <tturner@lineageos.org>, "Sam Protsenko"
 <semen.protsenko@linaro.org>
Cc: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 <krzysztof.kozlowski@oss.qualcomm.com>, <peter.griffin@linaro.org>,
 <alim.akhtar@samsung.com>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>
Subject: Re: 
X-Mailer: aerc 0.21.0
References: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM> <CAPLW+4kQTUX8QhKnAP7bg=iCw5hhNQZoW7cuOpTdvvAUpGaicg@mail.gmail.com> <135d48e7-58ac-48b8-8fa5-c2548e2f3ae9@lineageos.org>
In-Reply-To: <135d48e7-58ac-48b8-8fa5-c2548e2f3ae9@lineageos.org>

On Tue Aug 25, 2026 at 10:05 PM BST, Thomas Turner wrote:
> Hi Sam and Alexey,
>
> On 19/08/2026 20:51, Sam Protsenko wrote:
>> Can you please tell us a bit about how you tested this patch, and on
>> which board? As DPU is not currently enabled on Exynos850 SoC, I'm not
>> sure how exactly GPU can be useful. If you have a use case or a
>> testing procedure we can run on the E850-96 board, please share.
>>=20
>
> Sam, Alexey could you please test GPU on the E850-96 board by following
> these instructions:
>
> 1) Apply this patch series locally
> 2) Change status=3D"disabled"; to status=3D"okay";
> 3) Make sure these configs are enabled:
> CONFIG_DRM_SIMPLEDRM=3Dy
> CONFIG_DRM_PANFROST=3Dy
> 4) In terms of regulators we set up a basic mali regulator via our
> secondary bootloader [1] and configured with this dts setup [2], NOTE
> you may be able to get away with a dummy regulator so try that first.
> If not I am sure you can replicate something simple with u-boot PMIC.
> 5) Boot a GUI, I saw Debian was used for the bring-up, that should work
> 6) Run the following command:
> $ dmesg | grep "panfrost"
> 7) Compare that to the output at [3]

Your email subject still seems to be null.

[   15.206193] panfrost 11500000.gpu: clock rate =3D 377000000
[   15.206322] panfrost 11500000.gpu: error -ENODEV: _opp_set_regulators: n=
o regulator (mali) found
[   15.206513] panfrost 11500000.gpu: supply mali not found, using dummy re=
gulator
[   15.206840] panfrost 11500000.gpu: mali-g52 id 0x7212 major 0x0 minor 0x=
0 status 0x0
[   15.213137] panfrost 11500000.gpu: features: 00000000,00000df7, issues: =
00000000,00000400
[   15.221271] panfrost 11500000.gpu: Features: L2:0x07100206 Shader:0x0000=
0000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
[   15.233080] panfrost 11500000.gpu: shader_present=3D0x1 l2_present=3D0x1
[   15.240488] panfrost 11500000.gpu: [drm] Using Transparent Hugepage
[   15.250497] [drm] Initialized panfrost 1.6.0 for 11500000.gpu on minor 0

[root@e850usb ~]# uname -a
Linux e850usb 7.2.0-next-20260825-00009-g647b48e80572-dirty #8 SMP PREEMPT =
Wed Aug 26 17:05:45 BST 2026 aarch64 GNU/Linux

I have different DRM_SIMPLEDRM options and related  enabled but nothing
pops up via HDMI (at least I tried simple xorg-server things).
Is it possible that your bootloader initilises some framebuffer and inserts
it into DTB that passed to kernel? Or you have some other pieces in
kernel/dt that implement missing functionality?

Here it seems there are no outputs:
[root@e850usb ~]# ls -al /dev/fb*
ls: cannot access '/dev/fb*': No such file or directory

and there no simle framebuffer or related logs. "DPU is not currently
enabled on Exynos850 SoC" looks like the reason.

Panfrost itself seems to be alive though:

[root@e850usb ~]# eglinfo -B
GBM platform:
EGL API version: 1.5
EGL vendor string: Mesa Project
EGL version string: 1.5
EGL client APIs: OpenGL OpenGL_ES
OpenGL core profile vendor: Mesa
OpenGL core profile renderer: Mali-G52 MC1 (Panfrost)
OpenGL core profile version: 3.1 Mesa 26.2.1-arch1.1
OpenGL core profile shading language version: 1.40
OpenGL compatibility profile vendor: Mesa
OpenGL compatibility profile renderer: Mali-G52 MC1 (Panfrost)
OpenGL compatibility profile version: 3.1 Mesa 26.2.1-arch1.1
OpenGL compatibility profile shading language version: 1.40
OpenGL ES profile vendor: Mesa
OpenGL ES profile renderer: Mali-G52 MC1 (Panfrost)
OpenGL ES profile version: OpenGL ES 3.1 Mesa 26.2.1-arch1.1
OpenGL ES profile shading language version: OpenGL ES GLSL ES 3.10

Best regards,
Alexey
