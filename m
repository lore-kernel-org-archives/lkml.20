Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180058;
	b=WdrmkCCbMl+aC3z3Xc4BbUNhhMZapQW3iugAgmK5w/8P/9Ez0kr+vWBio/FUsjo3H8by
	 EWujzSnCSMnK9M1OPqbDZtpRvK56qKA5AjPQr2TQnH1K24KOUq3r7L4hZ3c8aPILV+40Y
	 oZ3Ie/4ryiCV19RNyQJXQl/zoLKB6Ni568y7evyS7Y2k70ecSlwSFbX1AfUv0HGBJCu+e
	 v1dDol89zAOgjPG5yiy9sYqB/igWUyuo5Ewj0qYZp5fbe3FQuNeFkCCtfgzhrCgdm89fP
	 1okNn7+ZjrXW+tM0zyD56HsGHh4IbBJzXCru3ZCdLva/7d1C5OBsjcg5rL8OVg1kx5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180058;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key:
	 X-Scanned-By;
	bh=CCbJ+BO1JlfijT/0BzMjTuvGDknndA2+q8daKpyEAow=;
	b=l2qVdY59/rhN8OL4yfLV86NwB2ExmQpm7hsjOMvAJCzoniSruGe8Exby+hTePOz+7C4q
	 hKcmAP2pZ67jP/7N9B+MfldqkFWf4Y4yZYjb6RtPHi7iTnwoMjuPJw/nFtQu3Dp7nyEOV
	 k+jtGzDUDeaejRmqCfzu9wJrmwKz1uZpEgTMx03O6Pid2HwG5XE1+pDMq2TDUe75SNAm7
	 NKJqNL+0DAzhWEtisXYKS1NfQsV7/NVtJia+tycAaYJWQyshNA85xO5icUpj/u26NyVog
	 GULH/an7YptGSdjlCxnM4MjxsruHsKoWFXD0/8eWxZD3t3+T7D7pp3OhWRe841wS1Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f3513EoD;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2035860A2606
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:34:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2035860A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f3513EoD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793180057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CCbJ+BO1JlfijT/0BzMjTuvGDknndA2+q8daKpyEAow=;
	b=f3513EoDBkIFAFk7iqxomPU6UThNaobXyFkcxC6VPgjfKwVFt/oO3ErpWAOnl4LDG9Fnzh
	99E0gzJrLkj4AYeMfdpXGr0G3gk4hkHr0HbNejthCOzqB1fLavdwyKui6nfmBoXnw79UsV
	wKCAZG8A6wBsuY0Fy9X5geEM0nL6q58=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-418-8-kmvEZ9MFG5HMfEkB1ucg-1; Wed,
 28 Oct 2026 05:34:12 -0400
X-MC-Unique: 8-kmvEZ9MFG5HMfEkB1ucg-1
X-Mimecast-MFC-AGG-ID: 8-kmvEZ9MFG5HMfEkB1ucg_1793180051
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9C7451955BD9;
	Wed, 28 Oct 2026 09:34:11 +0000 (UTC)
Received: from aesteve-thinkpadp1gen8.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 18E311955F10;
	Wed, 28 Oct 2026 09:34:09 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 28 Oct 2026 10:33:51 +0100
Subject: [PATCH v5 4/4] soc: qcom: smem: ignore multi remote host
 partitions
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
Message-Id: <20261028-port-smem-v5-4-121257d490b5@redhat.com>
References: <20261028-port-smem-v5-0-121257d490b5@redhat.com>
In-Reply-To: <20261028-port-smem-v5-0-121257d490b5@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>, 
 Tony Truong <tony.truong@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793180040; l=1329;
 i=aesteve@redhat.com; s=20260827; h=from:subject:message-id;
 bh=Q7Wde2EHrJsUZpWexzYuHb4VINAd7D+195kbI9ffQpE=;
 b=cvF1RxmPfdbyd5RcM15Tu/n14uN5lo19symHNBtBakVsPQNMU5uOzBBOTxRC1mTw3V6En+cbf
 QFm4tQrXIRGDYfkYUDSwDSxXLY+Qxtkw7LdrTj3iGVaRMJZp8vPWBJd
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=zI2RBeZgocwYm3AkJW4CtjoJnKoDZrfBl1xe5Ed6h+U=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

From: Tony Truong <tony.truong@oss.qualcomm.com>

SMEM now supports more than just 1-to-1 partitions. It is possible for
a partition to have multiple remote host and the logic to handle that
does not exist. For now, skip all partitions which has multiple remote
hosts.

Signed-off-by: Tony Truong <tony.truong@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/soc/qcom/smem.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index 36270d02e9ae..adcce6ab885d 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -89,6 +89,9 @@
 /* Processor/host identifier for the global partition */
 #define SMEM_GLOBAL_HOST	0xfffe
 
+/* Processor/host identifier for multi host partition */
+#define SMEM_MULTI_HOST		0xfffc
+
 /* Entry range check
  * ptr >= start : Checks if ptr is at or past the start of the region
  * ptr <= end   : Checks if ptr is within the region
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

