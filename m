Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793642273;
	b=TegSvV4vDU3YDAoBBdHYkjkMRKFfg0ia3ycw+NasNoSywwPz9DRE5H3HDhI1K55Buij2
	 aspc7rlED22HZnEXJc3/bZliwaIop/KDZ7ZdmEXw8Q84DvfPR49HRJZxfx2OHv1xhL1fk
	 rh5MYhWNXy+GBKqHdJdldTXh8UmFkNKFKoLEBUXR+h0lQV/o68pPzL0fdNURnVUxIwAdM
	 fE9H2sRGCTZvaxSAFq0K/FfzEcE5AJLfehkVPSyMoiktXT2s3QeoA1/Mb6yhEvgZp+HFM
	 0lkStcx4jQB1UF5uE2+ub/o2AfpRtrMYxkYp90ygugGUZruWE4jTKdY1WqQSKf7Wkxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793642273;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Z315d8rOKowv6IXdAf5MryJ4yd+EB7ArfeE3mgpBZio=;
	b=GC1yHKrQ7A0na+VcZn4C502bayxk82XhwhATg6y+rvZKC+IUNz2CY8g5wqijo22S+f6R
	 ldg8SzmbJt9z1objjP1irDyb93Qkc/qap09ihQz/u5GJSzznlGmWONts2+j8X7g2hd+mr
	 Irk5murN7nYIJg8ERPP200MYIlBtlPRYpBytQrxJCkTwyU/mx2gYU4zoI6VnB5GyG94kV
	 aDuKuyBHAwlp2a4lb5ewOHjfQhpR4C5MZoyM9u6g87cRac9T/5F+wuU1sB8NoBKMu4G9T
	 dP4vFiebk4Gb3Ch16h8Q1zNUef7VIjzVGncWnWC9UO2gV1orwDLgSP59rZZahwmM+sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b="Hh/64bkM";
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF66606E00C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AF66606E00C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Hh/64bkM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Z315d8rOKowv6IXdAf5MryJ4yd+EB7ArfeE3mgpBZio=; b=Hh/64bkMkyAvkJnSjmOEdQUO14
	LxyWJv8CHamAzgmzyCUBEsnck66xFTUG8NYQjxIS2c84DMTpjMgCyFWpMfWILcdVsU9lrDYdcmj8/
	IVhn3zfHZg5mp+KDJQ60lLzxLoHlI2ZyKAnNT/V/jSRlfNjcma2f7BTiKxPGSfP44BL8p4+VSDSVc
	H5tduT0kd6khxbZK1F7LBdvsZwivFWSz9n1xfklCAEYRNfrtZcQBtWyFn4sCQgxCcp9FucFPLtV7F
	KArcB5Xam0N6eVQSrxa1Qtw5VfeZzC2GT+S6dBbVaF4lOv6oocfXq01zisvpkongt/dVd0pGF5MAS
	QQzpbFYQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNwI4-0000000HXmw-2AeZ;
	Mon, 02 Nov 2026 17:57:52 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Leo Yan <leo.yan@arm.com>,
	James Clark <james.clark@arm.com>,
	Tao Zhang <quic_taozha@quicinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	Danilo Krummrich <dakr@kernel.org>,
	Mike Leach <mike.leach@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v6] coresight: coresight.h: add '*' to kernel-doc lines
Date: Mon,  2 Nov 2026 09:57:51 -0800
Message-ID: <20261102175751.2274430-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kernel-doc reports 2 (kernel-doc) lines in coresight.h that don't have
a beginning '*' in them, so fix these lines.

Also convert struct coresight_trace_id_map to kernel-doc format to
remove another warning.

Warning: include/linux/coresight.h:173 bad line:
  connected to @src_port. NULL until the device is created
Warning: include/linux/coresight.h:177 bad line:
  needs to be filtered.
Warning: include/linux/coresight.h:236 This comment starts with '/**',
  but isn't a kernel-doc comment.

Fixes: ec9903d6cc34 ("coresight: Add support for trace filtering by source")
Fixes: d49c9cf15f89 ("coresight: Rename connection members to make the direction explicit")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Leo Yan <leo.yan@arm.com>
---
v2: rebase & resend
v3: rebase & resend
v4: rebase & resend; add Andrew to Cc: list
v5: rebase & resend
v6: rebase & resend

Cc: James Clark <james.clark@arm.com>
Cc: Tao Zhang <quic_taozha@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Mike Leach <mike.leach@arm.com>
Cc: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 include/linux/coresight.h |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linux-next-20261030.orig/include/linux/coresight.h
+++ linux-next-20261030/include/linux/coresight.h
@@ -179,11 +179,11 @@ struct coresight_desc {
  * @dest_port:	destination's input port number @src_port is connected to.
  * @dest_fwnode: destination component's fwnode handle.
  * @dest_dev:	a @coresight_device representation of the component
-		connected to @src_port. NULL until the device is created
+ *		connected to @src_port. NULL until the device is created
  * @link: Representation of the connection as a sysfs link.
  * @filter_src_fwnode: filter source component's fwnode handle.
  * @filter_src_dev: a @coresight_device representation of the component that
-		needs to be filtered.
+ *		needs to be filtered.
  *
  * The full connection structure looks like this, where in_conns store
  * references to same connection as the source device's out_conns.
@@ -236,7 +236,7 @@ struct coresight_sysfs_link {
 #define CORESIGHT_TRACE_IDS_MAX 128
 
 /**
- * Trace ID map.
+ * struct coresight_trace_id_map - Trace ID map.
  *
  * @used_ids:	Bitmap to register available (bit = 0) and in use (bit = 1) IDs.
  *		Initialised so that the reserved IDs are permanently marked as
