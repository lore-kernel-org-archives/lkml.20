Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793423704;
	b=dtseIp15jWFH8wRb7HogD/ppjasYLmeEU1w2Kj6FccCMxtAHDS/XF+0nhFY+n9JPHtam
	 mFf/3n5ilb5HnEPX0fMj7Ct0AEc8FVpm1rUkpjjf7FzqGx/XWv/TfmHCGrpJ9sd1Ls96x
	 jTFg9x3xoHzumBO9fRl1nZbeTEhWskMxpIMORxeatm3CeXmsx9M3WZXG6Yt5ZxBGyGZot
	 lJXnnAKrvCwKBnEJRnPKYSwWiFFROi2Gyijm7Hj949lPXXhQRBI3ukabeANhUx4UMQtoA
	 DBUafMrCRoCuK0jwpjUwXxkQ9i4U/3tMQeyqSzDA7m7shVEulUJjhY83Hu7LC4s/oDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793423704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lxmVrZBFe7Tii5Gnvpbpq9C2PBprHphcGv9dlcFYOrA=;
	b=JWeHPurLLoUioIWiHRUqE8+RkY2K24vfyhdWQu2dN++KDSeBboukTWDff5GhqtKQ4+TG
	 EkyQJtokwT2ObO8wqSmsPr8T4R3kclRJHhqTyJk6Ad27OMI0B43FWbJ/FFZGrii1+7uoC
	 EXGgc/ivFmZzDX4cp/bRciryQEs75SvWOtVGRnzbZR90s6ONUZFQZw2QDft4EBVURpcjx
	 /9YJbV+na3WCE+CX5htepERN2ykacnwTw6Tt3T5hGqYVb/SphiI86I+10sUA0XPAMzO9K
	 v0pi6eN6zBOpIh2MBOa7YREVtdsl3YzJ+/XtT8k3q6fspma6CFTIZX7jUMZaVyg1oGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LQ3LKg4T;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90CB606A322
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:15:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B90CB606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LQ3LKg4T
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso537731a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793423703; x=1794028503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lxmVrZBFe7Tii5Gnvpbpq9C2PBprHphcGv9dlcFYOrA=;
        b=LQ3LKg4TwJ0RS2hjAVD++TUZItD1wQYO618Qx7Jwky16mAxmI3QaiZrpiI/SxUQPJM
         75BzzcyxuRo8g7x3xXGmGPI3qVJ9ejB2UMhGuBw1cHt23FEO6Q6NxdwhtGf6EAYWOYOc
         bbKZ98w/GEm61N5tVw8ay5tRULWnkQkzP+MAV4kZGPnRL006J3Hb46t1LauG73ODdYSA
         9YX+lI1rtQxO5GpSeVjmH2zTtekAB0O4wvllQiKEgUh0tm+tRGsazhcDAGWa3knGbSFL
         8/FAJ0U9N06h2PF6JfDn0JqAR926J/hx3VY39596Rls+r2/rDt5WCdz8zeTVQt3Bo9RP
         3JkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793423703; x=1794028503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lxmVrZBFe7Tii5Gnvpbpq9C2PBprHphcGv9dlcFYOrA=;
        b=OlwpL6YHFhTbdiP9CB3k8NcQqmaYr+x2TqdaQoO+F8bD0uVDYRJXfu7zILfND9m7dK
         IHbahRZqsvh1dV5uspdxlt+EGDkPAZP8q4PS+rlHz7VP/T+q+VtTWYmJWfjF20Oso0di
         WTEyKTM0p98vpigsIJKc60WUPYmVQVVLwemj7QF6zfe3bqX1nF7c8EXWFTZZeu+D+SVk
         wq2w8rjF3ODqZssE/XD2IshQEQ/Uda+kT+Rcr0CSou40AGDy0yvZPud0o/KOP0AijKLl
         3A4aQYow67nUaDpTNDQJfXbpYXN8Bj7hxHxAERy0r9DI1ZKjGwOlbHqC2N62w0i1nvEJ
         Dd5w==
X-Forwarded-Encrypted: i=1; AKwUvBzboUwD2M+pd+NV7vXC3/cFXaiLV5KejIz8O/Cv2PAT/UzVt+fARJfkcvSqFuRjJQNlD2t2ABLjIbRqPvg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJi6I/4flNvI1n5Mvyrr4yVbARPiieVAsMh0q0tSzgObylpGqJh
	ZwWPINJM+b4FaikPzXUwZ9bne05b4hhk/eiu800PtSjbqHF4H/3cGOqxSI6olUQG
X-Gm-Gg: AYBFou1XPGax0SQAKyA1KonuMVidhbBAHB24Nv2/Y2KiHYZlQBb7Jl0yLcvFapOt9G2
	9IgdON/82upEWKCvPYzv4YFyCAfX8Gr+7e33FCnkVuqALYf4i/guJPU8PBLb8NK+d/NPCjONw9n
	SB5rkq2C4TWU3iw7eeM3xqgxZncWQyjiUGjbzs77dLM0Kp2uNuO47PTRjEdA0eJ8F6dOnEXtK9H
	C3ZObNX99WO3U6K6zTXXWCDZoC7NsU+TizM2zvYXjveZKtPhfN7RlZ4Lx2+8UaNIEyxh7f+V6dT
	8COHc2pfJIYl1NCi9Obv3PsuRh79tSZB2rv2P34SgOl1tcUM6iyXZ6qwdFb4sYnJ4OJkcl5rf4g
	n/e8fojDidYWk822hkCeILXZ4oz1Eia0do1XjyrW5ZTBmTDBVokjV8KwXZOT2FVE8rH4crO9tC/
	Qxlu6kWyQ0Z5lXGh1zPXeE0ovvWZnoivIALNXSJPX7WZ4+83C2Y1zueI9vdkQf+D/RG1K0SMUL4
	da4amAR2sJelKO05mHb/TbSrogdWFMN9oRKkX4PSs7TkEBDuGacujZvNOKCc3OW3ZEc4amnZVbG
	E8iXXkPzzhd11JdOunqIEG07
X-Received: by 2002:a17:90b:28c5:b0:3ac:8897:7b9f with SMTP id 98e67ed59e1d1-3ae897a8842mr3196174a91.43.1793423703089;
        Fri, 30 Oct 2026 22:15:03 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845df666sm6216305a91.14.2026.10.30.22.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 22:15:02 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	thierry.reding@kernel.org,
	jonathanh@nvidia.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v4 5/5] ALSA: hda: Wait for the files of the codec PCMs before freeing them
Date: Sat, 31 Oct 2026 13:14:30 +0800
Message-Id: <pm-pmb-a4703edca61d34aa679b-v12-b75145090f6bcd7cf145-5@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-pmb-a4703edca61d34aa679b-v12-b75145090f6bcd7cf145-0@gmail.com>
References: <pm-pmb-a4703edca61d34aa679b-v12-b75145090f6bcd7cf145-0@gmail.com>
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
index de867f34f290..66949c4ff21f 100644
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
@@ -152,6 +166,8 @@ static int hda_codec_driver_probe(struct device *dev)
  error_module:
 	snd_hdac_device_disable_unsol(&codec->core);
 	cancel_delayed_work_sync(&codec->jackpoll_work);
+	snd_hda_codec_disconnect_pcms(codec);
+	hda_codec_sync_pcm_files(codec);
 	if (probed && driver->ops->remove)
 		driver->ops->remove(codec);
  error_module_put:
@@ -182,6 +198,7 @@ static int hda_codec_driver_remove(struct device *dev)
 	guard(mutex)(&codec->bus->core.codec_bind_lock);
 	snd_hda_codec_disconnect_pcms(codec);
 	snd_hda_jack_tbl_disconnect(codec);
+	hda_codec_sync_pcm_files(codec);
 	snd_refcount_sync(&codec->pcm_ref);
 	snd_power_sync_ref(codec->bus->card);
 
