Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793878929;
	b=M3IpqryhfLQv5XoLwmmMw0wPd9I+vLfvUnabFfvSnfa5q7pKLV+hX+gWp3agjmPubIW6
	 srBYkWOeks7MF+QvtaLIcsAt0Sq4oJe6YugIn9a8fKxVuntknmnhHCq4dmrawXwbyC7IC
	 djuZtMrUhkcoPFSj7TnbtCmnWe+PDddxReMFbDpn9MFj6vc2KxHbAYDxjjP6ewd8WMpWR
	 ewO4GfqSk6V8buBJtrNDL69Ctjfr78BF1FnpePTKv21mOXTvmoPAD5BzFVCCC/6GRsFw+
	 hvnRHoxHNBHko8HaE199F1vRSalEOLQDJMfxAFGrxj6e5bYLvfUfOJz7HMJHqkypruw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793878929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+/ie1fjm6lAVadllpDyXq/QvwISd8L07DcsiVDBTI0I=;
	b=YP9zM+g/nw0Yb2WovUCZc7Y/oXLJyje88cOOqNcbz9TRL6Oa8+dA3aGqWjf6S8nURrb+
	 Vioxw0ImzVwRwNYO5jRqCrb8o8fPjz6y7TA8piLlRHDtimQgRkfJmJojmuRDtOobslzZ2
	 YyWC35Wxez4tUhclaJPi6RNnqwSFc9vIQYeSDatMMwJ0y28Vnip192PjTYXtBWYzIchuw
	 xSHA9JbOIkyDIjaGtCFw6hKkENmUJ1rg6CNwM9lU3Pe1vX53/wZcZl2azc9eplZaSaTBX
	 nt6wDsIdIl+8+Xrs+eP/JL1AEdMhlsiDOC2SGX54v37lhiLvJr7WZZsKjWak17Wnlxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QckRhU5C;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EEF606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74EEF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QckRhU5C
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36a1947498bso4967640eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793878928; x=1794483728; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+/ie1fjm6lAVadllpDyXq/QvwISd8L07DcsiVDBTI0I=;
        b=QckRhU5CJkjAS4fl2aFsDdwQ/8P748ANtPnFDPABXbZiJP2d/8abLGNb/3w46KoLsS
         +3/o24FMUuAS3fiUHesMMD1sZwVSvi0Kad3x/6g+vEWpYWQQFq2EkwgPE4zudbPhnck7
         cPmKvDiDnDsKGPZHblsNznrCIDh6U+YPl3GoT4uiqres1qujHjr6zAuhb1CzDxT1ykcY
         Q17b+zArM3H+klpDyIhojcT9fQ7cPZcPA3bIK4sShAQk/uG5ytbnJZWRltsHL5i/Hh84
         fCMWmO3gqX1NTYd9QrsYzHldMWSigTloUACWeF9btwLhLa/l2TncsTIzRkk1xWhap4Wo
         pGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793878928; x=1794483728;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+/ie1fjm6lAVadllpDyXq/QvwISd8L07DcsiVDBTI0I=;
        b=sNrFMbXY6O0voxfIJ81NHwYzBkdkA54l7g9kQam1us/CUFHj5bcQHq00yGZRIXO4VD
         UDGC5GBYekFu9MXMsFzFz1dzDwtIU40knn1+OjpgG/0CeNh2GqDj26IFkGYPMF8fAAEX
         WZkwyhN/+J2iy0qYRvf2PxT6Z8kxMWk9HpBGgDVmJeJvrOrYd0sQVhhWDTxjEDESTZst
         PGFyilieD/D3rpCKZrf5o950Bn5rkVHiqzhCvwwkiL/2wrr+f4GkbGwqeSb+Ic3f+YOc
         GMXLP8Em77JrQd/2V230OI3+7KaDsKBLS/7AxFkLpG9mmNyLZnhpF1Sqq9yPck9kmy7Q
         SOpA==
X-Forwarded-Encrypted: i=1; AKwUvBzTOIq2E1UPyOqZIU8CaPFuzcowAebEWCzD7DBTgk8MMzCDfi/TpE47MI9HgK2sP42yRWr5Kn+UwMmd8aU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OSO75lOw3WTpbmkJnjuK1W0DdbonJ/BgGkPUD7JI58CCR1XBq
	3W/fzZiu/mNPYUp12j3Sc2FdlpxmSlkMoKEQ2nLFjfh4n7E/CALl2kZa
X-Gm-Gg: AYBFou0V1YslTe6HnUYn3q6c8t9m31RIlYS6aqum7RrZkCRqUU813ZPFk7KYaaOqYQX
	49g+FDb8x+IYldrO0U/TeQq33XObU3eKK2bwiICUweF1jiOTpdfFA/GAgfs682aJV2BjkP/vntt
	6x914c7cxE5m5gaXvCxi9QOehUvB6ATSgwNCQOUzGRtKHM1yKpgPWtc0hApJ2syVqjPwr8bbRl9
	zNWKlLVdp/J2YYy8JGN7b8wj4PVw/mF4dv5T4gySPD2AogrG2CyHcsUpb0b/H9SPgrDL4czdEx5
	kFBppPVpI//XzKfia9lMuXwx8opezmiOyKrpmI3Xu4y3lDTN8m63sVaQBaZI/L9Uner/T6/3XZR
	E62kAEvgAlK7C81t9W7dZqe4EdvkvJTk2QQhJAQqzdKb0RT9A1b2MCm5GTkf60lJL2ypZusZOhu
	Sb2ncszKG5hxmuPJ54ZqhyDUo5C8aKjbro0oPoK4fjIqIxQY4irxc5RjmoloIfRl+V4DKubY6vY
	hGeEM5o74J+5244v8Mh+8BvLztjQnPpGnSq+V/r68P2j/vFFBw081Nufz2jI+NDUayh67OQo09k
	/gELoprFoHbSVgT9NOBQVMRbsxFDQTStqRYZhAeb5pLnHVJtRv+NhhzLJ9vsQWLyUpGA/ccQC8T
	mgCw0Fh6q0ScGaBpFbKQsFQJbpQJRks4=
X-Received: by 2002:a05:701b:420d:10b0:184:d593:2897 with SMTP id a92af1059eb24-1ac5d5aa2aemr30545874c88.29.1793878928117;
        Thu, 05 Nov 2026 03:42:08 -0800 (PST)
Received: from lwq-System-Product-Name.. ([23.247.137.158])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm19644566c88.15.2026.11.05.03.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:42:07 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me
Cc: mkp@kernel.org,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] nvme: stop asynchronous event work before ANA teardown
Date: Thu,  5 Nov 2026 19:41:49 +0800
Message-Id: <20261105114149.970315-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
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

NVMe ANA work has several producers, including ANA AER completion,
namespace scanning and failover processing.

An AER completion can queue ana_work for an ANA notice and can
separately queue async_event_work, which sends the AEN uevent and
submits the next asynchronous event request.  These work items access
controller-owned state during asynchronous processing.

Controller teardown must ensure that both the event work and ANA
processing have completed before their associated resources are
released.  Cancel async_event_work during controller uninitialization,
after the controller has stopped accepting new events, and cancel
ana_work again before releasing its ANA resources.  Draining only
ana_work is not sufficient: an ANA notice completion can still queue it
while teardown is in progress.

ana_work is initialized in nvme_mpath_init_ctrl() during
nvme_init_ctrl(), before any teardown path can run.  During controller
removal its producers are dead before the final cancel in
nvme_mpath_uninit(): namespace scanning is flushed in
nvme_remove_namespaces(), path clearing removes the failover source,
the transport's delete_ctrl tears down the admin queue so no further
AEN completions can queue work, and nvme_enable_aen() is only
reachable from nvme_start_ctrl().

nvme_mpath_uninit() also runs from nvme_mpath_init_identify(): from
the ANA log growth path, where nvme_mpath_stop() has already
cancelled ana_work, and from its out_uninit error exit, which can be
reached without nvme_mpath_stop() when reading the ANA log fails.
nvme_mpath_init_identify() is called from nvme_init_ctrl_finish(),
while the controller is CONNECTING or RESETTING (LIVE is set at the
end of nvme_start_ctrl()), and nvme_ana_work() returns immediately
unless the controller is LIVE, so in both cases the additional cancel
only drains work that would be a no-op and cannot race a work using
the ANA buffer.

This issue was investigated and the fix was developed with AI
assistance (ZCode/GLM-4).

The race was reproduced with the in-tree NVMe loop target and
scheduling injection.  Cancelling ANA work alone left reports;
draining the event work and the ANA work together removed the
reported use-after-free under the same test conditions.

Fixes: 0d0b660f214dc ("nvme: add ANA support")
Cc: stable@vger.kernel.org
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---

Changes since v1:
- Corrected the causal description: an AER completion queues ana_work
  (via the ANA notice handler) and separately queues
  async_event_work, which sends the AEN uevent and submits the next
  request.  v1 wrongly attributed ana_work re-queueing to the event
  worker itself.
- Noted that ana_work is initialized in nvme_mpath_init_ctrl() during
  nvme_init_ctrl(), before any teardown path, and documented all
  ana_work producers in comments.
- Audited the producer shutdown order for the final controller
  removal: nvme_remove_namespaces() flushes scan_work, path clearing
  removes the failover source, the transport's delete_ctrl tears down
  the admin queue, and nvme_enable_aen() is only reachable from
  nvme_start_ctrl().
- Corrected the error-path claim: nvme_mpath_init_identify()'s
  out_uninit exit is reachable without nvme_mpath_stop() (when reading
  the ANA log fails without growing the buffer).  nvme_ana_work()
  returns immediately unless the controller is LIVE, and
  nvme_init_ctrl_finish() runs while the controller is CONNECTING or
  RESETTING, so the extra cancel on those paths only drains a no-op
  work.  No additional cancel_work_sync() calls were added.
- Addressed the Sashiko review note on the explanatory text: the
  comment in nvme_uninit_ctrl() and the commit message now describe the
  actual queueing paths — an AER completion queues async_event_work
  (uevent plus the next request) and separately queues ana_work via the
  ANA notice handler, while namespace scanning and the failover path are
  the other ana_work producers — instead of attributing ana_work
  re-queueing to nvme_async_event_work().
- No functional changes beyond v1.
v1: https://lore.kernel.org/r/179378587000.73780.18152328009023418065@gmail.com/

 drivers/nvme/host/core.c      | 10 ++++++++++
 drivers/nvme/host/multipath.c |  9 +++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index a7a4d09644c13..8efa306205e19 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -5182,6 +5182,16 @@ EXPORT_SYMBOL_GPL(nvme_start_ctrl);
 void nvme_uninit_ctrl(struct nvme_ctrl *ctrl)
 {
 	nvme_stop_keep_alive(ctrl);
+
+	/*
+	 * An AER completion can queue async_event_work; drain it
+	 * before the controller's final release.  Note that ana_work
+	 * has additional producers (namespace scanning via
+	 * nvme_scan_work, and the failover path in
+	 * nvme_failover_req), which is why nvme_mpath_uninit()
+	 * separately cancels ana_work after this point.
+	 */
+	cancel_work_sync(&ctrl->async_event_work);
 	nvme_hwmon_exit(ctrl);
 	nvme_fault_inject_fini(&ctrl->fault_inject);
 	dev_pm_qos_hide_latency_tolerance(ctrl->device);
diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index 9e0a0fd77c56e..4ced8136d5f63 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -1610,6 +1610,15 @@ int nvme_mpath_init_identify(struct nvme_ctrl *ctrl, struct nvme_id_ctrl *id)
 
 void nvme_mpath_uninit(struct nvme_ctrl *ctrl)
 {
+	/*
+	 * ANA work can be queued by AER completion (via
+	 * nvme_handle_aen_notice), namespace scanning
+	 * (nvme_scan_work), and the failover path
+	 * (nvme_failover_req).  Drain any remaining work before
+	 * releasing the ANA resources.
+	 */
+	cancel_work_sync(&ctrl->ana_work);
+
 	kvfree(ctrl->ana_log_buf);
 	ctrl->ana_log_buf = NULL;
 	ctrl->ana_log_size = 0;

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.34.1

