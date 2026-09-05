Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2EB35F5E1
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 03:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788579031; cv=pass; b=YbqxkyRFuTpfTH040vFAutQEw1lDWZ2HkzG9iKBWhlC193V0CQW0jIIup1Hk8HAtnZ2BWQp7uE/Hkoua36GWjExIVqm1i2lb4LD5MZYSd1+vH6gbMQBrLFlSf+aFCjqWvn2686phJkhUpWQMkKa6PeJd/LqQz4nUcb5B8eyASBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788579031; c=relaxed/simple;
	bh=73YgTfRY5PQ5ZLAadl5YBKFBHFoLXMnXGa/HgmJQYGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TkXArnBdXUUllZr527g1kPjRBs5w/XSufY7+xuxqAZmmT1MOppq5JvldY7CXDYAS13+kn/BEDppRv1HccrTTvyVWsyaBY0u0njO7oOQRZI6nEFRJsi9TVRzEPITEdd3ihCBkfyUMjIz1mqyChWZ+NaDo0qeygWEW5y06bYz/RXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UsfX8jAE; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UsfX8jAE"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b4ab40d839so1614452e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 20:30:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788579026; cv=none;
        d=google.com; s=arc-20260327;
        b=LXPuRFbGALX+olkYSCim/oJ4Nhd/Zzky9JpMPLPcQ0YIrwLwSiYFnMaeMucgNZZXFf
         2NmlSZeHG40l+tKT7zkMwwKyeqMlUsEEQXXFfC2GKRh0uDmq4A8kDDLWwYd4TVYLTXw4
         kqbi7CYG2IsTkt7KgyjnCJovAe1IPMECaEFEL/TSHypshNN0Ll1QlWWKa45sZx/JH60g
         DD904Z64eIhe/ImB8yIIWaXmRJMNGY/OF5n8ND7MGd3YAWjTaqDVgUiruAHEl3VNAm/t
         wqIlreZ8M89DJ9Z0Zc7oI/B7tpJgHU9a2pCdgF8+hUw5xT6+nF7fAcb+NP7KG71T0uBt
         BZrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hPpL3LX8Ta/oFQQyARurckrGJqtP8qcS5JHXnp5HuTQ=;
        fh=U5fepe+Getj5Qz9ydD9tsfIFyIBuBDuZxLZrtqs2lcc=;
        b=SXLjavSJO0ubP4WNTSgfjoz6TCEe7tEbS9Kg4d+/Khkvud7umNOf4X24PdJdpM5bHc
         sCVM/Zw/3RuIemh4qhV5rxPKCtpYdDBwf2Yceu+/RIDPM8V4CFgF1R29617PhUptO+qJ
         aM2qs8t95eBK/PF4ooHkuxPO3r2a5rno+q9FJpZdZtQI/fnIUfST+GRm1t5rYcbCskGy
         anj+ydrrY4OuPs5xpleNnyZcOysBYdnLJSWKTGEsUehRNSSoSaD/UM4zK6NiXzOoDcK7
         Q08Rf4nf2ub4RICGDZx3mkmGqRq0OJZagYzq09Q4nl2pPt91aOdtbRvjW1sOOg4k1ecq
         VRVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788579026; x=1789183826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hPpL3LX8Ta/oFQQyARurckrGJqtP8qcS5JHXnp5HuTQ=;
        b=UsfX8jAEGfKfgg+Y9st6Z8Id5TJFRw41C5+ziZWlF9uqy2pY5UXtVIl+Lh97XSeyrt
         yVPRvaFL/uuZNzxjm4Tu7vM8escGzU3zyyveTlJNCGBGLDe24HrVuGUZPVKV21DC+0rH
         lnTUnKeChFcuIDlBaYLNDFIo2sKe4kQKVBuSCyFvSGVHhdLUDwmlEXjNZ+Cb7yS+yyJm
         kVrHMA7OGS1XfRa2UxDJlLTYmxqHIvxVi9emuxSJmW1Kxh7i5el8ndGZRtLsLQhbFwOP
         MWMFVdX318m2/AoNaz79yGGJojxr6KFKDOTBA/bQfUekN1mZ3yeT9f+1GGYvSABz3y3V
         KR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788579026; x=1789183826;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hPpL3LX8Ta/oFQQyARurckrGJqtP8qcS5JHXnp5HuTQ=;
        b=jHTMN6Os21GdOjp8Vb2f/DnC8++aa/Z8qSPdjilysh6l+bdId1b9HSn1DaVB1QVwaZ
         3/ffDychb6vu4irAiFysO7tmarkzUVtJIH4Kpqc+65oFmmjw4lUrczpTyY7rgrk618Bz
         4wSMu1SH6Jmo/vWN7fK2d/o2cUuoLLZ9LDZCXbsBXAt8yAsmUGonjf+vxpDRZ4inZ5Qk
         lh8unrQ6T15MJiIalvRt+RyW85i/FxB2v2tvqK3TpmJpUkjbjHRHOipQdYA4LI27QOu9
         piduEIgcD5CVeSp9kjjBq1iF/zp6w8tw+01AsdASrc7wsSIwoNxZKhr5E86gavKlecQB
         eMFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSluk3njyJYbRgBWZSWIwz7naiYmyjWt+Bg7RSGmcFdCwl5YbNtY1po1l6s+pSCbSao88dhTlEnQk2YYM=@vger.kernel.org
X-Gm-Message-State: AFuF++lHDKEwbHn9k5WMX8PwKrfSEB+R10i00MbxPyLzUsrglkbD1S1F
	cvpuMq4bCTV/j0xJ8I7FhCZAhkHXkOWYj5WBcAE98JRFPjUBzymhfcwZuZYNlb5mIdIjInwGODG
	r1h3FXEph5yuIIyPmhq8mI+qzguySJeI=
X-Gm-Gg: AYBFou2xqUSNSgo1WCaQujaRHE3twKKt1ux37aJfSI3WGjENgQoHHCOVJedslYtWcoc
	qgWb/0KjgCS0Jl4SW44MjSe2YWac13DncKXmiN3I/x8AaM1jst2VYoyft500Q2omFFeC91kVgil
	N5iMhC7IrAqg2P+Skfm+/QkMGw3ZLtwRHoFHPJ5ErmmmR3IWA9zpncqT3nLW6Mc6w145YKT2rf8
	6rMUQLmJhWqQC4bK/DQ9HX5IdwH5U2GVAIoHncU/y26OZ6Oe8E4AQR2UURHO2/zRu3RpiMB0Kko
	iOh1zKsFI5ke0BfWHvrJBFqBPTjpOmvxheBQR7jQeLY9Sw==
X-Received: by 2002:a05:6512:3e08:b0:5b6:4b2:de81 with SMTP id
 2adb3069b0e04-5b617058c7emr1560231e87.31.1788579026068; Fri, 04 Sep 2026
 20:30:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEsQvcuaNZvLxyxNH_NOy5qwTmkrk-A9QdVtZD0GiCtPwk4A+A@mail.gmail.com>
 <20260904182023.4486-1-hhkieu@gmail.com>
In-Reply-To: <20260904182023.4486-1-hhkieu@gmail.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Sat, 5 Sep 2026 00:30:13 -0300
X-Gm-Features: AcwNN1XqapVpSljR1RHwVb9QBxMZ9ZPENJ6iH6m31QN5659LjwkwMc11dhFfhzA
Message-ID: <CAEsQvcuMFt=m=njsPzRtKarz04Gwbds+f8p2S+SdSQmaiW1fLw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: add Pioneer DJ DDJ-SZ support
To: Hanh Kieu <hhkieu@gmail.com>
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hanh,

On Fri, Sep 4, 2026 at 3:20=E2=80=AFPM Hanh Kieu <hhkieu@gmail.com> wrote:
>
> Geraldo Nascimento wrote:
> > Are you sure is_pioneer_implicit_fb() isn't returning false and you're
> > picking up on a generic sync ep instead?
> >
> > You should double-check that function is returning true or false becaus=
e
> > it will return false when USB_ENDPOINT_USAGE_IMPLICIT_FB isn't
> > set on bmAttributes of a Isochronous IN EP.
>
> Good catch, thanks -- I checked against the real device rather than
> assuming.

Thanks.

>
> lsusb -v on the DDJ-SZ shows both endpoints (0x01 OUT, 0x82 IN) as
> Isochronous / Asynchronous with Usage Type =3D Data (bmAttributes =3D 0x0=
5).
> is_pioneer_implicit_fb() accepts the capture endpoint's usage being
> either USB_ENDPOINT_USAGE_DATA or USB_ENDPOINT_USAGE_IMPLICIT_FB, not
> IMPLICIT_FB exclusively, so Data usage does pass that check.

Thanks for this report.

The code snippet in question is in the body of is_pioneer_implicit_fb()
in sound/usb/implicit.c:

epd =3D get_endpoint(alts, 1);
if (!usb_endpoint_is_isoc_in(epd) ||
   (epd->bmAttributes & USB_ENDPOINT_SYNCTYPE) !=3D USB_ENDPOINT_SYNC_ASYNC=
 ||
   ((epd->bmAttributes & USB_ENDPOINT_USAGE_MASK) !=3D
    USB_ENDPOINT_USAGE_DATA &&
    (epd->bmAttributes & USB_ENDPOINT_USAGE_MASK) !=3D
    USB_ENDPOINT_USAGE_IMPLICIT_FB))
return false;

In my opinion the logical AND at the end of the if condition is short-circu=
ited
by doing that inequality comparison between USB_ENDPOINT_USAGE_DATA
and the result of the bitwise AND between bmAttributes and
USB_ENDPOINT_USAGE_MASK, because 0x05 & 0x30 =3D=3D 0x00.

When that first condition evaluates to false C never bothers to check the o=
ther
half of the logical AND, for logical and practical reasons.

What I'm not sure of is that's the kind of check we want for Pioneer implic=
it fb
matching... Takashi will have to be the judge here, but I think it is
not intended
behavior that this function picks up implicit fb without
USB_ENDPOINT_USAGE_IMPLICIT_FB being set. The fact is does so probably
means that code in implicit.c needs a bit of improvement.


>
> I also traced snd_usb_parse_implicit_fb_quirk()'s dispatch order for
> this device to make sure nothing generic intercepts first: no fixed or
> capture quirk-table entry matches 08e4:0191, it isn't UAC2
> (bInterfaceClass is vendor-spec, not USB_CLASS_AUDIO), and it isn't the
> Roland vendor ID. So is_pioneer_implicit_fb() is the function actually
> being reached and returning true for this device, not a coincidental
> generic fallback.

Again, thanks for your due dilligence, and for all your work, it's looking
good.

Thanks,
Geraldo Nascimento
