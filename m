Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793293036;
	b=f3ISjZoEXOrHPUwc+1C4+gJUHrdAybcSHIGn79HEGrw4yPB48jQYtamiTjtyvXCGE8Z+
	 7381WYxYEiuysXnMQSG4p6kQFY2Z8Q17h7Ro7UoK3qaJ4rVix4nrR4Mnr6ItwY/bU3Kng
	 WM5dRJMsEn6wKwspNuJNTaf/QactQyFNxr43XIRBvuSSxHvFpxBBzcc4fSn0MDEmD7RGi
	 mnQrOjI/QZ13PoDg1IoTmIs84gvXexFQMI1uheF5WRDT9RVfi/KpgKNezHFavbqc+VMns
	 mfc0fPBIW3exr6mbycSeqQqUZLEGwZ/82BhrF4c+OTmmEgIigIIvqP55NCHhn9bPtFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793293036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cyFkeSoD7QBapusNRRYnZYh0f6fgzoNNczOjrCuvgyY=;
	b=mOUjaYH+jVCkuEXYIV3YOhGMgWJDeuu0kqFK0fEj61teDBVJfmCw/zAUAYetSdEzGOw/
	 a2QEHkWEGUn67M2es4uT6vE15KAYKJyqABADDwj7lxL/lLLgrh2WMrcc2AXzBzg1mLeyv
	 /04AZPqWMjIVeo8GJ02WNTQZvNXVPuoc/zzcO9BuA4b+7V2FG12Qh7I2sTG2kyXrlnWEt
	 tRzYI/WldGMtWuxZ+QxvyySZZUByAyhLumF5LpUhCrXInXI1ivN+sc8adhuPWz45Ed6hA
	 IIJh9jI7qlLsPF2S0BhaBCVt1GCCbQdF6LcoaOC4KPoYYUPWWOmP68K5KnUcbGWFkIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xbXFhVIF;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10126606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10126606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xbXFhVIF
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e20edd106so1887867f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793293034; x=1793897834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cyFkeSoD7QBapusNRRYnZYh0f6fgzoNNczOjrCuvgyY=;
        b=xbXFhVIFuwAjMEOiX7TC/apqjVa6tAuU4PZW8wem3ThjCpBNkEdcTMDzLHaRnGAYAh
         CHO/faPXG/1C8D+O8qkNyM8Dv8t/baf+a7v0WxUIHx+GIiczxqSrttFHVpKxva3NpbsQ
         oZrm4nI2RyCxC+hbh/U/T2GOq1oT+0ILNNybYGcPb1Yl8veboLvKCsuFcYSr+N4n++Mu
         7tmVPnNlSPGsaP3m6WBRtEx9+u2zMGIILTXxRrepMrZSgc1kv412BEr0verE2y8TQ3T3
         OacGGPdydqMJfY97A0J2yq5SpY0a8HcEqLM4Ob0whCAJTEO7t/kpAQmTz0Cok6QN/VgW
         hoog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793293034; x=1793897834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cyFkeSoD7QBapusNRRYnZYh0f6fgzoNNczOjrCuvgyY=;
        b=K6OhkG7bopJWE94PTpchcgrcEYzmFLXDy6mhxNNSJPM0PDcnuk95QSJMe96hUPVuax
         mFukcXXyrcUaAYLkRHDv330eaukDYueSjlnOVvYTym/nt6030uZmYKM4pjXk3Kpyq5qH
         J60kVhYWQVUErVHM7f3qSTp84AjTc+pUC6tE5punpBFPw2mltToVRVZ76YCKqXUsPH14
         7q72xll/lM5s54rBh/gF5kIjklcAuzr1vIvfG/VfDUse/0FkzPgfXYF7ep+N9LVtnuT8
         A1J2ztJ3eMWPDmH0vMbo9gzI6E9DrdJRhtMI8Eny+Ef0Cx66cQok06dDyF2rF/or9P3e
         VbbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzdV2JWbzj+o723u7Gb/3AXPagU1+r5lezE3Ymy6yNKWVedKD18tmwqM8zSs2bWYsObc91tQH+uHTezZo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHDRbSMtePHSEK/W4zrf7VtLlbg2IwcEpyIJVZDAZIqpbuQYC7
	6nD2FxTmyeZb5QczQWrTvGpmvlrKNXsRbUyzyT+29JrH6QZ6pN2UQnvL
X-Gm-Gg: AYBFou2NVshejcw63/q81zV57qa4BrcGrDVtnlVBQq0gW+idsVsXW0iCK+BCtXqx9+n
	q28ohjr2Q8qNl1LiiANEkRpw2s3Zb4E8d6MbQAAiJVwuP+uWI0vpTszzCVoEIg3c5lxebOwDs4Z
	g5LkXWLfstNH9JBMltWM0Az6b2OpVqK19YxB7pivY/RDzpf3H76SDb8BBSpHwBcos2Uvo341PFy
	sLOMo3MB5ve3dVdlvvv/sp3a9aCE04seH3G/+g6hkbQj0UVEqQIhu2ees+a466siLhxF9kFFKnP
	x+49yxFik1E46ZDlEmj7Y9IGccT8Hd7sdt4ccjHjKpLYYQ5kxvGIIcwLp18bPgrM5D1b5YRuXIT
	0IBYZi6OlilmxVK0vOLU3K7vBmHfWjhvmcQBYEmKbKpc9+BYjZVqkJK62hmjakESMz2YVQA0Brn
	218Ayy1LM1rcBRYYBJWPR+CrQOxkdzD9NFqv8FPFe5AB503dTRoq1sQvYlmFTQAn6JDOc8uvHI4
	f/aGMsBfG8+ASbk0KWs/Q7TF6Ka+23WJJwZoQDqyQNa5vJbO5jf+R7KtBQe1fvLIElR7HMD814d
	yAF1zKIU8nwG3crsAeWBRTnF41DqpdZm3yDnn/YtyvXU137+Kdw=
X-Received: by 2002:a05:6000:2086:b0:48b:118e:7454 with SMTP id ffacd0b85a97d-48e5d5a45e2mr13646899f8f.31.1793293034323;
        Thu, 29 Oct 2026 09:57:14 -0700 (PDT)
Received: from stjepan-Aspire-F5-573G ([2a00:1bb8:118:d39e:4868:f22e:b51d:7cb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6dfac9d9sm325680f8f.44.2026.10.29.09.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:57:13 -0700 (PDT)
From: Stjepan Poljak <stjepan.poljak@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Clemens Ladisch <clemens@ladisch.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: don't resubmit MIDI URBs at once on -EPIPE
Date: Thu, 29 Oct 2026 17:57:01 +0100
Message-ID: <20261029165701.2004391-1-stjepan.poljak@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a USB MIDI device answers with a stall, as a bus-powered keyboard
does while it is being switched off, snd_usbmidi_urb_error() falls
through to the default case: it logs "urb status -32" and returns 0, so
the completion handler resubmits the URB at once. That fails the same
way, so the URBs loop, logging every failure, until the disconnect is
processed.

On a Raspberry Pi 3B+ with a keyboard behind the onboard hub, that
disconnect is never processed. Printing to the framebuffer and serial
consoles holds the loop to about 250 messages a second, and all
interrupts are handled on CPU 0, so the hub's port change isn't handled:
the keyboard stays silent until it is replugged. With loglevel=3, the
same kernel processes the disconnect 0.04-0.24 s after the first error
and the keyboard works again.

Treat -EPIPE like the other errors seen while a device goes away: retry
from the error timer after ERROR_DELAY_JIFFIES, without a message. An
endpoint that is really halted wasn't cleared before either; it is now
retried every 100 ms instead of continuously.

Tested on the Raspberry Pi 3B+ (rpi-6.12.y, dwc_otg) with the default
console settings: after each off/on the disconnect is processed, the
keyboard re-enumerates and plays, and nothing is logged for the stall.

Assisted-by: LLM
Signed-off-by: Stjepan Poljak <stjepan.poljak@gmail.com>
---
This replaces "ALSA: usb-audio: reset a MIDI device whose input is stuck"
(v1: https://lore.kernel.org/linux-sound/20261026125751.1700779-1-stjepan.poljak@gmail.com/
 v2: <20261027152034.1871962-1-stjepan.poljak@gmail.com>). As Takashi
said, resetting the device was the wrong place to fix it. The disconnect
wasn't lost by the USB stack either: on mainline dwc2 and on dwc_otg
with loglevel=3, the same unpatched kernel gets it. It was this driver's
own resubmit loop starving the CPU that handles the interrupts.

The patch is against for-next; on the Pi I tested the same change on
rpi-6.12.y.

 sound/usb/midi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index e3d157554061..5604c3fdbe3b 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -194,10 +194,11 @@ static int snd_usbmidi_urb_error(const struct urb *urb)
 	case -ESHUTDOWN:
 	case -ENODEV:
 		return -ENODEV;
-	/* errors that might occur during unplugging */
+	/* errors that might occur during unplugging or switching off */
 	case -EPROTO:
 	case -ETIME:
 	case -EILSEQ:
+	case -EPIPE:
 		return -EIO;
 	default:
 		dev_err(&urb->dev->dev, "urb status %d\n", urb->status);

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
-- 
2.53.0

