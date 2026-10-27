Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142513;
	b=PgXXoVkJQzq5bysvDeTeL0dlSoxTwdXdzh2MX5jENl5IQpapoi67WEw/y1//qHJnSZ1g
	 QusIf8N6WyFbd+4a1lZvN4DnEWMjDoaH03yGyRq85k2UTc0EfpGk/KAkNlpbUVEW88+3Q
	 wWWDgY/QP+6PebGouz7Co1OWWDUALAGwKSYd4e+MzdjsEZcIA0M22ZIQX8fM7PRCfn3TV
	 8IRAxxyfelQyU7BOriFRSKQsPB5uk9XetzPDyT1OnFG9a2XHufzd9jGN4YzHBynr2dNS6
	 s8tuxkgnTMXwjXoGTPSXiHvBXA9EyOPTvrL8tRnaKg5dq0SkHIR8CZjH5W4vNKt9CpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=OHlnBz/JKIlwTxqnifjMU0ea8jV5/wrIgri2BVKwHRw=;
	b=ghGZqGJudoinZ9Cj4nwIZ1FfWE0uPNkjHqiSeNmryyXsLhk+KYjjD7qJ4oVOeR4sFL6v
	 uXpz+DAL2O4MC4TKk4ud2NnTB7YnBnHGSo9vahmAdbvajgEMOpgtMYS/51DPxxIyIIc6Y
	 Wzietm8prxNzMszrwGxsTAu+y2v5WZ9ERedYtvds7e3vkECbxleGyMpwANBIFwtMmKyGF
	 s2LFA3/2t6nlARdP8PX7Psq8ypiLakp6U+PLvuy5mHERZrYdAlAuzCH0MrPnt7KQeCBQn
	 8bjSIkwcxV1zPja5zigGfa2YmnfVV+VEZO3obfeqXSnwhBgYqGMvsmJKvSNGNymjffw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cuMzm6a6;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22BB606A324
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:08:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E22BB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cuMzm6a6
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so2576275e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793142511; x=1793747311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OHlnBz/JKIlwTxqnifjMU0ea8jV5/wrIgri2BVKwHRw=;
        b=cuMzm6a63ZFv8dszcFQFxRKaH56KZbptfFeYFGVoSAWN2SA1nNxdu3dNQCoKC2KnW0
         ztB/ygtLEyRqiccbqnfTwoa3Pme1FaPEpx7a8Tt+Ma/iepUjVkYEbmZX3cSDhGPwQAl2
         NdBOOrGzrvWus1zyz7dRLDNZih2+WHDXTMTYcXNAaL+XlX4FOGz1FeNWizmtwtT5d+rZ
         Fa2o1iVhw3IuglL/WNIsHXT5OtM9haTZVZd8VHqroejRgWLYQsMIPSMiphb3Jy7vvvob
         cS6AGTrI34tnGOW11egZk7rFE/7dsB52OP/J5cbt84BLwvhVsedvcN1lejPhsMIKWI8W
         kkew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142511; x=1793747311;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OHlnBz/JKIlwTxqnifjMU0ea8jV5/wrIgri2BVKwHRw=;
        b=GuN6crdRhtSf4LC69OvhJFBo/RWRVjscseFLrsAzs/RMzSHGsj0YMHHjnSeivF2w4x
         7sJVTcTGNacBMB9RzXHSOJyBUMJUIathY5utR+/H5oPlpELSvGFQ1zq57iYuu99Ulzyn
         EVno9/cYJy/d/FaRI0WNISrLfEC+YSsANDeEcdo3OReIeKJisdNvQOc85jjZ8SZJ/y4/
         yikBg6uk/Mk8C4RZfiLluhxelz1JjDo9gFSIuXJT32dJRtQe7vPlZzYNEiRPoMi8v2n0
         MgcqjvfPI07NX5fQXpkOJl1rkYl1T9vjlk87rAIHdmgeDWb8nfsP9xu02IrwBQO/IssV
         hZ9w==
X-Forwarded-Encrypted: i=1; AKwUvBwCw9Pzb6sp6oB9gczbHxsLI/RZ5cDnRWyoB3ugitIQNMfwKkcQY59Jvhzbcwg1dsrlkITtsSdACeQoXs0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcI5fzA923bjMW4qXSvCa0tA7jbVaESQjx8rfLZ4VbwjEJBTcZ
	gsZgOUOPOPH7JBjBxW7L4oqS7drsrW/FXJURONS/N2SV/2D9YdKQHigx
X-Gm-Gg: AYBFou0fbV6AhREbiPS7vWTTeM7+ZaaOmMRSIoE6F6KMGwwI4OIylJJYTXBGT8pygek
	KaB9sSTKGv4AhkcvOAqTzm8ARWDtnvRnNanx320BAqidWjrFpvRIWjT+jJhHYDKKP5M8LRgpL9s
	5SJV5SVK+CdNYIiqbh9sRNAv7mg+fLSMv0bWYonYBZLJ0H4bxGPNrbwotJTKyh1R401Yw6Y4GdG
	ruG5L5/HZYiwHB1SjZKcKD8PHHEoW3rZXSV3EYkbicPnJcY1JkSJemcdHvTlN3xU0UtEL52q6Tv
	SbikfLSWlCuTL4m8m+CywhmDCtwaUcYrsng3BasOFzyDHs2z6OX3lbpP4oRX/reZ4ciZIxNg0rr
	YJZbQNKbYcpALZxu4yu/g35LlT9mNEJW5YS2iXvf1Qk/kkZwV58AJeJ5FkclP5bLAAKhz6qJ8/u
	ke/hokNPT0nUvHr2CgNfEE9TTKA8mpes+l0rHKuPXa4x/hqrqi3QEBm4dmDmmodp6IT7rpc8JoE
	1KucQXP1UX523mXvMXxj2x4pTdc3D+wTXhwQObzNbXTShb4LR0F0CMGEnmEgvJP7ccbBI+jOTzZ
	URxO
X-Received: by 2002:a05:600c:1f94:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4a966399719mr8984575e9.4.1793142511233;
        Tue, 27 Oct 2026 16:08:31 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97cebf858sm3407595e9.12.2026.10.27.16.08.30
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
Subject: [PATCH v4 3/5] media: atomisp: queue: remove unused local queue support
Date: Tue, 27 Oct 2026 23:08:05 +0000
Message-ID: <20261027230807.2407261-4-vladurares@gmail.com>
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

ia_css_queue_local_init() has no callers, so no queue is ever created
as local. ia_css_queue_uninit() only handles local queues and has no
callers either.

All queue handles are in the static css_queues in bufq.c, and
ia_css_bufq_init() sets up each of them with ia_css_queue_remote_init().
This happens in ia_css_start_sp(), before the host sets
host_sp_queues_initialized for the firmware, and css_queues is not
cleared afterwards. Before that, the old code would have taken the local
path with a NULL cb_local.desc and hit OP___assert(), so the handles do
not seem to be used before initialization.

With only remote queues left, the queue type no longer serves a purpose.
Remove the local queue code together with IA_CSS_QUEUE_TYPE_REMOTE, the
type field and the type checks.

struct ia_css_queue appears to be host-only: it is not copied to SP or
ISP memory, and the firmware uses struct host_sp_queues, whose addresses
the handle stores. Removing the union member keeps the struct size on
32-bit and reduces it on 64-bit, where cb_local held two pointers.

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 .../runtime/queue/interface/ia_css_queue.h    |  29 ---
 .../queue/interface/ia_css_queue_comm.h       |   5 -
 .../atomisp/pci/runtime/queue/src/queue.c     | 206 +-----------------
 .../pci/runtime/queue/src/queue_access.h      |   2 -
 4 files changed, 8 insertions(+), 234 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue.h b/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue.h
index c097d912d87f8..87207c355e8e2 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue.h
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue.h
@@ -13,32 +13,12 @@
 #include "ia_css_queue_comm.h"
 #include "../src/queue_access.h"
 
-/* Local Queue object descriptor */
-struct ia_css_queue_local {
-	ia_css_circbuf_desc_t *cb_desc; /*Circbuf desc for local queues*/
-	ia_css_circbuf_elem_t *cb_elems; /*Circbuf elements*/
-};
-
-typedef struct ia_css_queue_local ia_css_queue_local_t;
-
 /* Handle for queue object*/
 typedef struct ia_css_queue ia_css_queue_t;
 
 /*****************************************************************************
  * Queue Public APIs
  *****************************************************************************/
-/* @brief Initialize a local queue instance.
- *
- * @param[out] qhandle. Handle to queue instance for use with API
- * @param[in]  desc.   Descriptor with queue properties filled-in
- * @return     0      - Successful init of local queue instance.
- * @return     -EINVAL - Invalid argument.
- *
- */
-int ia_css_queue_local_init(
-    ia_css_queue_t *qhandle,
-    ia_css_queue_local_t *desc);
-
 /* @brief Initialize a remote queue instance
  *
  * @param[out] qhandle. Handle to queue instance for use with API
@@ -50,15 +30,6 @@ int ia_css_queue_remote_init(
     ia_css_queue_t *qhandle,
     ia_css_queue_remote_t *desc);
 
-/* @brief Uninitialize a queue instance
- *
- * @param[in]  qhandle. Handle to queue instance
- * @return     0 - Successful uninit.
- *
- */
-int ia_css_queue_uninit(
-    ia_css_queue_t *qhandle);
-
 /* @brief Enqueue an item in the queue instance
  *
  * @param[in]  qhandle. Handle to queue instance
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue_comm.h b/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue_comm.h
index 0bed6425a07f0..7cd788e2b16bd 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue_comm.h
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue_comm.h
@@ -19,11 +19,6 @@
 #define IA_CSS_QUEUE_LOC_SP   1
 #define IA_CSS_QUEUE_LOC_ISP  2
 
-/* Queue type specifier */
-/* Avoiding enums to save space */
-#define IA_CSS_QUEUE_TYPE_LOCAL  0
-#define IA_CSS_QUEUE_TYPE_REMOTE 1
-
 /* for DDR Allocated queues,
 allocate minimum these many elements.
 DDR->SP' DMEM DMA transfer needs 32byte aligned address.
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
index 4212c113da41a..6747696595eab 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
@@ -13,24 +13,6 @@
 /*****************************************************************************
  * Queue Public APIs
  *****************************************************************************/
-int ia_css_queue_local_init(ia_css_queue_t *qhandle, ia_css_queue_local_t *desc)
-{
-	if (NULL == qhandle || NULL == desc
-	    || NULL == desc->cb_elems || NULL == desc->cb_desc) {
-		/* Invalid parameters, return error*/
-		return -EINVAL;
-	}
-
-	/* Mark the queue as Local */
-	qhandle->type = IA_CSS_QUEUE_TYPE_LOCAL;
-
-	/* Create a local circular buffer queue*/
-	ia_css_circbuf_create(&qhandle->desc.cb_local,
-			      desc->cb_elems,
-			      desc->cb_desc);
-
-	return 0;
-}
 
 int ia_css_queue_remote_init(ia_css_queue_t *qhandle, ia_css_queue_remote_t *desc)
 {
@@ -39,9 +21,6 @@ int ia_css_queue_remote_init(ia_css_queue_t *qhandle, ia_css_queue_remote_t *des
 		return -EINVAL;
 	}
 
-	/* Mark the queue as remote*/
-	qhandle->type = IA_CSS_QUEUE_TYPE_REMOTE;
-
 	/* Copy over the local queue descriptor*/
 	qhandle->location = desc->location;
 	qhandle->proc_id = desc->proc_id;
@@ -56,21 +35,7 @@ int ia_css_queue_remote_init(ia_css_queue_t *qhandle, ia_css_queue_remote_t *des
 	return 0;
 }
 
-int ia_css_queue_uninit(ia_css_queue_t *qhandle)
-{
-	if (!qhandle)
-		return -EINVAL;
-
-	/* Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Local queues are created. Destroy it*/
-		ia_css_circbuf_destroy(&qhandle->desc.cb_local);
-	}
-
-	return 0;
-}
-
-static int ia_css_queue_enqueue_remote(ia_css_queue_t *qhandle, uint32_t item)
+int ia_css_queue_enqueue(ia_css_queue_t *qhandle, uint32_t item)
 {
 	ia_css_circbuf_desc_t cb_desc;
 	ia_css_circbuf_elem_t cb_elem;
@@ -108,30 +73,7 @@ static int ia_css_queue_enqueue_remote(ia_css_queue_t *qhandle, uint32_t item)
 	return ia_css_queue_store(qhandle, &cb_desc, ignore_desc_flags);
 }
 
-int ia_css_queue_enqueue(ia_css_queue_t *qhandle, uint32_t item)
-{
-	if (!qhandle)
-		return -EINVAL;
-
-	/* 1. Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Directly de-ref the object and
-		 * operate on the queue
-		 */
-		if (ia_css_circbuf_is_full(&qhandle->desc.cb_local)) {
-			/* Cannot push the element. Return*/
-			return -ENOBUFS;
-		}
-
-		/* Push the element*/
-		ia_css_circbuf_push(&qhandle->desc.cb_local, item);
-		return 0;
-	}
-
-	return ia_css_queue_enqueue_remote(qhandle, item);
-}
-
-static int ia_css_queue_dequeue_remote(ia_css_queue_t *qhandle, uint32_t *item)
+int ia_css_queue_dequeue(ia_css_queue_t *qhandle, uint32_t *item)
 {
 	ia_css_circbuf_desc_t cb_desc;
 	ia_css_circbuf_elem_t cb_elem;
@@ -170,29 +112,7 @@ static int ia_css_queue_dequeue_remote(ia_css_queue_t *qhandle, uint32_t *item)
 	return ia_css_queue_store(qhandle, &cb_desc, ignore_desc_flags);
 }
 
-int ia_css_queue_dequeue(ia_css_queue_t *qhandle, uint32_t *item)
-{
-	if (!qhandle || NULL == item)
-		return -EINVAL;
-
-	/* 1. Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Directly de-ref the object and
-		 * operate on the queue
-		 */
-		if (ia_css_circbuf_is_empty(&qhandle->desc.cb_local)) {
-			/* Nothing to pop. Return empty queue*/
-			return -ENODATA;
-		}
-
-		*item = ia_css_circbuf_pop(&qhandle->desc.cb_local);
-		return 0;
-	}
-
-	return ia_css_queue_dequeue_remote(qhandle, item);
-}
-
-static int ia_css_queue_is_full_remote(ia_css_queue_t *qhandle, bool *is_full)
+int ia_css_queue_is_full(ia_css_queue_t *qhandle, bool *is_full)
 {
 	ia_css_circbuf_desc_t cb_desc;
 	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
@@ -213,24 +133,7 @@ static int ia_css_queue_is_full_remote(ia_css_queue_t *qhandle, bool *is_full)
 	return 0;
 }
 
-int ia_css_queue_is_full(ia_css_queue_t *qhandle, bool *is_full)
-{
-	if ((!qhandle) || (!is_full))
-		return -EINVAL;
-
-	/* 1. Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Directly de-ref the object and
-		 * operate on the queue
-		 */
-		*is_full = ia_css_circbuf_is_full(&qhandle->desc.cb_local);
-		return 0;
-	}
-
-	return ia_css_queue_is_full_remote(qhandle, is_full);
-}
-
-static int ia_css_queue_get_free_space_remote(ia_css_queue_t *qhandle, uint32_t *size)
+int ia_css_queue_get_free_space(ia_css_queue_t *qhandle, uint32_t *size)
 {
 	ia_css_circbuf_desc_t cb_desc;
 	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
@@ -251,24 +154,7 @@ static int ia_css_queue_get_free_space_remote(ia_css_queue_t *qhandle, uint32_t
 	return 0;
 }
 
-int ia_css_queue_get_free_space(ia_css_queue_t *qhandle, uint32_t *size)
-{
-	if ((!qhandle) || (!size))
-		return -EINVAL;
-
-	/* 1. Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Directly de-ref the object and
-		 * operate on the queue
-		 */
-		*size = ia_css_circbuf_get_free_elems(&qhandle->desc.cb_local);
-		return 0;
-	}
-
-	return ia_css_queue_get_free_space_remote(qhandle, size);
-}
-
-static int ia_css_queue_get_used_space_remote(ia_css_queue_t *qhandle, uint32_t *size)
+int ia_css_queue_get_used_space(ia_css_queue_t *qhandle, uint32_t *size)
 {
 	ia_css_circbuf_desc_t cb_desc;
 	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
@@ -289,24 +175,7 @@ static int ia_css_queue_get_used_space_remote(ia_css_queue_t *qhandle, uint32_t
 	return 0;
 }
 
-int ia_css_queue_get_used_space(ia_css_queue_t *qhandle, uint32_t *size)
-{
-	if ((!qhandle) || (!size))
-		return -EINVAL;
-
-	/* 1. Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Directly de-ref the object and
-		 * operate on the queue
-		 */
-		*size = ia_css_circbuf_get_num_elems(&qhandle->desc.cb_local);
-		return 0;
-	}
-
-	return ia_css_queue_get_used_space_remote(qhandle, size);
-}
-
-static int ia_css_queue_peek_remote(ia_css_queue_t *qhandle, u32 offset, uint32_t *element)
+int ia_css_queue_peek(ia_css_queue_t *qhandle, u32 offset, uint32_t *element)
 {
 	ia_css_circbuf_desc_t cb_desc;
 	ia_css_circbuf_elem_t cb_elem;
@@ -339,31 +208,7 @@ static int ia_css_queue_peek_remote(ia_css_queue_t *qhandle, u32 offset, uint32_
 	return 0;
 }
 
-int ia_css_queue_peek(ia_css_queue_t *qhandle, u32 offset, uint32_t *element)
-{
-	u32 num_elems;
-
-	if ((!qhandle) || (!element))
-		return -EINVAL;
-
-	/* 1. Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Directly de-ref the object and
-		 * operate on the queue
-		 */
-		/* Check if offset is valid */
-		num_elems = ia_css_circbuf_get_num_elems(&qhandle->desc.cb_local);
-		if (offset > num_elems)
-			return -EINVAL;
-
-		*element = ia_css_circbuf_peek_from_start(&qhandle->desc.cb_local, (int)offset);
-		return 0;
-	}
-
-	return ia_css_queue_peek_remote(qhandle, offset, element);
-}
-
-static int ia_css_queue_is_empty_remote(ia_css_queue_t *qhandle, bool *is_empty)
+int ia_css_queue_is_empty(ia_css_queue_t *qhandle, bool *is_empty)
 {
 	ia_css_circbuf_desc_t cb_desc;
 	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
@@ -384,24 +229,7 @@ static int ia_css_queue_is_empty_remote(ia_css_queue_t *qhandle, bool *is_empty)
 	return 0;
 }
 
-int ia_css_queue_is_empty(ia_css_queue_t *qhandle, bool *is_empty)
-{
-	if ((!qhandle) || (!is_empty))
-		return -EINVAL;
-
-	/* 1. Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Directly de-ref the object and
-		 * operate on the queue
-		 */
-		*is_empty = ia_css_circbuf_is_empty(&qhandle->desc.cb_local);
-		return 0;
-	}
-
-	return ia_css_queue_is_empty_remote(qhandle, is_empty);
-}
-
-static int ia_css_queue_get_size_remote(ia_css_queue_t *qhandle, uint32_t *size)
+int ia_css_queue_get_size(ia_css_queue_t *qhandle, uint32_t *size)
 {
 	ia_css_circbuf_desc_t cb_desc;
 	u32 ignore_desc_flags = QUEUE_IGNORE_START_END_STEP_FLAGS;
@@ -422,21 +250,3 @@ static int ia_css_queue_get_size_remote(ia_css_queue_t *qhandle, uint32_t *size)
 
 	return 0;
 }
-
-int ia_css_queue_get_size(ia_css_queue_t *qhandle, uint32_t *size)
-{
-	if ((!qhandle) || (!size))
-		return -EINVAL;
-
-	/* 1. Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Directly de-ref the object and
-		 * operate on the queue
-		 */
-		/* Return maximum usable capacity */
-		*size = ia_css_circbuf_get_size(&qhandle->desc.cb_local);
-		return 0;
-	}
-
-	return ia_css_queue_get_size_remote(qhandle, size);
-}
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
index d62133a8fe6f8..776c6d6cb1fcc 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
@@ -43,11 +43,9 @@
 	} while (0)
 
 struct ia_css_queue {
-	u8 type;        /* Specify remote/local type of access */
 	u8 location;    /* Cell location for queue */
 	u8 proc_id;     /* Processor id for queue access */
 	union {
-		ia_css_circbuf_t cb_local;
 		struct {
 			u32 cb_desc_addr; /*Circbuf desc address for remote queues*/
 			u32 cb_elems_addr; /*Circbuf elements addr for remote queue*/
-- 
2.43.0

