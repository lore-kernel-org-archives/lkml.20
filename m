Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180051;
	b=zWqv0N5WZayP6Cyl98LluKgEv6x5kv4wwvUsVrH0fn+/KuR/d+D40CRsZSm+e8NQFtrQ
	 cPVJOfkzwZbg5l1BA82gdHum+sND6HTlUbghlUqj5bkovO6TyCqfyPAFLEvKgDZ9SKx9W
	 X0xjzH5bzT/XvqivefudklNREbElCAl1DvUsJZSjB2uMfQcjno4oMFNspibnMzq6Hq/7T
	 WdpsrcTramwzr0TDdndZze6pMeb5OT0xKRhTFK46ud5ZarKfID6HXS6aGNBdYK1ktbKxX
	 DF3dpoisMgpIDDTsJTP2X1KyOq4JcidlbYFmI7Ez4pKyXemjYZAg14vj8O8tauhnWvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180051;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key:
	 X-Scanned-By;
	bh=ICAmfze6n6YnP/u9vi5QuN93fFvHDdr6WROQqylMw18=;
	b=iL7A0qQZ4H3YC7ML0ViTCfciMQVMpv3UyP99ZjexdDV4Y5zA6e3doKPs9Mi9jcRsWnWr
	 HXsT9+kobcBUC8rRZFteCGlMb062O3TXHcSKPlDrWGnKy/qZ1+t6r7i823hwz2zNm8sFi
	 rMy7yESHnD4IwOlIOmCvuLZa4pUcm/7UBZQOAKQd/Gc45uMoYeRscMLfNJcyXIFiITln9
	 bHdC8lSztubeNfT1vOYHn+hg0roOIdYdAj/+e9qCMMKsrKfYbg2hC+EPCBYjxzQYN11FM
	 po10ZWYaY1ZD61yX7S56YQKdWDiGsBgpfsEw7RUQC9VVOhJUqXxxKoKBPl6hh+0o9YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RYlDdtc2;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F1D606A327
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64F1D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RYlDdtc2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793180050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ICAmfze6n6YnP/u9vi5QuN93fFvHDdr6WROQqylMw18=;
	b=RYlDdtc2hY/w/oQ+cb+92CQ5cBuj8GQGVkG6uiyJap4u7P0SgkfYfDk03Aguvz1YZuONiU
	AQ/4YbsRHqZUOmT4/jmVZhBpIA0y8ZfVuWvRTT0hP6MlztYKKzSkL+HJ1R2Vnc30ZhpI+L
	vfpcL7SaXPtGJmVwdis4mY5QuWri4ro=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-656-x-a7BnS4OsuJ9M88YEBnnQ-1; Wed,
 28 Oct 2026 05:34:06 -0400
X-MC-Unique: x-a7BnS4OsuJ9M88YEBnnQ-1
X-Mimecast-MFC-AGG-ID: x-a7BnS4OsuJ9M88YEBnnQ_1793180045
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 74DED180086F;
	Wed, 28 Oct 2026 09:34:05 +0000 (UTC)
Received: from aesteve-thinkpadp1gen8.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7F3D51955F25;
	Wed, 28 Oct 2026 09:34:03 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 28 Oct 2026 10:33:48 +0100
Subject: [PATCH v5 1/4] soc: qcom: smem: add IN_PARTITION_RANGE helper
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
Message-Id: <20261028-port-smem-v5-1-121257d490b5@redhat.com>
References: <20261028-port-smem-v5-0-121257d490b5@redhat.com>
In-Reply-To: <20261028-port-smem-v5-0-121257d490b5@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>, 
 Sarannya S <sarannya.s@oss.qualcomm.com>, 
 Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>, 
 Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793180040; l=1760;
 i=aesteve@redhat.com; s=20260827; h=from:subject:message-id;
 bh=V3akou17+6Liwpg5bnAy+1NU1pDRfXM3/SDAGBgnDkw=;
 b=J96SmFy7PAIeRcsnCRSOOiAYCZqMmpwdOMDq5HCdC286OKnRvDxzkwNp4FrFFcxAdSL9veVva
 e0NLNJMUoTBAhJ1LmndvNoHk6ggOF5s2UyCQlmL98AbdHMAM9nWfqAC
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=zI2RBeZgocwYm3AkJW4CtjoJnKoDZrfBl1xe5Ed6h+U=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

From: Sarannya S <sarannya.s@oss.qualcomm.com>

Add IN_PARTITION_RANGE() to test that a pointer lies in [start, end]
and that pointer + size does not wrap.

Signed-off-by: Sarannya S <sarannya.s@oss.qualcomm.com>
Signed-off-by: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
Signed-off-by: Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/soc/qcom/smem.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index b5e7bd8c1512..36a4a10f3aec 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2015, Sony Mobile Communications AB.
  * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/debugfs.h>
@@ -88,6 +89,18 @@
 /* Processor/host identifier for the global partition */
 #define SMEM_GLOBAL_HOST	0xfffe
 
+/* Entry range check
+ * ptr >= start : Checks if ptr is at or past the start of the region
+ * ptr <= end   : Checks if ptr is within the region
+ * size <= end - ptr: Checks if size fits in the remaining space, using
+ *                    uintptr_t subtraction to avoid pointer overflow UB
+ *                    (safe because ptr <= end is checked first)
+ */
+#define IN_PARTITION_RANGE(ptr, size, start, end)		\
+	((void *)(ptr) >= (void *)(start) &&			\
+	 (void *)(ptr) <= (void *)(end) &&			\
+	 (size) <= (uintptr_t)(end) - (uintptr_t)(ptr))
+
 /**
   * struct smem_proc_comm - proc_comm communication struct (legacy)
   * @command:	current command to be executed

-- 
2.55.0

