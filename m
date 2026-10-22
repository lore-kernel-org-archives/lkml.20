Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662477;
	b=XxRkLo/btyfa2I6AomUrw/aL8qSyXn3J7jkuIOPgEKyAq1P488MfJx+ZyfkYA1FqC+Gp
	 BMHDt0qWTbeYsp3AjQp5TrKZuNlXAfBjGl7LMFtBopq1GmcLFepor2nIPAClYWEbPVWns
	 85NQZ1peu92BORb2bKkSnjj6bbZgKgbk+a/iHa4Xz3X2rZ79g+91Ge4oyqQieJsdCh+F1
	 xpkq1B2DyzJo8s2Nk6A+YeI2mIPnSv35cQ2C1oElGvK+eftxo7AuAOtc0iTXODU7xxp0f
	 DtK5TirAXZ3O12+Om+AyBnXfYD+pqDVMOlBR21elZCrU9ROzJaf20cZvX11j6zLFFTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662477;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key:
	 X-Scanned-By;
	bh=X22AD0vYubTc+ccTQNmqy93UI0JvVcQxo8VVsS3mFCQ=;
	b=CHVg1xumGh+xK1jsJkynUAnQWSVtlmQXgMEh/MTOWG0SqDEgOyQ6oFI8USFfE6ViQjK4
	 DPVzI9aELeBGy3yDcNM9Oye0aMf5EQkpNKToTF3yTHtzLi01aTCiIh4K7+NvhKrD6PSYR
	 n1gljfJJ7fzkiwvdwJCds4VboWfa4JwXNhXC1Ha4mfzAqvw2iJuUlVz9RnPsmTUwW3dXY
	 60SJurhtdE53/dVA4rdxjyE/3hq3Pu/CU46tHPbmHadHVPT+jbH5GJbZfRUQiTPZwkHzu
	 f5KUQZremRRegbebSPWKt8k6142XnBr5rw/5E3QtCsoO+TqzPBcXfh/EI/dKYPSOWPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="dE9/0i/y";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA69606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EA69606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dE9/0i/y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792662475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X22AD0vYubTc+ccTQNmqy93UI0JvVcQxo8VVsS3mFCQ=;
	b=dE9/0i/yt+NhKpeYBhrn6X6qH2BwxACqqfFwQfLPpByxOs1ffGi5XrlIVlv2GyIs5xl8uG
	bCbbalXv3u43VoNw7QT/iqTg7JBUIazXBO55icTTqON0HuRlzPI3MwUFuaewf3toZIhk1r
	jSh4TG5YvsrtgfDAbT82uQCMKMWmKLY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-557-UxGTvMQLN-6XNSynZQL4Ew-1; Thu,
 22 Oct 2026 09:47:48 +0000
X-MC-Unique: UxGTvMQLN-6XNSynZQL4Ew-1
X-Mimecast-MFC-AGG-ID: UxGTvMQLN-6XNSynZQL4Ew_1792662467
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A33711956071;
	Thu, 22 Oct 2026 09:47:47 +0000 (UTC)
Received: from aesteve-thinkpadp1gen8.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 25FA146C;
	Thu, 22 Oct 2026 09:47:45 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 22 Oct 2026 11:47:24 +0200
Subject: [PATCH v4 4/4] soc: qcom: smem: ignore multi remote host
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
Message-Id: <20261022-port-smem-v4-4-b0baf39c6e01@redhat.com>
References: <20261022-port-smem-v4-0-b0baf39c6e01@redhat.com>
In-Reply-To: <20261022-port-smem-v4-0-b0baf39c6e01@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>, 
 Tony Truong <tony.truong@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792662456; l=1329;
 i=aesteve@redhat.com; s=20260827; h=from:subject:message-id;
 bh=DfSVUAa1mrcUCXrzkJpyjgggYzlVBGuX+zFRG4vH0Wc=;
 b=0Kk+3lLjGiTNogQBIn+/oTbW/80XsTXeZI1qTzqKnh/JHIf2HB2bHH1ZLbySdghZPb8EL0SaB
 bF1rGYeClTEA2wkpCHyPb4dDCvkqE2MYt0bXaFwu2JHDa/jSGgR/Iet
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=zI2RBeZgocwYm3AkJW4CtjoJnKoDZrfBl1xe5Ed6h+U=
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

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
index f34eaba230ad..be6dce55f8d2 100644
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
@@ -1092,6 +1095,9 @@ qcom_smem_enumerate_partitions(struct qcom_smem *smem, u16 local_host)
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

