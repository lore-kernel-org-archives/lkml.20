Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402647;
	b=wIWmWE5wiCp3b5/oL5blp0Jr6/e137KK2s393rqxGIZfzygj2Roy0QaLN5I1zhpABt7E
	 tiqLWhuBILMFKccG/VLfQingheR4flXmaQofwh5E44B8iQm8JSzvTUKl2Dafii2tsUh82
	 7yzgRZuRHJ8GHJYR+FShy/DYh2oibvQZgViJn/3uWTtApq0F+aQydvZFcr+zbzOpylDpt
	 R/4eVvqZrJxeV4qY6LjtLfQj5M1VECzkRYn+Zu6AVCW/E+qOKHa9vwBIKJOmI2rQWxtFQ
	 wq0HrH3QG8ZUpV6XCQBTY1SJps+VBO9euchRnl4Cq9YYlnsgt/pQr5UhKqozu6hMz2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402647;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer;
	bh=j1vhH616yYJJATvrRAm08rA9jOsgZV21h5QRiE4wUNA=;
	b=zgbPfDIz+xrUQjoFcF5yc1XaVYjADvxjQxrD/8Y6S0EF4G/ckHNsqkH6aFV0Rxhv8xuc
	 WcQnIO9cl98n/GyBR9ci9pQq6sXBhNrkON5iF7o/ijrA9Q2WkeFxS8Q1rLLJWDEGHl7Yk
	 SSnwSJmUtkhrrGmMlflTD0ZZWFwaffAUQ8xuLSmAU+1HhZappN5xwZKGc7eNNhuXD6JoN
	 6lQuzi3kgbLltdBWfdoBshs4jNxhe4BzcY0VI2BB70Ip8PoXDLqCxSlO0v+rPIzJX0JvC
	 +t5YrZKtv0Q55Qvm/8OAEUM7qfLLhv3ubyGQU7dByNxfYjSZLz3pnFTbPvF4cWP9gAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cDMA6M5s;
	arc=none smtp.remote-ip=95.215.58.57
Received: from mta1.migadu.com (out-57.mta1.migadu.com [95.215.58.57])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63667606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63667606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cDMA6M5s
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8vsTho+fDtWw7vDJPfwLqBwvgAWnKw0AjJdAWw/f8TM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794402643; v=1; x=1795007443;
 b=cDMA6M5s8fSo2w4M1BMUTh91sL3O1o8xwvFrPxF8wY8umbQdVGAhnOmMWhZu4VBoir1iRah6
 RCa9ZM1sC9Vv+/lYqO4PN3LMNixClTKC8PwD7W1RK52dmXpsCHRqGLQJjhk7XbbMAeP+xMXy/TW
 GxKfwJUE36Jdbd7utI3+fkSk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 86378f046b01e2b2;
	Wed, 11 Nov 2026 13:10:32 +0000
X-Mizu-Trace-ID: 86378f046b01e2b2
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Subject: [PATCH v2 0/2] nvme-multipath: requeue work fixes
Date: Wed, 11 Nov 2026 08:10:20 -0500
Message-Id: <20261111-bug-nvme-mpath-set-live-srcu-v2-0-fc772914d293@linux.dev>
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
X-B4-Tracking: v=1; b=H4sIAD1p9GoC/42NQQqDMBBFryKz7pREjLVdeY/iwuhEBzRKEoNFv
 HtTT1D+6v3Fewd4ckweXtkBjiJ7XmyC/JZBN7Z2IOQ+MeQiL6WUAvU2oI0z4by2YURPASeOhN5
 1G3a6r56lMrJQD0iK1ZHh/dK/m8Qj+7C4z1WL8vf+KY4S04yqdCGUFqaqJ7bbfu8pQnOe5xdMQ
 A7MyAAAAA==
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Nilay Shroff <nilay@linux.ibm.com>, Hannes Reinecke <hare@suse.de>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

Patch 1 fails I/O queued without a path as soon as delayed_removal_secs
is cleared, instead of when the delayed removal runs.

Patch 2 stops nvme_mpath_set_live() from waiting for an SRCU grace
period per namespace, which makes an ANA change with many namespaces
take tens to hundreds of milliseconds.

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
V1 -> V2:
- Add patch 1
- Take the SRCU cookie under head->lock in patch 2 (Sashiko)
- Rerun the tests

v1: https://lore.kernel.org/r/20261110-bug-nvme-mpath-set-live-srcu-v1-1-1f58b405b0f8@linux.dev

---
Qiliang Yuan (2):
      nvme-multipath: fail queued I/O when delayed_removal_secs is cleared
      nvme-multipath: don't wait for a grace period in nvme_mpath_set_live()

 drivers/nvme/host/multipath.c | 19 ++++++++++++++++++-
 drivers/nvme/host/nvme.h      |  1 +
 2 files changed, 19 insertions(+), 1 deletion(-)
---
base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
change-id: 20261110-bug-nvme-mpath-set-live-srcu-cbd8965f1457

Best regards,
-- 
Qiliang Yuan <qiliang.yuan@linux.dev>

