Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C997C3B05B4;
	Tue, 29 Sep 2026 12:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684403; cv=none; b=edCnoMxFlxecT9aevUGOMQDeF6GmZOAQGoPEQL0WqvM6uVoQWedCmeoGNY4AglqdpsKOsLF7qxVQiOP/loEFOwZezzq6UKxHlNbh3S0015bBQT15mRLPaQOpr3p2BQYsufD5/PpOtaihcJlH6/wMh2aCkLjm3USiAAVIQQuAERI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684403; c=relaxed/simple;
	bh=n/PObq8y4QKZ7La60ohFOJhDJ+zGs/XOsvYoWIxEdO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HpIyMRsSYwin0z2ughCqaDlX36Ub5AzPPiDgSHH7fYa9pYbbRHc0XwZbIdckMp45laM1H7edi66EscxhENhfaPI4ABGGZjnKDDSCQi0//Qob7xm4/vW5X+tD1ACtkhTwB9L1dIwGf1jaVh1YzAK15EdkcGiou6or/oV3P3TZXF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=jan.lentfer@web.de header.b=ojM3XGsr; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=jan.lentfer@web.de header.b="ojM3XGsr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1790684390; x=1791289190; i=jan.lentfer@web.de;
	bh=iMmFJDIrrR9mUysZ28HLrw0wUL/nJB4u1SvqELe1oBY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ojM3XGsrvJBsWak6ENyFx+NCfQm04lWXh/JrOe7QM9UI+qJK7huh+uvtEGXi9yVy
	 SHcCgC3rpBVARgO1qvT1iMiZZnI6JmzDIzvDz6ZiCpZ6+dgp94HCTV4Po/SFV3nOW
	 4vRt1LnUCyCuPImC5v10DLVC31osjTqq/hWKD5QZsbj2yKjJi6p9oGkxmK9nJpdYB
	 S2gTB/Cc/7iXhgwDt+9bPOZhxUBOXX+iVidyH20hJw2V6vOdn8dZdPCJp0bSZtP2u
	 N1505yyFQ438pWfme5Lo+QuwB6Wjj+L4asxbCRXZHCYfE/ftd/AHQroTc3mBjhpeE
	 piyuQslmJTJ4oOS9Yw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MsJOq-1wr6Tv3GZe-00ypkn; Tue, 29
 Sep 2026 14:19:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by vm-mailsrv.lan.net (Postfix) with ESMTP id 1B753F133;
	Tue, 29 Sep 2026 14:19:49 +0200 (CEST)
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level:
Received: from vm-mailsrv.lan.net ([127.0.0.1])
	by localhost (vm-mailsrv.lan.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g9FQxqZH8wAd; Tue, 29 Sep 2026 14:19:46 +0200 (CEST)
Received: from [10.94.76.105] (ts-d20.lan.net [10.94.76.105])
	by vm-mailsrv.lan.net (Postfix) with ESMTPS id D3646F12B;
	Tue, 29 Sep 2026 14:19:45 +0200 (CEST)
Message-ID: <9e2b7315-6216-46cf-804d-f5a6cde5edb4@web.de>
Date: Tue, 29 Sep 2026 14:19:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: usb-audio: Apply boot quirk for some Behringer
 models
To: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20260929120309.1460348-1-tiwai@suse.de>
Content-Language: en-US
From: Jan Lentfer <jan.lentfer@web.de>
In-Reply-To: <20260929120309.1460348-1-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bN3NFtzvl0lBIcdeEaOTsaqnrKM/mRlugPAH+ZBt0mT0fSC6Sjf
 1xkmO+B3pFaMxU7gfYrU7NLadDpgL8jeoicpaGfqGyUXB9lsJV4du7Hutl7qBUpnN2vTB+e
 mzwnZNEVTzghgvlHwzRu02uqV9MCCjikEzeYlVF1iFZtLBPmV8fuNBBFsDDj5V86c62iaq6
 xx7EuvIM1fyzmK2gaHZEg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HxkTi5bsnzU=;vN6f0RlqBusHBXbfCKwwCxLCta2
 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

> Jan reported that a few Behringer devices became broken since the
> recent optimization to avoid usb_string() call at probe time at the
> commit b364a0d23cae ("ALSA: usb-audio: Use strings in struct usb_dev
> for manufacturer & co").  Interestingly, the devices seem requiring
> the explicit descriptor read at probing time, and the optimization
> above dropped it.
>
> There is already a boot quirk for another model, Behringer CM1A
> (1397:1234), that adds a device descriptor read, and this seems
> working for them, too.  So just apply the same boot quirk to those
> affected models:
>   - Behringer K-2 Mk II (1397:1230)
>   - Behringer Kobol Expander (1397:1249)
>   - Behringer 2-XM (1397:1256)
>
> Fixes: b364a0d23cae ("ALSA: usb-audio: Use strings in struct usb_dev for=
 manufacturer & co")
> Reported-and-tested-by: Jan Lentfer<jan.lentfer@web.de>
> Closes:https://lore.kernel.org/e7087d42-5e74-4d85-b1c5-b11eff235d41@web.=
de
> Signed-off-by: Takashi Iwai<tiwai@suse.de>
> ---
>   sound/usb/quirks.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> index 294c7026b93c..de6a82a42eb7 100644
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -1702,7 +1702,10 @@ int snd_usb_apply_boot_quirk_once(struct usb_devi=
ce *dev,
>   	switch (id) {
>   	case USB_ID(0x07fd, 0x0008): /* MOTU M Series, 1st hardware version *=
/
>   		return snd_usb_motu_m_series_boot_quirk(dev);
> +	case USB_ID(0x1397, 0x1230): /* Behringer K-2 Mk II */
>   	case USB_ID(0x1397, 0x1234): /* Behringer CM1A */
> +	case USB_ID(0x1397, 0x1249): /* Behringer Kobol Expander */
> +	case USB_ID(0x1397, 0x1256): /* Behringer 2-XM */
>   		return snd_usb_cm1a_boot_quirk(dev);
>   	}
>  =20
> --=20


Hi Takashi,

thanks a lot for the quick patch!

One thought on the scope: Behringer sells a large number of synths and
drum machines that seem to share the same USB-MIDI firmware platform
(the ones managed by their "SynthTribe" tool). The three models in the
patch are simply the ones I tested first. Meanwhile I checked another
one I own, the CAT (1397:1224): it shows exactly the same stall, and a
single GET_DESCRIPTOR(DEVICE) from userspace fixes it as well. With the
CM1A that makes five different 1397 products needing the same wake-up,
so I'd expect more models to be affected and to show up one by one.

Since the quirk is just one extra GET_DESCRIPTOR(DEVICE) at probe time,
which should be harmless for any USB device, would it make sense to
apply it to the whole vendor ID 0x1397 instead of individual product
IDs?

For reference, what I have seen so far (7.2.7/7.2.8, device hot-plugged,
no wake-up in place):

 =C2=A0 1397:1224=C2=A0 CAT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0stalls, fixed by GET_DESCRIPTOR(DEVICE)
 =C2=A0 1397:1230=C2=A0 K-2 MK II=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stalls,=
 fixed by GET_DESCRIPTOR(DEVICE)
 =C2=A0 1397:1249=C2=A0 Kobol Expander=C2=A0 =C2=A0 stalls
 =C2=A0 1397:1256=C2=A0 2-XM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 stalls
 =C2=A0 1397:125f=C2=A0 PRO 800=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi=
ne
 =C2=A0 1397:12a7=C2=A0 Grind=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0fine
 =C2=A0 26a0:0040=C2=A0 Neutron=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi=
ne (different vendor ID)

So it looks like an older firmware generation is affected and newer
models are not, but that's only a guess from these few devices.

Either way, a vendor-wide read would not hurt the ones that don't
need it.

Also, to be precise about the Tested-by: I verified the fix by issuing
the same GET_DESCRIPTOR(DEVICE) request from userspace, not with a
kernel carrying your patch. I'm happy to test the patch itself if you
want the tag to reflect that.

Thanks,
Jan

