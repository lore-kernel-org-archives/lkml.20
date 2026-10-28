Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793154997;
	b=HDuFNJRyFvgEKFPibdOwzHPNnqJnGMvtPZUSeNSGXMXObvghUC8Wk/TMiLVeAhxBf1r5
	 uaYEScofXk764D3x78T9edpduG2em2jRYiqesXdrvcp3SDjeuQz5GC/l0LEOeAvr44yWI
	 5vRc0zCHuVhwckNpHe5MB+XOuLMo3Jd5wzgyc0skbbivA2HJaIufUZcyIBRjisSSdGNyL
	 dnzuYF1xMOyLCkcY9DWRAoHvB6LGgiVvTOBt4ZeEP3WlVMlrqKGe/ujHwuVuKrHp7z0hy
	 TVfA9g9IvyAlBKO/Zudm1NL5uKgwu3RUH+jMJ62AlI5QpvEQ4I6YT7sjeAiX4h6I+vw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793154997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=j0tvYwZc9wTvJehA1eVV42/5EkP6AzjWS58ZC5zewLc=;
	b=HniRmpN8BNnQg4kWQODxyQ7Eg9R5lscxTr/sR1VAVyeGwIlo/A2INx8Hm6/3+enFPI56
	 HzgbhFVmHqd63v+JvIGqyEAFq5VFgQIFVBXiDdinDrEo/FW3so90ZVi/cwX8I+MwHyHUD
	 sXCve3GHaVoGEhajZKiqZkOG8G/WUB9lDSoUR9EsFkqq/gDPyZH6MBfzzvzuh548MaYHY
	 86eN5gixn2Lfi7dKvFfTZoeO2Get54MQUFJW3P9UVv4RB7AY1NpxOLuciHNXLUYgqHwjz
	 X1YHVQXmG/Qii2aKvIHGCI0ow7t0++mR/4ghp7qOSvibNWZISBmmvIq4IXl9GIj6mOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rzFZ9jOz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB884606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB884606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rzFZ9jOz
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bfa686881fso465374e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:36:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793154995; cv=none;
        d=google.com; s=arc-20260327;
        b=HH5ErwUo4Uxygx1lKL8b2asYw0oMB2ZJKvTCPB2390kB6fVf1KZLtumMEGmPv7J9la
         rhDYXMRJD5/lLArqryKWBPvJTUjFTEc407T5qLLZsYiTH5+fOncxd0XuI6Lpeec30fcL
         eL6yjjr4kK8ClLIyfZjWBlOcWG1PkUoHxVm7uvdisJz/iUsIrZITMw+6Vmskymf80T37
         uwu1AjSEn7POtV7W0b4uK8tGmE3Iov+xIyWB3UaUJTgFtagHxPoFJ3v7B+KVBVNLyX0z
         6isfWCOA1pTGPfGpe5hCXsJp/DMBOCZYR7ggg2wgUyzz+bmR60oGtTrPoed/wUtKbAls
         mgQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=j0tvYwZc9wTvJehA1eVV42/5EkP6AzjWS58ZC5zewLc=;
        fh=LrttzmAFJF/BOu7lBOolixfPM1wKOZU0Cvv06/eb6I8=;
        b=f5eE7X7fJlX1F4vxgJEOrXf1TWHDC0DEgNpHdEjNCjKthpg3SFOzp/mCySSBnkjibr
         EwK8BcGFJeROmQ17zP7YNJwVft5oEsR4Z52UY1vDmOv8PlRk14ILjtlsqxwNZgtDzzcJ
         yc8Q+uSqZp+CAsbsYsvBpj48rPs94Dka9jZoFhKB82rnSlaIXcZvTWmsrSA8iQfG3Cnn
         jdI3vezKRcbIN2cFGQ7fjnjaOmBpKiGbWNlEKaFlsZZKRPqTuUWc5i5eDZW1vwQ8Uu2r
         1vd0W0qgSEOZ9dlKow0aUuEmor/bBC0zOFdkU9bcvG8byNJ8eQfRL5Eu4jdQqMsYqiew
         h1QQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793154995; x=1793759795; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j0tvYwZc9wTvJehA1eVV42/5EkP6AzjWS58ZC5zewLc=;
        b=rzFZ9jOz7i2ac77OXVlgf1fvPX9Ab3WmJDWVqROiaTpFbXiDNBhs5VZxiGMMLKN3aj
         dZa/DN0xBMih0J3m4+GpEVZWTxGuXNcj/m7F/gquHRukMYpL1nNLgQYb6KbBimGqxDQ2
         InsKa5HhiU6xOKyejzeIDhnSehEDGXeR+GdxApvUmyMxcdQahu/aRY2KnFj6wfeVfSBf
         qkhyxOeAk4dDN1CZdDgG/ESvL5hIlRRUskU346lY4CwGRbQs8+xG+/8IMgbosuBU1F5h
         DcoWZzLhrEFKGytxqHCZa6CWJGdEyAS7zMeeUV1RZQJ6y74+pp8M+GBOcFpNaEMW/KVl
         vaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793154995; x=1793759795;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j0tvYwZc9wTvJehA1eVV42/5EkP6AzjWS58ZC5zewLc=;
        b=cagfNB+rwzrtyCIf5hrjtk3gVUAIoZjfP2XOiNXl4hbU+6KnvPeQ3hwh+Gz3y59Auj
         sMLv6XXC+1E4XwmgY8Bx8TFm7KY+H5gI2q95spdSaiil2u5p8F6Kkx9kiiCiNIe9Hh84
         357ZFaismtKc680WTcc6unItk1Q8104eo1/uTwyf7Nk96XTILSYu4i4TfydKjYkmy0WC
         JYexE1gnMjV80TGBmprsn9i5he6mxryALBUtmtG8wizMyEL7nGvNn8uiJn8IN4ivIpwY
         P7uiKihjtNpvxMH/dhB+IEFn8qcHHDwZqfmBfrYYwC7zWOKvPH5l9SGjEyzVjdVsTSDH
         9Lgw==
X-Forwarded-Encrypted: i=1; AKwUvBxrLBbWgnk0re4woN6SHY11uZVHh16FqdGTyx8mbXHXMUELC5hncr36xhxZR98iV/q2ardEr598pEPSb6o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAZKATv46GqTr0yBjNs+MrB5FUDNcda4seiX1mlGFP85Xq5MSe
	tjXe55C4sMwPa+GtNFXpIrQZKam02LC96n5kYRpsGZrFvN1XlWFk8azUw8dRMF+TO76cLDwaQpP
	i+R2SCHjCDSZ9gB0R3klX+btWZBuWd8c=
X-Gm-Gg: AYBFou1V1AuEeKC8vohZwUsDj+TxhqWQ2Zt1wmBdz7w465D6AMxLL+N4DXnrXePz4d5
	oJoKCukhqI+CoEaRmfMJ1WFcbzTkz6E63a+OddUouawrAlaZaK5BF+U2SqJKvD8DnidifaJKRah
	+ao224QElN5NGM44764hG4JwLSdp8XwCFasaCegjwl/27iauPcxP7SV18DHkIyob7w8USNOLemX
	6jUJXt4VyRXESX8VAwgr43etK2XHG8hEsvyVb9d8jtyZ9AHztW0IR4JE0rdzuaZ1nnRW+DbgGR8
	BBjLCDU/TA64RWJeQqRP5zEhD0AoOes71WD6Y+XwkvR9oioP2WzeRvhxBy09TsNkG0IKMzbuh7p
	GGN1KI52bvY8LTIVhhihlrJ1ZRPxbphcT+uMYzLzR974E0mvnttczidOopJwF2fGg+4zsBnJmW6
	Z+uOQY4abcF6suCvwA
X-Received: by 2002:ac2:4bcc:0:b0:5bf:bfa7:cd33 with SMTP id
 2adb3069b0e04-5bfcacc8d0fmr434647e87.8.1793154994755; Tue, 27 Oct 2026
 19:36:34 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019230159.834954-1-mrwillporter@gmail.com>
 <at-dpPOGs2zD2fuL@khmer.arcnet> <CAMZ8TExJThTMZVvbDMVdtXSB-edGAsAnmKYtAtM1CCw0pDvNGw@mail.gmail.com>
 <auEyD23PT_kpJsrJ@khmer.arcnet>
In-Reply-To: <auEyD23PT_kpJsrJ@khmer.arcnet>
From: Will Porter <mrwillporter@gmail.com>
Date: Tue, 27 Oct 2026 21:36:23 -0500
X-Gm-Features: AclHuK-MYfRR2Ytpzl3UFpBwLNrsz8gDJW_Gm_bBh87oewtYdi1oUomSx4Y7hwY
Message-ID: <CAMZ8TEw=rmc=H3L60j-o_wa0fNc9eOhG7ZY0SdttFf+p-qUfkQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] ALSA: usb-audio: Audient iD14 MkI vendor controls
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Neil Andrews <neil@androos.io>
Content-Type: text/plain; charset="UTF-8"

Hi Christian,

On Wed, Oct 28, 2026 at 12:21:51AM +0100, Christian Ruppert wrote:
> BTW: the mixer matrix seems to be identical also for the EVO8 so
> chances are it's the same for most audient devices and we could
> simply use a width and height parameter to generate it in a loop.

That sounds good to me. On the iD14 it would be 14 inputs by 4
outputs.

> My view of the WO implementation would be to add three flags: cache,
> init and force_write:

These look right to me. As per-control flags, you could set init on the
EVO matrix, and for the iD14 entries, could we set it only on the
write-only controls? The matrix, routing and readable monitor controls
keep their values across a replug on mains power, so I'd leave those
untouched at probe. Would each entry also carry its init value? On the
iD14 most start at off or the first item, but optical mode starts at
S/PDIF.

I'd keep force_write on the cached write-only controls, as a precaution
against a reset that leaves the card registered. I haven't seen that
on the iD14: the resets I've seen re-enumerate it and run probe again.
For the readable controls, skipping an unchanged write seems fine to me.

> - The intent of the control types was to associate unit/selector
>   pairs with data types. I would add a new ctype for each
>   unit/selector pair [...]
> - I don't have a preference between explicit control names and the
>   basename/suffix system the EVO driver currently uses. If you prefer
>   we can simply replace the basename with a full name and remove the
>   flags field in the controls.

Yes, full names would make the iD14 table easier to check. And
one ctype per unit/selector pair is fine with me.

> - The boost switch writing 0x0 for 0dB gain and 0x0a00 for 10dB gain
>   looks suspiciously like a volume control between 0dB and 10dB *
>   256steps/dB. Does this control only accept these two values or can
>   we simply implement it as a standard volume type controlling a mic
>   pre-amp?

Your guess was correct! The device answers no RANGE request for it, so
I tried intermediate values with a loopback cable: 0x0100, 0x0280 and
0x0500 gave +1, +2.5 and +5 dB on both mic inputs, each tested
successfully within 0.01 dB of nominal. I didn't test outside 0..+10 dB
though.

Even so, I'd like to keep it as a switch in this series, because the
iD14's documentation describes a fixed +10 dB boost. Your max-for-true,
min-for-false boolean would fit that, with 0 and 0x0a00. A 0..10 dB
volume could follow as its own patch if people want it later. Does that
sound reasonable?

> - We definitely need a new snd_evo_type entry and get/set functions
>   for enums, up to you to define those in the most suitable manner
>   for the id14.

OK, I'll write the enum type with the iD14 tables.

> Sure, error management is always good to have. [...] Also, for the
> controls I checked, the EVO cleanly rejects out-of-range writes but
> if the id14 doesn't we should add those checks as well.

I haven't tested whether the iD14 rejects them. Could the generic put
handlers reject values outside each control's writable ALSA range with
-EINVAL, before converting them to device values? That would cover
both devices.

> I would definitely prefer to list both of us as maintainers.

Okay, let's do that.

> I suggest I submit an RFC with the generic part that you can apply
> locally to work against (and potentially adjust) before you submit
> everything in a final series which, if everything goes well, I only
> need to retest and tag.

That works for me. I'll carry your rename and generic patches in the
final series, with your authorship and Signed-off-by kept and mine
added, followed by the iD14 patches. Are your four fixes still going in
separately first? And could you include the base commit in the RFC?

Thanks,
Will
