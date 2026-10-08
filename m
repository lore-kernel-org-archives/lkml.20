Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB9A4A6CE0;
	Thu,  8 Oct 2026 19:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487570; cv=none; b=sKpcX00YA5rG7lpjdmbwea4egVWmjGNQ6ZQmQ1zQ8DJ3jha4561TYmgGZjcHGwRtnYgz0ZlXmal68KHoqDVrUJhZG/E0dxTiASge0GZCzDrqNC78mU8Y3ZxK2pBmD3Cn8qIPoB5sbutiAC4tktXafRBOyPTCgomage4BIjsDPp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487570; c=relaxed/simple;
	bh=V/N9R66pCNpBVWMD9cGIuonbyRELKl+xinMsabDSpfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vuxbr9doPfYOZP0Sp9Q+Wfx29JNW5/xyZW9OEkmdhwndSVIhJYWaOFhFZ+KBNmZlS91hOyd84cpfSpGmoyKCrTXvNgTVOTokqPMxNwDGYrIFSJ07zuD4sqnY9am+r5NgXv+zWwUO2Oxhg8UXE3lO8UMp6MaxsrvXhLd1/vNRjno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 760EB1F790;
	Thu,  8 Oct 2026 19:26:03 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3F1571339F;
	Thu,  8 Oct 2026 19:26:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dQZEOknux2ozCAAAD6G6ig:T8
	(envelope-from <tiwai@suse.de>); Thu, 08 Oct 2026 19:26:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 07/11] ALSA: usb: us16x08: Fix racy accesses of mixer elements
Date: Thu,  8 Oct 2026 21:25:47 +0200
Message-ID: <20261008192553.300025-8-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008192553.300025-1-tiwai@suse.de>
References: <20261008192553.300025-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=Unknown lua;
	unknown reason
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 760EB1F790
X-Rspamd-Pre-Result: action=no action;
	module=Unknown lua;
	unknown reason
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: 0.00
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.00 / 50.00]

All get and put callbacks for us16x08 mixer have no proper protection,
hence the concurrent accesses to multiple elements may face data
races, resulting in unexpected values.

Put the new mixer->lock mutex for protecting the concurrent accesses.

Fixes: d2bb390a2081 ("ALSA: usb-audio: Tascam US-16x08 DSP mixer quirk")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer_us16x08.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/usb/mixer_us16x08.c b/sound/usb/mixer_us16x08.c
index 8e5ccd3282a7..b447c4f7a161 100644
--- a/sound/usb/mixer_us16x08.c
+++ b/sound/usb/mixer_us16x08.c
@@ -189,6 +189,7 @@ static int snd_us16x08_route_get(struct snd_kcontrol *kcontrol,
 	struct usb_mixer_elem_info *elem = snd_kcontrol_chip(kcontrol);
 	int index = ucontrol->id.index;
 
+	guard(mutex)(&elem->head.mixer->lock);
 	/* route has no bias */
 	ucontrol->value.enumerated.item[0] = elem->cache_val[index];
 
@@ -204,6 +205,7 @@ static int snd_us16x08_route_put(struct snd_kcontrol *kcontrol,
 	char buf[sizeof(route_msg)];
 	int val, val_org, err;
 
+	guard(mutex)(&elem->head.mixer->lock);
 	/*  get the new value (no bias for routes) */
 	val = ucontrol->value.enumerated.item[0];
 
@@ -258,6 +260,7 @@ static int snd_us16x08_master_get(struct snd_kcontrol *kcontrol,
 	struct usb_mixer_elem_info *elem = snd_kcontrol_chip(kcontrol);
 	int index = ucontrol->id.index;
 
+	guard(mutex)(&elem->head.mixer->lock);
 	ucontrol->value.integer.value[0] = elem->cache_val[index];
 
 	return 0;
@@ -272,6 +275,7 @@ static int snd_us16x08_master_put(struct snd_kcontrol *kcontrol,
 	int val, err;
 	int index = ucontrol->id.index;
 
+	guard(mutex)(&elem->head.mixer->lock);
 	/* new control value incl. bias*/
 	val = ucontrol->value.integer.value[0];
 
@@ -310,6 +314,7 @@ static int snd_us16x08_bus_put(struct snd_kcontrol *kcontrol,
 
 	val = ucontrol->value.integer.value[0];
 
+	guard(mutex)(&elem->head.mixer->lock);
 	/* prepare the message buffer from template */
 	switch (elem->head.id) {
 	case SND_US16X08_ID_BYPASS:
@@ -346,6 +351,7 @@ static int snd_us16x08_bus_get(struct snd_kcontrol *kcontrol,
 {
 	struct usb_mixer_elem_info *elem = snd_kcontrol_chip(kcontrol);
 
+	guard(mutex)(&elem->head.mixer->lock);
 	switch (elem->head.id) {
 	case SND_US16X08_ID_BUSS_OUT:
 		ucontrol->value.integer.value[0] = elem->cache_val[0];
@@ -368,6 +374,7 @@ static int snd_us16x08_channel_get(struct snd_kcontrol *kcontrol,
 	struct usb_mixer_elem_info *elem = snd_kcontrol_chip(kcontrol);
 	int index = ucontrol->id.index;
 
+	guard(mutex)(&elem->head.mixer->lock);
 	ucontrol->value.integer.value[0] = elem->cache_val[index];
 
 	return 0;
@@ -382,6 +389,7 @@ static int snd_us16x08_channel_put(struct snd_kcontrol *kcontrol,
 	int val, err;
 	int index = ucontrol->id.index;
 
+	guard(mutex)(&elem->head.mixer->lock);
 	val = ucontrol->value.integer.value[0];
 
 	/* sanity check */
@@ -428,6 +436,7 @@ static int snd_us16x08_comp_get(struct snd_kcontrol *kcontrol,
 	int index = ucontrol->id.index;
 	int val_idx = COMP_STORE_IDX(elem->head.id);
 
+	guard(mutex)(&elem->head.mixer->lock);
 	ucontrol->value.integer.value[0] = store->val[val_idx][index];
 
 	return 0;
@@ -445,6 +454,7 @@ static int snd_us16x08_comp_put(struct snd_kcontrol *kcontrol,
 	int threshold, ratio, attack, release, gain, switch_on;
 	int err;
 
+	guard(mutex)(&elem->head.mixer->lock);
 	val = ucontrol->value.integer.value[0];
 
 	/* sanity check */
@@ -521,6 +531,7 @@ static int snd_us16x08_eqswitch_get(struct snd_kcontrol *kcontrol,
 	struct snd_us16x08_eq_store *store = elem->private_data;
 	int index = ucontrol->id.index;
 
+	guard(mutex)(&elem->head.mixer->lock);
 	/* get low switch from cache is enough, cause all bands are together */
 	val = store->val[EQ_STORE_BAND_IDX(elem->head.id)]
 		[EQ_STORE_PARAM_IDX(elem->head.id)][index];
@@ -540,6 +551,7 @@ static int snd_us16x08_eqswitch_put(struct snd_kcontrol *kcontrol,
 	int val, err = 0;
 	int b_idx;
 
+	guard(mutex)(&elem->head.mixer->lock);
 	/* new control value incl. bias*/
 	val = ucontrol->value.integer.value[0] + SND_US16X08_KCBIAS(kcontrol);
 
@@ -582,6 +594,7 @@ static int snd_us16x08_eq_get(struct snd_kcontrol *kcontrol,
 	int b_idx = EQ_STORE_BAND_IDX(elem->head.id) - 1;
 	int p_idx = EQ_STORE_PARAM_IDX(elem->head.id);
 
+	guard(mutex)(&elem->head.mixer->lock);
 	val = store->val[b_idx][p_idx][index];
 
 	ucontrol->value.integer.value[0] = val;
@@ -601,6 +614,7 @@ static int snd_us16x08_eq_put(struct snd_kcontrol *kcontrol,
 	int b_idx = EQ_STORE_BAND_IDX(elem->head.id) - 1;
 	int p_idx = EQ_STORE_PARAM_IDX(elem->head.id);
 
+	guard(mutex)(&elem->head.mixer->lock);
 	val = ucontrol->value.integer.value[0];
 
 	/* sanity check */
@@ -729,6 +743,7 @@ static int snd_us16x08_meter_get(struct snd_kcontrol *kcontrol,
 	struct snd_us16x08_meter_store *store = elem->private_data;
 	u8 meter_urb[64] = {0};
 
+	guard(mutex)(&elem->head.mixer->lock);
 	switch (kcontrol->private_value) {
 	case 0: {
 		char tmp[sizeof(mix_init_msg1)];
@@ -788,6 +803,7 @@ static int snd_us16x08_meter_put(struct snd_kcontrol *kcontrol,
 	struct snd_us16x08_meter_store *store = elem->private_data;
 	int val;
 
+	guard(mutex)(&elem->head.mixer->lock);
 	val = ucontrol->value.integer.value[0];
 
 	/* sanity check */
-- 
2.55.0

