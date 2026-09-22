Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6346539776
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790075375; cv=pass; b=sNB15FfupOVwt/+AW0wcLmhHvy7RZuspluBpxCSjA0gkK3XnMeyXhcORUnkcfdqZOuzWdmSNnE8rHl+7iAm5LktdQ/ZA6fSx/dvyErZKfuYb0CdeHIHTMaNIgThxnw3v+4B1/otN6wdFP9MXlAa5l5FBPwNPdma2O+iYVwqHMZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790075375; c=relaxed/simple;
	bh=6GVB7x9ben233bUd/Gl4RRPxsbae5e6i40S+8Q0zN4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MHHM8bPzDwKuSVqDWjZDZyf7GfOLZro0fbGD56qFD18wp2IPqB7ehqAeoeKk70Qv7u5c/T+SnwV5UA7mf+KnHhleA3yrUj8ckT9BHOH2PD1+2EKEDgt7rO2grANW9VX242THMIFezGcilkXzyMQQFr813dpb26RvqXMocUX9UOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HT3/B50d; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HT3/B50d"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c294ad260fdso125010866b.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:09:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790075372; cv=none;
        d=google.com; s=arc-20260327;
        b=niStwDR+ESTyLoZvCDCs1m/oz/wWGM2pxFGFoEfzIuBKKzdoYS0KxsxhfOpucM8fH+
         C9QTKXuyCE1cWU1qwrx+qfYF1WikkTNE1F9CsEHvKM5aQeMX+2tk0DFt6I4mLN3ImmOv
         2VRtVUXXbpmjp3AwVsOaiG0YqIIhnx0XrMMZodIGOlMdLKwf1H0BYLgaxbqBMJSNByrd
         s21BSjVo5XGxDsV3FvzvE8zvQ+BKj2J2KXfkxqpPlkQjPMODLX4SIHwqUKOwM44LLIRj
         W8i/XWExQ4SiYKb6hpZjMYCDppO88E6BA7tuHRogcfoTq8yiLoR5RrrUjmguZbMOPmVP
         47nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bYkI/YWQ8yKeluntLIACqYIRC6CpwK4iAnqdkQvaVCg=;
        fh=ejVJvrHQl1Xbrk4ATqQKX5ANO05zpTrY9DOtstqEPh4=;
        b=UE7IWPczQif/rIFrR0e2krWmZiO7+JkgPuulEWWXgWtmti4uk4xVLcF6ZrfcZbIADI
         O0bd3gen+rTx1KsNLqSfTzS54depUtpAIO7IFiMjlhFEDm57t3vNxVsT5iCgohLX/rYE
         j3V4SwfqSsJoRKT48J5F+FSC2f0uh9PjQPcElZTXMe27+RwuRQN+ckSllczSY/7UUndH
         SlXI3E7T7gFTcVcuvyn+gtcgzWKVPiv0C/iafA7gCzxpbGqy2WPAMtOYJ9SBnS05pl4y
         2upPe3fp+OlXAIGb0IzYnolHpIyNkMzdTratqKRZ0Bn7mRfZej0qVlgcu+qd/+j8z9QY
         Ab9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790075372; x=1790680172; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bYkI/YWQ8yKeluntLIACqYIRC6CpwK4iAnqdkQvaVCg=;
        b=HT3/B50d4ZrdjbN7WnmcXIP6V1M9sdOiAR8RPhxHjiWviVaDgZOW6ATuMyK60LVTy6
         THxPvcCRZq+n4YUbfVJClT1SjC7sBS9Yty/7saJyXzqBvGIBtT37FKPJdyWSkA4ZOGDs
         Odn0MwyLTV14KiRLLR928cuHnxuin26acRRJ9OIjGaVQOU3bo2FwSfiQT/mWAfYMqWQM
         KC7Jl3V1x0b9/PYtoivt9ZqcJFlvpJ7TqL2bUddQ78KrExlpi2CzOGREjz/jyN1uv5xI
         xxBbiWztfXYC3GALY9bHK8MxRGjQq9Bq0m+4/mF+mtgJMfhb/rGsItkXU0fU/sOjBDtT
         LpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790075372; x=1790680172;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bYkI/YWQ8yKeluntLIACqYIRC6CpwK4iAnqdkQvaVCg=;
        b=GKTXAyd4FUvvyBt35A0vsTUI1q7Wnvgq8jdMGS96slhETJKliJlnnRlbroEaR80EsG
         JStLFZKmCD4N9f9/uiK4m884oH47aGkk69CEvt2q0Z2E4wyftlzzU/wdyVpeZ+2RpiyF
         mK55wO4hTLPGSJ7Dg4RQJgu7Es7WQSng2cxaXGy0D9Q6g+f1tUtgZOeW1HHdcd7eoztg
         9s/bpPB9KZ3TGFZyEwsAgDW9zyYQPiVJkus5f44l8tvdgbTOe1ehrZF3Z8picQIeX76G
         fSKsBQVzqsvqVbbfHQN04VA5DShlry17HvCJN02VrsPkXh+iBMx6oXlkfnbODinpry0A
         XV4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzmUQxvNEo8HWXIUzdT2JqQLz0yuQg1MLGEsGpdY69h0WsKRabrsIHYZz6dEJG5w6lYbb3gmO3GVvZiMrU=@vger.kernel.org
X-Gm-Message-State: AFuF++llOQVMrYWUx7XfcQXDnkx4/rfpxN6MKM+X9qpRVTxioSGlb/B2
	XYg9LEugw1YQ+l0CNrxDPRg1Q71m2TUz5jaiCOGpuzGoRvFFDvAmeGKFZa0njUUPGTPwi1EgTfC
	6/sLOSdwLJeT3wMSomC6XLHeEFPB/mcAPrV/VbKBAYg==
X-Gm-Gg: AYBFou2FVUPUMECjVlTgdonpHXOIEtYtYp6p0X2ZHPcHz4JqLV6I8gLT3lG6Ik6MWGU
	fyfvHdALJsrP4+yeeMD58gVeFjgH23W6Weljn/n+kcSEURYEjMtZK1sXuAgJXDN4TMgViTkboeg
	v9XaUcQxxQoSJy8kLTFYvPW9uC1anE3FItgjZERIB66GGO2xwSsidM5hX71WbgFefdxCX+qJiFP
	Tnf1EtiNYRbOgQNOaTz3A7Jsuiaep84cTvzSLAvCVqeKoE4Yi9RdFem9crb+v9Rkgm0qYqni/F8
	1ksmmmfbZJx4VAeanCvirMSqwLUkxfGLaYZS9SgxbUhonZ8+8OW8tEalQAKNcSEi9+tdwDoP5pe
	0L54UGpbP7arwRaccONENCH87hSeU6GVuy3us3Lk=
X-Received: by 2002:a17:907:1c1d:b0:c25:4d9e:bb28 with SMTP id
 a640c23a62f3a-c2a8d44e967mr204909166b.3.1790075371598; Tue, 22 Sep 2026
 04:09:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824225610.18471-1-meatuni001@gmail.com> <20260824225610.18471-3-meatuni001@gmail.com>
 <a67d4e52-5e87-0e76-4c91-cb8ba2be31f9@linux.intel.com> <CADqcGBnGHd+rRn6b=eWVjhWDU-NQ4CFb-3B9cgwBeouN-sbw4Q@mail.gmail.com>
 <ab2078e1-4388-6311-0363-afdfc131ea60@linux.intel.com>
In-Reply-To: <ab2078e1-4388-6311-0363-afdfc131ea60@linux.intel.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Tue, 22 Sep 2026 16:09:20 +0500
X-Gm-Features: AcwNN1UiG-gE9yMoTAKVEMCJSlXjpgp0-QY2lWEbGt4QUYok2K-kPFaSQ5j-SHY
Message-ID: <CADqcGBnuzxwKiQ-r94gin0+8oWpvsWQ+tL=PRpK=tee7A2okdw@mail.gmail.com>
Subject: Re: [PATCH 2/2] platform/x86: hp-bioscfg: fix heap OOB read and
 buffer desync in hp_get_string_from_buffer()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: jorge.lopez2@hp.com, Hans de Goede <hansg@kernel.org>, linux@weissschuh.net, 
	platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That makes sense, thanks for the pointers. Here's what I found and a
concrete proposal.

string_escape_mem() (lib/string_helpers.c) does exactly what the
manual loop is trying to do, safely: it takes a source byte buffer and
length, writes escaped output into dst up to osz without ever writing
past it, and returns the true escaped length so truncation is
detectable by comparing the return value to osz. I checked
escape_passthrough(), the fallback for anything not matched by a flag:
it copies the byte through unchanged. ESCAPE_SPACE covers \n \r \t \v
\f, ESCAPE_SPECIAL covers \\ \a \e and ". All of those are ASCII
values below 0x80, so none of them can collide with a UTF-8
continuation or lead byte (those are always >=3D 0x80). So running
string_escape_mem() over already-converted UTF-8 output is safe
without needing to be UTF-8-aware itself.

Proposed shape: convert with utf16s_to_utf8s() into a scratch buffer,
then string_escape_mem() that scratch buffer into dst.

char utf8_buf[MAX_BUFF_SIZE];
int utf8_len;
int escaped_len;

utf8_len =3D utf16s_to_utf8s(src, orig_size, UTF16_HOST_ENDIAN,
utf8_buf, sizeof(utf8_buf));

escaped_len =3D string_escape_mem(utf8_buf, utf8_len, dst, dst_size - 1,
ESCAPE_SPACE | ESCAPE_SPECIAL, NULL);
dst[escaped_len] =3D 0;

I want to flag the scratch buffer sizing specifically, since I got
this wrong in my first pass at this reply and want to be upfront about
it. src_size is attacker/firmware controlled (a u16 read straight from
the WMI buffer), so orig_size can be up to ~32767 u16 units, worst
case UTF-8 expansion of that is close to 100KB, nowhere near safe for
a fixed-size stack buffer, and the kernel doesn't allow sizing a stack
array off a runtime value. I checked all three call sites in this
file: dst_size is 512 (MAX_BUFF_SIZE) at every one of them, no
exceptions. So the above caps the conversion at MAX_BUFF_SIZE
regardless of what orig_size claims, same capping discipline the
current code already applies to conv_dst_size, just applied a step
earlier, before the escape-inflated count. Open to a different
constant or a kmalloc'd buffer instead if you'd rather not hardcode a
dependency on MAX_BUFF_SIZE inside this function.

Two more things I want your input on:

1. Quote handling changes. ESCAPE_SPECIAL turns " into \", the current
code turns it into ' instead (no backslash). Switching to the library
means losing that substitution, a visible output change I'd rather
confirm than assume is fine.

2. \v and \f get escaped now, where they weren't before. Matches what
you said about \v being an oversight, just flagging that \f comes
along with it from the same flag, there's no way to get one without
the other from ESCAPE_SPACE.

On utf8clen(): found it, static inline and duplicated in both
fs/unicode/mkutf8data.c and fs/unicode/utf8-norm.c, unusable from a
driver as is. I don't think this fix needs it though,
string_escape_mem() is already byte-transparent to UTF-8 as noted
above. The only thing utf8clen() would buy is guaranteeing a dst_size
truncation never lands mid-character. Given this is short BIOS
attribute strings, I'd lean toward leaving that as a known, minor
limitation for now rather than pulling in a separate cross-subsystem
cleanup patch to fs/unicode just for it. Let me know if you'd rather I
do that properly first.

Thanks,
Muhammad

On Mon, Sep 21, 2026 at 7:29=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Sat, 19 Sep 2026, Muhammad Bilal wrote:
>
> > Confirmed, you're right about the redundancy.
> >
> > utf16s_to_utf8s() takes src by value, so it can't advance the caller's
> > src pointer. The second loop then restarts from the same position and
> > overwrites everything the conversion just wrote, using dst[i] =3D *src,
> > a raw truncating cast with no UTF-8 encoding. So step 2 is currently
> > dead work, and the function is ASCII-only in practice: any character
> > above 0x7f gets truncated to garbage instead of being properly
> > encoded.
> >
> > Two ways to fix that, and I'd like your preference before I send
> > anything more for it:
> >
> > (a) Keep utf16s_to_utf8s() as the real conversion, and rewrite the
> > second loop to do escaping as a pass over its UTF-8 output instead of
> > re-deriving from UTF-16 src.
>
> Not exactly this, but somewhere there.
>
> You should not try to build the escaping nor utf-8 parsing/length
> calculation within the driver but use generic code for that.
>
> To give some directions...
>
> There seems to be some escaping function in lib/string_helpers.c but sinc=
e
> we're dealing with an UTF-8 string here, there might not be a readily
> available function for string inputs/outputs.
>
> escape_space() seems to also cover escaping \v, which wasn't among the
> characters this driver escapes. You might need to check that particular
> character in driver before calling the library's escape funtion though
> I'm more thinking along the lines of not escaping it was an oversight fro=
m
> the original submitter (given the questionable quality of this driver to
> begin with).
>
> utf8clen() seems to exists, but is currently in inconvinient place (and
> already duplicated so it should be placed into some header anyway).
>
> > (b) Drop utf16s_to_utf8s() entirely if ASCII-only was always the
> > intent, and keep only the manual loop, fixing its bounds instead..
>
> I think ASCII only was not the intent, but it just happens to work in
> many cases which is why this has survived so far.
>
> --
>  i.
>
