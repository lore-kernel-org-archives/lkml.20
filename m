Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931A64A3407
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790346589; cv=none; b=WAKvYoOWaRckn2Vb6So6Yb7hGbCSjpS5LsVcrnstTDrQ5yqYBLrE7crjGsSn3/MfFei17CrpvpxFBbj/dD5T2K6qnVmeffVF/RLvW3W1wnNd942wXkvwnuYrWC6Cm0Wp3YoSEyXVr3ADYIGSf8LknSewEleE7SZnA+maVtQ3vtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790346589; c=relaxed/simple;
	bh=PWZvnkYk4j5lxDWm8Nz3civdTN+Qjc+xt8P1Jw8bG4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qb9akHGqaaDMeDUbzU0ZtQRVkM92fsyIn8WQnDTfd/xKs8HIRXyk04Z2sPO77ze3rM1XQsHj9t54pENXC4V9MNbwQtXeRhcSrLFX3R46Xc+7YYv41WY4AOzyL57Bayiav0CoEP9HMgZK2nOEZyL2BfE3faq25TSVTA+adfrQ23Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IyU7+kv9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IyU7+kv9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790346587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p0801dME+Nec+aIbveYMnaYOUO+rYxmuXL3X0xbe0kQ=;
	b=IyU7+kv9fBsrqSjOqAwiEYmJlqFpyUI5A2eGAJR4WQpC9FlDs5Bix8gKPZF6ncS3GbiELQ
	H02LWXEVzAorBROI8Jt9PXbaxp4uPwti6VqeQ96pQOeNBCsiTvU0hD05h804HUVZ7E2wGw
	0YDMwtF5qgLFzpcA4CJqR7gJ1qRcNZM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-694-ATmn_pKBPUKIv2Xa5K1VnA-1; Fri,
 25 Sep 2026 10:29:43 -0400
X-MC-Unique: ATmn_pKBPUKIv2Xa5K1VnA-1
X-Mimecast-MFC-AGG-ID: ATmn_pKBPUKIv2Xa5K1VnA_1790346581
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 974CD1953979;
	Fri, 25 Sep 2026 14:29:41 +0000 (UTC)
Received: from jtaubepe-thinkpadx1carbongen12.ibmlowe.csb (unknown [10.22.88.172])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3B371418;
	Fri, 25 Sep 2026 14:29:39 +0000 (UTC)
From: Jesse Taube <jtaubepe@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-scsi@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	John Meneghini <jmeneghi@redhat.com>,
	Chris Leech <cleech@redhat.com>,
	Saurav Kashyap <skashyap@marvell.com>,
	Javed Hasan <jhasan@marvell.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <mkp@kernel.org>,
	Nimal Prabudoss I <nprabudo@redhat.com>,
	Jesse Taube <jtaubepe@redhat.com>
Subject: [PATCH] scsi: bnx2fc: Drop unesseary call to skb_transport_header
Date: Fri, 25 Sep 2026 10:29:37 -0400
Message-ID: <20260925142937.2051868-1-jtaubepe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

The result of `skb_transport_header` was unused, previously it had no
side effects.
commit 66e4c8d95008 ("net: warn if transport header was not set")
Added a check to prevent accesses to an uninitialized transport header
under a CONFIG_DEBUG_NET environment. Sence `skb_transport_header` was
called with an uninitialized transport header, it triggered a warning
case and a subsequent system panic.

Remove the unesseary call to `skb_transport_header` eliminating the
warning assertion and prevent the subsequent system panic.

Signed-off-by: Jesse Taube <jtaubepe@redhat.com>
---
 drivers/scsi/bnx2fc/bnx2fc_fcoe.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/scsi/bnx2fc/bnx2fc_fcoe.c b/drivers/scsi/bnx2fc/bnx2fc_fcoe.c
index c95b084cad69..3bff781d0531 100644
--- a/drivers/scsi/bnx2fc/bnx2fc_fcoe.c
+++ b/drivers/scsi/bnx2fc/bnx2fc_fcoe.c
@@ -533,7 +533,6 @@ static void bnx2fc_recv_frame(struct sk_buff *skb)
 
 	/* Pull the header */
 	hp = (struct fcoe_hdr *) skb_network_header(skb);
-	fh = (struct fc_frame_header *) skb_transport_header(skb);
 	skb_pull(skb, sizeof(struct fcoe_hdr));
 	fr_len = skb->len - sizeof(struct fcoe_crc_eof);
 
-- 
2.55.0

