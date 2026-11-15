Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779030;
	b=H/ir6J05PTXYtCWlgDrS+SYxXIqFN9Zofz3+L31vAHOsJRdKKx0Mvyxi7HB/ZC0TEJ7W
	 wcZHjYffRBhK6pvzb6u0mNuwxN1SHGcrS19ZT3pqnpPHEb+4UU6DDYpWBszmUW7q8dQUd
	 rs5zTc7JE1JraeTKrqV+I70pzPz/eokwNtUslDmxjAgJ2eEotZJFExitcCnFVDUwEIApN
	 s7fwIRJYBVGkKCsBv7Egfe746SBYFQlTAhG4c5sOnw6HgOgV1k0V350bZMIuOq+JhadA+
	 r37id68LY66QvDDVdGEwIrp8gx2oyjF1XvAKE8Mg0ydKSupyTHYsrq+ewz9KKznj+iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779030;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=hAu+9Q9WJ4jYr/fpyCY/M+/dTJEBLQOmY5qa5OTNp34=;
	b=LwTb1p3kydi4qHl5Ci9qsuCsRsMqCuYmTtbJ2wWBSW2nGyHvUpmh/2AcE1Ys6fz2riLd
	 w15EyD6MPd3NSnLZ38WbKJAViK/+fpU1ItuES6fH4kYYhiP2QMj4N0FlWs+4rGq10rYqN
	 ozHiX2U9ydfSManLGLxZWd0vBiKY5m6MHjqBn6gbEJhygEqwpJAe2AtWaqw4FUO1C51bD
	 rW6Y2P7Sg25NXU8CsN2YS70BkfIuBWPMuZNZIEPbSEa1EdE3J9JM43LasDk5iyhGQDr4w
	 lbcNy7Sg+ThuH7XaPyzhY37PVRjxTADecCsu7pU5hb8awJdV0DzqphRJ3efn4hvneNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b="rOFc/+Dz";
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417DE606A8A7
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:43:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 417DE606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=rOFc/+Dz
DKIM2-Signature:  i=1; m=1; t=1794779027;
 mf=PGFyY0BnbXgubGk+;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.li;
 s=s31663417:rsa-sha256:PmO9LTAxA5Mdsvr1XW/8aTHsUD/F
   /zvOuod7ilzK//fwOjHdIGJES5askdHgGbFtwABdEe04nmVRNcyCdA6l7lKjUYdOUB+7GZOSxbQ
   q/s0/tFVB1SUpp+47CQs1CVg8jDiw/Nzzc1jUJG3+/HIh3gHiqwUaO2EdQt1KSs6DNdaRbq/ayS
   co1+Kwp5N+g4uhmfyPT3cL2IOdtY9dphy23OPk7gSzXIfKcKlvTgJJw+szHTSu4UWyFU5kJcn0i
   Fn9CXA9jPkc6uy5YRbqu+9eE9djHYjWS0I4atJFpJjA2njLI4YXxgVhlaVNAkVxiteImg/uRnou
   hA8oxsAePLmdVQ==;
Message-Instance:  m=1;
 h=sha256:
   A03ftrmY6GaYEf2H/9Df+UiuNCyUrOJkpBBJecM8IPM=:
   4tzUBlnuoKYIGUxXhdrbcXai3hs2JlmgaDzXENBCUEM=,
  sha512:
   DgDs3+OsSEYSl8SVb9Z+OmjuEpAM9WP/ZKI8xQu4OsTsqWMMvut7QSSahRBWSKUgwzfo0tZyeXzsWAmpHS/hMg==:
   MoLs8IUbwft8VJadrLbqaPY2rVRm98NivAIMtykLkyHtFWPysKh13MaPlJAnaiSRIdImX5jUeUuo8BprBEvPxQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1794779027; x=1795383827; i=arc@gmx.li;
	bh=hAu+9Q9WJ4jYr/fpyCY/M+/dTJEBLQOmY5qa5OTNp34=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=rOFc/+DzxMpdy1FI0eIPHzzrdMmzkZgOE38GGLGMw+tmBf/lYF9GX/lgE4DHhUlo
	 EmNarVrNzz6g6+SG8HdM7KuYGNE9vHP/rlN7+QsWHRjJ6pB9SDJLqQnftrW5vSeJ4
	 fyUuNoWt2XTUhKKlSWh2b6R9kKvgle9QfySiNlsb2RGVcsjmBe0mFWSWovcqJapk9
	 m3CnogfDXSNe8/ljVHEE+6DLkW4QMlgwh/cSTMnxd4ZqEOUy3k9JZ3xVwuzM2HYuk
	 FOVSQAcOrWuOjIqiM273BKb31IUilj4oXA/lwTXO4COjaxrXj0eCHURkiB40N5Bn+
	 DhATtt9Cflbkj3NTJg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N63RQ-1wMi7u3koy-00sN1T; Sun, 15
 Nov 2026 22:43:47 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC V4 PATCH 08/19] ALSA: mixer_audient: Add control initialization at probe
Date: Sun, 15 Nov 2026 22:43:25 +0100
Message-ID: <20261115214336.17917-9-arc@gmx.li>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112023720.1503814-1-mrwillporter@gmail.com>
References: <20261112023720.1503814-1-mrwillporter@gmail.com>
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
X-Provags-ID: V03:K1:c5O3yLvOwpCW0vcoU+/wSCcAyXyzGMiB8AjXgAb5mjrKZCxUW5T
 J+jDjs6APWeqpFe3mdy1xuHxXcB07d9gOnwvZryrrkmROxGF8eSpb54D+KwD0g51on9JVB0
 74nk45n1TmOgDTGQzDw2bRskNFVypgzKR/9JwwUFlKy0wlRoIWnehq0vJyN2NYCoIl8s938
 4GzTL3Eu+j/9oi20wbHbQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:k+Bu76QBQLw=;i2B0NoTAF18Nkx7CXTkuY0rGrkT
 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

Add the possibility to initialize certain control types to known values at
probe time. This is particularly useful for controls which initially read
wrong values and for controls which cannot be read at all.

Signed-off-by: Christian Ruppert <arc@gmx.li>
Co-developed-by: Will Porter <mrwillporter@gmail.com>
Signed-off-by: Will Porter <mrwillporter@gmail.com>
=2D--
 sound/usb/mixer_audient.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 433bb5479d8e..70ec3274a5e4 100644
=2D-- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -38,6 +38,7 @@ enum snd_audient_type {
 static const DECLARE_TLV_DB_MINMAX_MUTE(snd_audient_tlv_mixer, -12800, 60=
0);
=20
 #define SND_AUDIENT_CTYPE_FLAGS_SIGNED		BIT(0)
+#define SND_AUDIENT_CTYPE_FLAGS_INIT_HW		BIT(1)
=20
 static const struct snd_audient_ctrl_type {
 	snd_ctl_elem_type_t type;
@@ -49,6 +50,7 @@ static const struct snd_audient_ctrl_type {
 	union {
 		long integer;
 	} max;		/* for booleans holds physical int value for true */
+	u32 init;
 	const unsigned int *tlv;
 	u8 unit;
 	u8 sel;
@@ -533,6 +535,20 @@ static int snd_audient_add_ctrl(struct usb_mixer_inte=
rface *mixer,
 		return -EINVAL;
 	}
=20
+	if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_INIT_HW) {
+		int i;
+
+		for (i =3D 0; i < ctrl->hwchannels; i++) {
+			int ret =3D snd_audient_raw_set_one(mixer, ctype,
+							  ctrl->val_offs + i,
+							  ctype->init);
+			if (ret < 0)
+				usb_audio_warn(mixer->chip,
+					       "%s: cannot set channel %d (%d)\n",
+					       ctrl->name, i, ret);
+		}
+	}
+
 	elem =3D kzalloc_obj(*elem);
 	if (!elem)
 		return -ENOMEM;
=2D-=20
2.56.1

