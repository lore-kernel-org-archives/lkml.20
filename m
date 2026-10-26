Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793054206;
	b=GkggI3i22Z8Aw5k7g33OJyWR2uo5yyX76KBU00mET8eD/kqBFnDh9Wg1wMpxoGZhNYW/
	 +14ZXfY0wqnx+CB/+ukFtYtoxNaXcW+mLBkorw2F7GB/SsdBJ1geqRS6z/nwDt8HqtAUd
	 scQcfvmB55tmRg7jlIbiBtT0o1HHGSf+iPXQ0/+e5r0HYQEDKqbBRyN1Ucrwqig7RNuTO
	 kMVWAiaeWqVOj0I62Az1kGkOaFuOeFxjykjzMOYg4fAVulYTuS/Ed/hlMmWI/ML0TBXBh
	 CxpQXGv6TnnevDS12wwO4f+autA1Zyq+Zyi4mLdsnuWDKfmBvziAqZ8jLkLGzi2sKPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793054206;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=AmPGzHvBBVrG/5dQg97mwCOiJ0XRAPerP5GbYTcq66w=;
	b=EJm1gykRF88y+zi9aEcgszy2dMQz9H3E+a8KvZDQN8sOjg+vAagmnut3vWN13qLewv2L
	 +QiZ3lVxilOQRQpua69Ll0Ml9SdqmFOMJHq6CtPQdVYWERVyIOcBX4pgE0dBFDdzFWs7t
	 Rv6pmP6MpajGg7ywNt9JjjfsJVjrS70CRG3uY7/khN3dXzZdZZdLLUiDxnblImBvB8BTN
	 8VIlBVSQONIEtKpj+kAOTAqMCkkcbctflKKG3qQoHYDnJRE9miksvmxowF2xaNlMAbsvR
	 YyPLb05PBPoTj9MgiFdF7SG8Yb7sBhBoSv9fcjMlUqDN16JUUAcY306zs8p7/SKAMBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=G6dSXYu7;
	arc=none smtp.remote-ip=109.224.244.116
Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4CE606A320;
	Mon, 26 Oct 2026 22:36:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E4CE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=G6dSXYu7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793054203; x=1793313403;
	bh=AmPGzHvBBVrG/5dQg97mwCOiJ0XRAPerP5GbYTcq66w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=G6dSXYu7Hbh1YI+BWkgRrRMSo9XDNB7xr5lZuvU6OV5VlYSUOarPjS8wgUFChe3AE
	 ZWlQ5HN6FUqfDMW8r9AG1ql4lInQ0qA4paVp6vaKlWj934s5DZBA7Ew5oP3FXXDIfP
	 h3goRfLLL41/P6dw0W/gk7NGKL+opI2oqRu5chOngL/GOejRhh3ijiWDqiSA688hr2
	 QI0Gb2mVT45vYJgeUYCZ1xtx/ikm4tvUTTl1cbpLOLWs9pyyvC459HBe2ot94UcXtX
	 2+waliOwusjJNgGNkpH2G+iWlhEbRVsWCl36rDzpDIsAqeWb6h+tS9AbDQRApBU67l
	 l4OIXPVupCetA==
Date: Mon, 26 Oct 2026 22:36:39 +0000
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Clemens Ladisch <clemens@ladisch.de>
From: Sinan Turunc <enscrpt@pm.me>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH v2 1/2] ALSA: usb-audio: Bound packet copies by the PCM buffer size
Message-ID: <20261026223543.620-2-enscrpt@pm.me>
In-Reply-To: <20261026223543.620-1-enscrpt@pm.me>
References: <20261026223543.620-1-enscrpt@pm.me>
Feedback-ID: 48393780:user:proton
X-Pm-Message-ID: ee67697b2467dcb3f05ea3f879181ef75b182f5c
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

retire_capture_urb() and prepare_playback_urb() assume that one USB
packet never carries more data than the whole ALSA ring buffer. Nothing
enforces that: the packet size comes from the device (wMaxPacketSize,
and curpacksize =3D=3D maxpacksize when the class-specific endpoint
descriptor sets MaxPacketsOnly), while the PCM hardware constraints only
require 64-byte periods, two periods and a period time of one data
interval. An 8 kHz mono U8 stream on a 128-byte buffer is legal, and a
full-speed device can send 1023-byte packets into it.

On the first oversized packet hwptr_done is wrapped once and stays
beyond buffer_bytes (895 for 1023 bytes into 128). On the next packet
the wrap arithmetic in the copy path computes

    bytes1 =3D subs->buffer_bytes - oldptr

with oldptr > buffer_bytes, so bytes1 wraps to about 4 GB and memcpy()
runs off the end of the URB buffer and of the vmalloc'd DMA buffer:

  BUG: KASAN: slab-out-of-bounds in retire_capture_urb+0x251/0x870
  Read of size 4294966529 at addr ffff88800c1e2800 by task vhci_rx/82

and for playback, where copy_to_urb() has the same shape:

  BUG: KASAN: vmalloc-out-of-bounds in copy_to_urb.isra.0+0x188/0x430
  Read of size 4294966529 at addr ffffc9000004537f by task vhci_rx/79
   prepare_playback_urb+0x98a/0x1fc0

Truncate an oversized capture packet to the buffer size, and stop
filling a playback URB once it holds a whole buffer. With bytes <=3D
buffer_bytes the single wrap of hwptr_done and the two-part memcpy()
in both copy paths stay inside the buffer. A device whose packets do
not fit the buffer at all was never going to play correctly anyway.

Reproduced on 7.3-rc7 with a USB/IP device (dummy_hcd cannot carry
isochronous data) advertising a UAC1 endpoint with MaxPacketsOnly and
wMaxPacketSize 1023, and a PCM client using period_size 64, periods 2.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Sinan Turunc <enscrpt@pm.me>
---
v2: From and Signed-off-by now carry my real name. No code change.

 sound/usb/pcm.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 682b6c1fe76..c2f7b08607a 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -1343,6 +1343,18 @@ static void retire_capture_urb(struct snd_usb_substr=
eam *subs,
 =09=09=09bytes -=3D adj;
 =09=09=09subs->stream_offset_adj -=3D adj;
 =09=09}
+=09=09/*
+=09=09 * A packet can be as large as the endpoint's maxpacksize, which
+=09=09 * the device chooses, while the ring buffer can be as small as
+=09=09 * two 64-byte periods. The hwptr_done wrap below handles one
+=09=09 * wrap only, so never take more than one buffer from a packet.
+=09=09 */
+=09=09if (unlikely(bytes > subs->buffer_bytes)) {
+=09=09=09dev_warn_ratelimited(&subs->dev->dev,
+=09=09=09=09=09     "%u-byte packet exceeds %u-byte buffer, truncating\n",
+=09=09=09=09=09     bytes, subs->buffer_bytes);
+=09=09=09bytes =3D subs->buffer_bytes;
+=09=09}
 =09=09frames =3D bytes / stride;
 =09=09if (!subs->txfr_quirk)
 =09=09=09bytes =3D frames * stride;
@@ -1553,8 +1565,14 @@ static int prepare_playback_urb(struct snd_usb_subst=
ream *subs,
=20
 =09=09for (i =3D 0; i < ctx->packets; i++) {
 =09=09=09counts =3D snd_usb_endpoint_next_packet_size(ep, ctx, i, avail);
+=09=09=09/*
+=09=09=09 * Bound by the ring buffer as well as by the URB:
+=09=09=09 * copy_to_urb() wraps hwptr_done once, so one URB must
+=09=09=09 * never carry more than the whole buffer.
+=09=09=09 */
 =09=09=09if (counts < 0 ||
-=09=09=09    (frames + counts) * stride > ctx->buffer_size)
+=09=09=09    (frames + counts) * stride > ctx->buffer_size ||
+=09=09=09    (frames + counts) * stride > subs->buffer_bytes)
 =09=09=09=09break;
 =09=09=09/* set up descriptor */
 =09=09=09urb->iso_frame_desc[i].offset =3D frames * stride;
--=20
2.56.0


