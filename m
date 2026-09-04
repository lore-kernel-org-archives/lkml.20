Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACB846A5F2
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521179; cv=none; b=NS4hH4moAKWtCNU2LLktRtjsv+2OUKABFFyBindmtJoPZKjkx2f/dvNyjpwrnDDBSJf6tXQUP8ozL2GmvuNQoJ6F9VEVIqdLxYXNnwoj+DfW170072K2n2bMgLUXOLKR6whMPwSrJy8mp63+M5dCVKcsbN31MIusnNQGtRJZgXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521179; c=relaxed/simple;
	bh=CQzOS+rZGbncjCLOFoQoiDEmny0rCYJyS6C1FLbJGSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PfYtlU3sTJi5rjwqnFCAFf9xxkYA00Es9iwrkBAAPrXqSvcjgCOIh9DzO2+ZuUuSc1GiFph1Zhp1erYKKNwoT4Az+kSTKd4zp/p961jm5Lo10Aalm4sNCa5NcYqBRjPj6dXuM2RoxjvujK2+D9RF5qTqFgUS7csRKoQii9P/MeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UEz4sbH/; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UEz4sbH/"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b28c91fba5so1162345e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521175; x=1789125975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U4aY3uNjbAyDvlcOheeRnD6wUmUcErbQzc0yYkJMYFI=;
        b=UEz4sbH/yqum3LecnBzPBK8LlibxKwCAc3cLPBfUeh3jG8rTCUPe7pIAlgkW7fJ2ZM
         k+O85RZ8S3AtgUnWWvsMG5CmcMfpJIFIl7hPyshL2urD82sNfTizlQBVT/1H5f9JEl31
         h8/ePJgP4mm+yPLBukYF1G/D1mlNLmqmraMgHBCL50P69JJChZFZDVuV5u4vYg1vCWYP
         9dAo7g7OttHI4o0ChN+B6treHWRb7NZuACWBq2qpCahX11mgIrTC9IzepgGnwsIEGI/p
         xxcoZ4wn4WYQTrG+Lzx3m7cXtCsNULCJTu3CKdHnFIGAO4A5/nhCNgiFLg32g9Cm3Ifg
         U6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521175; x=1789125975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U4aY3uNjbAyDvlcOheeRnD6wUmUcErbQzc0yYkJMYFI=;
        b=nbW6MfAg7SnvyQaQULpuGr46FtbwqZJ2BA/I63XqdGZ2GnAS5Bg9aaEbQPZukUMXvd
         1PBfUB+v5IfZMgGQh4JCFEbVX2+eqO7lsTNuyMOTRKLFKFiVxS55q3YZdwqVFEofjvRq
         qsoQOA6IXLYX9zcpoVo13UIqUxerTAmBWBVMjWtANjwn1g8edCMdEQRq20vwf7shk+nD
         E2C1uGOM9hCU6NrXF401QL7sbVtp/Az8y5yVEjrE7WkCH8VqBnIDa7aMgmijNF3bkQuE
         Ne5WihNUngRzs8cmFJU01cK8vVI53qYdqIhZXHIbqL/FBXWzyPxpq2G0ym7v7X5fNkw/
         zlwQ==
X-Forwarded-Encrypted: i=1; AKwUvBysH8SlgSYsID5rKMd/StHcbMuOHNYhl2QaN4I12OzzEOyd27QTpSjsLSoZqE6xkEYglTX4UCzvFceOQf4=@vger.kernel.org
X-Gm-Message-State: AFuF++nIR/iF6HXULc1fZjJeQvpkQqu1/TkV46FSDncyZGm9BjpBkugH
	2JUYpjHMfi9s0EUjWJj4k3P2hfV+i1/KH6FZnfs9g61AuynvZkgfkm9s
X-Gm-Gg: AYBFou2ZuNSKxOdB+EFx4NeVbqGFwcmD+5LBuR+1MH6U42pWuhxrgbZ+Q81N8RUrBvP
	A0IlbeB1GqSxmF4QARB/t8l2a0c7uzN5cG6FAYgCyii7EUfKp63AcD1t1bB9aNcJDKbrP4OWvDE
	NWzBa28up4w77f/dqZ4XYoEe092NZkTB+5tcMkp2n2QS/2z1cOgKrjmj2dPGy8x1uQ60fOO/LG1
	mL0i63uYT5V3zuDD7cxUpSb5WtrHRVbTOs7ycHKrr1M/fDCYihM9A1+SeAQRYJI6U5oIYNSpJM0
	7AlwAKWJsYeMLjggQ0n+wDBJ9pazuxPG6mmrCTbkdze8MkWNPA3p83Ff7hydI+8N+ac06XsFrLq
	MV8M9+ylbyGUSXPbGoWZjXshLx404mD8iaB2jM2xSqZej+kwLmrDBM2iNlvMv0A351xgWoAkfUJ
	QhgUTc3yz+wTQ6dlofciNostPCWrYaCwCFidRtrH3bVihr8LtSSqO1qurXLZMU44sWUqL7zhqiV
	2WuuvjySzq2oH62yN7Z+jFgXwcG3lJYpfvsUYy15QUGf57I/3yObm4J9Fng
X-Received: by 2002:a05:6512:6d3:b0:5b6:10bc:b864 with SMTP id 2adb3069b0e04-5b61769bbddmr802323e87.18.1788521174292;
        Fri, 04 Sep 2026 04:26:14 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b61669aedesm478911e87.10.2026.09.04.04.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:26:13 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: tiwai@suse.de
Cc: tiwai@suse.com,
	perex@perex.cz,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-sound@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [RFC PATCH 0/2] the Topping M62's vendor controls, on the component framework
Date: Fri,  4 Sep 2026 16:26:08 +0500
Message-ID: <20260904112610.3286659-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904070530.195389-1-mikhail.v.gavrilov@gmail.com>
References: <20260904070530.195389-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the experiment Takashi suggested in the v8 thread: an
individual HID driver joined to snd-usb-audio through the component
framework, instead of a mixer quirk that claims the HID interface for
itself. It is posted as an RFC rather than as v9 because v8 is not
withdrawn -- it remains the alternative, and the choice between the two
is the question this series exists to answer.

I said this morning that I would hold this until the questions in that
thread were answered. I am sending it anyway, because a patch gets a
better answer than a question does, and because the last of those
questions answered itself: the correction I sent a few hours ago
proposed deferring the controls until the card reports, and working out
how that lands in code showed why it cannot -- which is in the section
below. The only question still genuinely open is the HID one, and it
touches one line.

What the shape buys, measured rather than argued:

  - card.c is not touched at all. The v8 series had to add
    snd_usb_claim_iface() and snd_usb_release_iface() there, and had a
    defect I reported separately: an interface claimed and marked
    USB_AUDIO_IFACE_UNUSED never gets told to wind down, because
    usb_audio_disconnect() returns at its first line. With no claim
    there is no such interface and the defect has nothing to attach
    to. Watching the wire with usbmon: unbind the audio interface and
    the keepalive stops. In v8 it kept going.

  - the hid_ignore_list entry goes away, so hidraw stays available.
    That matters because five of the card's functions -- the mixer
    matrix, the mutes, the loopback routing, the input power and the
    EQ -- are reachable only through the vendor protocol, and v8 made
    them unreachable from userspace as the price of the quirk.

  - two M62s on one host bind to their own cards. The match is by
    descent from the shared USB device, and it holds: gains set on one
    do not appear on the other, and unplugging one leaves the other's
    controls in place. The quirk road could not be tested for this at
    all.

On the timing worry from that thread: it does not bite on an ordinary
plug. The master goes up from snd_topping_init() inside
snd_usb_create_mixer(), so the bind is synchronous and the controls
exist before try_to_register_card() -- the same ordering as v8. From
HID probe to component bind, 54 to 57 ms across five replugs. Only a
module reload onto a live card adds controls after registration, and
there a desktop mixer does not follow the renumbered elements until
wireplumber is restarted. That is a real wart and I have not found a
way around it that is worth the code.

  What the card does and does not report
  --------------------------------------

I got this wrong twice in the v8 thread and would rather state it
plainly here, since the design follows from it.

After a subscribe the card reports itself in two waves: jacks at about
0.9 s, then at about 5.2 s the jacks again plus the output mutes plus
the gain of every input whose jack is present. Every turn of a
front-panel knob is reported as it happens, gains and output volumes
alike. What is never reported is a source selector, because the card
reports events and a selector has no front-panel control, so no event
can exist; and an output volume before anyone has touched it, because
it is a setting rather than a physical fact.

So five of the nine controls have a source of truth on the card, two
have one only after a hand moves them, and two never do.

That looked at first like an argument for deferring the controls until
the first report lands, so that a value read at connect would be the
panel's rather than something restored over it. I have not done that,
and here is why: alsactl restores once, at card add, and does not
come back for elements that appear later. Deferring would therefore
trade an accurate value for five controls against no restore at all
for nine, and would wait forever for an input with nothing plugged
into it -- which on a five-input card is the normal case.
The controls are published at bind, as in v8, and the value at
connect is the restored one.

  Open question, not blocking the review
  --------------------------------------

hid_hw_open() sets intf->needs_remote_wakeup, and usbhid offers no way
to take input reports without it. This card does not advertise remote
wakeup (bmAttributes 0xc0, no power/wakeup node), so that forbids
runtime suspend to the whole device -- undoing something an earlier
revision of the v8 series had to fix. The driver clears the flag after
opening, with a comment saying so, because it resynchronises on resume
and has no use for a device-initiated wakeup. Jiri and Benjamin have
been asked whether that is acceptable or whether usbhid should offer
something; the question is in the same thread and unanswered. If the
answer is that the clear must go, HID_CONNECT_DRIVER replaces
HID_CONNECT_HIDRAW and the hidraw node goes with it.

  Tested
  ------

Fedora, 7.2.0-rc1 plus this series, KASAN, PROVE_LOCKING, UBSAN and
kmemleak enabled. One M62, firmware V87.05.45.48.27, and a second of
the same for the two-card test.

All nine controls read and written from amixer and from the front
panel, values cross-checked against the panel. Module load and unload
against a live card, audio-side unbind and rebind, unplug while
playing and while writing in a loop, and fifty cycles of module
load/unload with kmemleak scanned afterwards: no splat, no leak.
System suspend and resume, with the selectors written back on resume
as they must be. Two cards on one host.

Not tested: hibernate and the reset_resume path; a card whose battery
has run down; anything on a big-endian host.

  Ordering
  --------

The HID driver comes first. Between the two patches it binds, speaks
to the card and creates no controls, which is harmless; the reverse
order leaves a master that never matches, which is equally harmless
but leaves hid-generic making a bogus input device out of the
descriptor in the meantime.

Mikhail Gavrilov (2):
  HID: topping-m62: driver for the M62's vendor controls
  ALSA: usb-audio: bind the Topping M62's vendor controls

 MAINTAINERS                   |   9 +
 drivers/hid/Kconfig           |  19 +
 drivers/hid/Makefile          |   1 +
 drivers/hid/hid-ids.h         |   3 +
 drivers/hid/hid-quirks.c      |   3 +
 drivers/hid/hid-topping-m62.c | 855 ++++++++++++++++++++++++++++++++++
 sound/usb/Makefile            |   1 +
 sound/usb/mixer_quirks.c      |   5 +
 sound/usb/mixer_topping.c     | 173 +++++++
 sound/usb/mixer_topping.h     |   7 +
 10 files changed, 1076 insertions(+)
 create mode 100644 drivers/hid/hid-topping-m62.c
 create mode 100644 sound/usb/mixer_topping.c
 create mode 100644 sound/usb/mixer_topping.h

-- 
2.55.0

