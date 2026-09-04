Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC60A1465B4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 00:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788481106; cv=none; b=Gr9mQmRQMR9TSTG5wR4w2Ep3P/Muwi9CGkwiFTL+xnYrTzOo+lLgGGWBjN37LlSujTtsWpisj08aNtbIbljDVgcruaqe3fsCV4KL3LvMYHdp22mjdC+i1lkqm67DGBeWXiEZfGsMm8mbwRkCOZjWxnDLG4ntZWRS7Pcgr7my8oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788481106; c=relaxed/simple;
	bh=Y9qWNNOcmsXNVqzd+GFCwszjXpfdR4NAiC3qVQoR96c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=akr0ubV6VwLgd1eXGON4rAwUfD03lKdUnwNdHNnvOtdVl674S3/fg7QiPa/9J8ot8+S7AwrtSfm+CMeaTBAR5Nfv3bCOq4zO3hZz5PcXw0HTuBtyjTcY1kyUAd0VQkR3G8KWw2YuFHGxjSHI/BMw2PwKJMc6BlOM5adCX92bE7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o1S4Dpif; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o1S4Dpif"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c247f6687dcso60937666b.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 17:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788481103; x=1789085903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Pn1aEbcO0f3BAISnT6H9S3U4eX/tv1UuXBAlv+8tiE=;
        b=o1S4DpifDr4bTRVtiZk5YXl3YG/PtiKIomlo45hpnTWsJKI2F/cO7ihoXTtuIRFr3x
         YpPTqXFFifcHHXFSf3GFNPcvrFwHRKicf1k+AH3cTllNEIezNTuRvMKzR6oFfZjS+v40
         zNcLYzxv6RCS+sQV2DKCWahplkSW8g7GIXSneLxsW2eaH1tcKO2YKeC6WlqpUQ4go6KL
         Y9QxTCqKN6WiY6So/ZqW5WYXmGqfln5D+l3M0wHUvFXe8KRJEecaBI+AJ6FhXvuOyVZ9
         Yz6JTwR5iFdKpeQAqNG9nHx6ud+MMoB1hIfBiKooGwieuilNVeUJCKXGX1r+FyPbQOdF
         +/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788481103; x=1789085903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Pn1aEbcO0f3BAISnT6H9S3U4eX/tv1UuXBAlv+8tiE=;
        b=inzF5cHXtDtBsTe90w+XfCpfFyw07SHAFc9fABu8Zt3Dr14tXzahI2gLsee6gHffBi
         nBCnDvWLeb3Xj8+fv7uDwjTYyIIGUfyMAi0GHgpmHhYv3Za24MA6LDc9Li3t+T8Ju2ZS
         +hloP4FKefJAj3sx3tsDv2F/XcL38PRuli1QKaknoLPtme7+PjlzPbCrntQDOyZvYwqT
         C2vvBEmB/VbbjvK6M4U37P/waaCaq0W5D+6bVm/98g20Tqz4W7UhIz6tIgwtbBJvXiGi
         RlUAIWmDN3Zyh5p90z9Vz6ZA1CZ7MMt+LIhgMwx2f5b1iqx5+n31hVtDzJFzAKruYI/D
         g/dw==
X-Forwarded-Encrypted: i=1; AKwUvBzPCUsxdVnlrd2j3B1fYA37xuOW3puGTA3Qmw7I3KOd5kzEY65TO78j3nECH4Ir7f/4CmbPm5BU8j0RwL8=@vger.kernel.org
X-Gm-Message-State: AFuF++mNeceUfAtBTxaE+G5BAql8pbXyZ/EWaXmEJPA6ILwti+gphwmo
	X7LbodzivOvnXV95Ae8oREtf6AEsb/4tO22dSSF0mE5kRY3Y4W+0WASa
X-Gm-Gg: AYBFou0MzGMVUGxsHjew8Gni7H7SJ+U1UAxNT12zNyCfm0D+VP8yb2xm1B8qUqg4noY
	1LSJsWVKi1kjD9PQTse/j9Gyhlgzjowmr0wUmj5qp931jC6FhTTBvDwRF1zt1cmOP7fJd3VPHpe
	QJQdcux00m2525ivVvDEYkFd1qu1jxP5JvXyiCC4/oM3lS6K+o1tkOGGoxlw9hcyEIcT5peD3l5
	58H+6Gfw5IwUH96VCn2ZrAQXV6LLPcVKXjdTjiZP4b3e1rSDSnt+k3lXzZICwTjbvztEMOvUFPD
	p50t6+nOSBjWMFt0+GKrnoI7D/7P84SEMsYUr06/18DhTqho7b60fI8J+8QjYKnXPtZ1ohmGQJ3
	/OftJmMnaLKkDsNvzQ5AW/LPHnJNcvMTZxnRdu1F+lyScxNBf7Tp2fUcrSawbiTvNzFl1p2sopI
	SCjJT80dY4OYdnxhULqM9ySfArgsMwhxG7xgk23c/GeSzlr+o3FSh7Ry6i6ltjHo0OReT5D5oSR
	eSR8Qi46owREIPaj6DE4ZjXAT3ZEkV9F7oUz/wkhyrhiK51LAxUhssd4yFQ
X-Received: by 2002:a17:907:1c22:b0:c25:5a7:87f with SMTP id a640c23a62f3a-c260c448d9fmr121109866b.0.1788481102884;
        Thu, 03 Sep 2026 17:18:22 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d53e0b1sm31671066b.33.2026.09.03.17.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 17:18:21 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: tiwai@suse.de
Cc: tiwai@suse.com,
	perex@perex.cz,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-sound@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/2] ALSA: usb-audio: the Topping M62's vendor controls
Date: Fri,  4 Sep 2026 05:18:18 +0500
Message-ID: <20260904001818.66423-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87mrty8xf2.wl-tiwai@suse.de>
References: <87mrty8xf2.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 03 Sep 2026 12:02:57 +0200, Takashi Iwai wrote:
>
> Well, let's experiment the component stuff a bit.

I did, and it works. But while testing it I measured something that
undercuts the premise of the whole series, so that comes first and the
component question is at the bottom, where it now belongs.

**The card cannot be read. Not by this driver, and not by the vendor's
own application.**

Every version of this series has rested on one sentence, which is in
the v8 commit message: that a single write of 0x11/0x26 makes the
device announce its whole state, and that this is how the controls are
populated without caching what we wrote. That is wrong, and I am sorry
it stood for eight postings.

Six captures, on two operating systems.

Four with usbmon here: a cold start with the card powered down first,
an ordinary replug, a module unload and reload with the card left in
place, and one with every state restorer disabled -- alsa-restore and
alsa-state masked, the 90-alsa-restore udev rule symlinked to
/dev/null, wireplumber and pipewire stopped, asound.state moved aside.
That last one: thirty-one seconds, seventeen frames out, 2589 in,
every incoming frame a level meter. The 0x11/0x26 write elicited
nothing at all.

Two of the vendor's application on macOS. Its connect sequence is:

	0.000  OUT  0x11/0x01 = 1      handshake, device answers 3
	0.034  OUT  0x11/0x20 = 1      opens a bulk transaction
	 ...        149 writes         gains, mixer, EQ, routing
	1.070  OUT  0x11/0x20 = 0      closes it
	1.072  OUT  0x11/0x26 = 1
	1.074  OUT  0x11/0x24 = 1      subscribe, then every ~2 s

All 162 outgoing frames are writes. There is not one read. The
application never asks the card anything: it opens a transaction and
pushes its own stored workspace in, including every one of the nine
values this series exposes. And 0x11/0x26 goes out *after* the upload,
so whatever it is, it is not a request for state. I had it backwards.

The second macOS capture was taken deliberately. I set Mic-1 to 70
from the front panel here and confirmed it through the control; the
Mac had 50 stored. Forty milliseconds after connecting, the
application wrote 0x21/0x04 = 50 and the panel followed. That write is
the only mention of 0x21/0x04 anywhere in the capture.

So the plausible values in my earlier testing were the driver's own
writes coming back. topping_ctl_write() updates the cache before
sending, and alsactl restored the stored state within about 80 ms of
the bind on every plug. My asound.state held "value 28" for Mic-1, and
28 is what the control read for two days. Reload the module -- no
card-add uevent, so no restorer runs -- and it reads 0 while the panel
is plainly not at zero.

This is what the vendor told me in August: there is no read command.
They were describing their hardware accurately.

**How this differs from an ordinary card.**

An HDA codec keeps its amp values in registers and
snd_hda_codec_amp_read() asks for them; a UAC device answers GET_CUR.
Both drivers then cache, which is why a mixer control looks like plain
software state from the outside. The M62 remembers too -- better than
either, since it has a battery and survives being unplugged -- but
there is no way to ask it. The cache has nothing to start from, so it
starts from zero.

That is not merely inaccurate. The output volumes use a TLV whose
index 0 is DB_GAIN_MUTE and whose index 99 is the top of the scale, so
the driver can report "muted" for a card sitting at maximum. The input
gains are no better in kind: this card is bought for measurement, and
a preamplifier reading 28 while the hardware is at 70 makes every
number taken through it wrong, quietly and later.

The two source selectors are worse than either, because a wrong one is
silent rather than loud. If the headphone output is pointed at Mix A
and the host plays into Playback 1/2, nothing comes out and nothing
says why: the card is playing correctly, from a source no one is
feeding. No log line, no error, no clue short of reading the panel.
The vendor application writes 0x64/0x02 on connect for exactly this
reason.

**What I think the answer is.**

There is no "do nothing" option: publishing a control at all makes
alsactl store and restore it, so the driver imposes state on the card
whether it means to or not.

While looking for a convention I found that usb-audio already has one
for this, in mixer.c:

	/* forcibly initialize the current mixer value; if GET_CUR fails,
	 * set to the minimum as default
	 */
	static void init_cur_mix_raw(...)
	{
		err = snd_usb_get_cur_mix_value(cval, ch, idx, &val);
		if (!err)
			return;
		...
		snd_usb_set_cur_mix_value(cval, ch, idx, cval->min);
	}

If a device will not answer GET_CUR -- and there is a get_cur_broken
flag and a check_mixer_get_cur() that detects it -- the mixer writes
the minimum and caches that. It does not display an unverified number
and it does not make the control write-only. The reported value is
true because the driver made it true, and safe because the minimum is
the safe end.

That is what I would like to do here: write the minimum to all seven
gains and volumes at bind, and cache it. alsactl restore then puts the
user's stored values over the top a moment later, exactly as it does
for any other card. A hand-set panel value is lost on connect, which
is a real cost -- but the vendor's own application already destroys it,
with its stored value rather than the minimum.

The selectors do not fit that shape, since their minimum is the
"Unknown" item and writing it is a no-op. Either the driver picks a
sensible default source at bind, and takes over routing the user may
have set deliberately, or it leaves them alone and the card can be
silent for reasons nothing on the host can explain. I do not have a
good answer and would rather be told.

So: is init_cur_mix_raw()'s behaviour the right precedent to follow
for a vendor protocol that has no read at all, rather than only a
broken GET_CUR? And what would you do about the selectors?

**The component experiment**, briefly. It works. The master goes up
from snd_topping_init() inside snd_usb_create_mixer(), so on an
ordinary plug the bind is synchronous and the controls exist before
try_to_register_card() -- the same ordering as v8, and the restore
timing worry does not bite there. From HID probe to component bind:
54 to 57 ms across five replugs. Only a module reload onto a live card
adds controls after registration, and there a desktop mixer does not
follow the renumbered elements until wireplumber is restarted.

I will hold the prototype until the above is settled, because the
answer decides what these controls are.

-- 
Mikhail
