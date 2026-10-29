Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266525;
	b=DsP+whFW/LhlXYSVDscLM42Lc5iUc08R7OIoHjQbBxry23CCgII8pckauYr1rDtv/roj
	 nJXqIr03nphKONm9pbGrSz+7lePr6YXTRhAzG4uRnWeE2psnFteByho2wyTwN+Fzu/oG/
	 0GOgZWv40fMwCsWsYQP5qo4u+yjlNZqJ7JlO7fCXZdkidP0xK8WZSxX2eTQVjfnl47jCA
	 45PPLpXH22Wd31zsEqFyF5qxYxN20pQcOi3DAoXV4YefHlUAQEHTt4mugMnm5l8P5IL0d
	 2PrzNshbHWSgV8Ai3tzgp/sCDYqxn9e9hfuNqUVj3/UDwPcfkz+3ffpjUmSktm2+r5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266525;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=gpcEkWZksGGfj9XjEwCf+DBg2I4p4de0sWgxlYdGmn8=;
	b=DDq9vrgQ9tfbdLnrQiWERsntoSN6unyw8PeXvxpCXI0QjvQgItjxhzahdkgPehGtuXyx
	 mgLmVu3Rig/Z9LsQHO206TNdXV5lxcqcA/hVJ6D1yKjcehq5aeYO1NUh0x4lFuDB62WNg
	 Z0nFD4U5yAOoK3SCL+hHP0l1luOfoqPaF1gEBB+DeNrJ2DdcEYvbSIcBEk/I/fd2krPGN
	 aYrN+bDBQm0VOg15pBmMKIuo0xlmUck1FjMRagD71TbihCelkV6ghTOU/pf82KjDVXDPr
	 MRuaVZ0o0mb5CAwLAMWfMB/mw87OUFzfz9xN42pHMqVDO5LXnw1zb9+9yXByK8NvdSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ofOSDIXT;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F9D606A31D;
	Thu, 29 Oct 2026 09:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13F9D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ofOSDIXT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=gp
	cEkWZksGGfj9XjEwCf+DBg2I4p4de0sWgxlYdGmn8=; b=ofOSDIXTaAH0qD/51k
	swo5uNoG21obsHqmOqiegtkTwFqIZGddGzQL/3BmzbgT+yCJ/N+QVe+eRKUg4iMS
	44XQ7tuV3aio47zi6a41JPzgS+J/Oul/pV4afkxfYjPhKeu3VYciHfaPHyD/uVBj
	E1p5o1r7uBLFjN4mwRLnmobi0=
Received: from pan-u.. (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3n3ZNE+NqKj5ADQ--.44068S2;
	Thu, 29 Oct 2026 17:35:10 +0800 (CST)
From: rppxj178543@163.com
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [DISCUSSION] ALSA: usb-audio: Card naming for composite devices
Date: Thu, 29 Oct 2026 17:35:07 +0800
Message-ID: <20261029093507.511002-1-rppxj178543@163.com>
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
X-CM-TRANSID:_____wD3n3ZNE+NqKj5ADQ--.44068S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWrWxCFy3Xr48tr43try8uFg_yoW5Wr1rpF
	9xKa9Fyrs8Gw1xGw1kXw4fGr9xtrZ3A3WUGryDWr18Ka98ur1jya47trZYqa48C3s5uFy2
	yrWjqry0kws8AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jYApnUUUUU=
X-CM-SenderInfo: huss5yirxykkqt6rljoofrz/xtbC6g5ramrjE06lmwAA3P

Hello,

I'd like to discuss an issue with USB audio card naming for composite
devices and propose a possible improvement.

Problem
-------

For USB composite devices containing both non-audio and UAC audio
functions, the ALSA card shortname is derived from the device-level
iProduct string, which describes the entire device rather than the
audio function.

For example, the CVT Touch Device (1ff7:0f33) is a composite device
with HID touch interfaces and UAC audio interfaces. Its iProduct is
"Touch Device", which is the name for the whole device. The UAC
OUTPUT_TERMINAL descriptor defines the audio function name as
"MAXHUB Speaker" via the iTerminal string descriptor (index 14).

Currently, the ALSA card name shows "Touch Device", which does not
identify the audio function. The UAC mixer code already reads
iTerminal for mixer control names (e.g. "MAXHUB Mic" from the
Microphone INPUT_TERMINAL's iTerminal=17), but the card naming
function (usb_audio_make_shortname) does not use iTerminal.

Proposed approach
-----------------

When the USB device is composite (i.e. it has non-audio interfaces),
prefer the Speaker OUTPUT_TERMINAL's iTerminal string as the card
shortname, instead of the device-level iProduct. If iTerminal is not
set (zero) or not readable via usb_string(), fall back to iProduct
(existing behavior).

Non-composite (dedicated audio) devices are not affected and continue
to use iProduct.

The composite device detection checks whether any interface has a
non-Audio class. The iTerminal reading uses the existing
snd_usb_find_csint_desc() helper to parse OUTPUT_TERMINAL descriptors
in the Audio Control interface's extra data. The iTerminal field is
the last byte of the descriptor, common to both UAC1 (bLength=9) and
UAC2 (bLength=12).

As an immediate fix, I have also prepared a quirk entry for 1ff7:0f33
to override the card shortname to "MAXHUB Speaker" directly.

Questions for the community
----------------------------

1. Is this approach reasonable for composite devices, or should it
   remain a per-device quirk?

2. Are there concerns about changing card names for existing composite
   USB audio devices that have iTerminal set? For example, UCM profile
   matching or PulseAudio device identification.

3. Would it be preferable to also check the IAD's iFunction field
   before falling back to iTerminal, or is iTerminal sufficient?

4. Are there known composite USB audio devices where the iTerminal
   string might be empty or contain unexpected content?

I have tested the quirk approach on a MT81C device (Kylin V10-SP1)
and it works correctly. The iTerminal approach compiles but has not
been tested on multiple devices yet.

Any feedback would be appreciated.

Best regards,
RenPanpan

