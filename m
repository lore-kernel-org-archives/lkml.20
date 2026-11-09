Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794260630;
	b=uNh4KD9fiK1X0jMvOqCWVim710bOI/C0FQSrRP/20se2CcDrozDCO26Hq3eINC63nBne
	 21HC7k73zXPM7g+sgDiCF/U7MUOYmZEqsUhf2GaFcoMJw6iQdqDDX3As9a4EQt0bI4sLx
	 5xMHeyvqoJOO3AOc8hsCE0E9Hbm2UHE8fnhWlNoWpy+H+uz7GmjnNHPK9D6pb1kDtzFen
	 Y5i1V7YDIqmfj65K91kG4O1PX2ES06CA3qyoTY3s7uQ7C2+qVy9Q3DKLjN5eMtYwIxSBL
	 WnmYBsprt5/O2RsfEWX1oxS+TG52e9OaSBIIVw9Ytj9DMR/9LcyRqqXpuBh3/dCY+zg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794260630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=G2vwAcJqTKKEqvGFYxAWQxtL9vT8JY6vkPmKAMLbJO4=;
	b=Kul1pDjIUuV2olIpuga2uqf1Jy39YLTdgNLQv6Ag0uDE2qX2jmdg6/cuWymosdrT59Nq
	 aBoffu3CyOdQB8KkVASW+yqQ8CvgW90YkoJGzYljvApmjF45GewncgpXVtRaLXGq5BsW3
	 +kZ5GtHHa2QlAzmG2bXgf6vZXnK4qGLIDjFa+0J24dGxRWoW2Pw2fcWTV2FIekc3YG776
	 Ykpdz6v8jHfgJ50ssnc0OBd1CqpTT0KQEbrDxFKqRVEy+34enSYidWbxZre19mNou98JL
	 11pjf7tIr47J5ad9pB5OvCMHWxbb7i6UG6qYO/K4rAOMwWEjsZjRFhQViFA6JImPGCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WJcQpiJO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87211606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87211606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WJcQpiJO
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b0d126f631so13971477b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:43:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794260629; cv=none;
        d=google.com; s=arc-20260327;
        b=Le6LhXAKoEjnT0BhNVBxlwzZ1w81QoEfd7+r+X46joqRQZmDkqtvX0BQbjwsuhu5h0
         lqEDZbZfxwWrkQFtmV/EhXIksyBF+lZL7khKmdWMOSk11UjyFEZEGq4aVCHqC0cVUAAa
         ApvvfYwXB9HB50/peuqTWBgqNsbd2k0W1z4T56dztnf+fHSokXEnUS2jTH0SRx75O/NV
         mEqWZSt12sRdIEqzEsAA9g0l87e1xKS2d8UoYvqNoZw/x+IqNORmSg8c0//kw+/RwMrY
         8vfUIWNNOz3XLapMsBN04Ga9/SLwBo6K7KqBRrI/BjRJLJMHxXECzOWIaJUBUIBC2avq
         LRwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=G2vwAcJqTKKEqvGFYxAWQxtL9vT8JY6vkPmKAMLbJO4=;
        fh=dESSlk79wk5nvThbmJlCL83zcVt3ngihwRDaS1a3vm8=;
        b=TZCC+9VlBQZMA4sgIzpKyEgdPtouUS5aHKR6e8ni5cICde0qgtUgTYVTTS+b4tGdl4
         a6JCRALSa4lgxpkOrc7t+9Wyin0FuTJk6sDEyroff9LLNWjKuwsOSCmlR6UcN77V0WzH
         yTKZrT7Qz2M6scaq7XQoUKu6YFHWmTOxBxCYv8KMHuMIslHbVwFedl2ZePqFRIDyMaq9
         x57Cu8KCfgvCFrMWX91OvijyfUIv2w7CQ30yHWJ+OxFp9TF+K2ui1sd5y1jT/0mhDglV
         h+rnNLyEMam8tWu9ERm8gPLbj32ufG2LFhS8yaIuhzi3H2v/6oLFMK4jHZyq6ujKwIsg
         PHJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794260629; x=1794865429; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G2vwAcJqTKKEqvGFYxAWQxtL9vT8JY6vkPmKAMLbJO4=;
        b=WJcQpiJO7KzYY/ht6wdkhsftwn5dnvgdrYd0UrlybNCFKmFBiGwV83HSSer32xanMA
         7Tt/IYjirbJZpe44bSPbKQEym90QjnW4VEVTZY89KABgS+HWaB5rW2vyxFSsYKtRa0R8
         6X5cSCEQcrydY6c4uOlb7MUJnekMbeV8Rukj3XJ0JCeSoavCCcYJXbtU04Zx6Aw9O2ch
         jfiaOtbHbp0A2y5RV1tf4ZZZ7KaYNomMYTtotVRYqKo2/kLjESLMfJyP5WHIkoB8pYuC
         fiR4FJWCbvOQ1l2yWrFUyPvO8XIiLXi+24zy3UWZ28AkTd5vB4V/VBFpzWERfGW+HlEr
         QpzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794260629; x=1794865429;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G2vwAcJqTKKEqvGFYxAWQxtL9vT8JY6vkPmKAMLbJO4=;
        b=hIB0/IUzdWkjjYa2ddRE9aGDwhnOvkKdMKHv2Ca7N3R2nCxRZf72QicKey8klzsFHv
         mpQPyqNH0jsAmYxdXqNO3Wzg4lZYdTRoHssqwsB/TD3nomuvVGKtL39ux6YM4wjG6hvq
         CiDojOm7w24bURim7rO+SPJUSSO9uhkt6K1EErGOmL7qCDZurQ39YJdPQvQUrkm+IVj4
         3P0BrdXO3BJaCSYWL5rVz5JhLFy6TlbZ0bEONsNDQB34rR8p0iJncFuxMzubbxcwtW+F
         p1FjB60ZzEEaeZHni266RmHMXqOIXq7rLk6q5pZGXuc792qJPODA6yTO/jEZWQN/Ose5
         VzWg==
X-Forwarded-Encrypted: i=1; AL+hErE8EDKtDj7cZ+76d2vI0MlUWC7pK+mrT2+NPp4c5y7U5eCUkolY24jd43UFL8HIoOO0+Tux49agz1KEwVs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8ZpW6rgVeZxWzlY5SOxNnXuug2UzOryKj8iTVECijku4ZLsKh
	EUOQjZP5kz9nekrxHyCtGatE+1dIULCXEbbQv/f04dufWFsViSX2katD0eRDMokwANI3y8y+CtI
	PbEXt1vPFt9wi1tFGrijUtC5zJVKl0s6E4n5g7BAMaW4r
X-Gm-Gg: AYBFou3Xp1TU5vpir7v+qDLKPPoacyhc6g0O41oYEOwz7sAWvZQeDmMaWjIK69rF8a8
	2G/gyeeSP8WOlEbcgkdFjpDLz4//Y/YPQ9I2zrMW9ujY4tkD1auaB7fd/YtMhUSRhSiQJdwxYBh
	fGcVbcpUedIX8ghcbLkV4gNtQCsS4WX0xzm4g+Y2b5HfDfY6GWai9+AvzkI+tcMZC1ulsYAAxUK
	OJ9H/njbISFl6DXmKOJMDshYdtUfFZKWQoYsZPbxVvG12eqyoLJdyx8YYr/0ypxA/BXZzE9lNNf
	rs6RD6Ba8JO1cuG3QCJo6FzLRK1IDbrdS4P5IMREiqJHXqQO89zJmKaEJDc/zSPNMuUIhAgE4TE
	UZlLRLiekqS0Jo1pvQzrUX1BwDZR/IN8vrkYvpR1NzUzKMPa0MzgEQBzD4fijliw5pS76/w==
X-Received: by 2002:a05:690e:4388:b0:679:ab13:5528 with SMTP id
 956f58d0204a3-67c567510e7mr448932d50.22.1794260629432; Mon, 09 Nov 2026
 13:43:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109061103.2887636-1-dmitry.torokhov@gmail.com>
In-Reply-To: <20261109061103.2887636-1-dmitry.torokhov@gmail.com>
From: Gideon Heinz <gideonheinz02@gmail.com>
Date: Mon, 9 Nov 2026 22:43:38 +0100
X-Gm-Features: AclHuK-EpGApq8Fk1oG1-gcE3eKmJaG4COIpgR8xEwO4spWMBWuAFHHjNAuhoJw
Message-ID: <CAPb1+K1w=FDwXoGsvXQn4StJNFYHQK8gq+HUsv=Uu7VWwwPqiw@mail.gmail.com>
Subject: Re: [PATCH 00/18] HID: logitech-hidpp: G920 force-feedback fixes,
 rework, and cleanups
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	=?UTF-8?Q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
	Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, Edwin Velds <e.velds@gmail.com>, 
	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dmitry,

I tested the full 18-patch series on my G920 (046d:c262) as you asked.
Everything on your list works for me, details below.

Setup: Linux 7.3.1-1-cachyos (clang build). The series applies cleanly
to v7.3's hid-logitech-hidpp.c (the pre-image blob of patch 1 matches),
so I built only that file as an out-of-tree module with all 18 patches
applied, against the 7.3.1 headers, and loaded it with insmod. No full
kernel build.

Results:

 - Initialization: "Force feedback support loaded (firmware release
   4)" on every plug-in (7 in total), followed by the input node and
   "HID++ 4.2 device connected". No -110.

 - fftest: all effect types are listed, uploads are OK, and the
   constant effect plays and produces force. After exiting with -1 the
   log stays clean for 2+ minutes. With only your earlier two-line init
   fix, the same exit produced "Failed to send command to device!"
   about 15 s later, so the drain-before-close change fixes that for me.

 - range sysfs: with evtest holding the device open, writing 540 and
   then 900 reads back 540 and 900 and returns instantly. With nothing
   holding the device open, writes stall as you described: I got two
   "Failed to send command to device!" lines 15.36 s apart (22:06:16
   and 22:06:32). I believe they come from two range writes I did with
   the device closed, but I ran those before starting that log, so I
   can't tie them to a timestamp.

 - Input: evtest shows the wheel axis, hat, buttons and the full FF
   capability list, and everything responds. I use other pedals, so the
   G920 pedals are untested.

 - Replug x4: "Unloading HID++ force feedback" then a normal reload
   each time, nothing else in dmesg.

 - Unplug while evtest had the device open: "Unloading HID++ force
   feedback" about 17 ms after "USB disconnect", nothing else in dmesg.

 - Unplug while fftest had the device open (6 effects loaded): 12
   "Failed to send command to device!" lines within 25 us of each
   other, about 0.3 ms after "USB disconnect", i.e. they fail
   immediately without the 3 x 5 s retries. "Unloading HID++ force
   feedback" follows 17 ms later. No warnings, oops, call traces or
   hangs in the full kernel log. After I plugged the wheel back in, FF
   loaded normally.

Not tested: in-game FFB with the series, driver unbind or module
unload with effects loaded (the case you said is still open), and the
G920 pedals.

Happy to test follow-ups, and I can send the full logs if useful.

Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
