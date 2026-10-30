Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793347436;
	b=db8LCKUzwdkKWj9Hg8nc90EoPZCcro25XSWNhJntRRs6odQqEdADKusDiEwEXy7GAtVE
	 WFoaK3hI/ll2RSoe3al12ekkeV1mWRdmt8qsizYGzFG6ftLmGDuyv6nfMhB+FoLQAQGkh
	 Ck9jS4Gre9CrfUHMLIzTtH2QD1Us0f/5Dr8KzKWo7hDCXm7Q4HXHNjjc5PSlusGuJ9K0e
	 fxd+kSCxIJo1sGEy1fNe/8TEkcsfqqkdgzIYWecuFrn2V8x0HhzBdZQuonuGznppEKpHm
	 6tJR1YWduCTRQeOhXVKvrl9VRxusooEeR+0oaoc7Fbe8txf6JK3Pv1njqR2lAadXwBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793347436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7TG0hQG6Ly9ECABHSZSPu0QD0aAkIq6xqd+y9iEY5so=;
	b=qZLbyIBl0VJlfxqr4ydclVY/EGn+fgNHDzD+yewir0BqHoLKSKMwNo9fDvpy+lRROM9P
	 uiN8O5kgqL/k7m5+Uk6dtcoZBWk16e9cxlpLXSR72RioRfFc45xY96gW/2k6lmim/OW9c
	 zTMQsSRt9kmCgwieu316IjfLQd7bemzwPD2Ef+NzhvS05NQD28hGScHPuhcQGzsMR79Dk
	 f1ohYTxP5vRI1U0Bo/eig9LqLUXp+38ro9IbrOhQGqny2+xWTY9VbGbD754QXBALq4pn3
	 idX73YkM7mK2grbkl/xBigKX1mSa7T5UXpBFLOZkfoBRUAPIX2PnjoEDSJA5xkq5mjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fdTjyD/x";
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D573F606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:03:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D573F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fdTjyD/x
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ccca948203aso135524a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793347435; x=1793952235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7TG0hQG6Ly9ECABHSZSPu0QD0aAkIq6xqd+y9iEY5so=;
        b=fdTjyD/xFNamCuqV8vTC6xZk3gAotWFnaubVtxLAIEhmDnH7oCUje/d//7MF4aZ3Sb
         V9O+rejwDNxiL3qqyLbN+1/0TrYJ4TD37O+pE9mogyao31ARiob9H5Pz2WDq7/nUb2T6
         bJAJqA6vJmu0xPVl+5KDHs1UzmiuFUEtPjhPxKc3/r3L7TOqIpGNKIDp9/MxEaBtZcUl
         qCO+MPM5V0vCg0McSLH39ovNgpBnQ2PhMINI3HibnJIWeamFqOzHGfA81Jy6f+Y0i6/H
         lJK/k6RieL0S6LjHsMnpHRigG/LBhMQD/I4MR1lYxd6brSWcjoGogKAP3Zek63ViRLlo
         14yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793347435; x=1793952235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7TG0hQG6Ly9ECABHSZSPu0QD0aAkIq6xqd+y9iEY5so=;
        b=a9jfVV0pQ83c8Bu8115BBq9ZnkSnlELJfdrrsL4vP1KxLWcHFeZY10apvUL2vK+Eeo
         b9qXFGz4UEw3VRfPvfa00deH2Saehe6H0zffWbVjcQ1C4abHHW8Xu/RFg9JV9W02MZBI
         LzKWaklZ1lBwYbCcyBH2zh3E3hJs2FuehJfTRaWoY3lEgy92q9UuurKV67Krcoi9G82u
         O2pj3gzERswnJ49UroKTTbZX2dR3rJgI5seqy5IXDJ5j2TjcKFDZK/+E2hIaO9XLAyrh
         0NVmUP9gJ7CYn0Z5eBxUkR0x0cXd/gGwgPlWQPGGdTX+4FaqAKOOSbbRo7XT0YlUQmHt
         rvxQ==
X-Forwarded-Encrypted: i=1; AKwUvByTox1ik8YXvtynjE5z/kf6RMhrLPx6xQJnhUXi2CF4p99+ObhMS317NWEWWoncsLkQnN3c+TsZUCVGcWE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZ5ZPgRAtXRTFVKxnry7TpE6HuuxpN/2K8UABcqenBPKvcbkZ/
	VIb82qsCVHQuVa7AXPcs+DK2xCEtMVouicA20S2cirAqlvKzLqqGtHO0
X-Gm-Gg: AYBFou2wPMctHSQXm/DFvzBMig9YY4n09O55MQJ9ne+u48rljfvuiCzUbbj2FJ5QSWm
	xtnBHF/Gh2qg1s8MwfVZlCpbfyz28Px4GWmRQgGKvT+CDg7CRJ/e4d8G+nVWuJi5Q5XfT+3htCM
	xoBeoY/HBQryWC89gC+TqWGGVuRgvHhLEIoNxtTP8zL+oKweDAY4EoRItKDFzHwe50vLi7Ntjn4
	Uc9RwHCmX+bR4/yBFT7IAsFaWSL/APViq8S8JCri3ExvJuj8ioNuAq6BLLHwIXrBAHIJag5tsCU
	4mVx5pff4mLSKLDskugc0vlu9fHMmyANcrAfQDLDGB8KvwWOptSI1iMe55hvEZbuFncikhenllB
	z2Fz+u2tXX0cbhPDVNLqumVKLw26+AfZrnLXdpCPUKWDqW/svLDcaJoHa+b3CHPc6tNeJ7NPUrz
	b9hh3Gj681OVzmwxW5jhsSpYtPaikd+FObKl0KgFDm6GDGY2BWIyJFbTIkdWYrRoyVrB9pHVnpe
	/40b505+7Vlg/Zq2NHpGX/9t7goKx7TJGAtaHGXTC5jjY76FVg3LgZnVqShLYb8bX1ZsCpc185i
	ulMN+u7SyxPYw3qO5NuU2bJs
X-Received: by 2002:a17:90b:3f84:b0:3a4:e934:e85c with SMTP id 98e67ed59e1d1-3ae897a5c4amr1209727a91.41.1793347435092;
        Fri, 30 Oct 2026 01:03:55 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae84577911sm3073035a91.7.2026.10.30.01.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:03:54 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v3 1/5] ALSA: hda: Serialize codec probe and remove on the same bus
Date: Fri, 30 Oct 2026 16:03:39 +0800
Message-Id: <pm-pmb-a4703edca61d34aa679b-v11-d9186d19e8afb48972af-1@gmail.com>
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

The probe and remove of different codecs on one HD-audio bus can run at
the same time, for example when two codecs are bound and unbound through
sysfs. A codec probe on a registered card calls snd_card_register(),
which walks card->devices in snd_device_register_all(), while the remove
of another codec frees its PCMs and deletes them from the same list.
The list has no lock of its own.

Add a mutex to struct hdac_bus and hold it in hda_codec_driver_probe()
and hda_codec_driver_remove(). The ASoC ext_ops paths are unchanged.

Fixes: bcd96557bd0a ("ALSA: hda - Build PCMs and controls at codec driver probe")
Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 include/sound/hdaudio.h | 1 +
 sound/hda/common/bind.c | 7 +++++++
 sound/hda/core/bus.c    | 1 +
 3 files changed, 9 insertions(+)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 04fd4794bcee..066d2fef3986 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -367,6 +367,7 @@ struct hdac_bus {
 	spinlock_t reg_lock;
 	struct mutex cmd_mutex;
 	struct mutex lock;
+	struct mutex codec_bind_lock;	/* codec driver probe and remove */
 
 	/* DRM component interface */
 	struct drm_audio_component *audio_component;
diff --git a/sound/hda/common/bind.c b/sound/hda/common/bind.c
index 957feace0f58..abbb3b64ec09 100644
--- a/sound/hda/common/bind.c
+++ b/sound/hda/common/bind.c
@@ -104,6 +104,12 @@ static int hda_codec_driver_probe(struct device *dev)
 	if (WARN_ON(!codec->preset))
 		return -EINVAL;
 
+	/*
+	 * snd_card_register() below walks the device list of the card, which
+	 * the removal of another codec changes when it frees its PCMs.
+	 */
+	guard(mutex)(&codec->bus->core.codec_bind_lock);
+
 	err = snd_hda_codec_set_name(codec, codec->preset->name);
 	if (err < 0)
 		goto error;
@@ -171,6 +177,7 @@ static int hda_codec_driver_remove(struct device *dev)
 		return codec->bus->core.ext_ops->hdev_detach(&codec->core);
 	}
 
+	guard(mutex)(&codec->bus->core.codec_bind_lock);
 	snd_hda_codec_disconnect_pcms(codec);
 	snd_hda_jack_tbl_disconnect(codec);
 	snd_refcount_sync(&codec->pcm_ref);
diff --git a/sound/hda/core/bus.c b/sound/hda/core/bus.c
index 02462bd035e7..304110c9a6a7 100644
--- a/sound/hda/core/bus.c
+++ b/sound/hda/core/bus.c
@@ -44,6 +44,7 @@ int snd_hdac_bus_init(struct hdac_bus *bus, struct device *dev,
 	spin_lock_init(&bus->reg_lock);
 	mutex_init(&bus->cmd_mutex);
 	mutex_init(&bus->lock);
+	mutex_init(&bus->codec_bind_lock);
 	INIT_LIST_HEAD(&bus->hlink_list);
 	init_waitqueue_head(&bus->rirb_wq);
 	bus->irq = -1;
-- 
2.43.0


