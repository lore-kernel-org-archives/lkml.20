Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102642;
	b=N7mJCkhJZB9PZURuKk65WezrpoP+YSin+K9wrSIobfy7pSCouMNK8LsBqu8yz/+8q4Cg
	 zjxbM/E7otpALAs0IveAJZ4hBHSSUpug7NZoN0bhZx80mfjlzp4tl1FM/uSUwIcXbn0GS
	 Dv5q1Hl8mv7JvcFT8CaynLT07NU1hmpCQOZ7Kldt3BSoL/Il6wB5O9AcatZ+l/mwTCh5y
	 P4QypmNn5DihWROaEx6JLyhfKbjTMHgm/I8y4XPrN3y9zdZCygM8q9KxRo/J5kgx9YmGs
	 YcORYIlBOkk/r7LIFWF0WkPxIRbdKtctVsudePXBMLh67a2A3xn1hN0Qkpuq7PKSQjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ngKLlD/TZFndBBHOawGu//O5HfItQqjo8oistDQQOGc=;
	b=UeLwq44+RvRROvEEYRyEfKXijmKZprVqvNCglTu1IJt5wyJE2GVR+Bt270O8lGCf8RX+
	 +zKtxSn84sKA7qf+CMDZSW8dXxEFEskxqfs+h853xsJfYzjZwa+yTnfUaUtimBx1Np7DJ
	 Mw5V7FxiVkxTl5mDGdEzDZWDC7KQrAZ8P21nta1EUAUdxVhsxhzlKy3zyi/JhTO8y9cio
	 pvr5a1jfoXPmrEeY2oC5hxT/Sw/6MiW0/b49Go1vJghCJSqDZPte7ueh4SZxAmNayMrCK
	 dquq0rY6M/0tQQgJEWL9V1Qzv4zv4fIW4P0+FVboK+g6uCR9UHphs8bsnrsDpHbo7Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AniD6H5d;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75972606A332
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75972606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AniD6H5d
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so23725045e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102641; x=1793707441; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ngKLlD/TZFndBBHOawGu//O5HfItQqjo8oistDQQOGc=;
        b=AniD6H5d5Mi+0DsCiuFyGbO98Or5HqmsLkLOcfH1z6NX0dNG6UT2wu+wCOzojagIeU
         a90Gk7DwRhJxq9P2FqWS6OwZr0y2J0yBUoGUsYmsQui7D3EWe0sgCH0smj9KUmdPjioS
         yX1xXCqKdWA5kKsfhTDNXoGmPeYU2wBTqNo6axSbGSOJLfBHVPYoBDVHvKMAzHISSfn2
         FhKCb+D/ygJuhJvsZ2YG9RBFmA06eeqtFE69IADXbiUxWXr8uDmfk+Kc3JoDCyVqlqeR
         nago0BR4nUUs3iICHdJe+zgNctSIi9XiRofiB+IRsR7vv/Xmcw5NtsrJPrB2YUfqALdf
         E7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102641; x=1793707441;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ngKLlD/TZFndBBHOawGu//O5HfItQqjo8oistDQQOGc=;
        b=qV9hH7puTliDlq4USufzfmQDGUx4C15ADVC0prrz0IHPd2pgoytWgCI+DQcb1DZI+n
         mY2Gh8F+IoUv7leNJf5d1HpOohGaA/eYCHuJBdW5ysUdEeV9MrNyeDJUH3zD6pKE1ZFm
         RdslB7lZjrh0YG6wkC2XSCjQM8qE+AAn40pw8yQbJmW28qDQGHIYonOuIG/6Li4vKoJl
         +6qyOlWls1byLs7mzUSuSf1klESpicM23T3L3VNkD/sFavT0lGPw34+qtqb2KdxWu8nF
         9vEHSJY6C+GlfJIlcfyGhTYphy9/xmuavKysPN2kxBh2m5DcpResjF1THru4BWA38bl9
         ncXA==
X-Forwarded-Encrypted: i=1; AKwUvByOAEJloN2wpyn9IqP0oBpC391B9ljDfKwelH3uz5JNcXw/wceeS3vuoTeVdoDusV8A3o+8XPVdVV2nd5g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJD/3pldPkNPnNfXgOLpqG8VQJhWhszWUo5NOw3J3p8l70Z691+
	3svCrb9XKkyCMjY53d79yfhrzXQg9xQxNM0CrzyeVoaqUH2Awv5oalZj
X-Gm-Gg: AYBFou3/Nelykic8OVZTs7EktlWgsCHkSuH7ekS6w0xe/0zMBiFuOE9IFVcfkp4E7X6
	6USXARKCUCwRzaLy/Hsz3f4z/XjUPsAu0ctyL8eqBIsFsfyAuTMluTgsrkOO9vzbYUQ78eeEOqj
	Elp2ujVbuxL/8g+csWXvKvMbmAIqb/3vsaAbmkRrRxMn+4IY4IKP5tJPkvoS+ZHBf21iPY1woZJ
	FYLucBsAHR13sv9laFEnUkRaW4ITKMzTuxr+3bZIYoFZOXjoIh/4tt8PsdrEArR59MD4YCmmKj3
	J/XB3v2ejCR3JcCoTfe6xyxA7TQYEy/eXDBczdPro+GlUGWBQzWj+OE86ASHdXTaEGs3DIgQzSG
	dTGsGhvfkFnUbKUs4WelumgAaMzjOFDGMBacMYkeZDnGtFM0lsAe6TgYALU0iM5k25e2Lzo37wf
	qXBw34Dl2kMJgaEoQlny9fpsaL5qBRX60MQjJx4vGHJDKd8sceX0EMuGy6CjN1sJ0Kgfdl7eqsw
	MyVKjvIGKffmWdDKn1t8addt5eJF+EfifMz214txMXEcj6waqUO3GTArx4snNSFAXxoZ2j8F8ix
	DMo=
X-Received: by 2002:a05:600c:620b:b0:4a1:c6fd:4db0 with SMTP id 5b1f17b1804b1-4a35aca41e4mr160349135e9.19.1793102640602;
        Tue, 27 Oct 2026 05:04:00 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd39a9sm22977554f8f.46.2026.10.27.05.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:04:00 -0700 (PDT)
From: =?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
Subject: [PATCH v3 2/5] media: atomisp: queue: move remote queue handling into helpers
Date: Tue, 27 Oct 2026 12:03:37 +0000
Message-ID: <20261027120341.2305533-3-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027120341.2305533-1-vladurares@gmail.com>
References: <20261027120341.2305533-1-vladurares@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Move the remote queue branch of every queue operation into its own
static helper, written the way the function is meant to look once the
unused local queue support is gone, and call it from the existing
function after the local branch.

This prepares for removing the local queue support in the next patch
and keeps that change easy to review. No functional change intended.

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
---
 .../atomisp/pci/runtime/queue/src/queue.c     | 407 ++++++++++--------
 1 file changed, 232 insertions(+), 175 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
index d27c6567daeb0..cfd7473720d1f 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
@@ -70,10 +70,50 @@ int ia_css_queue_uninit(ia_css_queue_t *qhandle)
 	return 0;
 }
 
-int ia_css_queue_enqueue(ia_css_queue_t *qhandle, uint32_t item)
+static int ia_css_queue_enqueue_remote(ia_css_queue_t *qhandle, uint32_t item)
 {
+	ia_css_circbuf_desc_t cb_desc;
+	ia_css_circbuf_elem_t cb_elem;
+	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
 	int error;
 
+	if (!qhandle)
+		return -EINVAL;
+
+	/* a. Load the queue cb_desc from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error != 0)
+		return error;
+
+	/* b. Operate on the queue */
+	if (ia_css_circbuf_desc_is_full(&cb_desc))
+		return -ENOBUFS;
+
+	cb_elem.val = item;
+
+	error = ia_css_queue_item_store(qhandle, cb_desc.end, &cb_elem);
+	if (error != 0)
+		return error;
+
+	cb_desc.end = (cb_desc.end + 1) % cb_desc.size;
+
+	/* c. Store the queue object */
+	/* Set only fields requiring update with
+	 * valid value. Avoids unnecessary calls
+	 * to load/store functions
+	 */
+	ignore_desc_flags = QUEUE_IGNORE_SIZE_START_STEP_FLAGS;
+
+	error = ia_css_queue_store(qhandle, &cb_desc, ignore_desc_flags);
+	if (error != 0)
+		return error;
+
+	return 0;
+}
+
+int ia_css_queue_enqueue(ia_css_queue_t *qhandle, uint32_t item)
+{
 	if (!qhandle)
 		return -EINVAL;
 
@@ -89,48 +129,56 @@ int ia_css_queue_enqueue(ia_css_queue_t *qhandle, uint32_t item)
 
 		/* Push the element*/
 		ia_css_circbuf_push(&qhandle->desc.cb_local, item);
-	} else if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
-		ia_css_circbuf_desc_t cb_desc;
-		ia_css_circbuf_elem_t cb_elem;
-		u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
-
-		/* a. Load the queue cb_desc from remote */
-		QUEUE_CB_DESC_INIT(&cb_desc);
-		error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
-		if (error != 0)
-			return error;
-
-		/* b. Operate on the queue */
-		if (ia_css_circbuf_desc_is_full(&cb_desc))
-			return -ENOBUFS;
-
-		cb_elem.val = item;
-
-		error = ia_css_queue_item_store(qhandle, cb_desc.end, &cb_elem);
-		if (error != 0)
-			return error;
-
-		cb_desc.end = (cb_desc.end + 1) % cb_desc.size;
-
-		/* c. Store the queue object */
-		/* Set only fields requiring update with
-		 * valid value. Avoids unnecessary calls
-		 * to load/store functions
-		 */
-		ignore_desc_flags = QUEUE_IGNORE_SIZE_START_STEP_FLAGS;
-
-		error = ia_css_queue_store(qhandle, &cb_desc, ignore_desc_flags);
-		if (error != 0)
-			return error;
+		return 0;
 	}
 
+	return ia_css_queue_enqueue_remote(qhandle, item);
+}
+
+static int ia_css_queue_dequeue_remote(ia_css_queue_t *qhandle, uint32_t *item)
+{
+	ia_css_circbuf_desc_t cb_desc;
+	ia_css_circbuf_elem_t cb_elem;
+	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
+	int error;
+
+	if (!qhandle || NULL == item)
+		return -EINVAL;
+
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error != 0)
+		return error;
+
+	/* b. Operate on the queue */
+	if (ia_css_circbuf_desc_is_empty(&cb_desc))
+		return -ENODATA;
+
+	error = ia_css_queue_item_load(qhandle, cb_desc.start, &cb_elem);
+	if (error != 0)
+		return error;
+
+	*item = cb_elem.val;
+
+	cb_desc.start = (cb_desc.start + 1) % cb_desc.size;
+
+	/* c. Store the queue object */
+	/* Set only fields requiring update with
+	 * valid value. Avoids unnecessary calls
+	 * to load/store functions
+	 */
+	ignore_desc_flags = QUEUE_IGNORE_SIZE_END_STEP_FLAGS;
+	error = ia_css_queue_store(qhandle, &cb_desc, ignore_desc_flags);
+	if (error != 0)
+		return error;
+
 	return 0;
 }
 
 int ia_css_queue_dequeue(ia_css_queue_t *qhandle, uint32_t *item)
 {
-	int error;
-
 	if (!qhandle || NULL == item)
 		return -EINVAL;
 
@@ -145,47 +193,35 @@ int ia_css_queue_dequeue(ia_css_queue_t *qhandle, uint32_t *item)
 		}
 
 		*item = ia_css_circbuf_pop(&qhandle->desc.cb_local);
-	} else if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
-		/* a. Load the queue from remote */
-		ia_css_circbuf_desc_t cb_desc;
-		ia_css_circbuf_elem_t cb_elem;
-		u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
-
-		QUEUE_CB_DESC_INIT(&cb_desc);
-
-		error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
-		if (error != 0)
-			return error;
-
-		/* b. Operate on the queue */
-		if (ia_css_circbuf_desc_is_empty(&cb_desc))
-			return -ENODATA;
-
-		error = ia_css_queue_item_load(qhandle, cb_desc.start, &cb_elem);
-		if (error != 0)
-			return error;
-
-		*item = cb_elem.val;
-
-		cb_desc.start = (cb_desc.start + 1) % cb_desc.size;
-
-		/* c. Store the queue object */
-		/* Set only fields requiring update with
-		 * valid value. Avoids unnecessary calls
-		 * to load/store functions
-		 */
-		ignore_desc_flags = QUEUE_IGNORE_SIZE_END_STEP_FLAGS;
-		error = ia_css_queue_store(qhandle, &cb_desc, ignore_desc_flags);
-		if (error != 0)
-			return error;
+		return 0;
 	}
+
+	return ia_css_queue_dequeue_remote(qhandle, item);
+}
+
+static int ia_css_queue_is_full_remote(ia_css_queue_t *qhandle, bool *is_full)
+{
+	ia_css_circbuf_desc_t cb_desc;
+	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
+	int error;
+
+	if ((!qhandle) || (!is_full))
+		return -EINVAL;
+
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error != 0)
+		return error;
+
+	/* b. Operate on the queue */
+	*is_full = ia_css_circbuf_desc_is_full(&cb_desc);
+
 	return 0;
 }
 
 int ia_css_queue_is_full(ia_css_queue_t *qhandle, bool *is_full)
 {
-	int error;
-
 	if ((!qhandle) || (!is_full))
 		return -EINVAL;
 
@@ -196,28 +232,34 @@ int ia_css_queue_is_full(ia_css_queue_t *qhandle, bool *is_full)
 		 */
 		*is_full = ia_css_circbuf_is_full(&qhandle->desc.cb_local);
 		return 0;
-	} else if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
-		/* a. Load the queue from remote */
-		ia_css_circbuf_desc_t cb_desc;
-		u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
-
-		QUEUE_CB_DESC_INIT(&cb_desc);
-		error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
-		if (error != 0)
-			return error;
-
-		/* b. Operate on the queue */
-		*is_full = ia_css_circbuf_desc_is_full(&cb_desc);
-		return 0;
 	}
 
-	return -EINVAL;
+	return ia_css_queue_is_full_remote(qhandle, is_full);
+}
+
+static int ia_css_queue_get_free_space_remote(ia_css_queue_t *qhandle, uint32_t *size)
+{
+	ia_css_circbuf_desc_t cb_desc;
+	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
+	int error;
+
+	if ((!qhandle) || (!size))
+		return -EINVAL;
+
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error != 0)
+		return error;
+
+	/* b. Operate on the queue */
+	*size = ia_css_circbuf_desc_get_free_elems(&cb_desc);
+
+	return 0;
 }
 
 int ia_css_queue_get_free_space(ia_css_queue_t *qhandle, uint32_t *size)
 {
-	int error;
-
 	if ((!qhandle) || (!size))
 		return -EINVAL;
 
@@ -228,28 +270,34 @@ int ia_css_queue_get_free_space(ia_css_queue_t *qhandle, uint32_t *size)
 		 */
 		*size = ia_css_circbuf_get_free_elems(&qhandle->desc.cb_local);
 		return 0;
-	} else if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
-		/* a. Load the queue from remote */
-		ia_css_circbuf_desc_t cb_desc;
-		u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
-
-		QUEUE_CB_DESC_INIT(&cb_desc);
-		error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
-		if (error != 0)
-			return error;
-
-		/* b. Operate on the queue */
-		*size = ia_css_circbuf_desc_get_free_elems(&cb_desc);
-		return 0;
 	}
 
-	return -EINVAL;
+	return ia_css_queue_get_free_space_remote(qhandle, size);
+}
+
+static int ia_css_queue_get_used_space_remote(ia_css_queue_t *qhandle, uint32_t *size)
+{
+	ia_css_circbuf_desc_t cb_desc;
+	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
+	int error;
+
+	if ((!qhandle) || (!size))
+		return -EINVAL;
+
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error != 0)
+		return error;
+
+	/* b. Operate on the queue */
+	*size = ia_css_circbuf_desc_get_num_elems(&cb_desc);
+
+	return 0;
 }
 
 int ia_css_queue_get_used_space(ia_css_queue_t *qhandle, uint32_t *size)
 {
-	int error;
-
 	if ((!qhandle) || (!size))
 		return -EINVAL;
 
@@ -260,28 +308,47 @@ int ia_css_queue_get_used_space(ia_css_queue_t *qhandle, uint32_t *size)
 		 */
 		*size = ia_css_circbuf_get_num_elems(&qhandle->desc.cb_local);
 		return 0;
-	} else if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
-		/* a. Load the queue from remote */
-		ia_css_circbuf_desc_t cb_desc;
-		u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
-
-		QUEUE_CB_DESC_INIT(&cb_desc);
-		error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
-		if (error != 0)
-			return error;
-
-		/* b. Operate on the queue */
-		*size = ia_css_circbuf_desc_get_num_elems(&cb_desc);
-		return 0;
 	}
 
-	return -EINVAL;
+	return ia_css_queue_get_used_space_remote(qhandle, size);
+}
+
+static int ia_css_queue_peek_remote(ia_css_queue_t *qhandle, u32 offset, uint32_t *element)
+{
+	ia_css_circbuf_desc_t cb_desc;
+	ia_css_circbuf_elem_t cb_elem;
+	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
+	u32 num_elems;
+	int error;
+
+	if ((!qhandle) || (!element))
+		return -EINVAL;
+
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error != 0)
+		return error;
+
+	/* Check if offset is valid */
+	num_elems = ia_css_circbuf_desc_get_num_elems(&cb_desc);
+	if (offset > num_elems)
+		return -EINVAL;
+
+	offset = (cb_desc.start + offset) % cb_desc.size;
+	error = ia_css_queue_item_load(qhandle, (uint8_t)offset, &cb_elem);
+	if (error != 0)
+		return error;
+
+	*element = cb_elem.val;
+
+	return 0;
 }
 
 int ia_css_queue_peek(ia_css_queue_t *qhandle, u32 offset, uint32_t *element)
 {
 	u32 num_elems;
-	int error;
 
 	if ((!qhandle) || (!element))
 		return -EINVAL;
@@ -298,39 +365,34 @@ int ia_css_queue_peek(ia_css_queue_t *qhandle, u32 offset, uint32_t *element)
 
 		*element = ia_css_circbuf_peek_from_start(&qhandle->desc.cb_local, (int)offset);
 		return 0;
-	} else if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
-		/* a. Load the queue from remote */
-		ia_css_circbuf_desc_t cb_desc;
-		ia_css_circbuf_elem_t cb_elem;
-		u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
-
-		QUEUE_CB_DESC_INIT(&cb_desc);
-
-		error =  ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
-		if (error != 0)
-			return error;
-
-		/* Check if offset is valid */
-		num_elems = ia_css_circbuf_desc_get_num_elems(&cb_desc);
-		if (offset > num_elems)
-			return -EINVAL;
-
-		offset = (cb_desc.start + offset) % cb_desc.size;
-		error = ia_css_queue_item_load(qhandle, (uint8_t)offset, &cb_elem);
-		if (error != 0)
-			return error;
-
-		*element = cb_elem.val;
-		return 0;
 	}
 
-	return -EINVAL;
+	return ia_css_queue_peek_remote(qhandle, offset, element);
+}
+
+static int ia_css_queue_is_empty_remote(ia_css_queue_t *qhandle, bool *is_empty)
+{
+	ia_css_circbuf_desc_t cb_desc;
+	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
+	int error;
+
+	if ((!qhandle) || (!is_empty))
+		return -EINVAL;
+
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error != 0)
+		return error;
+
+	/* b. Operate on the queue */
+	*is_empty = ia_css_circbuf_desc_is_empty(&cb_desc);
+
+	return 0;
 }
 
 int ia_css_queue_is_empty(ia_css_queue_t *qhandle, bool *is_empty)
 {
-	int error;
-
 	if ((!qhandle) || (!is_empty))
 		return -EINVAL;
 
@@ -341,28 +403,35 @@ int ia_css_queue_is_empty(ia_css_queue_t *qhandle, bool *is_empty)
 		 */
 		*is_empty = ia_css_circbuf_is_empty(&qhandle->desc.cb_local);
 		return 0;
-	} else if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
-		/* a. Load the queue from remote */
-		ia_css_circbuf_desc_t cb_desc;
-		u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
-
-		QUEUE_CB_DESC_INIT(&cb_desc);
-		error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
-		if (error != 0)
-			return error;
-
-		/* b. Operate on the queue */
-		*is_empty = ia_css_circbuf_desc_is_empty(&cb_desc);
-		return 0;
 	}
 
-	return -EINVAL;
+	return ia_css_queue_is_empty_remote(qhandle, is_empty);
+}
+
+static int ia_css_queue_get_size_remote(ia_css_queue_t *qhandle, uint32_t *size)
+{
+	ia_css_circbuf_desc_t cb_desc;
+	u32 ignore_desc_flags = QUEUE_IGNORE_START_END_STEP_FLAGS;
+	int error;
+
+	if ((!qhandle) || (!size))
+		return -EINVAL;
+
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error != 0)
+		return error;
+
+	/* Return maximum usable capacity */
+	*size = cb_desc.size;
+
+	return 0;
 }
 
 int ia_css_queue_get_size(ia_css_queue_t *qhandle, uint32_t *size)
 {
-	int error;
-
 	if ((!qhandle) || (!size))
 		return -EINVAL;
 
@@ -373,20 +442,8 @@ int ia_css_queue_get_size(ia_css_queue_t *qhandle, uint32_t *size)
 		 */
 		/* Return maximum usable capacity */
 		*size = ia_css_circbuf_get_size(&qhandle->desc.cb_local);
-	} else if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
-		/* a. Load the queue from remote */
-		ia_css_circbuf_desc_t cb_desc;
-		u32 ignore_desc_flags = QUEUE_IGNORE_START_END_STEP_FLAGS;
-
-		QUEUE_CB_DESC_INIT(&cb_desc);
-
-		error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
-		if (error != 0)
-			return error;
-
-		/* Return maximum usable capacity */
-		*size = cb_desc.size;
+		return 0;
 	}
 
-	return 0;
+	return ia_css_queue_get_size_remote(qhandle, size);
 }
-- 
2.43.0

