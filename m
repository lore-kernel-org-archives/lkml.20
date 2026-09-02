Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6723B3C0E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788332334; cv=pass; b=H/Mhnr7Tz+nAUnxzrElqMEXhMtdZH1uhtUnf7Hr7ma3Zhv6Et0+EMENQbm53RXbGBiB2xE9Zu7tMnUZ1Wu64vfjlldJPmFssnFpbdzsYQkKNt5V8Qwfv58TLog1plAWX3WeqvQYxuUpDnosZoSJtNCiO0NGyAQRcUHSobCB+zrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788332334; c=relaxed/simple;
	bh=lmdTvrNLyi0GtOLkMEAApwYWiwu+dvXJCi4Wv2yd25Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HCW9avWlEJ67HF4eoiheiKllaIJ9bOig9m6AAC+UjOs7E7vtkEbVToqG7X6gPRXqH1KdzafNA+iCo4M572y+NgCioDdykU8m/qsUorSvwcZkmXPGP913KkzmzJekrkVLbQdKNNtXl8gI/4GvNAe+UBYPDjJs22jLoIW7wJVyqG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eiUT1cEa; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eiUT1cEa"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4843750de83so169766f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 23:58:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788332327; cv=none;
        d=google.com; s=arc-20260327;
        b=Hhahm7GEG48kt5OAd/gaaDqMlVSU1usL8dq3llWpXzoX/g8rrWOvqyQnMrh4zY7+GP
         N4nvlRJEwbp0Ruu8LzuZ7+KztqxGhbfOI+3siDuoQXew5c5Hax5oogeQ6Jy16dWwquua
         RVpRDx0urjdnNqtz9tMu+tQyMqIcCx//u28z0RLaoOPF4OW89a3fA/Vf3IJyiAvq6C7U
         tTBDMRYjnN2gtCqQ2FbWMD0kLqcu6AnC7+3594stel64n3syyzD3XaKDAwKscN45vlFL
         8QemNJ2rRs2Fjwof1/fz1iaNveBsMZX8xxJ+vqLLLLJjQHxwWHZ7D0mA4KJkpQCLODJi
         3qrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rHvec1B41LTsHg/y2S1IBofbmedh40uYcMY1YS/Yk48=;
        fh=gPsdYfPJLLFLueM00c/s+FenSW3ZVoElfVBkv01ULPA=;
        b=N9SDRQ3ZcCXW/xM62CiF1mh/no15bQfHpWifSYXVQNjE7uOBj6ZMMT8VGJz3dlyIRh
         46iE7dER4MRPy19qzmjzXQsAtNyJ/i9nM+OR4Ux+GuyXN6pRAlAVN02OiyQeXfE5oINx
         w1iD8RoSjHrulfuaZmaCAti5Q6FDSktnc1Pj6C6VqCLDBaYro2etp5xXxFZP1T8/cVnW
         7o7qOZ7zirsKGtrOTOfZvirZ2m8yus8Bg8UPBKPsbkoBi4TZZkStrNW/xPTjZNjdbz62
         p6WuOZr1BtnXbHM+QV7udOljYh7zV/cKjWfD3mLkFHpiLaESGoZbR3L1VfxapOBAhUWG
         8u8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788332327; x=1788937127; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rHvec1B41LTsHg/y2S1IBofbmedh40uYcMY1YS/Yk48=;
        b=eiUT1cEarlrQ1WvjZphP92Aw1ly/HiBwQNemB6uTDs30M/QPu+gaKsaUhmeJ6u9Uto
         IQeNO/BIXUg2ZYkpaIxtGmHL27sT9b1QXrwPz+i6E+PME2dLL+cLdTeVbIIVmS5BJCHg
         S2GPyeUkz1kcWOGQssJiheiUHv9JZ1EMyddgeWb24kBtYqKv2A6dirZoh3nCUJm6P0cn
         4bpt5abvbGHlsMJQC5QlqTDqYSnvfNGhy+uMnWn/ebXhWIxwkO0zcnbszxWwjoWbYxpV
         xx2LoX7QvmBcdhYIJq1ICZ8fLPTThpDafgEa3yL49SnnjKbiYEXgUfDIK2AJpzRQRVpD
         dKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788332327; x=1788937127;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rHvec1B41LTsHg/y2S1IBofbmedh40uYcMY1YS/Yk48=;
        b=gQpDuUOuzXfwOyNW3VGA13CzzV9UJ2Yma0vJ8WwzJ+653njs+EiZan9qOpkNm2Qy/O
         UqDSFdI/jduJjCdUrHMa6k6F7QUFtwBxBHgHFaPZcEZrNcFhKxjkSpWfVMTmjfHjZinl
         fIH4t6q/nFoJAS8wkmkcCmHwRK6i4RhjHLtU6jdVSzyJfQBuy8AlAjLo78a9pQHqzQxV
         ZugsQaFh7DSEiLO5jyY83nLTrQH/Yoc2UXToGB9Wn7AFR7l0X6owtFNFVwnTcZxYZetc
         UnksKmppPSxuTglJpmBnrkit/1bCzVyTLpns4b9Vp1eCY4nf0c2nqJPr/IuYyzIFcdL/
         KQdA==
X-Forwarded-Encrypted: i=1; AKwUvBy5+heh4KBkuSUQncmihnKhh1WaAP7TFH9VrsctMvp4hN9hiYGRqA7pPtpjg3tu2lPxVBQQvfSZ1uOb0f4=@vger.kernel.org
X-Gm-Message-State: AFuF++m2refjW9r9unaGpB3Hub0ghFxtFnYkbRHXJh8d3zQvTeJjOI2D
	6vQixW143jAoKq9BNRuwwaE1bg1g9BW5B+PlEL0953OxC7ZI6e1fp8GETAUD4o0xGzfRSzWYNLb
	NtKAZYJBy3D3VghaPyfMY7uSLqWv8sXU=
X-Gm-Gg: AYBFou14d4H83hSqumDt0XZjLZjnMi90quumqSq36ZjI5eXyxCfIhYVHUGLLuGQDJDt
	cxmVxN/60j9F/v6Leg1CJl0z3gl5plx54bJafMq6PbySDQSSXBcI5XCy+NKFjrrfBOyaSb/JsUe
	RymEJQgoXCpmjmOturI3C8fbjl7bfwj6OzlRwKCCrX6mGc6ITzfpSKOD9cWadGwf7tbtKJ0Y8l0
	2u72hERoR5ZXlzqnjhAoxQOd2xjGMRMqbfCKbUBnClnUuWdfjWhQbkj/nPhcL4QPfEtDKzAMuD1
	0iuedG3UFM/GwHAXbAAeLwNNVAgoClpdcs/744Cj3eiC
X-Received: by 2002:a05:6000:2088:b0:484:3fce:18c5 with SMTP id
 ffacd0b85a97d-484914b920dmr4302153f8f.23.1788332326375; Tue, 01 Sep 2026
 23:58:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPBHdanmknKKhhc+5r8jPsnyZW8LYVq0qpzfEVrvjL3i5sNuJQ@mail.gmail.com>
 <87mru0b1z3.wl-tiwai@suse.de>
In-Reply-To: <87mru0b1z3.wl-tiwai@suse.de>
From: Qingyu Zhang <usupergate@gmail.com>
Date: Wed, 2 Sep 2026 14:58:34 +0800
X-Gm-Features: AcwNN1XLih-ed91UW2Km4yjXZEpOorEbNpVueoqU7zIXItjn8HELpZjPDbQuaRc
Message-ID: <CAPBHdakPAZfcP9PTKHiTQMHeEi8g7Xemg_UOByZAqKx6epxJ3A@mail.gmail.com>
Subject: Re: [BUG] ALSA: ump: NULL deref of legacy_rmidi after parse sets parsed
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000000def68065a7a9192"

--0000000000000def68065a7a9192
Content-Type: text/plain; charset="UTF-8"

Dear Takashi,

Thank you for your email. The formatted patch with the Signed-off-by
tag is attached; please check.

Yours,
Ian

>
> On Wed, 02 Sep 2026 04:07:30 +0200,
> Qingyu Zhang wrote:
> >
> > Hello,
> >
> > ump_legacy_set_rawmidi_name() snprintf()s into ump->legacy_rmidi->name
> > when ump->parsed is true, but parsed is set at the end of
> > snd_ump_parse_endpoint() *before* snd_ump_attach_legacy_rawmidi().
> > A UMP packet in that window NULL-derefs.
> >
> > Type: null-pointer dereference
> >
> > * Summary
> >
> > snd_ump_parse_endpoint() always does:
> >
> >        error:
> >                ump->parsed = true;
> >                ...
> >
> > ump_handle_ep_name_msg():
> >
> >        if (ret && ump->parsed) {
> >                ump_set_rawmidi_name(ump);
> >                ump_legacy_set_rawmidi_name(ump);  /* rmidi may be NULL */
> >        }
> >
> > ump_legacy_set_rawmidi_name():
> >
> >        rmidi = ump->legacy_rmidi;
> >        snprintf(rmidi->name, ...);   /* no NULL check */
> >
> > This runs from snd_ump_receive() on the USB input URB complete path
> > (in interrupt).
> >
> > * Affected
> >
> > 37e0e14128e0. Needs CONFIG_SND_UMP, CONFIG_SND_UMP_LEGACY_RAWMIDI,
> > CONFIG_SND_USB_AUDIO, a MIDI 2.0 gadget or device. KASAN.
> >
> > The natural window is parse-done vs attach. The QEMU PoC widens it
> > with a kprobe on snd_ump_receive (poc/widen_ump.c) plus dummy_hcd
> > configfs midi2, because the un-widened window is short.
> >
> > * Reproduction
> >
> >        # dummy_hcd + configfs usb_gadget midi2.usb0 (see poc/run.sh)
> >        # with widen_ump.ko: force parsed=1, legacy_rmidi=NULL on receive
> >
> > KASAN: null-ptr-deref in snprintf from ump_legacy_set_rawmidi_name
> > <- ump_handle_ep_name_msg <- snd_ump_receive <- input_urb_complete.
> > Then "Fatal exception in interrupt".
> >
> > * Expected
> >
> > legacy_rmidi helpers no-op until attach has stored the pointer.
> >
> > * Actual
> >
> > IRQ-context NULL deref.
> >
> > Please consider the suggested patch
> >
> > Thanks.
> >
> > Suggested patch:
> > ```
> > diff --git a/sound/core/ump.c b/sound/core/ump.c
> > index d183c8a000bd..3d1a2ed3b476 100644
> > --- a/sound/core/ump.c
> > +++ b/sound/core/ump.c
> > @@ -1335,6 +1335,8 @@ static void update_legacy_names(struct
> > snd_ump_endpoint *ump)
> > {
> >     struct snd_rawmidi *rmidi = ump->legacy_rmidi;
> >
> > +    if (!rmidi)
> > +        return;
> >     update_legacy_substreams(ump, rmidi, SNDRV_RAWMIDI_STREAM_INPUT);
> >     update_legacy_substreams(ump, rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT);
> > }
> > @@ -1343,6 +1345,8 @@ static void ump_legacy_set_rawmidi_name(struct
> > snd_ump_endpoint *ump)
> > {
> >     struct snd_rawmidi *rmidi = ump->legacy_rmidi;
> >
> > +    if (!rmidi)
> > +        return;
> >     snprintf(rmidi->name, sizeof(rmidi->name), "%.68s (MIDI 1.0)",
> >          ump->core.name);
> > }
> > ```
>
> Thanks for the report.  The suggested code change looks good.
> Could you submit a patch in the proper format for upstreaming
> (especially with your Signed-off-by tag)?
>
>
> thanks,
>
> Takashi

--0000000000000def68065a7a9192
Content-Type: application/x-patch; 
	name="0001-ALSA-ump-do-not-touch-legacy_rmidi-before-it-exists.patch"
Content-Disposition: attachment; 
	filename="0001-ALSA-ump-do-not-touch-legacy_rmidi-before-it-exists.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mtjqry7w0>
X-Attachment-Id: f_mtjqry7w0

RnJvbTogSWFuIDx1c3VwZXJnYXRlQGdtYWlsLmNvbT4KRGF0ZTogTW9uLCAzMSBBdWcgMjAyNiAx
NzowMDowMCArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIEFMU0E6IHVtcDogZG8gbm90IHRvdWNoIGxl
Z2FjeV9ybWlkaSBiZWZvcmUgaXQgZXhpc3RzCgpzbmRfdW1wX3BhcnNlX2VuZHBvaW50KCkgc2V0
cyB1bXAtPnBhcnNlZCBvbiBldmVyeSBleGl0LCBpbmNsdWRpbmcKZXJyb3IsIGJlZm9yZSB0aGUg
Y2FsbGVyIGF0dGFjaGVzIHRoZSBsZWdhY3kgcmF3bWlkaSBkZXZpY2UuCnVtcF9oYW5kbGVfZXBf
bmFtZV9tc2coKSB0aGVuIHRyZWF0cyBwYXJzZWQgYXMgImxlZ2FjeV9ybWlkaSBpcyBsaXZlIgph
bmQgY2FsbHMgdW1wX2xlZ2FjeV9zZXRfcmF3bWlkaV9uYW1lKCksIHdoaWNoIHNucHJpbnRmKClz
IGludG8KdW1wLT5sZWdhY3lfcm1pZGktPm5hbWUuIElmIGEgVU1QIHBhY2tldCBhcnJpdmVzIGlu
IHRoYXQgd2luZG93CihJUlEgcGF0aCBmcm9tIHNuZF91bXBfcmVjZWl2ZSksIGxlZ2FjeV9ybWlk
aSBpcyBzdGlsbCBOVUxMCihLQVNBTiBudWxsLXB0ci1kZXJlZiBpbiBzbnByaW50ZikuCgpHdWFy
ZCB0aGUgbGVnYWN5IGhlbHBlcnMuIHBhcnNlZCBvbmx5IG1lYW5zIGVuZHBvaW50IGluZm8gd2Fz
CnBhcnNlZCwgbm90IHRoYXQgbGVnYWN5X3JtaWRpIGV4aXN0cy4KCkZpeGVzOiAzN2UwZTE0MTI4
ZTAgKCJBTFNBOiB1bXA6IFN1cHBvcnQgVU1QIEVuZHBvaW50IGFuZCBGdW5jdGlvbiBCbG9jayBw
YXJzaW5nIikKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogSWFuIDx1
c3VwZXJnYXRlQGdtYWlsLmNvbT4KLS0tCmRpZmYgLS1naXQgYS9zb3VuZC9jb3JlL3VtcC5jIGIv
c291bmQvY29yZS91bXAuYwppbmRleCBkMTgzYzhhMDAwYmQuLjNkMWEyZWQzYjQ3NiAxMDA2NDQK
LS0tIGEvc291bmQvY29yZS91bXAuYworKysgYi9zb3VuZC9jb3JlL3VtcC5jCkBAIC0xMzM1LDYg
KzEzMzUsOCBAQCBzdGF0aWMgdm9pZCB1cGRhdGVfbGVnYWN5X25hbWVzKHN0cnVjdCBzbmRfdW1w
X2VuZHBvaW50ICp1bXApCiB7CiAJc3RydWN0IHNuZF9yYXdtaWRpICpybWlkaSA9IHVtcC0+bGVn
YWN5X3JtaWRpOwogCisJaWYgKCFybWlkaSkKKwkJcmV0dXJuOwogCXVwZGF0ZV9sZWdhY3lfc3Vi
c3RyZWFtcyh1bXAsIHJtaWRpLCBTTkRSVl9SQVdNSURJX1NUUkVBTV9JTlBVVCk7CiAJdXBkYXRl
X2xlZ2FjeV9zdWJzdHJlYW1zKHVtcCwgcm1pZGksIFNORFJWX1JBV01JRElfU1RSRUFNX09VVFBV
VCk7CiB9CkBAIC0xMzQzLDYgKzEzNDUsOCBAQCBzdGF0aWMgdm9pZCB1bXBfbGVnYWN5X3NldF9y
YXdtaWRpX25hbWUoc3RydWN0IHNuZF91bXBfZW5kcG9pbnQgKnVtcCkKIHsKIAlzdHJ1Y3Qgc25k
X3Jhd21pZGkgKnJtaWRpID0gdW1wLT5sZWdhY3lfcm1pZGk7CiAKKwlpZiAoIXJtaWRpKQorCQly
ZXR1cm47CiAJc25wcmludGYocm1pZGktPm5hbWUsIHNpemVvZihybWlkaS0+bmFtZSksICIlLjY4
cyAoTUlESSAxLjApIiwKIAkJIHVtcC0+Y29yZS5uYW1lKTsKIH0K
--0000000000000def68065a7a9192--
