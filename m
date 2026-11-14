Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794677321;
	b=lN/cdv9SgvcEzHEXqWoX8W8w+bP8Mp/9svMqyXo0LBoc7dCbz6ITPBCTC5d8lJXb4XWZ
	 3iWXLYyWmtgLbP0RHvtfxFHmHx+WJxAz8fwZDSaMMc4HKHQ1I2W7FyyGk2uZcbJv/JRIK
	 w4eF3MJVjWIM3LWjmMYJ7f50R9Ki7fi7pfYuy2SbazJkb9XvXsiNTBh8dCBoiuxp0jDNm
	 JL65zqJ27eCCZgYb/HsjOJy919sHETSu+c6+MCZFeX+sycAXu0SQY2AHFPkOXr/vIaYoB
	 BJb/BxnRa/sW6XmQkc4e7WtGnl71ssTcEE0FjYByAoUCdD34jedyKf5OTaMwJxjibpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794677321;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=IvazhbLjPs/GbfIjGW8+LFCBhSwb1LGY5YDPG8bfv0w=;
	b=V6vxV0TtWRn1E6d41C3zIJCa+zG5jy4iTVT0k4tFTUFhhlpt/IrkKJkuO2KqABBbNrOm
	 EKWcwYpfY1Uc8vFuO7R6GLUh/oERIFL45RevVHYYeXHn9qz617NU7rGBiLz+uajTpEAa3
	 83JBVCJwxo0ohTANeTbwtZnHQQr0dMfUHis23jqKo1fSuwZCjZIfBouA6J0cVda/ZafNU
	 A0maAm/gnCEDr5LHTL5OG1jAtJ6nKs6pACh7iD1Dytl0VTcMqWx3K7whmS53uSQkzn+ij
	 7NBn7VwhQNl7pgq8qOkWrvtoWkZZrtCXVepXBRS+S+6tcdlfR7MVzw8gEbVCiAKZu2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=becholey.ch;
	spf=pass smtp.mailfrom=becholey.ch;
	dkim=pass header.d=becholey.ch header.i=@becholey.ch header.a=rsa-sha256 header.s=protonmail header.b=rqRCVAXX;
	arc=none smtp.remote-ip=79.135.106.25
Received: from mail-10625.protonmail.ch (mail-10625.protonmail.ch [79.135.106.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC39606A327;
	Sat, 14 Nov 2026 17:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CC39606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=becholey.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=becholey.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=becholey.ch header.i=@becholey.ch header.a=rsa-sha256 header.s=protonmail header.b=rqRCVAXX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=becholey.ch;
	s=protonmail; t=1794677316; x=1794936516;
	bh=IvazhbLjPs/GbfIjGW8+LFCBhSwb1LGY5YDPG8bfv0w=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=rqRCVAXXtvvbzAvWbBv1wG6zaTQ+dlLOBJBOBg3tLm1rODFiL32fizlnSSqGc5QAQ
	 8V4m9GK9rL4AoGnJnEGR1MJZsy4EY7nqrWpzWNYrXIasO1WU/C1yC71s/F4ySZ5xSE
	 CGHFuZka9REIyDdCdAbSjvijfAEmEzCC+OGD0qiBSBBvEPGXvRbEZLm8cPwVRfgg3s
	 uCvV0OffnTwwcGenk/XBoDz/Mz5lKjmI83XpftYWwKuZ2Dn4NCU+if0JW/65yGu5Hi
	 IJmXskgpYriVik5CirDoCFwJ61arev7uVB5XvKchexWR/F5hn2n1YJa6wtR0Em9HeC
	 shrdKt6V85OrA==
Date: Sat, 14 Nov 2026 17:28:30 +0000
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
From: Alexandre Becholey <alex@becholey.ch>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, Hanxiang Xu <xuhx@hust.edu.cn>, =?utf-8?Q?=C5=A0erif_Rami?= <ramiserifpersia@gmail.com>, Alexandre Becholey <alex@becholey.ch>
Subject: [PATCH 0/5] ALSA: usx2y: us144mkii: fix PCM stream lifetime bugs
Message-ID: <20261114172806.88710-1-alex@becholey.ch>
Feedback-ID: 60743817:user:proton
X-Pm-Message-ID: 1280f624f32e71b5dba707abf93d8c00631ceb77
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Five bugs in the snd-usb-us144mkii PCM code, all reproduced with an
emulated US-144MKII under KASAN on torvalds/master and v7.3.1:

 1/5 stop_pcm_work calls snd_pcm_stop() on a substream that is being
     closed (use-after-free of the runtime); the device can schedule
     the work at any time by sending bad feedback.
 2/5 capture_work keeps using the capture runtime after the capture
     PCM is closed while playback is running (use-after-free).
 3/5 the capture work and the playback URB completion use the buffer
     of a substream that was never started (NULL dma_area), because
     the URBs of both directions always run together.
 4/5 the playback and feedback URB completions use the substream
     runtime and buffer without waiting for close (use-after-free).
 5/5 a START retried while stop_work runs submits URBs that are still
     in flight (URB submitted while active, anchor list corruption).

The patches depend on each other and are meant to be applied in this
order: 2/5 builds on the close callback of 1/5, the check added in 3/5
is only safe once 2/5 guarantees that the capture work does not outlive
the substream, and 4/5 and 5/5 apply on top of the first three. In
testing, 3/5 without 2/5 crashed in the new check, and 1/5 + 2/5
without 3/5 still crashed on the NULL dma_area. Each patch has its
testing notes below its '---' line.

Hanxiang Xu reported the bugs fixed by 1/5, 2/5 and 4/5 on this list
on 2026-11-13, from source inspection and without a patch; we found
them independently with emulated devices. This series is sent as a
reply to that report, and 1/5, 2/5 and 4/5 carry Closes: tags for the
two messages. The reports also mention close racing with disconnect:
that concerns a fix that kills URBs in .close, which this series does
not do (the .close callbacks only touch the card private data), so
nothing is changed for it.

How we found it: the bugs were found, and the reproducers and these
patches were written, by AI agents (Claude Mythos and Claude Opus
models), in QEMU with emulated USB devices (raw-gadget/dummy_hcd,
emulated xHCI, USB/IP).
A human reviewed the analysis and the patches. The reproducers are
available on request.

Thanks,
Alexandre Becholey

Alexandre Becholey (5):
  ALSA: usx2y: us144mkii: fix stop_pcm_work race with PCM close
  ALSA: usx2y: us144mkii: wait for the capture work on capture close
  ALSA: usx2y: us144mkii: only touch the buffer of a running PCM stream
  ALSA: usx2y: us144mkii: wait for the URB completion handlers on stop and =
close
  ALSA: usx2y: us144mkii: do not restart the stream while stop_work runs

 sound/usb/usx2y/us144mkii.c          |   5 +-
 sound/usb/usx2y/us144mkii.h          |   2 +
 sound/usb/usx2y/us144mkii_capture.c  |  22 ++++-
 sound/usb/usx2y/us144mkii_pcm.c      | 162 +++++++++++++++++++------------=
----
 sound/usb/usx2y/us144mkii_pcm.h      |   8 ++
 sound/usb/usx2y/us144mkii_playback.c |  65 ++++++++++----
 6 files changed, 170 insertions(+), 94 deletions(-)

