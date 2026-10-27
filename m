Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102644;
	b=H8iwWxLeR7VZZK0vwi57TkbqoJO9QhciKI1gCqlOHyu5yyi/3Zps5ORj/2yfeXBeX9mI
	 gl9uMWKA8/jdlD9F2CZB4O1vaOnZtCOrq/l8kGdQOr7kpCOGNPSxm0CIfnaqJURaurqFa
	 37aEkTTDy+0K8zTF8WWLOLsR1YbhOhh3i6ME3a5mxN1YThHhrazGvDX+YaQthAPl1KD9c
	 UKMjLd/Cyhk/KjzxsYiqEn4XKOPsghQ+38WXvjkbr/c/CGMfG6pF3njZj0pucxSIL9hHg
	 HhuvdM8SGsHlGS/Gjk4ksqRPM9dQ0DS6weKCSg+aVrrlZTrQdvk69PXGZ6+ch1QlXqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Ql/VTrEuXaadEBjKgJVl5o63RIe6hsZ90eJUJtNqjG0=;
	b=Prya1EgHUkbRJrLo9RHp/aFTCGaTUSmDkQgpYIYGn9UW8jf1u7v4mCcVwIc+2nx3ZV8f
	 wx7mnwvCVcLHI+vkKRrVwp2OyDkC+dWDNMkLkDfsI1uCY/ZRdEqeA5jJhBhIXHyUyA/QN
	 c5kVLCTsEj3AdEQ8rCFj4yAI7NUJPdlP15qDFFcp1mdg8OrT1Jh/G4ssyg/7q7r4PoIlE
	 C/ToDVUtOWwjZh+MAi9gGYtoJHxKMWV8UNrppRWADkjFMuzUbpj2W2X610ogVyEMOloEd
	 z4nmX7bSCFsdOMNz7iSqUilGFbytkXCiTGFAp34kaN5L98XTXrPWf/2kzoxuZxb3Bjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lJlnUvvz;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468CE606C953
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 468CE606C953
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lJlnUvvz
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so35299065e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102642; x=1793707442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ql/VTrEuXaadEBjKgJVl5o63RIe6hsZ90eJUJtNqjG0=;
        b=lJlnUvvzn+MSOu17LCKxPJJtFIT6L9SvmVZA/HiR3rjdkofP1BrvIk27JyCOVFYEGt
         u6JccyIEEAdt5rQ+GkyKgLmnt7P5lK99iL3CPHzKgY7qKXM9m10KWzkfiKjAyvptiK+W
         Xm7ohoV1XjthA8BNcWk+4+8oTPZh0KDtoyM8QgLr6oBPF1QUWv/X6N6IW8oOjAgQJo9z
         6SHt0Ak5l+VRBkPt5PT9jhoJA5fnI804DaHxmkU8IuDv52nACXSRUpUvOfgmFt4sCnjh
         LiPZjykx+s/nsIoo1h6+blBDAlx1bxZTqnGLlOxt4RGJxUaquBYXCbNfNHt+RKgVWNOQ
         97dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102642; x=1793707442;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ql/VTrEuXaadEBjKgJVl5o63RIe6hsZ90eJUJtNqjG0=;
        b=aZxv8/avwvXhPhkd80MglaF8yGRhLzfe6pbj0I5pQ91XKBd0xTDZFIua3wL1JWH0nI
         XnMWzQ/s/BSsADY3o/e7k3kwbn/36FMzjilnfYwz1AzZ/5eL6pQgEaHjZ69WeomUH/HL
         NGqkCbytagYTIOL8i98KECJCRRtk7QL4Zb5kef6Z9fEjS5OInsCAPJ6e/qmaqBYfR0oy
         zcL3jnLRFi3311k5Of0kcVgefVWMn8PU4KleslFFWZZaVXDCH03BEUGs3nFcWAJMO9N6
         v9IL/Nq9J7wQ59D9SWqS6lgZfoWgE+33LsEDOUmH/dP6J+FhdKquSRmw8Sr/i4jBKiF0
         tsqg==
X-Forwarded-Encrypted: i=1; AKwUvBzt4rP9wJ21lfL4zwRi0c3vPrqYHCAoBFwY6d2eMLeQ2vscMupV3pZcrL1dxU4xG1Z2l7UEivZmWgCczUU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVjWlEZX6CXThcVFtw35JAftXl5nUj/NeM83E8q1V0PLk+smo9
	yOlbVmBNtkCfFGk0vPraIWp5quuMs2YaBwx4Oo0wsQMDBRYjHpRHr0cQ
X-Gm-Gg: AYBFou0ZJ+FMnVmWqveAfreFLiHQFt9Cgu+L4kW8DZu5zScguFjdKfPJVI/iXlqxIel
	ECubkaEr/WBscE2PtJXZVjbNZjC+mkCxkHwfPBLyv/Xke9zpGgPw3eDBP2r2WR32bxbW+SlQodW
	qoZqSfynv4YZpFq2cSGVHWhNzWZQI4yv9hZSVZJnez74/+KdDwVDcam4LFfYa/IFemtSn3+CTys
	U87hUrkZ7Vm+klfkdcLcF4T9pxYG0ly79dGxKnxc63DiYFIQG21oXZLnjMuykciE6YMyRw4kxzY
	yGbx+Frpcg+695kVM7UZDrRWhB/Fq9iysVcNpNvC2upwsLvsJJka3Le51NvfzChKexWUxxAADST
	E13N9btE8pwu0xY9Kv3qx901SeDRw/MT3x7q1rnhUE2gKijpSik3sLK6puSqK/Qhf9tDarzvj5B
	EitxMf8b5vwMkBLdCPn5f7sa2ECRKuPC/rdFBRkirIGGLl5BQ0CVSDFsIMx1mQ1wACLXVDhRHXu
	ZChfHiBPnWmaD6WsRqG7pLeSWEfnBTiG+ciSBjiAybRi5IX4grrHtFtTRZqT+fPdtpv7zd0Tk29
	II4=
X-Received: by 2002:a05:600c:b99:b0:4a1:efba:511 with SMTP id 5b1f17b1804b1-4a35acba31cmr176444585e9.35.1793102642389;
        Tue, 27 Oct 2026 05:04:02 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd39a9sm22977554f8f.46.2026.10.27.05.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:04:02 -0700 (PDT)
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
Subject: [PATCH v3 4/5] media: atomisp: queue: move circbuf types and helpers to queue_comm.h
Date: Tue, 27 Oct 2026 12:03:39 +0000
Message-ID: <20261027120341.2305533-5-vladurares@gmail.com>
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

