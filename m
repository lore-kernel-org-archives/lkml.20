Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793036676;
	b=FSO/MZ6nvRvog4wAX109ocBLb6sVkbs7yN048yTr8HXqHk3koMY3d9a68MPkeQTTVaAp
	 dRgtS8fhvuw2FNkUvcCqDpWsfBmMa5tViYWBrEdbBQ9MacjkvVfDDX0qBxcloGWpbf96b
	 CH6BF9ZjljidmhQxTlmKVRuWTuxDcBGQP8lhrcQ3DB0qEaH4o4iWxh9QTlqtEfJGdcCqR
	 KMUMdmnzaXdmM47MX8KIkfB4lvFsxlzbsjKJP4HmB4r427OtTzqvlwMdP6cxu4Cjzo7t1
	 6YOhHnnAYNtKrdNNEQrPAscyBqT87OdKC3dS6quoFnTnMctfWaL6GlikvYcoppntCtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793036676;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=1SP9yn9vu2U4wf5x50pB92KqDeQMdxjdXCvAZixeGEs=;
	b=bPOmoxGsgz+O0tLbX+IYoJZP7rd4thqkYk8XI/exS1AjwyZHM8EJ6bIVzSt8/9ywFQfG
	 oges8pQwOdLy5A3j2Hvxq6IlIyhCNnsQvn6g8HBGf/kpRTASvVgn6VvAAvwx1AscOVU+w
	 FCG5goTyaaM0E32VOpXxOK4ZUP0LreswuknXR8B8mv64p26YI1crHe+r1n3d0xvfAOkYd
	 ww3xZIRG0B9xxC3Tuo6LbOtj0exeGUi2eVicP8a+MNCPoqpmMK0EIpvTg7Of1F3NaReQf
	 7kJIOA2B4Q67VtCLiZqkuTMlZrTEVIo82ip/BmveuzuznQ++rFurf9ziAF8XXpArnLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=PIS0BBcY;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47546606A31D;
	Mon, 26 Oct 2026 17:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47546606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=PIS0BBcY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1793036673; x=1793641473; i=arc@gmx.li;
	bh=1SP9yn9vu2U4wf5x50pB92KqDeQMdxjdXCvAZixeGEs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=PIS0BBcYkIRwlH+rRNznLYVQ5YOyj+JzHx++fG7G9tymVi3n8bBymeVTcnYw3tZB
	 6JMV8W6Ty9/FAerqMr/tNU0e4ZaBUIJdogbfh9pKPKk1BrL/oZp0FDslz02S1IMql
	 X9RCpU8RUO8yEYk+X1UuNedWRHNgqpj164KCqEZiH/OzjKEd3oeCGCvB+cJUF12yd
	 u+Myw9UFymKqgUZhdRTFvZMcB5jbAIbGhjEfZ64qf5EHC+it779Ra8WjEqMjYY1kz
	 riHLPbqCrgk803pgy6OV1TSNxiJNt1raNJAME6pUCotf2PDK2sw2K/imA7WQB9lHP
	 N3Ph4LNkGTnaEWxnSA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLzFx-1x3amP4C4v-00Yw7Q; Mon, 26
 Oct 2026 18:44:33 +0100
From: Christian Ruppert <arc@gmx.li>
To: perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: arc@gmx.li,
	mrwillporter@gmail.com
Subject: [PATCH 1/4] ALSA: mixer_evo: Remove double end marker device list
Date: Mon, 26 Oct 2026 18:44:23 +0100
Message-ID: <20261026174427.24947-2-arc@gmx.li>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026174427.24947-1-arc@gmx.li>
References: <20261026174427.24947-1-arc@gmx.li>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dVuCHw+ORwRt6ytn5u3uMYic84ddcdeyaCi0TfL+ZvuXf0tX28t
 E3G93VTyzqhp47oD4aaCtV/+9UOR+T+mAvvL39IrHtg5avLCWUtghKnBBcEsLLIxoYb3mGa
 riniT+8UAyIA88Sb4LXp94XzBiMrvllXCK25lDnnNZXdrI0aVQKJyxYry6b9krMDKgBpqvq
 9PeCQKlKCsg2sxBxGxGlw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2OGVVwpzHv8=;XNRZua9KZICVQsc50XEh4p9C9Rd
 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

The evo_devinfo array accidentally contained two end-of-array markers.
This isn't harmful but not very clean. Remove one of them.

Signed-off-by: Christian Ruppert <arc@gmx.li>
=2D--
 sound/usb/mixer_evo.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/usb/mixer_evo.c b/sound/usb/mixer_evo.c
index c327b82c8d2d..26846108a3e1 100644
=2D-- a/sound/usb/mixer_evo.c
+++ b/sound/usb/mixer_evo.c
@@ -196,10 +196,6 @@ static const struct evo_devinfo {
 		.usb_id =3D USB_ID(USB_AUDIENT_VID, USB_EVO4_PID),
 		.controls =3D evo4_controls,
 	},
-	{
-		.usb_id =3D USB_ID(USB_AUDIENT_VID, USB_EVO4_PID),
-		.controls =3D NULL,
-	},
 	{ 0 } /* sentinel */
 };
=20
=2D-=20
2.56.0

