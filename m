Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982741;
	b=cefqMooFZcDcgQgjQCMiZGutQgGZ7IzppdSXFbaHyIrIw1HuQdmPD+PAbG4Z3lkorUXC
	 NTNv2CXCADuCmYcVrkmeENTefmbNu1Lei2mtJRvcARLQmoGe4OaFJY51kaF3Ciw5iyHgs
	 wmBP/J6a8OquViNErJ3nB0kDkqSEZDVl8pJdB/BVWTA029cXOWFX4RT/3fFI5jca+arS2
	 qEy+1FbzccsM4ODVRc3FpM0sPp0ZYZr5lSW3oT4L959UJUiLezXI1Eoi7YyJSOA+xEMC5
	 xWkInpqeq9/05Ri2kaPD/FMWDgQJMbrSDirTUfjTfi/JrtUkx7r74iq3KZEsXhO9TpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RChgsve2szNJ3b5mAMnEQC1I71q5nELdLnWCslX6oGg=;
	b=xeQYXT/O/DZyVXBa5NFrhulRx1vgXw9Wx4EyGyzRIrwjlwDA1tIb4nQ6FB9oso4hbI95
	 evIiiRX8jpvSuFIUfruUxZzWRs/8MaLjjw3u2cfo0eFRZ2b41XbkxjguGnue/hoVQa28l
	 fD3hjzO50R0dUCM5CEWBZY4p/Lkl7CIHbJGHpbPJZg0th2s+V/HWEyVhrze31eEOqpmHJ
	 RvgGKD6iY7g+8zFG2EgyWTBhnnGSJsY3U01p7lkrlDTBreWP3DdvWoCeKjPzLKIVj0MNW
	 RU+anfxXwWc4OdDmBY/pQn4ahTuv+G62S3ZJzdgvJ/XvpwOpj0vhJf88WW+gD+QbBaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H30F4iRA;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D03B606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D03B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H30F4iRA
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-846566246e8so763032a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982740; x=1794587540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RChgsve2szNJ3b5mAMnEQC1I71q5nELdLnWCslX6oGg=;
        b=H30F4iRAZHRzzH5WqhMuQWK1dOfasDflfDyAkereNzfCXgfkwzOX08//+6E8j0newJ
         r2IPmpTD0+U+52P178zcJgYo/BV48kw4iFJolgvxzMiUn3IbluFrq3jr4KIEQE7Y3ZxE
         IBuGc19Y6z51+DyWyW4WY4dGxRof3bkjzbyCrZa7aREFgVqf9uoaegf7IjfUFxg9CAtC
         cSS5q04HZaIMjjRTGI0JkKdKvPjKi3+bzky/rB4t+AzCjiRdHiDbJqWKuKNKD6qF51jV
         bYuyW0WwVPbyR3OHmnnf7oXGwUHIe3Mtv96AwRgyCHg2hNWFoHMnYTciyHLbjslTMd5i
         oeUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982740; x=1794587540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RChgsve2szNJ3b5mAMnEQC1I71q5nELdLnWCslX6oGg=;
        b=BXY/k8ifN/21chlH42cElSMQv7aL9p8j/WV0b7F9mPNHKVf2rdapUjBmo50YpEH9rN
         NZXHjwctA2+TWImUm0FwrN9zGmWcEJ3+rdRzUhnNNICT1FoqRFlo0S7ysXXRitAKw2w/
         368l+lLQXp3hxbGSked+NRgg56VGUygORg5S627yRH31xJFJli9Z+XF1usofGfLvz5If
         /vVKTq1lArHuP3FXFvS5IADJXWBsztI6AqzsFLzbp/pLH8pEdDlQipUgY+B0pZqJcGOI
         RrhndsqRPTGdFvfnx5Fph2U2ZGGmXmnWg5Hchdf9AK9bfb45vSj63Py2eP7/JzvZXaLB
         iI8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwQNuV3T9v4DC492n5lGC7pDm95Y1lKazrHJGULVjA1y2IGEGOkiPF+dDi/ayTL+C/7GLcQdEt8Pkra0Kw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ghOuKvo6qbLpUOgmcSOMApenA3rdkMyo5zRQ078wgQJrLhvLh
	/ioVoZXc612SrSTLJ02CzlxDIFKUABD3TyenwZhvmYtKJ9bpOFiMEqBW
X-Gm-Gg: AYBFou14SPOE4cmbxxti6x+VPJJJDbAmoOFt8cVt7T6iVd7931KOdcDJHstvb9r30Gc
	pfBYF7x15T0SG7bnFsJ9wR5SgiArYKO1YCeWsdS2uOIHkl9VdJ7wqlzHWHmrUdyN/KTWZkHqDCn
	CmbMHeuYxUvgC2ci8zbmRITzKNj2ILM0xFSNRyNsL0oV6GL8+IsF9dXOsUDadNHJAVRUXA/CYRa
	gsffEzPF5p9oS0wS9fpDV828CIEgd3KXGN7m926v2W79v7ebi8xoDHbz1NmDeqBJfL3PsuWngtJ
	txXHCa+VDy1uyPOOg9RjQ9XcLYX7kZ2BGhiMwOBzEmerpad4fOiKVMq2rI9msFH8mnarFVXcCRX
	OAxnWQJjBlHl/gQMYeK5W2pzFrhXfdhBNElI26PLcKuSs17ubIMjRGQ+DqszGW5pipXbJKhta2S
	5yn7l/ogJkeyH07a4czmtFg0/maajMOZZ0rJ5FPdRvm5Ik7Wm5GuwdVh0iRQKl7/5TpPawlE/5X
	9onm0aw5eF6coiIorcb6L4F+M6eItROcJlMxcEv4Ar1bT0I+dRnBassw7jWrsIQbdu8A/8MgFrO
	cmgyPkzbstx6qxwPvybhmFG2c2yxBE7wz37+W37q107U4w==
X-Received: by 2002:a05:6830:4487:b0:821:dd7e:330a with SMTP id 46e09a7af769-85f1cf9a329mr1922143a34.8.1793982739784;
        Fri, 06 Nov 2026 08:32:19 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1de8f066sm2244780a34.23.2026.11.06.08.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:32:19 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 00/16] ALSA: usb-audio: Audient driver and iD14 MkI support
Date: Fri,  6 Nov 2026 10:31:13 -0600
Message-ID: <20261106163129.1006907-1-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aupn1wwW7w08M3gu@khmer.arcnet>
References: <aupn1wwW7w08M3gu@khmer.arcnet>
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

On Wed, Nov 04, 2026 at 12:01:47AM +0100, Christian Ruppert wrote:
> I guess that depends how we define force_set. In my mind it's literally
> force set, i.e. for write-only values we must explicitly specify both
> FORCE_SET and CACHE.

That definition makes sense to me. With it, the read before the write
is fine: an uncached FORCE_SET control is one the device can read.

I also prefer the current return value. If a put always returned 1,
the kernel would send a change event even when alsactl restores an
unchanged value. So I dropped my diff. Patch 10 has only the comment
typo fixed and the blank line removed.

> Is there a reason 4, 5 and 6 are separate? They should all be one big
> update in the device definition tables without any code changes, right?

Right, they add only table entries, the device ID and the map lines.
They are now one patch (15 of this series).

> Happy to review and test an RFC of the complete series until he's back and
> takes a decision.

Thanks, here it is: your 11 RFC V2 patches, then the five iD14
patches. It sits on top of your four mixer_evo fixes. I can rebase
it once Takashi decides how those go in.

Patches 12 to 16:
- 12 adds a step size to integer controls (the iD14 volumes move in
  1 dB steps).
- 13 adds enumerated controls (routing, iD key function, talkback
  source, digital input mode).
- 14 gives the iD14 MkI its own mixer map; the MkII keeps the shared
  one.
- 15 adds the iD14 MkI controls: monitor section, routing, mixer
  matrix and the write-only controls.
- 16 replaces the generic FU 12 control, whose GET returns stale data.

Base: sound master 603a4df9e6ae with your four fixes (Patchwork series
1193966). Each patch builds on its own with W=1 without warnings. On
an iD14 MkI (7.2.11 stable), the complete series passed the same read
and write checks as RFC V2, change events included.

Thanks,
Will

Christian Ruppert (11):
  ALSA: rename mixer_evo to mixer_audient
  ALSA: mixer_audient: explicitly define full control names
  ALSA: mixer_audient: clarify USB control message definition
  ALSA: mixer_audient: Add length check to USB transfer
  ALSA: mixer_audient: make USB control transfer size configurable
  ALSA: mixer_audient: Allow arbitrary boolean control values
  ALSA: mixer_audient: Add integer range checks
  ALSA: mixer_audient: Add control initialization at probe
  ALSA: mixer_audient: Add readback-free parameter set
  ALSA: mixer_audient: add control value caching
  ALSA: mixer_audient: Create matrix programmatically

Will Porter (5):
  ALSA: mixer_audient: Add a step size to integer controls
  ALSA: mixer_audient: Add enumerated controls
  ALSA: usb-audio: Give the Audient iD14 MkI its own mixer map
  ALSA: mixer_audient: Add Audient iD14 MkI controls
  ALSA: mixer_audient: Replace the Audient iD14 MkI FU 12 control

 MAINTAINERS               |    7 +-
 sound/usb/Makefile        |    2 +-
 sound/usb/mixer_audient.c | 1342 +++++++++++++++++++++++++++++++++++++
 sound/usb/mixer_audient.h |   13 +
 sound/usb/mixer_evo.c     |  526 ---------------
 sound/usb/mixer_evo.h     |   12 -
 sound/usb/mixer_maps.c    |   10 +-
 sound/usb/mixer_quirks.c  |    7 +-
 8 files changed, 1374 insertions(+), 545 deletions(-)
 create mode 100644 sound/usb/mixer_audient.c
 create mode 100644 sound/usb/mixer_audient.h
 delete mode 100644 sound/usb/mixer_evo.c
 delete mode 100644 sound/usb/mixer_evo.h


base-commit: 603a4df9e6ae60a26adb335fe8d8f6e8f19e5d8e
prerequisite-patch-id: 522b05214a3c615ec30e50574b2bcc9c6c55dc3c
prerequisite-patch-id: 4c58588cb3fd46832de61018d60452ad1f5de1f9
prerequisite-patch-id: e15c90c1732110d25b16d26b4f919715cae7f5be
prerequisite-patch-id: 02c9ab9c3fd4cc8617060c81eed06affae2da0d2
-- 
2.47.3

