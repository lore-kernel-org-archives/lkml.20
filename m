Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659890;
	b=VYkRBI/iqAIZeGZRFxfVMdeLhSZXeGGaFvxfoqIst0qKFGiUiSluC5253agMOh7JSCm+
	 GAe+1XG6fjhiU4aTdwhaGhxGV9TflesMdRgie1YqMwPtIXcwkIcKJAuJqN4oodXnR7/V2
	 gwtQ5UhzJGS418yZpASc+5vlMupMDKZE3MpL0XrVuD1/Z/PYLT+bhs5QjSuC1PiFC/dRD
	 XU1XPptAkWgwdIrDnm0ZLNOYA18kht9O05KVYhgIHHiAWCXGeg/yUvLYUaeUG5sdOYxwy
	 FgxDNUDhnqU1vVEzly1MxmCr23vBnNdcGiKmy7884LtzYyMoq+CdxH4/MH6Xr1UiYOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ly5mY1YpdHlG2pNEDAgxsSa7OYgfPcjm8DIliwpwuw8=;
	b=bhJtILAcHJcuiSbdwdE0SKYkheaKvWWmIT1yaMFpONOEtbTaDd8qFTO81wTj2MxEkicX
	 Tj5++Qq82kCSV61VUE2L9egNxaNjAvXAgpw00BE47HREG/4EzMf0+V2MDkRaHxJBXhQGb
	 PHUArny/klMjI4HRGN/O8Ju5DtTpaSHNREicDyDOeEk2fG1yr4mPe0OKCUHWaDzgevt04
	 qG5qtxy5qcPSDwjgdDY+0UUj5/WDhuKPMdmiLkVTQe7e68j/NbnX9HCpqLFBdHGtu6DYq
	 FSL4REgrt0wBQxecGrtO+aU3EJTsRPkncfgmyEBhN6tkUoOvqjIoRriO8tWU997J10w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HGxmun7n;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F2F606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82F2F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HGxmun7n
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ea1e7fad99so7955885ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792659890; x=1793264690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ly5mY1YpdHlG2pNEDAgxsSa7OYgfPcjm8DIliwpwuw8=;
        b=HGxmun7nCtCM1e6cnlqKTrCBjgmo42KHALITEK7i42Y388kaIDfCjBRCPelf8j1f/d
         NHJ5AOLOzhgvhg8O029t7s+/Za/JV7DuwiRgEllia1jBoYoPBdHdoJS5zaL5jVASNZ37
         mKy2HpZCpxCpkC/zi67MrlmXZrNziCV3CqFCSlQaTnkkZsLiXdyCIiEi9uEwUab2pFSm
         iPly5OzKpYWtGfwkdzOKuDioHSJ+Uqw77hfsbatn3dp6aFb3D0nff6I5J3k7pSl8jB9w
         UmGvhjg8sGtK1egoUKtEFv6wcQycCibDluyXADvSFbmUBf0ujM+nVVlCh7jQOsxCIlui
         J77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659890; x=1793264690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ly5mY1YpdHlG2pNEDAgxsSa7OYgfPcjm8DIliwpwuw8=;
        b=PIQaZx5mdDojZi0aaCXttjNLULoVjO9m+peA8o5qLnvRGyGRi+68Nbb5wbdVuM3pVg
         OQspAbqS6LNpd76ev03jMER5YVdMZ8LZWlejRv/cepg3F5rTpVMTvutgN2071P13sd86
         ApD3E6GrKqKyyyHWwkDsupSDWsZOb8jc6A9GFFzvxyYvp9ADdOMjB44mM65P1mdoLEr+
         rmIrdO9b7uomJsAPqiHo+iiPHTigbHcJx1fhpYM8BhPRFi7hu1jzuyvFnZMh78dVsY4s
         DqedHD/DKCXyi6e7V8SLiSlBqr1ukGIYZ5RrsRlfT3g4Neopa8atfHpeDKZZ9pkDk+rg
         0sxA==
X-Forwarded-Encrypted: i=1; AKwUvBzqotFfzhDxhe9DBCWZfmoJR7xzwBid6EG1p5DeBoFAEGO3VZafW/aiz00pvm/NR99wXFI9EsPh/ORXi9U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJijpm2pkV2KD7wBm8wLMzEEBonEyiaMOZRKCxOD372W5GkLFt
	ezcOwbPUvrah6NcWNqtHtGaRqEvbUQJEQ6Ky+5JU9ftrssAYnIE3dop6
X-Gm-Gg: AYBFou3TTQymEbaMcHMUX9I4F9AFzooy0mx6/d1eG8jQfNL8Sm/LxdOhsUrlrXknaKO
	mQOhTfYnptOglBv3XW4FSd2/e54CtBdjlcqmYS1gW5Jj1xA4rqB0VYHtVfRQeoBDsTbn8WEGo3F
	xf2wDFyLTV6tJmoCkWgSxRPMLc0Omc5fzah0GoIy50pDOpzJKh6N/3egl2M5PWSJDPHAG6lGidR
	o78Xi9UCZmdw2R0QfzHbVziiXSSqItztvNHT2eO+Hf3P0y4AU4Gb3S2L0P++PRX6A10bBnK0jR+
	QsYRE5u4WXzxhLH56qwZ/n3/5gZS1y3keRExPEFoAApU3wnKMUiwdH0e/nRdCZtO5yrGOHQhNrf
	g9u+eX5Cs9HRchsxzXzFhqbwDH+VdlvSutVkMHMYnIKRzqqvxMbzHIAr6AuoPVnA+ZCSt46tYuO
	TwpHH7YY/XTINy2IunjhZHCVyiOdXuNTCJ06VeQDMPAweGBuDpFy+opUsUkLJT1YCttsnnNyCS7
	7qsWeRv1V133vy2RjMICeg3wnVqibZxCF4AvNlPh/gKI27KklY=
X-Received: by 2002:a17:902:c948:b0:2dd:ad73:5b68 with SMTP id d9443c01a7336-2ea43a199afmr35402125ad.24.1792659889739;
        Thu, 22 Oct 2026 02:04:49 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b307c43sm20895485ad.1.2026.10.22.02.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:04:49 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v2] ALSA: pcm: Drain proc callbacks at device disconnect
Date: Thu, 22 Oct 2026 17:04:43 +0800
Message-Id: <pm-pmb-2439c851f82c443c3600-v6-cf4d8c3d01d51ad32b94@gmail.com>
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
while the controller and card remain registered.

With CONFIG_SND_VERBOSE_PROCFS, a prealloc write is buffered until file
release. Keep such a file open without an attached PCM runtime and unbind
the codec driver. The proc file does not hold a codec PCM reference, so
cleanup can free the preallocated buffer before the pending write runs:

  HDA codec unbind                    prealloc file release
  ----------------                    ---------------------
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

Proc rundown itself can also run this buffered write after the final
buffer cleanup, leaving its replacement allocation behind.

Remove and drain each stream's proc subtree at PCM disconnect, before
taking open_mutex, which the proc callbacks need. Retain the info entries
for their existing final cleanup: freeing the tree at disconnect would
leave the OSS child's saved proc_entry pointer dangling.

Add snd_info_disconnect() to separate proc rundown from entry freeing.
Mark the subtree disconnected and clear its proc pointers under
info_mutex, then remove the nodes outside that mutex so pending opens
can finish. Check ancestors under the same mutex when registering an
entry, preventing a later card registration or direct child registration
from republishing a disconnected subtree.

Suggested-by: Takashi Iwai <tiwai@suse.de>
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
Changes in v2:
- Follow Takashi's suggestion to remove and drain stream proc nodes at PCM
  disconnect rather than only moving final buffer cleanup.
- Run proc teardown before taking open_mutex and retain info entries for
  final cleanup, including the saved OSS child entries.
- Prevent later recursive or direct descendant registration from
  republishing a disconnected subtree.

Link to v1: https://lore.kernel.org/r/pm-pmb-2439c851f82c443c3600-v4-9e7df0ea42c36afe6171@gmail.com

 include/sound/info.h |  3 +++
 sound/core/info.c    | 31 ++++++++++++++++++++++++++++++-
 sound/core/pcm.c     |  9 +++++++++
 3 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/include/sound/info.h b/include/sound/info.h
index adbc506860d6..3775aed2d8ab 100644
--- a/include/sound/info.h
+++ b/include/sound/info.h
@@ -71,6 +71,7 @@ struct snd_info_entry {
 	void *private_data;
 	void (*private_free)(struct snd_info_entry *entry);
 	struct proc_dir_entry *p;
+	bool disconnected;
 	struct mutex access;
 	struct list_head children;
 	struct list_head list;
@@ -118,6 +119,7 @@ struct snd_info_entry *snd_info_create_card_entry(struct snd_card *card,
 					     const char *name,
 					     struct snd_info_entry *parent);
 void snd_info_free_entry(struct snd_info_entry *entry);
+void snd_info_disconnect(struct snd_info_entry *entry);
 
 int snd_info_card_create(struct snd_card *card);
 int snd_info_card_register(struct snd_card *card);
@@ -165,6 +167,7 @@ static inline char *snd_info_get_str(char *dest, char *src, int len) { return NU
 static inline struct snd_info_entry *snd_info_create_module_entry(struct module *module, const char *name, struct snd_info_entry *parent) { return NULL; }
 static inline struct snd_info_entry *snd_info_create_card_entry(struct snd_card *card, const char *name, struct snd_info_entry *parent) { return NULL; }
 static inline void snd_info_free_entry(struct snd_info_entry *entry) { ; }
+static inline void snd_info_disconnect(struct snd_info_entry *entry) { }
 
 static inline int snd_info_card_create(struct snd_card *card) { return 0; }
 static inline int snd_info_card_register(struct snd_card *card) { return 0; }
diff --git a/sound/core/info.c b/sound/core/info.c
index c4d57d0809ad..c74dd779d361 100644
--- a/sound/core/info.c
+++ b/sound/core/info.c
@@ -737,6 +737,30 @@ static void snd_info_clear_entries(struct snd_info_entry *entry)
 	entry->p = NULL;
 }
 
+/**
+ * snd_info_disconnect - remove proc nodes without freeing their info entries
+ * @entry: root of the info entry subtree
+ *
+ * Prevents registration of this subtree and drains its proc callbacks.
+ * The caller must serialize this with entry destruction and must not hold
+ * locks needed by the callbacks.  Entries remain for snd_info_free_entry().
+ */
+void snd_info_disconnect(struct snd_info_entry *entry)
+{
+	struct proc_dir_entry *p;
+
+	if (!entry)
+		return;
+
+	scoped_guard(mutex, &info_mutex) {
+		entry->disconnected = true;
+		p = entry->p;
+		snd_info_clear_entries(entry);
+	}
+	proc_remove(p);
+}
+EXPORT_SYMBOL(snd_info_disconnect);
+
 /**
  * snd_info_free_entry - release the info entry
  * @entry: the info entry
@@ -774,11 +798,16 @@ EXPORT_SYMBOL(snd_info_free_entry);
 static int __snd_info_register(struct snd_info_entry *entry)
 {
 	struct proc_dir_entry *root, *p = NULL;
+	struct snd_info_entry *parent;
 
 	if (snd_BUG_ON(!entry))
 		return -ENXIO;
-	root = entry->parent == NULL ? snd_proc_root->p : entry->parent->p;
 	guard(mutex)(&info_mutex);
+	for (parent = entry; parent; parent = parent->parent) {
+		if (parent->disconnected)
+			return 0;
+	}
+	root = !entry->parent ? snd_proc_root->p : entry->parent->p;
 	if (entry->p || !root)
 		return 0;
 	if (S_ISDIR(entry->mode)) {
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 1e4e0ecb3dbd..ca1b72ba252a 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -520,6 +520,11 @@ static int snd_pcm_stream_proc_init(struct snd_pcm_str *pstr)
 	return 0;
 }
 
+static void snd_pcm_stream_proc_disconnect(struct snd_pcm_str *pstr)
+{
+	snd_info_disconnect(pstr->proc_root);
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
@@ -1094,6 +1100,9 @@ static int snd_pcm_dev_disconnect(struct snd_device *device)
 	int cidx;
 
 	guard(mutex)(&register_mutex);
+	/* Proc callbacks may take open_mutex, including at file release. */
+	for (cidx = 0; cidx < 2; cidx++)
+		snd_pcm_stream_proc_disconnect(&pcm->streams[cidx]);
 	guard(mutex)(&pcm->open_mutex);
 	wake_up(&pcm->open_wait);
 	list_del_init(&pcm->list);
-- 
2.43.0

