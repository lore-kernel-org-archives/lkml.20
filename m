Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792859352;
	b=X+bz7nz27vLAFpvfDKftrPMjJBhTiHQPLgIMa4rt4VHbSDov33NT4JlG3EzKwvhOCSog
	 ru/b9Gx3/MAoWgcIpzC4+yAv3nWyD+7Zm00Nn6AqB9sNec/fcfzTOlG02jBMTXh1tExuC
	 Am2AnaVQ0CIn/owA9OEvHsW/L00sS5Ax4e5oEDuOzslCE5S7b5y88lQSqYHji5TJL24oN
	 YpbCdAamoAYSjxYYeX4E0ynJG1siUhM2ZHp15cvVIp86dKOAzCfQELqfUh988OF3dAYOd
	 nJWZHWJc3eLB2fHAYYoX3//sZLmT4lz2Xo/2DylNHoGyK5SUop/kVVTJo0M+BP059Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792859352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wD5HFmyo5C/86og7luOdITnA/REDozwGyCESntnCzBg=;
	b=Pp2cnh3bGvSQ7OyRr/r9K1cEzVa0R26GaEMhiSrKFMACcffLD2orj17cr1h6nPlCwx9Q
	 u6NJGmF/lmaN8ALZu/Xk4kxNm8rEVfK3eejzukYQw4K2ObwgiIctjz9vPw4t+ee3hIQaR
	 8116HAxxhLjoerlPW9w3Llf1jrsJvENdcuBMKQQRRyW3O6phVwAJY0NtVKCOapGgi6cHw
	 c9QH0bI2qfdFvzNkNf0tjubAQ3aw+C+30oVXGWepj0HECQLmFg2AoLHkaUY/RQVGrl8cd
	 0XyD0XLly4To+NgMqgKYKGh4l9rQe0XaX1aK6xC/TT26hDoIsGumpGR2c/kto2401jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=ceH85emB;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779DC606A332
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 16:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 779DC606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=ceH85emB
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso3425964eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792859351; x=1793464151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wD5HFmyo5C/86og7luOdITnA/REDozwGyCESntnCzBg=;
        b=ceH85emBaB8Vvp9FWcfVPOzFqyhZAy8apUxp0dsiUCHGszhG9mvsvXGfrw1oZXG5fL
         2pqCnA+0jbqEoOshBECqoSQ9hY8QqWjlivGdDH8tieZZVG22b6VBUM7xR6ayeg+N4EsD
         BPhmsyX+DgN4zM0Kfd9vaJHDoO9NDt+K8zJ5TS4Hq2sJ/DkowuJMB4bpw+1X91LUX3di
         TczARTEfraLeFluqo5eTXT8dSzNogusSG6TSuDI9njMZecCZ3B35kvfJ0ddZYr2HGz/d
         qIcQF/h0bDnAq2DORZUDzEzpgnLAheNF1j130Ob6d9+ncDH8ZCWTccyVZ7rX5GVrcL1A
         tTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792859351; x=1793464151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wD5HFmyo5C/86og7luOdITnA/REDozwGyCESntnCzBg=;
        b=Z5o12P1ZQqI2cM/lpGa3kxVtpX60y8FU4oouZu/y6UUBl+Twf/lfFJyYarObw8r+1v
         L3aVgR42i1S6wvm35r8qwGuNAU3nWnuUXBwdyUdA6i3GYdzsLcuyIQ7UIU+4DVbSUxpy
         6e1E4iDw8ZX1nOxKvxGhxAtwOJsxxIJcmoynDnKO3VcUR41DtKXFZNg18inQDcN4pLs9
         UU5XzXU+FNU0SEbgrKhzm57DqUI87/UJ1+wErtZbah+HAnmzArwzVusFDTN9/fWcF8A9
         xRGx5P8nxOPQf/wDMuB5usodA4reZuE9VDJeyd85/0omKCIAE61QGWTyED+O53cLZlgb
         eo6w==
X-Forwarded-Encrypted: i=1; AKwUvBxEGNlAwmI6kMB3iSeX5+G7hlqb069YzAhRku0CwAqaH30RS7uVEzH2IDWVVf9nFqIN44/6MchiDWh2gO0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLt8GHQzx2C2Jbol6hyg223MOpr59Za5A2ukPGUuVt2lexu4j1g
	ebfIXrmRN35ckkfLY8pnZuhxWL9V1AJ9HC0/XO+Rke/dLXXWVNWJO50DziP88OZH+v0=
X-Gm-Gg: AYBFou22B5bf7yMzulivead83QWwbiSP6Ka3NzQaonfsYHSMMDcKavMKZCnOw2JINYU
	n3iyjCsYang/Np85vGqMBx+B+2S56QSPMqiijvPOJUhL20e84aIV9M3RKl5u4IExUaNCbJ8kZKx
	fBwIKeKIs2638eU1WVQXaDVOEHNnVUkSMW4LxlvYEPFm7GxriM3fhB6JPO9yu7YvHj+Gp54w8BN
	ceto3fSATIcwR/7MkNUAhtnpQAnHvGgtAnWIuhDb2QW7Jaa7xHGngOGpSPZiRsVNmZT0O1gt/th
	UBPSuc3XVPwIUL130vy7jEQibpHIrYAZnfgsZM6DF22gowaUEScgCuFCupOJmaCqBW12ikYnRcQ
	Nyb+0oNTfJFgixxbCTuVSspTsxVUkOisrh6+IHD+vCy0Nvr2HE6mv6nNYlforopdwBD0E0z+nG+
	V8kyWGzKLxIQ8oFY6O7+x+CGp2qb01NPMUXWsxzExDbt2R2If9BiqKHDjao0O4ZdzKnr1LrplRX
	SJd8wmd36tB0xyfWpo3JjLYVBxjP4iNwpY71A/S6arAzA8CGsfJdZz4uwd6qvnIzXH+WsIg0WP+
	DRgftzI+kXA+hTmLeZUQSXs3iQC11TOF1rZjBbULFFgz3iORtdcrfv7/BvvRlb7d
X-Received: by 2002:a05:701b:2419:b0:163:c5eb:d42f with SMTP id a92af1059eb24-199291058eemr2654183c88.5.1792859350550;
        Sat, 24 Oct 2026 09:29:10 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:dba3:be57:a674:a67f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19a3736d16fsm7192350c88.12.2026.10.24.09.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 09:29:10 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v4 1/2] RDMA/srpt: bound the indirect descriptor table to the IU
Date: Sun, 25 Oct 2026 01:28:51 +0900
Message-ID: <20261024162852.3528224-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261024162852.3528224-1-yhlee@isslab.korea.ac.kr>
References: <20261024162852.3528224-1-yhlee@isslab.korea.ac.kr>
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

srpt_get_desc_tbl() takes the number of INDIRECT descriptors from
idb->table_desc.len, which the initiator controls, and checks it only
against data_out_desc_cnt + data_in_desc_cnt, two more initiator fields.
Both are u8, so the pair admits up to 510 descriptors, and nothing
compares the table against the receive IU it has to live in.
srpt_alloc_rw_ctxs() then walks idb->desc_list for that many entries.

With the default srp_max_req_size of 8276 the table fits as long as the
additional CDB is short, but ADDITIONAL CDB LENGTH is an initiator field
too, and at its maximum of 252 bytes 510 descriptors end at
48 + 252 + 20 + 510 * 16 = 8480, which is past the end of the object:

  BUG: KASAN: slab-out-of-bounds in srpt_alloc_rw_ctxs+0x660/0x860
  Read of size 4 at addr ffff888002d6a05c by task kunit_try_catch/43

  CPU: 0 UID: 0 PID: 43 Comm: kunit_try_catch Tainted: G                 N   7.3.0-11999-g5b0764a53235-dirty #1 PREEMPT(lazy)
  Tainted: [N]=TEST
  Call Trace:
   <TASK>
   dump_stack_lvl+0x3f/0x50
   print_report+0xcd/0x620
   ? alloc_pages_node_noprof+0xa2/0x140
   ? srpt_alloc_rw_ctxs+0x660/0x860
   kasan_report+0xde/0x110
   ? srpt_alloc_rw_ctxs+0x660/0x860
   srpt_alloc_rw_ctxs+0x660/0x860
   ? __dequeue_entity+0xb12/0x1ba0
   srpt_test_run.constprop.0+0x135/0xc50
   ? __pfx_srpt_test_run.constprop.0+0x10/0x10
   ? pick_task_fair+0x126/0x1950
   ? update_curr.constprop.0+0x4a/0x390
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

  Allocated by task 43:
   kasan_save_stack+0x33/0x60
   kasan_save_track+0x14/0x30
   __kasan_slab_alloc+0x6e/0x70
   kmem_cache_alloc_noprof+0xfc/0x2b0
   srpt_test_ctx_init.constprop.0+0x481/0xfa0
   srpt_test_run.constprop.0+0xf1/0xc50
   kunit_try_run_case+0x1ca/0x4b0
   kunit_generic_run_threadfn_adapter+0x7b/0xe0
   kthread+0x36e/0x500
   ret_from_fork+0x34d/0x620
   ret_from_fork_asm+0x19/0x30

  The buggy address belongs to the object at ffff888002d68000
   which belongs to the cache srpt-kunit-iu of size 8276
  The buggy address is located 8 bytes to the right of
   allocated 8276-byte region [ffff888002d68000, ffff888002d6a054)

The KUnit harness that forces this is not part of this patch.

Compare the span the table occupies, which is the table offset plus the
descriptor header plus nbufs descriptors, against byte_len directly. A
short IU that cannot hold even the header is refused, and so is a
table_desc.len below one descriptor, with no division and no dependence on
a sign. nbufs is at most 510 once the existing count check has passed, so
the multiplication cannot overflow.

The header always lies inside the allocated buffer, since the largest
offset srpt_get_desc_buf() can return is 48 + 252 and the header is 20
bytes, so it ends at 320 while srp_max_req_size is at least
MIN_MAX_REQ_SIZE, which is 996. It does not always lie inside the bytes the
initiator actually sent, which is why the span starts at the table offset
and covers the header as well.

Fixes: a42d985bd5b2 ("ib_srpt: Initial SRP Target merge for v3.3-rc1")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/infiniband/ulp/srpt/ib_srpt.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/infiniband/ulp/srpt/ib_srpt.c b/drivers/infiniband/ulp/srpt/ib_srpt.c
index 43c3ff1ad8e7e..21264264356a2 100644
--- a/drivers/infiniband/ulp/srpt/ib_srpt.c
+++ b/drivers/infiniband/ulp/srpt/ib_srpt.c
@@ -1117,6 +1117,7 @@ static int srpt_get_desc_tbl(struct srpt_recv_ioctx *recv_ioctx,
 		struct srp_indirect_buf *idb = srpt_get_desc_buf(srp_cmd);
 		int nbufs = be32_to_cpu(idb->table_desc.len) /
 				sizeof(struct srp_direct_buf);
+		size_t desc_off = (uintptr_t)idb - (uintptr_t)srp_cmd;
 
 		if (nbufs >
 		    (srp_cmd->data_out_desc_cnt + srp_cmd->data_in_desc_cnt)) {
@@ -1128,6 +1129,14 @@ static int srpt_get_desc_tbl(struct srpt_recv_ioctx *recv_ioctx,
 			return -EINVAL;
 		}
 
+		if (desc_off + sizeof(*idb) +
+		    (size_t)nbufs * sizeof(struct srp_direct_buf) >
+		    (size_t)recv_ioctx->byte_len) {
+			pr_err("received SRP_CMD indirect table (%d descriptors) that does not fit the %d-byte IU\n",
+			       nbufs, recv_ioctx->byte_len);
+			return -EINVAL;
+		}
+
 		*data_len = be32_to_cpu(idb->len);
 		return srpt_alloc_rw_ctxs(ioctx, idb->desc_list, nbufs,
 				sg, sg_cnt);
-- 
2.43.0

