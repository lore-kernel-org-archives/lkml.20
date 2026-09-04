Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3FA4EC646
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535154; cv=none; b=fNkUdEyhv7ZVkALnP3yFGjLhK+Mtp8kTLPPfKvEAmtvmvjBPmgJUbtCfkqTUsgLtkKX3t9hF1++2rKf3oHvCT9Xoo0q3F7e4IJ956f7x3zcSnxONHzdyc+SU0VcYmdAeVuJgt9Yj//UgRgcQSp2WBbXrFYDCD6CVhNHGstRWm0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535154; c=relaxed/simple;
	bh=YZazT4oZjVEcdtqEOh2rjHMVg3XbWfyLZ1BTcqpcZJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YwNZyib74g3VCjg8EqKzrj8RwjK7zho6Q9QvRUnBb0DKgMlpdEDztHjc1JsHEic4pXmy0p/O93pC2hO7uF0vMejNCLaJ//WJlaanaWdaVY1j72y24sow8RvyxwOk6SBGn27efTmynNDF+2DCVZGFmrNt35SxEjKvmq8XOXH6lSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HZ/uOW64; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HZ/uOW64"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788535151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B4EvanRHS6J3ohripixRgJnTJuSPOhK6F9EanOjwirY=;
	b=HZ/uOW647RDJfKp4NyiLaNFqkCBB5OhnywR1T1Cx5+XXpyrW4FoZHSQjPcMQoxZpo9Yre/
	kUF79hFKBtCFzOEdEUlky6BShH9ZE+jChd5oRq2VBbLlFvU7F8T6U+bqi0HQhkRWePjJPp
	mpNd/1ngaYBAJeFrfCH1p/XWULh/8sE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-44-Qcwl6sO1PkynxBkbeiipeQ-1; Fri,
 04 Sep 2026 11:19:03 -0400
X-MC-Unique: Qcwl6sO1PkynxBkbeiipeQ-1
X-Mimecast-MFC-AGG-ID: Qcwl6sO1PkynxBkbeiipeQ_1788535139
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 89EEA195FE03;
	Fri,  4 Sep 2026 15:18:59 +0000 (UTC)
Received: from aesteve-thinkpadp1gen8.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3F1F118005B2;
	Fri,  4 Sep 2026 15:18:58 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 04 Sep 2026 17:18:48 +0200
Subject: [PATCH v2 2/2] soc: qcom: smem: ignore multi remote host
 partitions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-port-smem-v2-2-bb497dd3c48b@redhat.com>
References: <20260904-port-smem-v2-0-bb497dd3c48b@redhat.com>
In-Reply-To: <20260904-port-smem-v2-0-bb497dd3c48b@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>, 
 Tony Truong <quic_truong@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788535133; l=1296;
 i=aesteve@redhat.com; s=20260827; h=from:subject:message-id;
 bh=cdDVa0xgpM9uyB7LE+x2F1bNpsmjlD7ehAPULbKbtP8=;
 b=o68sOhK8wCTeNniQDA2swgYAbvu/N9nqEpA5HWuIRWAoHdLHVEpRjpQyCVHR/lzIlImAXUHAC
 9yeErdQ+B9iDuLigCCi+vZvK2YKtPI/cIvzhFb49ALOeCc0JMcU/jS2
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=zI2RBeZgocwYm3AkJW4CtjoJnKoDZrfBl1xe5Ed6h+U=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

From: Tony Truong <quic_truong@oss.qualcomm.com>

SMEM now supports more than just 1-to-1 partitions. It is possible for
a partition to have multiple remote host and the logic to handle that
does not exist. For now, skip all partitions which has multiple remote
hosts.

Signed-off-by: Tony Truong <quic_truong@oss.qualcomm.com>
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/soc/qcom/smem.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index 1456ff6df293..6c59eef6015e 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -89,6 +89,9 @@
 /* Processor/host identifier for the global partition */
 #define SMEM_GLOBAL_HOST	0xfffe
 
+/* Processor/host identifier for multi host partition */
+#define SMEM_MULTI_HOST		0xfffc
+
 /* Entry range check
  * ptr >= start : Checks if ptr is greater than the start of access region
  * ptr + size >= ptr: Check for integer overflow (On 32bit system where ptr
@@ -1091,6 +1094,9 @@ qcom_smem_enumerate_partitions(struct qcom_smem *smem, u16 local_host)
 		else
 			continue;
 
+		if (remote_host == SMEM_MULTI_HOST)
+			continue;
+
 		if (xa_load(&smem->partitions, remote_host)) {
 			dev_err(smem->dev, "duplicate host %u\n", remote_host);
 			return -EINVAL;

-- 
2.55.0

