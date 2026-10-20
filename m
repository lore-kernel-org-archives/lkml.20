Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500670;
	b=hcFgggiKFUQz4B54IqYXET6Um+eDjVikeBuej6MzE7a+hom6BGxavOzzu665XR1pACoI
	 Rt6K8iETNN10S16/1glhmL7P+Q4A6VvjCx7z6kBQ8lfUJmvlx6WS1cS2eP5u+YVabD+td
	 4HVS4iNv6eW1Ua5QVTXp5Klt2gmXc10O5ihXvFeIcy6QwqqQ/SYjOV9wE6vK3wBme/Rj1
	 j6phY7dtRdhAS2IV7eddxb4Wi6L9Nq/vSEDgBTNb7PbyMvGMjqrW1f5bahRbgPyh8fefX
	 8foKI2OEctbdZroybpNdG+ab0ppbK4pC0pEbFUxXaPlzS8/rCGpwPH7SS0DstXQe2Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500670;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Scanned-By;
	bh=YxottX/ImyknSsFNy+uHufp0WQNNy3hoX9V92370Wdg=;
	b=jrssyuItYfX5zx7zFJRa9UpABPBqi7WM32EncH06btdrXtHF3Tt5NnRL/l81EchDka6f
	 IaCV8o1uNidJTLQ2TMuvLEwguRERXj53X1TFUiBcJ+w1h7VsvoiIJdbyoCBDN6m5jAd5S
	 e0SkR3o0jaCpjjRfX4kmF3KNX8mK3s9W+udhaskmidWUmB2YoGgkqQUpUcVX9TKIP5R0I
	 St+yirOyefQx9+7fB1/7/Y3wf6Nrb7u89q36bpM14G58w6qSIjrfyVO6ZSEMIAUabzHWw
	 I37HFedro+2q/8lLdhIC/+e/roUetkpEnt9/+owuo+xut0g6/PDF+sOG54GQ5DKWXFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PZH1BT0f;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B957A606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B957A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PZH1BT0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792500668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YxottX/ImyknSsFNy+uHufp0WQNNy3hoX9V92370Wdg=;
	b=PZH1BT0fTtk2T5NPZlxrwxMWNW/13cAOP6A9Us5jT+I6IVA2FkGvtZZu5P1UTzPwUp273Q
	5zOujvS/z5ckzt9zDeZ2HAmElYz9vGMMTnntw3b4VvvykUjSWwb/iexf2mcQzTiNw8UOyD
	PeadSRo+o1+/hBFlgiw6soxvezuugFA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-696-wnZYHm72PJuDxZ9TrXFQ5w-1; Tue,
 20 Oct 2026 12:51:05 +0000
X-MC-Unique: wnZYHm72PJuDxZ9TrXFQ5w-1
X-Mimecast-MFC-AGG-ID: wnZYHm72PJuDxZ9TrXFQ5w_1792500664
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0EEA61955EAB;
	Tue, 20 Oct 2026 12:51:04 +0000 (UTC)
Received: from loberman-thinkpadp16gen3.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D48CA1803A51;
	Tue, 20 Oct 2026 12:51:02 +0000 (UTC)
From: Laurence Oberman <loberman@redhat.com>
To: linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>
Cc: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	=?UTF-8?q?Kai=20M=C3=A4kisara?= <Kai.Makisara@kolumbus.fi>,
	John Meneghini <jmeneghi@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: add Laurence Oberman and John Meneghini as SCSI tape driver maintainers
Date: Tue, 20 Oct 2026 08:50:59 -0400
Message-ID: <20261020125059.1797559-1-loberman@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

The SCSI tape driver (st) is currently marked as orphaned. Add
Laurence Oberman and John Meneghini as co-maintainers and change the
status to Maintained.

Also add a link to the tape_tests repository, which contains the test
suite used to validate the st driver.

Kai Mäkisara, the previous maintainer, has agreed to this change.

Cc: Kai Mäkisara <Kai.Makisara@kolumbus.fi>
Signed-off-by: Laurence Oberman <loberman@redhat.com>
Signed-off-by: John Meneghini <jmeneghi@redhat.com>
---
 MAINTAINERS | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4ad924aeaf16..10bde5d86026 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24576,8 +24576,11 @@ F:	include/uapi/scsi/
 F:	include/ufs/
 
 SCSI TAPE DRIVER
+M:	Laurence Oberman <loberman@redhat.com>
+M:	John Meneghini <jmeneghi@redhat.com>
 L:	linux-scsi@vger.kernel.org
-S:	Orphan
+S:	Maintained
+W:	https://github.com/johnmeneghini/tape_tests
 F:	Documentation/scsi/st.rst
 F:	drivers/scsi/st.*
 F:	drivers/scsi/st_*.h
-- 
2.56.0

