Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793031055;
	b=MuYsKL5PVvGzrHJDNhaZQ6DAYicCzBmWiIO0THpPgokQkP6I0MUMBCjM0c4G2GCKj5mp
	 5tNmnacUqqdf2Ptbi1GPAD5g5/Z2oW1rykAMIedMWUQeD8j7BynFFXjBi7yXG+Arxl8TV
	 wreLbvt82KeSOkz3NxlJX/NAbbkSk+ePN89hSKno/xMurDK4iG16Ov5Nkh9RkwWS0As32
	 1Q3G2rQRvCNJlMAFRsSvam6as+jHVBZsZBU1PCVrj5zEgAX9eQjaiuUaPSbn1/h9RrKfM
	 92V3KfXI6C5sVQdWbI3T6HiL+WdhukmBSOx1VS7TC+3XUeYTEnd/19LTIKf9xk3CirQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793031055;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LRYiObfFeB4WPOp5iFNMLIAZZFa6drRLpmas4AXgTgk=;
	b=lwWBGgygdr/swDzkUjutbxQ96QCfUwdfrOvXKm7kcDs5ZvOnTv2KfSo77vBl8zJeZFYF
	 j7WI10tbPOQMzmD3VO2sUehXJGD/rw15D3IVJfsNsYc9JEJMxiM8pp1DwgkWPwWpmiys+
	 74GN3i8gA7nh6qc3+boTNxGeAX4yTtYI9W7/YxejxuqkbmkzKJRMot0CaQRAw58MxCpwn
	 frINGXW6Cbzd8l9dPn6mRYrxEEXE9wlTFtcwx3SWWy4bhoqKSo+2/hIPQn2z0jlf4zjY4
	 cUKsWYCop6l/YjEK/+mY+diLgpPVn/sBwTa4q1ecxA1I6xDoE6UvcsUuCOaAHXFl2mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZBS4DOKw;
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6033C606A322
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:10:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6033C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZBS4DOKw
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso1436407e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793031054; x=1793635854; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LRYiObfFeB4WPOp5iFNMLIAZZFa6drRLpmas4AXgTgk=;
        b=ZBS4DOKwaFSBTwSnrT82bQprXWVLVOyeHn7Rd47+Nu8KvW7cigkMoZczMeyOwgumjt
         hJEe7X1zBFzRe3OGiUgWDMJWb89cIgdJT0fuAUbNCv5+YqC1Pxqyv3wlZtvFADsTKVUq
         /CYzQDk5M8EkrYIn5gF+cXHtk2jRWLgQKjjlA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793031054; x=1793635854;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LRYiObfFeB4WPOp5iFNMLIAZZFa6drRLpmas4AXgTgk=;
        b=KBPjsnFWbGWp0vzWkdYE3MgkGHhEXIBksYfvDld808LpB7toRc2M1/dHZpk3nfx0bS
         yvb8apnsAQplSPpE4FDf6JTF2c8Kae0uuVNWENkHzg6FjTpwJE3NwYGIejQ4r6quJBqR
         jott9wvnTNMWYsV0Vk8AlYISiPrjEa5SOnq+WIASdOJ7K5a412UUOluoL5vP9zBmzoWb
         HbabRQsKlI8X6Uqeq2YtoAO3g5GXPKsHj71oXjKDE4sdOOvHkvZwnV7Eh+hO3GOQfEaM
         EsSlfzOTtEITM0Fi2PgZwf3umrcXhvIwQRAjiAdFSvwJ5lBhyYbD049iDCKu7C76SvAT
         UGRw==
X-Forwarded-Encrypted: i=1; AKwUvBxKr6/eMvSsM4fNLg35g2NFgiVVTwUoxFXagRpzOqaDqBKFEfzzK71hMIpdIgx9dceTXwZ/kAHAAwON3ng=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxVWaMoSTcQ/ZCmdkFrg00c2xjPSZXaHL+VvAWpfMrNan7nH0E
	EEaAc8JGZ5smPcwc2hHyDRKT/Bs6WUvukxswuLHghL2wVWF18ZgQFlRWV6MpP4ePRayIKVMCVjR
	r4aKQig==
X-Gm-Gg: AYBFou1Ab3tfC8F28kYXkjwivo3Pc3xZm3JT5WqTMEdnxaMQ4x83BVawpn+0BeVzcqW
	nEBawLQwMC84683nLoKu7KvRW7+sM6+vZaCTdobtM2D+5SgpWpQ/HpRhVeto+agTDVAB9ZNFJx+
	KipsqEyHO9i4wW5eOtdWM4ZcqTc1Oc+Ll+Gjgp+CbiW7aHAjnVC6hA9/Jna+rDDiNojM81540ZX
	v3CPAiXWMOdaeObnyiHSk4+9/PlhfFsPWWa7A9ZipP8I5VftaO8kkL4IB9T1hjjIaSXG8aj44rH
	jjvdB6RO6E/VCEg01BuMcuiFVClfOz+FyNXcUSWvkIFBa7fFKLZLDNUonBkibmUVXGv77ikZaqc
	8gwi45CPBtDqm6L7A/rVvhfYHxDYJb5wBQj21EWYjgwvq3tx4Se61db3PmVQXG8nKJfxreoB7rs
	D9aA/xUuxxE9YlIhPTXbfS7LivWi/ABrPPYk6b51XvpuD5R8BN88Rmk6J8I/3xz/R1+2+ZeqxWZ
	Z8AHTfx74X20zVATxd5zVXomnAHParJjfKR2StiUeQ4r8J/driiAQIszm+guPEv/68Y0Ap1EN1c
	XrnV3yavT3ukgXrgXQ+2v1s=
X-Received: by 2002:a05:6512:400f:b0:5bf:bed1:6ae2 with SMTP id 2adb3069b0e04-5bfbed16c19mr1026441e87.65.1793031053669;
        Mon, 26 Oct 2026 09:10:53 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfc0a8f680sm521295e87.3.2026.10.26.09.10.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 09:10:49 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a75f960be3so27801321fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:10:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxhfaZG3sMHv5IdkWgTbde/XmtJFM8EGlA2y/y14Nr5EBk5YUTX7E9YcLok810C3GnvFlIzT3J3nzPWkVQ=@vger.kernel.org
X-Received: by 2002:a05:651c:a32c:b0:3ab:690f:82ab with SMTP id
 38308e7fff4ca-3ac6fd6d952mr16112171fa.28.1793031047006; Mon, 26 Oct 2026
 09:10:47 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-sp11-bl-upstream-1-v1-1-d39bfaf9afbc@gmail.com>
In-Reply-To: <20261024-sp11-bl-upstream-1-v1-1-d39bfaf9afbc@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 26 Oct 2026 09:10:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X+003jZ_LLQK6HEtuKs9Y39z=4=2SaN_=Y0uSXgVXFOA@mail.gmail.com>
X-Gm-Features: AclHuK8VJDZ71e8SV7IfzgVPRQ8znFYiO6UYRUmBFyp4fXJJtzRNheKbSl34Kx8
Message-ID: <CAD=FV=X+003jZ_LLQK6HEtuKs9Y39z=4=2SaN_=Y0uSXgVXFOA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: disable the backlight before powering off panel
To: jimmie.lin@gmail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Linus Walleij <linusw@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Dale Whinham <daleyo@gmail.com>, linux-arm-msm@vger.kernel.org, 
	aarch64-laptops@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Oct 24, 2026 at 5:24=E2=80=AFPM Haipeng Lin via B4 Relay
<devnull+jimmie.lin.gmail.com@kernel.org> wrote:
>
> From: Haipeng Lin <jimmie.lin@gmail.com>
>
> If the display pipeline takes longer than the runtime-PM autosuspend
> delay (1 s) to bind after the panel probes, panel-edp's runtime suspend
> powers the panel off while the backlight is still on: pwm-backlight
> inherits the enable state left by the firmware at probe and keeps the
> enable GPIO high. The panel supply is thus cut without first disabling
> the backlight, leaving BL_EN asserted across a panel power cycle.
>
> On the Surface Pro 11 LCD (LGD0779), leaving BL_EN high across this
> power cycle appears to leave the backlight controller in an incorrect
> state: brightness is pinned near maximum with a greatly reduced
> dimming range. Subsequent brightness changes update the PWM duty, but
> do not restore it to normal. Cycling the backlight off and on at
> unchanged brightness restores the full range.
>
> The first drm_panel_enable() does not recover from this because
> pwm-backlight still considers itself enabled and leaves BL_EN high.
>
> Disable the attached backlight in panel_edp_suspend() before marking
> AUX unpowered and cutting panel power. This ensures that the first
> modeset enables the backlight after panel power and video are ready.
> When DRM has already disabled the backlight, it remains off.
>
> Verified on the Surface Pro 11 LCD by delaying display pipeline bind
> past the autosuspend timeout. BL_EN now drops before panel power is
> cut, and brightness control works at the first modeset.
>
> Fixes: 5540cf8f3e8d ("drm/panel-edp: Implement generic "edp-panel"s probe=
d by EDID")
> Link: https://github.com/dwhinham/archiso-aarch64-sp11/issues/41
> Assisted-by: claude-fable:5
> Signed-off-by: Haipeng Lin <jimmie.lin@gmail.com>
> ---
> Can reproduce on an installed system on Surface Pro 11 LCD (X1P-64-100,
> LGD0779 LCD) by booting with modprobe.blacklist=3Dphy_qcom_qmp_combo then
> loading that module manually after ~20s. This delays DPU component bind
> past the panel's runtime autosuspend timeout.
>
> A/B tested against the same v7.2 tree:
>
> - Unpatched: panel VDD off 3.5s..20.5s while BL_EN stays high.
> after the first modeset brightness is pinned near max brightness with
> a "collapsed" dimming range. sysfs brightness writes still reprogram
> the PMIC LPG. One bl_power off/on cycle at unchanged brightness
> restores the full range.
>
> - Patched: BL_EN drops ~300us before the VDD cut and rises again after
> panel power+link at the first modeset. full brightness range works.
>
> Tracing and functional testing on the SP11 shows unchanged sequencing
> for fast boots, DPMS off/on, and system suspend/resume.
>
> Two cases would benefit from testing on other hardware:
> 1. AUX-controlled backlights
> The disable is placed before drm_dp_dpcd_set_powered(false) and
> regulator_disable() so the panel remains accessible if disabling its
> backlight requires AUX writes. But I have not tested this since my
> LCD is GPIO/PWM based.
>
> 2. Panels with shared/always-on supplies and no panel enable GPIO
> These panels may continue displaying the firmware framebuffer during
> the pre-first-modeset runtime suspend. This change will turn off their
> attached backlight during that interval, potentially making the boot
> display go dark earlier. This matches the driver's powered-off state,
> but I have not tested that configuration.
>
> Testing on other panel-edp systems particularly with pwm-backlight,
> would be appreciated.
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 94bc54c3833a..87f9c13380be 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -21,6 +21,7 @@
>   * DEALINGS IN THE SOFTWARE.
>   */
>
> +#include <linux/backlight.h>
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
> @@ -413,6 +414,18 @@ static int panel_edp_suspend(struct device *dev)
>  {
>         struct panel_edp *p =3D dev_get_drvdata(dev);
>
> +       /*
> +        * eDP panel power sequencing requires the backlight to be off
> +        * whenever the panel is powered off. Before the first modeset th=
e
> +        * backlight driver may still hold the enable state inherited fro=
m
> +        * the firmware, and some panels' backlight controllers come up i=
n a
> +        * wrong dimming mode if their enable line stays high across a pa=
nel
> +        * power cycle. Sync the backlight off here so that the backlight
> +        * enable from drm_panel_enable() performs a true power-on in the
> +        * correct order.
> +        */
> +       backlight_disable(p->base.backlight);

The above doesn't look right to me. In general, the backlight should
be owned by the core DRM panel code. Jamming this in here looks like a
hack. We'll also be double-disabling the backlight in most cases since
the core drm_panel code will be disabling it _and_ we'll be disabling
it.

I guess the problem here is that the PWM backlight code tries to
preserve the backlight to handle panel drivers that support a seamless
handoff from the bootloader to the kernel. Since some panel drivers
handle that and others (like panel-edp) don't, it's hard for the core
to magically do the right thing.

I think the right answer is to disable the backlight at probe time for
panel-edp. This is a one-time thing and just to handle the bootloader
handoff, so having the workaround run once at bootup is better.

-Doug
