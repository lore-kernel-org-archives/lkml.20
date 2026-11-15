Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794745000;
	b=OjM/Ivk9Pendhg6X0Pl+oxOQwE1ESJBBcdlfOrV3y3sdFzxeGoZ21hmtOmMZFmc2mLF8
	 9KckBEQCwz7GSM5g6LHvewsEPisLDMoRyWUdRC82ZV8FQQOOaffnmAkn9Eu+JXIojAQsx
	 Pf5Af3F6VZfWwEYeogv0T+lhI+FlnXh8zYhqP7/SGm8qBDvhtwOsw5P9Y+SQIW6qzHNeU
	 cWOTwNok34yyWqC5jCkuzz2nnZ4Hn8n+mZPqClOnZZG8FkvpwTYeyXuJ7YNw0VN60GAUE
	 zg0q7Mgux6prDXkfdx1SpQxCtsuqGmwx+QwVj9ol4EI4Lb8aqE7cR/2JxGT8Mjokc9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794745000;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=P7ViRC2voiEJiNltzoG0GTICk26tU15CiRiezKssOL0=;
	b=Is4zF5vg1dOt4vjvargB3RVnu80ENHavShpQsNoYynqvkB8+CLX582PY493LLmpUoGoJ
	 uZP1UOy9LGgwZYreybeRFUU/Y7NiaVgVgADu1A7T6RDxYLm+lj9xmp1W+PyG3Vx4tDyQv
	 akQTIuzgFkYFZVk/f9SUJbo+mgxsddpqWZ5RTpB679OQAQre/ULs3kJ6umDu0bMdaAavO
	 DWYKojrvdaCbBisd3uioc4EH/Bq+SAgS7RZWlCwKKqaXvgv1IXLZtb/6K51g/XMF170h2
	 s3E0GqxvRHZmMix3wXqINW1zReAlhwDMWZkUpDDuG0Scmp8j70Ka4UDdy2SWJpR/7ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=NPdYuARA;
	arc=none smtp.remote-ip=79.135.106.30
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D3B606A31E;
	Sun, 15 Nov 2026 12:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68D3B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=NPdYuARA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794744997; x=1795004197;
	bh=P7ViRC2voiEJiNltzoG0GTICk26tU15CiRiezKssOL0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=NPdYuARAPz5PO4WE3OooLEKu4KyN3fScg+c/aLW7qutUX1dy244RGyqROGTDKC4W9
	 3WjBkJA+eyofNKyRG84ZKJTNgQvVIJBBct9qzU365ongruTd7gKsdw5jQl7ZKpiFOd
	 5Cm1hPEynkegDq89Y6og6CHu3xS9wGyjB/6WhilPxqrG+yuA6310WNIQ67SS91CXQC
	 mT/zfQnK5+ecEWjjrqMpHzIz1kZoaY+V7cKwGVyreyfNV17B/mC+IPKBk7GygiMU3K
	 HSNMuLfOi8GrH9l1Chx/Ulb6Ek9LCqcawvLQlUh7cEQgTJ5Te8j1lC80Fng14HPasJ
	 IJQFwEMkwfhiA==
Date: Sun, 15 Nov 2026 12:16:33 +0000
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
From: Sinan Turunc <enscrpt@pm.me>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: usx2y: Count completions apart from the URB array length
Message-ID: <20261115121602.151-1-enscrpt@pm.me>
Feedback-ID: 48393780:user:proton
X-Pm-Message-ID: cd02c8697c5dc84a1a7bcdcc3cdc6b3da81137e2
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

usx2y_rate_set() allocates a snd_usx2y_urb_seq with len set to the
number of URBs, and i_usx2y_04int() decrements len once per completed
URB to know when all of them are done. Since len is also the
__counted_by() bound of the urb[] array, every access to the array after
the first completion is out of range for UBSAN, and the cleanup loop in
usx2y_rate_set() trips it on every prepare:

  UBSAN: array-index-out-of-bounds in sound/usb/usx2y/usbusx2yaudio.c:694:1=
8
  index 0 is out of range for type 'urb *[*]'

Count the completions in a separate field and leave len as the array
length.

Tested on 7.3-rc7 with CONFIG_UBSAN_BOUNDS and an emulated US-122 over
USB/IP: before, the report appears on every prepare; after, a 30 s
capture stream prepares and runs without it and the rate sequence still
completes.

Fixes: f5cc9cdfc96f ("ALSA: usx2y: Annotate struct snd_usx2y_urb_seq with _=
_counted_by")
Signed-off-by: Sinan Turunc <enscrpt@pm.me>
---
 2 file(s) changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/usb/usx2y/usbusx2y.h b/sound/usb/usx2y/usbusx2y.h
index 7b6deed17d4..17edafdcc89 100644
--- a/sound/usb/usx2y/usbusx2y.h
+++ b/sound/usb/usx2y/usbusx2y.h
@@ -46,6 +46,7 @@ struct snd_usx2y_async_seq {
 struct snd_usx2y_urb_seq {
 =09int=09submitted;
 =09int=09len;
+=09int=09pending;=09/* completions still to come */
 =09struct urb=09*urb[] __counted_by(len);
 };
=20
diff --git a/sound/usb/usx2y/usbusx2yaudio.c b/sound/usb/usx2y/usbusx2yaudi=
o.c
index a3a0bc13632..e03f7e4e8cb 100644
--- a/sound/usb/usx2y/usbusx2yaudio.c
+++ b/sound/usb/usx2y/usbusx2yaudio.c
@@ -643,7 +643,7 @@ static void i_usx2y_04int(struct urb *urb)
 =09if (urb->status)
 =09=09dev_err(&urb->dev->dev, "%s() urb->status=3D%i\n",
 =09=09=09__func__, urb->status);
-=09if (!--usx2y->us04->len)
+=09if (!--usx2y->us04->pending)
 =09=09wake_up(&usx2y->in04_wait_queue);
 }
=20
@@ -662,6 +662,7 @@ static int usx2y_rate_set(struct usx2ydev *usx2y, int r=
ate)
 =09=09=09goto cleanup;
 =09=09}
 =09=09us->len =3D NOOF_SETRATE_URBS;
+=09=09us->pending =3D NOOF_SETRATE_URBS;
 =09=09usbdata =3D kmalloc_objs(int, NOOF_SETRATE_URBS);
 =09=09if (!usbdata) {
 =09=09=09err =3D -ENOMEM;
@@ -683,9 +684,9 @@ static int usx2y_rate_set(struct usx2ydev *usx2y, int r=
ate)
 =09=09=09goto cleanup;
 =09=09us->submitted =3D=090;
 =09=09usx2y->us04 =3D=09us;
-=09=09wait_event_timeout(usx2y->in04_wait_queue, !us->len, HZ);
+=09=09wait_event_timeout(usx2y->in04_wait_queue, !us->pending, HZ);
 =09=09usx2y->us04 =3D=09NULL;
-=09=09if (us->len)
+=09=09if (us->pending)
 =09=09=09err =3D -ENODEV;
 =09cleanup:
 =09=09if (us) {
--=20
2.56.0

