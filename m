Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793659109;
	b=bu8VkJX9afn/XehNuQCBS2CSTZRoOd1POo+/AJggzCh7ZEdK9Z6cVVp/ReDHR7014RI9
	 XNvOGJapFDJ4Rj5P2VzxN68SznK1Io8AvVucPAyniEOOIn0J8MPl9vhjdKgG8bQkXbus2
	 r2f66knUOM3FYvVPke88d1ZQW3g3WGcl4ktsAAerkXhO3NAHF3vhzoLrH+3CfmNq94DaB
	 mUBhYlwumnu1F+qhg2RUW7d+GeNCthXBmlw9FLHSigCO7togWenvKWcyd91JdLYVaNimC
	 nQ8Dicx5u+qNJWe1Ely4dLn4uQXaTcDQvErRcstmH1nCF0cY8z5KWHxVFrFJThlG1Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793659109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=n2if1RTPZbo5SFsEjRB4Jy0O0oymGB/SO+FAdZRGXuk=;
	b=cWcDzr4lHQiiiej+ZssNZcfnu2usq1tfDQfb4d8vU+Rj9IoqLRWKNQRXMNcxX1dhVP1O
	 2Zi+6r0ykTSix6da4MvqJndodCO52w2av9TCh4DEnb7zehFAB7G6gmvGqr5RqzqwttyOB
	 TpsNoeIVVE7ZQ59it7KKgabYrX7uKA94QWn8RU1YQ2aNrX8ZFyP0Y0YFmSBu5rgvmgriX
	 o88yrWoPUYjERPV8Si3FSJcE2j+crRwAs81AJbuV9AgCvQrhxs3GYXSmQdtc7WtIxBvXR
	 EXGOxv/AqfMXN5qecQRFkRKMa4EZDQg/dvFePz55dJuYJSZPNsiV7R/ZAWkM6uUo6jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZF7XJvAA;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D517A606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D517A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZF7XJvAA
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso4852963a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793659107; x=1794263907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n2if1RTPZbo5SFsEjRB4Jy0O0oymGB/SO+FAdZRGXuk=;
        b=ZF7XJvAAN1By1v8q6/i4QqYYyehamd86T4othD66Ytzo8E2ThRZNnihSEqh47rDl6k
         vK1kdnIU5+MM8cTAnou2t4PMul8Bl/ubSweS/WCM25Et0xcpWJjiwE8URt80eq+E59jz
         nUsY46pO+97Mb0zz6nxMFSi6elvcfQ/T8Z+GQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793659107; x=1794263907;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n2if1RTPZbo5SFsEjRB4Jy0O0oymGB/SO+FAdZRGXuk=;
        b=QDhwlO+Ayltd/9MP4P8fiEFwaCz5IBIP6ITm5t99J+IfvtltoRDlbt09uPJFF0Y2HJ
         oD1SifKX88qY+js6ldMNPjQ9nK5PWp1DDPqA6qe3LXUZcAKILJ6+7/J6TYPFS9WV2nqd
         lZLn10vvmf9JMoA3UJk8QfVnjU4Sa8j5jwfaKYZSeeHoCJbcO0sbpD6w4eKmeR/DgmXS
         0GFgvuvuS7yYuhM9M+mnHA3TqeUaNWfaRxwdGgNV+TTacSimq+fifvugud8B6m/Np1wm
         3ki/HQXUZexdxxiYXUv2LLCYYlgAFYqG452IqzUAZj8+q0SKBTUZZYN0qKMLPLMQtg4D
         LbAg==
X-Forwarded-Encrypted: i=1; AKwUvBz3qbUX4eA+S4+SeUlKF4Rgomc6R+JRV6tH9SEibO9yZi4lep/BQbPheZJ+ZxcmXCgK8qmEcmm7YaSat38=@vger.kernel.org
X-Gm-Message-State: APuU4Z95J4S8/DS4AwRjO4+fsUzqnU3Q+SnURl77jkSqzS4tLZxnq3il
	WCIkjnkl1QJ/730qoKBSN16eji0SakYfBuq4q9EhHgD5uyl9i5msPKqTsC2vGstbgF4wbCk5SeY
	fR2/1ow==
X-Gm-Gg: AYBFou23EkItFw4hxf7WGviS3OJuEgTgaikVjTMXwNUbrMI5fhzj5jFL9VDHqUr6WN/
	47LcWu4+HqL3BpFmXSoUGulL3fEcNT+jg9wx95Cx0oRnnr/DX5/LfMASweKIRbkCrg4un7R3qTp
	rJZu1fNoyCVP/8Akap7rB7v/rOiGb1YZhShLyqS5FrjSFlHeeLyDyEUmBfbwWzCQk52RuJAiAPt
	bMVAmKROg6tV9+b+NTZABwIfkE/91aXIw6Iwt8pAJP/WAD/NnMo7LPe2RDiPT2smqKtBuewjbxn
	Ks1IJPGnKNop6FLXYuYCZ8mLCmKz775zlAFfeID2KWyRzxbTM7RqQVgnl04RmyP/kmKOXrNPJdj
	sm1ZNCDnAi7PVW0PMeVoCESvkbHwfaykIqepWQxw2xof0ueW5zjplbzj3AhvmX/aMtloUUEjTI0
	F2XAnxVYry6HKeZhNKd7h/GE7O5u6leiUlwLvs/iIrrQn1cVHlB7lzBkb0TJIGzoy6BRQZ4aVba
	qWn/3G20emHrjDXpEqQR+j5lSEGiUteuhUCGTCnpebA1aAiVXJBuAegY7GSnWT00u9fsWxd0CP9
	OzChey9tsNwImdAjf0wPjQ/eDRMKpWWcTQKHvy/Eh0TXyguSQh6S6VK4hOn45RFHlxQ=
X-Received: by 2002:a05:6402:e09:b0:6b5:114d:cf36 with SMTP id 4fb4d7f45d1cf-6b5114dd219mr3247157a12.0.1793659107270;
        Mon, 02 Nov 2026 14:38:27 -0800 (PST)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9eeb26sm3588664a12.9.2026.11.02.14.38.24
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 14:38:26 -0800 (PST)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso2465600f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:38:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBw80sELq+6aN8BWhjslAfI1Aq4/M1zBgK/pPd3FBmKqtM/emy/kFmN9EEXGoYCUTOqt1/36q04QnhfYnxI=@vger.kernel.org
X-Received: by 2002:a05:6000:46c3:b0:48e:f47:273c with SMTP id
 ffacd0b85a97d-48e6e2bcd97mr17576125f8f.8.1793659103258; Mon, 02 Nov 2026
 14:38:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-sp11-bl-upstream-1-v2-1-efc84396adf1@gmail.com>
 <CAD=FV=U2sZaobJMHCimqB5Kw0fZ_-7=9tHAxT-KrSP8uQiY-vw@mail.gmail.com> <49e9a6d2-8665-4e78-ac17-da5a55abf065@linaro.org>
In-Reply-To: <49e9a6d2-8665-4e78-ac17-da5a55abf065@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 2 Nov 2026 14:38:11 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WiOkG2_4w8iarx40FOhmJOY_pRQOW+6jOW29nea6y-wg@mail.gmail.com>
X-Gm-Features: AclHuK9QTI8PVDWnzL2eO8ikSkqp3uUAySr3iNnFFlAceBchakK_x41BCxCieLM
Message-ID: <CAD=FV=WiOkG2_4w8iarx40FOhmJOY_pRQOW+6jOW29nea6y-wg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel-edp: disable the backlight at probe
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: jimmie.lin@gmail.com, Maxime Ripard <mripard@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Dale Whinham <daleyo@gmail.com>, 
	linux-arm-msm@vger.kernel.org, aarch64-laptops@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 2, 2026 at 5:15=E2=80=AFAM Neil Armstrong <neil.armstrong@linar=
o.org> wrote:
>
> On 10/30/26 02:40, Doug Anderson wrote:
> > Hi,
> >
> > On Mon, Oct 26, 2026 at 6:14=E2=80=AFPM Haipeng Lin via B4 Relay
> > <devnull+jimmie.lin.gmail.com@kernel.org> wrote:
> >>
> >> From: Haipeng Lin <jimmie.lin@gmail.com>
> >>
> >> pwm-backlight can preserve the enabled state left by firmware to
> >> support a seamless display handoff. However, panel-edp does not suppor=
t
> >> such a handoff. When probing a generic eDP panel, it powers the panel
> >> on to read its EDID. If display pipeline binding takes longer than the
> >> runtime-PM autosuspend delay, the panel is then powered off while the
> >> backlight remains enabled.
>
> So we don't support handoff _now_ but we may certainly support it someday=
.

Yup, that's fair.


> >> On the Surface Pro 11 LCD (LGD0779), leaving BL_EN high across this
> >> power cycle appears to leave the backlight controller in an incorrect
> >> state: brightness is pinned near maximum with a greatly reduced
> >> dimming range. Subsequent brightness changes update the PWM duty, but
> >> do not restore it to normal. Cycling the backlight off and on at
> >> unchanged brightness restores the full range.
> >>
> >> The first drm_panel_enable() does not recover from this because
> >> pwm-backlight still considers itself enabled and leaves BL_EN high.
> >>
> >> Disable the backlight at probe, after acquiring it and before enabling
> >> runtime PM. This clears the firmware's enabled state so the DRM panel
> >> core turns the backlight on after panel power and video are ready at
> >> the first modeset.
> >>
> >> This also turns off the firmware display at probe on systems where it
> >> previously remained lit until the first modeset.
> >>
> >> Verified on the Surface Pro 11 LCD by delaying display pipeline bind
> >> past the autosuspend timeout. BL_EN now drops at probe, before panel
> >> runtime autosuspend, and brightness control works at the first modeset=
.
> >>
> >> Fixes: 5540cf8f3e8d ("drm/panel-edp: Implement generic "edp-panel"s pr=
obed by EDID")
> >> Link: https://github.com/dwhinham/archiso-aarch64-sp11/issues/41
> >> Suggested-by: Douglas Anderson <dianders@chromium.org>
> >> Assisted-by: LLM
> >> Signed-off-by: Haipeng Lin <jimmie.lin@gmail.com>
> >> ---
> >> Can reproduce on an installed system on Surface Pro 11 LCD (X1P-64-100=
,
> >> LGD0779 LCD) by booting with modprobe.blacklist=3Dphy_qcom_qmp_combo t=
hen
> >> loading that module manually after ~20s. This delays DPU component bin=
d
> >> past the panel's runtime autosuspend timeout.
> >>
> >> A/B tested against the same v7.2 tree:
> >>
> >> - Unpatched: panel VDD off 3.5s..20.5s while BL_EN stays high.
> >> After the first modeset brightness is pinned near max brightness with
> >> a "collapsed" dimming range. sysfs brightness writes still reprogram
> >> the PMIC LPG. One bl_power off/on cycle at unchanged brightness
> >> restores the full range.
> >>
> >> - Patched v2: patch provides the same full brightness range on boot
> >> (stalled or not) as the v1 patch. BL_EN drops at panel-edp probe,
> >> ~1s before VDD cut, rises ~0.5s after panel power at the first modeset=
.
> >>
> >> Tracing and functional testing on the SP11 shows unchanged sequencing
> >> for fast boots (without artificial delay), DPMS off/on, and system
> >> suspend/resume.
> >>
> >> Panels with shared/always-on supplies and no panel enable GPIO
> >> may continue displaying the firmware framebuffer during the
> >> runtime suspend before first modeset. With this change panel-edp
> >> disables the backlight obtained through the backlight phandle at probe=
.
> >> The DRM panel core enables the backlight again at the first modeset.
> >> I have not tested this configuration.
> >>
> >> Testing on other panel-edp systems particularly with pwm-backlight,
> >> would be appreciated.
> >> ---
> >> Changes in v2:
> >> - Disables the backlight once at probe instead of
> >>    in panel_edp_suspend() following Doug Anderson's suggestion.
> >> - Only disable the backlight obtained through the backlight phandle.
> >>    The driver's AUX backlight setup is untouched.
> >> - Link to v1: https://lore.kernel.org/r/20261024-sp11-bl-upstream-1-v1=
-1-d39bfaf9afbc@gmail.com
> >> ---
> >>   drivers/gpu/drm/panel/panel-edp.c | 11 +++++++++++
> >>   1 file changed, 11 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel=
/panel-edp.c
> >> index 94bc54c3833a..d019f4165674 100644
> >> --- a/drivers/gpu/drm/panel/panel-edp.c
> >> +++ b/drivers/gpu/drm/panel/panel-edp.c
> >> @@ -21,6 +21,7 @@
> >>    * DEALINGS IN THE SOFTWARE.
> >>    */
> >>
> >> +#include <linux/backlight.h>
> >>   #include <linux/debugfs.h>
> >>   #include <linux/delay.h>
> >>   #include <linux/gpio/consumer.h>
> >> @@ -918,6 +919,16 @@ static int panel_edp_probe(struct device *dev, co=
nst struct panel_desc *desc,
> >>          if (err)
> >>                  return err;
> >>
> >> +       /*
> >> +        * Backlight drivers may preserve the state left by firmware,
> >> +        * but panel-edp does not support seamless handoff.
> >> +        * Runtime PM may power off the panel before the first modeset=
,
> >> +        * leaving the backlight on.
> >> +        * Disable it here so the DRM panel core enables it in the cor=
rect
> >> +        * order at the first modeset.
> >> +        */
> >> +       backlight_disable(panel->base.backlight);
> >
> > While still feeling a little ugly, I can't think of anything better to
> > do in this case. Thus I'd say:
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > I'd prefer to get a second opinion from someone else in the DRM
> > community to make sure I'm not missing something, though. Neil,
> > Maxime, or Linus W maybe?
>
> I lack some knowledge, but when the display pipeline is probed
> who's in charge of disabling the backlight when suspending ?

I'm afraid I don't understand this question.


> Why don't we handle the backlight state in the PM ops ?

That was what Haipeng proposed in v1. ...but it felt wrong to me. The
core panel code is supposed to manage the backlight and it handles
this in most cases. The only problem needing a fix was at bootup.

-Doug
