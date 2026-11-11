Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402651;
	b=q46cGJ/lsI2hTdZd8qDHEdpsYQTydLN1ZgJOHvWlZrGLCk5/pRD/Ny+VVMGNjdEjsCi9
	 HBRIsnD+4vZybMEL5ng56RxFpRiVujGJGPj5AFD1Kq+VWBNS18YR+U4GVemwKDfvJPuNb
	 0jZHzUFTvr+AYM7t/hnSjWN+9EenIgVkkjm7onof/zPK4UuWWr7hQQEX/PcZRlS9bn7RD
	 o+CZ58U0kHiOMZCMUl9j7OD4RuaV4nAQpCdocpIMQGOxlhOikbD4sfZ737jO2wNRJXrwp
	 PPIvPG4wtSLMC6d4b8smz68THUjq689hdoGRRH03fmZnN44kTKJ+Q6dxxsANCMxoDeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402651;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=2noysjaSp3ERaQjsD4sxtAoulap4dK8zq09oSnMf/AQ=;
	b=3qZqArM+hPpp0EVRzvWQlxfIFlJzQLpMZk9JTpLyhyN3+eUEc88cvpKwTr0sq/VGpqVO
	 PUran93FoGjFFrgw3ztcvoiqTFTTm0e180j0GIzloq23k/KaR4sekxL0NxENJ/94PKa/x
	 P9tblNGTofdbAkvSNHlYh4Fl8co5iAhIaL3+KYiGdZg/XsoITIQSkJko+daMvjCTA+WrR
	 4vzUBuGj1tiu7h2Q4rVs/3kT9fmJT4b9COLVPL8Qg5Ll//TLb57/MTpyI9cW1eAFNEJ0Q
	 fpogOLouXYrdInlhxTn3Taiu4AHR64YGk1oMV1hea6fDOPtlC36aIESorPyY6WTSeqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sNkcoOVM;
	arc=none smtp.remote-ip=95.215.58.66
Received: from mta1.migadu.com (out-66.mta1.migadu.com [95.215.58.66])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AC5606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95AC5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sNkcoOVM
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=T4ExZyp/crnoP7oxiw7TmItFm5LUi91dgIznIGmYWtk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794402648; v=1; x=1795007448;
 b=sNkcoOVMnBNkfCpUqI/0FOkLTCu/X1atKAXJ1Px5JYFhInqvNKP3NBxY1mVhMnRmoCSVtOOn
 JI0tV58WaQ6hy3qUDaGl1XYbSxK/oBIUEb0YVQsRFT9CAwnp0xcqexoAsSDjfh4/jbSWvUDpjGI
 /sIMnFfGfq0h5HqJayA1O8v8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6fb6a724c8cd48c7;
	Wed, 11 Nov 2026 13:10:48 +0000
X-Mizu-Trace-ID: 6fb6a724c8cd48c7
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Wed, 11 Nov 2026 08:10:21 -0500
Subject: [PATCH v2 1/2] nvme-multipath: fail queued I/O when
 delayed_removal_secs is cleared
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
Message-Id: <20261111-bug-nvme-mpath-set-live-srcu-v2-1-fc772914d293@linux.dev>
References: <20261111-bug-nvme-mpath-set-live-srcu-v2-0-fc772914d293@linux.dev>
In-Reply-To: <20261111-bug-nvme-mpath-set-live-srcu-v2-0-fc772914d293@linux.dev>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Nilay Shroff <nilay@linux.ibm.com>, Hannes Reinecke <hare@suse.de>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

With delayed_removal_secs set, bios submitted after the last path goes
away are queued on head->requeue_list, in case a path comes back before
the delayed removal of the head.

Writing 0 to delayed_removal_secs clears NVME_NSHEAD_QUEUE_IF_NO_PATH
but doesn't kick the requeue work, so the bios already queued stay
there until the removal work runs, up to the old delay later, instead
of failing right away.

Kick the requeue work when the attribute is cleared, as
fail_on_ctrl_loss_store() does when it is set, so that the queued bios
are resubmitted and fail.

With delayed_removal_secs at 30 and no path left, a direct read is
queued and delayed_removal_secs cleared two seconds later. The read
then fails after (mean of two runs, min-max in parentheses):

  before (ms)            after (ms)   change
  26234 (26209-26258)    3.5 (3-4)    -99.99%

Fixes: 62188639ec160 ("nvme-multipath: introduce delayed removal of the multipath head node")
Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 drivers/nvme/host/multipath.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index ae8059366b57d..a92a05b1f925a 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -1249,6 +1249,10 @@ static ssize_t delayed_removal_secs_store(struct device *dev,
 	 */
 	synchronize_srcu(&head->srcu);
 
+	/* Fail the I/O queued while waiting for a path to come back */
+	if (!sec)
+		kblockd_schedule_work(&head->requeue_work);
+
 	return count;
 }
 

-- 
2.43.0

