Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662470;
	b=1hGvQUV1UOxfx54eKfJmEYJH8hBVfUkJZN1i/+GmLNdwLyHfI0O7IghII8yHOPBlmt1z
	 U5ngz6b1jBfoHRhsRqGLbDyDl7zO6oHSvT9wPdx77GQqLWBZgnvSGOv8LXo/IcTeSBSBv
	 7gYmUbtU8/sUlBb1kKwoxZDFLAviRgRg4OtQzLur62WBqNdkDGRkGX1WPxxc3gPiJMiZQ
	 tKzBYz00LXKmkfsk+N7KJ4aL8Xj98XgQHW9Rtw/QhCDtiJ7Uv4MwFDId2m0OGL1a95+ex
	 tKALSHvZoJs+pXDrA25FzgVcBAJft11RT30D1X/JoOaL5+O6HLthM9qHyYvfICWKyRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662470;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key:
	 X-Scanned-By;
	bh=2DRAmGofNeMfLXcJ+mf9ngVH2HMiQRfIyCAaYakYw/8=;
	b=fhZccGdigpxvQXjvmmEzwkBH6G0lEKssGfjljO5RJ55vcJ18xPPKjLl+Vm9sTsj8NVUL
	 z2R97pbLXUj7WK7kdlzcHnJJfuuYEfQQktLiX+Lf4s5L8LElvQSzNUp+gPmy/qUkMGT4L
	 8hMX98Dcnlo47k/yHbs45AMsTn3gVAy4RsEH7l7gGj7CB+8wfPj235H0L7iP0kozY+VXj
	 yd7YT+1d12Vcwhnd0X8bopZWuhXhE/5WjNNCLvKGV+Z6lnu6uBp1zaOZlJDK/UMSfdeZD
	 jcpZbzDKvjhrgiNVaKo7QFh2djPMRFk/TrWAQ19Y18DTRsxJyhqqjIr+CnRd0mSLuNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZFq3jVAO;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C5D606A323
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75C5D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZFq3jVAO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792662468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2DRAmGofNeMfLXcJ+mf9ngVH2HMiQRfIyCAaYakYw/8=;
	b=ZFq3jVAOXwCRWFn7rr+pDE/lUvjguGK9WLZNobtTzXv52jsexNWYWJf8vfGY9K8Ep2jxLv
	oOhymrRBq3fPOHkUiE2NaOiqK3+VTuIBxRY++dqAZ59+zcW4XYHRXeWzGPPqWZSOSXIdDE
	2zuQ6vql3nnHIax5Fi7D+PuxMXb4oF0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-668-hZsH7lK-M2qV3CGJC6vNLQ-1; Thu,
 22 Oct 2026 09:47:45 +0000
X-MC-Unique: hZsH7lK-M2qV3CGJC6vNLQ-1
X-Mimecast-MFC-AGG-ID: hZsH7lK-M2qV3CGJC6vNLQ_1792662463
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AF2931944B07;
	Thu, 22 Oct 2026 09:47:43 +0000 (UTC)
Received: from aesteve-thinkpadp1gen8.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D52D646C;
	Thu, 22 Oct 2026 09:47:41 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 22 Oct 2026 11:47:22 +0200
Subject: [PATCH v4 2/4] soc: qcom: smem: validate private entry list walks
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-port-smem-v4-2-b0baf39c6e01@redhat.com>
References: <20261022-port-smem-v4-0-b0baf39c6e01@redhat.com>
In-Reply-To: <20261022-port-smem-v4-0-b0baf39c6e01@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>, 
 Sarannya S <sarannya.s@oss.qualcomm.com>, 
 Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>, 
 Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792662456; l=4316;
 i=aesteve@redhat.com; s=20260827; h=from:subject:message-id;
 bh=mE91XEcqtFNyJt+Ikaa133Ok/DmRK1QvrgI3AdRArv0=;
 b=+H/ylY8IBC1ejcjNzjdM9fK1rnNUWbpmijO0Op2ti01/5cMjJCZAF9WL9/ioCdzQUlsm+nCe6
 U+dbWr1DvXbCKrPBOCSL+TvvsHg29f73W+KiHe4fnWCtSMO+3TvrRX9
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=zI2RBeZgocwYm3AkJW4CtjoJnKoDZrfBl1xe5Ed6h+U=
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

From: Sarannya S <sarannya.s@oss.qualcomm.com>

When walking private entries, use the uncached/cached free offsets as
the list bounds, require room for a header before dereferencing, and
reject a next pointer that does not advance.

Skip the cached list when the cached free offset is at the partition
end.

Signed-off-by: Sarannya S <sarannya.s@oss.qualcomm.com>
Signed-off-by: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
Signed-off-by: Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/soc/qcom/smem.c | 52 ++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 38 insertions(+), 14 deletions(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index 36a4a10f3aec..a6732832e2c5 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -422,6 +422,7 @@ static int qcom_smem_alloc_private(struct qcom_smem *smem,
 				   size_t size)
 {
 	struct smem_private_entry *hdr, *end;
+	struct smem_private_entry *next_hdr;
 	struct smem_partition_header *phdr;
 	size_t alloc_size;
 	void *cached;
@@ -434,19 +435,25 @@ static int qcom_smem_alloc_private(struct qcom_smem *smem,
 	end = phdr_to_last_uncached_entry(phdr);
 	cached = phdr_to_last_cached_entry(phdr);
 
-	if (WARN_ON((void *)end > p_end || cached > p_end))
+	if (WARN_ON(!IN_PARTITION_RANGE(end, 0, phdr, cached) ||
+			cached > p_end))
 		return -EINVAL;
 
-	while (hdr < end) {
+	while ((hdr + 1) <= end) {
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
@@ -605,7 +612,8 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
 				   unsigned int item,
 				   size_t *size)
 {
-	struct smem_private_entry *e, *end;
+	struct smem_private_entry *e, *uncached_end, *cached_end;
+	struct smem_private_entry *next_e;
 	struct smem_partition_header *phdr;
 	void *item_ptr, *p_end;
 	u32 padding_data;
@@ -615,9 +623,14 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
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
+	while ((e + 1) <= uncached_end) {
 		if (e->canary != SMEM_PRIVATE_CANARY)
 			goto invalid_canary;
 
@@ -639,21 +652,28 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
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
 
@@ -675,10 +695,14 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
 			return item_ptr;
 		}
 
-		e = cached_entry_next(e, part->cacheline);
+		next_e = cached_entry_next(e, part->cacheline);
+		if (WARN_ON(next_e >= e))
+			return ERR_PTR(-EINVAL);
+
+		e = next_e;
 	}
 
-	if (WARN_ON((void *)e < (void *)phdr))
+	if (WARN_ON((void *)e < (void *)cached_end))
 		return ERR_PTR(-EINVAL);
 
 	return ERR_PTR(-ENOENT);

-- 
2.55.0

