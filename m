Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792928532;
	b=zT3VFQZ7nFeqzXl/K01DUxAf+alC1PK+Q8uixUX72ziJlcfLd3uwm9TSQbHWGCCBunob
	 IwG0kCscX5A8u1NIQKHYJAPIztZ37nZssuOmJfDpvRPtv1/xMd7K0lr64IfjI8+8NN0VH
	 B68J6zNkdtxYGhiVbjaLdyYG3E+k0rtpTqCIrGc/PQ7JLr7LAJS35WwOz3bSfipCFnU8B
	 rkvgJchIiYlatJCzjKfQ1YXi/K33AkOtl2IIbJLlg7JgVqKQJGM4k0tgFrUjkNeSlSTS8
	 FlXdELO3wLTCzGjPr6anVRt+G5BWmrgsXqONikm1WAljolmU3i73uXjnzolq5+8JCXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792928532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PhmTqIVrhZ/NvlRobX5Y+GvIs1MtU8Z4kfjwx8mwLL8=;
	b=aPadIDysE21JkSUisPNkheGUIWAnuLyzqbNVHp2PnoqkniItTwHsF4njnDe9pswx4bEs
	 kUwRXLSoZ4FFsjCpFfFihOrkpE5gzOU39IMxxD6mDP7MV8Y9A8dqLcQkLoL070gKWH+ex
	 J9f7v/CbBVelJWWU1i2uns/63bueGRB68MSQfbdUr3LRX6C6ma8X53fYN58Nj1aeLNMoZ
	 KzxmVDLYEvKPa3lvFiugrH/VMDO1ev2zW7RW08Urzg6t32wn0QcrUgyMm2jYCyVgsoeIT
	 8YaKwsHk+DgXe40GSyrtJRYAn1iJOOcM3YDOudc62ZLJa+9jhxtlIUsorlNMJLmXcVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=TpvUiXJN;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D85606A320
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16D85606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=TpvUiXJN
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e60f9af6e6so19282525ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 04:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792928531; x=1793533331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PhmTqIVrhZ/NvlRobX5Y+GvIs1MtU8Z4kfjwx8mwLL8=;
        b=TpvUiXJNriwwOkpJktK38zjrXmnZIWyTAL2b6oxnVhFEW3kV0nnOZ6u6FIB7KkO+bU
         zSdSEADvARbfHupOrx4iQLTtbfGPaCSTVmNN74amYLqPxJJIP/ez2Kcf/3JgrUWpfbow
         YCu9VvW4eSvCBbT1jfF+GbzH54MXoqzqMqcKT2BHhWZBwjYCEFr/JZCuoG0KTNCdfm8n
         X/kVyVFIOOrj4QGKCCUSNY/cfYXKwL/ImQmPy4V1w+eLzwGoLJTWSX8iv6qv6nJ/h9bD
         8gaH9Rez9Avi8gyzdHfrPGNXe4GvX4NhtvKlJkhLVe3UNAUPR/T74cPMStbvGTDQWqQH
         k27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792928531; x=1793533331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PhmTqIVrhZ/NvlRobX5Y+GvIs1MtU8Z4kfjwx8mwLL8=;
        b=Q0UTei8D8BboleYS1mMJA1A/DFFulGLQq8sjx+jwmFTpws+eLhJb4LW7cxKR3HVEsB
         jgOlsLQ5rRYFl6JonM3MiG7jnJMtYSrW2f7u7jvJXSCCRFTA8fIHog29zRez9WRPQQCo
         jp5Je4vc2wanhtJ2BmtPUeH8eiRgEcExm1br6zWA+/M3TZJhIay8FJsA8Vo248V0CgnQ
         ize6nIx1B2kGkg+hIvbcW0BwbsJxQaU0+QMsYzNDsROvsHdHnCt/F+Ua6y0u2Bt8R1AU
         Me5+86l+xTSS3U3QNZs7ucUPSdr1k/UST8ze1WbEcm0UB9TV2ZBV1qTVVzJFa9dodTPw
         kY/g==
X-Forwarded-Encrypted: i=1; AKwUvBzTc2jrQF2i/qtyabFZ1VbYcstrn13PsbSij1GSGQFxa3djXrcemWkCNZP6sqYP8siledTcOy8k9K7wShM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKi5La5nKZqKQdJHUk+hKkLbavdqzyJOZBCLu7NGZNNYmW2JwrS
	ipWZhb1LqRAghCHPnF+eQmQz3G/V+4AbWZM4EmoiJyUsYAyBDcsGvYaTaRy7/qQzACQjUe8cSIC
	N8cpP
X-Gm-Gg: AYBFou0p1Gnc7AiGbg1TjLnC5eO3XfxAN+7pd3j/aCAZBS9Mrjwmo79Uc57OmrdYcao
	VQuTopUzNpRQTD4S9hNWeEvE2w6tVvIwDdalb0ywMEoy7kkVTcwY6bM+2MfuXltbn6q7E6ZywMM
	kgLaDFJuDUSI73ZCDpRCbL/f9+2Yg9dD75Ek8ad+C/oaTbjbj5xGJ/j0375bQLoodjATbXjv7eQ
	v2yQdVztmbJTpPAi2Q19w7B6lkZfmrM9hOfzsPRo8uRillUqizSzwE4dbcPdfDE1Bu7u0Q5Ucbe
	2WHDglRtgHso2309hNpARSZ1Kvz5LsIrtCBM6XSMHSwH0QCGukzAA/r/c9YnvJcOFNf6OvVgKKg
	sNV0FOBpEqEcsda2gL+ghwTpP29bgkTZJIG8f2SUDW34MPOU0SYNTe8giE4BC/O+fPAUKfphqvB
	spuGAjKBCVGKYcR3dXymaP5yQK5NGHE2vzqA31EsN1Q6Ni1+t2E6lexqi0VOoC4COGnKpL3Gk7L
	4wLEhF0LqgJLOXBLhPWRKNF3ShS66aiK53MpH10Ny4jYXdsDvPm3EGapLGL+uM5vUhpntxFI/BW
	Zp2EX5Z04u89zhmFBqNa+tgYflNHiGfjUZ5j8gFuR8NUf3bkT5ZjDFohRYBnSbfs
X-Received: by 2002:a17:90b:4ac7:b0:3a4:77b8:1770 with SMTP id 98e67ed59e1d1-3adeaae6dfdmr3592234a91.15.1792928531192;
        Sun, 25 Oct 2026 04:42:11 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:dba3:be57:a674:a67f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba32e38sm5219705a91.2.2026.10.25.04.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 04:42:10 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH 1/2] RDMA/srp: refuse a target that cannot receive an SRP_RSP
Date: Sun, 25 Oct 2026 20:41:54 +0900
Message-ID: <20261025114155.4007867-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261025114155.4007867-1-yhlee@isslab.korea.ac.kr>
References: <20261025114155.4007867-1-yhlee@isslab.korea.ac.kr>
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
-- 
2.43.0

