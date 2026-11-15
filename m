Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794745023;
	b=0mbv1uiNkXRhMDyOakA4Cg5XPGb/yXtSevkyQEmVZ4KOEW8hUgWX+eJhEmYpHNeWr7eA
	 aEq4NWabZtajStpxS5uLlcOWhul+8PIEv5A1h/r8tDoXVp65DG6+AbEtQdtANOifmtTJ1
	 uGIG2sZxgrdZXAxGLKVMJGuoTxht4q3Uiy1kEM+K9T4C59KkHI3gvFwGnaHlUXY9xaKRf
	 dVl658PnY0mYimUmgc7SMsoRlESUl9s4JWmnjY+oCaEKnG7644zxAPKxQS2j5cdaAVA9M
	 uYJy4vdoUeDzcuVVCxctLmkJEgr4ivhlPDkzIcOkwsYFuREVQCA7/cma3bMYTAKkK3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794745023;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ePBNm9yp8NxsVyOcaC+nlSinpk+kVPCCjlGN72fAPxs=;
	b=xz6Fhe30zq8jAAe/j2+zCmevFrratOrjHq/9CJFubsKfgEbuctiBgxeYs1MCn9mdWM98
	 8XWn2NZkEbvHWU10Yv23nT8RAecwHgthVzhLf76IKwnOgZS9l7LpdKCfob8vHo1iOmYAm
	 ohrhPRjDqw/lpPq0j/vDJyhG44evDs/4ndh41QWB0t8fPVeIOH9wkwtQS+9YFP42wOtgm
	 hKQUvE0BMNRA3TlM+ouHo0R5J9aqparjGdwbEIi/Kb/4mB/7xiwfMO8IcR4wFrMuxkS21
	 geCxJ1Hp10Rjb1o/noWhC244kgdbDgmXiPevjSwrvsUMSQbB1nOfLqnMehpSRa1Mdgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=mtOaT2Ot;
	arc=none smtp.remote-ip=79.135.106.31
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEB7606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:17:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFEB7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=mtOaT2Ot
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794745019; x=1795004219;
	bh=ePBNm9yp8NxsVyOcaC+nlSinpk+kVPCCjlGN72fAPxs=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=mtOaT2OtRJomvFIDYIIPvTucOCbwntK7w7csAOCfo0aEvBDjCrIoC4T0GxIhGpm4u
	 zuy19Sa+z1ftOf+vvzH+tcVNHXZPM+rmdv4YnFIl9mTtYdEiMUlW16eAMF5WKcfqiV
	 eP1VIRxCQzrnMVKCZ/FT5YHR6+6n2kQSUNI2ZV7KfcxRjRoLiEgAsZor5MEzrZw0OZ
	 v6uUsR7Ut2Wp/ksL4ZygSVE0sOoh3hL0cenk8HN5HOJ4I2oTkWxmxSLf548Gtl37c0
	 Aj22b6Dg2jQ+8nwaB1DYFQEnFzFTacUIAKcZV4cjzelIKrT5y4AgOcE3VWxgEwvWNH
	 9/ZRp6rHGcVBg==
Date: Sun, 15 Nov 2026 12:16:55 +0000
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
From: Sinan Turunc <enscrpt@pm.me>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: usx2y: Account for every period a URB completes
Message-ID: <20261115121638.168-1-enscrpt@pm.me>
Feedback-ID: 48393780:user:proton
X-Pm-Message-ID: 0570d2dc2bf99d85006ee5d821d10bb1f9dc55bc
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

usx2y_urb_capt_retire() and usx2y_urb_play_retire() add the frames of a
whole URB to transfer_done and subtract one period_size when it is
reached. With a period of 1 ms, which snd_usx2y_pcm_open() allows, a
URB of nr_of_packs() packets covers several periods, so transfer_done
grows by the difference on every URB. snd_pcm_period_elapsed() is
called once per URB instead of once per period, and transfer_done
overflows after about 16 hours, after which period wake-ups stop.

Keep only the remainder modulo period_size. ALSA's position comes from
the pointer callback, so one call per URB that crosses a period is
enough.

Measured on 7.3-rc7 with an emulated US-122 over USB/IP and a debug
print of transfer_done every 1024 capture URBs, 45-frame periods and
48-frame packets: before, transfer_done is 150573 after 1024 URBs and
8580141 after 58368; after, it never exceeds a period plus one URB and
the stream runs for 30 s as before.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Sinan Turunc <enscrpt@pm.me>
---
 1 file(s) changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/usx2y/usbusx2yaudio.c b/sound/usb/usx2y/usbusx2yaudi=
o.c
index a3a0bc13632..681e75917bc 100644
--- a/sound/usb/usx2y/usbusx2yaudio.c
+++ b/sound/usb/usx2y/usbusx2yaudio.c
@@ -72,7 +72,7 @@ static int usx2y_urb_capt_retire(struct snd_usx2y_substre=
am *subs)
 =09subs->transfer_done +=3D lens;
 =09/* update the pointer, call callback if necessary */
 =09if (subs->transfer_done >=3D runtime->period_size) {
-=09=09subs->transfer_done -=3D runtime->period_size;
+=09=09subs->transfer_done %=3D runtime->period_size;
 =09=09snd_pcm_period_elapsed(subs->pcm_substream);
 =09}
 =09return 0;
@@ -155,7 +155,7 @@ static void usx2y_urb_play_retire(struct snd_usx2y_subs=
tream *subs, struct urb *
 =09if (subs->hwptr_done >=3D runtime->buffer_size)
 =09=09subs->hwptr_done -=3D runtime->buffer_size;
 =09if (subs->transfer_done >=3D runtime->period_size) {
-=09=09subs->transfer_done -=3D runtime->period_size;
+=09=09subs->transfer_done %=3D runtime->period_size;
 =09=09snd_pcm_period_elapsed(subs->pcm_substream);
 =09}
 }
--=20
2.56.0

