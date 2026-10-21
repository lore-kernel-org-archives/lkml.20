Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562860;
	b=WoldVlmiNF4zWGjdczient0tROMuBUea2f2o8l3F9sHzxDZKIfdnKYSVHC3VA2EtsfSQ
	 EMTzoy14gDbJ3x9W+FY+gsiMmwkZhdZ5mtYauluwy2GThBT5wkoCS104rucOfqGSYwdH4
	 tcBwxbPtSdn+wFvgdES1QRZgqxJVXNigrL5XBkeqlhXuZYUlHFPCiv3x29PY59AUwQ1vv
	 psLoAc43AZ0fNqQ5Rp5k2v6QD3o3zphlCHBnkUg6EppP/LMkimViwpwP8N4Wsum1rAfRA
	 god6WXDAJExPJeXmTzmLkgxOxzBizeCWANqZFvqJ7JV04JZ89L8EhbH4Yp+sVay68Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562860;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=hJTbezORZnYJia58M/w7jTBC+CsV7fk7tMYV5VsvrrY=;
	b=pip6vWZpOQ8Dw2fSHj2JbFpvNN0UBrpQ4m5A4bxAEQZd+PBlquu6m9NQD3cEtIGLaybF
	 1XYd5S+MqWV4sbtN8H6foO/eMK+tekYBmV3DVEuIj6qXI+LvNMHwriMOm0SukcnlwdUGw
	 zdAgZOic/8degK6LbXNqsPDBZCuvIdLuMovzdGORBjQO8uvg7RwmNnsrsgJ+2x9GFisGm
	 Qd2o4t5Lib9OgxpiXCBey1pcMPADXFgm/orODEfFymsHTBL+M84jVMQ4k50Vv+D5nqTjr
	 w0nRNwnYYCId1XoMfRl1t6yAUmejbIrZQrwJwfAVvRnEfHhvdmL3iJHLzhyvHet/23Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="NWZp/CLV";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8D4606A33C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:07:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B8D4606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NWZp/CLV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792562858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hJTbezORZnYJia58M/w7jTBC+CsV7fk7tMYV5VsvrrY=;
	b=NWZp/CLVC4d6x/Xj50c/vbG/E7mrdWmNsBrm8QUqthG/ZRsN0VvRnwBp5oAGsa3ata9JmT
	e1gUrIhAj0jos3K+H4YsN/EMkxnVoO8r8zQWqncWKaBYABYOiVTPBng/Piq3H7vWCxApOK
	n7EQAupe46TSpDgK7I+HJT1pw+7Z7v8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-516-LhCrz1F7PyyeUPBsoPOzHg-1; Wed,
 21 Oct 2026 06:07:35 +0000
X-MC-Unique: LhCrz1F7PyyeUPBsoPOzHg-1
X-Mimecast-MFC-AGG-ID: LhCrz1F7PyyeUPBsoPOzHg_1792562854
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 174E9180028B;
	Wed, 21 Oct 2026 06:07:33 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9266630001A2;
	Wed, 21 Oct 2026 06:07:29 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org
Cc: tamizh.raja@oss.qualcomm.com,
	julius@bairaktaris.de,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH v8 0/3] wifi: ath11k: implement TX flow control
Date: Wed, 21 Oct 2026 08:07:22 +0200
Message-ID: <20261021060725.242681-1-jtornosm@redhat.com>
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

This series implements a custom wake_tx_queue operation for the ath11k
driver to prevent hardware ring overflow issues under heavy traffic.

Without proper flow control, the driver experiences -ENOMEM errors
("failed to transmit frame -12") when the hardware TCL ring fills up.
These issues are more commonly observed in VMs with PCIe passthrough but
also occur on bare metal systems.

The implementation follows the pattern used in the iwlwifi driver,
adapted for ath11k hardware ring architecture, checking hardware ring
space before dequeuing packets from mac80211.

Testing shows stable operation with eliminated -ENOMEM errors and
improved throughput under heavy traffic conditions.

Jose Ignacio Tornos Martinez (3):
  wifi: ath11k: use queue mapping for WCN6750 ring selection
  wifi: ath11k: remove skb parameter from get_ring_selector
  wifi: ath11k: implement custom wake_tx_queue with flow control

v8: Split ath11k and ath12k into separate series to avoid conflict
    with Julius's airtime queue limits series (ath11k only) and help to
    unblock both
    No code changes from v7
v7: https://lore.kernel.org/all/20260917064825.12747-1-jtornosm@redhat.com/
--
2.54.0

