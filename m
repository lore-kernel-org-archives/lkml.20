Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49935383EC
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172402; cv=none; b=l3wuTvZ5BKpmp6LIZqjw/m1hO5maIH8rNw8O+bUvQPMVxgUAZ5R7rCJTFuVJ/INwamt9AwRuTlzDbktcsbsT69l8DYQo5NGwBnYgAsutFl4B1e+fDCZGOO8PnlHpsVPiZUsgeGoNE4mSYRLWCZLzonjW2COw605O6f48kKrRgGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172402; c=relaxed/simple;
	bh=rmGcpoIKRjU/t1b9m5XR4fyG3dTYuOf8eWB6EDUthNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W3CBq9SapCat67xJGi/sK0tvQNEsCkOAQwbFtkFvm50sG9Rv10Ti5Bntq5jLKEgYVR3bzwxYMJIeAmcXXz6Fse7Xcg7RdQtZNsgKIUR1MGK/aP/sX27d/14ju+++b7udy5oPvUJOCMf+p5EyBmAGjzQErmL1DS90fN/qAXGRzqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com; spf=pass smtp.mailfrom=linbit.com; dkim=pass (2048-bit key) header.d=linbit-com.20251104.gappssmtp.com header.i=@linbit-com.20251104.gappssmtp.com header.b=H37oPexO; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit-com.20251104.gappssmtp.com header.i=@linbit-com.20251104.gappssmtp.com header.b="H37oPexO"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d097b4939so5255425e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit-com.20251104.gappssmtp.com; s=20251104; t=1790172398; x=1790777198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vL+K9FciO0t0sxXo6V8h49AzokhOlta0lk/EZzHWy48=;
        b=H37oPexOvEFoEw8qFERT9dsom/peKVNGEkGSdEIgFUYBZ0dA8bE0B+bTEa7zrU70Ok
         N8udaaEcnHXz7Ize0nspriP5Zv62P7eRzWCXpr758vS19CEYpVtzWLz+JzfJXc3Jj5ge
         HMe+/HCg8A96mKAJ1hNsjrBeXGFErhwLlMPYyDWDWi3EiDuavLuySnqnMPclX98Tvccl
         98HyPKztkd5bKD89b+r4793lR9ahyQrxSyo5zQK7mlwBUvh3AllCFBY0o2U017ejRnSM
         4qVouAFfce5LcJfnMLnMTh+aj9Xnr08NhdQqgdw4/OlXkq2a7E0yf2TWUtQPR2Fnf52j
         5LXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790172398; x=1790777198;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vL+K9FciO0t0sxXo6V8h49AzokhOlta0lk/EZzHWy48=;
        b=rOrNaY0iBLl26uacfiia9v+hOFJllIYUTCq7i5flxsg8z3donQl2IfqXUMAFNQ4SKQ
         ApP2K97l8cneyBZOl1rf84N9n+BBlhNcRtBgZu+0NE8JXkEPj9jbSwg5GsEzvENu5Xfr
         cK10N+jIH7Ln8FQDo8ybysf4VC6ZkrChKAGNyiBv6iEcMAPUgwtiaYY3AoTxctfqH+px
         duof7mDRo3knagas9JQf0dTuuVfJqVRiGNHms1qT+MRcoRBZSg/3Ew6XaTN4P1Z6bmhb
         3khPGZ/l199jQob3TYXFHNwpzJXvuXvfv8AhoOn4HhGjhAlmNqFL94qRoZcEnrjzZzEY
         iL0g==
X-Forwarded-Encrypted: i=1; AKwUvByHtJpmWftsoqiHc6vg8sO6lrlLwksvykKQDIxQYCe5YXfSb9XceFj/SdwjzQIB80AadqowDosXSm++AQM=@vger.kernel.org
X-Gm-Message-State: AFuF++lC+P0tEfnUeVQap/bQlOM4q/ayAaLjdb2lr8cMgXzuaR5QiY0T
	blmRT1IvHWc4PQ1VTr0RDHDBfdMMaZDhI9Vv0epnsA+jx2fTU4ixExz3gdX97c8pESY=
X-Gm-Gg: AYBFou2oCuybbaxrN15WAYHY62aug9NxmlXeVvuGRAf6M8nxeW77/USe4FbXpwGYaqh
	ZCX04D6YQaF07Bis+UkHd98GR43+K2GYrpMUNHsW53oLn9GKYmvUAK/imSa/TS1KyU3hSFi94e3
	3WRO4Fpn+5PPtNUUG0/gsJ2CsiKboR2NHHQLsvcBnT0naS8sUK6pGRwWNUoTQM5l1KxmpaEGFCF
	EA7tieHUo9huyYes6B31H4ArD9iCwiNFBDcmonmwVie59E/g/+b7Rovj4+DMutWzBKFM4K1SWgs
	p4ATQ14TZw1aJLZKVLWIsIKG/rIWOrwBt73ru8ejh9Bgj2I1uHgQlYpW68WuFGfRDoybVyUCMHT
	SDtlTOPOOxTgcg86ynFLMH41K5ZpRLMIRZ2HNhBl2630Zonb6W7LfYas8tJ11SSJoJsNdNe2auI
	fZbfWN3Jnm4GvLbn31wiTTWc5ZR1jFZQxP1hqX+c9CUCBDN5V+ml+aeXySz4+DnKgtbgA1RS94x
	TRMO4WF8Ab2y4ov/yToNfuu7sjLJUE=
X-Received: by 2002:a05:600c:198e:b0:49e:642a:4f6f with SMTP id 5b1f17b1804b1-49fdf151742mr33674895e9.33.1790172397954;
        Wed, 23 Sep 2026 07:06:37 -0700 (PDT)
Received: from localhost.localdomain ([2001:4bc9:b01f:2334:39d8:9506:1776:f780])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde18a8a0sm78087455e9.5.2026.09.23.07.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:06:37 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars@linbit.com>,
	drbd-dev@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>
Subject: [PATCH 1/7] drbd: rename drbd_worker.c to drbd_sender.c
Date: Wed, 23 Sep 2026 16:06:02 +0200
Message-ID: <20260923140608.1116713-2-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923140608.1116713-1-christoph.boehmwalder@linbit.com>
References: <20260923140608.1116713-1-christoph.boehmwalder@linbit.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The "worker" thread has long since become the thread that sends data
and resync requests to the peer; the receiving side lives in
drbd_receiver.c. The out-of-tree DRBD 9 code base has called this file
drbd_sender.c for years.

Rename the file up front, with no content change, so that the upcoming
DRBD 9 rework of this thread shows up as a modification of one file
instead of the removal of one file and the addition of another.

Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/Makefile                         | 2 +-
 drivers/block/drbd/{drbd_worker.c => drbd_sender.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/block/drbd/{drbd_worker.c => drbd_sender.c} (100%)

diff --git a/drivers/block/drbd/Makefile b/drivers/block/drbd/Makefile
index 5faaa8a8e7f0..1a6dc0f482f5 100644
--- a/drivers/block/drbd/Makefile
+++ b/drivers/block/drbd/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 drbd-y := drbd_buildtag.o drbd_bitmap.o drbd_proc.o
-drbd-y += drbd_worker.o drbd_receiver.o drbd_req.o drbd_actlog.o
+drbd-y += drbd_sender.o drbd_receiver.o drbd_req.o drbd_actlog.o
 drbd-y += drbd_main.o drbd_strings.o drbd_nl.o
 drbd-y += drbd_interval.o drbd_state.o
 drbd-y += drbd_nl_gen.o
diff --git a/drivers/block/drbd/drbd_worker.c b/drivers/block/drbd/drbd_sender.c
similarity index 100%
rename from drivers/block/drbd/drbd_worker.c
rename to drivers/block/drbd/drbd_sender.c
-- 
2.55.0

