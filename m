Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793289891;
	b=tminGAskRvrimiCEkNA10/NlsFX7naLU+4kV8OPNX7h2Wf1avJ7zFQnoMhBtsJB5zqGB
	 jgcOziUTENJtgNytqX+sYGlSw1XwjNL+YUTKUV7PwaA4BzIhp6rkgA2gR7ZKTTG1qEbT8
	 gzVa0nufrTiERIpvGnbmIIgCzZyb18WM5oMgeAZraaWtSfBqpldJ1CU5eN5WnHEKXdz0s
	 N94WYkH0PGbKwsi0ORDSSUMclJU/GwASxEHwXzCoH6Ud0UScBDgR+xv8Zq7WYbvGYrZh8
	 BIn/EOh7IQfh7mciCDcQ5uFP+eyIlMZI3pTwVlaTCR2B1pPjnGo483mfpSLJthtwdeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793289891;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=Ujti69uAXYq3nrNEejy8limZ43MgliAb4aAxtO/+OGE=;
	b=mjPdxl86FGtOKm91Gd/JzPVANitdVRgofnhxNolUyKvOF4wMYkANlAvFY9ne5hAPGE34
	 aG9LopZO3Wo23zFR0SZ+7gg8F1vbMUnf4aJil3nldhF64MZUKDQWXPxgOqQbY4Ya2/8D2
	 1aJ9PfeK5J1YjIvkHyyqP4M+EqJzDTSSElHwZj1P9OQXWTevGWNoZumKYJLpCoSmoYZAA
	 KyRkQutcUijEAjbLDVlbUuh8qf6/3z61NSm25FKTIySzO2QsJuHxKohFxg73JA2l67SLO
	 i6fJ4ikd9GE9ztPOqconhSdZLLAyk9MFK/dPXCEG/ioNlm/vxMFEpwQ3ent5efh/6vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OlYLzhR4;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1660F606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1660F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OlYLzhR4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793289890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ujti69uAXYq3nrNEejy8limZ43MgliAb4aAxtO/+OGE=;
	b=OlYLzhR42Qi83y/JGRJMf0p54MGey/4SGilKG0sM+x7aIlc4QM65lhN6gqVTjx6bFm+WG2
	xqqg7cB5d/svpu/SbXXTRbveDb+GQP/wLUMbdx2YP4zZkU4JIiEhOWOlBsgq4+/d0BkTs2
	//VdbxmT4gk1vWIOBHSnsJbYr5BBymA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-313-djN2mtQlNgiWl8wg_aSqvQ-1; Thu,
 29 Oct 2026 12:04:47 -0400
X-MC-Unique: djN2mtQlNgiWl8wg_aSqvQ-1
X-Mimecast-MFC-AGG-ID: djN2mtQlNgiWl8wg_aSqvQ_1793289886
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 27730195FDE8;
	Thu, 29 Oct 2026 16:04:46 +0000 (UTC)
Received: from jtaubepe-thinkpadx1carbongen12.ibmlowe.csb (unknown [10.22.80.33])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6132F30002CB;
	Thu, 29 Oct 2026 16:04:44 +0000 (UTC)
From: Jesse Taube <jtaubepe@redhat.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Nimal Prabudoss I <nprabudo@redhat.com>,
	jmeneghi@redhat.com,
	Nilesh Javali <njavali@marvell.com>,
	Manish Rangankar <mrangankar@marvell.com>,
	GR-ETH-Storage-Upstream@marvell.com,
	Jesse Taube <jtaubepe@redhat.com>
Subject: [PATCH] scsi: qedf: Remove unesseary function call
Date: Thu, 29 Oct 2026 12:04:43 -0400
Message-ID: <20261029160443.904468-1-jtaubepe@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

The result of `skb_transport_header` was unused. Calling this function
warned when `skb_transport_header_was_set` returned false causing a
panic on debug kernels.

Signed-off-by: Jesse Taube <jtaubepe@redhat.com>
---
 drivers/scsi/qedf/qedf_main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/scsi/qedf/qedf_main.c b/drivers/scsi/qedf/qedf_main.c
index da429b3a4283..f2bc0ac684e0 100644
--- a/drivers/scsi/qedf/qedf_main.c
+++ b/drivers/scsi/qedf/qedf_main.c
@@ -2496,7 +2496,6 @@ static void qedf_recv_frame(struct qedf_ctx *qedf,
 
 	/* Pull the header */
 	hp = (struct fcoe_hdr *)skb->data;
-	fh = (struct fc_frame_header *) skb_transport_header(skb);
 	skb_pull(skb, sizeof(struct fcoe_hdr));
 	fr_len = skb->len - sizeof(struct fcoe_crc_eof);
 
-- 
2.56.0

