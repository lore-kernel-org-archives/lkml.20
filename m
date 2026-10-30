Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793347439;
	b=wb8FhCj11yxK0tsKVRGJB+sWPabecRAQghLsSAyFdJbN1McEkEUb3Z+ZHwhVCpnKJTQy
	 EjiTuJILbR86wRKCmDUpXZ3BJYPAjnJFYIb83VxeUFTymnwO1iraGQc9MZI5QQwR68Xhc
	 z2m9U6fJ7UrtNYZZ6VyTnQe4CYC0pc2qD+OK0WnsNplY8GozxXfvcHW+RHUkUbiv8t6VR
	 92yuNnqxuVTKq0p2ZLkFict8HBOAqhnjOpooc+w5dzkfD2g7bvVZTG9zlISUPyNi9llOP
	 K8j4pR3GpDcSzLSdQz1oi3AOAVgGlNAFIeHfioRwtstjXnhRCfBbXSVn9OLQTNGGaqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793347439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dZNJDvIaGRH6cLfzhNMYE6D8QKHsbCCKVjQ0ML4vgu4=;
	b=BvSkXoIa4hp5J0YpsKvaoGmnlHqRVoopBvFWGS9L4IsDL+KKf8Vj8pmEyqhwsU2t+cf4
	 ICeEqha/iwlGPV1Ly4tN9ARcUegT/7dSAPp6bBeZAOqemnAYN2hnPpBrwPxyILoS7t4+V
	 ztB6ITOCiXTXDXvanEnmIyyIKgHpUwGdYW7ivsMiBbR7zEXAks3aSDJKCOxF8P3KTqAJP
	 Cm3AvxcnvQlDzysMnZBBrLDGqwCTBZaiyylnfKSaEb93ECLo+m2poTzrtSEW8nOylYSIM
	 ozumREB3rsEmb1fTY5QK5BD531AJFObeufwMD8+2Mrsukyx1MFWWBb885KEgmxYrmlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="g5/FLv82";
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CED9606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CED9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g5/FLv82
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso991641a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793347439; x=1793952239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dZNJDvIaGRH6cLfzhNMYE6D8QKHsbCCKVjQ0ML4vgu4=;
        b=g5/FLv82L71PHUKmY79dd5DAtvshpRKL/jrE2PwHlbLeoV0JJ0hg8GLC6vLCuC4XyS
         wcHmcp6zYJY19w7bEke7UkHXHMbLD6pITbDn7hzkVSMMzUmmj50ht2BkzwJGmC813eEl
         XWzzUkS+SbiyXXq2k3VDU1vRIE5HduQfVLUDmvNT6Hlx78tPO93soLGwsnLxrGVo1QCF
         ilwD/ngIpk8L9/QlRboiqVizEvxsYTPv+XLaHaHYgBHcjo7kGUjhqU/q8g9EjQtP5Xi9
         LL/9vUdMDdwFtGLHZH4bj1qi9a2dEhL0+GUeTb8aH8dzmZFL2oUx6zqud/9QKKVi1l2P
         FPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793347439; x=1793952239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dZNJDvIaGRH6cLfzhNMYE6D8QKHsbCCKVjQ0ML4vgu4=;
        b=eR/axOawOKFP9sM10IjhSV+hh4iZM/23kWjPondVSUCsjQQWoV6E+agz2cR3aAR+Oh
         uJ3Pmeiks2r0K2oz6S9tCxQyWhAAciWflbxgn4LmLJoEwdbiQrdR3y4q7o07hFkRkT40
         PAg4OpmMkda3qhwQx0G08DQFJBKuyxWejWMTRAQD3n2HT7tiEy3K0KGByLfYPJvbZnib
         a0tQzEE+Xk0jDsdp1p+K8P+LuJbCrkFJc5qY//Io9dbYcWsJXI9golVmvgWPRz6+GB/c
         u4vy/XdxVX6lqu7JFg0a8It8gGScC7ktZ/PVWCCgDgm2bLL0vBMPyWDe7OSe0qZhtmgM
         ssIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfSdMAnJYyN8d+I1mPjKVGZz0AVJkWz170Qw9EAYaSttmYC51kr6zKtx5XtNxcC7FfA8VGVqnCoP456k4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZefYhMVqkwm0YWMgJ31+AJr2Xhn6OCfdL+678ylUzmhDfHDzU
	0pa6fIPQCjfZNBVp3AC4bgSj0XAOz59aRoTe+MuOxfQpF+NAGKpBN4MD
X-Gm-Gg: AYBFou3wiWrSR830JocgzdCvnFNhoJwYUhYaMoMhDoSs4K+wwb06ZTQvaJnvcOOJBo7
	Tl34qN4zQzuM320+UTfbLcGGjMxj5IhrvvJTC1LeKJnHzakfEXkgXQ4kLo90AZ8g5ouqqA5Ul1T
	/5gJTI1Li0k+DIEliVctn9A0bdqnC1IENogUPH/ZQWXSEWLNAKeksX3NwxCy7HTyLkFqMnQ8BEr
	7pfpWeYex6Fahbli2kEve7UyC2An52Tnnzj73s44n3wRS86vYQf9rQ2panehH0YVa2Nvp++C+UK
	/TuWkgzKUY0qQDh7VOUhk7qz2xh7VGsiWbfkdKb+Vo/brAns7RqRv5HKS4li+q3EARIX7OLsHFq
	6Ao/pkdChQEracW3JcR80WZ0cZgI1dDx70c+Tq7hfBzmKG1wATZkVyaniiiH3iDABW1LWJpgNNI
	gUU983SCOytASfqwPA/L6TW4h+Ir/bQiojdX8x9CPjsVMNwx7buSVAwOMzrgIIWxxJdkTBWH5vf
	TKuQlJpHIdbQN9VUDeSytLaQ8cS+BEYTsdCL7mpq6UnBMXAWpcoy3wD2/eCOE/NjA6GyZH8mArP
	/c4K7NuTNXzjLniRpDNyq/RT
X-Received: by 2002:a17:90b:1c0f:b0:3ac:a6a5:5757 with SMTP id 98e67ed59e1d1-3ae896d7df6mr812597a91.11.1793347438867;
        Fri, 30 Oct 2026 01:03:58 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae84577911sm3073035a91.7.2026.10.30.01.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:03:58 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v3 2/5] ALSA: core: Add the card file while looking up a minor
Date: Fri, 30 Oct 2026 16:03:40 +0800
Message-Id: <pm-pmb-a4703edca61d34aa679b-v11-d9186d19e8afb48972af-2@gmail.com>
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

An open looks up its device with snd_lookup_minor_data(), which takes a
card reference, and adds its file to the card with snd_card_file_add()
only afterwards. The card reference does not keep alive a device that
its driver frees while the card stays registered, as the HD-audio codec
remove does with its PCMs. A remove that waits for the files of the card
can miss an open between the lookup and snd_card_file_add().

Add snd_lookup_minor_data_file() and snd_lookup_oss_minor_data_file(),
which add the file to the card while the minor lock is still held, and
record the device data of the minor with the file. After the minor has
been unregistered, an open either has its file on the card already or
does not find the device.

Add snd_card_file_sync() to wait until the files opened for a device are
gone, and wake its waiters in snd_card_file_remove(). Waiting for the
files of one device instead of all files of the card matters, because
the card files include the control device, which a sound server keeps
open for as long as it runs.

Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 include/sound/core.h   |  7 +++++
 sound/core/init.c      | 61 +++++++++++++++++++++++++++++++++++++-----
 sound/core/sound.c     | 34 +++++++++++++++++++++++
 sound/core/sound_oss.c | 21 +++++++++++++++
 4 files changed, 117 insertions(+), 6 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index d6584967fd49..4cecf04204f4 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -271,12 +271,16 @@ int snd_register_device(int type, struct snd_card *card, int dev,
 			void *private_data, struct device *device);
 int snd_unregister_device(struct device *dev);
 void *snd_lookup_minor_data(unsigned int minor, int type);
+void *snd_lookup_minor_data_file(unsigned int minor, int type,
+				 struct file *file);
 
 #ifdef CONFIG_SND_OSSEMUL
 int snd_register_oss_device(int type, struct snd_card *card, int dev,
 			    const struct file_operations *f_ops, void *private_data);
 int snd_unregister_oss_device(int type, struct snd_card *card, int dev);
 void *snd_lookup_oss_minor_data(unsigned int minor, int type);
+void *snd_lookup_oss_minor_data_file(unsigned int minor, int type,
+				     struct file *file);
 #endif
 
 int snd_minor_info_init(void);
@@ -323,7 +327,10 @@ int snd_card_add_dev_attr(struct snd_card *card,
 			  const struct attribute_group *group);
 int snd_component_add(struct snd_card *card, const char *component);
 int snd_card_file_add(struct snd_card *card, struct file *file);
+int snd_card_file_add_data(struct snd_card *card, struct file *file,
+			   const void *data);
 int snd_card_file_remove(struct snd_card *card, struct file *file);
+void snd_card_file_sync(struct snd_card *card, const void *data);
 
 struct snd_card *snd_card_ref(int card);
 
diff --git a/sound/core/init.c b/sound/core/init.c
index d518cb838777..ee660dc4098b 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -24,6 +24,7 @@
 /* monitor files for graceful shutdown (hotplug) */
 struct snd_monitor_file {
 	struct file *file;
+	const void *data;	/* device data from the minor lookup, or NULL */
 	const struct file_operations *disconnected_f_op;
 	struct list_head shutdown_list;	/* still need to shutdown */
 	struct list_head list;	/* link of monitor files */
@@ -1075,17 +1076,18 @@ int snd_component_add(struct snd_card *card, const char *component)
 EXPORT_SYMBOL(snd_component_add);
 
 /**
- *  snd_card_file_add - add the file to the file list of the card
+ *  snd_card_file_add_data - add the file of a device to the file list
  *  @card: soundcard structure
  *  @file: file pointer
+ *  @data: the device data the file is opened for
  *
- *  This function adds the file to the file linked-list of the card.
- *  This linked-list is used to keep tracking the connection state,
- *  and to avoid the release of busy resources by hotplug.
+ *  Like snd_card_file_add(), but also records @data for
+ *  snd_card_file_sync().
  *
  *  Return: zero or a negative error code.
  */
-int snd_card_file_add(struct snd_card *card, struct file *file)
+int snd_card_file_add_data(struct snd_card *card, struct file *file,
+			   const void *data)
 {
 	struct snd_monitor_file *mfile;
 
@@ -1093,6 +1095,7 @@ int snd_card_file_add(struct snd_card *card, struct file *file)
 	if (mfile == NULL)
 		return -ENOMEM;
 	mfile->file = file;
+	mfile->data = data;
 	mfile->disconnected_f_op = NULL;
 	INIT_LIST_HEAD(&mfile->shutdown_list);
 	guard(spinlock)(&card->files_lock);
@@ -1104,6 +1107,22 @@ int snd_card_file_add(struct snd_card *card, struct file *file)
 	get_device(&card->card_dev);
 	return 0;
 }
+
+/**
+ *  snd_card_file_add - add the file to the file list of the card
+ *  @card: soundcard structure
+ *  @file: file pointer
+ *
+ *  This function adds the file to the file linked-list of the card.
+ *  This linked-list is used to keep tracking the connection state,
+ *  and to avoid the release of busy resources by hotplug.
+ *
+ *  Return: zero or a negative error code.
+ */
+int snd_card_file_add(struct snd_card *card, struct file *file)
+{
+	return snd_card_file_add_data(card, file, NULL);
+}
 EXPORT_SYMBOL(snd_card_file_add);
 
 /**
@@ -1135,7 +1154,7 @@ int snd_card_file_remove(struct snd_card *card, struct file *file)
 				break;
 			}
 		}
-		if (list_empty(&card->files_list))
+		if (list_empty(&card->files_list) || (found && found->data))
 			wake_up_all(&card->remove_sleep);
 	}
 	if (!found) {
@@ -1148,6 +1167,36 @@ int snd_card_file_remove(struct snd_card *card, struct file *file)
 }
 EXPORT_SYMBOL(snd_card_file_remove);
 
+static bool snd_card_has_data_file(struct snd_card *card, const void *data)
+{
+	struct snd_monitor_file *mfile;
+
+	list_for_each_entry(mfile, &card->files_list, list) {
+		if (mfile->data == data)
+			return true;
+	}
+	return false;
+}
+
+/**
+ *  snd_card_file_sync - wait until the files opened for a device are closed
+ *  @card: soundcard structure
+ *  @data: the device data registered for the minors of the device
+ *
+ *  Waits until every file added for @data by snd_lookup_minor_data_file()
+ *  or snd_lookup_oss_minor_data_file() has been removed from @card.  The
+ *  minors of the device must already be unregistered, so that no new file
+ *  can be added for it.
+ */
+void snd_card_file_sync(struct snd_card *card, const void *data)
+{
+	guard(spinlock_irq)(&card->files_lock);
+	wait_event_lock_irq(card->remove_sleep,
+			    !snd_card_has_data_file(card, data),
+			    card->files_lock);
+}
+EXPORT_SYMBOL_GPL(snd_card_file_sync);
+
 #ifdef CONFIG_PM
 /**
  * snd_power_ref_and_wait - wait until the card gets powered up
diff --git a/sound/core/sound.c b/sound/core/sound.c
index 24f40763a20c..94334cbc02b5 100644
--- a/sound/core/sound.c
+++ b/sound/core/sound.c
@@ -115,6 +115,40 @@ void *snd_lookup_minor_data(unsigned int minor, int type)
 }
 EXPORT_SYMBOL(snd_lookup_minor_data);
 
+/**
+ * snd_lookup_minor_data_file - get user data of a device and add the file
+ * @minor: the minor number
+ * @type: device type (SNDRV_DEVICE_TYPE_XXX)
+ * @file: the file being opened
+ *
+ * Like snd_lookup_minor_data(), but instead of taking a reference to the
+ * card, adds @file to the file list of the card while the minor is still
+ * registered, and records the user data for snd_card_file_sync().  The
+ * caller must call snd_card_file_remove() when it is done with the file.
+ *
+ * Return: The user data pointer if the specified device is found, %NULL if
+ * it is not found, or an error pointer if the file cannot be added.
+ */
+void *snd_lookup_minor_data_file(unsigned int minor, int type,
+				 struct file *file)
+{
+	struct snd_minor *mreg;
+	int err;
+
+	if (minor >= ARRAY_SIZE(snd_minors))
+		return NULL;
+	guard(mutex)(&sound_mutex);
+	mreg = snd_minors[minor];
+	if (!mreg || mreg->type != type || !mreg->private_data ||
+	    !mreg->card_ptr)
+		return NULL;
+	err = snd_card_file_add_data(mreg->card_ptr, file, mreg->private_data);
+	if (err < 0)
+		return ERR_PTR(err);
+	return mreg->private_data;
+}
+EXPORT_SYMBOL(snd_lookup_minor_data_file);
+
 #ifdef CONFIG_MODULES
 static struct snd_minor *autoload_device(unsigned int minor)
 {
diff --git a/sound/core/sound_oss.c b/sound/core/sound_oss.c
index 7eb49f2cada5..2f0bc481a46d 100644
--- a/sound/core/sound_oss.c
+++ b/sound/core/sound_oss.c
@@ -41,6 +41,27 @@ void *snd_lookup_oss_minor_data(unsigned int minor, int type)
 }
 EXPORT_SYMBOL(snd_lookup_oss_minor_data);
 
+/* Like snd_lookup_minor_data_file(), for OSS minors */
+void *snd_lookup_oss_minor_data_file(unsigned int minor, int type,
+				     struct file *file)
+{
+	struct snd_minor *mreg;
+	int err;
+
+	if (minor >= ARRAY_SIZE(snd_oss_minors))
+		return NULL;
+	guard(mutex)(&sound_oss_mutex);
+	mreg = snd_oss_minors[minor];
+	if (!mreg || mreg->type != type || !mreg->private_data ||
+	    !mreg->card_ptr)
+		return NULL;
+	err = snd_card_file_add_data(mreg->card_ptr, file, mreg->private_data);
+	if (err < 0)
+		return ERR_PTR(err);
+	return mreg->private_data;
+}
+EXPORT_SYMBOL(snd_lookup_oss_minor_data_file);
+
 static int snd_oss_kernel_minor(int type, struct snd_card *card, int dev)
 {
 	int minor;
-- 
2.43.0


