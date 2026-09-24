Received: from smtp1.iinet.com (smtp1.iinet.com [52.129.46.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6322F30568F;
	Thu, 24 Sep 2026 23:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.129.46.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790291809; cv=none; b=pNy54PIFOLtgfQV5sg6K31qGoQ7e1Vwl+3silSqnhGtIAlJBJVuUfWW45RwL9rNTLKIKgbTL7Zrb2xOicYdBMS1s0rezCEeSLpqnJclXPNbZeSIViy5Iuf1mbJg+Utzy3HgazUu0i+NDiQKtpySc2AtIh7eIboD1cXesieJOzzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790291809; c=relaxed/simple;
	bh=7LTqjk3uxJTjNzmikCt5mXePqXbrDjVUPoae0utVOwQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gaLle4III3FlU0IGb/QhcomyF3CaT5FK4aDrBiTi3v5vL+9ifm6SU2wolH1kdIxk6SUyNToARYatPQ1KvCmzOnFbVtQV8Iy0edu75tX84lLCxt/7ueI6Tt8KelLr1sQW6ILzYdoNcn3ctzu6L+HazcPH4MIrq6yNoQUKpP8ZYQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nwlink.com; spf=pass smtp.mailfrom=nwlink.com; dkim=pass (2048-bit key) header.d=nwlink.com header.i=@nwlink.com header.b=YzjvRYR7; arc=none smtp.client-ip=52.129.46.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nwlink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nwlink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nwlink.com header.i=@nwlink.com header.b="YzjvRYR7"
Received: from porter.hsd1.wa.comcast.net (c-98-203-133-45.hsd1.wa.comcast.net [98.203.133.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kaf@nwlink.com)
	by smtp1.iinet.com (Postfix) with ESMTPSA id D579CC00AF2;
	Thu, 24 Sep 2026 15:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nwlink.com; s=mail;
	t=1790290261; bh=PosOUH3trIezg1gBhfLev8E24opIGobPdCiOHbf//8A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YzjvRYR7MULMy9EKnH73Lim8/462S6KB0hnsyGH344rllbrSMZ3nVChOEYYn1Q0o6
	 TXg+wz06lEiU2oqnJfv3foQqIs78qzrYcSmyhyDeSXzjJRK8LQ9pGxAX8pUhSuA8Pa
	 Oih8GmMaaix7lOMiYAEBBJ1LRr1SggceVENyZTI/iCm7KuKIUpbOHObrRZNk2JHuS8
	 xTGS365o62gGzWHcvR4TRFgrEjF7BdlPkt6OZcnlAuEbjfAdXmFO63PYHYx6wlA9MG
	 HffR5/2RRP03xf7hbmEYaPK2l9YVFeIbxa0AMDRHgy0FILpsAIB2Pysvu9Tidf2tRE
	 HxHTW1vOk3YEQ==
From: Kyle Farrell <kaf@nwlink.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Kyle Farrell <kaf@nwlink.com>
Subject: [PATCH v2 1/2] usb: gadget: u_audio: pass channel counts explicitly
Date: Thu, 24 Sep 2026 15:50:49 -0700
Message-Id: <20260924225050.2837727-2-kaf@nwlink.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260924225050.2837727-1-kaf@nwlink.com>
References: <20260924225050.2837727-1-kaf@nwlink.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

u_audio currently derives the channel count from the channel mask in
struct uac_params in several places.  Instead, pass the resolved count
explicitly, so the shared audio implementation does not depend on how
an individual USB audio function represents its channel configuration.

Initialize the new channel count fields from the existing channel masks.
This preserves generated descriptors and makes no change to user-visible
behavior.

Assisted-by: LLM
Signed-off-by: Kyle Farrell <kaf@nwlink.com>
---
 drivers/usb/gadget/function/f_uac1.c  |  2 ++
 drivers/usb/gadget/function/f_uac2.c  |  2 ++
 drivers/usb/gadget/function/u_audio.c | 32 ++++++++++++---------------
 drivers/usb/gadget/function/u_audio.h |  2 ++
 4 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac1.c b/drivers/usb/gadget/function/f_uac1.c
index 7a81cd176abd..17f856b96d2a 100644
--- a/drivers/usb/gadget/function/f_uac1.c
+++ b/drivers/usb/gadget/function/f_uac1.c
@@ -1448,6 +1448,7 @@ static int f_audio_bind(struct usb_configuration *c, struct usb_function *f)
 	audio->out_ep_maxpsize = le16_to_cpu(as_out_ep_desc.wMaxPacketSize);
 	audio->in_ep_maxpsize = le16_to_cpu(as_in_ep_desc.wMaxPacketSize);
 	audio->params.c_chmask = audio_opts->c_chmask;
+	audio->params.c_channels = num_channels(audio_opts->c_chmask);
 	memcpy(audio->params.c_srates, audio_opts->c_srates,
 			sizeof(audio->params.c_srates));
 	audio->params.c_ssize = audio_opts->c_ssize;
@@ -1461,6 +1462,7 @@ static int f_audio_bind(struct usb_configuration *c, struct usb_function *f)
 		audio->params.p_fu.volume_res = audio_opts->p_volume_res;
 	}
 	audio->params.p_chmask = audio_opts->p_chmask;
+	audio->params.p_channels = num_channels(audio_opts->p_chmask);
 	memcpy(audio->params.p_srates, audio_opts->p_srates,
 			sizeof(audio->params.p_srates));
 	audio->params.p_ssize = audio_opts->p_ssize;
diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index d8cf710085a0..46255ad0a9cf 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -1308,6 +1308,7 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 	agdev->gadget = gadget;
 
 	agdev->params.p_chmask = uac2_opts->p_chmask;
+	agdev->params.p_channels = num_channels(uac2_opts->p_chmask);
 	memcpy(agdev->params.p_srates, uac2_opts->p_srates,
 			sizeof(agdev->params.p_srates));
 	agdev->params.p_ssize = uac2_opts->p_ssize;
@@ -1320,6 +1321,7 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 		agdev->params.p_fu.volume_res = uac2_opts->p_volume_res;
 	}
 	agdev->params.c_chmask = uac2_opts->c_chmask;
+	agdev->params.c_channels = num_channels(uac2_opts->c_chmask);
 	memcpy(agdev->params.c_srates, uac2_opts->c_srates,
 			sizeof(agdev->params.c_srates));
 	agdev->params.c_ssize = uac2_opts->c_ssize;
diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index f0ee83abcebc..de0622ee72ab 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -390,25 +390,22 @@ static int uac_pcm_open(struct snd_pcm_substream *substream)
 	struct uac_params *params;
 	struct uac_rtd_params *prm;
 	int p_ssize, c_ssize;
-	int p_chmask, c_chmask;
 
 	audio_dev = uac->audio_dev;
 	params = &audio_dev->params;
 	p_ssize = params->p_ssize;
 	c_ssize = params->c_ssize;
-	p_chmask = params->p_chmask;
-	c_chmask = params->c_chmask;
 	uac->p_residue_mil = 0;
 
 	runtime->hw = uac_pcm_hardware;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		runtime->hw.formats = uac_ssize_to_fmt(p_ssize);
-		runtime->hw.channels_min = num_channels(p_chmask);
+		runtime->hw.channels_min = params->p_channels;
 		prm = &uac->p_prm;
 	} else {
 		runtime->hw.formats = uac_ssize_to_fmt(c_ssize);
-		runtime->hw.channels_min = num_channels(c_chmask);
+		runtime->hw.channels_min = params->c_channels;
 		prm = &uac->c_prm;
 	}
 
@@ -736,8 +733,7 @@ int u_audio_start_playback(struct g_audio *audio_dev)
 		factor = 8000;
 
 	/* pre-compute some values for iso_complete() */
-	uac->p_framesize = params->p_ssize *
-			    num_channels(params->p_chmask);
+	uac->p_framesize = params->p_ssize * params->p_channels;
 	uac->p_interval = factor / (1 << (ep_desc->bInterval - 1));
 	p_pktsize = min_t(unsigned int,
 				uac->p_framesize *
@@ -1205,7 +1201,7 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 	struct snd_pcm *pcm;
 	struct snd_kcontrol *kctl;
 	struct uac_params *params;
-	int p_chmask, c_chmask;
+	unsigned int p_channels, c_channels;
 	int i, err;
 
 	if (!g_audio)
@@ -1218,10 +1214,10 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 	uac->audio_dev = g_audio;
 
 	params = &g_audio->params;
-	p_chmask = params->p_chmask;
-	c_chmask = params->c_chmask;
+	p_channels = params->p_channels;
+	c_channels = params->c_channels;
 
-	if (c_chmask) {
+	if (c_channels) {
 		struct uac_rtd_params *prm = &uac->c_prm;
 
 		spin_lock_init(&prm->lock);
@@ -1245,7 +1241,7 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 		}
 	}
 
-	if (p_chmask) {
+	if (p_channels) {
 		struct uac_rtd_params *prm = &uac->p_prm;
 
 		spin_lock_init(&prm->lock);
@@ -1284,7 +1280,7 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 	 * Create a substream only for non-zero channel streams
 	 */
 	err = snd_pcm_new(uac->card, pcm_name, 0,
-			       p_chmask ? 1 : 0, c_chmask ? 1 : 0, &pcm);
+			       p_channels ? 1 : 0, c_channels ? 1 : 0, &pcm);
 	if (err < 0)
 		goto snd_fail;
 
@@ -1299,12 +1295,12 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 	 * Create mixer and controls
 	 * Create only if it's required on USB side
 	 */
-	if ((c_chmask && g_audio->in_ep_fback)
-			|| (p_chmask && params->p_fu.id)
-			|| (c_chmask && params->c_fu.id))
+	if ((c_channels && g_audio->in_ep_fback)
+			|| (p_channels && params->p_fu.id)
+			|| (c_channels && params->c_fu.id))
 		strscpy(card->mixername, card_name);
 
-	if (c_chmask && g_audio->in_ep_fback) {
+	if (c_channels && g_audio->in_ep_fback) {
 		kctl = snd_ctl_new1(&u_audio_controls[UAC_FBACK_CTRL],
 				    &uac->c_prm);
 		if (!kctl) {
@@ -1320,7 +1316,7 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 			goto snd_fail;
 	}
 
-	if (p_chmask) {
+	if (p_channels) {
 		kctl = snd_ctl_new1(&u_audio_controls[UAC_P_PITCH_CTRL],
 				    &uac->p_prm);
 		if (!kctl) {
diff --git a/drivers/usb/gadget/function/u_audio.h b/drivers/usb/gadget/function/u_audio.h
index 9512b8fccfaa..46e1d6b5ca4e 100644
--- a/drivers/usb/gadget/function/u_audio.h
+++ b/drivers/usb/gadget/function/u_audio.h
@@ -41,12 +41,14 @@ struct uac_fu_params {
 struct uac_params {
 	/* playback */
 	int p_chmask;	/* channel mask */
+	unsigned int p_channels;	/* resolved number of channels */
 	int p_srates[UAC_MAX_RATES];	/* available rates in Hz (0 terminated list) */
 	int p_ssize;	/* sample size */
 	struct uac_fu_params p_fu;	/* Feature Unit parameters */
 
 	/* capture */
 	int c_chmask;	/* channel mask */
+	unsigned int c_channels;	/* resolved number of channels */
 	int c_srates[UAC_MAX_RATES];	/* available rates in Hz (0 terminated list) */
 	int c_ssize;	/* sample size */
 	struct uac_fu_params c_fu;	/* Feature Unit parameters */
-- 
2.34.1

