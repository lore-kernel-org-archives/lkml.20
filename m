Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B6D52ED40
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 21:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789767713; cv=none; b=l+S74Zz3u4e5ZHiUeoCPcJAxrMzrpZotBsUK/WWkK3/Hxktw9gWWaxG2+q2ZMwX2nJ8S6AaI1THhv6LuxzgkGP0+c+/59l7cgZN+xtNyl/6K2ppCSt+Cj8jX8UZepMOHjMpiuGOtfTlQ972JpN1MNl0/qBW+kZIIiHMGK2+FYyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789767713; c=relaxed/simple;
	bh=hCt8RfFDNnfDD7Z4MhN/gVhkVJMx6mKfaNhEb0XUMbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pNQUFhrVj9GaD7+3fVf0W8DIe03sMPPPkEVyhhpY7/hC0Saqsj0RtuRCyCdxi0x8xlth7F8IFViXOhN94pLDeBKTpQxgiw7P/Xfmb7VsdMRyiprjW54AUIjGutOKakGLVMrd0h1oM2rtq8BZH60JFWtmF2WJsao8El+RvlWJHuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ab1kIi+F; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ab1kIi+F"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4ad9so7173525e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789767707; x=1790372507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SWnkCWkXNXciq3jXvBPGD+9vXB4RTRQg9E2OELK+XNk=;
        b=ab1kIi+F3WtfwIKdBwcEP11dBYC3Vmt7s6pSiE71dfqcbrIzmFhtkEh7cGgiPY3INg
         EcuvIgPf/7ikRd3ocHI1A0GC16lyMS7gEfwVvLoMVl4085u2V2IT6yBBwv56lQSkuY0g
         145APlDmU0Izl4dmpcG7wNtbXOxlAGX/UUF96tv8Lt7DnNq2MSMjksQ+4zyN797ULYH5
         TYvTlWbPMec3+hpmA8syzpXemEjnxPToNnI5g9ccVNIb2h9sOlV3TxjACYAJ/IExHEv/
         8lTZiRGpSmr7jIMvvS20/8B5nTPe+9Az4bJ71dm28CNeIJ7GrLSaiFZrk9/6Pwv91L7F
         n2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789767707; x=1790372507;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SWnkCWkXNXciq3jXvBPGD+9vXB4RTRQg9E2OELK+XNk=;
        b=wnQbp6glk4HMgMMaUVPahyNv9rll0Phq32rUsG1dA5dWvircol8BVShoeLKRp2h6AP
         eCwdMNnf3NXh9GeaLC8G8i+cd0fGJ4p5JSKyzHwzIlPO8vomhB2hU9Bp0KYzV5PzK0I7
         4x3ecXiim1Olu+5iAlj7Gvf1QYhXlGKsNuwGR6JbvfU7xWOICRbYL6mybnMrYba+Qrl3
         SjmBNJUxulGObF966+Fdb0BjpNT5ooLJSUB+ZhQoOM/SlOTWIwGLMCdvYRnIqRQM8oOJ
         olIqJULEdhKta8pl6+y+WQUGtXauNy8HqHmzWNqJsawVm10cs9cvoJ8vEUWjQPyCQB8m
         Z6Eg==
X-Forwarded-Encrypted: i=1; AKwUvBwNeMDRs8C3qoBGD1rKaTzsn1qI+d5IOfjBesWdg4X5GdYHKN2A0F2jQs0oOYo9YOkefVrbvS4yxleD0/0=@vger.kernel.org
X-Gm-Message-State: AFuF++llAUyzwFbK2zuDnSI+WyBqBakj1U096MvKb9AZW0E7WyhYin0P
	jvQTmTAQdT4NMH9f2p4ol+3M/uKLtV+ff+xKk/EbptviAIWJUemgoTf4AfLZ6vwaTtg=
X-Gm-Gg: AYBFou0R3aGATVNCuVholju87uFMtPuOITUkWdidYZF0kCbK9m2cnPaA6BfdsZgepTs
	UiaMbyerIEC9r6rbkpsmP/fVUbPTaEo5rXo2r4aqbmViXFbcG1x+mq+Gv9wY2F+MaWQFTRUnZpU
	qD/WrZJa64WtvtDuzV4PZ83f+vMg4LCeCh/mrhgQqQGSQ9XP96HOH3gMMEHE5FFCkCIODHdkg8z
	d7pjH4XZWJBzuz/YDLO4SeU0TJkws2GjK+EphCSdOn7cpCC0jlT5202f706+fKO8mgjz+kdOywh
	V4dMwcVuwetDuwFsmxj0g19xU3Xcbl/Fc8vh5BM5BTnfesty0AgPd28s8HNor3Y5p9tqDSV5Pt3
	zvGCd8VY4YyvMi0UpiII60+/rGuGE1VZUf6yjTYe9RAkKppPWYySt0xy1ekaPzViNFUSVDjleXg
	EXJbU8mfOvaDDrdPMmOsYlW5Xu8/TZvNO0ib+q9U5m1mP94iCR/VmOU3gKZ+3JvClaKGzwv8HjQ
	sQB4a4rjlJwigz0cyZQsA==
X-Received: by 2002:a05:600c:548c:b0:49e:6e7c:d895 with SMTP id 5b1f17b1804b1-49fc584fee0mr52180715e9.26.1789767707302;
        Fri, 18 Sep 2026 14:41:47 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd068059sm22631565e9.5.2026.09.18.14.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 14:41:46 -0700 (PDT)
From: =?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	=?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
Subject: [PATCH] staging: media: atomisp: remove ia_css_circbuf_t typedef
Date: Fri, 18 Sep 2026 21:41:32 +0000
Message-ID: <20260918214132.1135549-1-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove typedef ia_css_circbuf_t and use struct ia_css_circbuf_s
directly, as per kernel coding style (chapter 5).

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
---
 .../base/circbuf/interface/ia_css_circbuf.h   | 37 +++++++++----------
 .../atomisp/pci/base/circbuf/src/circbuf.c    | 28 +++++++-------
 .../pci/runtime/queue/src/queue_access.h      |  2 +-
 3 files changed, 33 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
index fbcd73b71..de49bf9cd 100644
--- a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
+++ b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
@@ -23,7 +23,6 @@
 /*
  * @brief Data structure for the circular buffer.
  */
-typedef struct ia_css_circbuf_s ia_css_circbuf_t;
 struct ia_css_circbuf_s {
 	ia_css_circbuf_desc_t *desc;    /* Pointer to the descriptor of the circbuf */
 	ia_css_circbuf_elem_t *elems;	/* an array of elements    */
@@ -37,7 +36,7 @@ struct ia_css_circbuf_s {
  * @param desc	The descriptor set to the size using ia_css_circbuf_desc_init().
  */
 void ia_css_circbuf_create(
-    ia_css_circbuf_t *cb,
+	struct ia_css_circbuf_s *cb,
     ia_css_circbuf_elem_t *elems,
     ia_css_circbuf_desc_t *desc);
 
@@ -47,7 +46,7 @@ void ia_css_circbuf_create(
  * @param cb The pointer to the circular buffer.
  */
 void ia_css_circbuf_destroy(
-    ia_css_circbuf_t *cb);
+	struct ia_css_circbuf_s *cb);
 
 /*
  * @brief Pop a value out of the circular buffer.
@@ -60,7 +59,7 @@ void ia_css_circbuf_destroy(
  * @return the pop-out value.
  */
 uint32_t ia_css_circbuf_pop(
-    ia_css_circbuf_t *cb);
+	struct ia_css_circbuf_s *cb);
 
 /*
  * @brief Extract a value out of the circular buffer.
@@ -74,7 +73,7 @@ uint32_t ia_css_circbuf_pop(
  * @return the extracted value.
  */
 uint32_t ia_css_circbuf_extract(
-    ia_css_circbuf_t *cb,
+	struct ia_css_circbuf_s *cb,
     int offset);
 
 /****************************************************************
@@ -135,7 +134,7 @@ static inline void ia_css_circbuf_elem_cpy(
  * @return the position at offset.
  */
 static inline uint8_t ia_css_circbuf_get_pos_at_offset(
-    ia_css_circbuf_t *cb,
+	struct ia_css_circbuf_s *cb,
     u32 base,
     int offset)
 {
@@ -163,7 +162,7 @@ static inline uint8_t ia_css_circbuf_get_pos_at_offset(
  * @return the offset.
  */
 static inline int ia_css_circbuf_get_offset(
-    ia_css_circbuf_t *cb,
+	struct ia_css_circbuf_s *cb,
     u32 src_pos,
     uint32_t dest_pos)
 {
@@ -188,7 +187,7 @@ static inline int ia_css_circbuf_get_offset(
  * TODO: Test this API.
  */
 static inline uint32_t ia_css_circbuf_get_size(
-    ia_css_circbuf_t *cb)
+	struct ia_css_circbuf_s *cb)
 {
 	OP___assert(cb);
 	OP___assert(cb->desc);
@@ -204,7 +203,7 @@ static inline uint32_t ia_css_circbuf_get_size(
  * @return the number of available elements.
  */
 static inline uint32_t ia_css_circbuf_get_num_elems(
-    ia_css_circbuf_t *cb)
+	struct ia_css_circbuf_s *cb)
 {
 	int num;
 
@@ -226,7 +225,7 @@ static inline uint32_t ia_css_circbuf_get_num_elems(
  *	- false when it is not empty.
  */
 static inline bool ia_css_circbuf_is_empty(
-    ia_css_circbuf_t *cb)
+	struct ia_css_circbuf_s *cb)
 {
 	OP___assert(cb);
 	OP___assert(cb->desc);
@@ -243,7 +242,7 @@ static inline bool ia_css_circbuf_is_empty(
  *	- true when it is full.
  *	- false when it is not full.
  */
-static inline bool ia_css_circbuf_is_full(ia_css_circbuf_t *cb)
+static inline bool ia_css_circbuf_is_full(struct ia_css_circbuf_s *cb)
 {
 	OP___assert(cb);
 	OP___assert(cb->desc);
@@ -261,7 +260,7 @@ static inline bool ia_css_circbuf_is_full(ia_css_circbuf_t *cb)
  * @param elem	The new element.
  */
 static inline void ia_css_circbuf_write(
-    ia_css_circbuf_t *cb,
+	struct ia_css_circbuf_s *cb,
     ia_css_circbuf_elem_t elem)
 {
 	OP___assert(cb);
@@ -285,7 +284,7 @@ static inline void ia_css_circbuf_write(
  * @param val	The value to be pushed in.
  */
 static inline void ia_css_circbuf_push(
-    ia_css_circbuf_t *cb,
+	struct ia_css_circbuf_s *cb,
     uint32_t val)
 {
 	ia_css_circbuf_elem_t elem;
@@ -308,7 +307,7 @@ static inline void ia_css_circbuf_push(
  * @return: The number of free elements.
  */
 static inline uint32_t ia_css_circbuf_get_free_elems(
-    ia_css_circbuf_t *cb)
+	struct ia_css_circbuf_s *cb)
 {
 	OP___assert(cb);
 	OP___assert(cb->desc);
@@ -320,24 +319,24 @@ static inline uint32_t ia_css_circbuf_get_free_elems(
  * @brief Peek an element in Circular Buffer.
  *
  * @param cb	 The pointer to the circular buffer.
- * @param offset Offset to the element.
+ * @param offset to the element.
  *
  * @return the elements value.
  */
 uint32_t ia_css_circbuf_peek(
-    ia_css_circbuf_t *cb,
+	struct ia_css_circbuf_s *cb,
     int offset);
 
 /*
  * @brief Get an element in Circular Buffer.
  *
  * @param cb	 The pointer to the circular buffer.
- * @param offset Offset to the element.
+ * @param offset to the element.
  *
  * @return the elements value.
  */
 uint32_t ia_css_circbuf_peek_from_start(
-    ia_css_circbuf_t *cb,
+	struct ia_css_circbuf_s *cb,
     int offset);
 
 /*
@@ -356,7 +355,7 @@ uint32_t ia_css_circbuf_peek_from_start(
  *			false on failure
  */
 bool ia_css_circbuf_increase_size(
-    ia_css_circbuf_t *cb,
+	struct ia_css_circbuf_s *cb,
     unsigned int sz_delta,
     ia_css_circbuf_elem_t *elems);
 
diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
index cb34d0b5a..203856e24 100644
--- a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
+++ b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
@@ -24,7 +24,7 @@
  * @return the oldest element.
  */
 static inline ia_css_circbuf_elem_t
-ia_css_circbuf_read(ia_css_circbuf_t *cb);
+ia_css_circbuf_read(struct ia_css_circbuf_s *cb);
 
 /*
  * @brief Shift a chunk of elements in the circular buffer.
@@ -36,8 +36,8 @@ ia_css_circbuf_read(ia_css_circbuf_t *cb);
  * @param chunk_src  The position at which the first element in the chunk is.
  * @param chunk_dest The position to which the first element in the chunk would be shift.
  */
-static inline void ia_css_circbuf_shift_chunk(ia_css_circbuf_t *cb,
-	u32 chunk_src,
+static inline void ia_css_circbuf_shift_chunk(struct ia_css_circbuf_s *cb,
+					      u32 chunk_src,
 	uint32_t chunk_dest);
 
 /*
@@ -60,7 +60,7 @@ ia_css_circbuf_elem_get_val(ia_css_circbuf_elem_t *elem);
  * Refer to "ia_css_circbuf.h" for details.
  */
 void
-ia_css_circbuf_create(ia_css_circbuf_t *cb,
+ia_css_circbuf_create(struct ia_css_circbuf_s *cb,
 		      ia_css_circbuf_elem_t *elems,
 		      ia_css_circbuf_desc_t *desc)
 {
@@ -84,7 +84,7 @@ ia_css_circbuf_create(ia_css_circbuf_t *cb,
  * @brief Destroy the circular buffer.
  * Refer to "ia_css_circbuf.h" for details.
  */
-void ia_css_circbuf_destroy(ia_css_circbuf_t *cb)
+void ia_css_circbuf_destroy(struct ia_css_circbuf_s *cb)
 {
 	cb->desc = NULL;
 
@@ -95,7 +95,7 @@ void ia_css_circbuf_destroy(ia_css_circbuf_t *cb)
  * @brief Pop a value out of the circular buffer.
  * Refer to "ia_css_circbuf.h" for details.
  */
-uint32_t ia_css_circbuf_pop(ia_css_circbuf_t *cb)
+uint32_t ia_css_circbuf_pop(struct ia_css_circbuf_s *cb)
 {
 	u32 ret;
 	ia_css_circbuf_elem_t elem;
@@ -112,7 +112,7 @@ uint32_t ia_css_circbuf_pop(ia_css_circbuf_t *cb)
  * @brief Extract a value out of the circular buffer.
  * Refer to "ia_css_circbuf.h" for details.
  */
-uint32_t ia_css_circbuf_extract(ia_css_circbuf_t *cb, int offset)
+uint32_t ia_css_circbuf_extract(struct ia_css_circbuf_s *cb, int offset)
 {
 	int max_offset;
 	u32 val;
@@ -162,7 +162,7 @@ uint32_t ia_css_circbuf_extract(ia_css_circbuf_t *cb, int offset)
  * @brief Peek an element from the circular buffer.
  * Refer to "ia_css_circbuf.h" for details.
  */
-uint32_t ia_css_circbuf_peek(ia_css_circbuf_t *cb, int offset)
+uint32_t ia_css_circbuf_peek(struct ia_css_circbuf_s *cb, int offset)
 {
 	int pos;
 
@@ -176,7 +176,7 @@ uint32_t ia_css_circbuf_peek(ia_css_circbuf_t *cb, int offset)
  * @brief Get the value of an element from the circular buffer.
  * Refer to "ia_css_circbuf.h" for details.
  */
-uint32_t ia_css_circbuf_peek_from_start(ia_css_circbuf_t *cb, int offset)
+uint32_t ia_css_circbuf_peek_from_start(struct ia_css_circbuf_s *cb, int offset)
 {
 	int pos;
 
@@ -192,7 +192,7 @@ uint32_t ia_css_circbuf_peek_from_start(ia_css_circbuf_t *cb, int offset)
  * Please refer to "ia_css_circbuf.h" for details.
  */
 bool ia_css_circbuf_increase_size(
-    ia_css_circbuf_t *cb,
+	struct ia_css_circbuf_s *cb,
     unsigned int sz_delta,
     ia_css_circbuf_elem_t *elems)
 {
@@ -260,7 +260,7 @@ ia_css_circbuf_elem_get_val(ia_css_circbuf_elem_t *elem)
  * Refer to "Forward declarations" for details.
  */
 static inline ia_css_circbuf_elem_t
-ia_css_circbuf_read(ia_css_circbuf_t *cb)
+ia_css_circbuf_read(struct ia_css_circbuf_s *cb)
 {
 	ia_css_circbuf_elem_t elem;
 
@@ -280,7 +280,7 @@ ia_css_circbuf_read(ia_css_circbuf_t *cb)
  * Refer to "Forward declarations" for details.
  */
 static inline void
-ia_css_circbuf_shift_chunk(ia_css_circbuf_t *cb,
+ia_css_circbuf_shift_chunk(struct ia_css_circbuf_s *cb,
 			   u32 chunk_src, uint32_t chunk_dest)
 {
 	int chunk_offset;
@@ -289,7 +289,7 @@ ia_css_circbuf_shift_chunk(ia_css_circbuf_t *cb,
 
 	/* get the chunk offset and size */
 	chunk_offset = ia_css_circbuf_get_offset(cb,
-		       chunk_src, chunk_dest);
+						 chunk_src, chunk_dest);
 	chunk_sz = ia_css_circbuf_get_offset(cb, cb->desc->start, chunk_src) + 1;
 
 	/* shift each element to its terminal position */
@@ -308,5 +308,5 @@ ia_css_circbuf_shift_chunk(ia_css_circbuf_t *cb,
 
 	/* adjust the index "start" */
 	cb->desc->start = ia_css_circbuf_get_pos_at_offset(cb, cb->desc->start,
-			  chunk_offset);
+							   chunk_offset);
 }
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
index d62133a8f..d9b76b70d 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
@@ -47,7 +47,7 @@ struct ia_css_queue {
 	u8 location;    /* Cell location for queue */
 	u8 proc_id;     /* Processor id for queue access */
 	union {
-		ia_css_circbuf_t cb_local;
+		struct ia_css_circbuf_s cb_local;
 		struct {
 			u32 cb_desc_addr; /*Circbuf desc address for remote queues*/
 			u32 cb_elems_addr; /*Circbuf elements addr for remote queue*/
-- 
2.43.0

