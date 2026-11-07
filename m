Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794026781;
	b=pJVnVFYxuSP7zZDreflQRfmkG1KsM+yVkeyx74RknGjOdXYacBFzozrbE2VEMHKZfXcm
	 xBu/yOOPS5vUJzzingiQET9f0TsUdN4V4nrXT3e7KMbhwnvkuM2lHIb56FZC2/n8Ow5Li
	 pTE+WcSdqkJCT6+6G0yIyC8jmw8eNn5zhMcdk0k/edHhYnRMVNE0NELYEXr56DUHImtlF
	 O2yTQYZ0ARE7Nvdx+lsNBj7D2dFyEbgOJrDlPf3iPjazQxh8oCBp+nI78pv5xK+yh0KIx
	 0khd2LHBXbJKE6PzceO8+GDHsHASxD3rVL9nxdILpEpy7T7ZuZy20QnhOGjOxai0ocA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794026781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aLvj4AyjflPrk0vS+Qra6hFw0arDYtIpmQhUaLCIEIc=;
	b=UNN11eCOAvTbxSW3bUFUcT+QQXyMbRtLdTJyzw9dE6iD4Ajmo82ufgMaVN1yvPYtb6q/
	 8YTIxZVSSwWNVJAv5t/WHPjP09KnyIeRRr/11VYYeoZXjZ1hWW3D+HA9uRMKuKh2IRqGG
	 Lin8V8Qr7jYZPixM//BpBfFkVD+7pQWn1b1n1GCsl7350MDkCaWtk5mpRCIYAql+NTCOt
	 YjywNLYbbu63Rpsf3N5o2c6qaXFJp2SYiiDV1XNWwg97tYORDlaeuZYVTJIIZ9niWUmnP
	 JYmAnarQNjphncumofMsGa7j5+I/hphj7+dqdGRCjEcwOy/hnbB/RkUmiK+JaEMuZLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=famPqNHU;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDD9606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 04:46:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EDD9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=famPqNHU
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so2089895eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 20:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794026779; x=1794631579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aLvj4AyjflPrk0vS+Qra6hFw0arDYtIpmQhUaLCIEIc=;
        b=famPqNHUY7nzzF3ajK7xPXxhLNKc2AUQcbA8hPFA1BSi9yHOO4SxJXamB9A6QaTYnL
         aM6PLF9MhXJ3sdSK5OnEWkpOQk5gciCy3UVyYrtJyq9+pwnWCohMIph9QA4rzwV5SsuT
         OYGqmN7s22lFr6UAANbb2+2sknWulnI+AlbimCl6ZfGg8ZmrMw+wHtLT9fMQSDcemZpV
         X+hOL5mtH9Dd8X4LJ4ukeUcLmLY3PNmuilb/mPnn9ZeWBrLTOvm2FTXZeYAdN71ba1ay
         eidT4MrmS1KxWG2b6c4DaTHUsKWDviPtbzCFphknupUL/zf3Fbsho5LbIVXrWR2QoAPZ
         +QfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794026779; x=1794631579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aLvj4AyjflPrk0vS+Qra6hFw0arDYtIpmQhUaLCIEIc=;
        b=cW/s0Yv/tVujYY+XNDq0srIeR/sKyzR0U/0VDSOtiDqwVjqeGgbvd/VI847fPVPr3E
         qwfkjkKHCUedWcanrQnhBe+ZGfTtJN9ge7EB7HXOC7d2NB+P7PxkEam9B6j/kQXxdtOC
         R/8t5/2HNDig3C1fWD1zqihNQRVwe3k2C0mZQ1fxvyfQfRms61SO6qnbR70YVb2SGw2z
         OpdMe+Y36/tuXN6iwGz2575R3qZzmiHhCVw7KODZw9D7aTIuGKWhIVgCQjj6AKk3MhNq
         I0mOBBW10ivDqmce1qzqPUY6TjxIfg04AfU3EKkiDX/1RxjeyGzDP07b9ihOwbrz6bhe
         LzxA==
X-Forwarded-Encrypted: i=1; AL+hErHY1pR717FAQEdRb73/j4OtlhnvAU44KzvTna6iDOv8z0rGe8LlrfZVc2fhbWk6t48/0lHmWbmiXTu3/9g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+w20OXtNfpfjSY7jTeHTIUb6x0MI1hk51DMqFNnLoCx91Ea5Z
	OL8IqeEYekTEHp0dJv0im2X/CW8Z93cL8cpPFujeC9HMN8Lf7DAxv/dG
X-Gm-Gg: AYBFou12SfIPj19LNK1HGwONkWDE9wNyGt0VFlIcZvddYo+DSV7z2VsravP7HZTeU+C
	S7y/bTTkjCQ2NP7or7FD2w/G/V+06PhLOCHEDYTCVyJNSmGOFuIVcELInGOZzVlwyGc7YzSXIFN
	0bQFvA6kJkgfKkmgedyUuIzQgLc5yN2cxtIUQ9ScoX0/CEdkWEsmGStu9VACJD2LqszRFiIJfmA
	CSXkq1lvfzoV1jrb2yt/0XMfFkmaStGLHY6KRaPhZWjfJoHqsaiYei2N/lTe/DtxWJINtH/F9Oo
	USxgztjGRY6P3P3q4EIZPc0m7jFVA1M9ZYBmSh3ca0QCaGndd3VEVRqKLcK6J/3DtQGvVDzHL+M
	lUE1Waxzp8SNH1aBaUSguabNv4vgPrtsVarcFr5JZdqB6hm+TQDDk/LjYZOi/XUY9F6egjs6fjF
	bsHQ5O49uM9DmNQ+PlEJJEwzz46LQ2Nzb0E+h7m4YtASu8Utyvhm2pP0mFuSLLUh31FVGpfUb4W
	dGrxydB7C/g/LHODxi0mN1J4UGLBe4WQsyWQwOExidsztXRbOX1jO6wAt6DeOtRDXp3KFY7jX49
	2BeyiJpF8NStS8A+WW4fDOadZTt8mKVz0BWWll7TbaT39PFdaIPT+scWd7Y3Al8fi7hPOEfGZSc
	LEElxdi9xE3k4IzQ1Gc90FI1lSULA
X-Received: by 2002:a05:7301:d196:b0:36f:be1f:1191 with SMTP id 5a478bee46e88-36fbe1f11efmr6110099eec.29.1794026779025;
        Fri, 06 Nov 2026 20:46:19 -0800 (PST)
Received: from localhost.localdomain (c-73-158-21-37.hsd1.ca.comcast.net. [73.158.21.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651c57asm12093136eec.2.2026.11.06.20.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 20:46:18 -0800 (PST)
From: Saad Varshani <varshanisaad@gmail.com>
To: nkapron@google.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Saad Varshani <varshanisaad@gmail.com>,
	syzbot+300213c2b5b55c0244f4@syzkaller.appspotmail.com
Subject: [PATCH v5] usb: gadget: uvc: Fix deadlocks in uvcg_configfs attribute callbacks
Date: Fri,  6 Nov 2026 20:45:53 -0800
Message-ID: <20261107044553.24277-1-varshanisaad@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106020727.6055-1-varshanisaad@gmail.com>
References: <20261106020727.6055-1-varshanisaad@gmail.com>
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

Also reordered fmt->linked in uvcg_frame_b_frame_index_show() to be
under the &opts->lock. As well as reorder refcnt in uvcg_color_matching
store to be under &opts->lock.

Applied opts->lock mutex, to functions uvcg_format_allow_link(),
uvcg_format_drop_link(), uvcg_uncompressed_make(), uvcg_mjpeg_make(),
and uvcg_framebased_make() due to them also modifying
color_match->refcnt, to avoid concurrency issues.

---
v5 changes:
	- Synchronised color_match->refcnt changes with the opts->lock
	  mutex in the functions uvcg_format_allow_link(),
	  uvcg_format_drop_link(), uvcg_uncompressed_make(),
	  uvcg_mjpeg_make(), and uvcg_framebased_make()

Reported-by: syzbot+300213c2b5b55c0244f4@syzkaller.appspotmail.com
Closes: https://syzbot.org/bug?extid=300213c2b5b55c0244f4
Signed-off-by: Saad Varshani <varshanisaad@gmail.com>
---
 drivers/usb/gadget/function/uvc_configfs.c | 283 +++------------------
 1 file changed, 41 insertions(+), 242 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 70a1415ea401..4f775efe24b6 100644
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
 
@@ -1078,7 +984,6 @@ static ssize_t uvcg_extension_ba_source_id_store(struct config_item *item,
 
 unlock:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 UVC_ATTR(uvcg_extension_, ba_source_id, baSourceID);
@@ -1086,16 +991,12 @@ UVC_ATTR(uvcg_extension_, ba_source_id, baSourceID);
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
 
@@ -1106,24 +1007,18 @@ static ssize_t uvcg_extension_bm_controls_show(struct config_item *item,
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
 
@@ -1157,7 +1052,6 @@ static ssize_t uvcg_extension_bm_controls_store(struct config_item *item,
 
 unlock:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 
@@ -1467,14 +1361,10 @@ static const struct uvcg_config_group_type uvcg_control_class_grp_type = {
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
 
@@ -1482,8 +1372,6 @@ static ssize_t uvcg_default_control_b_interface_number_show(
 	result += sprintf(page, "%u\n", opts->control_interface);
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return result;
 }
 
@@ -1492,14 +1380,10 @@ UVC_ATTR_RO(uvcg_default_control_, b_interface_number, bInterfaceNumber);
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
 
@@ -1507,16 +1391,12 @@ static ssize_t uvcg_default_control_enable_interrupt_ep_show(
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
@@ -1526,8 +1406,6 @@ static ssize_t uvcg_default_control_enable_interrupt_ep_store(
 	if (ret)
 		return ret;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = item->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -1535,8 +1413,6 @@ static ssize_t uvcg_default_control_enable_interrupt_ep_store(
 	opts->enable_interrupt_ep = num;
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return len;
 }
 UVC_ATTR(uvcg_default_control_, enable_interrupt_ep, enable_interrupt_ep);
@@ -1609,6 +1485,11 @@ static int uvcg_format_allow_link(struct config_item *src, struct config_item *t
 
 	mutex_lock(su_mutex);
 
+	opts_item = f->group.cg_item.ci_parent->ci_parent->ci_parent;
+	opts = to_f_uvc_opts(opts_item);
+
+	mutex_lock(&opts->lock);
+
 	streaming = src->ci_parent->ci_parent;
 	color_matching = config_group_find_item(to_config_group(streaming), "color_matching");
 	if (!color_matching || color_matching != tgt->ci_parent) {
@@ -1637,6 +1518,7 @@ static int uvcg_format_allow_link(struct config_item *src, struct config_item *t
 
 out_put_cm:
 	config_item_put(color_matching);
+	mutex_unlock(&opts->lock);
 	mutex_unlock(su_mutex);
 
 	return ret;
@@ -1651,6 +1533,11 @@ static void uvcg_format_drop_link(struct config_item *src, struct config_item *t
 
 	mutex_lock(su_mutex);
 
+	opts_item = f->group.cg_item.ci_parent->ci_parent->ci_parent;
+	opts = to_f_uvc_opts(opts_item);
+
+	mutex_lock(&opts->lock);
+
 	color_matching_desc = to_uvcg_color_matching(to_config_group(tgt));
 	color_matching_desc->refcnt--;
 
@@ -1661,6 +1548,7 @@ static void uvcg_format_drop_link(struct config_item *src, struct config_item *t
 	fmt->color_matching = color_matching_desc;
 	color_matching_desc->refcnt++;
 
+	mutex_unlock(&opts->lock);
 	mutex_unlock(su_mutex);
 }
 
@@ -1674,12 +1562,9 @@ static ssize_t uvcg_format_bma_controls_show(struct uvcg_format *f, char *page)
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
 
@@ -1691,8 +1576,6 @@ static ssize_t uvcg_format_bma_controls_show(struct uvcg_format *f, char *page)
 		pg = page + result;
 	}
 	mutex_unlock(&opts->lock);
-
-	mutex_unlock(su_mutex);
 	return result;
 }
 
@@ -1701,11 +1584,8 @@ static ssize_t uvcg_format_bma_controls_store(struct uvcg_format *ch,
 {
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &ch->group.cg_subsys->su_mutex;
 	int ret = -EINVAL;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = ch->group.cg_item.ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -1724,7 +1604,6 @@ static ssize_t uvcg_format_bma_controls_store(struct uvcg_format *ch,
 	ret = len;
 end:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 
@@ -1853,19 +1732,14 @@ static ssize_t uvcg_streaming_header_##cname##_show(			\
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
@@ -1937,11 +1811,8 @@ static ssize_t uvcg_frame_##cname##_show(struct config_item *item, char *page)\
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
@@ -1949,7 +1820,6 @@ static ssize_t uvcg_frame_##cname##_show(struct config_item *item, char *page)\
 	result = sprintf(page, "%u\n", f->frame.cname);			\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -1960,7 +1830,6 @@ static ssize_t  uvcg_frame_##cname##_store(struct config_item *item,	\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
 	struct uvcg_format *fmt;					\
-	struct mutex *su_mutex = &f->item.ci_group->cg_subsys->su_mutex;\
 	typeof(f->frame.cname) num;					\
 	int ret;							\
 									\
@@ -1968,8 +1837,6 @@ static ssize_t  uvcg_frame_##cname##_store(struct config_item *item,	\
 	if (ret)							\
 		return ret;						\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = f->item.ci_parent->ci_parent->ci_parent->ci_parent;	\
 	opts = to_f_uvc_opts(opts_item);				\
 	fmt = to_uvcg_format(f->item.ci_parent);			\
@@ -1984,7 +1851,6 @@ static ssize_t  uvcg_frame_##cname##_store(struct config_item *item,	\
 	ret = len;							\
 end:									\
 	mutex_unlock(&opts->lock);					\
-	mutex_unlock(su_mutex);						\
 	return ret;							\
 }									\
 									\
@@ -1998,28 +1864,25 @@ static ssize_t uvcg_frame_b_frame_index_show(struct config_item *item,
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
 	struct config_item *fmt_item;
-	struct mutex *su_mutex = &f->item.ci_group->cg_subsys->su_mutex;
 	int result;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	fmt_item = f->item.ci_parent;
 	fmt = to_uvcg_format(fmt_item);
 
+	opts_item = fmt_item->ci_parent->ci_parent->ci_parent;
+	opts = to_f_uvc_opts(opts_item);
+
+	mutex_lock(&opts->lock);
+
 	if (!fmt->linked) {
 		result = -EBUSY;
 		goto out;
 	}
 
-	opts_item = fmt_item->ci_parent->ci_parent->ci_parent;
-	opts = to_f_uvc_opts(opts_item);
-
-	mutex_lock(&opts->lock);
 	result = sprintf(page, "%u\n", f->frame.b_frame_index);
-	mutex_unlock(&opts->lock);
 
 out:
-	mutex_unlock(su_mutex);
+	mutex_unlock(&opts->lock);
 	return result;
 }
 
@@ -2042,12 +1905,9 @@ static ssize_t uvcg_frame_dw_frame_interval_show(struct config_item *item,
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
 
@@ -2057,8 +1917,6 @@ static ssize_t uvcg_frame_dw_frame_interval_show(struct config_item *item,
 		pg = page + result;
 	}
 	mutex_unlock(&opts->lock);
-
-	mutex_unlock(su_mutex);
 	return result;
 }
 
@@ -2069,12 +1927,9 @@ static ssize_t uvcg_frame_dw_frame_interval_store(struct config_item *item,
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
@@ -2110,7 +1965,6 @@ static ssize_t uvcg_frame_dw_frame_interval_store(struct config_item *item,
 
 end:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 
@@ -2272,9 +2126,6 @@ static ssize_t uvcg_uncompressed_guid_format_show(struct config_item *item,
 	struct uvcg_uncompressed *ch = to_uvcg_uncompressed(item);
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &ch->fmt.group.cg_subsys->su_mutex;
-
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
 
 	opts_item = ch->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
@@ -2283,8 +2134,6 @@ static ssize_t uvcg_uncompressed_guid_format_show(struct config_item *item,
 	memcpy(page, ch->desc.guidFormat, sizeof(ch->desc.guidFormat));
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return sizeof(ch->desc.guidFormat);
 }
 
@@ -2294,13 +2143,10 @@ static ssize_t uvcg_uncompressed_guid_format_store(struct config_item *item,
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
 
@@ -2325,7 +2171,6 @@ static ssize_t uvcg_uncompressed_guid_format_store(struct config_item *item,
 
 end:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 
@@ -2338,11 +2183,8 @@ static ssize_t uvcg_uncompressed_##cname##_show(			\
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
@@ -2350,7 +2192,6 @@ static ssize_t uvcg_uncompressed_##cname##_show(			\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(u->desc.aname));\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -2363,19 +2204,14 @@ static ssize_t uvcg_uncompressed_##cname##_show(			\
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
@@ -2386,12 +2222,9 @@ uvcg_uncompressed_##cname##_store(struct config_item *item,		\
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
@@ -2415,7 +2248,6 @@ uvcg_uncompressed_##cname##_store(struct config_item *item,		\
 	ret = len;							\
 end:									\
 	mutex_unlock(&opts->lock);					\
-	mutex_unlock(su_mutex);						\
 	return ret;							\
 }									\
 									\
@@ -2498,12 +2330,17 @@ static struct config_group *uvcg_uncompressed_make(struct config_group *group,
 	h->desc.bmInterlaceFlags	= 0;
 	h->desc.bCopyProtect		= 0;
 
+	opts_item = f->group.cg_item.ci_parent->ci_parent->ci_parent;
+	opts = to_f_uvc_opts(opts_item);
+
+	mutex_lock(&opts->lock);
 	INIT_LIST_HEAD(&h->fmt.frames);
 	h->fmt.type = UVCG_UNCOMPRESSED;
 	h->fmt.color_matching = color_match;
 	color_match->refcnt++;
 	config_group_init_type_name(&h->fmt.group, name,
 				    &uvcg_uncompressed_type);
+	mutex_unlock(&opts->lock);
 
 	return &h->fmt.group;
 }
@@ -2536,19 +2373,14 @@ static ssize_t uvcg_mjpeg_##cname##_show(struct config_item *item, char *page)\
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
@@ -2560,11 +2392,8 @@ static ssize_t uvcg_mjpeg_##cname##_show(struct config_item *item, char *page)\
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
@@ -2572,7 +2401,6 @@ static ssize_t uvcg_mjpeg_##cname##_show(struct config_item *item, char *page)\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(u->desc.aname));\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -2583,12 +2411,9 @@ uvcg_mjpeg_##cname##_store(struct config_item *item,			\
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
@@ -2612,7 +2437,6 @@ uvcg_mjpeg_##cname##_store(struct config_item *item,			\
 	ret = len;							\
 end:									\
 	mutex_unlock(&opts->lock);					\
-	mutex_unlock(su_mutex);						\
 	return ret;							\
 }									\
 									\
@@ -2688,12 +2512,17 @@ static struct config_group *uvcg_mjpeg_make(struct config_group *group,
 	h->desc.bmInterlaceFlags	= 0;
 	h->desc.bCopyProtect		= 0;
 
+	opts_item = f->group.cg_item.ci_parent->ci_parent->ci_parent;
+	opts = to_f_uvc_opts(opts_item);
+
+	mutex_lock(&opts->lock);
 	INIT_LIST_HEAD(&h->fmt.frames);
 	h->fmt.type = UVCG_MJPEG;
 	h->fmt.color_matching = color_match;
 	color_match->refcnt++;
 	config_group_init_type_name(&h->fmt.group, name,
 				    &uvcg_mjpeg_type);
+	mutex_unlock(&opts->lock);
 
 	return &h->fmt.group;
 }
@@ -2727,11 +2556,8 @@ static ssize_t uvcg_framebased_##cname##_show(struct config_item *item,	\
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
@@ -2739,7 +2565,6 @@ static ssize_t uvcg_framebased_##cname##_show(struct config_item *item,	\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(u->desc.aname));\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -2752,11 +2577,8 @@ static ssize_t uvcg_framebased_##cname##_show(struct config_item *item,	\
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
@@ -2764,7 +2586,6 @@ static ssize_t uvcg_framebased_##cname##_show(struct config_item *item,	\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(u->desc.aname));\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -2775,12 +2596,9 @@ uvcg_framebased_##cname##_store(struct config_item *item,		\
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
@@ -2802,7 +2620,6 @@ uvcg_framebased_##cname##_store(struct config_item *item,		\
 	ret = len;							\
 end:									\
 	mutex_unlock(&opts->lock);					\
-	mutex_unlock(su_mutex);						\
 	return ret;							\
 }									\
 									\
@@ -2824,9 +2641,6 @@ static ssize_t uvcg_framebased_guid_format_show(struct config_item *item,
 	struct uvcg_framebased *ch = to_uvcg_framebased(item);
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &ch->fmt.group.cg_subsys->su_mutex;
-
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
 
 	opts_item = ch->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
@@ -2835,8 +2649,6 @@ static ssize_t uvcg_framebased_guid_format_show(struct config_item *item,
 	memcpy(page, ch->desc.guidFormat, sizeof(ch->desc.guidFormat));
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return sizeof(ch->desc.guidFormat);
 }
 
@@ -2846,11 +2658,8 @@ static ssize_t uvcg_framebased_guid_format_store(struct config_item *item,
 	struct uvcg_framebased *ch = to_uvcg_framebased(item);
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &ch->fmt.group.cg_subsys->su_mutex;
 	int ret;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = ch->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -2866,7 +2675,6 @@ static ssize_t uvcg_framebased_guid_format_store(struct config_item *item,
 
 end:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 
@@ -2945,10 +2753,15 @@ static struct config_group *uvcg_framebased_make(struct config_group *group,
 	INIT_LIST_HEAD(&h->fmt.frames);
 	h->fmt.type = UVCG_FRAMEBASED;
 
+	opts_item = f->group.cg_item.ci_parent->ci_parent->ci_parent;
+	opts = to_f_uvc_opts(opts_item);
+
+	mutex_lock(&opts->lock);
 	h->fmt.color_matching = color_match;
 	color_match->refcnt++;
 	config_group_init_type_name(&h->fmt.group, name,
 				    &uvcg_framebased_type);
+	mutex_unlock(&opts->lock);
 
 	return &h->fmt.group;
 }
@@ -2979,11 +2792,8 @@ static ssize_t uvcg_color_matching_##cname##_show(			\
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
@@ -2992,7 +2802,6 @@ static ssize_t uvcg_color_matching_##cname##_show(			\
 			 le##bits##_to_cpu(color_match->desc.aname));	\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -3000,7 +2809,6 @@ static ssize_t uvcg_color_matching_##cname##_store(			\
 	struct config_item *item, const char *page, size_t len)		\
 {									\
 	struct config_group *group = to_config_group(item);		\
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;		\
 	struct uvcg_color_matching *color_match =			\
 		to_uvcg_color_matching(group);				\
 	struct f_uvc_opts *opts;					\
@@ -3012,25 +2820,21 @@ static ssize_t uvcg_color_matching_##cname##_store(			\
 	if (ret)							\
 		return ret;						\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
-	if (color_match->refcnt) {					\
-		ret = -EBUSY;						\
-		goto unlock_su;						\
-	}								\
-									\
 	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent;	\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
 	mutex_lock(&opts->lock);					\
 									\
+	if (color_match->refcnt) {					\
+		ret = -EBUSY;						\
+		goto unlock_opts_lock;					\
+	}								\
+									\
 	color_match->desc.aname = num;					\
 	ret = len;							\
 									\
+unlock_opts_lock:							\
 	mutex_unlock(&opts->lock);					\
-unlock_su:								\
-	mutex_unlock(su_mutex);						\
-									\
 	return ret;							\
 }									\
 UVC_ATTR(uvcg_color_matching_, cname, aname)
@@ -3583,14 +3387,10 @@ static const struct uvcg_config_group_type uvcg_streaming_class_grp_type = {
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
 
@@ -3598,8 +3398,6 @@ static ssize_t uvcg_default_streaming_b_interface_number_show(
 	result += sprintf(page, "%u\n", opts->streaming_interface);
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return result;
 }
 
@@ -3648,7 +3446,7 @@ static int uvc_func_allow_link(struct config_item *src, struct config_item *tgt)
 	struct f_uvc_opts *opts;
 	int ret = 0;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
+	mutex_lock(su_mutex);
 
 	/* Validate that the target is an entry in strings/<langid> */
 	strings = config_group_find_item(to_config_group(src->ci_parent->ci_parent),
@@ -3676,6 +3474,7 @@ static int uvc_func_allow_link(struct config_item *src, struct config_item *tgt)
 
 put_strings:
 	config_item_put(strings);
+
 	mutex_unlock(su_mutex);
 
 	return ret;
-- 
2.55.0

