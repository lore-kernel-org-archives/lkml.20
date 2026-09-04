Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0ED4CA773
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535148; cv=none; b=rNSkq7betVWqyYKYjwRbnUpbEqXyLNZLaPxaWFF1fk9FvWikev1mvBm9NJEQ5xPlJ666yFHpp4//Cdggd0HRryZW2exEM4vVsG57n7MbnqIjrZv5DnK5dzpuVDJYvtzNWDP2nUhm99yZMGOQUzBbEuuEfX1M1J91l9QpLF/ePNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535148; c=relaxed/simple;
	bh=fIRKV/9jKTj7ZenVzMXZQuiEqbFTgVDfH8IIci9CrcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZCgg8dZbW8lgJuPw5Je447GanOmwqtP/9o/te08kSsrqmbFV/GnAfB6Tgt3kbxZ9vK0wGf+cSrwQZifQ0wenEySf0Jx0lmwEqSq2KA23p0k8gR6WzUEdLPVcH+lM4iGiIOr05yX7DkrDIB+HNL1A7v1/z/hIN6K0Q/uNlBVUulA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C0Dd/k1v; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C0Dd/k1v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788535146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eiciw+/kcrwHSElZlsk1HKoJc4yowLrlZSajNPrw00o=;
	b=C0Dd/k1v4V4ofFudhK1kJd9t48ubJdw/jvwmiJ692eCvuXk1FiRId7F3YjTiLfwvQhaBLG
	cYEa+h0HkM2qrbf266lWbCJC7gY4poZNbmEXaIf9sedCc+oO/l+bkpjgCqtnodReja9R+v
	qnzXHe1Ajhs3NpwSf2MH88Fu22GEKxA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-148-pP3N96zqPCGAheYPZgmRJw-1; Fri,
 04 Sep 2026 11:19:01 -0400
X-MC-Unique: pP3N96zqPCGAheYPZgmRJw-1
X-Mimecast-MFC-AGG-ID: pP3N96zqPCGAheYPZgmRJw_1788535138
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DF9F019114A9;
	Fri,  4 Sep 2026 15:18:57 +0000 (UTC)
Received: from aesteve-thinkpadp1gen8.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E54EE18005AD;
	Fri,  4 Sep 2026 15:18:55 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 04 Sep 2026 17:18:47 +0200
Subject: [PATCH v2 1/2] soc: qcom: smem: add boundary checks for partitions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-port-smem-v2-1-bb497dd3c48b@redhat.com>
References: <20260904-port-smem-v2-0-bb497dd3c48b@redhat.com>
In-Reply-To: <20260904-port-smem-v2-0-bb497dd3c48b@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>, 
 Sarannya S <quic_sarannya@oss.qualcomm.com>, 
 Pranav Mahesh Phansalkar <quic_pphansal@oss.qualcomm.com>, 
 Sudeepgoud Patil <quic_sudeepgo@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788535133; l=6651;
 i=aesteve@redhat.com; s=20260827; h=from:subject:message-id;
 bh=0rGL6zHSFvXqGwCXA9EegJvGUsNITbDuSHNJIYU326I=;
 b=02Y3QWDfbUk0Y1C4Mcyax/U1KqFhWk4X/gd3nIYoLXdkqjdj11g36hFqEj0F3hl8lwyNxvMey
 Y5yTfe6RQzOBPI5R2fhPjpy0gp0iyFUCBx2kRfVWDj1yigKlL33mY3P
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=zI2RBeZgocwYm3AkJW4CtjoJnKoDZrfBl1xe5Ed6h+U=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

From: Sarannya S <quic_sarannya@oss.qualcomm.com>

Add condition check to make sure that the end address
of private entry does not go out of partition.

Signed-off-by: Sarannya S <quic_sarannya@oss.qualcomm.com>
Signed-off-by: Pranav Mahesh Phansalkar <quic_pphansal@oss.qualcomm.com>
Signed-off-by: Sudeepgoud Patil <quic_sudeepgo@oss.qualcomm.com>
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/soc/qcom/smem.c | 105 +++++++++++++++++++++++++++++++++---------------
 1 file changed, 72 insertions(+), 33 deletions(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index b5e7bd8c1512..1456ff6df293 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2015, Sony Mobile Communications AB.
  * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/debugfs.h>
@@ -88,6 +89,17 @@
 /* Processor/host identifier for the global partition */
 #define SMEM_GLOBAL_HOST	0xfffe
 
+/* Entry range check
+ * ptr >= start : Checks if ptr is greater than the start of access region
+ * ptr + size >= ptr: Check for integer overflow (On 32bit system where ptr
+ * and size are 32bits, ptr + size can wrap around to be a small integer)
+ * ptr + size <= end: Checks if ptr+size is less than the end of access region
+ */
+#define IN_PARTITION_RANGE(ptr, size, start, end)		\
+	(((void *)(ptr) >= (void *)(start)) &&			\
+	 (((void *)(ptr) + (size)) >= (void *)(ptr)) &&	\
+	 (((void *)(ptr) + (size)) <= (void *)(end)))
+
 /**
   * struct smem_proc_comm - proc_comm communication struct (legacy)
   * @command:	current command to be executed
@@ -409,6 +421,7 @@ static int qcom_smem_alloc_private(struct qcom_smem *smem,
 				   size_t size)
 {
 	struct smem_private_entry *hdr, *end;
+	struct smem_private_entry *next_hdr;
 	struct smem_partition_header *phdr;
 	size_t alloc_size;
 	void *cached;
@@ -421,19 +434,25 @@ static int qcom_smem_alloc_private(struct qcom_smem *smem,
 	end = phdr_to_last_uncached_entry(phdr);
 	cached = phdr_to_last_cached_entry(phdr);
 
-	if (WARN_ON((void *)end > p_end || cached > p_end))
+	if (WARN_ON(!IN_PARTITION_RANGE(end, 0, phdr, cached) ||
+						cached > p_end))
 		return -EINVAL;
 
-	while (hdr < end) {
+	while ((hdr < end) && ((hdr + 1) < end)) {
 		if (hdr->canary != SMEM_PRIVATE_CANARY)
 			goto bad_canary;
 		if (le16_to_cpu(hdr->item) == item)
 			return -EEXIST;
 
-		hdr = uncached_entry_next(hdr);
+		next_hdr = uncached_entry_next(hdr);
+
+		if (WARN_ON(next_hdr <= hdr))
+			return -EINVAL;
+
+		hdr = next_hdr;
 	}
 
-	if (WARN_ON((void *)hdr > p_end))
+	if (WARN_ON((void *)hdr > (void *)end))
 		return -EINVAL;
 
 	/* Check that we don't grow into the cached region */
@@ -592,9 +611,11 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
 				   unsigned int item,
 				   size_t *size)
 {
-	struct smem_private_entry *e, *end;
+	struct smem_private_entry *e, *uncached_end, *cached_end;
+	struct smem_private_entry *next_e;
 	struct smem_partition_header *phdr;
 	void *item_ptr, *p_end;
+	size_t entry_size = 0;
 	u32 padding_data;
 	u32 e_size;
 
@@ -602,67 +623,85 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
 	p_end = (void *)phdr + part->size;
 
 	e = phdr_to_first_uncached_entry(phdr);
-	end = phdr_to_last_uncached_entry(phdr);
+	uncached_end = phdr_to_last_uncached_entry(phdr);
+	cached_end = phdr_to_last_cached_entry(phdr);
+
+	if (WARN_ON(!IN_PARTITION_RANGE(uncached_end, 0, phdr, cached_end)
+					|| (void *)cached_end > p_end))
+		return ERR_PTR(-EINVAL);
 
-	while (e < end) {
+	while ((e < uncached_end) && ((e + 1) < uncached_end)) {
 		if (e->canary != SMEM_PRIVATE_CANARY)
 			goto invalid_canary;
 
 		if (le16_to_cpu(e->item) == item) {
-			if (size != NULL) {
-				e_size = le32_to_cpu(e->size);
-				padding_data = le16_to_cpu(e->padding_data);
+			e_size = le32_to_cpu(e->size);
+			padding_data = le16_to_cpu(e->padding_data);
 
-				if (WARN_ON(e_size > part->size || padding_data > e_size))
-					return ERR_PTR(-EINVAL);
+			if (e_size < part->size && padding_data < e_size)
+				entry_size = e_size - padding_data;
+			else
+				return ERR_PTR(-EINVAL);
 
-				*size = e_size - padding_data;
-			}
+			item_ptr =  uncached_entry_to_item(e);
 
-			item_ptr = uncached_entry_to_item(e);
-			if (WARN_ON(item_ptr > p_end))
+			if (WARN_ON(!IN_PARTITION_RANGE(item_ptr, entry_size, e, uncached_end)))
 				return ERR_PTR(-EINVAL);
 
+			if (size != NULL)
+				*size = entry_size;
+
 			return item_ptr;
 		}
 
-		e = uncached_entry_next(e);
-	}
+		next_e = uncached_entry_next(e);
+		if (WARN_ON(next_e <= e))
+			return ERR_PTR(-EINVAL);
 
-	if (WARN_ON((void *)e > p_end))
+		e = next_e;
+	}
+	if (WARN_ON((void *)e > (void *)uncached_end))
 		return ERR_PTR(-EINVAL);
 
 	/* Item was not found in the uncached list, search the cached list */
 
+	if (cached_end == p_end)
+		return ERR_PTR(-ENOENT);
+
 	e = phdr_to_first_cached_entry(phdr, part->cacheline);
-	end = phdr_to_last_cached_entry(phdr);
 
-	if (WARN_ON((void *)e < (void *)phdr || (void *)end > p_end))
+	if (WARN_ON(!IN_PARTITION_RANGE(cached_end, 0, uncached_end, p_end) ||
+			!IN_PARTITION_RANGE(e, sizeof(*e), cached_end, p_end)))
 		return ERR_PTR(-EINVAL);
 
-	while (e > end) {
+	while (e > cached_end) {
 		if (e->canary != SMEM_PRIVATE_CANARY)
 			goto invalid_canary;
 
 		if (le16_to_cpu(e->item) == item) {
-			if (size != NULL) {
-				e_size = le32_to_cpu(e->size);
-				padding_data = le16_to_cpu(e->padding_data);
+			e_size = le32_to_cpu(e->size);
+			padding_data = le16_to_cpu(e->padding_data);
 
-				if (WARN_ON(e_size > part->size || padding_data > e_size))
-					return ERR_PTR(-EINVAL);
-
-				*size = e_size - padding_data;
-			}
+			if (e_size < part->size && padding_data < e_size)
+				entry_size  = e_size - padding_data;
+			else
+				return ERR_PTR(-EINVAL);
 
-			item_ptr = cached_entry_to_item(e);
-			if (WARN_ON(item_ptr < (void *)phdr))
+			item_ptr =  cached_entry_to_item(e);
+			if (WARN_ON(!IN_PARTITION_RANGE(item_ptr, entry_size, cached_end, e)))
 				return ERR_PTR(-EINVAL);
 
+			if (size != NULL)
+				*size = entry_size;
+
 			return item_ptr;
 		}
 
-		e = cached_entry_next(e, part->cacheline);
+		next_e = cached_entry_next(e, part->cacheline);
+		if (WARN_ON(next_e >= e))
+			return ERR_PTR(-EINVAL);
+
+		e = next_e;
 	}
 
 	if (WARN_ON((void *)e < (void *)phdr))

-- 
2.55.0

