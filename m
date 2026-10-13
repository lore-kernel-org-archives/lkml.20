Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B42739F162
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791869450; cv=none; b=E8IRtrVSVTJxd2z1XfRiLLwnxW+QhRAmj/vIFQbrKwRvm8wwhvebCm+/XPBklJ5CwMU2fo8/L/yU+zw5i6fK2EW6MNRBAr+VMhGnck+aqntxZo0Y21BK06eWusNiRUxTMBftya1PySIEGgry3O9ORnKqiHmkxDO6676TYtIdwiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791869450; c=relaxed/simple;
	bh=obpFR8oTERd9N/9mPaJ1vwy0kkCqdIsYZ7pDutH1Gi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FGNZtfHTLZEUDg5+oDyP+r5SpWdqZE6jl3JdUw6wvGLQUPt17Wbnor4JzVFViXZm2QkwRcnGBWh9HnkHnlGAxjeSXMIcfYcbqN+HDlUe/2wwEWM1uGic3XEpOJkRNmPvSnK04+Ayj4okl5sG6dyBLKSJCORmSvHBkJR346RxS4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rui0+pcu; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rui0+pcu"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e5fb79ce82so13019475ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 22:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791869448; x=1792474248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BfAuNXMkyRjcDtaQdSTGf4eds6kED4UCfqfXRrU1sUQ=;
        b=Rui0+pcuMaNxZ2VCfYfmGh4fPmiEZe9nMdCO47qS8ofn8Nf5YXaW7olAf1IjsWriQE
         qepeT5mmecBjMjXasOFPZS+WEYck5XDIj+jPEFbgXD5DsT7VQz7anrkC9um1k5OQBO6R
         93yhFIjDDbUUUe/exSYH3bSxivyvn3/sl3Rxe06pwCMFMR5niyjE7z64tH5pp34mRzwq
         IhYzrBcnsvqRMDE/PzojpNjUstDjTFMHLGEAYui3yIMcUG0Kdku/WD84Sh3Uso8BMx6Y
         4LU+b8KMmjPoaW+uFYvjBzTrvIL/iWPCtpQsFbPKj+98/TF1vNryrcR6v2Yl1wr/WhrQ
         xuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791869448; x=1792474248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BfAuNXMkyRjcDtaQdSTGf4eds6kED4UCfqfXRrU1sUQ=;
        b=J9CcIMVFIiDVgg2ru8LSqjETnVyZRKG+ykpywOrezwhuSnIX2T9loyEu8dxuJ29APK
         gxF/bFViofYLY+O+h78LxkRwvZuS7h1BWnsZBsQ6ED3deWFDFBY+wo+YvPz9JridF1GH
         TSJefgaESeiErigkBX6yuzsUUDnzh/IpNBtdotdjjjkjf9aFuggj1/tMsuxEzoQYRwVI
         +buVy697FKp47VINupBXrgN5lJsB59wTddtSKJuX2n+V8Q7MR14XFjSItSz/f2AsWtoT
         QBHrHeRaN2ftPHIFitpcvt2kPpU3yc4vnM6aklLLbzzn1LjJYV+bT15YiEXKDPWBl451
         wiHg==
X-Forwarded-Encrypted: i=1; AKwUvBxJveXtD445foiqnfJ4oHpogZIMdBQBZTjRZjIs13whuOW30swTsp3cENYaPr+vPy2Si6EvRH1o7W8gKIM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4AkfMjilanwVARrpf+janoBrWCFhol2IEkYcl6Oybmep0w9+E
	Aof62tZ96Ip9A1mgACENcVaC1PWYX5zsZcONcM+/1xzm9fT/a/CgYNXA
X-Gm-Gg: AYBFou3xdYBriT0AynoKYwoetEi4tCGVu5pSO5H673Isb3/KLct7AjDQn55ap0HNmKq
	jyvlBcmqM+bNp+umEqZvBhEt/wfPCkB6vTNG09ev+hKuuk8UQwIg9ZVTjm8SFRTrepezYIMSw0W
	9NN6QPMBpw9vaFtjXr9jO7F2zl0aZ4p6t2JUlPkB3E6mCAGrEy/zfRF2yoJRfqMz07ST9+qtL//
	DATsn8AHc/DuzaimI2j/yTy1mpWReCaB5Z3Y4PqZJvZYtpd1NYArdcwmHJ4EB0KwTGAoO7rZxJr
	B1jk6AEw4Na22JauKEZCl9rixPC0JH8X3kPOSlc/yim0mSt4rzt/pbLJcV3iF0PKOD7XBxb3A2T
	JaW1QeXVuyt6UpYP/JiLOROQcZd1uNZxfcAPd2+deM+DmRfLXnNUkCHAdlkD0V1WoZcqmsNWhtV
	OYP+EI6Y46vje9AdBNzsugvujSTPLhmMPHh3+piSNnoP5mSw+6tzyxCEH2DozDFhhxpW4eP/JCP
	yk0DQqZrUxZ+0yuvRrskahlQR+ycGrlmrsYi5LZf/65+ICyRzBf8jVLtZ+UQtuqfdWWpx7RQdlz
	a+oRc5v4oQzkFmt+wz76e0MPpTI=
X-Received: by 2002:a17:903:1a87:b0:2dd:c100:4b81 with SMTP id d9443c01a7336-2e842e0a469mr103242895ad.56.1791869448256;
        Mon, 12 Oct 2026 22:30:48 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cb6sm50820915ad.60.2026.10.12.22.30.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 12 Oct 2026 22:30:47 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Anton Yakovlev <anton.yakovlev@opensynergy.com>,
	Takashi Iwai <tiwai@suse.com>
Cc: Joonho Lee <mynameisjune111@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jaroslav Kysela <perex@perex.cz>,
	virtualization@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/5] ALSA: virtio: Keep control payloads in refcounted messages
Date: Tue, 13 Oct 2026 14:30:26 +0900
Message-ID: <9aac47803de024cd66c56cc594560c69b5a8a526.1791867377.git.mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1791867377.git.mynameisjune111@gmail.com>
References: <cover.1791867377.git.mynameisjune111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Control requests can include scatterlists that point to caller-owned
payloads. A synchronous send can time out while the device still owns
those descriptors, so the caller can free a TLV or other payload before
a late device access.

Allocate request and response payloads with the refcounted control
message, retain separate header and payload scatterlist entries, and
copy caller data into or out of the owned payload while the caller still
holds a message reference. Check payload sizes and allocation arithmetic
before building the scatterlists.

Fixes: 9d45e514da88 ("ALSA: virtio: handling control messages")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
Dependency: patch 3 retains the queue reference until completion or
post-reset cleanup, which this payload ownership change relies on.

Validation: ARM64 W=1 build; two delayed PCM_INFO KASAN/QEMU runs
with subsequent capture/playback recovery; ASan/UBSan source-shim
tests for query, enum and TLV paths. No real TLV backend was tested.

 sound/virtio/virtio_ctl_msg.c | 109 ++++++++++++++++++++++++++++------
 sound/virtio/virtio_ctl_msg.h |  16 +++--
 sound/virtio/virtio_kctl.c    | 101 ++++++++++++++++---------------
 sound/virtio/virtio_pcm_msg.c |   2 +-
 4 files changed, 156 insertions(+), 72 deletions(-)

diff --git a/sound/virtio/virtio_ctl_msg.c b/sound/virtio/virtio_ctl_msg.c
index 3ad1e1e1b205..62d4c529922c 100644
--- a/sound/virtio/virtio_ctl_msg.c
+++ b/sound/virtio/virtio_ctl_msg.c
@@ -3,7 +3,9 @@
  * virtio-snd: Virtio sound device
  * Copyright (C) 2021 OpenSynergy GmbH
  */
+#include <linux/limits.h>
 #include <linux/moduleparam.h>
+#include <linux/overflow.h>
 #include <linux/virtio_config.h>
 
 #include "virtio_card.h"
@@ -11,7 +13,11 @@
 /**
  * struct virtio_snd_msg - Control message.
  * @sg_request: Scattergather list containing a device request (header).
+ * @sg_request_data: Scattergather list containing request data.
  * @sg_response: Scattergather list containing a device response (status).
+ * @sg_response_data: Scattergather list containing response data.
+ * @request_data_size: Size of the request data buffer.
+ * @response_data_size: Size of the response data buffer.
  * @list: Pending message list entry.
  * @notify: Request completed notification.
  * @ref_count: Reference count used to manage a message lifetime.
@@ -19,7 +25,11 @@
  */
 struct virtio_snd_msg {
 	struct scatterlist sg_request;
+	struct scatterlist sg_request_data;
 	struct scatterlist sg_response;
+	struct scatterlist sg_response_data;
+	size_t request_data_size;
+	size_t response_data_size;
 	struct list_head list;
 	struct completion notify;
 	refcount_t ref_count;
@@ -73,10 +83,34 @@ void *virtsnd_ctl_msg_response(struct virtio_snd_msg *msg)
 	return sg_virt(&msg->sg_response);
 }
 
+/**
+ * virtsnd_ctl_msg_request_data() - Get the request data buffer.
+ * @msg: Control message.
+ *
+ * Context: Any context.
+ */
+void *virtsnd_ctl_msg_request_data(struct virtio_snd_msg *msg)
+{
+	return msg->request_data_size ? sg_virt(&msg->sg_request_data) : NULL;
+}
+
+/**
+ * virtsnd_ctl_msg_response_data() - Get the response data buffer.
+ * @msg: Control message.
+ *
+ * Context: Any context.
+ */
+void *virtsnd_ctl_msg_response_data(struct virtio_snd_msg *msg)
+{
+	return msg->response_data_size ? sg_virt(&msg->sg_response_data) : NULL;
+}
+
 /**
  * virtsnd_ctl_msg_alloc() - Allocate and initialize a control message.
  * @request_size: Size of request header.
  * @response_size: Size of response header.
+ * @request_data_size: Size of request data buffer.
+ * @response_data_size: Size of response data buffer.
  * @gfp: Kernel flags for memory allocation.
  *
  * The message will be automatically freed when the ref_count value is 0.
@@ -85,20 +119,43 @@ void *virtsnd_ctl_msg_response(struct virtio_snd_msg *msg)
  * Return: Allocated message on success, NULL on failure.
  */
 struct virtio_snd_msg *virtsnd_ctl_msg_alloc(size_t request_size,
-					     size_t response_size, gfp_t gfp)
+					     size_t response_size,
+					     size_t request_data_size,
+					     size_t response_data_size,
+					     gfp_t gfp)
 {
 	struct virtio_snd_msg *msg;
-
-	if (!request_size || !response_size)
+	size_t total_size = sizeof(*msg);
+	u8 *data;
+
+	if (!request_size || !response_size || request_size > UINT_MAX ||
+	    response_size > UINT_MAX || request_data_size > UINT_MAX ||
+	    response_data_size > UINT_MAX ||
+	    check_add_overflow(total_size, request_size, &total_size) ||
+	    check_add_overflow(total_size, response_size, &total_size) ||
+	    check_add_overflow(total_size, request_data_size, &total_size) ||
+	    check_add_overflow(total_size, response_data_size, &total_size))
 		return NULL;
 
-	msg = kzalloc(sizeof(*msg) + request_size + response_size, gfp);
+	msg = kzalloc(total_size, gfp);
 	if (!msg)
 		return NULL;
 
-	sg_init_one(&msg->sg_request, (u8 *)msg + sizeof(*msg), request_size);
-	sg_init_one(&msg->sg_response, (u8 *)msg + sizeof(*msg) + request_size,
-		    response_size);
+	data = (u8 *)msg + sizeof(*msg);
+	sg_init_one(&msg->sg_request, data, (unsigned int)request_size);
+	data += request_size;
+	sg_init_one(&msg->sg_response, data, (unsigned int)response_size);
+	data += response_size;
+	msg->request_data_size = request_data_size;
+	msg->response_data_size = response_data_size;
+	if (request_data_size) {
+		sg_init_one(&msg->sg_request_data, data,
+			    (unsigned int)request_data_size);
+		data += request_data_size;
+	}
+	if (response_data_size)
+		sg_init_one(&msg->sg_response_data, data,
+			    (unsigned int)response_data_size);
 
 	INIT_LIST_HEAD(&msg->list);
 	init_completion(&msg->notify);
@@ -112,8 +169,6 @@ struct virtio_snd_msg *virtsnd_ctl_msg_alloc(size_t request_size,
  * virtsnd_ctl_msg_send() - Send a control message.
  * @snd: VirtIO sound device.
  * @msg: Control message.
- * @out_sgs: Additional sg-list to attach to the request header (may be NULL).
- * @in_sgs: Additional sg-list to attach to the response header (may be NULL).
  * @nowait: Flag indicating whether to wait for completion.
  *
  * Context: Any context. Takes and releases the control queue spinlock.
@@ -121,8 +176,7 @@ struct virtio_snd_msg *virtsnd_ctl_msg_alloc(size_t request_size,
  * Return: 0 on success, -errno on failure.
  */
 int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg,
-			 struct scatterlist *out_sgs,
-			 struct scatterlist *in_sgs, bool nowait)
+			 bool nowait)
 {
 	struct virtio_device *vdev = snd->vdev;
 	struct virtio_snd_queue *queue = virtsnd_control_queue(snd);
@@ -142,12 +196,12 @@ int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg,
 	response->code = cpu_to_le32(VIRTIO_SND_S_IO_ERR);
 
 	psgs[nouts++] = &msg->sg_request;
-	if (out_sgs)
-		psgs[nouts++] = out_sgs;
+	if (msg->request_data_size)
+		psgs[nouts++] = &msg->sg_request_data;
 
 	psgs[nouts + nins++] = &msg->sg_response;
-	if (in_sgs)
-		psgs[nouts + nins++] = in_sgs;
+	if (msg->response_data_size)
+		psgs[nouts + nins++] = &msg->sg_response_data;
 
 	scoped_guard(spinlock_irqsave, &queue->lock) {
 		if (snd->ctl_msgs_blocked)
@@ -307,10 +361,23 @@ int virtsnd_ctl_query_info(struct virtio_snd *snd, int command, int start_id,
 {
 	struct virtio_snd_msg *msg;
 	struct virtio_snd_query_info *query;
-	struct scatterlist sg;
+	size_t info_size;
+	int rc;
+
+	if (count < 0)
+		return -EINVAL;
+
+	if (size > UINT_MAX ||
+	    check_mul_overflow((size_t)count, size, &info_size) ||
+	    info_size > UINT_MAX)
+		return -EOVERFLOW;
+
+	if (info_size && !info)
+		return -EINVAL;
 
 	msg = virtsnd_ctl_msg_alloc(sizeof(*query),
-				    sizeof(struct virtio_snd_hdr), GFP_KERNEL);
+				    sizeof(struct virtio_snd_hdr), 0, info_size,
+				    GFP_KERNEL);
 	if (!msg)
 		return -ENOMEM;
 
@@ -320,9 +387,13 @@ int virtsnd_ctl_query_info(struct virtio_snd *snd, int command, int start_id,
 	query->count = cpu_to_le32(count);
 	query->size = cpu_to_le32(size);
 
-	sg_init_one(&sg, info, count * size);
+	virtsnd_ctl_msg_ref(msg);
+	rc = virtsnd_ctl_msg_send(snd, msg, false);
+	if (!rc && info_size)
+		memcpy(info, virtsnd_ctl_msg_response_data(msg), info_size);
+	virtsnd_ctl_msg_unref(msg);
 
-	return virtsnd_ctl_msg_send(snd, msg, NULL, &sg, false);
+	return rc;
 }
 
 /**
diff --git a/sound/virtio/virtio_ctl_msg.h b/sound/virtio/virtio_ctl_msg.h
index d917435409d0..834ddeb82b90 100644
--- a/sound/virtio/virtio_ctl_msg.h
+++ b/sound/virtio/virtio_ctl_msg.h
@@ -21,11 +21,17 @@ void *virtsnd_ctl_msg_request(struct virtio_snd_msg *msg);
 void *virtsnd_ctl_msg_response(struct virtio_snd_msg *msg);
 
 struct virtio_snd_msg *virtsnd_ctl_msg_alloc(size_t request_size,
-					     size_t response_size, gfp_t gfp);
+					     size_t response_size,
+					     size_t request_data_size,
+					     size_t response_data_size,
+					     gfp_t gfp);
+
+void *virtsnd_ctl_msg_request_data(struct virtio_snd_msg *msg);
+
+void *virtsnd_ctl_msg_response_data(struct virtio_snd_msg *msg);
 
 int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg,
-			 struct scatterlist *out_sgs,
-			 struct scatterlist *in_sgs, bool nowait);
+			 bool nowait);
 
 /**
  * virtsnd_ctl_msg_send_sync() - Simplified sending of synchronous message.
@@ -49,7 +55,7 @@ int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg,
 static inline int virtsnd_ctl_msg_send_sync(struct virtio_snd *snd,
 					    struct virtio_snd_msg *msg)
 {
-	return virtsnd_ctl_msg_send(snd, msg, NULL, NULL, false);
+	return virtsnd_ctl_msg_send(snd, msg, false);
 }
 
 /**
@@ -63,7 +69,7 @@ static inline int virtsnd_ctl_msg_send_sync(struct virtio_snd *snd,
 static inline int virtsnd_ctl_msg_send_async(struct virtio_snd *snd,
 					     struct virtio_snd_msg *msg)
 {
-	return virtsnd_ctl_msg_send(snd, msg, NULL, NULL, true);
+	return virtsnd_ctl_msg_send(snd, msg, true);
 }
 
 void virtsnd_ctl_msg_cancel_all(struct virtio_snd *snd);
diff --git a/sound/virtio/virtio_kctl.c b/sound/virtio/virtio_kctl.c
index 45f7b6a5b308..44eb59d7d093 100644
--- a/sound/virtio/virtio_kctl.c
+++ b/sound/virtio/virtio_kctl.c
@@ -3,8 +3,10 @@
  * virtio-snd: Virtio sound device
  * Copyright (C) 2022 OpenSynergy GmbH
  */
-#include <sound/control.h>
+#include <linux/limits.h>
+#include <linux/overflow.h>
 #include <linux/virtio_config.h>
+#include <sound/control.h>
 
 #include "virtio_card.h"
 
@@ -161,7 +163,8 @@ static int virtsnd_kctl_get(struct snd_kcontrol *kcontrol,
 	unsigned int i;
 	int rc;
 
-	msg = virtsnd_ctl_msg_alloc(request_size, response_size, GFP_KERNEL);
+	msg = virtsnd_ctl_msg_alloc(request_size, response_size, 0, 0,
+				    GFP_KERNEL);
 	if (!msg)
 		return -ENOMEM;
 
@@ -233,7 +236,8 @@ static int virtsnd_kctl_put(struct snd_kcontrol *kcontrol,
 	size_t response_size = sizeof(struct virtio_snd_hdr);
 	unsigned int i;
 
-	msg = virtsnd_ctl_msg_alloc(request_size, response_size, GFP_KERNEL);
+	msg = virtsnd_ctl_msg_alloc(request_size, response_size, 0, 0,
+				    GFP_KERNEL);
 	if (!msg)
 		return -ENOMEM;
 
@@ -288,23 +292,28 @@ static int virtsnd_kctl_tlv_op(struct snd_kcontrol *kcontrol, int op_flag,
 	struct virtio_snd *snd = snd_kcontrol_chip(kcontrol);
 	struct virtio_snd_msg *msg;
 	struct virtio_snd_ctl_hdr *hdr;
-	unsigned int *tlv;
-	struct scatterlist sg;
+	size_t request_data_size = 0;
+	size_t response_data_size = 0;
 	int rc;
 
+	switch (op_flag) {
+	case SNDRV_CTL_TLV_OP_READ:
+		response_data_size = size;
+		break;
+	case SNDRV_CTL_TLV_OP_WRITE:
+	case SNDRV_CTL_TLV_OP_CMD:
+		request_data_size = size;
+		break;
+	default:
+		return -EINVAL;
+	}
+
 	msg = virtsnd_ctl_msg_alloc(sizeof(*hdr), sizeof(struct virtio_snd_hdr),
+				    request_data_size, response_data_size,
 				    GFP_KERNEL);
 	if (!msg)
 		return -ENOMEM;
 
-	tlv = kzalloc(size, GFP_KERNEL);
-	if (!tlv) {
-		rc = -ENOMEM;
-		goto on_msg_unref;
-	}
-
-	sg_init_one(&sg, tlv, size);
-
 	hdr = virtsnd_ctl_msg_request(msg);
 	hdr->control_id = cpu_to_le32(kcontrol->private_value);
 
@@ -312,13 +321,15 @@ static int virtsnd_kctl_tlv_op(struct snd_kcontrol *kcontrol, int op_flag,
 	case SNDRV_CTL_TLV_OP_READ:
 		hdr->hdr.code = cpu_to_le32(VIRTIO_SND_R_CTL_TLV_READ);
 
-		rc = virtsnd_ctl_msg_send(snd, msg, NULL, &sg, false);
-		if (!rc) {
-			if (copy_to_user(utlv, tlv, size))
-				rc = -EFAULT;
-		}
+		virtsnd_ctl_msg_ref(msg);
+		rc = virtsnd_ctl_msg_send(snd, msg, false);
+		if (!rc && size &&
+		    copy_to_user(utlv, virtsnd_ctl_msg_response_data(msg),
+				 size))
+			rc = -EFAULT;
+		virtsnd_ctl_msg_unref(msg);
 
-		break;
+		return rc;
 	case SNDRV_CTL_TLV_OP_WRITE:
 	case SNDRV_CTL_TLV_OP_CMD:
 		if (op_flag == SNDRV_CTL_TLV_OP_WRITE)
@@ -327,28 +338,16 @@ static int virtsnd_kctl_tlv_op(struct snd_kcontrol *kcontrol, int op_flag,
 			hdr->hdr.code =
 				cpu_to_le32(VIRTIO_SND_R_CTL_TLV_COMMAND);
 
-		if (copy_from_user(tlv, utlv, size)) {
-			rc = -EFAULT;
-			goto on_msg_unref;
-		} else {
-			rc = virtsnd_ctl_msg_send(snd, msg, &sg, NULL, false);
+		if (size && copy_from_user(virtsnd_ctl_msg_request_data(msg), utlv,
+					   size)) {
+			virtsnd_ctl_msg_unref(msg);
+			return -EFAULT;
 		}
 
-		break;
-	default:
-		rc = -EINVAL;
-		/* We never get here - we listed all values for op_flag */
-		WARN_ON(1);
-		goto on_msg_unref;
+		return virtsnd_ctl_msg_send(snd, msg, false);
 	}
-	kfree(tlv);
-	return rc;
-
-on_msg_unref:
-	virtsnd_ctl_msg_unref(msg);
-	kfree(tlv);
 
-	return rc;
+	return -EINVAL;
 }
 
 /**
@@ -369,27 +368,35 @@ static int virtsnd_kctl_get_enum_items(struct virtio_snd *snd, unsigned int cid)
 	struct virtio_snd_msg *msg;
 	struct virtio_snd_ctl_hdr *hdr;
 	unsigned int n = le32_to_cpu(kinfo->value.enumerated.items);
-	struct scatterlist sg;
+	size_t items_size;
+	int rc;
 
-	msg = virtsnd_ctl_msg_alloc(sizeof(*hdr),
-				    sizeof(struct virtio_snd_hdr), GFP_KERNEL);
-	if (!msg)
-		return -ENOMEM;
+	if (check_mul_overflow((size_t)n, sizeof(*kctl->items), &items_size) ||
+	    items_size > UINT_MAX)
+		return -EOVERFLOW;
 
 	kctl->items = devm_kcalloc(&vdev->dev, n, sizeof(*kctl->items),
 				   GFP_KERNEL);
-	if (!kctl->items) {
-		virtsnd_ctl_msg_unref(msg);
+	if (!kctl->items)
 		return -ENOMEM;
-	}
 
-	sg_init_one(&sg, kctl->items, n * sizeof(*kctl->items));
+	msg = virtsnd_ctl_msg_alloc(sizeof(*hdr),
+				    sizeof(struct virtio_snd_hdr), 0, items_size,
+				    GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
 
 	hdr = virtsnd_ctl_msg_request(msg);
 	hdr->hdr.code = cpu_to_le32(VIRTIO_SND_R_CTL_ENUM_ITEMS);
 	hdr->control_id = cpu_to_le32(cid);
 
-	return virtsnd_ctl_msg_send(snd, msg, NULL, &sg, false);
+	virtsnd_ctl_msg_ref(msg);
+	rc = virtsnd_ctl_msg_send(snd, msg, false);
+	if (!rc && items_size)
+		memcpy(kctl->items, virtsnd_ctl_msg_response_data(msg), items_size);
+	virtsnd_ctl_msg_unref(msg);
+
+	return rc;
 }
 
 /**
diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
index 46bf4df65974..7fb945d0a36a 100644
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -534,7 +534,7 @@ virtsnd_pcm_ctl_msg_alloc(struct virtio_pcm_substream *vss,
 		break;
 	}
 
-	msg = virtsnd_ctl_msg_alloc(request_size, response_size, gfp);
+	msg = virtsnd_ctl_msg_alloc(request_size, response_size, 0, 0, gfp);
 	if (msg) {
 		struct virtio_snd_pcm_hdr *hdr = virtsnd_ctl_msg_request(msg);
 
-- 
2.54.0 (Apple Git-157)

