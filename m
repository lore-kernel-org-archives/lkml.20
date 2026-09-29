Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5508A5208A2;
	Tue, 29 Sep 2026 12:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684177; cv=none; b=VKUFvZyRSQpOTwbABVjFLvioEm3lejjsxKjFaUpXhcj5hwpjwa6QUaPlPkyNXdV1pUwwSGyTRDfE9/DzZwuksCuM9QoSf03RztP0JazrMe6a0EHCxOwcUZDtVx70tK+Rca9vLR7QgpQtSgGreW0p110WjX/Vny2z+WkBNDceGlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684177; c=relaxed/simple;
	bh=ff9YVygyxz9FYcalm3McsaaAl3z/AyWCNSjHjvE+iZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eH6swTNbUgnAut+jIFjXYmdZpzpSK3zDd22SQLFK+xCqw44AawVSihQhh5dpynv2lU6yK82cXgZTlUo+49ScfGMatsRC9WZfLFn7TADp3CYfioM2qFcEjhSwr5fzwFvBGUmWNP/dylKpft0tvV9OX+BjQGF9uX3EbCZrmk2PUuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ly9UqRUo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HHzoQgF3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tTO14c0W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3APgEsDL; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ly9UqRUo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HHzoQgF3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tTO14c0W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3APgEsDL"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1B78721D8F;
	Tue, 29 Sep 2026 12:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790684169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z2tq37xcKs+joy7UoSAj9zu5oXmEj6LViRWbZf0oatY=;
	b=Ly9UqRUodRV7aNkje1j+RcANrFCHkzo4aJ569VrpuURrPo/OYFMCiqJqBKXH6+Q1WL3PYf
	CL4XnRmkFA+cFKa+1m4fU/hpUe4yW0QuysWFi9RDJ8hTOgsSDm7DBgpptGZIT3AfJkdO9n
	9T+R1jrOHDIN61JIOsAUafkK4HXX93c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790684169;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z2tq37xcKs+joy7UoSAj9zu5oXmEj6LViRWbZf0oatY=;
	b=HHzoQgF3loVK78gp8uYd4Mm3TjVQvmr24dcu1VYzaJJUJCfb8i+d6s2JOgLHXSFEwsysLL
	1NKEhgh6ygZNzPBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tTO14c0W;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3APgEsDL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790684165; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z2tq37xcKs+joy7UoSAj9zu5oXmEj6LViRWbZf0oatY=;
	b=tTO14c0WrcKF4o73bkj6yGEH+Ubom4j0tOvLTMFAOQTVMj/xM8KK84FxuGpiiGXVG0EJwt
	xgPx1qtEJBUtAtyjJpsHPJhqBtwLi3WJYXVRtFvAfKho489o80w+7UmpmM+hyfQUbWA/oe
	4VAFVD6N92/CkIkbarTDW9EKZ5ivGAQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790684165;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z2tq37xcKs+joy7UoSAj9zu5oXmEj6LViRWbZf0oatY=;
	b=3APgEsDL12FW/lsHKkSZB8r73FWApXHv6axxF2hWxgJYH62QMJ/R+noK2CWwZwR4Fe2tMO
	hte9YvxbwXNP2YBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8D70713710;
	Tue, 29 Sep 2026 12:16:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DPV9DQSsu2r/SgAAD6G6ig:T4
	(envelope-from <tiwai@suse.de>); Tue, 29 Sep 2026 12:16:04 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Zipdox <zipdox@zipdox.net>
Subject: [PATCH 3/3] ALSA: usb-audio: Optimize min/max/res parse for UAC2
Date: Tue, 29 Sep 2026 14:15:56 +0200
Message-ID: <20260929121558.1464094-4-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929121558.1464094-1-tiwai@suse.de>
References: <20260929121558.1464094-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.984];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email,suse.de:mid];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 1B78721D8F
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

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
 sound/usb/mixer.c | 209 ++++++++++++++++++++++++++--------------------
 1 file changed, 117 insertions(+), 92 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 54a512fb5fa8..6af51c50a542 100644
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
@@ -345,98 +346,72 @@ static unsigned int to_mcn(const struct usb_mixer_elem_info *cval,
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
@@ -466,6 +441,77 @@ int snd_usb_get_cur_mix_value(struct usb_mixer_elem_info *cval,
 	return 0;
 }
 
+/* extract the mixer min/max/res info from UAC1 feature / mixer unit */
+static int get_ctl_range_v1(struct usb_mixer_elem_info *cval, int validx)
+{
+	int last_valid_res = cval->res;
+
+	if (request_ctl_v1(cval, UAC_GET_MAX, validx, &cval->max) < 0 ||
+	    request_ctl_v1(cval, UAC_GET_MIN, validx, &cval->min) < 0) {
+		usb_audio_err(cval->head.mixer->chip,
+			      "%d:%d: cannot get min/max values for control %d (id %d)\n",
+			      cval->head.id, mixer_ctrl_intf(cval->head.mixer),
+			      cval->control, cval->head.id);
+		return -EAGAIN;
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
+	int ret, val_size, size;
+
+	val_size = uac2_ctl_value_size(cval->val_type);
+	size = sizeof(__u16) + 3 * val_size;
+
+	ret = request_ctl_v2(cval, UAC2_CS_RANGE, validx, buf, size);
+	if (ret < 0)
+		return ret;
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
@@ -1362,32 +1408,11 @@ static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
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

