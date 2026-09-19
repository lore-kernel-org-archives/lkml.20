Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35613376466;
	Sat, 19 Sep 2026 15:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789831144; cv=none; b=P4lV6rxQYsYpIn/uItavngo/1hgolrcu55qKyaI/DJN0//a+OEy33o7X0Hy9r6mWADUKDdf2vAibLaCB0khaGdS/Af0Zozjv/5YE/nsraKusDXGdNSrxg8TWOfOQYPOkfvcfJkF4VepUzsuxqZpmKBFZ7nUz6/cKrWG0EbII8Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789831144; c=relaxed/simple;
	bh=xmC+QB2UU+zl2BiuIUMcTTovkYMQyK+LxWwik+0ccSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rz4gyXkfVv7ZzNtD2zoBP13gTeCEJuivM0F2XZxOLm9LrUlhsK+gGlSxX8P596vg7xEarQrPh9+a127gngRHD8bsyT2cvgKRc7Gug4ye1PnQ5xAbuU2WIul6Gjof3DrvPwxuvm7PE+wkaRGclpX/mqrELKKkWe5J4MA1+8TOM+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li; spf=pass smtp.mailfrom=gmx.li; dkim=pass (2048-bit key) header.d=gmx.li header.i=arc@gmx.li header.b=KXb+gB0o; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.li header.i=arc@gmx.li header.b="KXb+gB0o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1789831140; x=1790435940; i=arc@gmx.li;
	bh=5d9PFEsMCXl2qFqGQofGZLyaz32vCIcLD9l1YFijCCw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KXb+gB0ogdKJuXf0NphRVODRFeEJG65IVPM/wP8uU6jb5SRywKKt6OngPU5oN954
	 UTa57j6ySSJLc6MDKSWea69kbmdG4434BR1G60C2lTx5dCvfG4rhuN9QTRR6H5czC
	 PH/XXEvnlzJjwXFCLbZkZNnqwOUGenWmbuSfsfaK/IpSMDc9CJBy0iSRm0QXCjAZ9
	 p4ZVZnzK8kmL0n5zkD/+rn0qMnMYI4Evlzo3QiHMYgsP4E8QHiXkD74iQypEGY6DW
	 PeUnbeZUgOsSZF0gPaGpwQ+OHSjobwjj0L7T36F7h7sbzpaf/lvhJLJCZ/DT94PH1
	 8J34tgry7AAUXfYXLA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4hzZ-1wg3z10IRL-010O4L; Sat, 19
 Sep 2026 17:19:00 +0200
From: Christian Ruppert <arc@gmx.li>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Christian Ruppert <arc@gmx.li>,
	Will Porter <mrwillporter@gmail.com>,
	Peter Drabik <drabik.p@gmail.com>,
	Neil Andrews <neil@androos.io>
Subject: [PATCH 3/3] Add Kconfig option for Audient EVO4 mixer quirks
Date: Sat, 19 Sep 2026 17:18:40 +0200
Message-ID: <20260919151840.24371-4-arc@gmx.li>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919151840.24371-1-arc@gmx.li>
References: <20260919151840.24371-1-arc@gmx.li>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SRDl1NxvUu8peSfRR2iqqgmq9z5Tzobd9smnIyeAS3TumaKKgpl
 pjGCmI1z/tTuAGS26MeGl8BE7GYbxs2CbIF6HhkFa3NpfR2xrKJ3MpNnBJjNkJkgosnu9g0
 vX53V+L9xPfrr5Xvnl+rcHlyRwfZNSFPTc0Di56riFvHqj7Z7C8FTeXig48VRXpw8z4KbWK
 rhaY9pqXsmgeuqwgv+yxQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bM2r6pZQH5Q=;yN6+Kw56r5995YSRrLPTy6qLDEl
 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

Add Kconfig option for the Audient EVO4 support. This is split out from
the evo4 driver so it can be optionally applied. Other mixer quirks don't
seem to have Kconfig options so I leave it to the upstream to decide what
to do with this.

Signed-off-by: Christian Ruppert <arc@gmx.li>
=2D--
 sound/usb/Kconfig        | 10 ++++++++++
 sound/usb/Makefile       |  3 ++-
 sound/usb/mixer_quirks.c |  4 ++++
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/usb/Kconfig b/sound/usb/Kconfig
index b4588915efa1..21039dd4ae3a 100644
=2D-- a/sound/usb/Kconfig
+++ b/sound/usb/Kconfig
@@ -175,6 +175,16 @@ config SND_USB_HIFACE
 	  To compile this driver as a module, choose M here: the module
 	  will be called snd-usb-hiface.
=20
+config SND_USB_EVO
+	bool "Audient EVO advanced mixer features"
+	help
+	  Support advanced mixer features for the Audient EVO4 USB audio
+	  interface such as
+	    * the recording mixer
+	    * the monitor crossfader
+	    * phantom power control
+	    * missing channel mute buttons
+
 config SND_BCD2000
 	tristate "Behringer BCD2000 MIDI driver"
 	select SND_RAWMIDI
diff --git a/sound/usb/Makefile b/sound/usb/Makefile
index 2e842dcc73de..f3664adeab85 100644
=2D-- a/sound/usb/Makefile
+++ b/sound/usb/Makefile
@@ -11,7 +11,6 @@ snd-usb-audio-y :=3D 	card.o \
 			helper.o \
 			implicit.o \
 			mixer.o \
-			mixer_evo.o \
 			mixer_quirks.o \
 			mixer_scarlett.o \
 			mixer_scarlett2.o \
@@ -27,6 +26,8 @@ snd-usb-audio-y :=3D 	card.o \
 snd-usb-audio-$(CONFIG_SND_USB_AUDIO_MIDI_V2) +=3D midi2.o
 snd-usb-audio-$(CONFIG_SND_USB_AUDIO_USE_MEDIA_CONTROLLER) +=3D media.o
=20
+snd-usb-audio-$(CONFIG_SND_USB_EVO) +=3D mixer_evo.o
+
 snd-usbmidi-lib-y :=3D midi.o
=20
 # Toplevel Module Dependency
diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 1e266fdbbb8e..c32ccff40122 100644
=2D-- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -38,7 +38,9 @@
 #include "mixer_scarlett2.h"
 #include "mixer_us16x08.h"
 #include "mixer_s1810c.h"
+#ifdef CONFIG_SND_USB_EVO
 #include "mixer_evo.h"
+#endif
 #include "helper.h"
 #include "fcp.h"
=20
@@ -4540,9 +4542,11 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mix=
er_interface *mixer)
 		err =3D snd_fcp_init(mixer);
 		break;
=20
+#ifdef CONFIG_SND_USB_EVO
 	case USB_ID(USB_AUDIENT_VID, USB_EVO4_PID): /* Audient EVO 4 */
 		err =3D snd_evo_controls_create(mixer);
 		break;
+#endif
=20
 	case USB_ID(0x041e, 0x323b): /* Creative Sound Blaster E1 */
 		err =3D snd_soundblaster_e1_switch_create(mixer);
=2D-=20
2.55.0

