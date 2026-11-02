Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793579592;
	b=OsLVfxpnxS0d3v9qV+07V5c2H9hSOYK0ptnGCFymk+85puud2XHHcy5zfsfZlXavLBHP
	 5luRENfZubz39gCQ4Ggi543wIy10lCEhzyEyplw/KIYbvqogwhaFOLAHFrzJCDVROMFDW
	 y6iCsHqC8N0FLR6uM6QA4p+bZzgIyqawJWCMovHrP5axz0QSnk8cojK9+X759jh0EsI+s
	 HDGX0P4AseVFGo5TBstcx2RSSOh+4GEUWEZobrpyAZCPawyzgNARMXLDanyQw2HgcVrD4
	 vbPXFB6h4qe5hA46134EujmGl+2v//qQyZgqBP5c1Id7F1DESNH/ICrIsucsfjUZ1CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793579592;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=Q94LXQfzczIlZClKST0uqu7LpAgcxEg5XPY3dnfGMJA=;
	b=LicHhGoBUuqaITSmfKklsGKCPj1GD661Dk13z173r7puSX8ZOfBwYWvc4YouJDnMBDn2
	 ccbOI27jJvsot/CmQ96oK5HCFquEKc+9eoFQHpkoPJ2Ld8cJKi1gA+DbqZH7HR83LX/tj
	 GYcAbuFyvYSL8fqhUkwjCeGLmkybQIx3TrjtDwnlFCoKgYhsviWBuYZQymIdrhWiCzw2D
	 MrPn5snkN61oqwoxXGbS3hb0VqY7oNvt/b274w0KMKbPkWHKZ+z9+qySbipd7aRTy9pRY
	 pL4tVKnUTHZBCJhEtD3wIwtklOWMWLl6DWd8zbMgEOf2V2VUhnEBklm1+oe2N9temDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=oNbBWE3Q;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A26B606A326;
	Mon,  2 Nov 2026 00:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A26B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=oNbBWE3Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1793579588; x=1794184388; i=arc@gmx.li;
	bh=Q94LXQfzczIlZClKST0uqu7LpAgcxEg5XPY3dnfGMJA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=oNbBWE3QbdjT6WgT3ZmxtH6SNTTjub9H04fK3YNowfN25P4cpjaVkbo9Ru3b6vg3
	 gYAGWA29gRBbSlc6pYavX7q7SJy0FL0Qq0QNmsBsFwDgEr1G52kKbyrHsPN+KfkTG
	 V9XtZMq8vUMsCh/vq/G9cYGdydaDJ3Jz2LfBntSpMtNuqtZcDG+XlQ1Wj/WmM3Khv
	 ICQW+27kvoW8aw14D73AAZRFOcZJL1FnH7m5GmBnLPW1c2XYQNpIc+spYNjuQU2Qx
	 9Z3n+RWtpHLqE4SMv+vxdmcyBw9zIHSpXsAwhNcD5fvidg2EklCVCCPrVu9eAwzzs
	 wtbMPJ8FykaLOVLVKg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MV63q-1wvazK0HH4-00XHdV; Mon, 02
 Nov 2026 01:33:08 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC V2 PATCH 09/11] ALSA: mixer_audient: Add readback-free parameter set
Date: Mon,  2 Nov 2026 01:32:55 +0100
Message-ID: <20261102003257.10134-10-arc@gmx.li>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102003257.10134-1-arc@gmx.li>
References: <20261101173557.221869-1-mrwillporter@gmail.com>
 <20261102003257.10134-1-arc@gmx.li>
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
X-Provags-ID: V03:K1:+0hZigxyS4waqUR8id/qmW5zQ7h2nsO+tkJXcbC9q1tnufu01I5
 MXTeUzxi893NlgE+XztF69gsIVCPUUgNhuUAwmzSxXQks0/6XbISBX3cBAHrD8kvTRyjc3T
 CSerclLDBQ0puqoYC5G+QPMEKvE0AO+aQEFtC8U5JDOb8PJABTTd0gPr9y24RSUJMK4S/7H
 AyuTfaYvKyOGLDwzOObNQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZffMKl0TnlE=;RMZpvGycmXk/kaFf3IaFrecHPOW
 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

Add a flag to systematically force parameter writing without prior readbac=
k
to certain control types. In preparation of the id14 driver.

Signed-off-by: Christian Ruppert <arc@gmx.li>
=2D--
 sound/usb/mixer_audient.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 70ec3274a5e4..f61f9fe61345 100644
=2D-- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -39,6 +39,7 @@ static const DECLARE_TLV_DB_MINMAX_MUTE(snd_audient_tlv_=
mixer, -12800, 600);
=20
 #define SND_AUDIENT_CTYPE_FLAGS_SIGNED		BIT(0)
 #define SND_AUDIENT_CTYPE_FLAGS_INIT_HW		BIT(1)
+#define SND_AUDIENT_CTYPE_FLAGS_FORCE_SET	BIT(2)
=20
 static const struct snd_audient_ctrl_type {
 	snd_ctl_elem_type_t type;
@@ -313,9 +314,13 @@ static int snd_audient_raw_set_one(struct usb_mixer_i=
nterface *const mixer,
 	int ret;
 	u32 val;
=20
-	ret =3D snd_audient_raw_get_one(mixer, ctype, cidx, &val);
-	if (ret < 0)
-		return ret;
+	if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_FORCE_SET) {
+		val =3D !value;		/* just make it different */
+	} else {
+		ret =3D snd_audient_raw_get_one(mixer, ctype, cidx, &val);
+		if (ret < 0)
+			return ret;
+	}
=20
 	if (val !=3D value) {
 		__le32 buf =3D cpu_to_le32(value);
=2D-=20
2.56.0

