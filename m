Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813455;
	b=RWGS3555upM9tDWB4fIg+JlZS6zHqQLjV1/Vl/LF9UCwly6F10jR2kTB2Kf8v3Sf/Mv2
	 M5xZxfOaWhGuBArkRdIZhWkaF+y9XLl1Af5gc+Scdv4xNiXdFRjz3VMpNJNtMWAQXnl8h
	 ARTp3tuMLeA0zlQPrKjz7QvRfgc/ey7w9ajufiV8861p2MncDXJBSyr6dNlZi8DkdmX4f
	 O//eoWVK9JAXqQ8aR3qhhSv1Yc3jauJrsSboLPWZADUKZtob1hOvXZMD7mVMph48GcbF8
	 8N4HxK/sqQuBWevUjtmxEpU26n7SFal+5NXtiWf9DrND1uWKoMAvwjgcHuEz+lmI7gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813455;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=OPW1YuwZqQJBK0x7L1OB923uZK4qZJLqR2QOkX1Upvk=;
	b=12dI7W7T3SfaSizbVTzj3v8nnGvye0p68LF9jHGWqfK50MBSHUSLaFBk8qWWharfjRfC
	 GyjJbT6caKa/IzEJZameobPQMr16HYgd5yyvFNzIeA+Xbn2FhiNOi7AZKORxHoQwuEICQ
	 GO1qvxiTHgx3hNmFjsomksXfjB+B81PE+mYMfGwKdSWEAbMn/Bcw0U4In3MM++fNzRy0F
	 ft92A/ZjhrUA2lhwOgwdi2ImzQUlcyR1vRNRUaom3cYqtYyWmwDxrGlCwBdgqZs76zWvA
	 r9bt2nC6leQqVdreGUqDd6NzovyRjZa2VoZujQaUnntlV+OEufPHd6BKhZrlw5oDQBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=becholey.ch;
	spf=pass smtp.mailfrom=becholey.ch;
	dkim=pass header.d=becholey.ch header.i=@becholey.ch header.a=rsa-sha256 header.s=protonmail header.b=CzydSSYG;
	arc=none smtp.remote-ip=109.224.244.20
Received: from mail-24420.protonmail.ch (mail-24420.protonmail.ch [109.224.244.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69615606A31C;
	Mon, 16 Nov 2026 07:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69615606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=becholey.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=becholey.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=becholey.ch header.i=@becholey.ch header.a=rsa-sha256 header.s=protonmail header.b=CzydSSYG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=becholey.ch;
	s=protonmail; t=1794813451; x=1795072651;
	bh=OPW1YuwZqQJBK0x7L1OB923uZK4qZJLqR2QOkX1Upvk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=CzydSSYGwdpLr+bHn6qA+TaojbRqNi1W/ip2S3DoTgB56fkkjEOtW69ZJKTql6GGy
	 WeftwVKPiUlGvucHOFtCpKQH7EZfAOqG4Uyo4sgPk/XmeQFmD2EYZbq8UoDkzecT4P
	 zTDtJc+6FGCm3hPGjyD+mP2d/KERwVK7BdEVtEOx5sdDQyY3QXUbJ9cSbIEdEd2uL6
	 lZEggyaD61zCoLPXEC2jc6K8zS75VLA9pIh04n4c11hRFi9tuCpxyj7HIXQOGZJJX6
	 YSMqi59GA/GPsf6RgRtlV1EHk9BZtEDHpDrh/MmzoTc0N2Ay9R8TydV9QirtxqZ0Nr
	 +UQzBjOy8WM5w==
Date: Mon, 16 Nov 2026 07:17:25 +0000
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
From: Alexandre Becholey <alex@becholey.ch>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, Hanxiang Xu <xuhx@hust.edu.cn>, Alexandre Becholey <alex@becholey.ch>
Subject: [PATCH v2 0/5] ALSA: usx2y: us144mkii: fix PCM stream lifetime bugs
Message-ID: <20261116071707.217448-1-alex@becholey.ch>
Feedback-ID: 60743817:user:proton
X-Pm-Message-ID: 3c998cf32e1e22f0a385029067ecdc56611f4de8
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
them independently with emulated devices. v1 was sent as a reply
to that report, and 1/5, 2/5 and 4/5 carry Closes: tags for the two
messages. The reports also mention close racing with disconnect:
that concerns a fix that kills URBs in .close, which this series does
not do (the .close callbacks only touch the card private data), so
nothing is changed for it.

Changes in v2, both from the Sashiko reviews of v1:
- 3/5: also count the hardware position and the elapsed periods in
  feedback_urb_complete() only while the substream is running, so that
  a substream started after the other one starts at the beginning of
  its buffer.
  https://lore.kernel.org/all/sashiko-outbox-214859@kernel.org/
- 4/5: make playback_substream and capture_substream __rcu pointers,
  published with rcu_assign_pointer() and read with rcu_dereference();
  the capture work now also uses the substream inside an RCU read-side
  section.
  https://lore.kernel.org/all/sashiko-outbox-214863@kernel.org/
- 1/5, 2/5: no change; 5/5: rebased, no change.

v2 was tested on v7.3.1 and on torvalds/master 97d73c825122 with the
reproducers of all five patches, with KASAN, PROVE_LOCKING and
PROVE_RCU: no us144mkii report in 84 runs (the same reproducers
crashed unpatched v7.3.1 in 8 of 8 runs).

v1: https://lore.kernel.org/all/20261114172806.88710-1-alex@becholey.ch/

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
 sound/usb/usx2y/us144mkii.h          |   6 +-
 sound/usb/usx2y/us144mkii_capture.c  |  30 ++++-
 sound/usb/usx2y/us144mkii_pcm.c      | 160 ++++++++++++++-------------
 sound/usb/usx2y/us144mkii_pcm.h      |   8 ++
 sound/usb/usx2y/us144mkii_playback.c |  92 +++++++++++----
 6 files changed, 197 insertions(+), 104 deletions(-)

