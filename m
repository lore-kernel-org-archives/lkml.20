Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B478F49DBB2
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790848143; cv=none; b=bX9anSonTCmVzMGtPIwemvRnBcXRoh+OfUXFFVSQmxgLLpKlRk+onDFR6CkaJbtVeoiicdRJvmyN64btcuTZ7mZQ3aHmsRVxfewLAkHLcQzYnCoD6TpaoWj6TSNwQCe7ctUH6IpUhs2qjpc85Opv0xIdpM8otZXBx2kqEGNUt6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790848143; c=relaxed/simple;
	bh=z9bI5W87mEweK50osIcX1/Af0xrGU664CyETGSNE3Ig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GlE8uVKFdj31ubjCn+jZqLyIi3hSrP80LJuS2uKtqmwC0L6Ofwft0Ngh6WAo9AuKeO3Oqd7N0JYfF19NLxb9T1XRwblPHx000e6FU/kEjsapyeSKtRRQ3q0fa9C2uhHGklHNA1f4S16WXMPOSyizFe3p3+nYRWxAAGyyCBPlVeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=VrZZpPPw; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="VrZZpPPw"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c3so4904600f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1790848140; x=1791452940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWOahLGqSABk/Bl8Hm3IIeG0DfjrEOdUVN6u43pWVOk=;
        b=VrZZpPPw2KDkOX6b51BtySfFWeNxe+8f0hntZP1wL2yhfzZM5fUusrcnLKAbDn02tE
         MEqeWnIWp8o8VVqismqLXB0W0FzFtYV0kgbijpHb3b/5PpY8jG6PZSb6bq0ElcV8MOB8
         9aP5gWgvVwJglPQIZFCHFYZnMHZBwCyKFeM1rDNq922tJukvLqeimfPJCpQ2kwwdC0U7
         WY7LQx23obr6LFzYj/p7s3PTmFWrSG32VG9trvnqLesI+bULeC0QbMX721T2c7b008be
         ZgHBsyJ1k3zmb3srocDdb5VHnZS2TGwlJ3k3mgCoXu9Aw1Breoh7KyHIUq39TqHNQCnz
         76nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790848140; x=1791452940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wWOahLGqSABk/Bl8Hm3IIeG0DfjrEOdUVN6u43pWVOk=;
        b=ZTx5CBozqdx+bCkw81fW7pN5FpJbw1VJA8tKoL8zMbBURzPgAiPhFhvXwxdFsltLxh
         YATmX/sB/BF3IZWEu6MUbL4GywHPDAduNt4T1pk5hpTKbZrXBHCuY8nuxo0c9ZGsYWRP
         Nlvbm2odZUzWTV89MPV+SM3Ned0awWnkZgtPfVaRW2qzQFeqW/jVwbScelV6ra3Jnofq
         6Bvt1muyfsIfPnXc9A1c7RmuzuzMFedM7z4yx3q/vMHLEcBnS75noxGqEqoIt7RdW5P9
         Vl57i6Hden8v4fjauYHWwG4snpgneDw3w4yeF+YSFt6pqDYUoUeeA/UhENT4kJqPmsLa
         3Wwg==
X-Forwarded-Encrypted: i=1; AKwUvBzHDtB1MPeW/+ZA3HY/ktvM/703S6OCtZmbYa9wUn9elQHhj71K2BjcnfsfR4B9XpKSbElxG+O7J8kqPSM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3jzS2LmgtXmbL/4PDGhvdTAngL5jXS3ccMZCCO7lHYN8BJYBI
	znI4wTDf5d+Ze7GgwaZo7YzljthBCifCAFb5ST78XGmxkytvRsdnJXRHNr7mwsTiLG4=
X-Gm-Gg: AYBFou1kIBqsKWx8sra8bzfBWOv9SXWHFwgy8Ugk4GpOJvIZkUithnzVgw22Hmo6ZZc
	cjNKU3i3+t/U/7d9aCMPb4MkKh3IMSFgkY/q6XpMsNBQDWnvyr8vSE+hKCJD6V00bzXrGPSBGyl
	5VVCHm8Kkmpk6V1LBE4JxMPdW9B+KA1srLtVDkXtUyosg+P2vzNMDmQMZFYc8aWRGgi4D9BsfoL
	ww/EeZ/3DrtGZp3i5DVs8pwv7gOPQiU+58UqqPfvKyuRCmHg56Qx4Vf56x1e79XqIMmkESHcavG
	ecEB4C46uEAYoadY9cbZ2KbL4SCRUz4YTv744+HrjwatGFLFymBE1zt1LP/Czg19bsumYKjNmIW
	/7LCPQaAfin545eeD9HQ73aCxAaAoXFRJBJW05B7HsRmbkiwZVh/QTBakDfy3CXmz/F3nwvhHZF
	BfQ5s0cz8WOvHg6fzkg+fWAfeXSrT1qSyV7x04Zfx9xMzElHRjhqmtS0n513PZL1Rd9jHaZyuMy
	5E+p2rvf8ySSGcpQeVizY8TXT2eKOd3W04=
X-Received: by 2002:a05:6000:4811:b0:488:8546:d0b2 with SMTP id ffacd0b85a97d-48b0253956cmr8652279f8f.51.1790848139833;
        Thu, 01 Oct 2026 02:48:59 -0700 (PDT)
Received: from MBP-Krishna-Iyer.civet-hops.ts.net ([83.71.242.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0db6de0dsm1938341f8f.43.2026.10.01.02.48.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 01 Oct 2026 02:48:59 -0700 (PDT)
From: Krishna Iyer <kiyer@crusoe.ai>
To: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nilay@linux.ibm.com,
	hare@suse.de,
	saravanand@crusoe.ai,
	sjpark@crusoe.ai,
	Krishna Iyer <kiyer@crusoe.ai>
Subject: [PATCH v4 1/2] nvme-multipath: fix path state evaluation for failfast and ANA
Date: Thu,  1 Oct 2026 02:48:56 -0700
Message-ID: <20261001094857.74567-2-kiyer@crusoe.ai>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261001094857.74567-1-kiyer@crusoe.ai>
References: <20261001094857.74567-1-kiyer@crusoe.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nvme_available_path() has two problems that keep I/O queued when it
should be failed:

1. When fast_io_fail_tmo expires, NVME_CTRL_FAILFAST_EXPIRED is set and
   the path is skipped, but the function still falls through to
   nvme_mpath_queue_if_no_path(). If delayed_removal_secs is configured
   the I/O is requeued indefinitely, defeating fast_io_fail_tmo. Only
   fall through to queue_if_no_path when there really are no paths;
   if a path exists but its failfast timer has expired, fail instead.

2. A LIVE controller counts as a usable path regardless of the namespace
   ANA state. A path whose ANA state is inaccessible or persistent-loss
   cannot serve I/O, so it should not count as available. ANA change is
   transient and bounded by ANATT, so keep queueing while it resolves.

Also kick the requeue work from nvme_update_ns_ana_state() when a path
does not transition to live, so parked I/O is re-evaluated when an ANA
transition leaves the namespace inaccessible.

Move nvme_state_is_live() above nvme_available_path() so it can be used
there.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Krishna Iyer <kiyer@crusoe.ai>
---
 drivers/nvme/host/multipath.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index 11871f5f18c2..0d6c05f0808b 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -509,9 +509,15 @@ inline struct nvme_ns *nvme_find_path(struct nvme_ns_head *head)
 	}
 }
 
+static inline bool nvme_state_is_live(enum nvme_ana_state state)
+{
+	return state == NVME_ANA_OPTIMIZED || state == NVME_ANA_NONOPTIMIZED;
+}
+
 static bool nvme_available_path(struct nvme_ns_head *head)
 	__must_hold_shared(&head->srcu)
 {
+	bool failfast = false;
 	struct nvme_ns *ns;
 
 	if (!test_bit(NVME_NSHEAD_DISK_LIVE, &head->flags))
@@ -519,10 +525,16 @@ static bool nvme_available_path(struct nvme_ns_head *head)
 
 	list_for_each_entry_srcu(ns, &head->list, siblings,
 				 srcu_read_lock_held(&head->srcu)) {
-		if (test_bit(NVME_CTRL_FAILFAST_EXPIRED, &ns->ctrl->flags))
+		if (test_bit(NVME_CTRL_FAILFAST_EXPIRED, &ns->ctrl->flags)) {
+			failfast = true;
 			continue;
+		}
 		switch (nvme_ctrl_state(ns->ctrl)) {
 		case NVME_CTRL_LIVE:
+			if (!nvme_state_is_live(ns->ana_state) &&
+			    ns->ana_state != NVME_ANA_CHANGE)
+				continue;
+			return true;
 		case NVME_CTRL_RESETTING:
 		case NVME_CTRL_CONNECTING:
 			return true;
@@ -531,6 +543,9 @@ static bool nvme_available_path(struct nvme_ns_head *head)
 		}
 	}
 
+	if (failfast)
+		return false;
+
 	/*
 	 * If "head->delayed_removal_secs" is configured (i.e., non-zero), do
 	 * not immediately fail I/O. Instead, requeue the I/O for the configured
@@ -887,11 +902,6 @@ static int nvme_parse_ana_log(struct nvme_ctrl *ctrl, void *data,
 	return 0;
 }
 
-static inline bool nvme_state_is_live(enum nvme_ana_state state)
-{
-	return state == NVME_ANA_OPTIMIZED || state == NVME_ANA_NONOPTIMIZED;
-}
-
 static void nvme_update_ns_ana_state(struct nvme_ana_group_desc *desc,
 		struct nvme_ns *ns)
 {
@@ -926,8 +936,10 @@ static void nvme_update_ns_ana_state(struct nvme_ana_group_desc *desc,
 		 * is not live but still create the sysfs link to this path from
 		 * head node if head node of the path has already come alive.
 		 */
-		if (test_bit(NVME_NSHEAD_DISK_LIVE, &ns->head->flags))
+		if (test_bit(NVME_NSHEAD_DISK_LIVE, &ns->head->flags)) {
 			nvme_mpath_add_sysfs_link(ns->head);
+			kblockd_schedule_work(&ns->head->requeue_work);
+		}
 	}
 }
 
-- 
2.54.0

