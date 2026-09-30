Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D674E06EC;
	Wed, 30 Sep 2026 13:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774691; cv=none; b=divsqO2nLYw/urEerQv6OF5f9/QT5OH0V+vrIHGT9WeH5AB55zrvwGEf/8HN6b3Jv4rPXWPhSBKLlsqtCT9gKVhyq7zrV7KUgGRkclBZoxqKGPx0eGLIv4yk4xT8Q0ZCw/cjDc0oj7mWl90g+cv3pMypuCUJDnG2B6tj7D61leA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774691; c=relaxed/simple;
	bh=GRhvdKFiICUOvR06Kfe1cP7/BqtXxEZfDxjvCk2A8Ao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tRSlUAmFf1KBio8P1qW3KHNy7RDFHjKXrIRclf3x480Lga8gQPgg81OcjGaUKnUfD03A6UdMPrGYTMSqa/jzatLQ9QKlnfChGmpk4Q04oXCdr69wUomPb8NyrtqQQ6db1C2xew1qpRBfs/5C1xhA26KrzGAkP4WoJjCXEqj7A2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wXqEf/FR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AXlF4PTm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MlttikGy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RkjZj006; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wXqEf/FR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AXlF4PTm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MlttikGy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RkjZj006"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2EA031F8D4;
	Wed, 30 Sep 2026 13:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790774671; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zAgeeEvfLdt7B6eUPRkft1u7AuLAaRaMW9hWM2uyYVE=;
	b=wXqEf/FRU2EfP+lM+SQbTMKHjVZKSv2ypZUDufP8E8EoafVWSsftwz7BOPXmvFK9Qw+LXr
	l6J+AD3XDZF0j823GTVjSxaYTT1LMlLrkr1jCPET0sWinVQzLQzdxhGApf8W/bzbMRHPkE
	GP9O8weXu+9mcVStEn4AtR/ANGk47zA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790774671;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zAgeeEvfLdt7B6eUPRkft1u7AuLAaRaMW9hWM2uyYVE=;
	b=AXlF4PTmUFvVz1jkrlk5FDyqad15HfjoDdaRv6KNIUYhj/7IwS5qW8NIHGHYBMHAQVMwK1
	N3uPLVoP/jYH6LAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790774667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zAgeeEvfLdt7B6eUPRkft1u7AuLAaRaMW9hWM2uyYVE=;
	b=MlttikGyw8wD92MLBnU/zcgG1nBkGNKnf9Rpr0zcneAC6w1PDn4BLpVGruJ2/Bfc0CCo/v
	L/Mg6+ejsUB6z3CBuEcLC+izDRje3nm/c8CZ1e5SIMV6PuQbtcZ0LgYf63pfmMi/7zzNph
	THeF2EhCVsz4L8UwbnJwfIRUiNIA25Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790774667;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zAgeeEvfLdt7B6eUPRkft1u7AuLAaRaMW9hWM2uyYVE=;
	b=RkjZj006FTSG3vlcTluu7er9nHYiNobiqKEHV+cxymRuaRcEuQ4pLVNvZXsNZGDq2Yhh0o
	nzLwHlmWlx4B1YCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AB83F13ABB;
	Wed, 30 Sep 2026 13:24:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IluyAYoNvWr8MQAAD6G6ig:T4
	(envelope-from <tiwai@suse.de>); Wed, 30 Sep 2026 13:24:26 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Zipdox <zipdox@zipdox.net>
Subject: [PATCH v2 3/3] ALSA: usb-audio: Optimize min/max/res parse for UAC2
Date: Wed, 30 Sep 2026 15:24:06 +0200
Message-ID: <20260930132419.297102-4-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930132419.297102-1-tiwai@suse.de>
References: <20260930132419.297102-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

UAC2 feature and mixer units provide the mixer information about
minimum and max channels as well as the resolution in a single
UAC2_CS_RANGE request, but the current code tries to extract each of
them in an old way of UAC1.

This patch refactors the code to optimize the range info extraction
for UAC2.  Now the code for obtaining min/max/res info is done in
get_ctl_range() function.  For UAC1, this will call UAC_GET_MIN,
UAC_GET_MAX and UAC_GET_RES requests, while it calls a single
UAC2_CS_RANGE for UAC2/3.

Link: https://lore.kernel.org/d46fcac6-bd7e-4fc4-95e1-4e8d39f92ad3@zipdox.net
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: addressed missing cval->idx_off, return -EAGAIN for errors to
	align with the previous behavior

 sound/usb/mixer.c | 210 ++++++++++++++++++++++++++--------------------
 1 file changed, 118 insertions(+), 92 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index a8bdd1696a20..1757bbc631ed 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -304,8 +304,9 @@ static inline int mixer_ctrl_intf(struct usb_mixer_interface *mixer)
 	return get_iface_desc(mixer->hostif)->bInterfaceNumber;
 }
 
-static int get_ctl_value_v1(struct usb_mixer_elem_info *cval, int request,
-			    int validx, int *value_ret)
+/* send a request for UAC1 feature & mixer unit */
+static int request_ctl_v1(struct usb_mixer_elem_info *cval, u8 request,
+			  int validx, int *value_ret)
 {
 	struct snd_usb_audio *chip = cval->head.mixer->chip;
 	unsigned char buf[2];
@@ -346,98 +347,72 @@ static unsigned char to_mcn(const struct usb_mixer_elem_info *cval,
 	return (m - 1) * cval->num_outputs + (v - 1);
 }
 
-static int get_ctl_value_v2(struct usb_mixer_elem_info *cval, int request,
-			    int validx, int *value_ret)
+/* send a request for UAC2 feature & mixer unit */
+static int request_ctl_v2(struct usb_mixer_elem_info *cval, u8 request,
+			  int validx, unsigned char *buf, int size)
 {
 	struct snd_usb_audio *chip = cval->head.mixer->chip;
-	/* enough space for one range */
-	unsigned char buf[sizeof(__u16) + 3 * sizeof(__u32)];
-	unsigned char *val;
-	int idx = 0, ret, val_size, size;
-	__u8 bRequest;
+	int idx, ret;
 
-	val_size = uac2_ctl_value_size(cval->val_type);
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err)
+		return -EIO;
 
 	/* correct wValue for UAC2 mixer control with MCN */
 	if (cval->v2_mixer)
 		validx = (UAC2_MU_MIXER << 8) | to_mcn(cval, validx);
 
-	if (request == UAC_GET_CUR) {
-		bRequest = UAC2_CS_CUR;
-		size = val_size;
-	} else {
-		bRequest = UAC2_CS_RANGE;
-		size = sizeof(__u16) + 3 * val_size;
-	}
-
-	memset(buf, 0, sizeof(buf));
-
-	{
-		CLASS(snd_usb_lock, pm)(chip);
-		if (pm.err)
-			return -EIO;
-
-		idx = mixer_ctrl_intf(cval->head.mixer) | (cval->head.id << 8);
-		ret = snd_usb_ctl_msg(chip->dev, usb_rcvctrlpipe(chip->dev, 0), bRequest,
-				      USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_IN,
-				      validx, idx, buf, size);
-	}
-
-	if (ret < 0) {
+	memset(buf, 0, size);
+	idx = mixer_ctrl_intf(cval->head.mixer) | (cval->head.id << 8);
+	ret = snd_usb_ctl_msg(chip->dev, usb_rcvctrlpipe(chip->dev, 0),
+			      request,
+			      USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_IN,
+			      validx, idx, buf, size);
+	if (ret < 0)
 		usb_audio_dbg(chip,
 			"cannot get ctl value: req = %#x, wValue = %#x, wIndex = %#x, type = %d\n",
 			request, validx, idx, cval->val_type);
+
+	return ret;
+}
+
+/* read the current value for UAC2 */
+static int get_ctl_value_v2(struct usb_mixer_elem_info *cval,
+			    int validx, int *value_ret)
+{
+	/* enough space for one value */
+	unsigned char buf[sizeof(__u32)];
+	int ret, val_size;
+
+	val_size = uac2_ctl_value_size(cval->val_type);
+
+	ret = request_ctl_v2(cval, UAC2_CS_CUR, validx, buf, val_size);
+	if (ret < 0)
 		return ret;
-	}
-
-	/* FIXME: how should we handle multiple triplets here? */
-
-	switch (request) {
-	case UAC_GET_CUR:
-		val = buf;
-		break;
-	case UAC_GET_MIN:
-		val = buf + sizeof(__u16);
-		break;
-	case UAC_GET_MAX:
-		val = buf + sizeof(__u16) + val_size;
-		break;
-	case UAC_GET_RES:
-		val = buf + sizeof(__u16) + val_size * 2;
-		break;
-	default:
-		return -EINVAL;
-	}
 
 	*value_ret = convert_signed_value(cval,
-					  snd_usb_combine_bytes(val, val_size));
-
+					  snd_usb_combine_bytes(buf, val_size));
 	return 0;
 }
 
-static int get_ctl_value(struct usb_mixer_elem_info *cval, int request,
-			 int validx, int *value_ret)
+/* read the current value */
+static int get_cur_ctl_value(struct usb_mixer_elem_info *cval,
+			     int validx, int *value_ret)
 {
 	validx += cval->idx_off;
 
 	return (cval->head.mixer->protocol == UAC_VERSION_1) ?
-		get_ctl_value_v1(cval, request, validx, value_ret) :
-		get_ctl_value_v2(cval, request, validx, value_ret);
-}
-
-static int get_cur_ctl_value(struct usb_mixer_elem_info *cval,
-			     int validx, int *value)
-{
-	return get_ctl_value(cval, UAC_GET_CUR, validx, value);
+		request_ctl_v1(cval, UAC_GET_CUR, validx, value_ret) :
+		get_ctl_value_v2(cval, validx, value_ret);
 }
 
 /* channel = 0: master, 1 = first channel */
 static inline int get_cur_mix_raw(struct usb_mixer_elem_info *cval,
 				  int channel, int *value)
 {
-	return get_ctl_value(cval, UAC_GET_CUR,
-			     (cval->control << 8) | channel,
-			     value);
+	return get_cur_ctl_value(cval,
+				 (cval->control << 8) | channel,
+				 value);
 }
 
 int snd_usb_get_cur_mix_value(struct usb_mixer_elem_info *cval,
@@ -467,6 +442,78 @@ int snd_usb_get_cur_mix_value(struct usb_mixer_elem_info *cval,
 	return 0;
 }
 
+/* extract the mixer min/max/res info from UAC1 feature / mixer unit */
+static int get_ctl_range_v1(struct usb_mixer_elem_info *cval, int validx)
+{
+	int last_valid_res;
+
+	if (request_ctl_v1(cval, UAC_GET_MAX, validx, &cval->max) < 0 ||
+	    request_ctl_v1(cval, UAC_GET_MIN, validx, &cval->min) < 0) {
+		usb_audio_err(cval->head.mixer->chip,
+			      "%d:%d: cannot get min/max values for control %d (id %d)\n",
+			      cval->head.id, mixer_ctrl_intf(cval->head.mixer),
+			      cval->control, cval->head.id);
+		return -EAGAIN; /* handled by the caller later again */
+	}
+
+	if (request_ctl_v1(cval, UAC_GET_RES, validx, &cval->res) < 0) {
+		cval->res = 1;
+		return 0;
+	}
+
+	last_valid_res = cval->res;
+	while (cval->res > 1) {
+		if (snd_usb_mixer_set_ctl_value(cval, UAC_SET_RES,
+						validx, cval->res / 2) < 0)
+			break;
+		cval->res /= 2;
+	}
+	if (request_ctl_v1(cval, UAC_GET_RES, validx, &cval->res) < 0)
+		cval->res = last_valid_res;
+
+	return 0;
+}
+
+/* extract the mixer min/max/res info from UAC2 feature / mixer unit */
+static int get_ctl_range_v2(struct usb_mixer_elem_info *cval, int validx)
+{
+	/* enough space for one range */
+	unsigned char buf[sizeof(__u16) + 3 * sizeof(__u32)];
+	unsigned char *val;
+	int val_size, size;
+
+	val_size = uac2_ctl_value_size(cval->val_type);
+	size = sizeof(__u16) + 3 * val_size;
+
+	if (request_ctl_v2(cval, UAC2_CS_RANGE, validx, buf, size) < 0)
+		return -EAGAIN; /* handled by the caller later again */
+
+	/* FIXME: how should we handle multiple triplets here? */
+	val = buf + 2;
+	cval->min = convert_signed_value(cval, snd_usb_combine_bytes(val, val_size));
+	val += val_size;
+	cval->max = convert_signed_value(cval, snd_usb_combine_bytes(val, val_size));
+	val += val_size;
+	cval->res = convert_signed_value(cval, snd_usb_combine_bytes(val, val_size));
+	return 0;
+}
+
+/* extract the mixer min/max/res info */
+static int get_ctl_range(struct usb_mixer_elem_info *cval, int validx)
+{
+	validx += cval->idx_off;
+
+	switch (cval->head.mixer->protocol) {
+	case UAC_VERSION_1:
+		return get_ctl_range_v1(cval, validx);
+	case UAC_VERSION_2:
+	case UAC_VERSION_3:
+		return get_ctl_range_v2(cval, validx);
+	default:
+		return -EINVAL;
+	}
+}
+
 /*
  * set a mixer value
  */
@@ -1363,32 +1410,11 @@ static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
 					break;
 				}
 		}
-		if (get_ctl_value(cval, UAC_GET_MAX, (cval->control << 8) | minchn, &cval->max) < 0 ||
-		    get_ctl_value(cval, UAC_GET_MIN, (cval->control << 8) | minchn, &cval->min) < 0) {
-			usb_audio_err(cval->head.mixer->chip,
-				      "%d:%d: cannot get min/max values for control %d (id %d)\n",
-				   cval->head.id, mixer_ctrl_intf(cval->head.mixer),
-							       cval->control, cval->head.id);
-			return -EAGAIN;
-		}
-		if (get_ctl_value(cval, UAC_GET_RES,
-				  (cval->control << 8) | minchn,
-				  &cval->res) < 0) {
-			cval->res = 1;
-		} else if (cval->head.mixer->protocol == UAC_VERSION_1) {
-			int last_valid_res = cval->res;
 
-			while (cval->res > 1) {
-				if (snd_usb_mixer_set_ctl_value(cval, UAC_SET_RES,
-								(cval->control << 8) | minchn,
-								cval->res / 2) < 0)
-					break;
-				cval->res /= 2;
-			}
-			if (get_ctl_value(cval, UAC_GET_RES,
-					  (cval->control << 8) | minchn, &cval->res) < 0)
-				cval->res = last_valid_res;
-		}
+		ret = get_ctl_range(cval, (cval->control << 8) | minchn);
+		if (ret < 0)
+			return ret;
+
 		if (cval->res == 0)
 			cval->res = 1;
 
-- 
2.55.0

