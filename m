Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C414825A8
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255478; cv=none; b=uIpfWanxYR+odgKPNtW5krURY5xjJ6xRlZs0cXWIBJNp1X1C5Ye4IwixsqlwaIcgrCMXdR67DAvVNtQyzBSwwh9prTgoQuvZdohaHpzb06258KAF+yrArbvBudKx0WuPbz/J/BPPgKZwjE963BiIZwUtA7NefmvIylmyPrN35LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255478; c=relaxed/simple;
	bh=me56oTO/TOBSqsm3f2x4P/XfTor+iq5IBnVYHVS2BVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r4AZF8uQ7w6etbhpy16s/ajLHKIx/TZE6WI/Z13aSnk4yQBnRXajoV1yIFbRQCPC+WCkeLVimPNPDP+0iOE9OD9GY0e4jcpva1vpFlQjlB7MGbFHDqaS19J1HevGXq1Q5PSbLQH5VwRwmYL9Tt/OAHCL35hzfzfMJni3PUbe0s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S4Xu7sOI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S4Xu7sOI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790255474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CK9h24tbKUqAp/U2G5VravT+5URHwmwyNjh2EclKSmQ=;
	b=S4Xu7sOIghXPkM6uYreyH81h1wQ6mwaCpIW1Qkyj1kYhiUM47fodRXAl3qMtsXZ5b6fao+
	Ptz2rlTvjYD1AZnKlKyQbZsvHlAKMkkATpHbEA/ErD4beMiyvu3JtVkuhvRT9VJwl5h0Ca
	Vw6G32qd4M2RQLxeaSdb9LvjCwFd05A=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-500-osQ3COd8PReZyKXmPefo_Q-1; Thu,
 24 Sep 2026 09:11:12 -0400
X-MC-Unique: osQ3COd8PReZyKXmPefo_Q-1
X-Mimecast-MFC-AGG-ID: osQ3COd8PReZyKXmPefo_Q_1790255471
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3746C1828ABD;
	Thu, 24 Sep 2026 13:11:11 +0000 (UTC)
Received: from aesteve-thinkpadp1gen8.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B03B31800586;
	Thu, 24 Sep 2026 13:11:09 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 24 Sep 2026 15:10:38 +0200
Subject: [PATCH v3 4/4] soc: qcom: smem: ignore multi remote host
 partitions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-port-smem-v3-4-fbc2ea81a654@redhat.com>
References: <20260924-port-smem-v3-0-fbc2ea81a654@redhat.com>
In-Reply-To: <20260924-port-smem-v3-0-fbc2ea81a654@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>, 
 Tony Truong <quic_truong@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790255460; l=1357;
 i=aesteve@redhat.com; s=20260827; h=from:subject:message-id;
 bh=3ju3KHFjQna22sHC5wqI6gfy3u13jdoSmHuNzJTX+nA=;
 b=0rZdUYJc1AZKljjzwEOoHoqIefdC1AodXci5myT0K27k7nn52im+FjER1xb1rjOIGlD+PkbXy
 mSB0YZZkv0NCRH64xwdAaaa2T0wJFHLzApFOuzhKhAH8h3z5kK5NOWE
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=zI2RBeZgocwYm3AkJW4CtjoJnKoDZrfBl1xe5Ed6h+U=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

From: Tony Truong <quic_truong@oss.qualcomm.com>

SMEM now supports more than just 1-to-1 partitions. It is possible for
a partition to have multiple remote host and the logic to handle that
does not exist. For now, skip all partitions which has multiple remote
hosts.

Signed-off-by: Tony Truong <quic_truong@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/soc/qcom/smem.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index 393257cbe5e1..a7a1840b7ff7 100644
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

