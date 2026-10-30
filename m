Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793347451;
	b=VkKWCtn+1+zkDt7OItfFEycj3tCiyHmCovmjH6GffZbwjHQmXx0LXt1fuwSnmomVWUVU
	 5oVcKRcuYktiAWJqEVuJhhrQ7X7Vz/6/+T0rpma8hbrq08/awLbQOMXQv8ns6h6wW7HJX
	 QZJB5UWlrf0GhXUP/gO2jJ0n0Qan9rHEwWBrPc9TCPE9yK7TMXDLRYnjc5Ceu+ISys/5F
	 ra5uABaIJZQmlZswGKeUkXzEy88Ek1IJUa+LDy3Aitl4B+KW/6G4pa1SLce3UAxIuMCSe
	 wMp+Fd26kJewJSynziHpczhxhyGevDvofUd9qsi9eLq4Ku6YsdyRljrp8kSY9GK2X0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793347451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=60r0/FILtbDSMoz4R6RLu8Lfo3Bak5PRq0PiVqNRm/g=;
	b=BSe2pNDfqI8Gk9QKhZ1bVlKO3WO4X5Y2E41DcS2h2Cd3klkgSltzqMv1NtlUtb8ci1rS
	 oORx4OUAQIDaPQRHLOjHoLnanlj7ca/Gr8HTHC8hmtolP3nFNq9zK57T1hmsYhYr+tC4G
	 bWh+1b3qfb2//KPQGHawO0gL9687r3K9oPcF1oGZMFO4snY/aOnBTHmA6iyDLd7bXe94r
	 iSlDOYD7aEoB5m80sq0UhTLnD2XI1QgZGRfe7UDxilYo1i/pCT9Ugejix326LvS5pEF1P
	 AVnV64ps65FGrWEjamKTltjmOSOWNapVgf9/BBHpYCLM1Up+BCHrAEMuYKV5kuS389w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FCQ8wPfK;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8A5606A326
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A8A5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FCQ8wPfK
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ada8bc2380so164579a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793347450; x=1793952250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=60r0/FILtbDSMoz4R6RLu8Lfo3Bak5PRq0PiVqNRm/g=;
        b=FCQ8wPfKwiI8JOvjeuZmg01veGDbuKZQ/jUPRolC56qaoXCKR5RvQm450VzncTpF/S
         YXMQYscZyl43WY8vCpluzP3lvL76Uf4ATXygJmD6aAMw3dkY0lGi0D6EM3SYI63Sklyg
         XsK1cuYUvN2DDyuhpNhkopHOe5mYfd9aLU/BStbSUvKn+4tf9HMhFnrcb+evM+i6fwsc
         HS4qTWzmfa6erEvaumcIGNfOCed/hCaz7O1yI+h42CaEB5OkrPEDHPq9+qEMM4koorK8
         5JIJsCs3Y38KHo/PgH0gzhje5v2zEBFJJnk2YGv2ClnY1pPDNRUK7daGMAsW0cwnV/Ev
         s5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793347450; x=1793952250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=60r0/FILtbDSMoz4R6RLu8Lfo3Bak5PRq0PiVqNRm/g=;
        b=amKyiA2qkRo3SkZFhNjqo06NyWD/4otLmih8stoMvKaMX2sHJu2DBSJgR2r3hJpui7
         ZsLBRBczFUqjCSnk5o4ys4MLL8Rf9ERIVWmczBHe7DdKeA2BcC4m4XjD95uEP2XyB//X
         PW/7QNqcBNUWKYTOiW3Wqw6c3fXzz40fF8xyFG4N1jMF1bdAj2dF/ik5uLzVhxFxyAjD
         G+6UdnIg+NOd6yIMdkLEC0fJxHyJpIs2r9ZQFmioFYtMJbAjAMP0vetHbUJisrDvGUPG
         dkNB0nQB+KfHoK0Zri+zGNbbaYWSDm/5fNE+iMIc1q+pEy7TF5Bg9xLh3GvXKmVQL+eO
         szgw==
X-Forwarded-Encrypted: i=1; AKwUvByPvW/xAYgaWHmv60sLIMFKtWGelntpIiRBXcdQz0ZjNeJzuiTDEWtKxTzGaysp87B6R12e21pyCtXJ+9I=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0tkqzmX7VSlA89oO/5YhRINB6eqvAz5eR4A0h6Go31cVi+GAQ
	azruvnPN8/9QrVP9VNuXGo6pUts/rN7JpUQhMBRrzfF88rYoOf40YRqB
X-Gm-Gg: AYBFou2ruxIT+6YTbMlupmPdoMY20MOLqjrw5dlbPogZvZKh4IqJsN9t/2GHSlnmapM
	h8GPGmaCXXrSI6qojLcdJkjcWREVjIQM9ndGAQ2cnWAUpyavrI/+FF2aWua5gOFgdpp7CbM42KT
	k/EG7CCaKKc3Pp765/Aom2nUhJM2g6923ly6KwPIdwD20Y8T29GQm9SerJcXOhhdxSwxjVWjJmU
	ZRYteVORWOzzB3rNuZLxYy7Djgwjw/pwlF0aN9RyJ2bGMN1OCaODGJJg2P7kL321V6B8YON6PJW
	V8DJ3rvh244I7YUG3w5rO+vqbvOBcySQ5b70m0ue/+F6N3cMyk5vX408hPxzxNNfHLeCTZ3ShlB
	j7n6OOt+TGt1gW4S0owDBbHOgXIl2zt4nUz6soJvkU3Pg90xp2UlMpOPmjhDT/2zDCXMtUVF1HZ
	DAVH/+unpQ3Y4TwCaHpnf4zXElzpQhoK4rOLIrRXAJBPDyQbWY8cD1xjTUZh7BWXcOQO/9ZydQu
	EO4oRqnzzD54UaYHkAy+kIeaeaA+0nRgSvAlISwEP+EZeAjqH5wp8nm1iuS6ImHwOTccaXX7yhw
	Mp1ABz38qN+7nHmbCtwrgQmr
X-Received: by 2002:a17:90b:17c1:b0:3a6:fc30:ce16 with SMTP id 98e67ed59e1d1-3ae897dc114mr965698a91.51.1793347450014;
        Fri, 30 Oct 2026 01:04:10 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae84577911sm3073035a91.7.2026.10.30.01.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:04:09 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v3 5/5] ALSA: hda: Wait for the files of the codec PCMs before freeing them
Date: Fri, 30 Oct 2026 16:03:43 +0800
Message-Id: <pm-pmb-a4703edca61d34aa679b-v11-d9186d19e8afb48972af-5@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-pmb-a4703edca61d34aa679b-v11-d9186d19e8afb48972af-0@gmail.com>
References: <pm-pmb-a4703edca61d34aa679b-v11-d9186d19e8afb48972af-0@gmail.com>
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

The codec remove waits for codec->pcm_ref, which only counts the streams
opened through the HD-audio PCM ops. A file uses the PCM before that:
snd_pcm_open() takes pcm->open_mutex, and an OSS open walks the setup
list of the PCM, before a substream is opened. snd_pcm_release() also
still takes pcm->open_mutex after the close callback has dropped the
reference. When a codec is unbound through sysfs while the card stays
registered, the remove can free the PCMs under such a file:

  PCM open                           codec unbind
  --------                           ------------
  snd_lookup_minor_data()
  snd_card_file_add()
                                     snd_hda_codec_disconnect_pcms()
                                     snd_refcount_sync(&codec->pcm_ref)
                                     snd_hda_codec_cleanup_for_unbind()
                                       snd_pcm_free()
  mutex_lock(&pcm->open_mutex)

Opening the PCM while the codec is unbound and bound in a loop triggers
it:

  BUG: KASAN: slab-use-after-free in mutex_spin_on_owner+0x94/0x2b0
  Read of size 8 at addr ffff888005d52a58 by task hdatest/90
  Call Trace:
   __mutex_lock+0x16a4/0x24a0
   snd_pcm_open+0x230/0x600
   snd_pcm_playback_open+0x5e/0xb0
  Freed by task 94:
   kfree+0x2e5/0x510
   snd_pcm_free+0x9d/0x150
   __snd_device_free+0x121/0x370
   snd_hda_codec_cleanup_for_unbind+0x219/0x920
   hda_codec_driver_remove+0x1a7/0x2b0
   unbind_store+0xd1/0xf0

An open can also get past the wait and call into the codec driver after
the remove has cleared its state, which ends in a NULL pointer
dereference in playback_pcm_open().

After disconnecting the PCMs, wait until the files opened on them are
closed. Do the same on the probe error path, which frees PCMs that a
late probe may already have registered.

Fixes: bcd96557bd0a ("ALSA: hda - Build PCMs and controls at codec driver probe")
Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 sound/hda/common/bind.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/sound/hda/common/bind.c b/sound/hda/common/bind.c
index abbb3b64ec09..514f6d581b33 100644
--- a/sound/hda/common/bind.c
+++ b/sound/hda/common/bind.c
@@ -84,6 +84,20 @@ int snd_hda_codec_set_name(struct hda_codec *codec, const char *name)
 }
 EXPORT_SYMBOL_GPL(snd_hda_codec_set_name);
 
+/*
+ * A file opened on a codec PCM can use the PCM until it is closed, also
+ * after the PCM was disconnected.  Wait for those files.
+ */
+static void hda_codec_sync_pcm_files(struct hda_codec *codec)
+{
+	struct hda_pcm *cpcm;
+
+	list_for_each_entry(cpcm, &codec->pcm_list_head, list) {
+		if (cpcm->pcm)
+			snd_card_file_sync(codec->card, cpcm->pcm);
+	}
+}
+
 static int hda_codec_driver_probe(struct device *dev)
 {
 	struct hda_codec *codec = dev_to_hda_codec(dev);
@@ -151,6 +165,8 @@ static int hda_codec_driver_probe(struct device *dev)
  error_module:
 	snd_hdac_device_disable_unsol(&codec->core);
 	cancel_delayed_work_sync(&codec->jackpoll_work);
+	snd_hda_codec_disconnect_pcms(codec);
+	hda_codec_sync_pcm_files(codec);
 	if (probed && driver->ops->remove)
 		driver->ops->remove(codec);
  error_module_put:
@@ -180,6 +196,7 @@ static int hda_codec_driver_remove(struct device *dev)
 	guard(mutex)(&codec->bus->core.codec_bind_lock);
 	snd_hda_codec_disconnect_pcms(codec);
 	snd_hda_jack_tbl_disconnect(codec);
+	hda_codec_sync_pcm_files(codec);
 	snd_refcount_sync(&codec->pcm_ref);
 	snd_power_sync_ref(codec->bus->card);
 
-- 
2.43.0

