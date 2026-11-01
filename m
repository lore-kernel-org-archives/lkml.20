Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571122;
	b=Q2PBkNTfcXlm6cBi+VKSxh7ZdwR36bMM37zrtqA8JoOyTV80TPSo9TuVkB5R0lPERB4p
	 VDbaqNYgrK0NvJ6lNc1K3/dvi4HzIPrHHtAfsqE+3M2RPuWagw/sMDbwcxLS8h24F9yO/
	 to2/kT1G8rVTz2MJgcCLgDpImmKmDIE0noIGjpu1m1VSE0t25ZuZEIxGLsDmt5eib7SFp
	 UBbUBuggIh8T7fcRPCrExs3KvmOyUYikWIKMN5kdOj5UceWl1clalrUhi0tag9G/el+a/
	 KNwwd7Bg87sdY7Z8E82MkvXfQhK62hWZNVTVZEF5pTKUKLPMnRQzVb08kPm3pnqns8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Buc1QDeYtaFDuNaaLime3LTMfQGnM03bKEX58bfBjs4=;
	b=NLPd5u+bsSA6om7nkRmt/CdOZB44U5aX9lBGdPXV3iF0j1LcRm9ayetUm/Txg1XMukKc
	 rUEynwsFAyLpGXITSPSIEUEJEkDUsOtEkb9dPEu+BKLfXbmjs1Q4e97VNZoc2xok3pX+s
	 O9V7B8c5WuhlAElZyOUC4NKsgccNJCxWdyos7W3p0IZrjpLO4CXZYlcDLrP+nQ8JvpIh8
	 bjgz4d+F2s9eD2VdHlm0F19ylVhcIe/FETFliILY3UQUf7VKt3ogSCSYouywC/OizmXJo
	 G0bDkCjJcYS7lzshV00gf2f4zDtfNGnvxQR0vNcUb2XPASNQGwAVvgNF1KyAFrifpwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MJ+mGmnD;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC76606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:12:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CC76606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MJ+mGmnD
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6af9a9451daso3724395a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793571121; x=1794175921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Buc1QDeYtaFDuNaaLime3LTMfQGnM03bKEX58bfBjs4=;
        b=MJ+mGmnDkOSk51mkQqfhre9162Lg6QFU53lgr5EPqsvk+7QsZIQyVXfRQCcXkw9f8Q
         MPXJ5wvwaiLAaQwsfk213lO4fBNFkF+hd1P2itxfVaHboxdQjdt5xsEELYaHI7Qy6Cyz
         mDR6/z9MmxNuMdGM+gXoq7USnZ7kbsFZS7qdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571121; x=1794175921;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Buc1QDeYtaFDuNaaLime3LTMfQGnM03bKEX58bfBjs4=;
        b=yrT0PQvWQtbwkx2lhMXTczS3HdMq0griF5avjOv/bzU4JwGZ7h04+RCIBSVPobF7wh
         DWMfP3wDkYSVdOaDFuBgLQgs68NLa+orPmGOS6iWlEMGaKdiSsHGwSJNEwyQZAS7nrm9
         Eht20ynnQZrqKI22yE+G3tNYDA4Dxl0eot2j8kl3FANaIlwPHOPRGbST2aceIRbym5XG
         XlcXIXg/5dg/tFGtT8RhhmuxhgJDtvfTS+mNoRA3I6mMDCIbWq2RXIZcqRyhjtGopfyO
         ZLyX/Ux99odBBRV7MvD49kZSNXwO3grV/gCKdQL/bQ8xO6rdVRpStiZsfGsE8jPS76m2
         JM8w==
X-Forwarded-Encrypted: i=1; AKwUvBzebFOFMidiFHQlFE/QjzPqcxqztIWUuE1azWvkQmGIKD9vKcjcxVsjLZPSUqItm0RuSnZzKev+pxN5Nm0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+58TkbnTxTJ8LEAcwMN2oztK3G5a6ANf/JHNFH2b6ZMJWqCJq1
	orUKD4LIx1L5r0sO3iF2u4v4NkOnwpgOUYyDrDg762YqvziIKVSfyR+WZoQWxS5K/M8yFrRV5Yj
	JxAGpGWkd
X-Gm-Gg: AYBFou2Mk8/MmFX5m29u5uNLlnxi+jS/fVfoU9k7rwZGyWp1wmVOsArA6USWj7jnWTK
	aJWGVeg52KfnRy9qUYkiSrsU5Kj5Gyid8OQv3RqSC+jNHDjM5EIC2ElKUOCMfNB5zYWPyBL/03h
	xVoOyXe0gUwERRlhTT//Uey0ChzQqh/0C4H7OZI2fUXXCdv3EdpC6vMA1Tus27ku/gS5UQAi4KR
	aDZ8yLIoYyYblx/6VAAStWmIWcAX3Z7bQRWyZD4ndUxj79NwIw1/CrK6hStXXARHh2GxJ9TAhEa
	gnETQmuL+qzRLqkDl6gPp2m7SLEp9shdvWu6FrnQuix6ZJP31cF3Q0xjFXjuoolSOm5It10atCw
	JWtENOhNEh13Zo5794IWdwIZ0SPWR1+bqR/D70PQaL6qnv5q1SYX+wSyDQO/4jVRsespZYvu9d4
	JjaonGB1zCTfl4CbAeSH9zvU17ICQgS3ub8xn7FU2f59Ibrk6nqE/Xk2BO7zYhL0xF0hogWdA5i
	IUko2XgABI+SqcBqCuUp8JNmsR2XwE5X09L+cKcxETyQZzLTwpbJyjXnW4AK4y4YdlfR8PUA5Wa
	2gIGmlFMBPxqCtYVQ0ZnJp7gzvwLuVCwEZmhI49WmMy032xKGnCneSBaIWf1Ke7rE80CjsQDTlL
	KQTTNLbX09iJB
X-Received: by 2002:a05:6402:2423:b0:6b2:2331:3ea9 with SMTP id 4fb4d7f45d1cf-6b4d4d6e333mr5585977a12.17.1793571120713;
        Sun, 01 Nov 2026 14:12:00 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9eebb0sm2440847a12.8.2026.11.01.14.12.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 14:12:00 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c3fd91337baso398370866b.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:12:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwk9SL8OnuCr1VrnSaLodk+MaCJoNXUvrOmpe/ATfjmxpKWcQYSbokrgMAdbQaspeOcsQj+gR5C/G3gtuw=@vger.kernel.org
X-Received: by 2002:a05:600c:4708:b0:4a2:167a:c93b with SMTP id
 5b1f17b1804b1-4ac19234ad8mr193309575e9.30.1793570740977; Sun, 01 Nov 2026
 14:05:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028215600.1713475-1-dianders@chromium.org>
 <20261028215600.1713475-9-dianders@chromium.org> <CAFLszThZs9Qx6c_qff4LUXPNpncUAO7LGygkyv6FRtGcxU88xg@mail.gmail.com>
In-Reply-To: <CAFLszThZs9Qx6c_qff4LUXPNpncUAO7LGygkyv6FRtGcxU88xg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 14:05:29 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WeMHHTZ5v0tWLhqRivAMogbqVQ-cuF9HRb6sfO+9TVkw@mail.gmail.com>
X-Gm-Features: AclHuK87KLmJoI8xKOrvWWlX0UnZ0z4ES-P-CBsehd7HFous4pSW5-SGmdATFXc
Message-ID: <CAD=FV=WeMHHTZ5v0tWLhqRivAMogbqVQ-cuF9HRb6sfO+9TVkw@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] fdtfactor: Add -S/--strip-local-fixups option
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-kernel@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Fri, Oct 30, 2026 at 5:23=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> > On a set of 47 Qualcomm SC7180 Trogdor Chromebook board DTBs,
> > `fdtfactor -S` reduces total uncompressed size from 7.69 MB to 634 KB
> > (91.8% savings).
>
> This compares against the unfactored DTBs, so it doesn't show what -S
> itself saves. Please can you also give the size without -S, so it is
> clear what the /__local_fixups__ in base.dtb costs?

Done. Updated the commit message to show both numbers: without `-S` the
47 Trogdor DTBs factor down from 7.69 MB to 932 KB (88.2% savings), and
with `-S` they factor down to 634 KB (91.8% savings, saving an additional
298 KB by omitting `/__local_fixups__` from `base.dtb`).


> > diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> > @@ -1238,6 +1238,28 @@ fdtfactor_tests () {
> > +    # Strip local fixups (-S): verify that merged DTBs match DTBs comp=
iled
> > +    # with -@ (without -L), and that inputs lacking /__local_fixups__ =
are
> > +    # rejected.
> > +    for i in 1 2 3; do
> > +     run_dtc_test -b 2 -@ -I dts -O dtb -o fdtfactor_board${i}.nolf.te=
st.dtb \
> > +         "$SRCDIR/fdtfactor_board${i}.dts"
> > +    done
> > +    run_wrap_error_test $PYTHON $FDTFACTOR -o fdtfactor_strip.test.dir=
 \
> > +     fdtfactor_board1.nolf.test.dtb fdtfactor_board2.test.dtb
>
> This rejection test has no -S, so it checks the -L requirement from
> the previous patch rather than anything added here. Since -S could
> easily be read as 'my inputs don't need -L', I think it is more useful
> to pass -S here, to show that it does not relax that requirement. The
> plain no-S case could then go into the previous patch with the other
> rejection tests.

Done. Moved the no-`-S` `.nolf.test.dtb` rejection test into the main
`fdtfactor` patch and updated this test to pass `-S`.


-Doug
