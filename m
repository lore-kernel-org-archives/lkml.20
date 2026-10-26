Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792994086;
	b=WjD7Jv2K+NQiHMvYnMToM4wRHLALy6I+RNHb68kriyQQAc3d6mdJf3BBz6kVLu2Jqn8s
	 QcPb1++O9ryk2UTItO+9+M3o3+yzkY/hw+ho6P8cMfZYZ0T0MuJd3XtxOmZZUAaqlRqj3
	 KUXKgmqYdIE5UfwRgBcctrO/8lk6gwAhMTaSqvQmHpLzcXgB8UnXEOwjYLrF+hpYZbNbB
	 KAARxMYJO1GZ6pxTcFC2/Snu7Brcwxf6wT7FghkDX747DkFIYayLIns747EkKgBl4O+Yj
	 nw0PnDpJzmJawnqjrtfFl705Mi6EtWbhCcqttm3JE3262ULi7IQRFYPgYtisqnwzDaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792994086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XvlIgy8HAuD18Pu9SXVycEWxWyGIpi2gLi2fcEDWRe8=;
	b=tImyzMvbIJDp+63rnI1GrDuB3/1af5h2tGmOeNj6d//HM2d4MlFZjJ2TI/ie5ZJRxsof
	 xDkR7Y6s7ig9TIk72ID2Z+imoz3eLKF9M2hec4a328B1KoqXVGcR4MxVIWFjS8kur9UWp
	 55vOqbiC6pJgYsLEC1WYHjoiurK78xs2SA+i/Ypyv1WaySKFmBAX6lWJqCd+QGZe/WdvT
	 jUzkQvLY+9iJ+kLvxtZHfLzwMTDvn4SdTFklJOnbzGAHHf8KrqyY6jm3ps7xalTXqRBEB
	 KlFVGgaJGyqd+3seBNrN3nzcMbWAC7jdv3r1oBmE+F4hYaHQWApmOfdJ56mr8OOenxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=sTnlanKy;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B405A606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B405A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=sTnlanKy
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso4498020eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792994085; x=1793598885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XvlIgy8HAuD18Pu9SXVycEWxWyGIpi2gLi2fcEDWRe8=;
        b=sTnlanKyZybmkGhjprBeqXmDv17Y5hhdng5w9Fvq/8EJiKAze7gEZW/hBEGZFpO2J2
         ikfcsGKvaMIFOgoKLy3Eyk6YFqGHnNCxrLRPVHfpCf00hOHg/tirVgq1Gr7uFrHPn9IG
         gHztIbyMiGCXNrdqBDHhKSUvs43KIOUxL36SBjIdi29vzAPsgEIslHUYID6PTU2U8MGT
         3veUzge4C5YtX2vDRMW1YmVr8TBNh+3IKA/nbZzDMyUIcEg2t7OVLJH9gmcektZs2+Z0
         O61mT5ii1YEu2XSvZvtuBaIGYU829DhcAHu93NSouV03uJ4FyiZB5XBS6rVXDafVwdeE
         oT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792994085; x=1793598885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XvlIgy8HAuD18Pu9SXVycEWxWyGIpi2gLi2fcEDWRe8=;
        b=rdcHJtoKMzPlndEBd86hweD7DAbOn9Eh/8O+fEPD5yCO2qNdI1e+i5lLcepLZY9n1D
         1QcbV0lEBk9T1c/pinj2M731HGpp2fuLJ8TcXFkxWrt7ZmsbaLnIATgyaBvc47R0Exzc
         R+YnNMw7eFmFtoGQPXaV2gq/T7ROb4bLMlYzwEpXYv4Mp879S+WDv2ZVcc7LEcq3dF2p
         lVGBYU+ycBB4lq1+lZ+aQ+oFZo8Q/hy2bMczF/ogx3gf1816RTGSoeXcLaEuCoear5h/
         UZF4ZxOnocHFKzK8cHW/+1fQuNKia1CsFxECi3zglh9tzzOeqh0zUkxLlwytvfBjDg2o
         JAFQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/QNAYyqmyULrH1te2Fn7u9Mk/EiIAnRIvlhFKsoAjqlqcon1+PLt/zJEdUu3TwJWkTOk/3Uvou2B+vCM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGOQPyNH/R9tt3vrnuCrVxzWAG9PxWxSmGJdza16qjE2ArY9I6
	pTdUFyEZ91cXII04AJyiafp/vsp98tXPcyMbNUQ40UsL55vg6pAs5xuUWsIqXet+XpQ=
X-Gm-Gg: AYBFou1D3GPV7qPgWpN2HVwBpIkkaW2ZmbE9CdB2f1jhjjNkvfas+8vZr0OLTP/rZvF
	gLxinxNky9oDQ5/Uch4fAdkyUNudZjciNA5a3zHvwOPUPr3HTqbrPKMe/+7vRwGWQ2jpyJvGdq/
	WjcHjEt//DPi3TsAUz/s7K3ScHdQu8CMAUytPpHpd1IvUfz1t3cvbIQcYdfamBQ/nWCH7AAJpv4
	WVLZc6trIdK25+LXAbx8UQC43rt2Pmv43u/WiyHGyjflBNc4wHikFOnM5cOboiUNYdX29SFecHE
	fvjK8hlnbqRASZNE3K8wxIgQn74Aw8u6PAz9NkXlqr81WARXkK2bFVb3rC947ym/FJZV1HoC482
	I6nMqfFlE9vKx14vxIHFeEujkfpqvbo6ZdRHzMT4KLmdEcihIxe1d+Ssgu8ry55AELaDjGxyUpx
	NDwR10qpt/wpMndJfmARyETt2ghjFlpiRcRJtkN1Z+IR/0ibbtuIptFK68Ndoiohq0zkPazd3z6
	YxdbhJAa/l7L6/jUlXK9HkvAlEWxfBJ4RWithxsEyNoTlqy8C1F8sMGlXuQU5x/rU2WikqWrJ09
	asHkqsUSPo/wxHt3ALVi0HcHp4S3Lq8m6zWDDGcF59hMTIHdmA==
X-Received: by 2002:a05:693c:4015:b0:369:d992:e3 with SMTP id 5a478bee46e88-369e8660a6bmr8584496eec.32.1792994084594;
        Sun, 25 Oct 2026 22:54:44 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d845ddsm22290613eec.11.2026.10.25.22.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:54:44 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v2 RESEND 1/2] RDMA/srp: refuse a target that cannot receive an SRP_RSP
Date: Mon, 26 Oct 2026 14:54:29 +0900
Message-ID: <20261026055430.406487-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026055430.406487-1-yhlee@isslab.korea.ac.kr>
References: <20261026055430.406487-1-yhlee@isslab.korea.ac.kr>
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

srp_cm_rep_handler() takes max_ti_iu_len straight from the target's
SRP_LOGIN_RSP and srp_alloc_iu_bufs() then sizes every receive IU with it,
so the target alone decides how large the initiator's receive buffers are.
Nothing enforces a lower bound.

The initiator parses a 36 byte header out of those buffers. A target that
reports a smaller max_ti_iu_len gets undersized buffers, and the header
reads in srp_process_rsp() then run past the allocation. A report of zero
is worse, because kzalloc() answers it with ZERO_SIZE_PTR, and on a
transport that maps addresses virtually ib_dma_map_single() returns that
pointer without looking at the length and ib_dma_mapping_error() reports
success, so the buffer reaches srp_recv_done() and the read of the opcode
is already out of bounds.

  BUG: KASAN: slab-out-of-bounds in srp_process_rsp+0x757/0xbe0
  Read of size 4 at addr ffff88800243f120 by task kunit_try_catch/42

  CPU: 0 UID: 0 PID: 42 Comm: kunit_try_catch Tainted: G                 N   7.3.0-13249-gcea86339412a-dirty #2 PREEMPT(lazy)
  Tainted: [N]=TEST
  Call Trace:
   <TASK>
   dump_stack_lvl+0x3f/0x50
   print_report+0xcd/0x620
   ? vprintk_emit+0x21d/0x380
   ? srp_process_rsp+0x757/0xbe0
   kasan_report+0xde/0x110
   ? srp_process_rsp+0x757/0xbe0
   srp_process_rsp+0x757/0xbe0
   srp_oob33_test+0x305/0x700
   ? __pfx_srp_oob33_test+0x10/0x10
   ? __set_cpus_allowed_ptr+0x181/0x240
   ? __pfx_read_tsc+0x10/0x10
   ? ktime_get_ts64+0x192/0x250
   kunit_try_run_case+0x1ca/0x4b0
   ? __pfx_kunit_try_run_case+0x10/0x10
   ? kthread_affine_node+0x24b/0x370
   ? __pfx_kthread_affine_node+0x10/0x10
   ? __pfx_kunit_try_run_case+0x10/0x10
   ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10
   kunit_generic_run_threadfn_adapter+0x7b/0xe0
   kthread+0x36e/0x500
   ? __pfx_kthread+0x10/0x10
   ret_from_fork+0x34d/0x620
   ? __pfx_ret_from_fork+0x10/0x10
   ? __switch_to+0x22/0xdd0
   ? __pfx_kthread+0x10/0x10
   ret_from_fork_asm+0x19/0x30
   </TASK>

  Allocated by task 42:
   kasan_save_stack+0x33/0x60
   kasan_save_track+0x14/0x30
   __kasan_kmalloc+0x8f/0xa0
   __kmalloc_noprof+0x179/0x3b0
   srp_alloc_iu.constprop.0+0x69/0x5c0
   srp_cm_rep_handler+0xc2e/0x1bb0
   srp_test_login+0xc8/0x630
   srp_oob33_test+0xaa/0x700
   kunit_try_run_case+0x1ca/0x4b0
   kunit_generic_run_threadfn_adapter+0x7b/0xe0
   kthread+0x36e/0x500
   ret_from_fork+0x34d/0x620
   ret_from_fork_asm+0x19/0x30

  The buggy address belongs to the object at ffff88800243f100
   which belongs to the cache kmalloc-64 of size 64
  The buggy address is located 32 bytes inside of
   allocated 33-byte region [ffff88800243f100, ffff88800243f121)

The KUnit harness that forces this is not part of this patch.

Refuse the login instead. Both the largest messages the initiator parses,
SRP_RSP and SRP_AER_REQ, are 36 bytes, and a target that cannot send one
cannot speak the protocol, so nothing that works today is turned away.

Fixes: aef9ec39c47f ("IB: Add SCSI RDMA Protocol (SRP) initiator")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/infiniband/ulp/srp/ib_srp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/infiniband/ulp/srp/ib_srp.c b/drivers/infiniband/ulp/srp/ib_srp.c
index 5811f02df9805..a85d28b95306a 100644
--- a/drivers/infiniband/ulp/srp/ib_srp.c
+++ b/drivers/infiniband/ulp/srp/ib_srp.c
@@ -2379,6 +2379,13 @@ static void srp_cm_rep_handler(struct ib_cm_id *cm_id,
 
 	if (lrsp->opcode == SRP_LOGIN_RSP) {
 		ch->max_ti_iu_len = be32_to_cpu(lrsp->max_ti_iu_len);
+		if (ch->max_ti_iu_len < sizeof(struct srp_rsp)) {
+			shost_printk(KERN_ERR, target->scsi_host, PFX
+				     "Target reported max_ti_iu_len %u, too small for a %zu byte SRP_RSP\n",
+				     ch->max_ti_iu_len, sizeof(struct srp_rsp));
+			ret = -ECONNRESET;
+			goto error;
+		}
 		ch->req_lim       = be32_to_cpu(lrsp->req_lim_delta);
 		ch->use_imm_data  = srp_use_imm_data &&
 			(lrsp->rsp_flags & SRP_LOGIN_RSP_IMMED_SUPP);
