Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794142082;
	b=KW0OXDnR3eab2qVgMhnIkIkGxJdsQzytp8swQF72FF0AdUHepxhtb81r1mdYYiF7kQbv
	 CZ0mpUu3r3S+KDmxhnc7NjsZqQRHsVCgnj6JxNq3PPRT1TYgmsAvz9oFlYRhwa1h5EFal
	 ElR9DkmI5w/+/nUsmDBboEFwOcuoID3YZiG+0OWLWinzWFfI0oqH6ra9RVIzFDEojfLiV
	 iElQyTO9RJCoyUl0HaNRlgzahNNMmq3f/KUC0ni8NpYO1PErUgASmmzd96JHTNN63HJWr
	 Bbf1/okxLNbNGhrRa2mbUpuxsbABH8rlFZG9FuWV0tsdUuy+VpBkdJfx/m4HTlY9VrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794142082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HALBGx9+QGwJF3ZwdYwT3GIkAgbteVKYnULFptYFeu0=;
	b=JjTOI9DaRVmiGXEhhAaF+RPn/y1as0bwFYq2YMwtSUahD00ioHSc/RAUGXU4i4L00oH1
	 4wG4feH3+R2bRQUtEcA2/Z7trcoFtbc1dlhtwbeo5WCg/IjT4DXwjz8zaj7xi0luvSyHQ
	 GRGaQfGGnuBoyjgCYU1Vy7DmCzYKLI28JvpTQVS8d+vR5amKI7rtuioWt9QZu0K9R1liw
	 AYXwciLkLQ5tY7+SAP5Wxx21Y9ElJc5W4i8PGmbO0j/ScF++RKtjHegp4QtULIlmy1pnK
	 wfvKWcTQ5m+KOPJa6W739MDLBzIOz3+OuEKVxhoNUv9bZCOfscDqBfqHkAGNWxU5gXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FspUKeLM;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8717E606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 12:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8717E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FspUKeLM
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36dbde64409so140436eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 04:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794142081; x=1794746881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HALBGx9+QGwJF3ZwdYwT3GIkAgbteVKYnULFptYFeu0=;
        b=FspUKeLMakU+lwNFCrjm0VS3yCkD+doTRUQPyoLA3SDIDH5gErjoYFpK3HR4sSdZ3s
         shpwdH6K39Z2KVV3at+msv4dcgv+ku85JXDyjwl6lFDS/Cnpjw/6zDJlpiKa07KaNuUI
         w1gJ+fBKnyDtctO1pR9kKBQd5p67qPefABdSEDY/DkNXMHAIUqBAUKenPlVtjxZ3E1ha
         Il0tWWSsyOIcN0HjcBNWJNxMXgN/aDFGihBBpcDue1IDtHxhrVRGQjJs3cNLVtU6JKPh
         8+2Njt3Ez+Y4s66ZMvERmx67jkptfZAccf50+uvMu0EWbgojE4xr9W8UAEaRKqsPkfyo
         /GDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794142081; x=1794746881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HALBGx9+QGwJF3ZwdYwT3GIkAgbteVKYnULFptYFeu0=;
        b=0Su9aKDCUKAK41zlNdAOtdiLO8RWvNPl1rZK4kER8MK4ATeGNIjNBTfDqvzQ0zGP0H
         mqhdOzZAbzZH4xBZ57cgkUgG0enAo+/qZ8lYtGvAYRd6LxEyNKQTo7q9NHJzzjJYPg9W
         dgpCa0Mw9vApHnX7FI89KYhFJugPgtOKtDTJX/VFyFcD9r6Ta0n0QgVb01MBc8vnSOT3
         DlGzSAzsx5DFSIZc11GwHVWX20em8LN4qx29KPRS54uABZ/Silvf6AVfcqRSFczmmih3
         DWkgO2Azm1ZZ2lIVsx9dtLKonqdAuRZ8UQJQlU0KfihBmdkirA/nkRZKopMg/atBkOPX
         1pYw==
X-Forwarded-Encrypted: i=1; AL+hErHlS+BM7eCJ5hlWK1dW+ijfqVkzxQUD7xfqsHaYAwfwRBBer6IhmAfkJcv8FLNmew7bg3oX8n6jW/QFLO8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NzEtyQvqMsW2nipLMppMJk0/PWLekSDPTox+b416Ik5Ujjxoo
	81uZe9VrZxT0MQUBgZn5bBXc+34aSSKmyV2OLxiZYriFXozY4IXcYu1X
X-Gm-Gg: AYBFou36+ZA99ACZKWxHZ871FwE2a0tjD4pgnHU3VY94O2qIOilAUqcmTXtxhsmryhz
	aMs4N6B167EHffZ3bWRu6wZZq8roKjlPvF/aJYDK1n1Ee/+Bdm2yk/YHrYSlyWSW+Auh55FcvTP
	IUNkBT5tWMz/8CIBxcP33YeD8Pi6sW9QTrlowdJluhT+nd8PF0zqM1dr9s6YQrBHjwDCIwkz//E
	z65UUYFVilL/p9bHYTFS0dnLazG9JpRgMVMRbhC1ZA8qrA31WZKnVD5Ap82pBcM8WTnUx37TlLs
	JSAkmHrCt5wmtqZV8yC3mrBfNXUuZld17tZ6ot1aD11R+5MLc41Lp5InWhRdkyc3qpHmwnxhayn
	HWMyqSepCetgZoFwIZavUFXcNNLKvsbV7wZgQRnfU2Q8RUL3ECpm6O9XESNOqEt8FUnHt8+t7xf
	LfzUVxp9d456AVEQAmrteBTMpYGVvUjcMov7cAy4c2PuwRcOv+OvkA96MtXRWbKlOceA8V87hny
	uVzif6D+StNwG9lsZNHUuqWG6tnl0FNChE8Fui/xIZa73lUR2hZLsnzD81P1NzYrQ9sSexIgC0h
	pu2rfJMzY50KnBxvGXnOnD1ePCY+fahD0g3UltgZ5797SNTLCN4EMOUwV56jet1JCxg7LW8TBp4
	pPqimgvVaqPL/LliZ5KqkVLQTsf7OB9ou/Pn2Lt9+
X-Received: by 2002:a05:693c:69d4:b0:36c:9fa4:dc5b with SMTP id 5a478bee46e88-3725807c474mr3078721eec.23.1794142079510;
        Sun, 08 Nov 2026 04:47:59 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265619774sm5623975eec.8.2026.11.08.04.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 04:47:58 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Alyandra Zahran Nadhir <alyandra5b@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 0/4] ALSA: ump: Fix RPN/NRPN handling at MIDI 1.0 CC conversion
Date: Sun,  8 Nov 2026 21:47:47 +0900
Message-ID: <cover.1794141913.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Hello Takashi,

As you asked in [1], this puts Alyandra's selector fix and my fixes for
the other RPN/NRPN cases into one series, for both the UMP core
converter and the sequencer.

Patches 1 and 2 are Alyandra's [2], without the KUnit test. Selecting
an RPN now clears the NRPN selection and vice versa. Patches 3 and 4
keep the selection after a send and clear only the data, drop data when
nothing is selected, and handle a Null NRPN like a Null RPN.

What a MIDI 2.0 receiver gets, before and after the series:

  Input                                    Before             After
  Null RPN, Data Entry, select RPN 0/1     RPN 0/0 = 0x40     nothing
  Data Entry, select RPN 0/1               RPN 0/0 = 0x40     nothing
  RPN 0/2 + data, data again, RPN 0/1      0/2, then 0/0      0/2, 0/2
  Null RPN, Data Entry, select NRPN 0/5    NRPN 0/0 = 0x40    nothing
  select RPN 0/0, NRPN 1/2 + data          RPN 0/0            NRPN 1/2
  Null NRPN, Data Entry                    NRPN 127/127       nothing
  select RPN 0/127, Null RPN, data         RPN 0/127          nothing
  RPN 0/1 + data, CC 38, select RPN 0/2    0/1, then 0/0      0/1, 0/1
  RPN 1/1 + data, RPN LSB 2, data          1/1, then 0/2      1/1, 1/2
  Null RPN, RPN MSB 5, data                RPN 5/0            RPN 5/127
  RPN 0/1 + data (unchanged)               RPN 0/1            RPN 0/1

The 0/127 row and the last two changes come from holding the RPN/NRPN
numbers, as a MIDI 1.0 receiver does.

I checked the core converter with a local KUnit test over 35 input
sequences. The 17 that changed are all of the kinds above, and the
others give the same packets as before. The sequencer side was run
with a legacy client sending CC and CONTROL14 events to a MIDI 2.0
client on a patched kernel under qemu. That test will become the
selftest, with Alyandra's cases added, as a separate patch.

Two cases are left as they were. A CC 6 alone waits for a CC 38 or
the next CC 98 to 101, so a second CC 6 replaces the first instead of
sending it. A CC 38 alone after a send waits the same way, and when
the next CC 98 to 101 flushes it, it still goes out with MSB 0, now
under the kept selection. Changing those would be a separate patch.

[1] https://lore.kernel.org/all/878q33y4z4.wl-tiwai@suse.de/
[2] https://lore.kernel.org/all/20261107111056.667-1-alyandra5b@gmail.com/

Prepared with Claude Code (Claude Opus 5.5). Tested on x86_64.

Best regards,
HyeongJun An

Alyandra Zahran Nadhir (2):
  ALSA: ump: Clear stale RPN selector on NRPN change
  ALSA: seq: ump: Clear stale selectors in sequencer conversion

HyeongJun An (2):
  ALSA: ump: Fix RPN/NRPN state handling at MIDI 1.0 CC conversion
  ALSA: seq: ump: Fix RPN/NRPN state handling at MIDI 1.0 CC conversion

 sound/core/seq/seq_ump_convert.c | 32 ++++++++++++++++++++++++++++----
 sound/core/ump_convert.c         | 28 ++++++++++++++++++++++++----
 2 files changed, 52 insertions(+), 8 deletions(-)

-- 
2.43.0

