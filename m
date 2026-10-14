Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD4143CEF8
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976363; cv=none; b=DkueLoiQqKDI9sGuA1SLZVhl/snHIBcIHjbNz/r/IikcwLXP96N1NkVoYUel1JPGoYQOdgl1RglfykWNJNgdK68iMUWGX3/JlyQ/uPFi5V7MZlwcn+IjVXtSTynpBa5aOsVH+MsJJ8DjklqbVDB96vHw/IH1Uf4Qhw6BtR27DrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976363; c=relaxed/simple;
	bh=Ggq3Uy/XaqA2vSX4D20ALhGnBHxCMCe5R5neJ3oJ4ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KEL/nvnlEEXBI6ZZ43JLFLGHOM7xZyO76yT1eaoTmwSoJj0LKB/iY2avntkCx2NZQhCxmloy62o31lncZ/FWFdOYNqdmx8MJnvWbFs6K5wy5xGI0bJ2tQnmxKpw7vySngWBlq6Lhg3BpwXsigIi6C3PD1jH3pkLfDGB7LadZbj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cF1dbyKp; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cF1dbyKp"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-486e8faff03so1720395f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791976356; x=1792581156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ql/VTrEuXaadEBjKgJVl5o63RIe6hsZ90eJUJtNqjG0=;
        b=cF1dbyKpE7rVMk3hNjMCqvS1sfYpg9hcEf8a5ovCYar+UzD+KSH+8kS5lnVN/ITICT
         u+Kt60tLUCu6xseIFPW5b3YHO+/cu3snfA2vqaZML7D4ztR7BEYZts24liXCL3kLkyB7
         xo3PMPDqZHZAjZNHdNpHw6AeG3saDjtqYszORkLEXT7LGTxt5NJHh/kuyAr3bBtz8btT
         4X7vC15/1ukp/tM2VYPJ6Nqr8zVFVuTS/4pJjtDCqmZ9bBlf0Z8VE3IV6Hj50cnYGQIq
         DL/HPzdklCh9Nf7xjT+rdDvOuSHiEGd52pH6PJtqbCT+6t5+7Sj6jkxqyDPfcUiuUMY5
         ZUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791976356; x=1792581156;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ql/VTrEuXaadEBjKgJVl5o63RIe6hsZ90eJUJtNqjG0=;
        b=riFf5vr/sgIRhZkbGUtH0ggZWHjUX/lgp9JrEwREYuzS0LUbExdKIFwhUe+zcOwh23
         NON8H+Om4SHf6TlBqNo1a9uz+P84rBBlHXEnfi8SxLwUga3MCFKwu12QpHHh4lh/vnlj
         pG1ARwhKhVfXcurbP+C2zfMA2ybswhFmATfs4EaJ+Ptndo8FctDPLOLAXo//puwkzc2F
         QdC4XLTSrCNgnmE+eZToapOuQ3mPUaNB6kS/LIl6M3ha3BsvjKk7EDD0si1hu8K7Eddi
         Q1pzli8F6Y2Bzt9WDOzMm9CA/umq3e/dJbamSkv0r/I60swNeZsyQBWuPf6H2DzdOaPq
         3rnQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9UdNqlTt0TSVNgqBPN2SN5BnuCKdWg77L05HIdiSTEVF4rw5y4+9h96b5O/fSH4lWccgiXzdzm6//CRY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdzSd9ZRZbwE6JqOhY29M99fT3HaobBHKwXbaVei5kzJIR4gZw
	bm+/EBMHXENRG2xDw2YaroqTlndiJUi0v6SEAoopYLHVZgS+6OZir3vK
X-Gm-Gg: AYBFou347TmZTfdkKbkLOh0Vy+v2jKAFhVJpJUoAULR8MhVCDn9/hAmUiUWScklOs1e
	lIiwbkwN+GITZgdu3pz9co4snDBEinOGodrlADk4/DDE9PmNMq72s5APfpufv+kLa1dB/0KkXFm
	SDEJXUHvGcR/9Y7qC3TaE2svlm30Yfi4N6wwD/R570TtRqGtopVTebbyJ6O5WiodzH3I21nV+Yw
	u0sFcdYJKuSHdhjv270r+TtD4d9jbQJ+PdQghxs3+ER9ZS48/UmeCiUKdI0gd+qHZSNpCyEhzQ+
	LTCCypQu2EsQ2I6qorryY/xRvU8+dRjwy4ywv9C14iaaX8iM7GpkZNNwBOG6p/4+tiqCkTP41vx
	cxL99r5BfEnfSmQiqC9R2wGG77QAOy2gSww9e8iG5uxxvXe8yo8guxrfOIku4My9N6da5e/cneU
	1nLEOALaUurfqoRomQMNhp/LUqytEDElAggiDxNa9gMLDJR9M7nyh/srVGZSyjrVBWMNDSjqSXf
	7R3DgGTVKA5IYRs5/9RZA==
X-Received: by 2002:a05:6000:400e:b0:48d:ea67:79d4 with SMTP id ffacd0b85a97d-48dea677b9amr2949917f8f.53.1791976355895;
        Wed, 14 Oct 2026 04:12:35 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48deeadc0b5sm1846481f8f.6.2026.10.14.04.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:12:35 -0700 (PDT)
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
Subject: [PATCH v2 3/4] media: atomisp: queue: move circbuf types and helpers to queue_comm.h
Date: Wed, 14 Oct 2026 11:12:12 +0000
Message-ID: <20261014111213.1967452-4-vladurares@gmail.com>
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
index d3818fe8be364..79a67b3c614eb 100644
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

