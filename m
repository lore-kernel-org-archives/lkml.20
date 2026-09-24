Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD38481252
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255473; cv=none; b=W2UdxHKT8OlHDx4jP0a/PL1KRoqg9XEhl1zDEzuQ4SXQIfO04botYv/j7Xp12uMweaqm0eC3A2rqit1VmNDd5PtG8oA1dfvV9ytGyZethVHtPqb/wjsLyaW7Z7ZpaoxgE7Gr3BBvWyZgpBulJq7FDfF8xPdHIRNYNKOgmg/8MmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255473; c=relaxed/simple;
	bh=NdqHat4Xkj7B8ER5lMEyv8VmSOKg16jzX4AMZedIK80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DUqHTg6Wnk3Nq2A0kglvTSpk/1ozYcL5KFXOyE9rU+z2fbt878JpPVWyuk5B1v7Y0YzlH7dlrqrm2iI0Y6gRhi4BjP0LTx5QUN7bd9v/s7ezaLFrcBARIFRleKTkQJh4X0clmLFIrcOc4wxGY9r6RIwKQxo9OHfb5vAxCA05Rtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RSJMyumd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RSJMyumd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790255470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fJQvlbToXIaXybyHi1bC0IWhHP8I5jdSfJh12RU+oeo=;
	b=RSJMyumd83EqSvTR/fAmQ5QezlHhkpMNRw60XQUCvPrEmCW1YfnRE37QrxrBFjX7YdRnbB
	DZtLPGRqsNs6tMDmhhwUKjaCgaEhnDX/3FihGqEIt22pS7VxBHy1kpDiEkXcN0Fct8PahS
	yzVnCj4pNQoit9bKTzObUY05ZmK3ruo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-611-Uyw4h6hgMB6DxGwbxvWhZg-1; Thu,
 24 Sep 2026 09:11:08 -0400
X-MC-Unique: Uyw4h6hgMB6DxGwbxvWhZg-1
X-Mimecast-MFC-AGG-ID: Uyw4h6hgMB6DxGwbxvWhZg_1790255467
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5270A195C25C;
	Thu, 24 Sep 2026 13:11:07 +0000 (UTC)
Received: from aesteve-thinkpadp1gen8.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8F97C180049F;
	Thu, 24 Sep 2026 13:11:05 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 24 Sep 2026 15:10:36 +0200
Subject: [PATCH v3 2/4] soc: qcom: smem: validate private entry list walks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-port-smem-v3-2-fbc2ea81a654@redhat.com>
References: <20260924-port-smem-v3-0-fbc2ea81a654@redhat.com>
In-Reply-To: <20260924-port-smem-v3-0-fbc2ea81a654@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>, 
 Sarannya S <quic_sarannya@oss.qualcomm.com>, 
 Pranav Mahesh Phansalkar <quic_pphansal@oss.qualcomm.com>, 
 Sudeepgoud Patil <quic_sudeepgo@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790255460; l=4205;
 i=aesteve@redhat.com; s=20260827; h=from:subject:message-id;
 bh=NFK/SMZm2DMaUW9Or9s4UQlovYwo2U2DNHeX8g+CclY=;
 b=qGSbHRpZUUtmXPYCgbqHNZVQ8y84CqrI9Qdhcbm7hiUg3DO8BAPoZSR+3SI2UUBMT620bheQJ
 OAaeCbWcTdGDfNO1Ir/eZxRuiAluNACoxb5VvrPSmopfIWtFJ0e6KDO
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=zI2RBeZgocwYm3AkJW4CtjoJnKoDZrfBl1xe5Ed6h+U=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

From: Sarannya S <quic_sarannya@oss.qualcomm.com>

When walking private entries, use the uncached/cached free offsets as
the list bounds, require room for a header before dereferencing, and
reject a next pointer that does not advance.

Skip the cached list when the cached free offset is at the partition
end.

Signed-off-by: Sarannya S <quic_sarannya@oss.qualcomm.com>
Signed-off-by: Pranav Mahesh Phansalkar <quic_pphansal@oss.qualcomm.com>
Signed-off-by: Sudeepgoud Patil <quic_sudeepgo@oss.qualcomm.com>
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/soc/qcom/smem.c | 50 ++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 37 insertions(+), 13 deletions(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index 6783a3c533f0..9bf0ec32c9f1 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -421,6 +421,7 @@ static int qcom_smem_alloc_private(struct qcom_smem *smem,
 				   size_t size)
 {
 	struct smem_private_entry *hdr, *end;
+	struct smem_private_entry *next_hdr;
 	struct smem_partition_header *phdr;
 	size_t alloc_size;
 	void *cached;
@@ -433,19 +434,25 @@ static int qcom_smem_alloc_private(struct qcom_smem *smem,
 	end = phdr_to_last_uncached_entry(phdr);
 	cached = phdr_to_last_cached_entry(phdr);
 
-	if (WARN_ON((void *)end > p_end || cached > p_end))
+	if (WARN_ON(!IN_PARTITION_RANGE(end, 0, phdr, cached) ||
+			cached > p_end))
 		return -EINVAL;
 
-	while (hdr < end) {
+	while ((hdr + 1) < end) {
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
@@ -604,7 +611,8 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
 				   unsigned int item,
 				   size_t *size)
 {
-	struct smem_private_entry *e, *end;
+	struct smem_private_entry *e, *uncached_end, *cached_end;
+	struct smem_private_entry *next_e;
 	struct smem_partition_header *phdr;
 	void *item_ptr, *p_end;
 	u32 padding_data;
@@ -614,9 +622,14 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
 	p_end = (void *)phdr + part->size;
 
 	e = phdr_to_first_uncached_entry(phdr);
-	end = phdr_to_last_uncached_entry(phdr);
+	uncached_end = phdr_to_last_uncached_entry(phdr);
+	cached_end = phdr_to_last_cached_entry(phdr);
+
+	if (WARN_ON(!IN_PARTITION_RANGE(uncached_end, 0, phdr, cached_end) ||
+			(void *)cached_end > p_end))
+		return ERR_PTR(-EINVAL);
 
-	while (e < end) {
+	while ((e + 1) < uncached_end) {
 		if (e->canary != SMEM_PRIVATE_CANARY)
 			goto invalid_canary;
 
@@ -638,21 +651,28 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
 			return item_ptr;
 		}
 
-		e = uncached_entry_next(e);
+		next_e = uncached_entry_next(e);
+		if (WARN_ON(next_e <= e))
+			return ERR_PTR(-EINVAL);
+
+		e = next_e;
 	}
 
-	if (WARN_ON((void *)e > p_end))
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
 
@@ -674,7 +694,11 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
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

