Received: from mail.zipdox.net (195-240-81-79.fixed.kpn.net [195.240.81.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717E9492180;
	Mon,  5 Oct 2026 13:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.240.81.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791208506; cv=none; b=YfgOpUc/lurMlwAMKZFQfkUj2JK1BCcrH8vBtSCrU6dWHIaM+PSHBk4luaGD5IwcwgeOPD0QUR6Q+ZlA4coR4ANiCyVEqqXe9/BtK03fltHpeFi7Mr5WISjFeZqCR1VL/dwaaxyHeewtNDLb2yF9J1VIFokeLt2BfqDo3r3Ot7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791208506; c=relaxed/simple;
	bh=+BatC2YvNhUQT+WHVB8X9vzhnVfnGQqnxRMRaiRZPHY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hu7aHpGXj40VRlfbX00StCQUgW1peCK08pWnonmt7G/F0xlAUmXO7bFOt7QO04zUe7pY1Ccmy4NgBDdMAX9Hh8ajlfqWOUVZAUHcUsdWwo69avdVPL8BC38p6F00W5DxbIXYG3YQzFxNlm+eUAKnsLKIagGakxTDGRrAYerHlWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zipdox.net; spf=pass smtp.mailfrom=zipdox.net; dkim=pass (2048-bit key) header.d=zipdox.net header.i=@zipdox.net header.b=kOaeF2BW; arc=none smtp.client-ip=195.240.81.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zipdox.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zipdox.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zipdox.net header.i=@zipdox.net header.b="kOaeF2BW"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A732B92AD4B;
	Mon, 05 Oct 2026 15:55:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zipdox.net; s=dkim;
	t=1791208501; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=TwH9Wvhc5PttMhya+EYsKUFolDwZ2xKry2XtEQAf4bw=;
	b=kOaeF2BWCtd81jfN48rrjMg4MbcC+4lE4oteq5KOv4B364Q9jMPjnwsChDOLQ1cx+Cu5G9
	vhOSCrgEKUdoMUYYb0JT6QO2Dn0g9f10vW2ixqN7kJj98lftk+76/AfBt5EXfFd072mLMN
	qy+p7o1NdDA9yr2Vw9sjREN18TRlqSGV4L+cGd0KAvWSWW7m9W1lRby/S4L86Ftd2jnO2f
	dk9bPu53I420+kfUnwGZ37QeSlSlDpNSsC9tOehWslw9jL6VehNTga8MjQCx2xCrTsFUqn
	fpWbEw8uHIP+31aDIR58TRz0laFoERwjXpUAFdNZjet7TgdIqq9eL2sJnKp7Jg==
Message-ID: <1dc7e21e-fcb5-4c35-8049-97254b011e27@zipdox.net>
Date: Mon, 5 Oct 2026 15:54:59 +0200
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
 <59b3dc9b-f324-42e7-ab03-a01c04e8b915@zipdox.net>
 <8733vamwaz.wl-tiwai@suse.de>
 <da56664f-901e-497b-a74c-ae41cbc5cac4@zipdox.net>
 <87a4phjjay.wl-tiwai@suse.de> <8733v9jfp1.wl-tiwai@suse.de>
 <87y0d1hx9y.wl-tiwai@suse.de>
 <895b9e3d-bc81-4688-8513-8aa42d40e4fa@zipdox.net>
 <05a53b37-8de3-4075-93c0-21129a839356@zipdox.net>
 <87se37g8gu.wl-tiwai@suse.de>
 <13f9ee6e-acf2-4166-93cc-33cbc2d4bd89@zipdox.net>
 <87o6dvg7ai.wl-tiwai@suse.de>
 <b3af9756-d008-46e6-9465-13a059584ead@zipdox.net>
 <87ik3p7iac.wl-tiwai@suse.de>
Content-Language: en-US
In-Reply-To: <87ik3p7iac.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/28/26 12:59 PM, Takashi Iwai wrote:
> I thought of it, too.  OTOH, it'll be a bit tricky, because the range
> isn't usually covering -32767 but only a part.  So -32768 won't be
> reached continuously.
> 
> I'm inclined to have a simple mute switch in addition.
> 
> 
> thanks,
> 
> Takashi

Actually I think this seems to work. We might have to do something with
dBmin and dBmax as well though, I don't fully understand their function.

---
  sound/usb/mixer.c | 26 +++++++++++++++++++++-----
  sound/usb/mixer.h |  2 +-
  2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 91d4c7373871..1653bb47ed6c 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -358,7 +358,7 @@ static int request_ctl_v2(struct usb_mixer_elem_info *cval, u8 request,
  		return -EIO;
  
  	/* correct wValue for UAC2 mixer control with MCN */
-	if (cval->v2_mixer)
+	if (cval->mixer_unit == 2)
  		validx = (UAC2_MU_MIXER << 8) | to_mcn(cval, validx);
  
  	memset(buf, 0, size);
@@ -400,9 +400,14 @@ static int get_cur_ctl_value(struct usb_mixer_elem_info *cval,
  {
  	validx += cval->idx_off;
  
-	return (cval->head.mixer->protocol == UAC_VERSION_1) ?
+	int value = (cval->head.mixer->protocol == UAC_VERSION_1) ?
  		request_ctl_v1(cval, UAC_GET_CUR, validx, value_ret) :
  		get_ctl_value_v2(cval, validx, value_ret);
+
+	/* Map -32768 (mute in mixer unit spec) to minimum */
+	if(cval->mixer_unit && value == -32768) value = cval->min;
+
+	return value;
  }
  
  /* channel = 0: master, 1 = first channel */
@@ -539,11 +544,16 @@ int snd_usb_mixer_set_ctl_value(struct usb_mixer_elem_info *cval,
  
  		request = UAC2_CS_CUR;
  
-		/* correct wValue for UAC2 mixer control with MCN */
-		if (cval->v2_mixer)
+		/* correct wValue for UAC2 mixer unit control with MCN */
+		if (cval->mixer_unit == 2)
  			validx = (UAC2_MU_MIXER << 8) | to_mcn(cval, validx);
  	}
  
+	/* Remap the lowest value to -32768 (mute per the spec for mixer units) */
+	if(cval->mixer_unit && value_set < (cval->min + cval->res)){
+		value_set = -32768;
+	}
+
  	value_set = convert_bytes_value(cval, value_set);
  	buf[0] = value_set & 0xff;
  	buf[1] = (value_set >> 8) & 0xff;
@@ -2390,7 +2400,11 @@ static void build_mixer_unit_ctl(struct mixer_build *state,
  	cval->control = in_ch + 1; /* based on 1 */
  	if (state->mixer->protocol == UAC_VERSION_2 ||
  	    state->mixer->protocol == UAC_VERSION_3)
-		cval->v2_mixer = true;
+	{
+		cval->mixer_unit = 2;
+	}else{
+		cval->mixer_unit = 1;
+	}
  	cval->num_outputs = num_outs;
  	cval->val_type = USB_MIXER_S16;
  	for (i = 0; i < num_outs; i++) {
@@ -2408,6 +2422,8 @@ static void build_mixer_unit_ctl(struct mixer_build *state,
  		usb_mixer_elem_info_free(cval);
  		return;
  	}
+	/* We will map the lowest setting to mute (-32768 per the spec) */
+	cval->min -= cval->res;
  
  	kctl = snd_ctl_new1(&usb_feature_unit_ctl, cval);
  	if (!kctl) {
diff --git a/sound/usb/mixer.h b/sound/usb/mixer.h
index cf45c39cbccc..2ace9b95da0a 100644
--- a/sound/usb/mixer.h
+++ b/sound/usb/mixer.h
@@ -98,7 +98,7 @@ struct usb_mixer_elem_info {
  	u8 min_mute;
  	u8 get_cur_broken;
  	u8 num_outputs;
-	bool v2_mixer;
+	int mixer_unit;
  	void *private_data;
  };
  
-- 
2.47.3

