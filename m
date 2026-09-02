Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295B22E738F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 02:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788314868; cv=pass; b=PBMcUzy+QG861GwE/zcZYZZRf6HyjuKCz/q6YDxUEY/35GEmzjFCpCoKWJV5RZXVSOWh3qBOv6mjtkluqrcvFlNDSbGl00sps3sD6mrjbVm5qyhnzsbaTpzn2YVfG1cVYyrL8BAdcE8MPZPbJMU7FsRAIN3knIlHqjiZuYbw79g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788314868; c=relaxed/simple;
	bh=udwSYPTnDPH4KqIRvNntitw+jHLbGls4Gy7WpueHMVI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=HJ31yWFC4XLtT8ll31ThLztRAwlVxNVRT6WsN3nv8tNF18+GhPDBOvSMFVNC0oubYKS4nQIsMWUbRQfjLINRxQW1VU1W9DxYkJhT4lzJXp34/lTwDOHnKSU6n9jWrqZxJ5ji4E4BXomVlk4wRtz0MbmkmI+UwVk5znt1BAYQO1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJZ36+mG; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJZ36+mG"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-485538d3499so15555f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 19:07:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788314862; cv=none;
        d=google.com; s=arc-20260327;
        b=DHLfldKY3DLOYmuL8b0MkizUlA7fpkx16IdScD8Ug68wsB8nE9rU8Nk2kc/+FmA5oV
         ibP72Naweu8wJITbHXfE6ooECMzu3olMC+kbXsZZHptVlDPepIgKJiq6e1ahA3kCRc56
         hc9VFtVxhhziSh5HBr/ACPUE0QlkkDAGxGhN2WqA1MMhy8t8rWU8iqz/71w263rMHJef
         wzuUn3/mAY68T2Ljho5vqTq6B7MtTlCxwOcgMWUtihpkWeYTVMqcmnNGhWGAvpv0OEL7
         uQWYteJUJaMleurwqYveZa0So2Akw9tlnVS5kz2Cr+EfwgV0Cjr4GtZKiFuitKVVVlkI
         eCQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=OkEvfszeR7XeofUG84L27vnMBsBKLUpywBPEEyg5KRI=;
        fh=Q9MTCxqPiQZuL/GU2TMJc+bzsmc0LRRdrozwvoWbejs=;
        b=CnByz3dJuE+CVi+A31m/dY20NkKrqU5CpO8QDOZj6TU0oHh6Pr25B8dktnbLQPNaK0
         yx8G6pJthlmjyA3e3UVLnV+MNVhBPzYwJEaMeHxanOKF+wCY2v0uMFZHM+TpiLLpXkJa
         w5QVrMyRhkdzaXUBiFHanFg3R7K0shQTJZgyVCenSDet0GqhEIof/Ti8af2U3+g8TA2u
         Jnep15K0WMuqCtUhRfvFNWGw7y1ZCa/8WZCjq/jUv4M6rgs8lRMpDWupT/+UxzpuvORP
         auK7L/4tM62OOGHc6gVJrnMVhCA8G6NW2Q+ESHBbySG7i/xAf3qomae/juyyuNJpD1f/
         PibQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788314862; x=1788919662; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OkEvfszeR7XeofUG84L27vnMBsBKLUpywBPEEyg5KRI=;
        b=QJZ36+mGZEo0L8U1mDOTBRSmszoBeYjntNvYUwwOPmeDs9y0T+QeKJqIo25XXTpr1x
         IgTzZX5iQWIZiXh8l09NOfOJOzvY75MYBN8ywzmApSe4EoyxmTd4TzKMkB5/ofLw1ZMh
         6k/s0OMaI6mPy8aU4qag9htu8QfROMj8BPX5scANGPOH78lvb+xl/BYrpUfcrp7oKrtV
         A/pUwls/KRNh34EPRqK/Xvj+jwMYP6ZqyQ5zSceSClHT5pl2MbV3mcvGz4NZeXimkiLO
         yoY4v+AVY5D7IGpYyYOnwBtUvYxebZuOUYv2dwJCD80H1JJ0zS7QvL3OvWMC4A7QTfkm
         ORIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788314862; x=1788919662;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OkEvfszeR7XeofUG84L27vnMBsBKLUpywBPEEyg5KRI=;
        b=h3TQ/ULIAxoXN+0JHreazt+cGoIBEzvJL/0Hf2gOKmvkk8/TiRwuUYeF2ynQ3kl3ss
         pvPzKaAcMuVJtPLU91h3IXXxpB+GQ7sKmGsCAESncWQ7qbbfkuKwlK9YVKVLS2jf8+0w
         Ke3+IKjVPOfx/3T35h4KITd41WuX8KawUXRqhcVrtzpWxSMgXGIIYf3Y5Q5TtV+q9Yfd
         OaZekR0ipeAg/N3Brz/oG4tQTi73CnpY1b36KXnZEDMzRw3UTMAg+A4AOWdl4njC3sPH
         z1DqBHTO9TBHO6Ax+/qO16YBKieozKrl7cYC5SOBODpwEMq5GE8P9l3OgLG3AtclQxug
         wCuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcVL7NJ5Ym3D7r3k1pF5DJRse6+w16gVIh+XSrDDJDwabEQrk9uu91bFc9S9Pw6wBgnIS+fZRIkVBgmuY=@vger.kernel.org
X-Gm-Message-State: AFuF++lq+6zima4rf2unfRzIh+rbZC2WiNjxNyjuf1OxuSzWi1IXLiOK
	Z9/UpVxt7rORxDtqYwetThNspY5GUBSPXQtThkXlz9o33OsIsyayZtT+YDxHF89v4xBqNzpE7m6
	ooZL7v8wwR1EuD6mMT6qjOTcnrGBp1sA=
X-Gm-Gg: AYBFou12jV5E7L86ZMb9IsDmgl6agcxtg8Qa5RLtIcWYufP9HU2MThAFChWxy4oAlDT
	TgG/lr7aY18dZc7W5dUV/iLPX87Xe0UTiYyMpeo7bMvm2jh40Bo2Uh3R8yxV7c3yAWR2Bdo6Sgu
	lXmxS4PXbD96YYzCnWTNvkSnIGU1TZz0Zbfm/xCteCTZG53JMr/sLk7NxLGOfaE8qaWFTg2hkLh
	4vSgib55xd159EOnd1Ckp61ROR0XDoBXgPJVSlLzprduEdbtbe/6WrRDsV85EcvtqRFfLVFKm1k
	0jZwtr8HGcSrEPGQkFiBcDmPYpTtbbttZo1Y4QtsrgA=
X-Received: by 2002:a05:6000:41cf:b0:484:41dd:ff3c with SMTP id
 ffacd0b85a97d-48488f18e96mr2080023f8f.18.1788314862035; Tue, 01 Sep 2026
 19:07:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Qingyu Zhang <usupergate@gmail.com>
Date: Wed, 2 Sep 2026 10:07:30 +0800
X-Gm-Features: AcwNN1XD1WHiZ4r-gMwibt3Haq_JjvaYK15GwJKTwRLH0U8Obn8weilq_nSQM2k
Message-ID: <CAPBHdanmknKKhhc+5r8jPsnyZW8LYVq0qpzfEVrvjL3i5sNuJQ@mail.gmail.com>
Subject: [BUG] ALSA: ump: NULL deref of legacy_rmidi after parse sets parsed
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

ump_legacy_set_rawmidi_name() snprintf()s into ump->legacy_rmidi->name
when ump->parsed is true, but parsed is set at the end of
snd_ump_parse_endpoint() *before* snd_ump_attach_legacy_rawmidi().
A UMP packet in that window NULL-derefs.

Type: null-pointer dereference

* Summary

snd_ump_parse_endpoint() always does:

       error:
               ump->parsed = true;
               ...

ump_handle_ep_name_msg():

       if (ret && ump->parsed) {
               ump_set_rawmidi_name(ump);
               ump_legacy_set_rawmidi_name(ump);  /* rmidi may be NULL */
       }

ump_legacy_set_rawmidi_name():

       rmidi = ump->legacy_rmidi;
       snprintf(rmidi->name, ...);   /* no NULL check */

This runs from snd_ump_receive() on the USB input URB complete path
(in interrupt).

* Affected

37e0e14128e0. Needs CONFIG_SND_UMP, CONFIG_SND_UMP_LEGACY_RAWMIDI,
CONFIG_SND_USB_AUDIO, a MIDI 2.0 gadget or device. KASAN.

The natural window is parse-done vs attach. The QEMU PoC widens it
with a kprobe on snd_ump_receive (poc/widen_ump.c) plus dummy_hcd
configfs midi2, because the un-widened window is short.

* Reproduction

       # dummy_hcd + configfs usb_gadget midi2.usb0 (see poc/run.sh)
       # with widen_ump.ko: force parsed=1, legacy_rmidi=NULL on receive

KASAN: null-ptr-deref in snprintf from ump_legacy_set_rawmidi_name
<- ump_handle_ep_name_msg <- snd_ump_receive <- input_urb_complete.
Then "Fatal exception in interrupt".

* Expected

legacy_rmidi helpers no-op until attach has stored the pointer.

* Actual

IRQ-context NULL deref.

Please consider the suggested patch

Thanks.

Suggested patch:
```
diff --git a/sound/core/ump.c b/sound/core/ump.c
index d183c8a000bd..3d1a2ed3b476 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -1335,6 +1335,8 @@ static void update_legacy_names(struct
snd_ump_endpoint *ump)
{
    struct snd_rawmidi *rmidi = ump->legacy_rmidi;

+    if (!rmidi)
+        return;
    update_legacy_substreams(ump, rmidi, SNDRV_RAWMIDI_STREAM_INPUT);
    update_legacy_substreams(ump, rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT);
}
@@ -1343,6 +1345,8 @@ static void ump_legacy_set_rawmidi_name(struct
snd_ump_endpoint *ump)
{
    struct snd_rawmidi *rmidi = ump->legacy_rmidi;

+    if (!rmidi)
+        return;
    snprintf(rmidi->name, sizeof(rmidi->name), "%.68s (MIDI 1.0)",
         ump->core.name);
}
```
