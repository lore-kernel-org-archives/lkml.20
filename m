Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794259873;
	b=X78Z8CfxZSvcFyQeVrNR9r3k6pVEbHNv4ngbBBU5m4ESqZMhNjScZ908xhkknn/HU3G/
	 08qeV8p9uCcRtVClselZmuxsxbG58ewDvK7FCW4eM+IJSMGxTFc5ZFIL1uVSzzxMZwAWF
	 DMPn2jC8cJ1PGa/cSYBiMZIozrZwmW3933UVv1Acxf6bN+lhwS7JgUWa6hOG286f3AZgT
	 Ta9/+xdikf8UZl/B9g5cJ0rj4E5k+4gme9tPh6atK/60539KLrKa1TCpUUgjxceevLTSu
	 TjBUQ/R4PFIbBz69+dR2YIlCWLFS9a0P0LJCp1aU5bflP7hyedniEFPt51AqSqWzCBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=/EdyRBuSLDi34I2yUF/0MNN4/B7N97U0MYPog9rcgsg=;
	b=eME0/dYDU1eziGRZAoxaLR1v4rfYpC1lVZ740Z9kM7RrmfCHAwZP4v764HUjhRMZxFNp
	 MSkaVB9UDljpht/KpTVkVgpLrCEK18CBn2+zFBJdjLh7iswyK20fUByHnyyNOajRuhAPp
	 aqguaiVJLmHjZ0W40us7Sd2QIhS+NoEh1OLQPYHbAvhx41MZrv8d6P0eB0vn9ThucD6pq
	 bLl9SangZyrc52rcZmatBNZmZ+VEKnL8stZ0EWjchs2K+Xe11i4mc8oVZacClqYCFarsS
	 e/R5Q70AeDdIvJBeGX9JutM5TxeNkCCBGmVEeUBLavZ/prkBV0o2p8ZmhpFNAPEAG+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Nw5kZnh4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82AA606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A82AA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Nw5kZnh4
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67bec5dc8d4so897233d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:31:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794259871; cv=none;
        d=google.com; s=arc-20260327;
        b=GkMudXd8pN2dIO6iiUTnzaEUvpARJyXsjmtu3Ytw1olq9FB89n4R4lFUavexhMuWZh
         3wN6rR6nOtpj7DYMX5HuQtz3Fu58h+9b8NsuRQPS6pboGBlGQhYZCxCCeD+N2fVKWjQ+
         9rQU/S1JsMuzjBs64X6J00QI7Yf/9FVRrZTft5vNMjknFKd2v5beGHe/nemFtorEpGWO
         18DKTLD3MCYIFwVYKT1vH9+fzYa0zsUMBuPRFthyP+cC9LUCELDa+8sm7WA5fFXF7j8l
         6kf1GZuvsAXTh2YzP5HcSZ3sE1swIY7TNdrJo7w16+AajtRnDxNEwbVjBHsjvT/VFQ20
         tmIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/EdyRBuSLDi34I2yUF/0MNN4/B7N97U0MYPog9rcgsg=;
        fh=P4CESENRHyolPJhdTc5bGjFrAI9NiYKpD3dfTEo07LA=;
        b=Rztlj8qHK+MJFfGA4xOxImS9S/Y1yfh7itmxedLIJX2LS2Evar072MIIOO7C7rHemk
         z+0tyQT4BCcxelWgNJK/xYXVoctBoUv5WCRJZD0TLHX0Ca/JUbO8iTrTZ+K+FM+0v3Gh
         wruHbMpmKcmbHoVja7gwDhLnBZoCCf3/lp6FzVXiOQqOXFp2wpypYoq1AtqN1ShnmiUA
         cVELN93Xjyig+IYLhS9nioQaLxuvrOy4ZD4Ttpy0JVVtlDN254CmpUszW0P1IGvC+BLa
         VxSur5/BQ/SLAknqZS8D+u0CXNjqs5zDlW0WpO7N5G6kAIUZv/9djXZ34k09sdnCGSU+
         ZHSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794259871; x=1794864671; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/EdyRBuSLDi34I2yUF/0MNN4/B7N97U0MYPog9rcgsg=;
        b=Nw5kZnh48cxOpvdQa8l9OABayCaXaJ1bg9Uz5lY/TVSWUZWtvoyIzMHHPWFe3DLRXK
         gFOgAnls2+aLWBKHBzMLjrmhisKuNYWjlgaInJunH2WCNX6D+HyIt9jDbK4lo6Q+WhI8
         okLT4LjexAiV9Q/hxRuFOzfJd8hsjX95raPYoVhjJfmQu+9rIMp1kr/0/pI6pjsPlZWC
         iTW0W+5nmItVBvBzmdywzCHKzGVYD7/nZ2Np5aMuKpTx3QeGIPXEy+a3CJXhJN15J3v9
         HeFKskVNOISrdiQQIvxgkwa7k9FxkU87CbhmVmVJiHvI+v7/b8oocETwv+Y2paQ3y8cY
         iDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794259871; x=1794864671;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/EdyRBuSLDi34I2yUF/0MNN4/B7N97U0MYPog9rcgsg=;
        b=icZFIs5mOnowLvAlwGOe63ZPIvty+fH8If8AX4P8AHc57/1BIPTo9ouedyRGysaec0
         WS0r8VtGRRe+iLitsr6EE2ymeNTPDfjDnNedk9HYUkurlxRJdYCjftoSlrUzvBkea/Rd
         +qR/tqbwjChwrtsKOlvsqkZJwlhH0XrhtdhTuL3cqnrgYS8/5A/UxjpiRn1Xg2OP2PDW
         1iIW4b3lN4OV+QeKFcFTUtS1S5pRqHl4psUQNzbFQqqptC6A71wtneGdymD/eFY/SIY5
         TKpkNiKVKkGS6on5DvF+MjXpwdPe1ZzDjqUsdHy+Fe3QxeyHeGhNmaswRX2uB6+07/2b
         K31A==
X-Gm-Message-State: APuU4Z+dx8gjGDnh5wh8kLuD23hFL0qzcCoOJlyjClzVNayd8dmAA4bN
	nBLfB7/eO2dVC1fCDULAvM0F+n9++hSxu358ZWMlarYjHfDGytPmuH8YnkqaxjxBimLxS88gxoX
	esSYd+Dmc8/UFU9dzEF/WUOhQCDCXZ8g=
X-Gm-Gg: AYBFou1m2GgAKBS/M6EiaTtV2n//rNwqJOZsaKNvxUzr0kwOJzh0o9uF31Lb+KeM/Ij
	xf3q8yC6OIbsmf1Y5yaD2PkusameMkGfMiCVEZMTpYGcOKeqLzT6oMDQ7ApaOiq2B9jyWqIs/n/
	l45vjzuL3SzzhJyC+ZsOKpSJNmSvxs/kHiBMLjc9iB+Nz+K236agES6KUIAR7ie+OnM2XFw/v3r
	6Sv2CqAJjSNprTakVDkaHA9c+pR7hrW4imOzOWu+x2lCMm/k6KxCtfOsm9UyYEj5Dhc07QP4a3s
	m/ykHA1Fhs7cHod3zMP/Se9fWu6BMPyvFRltX5KBzMStZeO7QUWv40aOLj2G9CVhN5JO/k5mDZr
	RQoOJb8ZFeMstWRRNRTkSgkE68wioR5YKoosVYzlyjfawMyZY4oGLxtiaWcMhpfqjpFJ0nQ==
X-Received: by 2002:a05:690e:169c:b0:674:84c:f2c9 with SMTP id
 956f58d0204a3-67c56818366mr627381d50.46.1794259871498; Mon, 09 Nov 2026
 13:31:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.44efb263-5265-4fae-9cff-e8eaefbc0afd@emailsignatures365.codetwo.com>
 <20261106130010.340950-1-mike.looijmans@topic.nl> <1ec088e2-f588-4acf-87e6-0dbf719784bc@sirena.org.uk>
 <CAFBinCAaaovFc-Rvrm=U8Z6NG3HZKrQuM55C-xq9JYOhX6htug@mail.gmail.com> <21c64232-e2e2-45f5-917e-d326d159d285@topic.nl>
In-Reply-To: <21c64232-e2e2-45f5-917e-d326d159d285@topic.nl>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 9 Nov 2026 22:30:59 +0100
X-Gm-Features: AclHuK8FrN839cbFJUJ6GagMfkDIsH9Tm4cSFSe4IJtAY07VhEEarDu0rZ7a-eY
Message-ID: <CAFBinCC23T67TMAGOU13a5+3jw2ps3Ye5aZgUUXJQ3cVKmVT2Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] regulator: pwm-regulator: Revert "Calculate the
 output voltage for disabled PWMs"
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Content-Type: multipart/mixed; boundary="00000000000046b945065fdeae3a"

--00000000000046b945065fdeae3a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 7:09=E2=80=AFAM Mike Looijmans <mike.looijmans@topic=
.nl> wrote:
>
> On 06-11-2026 22:57, Martin Blumenstingl wrote:
> > On Fri, Nov 6, 2026 at 2:42=E2=80=AFPM Mark Brown <broonie@kernel.org> =
wrote:
> >> On Fri, Nov 06, 2026 at 01:59:55PM +0100, Mike Looijmans wrote:
> >>> This reverts commit 6a7d11efd691 ("regulator: pwm-regulator: Calculat=
e the
> >>> output voltage for disabled PWMs")
> >> Adding Martin who wrote that patch - please CC people if you're direct=
ly
> >> updating their patches.
> > IIRC get_maintainers.pl includes the author of the patch blamed by the
> > Fixes: tag (if there's one).
> >
> >>> A disabled PWM is not the same as "set to 0%". If the PWM is disabled=
,
> >>> this could also mean that its output pin is tristated for example.
> > How do we know if it's 0% or tri-stated (and what's the behavior if
> > it's tri-stated)?
>
> We don't know, that's the point I'm trying to make. If the PWM is
> disabled, likely its clock is also turned off, and the actual state of
> the output is not known. Depending on hardware, it could be high, low,
> tristated, pulled up/down, ...
Not knowing the actual status is what Uwe also noted 2 years ago: [0]

> What may happen now is:
>
> - The PWM is set at 50% and disabled.
>
> - This function returns "0%" as being the current level during probe of
> the supply.
>
> - The core wants it to be at 0%, so it doesn't change the setting and
> enables the PWM.
>
> - The PWM now runs at 50% and the core thinks it's at 0%.
>
>
> What happens in my case:
>
> - This function returns 0% because the PWM is still disabled
>
> - Core wants it to be 50%, so it calls set_voltage() which sets the PWM
> but doesn't enable it yet
>
> - Core calls this function again and (still) gets 0% as being the setting=
.
>
> - This goes on until the supply (and hence the PWM) is enabled.
>
>
> What the callers expect is that this function returns the value that
> would be set if the PWM were enabled.
I think this is a good description and something we can improve upon.
I attached a patch - please try it. If it's not enough: please apply
your patch 2/2 on top.
The goal of that patch is:
- keep duty cycle around once it has been set
- only reset to duty cycle 0 at initialization and only if the
regulator has been described with regulator-boot-on
- (it achieves this by keeping a copy of struct pwm_state around)

I'd like to hear about your testing results and initial code-review feedbac=
k.
+Cc Uwe - happy to take your feedback as well.

>
> >>> If the PWM range is limited to something else than 0..100% this cause=
s the
> >>> probe function to fail with messages like:
> >>>   dsp7-pwm: failed to get the current voltage: -ENOTRECOVERABLE
> >>>   pwm-regulator dsp7-supply-pwm: error -ENOTRECOVERABLE: Failed to re=
gister regulator pwm-regulator
> >>>   pwm-regulator dsp7-supply-pwm: probe with driver pwm-regulator fail=
ed with error -131
> > What board are you testing with? I'd like to see the .dts to get a
> > better understanding of where your board differs from mine.
> > I think Uwe (PWM maintainer) also previously mentioned that there's no
> > defined behavior for disabling a PWM and then reading it's state
> > again. I'll see if I can find his explanation and whether I can come
> > up with a patch that may help here.
>
> Here's the DTS fragment for my power supply. You can trigger the
> behaviour with "pwm-dutycycle-range":
>
>              dsp7_supply_pwm: dsp7-supply-pwm {
>                  compatible =3D "pwm-regulator";
>                  pwms =3D <&pwm 1 50000 0>; /* Period of 50000ns means
> 20kHz */
>                  regulator-name =3D "dsp7-pwm";
>                  /* VCOM =3D 3.9V + 0.9V * duty_cycle. */
>                  regulator-min-microvolt =3D <3900000>;
>                  regulator-max-microvolt =3D <4800000>;
>                  pwm-dutycycle-unit =3D <100>;
>                  pwm-dutycycle-range =3D <50 100>; /* Must be >=3D 4.35V =
*/
>                  pwm-supply =3D <&dsp7_supply>;
>              };
Thank you. Since this doesn't seem to be upstream yet I'm against
reverting my original patch (more below).

[...]
> > The problem with this specific revert (your patch 1/2) is that (from
> > memory) it will break these boards:
> > - arch/arm/boot/dts/amlogic/meson8b-ec100.dts
> > - arch/arm/boot/dts/amlogic/meson8b-mxq.dts
> > - arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts
> > - arch/arm/boot/dts/amlogic/meson8m2-wetek-core.dts
>
> I honestly don't see how...
Back in the day I tried to describe it in detail: [1]
The short summary is:
- PWM settings match 860mV but PWM output is disabled (on this
SoC/board that means: duty cycle =3D 0)
- SoC is not stable below 1100mV
- pwm_enable() was used during boot and pwm-regulator did not adjust
the duty cycle and/or period before
-> hard lockup during boot


Best regards,
Martin


[0] https://lore.kernel.org/all/y7svv2jvcof3fnezvjbirkian5b7ajic7ajxgtyiejj=
3364ie7@uvmqlpjj6tv5/
[1] https://lore.kernel.org/all/20240113224628.377993-4-martin.blumenstingl=
@googlemail.com/

--00000000000046b945065fdeae3a
Content-Type: text/x-patch; charset="US-ASCII"; name="pwm-regulator-pwmstate.diff"
Content-Disposition: attachment; filename="pwm-regulator-pwmstate.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_mw9rjozm0>
X-Attachment-Id: f_mw9rjozm0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcmVndWxhdG9yL3B3bS1yZWd1bGF0b3IuYyBiL2RyaXZlcnMv
cmVndWxhdG9yL3B3bS1yZWd1bGF0b3IuYwotLS0gYS9kcml2ZXJzL3JlZ3VsYXRvci9wd20tcmVn
dWxhdG9yLmMKKysrIGIvZHJpdmVycy9yZWd1bGF0b3IvcHdtLXJlZ3VsYXRvci5jCkBAIC00MSw2
ICs0MSw4IEBAIHN0cnVjdCBwd21fcmVndWxhdG9yX2RhdGEgewogCiAJLyogRW5hYmxlIEdQSU8g
Ki8KIAlzdHJ1Y3QgZ3Bpb19kZXNjICplbmJfZ3BpbzsKKworCXN0cnVjdCBwd21fc3RhdGUgcHdt
X3N0YXRlOwogfTsKIAogc3RydWN0IHB3bV92b2x0YWdlcyB7CkBAIC00OCwxOCArNTAsNDAgQEAg
c3RydWN0IHB3bV92b2x0YWdlcyB7CiAJdW5zaWduZWQgaW50IGR1dHljeWNsZTsKIH07CiAKK3N0
YXRpYyBpbnQgcHdtX3JlZ3VsYXRvcl91cGRhdGVfZHV0eWN5Y2xlKHN0cnVjdCByZWd1bGF0b3Jf
ZGV2ICpyZGV2LAorCQkJCQkgIHVuc2lnbmVkIGludCBkdXR5Y3lsZSwKKwkJCQkJICB1bnNpZ25l
ZCBpbnQgZHV0eWN5Y2xlX3VuaXQpCit7CisJc3RydWN0IHB3bV9yZWd1bGF0b3JfZGF0YSAqZHJ2
ZGF0YSA9IHJkZXZfZ2V0X2RydmRhdGEocmRldik7CisJaW50IHJldDsKKworCXB3bV9zZXRfcmVs
YXRpdmVfZHV0eV9jeWNsZSgmZHJ2ZGF0YS0+cHdtX3N0YXRlLCBkdXR5Y3lsZSwgZHV0eWN5Y2xl
X3VuaXQpOworCisJaWYgKCFkcnZkYXRhLT5wd21fc3RhdGUuZW5hYmxlZCkKKwkJLyoKKwkJICog
S2VlcCB0aGUgImRpc2FibGVkIGNvbmZpZ3VyYXRpb24iIChkaXNhYmxlZCA9IGZhbHNlLAorCQkg
KiBwZXJpb2QgPSAwLCBkdXR5X2N5Y2xlID0gMCkgb24gdGhlIGFjdHVhbCBQV00gb3V0cHV0IHVu
dGlsCisJCSAqIHRoZSByZWd1bGF0b3IgaXMgZ2V0dGluZyBlbmFibGVkLgorCQkgKi8KKwkJcmV0
dXJuIDA7CisKKwlyZXQgPSBwd21fYXBwbHlfbWlnaHRfc2xlZXAoZHJ2ZGF0YS0+cHdtLCAmZHJ2
ZGF0YS0+cHdtX3N0YXRlKTsKKwlpZiAocmV0KQorCQlkZXZfZXJyKCZyZGV2LT5kZXYsICJGYWls
ZWQgdG8gY29uZmlndXJlIFBXTTogJWRcbiIsIHJldCk7CisKKwlyZXR1cm4gcmV0OworfQorCiAv
KgogICogVm9sdGFnZSB0YWJsZSBjYWxsLWJhY2tzCiAgKi8KIHN0YXRpYyB2b2lkIHB3bV9yZWd1
bGF0b3JfaW5pdF9zdGF0ZShzdHJ1Y3QgcmVndWxhdG9yX2RldiAqcmRldikKIHsKIAlzdHJ1Y3Qg
cHdtX3JlZ3VsYXRvcl9kYXRhICpkcnZkYXRhID0gcmRldl9nZXRfZHJ2ZGF0YShyZGV2KTsKLQlz
dHJ1Y3QgcHdtX3N0YXRlIHB3bV9zdGF0ZTsKIAl1bnNpZ25lZCBpbnQgZHV0eWN5Y2xlOwogCWlu
dCBpOwogCi0JcHdtX2dldF9zdGF0ZShkcnZkYXRhLT5wd20sICZwd21fc3RhdGUpOwotCWR1dHlj
eWNsZSA9IHB3bV9nZXRfcmVsYXRpdmVfZHV0eV9jeWNsZSgmcHdtX3N0YXRlLCAxMDApOworCWR1
dHljeWNsZSA9IHB3bV9nZXRfcmVsYXRpdmVfZHV0eV9jeWNsZSgmZHJ2ZGF0YS0+cHdtX3N0YXRl
LCAxMDApOwogCiAJZm9yIChpID0gMDsgaSA8IHJkZXYtPmRlc2MtPm5fdm9sdGFnZXM7IGkrKykg
ewogCQlpZiAoZHV0eWN5Y2xlID09IGRydmRhdGEtPmR1dHlfY3ljbGVfdGFibGVbaV0uZHV0eWN5
Y2xlKSB7CkBAIC04MywxOCArMTA3LDEzIEBAIHN0YXRpYyBpbnQgcHdtX3JlZ3VsYXRvcl9zZXRf
dm9sdGFnZV9zZWwoc3RydWN0IHJlZ3VsYXRvcl9kZXYgKnJkZXYsCiAJCQkJCSB1bnNpZ25lZCBz
ZWxlY3RvcikKIHsKIAlzdHJ1Y3QgcHdtX3JlZ3VsYXRvcl9kYXRhICpkcnZkYXRhID0gcmRldl9n
ZXRfZHJ2ZGF0YShyZGV2KTsKLQlzdHJ1Y3QgcHdtX3N0YXRlIHBzdGF0ZTsKIAlpbnQgcmV0Owog
Ci0JcHdtX2luaXRfc3RhdGUoZHJ2ZGF0YS0+cHdtLCAmcHN0YXRlKTsKLQlwd21fc2V0X3JlbGF0
aXZlX2R1dHlfY3ljbGUoJnBzdGF0ZSwKLQkJCWRydmRhdGEtPmR1dHlfY3ljbGVfdGFibGVbc2Vs
ZWN0b3JdLmR1dHljeWNsZSwgMTAwKTsKLQotCXJldCA9IHB3bV9hcHBseV9taWdodF9zbGVlcChk
cnZkYXRhLT5wd20sICZwc3RhdGUpOwotCWlmIChyZXQpIHsKLQkJZGV2X2VycigmcmRldi0+ZGV2
LCAiRmFpbGVkIHRvIGNvbmZpZ3VyZSBQV006ICVkXG4iLCByZXQpOworCXJldCA9IHB3bV9yZWd1
bGF0b3JfdXBkYXRlX2R1dHljeWNsZShyZGV2LAorCQkJCQkgICAgIGRydmRhdGEtPmR1dHlfY3lj
bGVfdGFibGVbc2VsZWN0b3JdLmR1dHljeWNsZSwKKwkJCQkJICAgICAxMDApOworCWlmIChyZXQp
CiAJCXJldHVybiByZXQ7Ci0JfQogCiAJZHJ2ZGF0YS0+c3RhdGUgPSBzZWxlY3RvcjsKIApAQCAt
MTE1LDE3ICsxMzQsNDEgQEAgc3RhdGljIGludCBwd21fcmVndWxhdG9yX2xpc3Rfdm9sdGFnZShz
dHJ1Y3QgcmVndWxhdG9yX2RldiAqcmRldiwKIHN0YXRpYyBpbnQgcHdtX3JlZ3VsYXRvcl9lbmFi
bGUoc3RydWN0IHJlZ3VsYXRvcl9kZXYgKmRldikKIHsKIAlzdHJ1Y3QgcHdtX3JlZ3VsYXRvcl9k
YXRhICpkcnZkYXRhID0gcmRldl9nZXRfZHJ2ZGF0YShkZXYpOworCWludCByZXQ7CiAKIAlncGlv
ZF9zZXRfdmFsdWVfY2Fuc2xlZXAoZHJ2ZGF0YS0+ZW5iX2dwaW8sIDEpOwogCi0JcmV0dXJuIHB3
bV9lbmFibGUoZHJ2ZGF0YS0+cHdtKTsKKwlkcnZkYXRhLT5wd21fc3RhdGUuZW5hYmxlZCA9IHRy
dWU7CisKKwlyZXQgPSBwd21fYXBwbHlfbWlnaHRfc2xlZXAoZHJ2ZGF0YS0+cHdtLCAmZHJ2ZGF0
YS0+cHdtX3N0YXRlKTsKKwlpZiAocmV0KQorCQlkZXZfZXJyKCZkZXYtPmRldiwgIkZhaWxlZCB0
byBlbmFibGUgUFdNOiAlZFxuIiwgcmV0KTsKKworCXJldHVybiByZXQ7CiB9CiAKIHN0YXRpYyBp
bnQgcHdtX3JlZ3VsYXRvcl9kaXNhYmxlKHN0cnVjdCByZWd1bGF0b3JfZGV2ICpkZXYpCiB7CiAJ
c3RydWN0IHB3bV9yZWd1bGF0b3JfZGF0YSAqZHJ2ZGF0YSA9IHJkZXZfZ2V0X2RydmRhdGEoZGV2
KTsKKwlzdHJ1Y3QgcHdtX3N0YXRlIG5ld19wc3RhdGU7CisJaW50IHJldDsKKworCWRydmRhdGEt
PnB3bV9zdGF0ZS5lbmFibGVkID0gZmFsc2U7CisKKwkvKgorCSAqIEtlZXAgdGhlIHBlcmlvZCBh
bmQgZHV0eV9jeWNsZSB3aXRoaW4gdGhlIGNvcHkgaW4gZHJ2ZGF0YSB1bnRvdWNoZWQKKwkgKiBz
byB0aGUgcmVndWxhdG9yIGNhbiBiZSBlbmFibGVkIGFnYWluIHdpdGhvdXQgYSAuc2V0X3ZvbHRh
Z2V7LF9zZWx9CisJICogY2FsbCBwcmlvciB0byByZS1lbmFibGluZyBpdC4KKwkgKi8KKwluZXdf
cHN0YXRlID0gZHJ2ZGF0YS0+cHdtX3N0YXRlOworCW5ld19wc3RhdGUucGVyaW9kID0gMDsKKwlu
ZXdfcHN0YXRlLmR1dHlfY3ljbGUgPSAwOwogCi0JcHdtX2Rpc2FibGUoZHJ2ZGF0YS0+cHdtKTsK
KwlyZXQgPSBwd21fYXBwbHlfbWlnaHRfc2xlZXAoZHJ2ZGF0YS0+cHdtLCAmbmV3X3BzdGF0ZSk7
CisJaWYgKHJldCkgeworCQlkZXZfZXJyKCZkZXYtPmRldiwgIkZhaWxlZCB0byBkaXNhYmxlIFBX
TTogJWRcbiIsIHJldCk7CisJCXJldHVybiByZXQ7CisJfQogCiAJZ3Bpb2Rfc2V0X3ZhbHVlX2Nh
bnNsZWVwKGRydmRhdGEtPmVuYl9ncGlvLCAwKTsKIApAQCAtMTM5LDcgKzE4Miw3IEBAIHN0YXRp
YyBpbnQgcHdtX3JlZ3VsYXRvcl9pc19lbmFibGVkKHN0cnVjdCByZWd1bGF0b3JfZGV2ICpkZXYp
CiAJaWYgKGRydmRhdGEtPmVuYl9ncGlvICYmICFncGlvZF9nZXRfdmFsdWVfY2Fuc2xlZXAoZHJ2
ZGF0YS0+ZW5iX2dwaW8pKQogCQlyZXR1cm4gZmFsc2U7CiAKLQlyZXR1cm4gcHdtX2lzX2VuYWJs
ZWQoZHJ2ZGF0YS0+cHdtKTsKKwlyZXR1cm4gZHJ2ZGF0YS0+cHdtX3N0YXRlLmVuYWJsZWQ7CiB9
CiAKIHN0YXRpYyBpbnQgcHdtX3JlZ3VsYXRvcl9nZXRfdm9sdGFnZShzdHJ1Y3QgcmVndWxhdG9y
X2RldiAqcmRldikKQEAgLTE1MSwyMCArMTk0LDEwIEBAIHN0YXRpYyBpbnQgcHdtX3JlZ3VsYXRv
cl9nZXRfdm9sdGFnZShzdHJ1Y3QgcmVndWxhdG9yX2RldiAqcmRldikKIAlpbnQgbWluX3VWID0g
cmRldi0+Y29uc3RyYWludHMtPm1pbl91VjsKIAlpbnQgbWF4X3VWID0gcmRldi0+Y29uc3RyYWlu
dHMtPm1heF91VjsKIAlpbnQgZGlmZl91ViA9IG1heF91ViAtIG1pbl91VjsKLQlzdHJ1Y3QgcHdt
X3N0YXRlIHBzdGF0ZTsKIAl1bnNpZ25lZCBpbnQgZGlmZl9kdXR5OwogCXVuc2lnbmVkIGludCB2
b2x0YWdlOwogCi0JcHdtX2dldF9zdGF0ZShkcnZkYXRhLT5wd20sICZwc3RhdGUpOwotCi0JaWYg
KCFwc3RhdGUuZW5hYmxlZCkgewotCQlpZiAocHN0YXRlLnBvbGFyaXR5ID09IFBXTV9QT0xBUklU
WV9JTlZFUlNFRCkKLQkJCXBzdGF0ZS5kdXR5X2N5Y2xlID0gcHN0YXRlLnBlcmlvZDsKLQkJZWxz
ZQotCQkJcHN0YXRlLmR1dHlfY3ljbGUgPSAwOwotCX0KLQotCXZvbHRhZ2UgPSBwd21fZ2V0X3Jl
bGF0aXZlX2R1dHlfY3ljbGUoJnBzdGF0ZSwgZHV0eV91bml0KTsKKwl2b2x0YWdlID0gcHdtX2dl
dF9yZWxhdGl2ZV9kdXR5X2N5Y2xlKCZkcnZkYXRhLT5wd21fc3RhdGUsIGR1dHlfdW5pdCk7CiAJ
aWYgKHZvbHRhZ2UgPCBtaW4obWF4X3VWX2R1dHksIG1pbl91Vl9kdXR5KSB8fAogCSAgICB2b2x0
YWdlID4gbWF4KG1heF91Vl9kdXR5LCBtaW5fdVZfZHV0eSkpCiAJCXJldHVybiAtRU5PVFJFQ09W
RVJBQkxFOwpAQCAtMTk4LDEyICsyMzEsOCBAQCBzdGF0aWMgaW50IHB3bV9yZWd1bGF0b3Jfc2V0
X3ZvbHRhZ2Uoc3RydWN0IHJlZ3VsYXRvcl9kZXYgKnJkZXYsCiAJaW50IG1pbl91ViA9IHJkZXYt
PmNvbnN0cmFpbnRzLT5taW5fdVY7CiAJaW50IG1heF91ViA9IHJkZXYtPmNvbnN0cmFpbnRzLT5t
YXhfdVY7CiAJaW50IGRpZmZfdVYgPSBtYXhfdVYgLSBtaW5fdVY7Ci0Jc3RydWN0IHB3bV9zdGF0
ZSBwc3RhdGU7CiAJdW5zaWduZWQgaW50IGRpZmZfZHV0eTsKIAl1bnNpZ25lZCBpbnQgZHV0eWN5
Y2xlOwotCWludCByZXQ7Ci0KLQlwd21faW5pdF9zdGF0ZShkcnZkYXRhLT5wd20sICZwc3RhdGUp
OwogCiAJLyoKIAkgKiBUaGUgZHV0eWN5Y2xlIGZvciBtaW5fdVYgbWlnaHQgYmUgZ3JlYXRlciB0
aGFuIHRoZSBvbmUgZm9yIG1heF91Vi4KQEAgLTIyNCwxNSArMjUzLDcgQEAgc3RhdGljIGludCBw
d21fcmVndWxhdG9yX3NldF92b2x0YWdlKHN0cnVjdCByZWd1bGF0b3JfZGV2ICpyZGV2LAogCWVs
c2UKIAkJZHV0eWN5Y2xlID0gbWluX3VWX2R1dHkgKyBkdXR5Y3ljbGU7CiAKLQlwd21fc2V0X3Jl
bGF0aXZlX2R1dHlfY3ljbGUoJnBzdGF0ZSwgZHV0eWN5Y2xlLCBkdXR5X3VuaXQpOwotCi0JcmV0
ID0gcHdtX2FwcGx5X21pZ2h0X3NsZWVwKGRydmRhdGEtPnB3bSwgJnBzdGF0ZSk7Ci0JaWYgKHJl
dCkgewotCQlkZXZfZXJyKCZyZGV2LT5kZXYsICJGYWlsZWQgdG8gY29uZmlndXJlIFBXTTogJWRc
biIsIHJldCk7Ci0JCXJldHVybiByZXQ7Ci0JfQotCi0JcmV0dXJuIDA7CisJcmV0dXJuIHB3bV9y
ZWd1bGF0b3JfdXBkYXRlX2R1dHljeWNsZShyZGV2LCBkdXR5Y3ljbGUsIGR1dHlfdW5pdCk7CiB9
CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVndWxhdG9yX29wcyBwd21fcmVndWxhdG9yX3ZvbHRh
Z2VfdGFibGVfb3BzID0gewpAQCAtMzIxLDMyICszNDIsNiBAQCBzdGF0aWMgaW50IHB3bV9yZWd1
bGF0b3JfaW5pdF9jb250aW51b3VzKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsCiAJcmV0
dXJuIDA7CiB9CiAKLXN0YXRpYyBpbnQgcHdtX3JlZ3VsYXRvcl9pbml0X2Jvb3Rfb24oc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldiwKLQkJCQkgICAgICBzdHJ1Y3QgcHdtX3JlZ3VsYXRvcl9k
YXRhICpkcnZkYXRhLAotCQkJCSAgICAgIGNvbnN0IHN0cnVjdCByZWd1bGF0b3JfaW5pdF9kYXRh
ICppbml0X2RhdGEpCi17Ci0Jc3RydWN0IHB3bV9zdGF0ZSBwc3RhdGU7Ci0KLQlpZiAoIWluaXRf
ZGF0YS0+Y29uc3RyYWludHMuYm9vdF9vbiB8fCBkcnZkYXRhLT5lbmJfZ3BpbykKLQkJcmV0dXJu
IDA7Ci0KLQlwd21fZ2V0X3N0YXRlKGRydmRhdGEtPnB3bSwgJnBzdGF0ZSk7Ci0JaWYgKHBzdGF0
ZS5lbmFibGVkKQotCQlyZXR1cm4gMDsKLQotCS8qCi0JICogVXBkYXRlIHRoZSBkdXR5IGN5Y2xl
IHNvIHRoZSBvdXRwdXQgZG9lcyBub3QgY2hhbmdlCi0JICogd2hlbiB0aGUgcmVndWxhdG9yIGNv
cmUgZW5hYmxlcyB0aGUgcmVndWxhdG9yIChhbmQKLQkgKiB0aHVzIHRoZSBQV00gY2hhbm5lbCku
Ci0JICovCi0JaWYgKHBzdGF0ZS5wb2xhcml0eSA9PSBQV01fUE9MQVJJVFlfSU5WRVJTRUQpCi0J
CXBzdGF0ZS5kdXR5X2N5Y2xlID0gcHN0YXRlLnBlcmlvZDsKLQllbHNlCi0JCXBzdGF0ZS5kdXR5
X2N5Y2xlID0gMDsKLQotCXJldHVybiBwd21fYXBwbHlfbWlnaHRfc2xlZXAoZHJ2ZGF0YS0+cHdt
LCAmcHN0YXRlKTsKLX0KLQogc3RhdGljIGludCBwd21fcmVndWxhdG9yX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJY29uc3Qgc3RydWN0IHJlZ3VsYXRvcl9pbml0X2Rh
dGEgKmluaXRfZGF0YTsKQEAgLTQwNCwxMCArMzk5LDIzIEBAIHN0YXRpYyBpbnQgcHdtX3JlZ3Vs
YXRvcl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCWlmIChyZXQpCiAJCXJl
dHVybiByZXQ7CiAKLQlyZXQgPSBwd21fcmVndWxhdG9yX2luaXRfYm9vdF9vbihwZGV2LCBkcnZk
YXRhLCBpbml0X2RhdGEpOwotCWlmIChyZXQpCi0JCXJldHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2
LT5kZXYsIHJldCwKLQkJCQkgICAgICJGYWlsZWQgdG8gYXBwbHkgYm9vdF9vbiBzZXR0aW5nc1xu
Iik7CisJcHdtX2luaXRfc3RhdGUoZHJ2ZGF0YS0+cHdtLCAmZHJ2ZGF0YS0+cHdtX3N0YXRlKTsK
KworCWlmIChpbml0X2RhdGEtPmNvbnN0cmFpbnRzLmJvb3Rfb24gJiYgIWRydmRhdGEtPmVuYl9n
cGlvICYmCisJICAgICFkcnZkYXRhLT5wd21fc3RhdGUuZW5hYmxlZCkKKwkJLyoKKwkJKiBJbiBn
ZW5lcmFsIGl0J3MgdW5rbm93biB3aGF0IHRoZSBvdXRwdXQgb2YgYSBkaXNhYmxlZCBQV00gaXMu
CisJCSogVGhlIG9ubHkgc2FuZSBhc3N1bXB0aW9uIGhlcmUgaXMgaXQgZW1pdHMgdGhlIGluYWN0
aXZlIGxldmVsCisJCSogd2hpY2ggY29ycmVzcG9uZHMgdG8gZHV0eV9jeWNsZSA9IDAgKGluZGVw
ZW5kZW50IG9mIHRoZQorCQkqIHBvbGFyaXR5KS4KKwkJKgorCQkqIFVwZGF0ZSB0aGUgZHV0eSBj
eWNsZSBzbyB0aGUgb3V0cHV0IGRvZXMgbm90IGNoYW5nZSB3aGVuIHRoZQorCQkqIHJlZ3VsYXRv
ciBjb3JlIGVuYWJsZXMgdGhlIHJlZ3VsYXRvciAoYW5kIHRodXMgdGhlIFBXTQorCQkqIGNoYW5u
ZWwpIGFuZCB0aGVyZSdzIG5vIGNoYW5nZSB0byB0aGUgZHV0eSBjeWNsZSBiZWNhdXNlIHRoZQor
CQkqIHZvbHRhZ2UgdGhhdCBpcyBhY2hpZXZlZCB3aXRoIGEgZGlzYWJsZWQgUFdNIGlzIGFscmVh
ZHkgdGhlCisJCSogZGVzaXJlZCBvbmUuCisJCSovCisJCWRydmRhdGEtPnB3bV9zdGF0ZS5kdXR5
X2N5Y2xlID0gMDsKIAogCXJlZ3VsYXRvciA9IGRldm1fcmVndWxhdG9yX3JlZ2lzdGVyKCZwZGV2
LT5kZXYsCiAJCQkJCSAgICAmZHJ2ZGF0YS0+ZGVzYywgJmNvbmZpZyk7Cg==
--00000000000046b945065fdeae3a--
