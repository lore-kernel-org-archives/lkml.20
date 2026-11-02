Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793600390;
	b=K3dcei0b5xwuDUnO/9uh1xbcReEPvCCSjA+kwl9CqRN6fh0zG1mtXN7Xri7QhcS9DSBi
	 WfzMCQTJWDrQxTEfv4NOfXr+yiBw2L8HCi47MlWhSoDb5ely1H3QfYPUlRiCOsSEPSCWU
	 qO4VYJc8x5IsR6T8sMn2xkm/+qCHkVtTVRCbi8pT6yk87HwM5gJbTo8WnLVvIFNXly3AF
	 mcqKYJjUj6ySij9CGZ37lpbIV2xQRJ/HCL0LzVNn46kb/sI/f/AT12BKnrgXy8dmXWVH0
	 Di9g6CVwYITjd9Pu/V69y1ltVHsPzmGJ+00kpWVxp09odBpRYU8MiL34/LiEdwOoyJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793600390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PzpFeCnMbHb8rzgCZeFAf0WL8fQNACLROrbiUrKLgGM=;
	b=V6qk134O+nRgqGmxnzlnM6ymUY7qH/ogLGjRc+kN58aNjjCue5quS6pXe9FPe2Rv7p8R
	 OnXRBWfXh2ZHyOLEjch9uQssSFwNRdsImAtkT8UMUEv/oE94ps8FoRoCaoNBVxbsF1Me4
	 XJhiqZBGRsSdOQBVztbyv+r8u3uRYD2oTcasXcgWh2DBBYGjmQOTsjCeLpAlMhWBTL4h1
	 u8iINydQ6qY4DR4j2W5KRvIqn96ayUuNMk+Ku4M/O9hoA1pw4xjxyOBsv9mEUM3r+1Zrj
	 O2U9oYSNZyJnlbdtI0aieDvMhQNJ79lToRoAnTp70xLzLU065Nq4Jc21ruPddd7kZyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QBglZJ1X;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4A4606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA4A4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QBglZJ1X
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso1180767a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 22:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1793600389; x=1794205189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PzpFeCnMbHb8rzgCZeFAf0WL8fQNACLROrbiUrKLgGM=;
        b=QBglZJ1XUtmSCR5HiO7ZnCppOp8cBlMjAz4WoI+DQE6ApCdXuJKs6nTNUr/HcVNOFv
         Y1VkmRbdc1+3ctuiTkUiC39im/TunRFhm78vHXVZwEBVOs21uHpucp9Hi7WMsbALP2ZD
         M54nVh8SCyKt4W0N75RfNxgYVZuAusKKtzxt3JjJB1AbZlGPmSWl7QTMjWC0brY8yRiL
         iFYynk9tzEHb9U15KvJQVMQNGfU342JZ9aQSrln+VZpSfRzWCtiUcn5jSYHKeFc0jVJu
         w63yviI+9Nu0c5mU/tOkFd6VOBATPv2w+lpF1O/cKcxnQ5E99RZojwhNjFpSJGWFEm1V
         w4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793600389; x=1794205189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PzpFeCnMbHb8rzgCZeFAf0WL8fQNACLROrbiUrKLgGM=;
        b=jUfCo+LmP6cC4PLCKRI/SenaLGOWML0M3aDODOundMphwd37Bzpgzywpooa/Pp1uTN
         N0drJtd7opPda5xmYOglR6kY12a2EuNnmGsnsYZ/ZaQrehpxIIePryNzOM48dBeP/xbM
         8nJ5ygvODElwZq7LTGchxCeGfTbHWpRfmCIINCbCqmjPC/kTGzlre0Hab/fQshUO3JS7
         HoTJQJIOjPnKlGXFGuBl0DblpRycjhmOlpdhTjaA21GbXTnG96AHVuJyvrpEyypF5NXI
         bcWc7tmT0EezBzxG6S7jkN18Lnh2DP+rN4BJEQedCXVztQ/a7ia5lCiZFIZCkiT1w3HS
         5lMg==
X-Forwarded-Encrypted: i=1; AKwUvByWB96xTZdD9xDlreO+wENTJM+ae3ed3e/L5aLKcBB+qBbCDOSoI2Hegyy6qvViUv5laBHdeD2uXyLBewI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ol2AuLOX/5+Wo/cgniiKMG88T4koly1TpRxB1RQLk6Ziedp1U
	jP4JIBmOQ4IKz0mHe2D47mwl2vvQCQrthMUoMVtl8UWp4w7ugZY88baNJS3W2mhsASA=
X-Gm-Gg: AYBFou3wLZvsqX9oxUBDDKXuA7Ukoy2lY4SEQUZes/+/ZaAkzGl+BntuiJtFU7MOisT
	AeYGy/DNTNX7PIVRoUTLEVG+kNVt/7e6AMrtiiLBA+bwxMieYxf5y5KYmJ0305culI7+mRNjHTE
	Dqad5/wLXfJjhFZKsaM5DmAR4l1DmwBOyqDUkj92iuACSp3PkMTnkwOWAy2Kd+qcxvzp6J2qSlb
	UzfGSwR2FHYHVA4yVZN+rIKsEIxcGP46Chw+sJcQQK/1Mm7EG9m5Q3USxsbJuCBwgncSytY83zs
	5SGmL63u0HcX4QZIwXUo/pT7xlM/XbBeUPG2WwvJbfg7umnOzV5tcyGvFAWtMZerB1+aNWkpbyA
	sItFwtAB1Tr8Z4hTN0zBeObY6JiRx/ZqwZVjcIS8uAn/VKf6m7gvfCPI5fvVI7OkRKs4FI/dx6G
	MGOWo2ubXnxD8LizkfYqFTKTiLGni09vuYmIz6T487OxeAxRvLNZUm+DkEYNljhGaMowm73i06Z
	LQfu3MfrVMVfPtxCCPTbXAKO+wcrfbOX+xk+h6Ba1MWmYn/K1wItOztDmvzS04pqnHpXjonZiyB
	UlRHiMWBSQs9yyfUg4hwhyIB7lJ7Cn8rQ4RqgQwuvue1vR3dUmQuLJ35nQ9fEnjit3EW1/pFoFq
	ZdI8s0qgSvoxb1if6EsfaIPXmi4Qm4Ex+WxJckA==
X-Received: by 2002:a17:90b:440d:b0:3ad:1b31:92d8 with SMTP id 98e67ed59e1d1-3ae89829890mr7435474a91.60.1793600389138;
        Sun, 01 Nov 2026 22:19:49 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:d115:e4f4:23fd:61df])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8441a5ecsm12927752a91.2.2026.11.01.22.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:19:48 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v3 1/2] RDMA/srp: refuse a target that cannot receive an SRP_RSP
Date: Mon,  2 Nov 2026 15:19:37 +0900
Message-ID: <20261102061938.617371-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102061938.617371-1-yhlee@isslab.korea.ac.kr>
References: <20261102061938.617371-1-yhlee@isslab.korea.ac.kr>
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
dereferences ZERO_SIZE_PTR.

Refuse the login instead. Both the largest messages the initiator parses,
SRP_RSP and SRP_AER_REQ, are 36 bytes, and a target that cannot send one
cannot speak the protocol, so nothing that works today is turned away.

Reproduced over rxe with ib_srpt modified to advertise a max_ti_iu_len of
33 and to send its first SRP_RSP as 33 bytes with SRP_RSP_FLAG_SNSVALID
set, which is what makes srp_process_rsp() read resp_data_len at offset
32. A report of zero ends in a general protection fault on the opcode read
instead. With this patch both logins are refused.

  BUG: KASAN: slab-out-of-bounds in srp_recv_done+0x8e5/0x1c80
  Read of size 4 at addr ffff888106046aa0 by task kworker/u8:2/42

  CPU: 1 UID: 0 PID: 42 Comm: kworker/u8:2 Not tainted 7.4.0-rc1-SRPFLRA-00001-gc23c1c890846 #7 PREEMPT(lazy)
  Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
  Workqueue: rxe_wq do_work
  Call Trace:
   <IRQ>
   dump_stack_lvl+0x53/0x70
   print_report+0xd0/0x630
   ? __pfx__raw_spin_lock_irqsave+0x10/0x10
   ? srp_recv_done+0x8e5/0x1c80
   kasan_report+0xce/0x100
   ? srp_recv_done+0x8e5/0x1c80
   srp_recv_done+0x8e5/0x1c80
   ? __pfx_srp_recv_done+0x10/0x10
   ? rxe_poll_cq+0x253/0x3d0
   __ib_process_cq+0xe1/0x390
   ib_poll_handler+0x6e/0x200
   irq_poll_softirq+0x1df/0x480
   ? __pfx_irq_poll_softirq+0x10/0x10
   handle_softirqs+0x1b3/0x600
   ? __pfx_handle_softirqs+0x10/0x10
   do_softirq+0x3d/0x60
   </IRQ>
   <TASK>
   __local_bh_enable_ip+0x6a/0x70
   __alloc_skb+0x734/0x890
   ? _raw_spin_lock_irqsave+0x86/0xe0
   ? __pfx___alloc_skb+0x10/0x10
   ? _raw_read_unlock_irqrestore+0x16/0x50
   rxe_init_packet+0x16b/0x5c0
   prepare_ack_packet+0xc6/0x8a0
   rxe_receiver+0x499/0x9a20
   ? __pfx_rxe_receiver+0x10/0x10
   ? rxe_completer+0x29e5/0x38c0
   ? __pfx__raw_spin_lock_irqsave+0x10/0x10
   ? __pfx_rxe_receiver+0x10/0x10
   do_work+0x144/0x470
   process_one_work+0x697/0x1060
   ? __pfx___schedule+0x10/0x10
   ? __pfx_process_one_work+0x10/0x10
   ? _raw_spin_lock_irq+0x81/0xe0
   ? __pfx_do_work+0x10/0x10
   ? assign_work+0x11d/0x370
   worker_thread+0x45b/0xd10
   ? __pfx_worker_thread+0x10/0x10
   kthread+0x2c8/0x3b0
   ? recalc_sigpending+0x15c/0x1e0
   ? __pfx_kthread+0x10/0x10
   ret_from_fork+0x36e/0x5a0
   ? __pfx_ret_from_fork+0x10/0x10
   ? __switch_to+0x572/0xdc0
   ? __pfx_kthread+0x10/0x10
   ret_from_fork_asm+0x1a/0x30
   </TASK>

  Allocated by task 9:
   kasan_save_stack+0x33/0x60
   kasan_save_track+0x14/0x30
   __kasan_kmalloc+0x8f/0xa0
   __kmalloc_noprof+0x193/0x450
   srp_alloc_iu.constprop.0+0x69/0x5c0
   srp_cm_rep_handler+0xc4a/0x1bd0
   srp_rdma_cm_handler+0x111/0x7f0
   cma_cm_event_handler+0x3e/0x240
   cma_ib_handler+0x190/0x750
   cm_process_work+0x41/0x330
   cm_work_handler+0x1de2/0xc160
   process_one_work+0x697/0x1060
   worker_thread+0x45b/0xd10
   kthread+0x2c8/0x3b0
   ret_from_fork+0x36e/0x5a0
   ret_from_fork_asm+0x1a/0x30

  The buggy address belongs to the object at ffff888106046a80
   which belongs to the cache kmalloc-64 of size 64
  The buggy address is located 32 bytes inside of
   allocated 33-byte region [ffff888106046a80, ffff888106046aa1)

Fixes: aef9ec39c47f ("IB: Add SCSI RDMA Protocol (SRP) initiator")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/infiniband/ulp/srp/ib_srp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/infiniband/ulp/srp/ib_srp.c b/drivers/infiniband/ulp/srp/ib_srp.c
index 5811f02df98053..a85d28b95306a5 100644
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

