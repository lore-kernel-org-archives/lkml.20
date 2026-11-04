Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793789580;
	b=AM8I1FixgKSY4bowAaCp4BuKf+buzCYlK7etkCJ/Cq1AlJfQc9XLdcn8GDUDTRTdpCEt
	 wUPXp1fYO+RVijOU7tb/5n++vr1WrkBEmqujFjgCuGZczDSZeJQJV1vJIfp64ii6C/qf4
	 EwvthtjrbSkNSXuqDnrFMZHAEKWHAN+ESBejGFPD318b57bujX79BoRcjYnmaFSdFU9Fx
	 2E1zoohjjWWdSXWn1ub/H+NJg/T2cQv/iPGHJVjaEjeMSv+lawIC6QwPL8INa56zNCR+S
	 0VlimfgDl7bRZBx3wuSBqxl/GLZpuSaX7+WK/1qLzTtZJQHcNHcQKQhQ7AzSuECzhYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793789580;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=GimgcPXH2fNoHOLDkivcT6L2F+6r2bGEOK3CclBJHEE=;
	b=X0CbF/NnCbA8n6o7RgC2vzeMhpdA120a8Oa7uq1vqBXtSvU8UOikOAPTqbMsmERY3jcv
	 CEkutlj4zJcJm0DGjCTQi0lMuKQb8mu61R2e777YMSQKXvjBM4NhjOs5TWkoAjWFpuiGG
	 zSVsO6WCcgCei3hKIKbtAdHyxqwpIWwDCe0f+rS8lX0dvmIoXtmsc8EXWCAGB7YD1jb7b
	 hOy/n43Rx/kAP21ygaluUFgvJYSQsDzofNK9fXlVTvhJdj1pPwgY+xnOO7zL7Ig1BMzbd
	 e9g6svq/ow7zk9Z2BVTnL4WCBNDnhOgN0RdznQnC3Qj5Gb9EA3CJo0n7Fy/9IplpWwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b="JzGU/S5R";
	arc=none smtp.remote-ip=185.70.43.100
Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39961606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:53:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39961606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=JzGU/S5R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793789578; x=1794048778;
	bh=GimgcPXH2fNoHOLDkivcT6L2F+6r2bGEOK3CclBJHEE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JzGU/S5RVygaOe8FMojJxUCsVBL7E7/XsSh395fO6shr6D2yu1uFTNpoTxNFVuh5U
	 iZNN5cHZbaKFar+uMz2gkdHHHc1n97zLAjvC6V1u8Pw3yXwSFwvYnW4Tt4w1TUoHQJ
	 94P5NCVnVJ9EPfi1KbkjWWsNpvwgHlp9hkgq8tL0G54i9U+p0GqSyHX+r/rAvQHq61
	 5YZNy0uzcJCWsFoHQbLZUBGgpMdLqnYsKC8qwb0vqS5yJzupH2ZU8xhokB1p6vX4Su
	 5cfU/dUIiuelFxwFnBgOJ1FjnUEeHkRUIsypIAENBZ/G4QNy/VMY4n/B6lTs0q9jEq
	 kLseACskaee4w==
Date: Wed, 04 Nov 2026 10:52:55 +0000
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
From: Sinan Turunc <enscrpt@pm.me>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH v3 2/2] ALSA: usx2y: Guard the playback copy
Message-ID: <20261104105228.1124-3-enscrpt@pm.me>
In-Reply-To: <20261104105228.1124-1-enscrpt@pm.me>
References: <20261104105228.1124-1-enscrpt@pm.me>
Feedback-ID: 48393780:user:proton
X-Pm-Message-ID: 6f257916e3e14e150a1c466d7fb4812cb07fc0e7
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

usx2y_urb_play_prepare() sums the packet lengths of a whole URB, copies
that many frames with a single wrap, and sizes each playback packet from
the capture packet's actual_length. Two assumptions are unchecked: that
the URB fits in the ring buffer, and that a packet fits in the playback
endpoint's maxpacksize, from which tmpbuf is allocated.

Return -EPIPE, as the existing packet-size check does, when the URB is
larger than the buffer or a packet is larger than maxpacksize. The first
case is prevented by the buffer bound in the previous patch and this is
the guard for it; the second depends only on the device.

The first case is reachable on the unpatched driver with ordinary
packets: on 7.3-rc7, a USB/IP device presenting the US-122 interface
layout and sending 48-frame packets, with a 100-frame playback buffer
(two 50-frame periods, inside the stock constraints), KASAN reports:

  BUG: KASAN: out-of-bounds in i_usx2y_urb_complete+0x79b/0x1ac0
  Read of size 18446744073709551280 at addr ffff88800e6b02e0 by task vhci_r=
x/80

With both patches, the same device and a 200-frame playback buffer is
refused at hw_params with EINVAL, and a 400-frame buffer plays for 30 s
with the position advancing inside the buffer, no KASAN report and
neither guard message. The maxpacksize check is not exercised: the
emulated device reports the same wMaxPacketSize on both endpoints.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Sinan Turunc <enscrpt@pm.me>
---
v3: new patch, split out of the v3 draft; the review of v2 found both
unchecked assumptions. The buffer case is confirmed on the unpatched
driver and the guards tested on 7.3-rc7, see above.

 sound/usb/usx2y/usbusx2yaudio.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/usb/usx2y/usbusx2yaudio.c b/sound/usb/usx2y/usbusx2yaudi=
o.c
index ee224b4dfb0..5f241d45401 100644
--- a/sound/usb/usx2y/usbusx2yaudio.c
+++ b/sound/usb/usx2y/usbusx2yaudio.c
@@ -112,7 +112,8 @@ static int usx2y_urb_play_prepare(struct snd_usx2y_subs=
tream *subs,
 =09=09/* calculate the size of a packet */
 =09=09counts =3D cap_urb->iso_frame_desc[pack].actual_length / usx2y->stri=
de;
 =09=09count +=3D counts;
-=09=09if (counts < 43 || counts > 50) {
+=09=09if (counts < 43 || counts > 50 ||
+=09=09    counts * usx2y->stride > subs->maxpacksize) {
 =09=09=09dev_err(&usx2y->dev->dev, "%s: should not be here with counts=3D%=
i\n",
 =09=09=09=09__func__, counts);
 =09=09=09return -EPIPE;
@@ -125,6 +126,16 @@ static int usx2y_urb_play_prepare(struct snd_usx2y_sub=
stream *subs,
 =09=09urb->iso_frame_desc[pack].length =3D cap_urb->iso_frame_desc[pack].a=
ctual_length;
 =09}
 =09if (atomic_read(&subs->state) >=3D STATE_PRERUNNING) {
+=09=09/*
+=09=09 * The copy below wraps once, which needs count <=3D buffer_size.
+=09=09 * snd_usx2y_pcm_open() guarantees it; guard anyway.
+=09=09 */
+=09=09if (unlikely(count > runtime->buffer_size)) {
+=09=09=09dev_err_ratelimited(&usx2y->dev->dev,
+=09=09=09=09=09    "%s: URB of %i frames exceeds %lu-frame buffer\n",
+=09=09=09=09=09    __func__, count, runtime->buffer_size);
+=09=09=09return -EPIPE;
+=09=09}
 =09=09if (subs->hwptr + count > runtime->buffer_size) {
 =09=09=09/* err, the transferred area goes over buffer boundary.
 =09=09=09 * copy the data to the temp buffer.
--=20
2.56.0

