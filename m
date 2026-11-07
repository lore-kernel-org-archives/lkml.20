Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794023447;
	b=IYCssBUJRJRC8Nz6wv7f+ZCBBiNbbEIytDmBWoKNagi6EDbyH0pabzTS73fXzF3ok+5C
	 pM3Ud9Xsznv0Xkqa9jo0ofjvZTNYLpXaVQmjyU7mEE4VgldjwY9fJcwzWLdIfaglHmgiL
	 tndSXZnRi0oOANJdMxY16l1o8criKiVHbYsu+2Xcdjlx6gDOmaQZGhwUwHfbscyhNRYd3
	 msqcxMs9qUeOG0Ipnfb0UoBKEhUI/az1CkC0jWd0Yt/X8wJ3Icuh8RmQSaRJjCnzTmRks
	 zW3TUlVOZT9T6D797AbnMJ7XTCjg+9nSKR6swzUJK5iUreu7EpxgibQMkfbCEXlR5uA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794023447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8DsBB/++J1ezqdBf8vyGFjxYITqM0+YluqzVccQohus=;
	b=TpaGgr93Qooo6YiJzpQaMqdhU6YCKDvkAzsNEsB61ZC91pl6U96JtZxMz0spt8s4pFYE
	 nJnex8cBiTmdNf1S1qvJH13d1K0kGqzGVxVk7e7bL3jxSVzMqDSgyIWuI3aq8e5qSV3K8
	 LK8gDC+bEt4IwpIodHws8iYXPUZJ1NHplLpQHvuFga+hYs+3LaWkRE9Qyy1zTUOqhyU2M
	 i0PP57+LXlJ3davDyxb6kpbEcccfFOxg+jr5aS73IidsH0vUleQ+TlqOMV4Zn27zrSoCd
	 s7if43eFE4/Z5t92c5Hvo/RsffxQ+T4bZL2GyMl5fcxOQLZVi61tRnfNxhieRKeVG+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rE1ZTDNq;
	arc=fail smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC1B606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 03:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFC1B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rE1ZTDNq
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so13038255e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 19:50:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794023445; cv=none;
        d=google.com; s=arc-20260327;
        b=HEaK0EHd4zDOHPrReIU1Hrwar0HhyiWacCAKJG2YcdKAHAqfj0y1r5tOg/+a60MVow
         lfBIjaxI1d/3UKhmq+xShrfaWRUuVQdJGinNV5+5vS7uhyC9oSOn4Zh0gXUItss/wcU3
         6QsPVOOl7n2W698fvBHbzNAGNfCBw2R+biV2HvmdTJ2kc9JkiQgMMQUqR1qNO2OkFxgh
         eq4PwN7GPHH09jLQLZcxK3j0UI2+kEMRp3eaPuguQPK4USLWu1uBzz8FNqFZPy9E5fyO
         dx9yJ4aUW9gdFjS7reZHHS7wbPhi7HXJc18HXQhHAe0DvBqV7sI+he+yWeKlvTZ5SQYB
         3tFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8DsBB/++J1ezqdBf8vyGFjxYITqM0+YluqzVccQohus=;
        fh=Nckkjn1i2EKKAFdJtKdl+REj7RwI/VG0GupThqhS8A4=;
        b=Kfkjg+XkTmWseqjMLXoMKDyhVDw4ReeWNtRKXBoxBm3pCusnvnqyTQC7qElIxEDqMc
         W/SxU0g2kZ9O+ydJS/PJdL+X3hUa/jBOZfwyhlSYY7JKbtMjJEB096uL+SQnvmyz1CmJ
         53KYtymalZUps9mxuh2qyVJeBtUCAI43lggEUwWh2du8CT1Q5Ew+K/SYTNS61yC6AR3a
         i8Hg072eGFqHkvcLZXqQ4dgNKG2pHm+4sLLonNp5Yhj5SbZHErz3m8VVOwG4tHdw6tQO
         gmxEIz4xJriOJirNcHZw2/kPdLYS3+12U/NeldfSoRB7WUbOpunII1euAQuvBJWf3Nf2
         2GwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794023445; x=1794628245; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8DsBB/++J1ezqdBf8vyGFjxYITqM0+YluqzVccQohus=;
        b=rE1ZTDNqUJ0IAulplsLTzvuxc6VvShh1uFVwvIMIimVxLj7CXPXCV3jyIvvVntz/FN
         10tvlHlbNHqAOult/EKnl/N1+30mKmmdX6dOaa2If7ydYpjxfnUa0jNheIGFwP+P8RH0
         x0A9nBiEGNe82RcBUrT6ANl6iV59DsEvpExnuZMDr6ZXGkoCY4QLXZ/sBmlGOcLZHBLm
         kpSJQoHdnknWtF92qQvml2mi9M3KZb/gKCEL6NMABIPLPQq7BBuvvUPgV4n03UmYzZ0g
         DQRGMZfgJIkqK6skEX4ZrKBv+/pc7GFDtdmllZtVkjuIMHZ2ckw66X4dZgGn8Wkn49Ue
         1tnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794023445; x=1794628245;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8DsBB/++J1ezqdBf8vyGFjxYITqM0+YluqzVccQohus=;
        b=cXQiXc/wG1EJx+OyvkBEueq0c37To72f5jXbu87y9uNPSG+IoN6g7f6oXbJNY3Wk/E
         +Lb29OLE7aCEiVNS/enZN2vdgTRC+QQlcexZsRYmMd9ZaYs6OCSI5OKfLAH3wVyBOOBX
         eWgarR8yCMv0ChRxhh2DW1CkpegH8HOQ84SYIE23EZbT8I1Il8fiEFB6tKC/krrtswDG
         vome84v/IwfqwR2iqbIOThvTo/euu38j4n6FixorznVep9GHJhJGHmddj2b95/hIMY0w
         gwO7uwwfaXt0TiGnahrjqEifZ2LR09Gl1RuTQbVCwP4Ewcu7brO6A/lpXyo04dmvwfiD
         hexw==
X-Forwarded-Encrypted: i=1; AL+hErFNXWHXuxTB6SAkBZMJaG6X/Ccf6aPP/4eBmviMio5M+1u6nWUVKaWLG79+okNBwPx6iHub/S/BWwP2Jno=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zy4LxZUy86GLIn6FSv3/ueFPDcL57H7fViCXzZ0FF+0QsslJc
	X60xbVrcQICC2eS9LZCki49dUklfY4JtEB3mCU5WSd4iZyxDyaG/1iPFAHOumQwzWBUrWN0xq1Z
	1i596XHHx/Ce1Z4IxhmpnO10fiHES+aQ=
X-Gm-Gg: AYBFou042SOf/cN4gUzn4cwh8VaFct/6bsOncGRt8Fairz91PfEhRe8hxK7/ky97A0l
	DW7F6F9DTc5OKDko/Nub53cFcyg7ADgogLhKAVGb8LOglHAMZ97AycOgzubIjZpAr14MuFkVr/N
	D9UKIn9l1jcPsld5MH1Te6rTLM6Uet4wpxSLDZuxPkr16dp8WFIL0GffuLDTPVCod6c5xBB4fw0
	l6XyBozilcJ4malvSNbmqWkk4jAogXKErP/eDrMK2SCVGmxyk7JV+wUEMMGdOSmwfUJ87u7eQzE
	5q6s8nUQFQyR6P3qcESiqAFxCwqHqAFIvwEKtMH8UsLryKjyChsOqlvRxmwmTU1MXYxS0mZ7lmG
	Lj0MBOjkXFTo/fHi373XA2PyaGihK/7pTKaKD39XRqaji51O6MZ0poYy9J6iUoiGzFBAvB+4=
X-Received: by 2002:a05:6000:2203:b0:48e:2a6c:153b with SMTP id
 ffacd0b85a97d-493cb334277mr2973714f8f.35.1794023444836; Fri, 06 Nov 2026
 19:50:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104090239.311074-1-nikitash.mariiaw@gmail.com>
 <ausVkYs1-3rJ5Fj0@devuan> <20261105113229.4126d872@pumpkin>
 <CAPDEY+X7q2yeWaa7J=Nre+pQqUa2C760Hh9NovdGNSQ=VsEr8w@mail.gmail.com>
 <20261106102723.1cc4d350@pumpkin> <1EAA42AE-92F8-4CB7-B490-CDB6DA9FFCE9@kernel.org>
In-Reply-To: <1EAA42AE-92F8-4CB7-B490-CDB6DA9FFCE9@kernel.org>
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Date: Fri, 6 Nov 2026 19:50:33 -0800
X-Gm-Features: AclHuK8S23Z0xNdnv0TQ6fL-U428vp435ZwNqPtWkfKo8mNDXQ1VtJpE_Dhy960
Message-ID: <CAPDEY+UVqhg9R-Nk-vqie7kNoadr0JcXMKHsjShmWbHkWuexhA@mail.gmail.com>
Subject: Re: [PATCH] media: siano: Replace strlcat() with snprintf() in sms_ir_init()
To: Kees Cook <kees@kernel.org>
Cc: David Laight <david.laight.linux@gmail.com>, 
	Alejandro Colomar <alx+linux-hardening@kernel.org>, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, justinstitt@google.com, morbo@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 8:06=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
>
>
> On November 6, 2026 2:27:23 AM PST, David Laight <david.laight.linux@gmai=
l.com> wrote:
> >On Thu, 5 Nov 2026 17:44:00 -0800
> >Mariia Nikitash <nikitash.mariiaw@gmail.com> wrote:
> >
> >> On Thu, Nov 5, 2026 at 3:32=E2=80=AFAM David Laight <david.laight.linu=
x@gmail.com>
> >> wrote:
> >> >
> >> > On Wed, 4 Nov 2026 12:25:17 +0100
> >> > Alejandro Colomar <alx+linux-hardening@kernel.org> wrote:
> >> >
> >> > > Hi Mariia,
> >> > >
> >> > > > Date: 2026-11-04 01:02:39-0800
> >> > > > From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
> >> > > >
> >> > > > In preparation for removing the deprecated strlcat() API[1],
> >> > > > replace the strscpy() and strlcat() calls with a single snprintf=
()
> >> > > > call to construct the IR device path.
> >> > > >
> >> > > > Both the source and destination buffers have the same capacity,
> >> > >
> >> > > The line above seems irrelevant, and potentially confusing.
> >> > > The size of the input is not important, because since we're append=
ing
> >> > > stuff after it, truncation may actually happen.
> >> >
> >> > And gcc's stupid format overflow check is going to complain.
> >>
> >> Thanks for pointing this out! I initially tested with Clang, but repro=
duced
> >> the warning with GCC. I've switched to seq_buf for v3.
> >
> >That is entirely OTT.
> >Currently scnprintf() doesn't complain.
>
>

Hi Kees,


> What does GCC say about it? Is it mad about src >=3D dest length but the =
format adds chars?

GCC 13 reported -Wformat-truncation:

error: =E2=80=98/ir0=E2=80=99 directive output may be truncated writing 4 b=
ytes
into a region of size between 1 and 32


note: =E2=80=98snprintf=E2=80=99 output between 5 and 36 bytes
into a destination of size 32

Both devpath and ir.phys are 32-byte buffers, so the suffix may not fit.


> I agree that seq_buf isn't needed here; that's really only for complicate=
d cases where the simpler solutions don't fit. (In this case, snprintf-like=
 is best.)

That makes sense.


> Both seq_buf and scnprintf avoid the warning because GCC just happens to =
not recognize the pattern when using those helpers, so this is just silenci=
ng the warning, much like strlcat() did too.
>
> Truncation was the norm already, so scnprintf is probably the best fit, b=
ut I think it may be worth looking at the surrounding code and conventions =
to decide if truncation should be communicated upward to the caller (i.e. f=
ail), or if the structures involved should be adjusted to avoid truncation =
chance, etc etc. If possible we should avoid the weakness, but if not, just=
 use the minimal solution here, which is scnprintf, though that kicks the w=
arning down the road...

I traced the USB/SDIO initialization paths and checked the caller's
error handling. The existing code permits truncation, so I kept v4
focused on preserving that behavior with scnprintf(). Any broader
changes to truncation handling could be addressed separately.

Thank you!

>
> -Kees
>
>

Mariia
> --
> Kees Cook
