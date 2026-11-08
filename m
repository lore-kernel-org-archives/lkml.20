Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794182388;
	b=watT/2X03q2ahI1G65nVJ91JrUIoKGuqSNwh5wPtkn1qr9WrzaYWc3Xeh/uIBU7mU1qn
	 Md8yt86UxqfzujYv8Xme3YQAGG+FcfIt6ezqh670UKKQxM9zvXnqkwyuOBf8X5gTQVC01
	 KbPUS38i/TQ5wI2O4Zi5NC7JkoXhOwIoqFv8LTm2rm3oD+Hom+FKC+Ga89DqUu1iVLbXY
	 gpty4Td8XWVJt5UyUOIH9eCoeupfcgpyysfE8bnV+yBauSiSfamN2aARViuLMrw0Z2MRZ
	 +/fqE7DkvOSCuk4XQzvgJ+HIFu/2QatgR1wyK8K7cDC3BXeQ8k1Gu89LU2zNomtyfSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794182388;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=o9/gDVzYWB1K2gnQuYkztuneIzTDOn3KuZsKCZBM7PU=;
	b=JQ4d8T1Qlv6wW+DCfeVuhL/d2kReQ3QSc9kviZBJmGPvf63OYvwtq1L27IIhPc3bYC7d
	 1fv0mu5yAiPGtKkusZ5JfxMFtoVO/sIlnjgYT85gfH6a0tPZBXfQhRzV5gM78cvrLJaA7
	 SSYGRJiTjwxBtan7GRH4zmKcXumbxb2G6w5P1ZlsjMiziob6zAHY13Yun0w65NkvrNibQ
	 ZzSylbFGv4mTaIjudrihjhbNzRJJ0V5l3xwRBGS+dmn03xJbCNNwYt6TexwT/6yhv674Q
	 mF2EpsHHt5iPKavX/U9VsrsEIXMBp7d8wQg/GE4E6YU/Yq/2LzF4y/uc1hIJcbqu1Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=zjmQtScJ;
	arc=none smtp.remote-ip=79.135.106.118
Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6C2606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E6C2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=zjmQtScJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794182385; x=1794441585;
	bh=o9/gDVzYWB1K2gnQuYkztuneIzTDOn3KuZsKCZBM7PU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=zjmQtScJS1FUr/xSwN9YmFOjKnUU7wN3W/SECkmt9A3PNgqLsMrv2pYhGccXaUtXf
	 uC7K+PZNlDISMsbsqg6ZKnykLiTwlnm2ZLELA8+uuw68bhnYvBjTqx9sUbpDk3yP0p
	 180olPRW47YS/MhGr9vC3TTPkRw31x/9cPW0kZ6EDrX/8MBOckwgNKFTaW8GJTay01
	 MepzTwuTjoxI3wIs6+uS45M3/e7B5LbQkkKdBpbgm0MU6n8By9d067AeycvlelfRez
	 YHiZB/pNLD7pGRYakm3DDI2eI7quPXLAgTA9C5m48OVr+AMi6VdeqHoq6HcejLZ9Uj
	 z57/dSV6HReHw==
Date: Sun, 08 Nov 2026 23:59:42 +0000
To: "nkapron@google.com" <nkapron@google.com>
From: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] usb: gadget: f_uac1_legacy: reject req_buf_size above audio_buf_size
Message-ID: <STmU26AUAvMygkI-HkAXlgCHdUAlaxAxDmP23oNJc_nqO_892UC9WRzL50fi1aoxQf9n38RA-NfUxlv-1uj8g9Qmd3FYjijCRz-BDMcbyd8=@proton.me>
Feedback-ID: 186545857:user:proton
X-Pm-Message-ID: 5fe76b3587b15e7587d17d5445b759cc584d1437
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

Hello,

f_uac1_legacy allocates the playback copy buffer with the
audio_buf_size option and the OUT request buffers with the
independent req_buf_size option, and never cross-validates them.
In the playback completion handler, a request larger than the
remaining copy-buffer space flushes the current buffer and allocates
a fresh one, then copies the whole request into it:

    if (audio_buf_size - copy_buf->actual < req->actual) {
        ... flush, copy_buf =3D f_audio_buffer_alloc(audio_buf_size);
    }
    memcpy(copy_buf->buf + copy_buf->actual, req->buf, req->actual);

With req_buf_size > audio_buf_size (both are free configfs
attributes; the defaults 200 and 48000 are safe) and a hostile host
that streams full-length packets, this is a linear heap overflow of
req_buf_size - audio_buf_size bytes with host-controlled content and
pacing. The patch rejects the combination when the streaming
alt-setting is selected, failing closed.

Affected version/commit: mainline 8a65162514fbad21a2c58ffed65f42b27e92b163 =
(v7.4-rc2 window, 2026-11-08), drivers/usb/gadget/function/f_uac1_legacy.c:=
338-349 (playback completion: the 'if (audio_buf_size - copy_buf->actual < =
req->actual)' flush logic, then memcpy(copy_buf->buf + copy_buf->actual, re=
q->buf, req->actual)), :605-657 (f_audio_set_alt: copy_buf =3D f_audio_buff=
er_alloc(audio_buf_size); req buffers kzalloc(req_buf_size), req->length =
=3D req_buf_size), :893-895 (independent opts attributes)
Longstanding legacy gadget.

This was found during an assisted (AI-supported) static source review of
mainline 8a65162514fbad21a2c58ffed65f42b27e92b163 (v7.4-rc2 window, 2026-11=
-08). The patch below has NOT been compiled and has
NOT been runtime tested, and no reproducer was produced - the triggering
conditions are described above instead. Please treat this as a report for
verification rather than a battle-tested fix.

---
diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadg=
et/function/f_uac1_legacy.c
index 7c8d60c7e8..7e046ae806 100644
--- a/drivers/usb/gadget/function/f_uac1_legacy.c
+++ b/drivers/usb/gadget/function/f_uac1_legacy.c
@@ -615,6 +615,11 @@ static int f_audio_set_alt(struct usb_function *f, uns=
igned intf, unsigned alt)
 =09req_count =3D opts->req_count;
 =09audio_buf_size =3D opts->audio_buf_size;
=20
+=09/* A request buffer larger than the copy buffer would overflow it. */
+=09if (req_buf_size > audio_buf_size) {
+=09=09ERROR(cdev, "%s:%d Error!\n", __func__, __LINE__);
+=09=09return -EINVAL;
+=09}
 =09/* No i/f has more than 2 alt settings */
 =09if (alt > 1) {
 =09=09ERROR(cdev, "%s:%d Error!\n", __func__, __LINE__);

