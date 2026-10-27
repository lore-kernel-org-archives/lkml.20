Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142518;
	b=Ypf0+BMtjsCD3fUtTnwzqx4pjc64U+6ZUS02H0DZKmM8CxfMa3RsZvqWnBoNojTl5GMI
	 YCSk8bJcFJBsIe3XUq7hzt71dtODSkvp2tt30aG6LsLleOqicmVG2P+W6evzNViR78BGM
	 SXoVzcOJHl3Vpwk3opkMec9nRJ7VYbWLL1vbiDh4QOgduASjCXl7HdfLROD88yfGu2X85
	 qXjXEQ3ZHG6z1rWrMpX2c/a93lAbL5aqG2zs69iqSgDuJ4Hz8OHxjyXnFwKt1wXMIN2dh
	 PlM6Kvb8GZ2UTEOZTB++B0nrIatkKXqChGsstNFZbqfSgv4Z9TAOv3jNq3g3JOfs/+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142518;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=COW4Sty1k46g+o3iTAbh7/aAOvozPxbum42w7fwKbM0=;
	b=f7kNnyGB6cTQX3BqBBQm2FiFqkHh6qWbX6fiN66D9W5EUcz3lcMMx4yF0+9EmCmlL1ym
	 fVArngo8d09fo8wrZmG1g6IG7kG0mbygvJ+FopFMwfy2U6w54WwO4NMxvsWTk3CZ9P0pN
	 FTiuoNZuRLb2W4gPRYm2Rz8Jz8RJZ0JxzIOCs9XnvGuM+BrHB3mOvlhic1BOmnYumkb7z
	 NhoMhjpmBWEysNHuN3acHKo4j9Wkop2PWlz0hJTOz6vM1eOAtaSc1G9RGQYld7kZPUjDw
	 4csfheZL1smyk3PHURLoO3ixWJdxBJ+/aALLSh+RnyR9bA0L5PgGbsrM5xaZUbbFafQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XBHxXBs2;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E75C606A332
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E75C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XBHxXBs2
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso3686365e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793142512; x=1793747312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=COW4Sty1k46g+o3iTAbh7/aAOvozPxbum42w7fwKbM0=;
        b=XBHxXBs2M2K0DPA+AMbUz21DvKRIZsMDmhq+QykviA2ymOkLAJE5xK4qf4cgqBiOQt
         9nMl5qljZo7o9u9X2f2oFTB1lrNnTSer8YFUap8nAUeybpXXAE11E8gFhyn4I4d8Mw7/
         mf8g6Lk/xabZ9TFhG2fGpnYf61xDmTwe6SK8CneEi7TO7z1OuZntzoqQo6OlDCwWdrd6
         osHstGBS3wFFkl+rUVBZmYSF0p9N1YOa047HhGbpEqA3G+oQXiz3EV51CCtSPEFO6FLY
         SNR5mD3A5Fasmr18CMSsKmWXOGeFXJj3+21G5GtammpBIIlfNvkKv3qF6xtW81MojJiM
         3GMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142512; x=1793747312;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=COW4Sty1k46g+o3iTAbh7/aAOvozPxbum42w7fwKbM0=;
        b=KY3EaE3KRFt0H0ej2Yvz0S8lW2AaVWTx7AaI/1TOZ3dkF5lHV331Vw13DdzjYc5M0u
         H5hY7Tur/lvP1auuRbpbCdok83/eCxfrDjKLe9GMAcjibvh/CDXMOieUvN3Yd5R6xwne
         FPcaCDLI/DaapfQQF4DJ7sel1gIBzil0S16Gywt3WcY9LbUf1zYs5xp+VaCdImSLCmD1
         D6PBM2/ELyhILZyxPDMlyIpsWtdeUDvEBfeW/J7d1o/A3fmos54xRZaSekLtNJGcsHvm
         jkggfpkiZ8smhtwX1xpLgyGTDHQEcqiv9qbU+SjLc0TCRgHx53cm5fwK7Qr+mr5k8Ini
         jS7w==
X-Forwarded-Encrypted: i=1; AKwUvBxaEvPHvkwoohleZE7wA2EtXvHDrhjGZYaqj1Iz70eM/V9Sc7AhW8Fuwj4HDlBYAjbkNTw5DZ1VKfDtYKw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOSzA2YN3b+yQKjeXvWD95k8UUEuyzJ5aiZy/Zo0AcW6bEcK7J
	dRI62lqVuNg3dpgfBtT7h2p0r3ROiSw2p+HUDRjmOg5AzXzmGgam1X2H
X-Gm-Gg: AYBFou0A4iSHIfwnFRMiZN9GUkPw6QjRkIS15o3CWgVGi/okEVDNfd9HwhPonHiz+TW
	zNOTMTgknfKuiFijQKQYBPdEOV710Nq/lV5fiHtWkJs6QgF92DdM4rT/GRIOq9LFxuK0lfs0n/L
	3rzJF/2RBy8uS4L08QvZaSV3jdUVKcupNFuk6jbrnNyoED/u5/GNLeCMcn7hZv355bg+6BVVHc8
	1kkCYeX8Sek2g4F7JNj0OMdijTx4x1z6HcJEICXJjRem4FwIL5QGzrAgpNO0O4Ydk02sjZv1zZR
	5J3ZmjQnvKK5lc3qb9r/HbYQBfSKitUGSIodDDJLC/CjisIqHTR6kyr4rgRxRfYSH2kwgQXMCue
	Lchh1P//0GU0I1AypQlQ8/gzZQ9Y1H/9HoayrjgOn1xeIm7oQxh5Ru2RooLHvf+4G0irJNA9APU
	8qqvdgke+oTX0ajhgX2EdG9pLT1hAQP94YQ0OSpkbRqXm94e64+E7XvN2IYvCepPG56tuySYzcS
	0BdfoirG2Mb74y87KFDEge+QD5N5HvY6iCAw9v48vD+TLAnEh0lddfZaPehTZ4anXyfp1va0oxs
	V3I=
X-Received: by 2002:a05:600c:83ca:b0:4a2:150f:1610 with SMTP id 5b1f17b1804b1-4a9672030admr8831385e9.23.1793142511988;
        Tue, 27 Oct 2026 16:08:31 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97cebf858sm3407595e9.12.2026.10.27.16.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:08:31 -0700 (PDT)
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
Subject: [PATCH v4 4/5] media: atomisp: queue: move circbuf types and helpers to queue_comm.h
Date: Tue, 27 Oct 2026 23:08:06 +0000
Message-ID: <20261027230807.2407261-5-vladurares@gmail.com>
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

The remote queue code only needs the circbuf descriptor and element
layouts plus five small descriptor helpers from the circbuf library.
Move them into ia_css_queue_comm.h and include that header instead of
the circbuf ones.

The descriptor and element layouts are shared with the SP firmware and
are moved unchanged, including their static_asserts.

While at it, drop the OP___assert() NULL checks from the moved helpers,
as every caller passes the address of a local variable, and convert the
moved code to the kernel u8/u32 types and the usual function
declaration style.

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 .../queue/interface/ia_css_queue_comm.h       | 130 +++++++++++++++++-
 .../atomisp/pci/runtime/queue/src/queue.c     |   2 -
 .../pci/runtime/queue/src/queue_access.c      |   1 -
 .../pci/runtime/queue/src/queue_access.h      |   1 -
 .../media/atomisp/pci/sh_css_internal.h       |   2 +-
 5 files changed, 130 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue_comm.h b/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue_comm.h
index 7cd788e2b16bd..8323347bea6b4 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue_comm.h
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue_comm.h
@@ -7,8 +7,136 @@
 #ifndef __IA_CSS_QUEUE_COMM_H
 #define __IA_CSS_QUEUE_COMM_H
 
+#include <linux/build_bug.h>
+#include <linux/types.h>
+
 #include "type_support.h"
-#include "ia_css_circbuf.h"
+
+/****************************************************************
+ *
+ * Portable Data structures
+ *
+ ****************************************************************/
+/*
+ * @brief Data structure for the circular descriptor.
+ */
+typedef struct ia_css_circbuf_desc_s ia_css_circbuf_desc_t;
+struct ia_css_circbuf_desc_s {
+	u8 size;	/* the maximum number of elements*/
+	u8 step;   /* number of bytes per element */
+	u8 start;	/* index of the oldest element */
+	u8 end;	/* index at which to write the new element */
+};
+
+#define SIZE_OF_IA_CSS_CIRCBUF_DESC_S_STRUCT	(4 * sizeof(u8))
+
+static_assert(sizeof(struct ia_css_circbuf_desc_s) == SIZE_OF_IA_CSS_CIRCBUF_DESC_S_STRUCT);
+
+/*
+ * @brief Data structure for the circular buffer element.
+ */
+typedef struct ia_css_circbuf_elem_s ia_css_circbuf_elem_t;
+struct ia_css_circbuf_elem_s {
+	u32 val;	/* the value stored in the element */
+};
+
+#define SIZE_OF_IA_CSS_CIRCBUF_ELEM_S_STRUCT	(sizeof(u32))
+
+static_assert(sizeof(struct ia_css_circbuf_elem_s) == SIZE_OF_IA_CSS_CIRCBUF_ELEM_S_STRUCT);
+
+/****************************************************************
+ *
+ * Inline functions.
+ *
+ ****************************************************************/
+/*
+ * @brief Test if the circular buffer is empty.
+ *
+ * @param cb_desc The pointer to the circular buffer descriptor.
+ *
+ * @return
+ *	- true when it is empty.
+ *	- false when it is not empty.
+ */
+static inline bool ia_css_circbuf_desc_is_empty(ia_css_circbuf_desc_t *cb_desc)
+{
+	return (cb_desc->end == cb_desc->start);
+}
+
+/*
+ * @brief Test if the circular buffer descriptor is full.
+ *
+ * @param cb_desc	The pointer to the circular buffer
+ *			descriptor.
+ *
+ * @return
+ *	- true when it is full.
+ *	- false when it is not full.
+ */
+static inline bool ia_css_circbuf_desc_is_full(ia_css_circbuf_desc_t *cb_desc)
+{
+	return ((cb_desc->end + 1) % cb_desc->size) == cb_desc->start;
+}
+
+/*
+ * @brief Get the offset between two positions in the circular buffer
+ * descriptor.
+ * Get the offset from the source position to the terminal position,
+ * along the direction in which the new elements come in.
+ *
+ * @param cb_desc	The pointer to the circular buffer descriptor.
+ * @param src_pos	The source position.
+ * @param dest_pos	The terminal position.
+ *
+ * @return the offset.
+ */
+static inline int ia_css_circbuf_desc_get_offset(ia_css_circbuf_desc_t *cb_desc,
+						 u32 src_pos, u32 dest_pos)
+{
+	int offset;
+
+	offset = (int)(dest_pos - src_pos);
+	offset += (offset < 0) ? cb_desc->size : 0;
+
+	return offset;
+}
+
+/*
+ * @brief Get the number of available elements.
+ *
+ * @param cb_desc The pointer to the circular buffer.
+ *
+ * @return The number of available elements.
+ */
+static inline u32 ia_css_circbuf_desc_get_num_elems(ia_css_circbuf_desc_t *cb_desc)
+{
+	int num;
+
+	num = ia_css_circbuf_desc_get_offset(cb_desc,
+					     cb_desc->start,
+					     cb_desc->end);
+
+	return (u32)num;
+}
+
+/*
+ * @brief Get the number of free elements.
+ *
+ * @param cb_desc The pointer to the circular buffer descriptor.
+ *
+ * @return: The number of free elements.
+ */
+static inline u32 ia_css_circbuf_desc_get_free_elems(ia_css_circbuf_desc_t *cb_desc)
+{
+	u32 num;
+
+	num = ia_css_circbuf_desc_get_offset(cb_desc,
+					     cb_desc->start,
+					     cb_desc->end);
+
+	return (cb_desc->size - num);
+}
+
 /*****************************************************************************
  * Queue Public Data Structures
  *****************************************************************************/
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
index 6747696595eab..47300af8e5c05 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
@@ -6,8 +6,6 @@
 
 #include "ia_css_queue.h"
 #include <math_support.h>
-#include <ia_css_circbuf.h>
-#include <ia_css_circbuf_desc.h>
 #include "queue_access.h"
 
 /*****************************************************************************
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c
index 2591d157870ce..65835420a13c0 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c
@@ -8,7 +8,6 @@
 
 #include "type_support.h"
 #include "queue_access.h"
-#include "ia_css_circbuf.h"
 #include "sp.h"
 #include "assert_support.h"
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
index 776c6d6cb1fcc..93dae469cff9a 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
@@ -11,7 +11,6 @@
 
 #include <type_support.h>
 #include <ia_css_queue_comm.h>
-#include <ia_css_circbuf.h>
 
 #define QUEUE_IGNORE_START_FLAG	0x0001
 #define QUEUE_IGNORE_END_FLAG	0x0002
diff --git a/drivers/staging/media/atomisp/pci/sh_css_internal.h b/drivers/staging/media/atomisp/pci/sh_css_internal.h
index ec68c16d42722..f08f918b361c4 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_internal.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_internal.h
@@ -29,7 +29,7 @@
 #include "sh_css_defs.h"
 #include "sh_css_uds.h"
 #include "dma.h"	/* N_DMA_CHANNEL_ID */
-#include "ia_css_circbuf_comm.h" /* Circular buffer */
+#include "ia_css_queue_comm.h"
 #include "ia_css_frame_comm.h"
 #include "ia_css_3a.h"
 #include "ia_css_dvs.h"
-- 
2.43.0

