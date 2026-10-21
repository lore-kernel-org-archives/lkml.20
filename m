Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562983;
	b=jK2mrg4Rxg3z5ZUoPA2QixiYVk9znFPQef//yjfYcjbgFqybeyc2KgqL1GBuGD8h3Q4v
	 1H5DLqE42Dg0ofYtrnMON2N1ZkZpS8Awk0KSNW0fSjUxHHBC88yUyCdqfMnoBLc8LgobX
	 LpG9zZbKOKOiN3YA4gdyUQhq5QtZA4jRhmsoKQUbg0BDd2r/GjziJAjD/komdCQnUxlZg
	 wYr5NbVDsj8UeeVobFsttnkpoCGkGrJQie2/V25u7wEtrbmaF0PeBmp6KF7Rd0f28V5lb
	 EHWJ8j7F1/JNdS8m3SIgH8kHQ8Pq8K0b5ziieu6btZf6pDWRwEL0No2QV9xSvEodyng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562983;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=Y3Kbd4rECN07DcxByi+wY4G9Biu9iKfm+5QZE7UXzxc=;
	b=fwFCbyL7TwVL2Pg0AmL4xYzRI+O9MN5ps+WWJYgwPmn0jR0AF9o5wJ2DVh3MrvDyO+LW
	 Yks7IJc2HXqBqLcLNT7yrlqh+tVLoyBbmcm4j6Hrwt1tP4wn+XYi1ULIjkiBnXX3NIJM3
	 NCJG+a1uSR2aZPqaqnLZx/wQX8Gt6kNJODAfIzF8RJGUGIVzufZZ42A8mu3KCe57otaZE
	 biGri4CkN5Ifu0vJs8waaOK9nQaSTP/UBIHXfDMq1IBqAW0OLRrJgy7AqV1y4/heP/zBz
	 bDT3Y7MqSj0kXwHTHk/n0V1+wruM1u2+olHYkzdnWx3MGNhc9BJShbCkRjhYMg4Cy0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LkFUIp0f;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3B4606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB3B4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LkFUIp0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792562982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y3Kbd4rECN07DcxByi+wY4G9Biu9iKfm+5QZE7UXzxc=;
	b=LkFUIp0fPfD1gs6ovWe7solNwuywKSFoEoBZgzUecpxYOTmn/6CCkaef5fNIrMQ/2zxixk
	LIrwk9wHCduu2tyfLAUt1lGEz2MKDfhvwX9Y0InSHqjO6IFu2LtSCYAPCiuMh0L3jnDfar
	pKXKULknoUKlTOXJhmDxXg63u8VQMng=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-292-bItbCJ_LODKIpUzCS97Hhg-1; Wed,
 21 Oct 2026 06:09:40 +0000
X-MC-Unique: bItbCJ_LODKIpUzCS97Hhg-1
X-Mimecast-MFC-AGG-ID: bItbCJ_LODKIpUzCS97Hhg_1792562979
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E44751956065;
	Wed, 21 Oct 2026 06:09:38 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0A51B1800347;
	Wed, 21 Oct 2026 06:09:36 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH v8 0/2] wifi: ath12k: implement TX flow control
Date: Wed, 21 Oct 2026 08:09:29 +0200
Message-ID: <20261021060931.249629-1-jtornosm@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

This series implements a custom wake_tx_queue operation for the ath12k
driver to prevent hardware ring overflow issues under heavy traffic.

Without proper flow control, the driver can hang and experiences -ENOMEM
errors ("failed to transmit frame -12") when the hardware TCL ring fills
up. These issues are more commonly observed in VMs with PCIe passthrough
but also occur on bare metal systems.

The implementation follows the pattern used in the iwlwifi driver,
adapted for ath12k hardware ring architecture, checking hardware ring
space before dequeuing packets from mac80211.

Testing shows stable operation with eliminated -ENOMEM errors, no hangs,
and improved throughput under heavy traffic conditions.

Jose Ignacio Tornos Martinez (2):
  wifi: ath12k: remove skb parameter from get_ring_selector
  wifi: ath12k: implement custom wake_tx_queue with flow control

v8: Split ath11k and ath12k into separate series to avoid conflict
    with Julius's airtime queue limits series (ath11k only) and help to
    unblock both
    No code changes from v7
v7: https://lore.kernel.org/all/20260917064825.12747-1-jtornosm@redhat.com/
--
2.54.0

