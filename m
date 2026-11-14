Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794673185;
	b=g82QH4NxR4OXTRllRyDiJVrEF7E8LgcOP1AmY+hkOnA65dgP4GGeZL13ZhnWdjQzHTbx
	 omrHqsLT9dlhDdbr9LduEVP0L3IgX8mMJCqRVv/BSO0aOVVOwLYAsVAVKQpjo6Tv1QkBw
	 uE+rzSpVHCrXuGQEInE82gFn1/BiohGX2vZnFuLnnr1wW/5EmPjFe1vD3Lpc6yNokiMR0
	 vepqvdPDqcEj84UN+/a5c/bchhzWTh3fOK9WHrzMeme0yFE30qN81y1CzQMjRvvVv4nuY
	 qjMVYYmjVXUZBe622TjuZjz561Uj7G9f2tFP834PQ7Kub3g7uTZNQUSKuNBPkc+Xc0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XDtYjphGVkc/uulVWko7CeJe+AuX4KnYa+TPlDxQrlo=;
	b=gtevlUGw9fFlkbm65wcYnqdVQHbVe8wcGrtCYRfbgEOksbA7IorTf6vR0epF0iDO6tTi
	 XaHfAovhAHugo0Uu5M7GpJHKhBOosBLug5aNp1ZiISBxMh2a5lOiwZy+byQrVLIJcTQ44
	 mJn4wo8la65PB4FOC5cu6hAfSBgCVLlFvMXGC8qxxxRAjaPFsEM4/FMTaV8qCnjD3aH0d
	 1dN8Z+U4nyd8bu3icJ5Z+jsew2cMAaAFQ806ilxrVhHTPna+uII9G1OzzEnhIHt1UENf5
	 efHpBeTZz9mq5Yt94FBs5BaQ6YssX/8FQSQzwy/7Sxp2T+p3qX5UlRCJ3fR20a1qC1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AUea9Ojr;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4A9606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:19:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE4A9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AUea9Ojr
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so888537b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794673183; x=1795277983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XDtYjphGVkc/uulVWko7CeJe+AuX4KnYa+TPlDxQrlo=;
        b=AUea9OjrvSRKc4FdV0DiS3YzPJggCkPgz1KqGJWjwcBIl6QFsVCNJ8QFOJdXaCUjqU
         2uSLa8KkUuRE9/4o8RqDHHH999DG5LoNaszRyBPHGWLKwyYvkGv8Sz/PfzSItMVUCYwe
         ZuKKtBnzLZV6TJwFHZNr0/eCAamTYBhbm+gpNIsZuafr1GH43BAURcCiH2UIhVwHMsKX
         ilZfHrFvNZZs+//1rqzaSjB2O1KgWXffXUa/gOv8dslD8SokyUl9nYjVWTwJwl5EA/cf
         HW6QuAwoUl1KUGy6fr1i9Zlff09ipnldeqrE985MclKckBdHyBdj6dGxl0mUlb9kDG7i
         kP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794673183; x=1795277983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XDtYjphGVkc/uulVWko7CeJe+AuX4KnYa+TPlDxQrlo=;
        b=R5AMWp2BgZc1d1m0H0lvoB2qpidv/3sUs7Fj3hx22qbeKdLTkUiYrRAOM4wLE4em7y
         J3bJKS1oVoTrUMV/YiKfopktOoPyOw/FVv91zUofQeoEp2FPAG5bizJxlMZkL9E1gNwy
         rNoB5WVqw+JR8zE91/TeNHkK7q/mkSNzjasWULHghQWZcuo7hRNBAa+Vbp6WfgZHdtLE
         DZ5MjuEI83lB622mcLA5EWgPp2Md6TtRDaxDBOdD9qCABI6sDYYwdNs52QEyOmEZH2RS
         LIEed0Yn8mLkr6IiAtPtYp4ydHIo8PcYTWYi+NsiKsq9SJZxZN2GhQ+OXmfdj+W9HRKi
         5q6w==
X-Forwarded-Encrypted: i=1; AL+hErGjSguAHGQ1LChjCY43zhxZJ4pjOurb5jzxXtYUIMP+s8LLiY6V4aw5hBrHDJ4tuNjA5W4ZTFDJ3UX3x2I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/t8TY6g0F2B5334UyRfYKBJMS6Z2ebQPxQPZjftb630700rO+j
	rfDvWmD14dVmWcBMEhhN9DWhxuihF9Yg1s79uKScKo3I7ipG3t1rpHXQDdFk2FIiCVY=
X-Gm-Gg: AYBFou0vnc2z3FQzk5U1wV6XveJJlrCPbc5pZMZZQ8ySmTL9YhG/Qu5sWeBVBoT+e6n
	Ev8hNcD603xNXtU+cs5SLdrPCNMGJVqJLPK2Oaka21u2dmLqPaj5F+ffEXiPx33wz7+h3bTxMtD
	McSWFlp4xlKB5HKes2rBtb21zgNtKkikh8uMVbRnOIXBaV9Sew80W19GcyXtfv/nAujUyUFhrTb
	8/aqxgFvD4Xq0Pwgxuk6pdVP3lC4MZHcX1t3FtHalRgqIkkBNTcWgjmXfXX2ltoXk8Jar59jgRV
	XLFqtC3Rkbw470OUr++LAffBXqQOQBUDxKMbrWXHHy+abXf0/8FgXY5JnNqfXTNwYxGz+vF/ib3
	+Q9ZqOwZmqjodU37XE3anoaBROvLuyEcBgF20+VGp7V/XW3znmeAJW1nry1W64pbym/GcCQfLcw
	z5SlPEn8WE76pRf8ZCSaQNc+C2ybToslg5X0/ZjXNXslGD8UR8A/8WmC1a5GBzJA3VQMrdlWCwT
	AkfW+yujtaNppc0Za3SkPZ+94Ro+TO0abgymlC4pJOW2vh3A9k39srjcpxPlgbVY/18z+WSwrP+
	QFiP8RX1SmV8KUPeCIgPrwGhe2zz6mAlZzexhidwQNPBDhYRbus9TsnD26zLmWX5HN0ZrRgTAuj
	W88uLWgStSuT2BpyJ1e2/Bab2pVrpYf48/fPwLyUcnWwfblJZc+mhFBuyckY=
X-Received: by 2002:a05:6a00:991:b0:89e:70fb:9da with SMTP id d2e1a72fcca58-8bd58c0e209mr5993888b3a.0.1794673183031;
        Sat, 14 Nov 2026 08:19:43 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:bfe1:56d2:91a4:93d9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a818asm2198159b3a.17.2026.11.14.08.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:19:42 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org
Cc: michael.christie@oracle.com,
	target-devel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] scsi: target: iscsi: do not reject the command on a Data-Out overflow
Date: Sun, 15 Nov 2026 01:19:31 +0900
Message-ID: <20261114161931.941441-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
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

__iscsit_check_dataout_hdr() answers a Data-Out whose offset plus length
exceeds the command's EDTL with iscsit_reject_cmd(), which queues the
Reject on the offending command and then drops its reference:

	cmd->i_state = ISTATE_SEND_REJECT;
	iscsit_add_cmd_to_response_queue(cmd, conn, cmd->i_state);
	/*
	 * Perform the kref_put now if se_cmd has already been setup by
	 * scsit_setup_scsi_cmd()
	 */
	if (do_put) {
		pr_debug("iscsi reject: calling target_put_sess_cmd >>>>>>\n");
		target_put_sess_cmd(&cmd->se_cmd);
	}

For a command that has already completed that put is the last reference.  A
WRITE that failed before it consumed its data - because the LUN does not
exist, or the LBA is out of range - stays on conn->conn_cmd_list until the
initiator's ExpStatSN acknowledges it in iscsit_ack_from_expstatsn(), which
Data-Out PDUs never reach.  So iscsit_release_cmd() runs on a command that
is still on that list and still queued for the tx thread, and the command's
tag goes back to se_sess->sess_tag_pool.  The tx thread then builds the
queued Reject from the released command and sets ISTATE_SENT_STATUS in it,
and the next PDU from the initiator frees it a second time.

Two PDUs on a session that may write are enough:

	WRITE(10), EDTL 512, to a LUN that is not mapped  -> CHECK CONDITION
	Data-Out, same ITT, Offset 512, DataSegmentLength 1, no payload

Declaring a DataSegmentLength that is not sent keeps the connection in
sync, so the session stays up and the second free arrives with the next
command; if the connection does drop first, it comes from
iscsit_release_commands_from_conn() instead.  On a KASAN + PROVE_LOCKING +
DEBUG_LIST guest, 5 boots out of 5:

  WARNING: drivers/target/iscsi/iscsi_target_util.c:658 at iscsit_release_cmd+0x2e0/0x390, CPU#0: iscsi_trx/140
  CPU: 0 UID: 0 PID: 140 Comm: iscsi_trx Not tainted 7.4.0-rc2-00563-g97d73c825122 #1 PREEMPT(lazy)
  Call Trace:
   <TASK>
   target_release_cmd_kref+0x3ea/0x9f0
   target_put_sess_cmd+0x48/0x60
   iscsit_add_reject_from_cmd+0x164/0x3c0
   iscsit_check_dataout_hdr+0x1c1/0x360
   iscsit_get_rx_pdu+0x5da/0x35d0
   iscsi_target_rx_thread+0x132/0x2f0
   kthread+0x2ce/0x3b0
   ret_from_fork+0x52e/0x780
   ret_from_fork_asm+0x1a/0x30
   </TASK>
  ---[ end trace 0000000000000000 ]---

  refcount_t: underflow; use-after-free.
  WARNING: lib/refcount.c:37 at refcount_warn_saturate+0xad/0xe0, CPU#0: iscsi_trx/140
  CPU: 0 UID: 0 PID: 140 Comm: iscsi_trx Tainted: G        W           7.4.0-rc2-00563-g97d73c825122 #1 PREEMPT(lazy)
  Call Trace:
   <TASK>
   transport_generic_free_cmd+0x296/0x2d0
   iscsit_free_cmd+0xa0/0x180
   iscsit_ack_from_expstatsn+0x31c/0x6c0
   iscsit_process_scsi_cmd+0xd4/0x300
   iscsit_get_rx_pdu+0x118c/0x35d0
   iscsi_target_rx_thread+0x132/0x2f0
   kthread+0x2ce/0x3b0
   ret_from_fork+0x52e/0x780
   ret_from_fork_asm+0x1a/0x30
   </TASK>
  ---[ end trace 0000000000000000 ]---

KASAN stays quiet because iscsit_release_cmd() ends in target_free_tag()
and commands are reused from the session tag pool instead of being freed to
the slab, so the second free lands on whichever command owns that tag.

Reject the PDU instead, with iscsit_add_reject(), which is what the
DataSegmentLength check in iscsit_check_dataout_hdr() a few lines below
already does for the same kind of protocol error: it builds the Reject from
a command of its own and leaves the offending command, and its reference,
where they are.

The put was added to this path by commit 3e1c81a95f0d77 ("iscsi-target:
Refactor RX PDU logic + export request PDU handling"), where it ran after
wait_for_completion(&cmd->reject_comp), that is after the tx thread had
sent the Reject; commit ba159914086f06 ("iscsi-target: Fix
iscsit_add_reject* usage for iser") removed that wait, so the release can
now also race the Reject that is still queued.

Fixes: 3e1c81a95f0d77 ("iscsi-target: Refactor RX PDU logic + export request PDU handling")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/target/iscsi/iscsi_target.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/target/iscsi/iscsi_target.c b/drivers/target/iscsi/iscsi_target.c
index 124ff269b8e759..b101f1e7376d4e 100644
--- a/drivers/target/iscsi/iscsi_target.c
+++ b/drivers/target/iscsi/iscsi_target.c
@@ -1485,7 +1485,12 @@ __iscsit_check_dataout_hdr(struct iscsit_conn *conn, void *buf,
 		pr_err("DataOut Offset: %u, Length %u greater than iSCSI Command EDTL %u, protocol error.\n",
 		       be32_to_cpu(hdr->offset), payload_length,
 		       cmd->se_cmd.data_length);
-		return iscsit_reject_cmd(cmd, ISCSI_REASON_BOOKMARK_INVALID, buf);
+		/*
+		 * Reject the PDU, not the command: iscsit_reject_cmd() would
+		 * drop its last reference while it is on conn_cmd_list.
+		 */
+		return iscsit_add_reject(conn, ISCSI_REASON_BOOKMARK_INVALID,
+					 buf);
 	}
 
 	if (cmd->unsolicited_data) {
-- 
2.43.0

