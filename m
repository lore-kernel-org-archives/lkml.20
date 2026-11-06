Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793930872;
	b=zGsB/TvkI+iFIehIgPwMIT/vO2mpUFjITz5DcutSyIG7a6rgRZ8I1a7zSQBX4BdKWzQ0
	 2uqkvENRoVZaHcuGPy7V5iA2sl4yxCGyMC3t/PrYrw7sZEM9dDzjPdzKC2n0/Ks++QT4E
	 8FE1dD/UAPfJOLnhTUF0FbtZiKxFD0G6tmRJosksEOKbXHZhTruvXwL3yP4gLDSNSm4yA
	 2Eu9WCuiOs46Uf0Ew2iTghnMJzCzbAzB+vetiz4kT5MYT2MIlbse7LVqsHzjf8z4ij5o8
	 DHKvWcTY5tlDbRRMNs7kwTDODrejkx56krjuCNyXZXRP51GQpEO283v6VPBWx7I0KKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793930872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g6yrpkYpn4/WD1dfKclOjoTpzE6zylcSYmjvcux4Mlo=;
	b=bz5SOCvWBeJtdhYLl6r+18Wtdr1BTSG4tOEYEHq4mwisi/02GgEJghMQkUuWEjgX96bN
	 2t1uUjc++58qbjiHhnEXKqCqca3tlj/nRphix7xgepqYjy51IeYOlRltJYMB2EK2GGC4y
	 7r39721/oAxj8LMDL0rE2f+vPHP/uykExbtrith78b3q6w5RWMh/U5AFiGEv2tBXJUDvY
	 mzpj2X7aEXs21HPk2OCSJf20jUZ/m412hN+NNhrG0NjwRaCu135oX6l4n3ja9QoCmx6E2
	 2jDrw7lw0L+PaH15CnRqfluJc9CAenkwxkQk5LCFtgiYzxme0DEBKOOxhdBRktPymVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fTU5MR6f;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3217F606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 02:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3217F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fTU5MR6f
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36a1947498bso540356eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 18:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793930870; x=1794535670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g6yrpkYpn4/WD1dfKclOjoTpzE6zylcSYmjvcux4Mlo=;
        b=fTU5MR6fwGF57VUPe71NbT42aGNI79QyIL0j56kfPhSDlC6jiW5q3siWlquEnYqUwF
         ickrzoMrIgWwAyyCRQkViSoah3fG8lDF/DBbC4oU7oy5VcXk7JEPz5c6JvYH4qTWz9+9
         jFHrot/ZQaqnIsY9s5ZaSEFTKb08jifXt6FvCUF0H0qtJDLAsDXnlPxzbj+eJhAvx87+
         onmdFkZBGm6SsH2Nbl3PRRvcFUMJGkmbEuLIdhjFEFv+jE9x7lrLyZ1FJbdF6YeyAALW
         T7MqcBWkTtW8Pz3B2nHY8yDnCgqfzzL7htULsPdJRhFtroKpq9KucTPoAzOE/1ZUi3a6
         o6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793930870; x=1794535670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g6yrpkYpn4/WD1dfKclOjoTpzE6zylcSYmjvcux4Mlo=;
        b=ElrdKUtj6tdN6ko3grTly6GMVynDVId3i8Zfp/2d2f4kvVSuOfKrDU6HdxDJbDTsk7
         qfD7qpyElE6xYYV/VOI26CFNkN2W8QIj4v5wo8qtH1W9FDDI3lY/LEfLQ7vh6lzGU3L2
         EMJ5n1RXVOUqQ69JR7tO9sJsXjsVMUEEg/1lgy34mPH/BdjNZExT6CAmbyLeF9YQrXos
         n0YaJ654h2i/kRTK858+p3+RvtFQ1gQYesW+USOdAwbmP3VNO6NzCYNjsdmzQSUS1xqm
         ciBfls1BhvouEvhTa5wgM7DFQVF7hZBE/hcWOfUpQZsBfiigtRWrJ2SGzXE5Euh2Ymwx
         +Xbg==
X-Forwarded-Encrypted: i=1; AKwUvBwNwatapT5EcMbMt6lRRUKAKOaSk+Aj3diFr/viQZTumtylyS39Zy+nurcKbzs2z8b41tCcdHQ0cIm8acU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mPWbLVHMjurQFYkFhWGLJqd1UGlixeBEURG8OAc/NA9ogkUzY
	ETqWnyhO3AXFAVMvzvrD0JkbGr59j/kn5QS11ot2KVmdQsPaz93US28j
X-Gm-Gg: AYBFou3yxNVSmYt+oIIK2fXH2O5V3WTy+6Pi8ILPAerXvaCP0qG6kbstXIiuBMQ7CAU
	0wTeNAv4bv28Wg8mpMVII3NopQhHM9kdanWW1PEDNDV2lcSIjCxrut/pXYh72ccPHTkc/UD6Uyp
	i4idBqlBy1ChqYktdizFjsejoOrRuGYEg1C1KUcFo34TB5hKgAhsEq40RGDshGpiEl5EJN0eF8n
	aNpRX2Ue6NafnLutFcoxOxwI3IQGPmA8AnPxKnC4wp0ct30DfJHP3feus4kq1bqEr0tyQEu+lQY
	RkpsVbDSg8NTBJVdUHbf5UrgtSi2hIFHEHpAXDoDsgGoJYkzoadF+YXCVjhRs5X8TTuA3PdBZLb
	d7x8/LI1YoF2hC5f8vAohy8QeAFQmCP4r0UgPRoc7pI4XaQsoUKV5OGVC4DY3t2Wz5/TEOvU/gs
	BQ4nwv/3QaPBMV+Zvrhi/lLzn0KvHCmnF6ZSzUJHtt0on20lW47hMapoNAbrhxwDWo26+FJI6gh
	ZnHS1NTzsRgCdl/ipMSD/k8muUtbCZVdrhbEfdD0q49w5DPatndvya6mxfEZZAn9grAHPMTjkUt
	YlM0xQngEWwmUM4YROTqtGJ7+AbOD6uizbh7+y+RrfWiuA3UuHHZfbBCKr2YnRPAidGS0iwaid2
	f68508w==
X-Received: by 2002:a05:7022:f107:b0:1a9:c9fe:12c7 with SMTP id a92af1059eb24-1b25d305915mr1103875c88.9.1793930869672;
        Thu, 05 Nov 2026 18:07:49 -0800 (PST)
Received: from localhost.localdomain (c-73-158-21-37.hsd1.ca.comcast.net. [73.158.21.37])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4b1449sm923308c88.12.2026.11.05.18.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 18:07:48 -0800 (PST)
From: Saad Varshani <varshanisaad@gmail.com>
To: varshanisaad@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	nkapron@google.com,
	syzbot+300213c2b5b55c0244f4@syzkaller.appspotmail.com
Subject: [PATCH v2] usb: gadget: uvc: Fix deadlocks in uvcg_configfs attribute callbacks
Date: Thu,  5 Nov 2026 18:07:27 -0800
Message-ID: <20261106020727.6055-1-varshanisaad@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105053900.20082-1-varshanisaad@gmail.com>
References: <20261105053900.20082-1-varshanisaad@gmail.com>
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

Removed su_mutex locking in the function uvcg_extension_bm_controls_store.
Done this due to the deadlock caused by the mutex conflict in
fs/configfs_write_iter. Validated commit with the C repro provided by
syzbot. No other conficts observed.

Also removed the su_mutex in the other attribute extension functions.
Such as uvcg_extension_b_control_size_store. This applies to all
uvcg_configfs attribute store/show functions.

The deadlock was happening due to a circular mutex dependency between
configfs (frag_sem) and uvcg_extension su_mutex. The reason it is safe
to traverse item->ci_parent without su_mutex is because
configfs_write_iter() calls flush_write_buffer() which calls the
attribute function, holding frag_sem. Which prevents configfs_rmdir()
from unlinking the item or its ci_parent hierarchy

Reported-by: syzbot+300213c2b5b55c0244f4@syzkaller.appspotmail.com
Closes: https://syzbot.org/bug?extid=300213c2b5b55c0244f4
Signed-off-by: Saad Varshani <varshanisaad@gmail.com>
---
 drivers/usb/gadget/function/uvc_configfs.c | 235 ---------------------
 1 file changed, 235 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 70a1415ea401..6a4f17b925e7 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -191,11 +191,8 @@ static ssize_t uvcg_control_header_##cname##_show(			\
 	struct uvcg_control_header *ch = to_uvcg_control_header(item);	\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &ch->item.ci_group->cg_subsys->su_mutex;\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = ch->item.ci_parent->ci_parent->ci_parent;		\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -203,7 +200,6 @@ static ssize_t uvcg_control_header_##cname##_show(			\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(ch->desc.aname));\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -214,12 +210,9 @@ uvcg_control_header_##cname##_store(struct config_item *item,		\
 	struct uvcg_control_header *ch = to_uvcg_control_header(item);	\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &ch->item.ci_group->cg_subsys->su_mutex;\
 	int ret;							\
 	u##bits num;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = ch->item.ci_parent->ci_parent->ci_parent;		\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -241,7 +234,6 @@ uvcg_control_header_##cname##_store(struct config_item *item,		\
 	ret = len;							\
 end:									\
 	mutex_unlock(&opts->lock);					\
-	mutex_unlock(su_mutex);						\
 	return ret;							\
 }									\
 									\
@@ -309,12 +301,9 @@ static ssize_t uvcg_default_processing_##cname##_show(			\
 	struct config_group *group = to_config_group(item);		\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;		\
 	struct uvc_processing_unit_descriptor *pd;			\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent;	\
 	opts = to_f_uvc_opts(opts_item);				\
 	pd = &opts->uvc_processing;					\
@@ -323,7 +312,6 @@ static ssize_t uvcg_default_processing_##cname##_show(			\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(pd->aname));	\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -340,7 +328,6 @@ static ssize_t uvcg_default_processing_bm_controls_store(
 	struct config_item *item, const char *page, size_t len)
 {
 	struct config_group *group = to_config_group(item);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvc_processing_unit_descriptor *pd;
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
@@ -348,8 +335,6 @@ static ssize_t uvcg_default_processing_bm_controls_store(
 	unsigned int i;
 	int ret, n = 0;
 
-	mutex_lock(su_mutex);
-
 	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 	pd = &opts->uvc_processing;
@@ -390,7 +375,6 @@ static ssize_t uvcg_default_processing_bm_controls_store(
 	kfree(bm_controls);
 unlock:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 
@@ -400,13 +384,10 @@ static ssize_t uvcg_default_processing_bm_controls_show(
 	struct config_group *group = to_config_group(item);
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvc_processing_unit_descriptor *pd;
 	int result, i;
 	char *pg = page;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 	pd = &opts->uvc_processing;
@@ -418,8 +399,6 @@ static ssize_t uvcg_default_processing_bm_controls_show(
 	}
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return result;
 }
 
@@ -470,12 +449,9 @@ static ssize_t uvcg_default_camera_##cname##_show(			\
 	struct config_group *group = to_config_group(item);		\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;		\
 	struct uvc_camera_terminal_descriptor *cd;			\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent->	\
 			ci_parent;					\
 	opts = to_f_uvc_opts(opts_item);				\
@@ -485,8 +461,6 @@ static ssize_t uvcg_default_camera_##cname##_show(			\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(cd->aname));	\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
-									\
 	return result;							\
 }									\
 									\
@@ -509,7 +483,6 @@ static ssize_t uvcg_default_camera_bm_controls_store(
 	struct config_item *item, const char *page, size_t len)
 {
 	struct config_group *group = to_config_group(item);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvc_camera_terminal_descriptor *cd;
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
@@ -517,8 +490,6 @@ static ssize_t uvcg_default_camera_bm_controls_store(
 	unsigned int i;
 	int ret, n = 0;
 
-	mutex_lock(su_mutex);
-
 	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent->
 			ci_parent;
 	opts = to_f_uvc_opts(opts_item);
@@ -560,7 +531,6 @@ static ssize_t uvcg_default_camera_bm_controls_store(
 	kfree(bm_controls);
 unlock:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 
@@ -570,13 +540,10 @@ static ssize_t uvcg_default_camera_bm_controls_show(
 	struct config_group *group = to_config_group(item);
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvc_camera_terminal_descriptor *cd;
 	int result, i;
 	char *pg = page;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent->
 			ci_parent;
 	opts = to_f_uvc_opts(opts_item);
@@ -588,8 +555,6 @@ static ssize_t uvcg_default_camera_bm_controls_show(
 		pg = page + result;
 	}
 	mutex_unlock(&opts->lock);
-
-	mutex_unlock(su_mutex);
 	return result;
 }
 
@@ -643,12 +608,9 @@ static ssize_t uvcg_default_output_##cname##_show(			\
 	struct config_group *group = to_config_group(item);		\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;		\
 	struct uvc_output_terminal_descriptor *cd;			\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = group->cg_item.ci_parent->ci_parent->		\
 			ci_parent->ci_parent;				\
 	opts = to_f_uvc_opts(opts_item);				\
@@ -658,8 +620,6 @@ static ssize_t uvcg_default_output_##cname##_show(			\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(cd->aname));	\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
-									\
 	return result;							\
 }									\
 									\
@@ -678,12 +638,9 @@ static ssize_t uvcg_default_output_b_source_id_show(struct config_item *item,
 	struct config_group *group = to_config_group(item);
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvc_output_terminal_descriptor *cd;
 	int result;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = group->cg_item.ci_parent->ci_parent->
 			ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
@@ -693,8 +650,6 @@ static ssize_t uvcg_default_output_b_source_id_show(struct config_item *item,
 	result = sprintf(page, "%u\n", le8_to_cpu(cd->bSourceID));
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return result;
 }
 
@@ -704,7 +659,6 @@ static ssize_t uvcg_default_output_b_source_id_store(struct config_item *item,
 	struct config_group *group = to_config_group(item);
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvc_output_terminal_descriptor *cd;
 	int result;
 	u8 num;
@@ -713,8 +667,6 @@ static ssize_t uvcg_default_output_b_source_id_store(struct config_item *item,
 	if (result)
 		return result;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = group->cg_item.ci_parent->ci_parent->
 			ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
@@ -724,8 +676,6 @@ static ssize_t uvcg_default_output_b_source_id_store(struct config_item *item,
 	cd->bSourceID = num;
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return len;
 }
 UVC_ATTR(uvcg_default_output_, b_source_id, bSourceID);
@@ -789,15 +739,11 @@ static const struct uvcg_config_group_type uvcg_terminal_grp_type = {
 static ssize_t uvcg_extension_##cname##_show(struct config_item *item,	\
 					     char *page)		\
 {									\
-	struct config_group *group = to_config_group(item->ci_parent);	\
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;		\
 	struct uvcg_extension *xu = to_uvcg_extension(item);		\
 	struct config_item *opts_item;					\
 	struct f_uvc_opts *opts;					\
 	int ret;							\
 									\
-	mutex_lock(su_mutex);						\
-									\
 	opts_item = item->ci_parent->ci_parent->ci_parent;		\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -805,8 +751,6 @@ static ssize_t uvcg_extension_##cname##_show(struct config_item *item,	\
 	ret = sprintf(page, "%u\n", xu->desc.aname);			\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
-									\
 	return ret;							\
 }									\
 UVC_ATTR##ro(uvcg_extension_, cname, aname)
@@ -818,8 +762,6 @@ UVCG_EXTENSION_ATTR(i_extension, iExtension, _RO);
 static ssize_t uvcg_extension_b_num_controls_store(struct config_item *item,
 						   const char *page, size_t len)
 {
-	struct config_group *group = to_config_group(item->ci_parent);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvcg_extension *xu = to_uvcg_extension(item);
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
@@ -830,8 +772,6 @@ static ssize_t uvcg_extension_b_num_controls_store(struct config_item *item,
 	if (ret)
 		return ret;
 
-	mutex_lock(su_mutex);
-
 	opts_item = item->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -839,8 +779,6 @@ static ssize_t uvcg_extension_b_num_controls_store(struct config_item *item,
 	xu->desc.bNumControls = num;
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return len;
 }
 UVCG_EXTENSION_ATTR(b_num_controls, bNumControls);
@@ -852,8 +790,6 @@ UVCG_EXTENSION_ATTR(b_num_controls, bNumControls);
 static ssize_t uvcg_extension_b_nr_in_pins_store(struct config_item *item,
 						 const char *page, size_t len)
 {
-	struct config_group *group = to_config_group(item->ci_parent);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvcg_extension *xu = to_uvcg_extension(item);
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
@@ -865,8 +801,6 @@ static ssize_t uvcg_extension_b_nr_in_pins_store(struct config_item *item,
 	if (ret)
 		return ret;
 
-	mutex_lock(su_mutex);
-
 	opts_item = item->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -893,7 +827,6 @@ static ssize_t uvcg_extension_b_nr_in_pins_store(struct config_item *item,
 
 unlock:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 UVCG_EXTENSION_ATTR(b_nr_in_pins, bNrInPins);
@@ -905,8 +838,6 @@ UVCG_EXTENSION_ATTR(b_nr_in_pins, bNrInPins);
 static ssize_t uvcg_extension_b_control_size_store(struct config_item *item,
 						   const char *page, size_t len)
 {
-	struct config_group *group = to_config_group(item->ci_parent);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvcg_extension *xu = to_uvcg_extension(item);
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
@@ -918,8 +849,6 @@ static ssize_t uvcg_extension_b_control_size_store(struct config_item *item,
 	if (ret)
 		return ret;
 
-	mutex_lock(su_mutex);
-
 	opts_item = item->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -946,7 +875,6 @@ static ssize_t uvcg_extension_b_control_size_store(struct config_item *item,
 
 unlock:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 
@@ -955,14 +883,10 @@ UVCG_EXTENSION_ATTR(b_control_size, bControlSize);
 static ssize_t uvcg_extension_guid_extension_code_show(struct config_item *item,
 						       char *page)
 {
-	struct config_group *group = to_config_group(item->ci_parent);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvcg_extension *xu = to_uvcg_extension(item);
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
 
-	mutex_lock(su_mutex);
-
 	opts_item = item->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -970,23 +894,17 @@ static ssize_t uvcg_extension_guid_extension_code_show(struct config_item *item,
 	memcpy(page, xu->desc.guidExtensionCode, sizeof(xu->desc.guidExtensionCode));
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return sizeof(xu->desc.guidExtensionCode);
 }
 
 static ssize_t uvcg_extension_guid_extension_code_store(struct config_item *item,
 							const char *page, size_t len)
 {
-	struct config_group *group = to_config_group(item->ci_parent);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvcg_extension *xu = to_uvcg_extension(item);
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
 	int ret;
 
-	mutex_lock(su_mutex);
-
 	opts_item = item->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -995,8 +913,6 @@ static ssize_t uvcg_extension_guid_extension_code_store(struct config_item *item
 	       min(sizeof(xu->desc.guidExtensionCode), len));
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	ret = sizeof(xu->desc.guidExtensionCode);
 
 	return ret;
@@ -1007,16 +923,12 @@ UVC_ATTR(uvcg_extension_, guid_extension_code, guidExtensionCode);
 static ssize_t uvcg_extension_ba_source_id_show(struct config_item *item,
 						char *page)
 {
-	struct config_group *group = to_config_group(item->ci_parent);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvcg_extension *xu = to_uvcg_extension(item);
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
 	char *pg = page;
 	int ret, i;
 
-	mutex_lock(su_mutex);
-
 	opts_item = item->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -1027,24 +939,18 @@ static ssize_t uvcg_extension_ba_source_id_show(struct config_item *item,
 	}
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return ret;
 }
 
 static ssize_t uvcg_extension_ba_source_id_store(struct config_item *item,
 						 const char *page, size_t len)
 {
-	struct config_group *group = to_config_group(item->ci_parent);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvcg_extension *xu = to_uvcg_extension(item);
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
 	u8 *source_ids, *iter;
 	int ret, n = 0;
 
-	mutex_lock(su_mutex);
-
 	opts_item = item->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -1077,8 +983,6 @@ static ssize_t uvcg_extension_ba_source_id_store(struct config_item *item,
 	ret = len;
 
 unlock:
-	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 UVC_ATTR(uvcg_extension_, ba_source_id, baSourceID);
@@ -1086,16 +990,12 @@ UVC_ATTR(uvcg_extension_, ba_source_id, baSourceID);
 static ssize_t uvcg_extension_bm_controls_show(struct config_item *item,
 					       char *page)
 {
-	struct config_group *group = to_config_group(item->ci_parent);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvcg_extension *xu = to_uvcg_extension(item);
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
 	char *pg = page;
 	int ret, i;
 
-	mutex_lock(su_mutex);
-
 	opts_item = item->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -1106,24 +1006,18 @@ static ssize_t uvcg_extension_bm_controls_show(struct config_item *item,
 	}
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return ret;
 }
 
 static ssize_t uvcg_extension_bm_controls_store(struct config_item *item,
 						const char *page, size_t len)
 {
-	struct config_group *group = to_config_group(item->ci_parent);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvcg_extension *xu = to_uvcg_extension(item);
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
 	u8 *bm_controls, *iter;
 	int ret, n = 0;
 
-	mutex_lock(su_mutex);
-
 	opts_item = item->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -1157,7 +1051,6 @@ static ssize_t uvcg_extension_bm_controls_store(struct config_item *item,
 
 unlock:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 
@@ -1467,14 +1360,10 @@ static const struct uvcg_config_group_type uvcg_control_class_grp_type = {
 static ssize_t uvcg_default_control_b_interface_number_show(
 	struct config_item *item, char *page)
 {
-	struct config_group *group = to_config_group(item);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
 	int result = 0;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = item->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -1482,8 +1371,6 @@ static ssize_t uvcg_default_control_b_interface_number_show(
 	result += sprintf(page, "%u\n", opts->control_interface);
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return result;
 }
 
@@ -1492,14 +1379,10 @@ UVC_ATTR_RO(uvcg_default_control_, b_interface_number, bInterfaceNumber);
 static ssize_t uvcg_default_control_enable_interrupt_ep_show(
 	struct config_item *item, char *page)
 {
-	struct config_group *group = to_config_group(item);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
 	int result = 0;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = item->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -1507,16 +1390,12 @@ static ssize_t uvcg_default_control_enable_interrupt_ep_show(
 	result += sprintf(page, "%u\n", opts->enable_interrupt_ep);
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return result;
 }
 
 static ssize_t uvcg_default_control_enable_interrupt_ep_store(
 	struct config_item *item, const char *page, size_t len)
 {
-	struct config_group *group = to_config_group(item);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
 	ssize_t ret;
@@ -1526,8 +1405,6 @@ static ssize_t uvcg_default_control_enable_interrupt_ep_store(
 	if (ret)
 		return ret;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = item->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -1535,8 +1412,6 @@ static ssize_t uvcg_default_control_enable_interrupt_ep_store(
 	opts->enable_interrupt_ep = num;
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return len;
 }
 UVC_ATTR(uvcg_default_control_, enable_interrupt_ep, enable_interrupt_ep);
@@ -1674,12 +1549,9 @@ static ssize_t uvcg_format_bma_controls_show(struct uvcg_format *f, char *page)
 {
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &f->group.cg_subsys->su_mutex;
 	int result, i;
 	char *pg = page;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = f->group.cg_item.ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -1691,8 +1563,6 @@ static ssize_t uvcg_format_bma_controls_show(struct uvcg_format *f, char *page)
 		pg = page + result;
 	}
 	mutex_unlock(&opts->lock);
-
-	mutex_unlock(su_mutex);
 	return result;
 }
 
@@ -1701,11 +1571,8 @@ static ssize_t uvcg_format_bma_controls_store(struct uvcg_format *ch,
 {
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &ch->group.cg_subsys->su_mutex;
 	int ret = -EINVAL;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = ch->group.cg_item.ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -1724,7 +1591,6 @@ static ssize_t uvcg_format_bma_controls_store(struct uvcg_format *ch,
 	ret = len;
 end:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 
@@ -1853,19 +1719,14 @@ static ssize_t uvcg_streaming_header_##cname##_show(			\
 	struct uvcg_streaming_header *sh = to_uvcg_streaming_header(item); \
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &sh->item.ci_group->cg_subsys->su_mutex;\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = sh->item.ci_parent->ci_parent->ci_parent;		\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
 	mutex_lock(&opts->lock);					\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(sh->desc.aname));\
 	mutex_unlock(&opts->lock);					\
-									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -1937,11 +1798,8 @@ static ssize_t uvcg_frame_##cname##_show(struct config_item *item, char *page)\
 	struct uvcg_frame *f = to_uvcg_frame(item);			\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &f->item.ci_group->cg_subsys->su_mutex;\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = f->item.ci_parent->ci_parent->ci_parent->ci_parent;	\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -1949,7 +1807,6 @@ static ssize_t uvcg_frame_##cname##_show(struct config_item *item, char *page)\
 	result = sprintf(page, "%u\n", f->frame.cname);			\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -1960,7 +1817,6 @@ static ssize_t  uvcg_frame_##cname##_store(struct config_item *item,	\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
 	struct uvcg_format *fmt;					\
-	struct mutex *su_mutex = &f->item.ci_group->cg_subsys->su_mutex;\
 	typeof(f->frame.cname) num;					\
 	int ret;							\
 									\
@@ -1968,8 +1824,6 @@ static ssize_t  uvcg_frame_##cname##_store(struct config_item *item,	\
 	if (ret)							\
 		return ret;						\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = f->item.ci_parent->ci_parent->ci_parent->ci_parent;	\
 	opts = to_f_uvc_opts(opts_item);				\
 	fmt = to_uvcg_format(f->item.ci_parent);			\
@@ -1984,7 +1838,6 @@ static ssize_t  uvcg_frame_##cname##_store(struct config_item *item,	\
 	ret = len;							\
 end:									\
 	mutex_unlock(&opts->lock);					\
-	mutex_unlock(su_mutex);						\
 	return ret;							\
 }									\
 									\
@@ -1998,11 +1851,8 @@ static ssize_t uvcg_frame_b_frame_index_show(struct config_item *item,
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
 	struct config_item *fmt_item;
-	struct mutex *su_mutex = &f->item.ci_group->cg_subsys->su_mutex;
 	int result;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	fmt_item = f->item.ci_parent;
 	fmt = to_uvcg_format(fmt_item);
 
@@ -2019,7 +1869,6 @@ static ssize_t uvcg_frame_b_frame_index_show(struct config_item *item,
 	mutex_unlock(&opts->lock);
 
 out:
-	mutex_unlock(su_mutex);
 	return result;
 }
 
@@ -2042,12 +1891,9 @@ static ssize_t uvcg_frame_dw_frame_interval_show(struct config_item *item,
 	struct uvcg_frame *frm = to_uvcg_frame(item);
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &frm->item.ci_group->cg_subsys->su_mutex;
 	int result, i;
 	char *pg = page;
 
-	mutex_lock(su_mutex);	/* for navigating configfs hierarchy */
-
 	opts_item = frm->item.ci_parent->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -2057,8 +1903,6 @@ static ssize_t uvcg_frame_dw_frame_interval_show(struct config_item *item,
 		pg = page + result;
 	}
 	mutex_unlock(&opts->lock);
-
-	mutex_unlock(su_mutex);
 	return result;
 }
 
@@ -2069,12 +1913,9 @@ static ssize_t uvcg_frame_dw_frame_interval_store(struct config_item *item,
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
 	struct uvcg_format *fmt;
-	struct mutex *su_mutex = &ch->item.ci_group->cg_subsys->su_mutex;
 	int ret = 0, n = 0;
 	u32 *frm_intrv, *tmp;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = ch->item.ci_parent->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 	fmt = to_uvcg_format(ch->item.ci_parent);
@@ -2110,7 +1951,6 @@ static ssize_t uvcg_frame_dw_frame_interval_store(struct config_item *item,
 
 end:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 
@@ -2272,9 +2112,6 @@ static ssize_t uvcg_uncompressed_guid_format_show(struct config_item *item,
 	struct uvcg_uncompressed *ch = to_uvcg_uncompressed(item);
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &ch->fmt.group.cg_subsys->su_mutex;
-
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
 
 	opts_item = ch->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
@@ -2283,8 +2120,6 @@ static ssize_t uvcg_uncompressed_guid_format_show(struct config_item *item,
 	memcpy(page, ch->desc.guidFormat, sizeof(ch->desc.guidFormat));
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return sizeof(ch->desc.guidFormat);
 }
 
@@ -2294,13 +2129,10 @@ static ssize_t uvcg_uncompressed_guid_format_store(struct config_item *item,
 	struct uvcg_uncompressed *ch = to_uvcg_uncompressed(item);
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &ch->fmt.group.cg_subsys->su_mutex;
 	const struct uvc_format_desc *format;
 	u8 tmpguidFormat[sizeof(ch->desc.guidFormat)];
 	int ret;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = ch->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -2325,7 +2157,6 @@ static ssize_t uvcg_uncompressed_guid_format_store(struct config_item *item,
 
 end:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 
@@ -2338,11 +2169,8 @@ static ssize_t uvcg_uncompressed_##cname##_show(			\
 	struct uvcg_uncompressed *u = to_uvcg_uncompressed(item);	\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &u->fmt.group.cg_subsys->su_mutex;	\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = u->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -2350,7 +2178,6 @@ static ssize_t uvcg_uncompressed_##cname##_show(			\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(u->desc.aname));\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -2363,19 +2190,14 @@ static ssize_t uvcg_uncompressed_##cname##_show(			\
 	struct uvcg_uncompressed *u = to_uvcg_uncompressed(item);	\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &u->fmt.group.cg_subsys->su_mutex;	\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = u->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
 	mutex_lock(&opts->lock);					\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(u->desc.aname));\
 	mutex_unlock(&opts->lock);					\
-									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -2386,12 +2208,9 @@ uvcg_uncompressed_##cname##_store(struct config_item *item,		\
 	struct uvcg_uncompressed *u = to_uvcg_uncompressed(item);	\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &u->fmt.group.cg_subsys->su_mutex;	\
 	int ret;							\
 	u8 num;								\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = u->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -2415,7 +2234,6 @@ uvcg_uncompressed_##cname##_store(struct config_item *item,		\
 	ret = len;							\
 end:									\
 	mutex_unlock(&opts->lock);					\
-	mutex_unlock(su_mutex);						\
 	return ret;							\
 }									\
 									\
@@ -2536,19 +2354,14 @@ static ssize_t uvcg_mjpeg_##cname##_show(struct config_item *item, char *page)\
 	struct uvcg_mjpeg *u = to_uvcg_mjpeg(item);			\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &u->fmt.group.cg_subsys->su_mutex;	\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = u->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
 	mutex_lock(&opts->lock);					\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(u->desc.aname));\
 	mutex_unlock(&opts->lock);					\
-									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -2560,11 +2373,8 @@ static ssize_t uvcg_mjpeg_##cname##_show(struct config_item *item, char *page)\
 	struct uvcg_mjpeg *u = to_uvcg_mjpeg(item);			\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &u->fmt.group.cg_subsys->su_mutex;	\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = u->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -2572,7 +2382,6 @@ static ssize_t uvcg_mjpeg_##cname##_show(struct config_item *item, char *page)\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(u->desc.aname));\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -2583,12 +2392,9 @@ uvcg_mjpeg_##cname##_store(struct config_item *item,			\
 	struct uvcg_mjpeg *u = to_uvcg_mjpeg(item);			\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &u->fmt.group.cg_subsys->su_mutex;	\
 	int ret;							\
 	u8 num;								\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = u->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -2612,7 +2418,6 @@ uvcg_mjpeg_##cname##_store(struct config_item *item,			\
 	ret = len;							\
 end:									\
 	mutex_unlock(&opts->lock);					\
-	mutex_unlock(su_mutex);						\
 	return ret;							\
 }									\
 									\
@@ -2727,11 +2532,8 @@ static ssize_t uvcg_framebased_##cname##_show(struct config_item *item,	\
 	struct uvcg_framebased *u = to_uvcg_framebased(item);		\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &u->fmt.group.cg_subsys->su_mutex;	\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = u->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -2739,7 +2541,6 @@ static ssize_t uvcg_framebased_##cname##_show(struct config_item *item,	\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(u->desc.aname));\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -2752,11 +2553,8 @@ static ssize_t uvcg_framebased_##cname##_show(struct config_item *item,	\
 	struct uvcg_framebased *u = to_uvcg_framebased(item);		\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &u->fmt.group.cg_subsys->su_mutex;	\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = u->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -2764,7 +2562,6 @@ static ssize_t uvcg_framebased_##cname##_show(struct config_item *item,	\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(u->desc.aname));\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -2775,12 +2572,9 @@ uvcg_framebased_##cname##_store(struct config_item *item,		\
 	struct uvcg_framebased *u = to_uvcg_framebased(item);		\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &u->fmt.group.cg_subsys->su_mutex;	\
 	int ret;							\
 	u8 num;								\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = u->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -2802,7 +2596,6 @@ uvcg_framebased_##cname##_store(struct config_item *item,		\
 	ret = len;							\
 end:									\
 	mutex_unlock(&opts->lock);					\
-	mutex_unlock(su_mutex);						\
 	return ret;							\
 }									\
 									\
@@ -2824,9 +2617,6 @@ static ssize_t uvcg_framebased_guid_format_show(struct config_item *item,
 	struct uvcg_framebased *ch = to_uvcg_framebased(item);
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &ch->fmt.group.cg_subsys->su_mutex;
-
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
 
 	opts_item = ch->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
@@ -2835,8 +2625,6 @@ static ssize_t uvcg_framebased_guid_format_show(struct config_item *item,
 	memcpy(page, ch->desc.guidFormat, sizeof(ch->desc.guidFormat));
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return sizeof(ch->desc.guidFormat);
 }
 
@@ -2846,11 +2634,8 @@ static ssize_t uvcg_framebased_guid_format_store(struct config_item *item,
 	struct uvcg_framebased *ch = to_uvcg_framebased(item);
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &ch->fmt.group.cg_subsys->su_mutex;
 	int ret;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = ch->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -2866,7 +2651,6 @@ static ssize_t uvcg_framebased_guid_format_store(struct config_item *item,
 
 end:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 
@@ -2979,11 +2763,8 @@ static ssize_t uvcg_color_matching_##cname##_show(			\
 		to_uvcg_color_matching(group);				\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;		\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent;	\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -2992,7 +2773,6 @@ static ssize_t uvcg_color_matching_##cname##_show(			\
 			 le##bits##_to_cpu(color_match->desc.aname));	\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -3000,7 +2780,6 @@ static ssize_t uvcg_color_matching_##cname##_store(			\
 	struct config_item *item, const char *page, size_t len)		\
 {									\
 	struct config_group *group = to_config_group(item);		\
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;		\
 	struct uvcg_color_matching *color_match =			\
 		to_uvcg_color_matching(group);				\
 	struct f_uvc_opts *opts;					\
@@ -3012,8 +2791,6 @@ static ssize_t uvcg_color_matching_##cname##_store(			\
 	if (ret)							\
 		return ret;						\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	if (color_match->refcnt) {					\
 		ret = -EBUSY;						\
 		goto unlock_su;						\
@@ -3029,8 +2806,6 @@ static ssize_t uvcg_color_matching_##cname##_store(			\
 									\
 	mutex_unlock(&opts->lock);					\
 unlock_su:								\
-	mutex_unlock(su_mutex);						\
-									\
 	return ret;							\
 }									\
 UVC_ATTR(uvcg_color_matching_, cname, aname)
@@ -3583,14 +3358,10 @@ static const struct uvcg_config_group_type uvcg_streaming_class_grp_type = {
 static ssize_t uvcg_default_streaming_b_interface_number_show(
 	struct config_item *item, char *page)
 {
-	struct config_group *group = to_config_group(item);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
 	int result = 0;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = item->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -3598,8 +3369,6 @@ static ssize_t uvcg_default_streaming_b_interface_number_show(
 	result += sprintf(page, "%u\n", opts->streaming_interface);
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return result;
 }
 
@@ -3642,14 +3411,11 @@ static void uvc_func_item_release(struct config_item *item)
 
 static int uvc_func_allow_link(struct config_item *src, struct config_item *tgt)
 {
-	struct mutex *su_mutex = &src->ci_group->cg_subsys->su_mutex;
 	struct gadget_string *string;
 	struct config_item *strings;
 	struct f_uvc_opts *opts;
 	int ret = 0;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	/* Validate that the target is an entry in strings/<langid> */
 	strings = config_group_find_item(to_config_group(src->ci_parent->ci_parent),
 					 "strings");
@@ -3676,7 +3442,6 @@ static int uvc_func_allow_link(struct config_item *src, struct config_item *tgt)
 
 put_strings:
 	config_item_put(strings);
-	mutex_unlock(su_mutex);
 
 	return ret;
 }
-- 
2.55.0

