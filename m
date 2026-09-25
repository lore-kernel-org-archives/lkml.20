Received: from mail-wr2-f8.google.com (mail-wr2-f8.google.com [74.125.225.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A414F7987
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790372220; cv=none; b=Pv1WaTQY24FITp8ARkB17I6B8iifgWul/fK/ANhZ9KK9PDJ3/YpIfNT0PK4u44SHFAo2d9dwGjAYQ7bH731ruTC2qNI9f4JMIXmzrxIL5rMoPFe9AGZEeEuFFo0RooVFVShcwt+e7atLErhlb4hO5V4TMU+vkHkqbnVLQXOKqtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790372220; c=relaxed/simple;
	bh=14Acq4QSZJ2hz6pe2oxe3D/5LXQaAWPm75oRsFXV9a8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u/9gpd5K2FN4KTq2UWUXXNGK9mlJLNoeFH8jp6q34XsURuEQQ1meusgMtgAwC4htDqu6AWQbVs9fxbC7TF24hJtfnIWsqinMMnQP4LlTwImIJiOiTHqfsRSOE4Ykd8THNpEf0q0jl9+TL3zRqa126wqFo1QzpAWCs5zS+LdV4qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJXB3m8B; arc=none smtp.client-ip=74.125.225.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJXB3m8B"
Received: by mail-wr2-f8.google.com with SMTP id ffacd0b85a97d-4887881b3e0so126837f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790372217; x=1790977017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uH5VHzqYeyzrxon03BvBTLMWbRiul1yKTMOPE8eGDHQ=;
        b=UJXB3m8BWUABzBMwtJF0nYnO9hZD/W9JBhG1kTxE+2+FQ/xBiPacVf4PWwxXoc5iA5
         G2TAHJjxcsRfrajXhlcMAKsbNwBVxos2syNiprkFoWhG6FVc2TdTZe5dXnVcTYqzEE6V
         a+ym6q5m9EqUePi6x86Qa3Gi6RM/ag3Rw75KZ05o/FQbbEV8qfbX9KbUQuqJS0UzPOsO
         +4bWh8r9zyuXwNfL8SUj7iylOErGp7T24ud4JjPgB4KPnXK+003AJ3JjCYj7lu8OieW7
         /5JyYad7MJfg1j5PvSr/Lf7kc45WoVbY/zgO7troNMkC3J8KGW6ogWe7GlilFwB0ARJp
         eCFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790372217; x=1790977017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uH5VHzqYeyzrxon03BvBTLMWbRiul1yKTMOPE8eGDHQ=;
        b=IfBS9CtXuBzCuZOCAuU92ER+eP9im65AlZWSUZSWuoG7COo6AKg5z3jOmDZ3hC20ej
         aHF1C+ryMP97ut2Yxg5wj6hFrK1opE8F5S6GG3APCnPRIizx5yOo3oRsVcDezIQQWyDK
         +RRUiSElWkcy0t8xELA0q2EhJR7RKH6bXq7VIbJgJCPRDXv/AEIpAkJ6Llaxr53OIpSC
         4gqnrZMAm0R+FhNeYId/qh9OiOmwowjw/x5v5kKf97bVvtaoVo5enCxs6CwqyUE5XNSY
         LFp7LLIxBTLsVzOc2nzpr2jyblS2QisVVnC/S3INIC8XMnYZNjHkAb4bC5rRSsXVdKDi
         nz5w==
X-Forwarded-Encrypted: i=1; AKwUvBz5e7cmeCIS3jpeBuVqRKQF+LWj5G5UyXoJ2gFnDuNZGRxeqhg5SBAiRX3wL8Za+o2jWAD1BtZvJhOWb6U=@vger.kernel.org
X-Gm-Message-State: AFuF++lJw7MCxoudyr4v7G9q+FTkGNaj+25Yw/66u+WR8T+VaYrh0yJm
	Wt//kct2MOquyoGzaSzbrzz0Gh2oaSYvE8B6jW8GikdRGgb+md/kS2aX
X-Gm-Gg: AYBFou1uRpmdfQAvldCefpUAPSQVuEOfNxui6u1LN6IVVL2qig44NqQtHXykyJfWgwh
	v5hiw5DesRhLwY41BmP8TmEj5h6Z6GE6tGeHlMyIJmDR062J9/GX18X5navs27fb4UP/lzNr5X7
	g5msZGPvUcfBTBaewngNd5HUbRXLrZxPqCAMh/8/oVcM5rSC4MxDAoihldsGb8QFvt9PAk3Dnjh
	NyV3xbp2+cph+M0aaucrYc95WmV0VnEK94R+/7zJhmFfijZThd+pTZinuDJ8xfkArZBpGg80IGB
	60c9SOhI8ObZHiuuGW/VWwhwHO70qRx+VTv57QchzgEVC7Wna/E8XqvukT5ZVlwYkgmk9WOca06
	cyP6kqhHlfZ/OiR7auAN9psVUfyrgQJF92u4kjmcjkIZDozL4Nqpuyhj9XhTqd9hoXZVd3ZV+ZE
	HcxHWrGNnC86/KDo/E1zn3v8tqEcIaX3iYPIldd+JySz4WfmlpZpvVYgWRRMFly8Wqsiq5tFgqh
	Dv4zlILMKWSluc=
X-Received: by 2002:a05:600c:8b28:b0:49f:fbad:29ae with SMTP id 5b1f17b1804b1-49ffbad2d56mr188775e9.17.1790372216761;
        Fri, 25 Sep 2026 14:36:56 -0700 (PDT)
Received: from serhat-ubuntu.home ([212.253.192.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fee915f3dsm84624035e9.1.2026.09.25.14.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 14:36:56 -0700 (PDT)
From: Serhat Kumral <serhatkumral1@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Serhat Kumral <serhatkumral1@gmail.com>
Subject: [PATCH v4] RDMA/srpt: Reject an srp_sq_size that does not fit in a CQ
Date: Sat, 26 Sep 2026 00:36:29 +0300
Message-ID: <20260925213629.8039-1-serhatkumral1@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

srpt_create_ch_ib() asks ib_cq_pool_get() for rq_size + srp_sq_size
CQ entries, but srp_sq_size is only checked against MAX_SRPT_SRQ_SIZE
(65535), never against the device's max_cqe. On a device with a
smaller limit, such as rxe (32767), ib_cq_pool_get() keeps allocating
CQs that can never satisfy the request until memory runs out:

      Out of memory and no killable processes...
      Kernel panic - not syncing: System is deadlocked on memory
      Workqueue: ib_cm cm_work_handler
      Call Trace:
       __vmalloc_node_range_noprof
       vmalloc_user_noprof
       rxe_queue_init
       rxe_cq_from_init
       rxe_create_cq
       __ib_alloc_cq
       ib_cq_pool_get
       srpt_cm_req_recv.cold

Reject such values when srp_sq_size is written.

Fixes: c804af2c1d31 ("IB/srpt: use new shared CQ mechanism")
Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>
---
 drivers/infiniband/ulp/srpt/ib_srpt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/infiniband/ulp/srpt/ib_srpt.c b/drivers/infiniband/ulp/srpt/ib_srpt.c
index 7197d95f2216..1761345b33f1 100644
--- a/drivers/infiniband/ulp/srpt/ib_srpt.c
+++ b/drivers/infiniband/ulp/srpt/ib_srpt.c
@@ -3603,6 +3603,8 @@ static ssize_t srpt_tpg_attrib_srp_sq_size_store(struct config_item *item,
 {
 	struct se_portal_group *se_tpg = attrib_to_tpg(item);
 	struct srpt_port *sport = srpt_tpg_to_sport(se_tpg);
+	const struct ib_device_attr *attrs = &sport->sdev->device->attrs;
+	u32 rq_size = min(attrs->max_qp_wr, MAX_SRPT_RQ_SIZE);
 	unsigned long val;
 	int ret;
 
@@ -3621,6 +3623,11 @@ static ssize_t srpt_tpg_attrib_srp_sq_size_store(struct config_item *item,
 			MIN_SRPT_SRQ_SIZE);
 		return -EINVAL;
 	}
+	if (val + rq_size > attrs->max_cqe) {
+		pr_err("val: %lu exceeds max_cqe: %u minus rq_size: %u\n",
+		       val, attrs->max_cqe, rq_size);
+		return -EINVAL;
+	}
 	sport->port_attrib.srp_sq_size = val;
 
 	return count;
-- 
2.53.0

