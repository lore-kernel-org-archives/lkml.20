Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253180;
	b=xi0F/uG/0u6KbV5EplwhRqpH8RV8GnpwShbac5q/xr3cewJ68aejrjsqyLZYMVttjg6W
	 aHUHkSwnxglBCDhJ6k8ZH+4bH6bHZ+yIHcF5mILNT6Q513thdY7vwsix4M3qpAVBejaSL
	 uvaHyhsc/sg4JTEZcfSzwuDGev1FiyfT95SX5K0UNlRm8daa6wUnjRWIG5WOznVaBrmx4
	 HBE+MbN/XunpALV0SuLJEOnbcVq3Z9ScPin8jzxV6abVuf6oUZTcpiCv8Xm/HMO+P5T3c
	 EtM5Z2BEg5B7cTcSS1Z5bEOLRJxnqOuoLhS5Hv6MQRe3v+mhxRe629HbeCvoSKVYTRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253180;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:
	 X-Scanned-By;
	bh=e88sGOaf8naSU5yJw1LRL2JX3D71whzaUkfVTT4pmiU=;
	b=0MZVTMenjF1Whwito5iktAFwIM/5qln1z1O1xamDxf+JFcvyqViz4YQcABj3Q+8It7LB
	 pBGgQqJpN0Epz0j2RgaX/eX67MXShEb1D2J3TSzYtf4LM5UrABRYt23sEIDV4qYxDWGcx
	 jSvYWgBDc0+Cilm5aDUdYj0csQagzfu8F0SYJi/dDgSi7xDnuPBBgU+mgK4cJEkfMOgkQ
	 pjX7NF3meub15fUI2n/07xIHrZdLfjdYBZc+1NwbfLbRgTcLGbZJdFjOqzNQWUK1jB6hP
	 7fbt6E7ITzNRg0u0bhjTGLL3fOdfo60PbUVlIA58jNtmCZtHqcejIV5ukqHBUHNEtFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="g2gwTpg/";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C550260A2618
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C550260A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g2gwTpg/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794253178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=e88sGOaf8naSU5yJw1LRL2JX3D71whzaUkfVTT4pmiU=;
	b=g2gwTpg/KjLvatVSh+OOUXtMlPP9IzsFLQ6mk8Q8RDjUGPr33Za2CT92+yV/d/ke+L9hOc
	YO6V3Dp4lDNV9TiYgacQTIiYlKL8FQwzR+Pay5b9tAr5tTsu5hGD9LWPtRCXeg/1fBZvVj
	5gQS9HwJdbqY7sSspiSprBjsdb3v+vU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-551-uW_G6uEGMlOwOJcOACFO0Q-1; Mon,
 09 Nov 2026 14:39:33 -0500
X-MC-Unique: uW_G6uEGMlOwOJcOACFO0Q-1
X-Mimecast-MFC-AGG-ID: uW_G6uEGMlOwOJcOACFO0Q_1794253171
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4F1FC1977321;
	Mon,  9 Nov 2026 19:39:31 +0000 (UTC)
Received: from bmarzins-01.fast.eng.rdu2.dc.redhat.com (bmarzins-01.fast.eng.rdu2.dc.redhat.com [10.6.23.12])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E05531956089;
	Mon,  9 Nov 2026 19:39:30 +0000 (UTC)
Received: from bmarzins-01.fast.eng.rdu2.dc.redhat.com (localhost [127.0.0.1])
	by bmarzins-01.fast.eng.rdu2.dc.redhat.com (8.18.1/8.17.1) with ESMTPS id 6A9JdT86595121
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 9 Nov 2026 14:39:29 -0500
Received: (from bmarzins@localhost)
	by bmarzins-01.fast.eng.rdu2.dc.redhat.com (8.18.1/8.18.1/Submit) id 6A9JdRH7595112;
	Mon, 9 Nov 2026 14:39:27 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@suse.de>,
        Keith Busch <kbusch@kernel.org>,
        "Martin K . Petersen" <mkp@kernel.org>, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] block: stack max_user_discard_sectors
Date: Mon,  9 Nov 2026 14:39:27 -0500
Message-ID: <20261109193927.595104-1-bmarzins@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

blk_validate_limits() sets a device's max_discard_sectors partially
based on the value of max_user_discard_sectors. For this to be set
correctly on a stacked device, max_user_discard_sectors needs to be set
to the smallest value of its underlying devices. Otherwise the stacked
device can pass down discards that are over the size limit of the
underlying device. This is a particular problem for request-based
dm-multipath devices, where the underlying device does not have a chance
to split the discard.

Fixes: 4f563a64732d ("block: add a max_user_discard_sectors queue limit")
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 block/blk-settings.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 1f5ee2453269..1f02a867061e 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -919,6 +919,8 @@ int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
 
 		t->max_discard_sectors = min_not_zero(t->max_discard_sectors,
 						      b->max_discard_sectors);
+		t->max_user_discard_sectors = min_not_zero(t->max_user_discard_sectors,
+							   b->max_user_discard_sectors);
 		t->max_hw_discard_sectors = min_not_zero(t->max_hw_discard_sectors,
 							 b->max_hw_discard_sectors);
 		t->discard_granularity = max(t->discard_granularity,
-- 
2.56.0

