Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.143
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794708949;
	b=TO+m4OvhBh5l/SAhlZoulppXelbe/pxnKwVB1xBI1YH7B0NJOyjdHbKdmdR5Vd7qcJX6
	 mtcgLFHg0lTUGkKUuonG90/Yz5PsCc3QsyH6e79ytHl4z4gUVBidNZ103cmoXwvkjDoSn
	 49+Sm/zvFCEPDmT6d311DapmwvxcPID/AEUB9/0wH5djQ5v7tsu+f6Um6hdExJb/C86V/
	 mVbST3eUbqGr1ZmMYnBZRqt66YjGOuUjoVvo/7V4DxbPsegt14Mm/YbWzCj3qGK9g6aRs
	 OoBPVFrqdCB259qI+geymbk4UZ0L6PGGuyqUIvHzuYhKql/ZpJhT902e1Z7WxaEz+vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794708949;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer;
	bh=wJNVAE3hGD0xcBHiAlWrWhW4WsfP9kLdE+Td0+I2msM=;
	b=JLTfx+UyMmsAfPbYs0FRvqxqPJGyF8LV804HcZNlWoR85sJFBj993j+4ViEwJoGv28nL
	 pY2Sf5Aa0JLeSSijbQ2PklPMw+ZEJmEIWmb0NgSGjJ+x2kcv1IU1/i+lWi9HOyHMYb8/R
	 cBEB/lMlRgPyNfPXsdz7Prn9lZHXtqVaVWhQ1bXMeQUd+FnLMiAWpvs6iHWbThe7ub+Q1
	 xZxljuDO+gL+uAGCX8SoUAOux9SucWvaSKCzu2o7gqDQMnbKLRrE02foed7vNNmPeG5R6
	 +fshAFBtUngqlITSNWPNEJNS+r5OlDsk4BaFFC5wrCP8uVKFsnBHw0Z7XPBIc2oFYjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZU1nKBIC;
	arc=none smtp.remote-ip=91.218.175.143
Received: from mta0.migadu.com (out-143.mta0.migadu.com [91.218.175.143])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25817606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25817606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZU1nKBIC
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3drfX2ZBZryBc5zS9B5q86kzE5mXeu2a2mkIXNoI62U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794708946; v=1; x=1795313746;
 b=ZU1nKBICQ1DeTN0JCAINs7K+BGUZlJpHxQPhe+9PaVtZvHgM1usp4/5Rabd2cb2RFYtyZpGF
 KmCfJPygT+F4Gik6ePgzOsYQIpXrCIh81u85Pg2mUj9bqAb9hEh7XEzOmy6GmXoI3QjxlON1peY
 nXgUzsN5rHPdLfrX2W8kJwcQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c4ac8462579227ad;
	Sun, 15 Nov 2026 02:15:45 +0000
X-Mizu-Trace-ID: c4ac8462579227ad
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Subject: [PATCH v3 0/2] nvme-multipath: requeue work fixes
Date: Sat, 14 Nov 2026 21:15:37 -0500
Message-Id: <20261114-bug-nvme-mpath-set-live-srcu-v3-0-d84651de6334@linux.dev>
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
X-B4-Tracking: v=1; b=H4sIAMkV+WoC/43Nyw6DIBCF4VcxrDsNoHjpqu/RdCEwKIm3gBIb4
 7sXXblrM6t/Ft/ZiEdn0ZNHshGHwXo7DjHSW0JUWw8NgtWxCac8Z4xRkEsDQ+gR+qmeW/A4Q2c
 DgndqASV1WeXCsEwUJBKTQ2PXk3+9Y7fWz6P7nGuBHd8/4cAgnhGlzKiQ1JTPzg7LetcYyAEHf
 sXYD4wDBaOKglcs07xKr9i+719Vsf5qFQEAAA==
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Nilay Shroff <nilay@linux.ibm.com>, Hannes Reinecke <hare@suse.de>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <qiliang.yuan@linux.dev>, Hannes Reinecke <hare@kernel.org>
X-Mailer: b4 0.13.0

Patch 1 applies a new delayed_removal_secs to a head removal that is
already pending, so that clearing it fails the I/O queued without a
path right away instead of when the old delay expires.

Patch 2 stops nvme_mpath_set_live() from waiting for an SRCU grace
period per namespace, which makes an ANA change with many namespaces
take tens to hundreds of milliseconds.

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
V2 -> V3:
- Requeue a pending head removal with the new delayed_removal_secs
  instead of only kicking the requeue work when it is cleared, as Nilay
  suggested
- Rebase onto v7.4-rc2-470-g7e1392a42ea2 and update the numbers from a
  new run
- Don't carry Hannes's Reviewed-by on the v2 patch 1, which is rewritten

V1 -> V2:
- Add patch 1
- Take the SRCU cookie under head->lock in patch 2 (Sashiko)
- Rerun the tests

v2: https://lore.kernel.org/r/20261111-bug-nvme-mpath-set-live-srcu-v2-0-fc772914d293@linux.dev
v1: https://lore.kernel.org/r/20261110-bug-nvme-mpath-set-live-srcu-v1-1-1f58b405b0f8@linux.dev

---
Qiliang Yuan (2):
      nvme-multipath: apply delayed_removal_secs changes to a pending removal
      nvme-multipath: don't wait for a grace period in nvme_mpath_set_live()

 drivers/nvme/host/multipath.c | 18 +++++++++++++++++-
 drivers/nvme/host/nvme.h      |  1 +
 2 files changed, 18 insertions(+), 1 deletion(-)
---
base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
change-id: 20261110-bug-nvme-mpath-set-live-srcu-cbd8965f1457

Best regards,
-- 
Qiliang Yuan <qiliang.yuan@linux.dev>

