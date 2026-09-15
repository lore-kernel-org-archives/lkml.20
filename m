Received: from mail.zipdox.net (195-240-81-79.fixed.kpn.net [195.240.81.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9555E3C09FB;
	Tue, 15 Sep 2026 12:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.240.81.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476885; cv=none; b=eOpcXxS6A9snqking0ap6fZUaoMp76u0OZ2WF2W6Oj1IU07HFcQfyQlTfNR1Iu3Qtbp8d/UAqs/KT6PWSjm8RedIB4NkCM/y5sGmHdamw7bEWvJzQXdL5mX3Zc8vhF6ANcDxjy/0eElXI4vgKU4oPs1lY6VmagZV+rE8AyVipQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476885; c=relaxed/simple;
	bh=Np7gCQviI+wONH1ryl8nrHO+f/VcjM570uofHD7V2oo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=nd2p9BKOBApSzBGvFCa0iB0XIrtUhigT6Vk+Wm3CrqMFlBGHq1bRFidf8QRcVAsNJA/SKsOwwGSv8ZScErjc5Q8MfzvHWizuz3ZtJN5x+Sa+akAuGbHeZUMqQYTwY7NUPJPBQUoj2TAhT5Asyyk5kINducCviZj48Sfaom90HfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zipdox.net; spf=pass smtp.mailfrom=zipdox.net; dkim=pass (2048-bit key) header.d=zipdox.net header.i=@zipdox.net header.b=LVr2WR1G; arc=none smtp.client-ip=195.240.81.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zipdox.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zipdox.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zipdox.net header.i=@zipdox.net header.b="LVr2WR1G"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4A88392106D;
	Tue, 15 Sep 2026 14:54:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zipdox.net; s=dkim;
	t=1789476879; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=TTK4nu/01hvDhuxiIXKCVENzQSwYTRKteQUwtj3hcyk=;
	b=LVr2WR1GYF3O2+HtD9iApLcFZgGfnKGDa+plTRZMI3WWBFBujPKDFbMiKn/f6i33BZnPWJ
	ky68DLJ/UnMaXwNnOx3ZVJPKp5HGioISdmjoUjPA440lXBkwhbdVrDcYNR+B+1fMIXwlko
	91ZqqB3/kbc8oWtsfVG6TOBXhUWSovysHgQ/lS1LJSVAagV5W/23wVhztKy2MNq7ip+UKg
	Pzz9h7ozDlIdSOOPRyYl/P9Yjvfospc1RIT+o1zHXkFYQj/F6eeldWAoHdtDm5uc1GchtO
	zZdug4nQKIjaW/De4ktmHqgtSGIbyXUBEEXNFwTEoDIEJ+yQxnE/gbalC28cAA==
Message-ID: <59b3dc9b-f324-42e7-ab03-a01c04e8b915@zipdox.net>
Date: Tue, 15 Sep 2026 14:54:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Zipdox <zipdox@zipdox.net>
Subject: Re: [PATCH] USB Audio Class 2 Mixer unit support for GET_CUR, SET_CUR
 and RANGE
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, perex@perex.cz,
 linux-kernel@vger.kernel.org, tiwai@suse.com
References: <d46fcac6-bd7e-4fc4-95e1-4e8d39f92ad3@zipdox.net>
 <87bj9yn55n.wl-tiwai@suse.de>
Content-Language: en-US
In-Reply-To: <87bj9yn55n.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/15/26 1:08 PM, Takashi Iwai wrote:
> Hmm, for UAC2, UAC_GET_CUR & co isn't passed as is at all, but the
> call is translated to UAC2_CS_CUR and UAC2_CS_RANGE accordingly in
> get_ctl_value_v2() (that is called from get_ctl_value()
> conditionally).  So this translation path was skipped somehow with
> your device...?

The request is translated yes, but wValue is incorrect. UAC2 uses a
Mixer Control Number ("mcn") in the low byte to identify the mixer
control, along with a control selector in the high byte (UAC2_MU_MIXER
in this case). UAC1 on the other hand uses the low and high byte to
identify the mixer control. It seems get_ctl_value_v2 doesn't change
wValue to the appropriate format (mcn and control selector). This code
was, as far as I understand it, never correct to begin with for UAC2.

To get the MIN, MAX, and RES, get_min_max_with_quirks currently calls
get_ctl_value three times to get the values separately. It looks like
get_ctl_value_v2 was written to send RANGE requests and extract the
appropriate part of the RANGE response, depending on the request. This
doesn't actually work though, because wValue is incorrect as I stated
above. It also unnecessarily sends three requests instead of one. That's
why I bypassed it entirely and wrote the get_ctl_range_16 function. This
could in theory be consolidated, but there's quite a bit of other code
so I'm hesitant to touch it. Supplying the correct wValue to
get_ctl_value in get_cur_mix_raw fixed getting the current value, and
the same applies to the call to snd_usb_mixer_set_ctl_value in
snd_usb_set_cur_mix_value.

> Could you try to reformat in a proper patch format?
> Also, it looks containing many unnecessary / unrelated changes that
> make review more difficult.  Please try to concentrate only on the
> change you really need.

Perhaps you are referring to the indentation changes resulting from
wrapping existing code in an if statement? I can't really do anything
about that. I don't think I changed any unrelated code itself. If there
are unrelated changes, please point them out to me. In any case, I
changed the patch to the "canonical patch format" as written in the
kernel docs.

From: Zipdox <zipdox@zipdox.net>

The USB Audio Mixer Unit driver (sound/usb/mixer.c) sends audio class
1.0 format control messages to devices, regardless of the actual audio
class version. This means audio class 2.0 devices will receive incorrect
messages, stall, and cause the driver to error (e.g. alsamixer exits
with a broken pipe error). This patch implements the GET_CUR, SET_CUR,
and RANGE control requests for mixer units according to the Audio Class
2.0 specification.

Subject: [PATCH] USB Audio Class 2 Mixer unit support for GET_CUR, SET_CUR and RANGE

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
