Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104139;
	b=TPB1QtfKJlogHB6RDW+s9LEnDkHRn6+nYi450Whj/6oZqx6gBoh2sy1NAIoPbB3rzBBe
	 V51ZXfc1+5x11md0VTSlzsg72I5+D22znEzJMtOstcnmEgP1ZBtHxiEqzXPjarrgld+gs
	 WEv9jprkaB1GRKXK2X84yHHeY960ZA8knRhP/uGZN3gOAFfY0RfHLwyziT9Aj57hA42YA
	 K7+3y4N+J6dK3hzcU6+dLtaFkPDwsx8DP3P1uqAXuBRj0HaTiKVuPoxWrkkEwLNGNYOTt
	 CNOH6QyminLcXXlJOwGtwejSk0LPcT3psurBDevUpBvZz/hFaZv9Q+pKQkpusxfXUdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104139;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=rUOe9Z0rqZ0V8Cji8VBRHAdE8+KzbjNqUt4lT5DUox0=;
	b=cMDFxKjIqLPydBOpIsBtMx/yIWZyKdy0AL7OSbNJSPoZNmnkTLxkToNcktr/UwORQPJk
	 8TkEYkaqJA9Fdv1kFCcxr7gGlbGWzLuvVYWFtGG8p5ojnpEWnvcCbVBkYuuhcJwEg9/3M
	 qJorhCuGvWZlhJPyVtFMvz87mQ2A3u19uvvFYO59M8KeQnIkrT1B91WfNV4FKx1sY3zu0
	 304ahKs8Od/DI8+IPzvxApTakCaJJukjVHsbey4rRAOWg7oT0msOQMFytQeqH9RhSIaQY
	 ESHXAIIdB7GF6pgFttXyY7V/I0zEctWu3RmYVkUhbyCySkKHWwjLqFR+JrHrEAxTQVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jLLt71t2;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9D360A2626
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E9D360A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jLLt71t2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793104137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rUOe9Z0rqZ0V8Cji8VBRHAdE8+KzbjNqUt4lT5DUox0=;
	b=jLLt71t2HRIFkucmi/EWchK8+nrhV9QvTQyN+boRTVPsr2ucektemJC/an6D/WNCnzwV3N
	Gd+zVLUoV+HhgozsmDc9P43eeFNlkf6+/9RTH/fWz6xsjKrEF+o1x5UligFmySlBOsHrDP
	sM3audXnoghCa34oTHzzZZAdOOlY62A=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-411-qkWpCfBgNtee8LPbKUIYyw-1; Tue,
 27 Oct 2026 08:28:52 -0400
X-MC-Unique: qkWpCfBgNtee8LPbKUIYyw-1
X-Mimecast-MFC-AGG-ID: qkWpCfBgNtee8LPbKUIYyw_1793104131
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1CA271802557;
	Tue, 27 Oct 2026 12:28:51 +0000 (UTC)
Received: from loberman-thinkpadp16gen3.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DD94730000E7;
	Tue, 27 Oct 2026 12:28:49 +0000 (UTC)
From: Laurence Oberman <loberman@redhat.com>
To: mkp@kernel.org
Cc: linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	bvanassche@acm.org,
	michael.christie@oracle.com,
	mlombard@redhat.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v6 4/4] scsi: target: iscsi: Complete an aborted WRITE stuck before the first R2T
Date: Tue, 27 Oct 2026 08:28:37 -0400
Message-ID: <20261027122837.2148074-5-loberman@redhat.com>
In-Reply-To: <20261027122837.2148074-1-loberman@redhat.com>
References: <20261027122837.2148074-1-loberman@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

A WRITE that arrives with immediate data, and whose data length exceeds
FirstBurstLength, is left in TRANSPORT_WRITE_PENDING by
iscsit_execute_cmd() until the first R2T is built. If a LUN_RESET or
ABORT_TASK from another session sets CMD_T_ABORTED in that window,
iscsit_execute_cmd() returns without sending the R2T.

Nothing then completes the command. No R2T has been sent, so the initiator
cannot legally send more data; no DataOut timer was armed, so the ERL=0
timeout cannot fire either. The command stays in TRANSPORT_WRITE_PENDING
with CMD_T_ABORTED set, and core_tmr_drain_state_list() blocks in
target_put_cmd_and_wait() on it for as long as the connection stays up:

  INFO: task kworker/5:2 blocked for more than 46 seconds.
   target_put_cmd_and_wait+0x6d/0xb0 [target_core_mod]
   core_tmr_drain_state_list+0x2dc/0x380 [target_core_mod]
   core_tmr_lun_reset+0x93/0x1a0 [target_core_mod]

Commit aaa00cc93c1d ("scsi: target/core: Fix TAS handling for aborted
commands") is what left this site with nothing to complete the command.
Before it, transport_check_aborted_status() sent the delayed TASK_ABORTED
status here; that commit replaced the call with a bare CMD_T_ABORTED test
and a return, on the basis that the target core would send TASK_ABORTED
from the ABORT TMF context instead. It became a hang once ABORT and LUN
RESET handling was made synchronous, because the abort path then waits in
target_put_cmd_and_wait() for a fabric completion that no longer comes.

iscsit_execute_cmd() returns early for an aborted command in two other
places, and neither can hang. Both TMR paths -- core_tmr_abort_task() and
core_tmr_drain_state_list() -- iterate dev->queues[].state_list, and a
command only reaches that list via target_add_to_state_list() in
transport_generic_new_cmd(). For a command with no immediate data,
iscsit_process_scsi_cmd() runs iscsit_sequence_cmd(), and therefore
iscsit_execute_cmd(), before transport_generic_new_cmd(); a command with
cmd->sense_reason set returns before it as well. In both cases no TMR can
find the command, so nothing waits on it. Only the immediate-data path
calls transport_generic_new_cmd() first, which is why this is the one
early return that strands a TMR.

Complete the command here instead. No DataOut path can race with this:
without an R2T the initiator cannot send further data for the command, and
the branch is only reached when no unsolicited DataOut is expected either.
If the connection drops before target_abort_work has run,
iscsit_release_commands_from_conn() will complete the same command again,
which the claim added in the previous patch makes a no-op.

This was reported against an Oracle RAC cluster on two-session iSCSI LIO
targets, where one node's LUN_RESET aborts WRITEs belonging to the other
node's session. It was not reproducible in a lab, so the diagnosis came
from instrumented kernels in the reporter's environment. Across two hosts,
every stalled command had the same signature: DMA_TO_DEVICE,
TRANSPORT_WRITE_PENDING, CMD_T_ABORTED | CMD_T_TAS, outstanding_r2ts == 0,
write_data_done == first_burst_len, and an empty cmd_r2t_list. 217 of 222
LUN_RESET drains completed in under a second; the rest took 46 to 54
seconds, which is where the hung-task panics came from. One 53.7 second
stall recovered on its own and the host ran for a further 19 hours. The
stall only ever ended when the initiator gave up and dropped the
connection, which let iscsit_release_commands_from_conn() complete the
command.

Fixes: 2c9fa49e100f ("scsi: target/core: Make ABORT and LUN RESET handling synchronous")
Cc: stable@vger.kernel.org
Signed-off-by: Laurence Oberman <loberman@redhat.com>
---
 drivers/target/iscsi/iscsi_target_erl1.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/target/iscsi/iscsi_target_erl1.c b/drivers/target/iscsi/iscsi_target_erl1.c
index d8ca06e..95163b1 100644
--- a/drivers/target/iscsi/iscsi_target_erl1.c
+++ b/drivers/target/iscsi/iscsi_target_erl1.c
@@ -12,6 +12,7 @@
 #include <linux/slab.h>
 #include <scsi/iscsi_proto.h>
 #include <target/target_core_base.h>
+#include <target/target_core_backend.h>
 #include <target/target_core_fabric.h>
 #include <target/iscsi/iscsi_transport.h>
 
@@ -927,8 +928,17 @@ int iscsit_execute_cmd(struct iscsit_cmd *cmd, int ooo)
 
 			if (!(cmd->cmd_flags &
 					ICF_NON_IMMEDIATE_UNSOLICITED_DATA)) {
-				if (cmd->se_cmd.transport_state & CMD_T_ABORTED)
+				/*
+				 * No R2T has been sent for this command yet,
+				 * so returning here leaves the initiator with
+				 * nothing to send and no DataOut timer armed.
+				 * Complete it, or nothing ever will.
+				 */
+				if (cmd->se_cmd.transport_state & CMD_T_ABORTED) {
+					target_complete_cmd(&cmd->se_cmd,
+							    SAM_STAT_TASK_ABORTED);
 					return 0;
+				}
 
 				iscsit_set_dataout_sequence_values(cmd);
 				conn->conn_transport->iscsit_get_dataout(conn, cmd, false);
-- 
2.43.0

