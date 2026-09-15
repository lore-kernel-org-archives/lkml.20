Received: from mail.zipdox.net (195-240-81-79.fixed.kpn.net [195.240.81.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09C82BE043;
	Tue, 15 Sep 2026 08:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.240.81.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462462; cv=none; b=nfqh55Z+jyn6bnIBujpFomi4J801dHFCiW3UTSXoDvFrJ0a1lBicQiwM8dzzAmi1UjxrQib1kF181IAFlDqVrxdTFJoFRwVNBbVwUvzFHrcng9yl8v/lkoN9RIwB0RCWJw3Xr1Zsw5FkmLxyIppC4WJH5MiyKb7Kh7KB9UQDrSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462462; c=relaxed/simple;
	bh=9LPz7L6X5P4dEYz1uKv/Ef1iM6cGuItFM+Xvd6L08BM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=fnitqLhDnKeuK0z02/Dzt25kcV2p/XZsjW3IeyeKU500RGX+jKWae4yV7tghpjasftCsr889R2ND/QVB/gikOGa4hWzo2y4/fNRguspkvJcvT8AoXUyy6SQMtGW9t86q06+/piMnGemuluSp/J6qLunBv4P6wZjSEJQFculJVPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zipdox.net; spf=pass smtp.mailfrom=zipdox.net; dkim=pass (2048-bit key) header.d=zipdox.net header.i=@zipdox.net header.b=eq14+LSZ; arc=none smtp.client-ip=195.240.81.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zipdox.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zipdox.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zipdox.net header.i=@zipdox.net header.b="eq14+LSZ"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D7FD192106D;
	Tue, 15 Sep 2026 10:54:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zipdox.net; s=dkim;
	t=1789462450; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language;
	bh=jzvsCIw9SZQC5MHn/su9KiKcRUleJjkuv7xeSG5s+i8=;
	b=eq14+LSZuLpsmbHOP7L4w/tAqlcOMeYiAOiZXagysJXEMIlDPqfkwk3s+zzLevw9PXBRJ2
	0i+v3kFcv4+NbzQfHrR+0Yl+u7YI6ll9xJjTNgIjCgpIlewI0nVXZ25uJgJpNNVT6WZC/g
	NjA/IRb1XeXzOTVXahFUdKjMJEXXnKanpb/T9mg2ZF2Vk7T66zoixfHMR8OxoXeTSnZRGT
	qnCaH96983j/1pUJeDoq31wz+KTpj4KEs/cquCjh/d9N0jBs5PLAKRlpKkzmt4/pwgrquc
	gsqB8EgaD/e4y+93UN+VxcrWqTL4xfE8y+32VaXAWZiOFkYqSJTM0R4tMBLClA==
Message-ID: <d46fcac6-bd7e-4fc4-95e1-4e8d39f92ad3@zipdox.net>
Date: Tue, 15 Sep 2026 10:54:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Zipdox <zipdox@zipdox.net>
Subject: [PATCH] USB Audio Class 2 Mixer unit support for GET_CUR, SET_CUR and
 RANGE
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz, linux-kernel@vger.kernel.org, tiwai@suse.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hello,

The USB Audio Mixer Unit driver (sound/usb/mixer.c) sends audio class
1.0 format control messages to devices, regardless of the actual audio
class version. This means audio class 2.0 devices will receive incorrect
messages, stall, and cause the driver to error (e.g. alsamixer exits
with a broken pipe error). This patch implements the GET_CUR, SET_CUR,
and RANGE control requests for mixer units according to the Audio Class
2.0 specification.

I have one question though, which has to do with the get_cur_mix_raw
function. It states "channel = 0: master, 1 = first channel", but as far
as I know the spec doesn't specify a master control for mixer units. I
implemented it so that channel 0 results the channel 1 value, but maybe
some other solution is desirable.

From: Zipdox <zipdox@zipdox.net>
Date: Tue, 15 Sep 2026 10:12:01 +0200
Subject: [PATCH] USB Audio Class 2 Mixer unit support for GET_CUR, SET_CUR and
  RANGE

Signed-off-by: Zipdox <zipdox@zipdox.net>
---
  sound/usb/mixer.c | 191 ++++++++++++++++++++++++++++++++--------------
  1 file changed, 133 insertions(+), 58 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index ecaa8bc08d7c..99270731d409 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -360,12 +360,12 @@ static int get_ctl_value_v2(struct usb_mixer_elem_info *cval, int request,
  	{
  		CLASS(snd_usb_lock, pm)(chip);
  		if (pm.err)
-			return -EIO;
+		return -EIO;
  
-		idx = mixer_ctrl_intf(cval->head.mixer) | (cval->head.id << 8);
-		ret = snd_usb_ctl_msg(chip->dev, usb_rcvctrlpipe(chip->dev, 0), bRequest,
-				      USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_IN,
-				      validx, idx, buf, size);
+	idx = mixer_ctrl_intf(cval->head.mixer) | (cval->head.id << 8);
+	ret = snd_usb_ctl_msg(chip->dev, usb_rcvctrlpipe(chip->dev, 0), bRequest,
+			      USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_IN,
+			      validx, idx, buf, size);
  	}
  
  	if (ret < 0) {
@@ -410,6 +410,53 @@ static int get_ctl_value(struct usb_mixer_elem_info *cval, int request,
  		get_ctl_value_v2(cval, request, validx, value_ret);
  }
  
+static int get_ctl_range_16(struct usb_mixer_elem_info *cval)
+{
+	struct snd_usb_audio *chip = cval->head.mixer->chip;
+	int idx;
+	int ret;
+	__u16 wNumSubRanges;
+	__u8 range_res[8] = {0};
+
+	__u8 mcn = (cval->control - 1) * cval->channels;
+	__u16 wValue = (UAC2_MU_MIXER << 8) | mcn;
+
+	if (snd_usb_lock_shutdown(chip))
+		return -EIO;
+
+	idx = mixer_ctrl_intf(cval->head.mixer) | (cval->head.id << 8);
+	ret = snd_usb_ctl_msg(chip->dev, usb_rcvctrlpipe(chip->dev, 0), UAC2_CS_RANGE,
+			      USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_IN,
+			      wValue, idx, range_res, sizeof(range_res));
+	snd_usb_unlock_shutdown(chip);
+
+	if (ret < 0) {
+		usb_audio_dbg(chip,
+			"cannot get ctl range: req = %#x, wValue = %#x, wIndex = %#x\n",
+			UAC2_CS_RANGE, wValue, idx);
+		return ret;
+	}
+
+	wNumSubRanges = combine_word(&range_res[0]);
+	if(wNumSubRanges != 1) {
+		usb_audio_dbg(chip,
+			"unexpected wNumSubRanges (%u) for ctl range: req = %#x, wValue = %#x, wIndex = %#x\n",
+			(unsigned int)wNumSubRanges, UAC2_CS_RANGE, wValue, idx);
+		return -EIO;
+	}
+
+	cval->min = combine_word(&range_res[2]);
+	if (cval->min >= 0x8000) cval->min -= 0x10000;
+	cval->max = combine_word(&range_res[4]);
+	if (cval->max >= 0x8000) cval->max -= 0x10000;
+	cval->res = combine_word(&range_res[6]);
+	usb_audio_dbg(chip,
+		"range for mcn = %u: min = %d, max = %d, res = %d\n",
+		(unsigned int)mcn, cval->min, cval->max, cval->res);
+
+	return 0;
+}
+
  static int get_cur_ctl_value(struct usb_mixer_elem_info *cval,
  			     int validx, int *value)
  {
@@ -420,9 +467,18 @@ static int get_cur_ctl_value(struct usb_mixer_elem_info *cval,
  static inline int get_cur_mix_raw(struct usb_mixer_elem_info *cval,
  				  int channel, int *value)
  {
-	return get_ctl_value(cval, UAC_GET_CUR,
+	if(cval->head.mixer->protocol == UAC_VERSION_1){
+		return get_ctl_value(cval, UAC_GET_CUR,
  			     (cval->control << 8) | channel,
  			     value);
+	}else{
+		__u8 mcn = (cval->control - 1) * cval->channels + ((channel == 0 ? 1 : channel) - 1);
+		__u16 wValue = (UAC2_MU_MIXER << 8) | mcn;
+		return get_ctl_value(cval, UAC_GET_CUR,
+			     wValue,
+			     value);
+	}
+	
  }
  
  int snd_usb_get_cur_mix_value(struct usb_mixer_elem_info *cval,
@@ -527,9 +583,18 @@ int snd_usb_set_cur_mix_value(struct usb_mixer_elem_info *cval, int channel,
  		return 0;
  	}
  
-	err = snd_usb_mixer_set_ctl_value(cval,
-					  UAC_SET_CUR, (cval->control << 8) | channel,
-					  value);
+	if(cval->head.mixer->protocol == UAC_VERSION_1){
+		err = snd_usb_mixer_set_ctl_value(cval,
+						UAC_SET_CUR, (cval->control << 8) | channel,
+						value);
+	}else{
+		__u8 mcn = (cval->control - 1) * cval->channels + ((channel == 0 ? 1 : channel) - 1);
+		__u16 wValue = (UAC2_MU_MIXER << 8) | mcn;
+		err = snd_usb_mixer_set_ctl_value(cval,
+						UAC_SET_CUR, wValue,
+						value);
+	}
+
  	if (err < 0)
  		return err;
  	cval->cached |= BIT(channel);
@@ -1336,59 +1401,69 @@ static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
  	    cval->val_type == USB_MIXER_INV_BOOLEAN) {
  		cval->initialized = 1;
  	} else {
-		int minchn = 0;
-		if (cval->cmask) {
-			for (i = 0; i < MAX_CHANNELS; i++)
-				if (cval->cmask & BIT(i)) {
-					minchn = i + 1;
-					break;
-				}
-		}
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
-
-			while (cval->res > 1) {
-				if (snd_usb_mixer_set_ctl_value(cval, UAC_SET_RES,
-								(cval->control << 8) | minchn,
-								cval->res / 2) < 0)
-					break;
-				cval->res /= 2;
+		if(cval->head.mixer->protocol == UAC_VERSION_1){
+			int minchn = 0;
+			if (cval->cmask) {
+				for (i = 0; i < MAX_CHANNELS; i++)
+					if (cval->cmask & BIT(i)) {
+						minchn = i + 1;
+						break;
+					}
+			}
+			if (get_ctl_value(cval, UAC_GET_MAX, (cval->control << 8) | minchn, &cval->max) < 0 ||
+				get_ctl_value(cval, UAC_GET_MIN, (cval->control << 8) | minchn, &cval->min) < 0) {
+				usb_audio_err(cval->head.mixer->chip,
+						"%d:%d: cannot get min/max values for control %d (id %d)\n",
+					cval->head.id, mixer_ctrl_intf(cval->head.mixer),
+									cval->control, cval->head.id);
+				return -EAGAIN;
  			}
  			if (get_ctl_value(cval, UAC_GET_RES,
-					  (cval->control << 8) | minchn, &cval->res) < 0)
-				cval->res = last_valid_res;
-		}
-		if (cval->res == 0)
-			cval->res = 1;
+					(cval->control << 8) | minchn,
+					&cval->res) < 0) {
+				cval->res = 1;
+			} else if (cval->head.mixer->protocol == UAC_VERSION_1) {
+				int last_valid_res = cval->res;
+
+				while (cval->res > 1) {
+					if (snd_usb_mixer_set_ctl_value(cval, UAC_SET_RES,
+									(cval->control << 8) | minchn,
+									cval->res / 2) < 0)
+						break;
+					cval->res /= 2;
+				}
+				if (get_ctl_value(cval, UAC_GET_RES,
+						(cval->control << 8) | minchn, &cval->res) < 0)
+					cval->res = last_valid_res;
+			}
+			if (cval->res == 0)
+				cval->res = 1;
  
-		if (cval->min < cval->max) {
-			int saved;
+			if (cval->min < cval->max) {
+				int saved;
  
-			if (get_cur_mix_raw(cval, minchn, &saved) < 0)
-				goto no_checks;
+				if (get_cur_mix_raw(cval, minchn, &saved) < 0)
+					goto no_checks;
  
-			ret = check_sticky_volume_control(cval, minchn, saved);
-			if (ret)
-				goto no_checks;
+				ret = check_sticky_volume_control(cval, minchn, saved);
+				if (ret)
+					goto no_checks;
  
-			if (cval->min + cval->res < cval->max)
-				check_volume_control_res(cval, minchn, saved);
+				if (cval->min + cval->res < cval->max)
+					check_volume_control_res(cval, minchn, saved);
  
-			snd_usb_set_cur_mix_value(cval, minchn, 0, saved);
-		}
+				snd_usb_set_cur_mix_value(cval, minchn, 0, saved);
+			}
  
+		}else{
+			if(get_ctl_range_16(cval) < 0){
+				usb_audio_err(cval->head.mixer->chip,
+				"%d:%d: cannot get min/max values for control %d (id %d)\n",
+					cval->head.id, mixer_ctrl_intf(cval->head.mixer),
+									cval->control, cval->head.id);
+				return -EINVAL;
+			}
+		}
  no_checks:
  		/*
  		 * Got a non-fatal failure during sanity checks.
@@ -1983,9 +2058,9 @@ static void __build_feature_ctl(struct usb_mixer_interface *mixer,
  			       cval->head.id, kctl->id.name, cval->channels,
  			       cval->min, cval->max, cval->res);
  	} else {
-		usb_audio_dbg(mixer->chip, "[%d] FU [%s] ch = %d, val = %d/%d/%d\n",
-			      cval->head.id, kctl->id.name, cval->channels,
-			      cval->min, cval->max, cval->res);
+	usb_audio_dbg(mixer->chip, "[%d] FU [%s] ch = %d, val = %d/%d/%d\n",
+		      cval->head.id, kctl->id.name, cval->channels,
+		      cval->min, cval->max, cval->res);
  	}
  
  	snd_usb_mixer_add_control(&cval->head, kctl);
@@ -3550,7 +3625,7 @@ void snd_usb_mixer_notify_id(struct usb_mixer_interface *mixer, int unitid)
  		info = mixer_elem_list_to_info(list);
  		/* invalidate cache, so the value is read from the device */
  		if (!info->get_cur_broken)
-			info->cached = 0;
+		info->cached = 0;
  		snd_ctl_notify(mixer->chip->card, SNDRV_CTL_EVENT_MASK_VALUE,
  			       &list->kctl->id);
  	}
-- 
2.47.3
