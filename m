Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093DB26AC5
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791865295; cv=pass; b=iTa/t6eQcQb2+gHReZ3eDUvRtDSAa9tSDC47Yi9BHf4cSUxcFCqXwFzSZWpj73mq4Pdh4zdl9NHUE6qWfYYv9AOVb3XPbkfWbnj7O33jBpIDmYkYly86hcLzsT3m49BV8IcKBHv4HpKVTiz8j9m7ySeMYYPWzmxBdc6kBRnEJu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791865295; c=relaxed/simple;
	bh=s6UERuIWoDc23HHG9uQ4eEESgIt4iH+Blk1X9q9b2kE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tAGMAsK8k7cQ3bl6k7s3Ee78zAEJy3n2n1pdGJgE5MSu4yaVNhbB/aNW5/M/NaoYfKyOkR8uT69e+2NL+A1eh5D0y/fOCn//m36o852g6ku/Lh2IVR/GsGlxkYAIVqyNloCdSWFi2WEDtPIRTCVEAaL/oz1uXP4nd9bs/LMEgDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/iUKqay; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/iUKqay"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b0af2aae63so8403217b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:21:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791865293; cv=none;
        d=google.com; s=arc-20260327;
        b=WHuFQ62jUXDf/icWQ351r9q7vlp85CAytdRNQ2ahehSd4gnXHMaKOuQm9ZeDIHiCUd
         ihIt+QriT/e5B4WnqpUCXHiGhdxjsVm7Ar8/+ZLS7aWGAXoN7OGCFFkHGQGxfyOHC26l
         nx0CZI9YcAVcsPv9S8wp1VTTPZ78xUotWEpQ8Kh/B+0t1xNXf5yjsYZ0nEQtciPFpDW3
         CWg7ya4DTx5mAYzDP3WfHkdeb2mtmYS6ElxFOdDeJSfeIF5Tu/zI1vCMsYQ19bRg/N/R
         v8hH+GcFyeJUymklRrkqWTbDFLkzTleyFsOc7kFHkyVzaniF4xCbIOhBg2h/gC3EcUue
         xB9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Byz8hLuIFGODwKQmN+c/5DL2ZzQd5PPTnUrY1jrei8M=;
        fh=GCwptUKBPWNhOLJnk2b84hjGtCwHlTIxBIQKDPHDATo=;
        b=NC4m7wIg+hJBeY4TotDGcTZH/fwzz7dgt+rOdnhXxe2NkelsvvqvmZZDOFZwM7azoB
         kYNXMlKiJuR2fb3peAED47D6+JkfUcYnKj7QlpDVJQbsJFQTCICv2lu2BI7+OYpc1dgL
         56TLAv0HyDFY1/Em/5ii9A9JNXNclyD3AH27MnujplfnLDJ/GVySdz/6pAD1+l/jRVJY
         nx2usihFJhWFR/Fhy68fbqxD9z6BAaqtJkA+JMHOaFxbxY8Sil3HtC2/ogz/9HBRJJkb
         0UQhjo9urymDHdCmsizIRd5w16R5JsUxfETVnBsYeGys8lP2eV/YnftquIxIs399GG0X
         IZvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791865293; x=1792470093; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Byz8hLuIFGODwKQmN+c/5DL2ZzQd5PPTnUrY1jrei8M=;
        b=X/iUKqayOrni2RSLR8J3ye2dKrmgJ/sKiq6aqyY9RSVCAlDiPJ/jnGKXWaMPSb//SI
         ZNerg1GjlG0AyQneWn2K32/xBfQSnaOfge451CcEABy34AotzypaqsAYr2qCMMEcWOmR
         tV9uI8xaGq8DvPviWHU7GLIAW+8CyMuc67WaiS7VQP2Wxy/31SFTxpsl/EajHkF5QCtU
         gZMBSH528AumYRVzxxE3ub6ef68I3jGzhYup7J4MJ+hTjUScrViRT/G8o+HZeCp7CPIT
         LNxvw8SbdgQFjZzkbMzsqccZHFSG6GraGHOZrzyEwIuLIlKFaU+XSn48t2dtxzUlzwbs
         0oGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791865293; x=1792470093;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Byz8hLuIFGODwKQmN+c/5DL2ZzQd5PPTnUrY1jrei8M=;
        b=0zgccgD2vgnJfxXtPXEyn9WbKLBcxg1QltyDHTM0kHzjLge5M31cROnenIisr/CVQT
         acoYhcX7JKsUyta0cUyKiSB++NqMj+f1CbyUNQWl1X8LXmwAw2RCedFXoCST9eTXCCIJ
         uI3WCkVz++4+iV1ho5t2awnJw53B4RnbM9e78APXqsaksCQwUTbG1jcL0bcHbYgrvRw6
         YF1WYdgCZD528pZ+bTHQgwLIM4qMUNEjdmjHkzRwB63j5xzgdJTKAFHDU3LbXPczSbPP
         JrLhUqdus8JdLz9KFTZwQ/oRE9DOD3Cno91Lay/Hf7hkPyf0k0R99iaFwjSV+U5wtTh3
         cJrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgHH5hYKVST/Wgcj5AHqI8PjW1NChwnBwZCBVmN2RX6mxc+h6Q+8YwUlox6h10re/tTrTLEJj5AyF7MrI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmEDyzxlKls2r+iYNWnYFwotS0Wp0HFpQJOUQevRc+IqBBBo26
	VtKLNfSJf7SAVjuGNZ/AFNPchNPf5UEuF36bMTPeWGln9CcIH8Wuc4dLr/4/IJ92YoAqxZy6otJ
	TWoebf0gvHK5UcLeXG+diELqLSv1wvT1GGUMwNB0ZT+PC
X-Gm-Gg: AYBFou3yuYp1TBQTmMvC9yUqGba3vnhysGxFEqGQPp6sHry/FX0MGTa2k9ppizoKFBj
	PeWldpXSjjsCWmZ29wzOtzDIXAao8oEmBAv5bR8Uza9qooNfxooRdMUl5EIZizvFRfqcxSj+kLd
	UtcuwTtO2Qvzwvj+urA3E+Usa0G++EWUQcMSphYVZWWlnC6Pbi0VyfqqI2LGAGWhbRCf9mscCCw
	EDVVGTUKWaICfXBTLLg3pD3mGx+6eynJxirX7/TSPZOIQZbmhtFg8G5JWBHsJT5I4J2BvqFcHII
	Kn+TI2WleHpGZ91tACV6O3CFfzUNWiDDDfKGfmIfGvyHgQ9QiZGohTIbtKU=
X-Received: by 2002:a05:690c:a198:b0:8ab:3918:33d9 with SMTP id
 00721157ae682-8b07ee95c60mr33697657b3.61.1791865292925; Mon, 12 Oct 2026
 21:21:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-pmb-e1e7490bbe7ba1b3c44a-v2-3e3b6315a18c02ced60d@gmail.com> <871p9vidio.wl-tiwai@suse.de>
In-Reply-To: <871p9vidio.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Tue, 13 Oct 2026 12:21:22 +0800
X-Gm-Features: AclHuK83wFlFYzm55EIvTBGXeeWIPJbNgZM5v-29wnWvI2eGvDEShmghRE24n20
Message-ID: <CAFRLqsW7Y8YZok60ezLw9WKDXQMWd1=3NDQ5fxAoa+dotFRAUA@mail.gmail.com>
Subject: Re: [PATCH] ALSA: jack: Remove debugfs before freeing unregistered jacks
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, phucduc.bui@gmail.com, kees@kernel.org, 
	blum@kernel.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Takashi Iwai <tiwai@suse.de> =E4=BA=8E2026=E5=B9=B410=E6=9C=8812=E6=97=A5=
=E5=91=A8=E4=B8=80 15:28=E5=86=99=E9=81=93=EF=BC=9A
>
> Could you verify whether the problem still exists with the latest
> sound.git tree for-next branch (i.e. for 7.4)?  There have been fixes
> for the races at the disconnection, and snd_card_disconnect() became
> already mandatory before the release.
>

Thank you for the review and pointing out the recent disconnection
fixes. I checked
sound.git for-next at 8d70e364e866. A potential remaining issue is in
the cleanup after a failed HDA codec rebind on a live card. The call
paths below show how a newly created, unregistered jack can be freed
before its debugfs entries are removed.

For the generic HDA codec driver, jack creation follows:

  hda_codec_driver_probe()
    snd_hda_codec_build_controls()
      snd_hda_gen_build_controls()  [build_controls callback]
        snd_hda_jack_add_kctls()
          add_jack_kctl()
            snd_hda_jack_add_kctl_mst()
              snd_jack_new()

snd_jack_new() creates a component in SNDRV_DEV_BUILD. With
CONFIG_SND_JACK_INJECTION_DEBUG enabled, snd_jack_kctl_add() publishes
its debugfs files. Even though the card already exists, this newly
created component is not registered yet.

If a later jack-control allocation fails, the error returns to
hda_codec_driver_probe() before its snd_card_register() call. Its error
path reaches:

  snd_hda_codec_cleanup_for_unbind()
    snd_hda_jack_tbl_clear()
      snd_device_free()
        __snd_device_free()
          __snd_device_disconnect()  [skips SNDRV_DEV_BUILD]
          snd_jack_dev_free()

snd_jack_dev_free() unlinks the controls and frees their snd_jack_kctl
attachments before calling snd_jack_dev_disconnect(). By then the
kctl_list is empty, so snd_jack_remove_debugfs() has no entries left to
remove. The card-level debugfs directory has not been removed by a
snd_card_disconnect() call along this cleanup path.

Best regards,
Cen Zhang
