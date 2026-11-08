Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794182244;
	b=m0O1FbSHQozGLgJZd0SNdEkRSDJpBL8tOYaVPLZ/L2IAWbacHxZeesUB+rjQCcVo5qvv
	 n5Q6YXpH4OExaMzc+8WBZjPz3x/3PGNSrwJbiL7+gSyI+oSYclo86EM6lrln1w1bhxWn0
	 lgqPP9iNSu40vaNOZZ6OngOvqLCn/tm1UV8IxIrMRqmU8P/B9dGisOw3ZmXy+Z0AfuQ0H
	 npxxkCTzeWXDdCCaivvE/3vSXsJYYZtxQ9zmMsnjeHHykxXXm2UqwQVpUyPV1bEqsfn2R
	 Vk9piYx0iCNLTl8EuKZbSvbMPKqe2SoDgwO1p2eqKIt2Fr124sihhWc0iE62QkiNOyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794182244;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=m6MwevcYAJrRQKpWEuDn6DG/Pz0m4+SeyltAkYOIp5I=;
	b=l4Rtaqy3zcWuz90e2JksBVgC8GcIR3Jyb5vLC4AlH5l4CdpfZZjFKH1W6qcxOd5kRNcz
	 DlI2nWRSxF028u/V2SL9YLqPm0z6WpM9ff3f9Hgx+hDTKiHlE+f1Npi8OLicOqXKauJ6q
	 ZLiuZw8+n15seLYlf2CcLkGYUsVO4aBUice7tOfueP/H1tSP+f9MWkGMHfqScRfUx9B6z
	 ksrmPxQakiju8U0tri3YAIKsFVZF2s/dD8C/qoTTjfaEbVWx8QHY6nrS8WjGnID02HWiG
	 W9o1g7sch3HbufCvq2UK8Q/TOQgIDIT22pv0Z/s9gNwSc3I0zl03lY/p+iMbeLiaghQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=ccUoiUVq;
	arc=none smtp.remote-ip=109.224.244.123
Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6CC606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A6CC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=ccUoiUVq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794182241; x=1794441441;
	bh=m6MwevcYAJrRQKpWEuDn6DG/Pz0m4+SeyltAkYOIp5I=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ccUoiUVqphZQ6RjUOmiekz+yBACsCgYK9al97Ge6a54xksFrRV4bW0SJN1hT9YKYv
	 jBES4U0YGZMyFGIFra6qUuRyTzs27+DnX+O//4/91bENm17NTmu7jwIBQoJWNKpYM7
	 C8yr/zp5hr5DrnAxezsWcS/GW7ccrrDqh4HaYICMLjxWNv8XO8QX8C5W1enSc03rOA
	 wpiOVOnBsEyzEKEP6n4TwwwIrmJLr93wRcuBH3SuE6ZxAW1xW42oN/KxVg//tWIgjJ
	 gzrOREtUmdmd+2XVz3hozI/2crFcOSFaSyWUW7eSxaY6orSqmvmKRMXRp2io7mBbyn
	 ZAJdhrC3JKaJg==
Date: Sun, 08 Nov 2026 23:57:16 +0000
To: "nkapron@google.com" <nkapron@google.com>
From: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] usb: gadget: u_audio: size feedback buffer for 4-byte writes
Message-ID: <ZZCeCtG8KkbZKU-WtjDtk-dcPPFBmHa4vBBRRZBiiN25HJHbTnkm8i2XPBeVlu8HA35UZ2XJIXs1eBbytjRa6hx0JBBlId0MUtOARiaQ1v0=@proton.me>
Feedback-ID: 186545857:user:proton
X-Pm-Message-ID: 0a7b03db4a0be0e6353c4d75924f032749c6f1e1
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

u_audio_set_fback_frequency() stores the feedback value with an
unconditional 4-byte write:

    *(__le32 *)buf =3D cpu_to_le32(ff);

but the feedback request buffer is allocated with the endpoint's
maxpacket size (u_audio.c: req_len =3D ep_fback->maxpacket; ...
kzalloc(req_len)),
and the full-speed feedback endpoint in f_uac2 (and f_uac1_legacy)
has wMaxPacketSize =3D 3. At full speed the store therefore writes one
byte past the allocation on every feedback completion. The FS shift
conversion just above already produces the correct 3-byte format -
only the store width is wrong.

The patch keeps the request length at maxpacket (3 bytes on the
wire) but sizes the buffer for the 4-byte store.

Affected version/commit: mainline 8a65162514fbad21a2c58ffed65f42b27e92b163 =
(v7.4-rc2 window, 2026-11-08), drivers/usb/gadget/function/u_audio.c:144-14=
6 (u_audio_set_fback_frequency ends with an unconditional *(__le32 *)buf =
=3D cpu_to_le32(ff)), :653 and :665 (req_len =3D ep_fback->maxpacket; req_f=
back->buf =3D kzalloc(req_len)), f_uac2.c:383-391 (fs_epin_fback_desc wMaxP=
acketSize =3D 3 at full speed)
Longstanding since the shared u_audio feedback path was added.

This was found during an assisted (AI-supported) static source review of
mainline 8a65162514fbad21a2c58ffed65f42b27e92b163 (v7.4-rc2 window, 2026-11=
-08). The patch below has NOT been compiled and has
NOT been runtime tested, and no reproducer was produced - the triggering
conditions are described above instead. Please treat this as a report for
verification rather than a battle-tested fix.

---
diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/fun=
ction/u_audio.c
index f0ee83abce..f7745131b0 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -662,7 +662,7 @@ int u_audio_start_capture(struct g_audio *audio_dev)
 =09req_fback->length =3D req_len;
 =09req_fback->complete =3D u_audio_iso_fback_complete;
=20
-=09req_fback->buf =3D kzalloc(req_len, GFP_ATOMIC);
+=09req_fback->buf =3D kzalloc(max_t(u32, req_len, 4), GFP_ATOMIC);
 =09if (!req_fback->buf)
 =09=09return -ENOMEM;
=20

