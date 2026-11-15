Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779034;
	b=hZandwZfq8sPY3gPP9giQx8Ro09XQkQGfeIB0k3hw9hbyWTlIWTRqBTcBSNHPzaDmxuG
	 50seFCHkBy8nrODM7oJwWwtGR5zxVqWbOVaJ1GF06mjskgacizad88pEPyYdCEKm7sZtr
	 YZoAN60GUZYj2NweWR8vZKPZ8ugXtz3t/4E7gV3Na+xrCq5oU4/odZHvn466Z5E8kwkNb
	 FYDByDUhlRqc4oABgA7B1nGFFbpGTzS3YG6FK+gspUzjXdI2tOfund0lLPU/rkvOd5t8d
	 gPoIWOqiYKzijX64gC7djUlk5eSY2UKlTXdXSzO1gHLpvN3z8TNsDzTtA9bc8ZjdnKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779034;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=KF+MTXEI2/8qam4948r3Dw/TXJ2goiVrxc0ECY97YOc=;
	b=yxGUmXuyvEVMlHweqaeT09tetW9EW1PQbyPkVfNt23GbEFgwCXeeWsUVeep+krbPj2Go
	 oDOc0hcqBBKZi+NK1D+P8IUoeQYzFHPJb84UWp0PRnGhfCR82LIel47syJe0MyEIrEoM0
	 X2lpO1YTb6O4i6rw7hImRs88PhDjk/GbrxKzsv4zrvpos0kG6XiYNYTgJkJv2JP9WkyNN
	 X2PJlJY5LtFwDLKj/2x7L7nuiKOPNw9eTwbzJ6UDfIho03qcHIeUKNo0lLp8oRx7/dgSS
	 osnn8xSISfbiHdG0mV06NcLHtB7zox9H3n5mwRZA3zvVKwM+ZZDKlfre1VfyaLalPqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=jw3fZevu;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3B4606A335
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:43:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B3B4606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=jw3fZevu
DKIM2-Signature:  i=1; m=1; t=1794779031;
 mf=PGFyY0BnbXgubGk+;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.li;
 s=s31663417:rsa-sha256:r55Bu35jw1lmP7KUfq5g350i3cTL
   e7ifSelx2S7SQKZejto6BYni/zJ3KdPYHUHUGagScszcHoSel4xh9uQ8F/q0tPfFgnghL10dwvN
   lX4VLf4zTmRyS8e6hcAVFT3a46Wk5pmhXy8ddOHFCzTYX+0715z9qR88JxiqQ+JpkCLZgC6jC3d
   jSGdrXMl2ZTgUWG/Dz95O5WzN2XF58OWzBUKW2szrpbt7hghzxQv3S8bVXGHfiaX8cZ4IlzUY+V
   GayofV+0nFkQVRyteZ1oxA4jspNwa1Memf50plBV1vXNjylDfSzpodYyHoxqtvwNugrfMwmX6i+
   fEBwYyhAdJYJcg==;
Message-Instance:  m=1;
 h=sha256:
   ZijXjrv/Yq8eeKGkNTNlYQYAAhpfMor8ubRks9iZGQs=:
   mCh1GaCO6ApnOlkM20Pc596rEubtVAdJw2SW5ef7u9o=,
  sha512:
   p8Weomopq+SBXeUGGpLyw6K1hPiOIB1pTMnh8YM5S73m5D/P5GCVE4ap3Q5s5ZxBZHDwAzSKxuJqHhH/bMGaoA==:
   FGUlwjYVVFukkmEzmRXiS7Sb5kYjKxFhf6rJVLkIdUf4pZ+bK62hc5A4GUSj93wbwdQlBbokkaQ0v/Tj5TGpcA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1794779030; x=1795383830; i=arc@gmx.li;
	bh=KF+MTXEI2/8qam4948r3Dw/TXJ2goiVrxc0ECY97YOc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=jw3fZevu8lgBBTt3Or5Gp5EyigN0napAzJNSjJRTEeTB4eb7xgSTWALHQt7M+jrz
	 8lq24fyxTf02RkvQu6nyjTngnTckvHH3F6bhgpIYxbCuRFWv1N0KEdf/19axNCeQ8
	 LaErC6Gy63ngb/C1Zt6bf1TWfMmL6dE77pi1NzSgq6nh8nbaG0eR/azKxZVE5/aRj
	 tQrLvhJUxEerM8ptMKdXKAxd1jwxTZUy8FwbDGWtykM7ADxewRlDee9nITlDK8hZX
	 VCYkrDwIy8GtEOGzGJa6y118l/tcAD86pKmsFkk9cH9gM0CKe9s4pEnJaKCMbwx+H
	 4U1qEQPPKThlJcHxTg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJE27-1x8i3Z2vxj-00LgYD; Sun, 15
 Nov 2026 22:43:50 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC V4 PATCH 12/19] ALSA: mixer_audient: Add a step size to integer controls
Date: Sun, 15 Nov 2026 22:43:29 +0100
Message-ID: <20261115214336.17917-13-arc@gmx.li>
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
X-Provags-ID: V03:K1:U62me00t02sKw+Tf23TGHyh09dyPTiMX/SYKleq/Jc1oLJvpkiZ
 gCG3cOH0blo6axhmpDiz23PYapVCyV5Koyb3jrHc629YAaiVk6qW6b+Z4+vWk481tEfAtFK
 G/qY9HpbiBejhh0bkZNVGaz4KRt6Aa+IFQPLhs4lRzjv5T/eg5dGjEDPs8Vfiauo4+Npn0+
 P7uQPlQHX/kfLn7S9yKyA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UJpnR0rUD9A=;5upid/wwNIdL51bX3W6lHjyqlNm
 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
 VQyTre8LZh2G+O2IEAJimc=

From: Will Porter <mrwillporter@gmail.com>

The iD14 level controls use s16 values in 1/256 dB. Expose them in
1 dB steps, matching the volume knob's adjustment. Let a control type
give a step size: the control then counts steps from the minimum, as
the generic USB mixer does with the RANGE resolution. A device value
between two steps reads as the nearest step, clamped to the maximum.
Types without a step size keep the device value.

Signed-off-by: Will Porter <mrwillporter@gmail.com>
=2D--
 sound/usb/mixer_audient.c | 55 ++++++++++++++++++++++++++++++---------
 1 file changed, 43 insertions(+), 12 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 8a858860033d..771a45cf6b45 100644
=2D-- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -53,6 +53,7 @@ static const struct snd_audient_ctrl_type {
 		long integer;
 	} max;		/* for booleans holds physical int value for true */
 	u32 init;	/* hardware and cache are initialized to this value */
+	unsigned int res;	/* integers: device units per control step, 0 =3D 1 */
 	const unsigned int *tlv;
 	u8 unit;
 	u8 sel;
@@ -418,6 +419,39 @@ static int snd_ctl_audient_boolean_set(struct snd_kco=
ntrol *kctl,
 	return changed;
 }
=20
+/*
+ * With a step size (res), an integer control counts steps from min:
+ * 0 ... (max - min) / res. Without one it shows the device value.
+ */
+static long snd_audient_int_max(const struct snd_audient_ctrl_type *ctype=
)
+{
+	return ctype->res ? (ctype->max.integer - ctype->min.integer) / ctype->r=
es
+			  : ctype->max.integer;
+}
+
+static long snd_audient_int_min(const struct snd_audient_ctrl_type *ctype=
)
+{
+	return ctype->res ? 0 : ctype->min.integer;
+}
+
+static long snd_audient_int_to_ctl(const struct snd_audient_ctrl_type *ct=
ype,
+				   long val)
+{
+	val =3D clamp(val, ctype->min.integer, ctype->max.integer);
+	if (!ctype->res)
+		return val;
+
+	/* round a device value between two steps to the nearest one */
+	return min(DIV_ROUND_CLOSEST(val - ctype->min.integer, (long)ctype->res)=
,
+		   snd_audient_int_max(ctype));
+}
+
+static long snd_audient_int_from_ctl(const struct snd_audient_ctrl_type *=
ctype,
+				     long val)
+{
+	return ctype->res ? ctype->min.integer + val * ctype->res : val;
+}
+
 static int snd_ctl_audient_integer_get(struct snd_kcontrol *kctl,
 				   struct snd_ctl_elem_value *ctl_val)
 {
@@ -448,17 +482,12 @@ static int snd_ctl_audient_integer_get(struct snd_kc=
ontrol *kctl,
 		else if (ret < 0)
 			return ret;
=20
-		if (val < ctype->min.integer)
-			val =3D ctype->min.integer;
-
-		if (val > ctype->max.integer)
-			val =3D ctype->max.integer;
-
-		ctl_val->value.integer.value[i] =3D val;
+		ctl_val->value.integer.value[i] =3D
+			snd_audient_int_to_ctl(ctype, val);
 	}
=20
 	for (; i < nchan; i++)
-		ctl_val->value.integer.value[i] =3D ctype->min.integer;
+		ctl_val->value.integer.value[i] =3D snd_audient_int_min(ctype);
=20
 	return 0;
 }
@@ -480,7 +509,8 @@ static int snd_ctl_audient_integer_set(struct snd_kcon=
trol *kctl,
 	for (i =3D 0; i < hwchan; i++) {
 		long val =3D ctl_val->value.integer.value[i];
=20
-		if ((val < ctype->min.integer) || (val > ctype->max.integer))
+		if (val < snd_audient_int_min(ctype) ||
+		    val > snd_audient_int_max(ctype))
 			return -EINVAL;
 	}
=20
@@ -491,7 +521,8 @@ static int snd_ctl_audient_integer_set(struct snd_kcon=
trol *kctl,
 	guard(mutex)(&mixer->lock);
=20
 	for (i =3D 0; i < hwchan; i++) {
-		s32 val =3D ctl_val->value.integer.value[i];
+		s32 val =3D snd_audient_int_from_ctl(ctype,
+						   ctl_val->value.integer.value[i]);
 		int ret;
=20
 		ret =3D snd_audient_raw_set_one(elem, ctype, base + i, val,
@@ -519,8 +550,8 @@ static int snd_ctl_audient_info(struct snd_kcontrol *k=
ctl,
 		uinfo->value.integer.min =3D 0;
 		uinfo->value.integer.max =3D 1;
 	} else {
-		uinfo->value.integer.min =3D ctype->min.integer;
-		uinfo->value.integer.max =3D ctype->max.integer;
+		uinfo->value.integer.min =3D snd_audient_int_min(ctype);
+		uinfo->value.integer.max =3D snd_audient_int_max(ctype);
 	}
=20
 	return 0;
=2D-=20
2.56.1

