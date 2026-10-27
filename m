Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142512;
	b=h0UHO+C5rImlgvp+oz8ie7Z2lx1y1BnUL/2KfPWdd2JXRbHJvwUdADJm+pcBuTkN06H7
	 Kp/LqMzdjUDN6XkkUY73znpB0JyIXXMhif3apMKFcXldfRmzscx3A5CElq1KwguxI1R0Z
	 NB6zrvd9kkJyE8Zh12grkk6+iU+uR60Alj++DaLiuX2N8jB6IIyiSr3hN4DkeozXzNpzI
	 EXTDCF0pcZ9/i/BSjiOB7RhJQVlqjrwSMSMYhI3hkqKNJnmuYQqojESasrIxb/NBK0Yks
	 6yhFq90/vz+gOAfAdcW1gBBcjTbFNz7xF/LjPicRnOMvnm1IjM83hp5rpZZluHGvEGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Ykc8ocMFfmIqIKZHnq3IoPM9xwtWxFOdLypt+51AUbY=;
	b=bD8WGMjvbZXuS82jD3ffFSkoGpIXskroVCcJksL0jHYbzXWWWGXBMb42s8nACdku6VVb
	 PGiz4BQZMaAQYyj5kwY0OXAl85JsRXgg2Zx2bSo624zA9MuF9gaf7SGzfTdzECg+c+Miq
	 Wvn0FyMhyWb+cigTn3JEnHUsKxU+t8amN/VGWEFnlDvkGVN7XM2NI3G1LbSQNJBwrbaXM
	 /DAk1A6+7yJH0i9aXpynYgKY7iEk0T/UxauhxNrv5ngUumasXHpuITzjTYGS/BjuqrrTB
	 2p/mnUdNv6vjonIw9IV0RviuQMU0aZOhqDxoGs8oQMR2gjVgAhh9stULgznKDWRTNZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N1JEifzE;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273DE606A330
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:08:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 273DE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N1JEifzE
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so2805935e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793142511; x=1793747311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ykc8ocMFfmIqIKZHnq3IoPM9xwtWxFOdLypt+51AUbY=;
        b=N1JEifzE8WJuAFdjki2cOGRWaqZA15OX1oNx7Veggg1n3WM5RxsQl+5MDCSBYimjGw
         OyUp6OssqDhobUzZxSm9u85xfihhNLx+2UFk7X1NJlY9cYQmu8wJ/vOBt34u3mam+kxu
         eDgZTp/6dLp3HMkSkM/3mHD1/DDosBOzHs9WOZFfutAj950PUgGOW+FvG/ARwi4n/fC3
         aHJXUTuXo6Fa8h6WUE7STPm+rzja+HT5OchC9i3ExJEypsSfLxhGJD7AU1Cp/xTh3yur
         ma1cAek2BmIhU2oABqpJ8hsbIHmQAwtfzVN1c6bNZFwVSF/Qjw6Mo/R14ntTdozVP2aU
         S9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142511; x=1793747311;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ykc8ocMFfmIqIKZHnq3IoPM9xwtWxFOdLypt+51AUbY=;
        b=s0aQN+9wkrbBrOfNP8bYdfiX1uTJWE/dNN5u2XZ9im0YTJnsiEDLcmo1fhrYEeLSLB
         vf42+WonuowyS9sGxlQK/EPhQ1gFq3AtG9A599cpzgib6QOZUtC1+KyV+pbpuQGqb+7U
         WtHEwCiJ8RnhUPwXIVDaCqiURwpKuhA0XxtqyyUWaLasDFhBq9OPbxlbYY8gFi2sKh5D
         E39K9uWaXzKWTvdUGrK6nuGMI/4/qPf7nTcTbdjjMX9+KJjXau3d0HaCp4hZBwgYa/KJ
         vSRoWKUicXKEreduCn6rCbrMtmmcYgecTnrCI4osDBc+UaNLzVLo+IKFkKoHMvVFxFNW
         SaMA==
X-Forwarded-Encrypted: i=1; AKwUvBwgXp0RsjW/DOfbOz+UKxcqTvGw7aa8SoJJZ4nDsI/1EZ/dXVDtrszyOBeESeiyulgsAvq5UCcXv8VJq6Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQhGWUB0QmTO43e5sM3N7KfFWd4FF/qLNXCoy6dc70HkOBB8g/
	SxAi1wO4V+9cWUnoECzJKulxPJbPs9Xt3dz4WNJD7eTrz/tVrnoeWlOt
X-Gm-Gg: AYBFou0FU82Ff8o4RFB/CYmVF+WLok1kmgdUGhrRhxNDw6o5bBz6KrJY3l21c925gdZ
	0wOe7RQNb/dKOXtIOKl0t9SYH/IuUETEmWyeYhvO0qTwILKITdQ5Ks9srF96CeyVfpVb01cPThp
	e4/CffqCh7V9ldfWKfGJxPTj1fs7fIuJtt2PJkNsEmsHP1DtbPoAqfyG+JmAfxXslude6vYzVVX
	A908h193/23MJIiRKLgJVvc6eiRUEFFfdQQk4pKbjFUm81YCNTNBfJWw4aA7QsSBnLAFgAqpbSh
	wo+YAOGWN5ODhnCUy10T4H3+SApgy0W1ezEPWL7Mim3D4uBjxsfrXvlyM+7LqfuNRQAApOXr1w0
	WywHlEW8KnI1iaK4XWA72Ajb8cklqvS77FH2R/UdZ/usEgcQVlTkX2C4MnCfcz9NAn7ux6nicW9
	3fI6haNmJ/kmjApPCxUNYkYlPkpxizQWwm3hMVWiGZaqkjl98SMo7QW3omu0+K1buBssnE9k3Hz
	yxXKP646RDI6d8QsxxXVXt58hCKvjLqhCB0Ctt338LQ/bFxAGa4cimBeukZtRKQkOLpnLiC1fFu
	N45ZsK37mNKpd8iQM5Apzcz7
X-Received: by 2002:a05:600c:8b78:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4a9672fa52cmr8085195e9.27.1793142510534;
        Tue, 27 Oct 2026 16:08:30 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97cebf858sm3407595e9.12.2026.10.27.16.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:08:30 -0700 (PDT)
From: =?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v4 2/5] media: atomisp: queue: move remote queue handling into helpers
Date: Tue, 27 Oct 2026 23:08:04 +0000
Message-ID: <20261027230807.2407261-3-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027230807.2407261-1-vladurares@gmail.com>
References: <20261027230807.2407261-1-vladurares@gmail.com>
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

While at it, tidy up the moved code: drop the redundant parentheses
and '!= 0' comparisons, use !ptr instead of comparing to NULL, and
return the result of the final ia_css_queue_store() call directly.

This prepares for removing the local queue support in the next patch
and keeps that change easy to review. No functional change intended.

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 .../atomisp/pci/runtime/queue/src/queue.c     | 402 ++++++++++--------
 1 file changed, 226 insertions(+), 176 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
index d27c6567daeb0..4212c113da41a 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
@@ -70,10 +70,46 @@ int ia_css_queue_uninit(ia_css_queue_t *qhandle)
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
+	if (error)
+		return error;
+
+	/* b. Operate on the queue */
+	if (ia_css_circbuf_desc_is_full(&cb_desc))
+		return -ENOBUFS;
+
+	cb_elem.val = item;
+
+	error = ia_css_queue_item_store(qhandle, cb_desc.end, &cb_elem);
+	if (error)
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
+	return ia_css_queue_store(qhandle, &cb_desc, ignore_desc_flags);
+}
+
+int ia_css_queue_enqueue(ia_css_queue_t *qhandle, uint32_t item)
+{
 	if (!qhandle)
 		return -EINVAL;
 
@@ -89,48 +125,53 @@ int ia_css_queue_enqueue(ia_css_queue_t *qhandle, uint32_t item)
 
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
 
-	return 0;
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
+	if (!qhandle || !item)
+		return -EINVAL;
+
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error)
+		return error;
+
+	/* b. Operate on the queue */
+	if (ia_css_circbuf_desc_is_empty(&cb_desc))
+		return -ENODATA;
+
+	error = ia_css_queue_item_load(qhandle, cb_desc.start, &cb_elem);
+	if (error)
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
+
+	return ia_css_queue_store(qhandle, &cb_desc, ignore_desc_flags);
 }
 
 int ia_css_queue_dequeue(ia_css_queue_t *qhandle, uint32_t *item)
 {
-	int error;
-
 	if (!qhandle || NULL == item)
 		return -EINVAL;
 
@@ -145,47 +186,35 @@ int ia_css_queue_dequeue(ia_css_queue_t *qhandle, uint32_t *item)
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
+	if (!qhandle || !is_full)
+		return -EINVAL;
+
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error)
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
 
@@ -196,28 +225,34 @@ int ia_css_queue_is_full(ia_css_queue_t *qhandle, bool *is_full)
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
+	if (!qhandle || !size)
+		return -EINVAL;
+
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error)
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
 
@@ -228,28 +263,34 @@ int ia_css_queue_get_free_space(ia_css_queue_t *qhandle, uint32_t *size)
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
+	if (!qhandle || !size)
+		return -EINVAL;
+
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error)
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
 
@@ -260,28 +301,47 @@ int ia_css_queue_get_used_space(ia_css_queue_t *qhandle, uint32_t *size)
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
+	if (!qhandle || !element)
+		return -EINVAL;
+
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error)
+		return error;
+
+	/* Check if offset is valid */
+	num_elems = ia_css_circbuf_desc_get_num_elems(&cb_desc);
+	if (offset > num_elems)
+		return -EINVAL;
+
+	offset = (cb_desc.start + offset) % cb_desc.size;
+	error = ia_css_queue_item_load(qhandle, (uint8_t)offset, &cb_elem);
+	if (error)
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
@@ -298,39 +358,34 @@ int ia_css_queue_peek(ia_css_queue_t *qhandle, u32 offset, uint32_t *element)
 
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
+	if (!qhandle || !is_empty)
+		return -EINVAL;
+
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error)
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
 
@@ -341,28 +396,35 @@ int ia_css_queue_is_empty(ia_css_queue_t *qhandle, bool *is_empty)
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
+	if (!qhandle || !size)
+		return -EINVAL;
+
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error)
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
 
@@ -373,20 +435,8 @@ int ia_css_queue_get_size(ia_css_queue_t *qhandle, uint32_t *size)
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

