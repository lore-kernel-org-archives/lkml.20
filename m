Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794745305;
	b=PYMKnH5vDIwmmeUsro6eMKWA23ydaylprcXrP+ydI/f8sQTPMNmeq6YAun71I0rE96MA
	 9ARAqFV2WaIENLuw8RhjkvQ2zmhqdDIrbX3uAD3tWpP+T9EhnD7lXGA4apWlTTLq75lPw
	 62AV4/L1Y0eXIZF5PisDAwA+Au0f8GAIXqraLc4yzC4/J09MbpFkdrt+TSlAoZTHNk3Yw
	 byhRoPaKzkjmz/Ya/YGVVMEXpLO3iKaqyS++0Xv2i4UAOp7NbfY0OMm/AlClCGEFvI8V+
	 wCGeAnCg+OkcuOuEaPAtTgvOcGVBFtaAv2wWo/7dFXDAeMWvHAfJUvakEF3DYUfnaqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794745305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+OgZfYhmN9odpAT2D18mA84jo9wP8hXZA1kyBonxyTU=;
	b=vIK0CFXCDvoFOgxb4riaLiEbvcttVrP8pWzJeK+D5Xe8pwpMu/kUwqSQYGlhN+3MDmC6
	 o/5jbFVnOV2pU/mbnhXJcNAHvFRTxltPez9OztbscVTQqa4I0B+Q45H+f2jrG1Iz1HpgA
	 JL4kUHlHmFYcxWXu72vHT0b/cEWzEUFR3QrMXcJJB2fxNCdo3iq7ayM4PjdYhdrDKBr2V
	 DsgsedTLkVBVqeG1OaUtX1S2YFXKZ4G3RMqeFSqMec2DG6iJQE3OB58lRt3fCh8e7u/1f
	 F+ObRWRrozRRVViF/sX6v5wxqkBidAvPFMOcr4rNd/sjGomC17NMMK6PCt1ZjbJurHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Hzmla9Yl;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF12606A337
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CF12606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Hzmla9Yl
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a07078200fso1060621b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 04:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794745303; x=1795350103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+OgZfYhmN9odpAT2D18mA84jo9wP8hXZA1kyBonxyTU=;
        b=Hzmla9YlenDS7OK9uAnFTIpt3PB4PDpgLisSFGTVWuwRiHmcQy5ecxkMitLEcMoEM/
         vzTWpWNtH5iOKicohX/m6Bf/HtUf2Q1zqM0hkhjn8Qng85X+kHFvZKHEwSeHFP9RCndH
         aIysiC+clAhVs4HhG/t/zqRljBEmRkuWTdceaRoeFm17iy/vUYNw4Fj+bSkJPJ0EXeXg
         54WURRzWlvOhAP0HazTF0imlt5vProwpbqvP+gAoqGlReJA3NZv3LQxbp5jVMO1COvuq
         wYXni9w2SV0lknRA2WK03hkuEcs41z5RJ5cUsxjWRC+sboeMCNi0XR0b7gBW5Yg5oZdO
         lQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794745303; x=1795350103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+OgZfYhmN9odpAT2D18mA84jo9wP8hXZA1kyBonxyTU=;
        b=AsZgsoDdw90CoQqY4RhKn6klgiZPEklTDoMv9kLYgvx2cuJB7pMXG2lpvQKGNNNc52
         uNDY6zMlc73aRbL3JN35LgHC54YjaoOnTdpBEGcFHucQg11VW3C8Z83rUm9U+TbRdA5o
         GrZALDuN8rMfPRvb73dXKxlO+9yoyA0ISJxCrZloCBbyOxPx2CUkySYqc/bhTPPidOP3
         p5/KOGsQthWdOIA4M71tRVrBxz+nKhZQAKBvH/dxODsKmmOg5tKO8JfQsM43U5OnifOe
         pmHG0vpQg2prDW6dah7eq5zCzwUOH2QJbIj7rW3X7HkSCL3MrNDpwaoP2eDTSw0YYomo
         fIgw==
X-Forwarded-Encrypted: i=1; AL+hErG5H8oW9F7Ff8l0+HTiqoLK1T0Vf/TRde/q/akfX759OBJQyoH4lqE1OV3d0ZSgRqx410whUFE6/IFGMGc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xjpO/yaqjMxYaUl1dqlKryuLCsSVhUlG3191mUxdyw14wLTs7
	du7pFUZv2Yr6CqwEa5jyFvIgWrO8qogaeJPyHrwd9hp9CdIOaNK2ZuuOOPzMXtFxFZU=
X-Gm-Gg: AYBFou32qsPwmAJmdSyIgp0yg8B6HQ+Bp8XOb8o8uoMJyTbbSVCBkAXCovPlx5QsiGX
	3wcnpHp9tPqMSjoN7dBvkx9+CEFjUI57GhUQSPr9aQsPexZ/osLUqM81LPD4+H5Nffn3z1ishxl
	kxjP5/fdpqYtdYB53NdaDtLLLEDcFIVQYrXQD+uX8dPd59+QsiUrh1na+aFdjbV2iUmeS/VUeKy
	7fRvSthpRW0dFs4BuH4FvE9MdcU780xwuHTxE907fPrbP+U74qgOuFV0V0iDjmSZBiXuF0RXfq3
	ileE0QQxzRTIPzvpcQ+dhCRzGK8gaVEv7VJcprwUn/MEyvLyLpAnBIGsmy7sufe0DoJKxDsT6QD
	bz2D5cemf8MeF/PhmeAmm0TxpiGg6wyO8YLcrslMKyXrM+grekVC9xiNV9u3lFhmT2x9ZAjwJBj
	klZU61ZeWuzqlM+QoNDfTdIiLnoAxCiDYJmGH5dAUhpPtzHS6qbtSEHXMoi/SiwYWf764OcQHED
	REuNyF8UcaapXW3TRznocjO3NIFijF+zNh7sIiEUuVGvOzLSdDBH4aF0UJx7XWeqCStAhxzoTfO
	ECRofLiAwC5Usg6Dr0L0YObJw8uJTkX90qcjq4kLasdXqfZAnsaFCrFdS+ZXWWu0ip1tumf2lNr
	jVE5lb3f8BZ1akf7P7AhrIeafC3Bbxr2Sv86N/g==
X-Received: by 2002:a05:6a20:6a08:b0:3eb:3b69:77b1 with SMTP id adf61e73a8af0-3f7a92f7cffmr7541227637.46.1794745303524;
        Sun, 15 Nov 2026 04:21:43 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:35d0:694a:1071:9bae])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm3301925a12.7.2026.11.15.04.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 04:21:42 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: lduncan@suse.com,
	cleech@redhat.com,
	michael.christie@oracle.com,
	mkp@kernel.org,
	James.Bottomley@HansenPartnership.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] scsi: libiscsi: do not complete a task sent with a reserved ITT
Date: Sun, 15 Nov 2026 21:21:21 +0900
Message-ID: <20261115122122.1446791-3-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115122122.1446791-1-yhlee@isslab.korea.ac.kr>
References: <20261115122122.1446791-1-yhlee@isslab.korea.ac.kr>
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

A NOP-Out sent in answer to a target NOP-In carries RESERVED_ITT.
iscsi_send_nopout() puts RESERVED_ITT in the header and
iscsi_alloc_mgmt_task() keeps it there, because the build_itt() assignment
is skipped for a reserved ITT, so nothing that identifies the task ever
reaches the wire.  No response is expected for such a PDU, so the one
reference the task holds belongs to the transport, which drops it once the
PDU has been sent: libiscsi_tcp and iser do that from their transmit
completion, bnx2i and qedi from their local NOP completion.

task->itt is not touched by any of this.  It stays the task-pool index, so
session->cmds[] still names the task, and iscsi_itt_to_task() looks a task
up by that index alone.  A management response or a Reject PDU naming the
index therefore finds a task that is ISCSI_TASK_RUNNING with no scsi_cmnd
attached, passes both tests, and reaches iscsi_complete_task(), which drops
the reference the transport is about to drop as well.  The window opens
when iscsi_prep_mgmt_task() publishes ISCSI_TASK_RUNNING and closes when
the transport has sent the PDU, and a target that stops reading holds it
open for as long as it likes: iscsi_xmit_task() keeps the task in
conn->task with an extra reference while the transmit keeps failing with
-EAGAIN.

A Task Management Function Response naming the pool index was accepted in
all 11 runs of a KASAN kernel whose window was held open for 200 ms, and
every one of them ended in:

  ------------[ cut here ]------------
  refcount_t: underflow; use-after-free.
  WARNING: lib/refcount.c:37 at refcount_warn_saturate+0xad/0xe0, CPU#0: kworker/u8:4/50
  Modules linked in:
  CPU: 0 UID: 0 PID: 50 Comm: kworker/u8:4 Not tainted 7.4.0-rc2-00472-g76215e83dc82-dirty #1 PREEMPT(lazy)
  Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
  Workqueue: iscsi_q_2 iscsi_xmitworker
  RIP: 0010:refcount_warn_saturate+0xad/0xe0
  Code: a9 9b b7 03 67 48 0f b9 3a 5b 5d c3 cc cc cc cc 48 8d 3d a6 9b b7 03 67 48 0f b9 3a 5b 5d e9 1a 11 33 02 48 8d 3d a3 9b b7 03 <67> 48 0f b9 3a 5b 5d e9 07 11 33 02 48 8d 3d a0 9b b7 03 67 48 0f
  RSP: 0018:ffffc90000347b18 EFLAGS: 00010246
  RAX: 0000000000000003 RBX: ffff88800a74a878 RCX: ffffffff823c2735
  RDX: 0000000000000000 RSI: 0000000000000004 RDI: ffffffff85f3c370
  RBP: 0000000000000003 R08: 0000000000000001 R09: ffffed10014e950f
  R10: ffff88800a74a87b R11: ffff88800c8f26e8 R12: 0000000000000000
  R13: 1ffff92000068f6b R14: ffff88800c75c5c8 R15: ffff88800c8f2400
  FS:  0000000000000000(0000) GS:ffff8880e55a8000(0000) knlGS:0000000000000000
  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  CR2: 00007f10f26585f0 CR3: 0000000005672002 CR4: 0000000000770ef0
  PKRU: 55555554
  Call Trace:
   <TASK>
   iscsi_xmit_task+0x1c8/0x770
   ? iscsi_sw_tcp_pdu_init+0x268/0xb00
   ? __pfx_iscsi_xmit_task+0x10/0x10
   ? _raw_spin_lock_bh+0x84/0xe0
   ? iscsi_prep_mgmt_task+0x381/0x600
   iscsi_xmitworker+0x1c8/0x8b0
   process_one_work+0x697/0x1060
   ? __pfx___schedule+0x10/0x10
   ? __pfx_process_one_work+0x10/0x10
   ? _raw_spin_lock_irq+0x81/0xe0
   ? __pfx_iscsi_xmitworker+0x10/0x10
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
  ---[ end trace 0000000000000000 ]---

The slot is back in the task pool by then, so a concurrent allocation can
hand it out while iscsi_xmit_task() is still working on it.

Refuse such a task in both receive-side lookups.  A task whose
task->hdr->itt is RESERVED_ITT is one the target was never told about, so
no response can name it legitimately.  The test is on the task the lookup
returned rather than on the received ITT, and iscsi_alloc_mgmt_task()
copies the caller's header for every transport, so task->hdr->itt is
RESERVED_ITT there and nowhere else.  It is evaluated last, after the state
test, so it only runs on a task that has been prepared.  With it in place
the same injection was refused in all 10 runs, and a target NOP-In, the
NOP-Out answering it and the initiator's own pings are unaffected.

Fixes: 3e5c28ad0391 ("[SCSI] libiscsi: merge iscsi_mgmt_task and iscsi_cmd_task")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/libiscsi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/libiscsi.c b/drivers/scsi/libiscsi.c
index 83d726043d3e8d..220e89d541af68 100644
--- a/drivers/scsi/libiscsi.c
+++ b/drivers/scsi/libiscsi.c
@@ -1177,8 +1177,9 @@ static int iscsi_handle_reject(struct iscsi_session *session,
 				task = iscsi_itt_to_task(session, conn,
 							 rejected_pdu.itt);
 			/* Pairs with the release when the task is prepared. */
+			/* A reserved ITT means the transport owns the task. */
 			if (!task || smp_load_acquire(&task->state) != ISCSI_TASK_RUNNING ||
-			    task->sc) {
+			    task->sc || task->hdr->itt == RESERVED_ITT) {
 				iscsi_conn_printk(KERN_ERR, conn,
 						 "Invalid pdu reject. Could "
 						 "not lookup rejected task.\n");
@@ -1318,8 +1319,9 @@ int __iscsi_complete_pdu(struct iscsi_session *session, struct iscsi_conn *conn,
 	case ISCSI_OP_NOOP_IN:
 		task = iscsi_itt_to_task(session, conn, hdr->itt);
 		/* Pairs with the release when the task is prepared. */
+		/* A reserved ITT means the transport owns the task. */
 		if (!task || smp_load_acquire(&task->state) != ISCSI_TASK_RUNNING ||
-		    task->sc)
+		    task->sc || task->hdr->itt == RESERVED_ITT)
 			return ISCSI_ERR_BAD_ITT;
 		break;
 	default:
-- 
2.43.0

