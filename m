Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021193D5C2C
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 23:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791846563; cv=none; b=F4s5/e2Wi3qTrOc7RtrGKdNctst2Gilu70Ftq4EMPEjtmRVDQl2kx0w+KFLBGYVV1l9iji2aqiVmVEJGe6mgwVLN+yct9pOvx8wbAvJfLeeZhq+Y1a3Bglk/6hl4eotYLBQhlTnWnWjjIFIMjsCYdNz2ti6h871qRbpA6Dk25lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791846563; c=relaxed/simple;
	bh=87A+n+2qZBXK0LZ+SkceXjhIxwoXBqSLWuo4IWUrdxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mKMflCwjTZaCKT7bRUnBjdxmdoSXXMv9pjdXvlFUReHi6lDsFujTTrE5GNrpoMeFZpdWjUfiHTiOa7OHdPTBM4IRlXEuCmZTOJG4DKChLC8JEY1mFm3qFznK+5e67veisKHNrKSotYN7Lf1WpDPTHvuEhDmLNNpd3/CXGEKzva8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EECqPHGp; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EECqPHGp"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso1293332f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791846557; x=1792451357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IMt3C1jIAhHc5oHtlSYT72cX2NqtqfHFPyj+vuNUYdY=;
        b=EECqPHGpdkGvfjf5WnlsnwOU5v7grj7dxVJvZBAK9Qq3HWZSH/WAjCJ2e5HA9xEQHL
         p3yLS4b2G+DauL8oWnLts5BO1BZqykFkpte0uTkyDGWk2MNZzfxRutKsqH5t3P7AqCV7
         HYSJ5Z8XeMrknuC8FB+PTMOtctBUZpDVdxjQ+mJTmtIxRx2i6T7LCuDyOKJwaAlLahNi
         RtR3LeRqbiyU82AczoCNLM6xoUOkn0D9E2U3ByteMik2AaVDLi+FU/K/J9JI4PIeM0vg
         2YxRViiDVdkRSZg8/+0nPGKqrnLKer99tqnxeP9Hq4ErE27cU+ICCJV6lsrHMi6or8PY
         3ICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791846557; x=1792451357;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IMt3C1jIAhHc5oHtlSYT72cX2NqtqfHFPyj+vuNUYdY=;
        b=hnWkJKXfj+y9n7J/IR8drYEeWhSOoDgE3BDTyC0a/4ZItlGEYM1hM3pcYFJyUfkJWx
         MwF42SjM0YBkKr0uXz4cuMzT7drVy9bvKwzaH8IpHd174kFi+ImCVwQGLkQdIrBP2mKB
         Ag9Tgvy6tTHJ1Ocnki20V711IyX5Du2W5cjNditKkrZ6nZmtKteHhyULujvnGOjMyoye
         f7mtVuuM+fcA166/p7zaE9nlF9qGvr+wbrtcvx9ubxx32E6NiBRDJfRJnKET2EvTYkN8
         +EN2vYGSPiGHCHetelVKlew8NEAcJkKwYfdyua8p2ezhisWUnAzWSup9xrHvHvDK9oPA
         eYEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzWSNDrOa91u2Ib5K07faHfoUiVSanUe6P4efunK8yoA3YRjYdOsYlaoij6twscK07pZ8w5ex/qhhsKtI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGfvRfttA+aPs0CAli6E/I+Y77PHa44G2aPIkBo1tc+9VkvYoW
	qcCR1y2Tdwsi0IOR3YvjdC2k3jAp/XGlvbw3B4Oq5f1l9c+chynyOHjr
X-Gm-Gg: AYBFou31sAJmmPZRovoKcSuHxWlYAl7TlOn7FUAfjuMdEfo2zNYepkJO/rfyT4vLgui
	N34bTBWuCQwMRQhnW+f4eOMbXcKPKli2QpsIEFu+K+fTXdfCoX6dDcU8+7NdE3GAtlyst/03Bph
	ExHf4s2x4QVA2fjzCtgpTv1vfS2q4xqDvHAAYAiHoAtslr7eQXcja9ZrkSfVKriushH2PxCq7+f
	GBzeQWtY9jFlikJT+KHDDAP3yHRBE2QnvIcaPxAmuD24O32Rhc6DOWWyNWTlg9Kf3BQ1FNR5x3E
	9AfvfnX9xeVtpA+IO2CQzQgPc8uoYbmW4W4esLwLGt6DTlNWNwMBmfvxWYNurdpB09xTl4KGHbg
	P34BTZ/ZzvMWcdrQ1hIlw1vc4/FHWpXnQSqa2xBnCID6xTxU8TE/nivO+9ki8gvRnou7L+fJk31
	TLtdnj+ePy9HxYGb5/wlnMo3PyPAdTfNpA7rTpmhD4YLaqNgfxAzgCxs5lyF2JD5Yg6kPdCh6pe
	a6Rdfg5gwpT3Jw3PxusSqvOnhUWZwR1eg==
X-Received: by 2002:a05:6000:2889:b0:48b:a6:61b0 with SMTP id ffacd0b85a97d-48dbacef827mr19790600f8f.47.1791846556960;
        Mon, 12 Oct 2026 16:09:16 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaa9f9sm1873928f8f.19.2026.10.12.16.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 16:09:16 -0700 (PDT)
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
Subject: [PATCH 3/4] media: atomisp: queue: move circbuf types and helpers to queue_comm.h
Date: Mon, 12 Oct 2026 23:07:52 +0000
Message-ID: <20261012230754.1914517-4-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012230754.1914517-1-vladurares@gmail.com>
References: <20261012230754.1914517-1-vladurares@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The remote queue code only needs the circbuf descriptor and element
layouts plus five small descriptor helpers from the circbuf library.
Move them into ia_css_queue_comm.h and include that header instead of
the circbuf ones.

The descriptor and element layouts are shared with the SP firmware and
are moved unchanged, including their static_asserts.

While at it, drop the OP___assert() NULL checks from the moved helpers:
every caller passes the address of a local variable, so the pointer can
never be NULL.

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
---
 .../queue/interface/ia_css_queue_comm.h       | 138 +++++++++++++++++-
 .../atomisp/pci/runtime/queue/src/queue.c     |   2 -
 .../pci/runtime/queue/src/queue_access.c      |   1 -
 .../pci/runtime/queue/src/queue_access.h      |   1 -
 .../media/atomisp/pci/sh_css_internal.h       |   2 +-
 5 files changed, 138 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue_comm.h b/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue_comm.h
index 14f2c8de3b910..a18373608169a 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue_comm.h
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue_comm.h
@@ -7,8 +7,144 @@
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
+#define SIZE_OF_IA_CSS_CIRCBUF_DESC_S_STRUCT				\
+	(4 * sizeof(uint8_t))
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
+#define SIZE_OF_IA_CSS_CIRCBUF_ELEM_S_STRUCT				\
+	(sizeof(uint32_t))
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
+static inline bool ia_css_circbuf_desc_is_empty(
+    ia_css_circbuf_desc_t *cb_desc)
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
+static inline bool ia_css_circbuf_desc_is_full(
+    ia_css_circbuf_desc_t *cb_desc)
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
+static inline int ia_css_circbuf_desc_get_offset(
+    ia_css_circbuf_desc_t *cb_desc,
+    u32 src_pos,
+    uint32_t dest_pos)
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
+static inline uint32_t ia_css_circbuf_desc_get_num_elems(
+    ia_css_circbuf_desc_t *cb_desc)
+{
+	int num;
+
+	num = ia_css_circbuf_desc_get_offset(cb_desc,
+					     cb_desc->start,
+					     cb_desc->end);
+
+	return (uint32_t)num;
+}
+
+/*
+ * @brief Get the number of free elements.
+ *
+ * @param cb_desc The pointer to the circular buffer descriptor.
+ *
+ * @return: The number of free elements.
+ */
+static inline uint32_t ia_css_circbuf_desc_get_free_elems(
+    ia_css_circbuf_desc_t *cb_desc)
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
index e4dacc812931d..ac71330c7d7ff 100644
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
index 5319818872626..afc0801af509e 100644
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

