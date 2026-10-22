Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792666707;
	b=B1nOgPp0w4FIrlixMQbxPSQtql+yUYQh/ZOBCyqn+s3isaa6o37WYttPE5qwJO6LncuO
	 92LAjYLNY2LWx+FtFl7EkI4iXo3u0PhmKTr2btaPgr4vt29Djag99GkioPplcy3jp1QlD
	 iC46qMwyOTA3n8VGs3SDA8AvBKyDk5o8RA/V39iR/4MUwh9v1myagKOT97nl9Tvr7NHFS
	 YXvTFjK4wrmRA/7Nf6Y9xzfO/t52Fxgfio/4gc7913QdUFVFEZK8ArjG4hu/yDN+A7A6Z
	 EHdSrAkWm3nkThSqGpXy8rZrNUcAELg8wtaUBq0LabsHEbXhQqQR4JWAkkxNTxDrEoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792666707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=z3MwgKm/+4UvO+ITYM5MpQc83LJLwq1ofv4xjl5XGGs=;
	b=C7WdVsqJE32IP9MAXDykpTdUr8WISG9U2L6eNsUal1v8C5R0p/U8MDfzBH4RntdAAlTu
	 QvM+OlaHGGaSz8n3kcu2mC0rYJzTD997WG8ZNvwrSzBSJO9NRVEgH9t8dKXi26BEdaR+q
	 I1kTN2coZEn1m2y46JBzYzn6hYWKlP4IbiFkwKeztHd34SpcXww1sAcmwknSl0fCujVly
	 typJeCmBkQzsRy5AG9IWn1+9iM2YFAMCOEnoDmzFG260tUu1cm8HpIKS/JqzqPp6N+Acm
	 v89mx6LznVRlxU6fkUu69zBXT8TL8J5yGVxytSskhTzcgsF+BWt1Do4LYDV9QMhfqGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LZzNlTjb;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7320B606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:58:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7320B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LZzNlTjb
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ea4f255ba1so5114075ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792666706; x=1793271506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z3MwgKm/+4UvO+ITYM5MpQc83LJLwq1ofv4xjl5XGGs=;
        b=LZzNlTjbmqTV2zdBPi1O7mD6wTqP96RrJVULQ5mxD25wz7XeqwmcXQJNSOWTc/9NPe
         l7pVW3ZvIu2wJJD9h9JOuwiO/OhEnVQLPBc2rL+IMy/uOQEW00IZkUb5G48XSkEuyqC/
         sN8LPP9atenCGRfpdCDupon2HM404waKM1c+0mkzrNcBMSOJWZ8XyVSFraS27fkp6GL2
         /GaUlZChZBuhKr/KVeOS80ZIwNKaaJ0XU8jdHwvnS4eOkesc7yeFaOCVu1bv1mwepcWN
         mwZGQOP3BjH9dVQqeqyaYnIMFg+HCZYzWZJjO6cwlfnKEIhiDY4OsdnQoUHI4ZkRUoTu
         Sn6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792666706; x=1793271506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z3MwgKm/+4UvO+ITYM5MpQc83LJLwq1ofv4xjl5XGGs=;
        b=XSyZi4uGJc2Fj0iv3GqLLJ1Ls8y9mNik6Sf6wf7SM1QIk1uBnDIvwv2vsFfabGxiv9
         2CYNKBoKEKznpWelS2IgOCxMjQ6s26fXtu3P4kwZwDwhpLZEnKBbnx4Mw+tftQA75yRD
         JHWvIfN+8OTS3ludrmVNt2CucLrvumg0GA+wHEk3ltmk7H14PndMXWLXkwyrQ+H6rJa8
         bbRNuSbxfeCIe4ZhmxxfNvVwq+/dVgvUeBgm031cAekR37rA9XWiYtL3BGkE6gHqM3uS
         cnIPrS1eD2VRNRf1niT65aVOk7dbcfUTczmiT46jNPWkrnpAbE9MKsPQL7Yye/sgjvUw
         TDkw==
X-Forwarded-Encrypted: i=1; AKwUvBySSZvuJPMRl7/wUN6ELgOzSqWlQhGuQ1LYUetlJ22ahN2sGrzvgzZD4acrGB5qNmYTLCaayUWbFoOjgZc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcHi+5/bvjn756wKk/ik1UqkPtBSM5XPHrtTP5SZ0mAw9WMOh+
	2pZPTeIdqIRuU9TmB+MMP6PqOvlQSiz4Uqwy9ZjZkii19iGLeSEid6KT
X-Gm-Gg: AYBFou3msqOj3iB7YaZQ/3YBsk4PWaJNVKP9XfHZoCNCrvngBaMOJeB1sTNF8IAbnM/
	DzvBnVVySQRTZXuPDoUlCu4mnBNUnKWf27luQbmTfvnwcp9iivYToKAlwwxpMduUVffGUZrIrhu
	QqUUAtyo2heXBsdhrEeIBkNZ4WkRkz1YJ/U3ZqImfmeB4DFaYbRWu8qkwbTCB0QIdNUbv5xTWL6
	X5FTRXomkZWhGLRhxKTHtsJ95hx/uZ+4xCHDKy49vzv0mgNGaS0lOwTYiE7FTVQdvJMwKy0XTqT
	+SjbyGoOwXUnUwul1yZ89lElnM5RWYl+3eIjfI+I0hnaHtoJzUpz4Q5jHMUZyBHHLhJhl25GUFF
	dMvsC5DjyB65fV06of8kuDe0SnaAQqL/f0Qqq8tTwkdnvyqwY1Ut5Bt3BjFxqvlDbGGeJFB37h3
	+HwvqdfCSKGYKDSRjBQ/KMRIuTKU7WICPRyt3vjnTqwobsBB2PDOj5/ll2MswRTT45waowThCZ5
	8BDFqcHR4+HOGN0EM7SfvS4K0qOVA+zZqU2OTN4VDpKDWsgksc=
X-Received: by 2002:a17:903:35c6:b0:2e9:3f5a:de9b with SMTP id d9443c01a7336-2ea43d3a74amr38315375ad.9.1792666706494;
        Thu, 22 Oct 2026 03:58:26 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b412756sm22727845ad.24.2026.10.22.03.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:58:26 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v3] ALSA: pcm: Drain proc callbacks at device disconnect
Date: Thu, 22 Oct 2026 18:58:20 +0800
Message-Id: <pm-pmb-2439c851f82c443c3600-v7-2774a482b7f03e1fef60@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Disconnecting an individual PCM leaves its proc files accessible until
snd_pcm_free_stream(). HDA codec-only sysfs unbind can take this path
while the controller and card remain registered. An open proc file pins
the card module, but does not hold a codec PCM reference.

With CONFIG_SND_VERBOSE_PROCFS, a prealloc write is buffered until file
release. Without an attached PCM runtime, its release can replace the
DMA buffer after final PCM cleanup has already freed the preallocation:

  HDA codec unbind                  prealloc file release
  ----------------                  ---------------------
  hda_codec_driver_remove()
    snd_hda_codec_disconnect_pcms()
      snd_device_disconnect()
        snd_pcm_dev_disconnect()
        /* proc nodes remain */
    snd_hda_codec_cleanup_for_unbind()
      codec_release_pcms()
        snd_device_free()
          snd_pcm_free()
            free preallocated buffer
                                    snd_info_text_entry_release()
                                      snd_pcm_lib_preallocate_proc_write()
                                        replace DMA buffer
            remove stream proc nodes
            free substream

The later proc rundown can itself invoke this buffered write and leave
the replacement allocation without a final free. A concurrent release
can also overlap the earlier buffer cleanup.

Extract snd_info_disconnect_entry() from snd_info_free_entry() to remove
proc nodes and drain callbacks without freeing the info entry objects.
Use it for both stream directions at PCM disconnect. Finish the existing
PCM state and device disconnection under open_mutex, then drop that lock
before proc rundown: even an otherwise idle proc file can run its
buffered release callback, which takes open_mutex, during proc_remove().

Keep entry ownership and final cleanup unchanged, including the saved
OSS child entries. As with existing info entry teardown, callers must
serialize registration with disconnection and release.

Suggested-by: Takashi Iwai <tiwai@suse.de>
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
Changes in v3:
- Use the simpler snd_info_disconnect_entry helper suggested by Takashi and
  reuse it from snd_info_free_entry.
- Drop the persistent disconnected flag and ancestor registration checks;
  leave registration/teardown serialization to the caller.
- Complete the existing PCM state and device disconnection before dropping
  open_mutex and draining proc callbacks; export the helper and provide
  valid disabled-config stubs.

Changes in v2:
- Follow Takashi's suggestion to remove and drain stream proc nodes at PCM
  disconnect rather than only moving final buffer cleanup.
- Run proc teardown before taking open_mutex and retain info entries for
  final cleanup, including the saved OSS child entries.
- Prevent later recursive or direct descendant registration from
  republishing a disconnected subtree.

Link to v1: https://lore.kernel.org/r/pm-pmb-2439c851f82c443c3600-v4-9e7df0ea42c36afe6171@gmail.com
Link to v2: https://lore.kernel.org/r/pm-pmb-2439c851f82c443c3600-v6-cf4d8c3d01d51ad32b94@gmail.com

 include/sound/info.h |  2 ++
 sound/core/info.c    | 23 ++++++++++++++----
 sound/core/pcm.c     | 56 ++++++++++++++++++++++++++------------------
 3 files changed, 53 insertions(+), 28 deletions(-)

diff --git a/include/sound/info.h b/include/sound/info.h
index adbc506860d6..f216291e5c41 100644
--- a/include/sound/info.h
+++ b/include/sound/info.h
@@ -117,6 +117,7 @@ struct snd_info_entry *snd_info_create_module_entry(struct module *module,
 struct snd_info_entry *snd_info_create_card_entry(struct snd_card *card,
 					     const char *name,
 					     struct snd_info_entry *parent);
+void snd_info_disconnect_entry(struct snd_info_entry *entry);
 void snd_info_free_entry(struct snd_info_entry *entry);
 
 int snd_info_card_create(struct snd_card *card);
@@ -164,6 +165,7 @@ static inline int snd_info_get_line(struct snd_info_buffer *buffer, char *line,
 static inline char *snd_info_get_str(char *dest, char *src, int len) { return NULL; }
 static inline struct snd_info_entry *snd_info_create_module_entry(struct module *module, const char *name, struct snd_info_entry *parent) { return NULL; }
 static inline struct snd_info_entry *snd_info_create_card_entry(struct snd_card *card, const char *name, struct snd_info_entry *parent) { return NULL; }
+static inline void snd_info_disconnect_entry(struct snd_info_entry *entry) { }
 static inline void snd_info_free_entry(struct snd_info_entry *entry) { ; }
 
 static inline int snd_info_card_create(struct snd_card *card) { return 0; }
diff --git a/sound/core/info.c b/sound/core/info.c
index c4d57d0809ad..023b4736aa6d 100644
--- a/sound/core/info.c
+++ b/sound/core/info.c
@@ -737,6 +737,23 @@ static void snd_info_clear_entries(struct snd_info_entry *entry)
 	entry->p = NULL;
 }
 
+/**
+ * snd_info_disconnect_entry - remove proc nodes and drain their callbacks
+ * @entry: root of the info entry subtree
+ *
+ * Retains the info entries for snd_info_free_entry().  Callers must serialize
+ * registration and destruction, and must not hold locks needed by callbacks.
+ */
+void snd_info_disconnect_entry(struct snd_info_entry *entry)
+{
+	if (entry && entry->p) {
+		proc_remove(entry->p);
+		guard(mutex)(&info_mutex);
+		snd_info_clear_entries(entry);
+	}
+}
+EXPORT_SYMBOL(snd_info_disconnect_entry);
+
 /**
  * snd_info_free_entry - release the info entry
  * @entry: the info entry
@@ -749,11 +766,7 @@ void snd_info_free_entry(struct snd_info_entry * entry)
 
 	if (!entry)
 		return;
-	if (entry->p) {
-		proc_remove(entry->p);
-		guard(mutex)(&info_mutex);
-		snd_info_clear_entries(entry);
-	}
+	snd_info_disconnect_entry(entry);
 
 	/* free all children at first */
 	list_for_each_entry_safe(p, n, &entry->children, list)
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 1e4e0ecb3dbd..064df4cd3b50 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -520,6 +520,11 @@ static int snd_pcm_stream_proc_init(struct snd_pcm_str *pstr)
 	return 0;
 }
 
+static void snd_pcm_stream_proc_disconnect(struct snd_pcm_str *pstr)
+{
+	snd_info_disconnect_entry(pstr->proc_root);
+}
+
 static int snd_pcm_stream_proc_done(struct snd_pcm_str *pstr)
 {
 	snd_info_free_entry(pstr->proc_root);
@@ -580,6 +585,7 @@ static int snd_pcm_substream_proc_init(struct snd_pcm_substream *substream)
 
 #else /* !CONFIG_SND_VERBOSE_PROCFS */
 static inline int snd_pcm_stream_proc_init(struct snd_pcm_str *pstr) { return 0; }
+static inline void snd_pcm_stream_proc_disconnect(struct snd_pcm_str *pstr) { }
 static inline int snd_pcm_stream_proc_done(struct snd_pcm_str *pstr) { return 0; }
 static inline int snd_pcm_substream_proc_init(struct snd_pcm_substream *substream) { return 0; }
 #endif /* CONFIG_SND_VERBOSE_PROCFS */
@@ -1094,33 +1100,37 @@ static int snd_pcm_dev_disconnect(struct snd_device *device)
 	int cidx;
 
 	guard(mutex)(&register_mutex);
-	guard(mutex)(&pcm->open_mutex);
-	wake_up(&pcm->open_wait);
-	list_del_init(&pcm->list);
-
-	for_each_pcm_substream(pcm, cidx, substream) {
-		snd_pcm_stream_lock_irq(substream);
-		if (substream->runtime) {
-			if (snd_pcm_running(substream))
-				snd_pcm_stop(substream, SNDRV_PCM_STATE_DISCONNECTED);
-			/* to be sure, set the state unconditionally */
-			__snd_pcm_set_state(substream->runtime,
-					    SNDRV_PCM_STATE_DISCONNECTED);
-			wake_up(&substream->runtime->sleep);
-			wake_up(&substream->runtime->tsleep);
+	scoped_guard(mutex, &pcm->open_mutex) {
+		wake_up(&pcm->open_wait);
+		list_del_init(&pcm->list);
+
+		for_each_pcm_substream(pcm, cidx, substream) {
+			snd_pcm_stream_lock_irq(substream);
+			if (substream->runtime) {
+				if (snd_pcm_running(substream))
+					snd_pcm_stop(substream, SNDRV_PCM_STATE_DISCONNECTED);
+				/* to be sure, set the state unconditionally */
+				__snd_pcm_set_state(substream->runtime,
+						    SNDRV_PCM_STATE_DISCONNECTED);
+				wake_up(&substream->runtime->sleep);
+				wake_up(&substream->runtime->tsleep);
+			}
+			snd_pcm_stream_unlock_irq(substream);
 		}
-		snd_pcm_stream_unlock_irq(substream);
-	}
 
-	for_each_pcm_substream(pcm, cidx, substream)
-		snd_pcm_sync_stop(substream, false);
+		for_each_pcm_substream(pcm, cidx, substream)
+			snd_pcm_sync_stop(substream, false);
 
-	pcm_call_notify(pcm, n_disconnect);
-	for (cidx = 0; cidx < 2; cidx++) {
-		if (pcm->streams[cidx].dev)
-			snd_unregister_device(pcm->streams[cidx].dev);
-		free_chmap(&pcm->streams[cidx]);
+		pcm_call_notify(pcm, n_disconnect);
+		for (cidx = 0; cidx < 2; cidx++) {
+			if (pcm->streams[cidx].dev)
+				snd_unregister_device(pcm->streams[cidx].dev);
+			free_chmap(&pcm->streams[cidx]);
+		}
 	}
+	/* Proc rundown can run release callbacks which take open_mutex. */
+	for (cidx = 0; cidx < 2; cidx++)
+		snd_pcm_stream_proc_disconnect(&pcm->streams[cidx]);
 	return 0;
 }
 
-- 
2.43.0

