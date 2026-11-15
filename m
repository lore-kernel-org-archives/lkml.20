Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779031;
	b=sx9/wfo01Q0BPv2JUZGaj0rlIaUmcHqP0tKUQ44j5uz0m/ZUBzOjf/Xo7qPwieUT01WX
	 78zoAJGpbUpM0VIQkXsl73L9nkyhJ9i2/k8PCGwRtN/hoOaTd9IjjPTkESsr+gnN7OTe4
	 sB0s/I8hLPiq0G/bHj63PfVSoiTK1H8aSpbuRlpEXREGLY9Sz2aRdlSXo6ynpe6wFqaXy
	 3sZzNqEBQ7BCZJkRBk2ExwipQmE175hJ8IxnfDeltLDDCECNo8UIvPTkBNTMUDTn5hBVO
	 eJCCCrmARUHEdeZFUfU1Ck7X5to/WbW1pHFZhbhwp1sY/92s6H8s7rTsunb1n1xwoIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779031;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=Nq9iBKfc7zIup5q3UKMvnERn2Wnnh0xrmDGOd9WehTU=;
	b=dky0Qb/SiOn4gh1W15F5+lM6zpMsoe9MwjdSeW7ztti6UXoUBG6CO3mGTJXDI3F9RKhE
	 Of1gCEQyGwqb9DC8Uu1v9xqUaI0QYWIni6KafCyV0eIi3RPXHg2D6wDX8+KCCh7HCsZFE
	 YRpNqOV68KODKcxfWNWd8O1wI12W7U4DxTK4rLcj+XXk5hwpOmylCg3+ITe9/cWxEGqkI
	 5JQ4G9l6qpZkyMVkAVZ5sDa783FprfVEDmIV9bhE/Z2oIJE1dY4KXKIRBVJXeKOzNo+Hq
	 gFcxcTNuOvP3CWB4qew9PqRUbON35DQ5uIhvvKoT2RLMW1a7YnD47ksFrgwoKVNEusQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=Ikco79q+;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863B4606A8B8
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 863B4606A8B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=Ikco79q+
DKIM2-Signature:  i=1; m=1; t=1794779028;
 mf=PGFyY0BnbXgubGk+;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.li;
 s=s31663417:rsa-sha256:QECtH2K8php6S7dWtySwWzbvtPVU
   I3HvdPbfjdezsWkX51rGAFS74JC2ex4CFxOxU7A77VWt48QQkMZ5rDzta5VN+XS/jiLrDZsd2pl
   AndHI98TlEeRzfnrv+yCEeWm3Iz444ZAhlJ2tHIXtgwdpacRld5KDvqag/16xg3lpRUX2Ng2aMT
   YD2HpSX4uvJT4CK8AZV4zY/hXx4cj5+0sgsfSHA7Yxm1LlOF7WzkWrwi1snpVxpayMabL74/Gil
   lQNN0ooLLJERuX5ygwI9jjIz+t/yRQVcP3sjshUu6+MdcchUw6pR5EbY7EHqrLdezH2886vGOOn
   44ScMrNwqdDh9Q==;
Message-Instance:  m=1;
 h=sha256:
   AgMZyosRVgfm5PgUseR+Rz5MzbGGKHpl9nlmyO6j75I=:
   5haM6o51QeWRlsUfV2dJcjgZks/QJxJbqTwDui+Gf44=,
  sha512:
   prR+rB/d1L0TwXk4eEmcgebHpm7HJiJbJfIpaUBcgtNUKjMMWNk6SZNjcIL0dHbtUTiRU7v9yLkgO1O9LOog9w==:
   ErhgQX2x+QVb3hJUvrBqBXJEvk3zZaxaJzDXyPRdRSrtDNMn4M4mxfIAAdqPTAzyLfW+ZUHrwvOjiyNxnG5r2Q==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1794779021; x=1795383821; i=arc@gmx.li;
	bh=Nq9iBKfc7zIup5q3UKMvnERn2Wnnh0xrmDGOd9WehTU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Ikco79q+4N/+lRjdQDkOIVKjW3d0CCGZmCfM8VM5O6H/R5yFNYPxv13YeThseGoV
	 rhI2exhqGyoJChAgkCnRMq8xuN4NtuB6xCn/3uPO/E3nHhK80ipAHyah2IR50Jjuo
	 yRYWqMjxNzkynOm+X7jgAAy/axO5RvVoRgV6/FxZtwJn2YcrfNFmXOFSbM/oBoXJ9
	 weo3v40+UfEDPigLQUAnjkQ4vtJDWnRSCBEI0sKcbFycsGgBm4x11dfGBkL1UDYue
	 zyBJd+VXVJFkD72I8F7lWW8+KJtxRhobuvAEJloOFXI11ZejwEd/f1ef5tpiBjCii
	 mJMJQDBrIUFIQXlhXQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6bjy-1wNFpL2WZK-0178JW; Sun, 15
 Nov 2026 22:43:41 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC V4 PATCH 02/19] ALSA: mixer_audient: explicitly define full control names
Date: Sun, 15 Nov 2026 22:43:19 +0100
Message-ID: <20261115214336.17917-3-arc@gmx.li>
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
X-Provags-ID: V03:K1:nPLQcG8QqpcLsWs2vXlU5rD1or6LFr995ZpDcZFvKT+Qfhlh7lH
 OcIQny1Fw8ke/zzVw9yZnvlMqdcMbLYSS+/0aY6rjyQ5u6DsxdMNgFGwgErCxK1JpP9lDy1
 c4X0rmKjDdmTBJ+AyXTYHmzDi0QzTKt9lucbBPk85bP+IuWjwb131lgi8Tz/N6HV4d07GVM
 CG8eEJIjCnJxiHs8W6DPw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YpSXn92B8Uw=;22bYlVjdrpxPoNKqL/gb0u7o1u/
 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
 XjYuMy+dri+eswxV0IetQo=

Previously, control names were dynamically created depending if the
control was an input or an output, a volume or a switch. Get rid of this
logic by simply defining the full name in the control structure.

Signed-off-by: Christian Ruppert <arc@gmx.li>
Signed-off-by: Will Porter <mrwillporter@gmail.com>
=2D--
 sound/usb/mixer_audient.c | 50 +++++++++++----------------------------
 1 file changed, 14 insertions(+), 36 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index e2700b08cf80..2afef52a12d9 100644
=2D-- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -90,107 +90,92 @@ static const struct snd_audient_ctrl_type {
 	},
 };
=20
-#define SND_AUDIENT_FLAGS_DIRECTION (1L<<0)
-#define SND_AUDIENT_FLAGS_CAPTURE (1L<<0)
-#define SND_AUDIENT_FLAGS_PLAYBACK (0L<<0)
=20
 struct snd_audient_ctrl {
-	char *basename;
+	char *name;
 	enum snd_audient_type type;
 	unsigned int channels;
 	unsigned int hwchannels;
 	unsigned int val_offs;
-	unsigned long flags;
 };
=20
 static const struct snd_audient_ctrl snd_audient_evo4_controls[] =3D {
 	{
-		.basename =3D "Master",
+		.name =3D "Master Playback Switch",
 		.type =3D SND_AUDIENT_TYPE_MUTE_OUT,
 		.channels =3D 1,
 		.hwchannels =3D 1,
 		.val_offs =3D 0,
-		.flags =3D SND_AUDIENT_FLAGS_PLAYBACK,
 	},
 	{
-		.basename =3D "Mic",
+		.name =3D "Mic Playback Switch",
 		.type =3D SND_AUDIENT_TYPE_MUTE,
 		.channels =3D 4,
 		.hwchannels =3D 2,
 		.val_offs =3D 0,
-		.flags =3D SND_AUDIENT_FLAGS_PLAYBACK,
 	},
 	{
-		.basename =3D "Monitor",
+		.name =3D "Monitor Playback Volume",
 		.type =3D SND_AUDIENT_TYPE_MONITOR,
 		.channels =3D 1,
 		.hwchannels =3D 1,
 		.val_offs =3D 0,
-		.flags =3D SND_AUDIENT_FLAGS_PLAYBACK,
 	},
 	{
-		.basename =3D "Mic 1",
+		.name =3D "Mic 1 Capture Volume",
 		.type =3D SND_AUDIENT_TYPE_MIXER,
 		.channels =3D 2,
 		.hwchannels =3D 2,
 		.val_offs =3D 0,
-		.flags =3D SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
-		.basename =3D "Mic 2",
+		.name =3D "Mic 2 Capture Volume",
 		.type =3D SND_AUDIENT_TYPE_MIXER,
 		.channels =3D 2,
 		.hwchannels =3D 2,
 		.val_offs =3D 2,
-		.flags =3D SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
-		.basename =3D "Master Left",
+		.name =3D "Master Left Capture Volume",
 		.type =3D SND_AUDIENT_TYPE_MIXER,
 		.channels =3D 2,
 		.hwchannels =3D 2,
 		.val_offs =3D 4,
-		.flags =3D SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
-		.basename =3D "Master Right",
+		.name =3D "Master Right Capture Volume",
 		.type =3D SND_AUDIENT_TYPE_MIXER,
 		.channels =3D 2,
 		.hwchannels =3D 2,
 		.val_offs =3D 6,
-		.flags =3D SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
-		.basename =3D "Loopback Left",
+		.name =3D "Loopback Left Capture Volume",
 		.type =3D SND_AUDIENT_TYPE_MIXER,
 		.channels =3D 2,
 		.hwchannels =3D 2,
 		.val_offs =3D 8,
-		.flags =3D SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
-		.basename =3D "Loopback Right",
+		.name =3D "Loopback Right Capture Volume",
 		.type =3D SND_AUDIENT_TYPE_MIXER,
 		.channels =3D 2,
 		.hwchannels =3D 2,
 		.val_offs =3D 10,
-		.flags =3D SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
-		.basename =3D "Mic 1 Phantom",
+		.name =3D "Mic 1 Phantom Capture Switch",
 		.type =3D SND_AUDIENT_TYPE_PHANTOM,
 		.channels =3D 1,
 		.hwchannels =3D 1,
 		.val_offs =3D 0,
-		.flags =3D SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
-		.basename =3D "Mic 2 Phantom",
+		.name =3D "Mic 2 Phantom Capture Switch",
 		.type =3D SND_AUDIENT_TYPE_PHANTOM,
 		.channels =3D 1,
 		.hwchannels =3D 1,
 		.val_offs =3D 1,
-		.flags =3D SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{ 0 }, /* sentinel */
 };
@@ -458,13 +443,12 @@ static int snd_audient_add_ctrl(struct usb_mixer_int=
erface *mixer,
 {
 	const struct snd_audient_ctrl_type *ctype
 					=3D &snd_audient_ctypes[ctrl->type];
-	char name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
 	struct snd_kcontrol_new knew =3D { 0 };
 	struct snd_kcontrol *kctl;
 	struct usb_mixer_elem_info *elem;
=20
 	knew.iface =3D SNDRV_CTL_ELEM_IFACE_MIXER;
-	knew.name =3D name;
+	knew.name =3D ctrl->name;
 	knew.info =3D snd_ctl_audient_info;
 	knew.private_value =3D snd_audient_kctl_priv(ctrl->type, ctrl->val_offs,
 						   ctrl->hwchannels);
@@ -486,12 +470,6 @@ static int snd_audient_add_ctrl(struct usb_mixer_inte=
rface *mixer,
 		return -EINVAL;
 	}
=20
-	snprintf(name, sizeof(name), "%s %s %s", ctrl->basename,
-		 ((ctrl->flags & SND_AUDIENT_FLAGS_DIRECTION)
-			=3D=3D SND_AUDIENT_FLAGS_CAPTURE) ? "Capture" : "Playback",
-		 (ctype->type =3D=3D SNDRV_CTL_ELEM_TYPE_BOOLEAN)
-			? "Switch" : "Volume");
-
 	elem =3D kzalloc_obj(*elem);
 	if (!elem)
 		return -ENOMEM;
@@ -524,7 +502,7 @@ int snd_audient_controls_create(struct usb_mixer_inter=
face *mixer)
 	if (!info->controls)
 		return -ENODEV;
=20
-	for (ctrl =3D info->controls; ctrl->basename; ctrl++) {
+	for (ctrl =3D info->controls; ctrl->name; ctrl++) {
 		const int ret =3D snd_audient_add_ctrl(mixer, ctrl);
=20
 		if (ret < 0)
=2D-=20
2.56.1

