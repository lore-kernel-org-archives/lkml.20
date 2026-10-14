Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381684EE854
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976368; cv=none; b=hffBSrZiqExK6tEeRP26u8C+izeq4sQfETdL7EZFnC5CHrapKG/xtzPh8mR4M/oFElX0DJ7N9vMVVZPKZYX8L58Pl4eIfArbq914n4TAUaMdKN48YYAdSlUnlljag43vsu+0dASvRIoaEJEhO7NXrQaQoxvCM4p0+kxJmV7pc9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976368; c=relaxed/simple;
	bh=LcB7o99h4G30eJqkaoJPf7rxvwTNIW+vUsmR6XD2O2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sYYujtvDVU0fFw64EHlJIEdN1nY3R1BWUYwt4oY29jow2HsFam06HmvRbc9CocWOZcVZ4E1vt2sKEqiq192KXcNQWr/XDHXPMyfQ5q/fDLeBk+PfL3b3BGyBTcMS856cqyPXUi2ft16/vKhm+kEhWoyYmxUSQfFJqPIAFA6Tyik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OtxdVhvT; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OtxdVhvT"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c14a06c95so3128716f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791976357; x=1792581157; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DEfXZtro00WX1Oq9WvRLadDvsGk3bEzDKLU+IzhYgIs=;
        b=OtxdVhvTKa0scAsZMXzkIX+tATnh4S2j9y5OU1ZBHWOFU9h5KNCwmkbNupHvCFCQor
         XOt9DQceiUoEyTPBX4/VcobVXKXMD662XcHwLEItxm2h6LSgTEXZIgFer5ucnVmEDuLR
         B5J4gk6UJc0OJGltcoTnB2HSZzNHBFl4Nsa0DRcRrl2I0SaIBdjWWpXeqIYLFelUAcYf
         F1WJLADXM8pVCSoERmZ5Vqrlhp1Lz16KvHOpUGlYlswRBTRwEN0ICKxKvoYSxtKkXDyy
         uoWBFZn36mzkrKkzWXuiB3QsSLn0Ih8BizgOrwbhlCZY4ahL+v314QIxZM0Tw+Vf529/
         IYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791976357; x=1792581157;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DEfXZtro00WX1Oq9WvRLadDvsGk3bEzDKLU+IzhYgIs=;
        b=bqdKkC5RARIUVSNdT1eqH+gtwUt2bDB/SiS1aTgbejbLpEAu2LQ+qtv6eJe7Gyuk4n
         +8QU5reG2T/4f687+tjR3HjJyWjW/FYI2D3k3GLtnyqpKAMJQAtK8JgLRi5lUQsX5nOo
         sxCV3UHlQes3qtWVb1WnFxnk9Hzw7acM3Xj3kL5ZTcmkzkB4Oe/u1Yfh9PpfSTH8uezb
         eBnCSJkiyE8celG0IwfHMEWOBLn2C+wh7/U2RjBfQz63oMI5Gl2E/cd5FisZV32pkVnR
         CFkOslZOWRP9Neb+GCm+j8D5mF9oNMHcLjLYTfjKMT2twMNht3vHvg9DuNo5/bl2RcYo
         udIg==
X-Forwarded-Encrypted: i=1; AKwUvBxkdUGQMn7SY0t5HKO8p7eNwNM0AfTLtfivEuiW8HY/ZMMF5zFm84/XsA85A9LsZ7YCMiPGAuV48v6IxfU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxXHBAeiXNYa8NLwzXVOQmBY/he/BaJ9Cv19mGmfePhboSPCHF
	dLWj6fkM3UJ+mTmYhCH2cyz8UoCfUEGyUt0lvUXfg40nIwxBXgp2Lqhl
X-Gm-Gg: AYBFou2pP2ezmQlRs3hJx4FIITTR9rVjz84BE0wvYY//z2vKiNvHS0qP2uuSP/VoLNw
	NNGFoYLNw7UHrCwvXczQ7LovwV2VtiHGUfzcAjJ6Mo0pd2WrOxuDGcLaoyb/GdTWEyOhV3qIWya
	p0B8G74FZ8V/is8vLT3e6S9Fr31tBbAhKipimM5v3dtBboeuKtDkR4DvxkrcXBXdmRJXLmz7ARk
	wHiVGfGptCL4ou/BeICxb1NFt1EHlrkWYp/52nbMUePCU5iHg+ysGaCd3fNoLUxMHwGDFdmiNOV
	cMozTZzJAQbqpZ6upYUUo6/Edq3kIu9NkbFa/OEXieVSsnLDJ035FQ8bEYJQAxgsC4MhOuAjNfA
	y+ZMjM2jcDoShktfvR7JH6pXxMuf7h3ZkJVtnWGVfWQbW6yq/+g/xSJMv7yYf8JOtVStX7+tMjL
	xBCKZF32l1K4G301iSjimeE3Z+g9KXSMMnz7wwkmqr4vpGxWE/98rnOdAnUVmJkimaqYowaUkhz
	iLmcP+v9bt7n/xfBWEmXG8csbMhoLKQ
X-Received: by 2002:a05:6000:24c4:b0:48b:1c:d6e1 with SMTP id ffacd0b85a97d-48dbace386bmr29481965f8f.43.1791976356821;
        Wed, 14 Oct 2026 04:12:36 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48deeadc0b5sm1846481f8f.6.2026.10.14.04.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:12:36 -0700 (PDT)
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
Subject: [PATCH v2 4/4] media: atomisp: remove unused circbuf library
Date: Wed, 14 Oct 2026 11:12:13 +0000
Message-ID: <20261014111213.1967452-5-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014111213.1967452-1-vladurares@gmail.com>
References: <20261014111213.1967452-1-vladurares@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

After the previous changes nothing in the driver uses the custom
circular buffer implementation in base/circbuf/ anymore. Remove it
together with its Makefile entries.

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/staging/media/atomisp/Makefile        |   2 -
 .../base/circbuf/interface/ia_css_circbuf.h   | 363 ------------------
 .../circbuf/interface/ia_css_circbuf_comm.h   |  56 ---
 .../circbuf/interface/ia_css_circbuf_desc.h   | 160 --------
 .../atomisp/pci/base/circbuf/src/circbuf.c    | 312 ---------------
 5 files changed, 893 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_comm.h
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c

diff --git a/drivers/staging/media/atomisp/Makefile b/drivers/staging/media/atomisp/Makefile
index 1d0fbe22036bd..65e09be95bc99 100644
--- a/drivers/staging/media/atomisp/Makefile
+++ b/drivers/staging/media/atomisp/Makefile
@@ -35,7 +35,6 @@ atomisp-objs += \
 	pci/sh_css_sp.o \
 	pci/sh_css_stream_format.o \
 	pci/sh_css_version.o \
-	pci/base/circbuf/src/circbuf.o \
 	pci/base/refcount/src/refcount.o \
 	pci/camera/pipe/src/pipe_binarydesc.o \
 	pci/camera/pipe/src/pipe_stagedesc.o \
@@ -162,7 +161,6 @@ INCLUDES += \
 	-I$(atomisp)/include/hmm/ \
 	-I$(atomisp)/include/mmu/ \
 	-I$(atomisp)/pci/ \
-	-I$(atomisp)/pci/base/circbuf/interface/ \
 	-I$(atomisp)/pci/base/refcount/interface/ \
 	-I$(atomisp)/pci/camera/pipe/interface/ \
 	-I$(atomisp)/pci/camera/util/interface/ \
diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
deleted file mode 100644
index fbcd73b711baf..0000000000000
--- a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
+++ /dev/null
@@ -1,363 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Support for Intel Camera Imaging ISP subsystem.
- * Copyright (c) 2015, Intel Corporation.
- */
-
-#ifndef _IA_CSS_CIRCBUF_H
-#define _IA_CSS_CIRCBUF_H
-
-#include <sp.h>
-#include <type_support.h>
-#include <math_support.h>
-#include <assert_support.h>
-#include <platform_support.h>
-#include "ia_css_circbuf_comm.h"
-#include "ia_css_circbuf_desc.h"
-
-/****************************************************************
- *
- * Data structures.
- *
- ****************************************************************/
-/*
- * @brief Data structure for the circular buffer.
- */
-typedef struct ia_css_circbuf_s ia_css_circbuf_t;
-struct ia_css_circbuf_s {
-	ia_css_circbuf_desc_t *desc;    /* Pointer to the descriptor of the circbuf */
-	ia_css_circbuf_elem_t *elems;	/* an array of elements    */
-};
-
-/*
- * @brief Create the circular buffer.
- *
- * @param cb	The pointer to the circular buffer.
- * @param elems	An array of elements.
- * @param desc	The descriptor set to the size using ia_css_circbuf_desc_init().
- */
-void ia_css_circbuf_create(
-    ia_css_circbuf_t *cb,
-    ia_css_circbuf_elem_t *elems,
-    ia_css_circbuf_desc_t *desc);
-
-/*
- * @brief Destroy the circular buffer.
- *
- * @param cb The pointer to the circular buffer.
- */
-void ia_css_circbuf_destroy(
-    ia_css_circbuf_t *cb);
-
-/*
- * @brief Pop a value out of the circular buffer.
- * Get a value at the head of the circular buffer.
- * The user should call "ia_css_circbuf_is_empty()"
- * to avoid accessing to an empty buffer.
- *
- * @param cb	The pointer to the circular buffer.
- *
- * @return the pop-out value.
- */
-uint32_t ia_css_circbuf_pop(
-    ia_css_circbuf_t *cb);
-
-/*
- * @brief Extract a value out of the circular buffer.
- * Get a value at an arbitrary position in the circular
- * buffer. The user should call "ia_css_circbuf_is_empty()"
- * to avoid accessing to an empty buffer.
- *
- * @param cb	 The pointer to the circular buffer.
- * @param offset The offset from "start" to the target position.
- *
- * @return the extracted value.
- */
-uint32_t ia_css_circbuf_extract(
-    ia_css_circbuf_t *cb,
-    int offset);
-
-/****************************************************************
- *
- * Inline functions.
- *
- ****************************************************************/
-/*
- * @brief Set the "val" field in the element.
- *
- * @param elem The pointer to the element.
- * @param val  The value to be set.
- */
-static inline void ia_css_circbuf_elem_set_val(
-    ia_css_circbuf_elem_t *elem,
-    uint32_t val)
-{
-	OP___assert(elem);
-
-	elem->val = val;
-}
-
-/*
- * @brief Initialize the element.
- *
- * @param elem The pointer to the element.
- */
-static inline void ia_css_circbuf_elem_init(
-    ia_css_circbuf_elem_t *elem)
-{
-	OP___assert(elem);
-	ia_css_circbuf_elem_set_val(elem, 0);
-}
-
-/*
- * @brief Copy an element.
- *
- * @param src  The element as the copy source.
- * @param dest The element as the copy destination.
- */
-static inline void ia_css_circbuf_elem_cpy(
-    ia_css_circbuf_elem_t *src,
-    ia_css_circbuf_elem_t *dest)
-{
-	OP___assert(src);
-	OP___assert(dest);
-
-	ia_css_circbuf_elem_set_val(dest, src->val);
-}
-
-/*
- * @brief Get position in the circular buffer.
- *
- * @param cb		The pointer to the circular buffer.
- * @param base		The base position.
- * @param offset	The offset.
- *
- * @return the position at offset.
- */
-static inline uint8_t ia_css_circbuf_get_pos_at_offset(
-    ia_css_circbuf_t *cb,
-    u32 base,
-    int offset)
-{
-	OP___assert(cb);
-	OP___assert(cb->desc);
-	OP___assert(cb->desc->size > 0);
-
-	/* step 1: adjudst the offset  */
-	while (offset < 0)
-		offset += cb->desc->size;
-
-	/* step 2: shift and round by the upper limit */
-	return (base + offset) % cb->desc->size;
-}
-
-/*
- * @brief Get the offset between two positions in the circular buffer.
- * Get the offset from the source position to the terminal position,
- * along the direction in which the new elements come in.
- *
- * @param cb		The pointer to the circular buffer.
- * @param src_pos	The source position.
- * @param dest_pos	The terminal position.
- *
- * @return the offset.
- */
-static inline int ia_css_circbuf_get_offset(
-    ia_css_circbuf_t *cb,
-    u32 src_pos,
-    uint32_t dest_pos)
-{
-	int offset;
-
-	OP___assert(cb);
-	OP___assert(cb->desc);
-
-	offset = (int)(dest_pos - src_pos);
-	offset += (offset < 0) ? cb->desc->size : 0;
-
-	return offset;
-}
-
-/*
- * @brief Get the maximum number of elements.
- *
- * @param cb The pointer to the circular buffer.
- *
- * @return the maximum number of elements.
- *
- * TODO: Test this API.
- */
-static inline uint32_t ia_css_circbuf_get_size(
-    ia_css_circbuf_t *cb)
-{
-	OP___assert(cb);
-	OP___assert(cb->desc);
-
-	return cb->desc->size;
-}
-
-/*
- * @brief Get the number of available elements.
- *
- * @param cb The pointer to the circular buffer.
- *
- * @return the number of available elements.
- */
-static inline uint32_t ia_css_circbuf_get_num_elems(
-    ia_css_circbuf_t *cb)
-{
-	int num;
-
-	OP___assert(cb);
-	OP___assert(cb->desc);
-
-	num = ia_css_circbuf_get_offset(cb, cb->desc->start, cb->desc->end);
-
-	return (uint32_t)num;
-}
-
-/*
- * @brief Test if the circular buffer is empty.
- *
- * @param cb	The pointer to the circular buffer.
- *
- * @return
- *	- true when it is empty.
- *	- false when it is not empty.
- */
-static inline bool ia_css_circbuf_is_empty(
-    ia_css_circbuf_t *cb)
-{
-	OP___assert(cb);
-	OP___assert(cb->desc);
-
-	return ia_css_circbuf_desc_is_empty(cb->desc);
-}
-
-/*
- * @brief Test if the circular buffer is full.
- *
- * @param cb	The pointer to the circular buffer.
- *
- * @return
- *	- true when it is full.
- *	- false when it is not full.
- */
-static inline bool ia_css_circbuf_is_full(ia_css_circbuf_t *cb)
-{
-	OP___assert(cb);
-	OP___assert(cb->desc);
-
-	return ia_css_circbuf_desc_is_full(cb->desc);
-}
-
-/*
- * @brief Write a new element into the circular buffer.
- * Write a new element WITHOUT checking whether the
- * circular buffer is full or not. So it also overwrites
- * the oldest element when the buffer is full.
- *
- * @param cb	The pointer to the circular buffer.
- * @param elem	The new element.
- */
-static inline void ia_css_circbuf_write(
-    ia_css_circbuf_t *cb,
-    ia_css_circbuf_elem_t elem)
-{
-	OP___assert(cb);
-	OP___assert(cb->desc);
-
-	/* Cannot continue as the queue is full*/
-	assert(!ia_css_circbuf_is_full(cb));
-
-	ia_css_circbuf_elem_cpy(&elem, &cb->elems[cb->desc->end]);
-
-	cb->desc->end = ia_css_circbuf_get_pos_at_offset(cb, cb->desc->end, 1);
-}
-
-/*
- * @brief Push a value in the circular buffer.
- * Put a new value at the tail of the circular buffer.
- * The user should call "ia_css_circbuf_is_full()"
- * to avoid accessing to a full buffer.
- *
- * @param cb	The pointer to the circular buffer.
- * @param val	The value to be pushed in.
- */
-static inline void ia_css_circbuf_push(
-    ia_css_circbuf_t *cb,
-    uint32_t val)
-{
-	ia_css_circbuf_elem_t elem;
-
-	OP___assert(cb);
-
-	/* set up an element */
-	ia_css_circbuf_elem_init(&elem);
-	ia_css_circbuf_elem_set_val(&elem, val);
-
-	/* write the element into the buffer */
-	ia_css_circbuf_write(cb, elem);
-}
-
-/*
- * @brief Get the number of free elements.
- *
- * @param cb The pointer to the circular buffer.
- *
- * @return: The number of free elements.
- */
-static inline uint32_t ia_css_circbuf_get_free_elems(
-    ia_css_circbuf_t *cb)
-{
-	OP___assert(cb);
-	OP___assert(cb->desc);
-
-	return ia_css_circbuf_desc_get_free_elems(cb->desc);
-}
-
-/*
- * @brief Peek an element in Circular Buffer.
- *
- * @param cb	 The pointer to the circular buffer.
- * @param offset Offset to the element.
- *
- * @return the elements value.
- */
-uint32_t ia_css_circbuf_peek(
-    ia_css_circbuf_t *cb,
-    int offset);
-
-/*
- * @brief Get an element in Circular Buffer.
- *
- * @param cb	 The pointer to the circular buffer.
- * @param offset Offset to the element.
- *
- * @return the elements value.
- */
-uint32_t ia_css_circbuf_peek_from_start(
-    ia_css_circbuf_t *cb,
-    int offset);
-
-/*
- * @brief Increase Size of a Circular Buffer.
- * Use 'CAUTION' before using this function, This was added to
- * support / fix issue with increasing size for tagger only
- *
- * @param cb The pointer to the circular buffer.
- * @param sz_delta delta increase for new size
- * @param elems (optional) pointers to new additional elements
- *		cb element array size will not be increased dynamically,
- *		but new elements should be added at the end to existing
- *		cb element array which if of max_size >= new size
- *
- * @return	true on successfully increasing the size
- *			false on failure
- */
-bool ia_css_circbuf_increase_size(
-    ia_css_circbuf_t *cb,
-    unsigned int sz_delta,
-    ia_css_circbuf_elem_t *elems);
-
-#endif /*_IA_CSS_CIRCBUF_H */
diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_comm.h b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_comm.h
deleted file mode 100644
index 090e2e7640421..0000000000000
--- a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_comm.h
+++ /dev/null
@@ -1,56 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Support for Intel Camera Imaging ISP subsystem.
- * Copyright (c) 2015, Intel Corporation.
- */
-
-#ifndef _IA_CSS_CIRCBUF_COMM_H
-#define _IA_CSS_CIRCBUF_COMM_H
-
-#include <linux/build_bug.h>
-
-#include <type_support.h>  /* uint8_t, uint32_t */
-
-#define IA_CSS_CIRCBUF_PADDING 1 /* The circular buffer is implemented in lock-less manner, wherein
-				   * the head and tail can advance independently without any locks.
-				   * But to achieve this, an extra buffer element is required to detect
-				   * queue full & empty conditions, wherein the tail trails the head for
-				   * full and is equal to head for empty condition. This causes 1 buffer
-				   * not being available for use.
-				   */
-
-/****************************************************************
- *
- * Portable Data structures
- *
- ****************************************************************/
-/*
- * @brief Data structure for the circular descriptor.
- */
-typedef struct ia_css_circbuf_desc_s ia_css_circbuf_desc_t;
-struct ia_css_circbuf_desc_s {
-	u8 size;	/* the maximum number of elements*/
-	u8 step;   /* number of bytes per element */
-	u8 start;	/* index of the oldest element */
-	u8 end;	/* index at which to write the new element */
-};
-
-#define SIZE_OF_IA_CSS_CIRCBUF_DESC_S_STRUCT				\
-	(4 * sizeof(uint8_t))
-
-static_assert(sizeof(struct ia_css_circbuf_desc_s) == SIZE_OF_IA_CSS_CIRCBUF_DESC_S_STRUCT);
-
-/*
- * @brief Data structure for the circular buffer element.
- */
-typedef struct ia_css_circbuf_elem_s ia_css_circbuf_elem_t;
-struct ia_css_circbuf_elem_s {
-	u32 val;	/* the value stored in the element */
-};
-
-#define SIZE_OF_IA_CSS_CIRCBUF_ELEM_S_STRUCT				\
-	(sizeof(uint32_t))
-
-static_assert(sizeof(struct ia_css_circbuf_elem_s) == SIZE_OF_IA_CSS_CIRCBUF_ELEM_S_STRUCT);
-
-#endif /*_IA_CSS_CIRCBUF_COMM_H*/
diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h
deleted file mode 100644
index 3306a7a0fa5eb..0000000000000
--- a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h
+++ /dev/null
@@ -1,160 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Support for Intel Camera Imaging ISP subsystem.
- * Copyright (c) 2015, Intel Corporation.
- */
-
-#ifndef _IA_CSS_CIRCBUF_DESC_H_
-#define _IA_CSS_CIRCBUF_DESC_H_
-
-#include <type_support.h>
-#include <math_support.h>
-#include <platform_support.h>
-#include <sp.h>
-#include "ia_css_circbuf_comm.h"
-/****************************************************************
- *
- * Inline functions.
- *
- ****************************************************************/
-/*
- * @brief Test if the circular buffer is empty.
- *
- * @param cb_desc The pointer to the circular buffer descriptor.
- *
- * @return
- *	- true when it is empty.
- *	- false when it is not empty.
- */
-static inline bool ia_css_circbuf_desc_is_empty(
-    ia_css_circbuf_desc_t *cb_desc)
-{
-	OP___assert(cb_desc);
-	return (cb_desc->end == cb_desc->start);
-}
-
-/*
- * @brief Test if the circular buffer descriptor is full.
- *
- * @param cb_desc	The pointer to the circular buffer
- *			descriptor.
- *
- * @return
- *	- true when it is full.
- *	- false when it is not full.
- */
-static inline bool ia_css_circbuf_desc_is_full(
-    ia_css_circbuf_desc_t *cb_desc)
-{
-	OP___assert(cb_desc);
-	return ((cb_desc->end + 1) % cb_desc->size) == cb_desc->start;
-}
-
-/*
- * @brief Initialize the circular buffer descriptor
- *
- * @param cb_desc	The pointer circular buffer descriptor
- * @param size		The size of the circular buffer
- */
-static inline void ia_css_circbuf_desc_init(
-    ia_css_circbuf_desc_t *cb_desc,
-    int8_t size)
-{
-	OP___assert(cb_desc);
-	cb_desc->size = size;
-}
-
-/*
- * @brief Get a position in the circular buffer descriptor.
- *
- * @param cb     The pointer to the circular buffer descriptor.
- * @param base   The base position.
- * @param offset The offset.
- *
- * @return the position in the circular buffer descriptor.
- */
-static inline uint8_t ia_css_circbuf_desc_get_pos_at_offset(
-    ia_css_circbuf_desc_t *cb_desc,
-    u32 base,
-    int offset)
-{
-	OP___assert(cb_desc);
-	OP___assert(cb_desc->size > 0);
-
-	/* step 1: adjust the offset  */
-	while (offset < 0)
-		offset += cb_desc->size;
-
-	/* step 2: shift and round by the upper limit */
-	return (base + offset) % cb_desc->size;
-}
-
-/*
- * @brief Get the offset between two positions in the circular buffer
- * descriptor.
- * Get the offset from the source position to the terminal position,
- * along the direction in which the new elements come in.
- *
- * @param cb_desc	The pointer to the circular buffer descriptor.
- * @param src_pos	The source position.
- * @param dest_pos	The terminal position.
- *
- * @return the offset.
- */
-static inline int ia_css_circbuf_desc_get_offset(
-    ia_css_circbuf_desc_t *cb_desc,
-    u32 src_pos,
-    uint32_t dest_pos)
-{
-	int offset;
-
-	OP___assert(cb_desc);
-
-	offset = (int)(dest_pos - src_pos);
-	offset += (offset < 0) ? cb_desc->size : 0;
-
-	return offset;
-}
-
-/*
- * @brief Get the number of available elements.
- *
- * @param cb_desc The pointer to the circular buffer.
- *
- * @return The number of available elements.
- */
-static inline uint32_t ia_css_circbuf_desc_get_num_elems(
-    ia_css_circbuf_desc_t *cb_desc)
-{
-	int num;
-
-	OP___assert(cb_desc);
-
-	num = ia_css_circbuf_desc_get_offset(cb_desc,
-					     cb_desc->start,
-					     cb_desc->end);
-
-	return (uint32_t)num;
-}
-
-/*
- * @brief Get the number of free elements.
- *
- * @param cb_desc The pointer to the circular buffer descriptor.
- *
- * @return: The number of free elements.
- */
-static inline uint32_t ia_css_circbuf_desc_get_free_elems(
-    ia_css_circbuf_desc_t *cb_desc)
-{
-	u32 num;
-
-	OP___assert(cb_desc);
-
-	num = ia_css_circbuf_desc_get_offset(cb_desc,
-					     cb_desc->start,
-					     cb_desc->end);
-
-	return (cb_desc->size - num);
-}
-#endif /*_IA_CSS_CIRCBUF_DESC_H_ */
diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
deleted file mode 100644
index cb34d0b5abb5e..0000000000000
--- a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
+++ /dev/null
@@ -1,312 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Support for Intel Camera Imaging ISP subsystem.
- * Copyright (c) 2015, Intel Corporation.
- */
-
-#include "ia_css_circbuf.h"
-
-#include <assert_support.h>
-
-/**********************************************************************
- *
- * Forward declarations.
- *
- **********************************************************************/
-/*
- * @brief Read the oldest element from the circular buffer.
- * Read the oldest element WITHOUT checking whether the
- * circular buffer is empty or not. The oldest element is
- * also removed out from the circular buffer.
- *
- * @param cb The pointer to the circular buffer.
- *
- * @return the oldest element.
- */
-static inline ia_css_circbuf_elem_t
-ia_css_circbuf_read(ia_css_circbuf_t *cb);
-
-/*
- * @brief Shift a chunk of elements in the circular buffer.
- * A chunk of elements (i.e. the ones from the "start" position
- * to the "chunk_src" position) are shifted in the circular buffer,
- * along the direction of new elements coming.
- *
- * @param cb	     The pointer to the circular buffer.
- * @param chunk_src  The position at which the first element in the chunk is.
- * @param chunk_dest The position to which the first element in the chunk would be shift.
- */
-static inline void ia_css_circbuf_shift_chunk(ia_css_circbuf_t *cb,
-	u32 chunk_src,
-	uint32_t chunk_dest);
-
-/*
- * @brief Get the "val" field in the element.
- *
- * @param elem The pointer to the element.
- *
- * @return the "val" field.
- */
-static inline uint32_t
-ia_css_circbuf_elem_get_val(ia_css_circbuf_elem_t *elem);
-
-/**********************************************************************
- *
- * Non-inline functions.
- *
- **********************************************************************/
-/*
- * @brief Create the circular buffer.
- * Refer to "ia_css_circbuf.h" for details.
- */
-void
-ia_css_circbuf_create(ia_css_circbuf_t *cb,
-		      ia_css_circbuf_elem_t *elems,
-		      ia_css_circbuf_desc_t *desc)
-{
-	u32 i;
-
-	OP___assert(desc);
-
-	cb->desc = desc;
-	/* Initialize to defaults */
-	cb->desc->start = 0;
-	cb->desc->end = 0;
-	cb->desc->step = 0;
-
-	for (i = 0; i < cb->desc->size; i++)
-		ia_css_circbuf_elem_init(&elems[i]);
-
-	cb->elems = elems;
-}
-
-/*
- * @brief Destroy the circular buffer.
- * Refer to "ia_css_circbuf.h" for details.
- */
-void ia_css_circbuf_destroy(ia_css_circbuf_t *cb)
-{
-	cb->desc = NULL;
-
-	cb->elems = NULL;
-}
-
-/*
- * @brief Pop a value out of the circular buffer.
- * Refer to "ia_css_circbuf.h" for details.
- */
-uint32_t ia_css_circbuf_pop(ia_css_circbuf_t *cb)
-{
-	u32 ret;
-	ia_css_circbuf_elem_t elem;
-
-	assert(!ia_css_circbuf_is_empty(cb));
-
-	/* read an element from the buffer */
-	elem = ia_css_circbuf_read(cb);
-	ret = ia_css_circbuf_elem_get_val(&elem);
-	return ret;
-}
-
-/*
- * @brief Extract a value out of the circular buffer.
- * Refer to "ia_css_circbuf.h" for details.
- */
-uint32_t ia_css_circbuf_extract(ia_css_circbuf_t *cb, int offset)
-{
-	int max_offset;
-	u32 val;
-	u32 pos;
-	u32 src_pos;
-	u32 dest_pos;
-
-	/* get the maximum offset */
-	max_offset = ia_css_circbuf_get_offset(cb, cb->desc->start, cb->desc->end);
-	max_offset--;
-
-	/*
-	 * Step 1: When the target element is at the "start" position.
-	 */
-	if (offset == 0) {
-		val = ia_css_circbuf_pop(cb);
-		return val;
-	}
-
-	/*
-	 * Step 2: When the target element is out of the range.
-	 */
-	if (offset > max_offset) {
-		val = 0;
-		return val;
-	}
-
-	/*
-	 * Step 3: When the target element is between the "start" and
-	 * "end" position.
-	 */
-	/* get the position of the target element */
-	pos = ia_css_circbuf_get_pos_at_offset(cb, cb->desc->start, offset);
-
-	/* get the value from the target element */
-	val = ia_css_circbuf_elem_get_val(&cb->elems[pos]);
-
-	/* shift the elements */
-	src_pos = ia_css_circbuf_get_pos_at_offset(cb, pos, -1);
-	dest_pos = pos;
-	ia_css_circbuf_shift_chunk(cb, src_pos, dest_pos);
-
-	return val;
-}
-
-/*
- * @brief Peek an element from the circular buffer.
- * Refer to "ia_css_circbuf.h" for details.
- */
-uint32_t ia_css_circbuf_peek(ia_css_circbuf_t *cb, int offset)
-{
-	int pos;
-
-	pos = ia_css_circbuf_get_pos_at_offset(cb, cb->desc->end, offset);
-
-	/* get the value at the position */
-	return cb->elems[pos].val;
-}
-
-/*
- * @brief Get the value of an element from the circular buffer.
- * Refer to "ia_css_circbuf.h" for details.
- */
-uint32_t ia_css_circbuf_peek_from_start(ia_css_circbuf_t *cb, int offset)
-{
-	int pos;
-
-	pos = ia_css_circbuf_get_pos_at_offset(cb, cb->desc->start, offset);
-
-	/* get the value at the position */
-	return cb->elems[pos].val;
-}
-
-/* @brief increase size of a circular buffer.
- * Use 'CAUTION' before using this function. This was added to
- * support / fix issue with increasing size for tagger only
- * Please refer to "ia_css_circbuf.h" for details.
- */
-bool ia_css_circbuf_increase_size(
-    ia_css_circbuf_t *cb,
-    unsigned int sz_delta,
-    ia_css_circbuf_elem_t *elems)
-{
-	u8 curr_size;
-	u8 curr_end;
-	unsigned int i;
-
-	if (!cb || sz_delta == 0)
-		return false;
-
-	curr_size = cb->desc->size;
-	curr_end = cb->desc->end;
-	/* We assume cb was pre defined as global to allow
-	 * increase in size */
-	/* FM: are we sure this cannot cause size to become too big? */
-	if (((uint8_t)(cb->desc->size + (uint8_t)sz_delta) > cb->desc->size) &&
-	    ((uint8_t)sz_delta == sz_delta))
-		cb->desc->size += (uint8_t)sz_delta;
-	else
-		return false; /* overflow in size */
-
-	/* If elems are passed update them else we assume its been taken
-	 * care before calling this function */
-	if (elems) {
-		/* cb element array size will not be increased dynamically,
-		 * but pointers to new elements can be added at the end
-		 * of existing pre defined cb element array of
-		 * size >= new size if not already added */
-		for (i = curr_size; i <  cb->desc->size; i++)
-			cb->elems[i] = elems[i - curr_size];
-	}
-	/* Fix Start / End */
-	if (curr_end < cb->desc->start) {
-		if (curr_end == 0) {
-			/* Easily fix End */
-			cb->desc->end = curr_size;
-		} else {
-			/* Move elements and fix Start*/
-			ia_css_circbuf_shift_chunk(cb,
-						   curr_size - 1,
-						   curr_size + sz_delta - 1);
-		}
-	}
-
-	return true;
-}
-
-/****************************************************************
- *
- * Inline functions.
- *
- ****************************************************************/
-/*
- * @brief Get the "val" field in the element.
- * Refer to "Forward declarations" for details.
- */
-static inline uint32_t
-ia_css_circbuf_elem_get_val(ia_css_circbuf_elem_t *elem)
-{
-	return elem->val;
-}
-
-/*
- * @brief Read the oldest element from the circular buffer.
- * Refer to "Forward declarations" for details.
- */
-static inline ia_css_circbuf_elem_t
-ia_css_circbuf_read(ia_css_circbuf_t *cb)
-{
-	ia_css_circbuf_elem_t elem;
-
-	/* get the element from the target position */
-	elem = cb->elems[cb->desc->start];
-
-	/* clear the target position */
-	ia_css_circbuf_elem_init(&cb->elems[cb->desc->start]);
-
-	/* adjust the "start" position */
-	cb->desc->start = ia_css_circbuf_get_pos_at_offset(cb, cb->desc->start, 1);
-	return elem;
-}
-
-/*
- * @brief Shift a chunk of elements in the circular buffer.
- * Refer to "Forward declarations" for details.
- */
-static inline void
-ia_css_circbuf_shift_chunk(ia_css_circbuf_t *cb,
-			   u32 chunk_src, uint32_t chunk_dest)
-{
-	int chunk_offset;
-	int chunk_sz;
-	int i;
-
-	/* get the chunk offset and size */
-	chunk_offset = ia_css_circbuf_get_offset(cb,
-		       chunk_src, chunk_dest);
-	chunk_sz = ia_css_circbuf_get_offset(cb, cb->desc->start, chunk_src) + 1;
-
-	/* shift each element to its terminal position */
-	for (i = 0; i < chunk_sz; i++) {
-		/* copy the element from the source to the destination */
-		ia_css_circbuf_elem_cpy(&cb->elems[chunk_src],
-					&cb->elems[chunk_dest]);
-
-		/* clear the source position */
-		ia_css_circbuf_elem_init(&cb->elems[chunk_src]);
-
-		/* adjust the source/terminal positions */
-		chunk_src = ia_css_circbuf_get_pos_at_offset(cb, chunk_src, -1);
-		chunk_dest = ia_css_circbuf_get_pos_at_offset(cb, chunk_dest, -1);
-	}
-
-	/* adjust the index "start" */
-	cb->desc->start = ia_css_circbuf_get_pos_at_offset(cb, cb->desc->start,
-			  chunk_offset);
-}
-- 
2.43.0

