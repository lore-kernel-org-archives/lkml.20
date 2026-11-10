Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794276808;
	b=GqxOluv0Anv5nIxZTgSrNEDJlmpZxX5FRVGikbiIIWgAdUdccInMjhgzhQ4t78XsC/Pf
	 2aGYklTsaZJVYws9031EqbrTgedJxoNGF8uGNPuBVgzQq05FTTz/cEmh3MMLlPj6Fvrr4
	 wrAfpsN02UhdkwYXHPZKb4d3EaG10KfzcL46yE8E/QpXgsyTmpTCJDWMgvZvO3zky+qIr
	 8Vv7Jp+xUmrUzPdeMRQrt6dbrQUGoELDgN/hkvSujbo20K+m9zyrQOVYd9X0epmDv5YSB
	 HY1viqIAZ4fE+OFkl1Lp/4xIJGG8SfVG7jA4QKgKhScRQ6Rbd2aCZawB+YvSNE5FGfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fvx5Ms/VNPVQifdamFB9/asAfNuvb6utXEi4ao8hwQ8=;
	b=fFCKlJK/HeNgG//Uo/BU7QupyywJrFAtjI8W7szasKuYPh00xjBVR2kxuBTDRabZs8Tx
	 c9pXhkoHSL+899RtyoYcZjo3m5aNe8Xodq3Xz0R5++T4zxTDl/2ECs9PAsjLIxLuWe8Cy
	 IsVxc45FsPz0uz/9GEjR7wTIe8C+a7Zai5DaFgTgYngi4JKythWNQ4Fof43Uh+Yi3knI4
	 B4+AY/Etiz83XzKrkMu0jtOJpPLLpMey8JblCgoZxzbO6L5yhUSLp3IH8zqJo3kUsN0vW
	 K6FK4JJEJkbfIEhPVodrEt6BJsp29D8787dZQhqziRBCzwTkXQ3U8RTnLbmZgMpvWgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rX51piuF;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BAA606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05BAA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rX51piuF
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4ed6d69bdfaso880109b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794276807; x=1794881607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fvx5Ms/VNPVQifdamFB9/asAfNuvb6utXEi4ao8hwQ8=;
        b=rX51piuF8Yovy/WH9Kd7V1SaTO8wV2M9lvCViy6In/uwBPTJ9QU46X9nCCJuqTKpys
         xsI4JlEP1DqBExZ6uJPSM3fAzSB/9194yWxkDTvK6v3/AqWg7BnptCjGDK3oWIK1Z4PK
         AKNtmRvWxrsMNDrzU9FhWf8RvQNBfhTnnRxXpbC+ZwZUAS5gDdd4vvwV4g1cViSqzo53
         8U9yGpPKBPPSUergEZMGzlZt7HVt4vN4UTkE+bKSSpubsN9UNb8Lfk4GEXAW9p+YKJcZ
         vZbD+l50xoCXIDy2b3oWobmYDNNxvLNjtkIUxzWREC0kwkqKcfAAPtf9HERVCNfIeju4
         7vSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794276807; x=1794881607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fvx5Ms/VNPVQifdamFB9/asAfNuvb6utXEi4ao8hwQ8=;
        b=l0PSLi5DvZ0tifr7fVEczbQFr93iPNT0hUBZVa0/Qyq7M9sf4kWZceif/r+KN8iYuF
         neeYNUKEjMTMt+EBVctSvzQKsqbzGqw/F5Hpd2/4IKW12iiyutk7soxRv0MKpXuLDZfR
         D0/kGEm0/K3qZTmKjjJv3zmcK/XJg6/np7g4wW2as1znVciCfB15jVy2pYz2Q5aOdmCX
         qPXljv6UH9TCjKozW2HdF7OpX5Kayay+pSSNa0TTwEt3wc/EARjLTIWSiX8zb5vr+e5/
         tzIyMt7ukCwtZ/Xd4ynqGBOoQk51aZEMP/PCGaAGkTgM+ygGolC5UK65/l6OguZcTTJn
         GlEw==
X-Forwarded-Encrypted: i=1; AL+hErFtEEeHSzBTKlrt9MD/YJBZ916Y30m6ptBB++lFGA3ZUJK3UwCrbaOAfi1FoCUkiy/24MUWbMOSja56KGQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FmkoQeIQgc1dhyDqPRCFjnsyPaXrRthJiZQtv48cnEin42rmR
	PosnUM0T321SjNvhSXAJsnRBvx/BgEZjL5fiP6i4QXZ1hlrAd/3UKArVjq6FOw==
X-Gm-Gg: AYBFou2WzY0o3uphbPbMq0mIs8+tXpixsDpNaCK8SwtkuXGtMAXL30TIxIF2dTid2+f
	uJcTsyj75Y8zEslLgPwNU2bdh9Gwnbp2ig0gnGe4oCl+vLO9ER8dL+m75JUBLYrp2G6JkWRNKI8
	XbLE3wmyzm5O/WiGAohb6hBQae4WK1TmObe9mHLaAjbeSJVqSGo5PDr/qabxSjlgEoZkmWc3OJa
	+NXi8kNw1BcU6VqkiJcaLes4Gu0doXBN7rzYPSR2kN2TOhMjUvc56zkieHLGVY4FYZAnHBWMoML
	xXgJwA46OBpwUAWE1uJx5CA6sKrOU17cOIhOhpmxXFFubIsjnDuBMWQVEB9rHmLWj6rOF+k49lL
	sxCAkkGILLsQA8OsnGEBtFFB8EVwBWvJrxUnQZaapkUEXHsCBn3HCSiYIj/8JQvLF64eLcLecDo
	NPqTePFLob3uN8teicav/hdSosHAtDUZqyDLI/KFMDVeVdMmV6renSJDvBsf7FpFX2voYQyCj3N
	X5u13YvVF9VwLO6o7jGxReyIcIs/J//jjAQifXGO8SxQSe7gd8Zqo86EZRgS7Y+GzQwD97OsNuw
	LsT0ZREBwar/X0BLVKspZdgNeT7x04YXuvJcA0BxtTReAA==
X-Received: by 2002:a05:6808:c40a:b0:4d5:27da:a498 with SMTP id 5614622812f47-5683cd76353mr967405b6e.50.1794276806963;
        Mon, 09 Nov 2026 18:13:26 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905f2faf5sm867656b6e.13.2026.11.09.18.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:13:25 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: Re: [RFC PATCH 13/16] ALSA: mixer_audient: Add enumerated controls
Date: Mon,  9 Nov 2026 20:13:02 -0600
Message-ID: <20261110021302.1077745-1-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <avJJgGbAVnVrUlPM@khmer.arcnet>
References: <avJJgGbAVnVrUlPM@khmer.arcnet>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Christian,

Thank you for squashing the fix and for testing it on 7.3.3.

> patch 12:
> - I would declare snd_audient_int_max, snd_audient_int_min and
>   snd_audient_int_from_ctl as inline [...]

Done.

> patch 13:
> - I would have snd_audient_enum_item return the negative errno
>   instead of e->items and then propagate it.

Done. It returns the item or -EIO, and get propagates the error.

> - I wonder if it would make the code more readable if we refactor all
>   the if-statements snd_ctl_audient_info has grown into something
>   like DIFF 1 below?

Done. snd_ctl_audient_info() now uses a switch.

> patch 15:
> - snd_ctl_audient_enum_get uses ctype->init which is not set by the
>   ID14_ENUM() macro. Is this intentionally always constant 0? In this
>   case, could the logic be removed?

I think the logic is still needed, because init is not always 0.
ID14_ENUM() builds only the readable enums: Mono Mode and the four
routing controls. They have no cache entry, so
snd_audient_raw_get_one() never returns -ENODATA for them, and no code
reads init for them. The three write-only enums (iD key function,
talkback source, optical mode) do not use the macro. They set .init
explicitly, to 0xffff, 0xff and 1. A comment on the macro now says
this.

> - Not sure if this is relevant for the iD14 but we might want to
>   apply something like DIFF 2 to make update events work on the
>   replaced controls 11 and possibly 60 [...]

I left DIFF 2 out of my patches. I have no objection to it, but I
cannot test it. The audio control interface of the iD14 MkI has no
interrupt endpoint (bNumEndpoints is 0), so
snd_usb_mixer_status_create() returns before it creates the URB. The
device sends no status interrupts, and a knob change shows only by a
read. On the iD14 the diff only moves the table-created controls from
id 0 to their unit in id_elems and in the usbmixer proc file.

Two things in sound/usb/mixer.c may matter for your EVO4 events:

- snd_usb_mixer_interrupt_v2() skips an element when the unit has more
  than one element and info->control differs from the control selector
  in the message. Our elements leave control at 0. Would the event
  reach them?
- The notify paths clear info->cached of the generic mixer, not the
  mixer_audient cache. Would a cached control report its old value
  after the event?

Could you carry DIFF 2 with your EVO4 event change?

> - In mixer_quirks.c: Fallthrough case statements seem to be used
>   almost everywhere else, [...]

Done. The two case labels share one call.

> patch 16:
> - can we rename 'create' to something which makes it obvious from the
>   name that the callback is optional, e.g. 'extra_init' or similar?

Done. It is now extra_init, with a comment that it is optional.

With these changes each of the five patches builds with W=1 without
warnings, and checkpatch --strict reports nothing new.
On the iD14 (stable 7.2.15) the read and write checks of the controls
pass with the new version.

For the next version: unless you would like another RFC round, I
would send it as a normal series, on top of your four mixer_evo fixes
as before. Does that work for you?

Thanks,
Will
